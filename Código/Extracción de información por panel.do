



*****************************************************
********************Transiciones*********************
*****************************************************

********Mujeres********
*Primera y segunda entrevista
tab status_1 status_2 if n_ent_1=="1" & d_hombre_1==0 & d_edad_15_65==1
*Primera y tercera entrevista
tab status_1 status_3 if n_ent_1=="1" & d_hombre_1==0 & d_edad_15_65==1
*Primera y cuarta entrevista
tab status_1 status_4 if n_ent_1=="1" & d_hombre_1==0 & d_edad_15_65==1
*Primera y quinta entrevista
tab status_1 status_5 if n_ent_1=="1" & d_hombre_1==0 & d_edad_15_65==1

********Hombres********
*Primera y segunda entrevista
tab status_1 status_2 if n_ent_1=="1" & d_hombre_1==1 & d_edad_15_65==1
*Primera y tercera entrevista
tab status_1 status_3 if n_ent_1=="1" & d_hombre_1==1 & d_edad_15_65==1
*Primera y cuarta entrevista
tab status_1 status_4 if n_ent_1=="1" & d_hombre_1==1 & d_edad_15_65==1
*Primera y quinta entrevista
tab status_1 status_5 if n_ent_1=="1" & d_hombre_1==1 & d_edad_15_65==1


*****************************************************
*************Transiciones por edad*******************
*****************************************************

*SB4 (36 años y menores)

********Mujeres********
*Primera y segunda entrevista
tab status_1 status_2 if n_ent_1=="1" & d_hombre_1==0 & d_edad_15_65==1 & eda_1<=36
*Primera y tercera entrevista
tab status_1 status_3 if n_ent_1=="1" & d_hombre_1==0 & d_edad_15_65==1 & eda_1<=36
*Primera y cuarta entrevista
tab status_1 status_4 if n_ent_1=="1" & d_hombre_1==0 & d_edad_15_65==1 & eda_1<=36
*Primera y quinta entrevista
tab status_1 status_5 if n_ent_1=="1" & d_hombre_1==0 & d_edad_15_65==1 & eda_1<=36

********Hombres********
*Primera y segunda entrevista
tab status_1 status_2 if n_ent_1=="1" & d_hombre_1==1 & d_edad_15_65==1 & eda_1<=36
*Primera y tercera entrevista
tab status_1 status_3 if n_ent_1=="1" & d_hombre_1==1 & d_edad_15_65==1 & eda_1<=36
*Primera y cuarta entrevista
tab status_1 status_4 if n_ent_1=="1" & d_hombre_1==1 & d_edad_15_65==1 & eda_1<=36
*Primera y quinta entrevista
tab status_1 status_5 if n_ent_1=="1" & d_hombre_1==1 & d_edad_15_65==1 & eda_1<=36

*SB3 (37 a 45 años)

********Mujeres********
*Primera y segunda entrevista
tab status_1 status_2 if n_ent_1=="1" & d_hombre_1==0 & d_edad_15_65==1 & eda_1>=37 & eda_1<=45
*Primera y tercera entrevista
tab status_1 status_3 if n_ent_1=="1" & d_hombre_1==0 & d_edad_15_65==1 & eda_1>=37 & eda_1<=45
*Primera y cuarta entrevista
tab status_1 status_4 if n_ent_1=="1" & d_hombre_1==0 & d_edad_15_65==1 & eda_1>=37 & eda_1<=45
*Primera y quinta entrevista
tab status_1 status_5 if n_ent_1=="1" & d_hombre_1==0 & d_edad_15_65==1 & eda_1>=37 & eda_1<=45

********Hombres********
*Primera y segunda entrevista
tab status_1 status_2 if n_ent_1=="1" & d_hombre_1==1 & d_edad_15_65==1 & eda_1>=37 & eda_1<=45
*Primera y tercera entrevista
tab status_1 status_3 if n_ent_1=="1" & d_hombre_1==1 & d_edad_15_65==1 & eda_1>=37 & eda_1<=45
*Primera y cuarta entrevista
tab status_1 status_4 if n_ent_1=="1" & d_hombre_1==1 & d_edad_15_65==1 & eda_1>=37 & eda_1<=45
*Primera y quinta entrevista
tab status_1 status_5 if n_ent_1=="1" & d_hombre_1==1 & d_edad_15_65==1 & eda_1>=37 & eda_1<=45

