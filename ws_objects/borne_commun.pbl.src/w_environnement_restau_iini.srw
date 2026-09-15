$PBExportHeader$w_environnement_restau_iini.srw
forward
global type w_environnement_restau_iini from w_fenetre_arakis
end type
type lb_fichiers from listbox within w_environnement_restau_iini
end type
type dw_liste from datawindow within w_environnement_restau_iini
end type
type pb_restaurer from uo_picturebutton_390x120 within w_environnement_restau_iini
end type
type pb_annuler from uo_picturebutton_390x120 within w_environnement_restau_iini
end type
end forward

global type w_environnement_restau_iini from w_fenetre_arakis
integer width = 2304
integer height = 1776
string title = "Choix du fichier à recopier"
boolean minbox = false
boolean maxbox = false
boolean resizable = false
windowtype windowtype = response!
boolean center = true
lb_fichiers lb_fichiers
dw_liste dw_liste
pb_restaurer pb_restaurer
pb_annuler pb_annuler
end type
global w_environnement_restau_iini w_environnement_restau_iini

type variables


string v_rep_mise_jour_centralise
end variables

on w_environnement_restau_iini.create
int iCurrent
call super::create
this.lb_fichiers=create lb_fichiers
this.dw_liste=create dw_liste
this.pb_restaurer=create pb_restaurer
this.pb_annuler=create pb_annuler
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.lb_fichiers
this.Control[iCurrent+2]=this.dw_liste
this.Control[iCurrent+3]=this.pb_restaurer
this.Control[iCurrent+4]=this.pb_annuler
end on

on w_environnement_restau_iini.destroy
call super::destroy
destroy(this.lb_fichiers)
destroy(this.dw_liste)
destroy(this.pb_restaurer)
destroy(this.pb_annuler)
end on

event open;call super::open;
// récup du répertoire passé en paramètre

v_rep_mise_jour_centralise = Message.StringParm



// Mémoridation du .ini le dossier maj_arakis

string  v_fic_serveur


lb_fichiers.reset()
lb_fichiers.dirlist(v_rep_mise_jour_centralise + "Orthokis-*.ini", 1 + 32)

long cpt, tot
string v_poste
datetime v_date_fichier

tot = lb_fichiers.TotalItems()


if tot = 0 then
	
	Messagebox("ATTENTION !","Le répertoire du serveur ne contient aucun fichier paramètre sauvegardé !")
	
else
	
	for cpt = 1 to tot
	
		v_poste = mid( lb_fichiers.text(cpt) , 10, len(lb_fichiers.text(cpt)) - 13)
		v_fic_serveur = v_rep_mise_jour_centralise +  lb_fichiers.text(cpt)
		
		dw_liste.insertrow(0)
		dw_liste.SetItem(cpt, "nom_poste", v_poste)
		dw_liste.SetItem(cpt, "date_heure", fxg_get_file_date(v_fic_serveur))
		if v_poste = get_nom_ordinateur() then
			dw_liste.SetItem(cpt, "couleur_fond", couleur_verte)
		else
			dw_liste.SetItem(cpt, "couleur_fond", couleur_blanche)
		end if
		
	Next


end if
end event

type p_fond from w_fenetre_arakis`p_fond within w_environnement_restau_iini
end type

type lb_fichiers from listbox within w_environnement_restau_iini
boolean visible = false
integer y = 1100
integer width = 480
integer height = 400
integer taborder = 10
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
end type

type dw_liste from datawindow within w_environnement_restau_iini
integer x = 5
integer width = 2258
integer height = 1396
integer taborder = 20
boolean bringtotop = true
string title = "Fichiers disponibles sur le serveur"
string dataobject = "dw_liste_fichiers_ini"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;If row > 0 Then
	This.SelectRow(0,False)
	This.SelectRow(row,True)
	This.setrow(row)
End If
end event

type pb_restaurer from uo_picturebutton_390x120 within w_environnement_restau_iini
integer x = 1001
integer y = 1480
integer width = 535
integer height = 152
integer taborder = 20
boolean bringtotop = true
string text = "&Restaurer"
string iconname = "StepIn1!"
end type

event clicked;call super::clicked;
// Mémoridation du .ini le dossier maj_arakis

string v_fic_local, v_fic_serveur


v_fic_local = dir_ini + "Orthokis.ini"

if dw_liste.getrow() > 0 then 
	v_fic_serveur = v_rep_mise_jour_centralise +  lb_fichiers.text(dw_liste.getrow())
	
	if Not FileExists(	v_fic_serveur) then
		// en principe pas possible mais
		Messagebox("ATTENTION","Le fichier que vous avez choisi n'existe pas ou plus !")
	else
		// Ca doit être good
		
		If Messagebox("ATTENTION","Vous allez écraser le fichier de paramètres locaux par le fichier sauvegardé sur le serveur.~n~nConfirmez-vous ?", Question!, YesNo!, 2) = 1 then

			If FileCopy(v_fic_serveur, v_fic_local, true) = 1 then
				Messagebox("ATTENTION","Le fichier a été restauré avec succès !")
				close(parent)
			else
				Messagebox("ATTENTION","Une erreur s'est produite durant la restauration du fichier !")
				close(parent)
			end if
		end if
	end if
end if

end event

type pb_annuler from uo_picturebutton_390x120 within w_environnement_restau_iini
integer x = 430
integer y = 1480
integer width = 535
integer height = 152
integer taborder = 30
boolean bringtotop = true
string text = "&Annuler"
string iconname = "ACTIONS_sortir.png"
end type

event clicked;call super::clicked;close(parent)
end event

