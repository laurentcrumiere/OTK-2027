$PBExportHeader$w_diagnos_maj_87033_2.srw
$PBExportComments$gearbox
forward
global type w_diagnos_maj_87033_2 from w_diagnos_maj_ernoult_base
end type
type ole_photo012 from gearbox within w_diagnos_maj_87033_2
end type
type ole_photo013 from gearbox within w_diagnos_maj_87033_2
end type
type ole_photo014 from gearbox within w_diagnos_maj_87033_2
end type
type ole_photo015 from gearbox within w_diagnos_maj_87033_2
end type
type ole_photo017 from gearbox within w_diagnos_maj_87033_2
end type
type ole_photo018 from gearbox within w_diagnos_maj_87033_2
end type
type ole_photo019 from gearbox within w_diagnos_maj_87033_2
end type
type ole_photo016 from gearbox within w_diagnos_maj_87033_2
end type
type ole_photo020 from gearbox within w_diagnos_maj_87033_2
end type
type ole_photo021 from gearbox within w_diagnos_maj_87033_2
end type
type ole_photo022 from gearbox within w_diagnos_maj_87033_2
end type
end forward

global type w_diagnos_maj_87033_2 from w_diagnos_maj_ernoult_base
string tag = "10200"
integer height = 1996
string title = "Page Clinique N°2"
ole_photo012 ole_photo012
ole_photo013 ole_photo013
ole_photo014 ole_photo014
ole_photo015 ole_photo015
ole_photo017 ole_photo017
ole_photo018 ole_photo018
ole_photo019 ole_photo019
ole_photo016 ole_photo016
ole_photo020 ole_photo020
ole_photo021 ole_photo021
ole_photo022 ole_photo022
end type
global w_diagnos_maj_87033_2 w_diagnos_maj_87033_2

forward prototypes
public subroutine load_ctrls ()
public subroutine unload_ctrls ()
end prototypes

public subroutine load_ctrls ();f.lirepage(sle_1,page_buffer[1],2535,50)
f.lirepage(sle_11,page_buffer[1],2585,50)
f.lirepage(sle_3,page_buffer[1],2635,50)
f.lirepage(sle_4,page_buffer[1],2685,50)
f.lirepage(sle_5,page_buffer[1],2735,50)
f.lirepage(sle_6,page_buffer[1],2785,50)
f.lirepage(sle_7,page_buffer[1],2835,50)
f.lirepage(sle_8,page_buffer[1],2885,50)
f.lirepage(sle_9,page_buffer[1],2935,50)
f.lirepage(em_plus_encomb,page_buffer[1],2985,6)
f.lirepage(em_plus_spee,page_buffer[1],2991,6)
f.lirepage(em_plus_leeway,page_buffer[1],2997,6)
f.lirepage(em_plus_repos,page_buffer[1],3003,6)
f.lirepage(em_plus_expans,page_buffer[1],3009,6)
f.lirepage(em_plus_stripping,page_buffer[1],3015,6)
f.lirepage(em_plus_extract,page_buffer[1],3021,6)
f.lirepage(em_moins_encomb,page_buffer[1],3027,6)
f.lirepage(em_moins_spee,page_buffer[1],3033,6)
f.lirepage(em_moins_leeway,page_buffer[1],3039,6)
f.lirepage(em_moins_repos,page_buffer[1],3045,6)
f.lirepage(em_moins_expans,page_buffer[1],3051,6)
f.lirepage(em_moins_stripping,page_buffer[1],3057,6)
f.lirepage(em_moins_extract,page_buffer[1],3063,6)
f.lirepage(mle_resum_diag,page_buffer[1],3069,500)
f.lirepage(mle_resum_plt,page_buffer[1],3569,500)
f.lirepage(mle_resum_cephal,page_buffer[1],4069,500)
f.lirepage(mle_exam,page_buffer[1],4569,500)
// max carac = 5069

resume_diag_generer()
total_1_generer()
total_generer()

end subroutine

