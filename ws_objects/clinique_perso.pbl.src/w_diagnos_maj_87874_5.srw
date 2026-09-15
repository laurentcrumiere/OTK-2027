$PBExportHeader$w_diagnos_maj_87874_5.srw
$PBExportComments$gearbox
forward
global type w_diagnos_maj_87874_5 from w_diagnos_maj_
end type
type st_1 from statictext within w_diagnos_maj_87874_5
end type
type st_2 from statictext within w_diagnos_maj_87874_5
end type
type st_3 from statictext within w_diagnos_maj_87874_5
end type
type st_15 from statictext within w_diagnos_maj_87874_5
end type
type st_16 from statictext within w_diagnos_maj_87874_5
end type
type sle_10 from singlelineedit within w_diagnos_maj_87874_5
end type
type cb_signer from commandbutton within w_diagnos_maj_87874_5
end type
type dw_prati from datawindow within w_diagnos_maj_87874_5
end type
type ole_photo002 from gearbox within w_diagnos_maj_87874_5
end type
type ole_photo003 from gearbox within w_diagnos_maj_87874_5
end type
type ole_photo004 from gearbox within w_diagnos_maj_87874_5
end type
type ole_photo005 from gearbox within w_diagnos_maj_87874_5
end type
type ole_photo006 from gearbox within w_diagnos_maj_87874_5
end type
type ole_photo007 from gearbox within w_diagnos_maj_87874_5
end type
type ole_photo008 from gearbox within w_diagnos_maj_87874_5
end type
type ole_photo001 from gearbox within w_diagnos_maj_87874_5
end type
type cbx_corr_trans from checkbox within w_diagnos_maj_87874_5
end type
type cbx_corr_art_inv from checkbox within w_diagnos_maj_87874_5
end type
type cbx_corr_fonc from checkbox within w_diagnos_maj_87874_5
end type
type cbx_trac_dent from checkbox within w_diagnos_maj_87874_5
end type
type cbx_fentes from checkbox within w_diagnos_maj_87874_5
end type
type cbx_logo from checkbox within w_diagnos_maj_87874_5
end type
type cbx_autres from checkbox within w_diagnos_maj_87874_5
end type
type st_4 from statictext within w_diagnos_maj_87874_5
end type
type cbx_disjonc from checkbox within w_diagnos_maj_87874_5
end type
type cbx_plaque from checkbox within w_diagnos_maj_87874_5
end type
type cbx_ancrage_e-o from checkbox within w_diagnos_maj_87874_5
end type
type cbx_lip_bumper from checkbox within w_diagnos_maj_87874_5
end type
type cbx_arc_ling from checkbox within w_diagnos_maj_87874_5
end type
type cbx_activateur from checkbox within w_diagnos_maj_87874_5
end type
type cbx_fixe_partiel from checkbox within w_diagnos_maj_87874_5
end type
type rb_classique from radiobutton within w_diagnos_maj_87874_5
end type
type rb_eventail from radiobutton within w_diagnos_maj_87874_5
end type
type rb_bras_trac from radiobutton within w_diagnos_maj_87874_5
end type
type rb_bras_labio from radiobutton within w_diagnos_maj_87874_5
end type
type p_1 from picture within w_diagnos_maj_87874_5
end type
type gb_1 from groupbox within w_diagnos_maj_87874_5
end type
type r_5 from rectangle within w_diagnos_maj_87874_5
end type
type ln_1 from line within w_diagnos_maj_87874_5
end type
type ln_2 from line within w_diagnos_maj_87874_5
end type
type ln_3 from line within w_diagnos_maj_87874_5
end type
type ln_4 from line within w_diagnos_maj_87874_5
end type
type ln_5 from line within w_diagnos_maj_87874_5
end type
type ln_6 from line within w_diagnos_maj_87874_5
end type
end forward

