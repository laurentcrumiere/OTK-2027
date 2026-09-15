$PBExportHeader$w_paramgene_odrade.srw
forward
global type w_paramgene_odrade from w_fenetre_arakis
end type
type cb_enregistrer from uo_picturebutton_390x120 within w_paramgene_odrade
end type
type cb_annuler from uo_picturebutton_390x120 within w_paramgene_odrade
end type
type cb_fermer from uo_picturebutton_390x120 within w_paramgene_odrade
end type
type dw_fiche from datawindow within w_paramgene_odrade
end type
end forward

global type w_paramgene_odrade from w_fenetre_arakis
integer x = 18
integer y = 176
integer width = 3369
integer height = 1968
string title = "Paramètrages Tracés Odrade"
windowtype windowtype = response!
long backcolor = 15780518
cb_enregistrer cb_enregistrer
cb_annuler cb_annuler
cb_fermer cb_fermer
dw_fiche dw_fiche
end type
global w_paramgene_odrade w_paramgene_odrade

event open;dw_fiche.settransobject(sqlca)


colore_datawindow(dw_fiche)
backcolor = couleur_fond_fenetre

cb_annuler.triggerevent(clicked!)

centrer(this)









end event

on w_paramgene_odrade.create
int iCurrent
call super::create
this.cb_enregistrer=create cb_enregistrer
this.cb_annuler=create cb_annuler
this.cb_fermer=create cb_fermer
this.dw_fiche=create dw_fiche
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_enregistrer
this.Control[iCurrent+2]=this.cb_annuler
this.Control[iCurrent+3]=this.cb_fermer
this.Control[iCurrent+4]=this.dw_fiche
end on

on w_paramgene_odrade.destroy
call super::destroy
destroy(this.cb_enregistrer)
destroy(this.cb_annuler)
destroy(this.cb_fermer)
destroy(this.dw_fiche)
end on

type p_fond from w_fenetre_arakis`p_fond within w_paramgene_odrade
integer x = 2363
integer y = 1584
end type

type cb_enregistrer from uo_picturebutton_390x120 within w_paramgene_odrade
integer x = 1344
integer y = 1588
integer width = 562
integer taborder = 60
string text = "&Enregistrer"
string iconname = "ACTIONS_enregistrer.png"
end type

event clicked;call super::clicked;

boolean v_suite

v_suite = true

dw_fiche.accepttext()


// vérification des valeurs saisie

if dw_fiche.getItemString(1,"odrade_import_trace") = 'O' and dw_fiche.getItemNumber(1,"odrade_cadre_import_trace") = 0 then
	Messagebox("ATTENTION","Vous devez indiquer une valeur différente de 0 pour la cadre de destination pour le tracé.")
end if

if dw_fiche.getItemString(1,"odrade_import_tableau") = 'O' and dw_fiche.getItemNumber(1,"odrade_cadre_import_tableau") = 0 then
	Messagebox("ATTENTION","Vous devez indiquer une valeur différente de 0 pour la cadre de destination pour le tableau de mesures.")
end if


if dw_fiche.getItemString(1,"odrade_import_trace") = 'O' and dw_fiche.getItemString(1,"odrade_import_tableau") = 'O' then
	if dw_fiche.getItemNumber(1,"odrade_cadre_import_trace") = dw_fiche.getItemNumber(1,"odrade_cadre_import_tableau") then
		Messagebox("ATTENTION","Vous devez indiquer 2 valeurs différentes pour les cadres de destination.")
	end if
end if


if v_suite then
	if dw_fiche.update() = 1   then
		commit ;
	else
		Rollback ;
	end if
end if




end event

type cb_annuler from uo_picturebutton_390x120 within w_paramgene_odrade
integer x = 773
integer y = 1588
integer width = 562
integer taborder = 50
string text = "&Annuler"
string iconname = "ACTIONS_annuler.png"
end type

event clicked;call super::clicked;

if imagerie_2013 then
	dw_fiche.retrieve("O")
else
	dw_fiche.retrieve("N")
end if



end event

type cb_fermer from uo_picturebutton_390x120 within w_paramgene_odrade
integer x = 1915
integer y = 1588
integer width = 562
integer taborder = 50
string text = "&Fermer"
boolean default = true
string iconname = "ACTIONS_fermer.png"
end type

event clicked;call super::clicked;dw_fiche.accepttext()

if dw_fiche.modifiedcount() > 0  then
	If MessageBox("ATTENTION","Vous avez fait des modifications !~n~nVoulez-vous vraiment fermer cette fenêtre sans enregistrer (et ainsi perdre les modifications) ?",Question!,YesNo!, 2) = 1 Then
		Close(parent)
	end if
else
	close(parent)
end if
end event

type dw_fiche from datawindow within w_paramgene_odrade
string tag = "brush"
integer x = 64
integer y = 72
integer width = 3150
integer height = 1400
integer taborder = 10
string title = "none"
string dataobject = "dw_paramgene_odrade"
boolean livescroll = true
borderstyle borderstyle = styleraised!
end type

