$PBExportHeader$w_recherche_utilisateurs.srw
forward
global type w_recherche_utilisateurs from w_fenetre_arakis
end type
type cb_fermer from uo_picturebutton_390x120 within w_recherche_utilisateurs
end type
type cb_annuler from uo_picturebutton_390x120 within w_recherche_utilisateurs
end type
type dw_liste from datawindow within w_recherche_utilisateurs
end type
end forward

global type w_recherche_utilisateurs from w_fenetre_arakis
integer width = 1367
integer height = 1732
string title = "Recherche d~'utilisateur"
windowtype windowtype = response!
long backcolor = 15780518
cb_fermer cb_fermer
cb_annuler cb_annuler
dw_liste dw_liste
end type
global w_recherche_utilisateurs w_recherche_utilisateurs

type variables


long appeler_par
end variables

on w_recherche_utilisateurs.create
int iCurrent
call super::create
this.cb_fermer=create cb_fermer
this.cb_annuler=create cb_annuler
this.dw_liste=create dw_liste
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_fermer
this.Control[iCurrent+2]=this.cb_annuler
this.Control[iCurrent+3]=this.dw_liste
end on

on w_recherche_utilisateurs.destroy
call super::destroy
destroy(this.cb_fermer)
destroy(this.cb_annuler)
destroy(this.dw_liste)
end on

event open;call super::open;
// On passe en paramètre
// 1 si appel depuis w_main_odrade
// 2 si appel depuis w_utilisateur_fiche_odrade

appeler_par = message.doubleParm

colore_datawindow(dw_liste)

dw_liste.settransobject(t_odrade)
dw_liste.retrieve()

if dw_liste.rowcount() > 0 then

	// Recherche de l'utilisateur actuel
	long row
	
	if appeler_par = 1 then
		row = dw_liste.find("code_utilisateur = "+string(w_main_odrade.utilisateur_odrade),1,dw_liste.rowcount())
	else
		dw_liste.setFilter("niveau_acces = 1")
		dw_liste.Filter()
		row = dw_liste.find("code_utilisateur = "+string(w_utilisateur_fiche_odrade.v_code_utilisateur_odrade),1,dw_liste.rowcount())
	end if
	
	If row > 0 Then
		dw_liste.SelectRow(0,False)
		dw_liste.SelectRow(row,True)
	End If
	

	centrer(this)
else
	Messagebox("ATTENTION !","Il n'y a pas d'utilisateur dans Odrade !")
	close(this)
end if
end event

type p_fond from w_fenetre_arakis`p_fond within w_recherche_utilisateurs
end type

type cb_fermer from uo_picturebutton_390x120 within w_recherche_utilisateurs
integer x = 754
integer y = 1456
integer taborder = 30
string text = "&Valider"
boolean originalsize = false
end type

event clicked;call super::clicked;if dw_liste.getrow() > 0 then
	if appeler_par = 1 then 
		if dw_liste.getitemnumber(dw_liste.getrow(),"code_utilisateur") <>w_main_odrade.utilisateur_odrade then
			w_main_odrade.utilisateur_odrade = dw_liste.getitemnumber(dw_liste.getrow(),"code_utilisateur")
			//		setprofilestring(dir_ini+"orthokis.ini","Odrade","code_utilisateur",string(w_main_odrade.utilisateur_odrade))
			w_main_odrade.dessiner_tableau()
		end if
	else
		w_utilisateur_fiche_odrade.v_code_utilisateur_odrade = dw_liste.getitemnumber(dw_liste.getrow(),"code_utilisateur")
	end if
end if
close(parent)
end event

type cb_annuler from uo_picturebutton_390x120 within w_recherche_utilisateurs
integer x = 219
integer y = 1456
integer taborder = 20
string text = "&Annuler"
boolean originalsize = false
end type

event clicked;call super::clicked;close(parent)
end event

type dw_liste from datawindow within w_recherche_utilisateurs
string tag = "brush"
integer x = 18
integer y = 36
integer width = 1285
integer height = 1372
integer taborder = 10
string title = "Recherche Tracé"
string dataobject = "dw_liste_utilisateurs"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;If row > 0 Then
	This.SelectRow(0,False)
	This.SelectRow(row,True)
End If

end event

event retrieveend;If rowcount > 0 Then
	This.SelectRow(1,True)
End If

end event

event doubleclicked;cb_fermer.triggerevent(clicked!)
end event

