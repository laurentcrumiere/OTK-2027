$PBExportHeader$w_diagnos_maj_87874_4.srw
$PBExportComments$gearbox
forward
global type w_diagnos_maj_87874_4 from w_diagnos_maj_
end type
type ole_photo001 from gearbox within w_diagnos_maj_87874_4
end type
type ole_photo011 from gearbox within w_diagnos_maj_87874_4
end type
type st_1 from statictext within w_diagnos_maj_87874_4
end type
type st_2 from statictext within w_diagnos_maj_87874_4
end type
type st_3 from statictext within w_diagnos_maj_87874_4
end type
type st_4 from statictext within w_diagnos_maj_87874_4
end type
type st_5 from statictext within w_diagnos_maj_87874_4
end type
type st_6 from statictext within w_diagnos_maj_87874_4
end type
type st_7 from statictext within w_diagnos_maj_87874_4
end type
type st_8 from statictext within w_diagnos_maj_87874_4
end type
type mle_resum_exam from multilineedit within w_diagnos_maj_87874_4
end type
type mle_objectif_ttmnt from multilineedit within w_diagnos_maj_87874_4
end type
type st_15 from statictext within w_diagnos_maj_87874_4
end type
type st_16 from statictext within w_diagnos_maj_87874_4
end type
type sle_10 from singlelineedit within w_diagnos_maj_87874_4
end type
type cb_signer from commandbutton within w_diagnos_maj_87874_4
end type
type dw_prati from datawindow within w_diagnos_maj_87874_4
end type
type p_3 from picture within w_diagnos_maj_87874_4
end type
type sle_sagittal from singlelineedit within w_diagnos_maj_87874_4
end type
type sle_vertical from singlelineedit within w_diagnos_maj_87874_4
end type
type sle_fonctionnel from singlelineedit within w_diagnos_maj_87874_4
end type
type sle_trans from singlelineedit within w_diagnos_maj_87874_4
end type
type r_5 from rectangle within w_diagnos_maj_87874_4
end type
end forward

global type w_diagnos_maj_87874_4 from w_diagnos_maj_
string tag = "5000"
integer width = 3607
integer height = 2500
string title = "Page Clinique N° 4"
ole_photo001 ole_photo001
ole_photo011 ole_photo011
st_1 st_1
st_2 st_2
st_3 st_3
st_4 st_4
st_5 st_5
st_6 st_6
st_7 st_7
st_8 st_8
mle_resum_exam mle_resum_exam
mle_objectif_ttmnt mle_objectif_ttmnt
st_15 st_15
st_16 st_16
sle_10 sle_10
cb_signer cb_signer
dw_prati dw_prati
p_3 p_3
sle_sagittal sle_sagittal
sle_vertical sle_vertical
sle_fonctionnel sle_fonctionnel
sle_trans sle_trans
r_5 r_5
end type
global w_diagnos_maj_87874_4 w_diagnos_maj_87874_4

type variables
boolean modif
// pour savoir si la feuille est signée ou pas
string v_signe, v_signataire
boolean maj_signature = false
end variables

forward prototypes
public subroutine info_signature (string vv_signe)
public subroutine unload_ctrls ()
public subroutine load_ctrls ()
end prototypes

public subroutine info_signature (string vv_signe);if vv_signe = "O" then
	// déjà signé
	cb_signer.text = "Annul. Signer"
	
	// On doit verrouiller des trucs !!!!
	sle_sagittal.enabled = false
	sle_vertical.enabled = false
	sle_trans.enabled = false
	sle_fonctionnel.enabled = false
	mle_resum_exam.enabled = false
	mle_objectif_ttmnt.enabled = false
	
	// La date
	sle_10.enabled = false
	dw_prati.enabled = false
	
	// On simule le clic sur le bouton "Enregistrer" pour valider les dernières modifications au moment de la signature
	cb_sauver.triggerevent(clicked!)

