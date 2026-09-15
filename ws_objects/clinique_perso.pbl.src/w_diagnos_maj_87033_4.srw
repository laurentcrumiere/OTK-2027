$PBExportHeader$w_diagnos_maj_87033_4.srw
$PBExportComments$gearbox
forward
global type w_diagnos_maj_87033_4 from w_diagnos_maj_ernoult_base
end type
type ole_photo034 from gearbox within w_diagnos_maj_87033_4
end type
type ole_photo035 from gearbox within w_diagnos_maj_87033_4
end type
type ole_photo036 from gearbox within w_diagnos_maj_87033_4
end type
type ole_photo037 from gearbox within w_diagnos_maj_87033_4
end type
type ole_photo039 from gearbox within w_diagnos_maj_87033_4
end type
type ole_photo040 from gearbox within w_diagnos_maj_87033_4
end type
type ole_photo041 from gearbox within w_diagnos_maj_87033_4
end type
type ole_photo038 from gearbox within w_diagnos_maj_87033_4
end type
type ole_photo042 from gearbox within w_diagnos_maj_87033_4
end type
type ole_photo043 from gearbox within w_diagnos_maj_87033_4
end type
type ole_photo044 from gearbox within w_diagnos_maj_87033_4
end type
end forward

global type w_diagnos_maj_87033_4 from w_diagnos_maj_ernoult_base
string tag = "10200"
integer height = 1996
string title = "Page Clinique N°4"
ole_photo034 ole_photo034
ole_photo035 ole_photo035
ole_photo036 ole_photo036
ole_photo037 ole_photo037
ole_photo039 ole_photo039
ole_photo040 ole_photo040
ole_photo041 ole_photo041
ole_photo038 ole_photo038
ole_photo042 ole_photo042
ole_photo043 ole_photo043
ole_photo044 ole_photo044
end type
global w_diagnos_maj_87033_4 w_diagnos_maj_87033_4

forward prototypes
public subroutine load_ctrls ()
public subroutine unload_ctrls ()
end prototypes

public subroutine load_ctrls ();f.lirepage(sle_1,page_buffer[1],7603,50)
f.lirepage(sle_11,page_buffer[1],7653,50)
f.lirepage(sle_3,page_buffer[1],7703,50)
f.lirepage(sle_4,page_buffer[1],7753,50)
f.lirepage(sle_5,page_buffer[1],7803,50)
f.lirepage(sle_6,page_buffer[1],7853,50)
f.lirepage(sle_7,page_buffer[1],7903,50)
f.lirepage(sle_8,page_buffer[1],7953,50)
f.lirepage(sle_9,page_buffer[1],8003,50)
f.lirepage(em_plus_encomb,page_buffer[1],8053,6)
f.lirepage(em_plus_spee,page_buffer[1],8059,6)
f.lirepage(em_plus_leeway,page_buffer[1],8065,6)
f.lirepage(em_plus_repos,page_buffer[1],8071,6)
f.lirepage(em_plus_expans,page_buffer[1],8077,6)
f.lirepage(em_plus_stripping,page_buffer[1],8083,6)
f.lirepage(em_plus_extract,page_buffer[1],8089,6)
f.lirepage(em_moins_encomb,page_buffer[1],8095,6)
f.lirepage(em_moins_spee,page_buffer[1],8101,6)
f.lirepage(em_moins_leeway,page_buffer[1],8107,6)
f.lirepage(em_moins_repos,page_buffer[1],8113,6)
f.lirepage(em_moins_expans,page_buffer[1],8119,6)
f.lirepage(em_moins_stripping,page_buffer[1],8125,6)
f.lirepage(em_moins_extract,page_buffer[1],8131,6)
f.lirepage(mle_resum_diag,page_buffer[1],8137,500)
f.lirepage(mle_resum_plt,page_buffer[1],8637,500)
f.lirepage(mle_resum_cephal,page_buffer[1],9137,500)
f.lirepage(mle_exam,page_buffer[1],9637,500)
// max carac = 10137