global type w_diagnos_maj_87874_5 from w_diagnos_maj_
string tag = "5000"
integer width = 3625
integer height = 2580
string title = "Page Clinique N° 5"
st_1 st_1
st_2 st_2
st_3 st_3
st_15 st_15
st_16 st_16
sle_10 sle_10
cb_signer cb_signer
dw_prati dw_prati
ole_photo002 ole_photo002
ole_photo003 ole_photo003
ole_photo004 ole_photo004
ole_photo005 ole_photo005
ole_photo006 ole_photo006
ole_photo007 ole_photo007
ole_photo008 ole_photo008
ole_photo001 ole_photo001
cbx_corr_trans cbx_corr_trans
cbx_corr_art_inv cbx_corr_art_inv
cbx_corr_fonc cbx_corr_fonc
cbx_trac_dent cbx_trac_dent
cbx_fentes cbx_fentes
cbx_logo cbx_logo
cbx_autres cbx_autres
st_4 st_4
cbx_disjonc cbx_disjonc
cbx_plaque cbx_plaque
cbx_ancrage_e-o cbx_ancrage_e-o
cbx_lip_bumper cbx_lip_bumper
cbx_arc_ling cbx_arc_ling
cbx_activateur cbx_activateur
cbx_fixe_partiel cbx_fixe_partiel
rb_classique rb_classique
rb_eventail rb_eventail
rb_bras_trac rb_bras_trac
rb_bras_labio rb_bras_labio
p_1 p_1
gb_1 gb_1
r_5 r_5
ln_1 ln_1
ln_2 ln_2
ln_3 ln_3
ln_4 ln_4
ln_5 ln_5
ln_6 ln_6
end type
global w_diagnos_maj_87874_5 w_diagnos_maj_87874_5

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
	// Type de traitement
	cbx_corr_trans.enabled = false
	cbx_corr_art_inv.enabled = false
	cbx_corr_fonc.enabled = false
	cbx_trac_dent.enabled = false
	cbx_fentes.enabled = false
	cbx_logo.enabled = false
	cbx_autres.enabled = false
	cbx_disjonc.enabled = false
	cbx_plaque.enabled = false
	cbx_ancrage_e-o.enabled = false
	cbx_lip_bumper.enabled = false
	cbx_arc_ling.enabled = false
	cbx_activateur.enabled = false
	cbx_fixe_partiel.enabled = false
	rb_classique.enabled = false
	rb_eventail.enabled = false
	rb_bras_trac.enabled = false
	rb_bras_labio.enabled = false

	// La date
	sle_10.enabled = false
	dw_prati.enabled = false
	
	// On simule le clic sur le bouton "Enregistrer" pour valider les dernières modifications au moment de la signature
	cb_sauver.triggerevent(clicked!)
	
else
	
	// pas encore
	cb_signer.text = "Signer"
	
	// On doit déverrouiller des trucs !!!!
	// Type de traitement
	cbx_corr_trans.enabled = true
	cbx_corr_art_inv.enabled = true
	cbx_corr_fonc.enabled = true
	cbx_trac_dent.enabled = true
	cbx_fentes.enabled = true
	cbx_logo.enabled = true
	cbx_autres.enabled = true
	cbx_disjonc.enabled = true
	if cbx_disjonc.checked then 
		rb_classique.enabled = true
		rb_eventail.enabled = true
		rb_bras_trac.enabled = true
		rb_bras_labio.enabled = true
	end if	
	cbx_plaque.enabled = true
	cbx_ancrage_e-o.enabled = true
	cbx_lip_bumper.enabled = true
	cbx_arc_ling.enabled = true
	cbx_activateur.enabled = true
	cbx_fixe_partiel.enabled = true


	// La date
	sle_10.enabled = true
	dw_prati.enabled = true
end if
end subroutine

