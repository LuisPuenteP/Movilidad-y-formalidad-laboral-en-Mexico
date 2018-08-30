*Autor: Luis Federico Puente Peña
*lfpuente@consar.gob.mx
*lfpp1@yahoo.com.mx

*Este do-file sirve para unir los datos panel de la ENOE. Además, crea las variables de ingresos reales.
*El matching se realiza considerando la primera y última entrevistas realizadada por la  ENOE, es decir,
*se obtiene información de un mismo trimestre en dos años consecutivos.

*Las bases de datos que se utlizan como insumo fueron generadas por el do file de nombre "Concentrado por trimestre".
*Cada base de datos de insumo es el concentrado por trimestre.

clear
clear matrix
set mem 500m
set more off
cap log close

*La carpeta de donde se extraen las bases de datos (insumo) están ojadas en la siguiente ruta(concentrado por trimestre): 
gl bases="D:\Mis Documentos\Stata\ENOE\Proyectos\Concentrado por trimestre\Concentrado"

*Las demás carpetas están alojadas en la sección de páneles.
gl temp="D:\Mis Documentos\Stata\ENOE\Proyectos\Páneles\Temp-prueba"
gl conc="D:\Mis Documentos\Stata\ENOE\Proyectos\Páneles\Concentrado por panel"