else

	// pas encore
	cb_signer.text = "Signer"
	
	// On doit déverrouiller des trucs !!!!
	sle_sagittal.enabled = true
	sle_vertical.enabled = true
	sle_trans.enabled = true
	sle_fonctionnel.enabled = true
	mle_resum_exam.enabled = true
	mle_objectif_ttmnt.enabled = true
	
	// La date
	sle_10.enabled = true
	dw_prati.enabled = true

end if
end subroutine

public subroutine unload_ctrls ();f.ecrirepage(mle_resum_exam,page_buffer[2],2992,300)
f.ecrirepage(mle_objectif_ttmnt,page_buffer[2],3292,500)
f.ecrirepage(sle_10,page_buffer[2],3792,10)
f.ecrirepage(sle_sagittal,page_buffer[2],3802,55)
f.ecrirepage(sle_vertical,page_buffer[2],3857,55)
f.ecrirepage(sle_fonctionnel,page_buffer[2],3912,55)
f.ecrirepage(sle_trans,page_buffer[2],3967,55)
// max carac = 4022


if maj_signature then

	update diagnos set plus1 = :v_signe, plan_traitement = :v_signataire  
	where code = :var_code_local ;
	
	if sqlca.sqlcode = 0 then 
		commit ;
	else
		rollback ;
		Messagebox("ATTENTION","Erreur lors de la mise à jour de la signature")
	end if
	
	info_signature(v_signe)
end if
end subroutine

public subroutine load_ctrls ();f.lirepage(mle_resum_exam,page_buffer[1],2992,300)
f.lirepage(mle_objectif_ttmnt,page_buffer[1],3292,500)
f.lirepage(sle_10,page_buffer[1],3792,10)
f.lirepage(sle_sagittal,page_buffer[1],3802,55)
f.lirepage(sle_vertical,page_buffer[1],3857,55)
f.lirepage(sle_fonctionnel,page_buffer[1],3912,55)
f.lirepage(sle_trans,page_buffer[1],3967,55)
// max carac = 4022



// pour la signature
dw_prati.settransobject(sqlca)
dw_prati.retrieve()

// Le champ plus1 servira à stocker si la page 4 est signée ou pas
// vaudra "O" si signée

// le champ plan_traitement de diagnos servira à la signature de la page 4
select isnull(plus1,'N'), isnull(plan_traitement,'') 
into :v_signe, :v_signataire from diagnos  where code = :var_code_local ;

if v_signataire <> '' then
	dw_prati.Scrolltorow(dw_prati.Find("code = '"+ v_signataire+"'", 0, 9999))
end if

info_signature(v_signe)

end subroutine

on w_diagnos_maj_87874_4.create
int iCurrent
call super::create
this.ole_photo001=create ole_photo001
this.ole_photo011=create ole_photo011
this.st_1=create st_1
this.st_2=create st_2
this.st_3=create st_3
this.st_4=create st_4
this.st_5=create st_5
this.st_6=create st_6
this.st_7=create st_7
this.st_8=create st_8
this.mle_resum_exam=create mle_resum_exam
this.mle_objectif_ttmnt=create mle_objectif_ttmnt
this.st_15=create st_15
this.st_16=create st_16
this.sle_10=create sle_10
this.cb_signer=create cb_signer
this.dw_prati=create dw_prati
this.p_3=create p_3
this.sle_sagittal=create sle_sagittal
this.sle_vertical=create sle_vertical
this.sle_fonctionnel=create sle_fonctionnel
this.sle_trans=create sle_trans
this.r_5=create r_5
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.ole_photo001
this.Control[iCurrent+2]=this.ole_photo011
this.Control[iCurrent+3]=this.st_1
this.Control[iCurrent+4]=this.st_2
this.Control[iCurrent+5]=this.st_3
this.Control[iCurrent+6]=this.st_4
this.Control[iCurrent+7]=this.st_5
this.Control[iCurrent+8]=this.st_6
this.Control[iCurrent+9]=this.st_7
this.Control[iCurrent+10]=this.st_8
this.Control[iCurrent+11]=this.mle_resum_exam
this.Control[iCurrent+12]=this.mle_objectif_ttmnt
this.Control[iCurrent+13]=this.st_15
this.Control[iCurrent+14]=this.st_16
this.Control[iCurrent+15]=this.sle_10
this.Control[iCurrent+16]=this.cb_signer
this.Control[iCurrent+17]=this.dw_prati
this.Control[iCurrent+18]=this.p_3
this.Control[iCurrent+19]=this.sle_sagittal
this.Control[iCurrent+20]=this.sle_vertical
this.Control[iCurrent+21]=this.sle_fonctionnel
this.Control[iCurrent+22]=this.sle_trans
this.Control[iCurrent+23]=this.r_5
end on