*SB2 (46 a 59 años)

********Mujeres********
*Primera y segunda entrevista
tab status_1 status_2 if n_ent_1=="1" & d_hombre_1==0 & d_edad_15_65==1 & eda_1>=46 & eda_1<=59
*Primera y tercera entrevista
tab status_1 status_3 if n_ent_1=="1" & d_hombre_1==0 & d_edad_15_65==1 & eda_1>=46 & eda_1<=59
*Primera y cuarta entrevista
tab status_1 status_4 if n_ent_1=="1" & d_hombre_1==0 & d_edad_15_65==1 & eda_1>=46 & eda_1<=59
*Primera y quinta entrevista
tab status_1 status_5 if n_ent_1=="1" & d_hombre_1==0 & d_edad_15_65==1 & eda_1>=46 & eda_1<=59

********Hombres********
*Primera y segunda entrevista
tab status_1 status_2 if n_ent_1=="1" & d_hombre_1==1 & d_edad_15_65==1 & eda_1>=46 & eda_1<=59
*Primera y tercera entrevista
tab status_1 status_3 if n_ent_1=="1" & d_hombre_1==1 & d_edad_15_65==1 & eda_1>=46 & eda_1<=59
*Primera y cuarta entrevista
tab status_1 status_4 if n_ent_1=="1" & d_hombre_1==1 & d_edad_15_65==1 & eda_1>=46 & eda_1<=59
*Primera y quinta entrevista
tab status_1 status_5 if n_ent_1=="1" & d_hombre_1==1 & d_edad_15_65==1 & eda_1>=46 & eda_1<=59

*SB1 (60 años y mayores)

********Mujeres********
*Primera y segunda entrevista
tab status_1 status_2 if n_ent_1=="1" & d_hombre_1==0 & d_edad_15_65==1 & eda_1>=60
*Primera y tercera entrevista
tab status_1 status_3 if n_ent_1=="1" & d_hombre_1==0 & d_edad_15_65==1 & eda_1>=60
*Primera y cuarta entrevista
tab status_1 status_4 if n_ent_1=="1" & d_hombre_1==0 & d_edad_15_65==1 & eda_1>=60
*Primera y quinta entrevista
tab status_1 status_5 if n_ent_1=="1" & d_hombre_1==0 & d_edad_15_65==1 & eda_1>=60

********Hombres********
*Primera y segunda entrevista
tab status_1 status_2 if n_ent_1=="1" & d_hombre_1==1 & d_edad_15_65==1 & eda_1>=60
*Primera y tercera entrevista
tab status_1 status_3 if n_ent_1=="1" & d_hombre_1==1 & d_edad_15_65==1 & eda_1>=60
*Primera y cuarta entrevista
tab status_1 status_4 if n_ent_1=="1" & d_hombre_1==1 & d_edad_15_65==1 & eda_1>=60
*Primera y quinta entrevista
tab status_1 status_5 if n_ent_1=="1" & d_hombre_1==1 & d_edad_15_65==1 & eda_1>=60


*****************************************************
***********Transiciones por salarios*****************
*****************************************************

******Salarios bajos (hasta 3 salarios mínimos)

********Mujeres********
*Primera y segunda entrevista
tab status_1 status_2 if n_ent_1=="1" & d_hombre_1==0 & d_edad_15_65==1 & (status_1==1 | status_1==2) & sal_min_1<=3
*Primera y tercera entrevista
tab status_1 status_3 if n_ent_1=="1" & d_hombre_1==0 & d_edad_15_65==1 & (status_1==1 | status_1==2) & sal_min_1<=3
*Primera y cuarta entrevista
tab status_1 status_4 if n_ent_1=="1" & d_hombre_1==0 & d_edad_15_65==1 & (status_1==1 | status_1==2) & sal_min_1<=3
*Primera y quinta entrevista
tab status_1 status_5 if n_ent_1=="1" & d_hombre_1==0 & d_edad_15_65==1 & (status_1==1 | status_1==2) & sal_min_1<=3

