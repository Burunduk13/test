/* List of movies which are available in the both stores at the same time.*/
/*********************************************************************/

with data as
(
/* Grouping data by film and store*/
SELECT film_id,store_id FROM inventory
GROUP BY film_id, store_id
ORDER BY film_id
)
/* calculate the number of stores and choose the film with more then 1 store */
SELECT t.film_id, film.title FROM (
  SELECT film_id, 
    count(*) over (PARTITION BY film_id) as shop
  FROM data
) as t
/*join title */
LEFT JOIN film ON film.film_id=t.film_id
WHERE shop > 1
GROUP BY t.film_id, film.title
ORDER BY t.film_id