public subroutine unload_ctrls ();f.ecrirepage(sle_10,page_buffer[2],4022,10)
f.ecrirepage(cbx_corr_trans,page_buffer[2],4032)
f.ecrirepage(cbx_corr_art_inv,page_buffer[2],4033)
f.ecrirepage(cbx_corr_fonc,page_buffer[2],4034)
f.ecrirepage(cbx_trac_dent,page_buffer[2],4035)
f.ecrirepage(cbx_fentes,page_buffer[2],4036)
f.ecrirepage(cbx_logo,page_buffer[2],4037)
f.ecrirepage(cbx_autres,page_buffer[2],4038)
f.ecrirepage(cbx_disjonc,page_buffer[2],4039)
f.ecrirepage(cbx_plaque,page_buffer[2],4040)
f.ecrirepage(cbx_ancrage_e-o,page_buffer[2],4041)
f.ecrirepage(cbx_lip_bumper,page_buffer[2],4042)
f.ecrirepage(cbx_arc_ling,page_buffer[2],4043)
f.ecrirepage(cbx_activateur,page_buffer[2],4044)
f.ecrirepage(cbx_fixe_partiel,page_buffer[2],4045)
f.ecrirepage(rb_classique,page_buffer[2],4046)
f.ecrirepage(rb_eventail,page_buffer[2],4047)
f.ecrirepage(rb_bras_trac,page_buffer[2],4048)
f.ecrirepage(rb_bras_labio,page_buffer[2],4049)
// max carac = 4050


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

public subroutine load_ctrls ();f.lirepage(sle_10,page_buffer[1],4022,10)
f.lirepage(cbx_corr_trans,page_buffer[1],4032)
f.lirepage(cbx_corr_art_inv,page_buffer[1],4033)
f.lirepage(cbx_corr_fonc,page_buffer[1],4034)
f.lirepage(cbx_trac_dent,page_buffer[1],4035)
f.lirepage(cbx_fentes,page_buffer[1],4036)
f.lirepage(cbx_logo,page_buffer[1],4037)
f.lirepage(cbx_autres,page_buffer[1],4038)
f.lirepage(cbx_disjonc,page_buffer[1],4039)
f.lirepage(cbx_plaque,page_buffer[1],4040)
f.lirepage(cbx_ancrage_e-o,page_buffer[1],4041)
f.lirepage(cbx_lip_bumper,page_buffer[1],4042)
f.lirepage(cbx_arc_ling,page_buffer[1],4043)
f.lirepage(cbx_activateur,page_buffer[1],4044)
f.lirepage(cbx_fixe_partiel,page_buffer[1],4045)
f.lirepage(rb_classique,page_buffer[1],4046)
f.lirepage(rb_eventail,page_buffer[1],4047)
f.lirepage(rb_bras_trac,page_buffer[1],4048)
f.lirepage(rb_bras_labio,page_buffer[1],4049)
// max carac = 4050


// Activation des boutons radio si choix cochés
if cbx_disjonc.checked then
	rb_classique.enabled = true
	rb_eventail.enabled = true
	rb_bras_trac.enabled = true
	rb_bras_labio.enabled = true
end if



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

