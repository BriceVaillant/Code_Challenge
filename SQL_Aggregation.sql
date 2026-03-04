Aggregation

SELECT COUNT(name) FROM cd.facilities

SELECT COUNT(*) FROM cd.facilities WHERE guestcost >= 10

SELECT recommendedby, count(recommendedby) as count 
FROM cd.members 
WHERE recommendedby IS NOT NULl 
GROUP BY recommendedby 
ORDER BY recommendedby

SELECT facid, sum(slots) as "Total Slots" 
FROM cd.bookings 
GROUP BY facid 
ORDER BY facid

SELECT facid, sum(slots) as "Total Slots" 
FROM cd.bookings 
WHERE starttime >= '2012-09-01'
AND starttime <= '2012-10-01'
GROUP BY facid 
ORDER BY "Total Slots"

SELECT facid, EXTRACT(MONTH FROM starttime) as month, sum(slots) as "Total Slots" 
FROM cd.bookings
WHERE EXTRACT(YEAR FROM starttime) = 2012
GROUP BY facid, month
ORDER BY facid, month;

SELECT COUNT(DISTINCT memid) FROM cd.bookings 

SELECT facid, sum(slots) as "Total Slots" 
from cd.bookings 
group by facid 
having sum(slots) > 1000 
order by facid

SELECT fac.name, 
	SUM(CASE 
		WHEN bks.memid = 0 THEN bks.slots * fac.guestcost
		ELSE bks.slots * fac.membercost
		end) as revenue
from cd.bookings bks
INNER JOIN cd.facilities fac
on bks.facid = fac.facid
group by fac.name
order by revenue


SELECT fac.name, 
	SUM(CASE 
		WHEN bks.memid = 0 THEN bks.slots * fac.guestcost
		ELSE bks.slots * fac.membercost
		end) as revenue
from cd.bookings bks
INNER JOIN cd.facilities fac
on bks.facid = fac.facid
group by fac.name
having SUM(CASE 
		WHEN bks.memid = 0 THEN bks.slots * fac.guestcost
		ELSE bks.slots * fac.membercost
		end) < 1000
order by revenue

 -- SIMILAR:

select name, revenue from (
	select facs.name, sum(case 
				when memid = 0 then slots * facs.guestcost
				else slots * membercost
			end) as revenue
		from cd.bookings bks
		inner join cd.facilities facs
			on bks.facid = facs.facid
		group by facs.name
	) as agg where revenue < 1000
order by revenue; 

 -- here we made a subquerry in order to be able to filter over it instead of having to type it out twice

--Output the facility id that has the highest number of slots booked: 

 with sum as (select facid, sum(slots) as totalslots
	from cd.bookings
	group by facid
)
select facid, totalslots 
	from sum
	where totalslots = (select max(totalslots) from sum);

-- List the total slots booked per facility per month, part 2
-- here the rollup function is used to get a sum of all slots for all month 
	select facid, extract(month from starttime) as month, sum(slots) as slots
	from cd.bookings
	where
		starttime >= '2012-01-01'
		and starttime < '2013-01-01'
	group by rollup(facid, month)
order by facid, month;    



-- List the total hours booked per named facility
-- here we are using the cast function to convert the slots to a decimal number, 
-- and then dividing by 2 to get the total hours, and then rounding it to 2 decimal places.

SELECT bks.facid, fac.name, 
	round(sum(CAST(slots AS DECIMAL(5,2)) / 2.0), 2) as "Total Hours"
	from cd.bookings bks
	INNER JOIN cd.facilities fac
		on bks.facid = fac.facid
	group by bks.facid, fac.name
ORDER BY bks.facid, fac.name

select facs.facid, facs.name,
	trim(to_char(sum(bks.slots)/2.0, '9999999999999999D99')) as "Total Hours"

	from cd.bookings bks
	inner join cd.facilities facs
		on facs.facid = bks.facid
	group by facs.facid, facs.name
order by facs.facid; 

