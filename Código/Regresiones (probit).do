clear
clear matrix
set mem 500m
set more off
cap log close

gl bases="D:\Mis Documentos\Stata\ENOE\Proyectos\Páneles\Concentrado por panel"
gl resultados="D:\Mis Documentos\Stata\ENOE\Proyectos\Páneles\Resultados Probit"


forvalues base1=31/41{

local base2 = `base1' + 1
local base3 = `base1' + 2
local base4 = `base1' + 3
local base5 = `base1' + 4

use "$bases\Panel `base1'_`base5'.dta", clear

di in red "Se está utilizando la base: `base1' - `base5'"


***********************************
**********Correlaciones************
***********************************

*corr d_for_5 d_for_1 sb2_1 sb3_1 sb4_1 d_hombre_1 edu_1 eduq_1 d_jefe_1 menor6_1 ocup_med_1 ocup_grande_1 ocup_otros_1 ocup_serv_1 ocup_comer_1 ocup_manu_1 ocup_cons_1 desitae_prommov_vartrim irs_5 d_rural_1 if n_ent_1=="1" & d_edad_15_65==1


***********************************************
*******Probit (sólo toda la población)*********
***********************************************

*probit d_for_5 d_for_1 sb2_1 sb3_1 sb4_1 d_hombre_1 edu_1 eduq_1 d_jefe_1 menor6_1 ocup_med_1 ocup_grande_1 ocup_otros_1 ocup_serv_1 ocup_comer_1 ocup_manu_1 ocup_cons_1 desitae_prommov_vartrim irs_5 if n_ent_1=="1" & d_edad_15_65==1, robust
*estat classification
*outreg2 using "$resultados\Probit(toda la pob).xls", label append ctitle(Probit) addstat(Log-verosimilitud,`e(ll)',Pseudo R-squared,`e(r2_p)',Porcentaje predicho correctamente,`r(P_corr)') dec(4)
*outreg2 using "$resultados\Probit-Summarize(toda la pob).xls", sum label append dec(4)
*mfx compute
*outreg2 using "$resultados\Marginal-Probit(toda la pob).xls", mfx label append ctitle(Marginal) addstat(Probabilidad formal en t=5 (dado X promedio),`e(Xmfx_y)') dec(4)

***********************************************
***********Probit (sólo ocupados)**************
***********************************************
probit d_for_5 d_for_1 sb2_1 sb3_1 sb4_1 d_hombre_1 edu_1 eduq_1 d_jefe_1 menor6_1 ocup_med_1 ocup_grande_1 ocup_otros_1 ocup_serv_1 ocup_comer_1 ocup_manu_1 ocup_cons_1 desitae_prommov_vartrim irs_5 if n_ent_1=="1" & d_edad_15_65==1 & ocupado_1==1 & ocupado_5==1, robust
estat classification
outreg2 using "$resultados\Probit(ocupados).xls", label append ctitle(Probit) addstat(Log-verosimilitud,`e(ll)',Pseudo R-squared,`e(r2_p)',Porcentaje predicho correctamente,`r(P_corr)') dec(4)
outreg2 using "$resultados\Probit-Summarize(ocupados).xls", sum label append dec(4)
mfx compute
outreg2 using "$resultados\Marginal-Probit(ocupados).xls", mfx label append ctitle(Marginal) addstat(Probabilidad formal en t=5 (dado X promedio),`e(Xmfx_y)') dec(4)


}
use "$bases\Panel 41_45.dta", clear
set more off

***********************************************
**********Probit(toda la población)************
***********************************************

*Regresión completa
probit d_for_5 d_for_1 sb2_1 sb3_1 sb4_1 d_hombre_1 edu_1 eduq_1 d_jefe_1 menor6_1 ocup_med_1 ocup_grande_1 ocup_otros_1 ocup_serv_1 ocup_comer_1 ocup_manu_1 ocup_cons_1 desitae_prommov_vartrim irs_1 if n_ent_1=="1" & d_edad_15_65==1, robust
estat classification
outreg2 using "$resultados\Probit (Panel 41_45).xls", label append ctitle(Probit) addstat(Log-verosimilitud,`e(ll)',Pseudo R-squared,`e(r2_p)',Porcentaje predicho correctamente,`r(P_corr)') dec(4)
outreg2 using "$resultados\Probit-Summarize (Panel 41_45).xls", sum label append dec(4)
mfx compute
outreg2 using "$resultados\Marginal-Probit (Panel 41_45).xls", mfx label append ctitle(Marginal) addstat(Probabilidad formal en t=5 (dado X promedio),`e(Xmfx_y)') dec(4)

*Regresión sin dummie de formalidad en primera entrevista
probit d_for_5 sb2_1 sb3_1 sb4_1 d_hombre_1 edu_1 eduq_1 d_jefe_1 menor6_1 ocup_med_1 ocup_grande_1 ocup_otros_1 ocup_serv_1 ocup_comer_1 ocup_manu_1 ocup_cons_1 desitae_prommov_vartrim irs_1 if n_ent_1=="1" & d_edad_15_65==1, robust
estat classification
outreg2 using "$resultados\Probit (Panel 41_45).xls", label append ctitle(Probit) addstat(Log-verosimilitud,`e(ll)',Pseudo R-squared,`e(r2_p)',Porcentaje predicho correctamente,`r(P_corr)') dec(4)
outreg2 using "$resultados\Probit-Summarize (Panel 41_45).xls", sum label append dec(4)
mfx compute
outreg2 using "$resultados\Marginal-Probit (Panel 41_45).xls", mfx label append ctitle(Marginal) addstat(Probabilidad formal en t=5 (dado X promedio),`e(Xmfx_y)') dec(4)

*Regresión con área geográfica (rural y urbano)
probit d_for_5 d_for_1 sb2_1 sb3_1 sb4_1 d_hombre_1 edu_1 eduq_1 d_jefe_1 menor6_1 ocup_med_1 ocup_grande_1 ocup_otros_1 ocup_serv_1 ocup_comer_1 ocup_manu_1 ocup_cons_1 desitae_prommov_vartrim d_urbano_1 if n_ent_1=="1" & d_edad_15_65==1  & irs_1!=., robust
estat classification
outreg2 using "$resultados\Probit (Panel 41_45).xls", label append ctitle(Probit) addstat(Log-verosimilitud,`e(ll)',Pseudo R-squared,`e(r2_p)',Porcentaje predicho correctamente,`r(P_corr)') dec(4)
outreg2 using "$resultados\Probit-Summarize (Panel 41_45).xls", sum label append dec(4)
mfx compute
outreg2 using "$resultados\Marginal-Probit (Panel 41_45).xls", mfx label append ctitle(Marginal) addstat(Probabilidad formal en t=5 (dado X promedio),`e(Xmfx_y)') dec(4)

*Regresión con dummie para número de hijos (rural y urbano)
probit d_for_5 d_for_1 sb2_1 sb3_1 sb4_1 d_hombre_1 edu_1 eduq_1 d_jefe_1 d_menor6_1 ocup_med_1 ocup_grande_1 ocup_otros_1 ocup_serv_1 ocup_comer_1 ocup_manu_1 ocup_cons_1 desitae_prommov_vartrim irs_1 if n_ent_1=="1" & d_edad_15_65==1, robust
estat classification
outreg2 using "$resultados\Probit (Panel 41_45).xls", label append ctitle(Probit) addstat(Log-verosimilitud,`e(ll)',Pseudo R-squared,`e(r2_p)',Porcentaje predicho correctamente,`r(P_corr)') dec(4)
outreg2 using "$resultados\Probit-Summarize (Panel 41_45).xls", sum label append dec(4)
mfx compute
outreg2 using "$resultados\Marginal-Probit (Panel 41_45).xls", mfx label append ctitle(Marginal) addstat(Probabilidad formal en t=5 (dado X promedio),`e(Xmfx_y)') dec(4)

*Regresión con sector de actividad (primario, secundario y terciario)
probit d_for_5 d_for_1 sb2_1 sb3_1 sb4_1 d_hombre_1 edu_1 eduq_1 d_jefe_1 menor6_1 ocup_med_1 ocup_grande_1 ocup_sec_1 ocup_ter_1 desitae_prommov_vartrim irs_1 if n_ent_1=="1" & d_edad_15_65==1, robust
estat classification
outreg2 using "$resultados\Probit (Panel 41_45).xls", label append ctitle(Probit) addstat(Log-verosimilitud,`e(ll)',Pseudo R-squared,`e(r2_p)',Porcentaje predicho correctamente,`r(P_corr)') dec(4)
outreg2 using "$resultados\Probit-Summarize (Panel 41_45).xls", sum label append dec(4)
mfx compute
outreg2 using "$resultados\Marginal-Probit (Panel 41_45).xls", mfx label append ctitle(Marginal) addstat(Probabilidad formal en t=5 (dado X promedio),`e(Xmfx_y)') dec(4)

***********************************************
*********Probit (sólo trabajadores)************
***********************************************

*Regresión completa
probit d_for_5 d_for_1 sb2_1 sb3_1 sb4_1 d_hombre_1 edu_1 eduq_1 d_jefe_1 menor6_1 *sm_1a2_1 sm_2a3_1 sm_3a5_1 sm_5_1 ocup_med_1 ocup_grande_1 ocup_otros_1 ocup_serv_1 ocup_comer_1 ocup_manu_1 ocup_cons_1 desitae_prommov_vartrim irs_1 if n_ent_1=="1" & d_edad_15_65==1 & ocupado_1==1 & ocupado_5==1, robust
estat classification
outreg2 using "$resultados\Probit (Panel 41_45).xls", label append ctitle(Probit) addstat(Log-verosimilitud,`e(ll)',Pseudo R-squared,`e(r2_p)',Porcentaje predicho correctamente,`r(P_corr)') dec(4)
outreg2 using "$resultados\Probit-Summarize (Panel 41_45).xls", sum label append dec(4)
	
outreg2 using "$resultados\Marginal-Probit (Panel 41_45).xls", mfx label append ctitle(Marginal) addstat(Probabilidad formal en t=5 (dado X promedio),`e(Xmfx_y)') dec(4)

*Regresión sin dummie de formalidad en primera entrevista
probit d_for_5 sb2_1 sb3_1 sb4_1 d_hombre_1 edu_1 eduq_1 d_jefe_1 menor6_1 ocup_med_1 ocup_grande_1 ocup_otros_1 ocup_serv_1 ocup_comer_1 ocup_manu_1 ocup_cons_1 desitae_prommov_vartrim irs_1 if n_ent_1=="1" & d_edad_15_65==1 & ocupado_1==1 & ocupado_5==1, robust
estat classification
outreg2 using "$resultados\Probit (Panel 41_45).xls", label append ctitle(Probit) addstat(Log-verosimilitud,`e(ll)',Pseudo R-squared,`e(r2_p)',Porcentaje predicho correctamente,`r(P_corr)') dec(4)
outreg2 using "$resultados\Probit-Summarize (Panel 41_45).xls", sum label append dec(4)
mfx compute
outreg2 using "$resultados\Marginal-Probit (Panel 41_45).xls", mfx label append ctitle(Marginal) addstat(Probabilidad formal en t=5 (dado X promedio),`e(Xmfx_y)') dec(4)

*Regresión con área geográfica (rural y urbano)
probit d_for_5 d_for_1 sb2_1 sb3_1 sb4_1 d_hombre_1 edu_1 eduq_1 d_jefe_1 menor6_1 ocup_med_1 ocup_grande_1 ocup_otros_1 ocup_serv_1 ocup_comer_1 ocup_manu_1 ocup_cons_1 desitae_prommov_vartrim d_urbano_1 if n_ent_1=="1" & d_edad_15_65==1 & irs_1!=. & ocupado_1==1 & ocupado_5==1, robust
estat classification
outreg2 using "$resultados\Probit (Panel 41_45).xls", label append ctitle(Probit) addstat(Log-verosimilitud,`e(ll)',Pseudo R-squared,`e(r2_p)',Porcentaje predicho correctamente,`r(P_corr)') dec(4)
outreg2 using "$resultados\Probit-Summarize (Panel 41_45).xls", sum label append dec(4)
mfx compute
outreg2 using "$resultados\Marginal-Probit (Panel 41_45).xls", mfx label append ctitle(Marginal) addstat(Probabilidad formal en t=5 (dado X promedio),`e(Xmfx_y)') dec(4)

*Regresión con dummie para número de hijos (rural y urbano)
probit d_for_5 d_for_1 sb2_1 sb3_1 sb4_1 d_hombre_1 edu_1 eduq_1 d_jefe_1 d_menor6_1 ocup_med_1 ocup_grande_1 ocup_otros_1 ocup_serv_1 ocup_comer_1 ocup_manu_1 ocup_cons_1 desitae_prommov_vartrim irs_1 if n_ent_1=="1" & d_edad_15_65==1 & ocupado_1==1 & ocupado_5==1, robust
estat classification
outreg2 using "$resultados\Probit (Panel 41_45).xls", label append ctitle(Probit) addstat(Log-verosimilitud,`e(ll)',Pseudo R-squared,`e(r2_p)',Porcentaje predicho correctamente,`r(P_corr)') dec(4)
outreg2 using "$resultados\Probit-Summarize (Panel 41_45).xls", sum label append dec(4)
mfx compute
outreg2 using "$resultados\Marginal-Probit (Panel 41_45).xls", mfx label append ctitle(Marginal) addstat(Probabilidad formal en t=5 (dado X promedio),`e(Xmfx_y)') dec(4)

*Regresión con sector de actividad (primario, secundario y terciario)
probit d_for_5 d_for_1 sb2_1 sb3_1 sb4_1 d_hombre_1 edu_1 eduq_1 d_jefe_1 menor6_1 ocup_med_1 ocup_grande_1 ocup_sec_1 ocup_ter_1 desitae_prommov_vartrim irs_1 if n_ent_1=="1" & d_edad_15_65==1 & ocupado_1==1 & ocupado_5==1, robust
estat classification
outreg2 using "$resultados\Probit (Panel 41_45).xls", label append ctitle(Probit) addstat(Log-verosimilitud,`e(ll)',Pseudo R-squared,`e(r2_p)',Porcentaje predicho correctamente,`r(P_corr)') dec(4)
outreg2 using "$resultados\Probit-Summarize (Panel 41_45).xls", sum label append dec(4)
mfx compute
outreg2 using "$resultados\Marginal-Probit (Panel 41_45).xls", mfx label append ctitle(Marginal) addstat(Probabilidad formal en t=5 (dado X promedio),`e(Xmfx_y)') dec(4)

