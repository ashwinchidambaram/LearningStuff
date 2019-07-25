/*########## SQL Bootcamp ####################################################*/
/*############## Section 2: SQL Statement Fundamentals #######################*/
/*######################### CHALLENGES #######################################*/

/*############################################################################*/
/* Challenge # 1: SELECT

Use a SELECT statement to grab the first and last names of every customer and
their email addresses
*/

SELECT first_name, last_name, email
FROM customer


/*############################################################################*/
/* Challenge # 2: SELECT DISTINCT

We want to know the types of ratings movies can get in the United States
(e.g. PG, PG-13, R, etc.) and which ones we have in our database
*/

SELECT DISTINCT rating
FROM film


/*############################################################################*/
/* Challenge # 3: SELECT WHERE (1)

A customer forogt their wallet at our store! We need to track down their email
to inform them. What's the email for the customer with the name Nancy Thomas?
*/

SELECT email
FROM customer
WHERE first_name = 'Nancy'AND last_name = 'Thomas'


/* Challenge # 3: SELECT WHERE (2)

A customer wants to know what the movie "Outlaw Hanky" is about. Could you give
them the description for the movie "Outlaw Hanky"?
*/

SELECT description
FROM film
WHERE title = 'Outlaw Hanky'


/* Challenge # 3: SELECT WHERE (3)

A customer is late on their movie return. I know their address is "259 Ipoh
Drive". I want to call them to let them know! Can you get me the phone number
for the person who lives at "259 Ipoh Drive"?
*/

SELECT phone
FROM address
WHERE address = '259 Ipoh Drive'


/*############################################################################*/
/* Challenge # 4: ORDER BY (1)

Get the customer ID numbers for the top 10 highest payment amounts
*/

SELECT customer_id
FROM payment
ORDER BY amount DESC


/* Challenge # 4: ORDER BY (2)

Get the titles of the movies with film IDs 1-5
*/

SELECT title
FROM film
WHERE film_id <= 5


/*############################################################################*/
/*###################### General Challenge # 1 ###############################*/
/*############################################################################*/

/* Challenge (1):

How many payment transactions were greater than $5.00?
*/

SELECT COUNT(payment_id)
FROM payment
WHERE amount > 5

/* Challenge (2):

How many actors have a first name that starts with the letter P?
*/

SELECT COUNT(first_name)
FROM actor
WHERE first_name LIKE 'P%'

/* Challenge (3):

How many unique districts are our customers from?
*/

SELECT COUNT(DISTINCT(district))
FROM address

/* Challenge (4):

Retrieve the list of names for those distinct districts from the previous
question.
*/

SELECT DISTINCT(district)
FROM address

/* Challenge (5):

How many films have a rating of R and a replacement cost between $5 and $15?
*/

SELECT COUNT(film_id)
FROM film
WHERE rating = 'R' AND replacement_cost BETWEEN 5 AND 15

/* Challenge (6):

How many films have the word Truman somewhere in the title?
*/

SELECT COUNT(film_id)
FROM film
WHERE title LIKE '%Truman%'
