$PBExportHeader$w_diagnos_maj_ernoult_base.srw
$PBExportComments$gearbox
forward
global type w_diagnos_maj_ernoult_base from w_diagnos_maj_
end type
type sle_1 from singlelineedit within w_diagnos_maj_ernoult_base
end type
type sle_11 from singlelineedit within w_diagnos_maj_ernoult_base
end type
type sle_3 from singlelineedit within w_diagnos_maj_ernoult_base
end type
type sle_4 from singlelineedit within w_diagnos_maj_ernoult_base
end type
type sle_5 from singlelineedit within w_diagnos_maj_ernoult_base
end type
type sle_6 from singlelineedit within w_diagnos_maj_ernoult_base
end type
type sle_7 from singlelineedit within w_diagnos_maj_ernoult_base
end type
type sle_8 from singlelineedit within w_diagnos_maj_ernoult_base
end type
type sle_9 from singlelineedit within w_diagnos_maj_ernoult_base
end type
type st_1 from statictext within w_diagnos_maj_ernoult_base
end type
type st_2 from statictext within w_diagnos_maj_ernoult_base
end type
type st_3 from statictext within w_diagnos_maj_ernoult_base
end type
type st_4 from statictext within w_diagnos_maj_ernoult_base
end type
type st_5 from statictext within w_diagnos_maj_ernoult_base
end type
type st_6 from statictext within w_diagnos_maj_ernoult_base
end type
type st_7 from statictext within w_diagnos_maj_ernoult_base
end type
type st_8 from statictext within w_diagnos_maj_ernoult_base
end type
type st_9 from statictext within w_diagnos_maj_ernoult_base
end type
type st_10 from statictext within w_diagnos_maj_ernoult_base
end type
type st_11 from statictext within w_diagnos_maj_ernoult_base
end type
type st_12 from statictext within w_diagnos_maj_ernoult_base
end type
type em_plus_encomb from editmask within w_diagnos_maj_ernoult_base
end type
type em_plus_spee from editmask within w_diagnos_maj_ernoult_base
end type
type em_plus_leeway from editmask within w_diagnos_maj_ernoult_base
end type
type em_plus_repos from editmask within w_diagnos_maj_ernoult_base
end type
type em_plus_expans from editmask within w_diagnos_maj_ernoult_base
end type
type em_plus_stripping from editmask within w_diagnos_maj_ernoult_base
end type
type em_plus_extract from editmask within w_diagnos_maj_ernoult_base
end type
type em_moins_encomb from editmask within w_diagnos_maj_ernoult_base
end type
type em_moins_spee from editmask within w_diagnos_maj_ernoult_base
end type
type em_moins_leeway from editmask within w_diagnos_maj_ernoult_base
end type
type em_moins_repos from editmask within w_diagnos_maj_ernoult_base
end type
type em_moins_expans from editmask within w_diagnos_maj_ernoult_base
end type
type em_moins_stripping from editmask within w_diagnos_maj_ernoult_base
end type
type em_moins_extract from editmask within w_diagnos_maj_ernoult_base
end type
type st_total_1 from statictext within w_diagnos_maj_ernoult_base
end type
type st_total from statictext within w_diagnos_maj_ernoult_base
end type
type mle_resum_diag from multilineedit within w_diagnos_maj_ernoult_base
end type
type mle_resum_plt from multilineedit within w_diagnos_maj_ernoult_base
end type
type st_17 from statictext within w_diagnos_maj_ernoult_base
end type
type st_18 from statictext within w_diagnos_maj_ernoult_base
end type
type st_19 from statictext within w_diagnos_maj_ernoult_base
end type
type mle_resum_cephal from multilineedit within w_diagnos_maj_ernoult_base
end type
type cb_odrade from commandbutton within w_diagnos_maj_ernoult_base
end type
type cb_transferer from commandbutton within w_diagnos_maj_ernoult_base
end type
type mle_exam from multilineedit within w_diagnos_maj_ernoult_base
end type
type st_13 from statictext within w_diagnos_maj_ernoult_base
end type
type cb_1 from commandbutton within w_diagnos_maj_ernoult_base
end type
type cb_transferer_exam_fonc from commandbutton within w_diagnos_maj_ernoult_base
end type
type gb_1 from groupbox within w_diagnos_maj_ernoult_base
end type
end forward