on w_diagnos_maj_87874_5.create
int iCurrent
call super::create
this.st_1=create st_1
this.st_2=create st_2
this.st_3=create st_3
this.st_15=create st_15
this.st_16=create st_16
this.sle_10=create sle_10
this.cb_signer=create cb_signer
this.dw_prati=create dw_prati
this.ole_photo002=create ole_photo002
this.ole_photo003=create ole_photo003
this.ole_photo004=create ole_photo004
this.ole_photo005=create ole_photo005
this.ole_photo006=create ole_photo006
this.ole_photo007=create ole_photo007
this.ole_photo008=create ole_photo008
this.ole_photo001=create ole_photo001
this.cbx_corr_trans=create cbx_corr_trans
this.cbx_corr_art_inv=create cbx_corr_art_inv
this.cbx_corr_fonc=create cbx_corr_fonc
this.cbx_trac_dent=create cbx_trac_dent
this.cbx_fentes=create cbx_fentes
this.cbx_logo=create cbx_logo
this.cbx_autres=create cbx_autres
this.st_4=create st_4
this.cbx_disjonc=create cbx_disjonc
this.cbx_plaque=create cbx_plaque
this.cbx_ancrage_e-o=create cbx_ancrage_e-o
this.cbx_lip_bumper=create cbx_lip_bumper
this.cbx_arc_ling=create cbx_arc_ling
this.cbx_activateur=create cbx_activateur
this.cbx_fixe_partiel=create cbx_fixe_partiel
this.rb_classique=create rb_classique
this.rb_eventail=create rb_eventail
this.rb_bras_trac=create rb_bras_trac
this.rb_bras_labio=create rb_bras_labio
this.p_1=create p_1
this.gb_1=create gb_1
this.r_5=create r_5
this.ln_1=create ln_1
this.ln_2=create ln_2
this.ln_3=create ln_3
this.ln_4=create ln_4
this.ln_5=create ln_5
this.ln_6=create ln_6
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.st_1
this.Control[iCurrent+2]=this.st_2
this.Control[iCurrent+3]=this.st_3
this.Control[iCurrent+4]=this.st_15
this.Control[iCurrent+5]=this.st_16
this.Control[iCurrent+6]=this.sle_10
this.Control[iCurrent+7]=this.cb_signer
this.Control[iCurrent+8]=this.dw_prati
this.Control[iCurrent+9]=this.ole_photo002
this.Control[iCurrent+10]=this.ole_photo003
this.Control[iCurrent+11]=this.ole_photo004
this.Control[iCurrent+12]=this.ole_photo005
this.Control[iCurrent+13]=this.ole_photo006
this.Control[iCurrent+14]=this.ole_photo007
this.Control[iCurrent+15]=this.ole_photo008
this.Control[iCurrent+16]=this.ole_photo001
this.Control[iCurrent+17]=this.cbx_corr_trans
this.Control[iCurrent+18]=this.cbx_corr_art_inv
this.Control[iCurrent+19]=this.cbx_corr_fonc
this.Control[iCurrent+20]=this.cbx_trac_dent
this.Control[iCurrent+21]=this.cbx_fentes
this.Control[iCurrent+22]=this.cbx_logo
this.Control[iCurrent+23]=this.cbx_autres
this.Control[iCurrent+24]=this.st_4
this.Control[iCurrent+25]=this.cbx_disjonc
this.Control[iCurrent+26]=this.cbx_plaque
this.Control[iCurrent+27]=this.cbx_ancrage_e-o
this.Control[iCurrent+28]=this.cbx_lip_bumper
this.Control[iCurrent+29]=this.cbx_arc_ling
this.Control[iCurrent+30]=this.cbx_activateur
this.Control[iCurrent+31]=this.cbx_fixe_partiel
this.Control[iCurrent+32]=this.rb_classique
this.Control[iCurrent+33]=this.rb_eventail
this.Control[iCurrent+34]=this.rb_bras_trac
this.Control[iCurrent+35]=this.rb_bras_labio
this.Control[iCurrent+36]=this.p_1
this.Control[iCurrent+37]=this.gb_1
this.Control[iCurrent+38]=this.r_5
this.Control[iCurrent+39]=this.ln_1
this.Control[iCurrent+40]=this.ln_2
this.Control[iCurrent+41]=this.ln_3
this.Control[iCurrent+42]=this.ln_4
this.Control[iCurrent+43]=this.ln_5
this.Control[iCurrent+44]=this.ln_6
end on

