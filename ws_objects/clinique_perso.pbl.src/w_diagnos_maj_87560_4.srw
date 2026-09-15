$PBExportHeader$w_diagnos_maj_87560_4.srw
$PBExportComments$gearbox
forward
global type w_diagnos_maj_87560_4 from w_diagnos_maj_
end type
type st_1 from statictext within w_diagnos_maj_87560_4
end type
type st_2 from statictext within w_diagnos_maj_87560_4
end type
type st_3 from statictext within w_diagnos_maj_87560_4
end type
type st_4 from statictext within w_diagnos_maj_87560_4
end type
type st_5 from statictext within w_diagnos_maj_87560_4
end type
type sle_1 from singlelineedit within w_diagnos_maj_87560_4
end type
type sle_2 from singlelineedit within w_diagnos_maj_87560_4
end type
type mle_3 from multilineedit within w_diagnos_maj_87560_4
end type
type st_6 from statictext within w_diagnos_maj_87560_4
end type
type ddlb_choix_appareil from dropdownlistbox within w_diagnos_maj_87560_4
end type
type p_1 from picture within w_diagnos_maj_87560_4
end type
type mle_commentaire from multilineedit within w_diagnos_maj_87560_4
end type
type st_7 from statictext within w_diagnos_maj_87560_4
end type
type dw_diag from datawindow within w_diagnos_maj_87560_4
end type
end forward

global type w_diagnos_maj_87560_4 from w_diagnos_maj_
string tag = "10000"
integer width = 3589
integer height = 2264
string title = "Page Clinique N° 4"
st_1 st_1
st_2 st_2
st_3 st_3
st_4 st_4
st_5 st_5
sle_1 sle_1
sle_2 sle_2
mle_3 mle_3
st_6 st_6
ddlb_choix_appareil ddlb_choix_appareil
p_1 p_1
mle_commentaire mle_commentaire
st_7 st_7
dw_diag dw_diag
end type
global w_diagnos_maj_87560_4 w_diagnos_maj_87560_4

type variables


// pour savoir si la feuille est signée ou pas
string v_signe, v_signataire
boolean maj_signature = false
end variables

forward prototypes
public subroutine load_ctrls ()
public subroutine unload_ctrls ()
public subroutine open_another_page (picturebutton pb)
end prototypes

public subroutine load_ctrls ();//f.lirepage(mle_1,page_buffer[1],2384,300)
//f.lirepage(mle_2,page_buffer[1],2684,300)
f.lirepage(sle_1,page_buffer[1],2984,60)
f.lirepage(sle_2,page_buffer[1],3044,60)
f.lirepage(mle_3,page_buffer[1],3104,300)
//f.lirepage(sle_10,page_buffer[1],3404,10)
f.lirepage(ddlb_choix_appareil,page_buffer[1],3414,2)
f.lirepage(mle_commentaire,page_buffer[1],3416,250)

// max carac = 3666


// plan de traitement
dw_diag.settransobject(sqlca)
dw_diag.retrieve(var_code_local)




// Modification de l'objet PICTURE en fonction du choix dans le menu déroulant

String selection_liste

// récupération du choix et génération du chemin pour atteindre le fichier JPG correspondant
selection_liste = ddlb_choix_appareil.Text + ".jpg"

// affectation du chemin à l'objet PICTURE
p_1.PictureName = selection_liste

end subroutine

public subroutine unload_ctrls ();//f.ecrirepage(mle_1,page_buffer[2],2384,300)
//f.ecrirepage(mle_2,page_buffer[2],2684,300)
f.ecrirepage(sle_1,page_buffer[2],2984,60)
f.ecrirepage(sle_2,page_buffer[2],3044,60)
f.ecrirepage(mle_3,page_buffer[2],3104,300)
//f.ecrirepage(sle_10,page_buffer[2],3404,10)
f.ecrirepage(ddlb_choix_appareil,page_buffer[2],3414,2)
f.ecrirepage(mle_commentaire,page_buffer[2],3416,250)

// max carac = 3666


end subroutine

public subroutine open_another_page (picturebutton pb);// fx qui lance la sauvegarde des données, ouvre une autre page clinique et ferme celle-ci