forvalues base1=41/41{

local base2 = `base1' + 1
local base3 = `base1' + 2
local base4 = `base1' + 3
local base5 = `base1' + 4

di in red "`base1' - `base2' - `base3' - `base4' - `base5'"

********************************************************
*Aquí se abre la base de datos de la primera entrevista
********************************************************

use "$bases\Concentrado_`base1'.dta", clear
di in red "La base que se está abriendo es la: `base1'"
rename _all =_1

rename foliopt*_1*   **foliopt
rename folioh*_1*   **folioh
rename foliop*_1*   **foliop

sort foliop
save"$temp\Base_1.dta", replace

********************************************************
*Aquí se abre la base de datos de la segunda entrevista
********************************************************
use "$bases\Concentrado_`base2'.dta", clear
di in red "La base que se está abriendo es la: `base2'"
rename _all =_2

rename foliopt*_2*   **foliopt
rename folioh*_2*   **folioh
rename foliop*_2*   **foliop

*Se eliminan las observaciones nuevas
drop if n_ent_2=="1"

sort foliop
save"$temp\Base_2.dta", replace

********************************************************
*Aquí se abre la base de datos de la tercera entrevista
********************************************************
use "$bases\Concentrado_`base3'.dta", clear
di in red "La base que se está abriendo es la: `base3'"
rename _all =_3

rename foliopt*_3*   **foliopt
rename folioh*_3*   **folioh
rename foliop*_3*   **foliop

*Se eliminan las observaciones nuevas
drop if n_ent_3=="1" | n_ent_3=="2"

sort foliop
save"$temp\Base_3.dta", replace

********************************************************
*Aquí se abre la base de datos de la cuarta entrevista
********************************************************
use "$bases\Concentrado_`base4'.dta", clear
di in red "La base que se está abriendo es la: `base4'"
rename _all =_4

rename foliopt*_4*   **foliopt
rename folioh*_4*   **folioh
rename foliop*_4*   **foliop

*Se eliminan las observaciones nuevas
drop if n_ent_4=="1" | n_ent_4=="2" | n_ent_4=="3"

sort foliop
save"$temp\Base_4.dta", replace

********************************************************
*Aquí se abre la base de datos de la quinta entrevista
********************************************************
use "$bases\Concentrado_`base5'.dta", clear
di in red "La base que se está abriendo es la: `base5'"
rename _all =_5

rename foliopt*_5*   **foliopt
rename folioh*_5*   **folioh
rename foliop*_5*   **foliop

*Se eliminan las observaciones nuevas
drop if n_ent_5=="1" | n_ent_5=="2" | n_ent_5=="3" | n_ent_5=="4"

sort foliop
save"$temp\Base_5.dta", replace

********************************************************
********************************************************
*******Aquí se combinan las 5 bases de datos************
********************************************************
********************************************************

*Aquí se pegan las 5 bases de datos.

use "$temp\Base_1.dta", clear

merge 1:1 foliop using "$temp\Base_2.dta"
tab _merge
rename _merge _merge2
sort foliop 

merge 1:1 foliop using "$temp\Base_3.dta"
tab _merge
rename _merge _merge3
sort foliop 

merge 1:1 foliop using "$temp\Base_4.dta"
tab _merge
rename _merge _merge4
sort foliop

merge 1:1 foliop using "$temp\Base_5.dta"
tab _merge
rename _merge _merge5
sort foliop 

di in red "Para comprobar que se haya utilizado la base del primer trimestre como principal (master)"

di in red "Base: `base1'"
tab ocupado_1 [w=fac_1]

*Se mantienen únicamente las observaciones que estuvieron en la primera base de datos (Base_1)
drop if _merge2==2
drop if _merge3==2
drop if _merge4==2
drop if _merge5==2


keep if (n_ent_1=="1" & n_ent_2=="2" & n_ent_3=="3" & n_ent_4=="4" & n_ent_5=="5") | (n_ent_1=="2" & n_ent_2=="3" & n_ent_3=="4" & n_ent_4=="5") | (n_ent_1=="3" & n_ent_2=="4" & n_ent_3=="5") | (n_ent_1=="4" & n_ent_2=="5") | (n_ent_1=="5")

drop if (n_ent_1=="5" & n_ent_2=="1") | (n_ent_1=="5" & n_ent_2=="2") | (n_ent_1=="5" & n_ent_2=="3") | (n_ent_1=="5" & n_ent_2=="4") | (n_ent_1=="5" & n_ent_2=="5")
drop if (n_ent_2=="5" & n_ent_3=="1") | (n_ent_2=="5" & n_ent_3=="2") | (n_ent_2=="5" & n_ent_3=="3") | (n_ent_2=="5" & n_ent_3=="4") | (n_ent_2=="5" & n_ent_3=="5")
drop if (n_ent_3=="5" & n_ent_4=="1") | (n_ent_3=="5" & n_ent_4=="2") | (n_ent_3=="5" & n_ent_4=="3") | (n_ent_3=="5" & n_ent_4=="4") | (n_ent_3=="5" & n_ent_4=="5")
drop if (n_ent_4=="5" & n_ent_5=="1") | (n_ent_4=="5" & n_ent_5=="2") | (n_ent_4=="5" & n_ent_5=="3") | (n_ent_4=="5" & n_ent_5=="4") | (n_ent_4=="5" & n_ent_5=="5")

drop if (n_ent_1=="4" & n_ent_2=="1") | (n_ent_1=="4" & n_ent_2=="2") | (n_ent_1=="4" & n_ent_2=="3") | (n_ent_1=="4" & n_ent_2=="4")
drop if (n_ent_2=="4" & n_ent_3=="1") | (n_ent_2=="4" & n_ent_3=="2") | (n_ent_2=="4" & n_ent_3=="3") | (n_ent_2=="4" & n_ent_3=="4")
drop if (n_ent_3=="4" & n_ent_4=="1") | (n_ent_3=="4" & n_ent_4=="2") | (n_ent_3=="4" & n_ent_4=="3") | (n_ent_3=="4" & n_ent_4=="4")
drop if (n_ent_4=="4" & n_ent_5=="1") | (n_ent_4=="4" & n_ent_5=="2") | (n_ent_4=="4" & n_ent_5=="3") | (n_ent_4=="4" & n_ent_5=="4")

drop if (n_ent_1=="3" & n_ent_2=="1") | (n_ent_1=="3" & n_ent_2=="2") | (n_ent_1=="3" & n_ent_2=="3") | (n_ent_1=="3" & n_ent_2=="5")
drop if (n_ent_2=="3" & n_ent_3=="1") | (n_ent_2=="3" & n_ent_3=="2") | (n_ent_2=="3" & n_ent_3=="3") | (n_ent_2=="3" & n_ent_3=="5")
drop if (n_ent_3=="3" & n_ent_4=="1") | (n_ent_3=="3" & n_ent_4=="2") | (n_ent_3=="3" & n_ent_4=="3") | (n_ent_3=="3" & n_ent_4=="5")
drop if (n_ent_4=="3" & n_ent_5=="1") | (n_ent_4=="3" & n_ent_5=="2") | (n_ent_4=="3" & n_ent_5=="3") | (n_ent_4=="3" & n_ent_5=="5")

drop if (n_ent_1=="2" & n_ent_2=="1") | (n_ent_1=="2" & n_ent_2=="2") | (n_ent_1=="2" & n_ent_2=="4") | (n_ent_1=="2" & n_ent_2=="5")
drop if (n_ent_2=="2" & n_ent_3=="1") | (n_ent_2=="2" & n_ent_3=="2") | (n_ent_2=="2" & n_ent_3=="4") | (n_ent_2=="2" & n_ent_3=="5")
drop if (n_ent_3=="2" & n_ent_4=="1") | (n_ent_3=="2" & n_ent_4=="2") | (n_ent_3=="2" & n_ent_4=="4") | (n_ent_3=="2" & n_ent_4=="5")
drop if (n_ent_4=="2" & n_ent_5=="1") | (n_ent_4=="2" & n_ent_5=="2") | (n_ent_4=="2" & n_ent_5=="4") | (n_ent_4=="2" & n_ent_5=="5")

drop if (n_ent_1=="1" & n_ent_2=="1") | (n_ent_1=="1" & n_ent_2=="3") | (n_ent_1=="1" & n_ent_2=="4") | (n_ent_1=="1" & n_ent_2=="5")
drop if (n_ent_2=="1" & n_ent_3=="1") | (n_ent_2=="1" & n_ent_3=="3") | (n_ent_2=="1" & n_ent_3=="4") | (n_ent_2=="1" & n_ent_3=="5")
drop if (n_ent_3=="1" & n_ent_4=="1") | (n_ent_3=="1" & n_ent_4=="3") | (n_ent_3=="1" & n_ent_4=="4") | (n_ent_3=="1" & n_ent_4=="5")
drop if (n_ent_4=="1" & n_ent_5=="1") | (n_ent_4=="1" & n_ent_5=="3") | (n_ent_4=="1" & n_ent_5=="4") | (n_ent_4=="1" & n_ent_5=="5")



drop if (n_ent_1=="5" & n_ent_3=="1") | (n_ent_1=="5" & n_ent_3=="2") | (n_ent_1=="5" & n_ent_3=="3") | (n_ent_1=="5" & n_ent_3=="4") | (n_ent_1=="5" & n_ent_3=="5")
drop if (n_ent_2=="5" & n_ent_4=="1") | (n_ent_2=="5" & n_ent_4=="2") | (n_ent_2=="5" & n_ent_4=="3") | (n_ent_2=="5" & n_ent_4=="4") | (n_ent_2=="5" & n_ent_4=="5")
drop if (n_ent_3=="5" & n_ent_5=="1") | (n_ent_3=="5" & n_ent_5=="2") | (n_ent_3=="5" & n_ent_5=="3") | (n_ent_3=="5" & n_ent_5=="4") | (n_ent_3=="5" & n_ent_5=="5")

drop if (n_ent_1=="4" & n_ent_3=="1") | (n_ent_1=="4" & n_ent_3=="2") | (n_ent_1=="4" & n_ent_3=="3") | (n_ent_1=="4" & n_ent_3=="4")
drop if (n_ent_2=="4" & n_ent_4=="1") | (n_ent_2=="4" & n_ent_4=="2") | (n_ent_2=="4" & n_ent_4=="3") | (n_ent_2=="4" & n_ent_4=="4")
drop if (n_ent_3=="4" & n_ent_5=="1") | (n_ent_3=="4" & n_ent_5=="2") | (n_ent_3=="4" & n_ent_5=="3") | (n_ent_3=="4" & n_ent_5=="4")

drop if (n_ent_1=="3" & n_ent_3=="1") | (n_ent_1=="3" & n_ent_3=="2") | (n_ent_1=="3" & n_ent_3=="3") 
drop if (n_ent_2=="3" & n_ent_4=="1") | (n_ent_2=="3" & n_ent_4=="2") | (n_ent_2=="3" & n_ent_4=="3") 
drop if (n_ent_3=="3" & n_ent_5=="1") | (n_ent_3=="3" & n_ent_5=="2") | (n_ent_3=="3" & n_ent_5=="3") 

drop if (n_ent_1=="2" & n_ent_3=="1") | (n_ent_1=="2" & n_ent_3=="2") | (n_ent_1=="2" & n_ent_3=="5")
drop if (n_ent_2=="2" & n_ent_4=="1") | (n_ent_2=="2" & n_ent_4=="2") | (n_ent_2=="2" & n_ent_4=="5")
drop if (n_ent_3=="2" & n_ent_5=="1") | (n_ent_3=="2" & n_ent_5=="2") | (n_ent_3=="2" & n_ent_5=="5")

drop if (n_ent_1=="1" & n_ent_3=="1") | (n_ent_1=="1" & n_ent_3=="4") | (n_ent_1=="1" & n_ent_3=="5")
drop if (n_ent_2=="1" & n_ent_4=="1") | (n_ent_2=="1" & n_ent_4=="4") | (n_ent_2=="1" & n_ent_4=="5")
drop if (n_ent_3=="1" & n_ent_5=="1") | (n_ent_3=="1" & n_ent_5=="4") | (n_ent_3=="1" & n_ent_5=="5")


drop if (n_ent_1=="5" & n_ent_4=="1") | (n_ent_1=="5" & n_ent_4=="2") | (n_ent_1=="5" & n_ent_4=="3") | (n_ent_1=="5" & n_ent_4=="4") | (n_ent_1=="5" & n_ent_4=="5")
drop if (n_ent_2=="5" & n_ent_5=="1") | (n_ent_2=="5" & n_ent_5=="2") | (n_ent_2=="5" & n_ent_5=="3") | (n_ent_2=="5" & n_ent_5=="4") | (n_ent_2=="5" & n_ent_5=="5")

drop if (n_ent_1=="4" & n_ent_4=="1") | (n_ent_1=="4" & n_ent_4=="2") | (n_ent_1=="4" & n_ent_4=="3") | (n_ent_1=="4" & n_ent_4=="4")
drop if (n_ent_2=="4" & n_ent_5=="1") | (n_ent_2=="4" & n_ent_5=="2") | (n_ent_2=="4" & n_ent_5=="3") | (n_ent_2=="4" & n_ent_5=="4")

drop if (n_ent_1=="3" & n_ent_4=="1") | (n_ent_1=="3" & n_ent_4=="2") | (n_ent_1=="3" & n_ent_4=="3") | (n_ent_1=="3" & n_ent_4=="5")
drop if (n_ent_2=="3" & n_ent_5=="1") | (n_ent_2=="3" & n_ent_5=="2") | (n_ent_2=="3" & n_ent_5=="3") | (n_ent_2=="3" & n_ent_5=="5")

drop if (n_ent_1=="2" & n_ent_4=="1") | (n_ent_1=="2" & n_ent_4=="2") | (n_ent_1=="2" & n_ent_4=="4")
drop if (n_ent_2=="2" & n_ent_5=="1") | (n_ent_2=="2" & n_ent_5=="2") | (n_ent_2=="2" & n_ent_5=="4") 

drop if (n_ent_1=="1" & n_ent_4=="1") | (n_ent_1=="1" & n_ent_4=="3") | (n_ent_1=="1" & n_ent_4=="5")
drop if (n_ent_2=="1" & n_ent_5=="1") | (n_ent_2=="1" & n_ent_5=="3") | (n_ent_2=="1" & n_ent_5=="5")

drop if (n_ent_1=="5" & n_ent_5=="1") | (n_ent_1=="5" & n_ent_5=="2") | (n_ent_1=="5" & n_ent_5=="3") | (n_ent_1=="5" & n_ent_5=="4") | (n_ent_1=="5" & n_ent_5=="5")

drop if (n_ent_1=="4" & n_ent_5=="1") | (n_ent_1=="4" & n_ent_5=="2") | (n_ent_1=="4" & n_ent_5=="3") | (n_ent_1=="4" & n_ent_5=="4")

drop if (n_ent_1=="3" & n_ent_5=="1") | (n_ent_1=="3" & n_ent_5=="2") | (n_ent_1=="3" & n_ent_5=="3") | (n_ent_1=="3" & n_ent_5=="5")

drop if (n_ent_1=="2" & n_ent_5=="1") | (n_ent_1=="2" & n_ent_5=="2") | (n_ent_1=="2" & n_ent_5=="4") | (n_ent_1=="2" & n_ent_5=="5")

drop if (n_ent_1=="1" & n_ent_5=="1") | (n_ent_1=="1" & n_ent_5=="3") | (n_ent_1=="1" & n_ent_5=="4")

*******************************************************************************
*******************************************************************************
****Aquí se verifica que sean los mismos individuos en las diferentes bases****
*******************************************************************************
*******************************************************************************

*Para comprobar que sean los mismos individuos se realizan dos validaciones:
* 1. Que el sexo de la persona sea el mismo en las 5 entrevistas:
gen prueba1=0
replace prueba1=1 if (d_hombre_1==d_hombre_2 & d_hombre_1==d_hombre_3 & d_hombre_1==d_hombre_4 & d_hombre_1==d_hombre_5) & (d_hombre_1!=. & d_hombre_2!=. & d_hombre_3!=. & d_hombre_4!=. & d_hombre_5!=.)
replace prueba1=1 if (d_hombre_1==d_hombre_2 & d_hombre_1==d_hombre_3 & d_hombre_1==d_hombre_4) & d_hombre_5==.
replace prueba1=1 if (d_hombre_1==d_hombre_2 & d_hombre_1==d_hombre_3) & d_hombre_5==. & d_hombre_4==.
replace prueba1=1 if (d_hombre_1==d_hombre_2) & d_hombre_5==. & d_hombre_4==. & d_hombre_3==.
replace prueba1=1 if d_hombre_5==. & d_hombre_4==. & d_hombre_3==. & d_hombre_2==.

* 2. Que la edad de la persona tenga una diferencia de máximo tres años entre las dos entrevistas:
gen prom_eda=.
replace prom_eda =(eda_1 + eda_2 + eda_3 + eda_4 + eda_5)/5 if eda_1!=. & eda_2!=. & eda_3!=. & eda_4!=. & eda_5!=.
replace prom_eda =(eda_1 + eda_2 + eda_3 + eda_4)/4 if eda_5==.
replace prom_eda =(eda_1 + eda_2 + eda_3)/3 if eda_5==. & eda_4==.
replace prom_eda =(eda_1 + eda_2)/2 if eda_5==. & eda_4==. & eda_3==.
replace prom_eda =eda_1 if eda_5==. & eda_4==. & eda_3==. & eda_2==.

gen dif_1= prom_eda - eda_1
gen dif_2= prom_eda - eda_2
gen dif_3= prom_eda - eda_3
gen dif_4= prom_eda - eda_4
gen dif_5= prom_eda - eda_5

gen prueba2=0
replace prueba2=1 if dif_1<2 & dif_1>-2
replace prueba2=1 if dif_2<2 & dif_2>-2
replace prueba2=1 if dif_3<2 & dif_3>-2
replace prueba2=1 if dif_4<2 & dif_4>-2
replace prueba2=1 if dif_5<2 & dif_5>-2

di in red "Para comprobar que sean los mismos individuos en dos periodos, las dos pruebas tienen que ser 1"
tab prueba1 prueba2

drop if prueba1==0
drop if prueba2==0

drop prom_eda dif_1 dif_2 dif_3 dif_4 dif_5 prueba1 prueba2

*******************************************************************************
*******************************************************************************
********Aqui se generan las variables reales de ingresos (1T 2016=100)*********
*******************************************************************************
*******************************************************************************

scalar def_1=0.652532782
scalar def_2=0.656237106
scalar def_3=0.659234836
scalar def_4=0.667427090
scalar def_5=0.676662870
scalar def_6=0.676747584
scalar def_7=0.682583242
scalar def_8=0.695090147
scalar def_9=0.704406791
scalar def_10=0.703642437
scalar def_11=0.709795773
scalar def_12=0.721576831
scalar def_13=0.731825332
scalar def_14=0.738238586
scalar def_15=0.748695022
scalar def_16=0.766182741
scalar def_17=0.777018465
scalar def_18=0.782255347
scalar def_19=0.787151446
scalar def_20=0.796639444
scalar def_21=0.813951958
scalar def_22=0.813235738
scalar def_23=0.816042860
scalar def_24=0.830482791
scalar def_25=0.842139208
scalar def_26=0.840036854
scalar def_27=0.843532401
scalar def_28=0.859552726
scalar def_29=0.874824804
scalar def_30=0.872504677
scalar def_31=0.882223525
scalar def_32=0.894893486
scalar def_33=0.907077645
scalar def_34=0.911382863
scalar def_35=0.912569450
scalar def_36=0.927570707
scalar def_37=0.944785995
scalar def_38=0.944068459
scalar def_39=0.950411816
scalar def_40=0.966359550
scalar def_41=0.973769439
scalar def_42=0.971792724
scalar def_43=0.975263143
scalar def_44=0.988337940
scalar def_45=1.000000000


gen ingocup_1_def=.
replace ingocup_1_def=ingocup_1/def_`base1'
gen ing_x_hrs_1_def=.
replace ing_x_hrs_1_def=ing_x_hrs_1/def_`base1'

gen ingocup_2_def=.
replace ingocup_2_def=ingocup_2/def_`base2'
gen ing_x_hrs_2_def=.
replace ing_x_hrs_2_def=ing_x_hrs_2/def_`base2'

gen ingocup_3_def=.
replace ingocup_3_def=ingocup_3/def_`base3'
gen ing_x_hrs_3_def=.
replace ing_x_hrs_3_def=ing_x_hrs_3/def_`base3'

gen ingocup_4_def=.
replace ingocup_4_def=ingocup_4/def_`base4'
gen ing_x_hrs_4_def=.
replace ing_x_hrs_4_def=ing_x_hrs_4/def_`base4'

gen ingocup_5_def=.
replace ingocup_5_def=ingocup_5/def_`base5'
gen ing_x_hrs_5_def=.
replace ing_x_hrs_5_def=ing_x_hrs_5/def_`base5'

*******************************************************************************
*******************************************************************************
**************Adición de variables de actividad económica ITAE*****************
*******************************************************************************
*******************************************************************************

*ITAE general (Series desestacionalizadas-variación anual)
merge m:1 ent_1 using "$bases\ITAE_des_VarAnual.dta"
tab _merge
drop _merge
sort foliop

rename itae_des_vanu_`base1'_`base5' desitae_varanu
drop itae*

*ITAE general (Series desestacionalizadas-Promedio movil-variación trimestral)
merge m:1 ent_1 using "$bases\ITAE_des_PromMov_VarTrim.dta"
tab _merge
drop _merge
sort foliop

rename itae_des_prmov_vtrim_`base1'_`base5' desitae_prommov_vartrim
drop itae*

*ITAE general (Series originales-variación anual)
merge m:1 ent_1 using "$bases\ITAE_orig_VarAnual.dta"
tab _merge
drop _merge
sort foliop

rename itae_`base1'_`base5' origitae_varanu
drop itae*

*ITAE primarias (Series originales-variación anual)
merge m:1 ent_1 using "$bases\ITAEprim_orig_VarAnual.dta"
tab _merge
drop _merge
sort foliop

rename itae_prim_`base1'_`base5' origitae_prim_varanu
drop itae*

*ITAE secundarias (Series originales-variación anual)
merge m:1 ent_1 using "$bases\ITAEsec_orig_VarAnual.dta"
tab _merge
drop _merge
sort foliop

rename itae_sec_`base1'_`base5' origitae_sec_varanu
drop itae*

*ITAE terciarias (Series originales-variación anual)
merge m:1 ent_1 using "$bases\ITAEter_orig_VarAnual.dta"
tab _merge
drop _merge
sort foliop

rename itae_ter_`base1'_`base5' origitae_ter_varanu
drop itae*


*******************************************************************************
*******************************************************************************
*******************Generación de variables adicionales*************************
*******************************************************************************
*******************************************************************************
gen d_edad_15_65=0
replace d_edad_15_65=1 if eda_1>=15 & eda_2>=15 & eda_3>=15 & eda_4>=15 & eda_5>=15 & eda_1<=65 & eda_2<=65 & eda_3<=65 & eda_4<=65 & eda_5<=65

gen d_for_1=0
replace d_for_1=1 if d_inf_ss_1==0 
gen d_for_2=0
replace d_for_2=1 if d_inf_ss_2==0 
gen d_for_3=0
replace d_for_3=1 if d_inf_ss_3==0
gen d_for_4=0
replace d_for_4=1 if d_inf_ss_4==0  
gen d_for_5=0
replace d_for_5=1 if d_inf_ss_5==0


gen ocup_chica_1=0
replace ocup_chica_1=1 if ocupado_1==1 & (emple7c_1==1 | emple7c_1==2) 
replace ocup_chica_1=. if emple7c_1==7
gen ocup_med_1=0
replace ocup_med_1=1 if ocupado_1==1 & (emple7c_1==3 | emple7c_1==4)
replace ocup_med_1=. if emple7c_1==7
gen ocup_grande_1=0
replace  ocup_grande_1=1 if ocupado_1==1 & (emple7c_1==5 | emple7c_1==6)
replace ocup_grande_1=. if emple7c_1==7

gen ocup_cons_1=0
replace ocup_cons_1=1 if ocupado_1==1 & rama_1==1
replace ocup_cons_1=. if rama_1==7
gen ocup_manu_1=0
replace ocup_manu_1=1 if ocupado_1==1 & rama_1==2
replace ocup_manu_1=. if rama_1==7
gen ocup_comer_1=0
replace ocup_comer_1=1 if ocupado_1==1 & rama_1==3
replace ocup_comer_1=. if rama_1==7
gen ocup_serv_1=0
replace ocup_serv_1=1 if ocupado_1==1 & rama_1==4
replace ocup_serv_1=. if rama_1==7
gen ocup_agrop_1=0
replace ocup_agrop_1=1 if ocupado_1==1 & rama_1==5
replace ocup_agrop_1=. if rama_1==7
gen ocup_otros_1=0
replace ocup_otros_1=1 if ocupado_1==1 & rama_1==6
replace ocup_otros_1=. if rama_1==7

gen ocup_prim_1=0
replace ocup_prim_1=1 if ocupado_1==1 & rama_est1_1==1
replace ocup_prim_1=. if rama_est1_1==4
gen ocup_sec_1=0
replace ocup_sec_1=1 if ocupado_1==1 & rama_est1_1==2
replace ocup_sec_1=. if rama_est1_1==4
gen ocup_ter_1=0
replace ocup_ter_1=1 if ocupado_1==1 & rama_est1_1==3
replace ocup_ter_1=. if rama_est1_1==4

gen sm_0_1=0
replace sm_0_1=1 if ocupado_1==1 & sal_min_1==1
gen sm_1_1=0
replace sm_1_1=1 if ocupado_1==1 & sal_min_1==2 
gen sm_1a2_1=0
replace sm_1a2_1=1 if ocupado_1==1 & sal_min_1==3
gen sm_2a3_1=0
replace sm_2a3_1=1 if ocupado_1==1 & sal_min_1==4
gen sm_3a5_1=0
replace sm_3a5_1=1 if ocupado_1==1 & sal_min_1==5
gen sm_5_1=0
replace sm_5_1=1 if ocupado_1==1 & sal_min_1==6

gen ocupado=0
replace ocupado=1 if ocupado_1==1

*******************************************************************************
*******************************************************************************
*********************************Etiquetas*************************************
*******************************************************************************
*******************************************************************************

label var d_for_5 "Formal en t=5 (binaria)"
label var d_for_1 "Formal en t=1 (binaria)"
label var sb4_1 "Edad: 15 a 36 (binaria)"
label var sb3_1 "Edad: 37 a 45 (binaria)"
label var sb2_1 "Edad: 46 a 59 (binaria)"
label var sb1_1 "Edad: 60 a 65 (binaria)"
label var d_hombre_1 "Hombre (binaria)"
label var edu_1 "Educacion"
label var eduq_1 "Educación cuad"
label var d_jefe_1 "Jefe de hogar"
label var menor6_1 "Numero de menores de 6 años en hogar"
label var ocup_chica_1 "Empresa chica en t=1 (binaria)"
label var ocup_med_1 "Empresa mediana en t=1 (binaria)"
label var ocup_grande_1 "Empresa grande en t=1 (binaria)"
label var ocup_otros_1 "Sector empresa otros en t=1 (binaria)"
label var ocup_serv_1 "Sector empresa servicios en t=1 (binaria)"
label var ocup_comer_1 "Sector empresa comercio en t=1 (binaria)"
label var ocup_manu_1 "Sector empresa manufactura en t=1 (binaria)"
label var ocup_cons_1 "Sector empresa construccion en t=1 (binaria)"
label var ocup_agrop_1 "Sector empresa agropecuario en t=1 (binaria)"
label var ocup_prim_1 "Sector empresa primario en t=1 (binaria)"
label var ocup_sec_1 "Sector empresa secundario en t=1 (binaria)"
label var ocup_ter_1 "Sector empresa terciario en t=1 (binaria)"
label var desitae_prommov_vartrim "Indicador ITAE"
label var irs_5 "Indice de rezago social"
label var sm_0_1 "Sin pago en empresa en t=1"
label var sm_1_1 "Hasta un salario minimo en empresa en t=1"
label var sm_1a2_1 "De uno a dos salarios minimos en empresa en t=1"
label var sm_2a3_1 "De dos a tres salarios minimos en empresa en t=1"
label var sm_3a5_1 "De tres a cinco salarios minimos en empresa en t=1"
label var sm_5_1 "Mas de cinco salarios minimos en empresa en t=1"

*******************************************************************************
*******************************************************************************
*******************************Transiciones************************************
*******************************************************************************
*******************************************************************************

forvalues i=2/5{

***********************************
***********Transiciones************
***********************************
gen estado_1_`i'=.

*Ocupado en ambos periodos (formal e informal):
replace estado_1_`i'=1 if status_1==1 & status_`i'==1
replace estado_1_`i'=2 if status_1==1 & status_`i'==2
replace estado_1_`i'=3 if status_1==2 & status_`i'==1
replace estado_1_`i'=4 if status_1==2 & status_`i'==2

*No trabajadores en el primer periodo y formales en el segundo periodo:
replace estado_1_`i'=5 if status_1==3 & status_`i'==1
replace estado_1_`i'=6 if status_1==4 & status_`i'==1

*Formales en el primer periodo y no trabajador en el segundo periodo:
replace estado_1_`i'=7 if status_1==1 & status_`i'==3
replace estado_1_`i'=8 if status_1==1 & status_`i'==4

*No trabajadores en el primer periodo e informales en el segundo:
replace estado_1_`i'=9 if status_1==3 & status_`i'==2
replace estado_1_`i'=10 if status_1==4 & status_`i'==2

*Otras
replace estado_1_`i'=11 if status_1==2 & status_`i'==3
replace estado_1_`i'=12 if status_1==2 & status_`i'==4
replace estado_1_`i'=13 if status_1==3 & status_`i'==3
replace estado_1_`i'=14 if status_1==3 & status_`i'==4
replace estado_1_`i'=15 if status_1==4 & status_`i'==3
replace estado_1_`i'=16 if status_1==4 & status_`i'==4

label define estado_1_`i' 1 "For-For" 2 "For-Inf" 3 "Inf-For" 4 "Inf-Inf" 5 "Des-For" 6 "PNEA-For" 7 "For-Des" 8 "For-PNEA" 9 "Des-Inf" 10 "PNEA-Inf" 11 "Inf-Des" 12 "Inf-PNEA" 13 "Des-Des" 14 "Des-PNEA" 15 "PNEA-Des" 16 "PNEA-PNEA"
label value estado_1_`i' estado_1_`i'
}



save "$conc\Panel `base1'_`base5'.dta", replace



}
