use sakila;

-- 1.
-- List the number of films per category.
select fc.category_id, c.name, count(fc.film_id) as number_of_films_per_category from sakila.film_category as fc -- c: category
right join sakila.category as c using(category_id) -- or join sakila.category as c on fc.category_id=c.category_id
group by category_id, c.name -- or group by fc.category_id, c.name
order by category_id;

-- 2.
-- Display the first and the last names, as well as the address, of each staff member.
/*select * from sakila.staff;
select * from sakila.address;
select * from sakila.city; */

select s.first_name, s.last_name, a.address, a.address2, a.district, a.postal_code, c.city from sakila.staff as s -- s: staff, a: address, c: city
inner join address a on a.address_id = s.address_id
inner join city c on c.city_id = a.city_id;

-- 3.
-- Display the total amount rung up by each staff member in August 2005.
select * from sakila.payment;
select * from sakila.staff;

select s.staff_id, s.first_name, s.last_name, sum(p.amount) as total_amount from sakila.staff as s -- s: staff, p: payment
inner join payment as p on s.staff_id=p.staff_id
where p.payment_date between '2005-08-01' and '2005-08-31'
group by s.staff_id, s.first_name, s.last_name;

-- 4.
-- List all films and the number of actors who are listed for each film.
select * from sakila.film_actor;
select * from sakila.film;

select f.film_id, f.title, count(fa.actor_id) as number_of_actors_per_film from sakila.film as f -- f: film, fa: film_actor
join film_actor as fa using(film_id)
group by f.film_id, f.title
order by number_of_actors_per_film desc;

-- 5.
-- Using the payment and the customer tables as well as the JOIN command, list the total amount paid by each customer.
-- List the customers alphabetically by their last names.
select * from sakila.payment;
select * from sakila.customer;

select c.customer_id, c.first_name, c.last_name, sum(p.amount) as total_amount_paid_by_each_customer from sakila.customer as c -- c: customer, p: payment
right join sakila.payment as p on c.customer_id=p.customer_id
group by c.customer_id, c.first_name, c.last_name
order by c.last_name asc;