global type w_diagnos_maj_ernoult_base from w_diagnos_maj_
integer width = 3575
sle_1 sle_1
sle_11 sle_11
sle_3 sle_3
sle_4 sle_4
sle_5 sle_5
sle_6 sle_6
sle_7 sle_7
sle_8 sle_8
sle_9 sle_9
st_1 st_1
st_2 st_2
st_3 st_3
st_4 st_4
st_5 st_5
st_6 st_6
st_7 st_7
st_8 st_8
st_9 st_9
st_10 st_10
st_11 st_11
st_12 st_12
em_plus_encomb em_plus_encomb
em_plus_spee em_plus_spee
em_plus_leeway em_plus_leeway
em_plus_repos em_plus_repos
em_plus_expans em_plus_expans
em_plus_stripping em_plus_stripping
em_plus_extract em_plus_extract
em_moins_encomb em_moins_encomb
em_moins_spee em_moins_spee
em_moins_leeway em_moins_leeway
em_moins_repos em_moins_repos
em_moins_expans em_moins_expans
em_moins_stripping em_moins_stripping
em_moins_extract em_moins_extract
st_total_1 st_total_1
st_total st_total
mle_resum_diag mle_resum_diag
mle_resum_plt mle_resum_plt
st_17 st_17
st_18 st_18
st_19 st_19
mle_resum_cephal mle_resum_cephal
cb_odrade cb_odrade
cb_transferer cb_transferer
mle_exam mle_exam
st_13 st_13
cb_1 cb_1
cb_transferer_exam_fonc cb_transferer_exam_fonc
gb_1 gb_1
end type
global w_diagnos_maj_ernoult_base w_diagnos_maj_ernoult_base

forward prototypes
private function string une_ligne_generer (singlelineedit sle)
private subroutine fenetre_reouvrir ()
protected subroutine odrade_recup (integer radio, integer tab_mesure, ref multilineedit mle_resume_cephalo)
protected subroutine resume_diag_generer ()
protected subroutine total_1_generer ()
protected subroutine total_generer ()
end prototypes

private function string une_ligne_generer (singlelineedit sle);// renvoie le texte inscrit ds la sle passé en param avec un retour à la ligne
// si texte du sle en param est non vide
// renvoie vide sinon

string		returnval = ""


if sle.text <> "" then
	returnval = sle.text + char(13) + char(10)
end if
	
return returnval
end function

private subroutine fenetre_reouvrir ();// rafraichissement de la fenêtre pour l'import ODRADE
w_diagnos_maj_		W_fille
int		num_fichier	// numéro du fichier donné par fx fileopen()
string	recup_fichier	// pour recupérer les données du fichiers texte


// recup du résumé céphalo
num_fichier = FileOpen( dir_ini + "temp_ernoult.txt", StreamMode! )
FileRead( num_fichier, recup_fichier )
if not isnull( recup_fichier ) AND recup_fichier <> "" then mle_resum_cephal.text = recup_fichier
FileClose( num_fichier )

// on force la procédure de sauvegarde des données
sauvegarder( false )

// on reouvre la fenetre
if ui_v2020 then
	OpenWithParm( W_fille, var_code_local, w_mdi_2020)
else
	OpenSheetWithParm( W_fille, var_code_local, this.classname(), w_mdi, 1, Original!)
end if

// on ferme cette occurence
Close(this)
end subroutine

protected subroutine odrade_recup (integer radio, integer tab_mesure, ref multilineedit mle_resume_cephalo);// donne un accès rapide au lien ODRADE 
// afin de récupérer rapidement 
// ** la radio				--> numéro du cadre passé en param
// ** le tab de mesures	--> numéro du cadre passé en param

param_lien_odrade	p

//cb_sauver.triggerevent(clicked!)

if var_code_local <> 0 AND radio <> 0 AND tab_mesure <> 0 then
	p.mode = 1	// mode automatique du lien odrade
	p.code_patient = var_code_local
	p.numero_cadre_trace = radio
	p.numero_cadre_tableau = tab_mesure
	p.plan = ""
	
	connect using t_odrade ;
	
	openWithParm(w_main_odrade,p)
	
	//cb_annuler.triggerevent(rbuttondown!)
	
else
	messagebox( "ERREUR ...", "Récupération ODRADE impossible ...",StopSign! )
end if

end subroutine

