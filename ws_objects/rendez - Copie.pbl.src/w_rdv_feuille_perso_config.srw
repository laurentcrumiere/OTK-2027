$PBExportHeader$w_rdv_feuille_perso_config.srw
forward
global type w_rdv_feuille_perso_config from w_fenetre_arakis
end type
type pb_fermer from uo_picturebutton_390x120_fermer within w_rdv_feuille_perso_config
end type
type pb_tout from uo_picturebutton_780x120 within w_rdv_feuille_perso_config
end type
type pb_2 from uo_picturebutton_780x120 within w_rdv_feuille_perso_config
end type
type dw_liste from datawindow within w_rdv_feuille_perso_config
end type
end forward

global type w_rdv_feuille_perso_config from w_fenetre_arakis
integer width = 2126
integer height = 2224
string title = "Configuration des colonnes"
boolean minbox = false
boolean maxbox = false
boolean resizable = false
windowtype windowtype = response!
boolean center = true
pb_fermer pb_fermer
pb_tout pb_tout
pb_2 pb_2
dw_liste dw_liste
end type
global w_rdv_feuille_perso_config w_rdv_feuille_perso_config

on w_rdv_feuille_perso_config.create
int iCurrent
call super::create
this.pb_fermer=create pb_fermer
this.pb_tout=create pb_tout
this.pb_2=create pb_2
this.dw_liste=create dw_liste
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.pb_fermer
this.Control[iCurrent+2]=this.pb_tout
this.Control[iCurrent+3]=this.pb_2
this.Control[iCurrent+4]=this.dw_liste
end on

on w_rdv_feuille_perso_config.destroy
call super::destroy
destroy(this.pb_fermer)
destroy(this.pb_tout)
destroy(this.pb_2)
destroy(this.dw_liste)
end on

event open;call super::open;

// remplissage de la liste à partir des éléments de la fenêtre appelante "w_rdv_feuille_perso" forcément


long tot , lig

tot = w_rdv_feuille_perso.nombre_colonnes





// Visibilite des colonnes
string visibilite
visibilite = Profilestring(dir_ini+inifile_orthokis,"rendez-vous","visibilite_colonnes_feuille_perso","1010111110100101011100000000")


for lig = 1 to tot
	
	dw_liste.insertrow(0)
	dw_liste.setitem(lig, "numero", lig)
	dw_liste.setitem(lig, "nom", w_rdv_feuille_perso.libelle_colonne[lig])

	if w_rdv_feuille_perso.nom_colonne[lig] = "" or mid(visibilite, lig, 1) <> "1" then
		dw_liste.setitem(lig, "visible", 0)
	else
		dw_liste.setitem(lig, "visible", 1)
	end if
	

next

dw_liste.setfilter("nom <> ''")
dw_liste.filter()

dw_liste.setSort("numero")
dw_liste.sort()



end event

event close;call super::close;// mémorisation des visibles ou pas 


dw_liste.setfilter("")
dw_liste.filter()

dw_liste.setSort("numero")
dw_liste.sort()

long tot , lig
string colonne_visibilite

tot = dw_liste.rowcount()


for lig = 1 to tot
	
	colonne_visibilite = colonne_visibilite + string(dw_liste.GetitemNumber(lig, "visible"))

next

Setprofilestring(dir_ini+inifile_orthokis,"rendez-vous","visibilite_colonnes_feuille_perso",colonne_visibilite)


end event

type p_fond from w_fenetre_arakis`p_fond within w_rdv_feuille_perso_config
end type

type pb_fermer from uo_picturebutton_390x120_fermer within w_rdv_feuille_perso_config
integer x = 1627
integer y = 1892
integer width = 448
integer height = 152
integer taborder = 10
boolean bringtotop = true
end type

type pb_tout from uo_picturebutton_780x120 within w_rdv_feuille_perso_config
integer x = 23
integer y = 1888
integer width = 777
integer height = 152
integer taborder = 10
boolean bringtotop = true
string text = "Tout Sélectionner"
string iconname = "ACTIONS_etiquettes.png"
end type

event clicked;call super::clicked;
long lig, tot

tot = dw_liste.rowcount()

for lig = 1 to tot
	dw_liste.setitem(lig, "visible", 1)
next

end event

type pb_2 from uo_picturebutton_780x120 within w_rdv_feuille_perso_config
integer x = 823
integer y = 1888
integer width = 777
integer height = 152
integer taborder = 20
boolean bringtotop = true
string text = "Ne rien Sélectionner"
string iconname = "Control Rect_2!"
end type

event clicked;call super::clicked;long lig, tot

tot = dw_liste.rowcount()

for lig = 1 to tot
	dw_liste.setitem(lig, "visible", 0)
next

end event

type dw_liste from datawindow within w_rdv_feuille_perso_config
string tag = "brush"
integer x = 137
integer y = 32
integer width = 1842
integer height = 1808
integer taborder = 10
boolean bringtotop = true
string title = "none"
string dataobject = "dw_rdv_feuille_travail_perso_config"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

