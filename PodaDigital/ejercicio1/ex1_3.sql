/* 3. Crea una tabla con el nombre de los ganadores del tour de cada edición y su velocidad media ordenado de más rápido a más lento */

SELECT winner_name, edition, round(distance/time_overall,2) as speed
FROM tdf_winners
ORDER BY speed DESC