$PBExportHeader$uo_commandes_patient1.sru
forward
global type uo_commandes_patient1 from picturebutton
end type
end forward

global type uo_commandes_patient1 from picturebutton
integer width = 151
integer height = 128
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "lc_c_vert.png"
alignment htextalign = left!
end type
global uo_commandes_patient1 uo_commandes_patient1

type variables
double var_code_local

integer mode 			// Vaudra 1 si commandes en cours .. 2 sinon
	

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
	This.PictureName = "lc_c_vert.png"
	PowerTipText = "Il y a des produits en stock pour ce patient"
	mode = 2
	this.visible = true
else	
	// Commandes non soldées pour le patient
	select isnull(count(*),0) into :tot_commandes_non_soldees from commande, ligne_commande 
	where code_patient = :var_code_local  and ligne_commande.numero_commande  = commande.numero_commande and ligne_commande.solde <> 'O' ; 
	
	
	if tot_commandes_non_soldees > 0 then
		This.PictureName = "lc_c_orange.png"
		PowerTipText = "Il y a des commandes en cours pour ce patient"
		mode = 1
		this.visible = true
	else
		// Rien pour stock
		this.visible = false
	end if
end if
	
end subroutine

on uo_commandes_patient1.create
end on

on uo_commandes_patient1.destroy
end on

event clicked;
// Selon ...
choose case mode 
	case 1
		// recherche des commandes en cours pour le patient
		param_win[1] = '1'
		OpenWithParm(w_commandes_patient, var_code_local)
	case 2
		// recherche des produits en stock pour le patient
		param_win[1] = '3'
		OpenWithParm(w_commandes_patient, var_code_local)
end choose
end event

event rbuttondown;
//choose case mode
//	case 1
		// recherche de toutes les commandes pour le patient
		param_win[1] = '2'
		OpenWithParm(w_commandes_patient, var_code_local)
//end choose
end event

