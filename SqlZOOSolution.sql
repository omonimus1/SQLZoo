
-----------------------------------------
SELECT basics
-----------------------------------------
1)show the population of Germany

SELECT population
FROM world
WHERE name = 'Germany';

2)Show the name and the population for 'Sweden', 'Norway' and 'Denmark'.

SELECT name, population
FROM world
WHERE name IN ( 'Sweden', 'Norway' , 'Denmark');

3) shows countries with an area of 250,000-300,000 sq. km. Modify it to show the country and the area for countries with an area between 200,000 and 250,000.

SELECT name, area
FROM world
WHERE area BETWEEN 200000 AND 250000;

------------------------------------
SELECT from WORLD Tutorial
-------------------------------------
1)SQL command to show the name, continent and population of all countries.

SELECT name, continent, population
FROM world;

2)Show the name for the countries that have a population of at least 200 million. 200 million is 200000000, there are eight zeros.

SELECT name
FROM world
WHERE population >=  200000000;

3)Give the name and the per capita GDP for those countries with a population of at least 200 million.

SELECT name , gdp/population
FROM world
WHERE population >= 200000000;

4) Show the name and population in millions for the countries of the continent 'South America'. Divide the population by 1000000 to get population in millions.

SELECT name , population / 1000000
FROM world
WHERE continent = 'South America';

5) Show the name and population for France, Germany, Italy
Unfortunately, in SQLZoo is not possible to solve this exercise using the IN () function

SELECT name, population
FROM world
WHERE name = 'France' OR name = 'Germany' OR name = 'Italy';


6)Show the countries which have a name that includes the word 'United'
SELECT name
FROM world
WHERE name LIKE '%United%';

7)Two ways to be big: A country is big if it has an area of more than 3 million sq km or it has a population of more than 250 million.


8)Exclusive OR (XOR). Show the countries that are big by area or big by population but not both. Show name, population and area.


9)Show the name and population in millions and the GDP in billions for the countries of the continent 'South America'. Use the ROUND function to show the values to two decimal places.
For South America show population in millions and GDP in billions both to 2 decimal places.

SELECT name , ROUND(population/1000000, 2 ) , ROUND(gdp/1000000000,2)
FROM world
WHERE continent = 'South America'; 



10)Show per-capita GDP for the trillion dollar countries to the nearest $1000.

SELECT name ,ROUND(gdp/population, -3) 
FROM world
WHERE gdp > 1000000000000; 

---------------------------------------
SELECT from Nobel Tutorial
---------------------------------------
1)displays Nobel prizes for 1950.

SELECT yr, subject, winner
 FROM nobel
 WHERE yr = 1950;

2)Who won the 1962 prize for Literature.

SELECT winner
  FROM nobel
 WHERE yr = 1962 AND subject = 'Literature';

3)Show the year and subject that won 'Albert Einstein' his prize.

SELECT yr , subject
FROM nobel
WHERE winner = 'Albert Einstein';

4)Give the name of the 'Peace' winners since the year 2000, including 2000.

SELECT winner
FROM nobel
WHERE subject = 'peace' AND yr>=2000;

5)Show all details (yr, subject, winner) of the Literature prize winners for 1980 to 1989 inclusive.

SELECT *
FROM nobel
WHERE subject = 'Literature' AND yr BETWEEN 1980 AND 1989;

6)Show all details of the presidential winners:

Theodore Roosevelt
Woodrow Wilson
Jimmy Carter
Barack Obama


SELECT *
FROM nobel
 WHERE winner IN ('Theodore Roosevelt',
                  'Woodrow Wilson',
                  'Jimmy Carter','Barack Obama');

7)Show the winners with first name John

SELECT winner
FROM nobel
WHERE winner LIKE 'John%';

8)Show the year, subject, and name of Physics winners for 1980 together with the Chemistry winners for 1984.

SELECT *
FROM nobel
WHERE yr = 1980 AND subject = 'Physics' OR yr = 1984 AND subject = 'Chemistry';

9)Show the year, subject, and name of winners for 1980 excluding Chemistry and Medicine

SELECT *
FROM nobel
WHERE yr = 1980 AND subject NOT IN ('Chemistry' , 'Medicine');

10)Show year, subject, and name of people who won a 'Medicine' prize in an early year (before 1910, not including 1910) together with winners of a 'Literature' prize in a later year (after 2004, including 2004)

SELECT *
FROM nobel
WHERE subject = 'Medicine' AND yr < 1910 OR subject = 'Literature' AND yr >= 2004;

11)Find all details of the prize won by PETER GRÜNBERG

SELECT *
FROM nobel
WHERE winner = 'PETER GRÜNBERG';

12)Find all details of the prize won by EUGENE O NEILL

13)List the winners, year and subject where the winner starts with Sir. Show the the most recent first, then by name order.

14)Show the 1984 winners and subject ordered by subject and winner name; but list Chemistry and Physics last.

SELECT winner, subject
  FROM nobel
 WHERE yr=1984
 ORDER BY subject IN ('Physics' , 'Chemistry'), subject , winner;

----------------------------
SELECT IN SELECT
----------------------------

1)List each country name where the population is larger than that of 'Russia'.
SELECT name
FROM world
WHERE population >
     (SELECT population FROM world
      WHERE name='Russia');


2)Show the names of countries in Europe with a per capita GDP greater than 'United Kingdom'.
SELECT name
FROM world
WHERE continent = 'Europe' AND gdp/population > ( SELECT gdp/population from world where name = 'United Kingdom');