********Hombres********
*Primera y segunda entrevista
tab status_1 status_2 if n_ent_1=="1" & d_hombre_1==1 & d_edad_15_65==1 & (status_1==1 | status_1==2) & sal_min_1<=3
*Primera y tercera entrevista
tab status_1 status_3 if n_ent_1=="1" & d_hombre_1==1 & d_edad_15_65==1 & (status_1==1 | status_1==2) & sal_min_1<=3
*Primera y cuarta entrevista
tab status_1 status_4 if n_ent_1=="1" & d_hombre_1==1 & d_edad_15_65==1 & (status_1==1 | status_1==2) & sal_min_1<=3
*Primera y quinta entrevista
tab status_1 status_5 if n_ent_1=="1" & d_hombre_1==1 & d_edad_15_65==1 & (status_1==1 | status_1==2) & sal_min_1<=3

******Salarios altos (3 o más salarios mínimos)

********Mujeres********
*Primera y segunda entrevista
tab status_1 status_2 if n_ent_1=="1" & d_hombre_1==0 & d_edad_15_65==1 & (status_1==1 | status_1==2) & sal_min_1>3
*Primera y tercera entrevista
tab status_1 status_3 if n_ent_1=="1" & d_hombre_1==0 & d_edad_15_65==1 & (status_1==1 | status_1==2) & sal_min_1>3
*Primera y cuarta entrevista
tab status_1 status_4 if n_ent_1=="1" & d_hombre_1==0 & d_edad_15_65==1 & (status_1==1 | status_1==2) & sal_min_1>3
*Primera y quinta entrevista
tab status_1 status_5 if n_ent_1=="1" & d_hombre_1==0 & d_edad_15_65==1 & (status_1==1 | status_1==2) & sal_min_1>3

********Hombres********
*Primera y segunda entrevista
tab status_1 status_2 if n_ent_1=="1" & d_hombre_1==1 & d_edad_15_65==1 & (status_1==1 | status_1==2) & sal_min_1>3
*Primera y tercera entrevista
tab status_1 status_3 if n_ent_1=="1" & d_hombre_1==1 & d_edad_15_65==1 & (status_1==1 | status_1==2) & sal_min_1>3
*Primera y cuarta entrevista
tab status_1 status_4 if n_ent_1=="1" & d_hombre_1==1 & d_edad_15_65==1 & (status_1==1 | status_1==2) & sal_min_1>3
*Primera y quinta entrevista
tab status_1 status_5 if n_ent_1=="1" & d_hombre_1==1 & d_edad_15_65==1 & (status_1==1 | status_1==2) & sal_min_1>3



*****************************************************
***********Transiciones por salarios*****************
*****************************************************

*Aquí se identifica a las personas que permanecieron en el mismo status en las 5 entrevistas
gen permanencia=0
replace permanencia=1 if status_1==status_2 & status_1==status_3 & status_1==status_4 & status_1==status_5

*Aquí se identifica a las personas que se movilizaron de status al menos una vez en las 5 entrevistas
gen movilidad=0
replace movilidad=1 if status_1!=status_2 | status_1!=status_3 | status_1!=status_4 | status_1!=status_5

*Aquí se identifica a las personas que fueron formales al menos en una de las 5 entrevistas
gen formal=0
replace formal=1 if status_1==1 | status_2==1 | status_3==1 |status_4==1 | status_5==1

*Aquí se cuenta el número de trimestes laborados en la formalidad
gen cuenta_for=0
replace cuenta_for=cuenta_for +1 if status_1==1
replace cuenta_for=cuenta_for +1 if status_2==1
replace cuenta_for=cuenta_for +1 if status_3==1
replace cuenta_for=cuenta_for +1 if status_4==1
replace cuenta_for=cuenta_for +1 if status_5==1

gen dc_for=0
replace dc_for= (cuenta_for/5)*100

