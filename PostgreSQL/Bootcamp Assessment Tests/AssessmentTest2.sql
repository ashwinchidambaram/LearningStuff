/*########## SQL Bootcamp ####################################################*/
/*############## Assessment Test # 2  ########################################*/
/*############################################################################*/

/*############################################################################*/
/* Challenge # 1:

How can you retrieve all the information from the cd.facilities table?
*/

SELECT *
FROM cd.facilities

/* RESULT: CORRECT

select *
from cd.facilities;

*/


/*############################################################################*/
/* Challenge # 2:

You want to print out a list of all of the facilities and their cost to members.
How would you retrieve a list of only facility names and costs?
*/

SELECT name, membercost
FROM cd.facilities

/* RESULT: CORRECT

select name, membercost
from cd.facilities;

*/


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

/* RESULT: CORRECT

select *
from cd.facilities
where name
like '%Tennis%';

*/


/*############################################################################*/
/* Challenge # 6:

How can you retrieve the details of facilities with ID 1 and 5? Try to do it
without using the OR operator.
*/

SELECT *
FROM cd.facilities
WHERE facid IN (1,5)

/* RESULT: CORRECT

select *
from cd.facilities
where facid in (1,5);

*/


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

/* RESULT: CORRECT

select distinct surname
from cd.members
order by surname
limit 10;

*/


/*############################################################################*/
/* Challenge # 9:

You'd like to get the signup date of your last member. How can you retrieve this
information?
*/

SELECT *
FROM cd.members
ORDER BY joindate DESC
LIMIT 1

/* RESULT: CORRECT

select max(joindate) as latest
from cd.members;

*/


/*############################################################################*/
/* Challenge # 10:

Produce a count of the number of facilities that have a cost to guests of 10 or
more.
*/

SELECT COUNT(*)
FROM cd.facilities
WHERE guestcost >=10

/* RESULT: CORRECT

select count(*)
from cd.facilities
where guestcost >= 10;

*/


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

/* RESULT: CORRECT

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

SELECT facid, SUM(slots) AS "Booked Slots"
FROM cd.bookings
GROUP BY facid
HAVING SUM(slots) > 1000
ORDER BY facid


/* RESULT: CORRECT

select facid, sum(slots) as "Total Slots"
from cd.bookings
group by facid
having sum(slots) > 1000
order by facid;

*/


/*############################################################################*/
/* Challenge # 14:

How can you produce a list of the start times for bookings for tennis courts,
for the date '2012-09-21'? Return a list of start time and facility name
pairings, ordered by the time.
*/

SELECT bookings.starttime, name
FROM cd.facilities
JOIN cd.bookings ON facilities.facid = bookings.facid
WHERE bookings.facid IN (0,1) AND (starttime >= '2012-09-21' AND starttime < '2012-09-22')
ORDER BY starttime

/* RESULT: CORRECT

select bks.starttime as start, facs.name as name
from cd.facilities facs
inner join cd.bookings bks on facs.facid = bks.facid
where facs.facid in (0,1) and bks.starttime >= '2012-09-21' and bks.starttime < '2012-09-22'
order by bks.starttime;

*/


/*############################################################################*/
/* Challenge # 15:

How can you produce a list of the start times for bookings by members named
'David Farrell'?
*/

SELECT starttime
FROM cd.bookings
JOIN cd.members ON bookings.memid = members.memid
WHERE firstname = 'David' AND surname = 'Farrell'

/* RESULT: CORRECT

 select bks.starttime
 from cd.bookings bks
 inner join cd.members mems on mems.memid = bks.memid
 where mems.firstname='David' and mems.surname='Farrell';

*/
