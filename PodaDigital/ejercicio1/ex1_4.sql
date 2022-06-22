/* 4. ¿Cuál es la edad media de los ganadores de etapa para cada tipo de etapa (“Type”
en el dataset tdf_stages)? */
/*
Add new column[Name + Surname] in stage_data. The changing was done with xxx.ipyb
*/
SELECT Type, round(avg(_data.age),1) as average_age
FROM tdf_stages as _winner
LEFT JOIN stage_data_name as _data
ON _winner.Winner=_data.NameSurname
GROUP BY Type