public subroutine unload_ctrls ();f.ecrirepage(sle_1,page_buffer[2],2535,50)
f.ecrirepage(sle_11,page_buffer[2],2585,50)
f.ecrirepage(sle_3,page_buffer[2],2635,50)
f.ecrirepage(sle_4,page_buffer[2],2685,50)
f.ecrirepage(sle_5,page_buffer[2],2735,50)
f.ecrirepage(sle_6,page_buffer[2],2785,50)
f.ecrirepage(sle_7,page_buffer[2],2835,50)
f.ecrirepage(sle_8,page_buffer[2],2885,50)
f.ecrirepage(sle_9,page_buffer[2],2935,50)
f.ecrirepage(em_plus_encomb,page_buffer[2],2985,6)
f.ecrirepage(em_plus_spee,page_buffer[2],2991,6)
f.ecrirepage(em_plus_leeway,page_buffer[2],2997,6)
f.ecrirepage(em_plus_repos,page_buffer[2],3003,6)
f.ecrirepage(em_plus_expans,page_buffer[2],3009,6)
f.ecrirepage(em_plus_stripping,page_buffer[2],3015,6)
f.ecrirepage(em_plus_extract,page_buffer[2],3021,6)
f.ecrirepage(em_moins_encomb,page_buffer[2],3027,6)
f.ecrirepage(em_moins_spee,page_buffer[2],3033,6)
f.ecrirepage(em_moins_leeway,page_buffer[2],3039,6)
f.ecrirepage(em_moins_repos,page_buffer[2],3045,6)
f.ecrirepage(em_moins_expans,page_buffer[2],3051,6)
f.ecrirepage(em_moins_stripping,page_buffer[2],3057,6)
f.ecrirepage(em_moins_extract,page_buffer[2],3063,6)
f.ecrirepage(mle_resum_diag,page_buffer[2],3069,500)
f.ecrirepage(mle_resum_plt,page_buffer[2],3569,500)
f.ecrirepage(mle_resum_cephal,page_buffer[2],4069,500)
f.ecrirepage(mle_exam,page_buffer[2],4569,500)
// max carac = 5069

end subroutine

on w_diagnos_maj_87033_2.create
int iCurrent
call super::create
this.ole_photo012=create ole_photo012
this.ole_photo013=create ole_photo013
this.ole_photo014=create ole_photo014
this.ole_photo015=create ole_photo015
this.ole_photo017=create ole_photo017
this.ole_photo018=create ole_photo018
this.ole_photo019=create ole_photo019
this.ole_photo016=create ole_photo016
this.ole_photo020=create ole_photo020
this.ole_photo021=create ole_photo021
this.ole_photo022=create ole_photo022
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.ole_photo012
this.Control[iCurrent+2]=this.ole_photo013
this.Control[iCurrent+3]=this.ole_photo014
this.Control[iCurrent+4]=this.ole_photo015
this.Control[iCurrent+5]=this.ole_photo017
this.Control[iCurrent+6]=this.ole_photo018
this.Control[iCurrent+7]=this.ole_photo019
this.Control[iCurrent+8]=this.ole_photo016
this.Control[iCurrent+9]=this.ole_photo020
this.Control[iCurrent+10]=this.ole_photo021
this.Control[iCurrent+11]=this.ole_photo022
end on

on w_diagnos_maj_87033_2.destroy
call super::destroy
destroy(this.ole_photo012)
destroy(this.ole_photo013)
destroy(this.ole_photo014)
destroy(this.ole_photo015)
destroy(this.ole_photo017)
destroy(this.ole_photo018)
destroy(this.ole_photo019)
destroy(this.ole_photo016)
destroy(this.ole_photo020)
destroy(this.ole_photo021)
destroy(this.ole_photo022)
end on

type pb_suivant from w_diagnos_maj_ernoult_base`pb_suivant within w_diagnos_maj_87033_2
string tag = "87033_3"
integer x = 3374
integer y = 1752
end type

type pb_precedant from w_diagnos_maj_ernoult_base`pb_precedant within w_diagnos_maj_87033_2
string tag = "87033_1"
integer x = 3209
integer y = 1752
end type

type cb_imprimer from w_diagnos_maj_ernoult_base`cb_imprimer within w_diagnos_maj_87033_2
integer x = 1454
integer y = 1752
end type

type cb_sauver from w_diagnos_maj_ernoult_base`cb_sauver within w_diagnos_maj_87033_2
integer x = 2331
integer y = 1752
end type

type cb_annuler from w_diagnos_maj_ernoult_base`cb_annuler within w_diagnos_maj_87033_2
integer x = 1893
integer y = 1752
end type

type cb_fermer from w_diagnos_maj_ernoult_base`cb_fermer within w_diagnos_maj_87033_2
integer x = 2770
integer y = 1752
end type

type sle_1 from w_diagnos_maj_ernoult_base`sle_1 within w_diagnos_maj_87033_2
end type

type sle_11 from w_diagnos_maj_ernoult_base`sle_11 within w_diagnos_maj_87033_2
end type

type sle_3 from w_diagnos_maj_ernoult_base`sle_3 within w_diagnos_maj_87033_2
end type

type sle_4 from w_diagnos_maj_ernoult_base`sle_4 within w_diagnos_maj_87033_2
end type

type sle_5 from w_diagnos_maj_ernoult_base`sle_5 within w_diagnos_maj_87033_2
end type

type sle_6 from w_diagnos_maj_ernoult_base`sle_6 within w_diagnos_maj_87033_2
end type

type sle_7 from w_diagnos_maj_ernoult_base`sle_7 within w_diagnos_maj_87033_2
end type

type sle_8 from w_diagnos_maj_ernoult_base`sle_8 within w_diagnos_maj_87033_2
end type

