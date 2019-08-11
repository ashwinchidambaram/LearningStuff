/*########## SQL Bootcamp ####################################################*/
/*############## Section 8: Creating Databases and Tables ####################*/
/*######################### CHALLENGES #######################################*/

/*############################################################################*/
/* Challenge # 1: CREATE TABLE

Create a table to organize our potential leads! We will have the following
information:

A customer's first name, last name,email,sign-up date, and number of minutes
spent on the dvd rental site. You should also have some sort of id tracker for
them. You have free reign on how you want to create this table, the next lecture
will show one possible implementation of this.
*/

CREATE TABLE leads(
	lead_id serial PRIMARY KEY,
	first_name VARCHAR(50) NOT NULL,
	last_name VARCHAR(50) NOT NULL,
	email VARCHAR(355) UNIQUE NOT NULL,
	time_spent integer NOT NULL,
	signup_date TIMESTAMP NOT NULL)


/*############################################################################*/
