$PBExportHeader$w_environnement_lettre.srw
forward
global type w_environnement_lettre from w_fenetre_arakis
end type
type cb_fermer from uo_picturebutton_390x120 within w_environnement_lettre
end type
type cb_enregistrer from uo_picturebutton_390x120 within w_environnement_lettre
end type
type cb_annuler from uo_picturebutton_390x120 within w_environnement_lettre
end type
type pb_20 from picturebutton within w_environnement_lettre
end type
type pb_19 from picturebutton within w_environnement_lettre
end type
type pb_18 from picturebutton within w_environnement_lettre
end type
type pb_17 from picturebutton within w_environnement_lettre
end type
type pb_16 from picturebutton within w_environnement_lettre
end type
type pb_15 from picturebutton within w_environnement_lettre
end type
type pb_14 from picturebutton within w_environnement_lettre
end type
type pb_13 from picturebutton within w_environnement_lettre
end type
type pb_12 from picturebutton within w_environnement_lettre
end type
type pb_11 from picturebutton within w_environnement_lettre
end type
type pb_10 from picturebutton within w_environnement_lettre
end type
type pb_9 from picturebutton within w_environnement_lettre
end type
type pb_8 from picturebutton within w_environnement_lettre
end type
type pb_7 from picturebutton within w_environnement_lettre
end type
type pb_6 from picturebutton within w_environnement_lettre
end type
type pb_5 from picturebutton within w_environnement_lettre
end type
type pb_4 from picturebutton within w_environnement_lettre
end type
type pb_3 from picturebutton within w_environnement_lettre
end type
type dw_lettres from datawindow within w_environnement_lettre
end type
type uo_taille from resize_fenetre within w_environnement_lettre
end type
end forward

global type w_environnement_lettre from w_fenetre_arakis
integer x = 18
integer y = 176
integer width = 3781
integer height = 2544
string title = "Paramètres Courriers Automatiques"
windowstate windowstate = maximized!
long backcolor = 15780518
cb_fermer cb_fermer
cb_enregistrer cb_enregistrer
cb_annuler cb_annuler
pb_20 pb_20
pb_19 pb_19
pb_18 pb_18
pb_17 pb_17
pb_16 pb_16
pb_15 pb_15
pb_14 pb_14
pb_13 pb_13
pb_12 pb_12
pb_11 pb_11
pb_10 pb_10
pb_9 pb_9
pb_8 pb_8
pb_7 pb_7
pb_6 pb_6
pb_5 pb_5
pb_4 pb_4
pb_3 pb_3
dw_lettres dw_lettres
uo_taille uo_taille
end type
global w_environnement_lettre w_environnement_lettre

type variables


string rep_courriers
end variables

forward prototypes
private subroutine init ()
public subroutine save ()
end prototypes

private subroutine init ();dw_lettres.retrieve()
end subroutine

public subroutine save ();if dw_lettres.update() <> 1 then goto erreur
commit;

goto fin
//gestion des erreurs
erreur:
	messagebox("ATTENTION","Impossible de sauvegarder vos paramètres ...")
	rollback;
fin:
	
end subroutine

event open;call super::open;//initialisation de la datawindow
dw_lettres.settransobject(SQLCA)
init()

//initialisation de l'affichage (UI)
uo_taille.taille(this)


// répertoire des couriers

rep_courriers = dir_courriers
end event

