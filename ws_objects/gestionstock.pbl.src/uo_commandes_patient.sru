$PBExportHeader$uo_commandes_patient.sru
forward
global type uo_commandes_patient from userobject
end type
type p_orange from picture within uo_commandes_patient
end type
type p_verte from picture within uo_commandes_patient
end type
end forward

global type uo_commandes_patient from userobject
integer width = 142
integer height = 135
long backcolor = 65535
string text = "none"
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
p_orange p_orange
p_verte p_verte
end type
global uo_commandes_patient uo_commandes_patient

type variables


double var_code_local

window fenetre_mere_local

boolean doit_etre_visible
end variables

forward prototypes
public subroutine init (double v_code_patient)
end prototypes

public subroutine init (double v_code_patient);// recherche commandes pour mettre C vert ou orange


long tot_futures, tot_passees

long tot_commandes_non_soldees, tot_stock

var_code_local = v_code_patient


// Produit en stock pour le patient 
select isnull(count(*),0) into :tot_stock from stock_produit  
where code_patient = :var_code_local and quantite_colisee > 0   ; 


if tot_stock > 0 then
	p_orange.visible = false
	p_verte.visible = true
	doit_etre_visible = true
else	
	// Commandes non soldées pour le patient
	select isnull(count(*),0) into :tot_commandes_non_soldees from commande, ligne_commande 
	where code_patient = :var_code_local  and ligne_commande.numero_commande  = commande.numero_commande and ligne_commande.solde <> 'O' ; 
	
	
	if tot_commandes_non_soldees > 0 then
		p_orange.visible = true
		p_verte.visible = false
		doit_etre_visible = true
	else
		// Rien pour stock
		p_orange.visible = false
		p_verte.visible = false
		doit_etre_visible = false
	end if
end if
	
end subroutine

on uo_commandes_patient.create
this.p_orange=create p_orange
this.p_verte=create p_verte
this.Control[]={this.p_orange,&
this.p_verte}
end on

on uo_commandes_patient.destroy
destroy(this.p_orange)
destroy(this.p_verte)
end on

event constructor;this.backcolor = couleur_fond_fenetre


end event

type p_orange from picture within uo_commandes_patient
integer x = 9
integer y = 8
integer width = 114
integer height = 108
string picturename = "lc_c_orange.png"
boolean focusrectangle = false
string powertiptext = "Il y a des commandes en cours pour ce patient"
end type

event clicked;// recherche des commandes en cours pour le patients

param_win[1] = '1'

OpenWithParm(w_commandes_patient, var_code_local)
end event

event rbuttondown;// recherche de toutes les commandes pour le patient

param_win[1] = '2'

OpenWithParm(w_commandes_patient, var_code_local)
end event

type p_verte from picture within uo_commandes_patient
integer x = 9
integer y = 8
integer width = 114
integer height = 108
string picturename = "lc_c_vert.png"
boolean focusrectangle = false
string powertiptext = "Il y a un (ou plusieurs) produit(s) en stock pour ce patient"
end type

event clicked;// recherche des produits en stock pour le patient

param_win[1] = '3'

OpenWithParm(w_commandes_patient, var_code_local)
end event