protected subroutine resume_diag_generer ();// concaténation des lignes de texte cituées sous les cadres images
// ATTENTION : aucune ligne pour les cadres image 2 et 10
mle_resum_diag.text =	une_ligne_generer( sle_1 ) + &
							une_ligne_generer( sle_3 ) + &
							une_ligne_generer( sle_4 ) + &
							une_ligne_generer( sle_5 ) + &
							une_ligne_generer( sle_6 ) + &
							une_ligne_generer( sle_7 ) + &
							une_ligne_generer( sle_8 ) + &
							une_ligne_generer( sle_9 ) + &
							une_ligne_generer( sle_11 )

end subroutine

protected subroutine total_1_generer ();st_total_1.text = string(	( double(em_plus_encomb.text) + double(em_plus_spee.text) + double(em_plus_leeway.text) ) &
							- &
							( double(em_moins_encomb.text) + double(em_moins_spee.text) + double(em_moins_leeway.text) ) )

end subroutine

protected subroutine total_generer ();st_total.text = string( 	double(st_total_1.text) &
						+ &
						( double(em_plus_repos.text) + double(em_plus_expans.text) + double(em_plus_stripping.text) + double(em_plus_extract.text) ) &
						- &
						( double(em_moins_repos.text) + double(em_moins_expans.text) + double(em_moins_stripping.text) + double(em_moins_extract.text) ) )

end subroutine

on w_diagnos_maj_ernoult_base.create
int iCurrent
call super::create
this.sle_1=create sle_1
this.sle_11=create sle_11
this.sle_3=create sle_3
this.sle_4=create sle_4
this.sle_5=create sle_5
this.sle_6=create sle_6
this.sle_7=create sle_7
this.sle_8=create sle_8
this.sle_9=create sle_9
this.st_1=create st_1
this.st_2=create st_2
this.st_3=create st_3
this.st_4=create st_4
this.st_5=create st_5
this.st_6=create st_6
this.st_7=create st_7
this.st_8=create st_8
this.st_9=create st_9
this.st_10=create st_10
this.st_11=create st_11
this.st_12=create st_12
this.em_plus_encomb=create em_plus_encomb
this.em_plus_spee=create em_plus_spee
this.em_plus_leeway=create em_plus_leeway
this.em_plus_repos=create em_plus_repos
this.em_plus_expans=create em_plus_expans
this.em_plus_stripping=create em_plus_stripping
this.em_plus_extract=create em_plus_extract
this.em_moins_encomb=create em_moins_encomb
this.em_moins_spee=create em_moins_spee
this.em_moins_leeway=create em_moins_leeway
this.em_moins_repos=create em_moins_repos
this.em_moins_expans=create em_moins_expans
this.em_moins_stripping=create em_moins_stripping
this.em_moins_extract=create em_moins_extract
this.st_total_1=create st_total_1
this.st_total=create st_total
this.mle_resum_diag=create mle_resum_diag
this.mle_resum_plt=create mle_resum_plt
this.st_17=create st_17
this.st_18=create st_18
this.st_19=create st_19
this.mle_resum_cephal=create mle_resum_cephal
this.cb_odrade=create cb_odrade
this.cb_transferer=create cb_transferer
this.mle_exam=create mle_exam
this.st_13=create st_13
this.cb_1=create cb_1
this.cb_transferer_exam_fonc=create cb_transferer_exam_fonc
this.gb_1=create gb_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.sle_1
this.Control[iCurrent+2]=this.sle_11
this.Control[iCurrent+3]=this.sle_3
this.Control[iCurrent+4]=this.sle_4
this.Control[iCurrent+5]=this.sle_5
this.Control[iCurrent+6]=this.sle_6
this.Control[iCurrent+7]=this.sle_7
this.Control[iCurrent+8]=this.sle_8
this.Control[iCurrent+9]=this.sle_9
this.Control[iCurrent+10]=this.st_1
this.Control[iCurrent+11]=this.st_2
this.Control[iCurrent+12]=this.st_3
this.Control[iCurrent+13]=this.st_4
this.Control[iCurrent+14]=this.st_5
this.Control[iCurrent+15]=this.st_6
this.Control[iCurrent+16]=this.st_7
this.Control[iCurrent+17]=this.st_8
this.Control[iCurrent+18]=this.st_9
this.Control[iCurrent+19]=this.st_10
this.Control[iCurrent+20]=this.st_11
this.Control[iCurrent+21]=this.st_12
this.Control[iCurrent+22]=this.em_plus_encomb
this.Control[iCurrent+23]=this.em_plus_spee
this.Control[iCurrent+24]=this.em_plus_leeway
this.Control[iCurrent+25]=this.em_plus_repos
this.Control[iCurrent+26]=this.em_plus_expans
this.Control[iCurrent+27]=this.em_plus_stripping
this.Control[iCurrent+28]=this.em_plus_extract
this.Control[iCurrent+29]=this.em_moins_encomb
this.Control[iCurrent+30]=this.em_moins_spee
this.Control[iCurrent+31]=this.em_moins_leeway
this.Control[iCurrent+32]=this.em_moins_repos
this.Control[iCurrent+33]=this.em_moins_expans
this.Control[iCurrent+34]=this.em_moins_stripping
this.Control[iCurrent+35]=this.em_moins_extract
this.Control[iCurrent+36]=this.st_total_1
this.Control[iCurrent+37]=this.st_total
this.Control[iCurrent+38]=this.mle_resum_diag
this.Control[iCurrent+39]=this.mle_resum_plt
this.Control[iCurrent+40]=this.st_17
this.Control[iCurrent+41]=this.st_18
this.Control[iCurrent+42]=this.st_19
this.Control[iCurrent+43]=this.mle_resum_cephal
this.Control[iCurrent+44]=this.cb_odrade
this.Control[iCurrent+45]=this.cb_transferer
this.Control[iCurrent+46]=this.mle_exam
this.Control[iCurrent+47]=this.st_13
this.Control[iCurrent+48]=this.cb_1
this.Control[iCurrent+49]=this.cb_transferer_exam_fonc
this.Control[iCurrent+50]=this.gb_1
end on