--List each member's first booking after September 1st 2012
-- by replacing the date by now(), this query can be used to get the next booking a user has in the future

SELECT mems.surname, mems.firstname, mems.memid, MIN(bks.starttime) as starttime
	FROM cd.bookings bks
	INNER JOIN cd.members mems
		ON bks.memid = mems.memid
	WHERE bks.starttime >= '2012-09-01'
	GROUP BY mems.surname, mems.firstname, mems.memid
	ORDER BY mems.memid


-- Produce a list of member names, with each row containing the total member count
-- count() over () "Count everything in the result set, but don't group the rows."
select count(*) over(), firstname, surname
	from cd.members
order by joindate  

--same things as:
select (select count(*) from cd.members) as count, firstname, surname
	from cd.members
order by joindate

-- Produce a numbered list of members

select row_number() over(order by joindate), firstname, surname
	from cd.members
order by joindate 


-- Output the facility id that has the highest number of slots booked, again
-- the second select is used to get the maximum number of slots,
--  and then the first select is used to get the facility id (or multiple) that has rank 1 
select facid, total from (
	select facid, sum(slots) total, rank() over (order by sum(slots) desc) rank
        	from cd.bookings
		group by facid
	) as ranked
	where rank = 1  


--Rank members by (rounded) hours used
-- here the rank function is used to give a rank to each member based on the total hours they have booked,
-- and then the outer query is used to order the members by their rank, surname and firstname

SELECT 	
	mems.firstname,
	mems.surname,
	round(sum(CAST(slots AS DECIMAL(5,2)) / 2.0), -1) as hours,
	RANK() OVER (order by round(sum(CAST(slots AS DECIMAL(5,2)) / 2.0), -1) desc)
FROM cd.bookings bks
INNER JOIN cd.members mems
	on bks.memid = mems.memid
GROUP BY bks.memid, mems.firstname, mems.surname
ORDER BY rank, mems.surname, mems.firstname

select firstname, surname, hours, rank() over (order by hours desc) from
	(select firstname, surname,
		((sum(bks.slots)+10)/20)*10 as hours

		from cd.bookings bks
		inner join cd.members mems
			on bks.memid = mems.memid
		group by mems.memid
	) as subq
order by rank, surname, firstname;


-- Find the top three revenue generating facilities
-- here the rank function is used to give a rank to each facility based on the revenue it generates, 
-- and then the outer query is used to filter out only the top three facilities based on their rank

select name, rank from (
	select facs.name as name, rank() over (order by sum(case
				when memid = 0 then slots * facs.guestcost
				else slots * membercost
			end) desc) as rank
		from cd.bookings bks
		inner join cd.facilities facs
			on bks.facid = facs.facid
		group by facs.name
	) as subq
	where rank <= 3
order by rank;    

-- Classify facilities by value
-- here the ntile function is used to split the facilities into three groups based on their revenue, 
-- and then the case statement is used to give them a label based on which group they are in

select name, case when class=1 then 'high'
		when class=2 then 'average'
		else 'low'
		end revenue
	from (
		select facs.name as name, ntile(3) over (order by sum(case
				when memid = 0 then slots * facs.guestcost
				else slots * membercost
			end) desc) as class
		from cd.bookings bks
		inner join cd.facilities facs
			on bks.facid = facs.facid
		group by facs.name
	) as subq
order by class, name; 


-- Calculate the payback time for each facility
-- here we are calculating the payback time for each facility by dividing the initial outlay by the monthly revenue minus the monthly maintenance cost,
-- and then ordering the facilities by their payback time

select name, (agg.initialoutlay / ((revenue / 3) - agg.monthlymaintenance)) as months from (
	select facs.name, facs.initialoutlay, facs.monthlymaintenance, sum(case 
				when memid = 0 then slots * facs.guestcost
				else slots * membercost
			end) as revenue
		from cd.bookings bks
		inner join cd.facilities facs
			on bks.facid = facs.facid
		group by facs.name, facs.initialoutlay, facs.monthlymaintenance
	) as agg
order by name; 