resume_diag_generer()
total_1_generer()
total_generer()

end subroutine

public subroutine unload_ctrls ();f.ecrirepage(sle_1,page_buffer[2],7603,50)
f.ecrirepage(sle_11,page_buffer[2],7653,50)
f.ecrirepage(sle_3,page_buffer[2],7703,50)
f.ecrirepage(sle_4,page_buffer[2],7753,50)
f.ecrirepage(sle_5,page_buffer[2],7803,50)
f.ecrirepage(sle_6,page_buffer[2],7853,50)
f.ecrirepage(sle_7,page_buffer[2],7903,50)
f.ecrirepage(sle_8,page_buffer[2],7953,50)
f.ecrirepage(sle_9,page_buffer[2],8003,50)
f.ecrirepage(em_plus_encomb,page_buffer[2],8053,6)
f.ecrirepage(em_plus_spee,page_buffer[2],8059,6)
f.ecrirepage(em_plus_leeway,page_buffer[2],8065,6)
f.ecrirepage(em_plus_repos,page_buffer[2],8071,6)
f.ecrirepage(em_plus_expans,page_buffer[2],8077,6)
f.ecrirepage(em_plus_stripping,page_buffer[2],8083,6)
f.ecrirepage(em_plus_extract,page_buffer[2],8089,6)
f.ecrirepage(em_moins_encomb,page_buffer[2],8095,6)
f.ecrirepage(em_moins_spee,page_buffer[2],8101,6)
f.ecrirepage(em_moins_leeway,page_buffer[2],8107,6)
f.ecrirepage(em_moins_repos,page_buffer[2],8113,6)
f.ecrirepage(em_moins_expans,page_buffer[2],8119,6)
f.ecrirepage(em_moins_stripping,page_buffer[2],8125,6)
f.ecrirepage(em_moins_extract,page_buffer[2],8131,6)
f.ecrirepage(mle_resum_diag,page_buffer[2],8137,500)
f.ecrirepage(mle_resum_plt,page_buffer[2],8637,500)
f.ecrirepage(mle_resum_cephal,page_buffer[2],9137,500)
f.ecrirepage(mle_exam,page_buffer[2],9637,500)
// max carac = 10137

end subroutine

on w_diagnos_maj_87033_4.create
int iCurrent
call super::create
this.ole_photo034=create ole_photo034
this.ole_photo035=create ole_photo035
this.ole_photo036=create ole_photo036
this.ole_photo037=create ole_photo037
this.ole_photo039=create ole_photo039
this.ole_photo040=create ole_photo040
this.ole_photo041=create ole_photo041
this.ole_photo038=create ole_photo038
this.ole_photo042=create ole_photo042
this.ole_photo043=create ole_photo043
this.ole_photo044=create ole_photo044
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.ole_photo034
this.Control[iCurrent+2]=this.ole_photo035
this.Control[iCurrent+3]=this.ole_photo036
this.Control[iCurrent+4]=this.ole_photo037
this.Control[iCurrent+5]=this.ole_photo039
this.Control[iCurrent+6]=this.ole_photo040
this.Control[iCurrent+7]=this.ole_photo041
this.Control[iCurrent+8]=this.ole_photo038
this.Control[iCurrent+9]=this.ole_photo042
this.Control[iCurrent+10]=this.ole_photo043
this.Control[iCurrent+11]=this.ole_photo044
end on

on w_diagnos_maj_87033_4.destroy
call super::destroy
destroy(this.ole_photo034)
destroy(this.ole_photo035)
destroy(this.ole_photo036)
destroy(this.ole_photo037)
destroy(this.ole_photo039)
destroy(this.ole_photo040)
destroy(this.ole_photo041)
destroy(this.ole_photo038)
destroy(this.ole_photo042)
destroy(this.ole_photo043)
destroy(this.ole_photo044)
end on