on w_diagnos_maj_ernoult_base.destroy
call super::destroy
destroy(this.sle_1)
destroy(this.sle_11)
destroy(this.sle_3)
destroy(this.sle_4)
destroy(this.sle_5)
destroy(this.sle_6)
destroy(this.sle_7)
destroy(this.sle_8)
destroy(this.sle_9)
destroy(this.st_1)
destroy(this.st_2)
destroy(this.st_3)
destroy(this.st_4)
destroy(this.st_5)
destroy(this.st_6)
destroy(this.st_7)
destroy(this.st_8)
destroy(this.st_9)
destroy(this.st_10)
destroy(this.st_11)
destroy(this.st_12)
destroy(this.em_plus_encomb)
destroy(this.em_plus_spee)
destroy(this.em_plus_leeway)
destroy(this.em_plus_repos)
destroy(this.em_plus_expans)
destroy(this.em_plus_stripping)
destroy(this.em_plus_extract)
destroy(this.em_moins_encomb)
destroy(this.em_moins_spee)
destroy(this.em_moins_leeway)
destroy(this.em_moins_repos)
destroy(this.em_moins_expans)
destroy(this.em_moins_stripping)
destroy(this.em_moins_extract)
destroy(this.st_total_1)
destroy(this.st_total)
destroy(this.mle_resum_diag)
destroy(this.mle_resum_plt)
destroy(this.st_17)
destroy(this.st_18)
destroy(this.st_19)
destroy(this.mle_resum_cephal)
destroy(this.cb_odrade)
destroy(this.cb_transferer)
destroy(this.mle_exam)
destroy(this.st_13)
destroy(this.cb_1)
destroy(this.cb_transferer_exam_fonc)
destroy(this.gb_1)
end on

type pb_suivant from w_diagnos_maj_`pb_suivant within w_diagnos_maj_ernoult_base
integer taborder = 330
end type

type pb_precedant from w_diagnos_maj_`pb_precedant within w_diagnos_maj_ernoult_base
integer taborder = 320
end type

type cb_imprimer from w_diagnos_maj_`cb_imprimer within w_diagnos_maj_ernoult_base
integer taborder = 280
end type

type cb_sauver from w_diagnos_maj_`cb_sauver within w_diagnos_maj_ernoult_base
integer taborder = 300
end type

type cb_annuler from w_diagnos_maj_`cb_annuler within w_diagnos_maj_ernoult_base
integer taborder = 290
end type

type cb_fermer from w_diagnos_maj_`cb_fermer within w_diagnos_maj_ernoult_base
integer taborder = 310
end type

type sle_1 from singlelineedit within w_diagnos_maj_ernoult_base
integer x = 2935
integer y = 384
integer width = 521
integer height = 72
integer taborder = 10
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
integer limit = 50
borderstyle borderstyle = stylelowered!
end type

