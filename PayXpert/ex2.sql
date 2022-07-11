/*  Data of the inventory:.
    id and name of the movie, 
    number of movies in each of the stores, 
    id and the address of the store,
    email of the manager.*/

SELECT concat(inventory.film_id,' ', film.title) as film, 
    count(*) as amount,
    concat(inventory.store_id,' ', address.address,', ', city.city) as shop,
    concat(store.manager_staff_id,' ', staff.first_name, ' ', staff.last_name) as manager
   
FROM inventory
/* */
LEFT JOIN film on film.film_id=inventory.film_id
LEFT JOIN store on store.store_id=inventory.store_id
LEFT JOIN address on address.address_id=store.address_id
LEFT JOIN city on address.city_id=city.city_id
LEFT JOIN staff on staff.staff_id=store.manager_staff_id
GROUP BY film,shop, manager
ORDER BY film