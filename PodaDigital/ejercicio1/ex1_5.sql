/*5. ¿Cuántos corredores han participado en la primera y la última etapa de cada
edición?. Ordena por edición.*/

with tot as (
SELECT edition,stage_results_id, count(*) as corredores, 
row_number() over w as r, count(*) over (PARTITION BY edition) as total_stage
FROM stage_data
GROUP BY edition, stage_results_id

WINDOW w as (PARTITION BY edition ORDER BY ROWID)
ORDER BY ROWID
)
SELECT edition,stage_results_id, corredores
FROM tot
WHERE r=1 or r=total_stage
ORDER BY edition


