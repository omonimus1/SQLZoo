1) Use find() to show the details of Germany.

```
Use find() to show the details of Germany.
```


2) You can use .pretty() to make the output more readable.
```
d.world.find({continent : 'Eurasia'}).pretty();
```

3)Find the country with an area of exactly 43094.
```
db.world.find({area : 43094}).pretty()
```

4) Show each country with a population of over 250000000 and sort the result alphabetically
```
db.world.find(
  {population: {$gt:250000000 }},
  {name: 1, _id: 0}
).sort(
  {name: 1}
).pretty();
```

5)List the countries that come after "S" in the alphabet.


6)Find the name and capital cities for countries with a population of over 70 million.


7)Find the countries that have a population that is over 200 million or less than 20,000.
