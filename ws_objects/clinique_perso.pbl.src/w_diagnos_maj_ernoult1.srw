$PBExportHeader$w_diagnos_maj_ernoult1.srw
$PBExportComments$gearbox
forward
global type w_diagnos_maj_ernoult1 from w_diagnos_maj_ernoult_base
end type
type ole_photo001 from gearbox within w_diagnos_maj_ernoult1
end type
type ole_photo002 from gearbox within w_diagnos_maj_ernoult1
end type
type ole_photo003 from gearbox within w_diagnos_maj_ernoult1
end type
type ole_photo004 from gearbox within w_diagnos_maj_ernoult1
end type
type ole_photo006 from gearbox within w_diagnos_maj_ernoult1
end type
type ole_photo007 from gearbox within w_diagnos_maj_ernoult1
end type
type ole_photo008 from gearbox within w_diagnos_maj_ernoult1
end type
type ole_photo005 from gearbox within w_diagnos_maj_ernoult1
end type
type ole_photo009 from gearbox within w_diagnos_maj_ernoult1
end type
type ole_photo010 from gearbox within w_diagnos_maj_ernoult1
end type
type ole_photo011 from gearbox within w_diagnos_maj_ernoult1
end type
type ole_photo069 from gearbox within w_diagnos_maj_ernoult1
end type
end forward

global type w_diagnos_maj_ernoult1 from w_diagnos_maj_ernoult_base
string tag = "14200"
integer width = 4101
integer height = 1996
string title = "Page Clinique N°1"
ole_photo001 ole_photo001
ole_photo002 ole_photo002
ole_photo003 ole_photo003
ole_photo004 ole_photo004
ole_photo006 ole_photo006
ole_photo007 ole_photo007
ole_photo008 ole_photo008
ole_photo005 ole_photo005
ole_photo009 ole_photo009
ole_photo010 ole_photo010
ole_photo011 ole_photo011
ole_photo069 ole_photo069
end type
global w_diagnos_maj_ernoult1 w_diagnos_maj_ernoult1

forward prototypes
public subroutine load_ctrls ()
public subroutine unload_ctrls ()
end prototypes

public subroutine load_ctrls ();f.lirepage(sle_1,page_buffer[1],1,50)
f.lirepage(sle_11,page_buffer[1],51,50)
f.lirepage(sle_3,page_buffer[1],101,50)
f.lirepage(sle_4,page_buffer[1],151,50)
f.lirepage(sle_5,page_buffer[1],201,50)
f.lirepage(sle_6,page_buffer[1],251,50)
f.lirepage(sle_7,page_buffer[1],301,50)
f.lirepage(sle_8,page_buffer[1],351,50)
f.lirepage(sle_9,page_buffer[1],401,50)
f.lirepage(em_plus_encomb,page_buffer[1],451,6)
f.lirepage(em_plus_spee,page_buffer[1],457,6)
f.lirepage(em_plus_leeway,page_buffer[1],463,6)
f.lirepage(em_plus_repos,page_buffer[1],469,6)
f.lirepage(em_plus_expans,page_buffer[1],475,6)
f.lirepage(em_plus_stripping,page_buffer[1],481,6)
f.lirepage(em_plus_extract,page_buffer[1],487,6)
f.lirepage(em_moins_encomb,page_buffer[1],493,6)
f.lirepage(em_moins_spee,page_buffer[1],499,6)
f.lirepage(em_moins_leeway,page_buffer[1],505,6)
f.lirepage(em_moins_repos,page_buffer[1],511,6)
f.lirepage(em_moins_expans,page_buffer[1],517,6)
f.lirepage(em_moins_stripping,page_buffer[1],523,6)
f.lirepage(em_moins_extract,page_buffer[1],529,6)
f.lirepage(mle_resum_diag,page_buffer[1],535,500)
f.lirepage(mle_resum_plt,page_buffer[1],1035,500)
f.lirepage(mle_resum_cephal,page_buffer[1],10200,1000)
f.lirepage(mle_exam,page_buffer[1],2035,500)
// max carac = 2535


