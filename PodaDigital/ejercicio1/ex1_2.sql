/* 2. ¿Cuál es la media de edad, de peso y de Body mass index (se calcula de esta forma
weight/height^2) de los ganadores del tour de los últimos 20 años.*/
/* Average age, weight, height, body index 
*/
SELECT round(AVG(age),1) as age, round(AVG(weight),1) as weight, round(AVG(height),2) as height,
round(AVG(weight)/(AVG(height)*AVG(height))) as body_index
FROM tdf_winners 
WHERE start_date>='01.01.2002'