on w_environnement_lettre.create
int iCurrent
call super::create
this.cb_fermer=create cb_fermer
this.cb_enregistrer=create cb_enregistrer
this.cb_annuler=create cb_annuler
this.pb_20=create pb_20
this.pb_19=create pb_19
this.pb_18=create pb_18
this.pb_17=create pb_17
this.pb_16=create pb_16
this.pb_15=create pb_15
this.pb_14=create pb_14
this.pb_13=create pb_13
this.pb_12=create pb_12
this.pb_11=create pb_11
this.pb_10=create pb_10
this.pb_9=create pb_9
this.pb_8=create pb_8
this.pb_7=create pb_7
this.pb_6=create pb_6
this.pb_5=create pb_5
this.pb_4=create pb_4
this.pb_3=create pb_3
this.dw_lettres=create dw_lettres
this.uo_taille=create uo_taille
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_fermer
this.Control[iCurrent+2]=this.cb_enregistrer
this.Control[iCurrent+3]=this.cb_annuler
this.Control[iCurrent+4]=this.pb_20
this.Control[iCurrent+5]=this.pb_19
this.Control[iCurrent+6]=this.pb_18
this.Control[iCurrent+7]=this.pb_17
this.Control[iCurrent+8]=this.pb_16
this.Control[iCurrent+9]=this.pb_15
this.Control[iCurrent+10]=this.pb_14
this.Control[iCurrent+11]=this.pb_13
this.Control[iCurrent+12]=this.pb_12
this.Control[iCurrent+13]=this.pb_11
this.Control[iCurrent+14]=this.pb_10
this.Control[iCurrent+15]=this.pb_9
this.Control[iCurrent+16]=this.pb_8
this.Control[iCurrent+17]=this.pb_7
this.Control[iCurrent+18]=this.pb_6
this.Control[iCurrent+19]=this.pb_5
this.Control[iCurrent+20]=this.pb_4
this.Control[iCurrent+21]=this.pb_3
this.Control[iCurrent+22]=this.dw_lettres
this.Control[iCurrent+23]=this.uo_taille
end on

on w_environnement_lettre.destroy
call super::destroy
destroy(this.cb_fermer)
destroy(this.cb_enregistrer)
destroy(this.cb_annuler)
destroy(this.pb_20)
destroy(this.pb_19)
destroy(this.pb_18)
destroy(this.pb_17)
destroy(this.pb_16)
destroy(this.pb_15)
destroy(this.pb_14)
destroy(this.pb_13)
destroy(this.pb_12)
destroy(this.pb_11)
destroy(this.pb_10)
destroy(this.pb_9)
destroy(this.pb_8)
destroy(this.pb_7)
destroy(this.pb_6)
destroy(this.pb_5)
destroy(this.pb_4)
destroy(this.pb_3)
destroy(this.dw_lettres)
destroy(this.uo_taille)
end on

event resize;//uo_taille.retaille(this)


// juste l'image de fond
p_fond.width = this.width
p_fond.height = this.height

end event

