* Autor: Luis Puente lfpuente@consar.gob.mx luis.federico.puente@gmail.com

* Este do-file crea una base de datos para cada trimeste a partir de información de la ENOE.
* Los sociodemográficos de la ENOE deben alojarse en la carpeta "bases" mediante un nombre 
* de archivo que tenga la siguiente estructura: sdemt12005, sdemt22005, etc. 

clear
clear matrix
set mem 500m
set more off
cap log close

forvalues base=1/45 {


scalar texto = "`base'"


gl bases="D:\Mis Documentos\Stata\ENOE\Proyectos\Concentrado por trimestre\Bases originales"
gl temp="D:\Mis Documentos\Stata\ENOE\Proyectos\Concentrado por trimestre\Temp"
gl log="D:\Mis Documentos\Stata\ENOE\Proyectos\Concentrado por trimestre\Log"
gl concentrado="D:\Mis Documentos\Stata\ENOE\Proyectos\Concentrado por trimestre\Concentrado"

log using "$log\Concentrado de Variables.txt", text replace

use "$bases\sdem_`base'.dta", clear


keep if r_def=="00" & (c_res=="1" | c_res=="3")

gen folioh=(cd_a+ent+con+v_sel+n_hog+h_mud)
gen foliop=(cd_a+ent+con+v_sel+n_hog+h_mud+n_ren)
gen foliopt=(cd_a+ent+con+v_sel+n_hog+h_mud+n_ren+n_ent)

gen clave_loc = ent+ mun + loc
destring clave_loc, replace

destring eda, replace
gen siefore=.
replace siefore=4 if eda>=60 & eda!=98 & eda!=99
replace siefore=3 if eda>=46 & eda<=59
replace siefore=2 if eda>=37 & eda<=45
replace siefore=1 if eda>=15 & eda<=36 


gen sb4=0
replace sb4=1 if eda>=15 & eda<=36 
gen sb3=0
replace sb3=1 if eda>=37 & eda<=45 
gen sb2=0
replace sb2=1 if eda>=46 & eda<=59
gen sb1=0
replace sb1=1 if eda>=60 & eda<=65



****************************************************

*Aquí se generan las variables pea, ocupados y desocupados
*Se genera la distribución de la PNEA y PEA

gen pea=.
replace pea=0 if clase1==2 & eda>=15 & eda<=98
replace pea=1 if clase1==1 & eda>=15 & eda<=98
label define pea 0 "PNEA" 1 "PEA"
label value pea pea

di in red "Población Total"
tabstat fac, stats (sum) format(%15.5gc)

di in red "Distribución de la población mayor de 15 Años. PNEA Vs PEA"
tab pea [w=fac] 

gen ocupado=.
replace ocupado=0 if clase2==2 & pea==1
replace ocupado=1 if clase2==1 & pea==1
label define ocupado 0  "Desocupados" 1 "Ocupados"
label value ocupado ocupado
                   
di in red "Districución de la PEA. Ocupación Vs Desocupación"
tab ocupado [w=fac] if pea==1

***************************************
*Aquí se genera la definición de "sector informal" ENOE

gen d_sec_inf_enoe=.
replace d_sec_inf_enoe=0 if ocupado==1
replace d_sec_inf_enoe=1 if ocupado==1 & tue2==5
label define d_sec_inf_enoe 0 "Formales" 1 "Informales"
label value d_sec_inf_enoe d_sec_inf_enoe

di in red "Distribución de los Ocupados. Informales Vs Formales(Sector informal)"
tab d_sec_inf_enoe [w=fac] if ocupado==1

tab pos_ocu d_sec_inf_enoe [w=fac] if ocupado==1

***************************************
*Aquí se genera la definición de "empleo informal" ENOE

gen d_emp_inf_enoe=.
replace d_emp_inf_enoe=0 if ocupado==1

*celda 1
replace d_emp_inf_enoe=1 if ocupado==1 & d_sec_inf_enoe==1 & pos_ocu==1 & remune2c==1
tab d_emp_inf_enoe [w=fac] if ocupado==1 & d_sec_inf_enoe==1 & pos_ocu==1 & remune2c==1
*celda 2
replace d_emp_inf_enoe=1 if ocupado==1 & d_sec_inf_enoe==1 & pos_ocu==1 & remune2c==2
tab d_emp_inf_enoe [w=fac] if ocupado==1 & d_sec_inf_enoe==1 & pos_ocu==1 & remune2c==2
*celda 3
replace d_emp_inf_enoe=1 if ocupado==1 & d_sec_inf_enoe==1 & pos_ocu==2
tab d_emp_inf_enoe [w=fac] if ocupado==1 & d_sec_inf_enoe==1 &pos_ocu==2
*celda 4
replace d_emp_inf_enoe=1 if ocupado==1 & d_sec_inf_enoe==1 & pos_ocu==3
tab d_emp_inf_enoe [w=fac] if ocupado==1 & d_sec_inf_enoe==1 & pos_ocu==3
*celda 5
replace d_emp_inf_enoe=1 if ocupado==1 & d_sec_inf_enoe==1 & pos_ocu==4
tab d_emp_inf_enoe [w=fac] if ocupado==1 & d_sec_inf_enoe==1 & pos_ocu==4

*Nota: de la celda 1 a la celda 5 se conforma la definición de "sector informal"

*Celda 6
replace d_emp_inf_enoe=1 if ocupado==1 & tue2==6 & remune2c==1 & (seg_soc==2 | seg_soc==3)
tab d_emp_inf_enoe [w=fac] if ocupado==1 & tue2==6 & remune2c==1 & (seg_soc==2 | seg_soc==3)

*Celda 7
replace d_emp_inf_enoe=1 if ocupado==1 & tue2==6 & remune2c==2 & (seg_soc==2 | seg_soc==3)
tab d_emp_inf_enoe [w=fac] if ocupado==1 & tue2==6 & remune2c==2 & (seg_soc==2 | seg_soc==3)

*Celda 8
replace d_emp_inf_enoe=1 if ocupado==1 & pos_ocu==1 & (ambito1==2 | ambito1==3) & ( tue2==1 | tue2==2 | tue2==3 | tue2==4) & remune2c==1 & (seg_soc==2 | seg_soc==3)
tab d_emp_inf_enoe [w=fac] if ocupado==1 & pos_ocu==1 & (ambito1==2 | ambito1==3) & ( tue2==1 | tue2==2 | tue2==3 | tue2==4) & remune2c==1 & (seg_soc==2 | seg_soc==3)

replace d_emp_inf_enoe=1 if ocupado==1 & pos_ocu==1 & tue1==4 & remune2c==1 & (seg_soc==2 | seg_soc==3)
tab d_emp_inf_enoe [w=fac] if ocupado==1 & pos_ocu==1 & tue1==4 & remune2c==1 & (seg_soc==2 | seg_soc==3)

*Celda 9
replace d_emp_inf_enoe=1 if ocupado==1 & pos_ocu==1 & (ambito1==2 | ambito1==3) & ( tue2==1 | tue2==2 | tue2==3 | tue2==4) & remune2c==2 & (seg_soc==2 | seg_soc==3)
tab d_emp_inf_enoe [w=fac] if ocupado==1 & pos_ocu==1 & (ambito1==2 | ambito1==3) & ( tue2==1 | tue2==2 | tue2==3 | tue2==4) & remune2c==2 & (seg_soc==2 | seg_soc==3)

replace d_emp_inf_enoe=1 if ocupado==1 & pos_ocu==1 & tue1==4 & remune2c==2 & (seg_soc==2 | seg_soc==3)
tab d_emp_inf_enoe [w=fac] if ocupado==1 & pos_ocu==1 & tue1==4 & remune2c==2 & (seg_soc==2 | seg_soc==3)

*Celda 10 
replace d_emp_inf_enoe=1 if ocupado==1 & pos_ocu==4 & (ambito1==2 | ambito1==3) & tue2!=5
tab d_emp_inf_enoe [w=fac] if ocupado==1 & pos_ocu==4 & (ambito1==2 | ambito1==3) & tue2!=5

*Celda 11 
replace d_emp_inf_enoe=1 if ocupado==1 & pos_ocu==1 & ambito1==1 & remune2c==1 & (seg_soc==2 | seg_soc==3)
tab d_emp_inf_enoe [w=fac] if ocupado==1 & pos_ocu==1 & ambito1==1 & remune2c==1 & (seg_soc==2 | seg_soc==3)

*Celda 12
replace d_emp_inf_enoe=1 if ocupado==1 & pos_ocu==1 & ambito1==1 & remune2c==2 & (seg_soc==2 | seg_soc==3)
tab d_emp_inf_enoe [w=fac] if ocupado==1 & pos_ocu==1 & ambito1==1 & remune2c==2 & (seg_soc==2 | seg_soc==3)

*Celda 13
replace d_emp_inf_enoe=1 if ocupado==1 & pos_ocu==3 & ambito1==1 
tab d_emp_inf_enoe [w=fac] if ocupado==1 & pos_ocu==3 & ambito1==1

*Celda 14
replace d_emp_inf_enoe=1 if ocupado==1 & pos_ocu==4 & ambito1==1 
tab d_emp_inf_enoe [w=fac] if ocupado==1 & pos_ocu==4 & ambito1==1

label define d_emp_inf_enoe 0 "Formales" 1 "Informales"
label value d_emp_inf_enoe d_emp_inf_enoe

di in red "Distribución de los Ocupados. Informales Vs Formales(Empleo informal)"
tab d_emp_inf_enoe [w=fac] if ocupado==1


******************************************************************************
*Aquí se identifican a los Ocupados con Seguridad Social
gen o_ss=.

replace o_ss=1 if ocupado==1 & seg_soc==1 
replace o_ss=0 if ocupado==1 & seg_soc==2

*Existen algunos trabajadores no identificados:
tab medica5c [w=fac] if ocupado==1 & seg_soc==3

*Para reducir este número se hace lo siguiente:
replace o_ss=0 if ocupado==1 & seg_soc==3 & medica5c==1
* Si es no identificado para recibir seguridad social seg_soc==3 y medica5c==1: si no tiene ninguna otra prestación en el trabajo 
* aguinaldo, vacaciones con goze de sueldo, reparto de utilidades) se concidera que no tiene seguridad social.