type pb_suivant from w_diagnos_maj_ernoult_base`pb_suivant within w_diagnos_maj_87033_4
string tag = "87033_5"
integer x = 3374
integer y = 1752
end type

type pb_precedant from w_diagnos_maj_ernoult_base`pb_precedant within w_diagnos_maj_87033_4
string tag = "87033_3"
integer x = 3209
integer y = 1752
end type

type cb_imprimer from w_diagnos_maj_ernoult_base`cb_imprimer within w_diagnos_maj_87033_4
integer x = 1454
integer y = 1752
end type

type cb_sauver from w_diagnos_maj_ernoult_base`cb_sauver within w_diagnos_maj_87033_4
integer x = 2331
integer y = 1752
end type

type cb_annuler from w_diagnos_maj_ernoult_base`cb_annuler within w_diagnos_maj_87033_4
integer x = 1893
integer y = 1752
end type

type cb_fermer from w_diagnos_maj_ernoult_base`cb_fermer within w_diagnos_maj_87033_4
integer x = 2770
integer y = 1752
end type

type sle_1 from w_diagnos_maj_ernoult_base`sle_1 within w_diagnos_maj_87033_4
end type

type sle_11 from w_diagnos_maj_ernoult_base`sle_11 within w_diagnos_maj_87033_4
end type

type sle_3 from w_diagnos_maj_ernoult_base`sle_3 within w_diagnos_maj_87033_4
end type

type sle_4 from w_diagnos_maj_ernoult_base`sle_4 within w_diagnos_maj_87033_4
end type

type sle_5 from w_diagnos_maj_ernoult_base`sle_5 within w_diagnos_maj_87033_4
end type

type sle_6 from w_diagnos_maj_ernoult_base`sle_6 within w_diagnos_maj_87033_4
end type

type sle_7 from w_diagnos_maj_ernoult_base`sle_7 within w_diagnos_maj_87033_4
end type

type sle_8 from w_diagnos_maj_ernoult_base`sle_8 within w_diagnos_maj_87033_4
end type

type sle_9 from w_diagnos_maj_ernoult_base`sle_9 within w_diagnos_maj_87033_4
end type

type st_1 from w_diagnos_maj_ernoult_base`st_1 within w_diagnos_maj_87033_4
end type

type st_2 from w_diagnos_maj_ernoult_base`st_2 within w_diagnos_maj_87033_4
end type

type st_3 from w_diagnos_maj_ernoult_base`st_3 within w_diagnos_maj_87033_4
end type

type st_4 from w_diagnos_maj_ernoult_base`st_4 within w_diagnos_maj_87033_4
end type

type st_5 from w_diagnos_maj_ernoult_base`st_5 within w_diagnos_maj_87033_4
end type

type st_6 from w_diagnos_maj_ernoult_base`st_6 within w_diagnos_maj_87033_4
end type

type st_7 from w_diagnos_maj_ernoult_base`st_7 within w_diagnos_maj_87033_4
end type

type st_8 from w_diagnos_maj_ernoult_base`st_8 within w_diagnos_maj_87033_4
end type

type st_9 from w_diagnos_maj_ernoult_base`st_9 within w_diagnos_maj_87033_4
end type

type st_10 from w_diagnos_maj_ernoult_base`st_10 within w_diagnos_maj_87033_4
end type

type st_11 from w_diagnos_maj_ernoult_base`st_11 within w_diagnos_maj_87033_4
end type

type st_12 from w_diagnos_maj_ernoult_base`st_12 within w_diagnos_maj_87033_4
end type

type em_plus_encomb from w_diagnos_maj_ernoult_base`em_plus_encomb within w_diagnos_maj_87033_4
end type

type em_plus_spee from w_diagnos_maj_ernoult_base`em_plus_spee within w_diagnos_maj_87033_4
end type

type em_plus_leeway from w_diagnos_maj_ernoult_base`em_plus_leeway within w_diagnos_maj_87033_4
end type