event losefocus;resume_diag_generer()
end event

type sle_11 from singlelineedit within w_diagnos_maj_ernoult_base
integer x = 1207
integer y = 840
integer width = 521
integer height = 72
integer taborder = 90
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
integer limit = 50
borderstyle borderstyle = stylelowered!
end type

event losefocus;resume_diag_generer()
end event

type sle_3 from singlelineedit within w_diagnos_maj_ernoult_base
integer x = 2359
integer y = 384
integer width = 521
integer height = 72
integer taborder = 20
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
integer limit = 50
borderstyle borderstyle = stylelowered!
end type

event losefocus;resume_diag_generer()
end event

type sle_4 from singlelineedit within w_diagnos_maj_ernoult_base
integer x = 55
integer y = 384
integer width = 521
integer height = 72
integer taborder = 30
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
integer limit = 50
borderstyle borderstyle = stylelowered!
end type

event losefocus;resume_diag_generer()
end event

type sle_5 from singlelineedit within w_diagnos_maj_ernoult_base
integer x = 631
integer y = 384
integer width = 521
integer height = 72
integer taborder = 40
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
integer limit = 50
borderstyle borderstyle = stylelowered!
end type

event losefocus;resume_diag_generer()
end event

type sle_6 from singlelineedit within w_diagnos_maj_ernoult_base
integer x = 1207
integer y = 384
integer width = 521
integer height = 72
integer taborder = 50
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
integer limit = 50
borderstyle borderstyle = stylelowered!
end type

event losefocus;resume_diag_generer()
end event

type sle_7 from singlelineedit within w_diagnos_maj_ernoult_base
integer x = 55
integer y = 840
integer width = 521
integer height = 72
integer taborder = 60
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
integer limit = 50
borderstyle borderstyle = stylelowered!
end type

event losefocus;resume_diag_generer()
end event

type sle_8 from singlelineedit within w_diagnos_maj_ernoult_base
integer x = 631
integer y = 840
integer width = 521
integer height = 72
integer taborder = 70
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
integer limit = 50
borderstyle borderstyle = stylelowered!
end type

event losefocus;resume_diag_generer()
end event

type sle_9 from singlelineedit within w_diagnos_maj_ernoult_base
integer x = 1783
integer y = 384
integer width = 521
integer height = 72
integer taborder = 80
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
integer limit = 50
borderstyle borderstyle = stylelowered!
end type

event losefocus;resume_diag_generer()
end event

type st_1 from statictext within w_diagnos_maj_ernoult_base
integer x = 1920
integer y = 552
integer width = 411
integer height = 72
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = " Calcul D.D.M."
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type st_2 from statictext within w_diagnos_maj_ernoult_base
integer x = 1920
integer y = 648
integer width = 411
integer height = 72
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = " Encombrement"
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type st_3 from statictext within w_diagnos_maj_ernoult_base
integer x = 1920
integer y = 720
integer width = 411
integer height = 72
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = " Courbe de Spee"
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type st_4 from statictext within w_diagnos_maj_ernoult_base
integer x = 1920
integer y = 792
integer width = 411
integer height = 72
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = " Lee Way"
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type st_5 from statictext within w_diagnos_maj_ernoult_base
integer x = 1920
integer y = 888
integer width = 411
integer height = 72
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = " TOTAL 1"
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type st_6 from statictext within w_diagnos_maj_ernoult_base
integer x = 1920
integer y = 984
integer width = 411
integer height = 72
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = " Repos. incisive"
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type st_7 from statictext within w_diagnos_maj_ernoult_base
integer x = 1920
integer y = 1056
integer width = 411
integer height = 72
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = " Expansion"
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type st_8 from statictext within w_diagnos_maj_ernoult_base
integer x = 1920
integer y = 1128
integer width = 411
integer height = 72
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = " Stripping"
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type st_9 from statictext within w_diagnos_maj_ernoult_base
integer x = 1920
integer y = 1200
integer width = 411
integer height = 72
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = " Extraction"
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type st_10 from statictext within w_diagnos_maj_ernoult_base
integer x = 1920
integer y = 1296
integer width = 411
integer height = 72
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = " TOTAL 2"
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type st_11 from statictext within w_diagnos_maj_ernoult_base
integer x = 2331
integer y = 552
integer width = 274
integer height = 72
boolean bringtotop = true
integer textsize = -12
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 255
long backcolor = 67108864
string text = "+"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type st_12 from statictext within w_diagnos_maj_ernoult_base
integer x = 2606
integer y = 552
integer width = 274
integer height = 72
boolean bringtotop = true
integer textsize = -12
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 16711680
long backcolor = 67108864
string text = "-"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type em_plus_encomb from editmask within w_diagnos_maj_ernoult_base
integer x = 2331
integer y = 648
integer width = 274
integer height = 72
integer taborder = 140
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = stringmask!
string mask = "xxxxxx"
end type