tab d_sec_inf_enoe o_ss [w=fac] if ocupado==1, m

replace o_ss=0 if ocupado==1 & seg_soc==3 & medica5c==4
* Si es no identificado para recibir seguridad social seg_soc==3 y medica5c==4: no tiene acceso a instituciones de salud pero si a otras prestaciones
*(aguinaldo, vacaciones con goze de sueldo, reparto de utilidades) se concidera que no tiene seguridad social. 
tab o_ss [w=fac] if ocupado==1 & seg_soc==3 & medica5c==4

replace o_ss=0 if ocupado==1 & seg_soc==3 & medica5c==5
* Si es no identificado para recibir seguridad social seg_soc==3 y medica5c==5: no especificó si tiene otras prestaciones 
*(aguinaldo, vacaciones con goze de sueldo, reparto de utilidades) se concidera que no tiene seguridad social.
tab o_ss [w=fac] if ocupado==1 & seg_soc==3 & medica5c==5

label define o_ss  0  "Sin Acceso a SS" 1  "Con Acceso a SS"
label value o_ss o_ss

di in red "Ocupados con acceso a Seguridad Social"
tab o_ss [w=fac] if ocupado==1


********************************************
*Aquí se identifican a los asalariados

gen d_asal=.
replace d_asal=0 if ocupado==1 & pos_ocu!=5
replace d_asal=1 if ocupado==1 & pos_ocu==1
label define d_asal 0 "No asalariados" 1 "Asalariados"
label value d_asal d_asal
di in red "Ocupados Asalariados"
tab d_asal [w=fac] if ocupado==1

