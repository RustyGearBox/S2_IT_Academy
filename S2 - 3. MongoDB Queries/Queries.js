// 1. Write a query to show all the documents in the Restaurants collection.
db.restaurants.find()

// 2. Write a query to show the restaurant_id, name, borough, and cuisine for all the documents in the Restaurants collection.
db.restaurants.find({}, {restaurante_id: 1, name: 1,  borough: 1, cousine: 1})

// 3. Write a query to show the restaurant_id, name, borough, and cuisine, but exclude the _id field for all the documents in the Restaurants collection.
db.restaurants.find({}, {_id: 0, restaurante_id: 1, name: 1,  borough: 1, cousine: 1})

// 4. Write a query to show restaurant_id, name, borough, and zip code, but exclude the _id field for all the documents in the Restaurants collection.
db.restaurants.find({}, {_id: 0, restaurant_id: 1, name: 1, borough: 1, 'address.zipcode': 1})

// 5. Write a query to show all the restaurants that are in the Bronx.
db.restaurants.find({borough: 'Bronx'}) 

// 6. Write a query to show the first 5 restaurants that are in the Bronx.
db.restaurants.find({borough: 'Bronx'}).limit(5)

// 7. Write a query to show the next 5 restaurants after skipping the first 5 in the Bronx.
db.restaurants.find({borough: 'Bronx'}).skip(5).limit(5)

// 8. Write a query to find the restaurants that have a score greater than 90.
db.restaurants.find({'grades.score': {$gt: 90}})

// 9. Write a query to find the restaurants that have a score greater than 80 but less than 100.
db.restaurants.find({'grades.score': {$gt:80, $lt:100}})

// 10. Write a query to find the restaurants that are located at a latitude value less than -95.754168.
db.restaurants.find({'address.coord': {$lt: -95.754168}})

// 11. Write a MongoDB query to find the restaurants that do not serve any 'American' cuisine, have a rating greater than 70, and a longitude less than -65.754168.
db.restaurants.find({$and: [{cuisine: {$not: /American/}}, {'grades.score': {$gt: 70}}, {'address.coord': {$lt: -65.754168}}]})

// 12. Write a query to find the restaurants that do not serve any 'American' cuisine, have a score greater than 70, and are located at a longitude less than -65.754168. Note: Perform this query without using the $and operator.
db.restaurants.find({cuisine: {$not: /American/}, 'grades.score': {$gt: 70}, 'address.coord': {$lt: -65.754168}})

// 13. Write a query to find the restaurants that do not serve any 'American' cuisine, have received an 'A' grade, and do not belong to Brooklyn. The document should be displayed sorted by cuisine in descending order.
db.restaurants.find({cuisine: {$not: /American/}, 'grades.grade': 'A', borough: {$not: /Brooklyn/}}).sort({cuisine: -1})

// 14. Write a query to find the restaurant_id, name, borough, and cuisine for those restaurants whose name starts with 'Wil'.
db.restaurants.find({name: /^Wil/}, {restaurant_id: 1, name: 1, borough: 1, cuisine: 1})

// 15. Write a query to find the restaurant_id, name, borough, and cuisine for those restaurants whose name ends with 'ces'.
db.restaurants.find({name: /ces$/}, {restaurant_id: 1, name: 1, borough: 1, cuisine: 1})

// 16. Escriu una consulta per trobar el restaurant_id, name, borough i cuisine per a aquells restaurants que contenen 'Reg' com tres lletres en algun lloc en el seu nom.
db.restaurants.find({name: /Reg/}, {restaurant_id: 1, name: 1, borough: 1, cuisine: 1})

// 17. Write a query to find the restaurants that are in the Bronx and serve either American or Chinese cuisine.
db.restaurants.find({borough: 'Bronx', cuisine: {$in: ['American', 'Chinese']}})