event losefocus;total_1_generer()
end event

type em_plus_spee from editmask within w_diagnos_maj_ernoult_base
integer x = 2331
integer y = 720
integer width = 274
integer height = 72
integer taborder = 160
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = stringmask!
string mask = "xxxxxx"
end type

event losefocus;total_1_generer()
end event

type em_plus_leeway from editmask within w_diagnos_maj_ernoult_base
integer x = 2331
integer y = 792
integer width = 274
integer height = 72
integer taborder = 180
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = stringmask!
string mask = "xxxxxx"
end type

event losefocus;total_1_generer()
end event

type em_plus_repos from editmask within w_diagnos_maj_ernoult_base
integer x = 2331
integer y = 984
integer width = 274
integer height = 72
integer taborder = 200
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = stringmask!
string mask = "xxxxxx"
end type

event losefocus;total_generer()
end event

type em_plus_expans from editmask within w_diagnos_maj_ernoult_base
integer x = 2331
integer y = 1056
integer width = 274
integer height = 72
integer taborder = 220
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = stringmask!
string mask = "xxxxxx"
end type

event losefocus;total_generer()
end event

type em_plus_stripping from editmask within w_diagnos_maj_ernoult_base
integer x = 2331
integer y = 1128
integer width = 274
integer height = 72
integer taborder = 240
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = stringmask!
string mask = "xxxxxx"
end type

event losefocus;total_generer()
end event

type em_plus_extract from editmask within w_diagnos_maj_ernoult_base
integer x = 2331
integer y = 1200
integer width = 274
integer height = 72
integer taborder = 260
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = stringmask!
string mask = "xxxxxx"
end type

event losefocus;total_generer()
end event

type em_moins_encomb from editmask within w_diagnos_maj_ernoult_base
integer x = 2606
integer y = 648
integer width = 274
integer height = 72
integer taborder = 150
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = stringmask!
string mask = "xxxxxx"
end type

event losefocus;total_1_generer()
end event

type em_moins_spee from editmask within w_diagnos_maj_ernoult_base
integer x = 2606
integer y = 720
integer width = 274
integer height = 72
integer taborder = 170
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = stringmask!
string mask = "xxxxxx"
end type

event losefocus;total_1_generer()
end event

type em_moins_leeway from editmask within w_diagnos_maj_ernoult_base
integer x = 2606
integer y = 792
integer width = 274
integer height = 72
integer taborder = 190
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = stringmask!
string mask = "xxxxxx"
end type

event losefocus;total_1_generer()
end event

type em_moins_repos from editmask within w_diagnos_maj_ernoult_base
integer x = 2606
integer y = 984
integer width = 274
integer height = 72
integer taborder = 210
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = stringmask!
string mask = "xxxxxx"
end type

event losefocus;total_generer()
end event

type em_moins_expans from editmask within w_diagnos_maj_ernoult_base
integer x = 2606
integer y = 1056
integer width = 274
integer height = 72
integer taborder = 230
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = stringmask!
string mask = "xxxxxx"
end type

event losefocus;total_generer()
end event

type em_moins_stripping from editmask within w_diagnos_maj_ernoult_base
integer x = 2606
integer y = 1128
integer width = 274
integer height = 72
integer taborder = 250
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = stringmask!
string mask = "xxxxxx"
end type

event losefocus;total_generer()
end event

type em_moins_extract from editmask within w_diagnos_maj_ernoult_base
integer x = 2606
integer y = 1200
integer width = 274
integer height = 72
integer taborder = 270
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = stringmask!
string mask = "xxxxxx"
end type

event losefocus;total_generer()
end event