di in red "Distribución. Asalariados Vs Seguridad Social"
tab d_asal o_ss [w=fac] if ocupado==1,m


**************************
*Aquí se identifican a los Formales e Informales (Definición Ley: salariados con SS)

gen d_inf_ley=.
replace d_inf_ley=1 if ocupado==1
replace d_inf_ley=0 if ocupado==1 & d_asal==1 & o_ss==1

label define d_inf_ley  0  "Formales" 1  "Informales"
label value d_inf_ley d_inf_ley

di in red "Distribución de los Ocupados. Informales Vs Formales(Ley)"
tab d_inf_ley [w=fac] if ocupado==1 

**************************
*Aquí se identifican a los Formales e Informales (Definición Seguridad Social: trabajadores con SS)

gen d_inf_ss=.
replace d_inf_ss=1 if ocupado==1
replace d_inf_ss=0 if ocupado==1 & o_ss==1

label define d_inf_ss  0  "Formales" 1  "Informales"
label value d_inf_ss d_inf_ss

di in red "Distribución de los Ocupados. Informales Vs Formales(Seguridad Social)"
tab d_inf_ss [w=fac] if ocupado==1

gen d_for_ss=.
replace d_for_ss=0 if d_inf_ss==1
replace d_for_ss=1 if d_inf_ss==0

label define d_for_ss 0 "Informal" 1 "Formal"
label value d_for_ss d_for_ss

tab d_for_ss d_inf_ss

***************************
*Aquí se compara la posición en el trabajo.

