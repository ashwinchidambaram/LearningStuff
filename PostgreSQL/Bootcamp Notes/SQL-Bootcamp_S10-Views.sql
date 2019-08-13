/*########## SQL Bootcamp ####################################################*/
/*############## Section 10: Views ###########################################*/
/*############################################################################*/

/*############################################################################*/
/* Views

Notes:
  - A 'view' is a database object that is of a stored query
  - A view can be accessible as a virtual table in PSQL
  - A view helps simplify the complexity of a query because you can query a
    view, which is based on a complex query using a simple SELECT statement
  - Like a table, we can grant permission to users through a view that contains
    specific data that the users are authorized to see

Syntax:

    CREATE VIEW view_name AS query

Example: */

-- Assuming we had the following join statement that we would use often
SELECT first_name, last_name, email, address, phone
FROM customer
JOIN address
ON customer.address_id= address.address_id

-- We would want to make it easier by creating a view that would shorten it
CREATE view customer_info AS
SELECT first_name, last_name, email, address, phone
FROM customer
JOIN address
ON customer.address_id= address.address_id

  -- Now this query has been saved as 'customer_info'

-- So if we were to call the view query, we would do so as:
SELECT *
FROM customer_info

  -- And this functions as the same as the original query, and returns the same


/*############################################################################*/
/* ALTER VIEW

Notes:
  - ALTER VIEW simply allows us to rename the view

Syntax:

    ALTER VIEW name_of_view RENAME TO new_view_name


/*############################################################################*/
/* DROP VIEW

Notes:
  - DROP VIEW simply allows us to drop a view

Syntax:

    DROP VIEW name_of_view                                                      ||1||

/*############################################################################*/
/*######################## EXTRA NOTES #######################################*/
/*############################################################################*/
/*
||1|| - To ensure that an error isn't thrown, we can also use [IF EXISTS]

    DROP VIEW IF EXISTS name_of_view