on w_diagnos_maj_87874_4.destroy
call super::destroy
destroy(this.ole_photo001)
destroy(this.ole_photo011)
destroy(this.st_1)
destroy(this.st_2)
destroy(this.st_3)
destroy(this.st_4)
destroy(this.st_5)
destroy(this.st_6)
destroy(this.st_7)
destroy(this.st_8)
destroy(this.mle_resum_exam)
destroy(this.mle_objectif_ttmnt)
destroy(this.st_15)
destroy(this.st_16)
destroy(this.sle_10)
destroy(this.cb_signer)
destroy(this.dw_prati)
destroy(this.p_3)
destroy(this.sle_sagittal)
destroy(this.sle_vertical)
destroy(this.sle_fonctionnel)
destroy(this.sle_trans)
destroy(this.r_5)
end on

type pb_suivant from w_diagnos_maj_`pb_suivant within w_diagnos_maj_87874_4
string tag = "87874_5"
integer y = 2252
end type

type pb_precedant from w_diagnos_maj_`pb_precedant within w_diagnos_maj_87874_4
string tag = "87874_3"
integer y = 2252
end type

type cb_imprimer from w_diagnos_maj_`cb_imprimer within w_diagnos_maj_87874_4
integer y = 2252
end type

type cb_sauver from w_diagnos_maj_`cb_sauver within w_diagnos_maj_87874_4
integer y = 2252
end type

type cb_annuler from w_diagnos_maj_`cb_annuler within w_diagnos_maj_87874_4
integer y = 2252
end type

type cb_fermer from w_diagnos_maj_`cb_fermer within w_diagnos_maj_87874_4
integer y = 2252
end type

type ole_photo001 from gearbox within w_diagnos_maj_87874_4
string tag = "{RPA/AT1}"
integer x = 73
integer y = 192
integer width = 521
integer height = 384
boolean bringtotop = true
end type

on ole_photo001.destroy
call gearbox::destroy
end on

type ole_photo011 from gearbox within w_diagnos_maj_87874_4
string tag = "{RPD/AT1}"
integer x = 2958
integer y = 192
integer width = 521
integer height = 384
boolean bringtotop = true
end type

on ole_photo011.destroy
call gearbox::destroy
end on

type st_1 from statictext within w_diagnos_maj_87874_4
integer x = 1463
integer y = 32
integer width = 480
integer height = 100
boolean bringtotop = true
integer textsize = -16
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Diagnostic"
boolean focusrectangle = false
end type

type st_2 from statictext within w_diagnos_maj_87874_4
integer x = 1463
integer y = 160
integer width = 480
integer height = 68
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Résumé du diag :"
boolean focusrectangle = false
end type

type st_3 from statictext within w_diagnos_maj_87874_4
integer x = 914
integer y = 268
integer width = 334
integer height = 68
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Sagittal"
boolean focusrectangle = false
end type

type st_4 from statictext within w_diagnos_maj_87874_4
integer x = 914
integer y = 364
integer width = 334
integer height = 68
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Vertical"
boolean focusrectangle = false
end type

type st_5 from statictext within w_diagnos_maj_87874_4
integer x = 914
integer y = 460
integer width = 334
integer height = 68
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Transversal"
boolean focusrectangle = false
end type

type st_6 from statictext within w_diagnos_maj_87874_4
integer x = 914
integer y = 556
integer width = 334
integer height = 68
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Fonctionnel"
boolean focusrectangle = false
end type

type st_7 from statictext within w_diagnos_maj_87874_4
integer x = 37
integer y = 768
integer width = 786
integer height = 68
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Résumé de l~'examen clinique"
boolean focusrectangle = false
end type