type em_plus_repos from w_diagnos_maj_ernoult_base`em_plus_repos within w_diagnos_maj_87033_4
end type

type em_plus_expans from w_diagnos_maj_ernoult_base`em_plus_expans within w_diagnos_maj_87033_4
end type

type em_plus_stripping from w_diagnos_maj_ernoult_base`em_plus_stripping within w_diagnos_maj_87033_4
end type

type em_plus_extract from w_diagnos_maj_ernoult_base`em_plus_extract within w_diagnos_maj_87033_4
end type

type em_moins_encomb from w_diagnos_maj_ernoult_base`em_moins_encomb within w_diagnos_maj_87033_4
end type

type em_moins_spee from w_diagnos_maj_ernoult_base`em_moins_spee within w_diagnos_maj_87033_4
end type

type em_moins_leeway from w_diagnos_maj_ernoult_base`em_moins_leeway within w_diagnos_maj_87033_4
end type

type em_moins_repos from w_diagnos_maj_ernoult_base`em_moins_repos within w_diagnos_maj_87033_4
end type

type em_moins_expans from w_diagnos_maj_ernoult_base`em_moins_expans within w_diagnos_maj_87033_4
end type

type em_moins_stripping from w_diagnos_maj_ernoult_base`em_moins_stripping within w_diagnos_maj_87033_4
end type

type em_moins_extract from w_diagnos_maj_ernoult_base`em_moins_extract within w_diagnos_maj_87033_4
end type

type st_total_1 from w_diagnos_maj_ernoult_base`st_total_1 within w_diagnos_maj_87033_4
end type

type st_total from w_diagnos_maj_ernoult_base`st_total within w_diagnos_maj_87033_4
end type

type mle_resum_diag from w_diagnos_maj_ernoult_base`mle_resum_diag within w_diagnos_maj_87033_4
integer x = 55
end type

type mle_resum_plt from w_diagnos_maj_ernoult_base`mle_resum_plt within w_diagnos_maj_87033_4
integer x = 960
end type

type st_17 from w_diagnos_maj_ernoult_base`st_17 within w_diagnos_maj_87033_4
integer x = 82
end type

type st_18 from w_diagnos_maj_ernoult_base`st_18 within w_diagnos_maj_87033_4
integer x = 987
end type

type st_19 from w_diagnos_maj_ernoult_base`st_19 within w_diagnos_maj_87033_4
integer x = 82
end type

type mle_resum_cephal from w_diagnos_maj_ernoult_base`mle_resum_cephal within w_diagnos_maj_87033_4
integer x = 55
integer height = 420
end type

type cb_odrade from w_diagnos_maj_ernoult_base`cb_odrade within w_diagnos_maj_87033_4
integer x = 1454
integer y = 1464
end type

event cb_odrade::clicked;call super::clicked;odrade_recup( 43, 44, mle_resum_cephal )
end event

type cb_transferer from w_diagnos_maj_ernoult_base`cb_transferer within w_diagnos_maj_87033_4
integer x = 1454
end type

type mle_exam from w_diagnos_maj_ernoult_base`mle_exam within w_diagnos_maj_87033_4
integer x = 1893
integer y = 1560
end type

type st_13 from w_diagnos_maj_ernoult_base`st_13 within w_diagnos_maj_87033_4
integer x = 1920
integer y = 1464
end type

type cb_1 from w_diagnos_maj_ernoult_base`cb_1 within w_diagnos_maj_87033_4
integer x = 1454
integer y = 1608
end type

type cb_transferer_exam_fonc from w_diagnos_maj_ernoult_base`cb_transferer_exam_fonc within w_diagnos_maj_87033_4
integer x = 2715
integer y = 1440
end type

type gb_1 from w_diagnos_maj_ernoult_base`gb_1 within w_diagnos_maj_87033_4
end type