3)List the name and continent of countries in the continents containing either Argentina or Australia. Order by name of the country.
SELECT name, continent
FROM world
WHERE continent IN ('Oceania','South America')
ORDER BY name;

4)Which country has a population that is more than Canada but less than Poland? Show the name and the population.
SELECT name , population
FROM world
WHERE
population <  (SELECT population FROM world WHERE name = 'Poland') AND population >  (SELECT population FROM world WHERE name = 'Canada');

5)Germany (population 80 million) has the largest population of the countries in Europe. Austria (population 8.5 million) has 11% of the population of Germany.

Show the name and the population of each country in Europe. Show the population as a percentage of the population of Germany.

SELECT
  name,
  CONCAT(ROUND((population*100)/(SELECT population
                                 FROM world WHERE name='Germany'), 0), '%')
FROM world
WHERE population IN (SELECT population
                     FROM world
                     WHERE continent='Europe');

6)Which countries have a GDP greater than every country in Europe? 
SELECT NAME 
FROM world
WHERE gdp > (SELECT MAX(gdp) FROM world WHERE continent = 'Europe');

7)

8)

9)

10)

----------------------------
SUM and COUNT
--------------------------


1)	Show the total population of the world.

SELECT SUM(population)
FROM world;

2) List all the continents - just once each.

SELECT DISTINCT(continent)
FROM world;

3) Give the total GDP of Africa

SELECT SUM(GDP)
FROM world
WHERE continent = 'Africa';

4) How many countries have an area of at least 1000000

SELECT COUNT(name)
FROM world
WHERE area >= 1000000;

5) What is the total population of ('Estonia', 'Latvia', 'Lithuania')

SELECT SUM(population)
FROM world
WHERE name IN ('Estonia', 'Latvia', 'Lithuania');

6) For each continent show the continent and number of countries.

SELECT continent , COUNT(name)
FROM world
GROUP BY continent;



7) For each continent show the continent and number of countries with populations of at least 10 million.


SELECT continent , COUNT(name)
FROM world
WHERE  population >= 10000000
GROUP BY continent;

8)

JOIN



1) Modify it to show the matchid and player name for all goals scored by Germany. To identify German players, check for: teamid = 'GER'

SELECT matchid , player
FROM goal
 WHERE teamid = 'GER';

/* 2)	Show id, stadium, team1, team2 for just game 1012*/


SELECT id , stadium , team1,team2
FROM game
WHERE id = 1012;

/* 3)*/

/* 4) Show the team1, team2 and player for every goal scored by a player called Mario*/

SELECT team1 , team2, player
FROM game JOIN goal ON game.id = goal.matchid
WHERE player LIKE 'Mario%';

/* 5) Show player, teamid, coach, gtime for all goals scored in the first 10 minutes gtime<=10*/

SELECT player, teamid, coach , gtime
 FROM goal JOIN eteam on teamid = id
 WHERE gtime<=10


/* 6)List the the dates of the matches and the name of the team in which 'Fernando Santos' was the team1 coach.*/

/* 7)List the player for every goal scored in a game where the stadium was 'National Stadium, Warsaw'*/

SELECT player
FROM goal
  JOIN game ON (id=matchid AND stadium = 'National Stadium, Warsaw');

/* 8)show the name of all players who scored a goal against Germany. */

SELECT DISTINCT(player)
FROM game
  JOIN goal ON matchid = id
WHERE ((team1='GER' OR team2='GER') AND teamid != 'GER')

/* 9)Show teamname and the total number of goals scored.

/* 10)Show the stadium and the number of goals scored in each stadium.

/* 11)For every match involving 'POL', show the matchid, date and the number of goals scored.

/* 12)For every match where 'GER' scored, show matchid, match date and the number of goals scored by 'GER'

/* 13)List every match with the goals scored by each team as shown. This will use "CASE WHEN" which has not been explained in any previous exercises. */

--------------------------
More join
--------------------------

1)List the films where the yr is 1962 [Show id, title]
SELECT id, title
 FROM movie
 WHERE yr=1962;

2)Give year of 'Citizen Kane'
SELECT yr
FROM movie
WHERE title = 'Citizen Kane';

3)List all of the Star Trek movies, include the id, title and yr (all of these movies include the words Star Trek in the title). Order results by year.
SELECT id , title , yr
from movie
WHERE title LIKE  '%Star Trek%'
ORDER BY yr; 

4)What id number does the actor 'Glenn Close' have?
SELECT id 
from actor 
WHERE name = 'Glenn Close';

5)What is the id of the film 'Casablanca'
SELECT id
FROM movie
WHERE title =  'Casablanca';

6)

7)

8)List the films in which 'Harrison Ford' has appeared

SELECT title
FROM movie
JOIN casting ON movie.id = casting.movieid
JOIN actor ON casting.actorid = actor.id
WHERE actor.name = 'Harrison Ford';
9)

10)

11)

12)

13)


14)

15)
--------------------------

USING NULL
--------------------------

1)List the teachers who have NULL for their department.

SELECT name
FROM teacher
WHERE dept IS NULL;

2)Note the INNER JOIN misses the teachers with no department and the departments with no teacher.
SELECT teacher.name, dept.name
 FROM teacher JOIN dept
           ON (teacher.dept=dept.id);

3)

4)

5)

6)

7)

8)

9)

10)









SELF JOIN

1)	 How many stops are in the database

SELECT COUNT(DISTINCT stop)
FROM route;

2) Find the id value for the stop 'Craiglockhart'

SELECT id
FROM  stops
WHERE name = 'Craiglockhart';

3)

4)

5)

6)

7)

8)

9)

10)
