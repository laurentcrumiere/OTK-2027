$PBExportHeader$w_patient_lien_parente_due.srw
forward
global type w_patient_lien_parente_due from w_fenetre_arakis
end type
type pb_fermer from uo_picturebutton_390x120 within w_patient_lien_parente_due
end type
type dw_liste from datawindow within w_patient_lien_parente_due
end type
type uo_1 from resize_fenetre within w_patient_lien_parente_due
end type
type pb_reg from uo_picturebutton_780x120 within w_patient_lien_parente_due
end type
end forward

global type w_patient_lien_parente_due from w_fenetre_arakis
boolean visible = false
integer width = 3419
integer height = 1652
string title = "Mise à jour les liens de parenté"
boolean minbox = false
boolean maxbox = false
boolean resizable = false
windowtype windowtype = response!
pb_fermer pb_fermer
dw_liste dw_liste
uo_1 uo_1
pb_reg pb_reg
end type
global w_patient_lien_parente_due w_patient_lien_parente_due

type variables


double var_code_local
double var_code_local_origine

double v_somme_due_totale = 0

double tab[] 	// contient la liste des code interne des patients de a famille



end variables

on w_patient_lien_parente_due.create
int iCurrent
call super::create
this.pb_fermer=create pb_fermer
this.dw_liste=create dw_liste
this.uo_1=create uo_1
this.pb_reg=create pb_reg
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.pb_fermer
this.Control[iCurrent+2]=this.dw_liste
this.Control[iCurrent+3]=this.uo_1
this.Control[iCurrent+4]=this.pb_reg
end on

on w_patient_lien_parente_due.destroy
call super::destroy
destroy(this.pb_fermer)
destroy(this.dw_liste)
destroy(this.uo_1)
destroy(this.pb_reg)
end on

event open;call super::open;//------------------------------------------------------------
// La fenêtre est VOLONTAIREMENT invisible
// C'est la fonction CENTRER qui la rendra visible !!!
//------------------------------------------------------------


uo_1.taille(this) // uniquement pour le brush de la datawindow

centrer_selon_w_mdi_2020(this)

// recup des codes patients passés en param

tab = w_patient_lien_parente.tab_parente


// Mise en place de la liste

double cpt, tot, due
// recherche des éléments pour titre de la fenêtre
string v_nom, v_prenom, v_numero_dossier

tot = tab[1]


for cpt = 2 to tot + 1
	
	var_code_local = tab[cpt]
	
	select nom, prenom, numero_dossier into :v_nom, :v_prenom, :v_numero_dossier from patient 
	where code = :var_code_local ;
	
	if cpt = 2 then
		// Tab [2] contient le patient à l'origine
		this.title = "Sommes dues par les liens de parenté du patient "+trim(v_nom)+" "+trim(v_prenom)+" ("+string(v_numero_dossier)+")"
		var_code_local_origine = var_code_local
	end if
	
	dw_liste.insertrow(9999)
	dw_liste.setitem(cpt - 1, "nom",v_nom) 
	dw_liste.setitem(cpt - 1, "prenom",v_prenom) 
	dw_liste.setitem(cpt - 1, "dossier", string(v_numero_dossier)) 
	dw_liste.setitem(cpt - 1, "somme_due",due(var_code_local, today()) )


next


if dw_liste.rowcount() > 0 then
	v_somme_due_totale = dw_liste.getItemNumber(dw_liste.rowcount() , "somme_due_totale" ) 
end if

if v_somme_due_totale > 0 then
	pb_reg.visible = true
	pb_reg.text = "Règlt Global (" + string (v_somme_due_totale)+ " " + symbole_euro + " )"
else
	pb_reg.visible = false
end if

end event

event resize;call super::resize;

uo_1.retaille(this) // uniquement pour le brush de la datawindow

end event

type p_fond from w_fenetre_arakis`p_fond within w_patient_lien_parente_due
end type

type pb_fermer from uo_picturebutton_390x120 within w_patient_lien_parente_due
integer x = 1824
integer y = 1332
integer width = 489
integer height = 152
integer taborder = 10
boolean bringtotop = true
string text = "&Fermer"
string iconname = "ACTIONS_fermer.png"
end type

event clicked;call super::clicked;

closeWithReturn(parent, 0 )

end event

type dw_liste from datawindow within w_patient_lien_parente_due
string tag = "brush"
integer x = 27
integer y = 28
integer width = 3333
integer height = 1228
integer taborder = 10
boolean bringtotop = true
string title = "none"
string dataobject = "dw_patient_lien_parente_due"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = styleraised!
end type

event clicked;

If row > 0 Then
	This.SelectRow(0,False)
	This.SelectRow(row,True)
	This.setrow(row)
End If

end event

type uo_1 from resize_fenetre within w_patient_lien_parente_due
boolean visible = false
integer x = 407
integer y = 1436
integer taborder = 20
boolean bringtotop = true
end type

on uo_1.destroy
call resize_fenetre::destroy
end on

type pb_reg from uo_picturebutton_780x120 within w_patient_lien_parente_due
integer x = 795
integer y = 1332
integer width = 777
integer height = 152
integer taborder = 20
boolean bringtotop = true
string text = "Règlement Global"
end type

event clicked;call super::clicked;

// Variables globales utilisées dans la saisie du règlement


v_code_regl = var_code_local_origine		
v_mon = v_somme_due_totale
v_date = today()

OpenWithParm(w_reglements_saisie,5)

if Message.DoubleParm = 1 then
	// 1 reglement a été saisi
	closeWithReturn(parent, 1 )
end if



end event