type ole_photo034 from gearbox within w_diagnos_maj_87033_4
string tag = "EF"
integer x = 2935
integer y = 24
integer width = 521
integer height = 360
boolean bringtotop = true
borderstyle borderstyle = stylelowered!
boolean vignette = true
end type

on ole_photo034.destroy
call gearbox::destroy
end on

type ole_photo035 from gearbox within w_diagnos_maj_87033_4
string tag = "{EFS/FT}"
integer x = 2935
integer y = 576
integer width = 521
integer height = 360
boolean bringtotop = true
borderstyle borderstyle = stylelowered!
boolean vignette = true
end type

on ole_photo035.destroy
call gearbox::destroy
end on

type ole_photo036 from gearbox within w_diagnos_maj_87033_4
string tag = "{EPD/FT}"
integer x = 2359
integer y = 24
integer width = 521
integer height = 360
boolean bringtotop = true
borderstyle borderstyle = stylelowered!
boolean vignette = true
end type

on ole_photo036.destroy
call gearbox::destroy
end on

type ole_photo037 from gearbox within w_diagnos_maj_87033_4
string tag = "{ID/FT}"
integer x = 55
integer y = 24
integer width = 521
integer height = 360
boolean bringtotop = true
borderstyle borderstyle = stylelowered!
boolean vignette = true
end type

on ole_photo037.destroy
call gearbox::destroy
end on

type ole_photo039 from gearbox within w_diagnos_maj_87033_4
string tag = "{IG/FT}"
integer x = 1207
integer y = 24
integer width = 521
integer height = 360
boolean bringtotop = true
borderstyle borderstyle = stylelowered!
boolean vignette = true
end type

on ole_photo039.destroy
call gearbox::destroy
end on

type ole_photo040 from gearbox within w_diagnos_maj_87033_4
string tag = "{IH/FT}"
integer x = 55
integer y = 480
integer width = 521
integer height = 360
boolean bringtotop = true
borderstyle borderstyle = stylelowered!
boolean vignette = true
end type

on ole_photo040.destroy
call gearbox::destroy
end on

type ole_photo041 from gearbox within w_diagnos_maj_87033_4
string tag = "{IB/FT}"
integer x = 631
integer y = 480
integer width = 521
integer height = 360
boolean bringtotop = true
borderstyle borderstyle = stylelowered!
boolean vignette = true
end type

on ole_photo041.destroy
call gearbox::destroy
end on

type ole_photo038 from gearbox within w_diagnos_maj_87033_4
string tag = "{IF/FT}"
integer x = 631
integer y = 24
integer width = 521
integer height = 360
boolean bringtotop = true
borderstyle borderstyle = stylelowered!
boolean vignette = true
end type

on ole_photo038.destroy
call gearbox::destroy
end on

type ole_photo042 from gearbox within w_diagnos_maj_87033_4
string tag = "{RPA/FT}"
integer x = 1783
integer y = 24
integer width = 521
integer height = 360
boolean bringtotop = true
borderstyle borderstyle = stylelowered!
boolean vignette = true
end type

on ole_photo042.destroy
call gearbox::destroy
end on

type ole_photo043 from gearbox within w_diagnos_maj_87033_4
string tag = "{OTC/FT}"
integer x = 2935
integer y = 984
integer width = 521
integer height = 360
boolean bringtotop = true
borderstyle borderstyle = stylelowered!
boolean vignette = true
end type

on ole_photo043.destroy
call gearbox::destroy
end on

type ole_photo044 from gearbox within w_diagnos_maj_87033_4
string tag = "{OTM/FT}"
integer x = 1207
integer y = 480
integer width = 521
integer height = 360
boolean bringtotop = true
borderstyle borderstyle = stylelowered!
boolean vignette = true
end type

on ole_photo044.destroy
call gearbox::destroy
end on

