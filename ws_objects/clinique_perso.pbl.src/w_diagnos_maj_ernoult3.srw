$PBExportHeader$w_diagnos_maj_ernoult3.srw
$PBExportComments$gearbox
forward
global type w_diagnos_maj_ernoult3 from w_diagnos_maj_ernoult_base
end type
type ole_photo023 from gearbox within w_diagnos_maj_ernoult3
end type
type ole_photo024 from gearbox within w_diagnos_maj_ernoult3
end type
type ole_photo025 from gearbox within w_diagnos_maj_ernoult3
end type
type ole_photo026 from gearbox within w_diagnos_maj_ernoult3
end type
type ole_photo028 from gearbox within w_diagnos_maj_ernoult3
end type
type ole_photo029 from gearbox within w_diagnos_maj_ernoult3
end type
type ole_photo030 from gearbox within w_diagnos_maj_ernoult3
end type
type ole_photo027 from gearbox within w_diagnos_maj_ernoult3
end type
type ole_photo031 from gearbox within w_diagnos_maj_ernoult3
end type
type ole_photo032 from gearbox within w_diagnos_maj_ernoult3
end type
type ole_photo033 from gearbox within w_diagnos_maj_ernoult3
end type
type ole_photo071 from gearbox within w_diagnos_maj_ernoult3
end type
end forward

global type w_diagnos_maj_ernoult3 from w_diagnos_maj_ernoult_base
string tag = "14200"
integer width = 4101
integer height = 1996
string title = "Page Clinique N°3"
ole_photo023 ole_photo023
ole_photo024 ole_photo024
ole_photo025 ole_photo025
ole_photo026 ole_photo026
ole_photo028 ole_photo028
ole_photo029 ole_photo029
ole_photo030 ole_photo030
ole_photo027 ole_photo027
ole_photo031 ole_photo031
ole_photo032 ole_photo032
ole_photo033 ole_photo033
ole_photo071 ole_photo071
end type
global w_diagnos_maj_ernoult3 w_diagnos_maj_ernoult3

forward prototypes
public subroutine load_ctrls ()
public subroutine unload_ctrls ()
end prototypes

public subroutine load_ctrls ();f.lirepage(sle_1,page_buffer[1],5069,50)
f.lirepage(sle_11,page_buffer[1],5119,50)
f.lirepage(sle_3,page_buffer[1],5169,50)
f.lirepage(sle_4,page_buffer[1],5219,50)
f.lirepage(sle_5,page_buffer[1],5269,50)
f.lirepage(sle_6,page_buffer[1],5319,50)
f.lirepage(sle_7,page_buffer[1],5369,50)
f.lirepage(sle_8,page_buffer[1],5419,50)
f.lirepage(sle_9,page_buffer[1],5469,50)
f.lirepage(em_plus_encomb,page_buffer[1],5519,6)
f.lirepage(em_plus_spee,page_buffer[1],5525,6)
f.lirepage(em_plus_leeway,page_buffer[1],5531,6)
f.lirepage(em_plus_repos,page_buffer[1],5537,6)
f.lirepage(em_plus_expans,page_buffer[1],5543,6)
f.lirepage(em_plus_stripping,page_buffer[1],5549,6)
f.lirepage(em_plus_extract,page_buffer[1],5555,6)
f.lirepage(em_moins_encomb,page_buffer[1],5561,6)
f.lirepage(em_moins_spee,page_buffer[1],5567,6)
f.lirepage(em_moins_leeway,page_buffer[1],5573,6)
f.lirepage(em_moins_repos,page_buffer[1],5579,6)
f.lirepage(em_moins_expans,page_buffer[1],5585,6)
f.lirepage(em_moins_stripping,page_buffer[1],5591,6)
f.lirepage(em_moins_extract,page_buffer[1],5597,6)
f.lirepage(mle_resum_diag,page_buffer[1],5603,500)
f.lirepage(mle_resum_plt,page_buffer[1],6103,500)
f.lirepage(mle_resum_cephal,page_buffer[1],12200,1000)
f.lirepage(mle_exam,page_buffer[1],7103,500)
// max carac = 7603