label define pos_ocu 1 "Subor y Remun" 2 "Empleador" 3 "Autoempleado" 4 "Sin pago" 5 "No especificado"
label value pos_ocu pos_ocu

tab pos_ocu [w=fac] if ocupado==1

***************************
*Aqui se identifica a la PEA por tipo de trabajador, formal/informal (seguridad social) y desocupado.

gen tipo=.
*Formales asalaraidos
replace tipo=1 if pos_ocu==1 & d_inf_ss==1

*Informales Asalariados
replace tipo=2 if pos_ocu==1 & d_inf_ss==0

*Formales empleadores
replace tipo=3 if pos_ocu==2 & d_inf_ss==1

*Informales Empleadores
replace tipo=4 if pos_ocu==2 & d_inf_ss==0

*Formales Autoempleados
replace tipo=5 if pos_ocu==3 & d_inf_ss==1

*Informales Autoempleados
replace tipo=6 if pos_ocu==3 & d_inf_ss==0

*Informales Sin Pago
replace tipo=7 if pos_ocu==4

*Desocupado
replace tipo=8 if pea==1 & ocupado==0

*No identificados
replace tipo=9 if ocupado==1 & pos_ocu==5
 
label define tipo 1 "Formales(ss) asalaraidos" 2 "Informales(ss) Asalariados" 3  "Formales(ss) empleadores"  4 "Informales(ss) Empleadores" 5 "Formales(ss) Autoempleados" 6 "Informales(ss) Autoempleados" 7 "Informales(ss) Sin Pago" 8 "Desocupado" 9"ND"
label value tipo tipo

tab tipo [w=fac]

tab tipo d_emp_inf_enoe [w=fac] if ocupado==1

********************************
*Aqui se generan dummies por tipo de trabajador

*Ya se creo la variable de asalariados d_asal, por eso no se crea aquí

*Empleador
gen d_emp=.
replace d_emp=0 if ocupado==1 & pos_ocu!=5
replace d_emp=1 if ocupado==1 & pos_ocu==2
label define d_emp 0 "No empleador" 1 "Empleador"
label value d_emp d_emp

*Autoempleado
gen d_auto=.
replace d_auto=0 if ocupado==1 & pos_ocu!=5
replace d_auto=1 if ocupado==1 & pos_ocu==3
label define d_auto 0 "No autoempleado" 1 "Autoempleado"
label value d_auto d_auto

*Sin Pago
gen d_sin_pago=.
replace d_sin_pago=0 if ocupado==1 & pos_ocu!=5
replace d_sin_pago=1 if ocupado==1 & pos_ocu==4
label define d_sin_pago 0 "Recibe pago" 1 "Sin pago"
label value d_sin_pago d_sin_pago


*****************************************
*Aqui se crean las variables relacionada con: género, experiencia, educación, localidad, etc.

gen d_hombre=.
replace d_hombre=1 if sex=="1"
replace d_hombre=0 if sex=="2"

gen d_mujer=.
replace d_mujer=1 if sex=="2"
replace d_mujer=0 if sex=="1"

gen edu=.
replace edu=anios_esc if anios_esc!=99
gen eduq=edu*edu

*Aquí se generaran variables dummies de educación
*tab edu niv_ins, m

gen prim_inc=.
replace prim_inc=0 if niv_ins!=1 & niv_ins!=5
replace prim_inc=1 if niv_ins==1

gen prim_com=.
replace prim_com=0 if niv_ins!=2 & niv_ins!=5
replace prim_com=1 if niv_ins==2 

gen sec_com=.
replace sec_com=0 if niv_ins!=3 & niv_ins!=5
replace sec_com=1 if niv_ins==3 

gen medysup=.
replace medysup=0 if niv_ins!=4 & niv_ins!=5
replace medysup=1 if niv_ins==4 

****************************
gen exp=.
replace exp= eda-edu-6
gen expq=exp*exp

destring t_loc, replace
gen d_rural=.
replace d_rural=1 if t_loc==4
replace d_rural=0 if t_loc<4 

gen d_urbano=.
replace d_urbano=1 if 1<=t_loc<4
replace d_urbano=0 if t_loc==4

gen d_leer_escr=.
replace d_leer_escr=1 if cs_p12=="1"
replace d_leer_escr=0 if cs_p12=="2"

destring n_hij, replace
gen hijos=.
replace hijos=n_hij if n_hij!=99
*Ojo: Esta variable sólo la contestan las mujeres

