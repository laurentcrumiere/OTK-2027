$PBExportHeader$uo_picture_transparente.sru
forward
global type uo_picture_transparente from userobject
end type
type dw_picture from datawindow within uo_picture_transparente
end type
end forward

global type uo_picture_transparente from userobject
integer width = 219
integer height = 208
long backcolor = 65535
string text = "none"
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
event clicked pbm_bnclicked
dw_picture dw_picture
end type
global uo_picture_transparente uo_picture_transparente

type variables



integer type_uo

double var_code_local
end variables

forward prototypes
public subroutine init (string image, double v_code_patient)
end prototypes

public subroutine init (string image, double v_code_patient);
dw_picture.Object.DataWindow.detail.Color= string(couleur_fond_fenetre)
dw_picture.Object.p_image.filename = image

dw_picture.insertrow(1)

dw_picture.width = this.width
dw_picture.height = this.height

dw_picture.Object.p_image.height = this.height - 13
dw_picture.Object.p_image.width = this.width - 10

dw_picture.Object.Datawindow.detail.height = this.height


var_code_local = v_code_patient 

// Détermination du type d'UO

if image = "lc_money.png" or  image = "lc_money_tp.png" then
	// somme due
	type_uo = 1
else
	if image = "anniv.png"  then
		// Anniversaire
		type_uo = 2
	end if

end if


end subroutine

on uo_picture_transparente.create
this.dw_picture=create dw_picture
this.Control[]={this.dw_picture}
end on

on uo_picture_transparente.destroy
destroy(this.dw_picture)
end on

type dw_picture from datawindow within uo_picture_transparente
integer width = 165
integer height = 140
integer taborder = 10
string title = "none"
string dataobject = "dw_pour_affichage_des_pictures"
boolean border = false
boolean livescroll = true
end type

event clicked;
	// Exécution d'un truc en fonction de type_uo
	choose case type_uo
	case 1
		// Somme due par un patient
		string  v_libelle1, v_libelle2, v_libelle3
		affichage_somme_due(var_code_local,  true, v_libelle1, v_libelle2, v_libelle3)
	case 2
		if var_code_local <> 0 then
			date v_date_naissance
			select date_naissance into :v_date_naissance from patient where code = :var_code_local ;
			Messagebox("INFORMATIONS","Nous sommes le "+string(today())+"~n~nLe patient est né le "+string(v_date_naissance)+"~n~nAge : "+calcul_age(string(v_date_naissance)))
		end if
	end choose
	
	
	
	

end event

