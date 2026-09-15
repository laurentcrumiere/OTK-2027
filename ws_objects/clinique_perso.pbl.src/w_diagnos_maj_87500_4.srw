$PBExportHeader$w_diagnos_maj_87500_4.srw
$PBExportComments$gearbox
forward
global type w_diagnos_maj_87500_4 from w_diagnos_maj_
end type
type st_1 from statictext within w_diagnos_maj_87500_4
end type
type st_2 from statictext within w_diagnos_maj_87500_4
end type
type st_3 from statictext within w_diagnos_maj_87500_4
end type
type st_4 from statictext within w_diagnos_maj_87500_4
end type
type st_5 from statictext within w_diagnos_maj_87500_4
end type
type sle_1 from singlelineedit within w_diagnos_maj_87500_4
end type
type sle_2 from singlelineedit within w_diagnos_maj_87500_4
end type
type mle_3 from multilineedit within w_diagnos_maj_87500_4
end type
type st_15 from statictext within w_diagnos_maj_87500_4
end type
type st_16 from statictext within w_diagnos_maj_87500_4
end type
type sle_10 from singlelineedit within w_diagnos_maj_87500_4
end type
type st_6 from statictext within w_diagnos_maj_87500_4
end type
type ddlb_choix_appareil from dropdownlistbox within w_diagnos_maj_87500_4
end type
type p_1 from picture within w_diagnos_maj_87500_4
end type
type mle_commentaire from multilineedit within w_diagnos_maj_87500_4
end type
type st_7 from statictext within w_diagnos_maj_87500_4
end type
type cb_signer from commandbutton within w_diagnos_maj_87500_4
end type
type dw_prati from datawindow within w_diagnos_maj_87500_4
end type
type dw_diag from datawindow within w_diagnos_maj_87500_4
end type
type r_5 from rectangle within w_diagnos_maj_87500_4
end type
end forward

global type w_diagnos_maj_87500_4 from w_diagnos_maj_
string tag = "16000"
string title = "Page Clinique N° 4"
st_1 st_1
st_2 st_2
st_3 st_3
st_4 st_4
st_5 st_5
sle_1 sle_1
sle_2 sle_2
mle_3 mle_3
st_15 st_15
st_16 st_16
sle_10 sle_10
st_6 st_6
ddlb_choix_appareil ddlb_choix_appareil
p_1 p_1
mle_commentaire mle_commentaire
st_7 st_7
cb_signer cb_signer
dw_prati dw_prati
dw_diag dw_diag
r_5 r_5
end type
global w_diagnos_maj_87500_4 w_diagnos_maj_87500_4

type variables


// pour savoir si la feuille est signée ou pas
string v_signe, v_signataire
boolean maj_signature = false
end variables

forward prototypes
public subroutine load_ctrls ()
public subroutine info_signature (string vv_signe)
public subroutine unload_ctrls ()
public subroutine open_another_page (picturebutton pb)
end prototypes

public subroutine load_ctrls ();//f.lirepage(mle_1,page_buffer[1],2384,300)
//f.lirepage(mle_2,page_buffer[1],2684,300)
f.lirepage(sle_1,page_buffer[1],2984,60)
f.lirepage(sle_2,page_buffer[1],3044,60)
f.lirepage(mle_3,page_buffer[1],3104,300)
f.lirepage(sle_10,page_buffer[1],3404,10)
f.lirepage(ddlb_choix_appareil,page_buffer[1],3414,2)
f.lirepage(mle_commentaire,page_buffer[1],3416,250)

// max carac = 15394 sur page 10 le 27/02/2020


// plan de traitement
dw_diag.settransobject(sqlca)
dw_diag.retrieve(var_code_local)


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

// Modification de l'objet PICTURE en fonction du choix dans le menu déroulant

String selection_liste

// récupération du choix et génération du chemin pour atteindre le fichier JPG correspondant
selection_liste = ddlb_choix_appareil.Text + ".jpg"

// affectation du chemin à l'objet PICTURE
p_1.PictureName = selection_liste

end subroutine