on w_diagnos_maj_87874_5.destroy
call super::destroy
destroy(this.st_1)
destroy(this.st_2)
destroy(this.st_3)
destroy(this.st_15)
destroy(this.st_16)
destroy(this.sle_10)
destroy(this.cb_signer)
destroy(this.dw_prati)
destroy(this.ole_photo002)
destroy(this.ole_photo003)
destroy(this.ole_photo004)
destroy(this.ole_photo005)
destroy(this.ole_photo006)
destroy(this.ole_photo007)
destroy(this.ole_photo008)
destroy(this.ole_photo001)
destroy(this.cbx_corr_trans)
destroy(this.cbx_corr_art_inv)
destroy(this.cbx_corr_fonc)
destroy(this.cbx_trac_dent)
destroy(this.cbx_fentes)
destroy(this.cbx_logo)
destroy(this.cbx_autres)
destroy(this.st_4)
destroy(this.cbx_disjonc)
destroy(this.cbx_plaque)
destroy(this.cbx_ancrage_e-o)
destroy(this.cbx_lip_bumper)
destroy(this.cbx_arc_ling)
destroy(this.cbx_activateur)
destroy(this.cbx_fixe_partiel)
destroy(this.rb_classique)
destroy(this.rb_eventail)
destroy(this.rb_bras_trac)
destroy(this.rb_bras_labio)
destroy(this.p_1)
destroy(this.gb_1)
destroy(this.r_5)
destroy(this.ln_1)
destroy(this.ln_2)
destroy(this.ln_3)
destroy(this.ln_4)
destroy(this.ln_5)
destroy(this.ln_6)
end on

type pb_suivant from w_diagnos_maj_`pb_suivant within w_diagnos_maj_87874_5
string tag = "87874_6"
integer y = 2252
end type

type pb_precedant from w_diagnos_maj_`pb_precedant within w_diagnos_maj_87874_5
string tag = "87874_4"
integer y = 2252
end type

type cb_imprimer from w_diagnos_maj_`cb_imprimer within w_diagnos_maj_87874_5
integer y = 2252
end type

type cb_sauver from w_diagnos_maj_`cb_sauver within w_diagnos_maj_87874_5
integer y = 2252
end type

type cb_annuler from w_diagnos_maj_`cb_annuler within w_diagnos_maj_87874_5
integer y = 2252
end type

type cb_fermer from w_diagnos_maj_`cb_fermer within w_diagnos_maj_87874_5
integer y = 2252
end type

type st_1 from statictext within w_diagnos_maj_87874_5
integer x = 1353
integer y = 32
integer width = 2235
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
string text = "Traitement de première intention"
alignment alignment = center!
boolean focusrectangle = false
end type

type st_2 from statictext within w_diagnos_maj_87874_5
integer x = 1344
integer y = 192
integer width = 2235
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
string text = "Plan de traitement"
alignment alignment = center!
boolean focusrectangle = false
end type

type st_3 from statictext within w_diagnos_maj_87874_5
integer x = 146
integer y = 1024
integer width = 507
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
string text = "Type de traitement"
boolean focusrectangle = false
end type

type st_15 from statictext within w_diagnos_maj_87874_5
integer x = 123
integer y = 2248
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

type st_16 from statictext within w_diagnos_maj_87874_5
integer x = 110
integer y = 2132
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

type sle_10 from singlelineedit within w_diagnos_maj_87874_5
integer x = 270
integer y = 2248
integer width = 366
integer height = 76
integer taborder = 200
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

type cb_signer from commandbutton within w_diagnos_maj_87874_5
integer x = 786
integer y = 2252
integer width = 535
integer height = 92
integer taborder = 210
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

type dw_prati from datawindow within w_diagnos_maj_87874_5
integer x = 379
integer y = 2144
integer width = 859
integer height = 76
integer taborder = 190
boolean bringtotop = true
string dataobject = "dw_cherche_prati"
boolean border = false
boolean livescroll = true
end type

type ole_photo002 from gearbox within w_diagnos_maj_87874_5
string tag = "{EFS/AT1}"
integer x = 512
integer y = 32
integer width = 407
integer height = 292
boolean bringtotop = true
end type

on ole_photo002.destroy
call gearbox::destroy
end on

type ole_photo003 from gearbox within w_diagnos_maj_87874_5
string tag = "{EPD/AT1}"
integer x = 987
integer y = 32
integer width = 407
integer height = 292
boolean bringtotop = true
end type

