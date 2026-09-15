$PBExportHeader$w_param_fiche.srw
forward
global type w_param_fiche from w_fenetre_arakis
end type
type cb_fermer from uo_picturebutton_390x120 within w_param_fiche
end type
type cb_enregistrer from uo_picturebutton_390x120 within w_param_fiche
end type
type cb_annuler from uo_picturebutton_390x120 within w_param_fiche
end type
type cb_imprimer from uo_picturebutton_390x120 within w_param_fiche
end type
type uo_1 from resize_fenetre within w_param_fiche
end type
type dw_fiche from datawindow within w_param_fiche
end type
end forward

global type w_param_fiche from w_fenetre_arakis
integer x = 41
integer y = 176
integer width = 2766
integer height = 1624
boolean controlmenu = false
windowtype windowtype = response!
boolean center = true
cb_fermer cb_fermer
cb_enregistrer cb_enregistrer
cb_annuler cb_annuler
cb_imprimer cb_imprimer
uo_1 uo_1
dw_fiche dw_fiche
end type
global w_param_fiche w_param_fiche

type variables
string code
end variables

event open;call super::open;// Passage de paramètre entre fenêtre
// après un openwithparm(nom_fenêtre,paramètre(string,number...)
//
code = message.stringparm

dw_fiche.settransobject(SQLCA)

if code = "      " then
	// Ajout
	dw_fiche.retrieve(" ")
	dw_fiche.insertrow(0)
	dw_fiche.ScrollToRow(dw_fiche.rowcount())
	dw_fiche.SetFocus()
else
	// Modif
	string clause
//	clause = "SELECT * FROM CORRESPONDANTS WHERE CORRESPONDANTS.CODE = '"+ CODE+"'"
//	dw_fiche.dwmodify('datawindow.table.select = "'+clause+'"')
	dw_fiche.Modify("Code.Edit.DisplayOnly = Yes")
	dw_fiche.retrieve(code)
end if



//uniquement pour les couleur
uo_1.taille(this)


if enregistrement_automatique then
	cb_annuler.visible = false
	cb_enregistrer.visible = false
end if


end event

on w_param_fiche.create
int iCurrent
call super::create
this.cb_fermer=create cb_fermer
this.cb_enregistrer=create cb_enregistrer
this.cb_annuler=create cb_annuler
this.cb_imprimer=create cb_imprimer
this.uo_1=create uo_1
this.dw_fiche=create dw_fiche
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_fermer
this.Control[iCurrent+2]=this.cb_enregistrer
this.Control[iCurrent+3]=this.cb_annuler
this.Control[iCurrent+4]=this.cb_imprimer
this.Control[iCurrent+5]=this.uo_1
this.Control[iCurrent+6]=this.dw_fiche
end on

on w_param_fiche.destroy
call super::destroy
destroy(this.cb_fermer)
destroy(this.cb_enregistrer)
destroy(this.cb_annuler)
destroy(this.cb_imprimer)
destroy(this.uo_1)
destroy(this.dw_fiche)
end on

event resize;uo_1.retaille(this)
end event

event close;call super::close;

if enregistrement_automatique then
	cb_enregistrer.triggerevent(clicked!)
end if
end event

type p_fond from w_fenetre_arakis`p_fond within w_param_fiche
end type

type cb_fermer from uo_picturebutton_390x120 within w_param_fiche
integer x = 2162
integer y = 1324
integer width = 471
integer taborder = 50
string text = "&Fermer"
string iconname = "ACTIONS_fermer.png"
end type

event clicked;call super::clicked;dw_fiche.accepttext()

// Depuis la version 15.10 on revoir le code qui vient d'être ajouter
string code_retour = ""

if dw_fiche.rowcount() > 0 then
	code_retour = dw_fiche.getItemString( 1, "code")
end if


if enregistrement_automatique then
	CloseWithReturn(parent, code_retour)
else
	if dw_fiche.modifiedcount() > 0 or dw_fiche.deletedcount()>0 Then
		If MessageBox("ATTENTION","Vous avez fait des modifications sur la Table !~n~nVoulez-vous vraiment fermer cette fenêtre sans enregistrer (et ainsi perdre les modifications) ?",Question!,YesNo!, 2) = 1 Then
			CloseWithReturn(parent, code_retour)
		end if
	else
		CloseWithReturn(parent, code_retour)
	end if
	
end if
end event

type cb_enregistrer from uo_picturebutton_390x120 within w_param_fiche
integer x = 1678
integer y = 1324
integer width = 471
integer taborder = 50
string text = "&Enregistrer"
string iconname = "ACTIONS_enregistrer.png"
end type

event clicked;call super::clicked;dw_fiche.accepttext()
if dw_fiche.update() = 1 then
	commit ;
else
	Rollback ;
end if

end event

type cb_annuler from uo_picturebutton_390x120 within w_param_fiche
integer x = 1193
integer y = 1324
integer width = 471
integer taborder = 50
string text = "A&nnuler"
string iconname = "ACTIONS_annuler.png"
end type

event clicked;call super::clicked;rollback ;
dw_fiche.retrieve(code) ;
end event

type cb_imprimer from uo_picturebutton_390x120 within w_param_fiche
integer x = 709
integer y = 1324
integer width = 471
integer taborder = 50
string text = "&Imprimer"
string iconname = "ACTIONS_imprimer.png"
end type

event clicked;call super::clicked;// Impression de la fiche
dw_fiche.print()
end event

type uo_1 from resize_fenetre within w_param_fiche
boolean visible = false
integer x = 215
integer y = 948
integer taborder = 11
long backcolor = 1090519039
end type

on uo_1.destroy
call resize_fenetre::destroy
end on

type dw_fiche from datawindow within w_param_fiche
string tag = "brush "
integer x = 91
integer y = 32
integer width = 2583
integer height = 1264
integer taborder = 10
string dataobject = "dw_corresp_fiche"
end type

event dberror;db_erreur(dw_fiche,sqldbcode,sqlerrtext)
return 1
end event

event itemchanged;if enregistrement_automatique then
	cb_enregistrer.triggerevent(clicked!)
end if
end event

