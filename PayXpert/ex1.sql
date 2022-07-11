/*  Data of the employees:
    id, full name (first and last name in the same column) and email */
SELECT staff_id, concat(first_name,' ',last_name) as employee,  
email 
FROM public.staff
ORDER BY staff_id ASC 