gen d_casado=0
replace d_casado= 1 if e_con=="5" |e_con=="1"
replace d_casado= 0 if e_con=="6" |e_con=="2" |e_con=="3" |e_con=="4"
* Se consideran NO casados aquellos que son: solteros, separados, divorciados y viudos.
* Se consideran casados aquellos que son: casados y en unión libre.

gen d_jefe=.
replace d_jefe=1 if par_c=="101"
replace d_jefe=0 if par_c!="101"

gen d_aten_med=.
replace d_aten_med=1 if imssissste==1 |imssissste==2|imssissste==3
replace d_aten_med=0 if imssissste==5

save "$temp\Temporal Variables.dta", replace

*********************************************************************
*********************************************************************
*********************************************************************

* A continuación se generan variables dummys a nivel hogar. Por ejemplo: # de menores el hogar, # trabajadores del hogar,
* # no trabajadores del hogar
* Se utiliza como base original la sociodemográfica.
* Posteriormente se hará un merge con la base previa ("$temp\Temporal Variables.dta")

use "$bases\sdem_`base'.dta", clear

keep if r_def=="00" & (c_res=="1" | c_res=="3")

gen folioh=(cd_a+ent+con+v_sel+n_hog+h_mud)
gen foliop=(cd_a+ent+con+v_sel+n_hog+h_mud+n_ren)
gen foliopt=(cd_a+ent+con+v_sel+n_hog+h_mud+n_ren+n_ent)
sort folioh foliop

destring eda, replace
destring par_c, replace

gen integr=0
replace integr=1 if 100<par_c & par_c<500

gen menor6=0
replace menor6=1 if 100<par_c & par_c<500 & eda<6

gen trabajo=0
replace trabajo=1 if clase2==1 & clase1==1 & eda>=15 & eda<=98 & 100<par_c & par_c<500

gen no_trab=0
replace no_trab=1 if trabajo==0

tabstat trabajo no_trab, stats(sum)

collapse (sum) integr menor6 trabajo no_trab, by(folioh)

*A continuación se crean razones de dependencia laboral
gen dep_lab=.
replace dep_lab=no_trab/trabajo
*Nota: en las variables anteriores se creean valores perdidos al no poder dividir entre 0.

gen dep_trab_int=.
replace dep_trab_int=trabajo/integr


keep menor6 dep_lab dep_trab_int folioh

sort folioh

save "$temp\Integrantes Hogar.dta", replace

*******
use "$temp\Temporal Variables.dta", clear

destring par_c, replace
sort folioh foliop

merge folioh using "$temp\Integrantes Hogar.dta"
tab _merge
drop _merge

gen d_menor6=.
replace d_menor6=1 if menor6>=1
replace d_menor6=0 if menor6==0

*Para el análisis nos interesan los miembros del hogar directos. 
*Es por esto que se substituye con cero a los que no tienen parentesco, trabajadores domésticos, huespedes y parentesco no identificado (par_c>500).
replace d_menor6=0 if par_c>500
replace menor6=0 if par_c>500

replace dep_lab=0 if par_c>500
replace dep_trab_int=0 if par_c>500


gen d_mujer_menor6= d_mujer* d_menor6

replace rama=99 if rama==5
replace rama=5 if rama==6
replace rama=6 if rama==99
*Nota este cambio se hace para que "agropecuario" esté antes que "otros".

label define rama 1 "Construcción" 2 "Manufactura" 3 "Comercio" 4 "Servicios" 5 "Agropecuario" 6 "Otros" 7 "No Especificado"
label value rama rama

label define emple7c 1"1" 2"2-5" 3"6-10" 4"11-15" 5"16-50" 6"50 y más" 7"No especificado"
label value emple7c emple7c

label define niv_ins 1 "Primaria Incompleta" 2"Primaria Completa" 3"Secundaria Completa" 4"Medio Superior y Superior" 5"No especificado"
label value niv_ins niv_ins

label define ing7c 0"Desocupado" 1"Hasta 1 SM" 2"1-2 SM" 3"2-3 SM" 4"3-5 SM" 5"Más de 5 SM" 6"No recibe ingresos" 7"No especificado"
label value ing7c  ing7c 

label define dur9c 1"Ausentes temp c/vinculo lab" 2"Menos 15 Hrs" 3"15 a 24 Hrs" 4"25 a 34 Hrs" 5"35 a 39 Hrs" 6"40 a 48 Hrs" 7 "49 a 56 Hrs" 8"Más de 56 Hrs" 9"No Especificado"
label value  dur9c dur9c 

