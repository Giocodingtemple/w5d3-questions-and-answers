-- Week 5 - Wednesday
-- Questions

-- 1. List all customers who live in Texas (use JOINs)
SELECT address.address_id, district, first_name, last_name
FROM address
JOIN customer ON address.address_id = customer.address_id
WHERE district = 'Texas'
GROUP BY district, address.address_id, first_name, last_name
--here is the work as a oneliner
SELECT address.address_id, district, first_name, last_name FROM address JOIN customer ON address.address_id = customer.address_id WHERE district = 'Texas' GROUP BY district, address.address_id, first_name, last_name
-- Answer is 5 Jennifer, Kim, Richard, Bryan, Ian

-- 2. Get all payments above $6.99 with the Customers Full Name
SELECT payment.customer_id, first_name, last_name, amount
FROM payment
JOIN customer ON payment.customer_id = customer.customer_id 
WHERE amount > 6.99
GROUP BY payment.customer_id, first_name, last_name, amount 
--here is the work as a oneliner
SELECT payment.customer_id, first_name, last_name, amount FROM payment JOIN customer ON payment.customer_id = customer.customer_id WHERE amount > 6.99 GROUP BY payment.customer_id, first_name, last_name, amount
-- Answer is there are 998 above $6.99

-- 3. Show all customers names who have made payments over $175(use subqueries)
SELECT customer_id, first_name, last_name, sub.totes FROM
(SELECT payment.customer_id, first_name, last_name, sum(amount) as totes
FROM payment
JOIN customer ON payment.customer_id = customer.customer_id
group by payment.customer_id, first_name,last_name) sub
WHERE totes > 175
group by customer_id, sub.totes, first_name, last_name
--here is the work as a oneliner
SELECT customer_id, first_name, last_name, sub.totes FROM (SELECT payment.customer_id, first_name, last_name, sum(amount) as totes FROM payment JOIN customer ON payment.customer_id = customer.customer_id group by payment.customer_id, first_name,last_name) sub WHERE totes > 175 group by customer_id, sub.totes, first_name, last_name 
-- Answer is 7 being Rhonda, Eleanor, Tommy, Peter, Clara, Karl, and Marion all have made payments above $175

-- 4. List all customers that live in Nepal (use the city table)
SELECT address.address_id, first_name, last_name, address.city_id, country_id
FROM address
INNER JOIN customer ON address.address_id = customer.address_id
INNER JOIN city ON address.city_id = city.city_id
WHERE country_id = 66
GROUP BY address.address_id, first_name, last_name, address.city_id, country_id
--here is the work as a oneliner
SELECT address.address_id, first_name, last_name, address.city_id, country_id FROM address INNER JOIN customer ON address.address_id = customer.address_id INNER JOIN city ON address.city_id = city.city_id WHERE country_id = 66 GROUP BY address.address_id, first_name, last_name, address.city_id, country_id
-- Answer is Kevin Schuler

-- 5. Which staff member had the most transactions?
SELECT first_name, last_name, staff.staff_id, COUNT(staff.staff_id) 
FROM payment
JOIN staff ON payment.staff_id = staff.staff_id
GROUP BY staff.staff_id
order by COUNT desc
limit 1;
--here is the work as a oneliner
SELECT first_name, last_name, staff.staff_id, COUNT(staff.staff_id) FROM payment JOIN staff ON payment.staff_id = staff.staff_id GROUP BY staff.staff_id order by COUNT desc limit 1;
-- Answer is Jon Stepens

-- 6. How many movies of each rating are there?
SELECT rating, COUNT(film_id)
FROM film
GROUP BY rating
ORDER BY COUNT DESC
--here is the work as a oneliner
SELECT rating, COUNT(film_id) FROM film GROUP BY rating ORDER BY COUNT DESC
-- Answer is : PG-13 = 223, NC-17 = 210, R = 195, PG = 195, G = 178

-- 7.Show all customers who have made a single payment above $6.99 (Use Subqueries)
SELECT distinct customer_id, first_name, last_name 
FROM
(SELECT payment.customer_id, first_name, last_name, amount
FROM payment
JOIN customer on payment.customer_id = customer.customer_id
WHERE amount > 6.99) sub
GROUP BY customer_id, first_name, last_name 
HAVING COUNT(*) = 1
--here is the work as a oneliner
SELECT distinct customer_id, first_name, last_name FROM (SELECT payment.customer_id, first_name, last_name, amount FROM payment JOIN customer on payment.customer_id = customer.customer_id WHERE amount > 6.99) sub GROUP BY customer_id, first_name, last_name HAVING COUNT(*) = 1
-- Answer there are 130 of them

-- 8. How many free rentals did our stores give away?
SELECT COUNT(*)
FROM payment
WHERE amount = 0
--here is the work as a oneliner
SELECT COUNT(*) FROM payment WHERE amount = 0
-- Answer is 24