resume_diag_generer()
total_1_generer()
total_generer()

end subroutine

public subroutine unload_ctrls ();f.ecrirepage(sle_1,page_buffer[2],1,50)
f.ecrirepage(sle_11,page_buffer[2],51,50)
f.ecrirepage(sle_3,page_buffer[2],101,50)
f.ecrirepage(sle_4,page_buffer[2],151,50)
f.ecrirepage(sle_5,page_buffer[2],201,50)
f.ecrirepage(sle_6,page_buffer[2],251,50)
f.ecrirepage(sle_7,page_buffer[2],301,50)
f.ecrirepage(sle_8,page_buffer[2],351,50)
f.ecrirepage(sle_9,page_buffer[2],401,50)
f.ecrirepage(em_plus_encomb,page_buffer[2],451,6)
f.ecrirepage(em_plus_spee,page_buffer[2],457,6)
f.ecrirepage(em_plus_leeway,page_buffer[2],463,6)
f.ecrirepage(em_plus_repos,page_buffer[2],469,6)
f.ecrirepage(em_plus_expans,page_buffer[2],475,6)
f.ecrirepage(em_plus_stripping,page_buffer[2],481,6)
f.ecrirepage(em_plus_extract,page_buffer[2],487,6)
f.ecrirepage(em_moins_encomb,page_buffer[2],493,6)
f.ecrirepage(em_moins_spee,page_buffer[2],499,6)
f.ecrirepage(em_moins_leeway,page_buffer[2],505,6)
f.ecrirepage(em_moins_repos,page_buffer[2],511,6)
f.ecrirepage(em_moins_expans,page_buffer[2],517,6)
f.ecrirepage(em_moins_stripping,page_buffer[2],523,6)
f.ecrirepage(em_moins_extract,page_buffer[2],529,6)
f.ecrirepage(mle_resum_diag,page_buffer[2],535,500)
f.ecrirepage(mle_resum_plt,page_buffer[2],1035,500)
f.ecrirepage(mle_resum_cephal,page_buffer[2],10200,1000)
f.ecrirepage(mle_exam,page_buffer[2],2035,500)
// max carac = 2535

end subroutine

on w_diagnos_maj_ernoult1.create
int iCurrent
call super::create
this.ole_photo001=create ole_photo001
this.ole_photo002=create ole_photo002
this.ole_photo003=create ole_photo003
this.ole_photo004=create ole_photo004
this.ole_photo006=create ole_photo006
this.ole_photo007=create ole_photo007
this.ole_photo008=create ole_photo008
this.ole_photo005=create ole_photo005
this.ole_photo009=create ole_photo009
this.ole_photo010=create ole_photo010
this.ole_photo011=create ole_photo011
this.ole_photo069=create ole_photo069
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.ole_photo001
this.Control[iCurrent+2]=this.ole_photo002
this.Control[iCurrent+3]=this.ole_photo003
this.Control[iCurrent+4]=this.ole_photo004
this.Control[iCurrent+5]=this.ole_photo006
this.Control[iCurrent+6]=this.ole_photo007
this.Control[iCurrent+7]=this.ole_photo008
this.Control[iCurrent+8]=this.ole_photo005
this.Control[iCurrent+9]=this.ole_photo009
this.Control[iCurrent+10]=this.ole_photo010
this.Control[iCurrent+11]=this.ole_photo011
this.Control[iCurrent+12]=this.ole_photo069
end on

on w_diagnos_maj_ernoult1.destroy
call super::destroy
destroy(this.ole_photo001)
destroy(this.ole_photo002)
destroy(this.ole_photo003)
destroy(this.ole_photo004)
destroy(this.ole_photo006)
destroy(this.ole_photo007)
destroy(this.ole_photo008)
destroy(this.ole_photo005)
destroy(this.ole_photo009)
destroy(this.ole_photo010)
destroy(this.ole_photo011)
destroy(this.ole_photo069)
end on

