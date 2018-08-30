
*MUJERES

di in red "Diferencias de medias Ingresos mensual. MUJERES"
ttest ingocup_1_def== ingocup_5_def if estado_1_5==1 & d_hombre_5==0 & ing_pos_1!=. & ing_pos_5!=. & d_edad_15_65==1 & cien_1_m<100 & cien_5_m<100, l(95)
ttest ingocup_1_def== ingocup_5_def if estado_1_5==2 & d_hombre_5==0 & ing_pos_1!=. & ing_pos_5!=. & d_edad_15_65==1 & cien_1_m<100 & cien_5_m<100, l(95)
ttest ingocup_1_def== ingocup_5_def if estado_1_5==3 & d_hombre_5==0 & ing_pos_1!=. & ing_pos_5!=. & d_edad_15_65==1 & cien_1_m<100 & cien_5_m<100, l(95)
ttest ingocup_1_def== ingocup_5_def if estado_1_5==4 & d_hombre_5==0 & ing_pos_1!=. & ing_pos_5!=. & d_edad_15_65==1 & cien_1_m<100 & cien_5_m<100, l(95)

di in red "Diferencias de medias Horas laboradas. MUJERES"
ttest hrsocup_1== hrsocup_5 if estado_1_5==1 & d_hombre_5==0 & ing_pos_1!=. & ing_pos_5!=. & d_edad_15_65==1 & cien_1_m<100 & cien_5_m<100, l(95)
ttest hrsocup_1== hrsocup_5 if estado_1_5==2 & d_hombre_5==0 & ing_pos_1!=. & ing_pos_5!=. & d_edad_15_65==1 & cien_1_m<100 & cien_5_m<100, l(95)
ttest hrsocup_1== hrsocup_5 if estado_1_5==3 & d_hombre_5==0 & ing_pos_1!=. & ing_pos_5!=. & d_edad_15_65==1 & cien_1_m<100 & cien_5_m<100, l(95)
ttest hrsocup_1== hrsocup_5 if estado_1_5==4 & d_hombre_5==0 & ing_pos_1!=. & ing_pos_5!=. & d_edad_15_65==1 & cien_1_m<100 & cien_5_m<100, l(95)

di in red "Diferencias de medias Ingresos por horas. MUJERES"
ttest ing_x_hrs_1_def== ing_x_hrs_5_def if estado_1_5==1 & d_hombre_5==0 & ing_pos_1!=. & ing_pos_5!=. & d_edad_15_65==1 & cien_1_m<100 & cien_5_m<100, l(95)
ttest ing_x_hrs_1_def== ing_x_hrs_5_def if estado_1_5==2 & d_hombre_5==0 & ing_pos_1!=. & ing_pos_5!=. & d_edad_15_65==1 & cien_1_m<100 & cien_5_m<100, l(95)
ttest ing_x_hrs_1_def== ing_x_hrs_5_def if estado_1_5==3 & d_hombre_5==0 & ing_pos_1!=. & ing_pos_5!=. & d_edad_15_65==1 & cien_1_m<100 & cien_5_m<100, l(95)
ttest ing_x_hrs_1_def== ing_x_hrs_5_def if estado_1_5==4 & d_hombre_5==0 & ing_pos_1!=. & ing_pos_5!=. & d_edad_15_65==1 & cien_1_m<100 & cien_5_m<100, l(95)


*HOMBRES

di in red "Diferencias de medias Ingresos mensual. HOMBRES"
ttest ingocup_1_def== ingocup_5_def if estado_1_5==1 & d_hombre_5==1 & ing_pos_1!=. & ing_pos_5!=. & d_edad_15_65==1 & cien_1_h<100 & cien_5_h<100, l(95)
ttest ingocup_1_def== ingocup_5_def if estado_1_5==2 & d_hombre_5==1 & ing_pos_1!=. & ing_pos_5!=. & d_edad_15_65==1 & cien_1_h<100 & cien_5_h<100, l(95)
ttest ingocup_1_def== ingocup_5_def if estado_1_5==3 & d_hombre_5==1 & ing_pos_1!=. & ing_pos_5!=. & d_edad_15_65==1 & cien_1_h<100 & cien_5_h<100, l(95)
ttest ingocup_1_def== ingocup_5_def if estado_1_5==4 & d_hombre_5==1 & ing_pos_1!=. & ing_pos_5!=. & d_edad_15_65==1 & cien_1_h<100 & cien_5_h<100, l(95)

di in red "Diferencias de medias Horas laboradas. HOMBRES"
ttest hrsocup_1== hrsocup_5 if estado_1_5==1 & d_hombre_5==1 & ing_pos_1!=. & ing_pos_5!=. & d_edad_15_65==1 & cien_1_h<100 & cien_5_h<100, l(95)
ttest hrsocup_1== hrsocup_5 if estado_1_5==2 & d_hombre_5==1 & ing_pos_1!=. & ing_pos_5!=. & d_edad_15_65==1 & cien_1_h<100 & cien_5_h<100, l(95)
ttest hrsocup_1== hrsocup_5 if estado_1_5==3 & d_hombre_5==1 & ing_pos_1!=. & ing_pos_5!=. & d_edad_15_65==1 & cien_1_h<100 & cien_5_h<100, l(95)
ttest hrsocup_1== hrsocup_5 if estado_1_5==4 & d_hombre_5==1 & ing_pos_1!=. & ing_pos_5!=. & d_edad_15_65==1 & cien_1_h<100 & cien_5_h<100, l(95)

di in red "Diferencias de medias Ingresos por horas. HOMBRES"
ttest ing_x_hrs_1_def== ing_x_hrs_5_def if estado_1_5==1 & d_hombre_5==1 & ing_pos_1!=. & ing_pos_5!=. & d_edad_15_65==1 & cien_1_h<100 & cien_5_h<100, l(95)
ttest ing_x_hrs_1_def== ing_x_hrs_5_def if estado_1_5==2 & d_hombre_5==1 & ing_pos_1!=. & ing_pos_5!=. & d_edad_15_65==1 & cien_1_h<100 & cien_5_h<100, l(95)
ttest ing_x_hrs_1_def== ing_x_hrs_5_def if estado_1_5==3 & d_hombre_5==1 & ing_pos_1!=. & ing_pos_5!=. & d_edad_15_65==1 & cien_1_h<100 & cien_5_h<100, l(95)
ttest ing_x_hrs_1_def== ing_x_hrs_5_def if estado_1_5==4 & d_hombre_5==1 & ing_pos_1!=. & ing_pos_5!=. & d_edad_15_65==1 & cien_1_h<100 & cien_5_h<100, l(95)