on ole_photo003.destroy
call gearbox::destroy
end on

type ole_photo004 from gearbox within w_diagnos_maj_87874_5
string tag = "{IH/AT1}"
integer x = 37
integer y = 352
integer width = 407
integer height = 292
boolean bringtotop = true
end type

on ole_photo004.destroy
call gearbox::destroy
end on

type ole_photo005 from gearbox within w_diagnos_maj_87874_5
string tag = "{IB/AT1}"
integer x = 987
integer y = 352
integer width = 407
integer height = 292
boolean bringtotop = true
end type

on ole_photo005.destroy
call gearbox::destroy
end on

type ole_photo006 from gearbox within w_diagnos_maj_87874_5
string tag = "{IG/AT1}"
integer x = 37
integer y = 672
integer width = 407
integer height = 292
boolean bringtotop = true
end type

on ole_photo006.destroy
call gearbox::destroy
end on

type ole_photo007 from gearbox within w_diagnos_maj_87874_5
string tag = "{IF/AT1}"
integer x = 512
integer y = 672
integer width = 407
integer height = 292
boolean bringtotop = true
end type

on ole_photo007.destroy
call gearbox::destroy
end on

type ole_photo008 from gearbox within w_diagnos_maj_87874_5
string tag = "{ID/AT1}"
integer x = 987
integer y = 672
integer width = 407
integer height = 292
boolean bringtotop = true
end type

on ole_photo008.destroy
call gearbox::destroy
end on

type ole_photo001 from gearbox within w_diagnos_maj_87874_5
string tag = "{EF/AT1}"
integer x = 37
integer y = 32
integer width = 407
integer height = 292
boolean bringtotop = true
end type

on ole_photo001.destroy
call gearbox::destroy
end on

type cbx_corr_trans from checkbox within w_diagnos_maj_87874_5
integer x = 146
integer y = 1152
integer width = 686
integer height = 80
integer taborder = 10
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Correction transversale"
end type

type cbx_corr_art_inv from checkbox within w_diagnos_maj_87874_5
integer x = 146
integer y = 1248
integer width = 763
integer height = 80
integer taborder = 20
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Correction articulé inversé"
end type

type cbx_corr_fonc from checkbox within w_diagnos_maj_87874_5
integer x = 146
integer y = 1344
integer width = 699
integer height = 80
integer taborder = 30
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Correction fonctionnelle"
end type

type cbx_trac_dent from checkbox within w_diagnos_maj_87874_5
integer x = 146
integer y = 1436
integer width = 425
integer height = 84
integer taborder = 40
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
end type

type cbx_fentes from checkbox within w_diagnos_maj_87874_5
integer x = 146
integer y = 1536
integer width = 265
integer height = 80
integer taborder = 50
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Fentes"
end type

type cbx_logo from checkbox within w_diagnos_maj_87874_5
integer x = 146
integer y = 1632
integer width = 352
integer height = 80
integer taborder = 60
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Logopédie"
end type

type cbx_autres from checkbox within w_diagnos_maj_87874_5
integer x = 146
integer y = 1728
integer width = 265
integer height = 80
integer taborder = 70
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Autres"
end type

type st_4 from statictext within w_diagnos_maj_87874_5
integer x = 1902
integer y = 1024
integer width = 416
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
string text = "Type d~'appareil"
boolean focusrectangle = false
end type

type cbx_disjonc from checkbox within w_diagnos_maj_87874_5
integer x = 1902
integer y = 1152
integer width = 389
integer height = 80
integer taborder = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Disjoncteur"
end type

event clicked;if this.checked then
	rb_classique.enabled = true
	rb_eventail.enabled = true
	rb_bras_trac.enabled = true
	rb_bras_labio.enabled = true
else
	rb_classique.enabled = false
	rb_classique.checked = false
	rb_eventail.enabled = false
	rb_eventail.checked = false
	rb_bras_trac.enabled = false
	rb_bras_trac.checked = false
	rb_bras_labio.enabled = false
	rb_bras_labio.checked = false