public subroutine info_signature (string vv_signe);if vv_signe = "O" then
	// déjà signé
	cb_signer.text = "Annul. Signer"
	
	// On doit verrouiller des trucs !!!!
	dw_diag.enabled = false
	mle_3.enabled = false
	sle_1.enabled = false
	sle_2.enabled = false
	//mle_commentaire.enabled = false
	// La date
	sle_10.enabled = false
	dw_prati.enabled = false
else
	// pas encore
	cb_signer.text = "Signer"
	
	// On doit déverrouiller des trucs !!!!
	dw_diag.enabled = true
	mle_3.enabled = true
	sle_1.enabled = true
	sle_2.enabled = true
	//mle_commentaire.enabled = true
	// La date
	sle_10.enabled = true
	dw_prati.enabled = true
end if
end subroutine

public subroutine unload_ctrls ();//f.ecrirepage(mle_1,page_buffer[2],2384,300)
//f.ecrirepage(mle_2,page_buffer[2],2684,300)
f.ecrirepage(sle_1,page_buffer[2],2984,60)
f.ecrirepage(sle_2,page_buffer[2],3044,60)
f.ecrirepage(mle_3,page_buffer[2],3104,300)
f.ecrirepage(sle_10,page_buffer[2],3404,10)
f.ecrirepage(ddlb_choix_appareil,page_buffer[2],3414,2)
f.ecrirepage(mle_commentaire,page_buffer[2],3416,250)

// max carac = 15394 sur page 10 le 27/02/2020


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

public subroutine open_another_page (picturebutton pb);// fx qui lance la sauvegarde des données, ouvre une autre page clinique et ferme celle-ci


// on lance la procédure de sauvegarde des données
sauvegarder( false )

if pb.tag <> "" then
	w_diagnos_maj_		W_fille
	
	// on ouvre l'autre page clinique
	if ui_v2020 then
//		OpenWithParm ( W_fille , var_code_local , w_mdi_2020 )
		OpenWithParm( W_fille, var_code_local, "w_diagnos_maj_" + pb.tag, w_mdi_2020)
	else
		OpenSheetWithParm( W_fille, var_code_local, "w_diagnos_maj_" + pb.tag, w_mdi, 0, Original!)
	end if
	
	// on ferme celle-ci
	Close(this)
end if
end subroutine

on w_diagnos_maj_87500_4.create
int iCurrent
call super::create
this.st_1=create st_1
this.st_2=create st_2
this.st_3=create st_3
this.st_4=create st_4
this.st_5=create st_5
this.sle_1=create sle_1
this.sle_2=create sle_2
this.mle_3=create mle_3
this.st_15=create st_15
this.st_16=create st_16
this.sle_10=create sle_10
this.st_6=create st_6
this.ddlb_choix_appareil=create ddlb_choix_appareil
this.p_1=create p_1
this.mle_commentaire=create mle_commentaire
this.st_7=create st_7
this.cb_signer=create cb_signer
this.dw_prati=create dw_prati
this.dw_diag=create dw_diag
this.r_5=create r_5
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.st_1
this.Control[iCurrent+2]=this.st_2
this.Control[iCurrent+3]=this.st_3
this.Control[iCurrent+4]=this.st_4
this.Control[iCurrent+5]=this.st_5
this.Control[iCurrent+6]=this.sle_1
this.Control[iCurrent+7]=this.sle_2
this.Control[iCurrent+8]=this.mle_3
this.Control[iCurrent+9]=this.st_15
this.Control[iCurrent+10]=this.st_16
this.Control[iCurrent+11]=this.sle_10
this.Control[iCurrent+12]=this.st_6
this.Control[iCurrent+13]=this.ddlb_choix_appareil
this.Control[iCurrent+14]=this.p_1
this.Control[iCurrent+15]=this.mle_commentaire
this.Control[iCurrent+16]=this.st_7
this.Control[iCurrent+17]=this.cb_signer
this.Control[iCurrent+18]=this.dw_prati
this.Control[iCurrent+19]=this.dw_diag
this.Control[iCurrent+20]=this.r_5
end on