resume_diag_generer()
total_1_generer()
total_generer()

end subroutine

public subroutine unload_ctrls ();f.ecrirepage(sle_1,page_buffer[2],5069,50)
f.ecrirepage(sle_11,page_buffer[2],5119,50)
f.ecrirepage(sle_3,page_buffer[2],5169,50)
f.ecrirepage(sle_4,page_buffer[2],5219,50)
f.ecrirepage(sle_5,page_buffer[2],5269,50)
f.ecrirepage(sle_6,page_buffer[2],5319,50)
f.ecrirepage(sle_7,page_buffer[2],5369,50)
f.ecrirepage(sle_8,page_buffer[2],5419,50)
f.ecrirepage(sle_9,page_buffer[2],5469,50)
f.ecrirepage(em_plus_encomb,page_buffer[2],5519,6)
f.ecrirepage(em_plus_spee,page_buffer[2],5525,6)
f.ecrirepage(em_plus_leeway,page_buffer[2],5531,6)
f.ecrirepage(em_plus_repos,page_buffer[2],5537,6)
f.ecrirepage(em_plus_expans,page_buffer[2],5543,6)
f.ecrirepage(em_plus_stripping,page_buffer[2],5549,6)
f.ecrirepage(em_plus_extract,page_buffer[2],5555,6)
f.ecrirepage(em_moins_encomb,page_buffer[2],5561,6)
f.ecrirepage(em_moins_spee,page_buffer[2],5567,6)
f.ecrirepage(em_moins_leeway,page_buffer[2],5573,6)
f.ecrirepage(em_moins_repos,page_buffer[2],5579,6)
f.ecrirepage(em_moins_expans,page_buffer[2],5585,6)
f.ecrirepage(em_moins_stripping,page_buffer[2],5591,6)
f.ecrirepage(em_moins_extract,page_buffer[2],5597,6)
f.ecrirepage(mle_resum_diag,page_buffer[2],5603,500)
f.ecrirepage(mle_resum_plt,page_buffer[2],6103,500)
f.ecrirepage(mle_resum_cephal,page_buffer[2],12200,1000)
f.ecrirepage(mle_exam,page_buffer[2],7103,500)
// max carac = 7603

end subroutine

on w_diagnos_maj_ernoult3.create
int iCurrent
call super::create
this.ole_photo023=create ole_photo023
this.ole_photo024=create ole_photo024
this.ole_photo025=create ole_photo025
this.ole_photo026=create ole_photo026
this.ole_photo028=create ole_photo028
this.ole_photo029=create ole_photo029
this.ole_photo030=create ole_photo030
this.ole_photo027=create ole_photo027
this.ole_photo031=create ole_photo031
this.ole_photo032=create ole_photo032
this.ole_photo033=create ole_photo033
this.ole_photo071=create ole_photo071
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.ole_photo023
this.Control[iCurrent+2]=this.ole_photo024
this.Control[iCurrent+3]=this.ole_photo025
this.Control[iCurrent+4]=this.ole_photo026
this.Control[iCurrent+5]=this.ole_photo028
this.Control[iCurrent+6]=this.ole_photo029
this.Control[iCurrent+7]=this.ole_photo030
this.Control[iCurrent+8]=this.ole_photo027
this.Control[iCurrent+9]=this.ole_photo031
this.Control[iCurrent+10]=this.ole_photo032
this.Control[iCurrent+11]=this.ole_photo033
this.Control[iCurrent+12]=this.ole_photo071
end on

on w_diagnos_maj_ernoult3.destroy
call super::destroy
destroy(this.ole_photo023)
destroy(this.ole_photo024)
destroy(this.ole_photo025)
destroy(this.ole_photo026)
destroy(this.ole_photo028)
destroy(this.ole_photo029)
destroy(this.ole_photo030)
destroy(this.ole_photo027)
destroy(this.ole_photo031)
destroy(this.ole_photo032)
destroy(this.ole_photo033)
destroy(this.ole_photo071)
end on