// 18. Write a query to find the restaurant_id, name, borough, and cuisine for those restaurants that belong to Staten Island, Queens, Bronx, or Brooklyn.
db.restaurants.find({borough: {$in: ['Staten Island', 'Queens', 'Bronx', 'Brooklyn']}}, {restaurant_id: 1, name: 1, borough: 1, cuisine: 1})

// 19. Write a query to find the restaurant_id, name, borough, and cuisine for those restaurants that do not belong to Staten Island, Queens, Bronx, or Brooklyn.
db.restaurants.find({borough: {$nin: ['Staten Island', 'Queens', 'Bronx', 'Brooklyn']}}, {restaurant_id: 1, name: 1, borough: 1, cuisine: 1})

// 20. Write a query to find the restaurant_id, name, borough, and cuisine for those restaurants that have a score of no more than 10.
db.restaurants.find({'grades.score': {$lte: 10}}, {restaurant_id: 1, name: 1, borough: 1, cuisine: 1})

// 21. Write a query to find the restaurant_id, name, borough, and cuisine for those restaurants that serve fish except 'American' and 'Chinese', or the restaurant name starts with the letters 'Wil'.
db.restaurants.find({$or: [{cuisine: 'Seafood', cuisine: {$nin: ['American', 'Chinese']}}, {name: {$not: /^Wil/}}]}, {restaurant_id: 1, name: 1, borough: 1, cuisine: 1})

// 22. Write a query to find the restaurant_id, name, and grades for those restaurants that have a grade of 'A' and a score of 11 on the ISODate study data '2014-08-11T00:00:00Z'.
db.restaurants.find({'grades.grade': 'A', 'grades.score': 11, 'grades.date': ISODate('2014-08-11T00:00:00Z')}, {restaurant_id: 1, name: 1, grades: 1})

// 23. Write a query to find the restaurant_id, name, and grades for those restaurants where the second element in the grades array contains a grade of 'A' and a score of 9 on the ISODate '2014-08-11T00:00:00Z'.
db.restaurants.find({'grades.1.grade': 'A', 'grades.1.score': 9, 'grades.1.date': ISODate('2014-08-11T00:00:00Z')}, {restaurant_id: 1, name: 1, grades: 1})

// 24. Write a query to find the restaurant_id, name, address, and geographic location for those restaurants where the second element of the coord array contains a value that is greater than 42 and up to 52.
db.restaurants.find({'address.coord.1': {$gt: 42, $lte: 52}}, {restaurant_id: 1, name: 1, address: 1})

// 25. Write a query to organize the restaurant names in ascending order along with all the columns.
db.restaurants.find({}).sort({name: 1})

// 26. Write a query to organize the restaurant names in descending order along with all the columns.
db.restaurants.find({}).sort({name: -1})

// 27. Write a query to organize the cuisine names in ascending order and by the same borough of cuisine. Descending order.
db.restaurants.find({}).sort({cuisine: 1, borough: -1})

// 28. Write a query to find all the addresses that do not contain the word 'street'.
db.restaurants.find({'address.street': {$exists: false}})

// 29. Write a query that selects all the documents in the restaurant collection where the value of the coord field is a Double.
db.restaurants.find({'address.coord': {$type: 'double'}})

// 30. Write a query that selects the restaurant_id, name, and grade for those restaurants where the remainder after dividing the score by 7 is 0.
db.restaurants.find({'grades.score': {$mod: [7,0]}}, {restaurant_id: 1, name: 1, grades: 1})

// 31. Write a query to find the restaurant name, borough, longitude, latitude, and cuisine for those restaurants that contain 'mon' as three letters anywhere in their name.
db.restaurants.find({name: /mon/}, {name: 1, borough: 1, 'address.coord': 1, cuisine: 1})

// 32. Write a query to find the restaurant name, borough, longitude, latitude, and cuisine for those restaurants whose name starts with 'Mad'.
db.restaurants.find({name: /^Mad/}, {name: 1, borough: 1, 'address.coord': 1, cuisine: 1})