on w_diagnos_maj_87500_4.destroy
call super::destroy
destroy(this.st_1)
destroy(this.st_2)
destroy(this.st_3)
destroy(this.st_4)
destroy(this.st_5)
destroy(this.sle_1)
destroy(this.sle_2)
destroy(this.mle_3)
destroy(this.st_15)
destroy(this.st_16)
destroy(this.sle_10)
destroy(this.st_6)
destroy(this.ddlb_choix_appareil)
destroy(this.p_1)
destroy(this.mle_commentaire)
destroy(this.st_7)
destroy(this.cb_signer)
destroy(this.dw_prati)
destroy(this.dw_diag)
destroy(this.r_5)
end on

event close;// procédure de fermeture
sauvegarder( false )
end event

type pb_suivant from w_diagnos_maj_`pb_suivant within w_diagnos_maj_87500_4
string tag = "87500_5"
integer y = 1704
end type

type pb_precedant from w_diagnos_maj_`pb_precedant within w_diagnos_maj_87500_4
string tag = "87500_3"
integer y = 1704
end type

type cb_imprimer from w_diagnos_maj_`cb_imprimer within w_diagnos_maj_87500_4
integer y = 1704
end type

type cb_sauver from w_diagnos_maj_`cb_sauver within w_diagnos_maj_87500_4
integer y = 1704
boolean default = true
end type

event cb_sauver::clicked;// sauvegarde des données
sauvegarder( false )  


dw_diag.accepttext()

// Mise à jour des zones pour myOrthokis
dw_diag.setItem(1, "patient_traitement_effectue_html", dw_diag.getitemString(1, "texte_brut_traitement_effectue"))
dw_diag.setItem(1, "patient_plan_traitement_html", dw_diag.getitemString(1, "texte_brut_plan_traitement"))

if dw_diag.update() = 1 then
	commit ;
	if sqlca.sqlcode <> 0 then
		Messagebox("ERREUR DANS LA MISE A JOUR N°"+string(sqlca.sqlcode),sqlca.sqlerrtext)
	end if
else
	rollback ;
end if

end event

type cb_annuler from w_diagnos_maj_`cb_annuler within w_diagnos_maj_87500_4
integer y = 1704
end type

type cb_fermer from w_diagnos_maj_`cb_fermer within w_diagnos_maj_87500_4
integer y = 1704
boolean default = false
end type

type st_1 from statictext within w_diagnos_maj_87500_4
integer x = 50
integer y = 140
integer width = 434
integer height = 48
boolean bringtotop = true
integer textsize = -7
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Résumé du diagnostic"
boolean focusrectangle = false
end type

type st_2 from statictext within w_diagnos_maj_87500_4
integer x = 91
integer y = 496
integer width = 160
integer height = 52
boolean bringtotop = true
integer textsize = -7
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Appareil"
boolean focusrectangle = false
end type

type st_3 from statictext within w_diagnos_maj_87500_4
integer x = 91
integer y = 740
integer width = 160
integer height = 52
boolean bringtotop = true
integer textsize = -7
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Soins"
boolean focusrectangle = false
end type

type st_4 from statictext within w_diagnos_maj_87500_4
integer x = 91
integer y = 896
integer width = 224
integer height = 52
boolean bringtotop = true
integer textsize = -7
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Extractions"
boolean focusrectangle = false
end type

type st_5 from statictext within w_diagnos_maj_87500_4
integer x = 91
integer y = 1160
integer width = 370
integer height = 52
boolean bringtotop = true
integer textsize = -7
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Divers/Fonctionnel"
boolean focusrectangle = false
end type

type sle_1 from singlelineedit within w_diagnos_maj_87500_4
integer x = 507
integer y = 716
integer width = 1289
integer height = 84
integer taborder = 30
boolean bringtotop = true
integer textsize = -7
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
integer limit = 60
borderstyle borderstyle = stylelowered!
end type

type sle_2 from singlelineedit within w_diagnos_maj_87500_4
integer x = 507
integer y = 876
integer width = 1289
integer height = 84
integer taborder = 70
boolean bringtotop = true
integer textsize = -7
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
integer limit = 60
borderstyle borderstyle = stylelowered!
end type

