$PBExportHeader$w_rapport_ia.srw
$PBExportComments$Affiche le compte rendu IA (fields + uncertainties) lu depuis un fichier JSON
forward
global type w_rapport_ia from window
end type
type uo_icones from uo_icones_alertes_patient within w_rapport_ia
end type
type cb_3 from uo_picturebutton_390x120 within w_rapport_ia
end type
type cb_2 from uo_picturebutton_390x120 within w_rapport_ia
end type
type cb_1 from uo_picturebutton_390x120_fermer within w_rapport_ia
end type
type dw_rapport from datawindow within w_rapport_ia
end type
end forward

global type w_rapport_ia from window
integer width = 3963
integer height = 2752
boolean titlebar = true
string title = "Compte rendu IA"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
string icon = "AppIcon!"
uo_icones uo_icones
cb_3 cb_3
cb_2 cb_2
cb_1 cb_1
dw_rapport dw_rapport
end type
global w_rapport_ia w_rapport_ia

type variables
n_cst_rapport_ia	inv_rapport

double var_code_local
string is_json_complet
end variables

forward prototypes
public function integer wf_charger ()
end prototypes

public function integer wf_charger ();

SetPointer(HourGlass!)
if inv_rapport.of_charger( is_json_complet, dw_rapport) < 0 then
	MessageBox(this.title, inv_rapport.of_get_lasterror(), StopSign!)
	return -1
end if

dw_rapport.ScrollToRow(1)
dw_rapport.SetFocus()
return 1
end function

on w_rapport_ia.create
this.uo_icones=create uo_icones
this.cb_3=create cb_3
this.cb_2=create cb_2
this.cb_1=create cb_1
this.dw_rapport=create dw_rapport
this.Control[]={this.uo_icones,&
this.cb_3,&
this.cb_2,&
this.cb_1,&
this.dw_rapport}
end on

on w_rapport_ia.destroy
destroy(this.uo_icones)
destroy(this.cb_3)
destroy(this.cb_2)
destroy(this.cb_1)
destroy(this.dw_rapport)
end on

event open;
// Paramètre 
str_rapport_ia lstr_rapport_ia

lstr_rapport_ia = message.powerobjectparm

this.backcolor = couleur_fond_fenetre
centrer(this)

var_code_local = lstr_rapport_ia.code_patient 
is_json_complet = lstr_rapport_ia.json_ia_complet

// Barre d'icone du patient
window w_fenetre_nulle
uo_icones.maj(var_code_local, this, w_fenetre_nulle)

wf_charger()


end event

type uo_icones from uo_icones_alertes_patient within w_rapport_ia
event destroy ( )
string tag = "no resize"
integer x = 101
integer y = 2364
integer taborder = 90
end type

on uo_icones.destroy
call uo_icones_alertes_patient::destroy
end on

type cb_3 from uo_picturebutton_390x120 within w_rapport_ia
integer x = 2350
integer y = 2420
integer width = 640
integer taborder = 70
fontcharset fontcharset = ansi!
string facename = "Arial"
string text = "Mettre à Jour"
string iconname = "Actions_Enregistrer.png"
end type

event clicked;call super::clicked;if messagebox("ATTENTION", "Vous allez mettre à jour le dossier du patient avec les informations présentées.~n~nCette opération est irrémédiable.~n~nConfirmez-vous ?", Question!, yesNo!, 2) = 1 then
	
	
	// Diagnostiques 
	string 	ls_diagsqueletique
	
	ls_diagsqueletique = dw_rapport.getitemstring(1, "diagsqueletique")
	
	
	
end if
end event

type cb_2 from uo_picturebutton_390x120 within w_rapport_ia
integer x = 1609
integer y = 2420
integer width = 640
integer taborder = 60
fontcharset fontcharset = ansi!
string facename = "Arial"
string text = "Diag."
string iconname = "lc_fiche_admini7.png"
end type

event clicked;call super::clicked;openwithparm(w_diag,var_code_local)
end event

type cb_1 from uo_picturebutton_390x120_fermer within w_rapport_ia
integer x = 3090
integer y = 2412
integer width = 640
integer taborder = 50
fontcharset fontcharset = ansi!
string facename = "Arial"
end type

type dw_rapport from datawindow within w_rapport_ia
integer x = 18
integer y = 28
integer width = 3895
integer height = 2300
integer taborder = 50
string title = "none"
string dataobject = "dw_rapport_ia"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

