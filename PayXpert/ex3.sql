/*  3 best consumers who have spent the most in the 4 quarter of 2005:
    names, e-mail and favorite category 
*/
/******************************************/

with gr_data as
(
/* using window function for calculation: 
    - amount for each customer
      - amount for each customer and category of films
  and
    ordering by spended in each category for every customer*/
with data as
(
SELECT payment.customer_id as _id, 
    category.name as category,
    (payment.amount) as suma, 
     concat(customer.first_name, ' ', customer.last_name) as _customer, customer.email,
    sum(payment.amount)  over w as amount_cat,
    sum(payment.amount)  over (PARTITION BY payment.customer_id) as amount_all
   
FROM public.payment
LEFT JOIN customer ON customer.customer_id=payment.customer_id
LEFT JOIN rental ON rental.rental_id=payment.rental_id
LEFT JOIN inventory ON rental.inventory_id=inventory.inventory_id
LEFT JOIN film ON film.film_id=inventory.film_id
LEFT JOIN film_category ON film_category.film_id=film.film_id
LEFT JOIN category ON film_category.category_id=category.category_id
WHERE payment_date BETWEEN '2005-10-01' AND '2006-01-01'
WINDOW w AS (PARTITION BY paymecategorynt.customer_id, category.name )
ORDER BY _id, amount_cat DESC
 )  
/* add row numbers for every customer*/
SELECT *, row_number() over (PARTITION BY _id ORDER BY amount_cat DESC) as rr
FROM data
)
/* select favorite category (the first row) for every customer, 
selected the 3 top customers (LIMIT 3)*/
SELECT _id, _customer, email, , amount_all FROM gr_data
WHERE rr=1
ORDER BY amount_all DESC
LIMIT 3
     