type pb_suivant from w_diagnos_maj_ernoult_base`pb_suivant within w_diagnos_maj_ernoult1
string tag = "ernoult2"
integer x = 3374
integer y = 1752
end type

type pb_precedant from w_diagnos_maj_ernoult_base`pb_precedant within w_diagnos_maj_ernoult1
boolean visible = false
integer x = 3209
integer y = 1752
end type

type cb_imprimer from w_diagnos_maj_ernoult_base`cb_imprimer within w_diagnos_maj_ernoult1
integer x = 1454
integer y = 1752
end type

type cb_sauver from w_diagnos_maj_ernoult_base`cb_sauver within w_diagnos_maj_ernoult1
integer x = 2331
integer y = 1752
end type

type cb_annuler from w_diagnos_maj_ernoult_base`cb_annuler within w_diagnos_maj_ernoult1
integer x = 1893
integer y = 1752
end type

type cb_fermer from w_diagnos_maj_ernoult_base`cb_fermer within w_diagnos_maj_ernoult1
integer x = 2770
integer y = 1752
end type

type sle_1 from w_diagnos_maj_ernoult_base`sle_1 within w_diagnos_maj_ernoult1
end type

type sle_11 from w_diagnos_maj_ernoult_base`sle_11 within w_diagnos_maj_ernoult1
end type

type sle_3 from w_diagnos_maj_ernoult_base`sle_3 within w_diagnos_maj_ernoult1
end type

type sle_4 from w_diagnos_maj_ernoult_base`sle_4 within w_diagnos_maj_ernoult1
end type

type sle_5 from w_diagnos_maj_ernoult_base`sle_5 within w_diagnos_maj_ernoult1
end type

type sle_6 from w_diagnos_maj_ernoult_base`sle_6 within w_diagnos_maj_ernoult1
end type

type sle_7 from w_diagnos_maj_ernoult_base`sle_7 within w_diagnos_maj_ernoult1
end type

type sle_8 from w_diagnos_maj_ernoult_base`sle_8 within w_diagnos_maj_ernoult1
end type

type sle_9 from w_diagnos_maj_ernoult_base`sle_9 within w_diagnos_maj_ernoult1
end type

type st_1 from w_diagnos_maj_ernoult_base`st_1 within w_diagnos_maj_ernoult1
end type

type st_2 from w_diagnos_maj_ernoult_base`st_2 within w_diagnos_maj_ernoult1
end type

type st_3 from w_diagnos_maj_ernoult_base`st_3 within w_diagnos_maj_ernoult1
end type

type st_4 from w_diagnos_maj_ernoult_base`st_4 within w_diagnos_maj_ernoult1
end type

type st_5 from w_diagnos_maj_ernoult_base`st_5 within w_diagnos_maj_ernoult1
end type

type st_6 from w_diagnos_maj_ernoult_base`st_6 within w_diagnos_maj_ernoult1
end type

type st_7 from w_diagnos_maj_ernoult_base`st_7 within w_diagnos_maj_ernoult1
end type

type st_8 from w_diagnos_maj_ernoult_base`st_8 within w_diagnos_maj_ernoult1
end type

type st_9 from w_diagnos_maj_ernoult_base`st_9 within w_diagnos_maj_ernoult1
end type

type st_10 from w_diagnos_maj_ernoult_base`st_10 within w_diagnos_maj_ernoult1
end type

type st_11 from w_diagnos_maj_ernoult_base`st_11 within w_diagnos_maj_ernoult1
end type

type st_12 from w_diagnos_maj_ernoult_base`st_12 within w_diagnos_maj_ernoult1
end type

type em_plus_encomb from w_diagnos_maj_ernoult_base`em_plus_encomb within w_diagnos_maj_ernoult1
end type

type em_plus_spee from w_diagnos_maj_ernoult_base`em_plus_spee within w_diagnos_maj_ernoult1
end type

type em_plus_leeway from w_diagnos_maj_ernoult_base`em_plus_leeway within w_diagnos_maj_ernoult1
end type

type em_plus_repos from w_diagnos_maj_ernoult_base`em_plus_repos within w_diagnos_maj_ernoult1
end type

type em_plus_expans from w_diagnos_maj_ernoult_base`em_plus_expans within w_diagnos_maj_ernoult1
end type