type st_8 from statictext within w_diagnos_maj_87874_4
integer x = 37
integer y = 1312
integer width = 585
integer height = 68
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Objectif du traitement"
boolean focusrectangle = false
end type

type mle_resum_exam from multilineedit within w_diagnos_maj_87874_4
integer x = 73
integer y = 864
integer width = 3406
integer height = 400
integer taborder = 50
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
integer limit = 300
borderstyle borderstyle = stylelowered!
end type

type mle_objectif_ttmnt from multilineedit within w_diagnos_maj_87874_4
integer x = 73
integer y = 1408
integer width = 3406
integer height = 680
integer taborder = 60
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
integer limit = 500
borderstyle borderstyle = stylelowered!
end type

type st_15 from statictext within w_diagnos_maj_87874_4
integer x = 123
integer y = 2264
integer width = 151
integer height = 72
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 15780518
string text = "Date"
boolean focusrectangle = false
end type

type st_16 from statictext within w_diagnos_maj_87874_4
integer x = 110
integer y = 2148
integer width = 265
integer height = 72
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 15780518
string text = "Signature"
boolean focusrectangle = false
end type

type sle_10 from singlelineedit within w_diagnos_maj_87874_4
integer x = 270
integer y = 2264
integer width = 366
integer height = 76
integer taborder = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
integer limit = 10
borderstyle borderstyle = stylelowered!
end type

type cb_signer from commandbutton within w_diagnos_maj_87874_4
integer x = 786
integer y = 2268
integer width = 535
integer height = 92
integer taborder = 90
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Signer"
end type

event clicked;string v_prat

maj_signature = true


if v_signe = 'O' then 
	// On déjà signé ...
	// => c'est pour annuler 
	// => On prend la signature du signatire
	v_prat = v_signataire
else
	v_prat = dw_prati.gettext()
end if

ok_mdp = false


  SELECT "prati"."pasfin"  
	 INTO :pasfin  
	 FROM "dba"."prati"  
	WHERE "prati"."code" = :v_prat ;
	
	
open(w_mot_passe_chu)

if ok_mdp then

	if v_signe = 'O' then
		// c'était déjà signé
		// => on désigne !!
		v_signe = 'N'
	else
		// On signe
		v_signe = 'O' 
		v_signataire = v_prat
	end if

	info_signature(v_signe)
end if



end event

type dw_prati from datawindow within w_diagnos_maj_87874_4
integer x = 379
integer y = 2160
integer width = 859
integer height = 76
integer taborder = 70
boolean bringtotop = true
string dataobject = "dw_cherche_prati"
boolean border = false
boolean livescroll = true
end type

type p_3 from picture within w_diagnos_maj_87874_4
integer x = 18
integer y = 12
integer width = 503
integer height = 164
boolean bringtotop = true
string picturename = "Saint-Luc.jpg"
boolean focusrectangle = false
end type

type sle_sagittal from singlelineedit within w_diagnos_maj_87874_4
integer x = 1280
integer y = 256
integer width = 1541
integer height = 88
integer taborder = 10
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
integer limit = 55
borderstyle borderstyle = stylelowered!
end type

type sle_vertical from singlelineedit within w_diagnos_maj_87874_4
integer x = 1280
integer y = 352
integer width = 1541
integer height = 88
integer taborder = 20
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
integer limit = 55
borderstyle borderstyle = stylelowered!
end type

type sle_fonctionnel from singlelineedit within w_diagnos_maj_87874_4
integer x = 1280
integer y = 544
integer width = 1541
integer height = 88
integer taborder = 40
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
integer limit = 55
borderstyle borderstyle = stylelowered!
end type

type sle_trans from singlelineedit within w_diagnos_maj_87874_4
integer x = 1280
integer y = 448
integer width = 1541
integer height = 88
integer taborder = 30
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
integer limit = 55
borderstyle borderstyle = stylelowered!
end type

type r_5 from rectangle within w_diagnos_maj_87874_4
integer linethickness = 4
long fillcolor = 15780518
integer x = 73
integer y = 2128
integer width = 1294
integer height = 264
end type