type pb_suivant from w_diagnos_maj_ernoult_base`pb_suivant within w_diagnos_maj_ernoult3
string tag = "ernoult4"
integer x = 3374
integer y = 1752
end type

type pb_precedant from w_diagnos_maj_ernoult_base`pb_precedant within w_diagnos_maj_ernoult3
string tag = "ernoult2"
integer x = 3209
integer y = 1752
end type

type cb_imprimer from w_diagnos_maj_ernoult_base`cb_imprimer within w_diagnos_maj_ernoult3
integer x = 1454
integer y = 1752
end type

type cb_sauver from w_diagnos_maj_ernoult_base`cb_sauver within w_diagnos_maj_ernoult3
integer x = 2331
integer y = 1752
end type

type cb_annuler from w_diagnos_maj_ernoult_base`cb_annuler within w_diagnos_maj_ernoult3
integer x = 1893
integer y = 1752
end type

type cb_fermer from w_diagnos_maj_ernoult_base`cb_fermer within w_diagnos_maj_ernoult3
integer x = 2770
integer y = 1752
end type

type sle_1 from w_diagnos_maj_ernoult_base`sle_1 within w_diagnos_maj_ernoult3
end type

type sle_11 from w_diagnos_maj_ernoult_base`sle_11 within w_diagnos_maj_ernoult3
end type

type sle_3 from w_diagnos_maj_ernoult_base`sle_3 within w_diagnos_maj_ernoult3
end type

type sle_4 from w_diagnos_maj_ernoult_base`sle_4 within w_diagnos_maj_ernoult3
end type

type sle_5 from w_diagnos_maj_ernoult_base`sle_5 within w_diagnos_maj_ernoult3
end type

type sle_6 from w_diagnos_maj_ernoult_base`sle_6 within w_diagnos_maj_ernoult3
end type

type sle_7 from w_diagnos_maj_ernoult_base`sle_7 within w_diagnos_maj_ernoult3
end type

type sle_8 from w_diagnos_maj_ernoult_base`sle_8 within w_diagnos_maj_ernoult3
end type

type sle_9 from w_diagnos_maj_ernoult_base`sle_9 within w_diagnos_maj_ernoult3
end type

type st_1 from w_diagnos_maj_ernoult_base`st_1 within w_diagnos_maj_ernoult3
end type

type st_2 from w_diagnos_maj_ernoult_base`st_2 within w_diagnos_maj_ernoult3
end type

type st_3 from w_diagnos_maj_ernoult_base`st_3 within w_diagnos_maj_ernoult3
end type

type st_4 from w_diagnos_maj_ernoult_base`st_4 within w_diagnos_maj_ernoult3
end type

type st_5 from w_diagnos_maj_ernoult_base`st_5 within w_diagnos_maj_ernoult3
end type

type st_6 from w_diagnos_maj_ernoult_base`st_6 within w_diagnos_maj_ernoult3
end type

type st_7 from w_diagnos_maj_ernoult_base`st_7 within w_diagnos_maj_ernoult3
end type

type st_8 from w_diagnos_maj_ernoult_base`st_8 within w_diagnos_maj_ernoult3
end type

type st_9 from w_diagnos_maj_ernoult_base`st_9 within w_diagnos_maj_ernoult3
end type

type st_10 from w_diagnos_maj_ernoult_base`st_10 within w_diagnos_maj_ernoult3
end type

type st_11 from w_diagnos_maj_ernoult_base`st_11 within w_diagnos_maj_ernoult3
end type

type st_12 from w_diagnos_maj_ernoult_base`st_12 within w_diagnos_maj_ernoult3
end type

type em_plus_encomb from w_diagnos_maj_ernoult_base`em_plus_encomb within w_diagnos_maj_ernoult3
end type

type em_plus_spee from w_diagnos_maj_ernoult_base`em_plus_spee within w_diagnos_maj_ernoult3
end type

type em_plus_leeway from w_diagnos_maj_ernoult_base`em_plus_leeway within w_diagnos_maj_ernoult3
end type