type em_plus_stripping from w_diagnos_maj_ernoult_base`em_plus_stripping within w_diagnos_maj_ernoult1
end type

type em_plus_extract from w_diagnos_maj_ernoult_base`em_plus_extract within w_diagnos_maj_ernoult1
end type

type em_moins_encomb from w_diagnos_maj_ernoult_base`em_moins_encomb within w_diagnos_maj_ernoult1
end type

type em_moins_spee from w_diagnos_maj_ernoult_base`em_moins_spee within w_diagnos_maj_ernoult1
end type

type em_moins_leeway from w_diagnos_maj_ernoult_base`em_moins_leeway within w_diagnos_maj_ernoult1
end type

type em_moins_repos from w_diagnos_maj_ernoult_base`em_moins_repos within w_diagnos_maj_ernoult1
end type

type em_moins_expans from w_diagnos_maj_ernoult_base`em_moins_expans within w_diagnos_maj_ernoult1
end type

type em_moins_stripping from w_diagnos_maj_ernoult_base`em_moins_stripping within w_diagnos_maj_ernoult1
end type

type em_moins_extract from w_diagnos_maj_ernoult_base`em_moins_extract within w_diagnos_maj_ernoult1
end type

type st_total_1 from w_diagnos_maj_ernoult_base`st_total_1 within w_diagnos_maj_ernoult1
end type

type st_total from w_diagnos_maj_ernoult_base`st_total within w_diagnos_maj_ernoult1
end type

type mle_resum_diag from w_diagnos_maj_ernoult_base`mle_resum_diag within w_diagnos_maj_ernoult1
integer x = 55
end type

type mle_resum_plt from w_diagnos_maj_ernoult_base`mle_resum_plt within w_diagnos_maj_ernoult1
integer x = 960
end type

type st_17 from w_diagnos_maj_ernoult_base`st_17 within w_diagnos_maj_ernoult1
integer x = 82
end type

type st_18 from w_diagnos_maj_ernoult_base`st_18 within w_diagnos_maj_ernoult1
integer x = 987
end type

type st_19 from w_diagnos_maj_ernoult_base`st_19 within w_diagnos_maj_ernoult1
integer x = 82
end type

type mle_resum_cephal from w_diagnos_maj_ernoult_base`mle_resum_cephal within w_diagnos_maj_ernoult1
integer x = 55
integer height = 420
end type

type cb_odrade from w_diagnos_maj_ernoult_base`cb_odrade within w_diagnos_maj_ernoult1
integer x = 1454
integer y = 1464
end type

event cb_odrade::clicked;call super::clicked;odrade_recup( 10, 11, mle_resum_cephal )
end event

type cb_transferer from w_diagnos_maj_ernoult_base`cb_transferer within w_diagnos_maj_ernoult1
integer x = 1454
end type

type mle_exam from w_diagnos_maj_ernoult_base`mle_exam within w_diagnos_maj_ernoult1
integer x = 1893
integer y = 1560
end type

type st_13 from w_diagnos_maj_ernoult_base`st_13 within w_diagnos_maj_ernoult1
integer x = 1920
integer y = 1464
end type

type cb_1 from w_diagnos_maj_ernoult_base`cb_1 within w_diagnos_maj_ernoult1
integer x = 1454
integer y = 1608
end type

type cb_transferer_exam_fonc from w_diagnos_maj_ernoult_base`cb_transferer_exam_fonc within w_diagnos_maj_ernoult1
integer x = 2715
integer y = 1440
end type

type gb_1 from w_diagnos_maj_ernoult_base`gb_1 within w_diagnos_maj_ernoult1
integer width = 2208
end type

type ole_photo001 from gearbox within w_diagnos_maj_ernoult1
string tag = "{EF/AT1}"
boolean visible = true
integer x = 2935
integer y = 24
integer width = 521
integer height = 360
boolean bringtotop = true
borderstyle borderstyle = stylelowered!
boolean vignette = true
end type

on ole_photo001.destroy
call gearbox::destroy
end on

