/*########## SQL Bootcamp ####################################################*/
/*############## Assessment Test # 2  ########################################*/
/*############################################################################*/

/*############################################################################*/
/* Challenge # 1:

How can you retrieve all the information from the cd.facilities table?
*/

SELECT *
FROM cd.facilities

/* RESULT: CORRECT */


/*############################################################################*/
/* Challenge # 2:

You want to print out a list of all of the facilities and their cost to members.
How would you retrieve a list of only facility names and costs?
*/

SELECT name, membercost
FROM cd.facilities

/* RESULT: CORRECT */


/*############################################################################*/
/* Challenge # 3:

How can you produce a list of facilities that charge a fee to members?
*/

SELECT name
FROM cd.facilities
WHERE membercost != 0

/* RESULT: CORRECT, however, below is given answer

select *
from cd.facilities
where membercost > 0

*/


/*############################################################################*/
/* Challenge # 4:

How can you produce a list of facilities that charge a fee to members, and that
fee is less than 1/50th of the monthly maintenance cost? Return the facid,
facility name, member cost, and monthly maintenance of the facilities in
question.
*/

SELECT facid, name, membercost, monthlymaintenance
FROM cd.facilities
WHERE membercost < (monthlymaintenance/50) AND membercost != 0

/* RESULT: CORRECT, however, below is given answer

select facid, name, membercost, monthlymaintenance
from cd.facilities
where membercost > 0 and (membercost < monthlymaintenance/50.0)

*/


/*############################################################################*/
/* Challenge # 5:

How can you produce a list of all facilities with the word 'Tennis' in their
name?
*/

SELECT *
FROM cd.facilities
WHERE name LIKE '%Tennis%'

/* RESULT: CORRECT */


/*############################################################################*/
/* Challenge # 6:

How can you retrieve the details of facilities with ID 1 and 5? Try to do it
without using the OR operator.
*/

SELECT *
FROM cd.facilities
WHERE facid IN (1,5)

/* RESULT: CORRECT */


/*############################################################################*/
/* Challenge # 7:

How can you produce a list of members who joined after the start of September
2012? Return the memid, surname, firstname, and joindate of the members in
question.
*/

SELECT memid, surname, firstname, joindate
FROM cd.members
WHERE extract(year from joindate) >= 2012 AND extract(month from joindate) >= 9

/* RESULT: CORRECT, however, below is given answer

select memid, surname, firstname, joindate
from cd.members
where joindate >= '2012-09-01'

*/


/*############################################################################*/
/* Challenge # 8:

How can you produce an ordered list of the first 10 surnames in the members
table? The list must not contain duplicates.
*/

SELECT DISTINCT(surname), *
FROM cd.members
ORDER BY surname
LIMIT 10

/* RESULT: CORRECT, except they didn't include '*' all */


/*############################################################################*/
/* Challenge # 9:

You'd like to get the signup date of your last member. How can you retrieve this
information?
*/

SELECT *
FROM cd.members
ORDER BY joindate DESC
LIMIT 1

/* RESULT: CORRECT, however, below is given answer

select max(joindate) as latest
from cd.members

*/


/*############################################################################*/
/* Challenge # 10:

Produce a count of the number of facilities that have a cost to guests of 10 or
more.
*/

SELECT COUNT(*)
FROM cd.facilities
WHERE guestcost >=10

/* RESULT: CORRECT */


/*############################################################################*/
/* Challenge # 11:

NULL

/*############################################################################*/
/* Challenge # 12:

Produce a list of the total number of slots booked per facility in the month of
September 2012. Produce an output table consisting of facility id and slots,
sorted by the number of slots.
*/

SELECT facid, SUM(slots) AS bookedslots
FROM cd.bookings
WHERE extract(year from starttime) = 2012 AND extract(month from starttime) = 9
GROUP BY facid
ORDER BY bookedslots

/* RESULT: CORRECT, however, below is given answer

select facid, sum(slots) as "Total Slots"
from cd.bookings
where starttime >= '2012-09-01' and starttime < '2012-10-01'
group by facid
order by sum(slots)

*/


/*############################################################################*/
/* Challenge # 13:

Produce a list of facilities with more than 1000 slots booked. Produce an output
table consisting of facility id and total slots, sorted by facility id.
*/



/* RESULT: */


/*############################################################################*/
/* Challenge # 14:

How can you produce a list of the start times for bookings for tennis courts,
for the date '2012-09-21'? Return a list of start time and facility name
pairings, ordered by the time.
*/



/* RESULT: */


/*############################################################################*/
/* Challenge # 15:

How can you produce a list of the start times for bookings by members named
'David Farrell'?
*/



/* RESULT: */
