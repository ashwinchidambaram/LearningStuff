/*############################################################################*/
/* Challenge # 1: SELECT task

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