type mle_3 from multilineedit within w_diagnos_maj_87500_4
integer x = 507
integer y = 1036
integer width = 1289
integer height = 284
integer taborder = 40
boolean bringtotop = true
integer textsize = -7
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
integer limit = 300
borderstyle borderstyle = stylelowered!
end type

type st_15 from statictext within w_diagnos_maj_87500_4
integer x = 2245
integer y = 1560
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

type st_16 from statictext within w_diagnos_maj_87500_4
integer x = 2231
integer y = 1444
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

type sle_10 from singlelineedit within w_diagnos_maj_87500_4
integer x = 2391
integer y = 1560
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

type st_6 from statictext within w_diagnos_maj_87500_4
integer x = 2523
integer y = 24
integer width = 663
integer height = 52
boolean bringtotop = true
integer textsize = -7
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Choix pour le schéma de l~'appareil"
boolean focusrectangle = false
end type

type ddlb_choix_appareil from dropdownlistbox within w_diagnos_maj_87500_4
string tag = "choix_appareil"
integer x = 2514
integer y = 92
integer width = 677
integer height = 1084
integer taborder = 60
boolean bringtotop = true
integer textsize = -7
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
string item[] = {"Autre","Bite plate","Disjoncteur palatin","Nance barre linguale","Planas Pistes Postérieures","Planas","Rank","Schwarz exp prémax blocs","Schwarz exp sag bilat AEO","Schwarz exp sag bilat blocs","Schwarz exp sag bilat","Schwarz exp sag D PDT","Schwarz exp sag G PDT","Schwarz exp transv arc V","Schwarz exp transv blocs","Schwarz exp transv sag","Schwarz exp transv","Schwarz exp wypla","Schwarz ressorts blocs","Schwarz VDL"}
borderstyle borderstyle = stylelowered!
end type

event selectionchanged;// Modification de l'objet PICTURE en fonction du choix dans le menu déroulant

String selection_liste

// récupération du choix et génération du chemin pour atteindre le fichier JPG correspondant
selection_liste = enlever_accents(ddlb_choix_appareil.Text) + ".jpg"

// affectation du chemin à l'objet PICTURE
p_1.PictureName = selection_liste

end event

type p_1 from picture within w_diagnos_maj_87500_4
integer x = 2194
integer y = 188
integer width = 1285
integer height = 1212
boolean bringtotop = true
boolean originalsize = true
boolean focusrectangle = false
end type

type mle_commentaire from multilineedit within w_diagnos_maj_87500_4
integer x = 512
integer y = 1368
integer width = 1294
integer height = 308
integer taborder = 90
boolean bringtotop = true
integer textsize = -7
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
boolean vscrollbar = true
integer limit = 250
borderstyle borderstyle = stylelowered!
end type

type st_7 from statictext within w_diagnos_maj_87500_4
integer x = 197
integer y = 1452
integer width = 288
integer height = 52
boolean bringtotop = true
integer textsize = -7
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Commentaires"
boolean focusrectangle = false
end type

type cb_signer from commandbutton within w_diagnos_maj_87500_4
integer x = 2907
integer y = 1564
integer width = 535
integer height = 92
integer taborder = 110
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

type dw_prati from datawindow within w_diagnos_maj_87500_4
integer x = 2501
integer y = 1456
integer width = 859
integer height = 76
integer taborder = 100
boolean bringtotop = true
string dataobject = "dw_cherche_prati"
boolean border = false
boolean livescroll = true
end type

type dw_diag from datawindow within w_diagnos_maj_87500_4
integer x = 507
integer width = 1339
integer height = 676
integer taborder = 50
boolean bringtotop = true
string title = "none"
string dataobject = "dw_diag_chu"
boolean border = false
boolean livescroll = true
end type

type r_5 from rectangle within w_diagnos_maj_87500_4
integer linethickness = 4
long fillcolor = 15780518
integer x = 2194
integer y = 1424
integer width = 1294
integer height = 264
end type

