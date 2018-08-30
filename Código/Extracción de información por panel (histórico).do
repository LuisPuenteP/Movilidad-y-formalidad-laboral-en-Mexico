

clear
clear matrix
set mem 500m
set more off
cap log close



forvalues base1=1/41 {

local base2 = `base1' + 1
local base3 = `base1' + 2
local base4 = `base1' + 3
local base5 = `base1' + 4





use "D:\Mis Documentos\Stata\ENOE\Proyectos\Páneles\Concentrado por panel\Panel `base1'_`base5'.dta", clear

di in red "Se está utilizando la base: `base1' - `base5'"

***********************************
****** Matrices de transición******
***********************************

di in red "Matrices de transición-Mujeres"
tabout status_1 status_5 if d_edad_15_65==1 & d_hombre_5==0 & n_ent_1=="1" using Matrices_de_transición_Mujeres.xls, append

di in red "Matrices de transición-Hombres"
tabout status_1 status_5 if d_edad_15_65==1 & d_hombre_5==1 & n_ent_1=="1" using Matrices_de_transición_Hombres.xls, append


***********************************
********Salarios y horas***********
***********************************
*Esta seccion se hace para eliminar los datos atípicos en ingresos.
xtile cien_1_m = ingocup_1_def if d_hombre_5==0 & ing_pos_1!=. & ing_pos_5!=. & d_edad_15_65==1 & n_ent_1=="1", nq(100) 
xtile cien_5_m = ingocup_5_def if d_hombre_5==0 & ing_pos_1!=. & ing_pos_5!=. & d_edad_15_65==1 & n_ent_1=="1", nq(100) 
 
xtile cien_1_h = ingocup_1_def if d_hombre_5==1 & ing_pos_1!=. & ing_pos_5!=. & d_edad_15_65==1 & n_ent_1=="1", nq(100) 
xtile cien_5_h = ingocup_5_def if d_hombre_5==1 & ing_pos_1!=. & ing_pos_5!=. & d_edad_15_65==1 & n_ent_1=="1", nq(100) 


*di in red "Estadísticas de salarios-Mujeres"
estpost tabstat ingocup_1_def ingocup_5_def hrsocup_1 hrsocup_5 ing_x_hrs_1_def ing_x_hrs_5_def if d_hombre_5==0 & ing_pos_1!=. & ing_pos_5!=. & d_edad_15_65==1 & n_ent_1=="1" & cien_1_m<100 & cien_5_m<100, by(estado_1_5) statistics(mean sd n) columns(statistics) listwise
esttab using Estadísticas_salarios_mujeres.csv, cells("mean sd count") append csv

*di in red "Estadísticas de salarios-Hombres"
estpost tabstat ingocup_1_def ingocup_5_def hrsocup_1 hrsocup_5 ing_x_hrs_1_def ing_x_hrs_5_def if d_hombre_5==1 & ing_pos_1!=. & ing_pos_5!=. & d_edad_15_65==1 & n_ent_1=="1" & cien_1_h<100 & cien_5_h<100, by(estado_1_5) statistics(mean sd n) columns(statistics) listwise
esttab using Estadísticas_salarios_hombres.csv, cells("mean sd count") append csv


***********************************
**********Rama de empleo***********
***********************************

*Matrices de transición (ocupados en ambos periodos)

*Informal-Formal
*Mujeres
tabout rama_1 rama_5 if estado_1_5==3 & d_edad_15_65==1 & d_hombre_5==0 & rama_1!=7 & rama_5!=7 & rama_1!=6 & rama_5!=6 & n_ent_1=="1" using Rama_mujeres_Inf_For.xls, append
*Hombres
tabout rama_1 rama_5 if estado_1_5==3 & d_edad_15_65==1 & d_hombre_5==1 & rama_1!=7 & rama_5!=7 & rama_1!=6 & rama_5!=6 & n_ent_1=="1" using Rama_hombres_Inf_For.xls, append
*Mujeres y hombres
tabout rama_1 rama_5 if estado_1_5==3 & d_edad_15_65==1 & rama_1!=7 & rama_5!=7 & rama_1!=6 & rama_5!=6 & n_ent_1=="1" using Rama_Inf_For.xls, append

*Formal-Informal
*Mujeres
tabout rama_1 rama_5 if estado_1_5==2 & d_edad_15_65==1 & d_hombre_5==0 & rama_1!=7 & rama_5!=7 & rama_1!=6 & rama_5!=6 & n_ent_1=="1" using Rama_mujeres_For_Inf.xls, append
*Hombres
tabout rama_1 rama_5 if estado_1_5==2 & d_edad_15_65==1 & d_hombre_5==1 & rama_1!=7 & rama_5!=7 & rama_1!=6 & rama_5!=6 & n_ent_1=="1" using Rama_hombres_For_Inf.xls, append
*Mujeres y hombres
tabout rama_1 rama_5 if estado_1_5==2 & d_edad_15_65==1 & rama_1!=7 & rama_5!=7 & rama_1!=6 & rama_5!=6 & n_ent_1=="1" using Rama_For_Inf.xls, append

****************************************
*Matrices de transición (de desocupado/PNEA a formal)

*Desocupado-formal
*Mujeres
tabout rama_5 if estado_1_5==5 & d_edad_15_65==1 & d_hombre_5==0 & rama_5!=7 & rama_5!=6 & n_ent_1=="1"  using Rama_mujeres_Des-For.xls, append
*Hombres
tabout rama_5 if estado_1_5==5 & d_edad_15_65==1 & d_hombre_5==1 & rama_5!=7 & rama_5!=6 & n_ent_1=="1" using Rama_hombres_Des-For.xls, append
*Mujeres y hombres
tabout rama_5 if estado_1_5==5 & d_edad_15_65==1 & rama_5!=7 & rama_5!=6 & n_ent_1=="1" using Rama_Des-For.xls, append

*PNEA-formal
*Mujeres
tabout rama_5 if estado_1_5==6 & d_edad_15_65==1 & d_hombre_5==0 & rama_5!=7 & rama_5!=6 & n_ent_1=="1" using Rama_mujeres_PNEA-For.xls, append
*Hombres
tabout rama_5 if estado_1_5==6 & d_edad_15_65==1 & d_hombre_5==1 & rama_5!=7 & rama_5!=6 & n_ent_1=="1" using Rama_hombres_PNEA-For.xls, append
*Mujeres y hombres
tabout rama_5 if estado_1_5==6 & d_edad_15_65==1 & rama_5!=7 & rama_5!=6 & n_ent_1=="1" using Rama_PNEA-For.xls, append

***********************************
*************Educación*************
***********************************

*Promedio de educación por estado

*estpost tabstat edu_5 if d_hombre_5==0 & d_edad_15==1 & n_ent_1=="1", by(estado_1_5) statistics(mean n) columns(statistics) listwise
*esttab using Educación_mujeres.csv, cells("mean count") append csv

*estpost tabstat edu_5 if d_hombre_5==1 & d_edad_15==1 & n_ent_1=="1", by(estado_1_5) statistics(mean n) columns(statistics) listwise
*esttab using Educación_hombres.csv, cells("mean count") append csv



}