type ole_photo002 from gearbox within w_diagnos_maj_ernoult1
string tag = "{EFS/AT1}"
boolean visible = true
integer x = 2935
integer y = 576
integer width = 521
integer height = 360
boolean bringtotop = true
borderstyle borderstyle = stylelowered!
boolean vignette = true
end type

on ole_photo002.destroy
call gearbox::destroy
end on

type ole_photo003 from gearbox within w_diagnos_maj_ernoult1
string tag = "{EPD/AT1}"
boolean visible = true
integer x = 2359
integer y = 24
integer width = 521
integer height = 360
boolean bringtotop = true
borderstyle borderstyle = stylelowered!
boolean vignette = true
end type

on ole_photo003.destroy
call gearbox::destroy
end on

type ole_photo004 from gearbox within w_diagnos_maj_ernoult1
string tag = "{ID/AT1}"
boolean visible = true
integer x = 55
integer y = 24
integer width = 521
integer height = 360
boolean bringtotop = true
borderstyle borderstyle = stylelowered!
boolean vignette = true
end type

on ole_photo004.destroy
call gearbox::destroy
end on

type ole_photo006 from gearbox within w_diagnos_maj_ernoult1
string tag = "{IG/AT1}"
boolean visible = true
integer x = 1207
integer y = 24
integer width = 521
integer height = 360
boolean bringtotop = true
borderstyle borderstyle = stylelowered!
boolean vignette = true
end type

on ole_photo006.destroy
call gearbox::destroy
end on

type ole_photo007 from gearbox within w_diagnos_maj_ernoult1
string tag = "{IH/AT1}"
boolean visible = true
integer x = 55
integer y = 480
integer width = 521
integer height = 360
boolean bringtotop = true
borderstyle borderstyle = stylelowered!
boolean vignette = true
end type

on ole_photo007.destroy
call gearbox::destroy
end on

type ole_photo008 from gearbox within w_diagnos_maj_ernoult1
string tag = "{IB/AT1}"
boolean visible = true
integer x = 631
integer y = 480
integer width = 521
integer height = 360
boolean bringtotop = true
borderstyle borderstyle = stylelowered!
boolean vignette = true
end type

on ole_photo008.destroy
call gearbox::destroy
end on

type ole_photo005 from gearbox within w_diagnos_maj_ernoult1
string tag = "{IF/AT1}"
boolean visible = true
integer x = 631
integer y = 24
integer width = 521
integer height = 360
boolean bringtotop = true
borderstyle borderstyle = stylelowered!
boolean vignette = true
end type

on ole_photo005.destroy
call gearbox::destroy
end on

type ole_photo009 from gearbox within w_diagnos_maj_ernoult1
string tag = "{RPA/AT1}"
boolean visible = true
integer x = 1783
integer y = 24
integer width = 521
integer height = 360
boolean bringtotop = true
borderstyle borderstyle = stylelowered!
boolean vignette = true
end type

on ole_photo009.destroy
call gearbox::destroy
end on

type ole_photo010 from gearbox within w_diagnos_maj_ernoult1
string tag = "{RPD/AT1}"
boolean visible = true
integer x = 2935
integer y = 984
integer width = 521
integer height = 360
boolean bringtotop = true
borderstyle borderstyle = stylelowered!
boolean vignette = true
end type

on ole_photo010.destroy
call gearbox::destroy
end on

type ole_photo011 from gearbox within w_diagnos_maj_ernoult1
string tag = "{OTM/AT1}"
boolean visible = true
integer x = 1207
integer y = 480
integer width = 521
integer height = 360
boolean bringtotop = true
borderstyle borderstyle = stylelowered!
boolean vignette = true
end type

on ole_photo011.destroy
call gearbox::destroy
end on

type ole_photo069 from gearbox within w_diagnos_maj_ernoult1
string tag = "{OTC/AT1}"
boolean visible = true
integer x = 3506
integer y = 984
integer width = 521
integer height = 360
integer taborder = 220
boolean bringtotop = true
borderstyle borderstyle = stylelowered!
boolean vignette = true
end type

on ole_photo069.destroy
call gearbox::destroy
end on

