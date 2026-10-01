$PBExportHeader$w_paramgene_dentapoche.srw
forward
global type w_paramgene_dentapoche from w_fenetre_arakis
end type
type cb_enregistrer from uo_picturebutton_390x120 within w_paramgene_dentapoche
end type
type cb_annuler from uo_picturebutton_390x120 within w_paramgene_dentapoche
end type
type cb_fermer from uo_picturebutton_390x120 within w_paramgene_dentapoche
end type
type dw_fiche from datawindow within w_paramgene_dentapoche
end type
type uo_1 from resize_fenetre within w_paramgene_dentapoche
end type
end forward

global type w_paramgene_dentapoche from w_fenetre_arakis
integer x = 18
integer y = 176
integer width = 3342
integer height = 1872
boolean titlebar = false
string title = ""
boolean controlmenu = false
boolean minbox = false
boolean maxbox = false
boolean resizable = false
windowtype windowtype = child!
long backcolor = 15780518
cb_enregistrer cb_enregistrer
cb_annuler cb_annuler
cb_fermer cb_fermer
dw_fiche dw_fiche
uo_1 uo_1
end type
global w_paramgene_dentapoche w_paramgene_dentapoche

event open;
uo_1.taille(this)
dw_fiche.settransobject(sqlca)


colore_datawindow(dw_fiche)
backcolor = couleur_fond_fenetre

cb_annuler.triggerevent(clicked!)










end event

on w_paramgene_dentapoche.create
int iCurrent
call super::create
this.cb_enregistrer=create cb_enregistrer
this.cb_annuler=create cb_annuler
this.cb_fermer=create cb_fermer
this.dw_fiche=create dw_fiche
this.uo_1=create uo_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_enregistrer
this.Control[iCurrent+2]=this.cb_annuler
this.Control[iCurrent+3]=this.cb_fermer
this.Control[iCurrent+4]=this.dw_fiche
this.Control[iCurrent+5]=this.uo_1
end on

on w_paramgene_dentapoche.destroy
call super::destroy
destroy(this.cb_enregistrer)
destroy(this.cb_annuler)
destroy(this.cb_fermer)
destroy(this.dw_fiche)
destroy(this.uo_1)
end on

event close;call super::close;
if enregistrement_automatique and cb_enregistrer.enabled then
	cb_enregistrer.triggerevent(clicked!)
end if
end event

event resize;call super::resize;uo_1.retaille(this)

end event

type p_fond from w_fenetre_arakis`p_fond within w_paramgene_dentapoche
integer x = 2363
integer y = 1584
end type

type cb_enregistrer from uo_picturebutton_390x120 within w_paramgene_dentapoche
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

type cb_annuler from uo_picturebutton_390x120 within w_paramgene_dentapoche
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

type cb_fermer from uo_picturebutton_390x120 within w_paramgene_dentapoche
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
		fermer_fenetre(parent)
	end if
else
	fermer_fenetre(parent)
end if
end event

type dw_fiche from datawindow within w_paramgene_dentapoche
string tag = "brush"
integer x = 64
integer y = 72
integer width = 3150
integer height = 620
integer taborder = 10
string title = "none"
string dataobject = "dw_paramgene_dentapoche"
boolean livescroll = true
end type

type uo_1 from resize_fenetre within w_paramgene_dentapoche
boolean visible = false
integer x = 2738
integer y = 1404
integer taborder = 60
boolean bringtotop = true
long backcolor = 1090519039
end type

on uo_1.destroy
call resize_fenetre::destroy
end on