type p_fond from w_fenetre_arakis`p_fond within w_environnement_lettre
integer y = 708
end type

type cb_fermer from uo_picturebutton_390x120 within w_environnement_lettre
integer x = 2021
integer y = 1988
integer width = 558
integer taborder = 50
string text = "&Fermer"
boolean default = true
string iconname = "ACTIONS_fermer.png"
end type

event clicked;call super::clicked;if dw_lettres.modifiedcount() > 0 Then
	If MessageBox("ATTENTION","Vous avez fait des modifications sur le fichier !~n~nVoulez-vous vraiment fermer cette fenêtre sans sauvegarder ?",Question!,YesNo!, 2) = 1 Then
		fermer_fenetre(parent)
	end if
else
	fermer_fenetre(parent)
end if

end event

type cb_enregistrer from uo_picturebutton_390x120 within w_environnement_lettre
integer x = 1399
integer y = 1992
integer width = 558
integer taborder = 50
string text = "&Enregistrer"
string iconname = "ACTIONS_enregistrer.png"
end type

event clicked;call super::clicked;save()
end event

type cb_annuler from uo_picturebutton_390x120 within w_environnement_lettre
integer x = 777
integer y = 1992
integer width = 558
integer taborder = 40
string text = "&Annuler"
string iconname = "ACTIONS_annuler.png"
end type

event clicked;call super::clicked;init()
end event

type pb_20 from picturebutton within w_environnement_lettre
integer x = 2400
integer y = 1700
integer width = 105
integer height = 80
integer taborder = 40
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "lc_explorer.png"
alignment htextalign = left!
end type

event clicked;string file_name,file_path,col_name

//le nom de la colonne de la datawindow
col_name = "lettre_recu"

//ouverture de la dialogbox
if GetFileOpenName("Recherche de Lettre Type",file_path,file_name,"RTF","Fichiers RTF (*.rtf),*.rtf", rep_courriers) = 1 then
	dw_lettres.SetItem(dw_lettres.GetRow(),col_name,file_name)
end if
end event

type pb_19 from picturebutton within w_environnement_lettre
integer x = 2400
integer y = 1612
integer width = 105
integer height = 80
integer taborder = 30
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "lc_explorer.png"
alignment htextalign = left!
end type

event clicked;string file_name,file_path,col_name

//le nom de la colonne de la datawindow
col_name = "lettre_ticket"

//ouverture de la dialogbox
if GetFileOpenName("Recherche de Lettre Type",file_path,file_name,"RTF","Fichiers RTF (*.rtf),*.rtf", rep_courriers) = 1 then
	dw_lettres.SetItem(dw_lettres.GetRow(),col_name,file_name)
end if
end event

type pb_18 from picturebutton within w_environnement_lettre
integer x = 2400
integer y = 1524
integer width = 105
integer height = 80
integer taborder = 50
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "lc_explorer.png"
alignment htextalign = left!
end type

event clicked;string file_name,file_path,col_name

//le nom de la colonne de la datawindow
col_name = "lettre_feuille_renouvellement"

//ouverture de la dialogbox
if GetFileOpenName("Recherche de Lettre Type",file_path,file_name,"RTF","Fichiers RTF (*.rtf),*.rtf", rep_courriers) = 1 then
	dw_lettres.SetItem(dw_lettres.GetRow(),col_name,file_name)
end if
end event

type pb_17 from picturebutton within w_environnement_lettre
integer x = 2400
integer y = 1436
integer width = 105
integer height = 80
integer taborder = 50
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "lc_explorer.png"
alignment htextalign = left!
end type

event clicked;string file_name,file_path,col_name

//le nom de la colonne de la datawindow
col_name = "lettre_recontacter"

//ouverture de la dialogbox
if GetFileOpenName("Recherche de Lettre Type",file_path,file_name,"RTF","Fichiers RTF (*.rtf),*.rtf", rep_courriers) = 1 then
	dw_lettres.SetItem(dw_lettres.GetRow(),col_name,file_name)
end if
end event

type pb_16 from picturebutton within w_environnement_lettre
integer x = 2400
integer y = 1348
integer width = 105
integer height = 80
integer taborder = 140
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "lc_explorer.png"
alignment htextalign = left!
end type

event clicked;string file_name,file_path,col_name

//le nom de la colonne de la datawindow
col_name = "lettre_anniversaire"

//ouverture de la dialogbox
if GetFileOpenName("Recherche de Lettre Type",file_path,file_name,"RTF","Fichiers RTF (*.rtf),*.rtf", rep_courriers) = 1 then
	dw_lettres.SetItem(dw_lettres.GetRow(),col_name,file_name)
end if
end event

type pb_15 from picturebutton within w_environnement_lettre
integer x = 2400
integer y = 1256
integer width = 105
integer height = 80
integer taborder = 130
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "lc_explorer.png"
alignment htextalign = left!
end type

event clicked;string file_name,file_path,col_name

//le nom de la colonne de la datawindow
col_name = "lettre_x_ans"

//ouverture de la dialogbox
if GetFileOpenName("Recherche de Lettre Type",file_path,file_name,"RTF","Fichiers RTF (*.rtf),*.rtf", rep_courriers) = 1 then
	dw_lettres.SetItem(dw_lettres.GetRow(),col_name,file_name)
end if
end event

type pb_14 from picturebutton within w_environnement_lettre
integer x = 2400
integer y = 1172
integer width = 105
integer height = 80
integer taborder = 120
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "lc_explorer.png"
alignment htextalign = left!
end type

event clicked;string file_name,file_path,col_name

//le nom de la colonne de la datawindow
col_name = "lettre_sans_proc_rdv"

//ouverture de la dialogbox
if GetFileOpenName("Recherche de Lettre Type",file_path,file_name,"RTF","Fichiers RTF (*.rtf),*.rtf", rep_courriers) = 1 then
	dw_lettres.SetItem(dw_lettres.GetRow(),col_name,file_name)
end if
end event

type pb_13 from picturebutton within w_environnement_lettre
integer x = 2400
integer y = 1084
integer width = 105
integer height = 80
integer taborder = 120
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "lc_explorer.png"
alignment htextalign = left!
end type

event clicked;string file_name,file_path,col_name

//le nom de la colonne de la datawindow
col_name = "lettre_rendez_vous_manque"

//ouverture de la dialogbox
if GetFileOpenName("Recherche de Lettre Type",file_path,file_name,"RTF","Fichiers RTF (*.rtf),*.rtf", rep_courriers) = 1 then
	dw_lettres.SetItem(dw_lettres.GetRow(),col_name,file_name)
end if
end event

type pb_12 from picturebutton within w_environnement_lettre
integer x = 2400
integer y = 996
integer width = 105
integer height = 80
integer taborder = 110
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "lc_explorer.png"
alignment htextalign = left!
end type

event clicked;string file_name,file_path,col_name

//le nom de la colonne de la datawindow
col_name = "lettre_report_rendez_vous"

//ouverture de la dialogbox
if GetFileOpenName("Recherche de Lettre Type",file_path,file_name,"RTF","Fichiers RTF (*.rtf),*.rtf", rep_courriers) = 1 then
	dw_lettres.SetItem(dw_lettres.GetRow(),col_name,file_name)
end if
end event

type pb_11 from picturebutton within w_environnement_lettre
integer x = 2400
integer y = 908
integer width = 105
integer height = 80
integer taborder = 100
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "lc_explorer.png"
alignment htextalign = left!
end type

event clicked;string file_name,file_path,col_name

//le nom de la colonne de la datawindow
col_name = "lettre_type"

//ouverture de la dialogbox
if GetFileOpenName("Recherche de Lettre Type",file_path,file_name,"RTF","Fichiers RTF (*.rtf),*.rtf", rep_courriers) = 1 then
	dw_lettres.SetItem(dw_lettres.GetRow(),col_name,file_name)
end if
end event

type pb_10 from picturebutton within w_environnement_lettre
integer x = 2400
integer y = 820
integer width = 105
integer height = 80
integer taborder = 90
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "lc_explorer.png"
alignment htextalign = left!
end type

event clicked;string file_name,file_path,col_name

//le nom de la colonne de la datawindow
col_name = "lettre_remerciement3"

//ouverture de la dialogbox
if GetFileOpenName("Recherche de Lettre Type",file_path,file_name,"RTF","Fichiers RTF (*.rtf),*.rtf", rep_courriers) = 1 then
	dw_lettres.SetItem(dw_lettres.GetRow(),col_name,file_name)
end if
end event

type pb_9 from picturebutton within w_environnement_lettre
integer x = 2400
integer y = 732
integer width = 105
integer height = 80
integer taborder = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "lc_explorer.png"
alignment htextalign = left!
end type

event clicked;string file_name,file_path,col_name

//le nom de la colonne de la datawindow
col_name = "lettre_remerciement2"

//ouverture de la dialogbox
if GetFileOpenName("Recherche de Lettre Type",file_path,file_name,"RTF","Fichiers RTF (*.rtf),*.rtf", rep_courriers) = 1 then
	dw_lettres.SetItem(dw_lettres.GetRow(),col_name,file_name)
end if
end event

type pb_8 from picturebutton within w_environnement_lettre
integer x = 2400
integer y = 644
integer width = 105
integer height = 80
integer taborder = 70
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "lc_explorer.png"
alignment htextalign = left!
end type

event clicked;string file_name,file_path,col_name

//le nom de la colonne de la datawindow
col_name = "lettre_remerciement1"

//ouverture de la dialogbox
if GetFileOpenName("Recherche de Lettre Type",file_path,file_name,"RTF","Fichiers RTF (*.rtf),*.rtf", rep_courriers) = 1 then
	dw_lettres.SetItem(dw_lettres.GetRow(),col_name,file_name)
end if
end event

type pb_7 from picturebutton within w_environnement_lettre
integer x = 2400
integer y = 556
integer width = 105
integer height = 80
integer taborder = 50
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "lc_explorer.png"
alignment htextalign = left!
end type

event clicked;string file_name,file_path,col_name

//le nom de la colonne de la datawindow
col_name = "lettre_relance3"

//ouverture de la dialogbox
if GetFileOpenName("Recherche de Lettre Type",file_path,file_name,"RTF","Fichiers RTF (*.rtf),*.rtf", rep_courriers) = 1 then
	dw_lettres.SetItem(dw_lettres.GetRow(),col_name,file_name)
end if
end event

type pb_6 from picturebutton within w_environnement_lettre
integer x = 2400
integer y = 468
integer width = 105
integer height = 80
integer taborder = 60
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "lc_explorer.png"
alignment htextalign = left!
end type

event clicked;string file_name,file_path,col_name

//le nom de la colonne de la datawindow
col_name = "lettre_relance2"

//ouverture de la dialogbox
if GetFileOpenName("Recherche de Lettre Type",file_path,file_name,"RTF","Fichiers RTF (*.rtf),*.rtf", rep_courriers) = 1 then
	dw_lettres.SetItem(dw_lettres.GetRow(),col_name,file_name)
end if
end event

type pb_5 from picturebutton within w_environnement_lettre
integer x = 2400
integer y = 380
integer width = 105
integer height = 80
integer taborder = 50
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "lc_explorer.png"
alignment htextalign = left!
end type

event clicked;string file_name,file_path,col_name

//le nom de la colonne de la datawindow
col_name = "lettre_relance1"

//ouverture de la dialogbox
if GetFileOpenName("Recherche de Lettre Type",file_path,file_name,"RTF","Fichiers RTF (*.rtf),*.rtf", rep_courriers) = 1 then
	dw_lettres.SetItem(dw_lettres.GetRow(),col_name,file_name)
end if
end event

type pb_4 from picturebutton within w_environnement_lettre
integer x = 2400
integer y = 292
integer width = 105
integer height = 80
integer taborder = 40
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "lc_explorer.png"
alignment htextalign = left!
end type

event clicked;string file_name,file_path,col_name

//le nom de la colonne de la datawindow
col_name = "lettre_visite"

//ouverture de la dialogbox
if GetFileOpenName("Recherche de Lettre Type",file_path,file_name,"RTF","Fichiers RTF (*.rtf),*.rtf", rep_courriers) = 1 then
	dw_lettres.SetItem(dw_lettres.GetRow(),col_name,file_name)
end if
end event

type pb_3 from picturebutton within w_environnement_lettre
string tag = "no resizeall"
integer x = 2400
integer y = 204
integer width = 105
integer height = 80
integer taborder = 30
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "lc_explorer.png"
alignment htextalign = left!
end type

event clicked;string file_name,file_path,col_name

//le nom de la colonne de la datawindow
col_name = "lettre_honoraire"

//ouverture de la dialogbox
if GetFileOpenName("Recherche de Lettre Type",file_path,file_name,"RTF","Fichiers RTF (*.rtf),*.rtf", rep_courriers) = 1 then
	dw_lettres.SetItem(dw_lettres.GetRow(),col_name,file_name)
end if
end event

type dw_lettres from datawindow within w_environnement_lettre
string tag = "brush"
integer x = 18
integer y = 20
integer width = 3319
integer height = 1816
integer taborder = 10
string title = "none"
string dataobject = "dw_param_courrier"
boolean livescroll = true
end type

event losefocus;IF this.AcceptText() <> 1 THEN
	rollback;
	messagebox("ATTENTION","Vérifiez vos paramètres, svp ...")
end if
end event

type uo_taille from resize_fenetre within w_environnement_lettre
boolean visible = false
integer x = 827
integer y = 152
boolean bringtotop = true
long backcolor = 1090519039
end type

on uo_taille.destroy
call resize_fenetre::destroy
end on