type em_plus_repos from w_diagnos_maj_ernoult_base`em_plus_repos within w_diagnos_maj_ernoult3
end type

type em_plus_expans from w_diagnos_maj_ernoult_base`em_plus_expans within w_diagnos_maj_ernoult3
end type

type em_plus_stripping from w_diagnos_maj_ernoult_base`em_plus_stripping within w_diagnos_maj_ernoult3
end type

type em_plus_extract from w_diagnos_maj_ernoult_base`em_plus_extract within w_diagnos_maj_ernoult3
end type

type em_moins_encomb from w_diagnos_maj_ernoult_base`em_moins_encomb within w_diagnos_maj_ernoult3
end type

type em_moins_spee from w_diagnos_maj_ernoult_base`em_moins_spee within w_diagnos_maj_ernoult3
end type

type em_moins_leeway from w_diagnos_maj_ernoult_base`em_moins_leeway within w_diagnos_maj_ernoult3
end type

type em_moins_repos from w_diagnos_maj_ernoult_base`em_moins_repos within w_diagnos_maj_ernoult3
end type

type em_moins_expans from w_diagnos_maj_ernoult_base`em_moins_expans within w_diagnos_maj_ernoult3
end type

type em_moins_stripping from w_diagnos_maj_ernoult_base`em_moins_stripping within w_diagnos_maj_ernoult3
end type

type em_moins_extract from w_diagnos_maj_ernoult_base`em_moins_extract within w_diagnos_maj_ernoult3
end type

type st_total_1 from w_diagnos_maj_ernoult_base`st_total_1 within w_diagnos_maj_ernoult3
end type

type st_total from w_diagnos_maj_ernoult_base`st_total within w_diagnos_maj_ernoult3
end type

type mle_resum_diag from w_diagnos_maj_ernoult_base`mle_resum_diag within w_diagnos_maj_ernoult3
integer x = 55
end type

type mle_resum_plt from w_diagnos_maj_ernoult_base`mle_resum_plt within w_diagnos_maj_ernoult3
integer x = 960
end type

type st_17 from w_diagnos_maj_ernoult_base`st_17 within w_diagnos_maj_ernoult3
integer x = 82
end type

type st_18 from w_diagnos_maj_ernoult_base`st_18 within w_diagnos_maj_ernoult3
integer x = 987
end type

type st_19 from w_diagnos_maj_ernoult_base`st_19 within w_diagnos_maj_ernoult3
integer x = 82
end type

type mle_resum_cephal from w_diagnos_maj_ernoult_base`mle_resum_cephal within w_diagnos_maj_ernoult3
integer x = 55
integer height = 420
end type

type cb_odrade from w_diagnos_maj_ernoult_base`cb_odrade within w_diagnos_maj_ernoult3
integer x = 1454
integer y = 1464
end type

event cb_odrade::clicked;call super::clicked;odrade_recup( 32, 33, mle_resum_cephal )
end event

type cb_transferer from w_diagnos_maj_ernoult_base`cb_transferer within w_diagnos_maj_ernoult3
integer x = 1454
end type

type mle_exam from w_diagnos_maj_ernoult_base`mle_exam within w_diagnos_maj_ernoult3
integer x = 1893
integer y = 1560
end type

type st_13 from w_diagnos_maj_ernoult_base`st_13 within w_diagnos_maj_ernoult3
integer x = 1920
integer y = 1464
end type

type cb_1 from w_diagnos_maj_ernoult_base`cb_1 within w_diagnos_maj_ernoult3
integer x = 1454
integer y = 1608
end type

type cb_transferer_exam_fonc from w_diagnos_maj_ernoult_base`cb_transferer_exam_fonc within w_diagnos_maj_ernoult3
integer x = 2715
integer y = 1440
end type

type gb_1 from w_diagnos_maj_ernoult_base`gb_1 within w_diagnos_maj_ernoult3
integer width = 2208
end type

type ole_photo023 from gearbox within w_diagnos_maj_ernoult3
string tag = "{EF/AT2}"
boolean visible = true
integer x = 2935
integer y = 24
integer width = 521
integer height = 360
boolean bringtotop = true
borderstyle borderstyle = stylelowered!
boolean vignette = true
end type