*Aquí se tabula el número de trimestres en la formalidad de las personas que han sido formales al menos en una de las 5 entrevistas

*Mujeres
tab cuenta_for if n_ent_1=="1" & formal==1 & d_edad_15_65==1 & d_hombre_1==0

*Hombres
tab cuenta_for if n_ent_1=="1" & formal==1 & d_edad_15_65==1 & d_hombre_1==1

*Aquí se cuenta el número de entradas a la formalidad
gen entra_for=0
replace entra_for=entra_for + 1 if status_1==1
replace entra_for=entra_for + 1 if status_2==1 & status_1!=1
replace entra_for=entra_for + 1 if status_3==1 & status_2!=1
replace entra_for=entra_for + 1 if status_4==1 & status_3!=1
replace entra_for=entra_for + 1 if status_5==1 & status_4!=1

*Aquí se tabula la densidad de cotización vs. el número de entradas de las personas que han sido formales al menos en una de las 5 entrevistas

tab dc_for entra_for if n_ent_1=="1" & formal==1 & d_edad_15_65==1

*Mujeres
tab dc_for entra_for if n_ent_1=="1" & formal==1 & d_edad_15_65==1 & d_hombre_1==0

*Hombres
tab dc_for entra_for if n_ent_1=="1" & formal==1 & d_edad_15_65==1 & d_hombre_1==1



***********************************************************************
***********Salarios y horas (Primera y quinta entrevista)**************
***********************************************************************
*Mujeres
*Esta seccion se hace para eliminar los datos atípicos en ingresos.
xtile cien_1_m = ingocup_1_def if d_hombre_5==0 & ing_pos_1!=. & ing_pos_5!=. & d_edad_15_65==1, nq(100) 
xtile cien_5_m = ingocup_5_def if d_hombre_5==0 & ing_pos_1!=. & ing_pos_5!=. & d_edad_15_65==1, nq(100) 
 
*Hombres
xtile cien_1_h = ingocup_1_def if d_hombre_5==1 & ing_pos_1!=. & ing_pos_5!=. & d_edad_15_65==1, nq(100) 
xtile cien_5_h = ingocup_5_def if d_hombre_5==1 & ing_pos_1!=. & ing_pos_5!=. & d_edad_15_65==1, nq(100) 


*di in red "Estadísticas de salarios-Mujeres"
tabstat ingocup_1_def ingocup_5_def hrsocup_1 hrsocup_5 ing_x_hrs_1_def ing_x_hrs_5_def if d_hombre_5==0 & ing_pos_1!=. & ing_pos_5!=. & d_edad_15_65==1 & cien_1_m<100 & cien_5_m<100, by(estado_1_5) statistics(mean sd n) columns(statistics)

*di in red "Estadísticas de salarios-Hombres"
tabstat ingocup_1_def ingocup_5_def hrsocup_1 hrsocup_5 ing_x_hrs_1_def ing_x_hrs_5_def if d_hombre_5==1 & ing_pos_1!=. & ing_pos_5!=. & d_edad_15_65==1 & cien_1_h<100 & cien_5_h<100, by(estado_1_5) statistics(mean sd n) columns(statistics)



***********************************************************************
*******Sector de actividad económica(Primera y quinta entrevista)******
***********************************************************************

*Matrices de transición (ocupados en ambos periodos)

*Informal-Formal
*Mujeres
*tab rama_1 rama_5 if estado_1_5==3 & d_edad_15_65==1 & d_hombre_5==0 & rama_1!=7 & rama_5!=7 & rama_1!=6 & rama_5!=6 & n_ent_1=="1" 
*Hombres
*tab rama_1 rama_5 if estado_1_5==3 & d_edad_15_65==1 & d_hombre_5==1 & rama_1!=7 & rama_5!=7 & rama_1!=6 & rama_5!=6 & n_ent_1=="1"
*Mujeres y hombres
tab rama_1 rama_5 if estado_1_5==3 & d_edad_15_65==1 & rama_1!=7 & rama_5!=7 & rama_1!=6 & rama_5!=6 & n_ent_1=="1"