end if
end event

type cbx_plaque from checkbox within w_diagnos_maj_87874_5
integer x = 1897
integer y = 1440
integer width = 274
integer height = 80
integer taborder = 130
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Plaque"
end type

type cbx_ancrage_e-o from checkbox within w_diagnos_maj_87874_5
integer x = 1902
integer y = 1532
integer width = 571
integer height = 80
integer taborder = 140
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Ancrage extra-oral"
end type

type cbx_lip_bumper from checkbox within w_diagnos_maj_87874_5
integer x = 1902
integer y = 1632
integer width = 393
integer height = 80
integer taborder = 150
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Lip-bumper"
end type

type cbx_arc_ling from checkbox within w_diagnos_maj_87874_5
integer x = 1902
integer y = 1724
integer width = 361
integer height = 80
integer taborder = 160
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Arc lingual"
end type

type cbx_activateur from checkbox within w_diagnos_maj_87874_5
integer x = 1902
integer y = 1820
integer width = 352
integer height = 80
integer taborder = 170
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Activateur"
end type

type cbx_fixe_partiel from checkbox within w_diagnos_maj_87874_5
integer x = 1902
integer y = 1920
integer width = 375
integer height = 80
integer taborder = 180
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Fixe partiel"
end type

type rb_classique from radiobutton within w_diagnos_maj_87874_5
integer x = 1989
integer y = 1236
integer width = 361
integer height = 80
integer taborder = 90
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "Classique"
end type

type rb_eventail from radiobutton within w_diagnos_maj_87874_5
integer x = 1989
integer y = 1328
integer width = 370
integer height = 80
integer taborder = 110
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "En éventail"
end type

type rb_bras_trac from radiobutton within w_diagnos_maj_87874_5
integer x = 2523
integer y = 1236
integer width = 503
integer height = 80
integer taborder = 100
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "Bras de traction"
end type

type rb_bras_labio from radiobutton within w_diagnos_maj_87874_5
integer x = 2523
integer y = 1328
integer width = 613
integer height = 80
integer taborder = 120
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "Bras de labioversion"
end type

type p_1 from picture within w_diagnos_maj_87874_5
integer x = 462
integer y = 416
integer width = 503
integer height = 164
boolean bringtotop = true
boolean originalsize = true
string picturename = "Saint-Luc.jpg"
boolean focusrectangle = false
end type

type gb_1 from groupbox within w_diagnos_maj_87874_5
boolean visible = false
integer x = 1897
integer y = 1212
integer width = 1303
integer height = 204
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
end type

type r_5 from rectangle within w_diagnos_maj_87874_5
integer linethickness = 4
long fillcolor = 15780518
integer x = 73
integer y = 2112
integer width = 1294
integer height = 264
end type

type ln_1 from line within w_diagnos_maj_87874_5
integer linethickness = 4
integer beginx = 37
integer beginy = 992
integer endx = 3566
integer endy = 992
end type

type ln_2 from line within w_diagnos_maj_87874_5
integer linethickness = 4
integer beginx = 37
integer beginy = 992
integer endx = 37
integer endy = 2048
end type

type ln_3 from line within w_diagnos_maj_87874_5
integer linethickness = 4
integer beginx = 3566
integer beginy = 992
integer endx = 3566
integer endy = 2048
end type

type ln_4 from line within w_diagnos_maj_87874_5
integer linethickness = 4
integer beginx = 1792
integer beginy = 992
integer endx = 1792
integer endy = 2048
end type

type ln_5 from line within w_diagnos_maj_87874_5
integer linethickness = 4
integer beginx = 37
integer beginy = 1120
integer endx = 3566
integer endy = 1120
end type

type ln_6 from line within w_diagnos_maj_87874_5
integer linethickness = 4
integer beginx = 37
integer beginy = 2048
integer endx = 3566
integer endy = 2048
end type