on ole_photo023.destroy
call gearbox::destroy
end on

type ole_photo024 from gearbox within w_diagnos_maj_ernoult3
string tag = "{EFS/AT2}"
boolean visible = true
integer x = 2935
integer y = 576
integer width = 521
integer height = 360
boolean bringtotop = true
borderstyle borderstyle = stylelowered!
boolean vignette = true
end type

on ole_photo024.destroy
call gearbox::destroy
end on

type ole_photo025 from gearbox within w_diagnos_maj_ernoult3
string tag = "{EPD/AT2}"
boolean visible = true
integer x = 2359
integer y = 24
integer width = 521
integer height = 360
boolean bringtotop = true
borderstyle borderstyle = stylelowered!
boolean vignette = true
end type

on ole_photo025.destroy
call gearbox::destroy
end on

type ole_photo026 from gearbox within w_diagnos_maj_ernoult3
string tag = "{ID/AT2}"
boolean visible = true
integer x = 55
integer y = 24
integer width = 521
integer height = 360
boolean bringtotop = true
borderstyle borderstyle = stylelowered!
boolean vignette = true
end type

on ole_photo026.destroy
call gearbox::destroy
end on

type ole_photo028 from gearbox within w_diagnos_maj_ernoult3
string tag = "{IG/AT2}"
boolean visible = true
integer x = 1207
integer y = 24
integer width = 521
integer height = 360
boolean bringtotop = true
borderstyle borderstyle = stylelowered!
boolean vignette = true
end type

on ole_photo028.destroy
call gearbox::destroy
end on

type ole_photo029 from gearbox within w_diagnos_maj_ernoult3
string tag = "{IH/AT2}"
boolean visible = true
integer x = 55
integer y = 480
integer width = 521
integer height = 360
boolean bringtotop = true
borderstyle borderstyle = stylelowered!
boolean vignette = true
end type

on ole_photo029.destroy
call gearbox::destroy
end on

type ole_photo030 from gearbox within w_diagnos_maj_ernoult3
string tag = "{IB/AT2}"
boolean visible = true
integer x = 631
integer y = 480
integer width = 521
integer height = 360
boolean bringtotop = true
borderstyle borderstyle = stylelowered!
boolean vignette = true
end type

on ole_photo030.destroy
call gearbox::destroy
end on

type ole_photo027 from gearbox within w_diagnos_maj_ernoult3
string tag = "{IF/AT2}"
boolean visible = true
integer x = 631
integer y = 24
integer width = 521
integer height = 360
boolean bringtotop = true
borderstyle borderstyle = stylelowered!
boolean vignette = true
end type

on ole_photo027.destroy
call gearbox::destroy
end on

type ole_photo031 from gearbox within w_diagnos_maj_ernoult3
string tag = "{RPA/AT2}"
boolean visible = true
integer x = 1783
integer y = 24
integer width = 521
integer height = 360
boolean bringtotop = true
borderstyle borderstyle = stylelowered!
boolean vignette = true
end type

on ole_photo031.destroy
call gearbox::destroy
end on

type ole_photo032 from gearbox within w_diagnos_maj_ernoult3
string tag = "{RPD/AT2}"
boolean visible = true
integer x = 2935
integer y = 984
integer width = 521
integer height = 360
boolean bringtotop = true
borderstyle borderstyle = stylelowered!
boolean vignette = true
end type

on ole_photo032.destroy
call gearbox::destroy
end on

type ole_photo033 from gearbox within w_diagnos_maj_ernoult3
string tag = "{OTM/AT2}"
boolean visible = true
integer x = 1207
integer y = 480
integer width = 521
integer height = 360
boolean bringtotop = true
borderstyle borderstyle = stylelowered!
boolean vignette = true
end type

on ole_photo033.destroy
call gearbox::destroy
end on

type ole_photo071 from gearbox within w_diagnos_maj_ernoult3
string tag = "{OTC/AT2}"
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

on ole_photo071.destroy
call gearbox::destroy
end on

