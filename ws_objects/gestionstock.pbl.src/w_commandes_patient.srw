$PBExportHeader$w_commandes_patient.srw
forward
global type w_commandes_patient from w_fenetre_arakis
end type
type pb_1 from uo_picturebutton_390x120_fermer within w_commandes_patient
end type
type dw_1 from u_basedw within w_commandes_patient
end type
type dw_3 from u_basedw within w_commandes_patient
end type
end forward

global type w_commandes_patient from w_fenetre_arakis
integer width = 4325
integer height = 1796
string title = "Informations"
boolean minbox = false
boolean maxbox = false
boolean resizable = false
windowtype windowtype = response!
boolean center = true
pb_1 pb_1
dw_1 dw_1
dw_3 dw_3
end type
global w_commandes_patient w_commandes_patient

type variables
double var_code_local
integer var_type_liste

end variables

on w_commandes_patient.create
int iCurrent
call super::create
this.pb_1=create pb_1
this.dw_1=create dw_1
this.dw_3=create dw_3
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.pb_1
this.Control[iCurrent+2]=this.dw_1
this.Control[iCurrent+3]=this.dw_3
end on

on w_commandes_patient.destroy
call super::destroy
destroy(this.pb_1)
destroy(this.dw_1)
destroy(this.dw_3)
end on

event open;call super::open;// Afficher infos sur commande selon paramètre Param[1]


// 1 : commandes en cours pour le patient
// 2 : toutes les commandes pour le patient
// 3 : produit en stock pour le patient


// le code du patient est passé en paramètre directement 
var_code_local = message.doubleParm

var_type_liste = integer(param_win[1])


choose case var_type_liste
	case 1
		dw_1.visible = true
		this.title = "Commandes en cours pour ce patient"
		dw_1.settransobject(sqlca)
		dw_1.retrieve(var_code_local, 'N', 'N')
	case 2 
		dw_1.visible = true
		this.title = "Historique des Commandes pour ce patient"
		dw_1.settransobject(sqlca)
		dw_1.retrieve(var_code_local, 'N', 'O')
	case 3
		dw_3.visible = true
		this.title = "Produits en Stock pour ce patient"
		dw_3.settransobject(sqlca)
		dw_3.retrieve(var_code_local)
end choose
		

end event

type p_fond from w_fenetre_arakis`p_fond within w_commandes_patient
end type

type pb_1 from uo_picturebutton_390x120_fermer within w_commandes_patient
integer x = 1842
integer y = 1524
integer width = 411
integer height = 152
integer taborder = 10
boolean bringtotop = true
end type

type dw_1 from u_basedw within w_commandes_patient
string tag = "brush"
boolean visible = false
integer x = 5
integer y = 8
integer width = 4293
integer height = 1488
integer taborder = 10
boolean bringtotop = true
string dataobject = "dw_commandes_patient"
boolean hscrollbar = false
end type

type dw_3 from u_basedw within w_commandes_patient
boolean visible = false
integer x = 5
integer y = 8
integer width = 4293
integer height = 1488
integer taborder = 11
boolean bringtotop = true
string dataobject = "dw_commandes_stock_patient"
end type

