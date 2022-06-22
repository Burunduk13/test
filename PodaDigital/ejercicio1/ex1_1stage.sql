/*1. ¿Cuántas etapas (“stages”) ha ganado Peter Sagan entre el 2012 y el 2018?
*/

/* Amount of stages that Peter Sagan wined between 2012 and 2018.
*/

SELECT count(*) FROM tdf_stages
WHERE Winner='Peter Sagan' and Date>='01.01.2012' and Date<='31.12.2018'


