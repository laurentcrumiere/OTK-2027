$PBExportHeader$uo_volet_patients.sru
forward
global type uo_volet_patients from userobject
end type
type dw_liste from datawindow within uo_volet_patients
end type
end forward

global type uo_volet_patients from userobject
integer width = 1472
integer height = 3456
long backcolor = 16777215
string text = "none"
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
dw_liste dw_liste
end type
global uo_volet_patients uo_volet_patients

type variables
integer max_patient = 30
end variables

forward prototypes
public subroutine ajouter_patient (double code, integer chrono)
end prototypes

public subroutine ajouter_patient (double code, integer chrono);
// Ajoute un éléments dans la liste ... si + de max_patient, on supprimer le plus ancien
// chrono = l'ordre d'ouverture des fiches ... pour éliminer le plus ancien si besoin
// Si chrono vaut 0 ... on déduit l'ordre ... max(ordre) + 1

// La liste est trié sur le chrono descendant ... du dernier ouvert au plus ancien ouvert

string v_nom, v_titre
double v_numero_dossier, v_code
long lig

// est ce le patient y est déjà  ?
lig = dw_liste.find("code = " + string(code), 1, 99999)

if lig = 0 then 
	// le patient n'y est pas .. ajout
	
//	if chrono = 0 then
//		lig = dw_liste.rowcount()
//		if lig = 0 then 
//			chrono = 1
//		else
//			// Faut déduire l'ordre 
//			dw_liste.setSort("chrono")
//			dw_liste.sort()
//			chrono = dw_liste.GetItemNumber(lig, "chrono") + 1
//		end if
//	end if
//	
	// Recherche des éléments
	select trim(nom) + ' ' + isnull(prenom, '') , numero_dossier 
	into :v_nom, :v_numero_dossier 
	from patient
	where code = :code ;

	dw_liste.insertRow(9999)
	lig = dw_liste.rowcount()
	v_titre = v_nom + " ("+string(v_numero_dossier)+")"
	dw_liste.SetItem(lig, "titre", v_titre)
	dw_liste.SetItem(lig, "code", code)
	dw_liste.SetItem(lig, "numero_dossier", v_numero_dossier)
	dw_liste.SetItem(lig, "nom_cherche", v_nom)
	dw_liste.SetItem(lig, "chrono", dw_liste.rowcount())
	

	if lig > max_patient then 
		// on supprime une ligne .. la plus ancienne selon chrono 
//		dw_liste.setSort("chrono")
//		dw_liste.sort()
//		// on supprime la dernière
		dw_liste.deleterow(dw_liste.rowcount())
	end if
	
	
//	// on retrie à la fin
//	dw_liste.setSort("titre")
//	dw_liste.sort()
//

dw_liste.sort()

end if

end subroutine

on uo_volet_patients.create
this.dw_liste=create dw_liste
this.Control[]={this.dw_liste}
end on

on uo_volet_patients.destroy
destroy(this.dw_liste)
end on

event constructor;


// Application des couleurs 
colore_datawindow (dw_liste)
end event

type dw_liste from datawindow within uo_volet_patients
string tag = "brush"
integer x = 5
integer y = 8
integer width = 1431
integer height = 3412
integer taborder = 10
boolean bringtotop = true
string title = "none"
string dataobject = "dw_mdi_patient_telecommande"
boolean border = false
boolean livescroll = true
end type

event clicked;If row > 0 Then
	This.SelectRow(0,False)
	This.SelectRow(row,True)
	This.setrow(row)
end if

end event

event doubleclicked;if row > 0 then

	var_code 				= 	this.getitemnumber(row,"code")
	var_numero_dossier 	= 	this.getitemnumber(row,"numero_dossier")
	var_nom 				= this.getitemstring(row,"nom_cherche")
	var_nomp 				= ""
	var_pay 					= ""
	var_moul 				= ""

	ouverture_salle_attente()
end if


end event

event rbuttondown;if row > 0 then
	This.SelectRow(0,False)
	This.SelectRow(row,True)
	This.setrow(row)
	OpenMenuPatient_Listes(this)
end if
end event

