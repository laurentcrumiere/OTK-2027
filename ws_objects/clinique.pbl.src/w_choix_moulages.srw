$PBExportHeader$w_choix_moulages.srw
forward
global type w_choix_moulages from w_fenetre_arakis
end type
type pb_annuler from uo_picturebutton_390x120 within w_choix_moulages
end type
type pb_ok from uo_picturebutton_390x120 within w_choix_moulages
end type
type dw_liste from u_basedw within w_choix_moulages
end type
end forward

global type w_choix_moulages from w_fenetre_arakis
integer width = 2098
integer height = 2036
string title = "Choix du Moulage"
boolean minbox = false
boolean maxbox = false
boolean resizable = false
windowtype windowtype = response!
boolean center = true
pb_annuler pb_annuler
pb_ok pb_ok
dw_liste dw_liste
end type
global w_choix_moulages w_choix_moulages

type variables


double var_code_local

string type_objet // vaut "M" pour Moulage ou "V" pour vidéo
end variables

on w_choix_moulages.create
int iCurrent
call super::create
this.pb_annuler=create pb_annuler
this.pb_ok=create pb_ok
this.dw_liste=create dw_liste
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.pb_annuler
this.Control[iCurrent+2]=this.pb_ok
this.Control[iCurrent+3]=this.dw_liste
end on

on w_choix_moulages.destroy
call super::destroy
destroy(this.pb_annuler)
destroy(this.pb_ok)
destroy(this.dw_liste)
end on

event open;call super::open;
// le code du patient en paramètre
var_code_local = message.doubleparm

// Param_Win[1] vaut "M" pour Moulage ou "V" pour vidéo

type_objet = Param_Win[1]
dw_liste.settransobject(sqlca)


if type_objet = "M" then 
	this.title = "Choix du Moulage" 
	dw_liste.retrieve(var_code_local, 'DOCMOU')
else
	this.title = "Choix de la Vidéo" 
	dw_liste.retrieve(var_code_local, 'DOCVID')
end if

colore_datawindow(dw_liste)

end event

type p_fond from w_fenetre_arakis`p_fond within w_choix_moulages
end type

type pb_annuler from uo_picturebutton_390x120 within w_choix_moulages
integer x = 288
integer y = 1692
integer width = 553
integer height = 152
integer taborder = 20
boolean bringtotop = true
string text = "&Annuler"
string iconname = "ACTIONS_abandonner.png"
end type

event clicked;call super::clicked;
// Pas de choix de fichier
closeWithReturn(parent,"")
end event

type pb_ok from uo_picturebutton_390x120 within w_choix_moulages
integer x = 878
integer y = 1692
integer width = 553
integer height = 152
integer taborder = 30
boolean bringtotop = true
string text = "&OK"
string iconname = "ACTIONS_valider.png"
end type

event clicked;call super::clicked;// Choix du fichier

string v_fichier
v_fichier = dw_liste.GetItemString(dw_liste.getrow(), "historique_editions_nom_courrier")
closeWithReturn(parent,v_fichier)
end event

type dw_liste from u_basedw within w_choix_moulages
string tag = "no resize all brush"
integer x = 64
integer y = 8
integer width = 1938
integer height = 1652
integer taborder = 10
boolean bringtotop = true
string dataobject = "dw_moulages_liste"
boolean hscrollbar = false
boolean border = false
borderstyle borderstyle = stylebox!
end type

event doubleclicked;call super::doubleclicked;

pb_ok.triggerevent(clicked!)
end event

