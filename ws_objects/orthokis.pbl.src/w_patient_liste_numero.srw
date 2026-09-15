$PBExportHeader$w_patient_liste_numero.srw
forward
global type w_patient_liste_numero from w_fenetre_arakis
end type
type pb_1 from uo_picturebutton_390x120_fermer within w_patient_liste_numero
end type
type dw_liste from datawindow within w_patient_liste_numero
end type
type st_libelle from statictext within w_patient_liste_numero
end type
type pb_2 from uo_picturebutton_780x120 within w_patient_liste_numero
end type
end forward

global type w_patient_liste_numero from w_fenetre_arakis
integer width = 4521
integer height = 1764
string title = "Patients déjà présents avec ce numéro"
windowtype windowtype = response!
long backcolor = 15780518
pb_1 pb_1
dw_liste dw_liste
st_libelle st_libelle
pb_2 pb_2
end type
global w_patient_liste_numero w_patient_liste_numero

on w_patient_liste_numero.create
int iCurrent
call super::create
this.pb_1=create pb_1
this.dw_liste=create dw_liste
this.st_libelle=create st_libelle
this.pb_2=create pb_2
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.pb_1
this.Control[iCurrent+2]=this.dw_liste
this.Control[iCurrent+3]=this.st_libelle
this.Control[iCurrent+4]=this.pb_2
end on

on w_patient_liste_numero.destroy
call super::destroy
destroy(this.pb_1)
destroy(this.dw_liste)
destroy(this.st_libelle)
destroy(this.pb_2)
end on

event open;call super::open;centrer(this)

datastore dw_patients
long nb_patients, lig

dw_patients = Message.PowerObjectParm


nb_patients = dw_patients.rowcount()

			
if nb_patients > 0 then
	for lig = 1 to nb_patients
		dw_liste.insertrow(0)
		dw_liste.setItem(lig, "code", dw_patients.getItemNumber(lig, "code"))
		dw_liste.setItem(lig, "nom", dw_patients.getItemString(lig, "nom"))
		dw_liste.setItem(lig, "prenom", dw_patients.getItemString(lig, "prenom"))
		dw_liste.setItem(lig, "date_naissance", dw_patients.getItemDate(lig, "date_naissance"))
		dw_liste.setItem(lig, "code_postal", dw_patients.getItemString(lig, "code_postal"))
		dw_liste.setItem(lig, "ville", dw_patients.getItemString(lig, "ville"))
		dw_liste.setItem(lig, "contact", dw_patients.getItemString(lig, "contact"))
		dw_liste.setItem(lig, "type_contact", dw_patients.getItemString(lig, "type_contact"))
	next
	
	// Pour trier
	dw_liste.sort()
	
	colore_datawindow(dw_liste)
	
	dw_liste.SelectRow(0,False)
	dw_liste.SelectRow(1,True)
	dw_liste.SeTRow(1)
	
	st_libelle.text = "Le numéro saisi a été trouvé dans "+string(dw_liste.rowcount()) +" autres patients"
else
	close(this)
end if
end event

type p_fond from w_fenetre_arakis`p_fond within w_patient_liste_numero
end type

type pb_1 from uo_picturebutton_390x120_fermer within w_patient_liste_numero
integer x = 2688
integer y = 1468
integer width = 489
integer taborder = 90
end type

event clicked;
// Pas de modif du patient
CloseWithReturn(Parent, 0)
end event

type dw_liste from datawindow within w_patient_liste_numero
string tag = "brush"
integer y = 244
integer width = 4443
integer height = 1188
integer taborder = 10
string title = "none"
string dataobject = "dw_patient_liste_numero"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event rowfocuschanged;
If CurrentRow > 0 Then
	This.SelectRow(0,False)
	This.SelectRow(CurrentRow,True)
	This.SeTRow(CurrentRow)
	
End If

end event

type st_libelle from statictext within w_patient_liste_numero
integer x = 14
integer y = 60
integer width = 2528
integer height = 108
integer textsize = -12
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
alignment alignment = center!
boolean border = true
boolean focusrectangle = false
end type

type pb_2 from uo_picturebutton_780x120 within w_patient_liste_numero
integer x = 1093
integer y = 1468
integer width = 914
integer height = 152
integer taborder = 100
boolean bringtotop = true
string text = "&Reprendre les Eléments"
string iconname = "lc_copy.png"
end type

event clicked;call super::clicked;

If MessageBox("ATTENTION","Vous allez reprendre les éléments déjà saisis de la fiche de " + dw_liste.getitemstring(dw_liste.getrow(),"nom_complet") + " pour alimenter la fiche du patient en cours de Création.~n~nConfirmez-vous ?", Question!, YesNo!, 2)  = 1 then
	// retour du code patient
	 CloseWithReturn(parent, dw_liste.getitemNumber(dw_liste.getrow(),"code"))
end if
end event