type st_total_1 from statictext within w_diagnos_maj_ernoult_base
integer x = 2331
integer y = 888
integer width = 549
integer height = 72
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 255
long backcolor = 67108864
string text = "0"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type st_total from statictext within w_diagnos_maj_ernoult_base
integer x = 2331
integer y = 1296
integer width = 549
integer height = 72
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 255
long backcolor = 67108864
string text = "0"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type mle_resum_diag from multilineedit within w_diagnos_maj_ernoult_base
integer x = 27
integer y = 1008
integer width = 878
integer height = 360
integer taborder = 120
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
boolean hscrollbar = true
boolean vscrollbar = true
integer limit = 500
boolean displayonly = true
borderstyle borderstyle = stylelowered!
boolean ignoredefaultbutton = true
end type

type mle_resum_plt from multilineedit within w_diagnos_maj_ernoult_base
integer x = 933
integer y = 1056
integer width = 878
integer height = 312
integer taborder = 100
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
boolean vscrollbar = true
integer limit = 500
borderstyle borderstyle = stylelowered!
boolean ignoredefaultbutton = true
end type

type st_17 from statictext within w_diagnos_maj_ernoult_base
integer x = 55
integer y = 936
integer width = 494
integer height = 72
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Résumé Diagnostic :"
boolean focusrectangle = false
end type

type st_18 from statictext within w_diagnos_maj_ernoult_base
integer x = 960
integer y = 936
integer width = 466
integer height = 120
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Résumé du Plan de Traitement :"
boolean focusrectangle = false
end type

type st_19 from statictext within w_diagnos_maj_ernoult_base
integer x = 55
integer y = 1392
integer width = 631
integer height = 72
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Résumé Céphalométrique :"
boolean focusrectangle = false
end type

type mle_resum_cephal from multilineedit within w_diagnos_maj_ernoult_base
integer x = 27
integer y = 1464
integer width = 1371
integer height = 336
integer taborder = 110
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
boolean vscrollbar = true
integer limit = 1000
borderstyle borderstyle = stylelowered!
boolean ignoredefaultbutton = true
end type

type cb_odrade from commandbutton within w_diagnos_maj_ernoult_base
integer x = 1426
integer y = 1392
integer width = 411
integer height = 120
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "ODRADE"
end type

type cb_transferer from commandbutton within w_diagnos_maj_ernoult_base
integer x = 1426
integer y = 936
integer width = 384
integer height = 96
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Transférer"
end type

event clicked;if messagebox( "Transférer ...", "Confirmez-vous le transfert du Plan de Traitement ~nci-dessous dans l'onglet Traitement de la fiche administrative ?", Question!, OKCancel!) = 1 then
	f.ecrire_pt( mle_resum_plt, var_code_local)
end if

end event

type mle_exam from multilineedit within w_diagnos_maj_ernoult_base
integer x = 1865
integer y = 1488
integer width = 1618
integer height = 144
integer taborder = 130
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
boolean vscrollbar = true
integer limit = 500
borderstyle borderstyle = stylelowered!
boolean ignoredefaultbutton = true
end type

type st_13 from statictext within w_diagnos_maj_ernoult_base
integer x = 1893
integer y = 1416
integer width = 795
integer height = 72
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Motivations et examen fonctionel :"
boolean focusrectangle = false
end type

type cb_1 from commandbutton within w_diagnos_maj_ernoult_base
integer x = 1426
integer y = 1512
integer width = 411
integer height = 120
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Rafraichir"
end type

event clicked;fenetre_reouvrir()
end event

type cb_transferer_exam_fonc from commandbutton within w_diagnos_maj_ernoult_base
integer x = 2688
integer y = 1392
integer width = 439
integer height = 96
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Transférer"
end type

event clicked;if messagebox( "Transférer ...", "Confirmez-vous le transfert de l'Examen Fonctionnel ~nci-dessous dans la zone Facteur(s) Fonctionnel(s) de la fiche administrative ?", Question!, OKCancel!) = 1 then
	string	exam_fonc
	exam_fonc = left(mle_exam.text, 100)	// ds la base le champ est limité à 100 carac
	UPDATE patient SET facteur = :exam_fonc WHERE code = :var_code_local ;
	if SQLCA.Sqlcode <> 0 then
		son(4)
		Messagebox("ERREUR BASE DE DONNEES (N°3) : ",SQLCA.SqlErrText)
	else
		COMMIT ;
	end if
end if

end event

type gb_1 from groupbox within w_diagnos_maj_ernoult_base
integer x = 1865
integer y = 480
integer width = 1646
integer height = 912
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Céphalo."
end type