// on lance la procédure de sauvegarde des données
sauvegarder( false )

if pb.tag <> "" then
	w_diagnos_maj_		W_fille
	
	// on ouvre l'autre page clinique
	OpenSheetWithParm( W_fille, var_code_local, "w_diagnos_maj_" + pb.tag, w_mdi, 0, Original!)
	
	// on ferme celle-ci
	Close(this)
end if
end subroutine

on w_diagnos_maj_87560_4.create
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
this.st_6=create st_6
this.ddlb_choix_appareil=create ddlb_choix_appareil
this.p_1=create p_1
this.mle_commentaire=create mle_commentaire
this.st_7=create st_7
this.dw_diag=create dw_diag
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.st_1
this.Control[iCurrent+2]=this.st_2
this.Control[iCurrent+3]=this.st_3
this.Control[iCurrent+4]=this.st_4
this.Control[iCurrent+5]=this.st_5
this.Control[iCurrent+6]=this.sle_1
this.Control[iCurrent+7]=this.sle_2
this.Control[iCurrent+8]=this.mle_3
this.Control[iCurrent+9]=this.st_6
this.Control[iCurrent+10]=this.ddlb_choix_appareil
this.Control[iCurrent+11]=this.p_1
this.Control[iCurrent+12]=this.mle_commentaire
this.Control[iCurrent+13]=this.st_7
this.Control[iCurrent+14]=this.dw_diag
end on

on w_diagnos_maj_87560_4.destroy
call super::destroy
destroy(this.st_1)
destroy(this.st_2)
destroy(this.st_3)
destroy(this.st_4)
destroy(this.st_5)
destroy(this.sle_1)
destroy(this.sle_2)
destroy(this.mle_3)
destroy(this.st_6)
destroy(this.ddlb_choix_appareil)
destroy(this.p_1)
destroy(this.mle_commentaire)
destroy(this.st_7)
destroy(this.dw_diag)
end on

event close;// procédure de fermeture
sauvegarder( false )
end event

type pb_suivant from w_diagnos_maj_`pb_suivant within w_diagnos_maj_87560_4
string tag = "87560_5"
integer y = 2028
end type

type pb_precedant from w_diagnos_maj_`pb_precedant within w_diagnos_maj_87560_4
string tag = "87560_3"
integer y = 2028
end type

type cb_imprimer from w_diagnos_maj_`cb_imprimer within w_diagnos_maj_87560_4
integer y = 2028
end type

type cb_sauver from w_diagnos_maj_`cb_sauver within w_diagnos_maj_87560_4
integer y = 2028
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

type cb_annuler from w_diagnos_maj_`cb_annuler within w_diagnos_maj_87560_4
integer y = 2028
end type

type cb_fermer from w_diagnos_maj_`cb_fermer within w_diagnos_maj_87560_4
integer y = 2028
boolean default = false
end type

type st_1 from statictext within w_diagnos_maj_87560_4
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

type st_2 from statictext within w_diagnos_maj_87560_4
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

type st_3 from statictext within w_diagnos_maj_87560_4
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

type st_4 from statictext within w_diagnos_maj_87560_4
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

type st_5 from statictext within w_diagnos_maj_87560_4
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

type sle_1 from singlelineedit within w_diagnos_maj_87560_4
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

type sle_2 from singlelineedit within w_diagnos_maj_87560_4
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

type mle_3 from multilineedit within w_diagnos_maj_87560_4
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

type st_6 from statictext within w_diagnos_maj_87560_4
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

type ddlb_choix_appareil from dropdownlistbox within w_diagnos_maj_87560_4
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

type p_1 from picture within w_diagnos_maj_87560_4
integer x = 2194
integer y = 188
integer width = 1285
integer height = 1212
boolean bringtotop = true
boolean originalsize = true
boolean focusrectangle = false
end type

type mle_commentaire from multilineedit within w_diagnos_maj_87560_4
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

type st_7 from statictext within w_diagnos_maj_87560_4
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

type dw_diag from datawindow within w_diagnos_maj_87560_4
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

