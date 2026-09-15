$PBExportHeader$w_efacturation_belgique_numero.srw
forward
global type w_efacturation_belgique_numero from w_fenetre_arakis
end type
type cb_ajouter from uo_picturebutton_390x120 within w_efacturation_belgique_numero
end type
type cb_annuler from uo_picturebutton_390x120 within w_efacturation_belgique_numero
end type
type em_num from editmask within w_efacturation_belgique_numero
end type
type st_saisie from statictext within w_efacturation_belgique_numero
end type
end forward

global type w_efacturation_belgique_numero from w_fenetre_arakis
integer x = 681
integer y = 480
integer width = 1554
integer height = 768
string title = "Saisie d~'une nouvelle eFacture"
windowtype windowtype = response!
long backcolor = 15780518
boolean center = true
cb_ajouter cb_ajouter
cb_annuler cb_annuler
em_num em_num
st_saisie st_saisie
end type
global w_efacturation_belgique_numero w_efacturation_belgique_numero

type variables


char c_type_facture
string s_libelle
end variables

event open;long l_max


// cette pour les facture est les note de crédit

c_type_facture = message.StringParm

choose case c_type_facture 
	case "F" 
		s_libelle = "eFacture"
	case "N" 	
		s_libelle = "Note de Crédit"
end choose

st_saisie.text = "N° de " + s_libelle + " :"

this.title = "Saisie d'une nouvelle " + s_libelle

// on garde la même numérotation pour les factures et les notes de crédit (ça évitera les erreurs)
//select isnull(max(numero_facture), 0) into :l_max from efacture_belgique where type_facture = :c_type_facture ;

select isnull(max(numero_facture), 0) into :l_max from efacture_belgique ;

em_num.text = string(l_max + 1) 

this.backcolor = couleur_fond_fenetre



end event

on w_efacturation_belgique_numero.create
int iCurrent
call super::create
this.cb_ajouter=create cb_ajouter
this.cb_annuler=create cb_annuler
this.em_num=create em_num
this.st_saisie=create st_saisie
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_ajouter
this.Control[iCurrent+2]=this.cb_annuler
this.Control[iCurrent+3]=this.em_num
this.Control[iCurrent+4]=this.st_saisie
end on

on w_efacturation_belgique_numero.destroy
call super::destroy
destroy(this.cb_ajouter)
destroy(this.cb_annuler)
destroy(this.em_num)
destroy(this.st_saisie)
end on

type p_fond from w_fenetre_arakis`p_fond within w_efacturation_belgique_numero
end type

type cb_ajouter from uo_picturebutton_390x120 within w_efacturation_belgique_numero
integer x = 229
integer y = 412
integer width = 517
integer taborder = 20
string text = "&Ajouter"
boolean default = true
string iconname = "ACTIONS_ajouter.png"
end type

event clicked;call super::clicked;long l_num, l_cpt

l_num = long(em_num.text)


if l_num <= 0   then
	son(5)
	MessageBox("ATTENTION !","Le numéro de " + s_libelle + " doit être strictement positif !")
else
	select isnull(count(*),0) into :l_cpt from efacture_belgique where numero_facture = :l_num and type_facture = :c_type_facture ; 
	if l_cpt > 0 then 
		Messagebox("ATTENTION", "Ce numéro de " + s_libelle + " existe déjà !")
	else
		closewithreturn(parent, l_num)
	end if
end if


end event

type cb_annuler from uo_picturebutton_390x120 within w_efacturation_belgique_numero
integer x = 773
integer y = 412
integer width = 517
integer taborder = 20
string text = "A&nnuler"
string iconname = "ACTIONS_abandonner.png"
end type

event clicked;call super::clicked;closewithreturn(parent, -1)
end event

type em_num from editmask within w_efacturation_belgique_numero
integer x = 745
integer y = 164
integer width = 631
integer height = 96
integer taborder = 10
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 16777215
alignment alignment = right!
borderstyle borderstyle = stylelowered!
string mask = "############"
boolean spin = true
string displaydata = "~r"
double increment = 1
string minmax = "-999999~~9999999"
end type

type st_saisie from statictext within w_efacturation_belgique_numero
integer x = 5
integer y = 180
integer width = 704
integer height = 72
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
string facename = "Arial"
long backcolor = 553648127
string text = "N° de eFacture :"
alignment alignment = right!
end type