type sle_9 from w_diagnos_maj_ernoult_base`sle_9 within w_diagnos_maj_87033_2
end type

type st_1 from w_diagnos_maj_ernoult_base`st_1 within w_diagnos_maj_87033_2
end type

type st_2 from w_diagnos_maj_ernoult_base`st_2 within w_diagnos_maj_87033_2
end type

type st_3 from w_diagnos_maj_ernoult_base`st_3 within w_diagnos_maj_87033_2
end type

type st_4 from w_diagnos_maj_ernoult_base`st_4 within w_diagnos_maj_87033_2
end type

type st_5 from w_diagnos_maj_ernoult_base`st_5 within w_diagnos_maj_87033_2
end type

type st_6 from w_diagnos_maj_ernoult_base`st_6 within w_diagnos_maj_87033_2
end type

type st_7 from w_diagnos_maj_ernoult_base`st_7 within w_diagnos_maj_87033_2
end type

type st_8 from w_diagnos_maj_ernoult_base`st_8 within w_diagnos_maj_87033_2
end type

type st_9 from w_diagnos_maj_ernoult_base`st_9 within w_diagnos_maj_87033_2
end type

type st_10 from w_diagnos_maj_ernoult_base`st_10 within w_diagnos_maj_87033_2
end type

type st_11 from w_diagnos_maj_ernoult_base`st_11 within w_diagnos_maj_87033_2
end type

type st_12 from w_diagnos_maj_ernoult_base`st_12 within w_diagnos_maj_87033_2
end type

type em_plus_encomb from w_diagnos_maj_ernoult_base`em_plus_encomb within w_diagnos_maj_87033_2
end type

type em_plus_spee from w_diagnos_maj_ernoult_base`em_plus_spee within w_diagnos_maj_87033_2
end type

type em_plus_leeway from w_diagnos_maj_ernoult_base`em_plus_leeway within w_diagnos_maj_87033_2
end type

type em_plus_repos from w_diagnos_maj_ernoult_base`em_plus_repos within w_diagnos_maj_87033_2
end type

type em_plus_expans from w_diagnos_maj_ernoult_base`em_plus_expans within w_diagnos_maj_87033_2
end type

type em_plus_stripping from w_diagnos_maj_ernoult_base`em_plus_stripping within w_diagnos_maj_87033_2
end type

type em_plus_extract from w_diagnos_maj_ernoult_base`em_plus_extract within w_diagnos_maj_87033_2
end type

type em_moins_encomb from w_diagnos_maj_ernoult_base`em_moins_encomb within w_diagnos_maj_87033_2
end type

type em_moins_spee from w_diagnos_maj_ernoult_base`em_moins_spee within w_diagnos_maj_87033_2
end type

type em_moins_leeway from w_diagnos_maj_ernoult_base`em_moins_leeway within w_diagnos_maj_87033_2
end type

type em_moins_repos from w_diagnos_maj_ernoult_base`em_moins_repos within w_diagnos_maj_87033_2
end type

type em_moins_expans from w_diagnos_maj_ernoult_base`em_moins_expans within w_diagnos_maj_87033_2
end type

type em_moins_stripping from w_diagnos_maj_ernoult_base`em_moins_stripping within w_diagnos_maj_87033_2
end type

type em_moins_extract from w_diagnos_maj_ernoult_base`em_moins_extract within w_diagnos_maj_87033_2
end type

type st_total_1 from w_diagnos_maj_ernoult_base`st_total_1 within w_diagnos_maj_87033_2
end type

type st_total from w_diagnos_maj_ernoult_base`st_total within w_diagnos_maj_87033_2
end type

type mle_resum_diag from w_diagnos_maj_ernoult_base`mle_resum_diag within w_diagnos_maj_87033_2
integer x = 55
end type

type mle_resum_plt from w_diagnos_maj_ernoult_base`mle_resum_plt within w_diagnos_maj_87033_2
integer x = 960
end type

type st_17 from w_diagnos_maj_ernoult_base`st_17 within w_diagnos_maj_87033_2
integer x = 82
end type

type st_18 from w_diagnos_maj_ernoult_base`st_18 within w_diagnos_maj_87033_2
integer x = 987
end type

type st_19 from w_diagnos_maj_ernoult_base`st_19 within w_diagnos_maj_87033_2
integer x = 82
end type

type mle_resum_cephal from w_diagnos_maj_ernoult_base`mle_resum_cephal within w_diagnos_maj_87033_2
integer x = 55
integer height = 420
end type

type cb_odrade from w_diagnos_maj_ernoult_base`cb_odrade within w_diagnos_maj_87033_2
integer x = 1454
integer y = 1464
end type

event cb_odrade::clicked;call super::clicked;odrade_recup( 21, 22, mle_resum_cephal )
end event