*Formal-Informal
*Mujeres
*tab rama_1 rama_5 if estado_1_5==2 & d_edad_15_65==1 & d_hombre_5==0 & rama_1!=7 & rama_5!=7 & rama_1!=6 & rama_5!=6 & n_ent_1=="1"
*Hombres
*tab rama_1 rama_5 if estado_1_5==2 & d_edad_15_65==1 & d_hombre_5==1 & rama_1!=7 & rama_5!=7 & rama_1!=6 & rama_5!=6 & n_ent_1=="1"
*Mujeres y hombres
tab rama_1 rama_5 if estado_1_5==2 & d_edad_15_65==1 & rama_1!=7 & rama_5!=7 & rama_1!=6 & rama_5!=6 & n_ent_1=="1"
****************************************
*Matrices de transición (de desocupado/PNEA a formal)

*Desocupado-formal
*Mujeres
tab rama_5 if estado_1_5==5 & d_edad_15_65==1 & d_hombre_5==0 & rama_5!=7 & rama_5!=6 & n_ent_1=="1"
*Hombres
tab rama_5 if estado_1_5==5 & d_edad_15_65==1 & d_hombre_5==1 & rama_5!=7 & rama_5!=6 & n_ent_1=="1"
*Mujeres y hombres
tab rama_5 if estado_1_5==5 & d_edad_15_65==1 & rama_5!=7 & rama_5!=6 & n_ent_1=="1"

*PNEA-formal
*Mujeres
tab rama_5 if estado_1_5==6 & d_edad_15_65==1 & d_hombre_5==0 & rama_5!=7 & rama_5!=6 & n_ent_1=="1"
*Hombres
tab rama_5 if estado_1_5==6 & d_edad_15_65==1 & d_hombre_5==1 & rama_5!=7 & rama_5!=6 & n_ent_1=="1"
*Mujeres y hombres
tab rama_5 if estado_1_5==6 & d_edad_15_65==1 & rama_5!=7 & rama_5!=6 & n_ent_1=="1"


***********************************************************************
***********Años de educación (Primera y quinta entrevista)*************
***********************************************************************

*Promedio de educación por estado

tabstat edu_1 if d_hombre_5==0 & d_edad_15_65==1 & n_ent_1=="1", by(estado_1_5) statistics(mean n) columns(statistics)

tabstat edu_1 if d_hombre_5==1 & d_edad_15_65==1 & n_ent_1=="1", by(estado_1_5) statistics(mean n) columns(statistics)


***********************************************************************
***********Distribución por edad(Primera y quinta entrevista)**********
***********************************************************************

*Mujeres
*Formal-formal
tab siefore_5 if d_hombre_5==0 & d_edad_15==1 & n_ent_1=="1" & estado_1_5==1
*Formal-informal
tab siefore_5 if d_hombre_5==0 & d_edad_15==1 & n_ent_1=="1" & estado_1_5==2
*Informal-formal
tab siefore_5 if d_hombre_5==0 & d_edad_15==1 & n_ent_1=="1" & estado_1_5==3
*Informal-informal
tab siefore_5 if d_hombre_5==0 & d_edad_15==1 & n_ent_1=="1" & estado_1_5==4
*Población total
tab siefore_5 if d_hombre_5==0 & d_edad_15==1 & n_ent_1=="1"

*Hombres
*Formal-formal
tab siefore_5 if d_hombre_5==1 & d_edad_15==1 & n_ent_1=="1" & estado_1_5==1
*Formal-informal
tab siefore_5 if d_hombre_5==1 & d_edad_15==1 & n_ent_1=="1" & estado_1_5==2
*Informal-formal
tab siefore_5 if d_hombre_5==1 & d_edad_15==1 & n_ent_1=="1" & estado_1_5==3
*Informal-informal
tab siefore_5 if d_hombre_5==1 & d_edad_15==1 & n_ent_1=="1" & estado_1_5==4
*Población total
tab siefore_5 if d_hombre_5==1 & d_edad_15==1 & n_ent_1=="1"

