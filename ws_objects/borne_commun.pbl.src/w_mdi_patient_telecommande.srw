$PBExportHeader$w_mdi_patient_telecommande.srw
$PBExportComments$Fenêtre MDI de départ de l'application
forward
global type w_mdi_patient_telecommande from w_fenetre_arakis
end type
type cb_fermer from uo_picturebutton_250x120 within w_mdi_patient_telecommande
end type
type lb_liste from listbox within w_mdi_patient_telecommande
end type
end forward

global type w_mdi_patient_telecommande from w_fenetre_arakis
integer width = 1481
integer height = 1560
string title = "Liste des dossiers ouverts"
cb_fermer cb_fermer
lb_liste lb_liste
end type
global w_mdi_patient_telecommande w_mdi_patient_telecommande

on w_mdi_patient_telecommande.create
int iCurrent
call super::create
this.cb_fermer=create cb_fermer
this.lb_liste=create lb_liste
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_fermer
this.Control[iCurrent+2]=this.lb_liste
end on

on w_mdi_patient_telecommande.destroy
call super::destroy
destroy(this.cb_fermer)
destroy(this.lb_liste)
end on

event resize;call super::resize;//// On remplace le script !
//
//// On gère uniquement le resize en vertical pour les boutons soient mieux visible % la datawindow
//
//
//


lb_liste.height = this.height -350
lb_liste.width = this.width -20

cb_fermer.x = (this.width - cb_fermer.width) / 2
cb_fermer.y = this.height - cb_fermer.height - 165


end event

event close;call super::close;


// Mémorisation des coordonnées de la fenêtre en sortant
setprofilestring(dir_ini+inifile_orthokis,"MDI Patient","telecommande_x",string(UnitsToPixels( this.x, XUnitsToPixels!)))
setprofilestring(dir_ini+inifile_orthokis,"MDI Patient","telecommande_y",string(UnitsToPixels( this.y, YUnitsToPixels!)))
setprofilestring(dir_ini+inifile_orthokis,"MDI Patient","telecommande_width", string(this.width))
setprofilestring(dir_ini+inifile_orthokis,"MDI Patient","telecommande_height", string(this.height))

end event

event open;call super::open;


// Couleur de fonc spéciale .. idem mini salle d'attente
this.backcolor = rgb(177, 231, 146)


end event

type p_fond from w_fenetre_arakis`p_fond within w_mdi_patient_telecommande
end type

type cb_fermer from uo_picturebutton_250x120 within w_mdi_patient_telecommande
integer x = 489
integer y = 1264
integer width = 430
integer height = 164
integer taborder = 20
string text = "&Fermer"
string iconname = "Close!"
end type

event clicked;call super::clicked;

parent.hide()

end event

type lb_liste from listbox within w_mdi_patient_telecommande
integer width = 1440
integer height = 1200
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Eras Demi ITC"
long textcolor = 33554432
boolean hscrollbar = true
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

event selectionchanged;

//// On se met sur la fênetre du patient
//w_mdi_patient sheet_mdi_patient
//
//string titre_cherche
//boolean trouve
//
//
//titre_cherche = "Patient : "+this.SelectedItem ( )
//
//if ui_v2020 then
//	trouve = is_fenetre_2020_ouverte(titre_cherche, sheet_mdi_patient)
//else
//	trouve = is_fenetre_ouverte(titre_cherche, sheet_mdi_patient)
//end if
//
//if  trouve then
//	sheet_mdi_patient.bringtotop = true 
//else
//	// On a pas trouvé la fenêtre
//	Messagebox("ATTENTION !","Impossible de localiser le dossier de ce patient !~n~nVeuillez l'ouvrir par ailleurs !")
//	this.DeleteItem ( index )
//end if
//



return
end event

