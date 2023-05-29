-- queries for the restaurant project

--business
SELECT *
FROM business b
JOIN category c
	ON b.business_id = c.business_id
WHERE STATE IN (
		'FL'
		,'CA'
		,'AZ'
		,'NV'
		)
	AND c.category = 'Restaurants'
--category
SELECT c.business_id
	,category
FROM category c
JOIN business b
	ON c.business_id = b.business_id
WHERE STATE IN (
		'FL'
		,'CA'
		,'AZ'
		,'NV'
		)
--checkin
SELECT cc.business_id
	,DATE
FROM checkin cc
JOIN business b
	ON cc.business_id = b.business_id
JOIN category c
	ON c.business_id = b.business_id
WHERE STATE IN (
		'FL'
		,'CA'
		,'AZ'
		,'NV'
		)
	AND c.category = 'Restaurants'
--hours
SELECT h.business_id
	,hour_from
	,hour_till
	,totalhours
	,day
FROM hours h
JOIN business b
	ON h.business_id = b.business_id
JOIN category c
	ON c.business_id = b.business_id
WHERE STATE IN (
		'FL'
		,'CA'
		,'AZ'
		,'NV'
		)
	AND c.category = 'Restaurants'
--tip
SELECT t.user_id
	,t.business_id
	,TEXT
	,DATE
	,compliment_count
FROM tip t
JOIN business b
	ON t.business_id = b.business_id
JOIN category c
	ON c.business_id = b.business_id
WHERE STATE IN (
		'FL'
		,'CA'
		,'AZ'
		,'NV'
		)
	AND c.category = 'Restaurants'
--users
SELECT u.user_id
	,u.name
	,u.review_count
	,useful
	,funny
	,cool
	,fans
	,average_stars
FROM users u
JOIN tip t
	ON u.user_id = t.user_id
JOIN business b
	ON t.business_id = b.business_id
JOIN business d
	ON d.business_id = t.business_id
JOIN category c
	ON c.business_id = b.business_id
WHERE b.STATE IN (
		'FL'
		,'CA'
		,'AZ'
		,'NV'
		)
	AND c.category = 'Restaurants'