type cb_transferer from w_diagnos_maj_ernoult_base`cb_transferer within w_diagnos_maj_87033_2
integer x = 1454
end type

type mle_exam from w_diagnos_maj_ernoult_base`mle_exam within w_diagnos_maj_87033_2
integer x = 1893
integer y = 1560
end type

type st_13 from w_diagnos_maj_ernoult_base`st_13 within w_diagnos_maj_87033_2
integer x = 1920
integer y = 1464
end type

type cb_1 from w_diagnos_maj_ernoult_base`cb_1 within w_diagnos_maj_87033_2
integer x = 1454
integer y = 1608
end type

type cb_transferer_exam_fonc from w_diagnos_maj_ernoult_base`cb_transferer_exam_fonc within w_diagnos_maj_87033_2
integer x = 2715
integer y = 1440
end type

type gb_1 from w_diagnos_maj_ernoult_base`gb_1 within w_diagnos_maj_87033_2
end type

type ole_photo012 from gearbox within w_diagnos_maj_87033_2
string tag = "{EF/REP}"
integer x = 2935
integer y = 24
integer width = 521
integer height = 360
boolean bringtotop = true
borderstyle borderstyle = stylelowered!
boolean vignette = true
end type

on ole_photo012.destroy
call gearbox::destroy
end on

type ole_photo013 from gearbox within w_diagnos_maj_87033_2
string tag = "{EFS/REP}"
integer x = 2935
integer y = 576
integer width = 521
integer height = 360
boolean bringtotop = true
borderstyle borderstyle = stylelowered!
boolean vignette = true
end type

on ole_photo013.destroy
call gearbox::destroy
end on

type ole_photo014 from gearbox within w_diagnos_maj_87033_2
string tag = "{EPD/REP}"
integer x = 2359
integer y = 24
integer width = 521
integer height = 360
boolean bringtotop = true
borderstyle borderstyle = stylelowered!
boolean vignette = true
end type

on ole_photo014.destroy
call gearbox::destroy
end on

type ole_photo015 from gearbox within w_diagnos_maj_87033_2
string tag = "{ID/REP}"
integer x = 55
integer y = 24
integer width = 521
integer height = 360
boolean bringtotop = true
borderstyle borderstyle = stylelowered!
boolean vignette = true
end type

on ole_photo015.destroy
call gearbox::destroy
end on

type ole_photo017 from gearbox within w_diagnos_maj_87033_2
string tag = "{IG/REP}"
integer x = 1207
integer y = 24
integer width = 521
integer height = 360
boolean bringtotop = true
borderstyle borderstyle = stylelowered!
boolean vignette = true
end type

on ole_photo017.destroy
call gearbox::destroy
end on

type ole_photo018 from gearbox within w_diagnos_maj_87033_2
string tag = "{IH/REP}"
integer x = 55
integer y = 480
integer width = 521
integer height = 360
boolean bringtotop = true
borderstyle borderstyle = stylelowered!
boolean vignette = true
end type

on ole_photo018.destroy
call gearbox::destroy
end on

type ole_photo019 from gearbox within w_diagnos_maj_87033_2
string tag = "{IB/REP}"
integer x = 631
integer y = 480
integer width = 521
integer height = 360
boolean bringtotop = true
borderstyle borderstyle = stylelowered!
boolean vignette = true
end type

on ole_photo019.destroy
call gearbox::destroy
end on

type ole_photo016 from gearbox within w_diagnos_maj_87033_2
string tag = "{IF/REP}"
integer x = 631
integer y = 24
integer width = 521
integer height = 360
boolean bringtotop = true
borderstyle borderstyle = stylelowered!
boolean vignette = true
end type

on ole_photo016.destroy
call gearbox::destroy
end on

type ole_photo020 from gearbox within w_diagnos_maj_87033_2
string tag = "{RPA/REP}"
integer x = 1783
integer y = 24
integer width = 521
integer height = 360
boolean bringtotop = true
borderstyle borderstyle = stylelowered!
boolean vignette = true
end type

on ole_photo020.destroy
call gearbox::destroy
end on

type ole_photo021 from gearbox within w_diagnos_maj_87033_2
string tag = "{OTC/REP}"
integer x = 2935
integer y = 984
integer width = 521
integer height = 360
boolean bringtotop = true
borderstyle borderstyle = stylelowered!
boolean vignette = true
end type

on ole_photo021.destroy
call gearbox::destroy
end on

type ole_photo022 from gearbox within w_diagnos_maj_87033_2
string tag = "{OTM/REP}"
integer x = 1207
integer y = 480
integer width = 521
integer height = 360
boolean bringtotop = true
borderstyle borderstyle = stylelowered!
boolean vignette = true
end type

on ole_photo022.destroy
call gearbox::destroy
end on