****************************************
*En esta parte se van a corregir los valores iguales a cero de la variable ingocup

gen ing_pos=.
replace ing_pos=0 if ocupado==1 & ingocup==0
replace ing_pos=1 if ocupado==1 & ingocup>0
label define ing_pos 0 "Ingreso cero" 1 "Ingreso positivo"
label value ing_pos ing_pos

tab ing_pos ing7c  [w=fac] if ocupado==1
tab ing_pos ing7c if ocupado==1

*A continuación los valores que deben de ser "valores perdidos"
replace ingocup=. if ocupado==1 & ing_pos==0 & ing7c==1
replace ingocup=. if ocupado==1 & ing_pos==0 & ing7c==2
replace ingocup=. if ocupado==1 & ing_pos==0 & ing7c==3
replace ingocup=. if ocupado==1 & ing_pos==0 & ing7c==4
replace ingocup=. if ocupado==1 & ing_pos==0 & ing7c==5
replace ingocup=. if ocupado==1 & ing_pos==0 & ing7c==7

*A continuación los valores que deben de ser "ceros"
replace ingocup=0 if ocupado==1 & ing_pos==0 & ing7c==6
replace ingocup=0 if ocupado==0


replace ing_pos=0 if ingocup==0
replace ing_pos=1 if ingocup>0
replace ing_pos=. if ingocup==.

tab ing_pos ing7c [w=fac]if ocupado==1, m
tab ing_pos ing7c if ocupado==1, m

*A continuación a los individuos que tienen cero ingresos(corregido) se les clasifica como trabajadores sin remuneración en la variable tipo
tab ing_pos tipo if ocupado==1, m
replace tipo=5 if ing_pos==0 & ocupado==1
tab ing_pos tipo if ocupado==1, m


*****************************************************************

gen ingreso=ingocup
replace ingreso=1 if ingocup==0

gen ln_ingocup=.
replace ln_ingocup=ln(ingreso)


replace ing_x_hrs=. if ingocup==.
replace ing_x_hrs=0 if ingocup==0

gen ingreso2=ing_x_hrs
replace ingreso2=1 if ing_x_hrs==0

gen ln_ing_x_hrs=.
replace ln_ing_x_hrs=ln(ingreso2) 


*****************************************************************
*Aquí se crea una varaible para los ingresos por Salarios Mínimos

gen sal_min=.
replace sal_min=1 if ing7c==6
replace sal_min=1 if ocupado==0
replace sal_min=2 if ing7c==1
replace sal_min=3 if ing7c==2
replace sal_min=4 if ing7c==3
replace sal_min=5 if ing7c==4
replace sal_min=6 if ing7c==5
replace sal_min=. if ing7c==7

label define sal_min 1 "Cero" 2 "Hasta 1 SM" 3 "1-2 SM" 4 "2-3 SM" 5 "3-5 SM" 6 "Más de 5 SM" 
label value sal_min sal_min
tab sal_min ing7c

*****************************************************************
*Aquí se crea una varaible status: formal(ss), informal(ss), desempleado y PNEA (15 y más años)

gen status=.
replace status=1 if d_inf_ss==0 & ocupado==1
replace status=2 if d_inf_ss==1 & ocupado==1
replace status=3 if pea==1 & ocupado==0
replace status=4 if pea==0 & eda>=15 & eda<=98
replace status=5 if pea==0 & eda<15

label define status 1 "Formal" 2 "Informal" 3 "Desocupado" 4 "PNEA" 5 "Menor"
label value status status


sort clave_loc

merge m:1 clave_loc using "$bases\IRS_localidad_2010.dta"
tab _merge
drop if _merge==2
drop _merge



keep folioh foliop foliopt n_ent irs ocupado ln_ing_x_hrs ln_ingocup ing_x_hrs ingocup ing_pos sal_min salario edu eduq prim_inc prim_com sec_com medysup niv_ins d_jefe exp expq hrsocup pea o_ss d_asal d_emp d_auto d_sin_pago d_sec_inf_enoe d_emp_inf_enoe d_inf_ss d_inf_ley emp_ppal tue_ppal mh_fil2 mh_col tipo d_hombre d_mujer hijos d_mujer_menor6 d_menor6 menor6 dep_lab dep_trab_int d_rural d_urbano d_leer_escr hijos d_casado upm eda siefore sb1 sb2 sb3 sb4 fac ent emple7c medica5c rama rama_est1 rama_est2 d_ant_lab status

sort folioh foliop

save "$concentrado\Concentrado_`base'.dta", replace


log close
}
