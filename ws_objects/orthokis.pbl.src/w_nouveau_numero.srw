$PBExportHeader$w_nouveau_numero.srw
forward
global type w_nouveau_numero from w_fenetre_arakis
end type
type cb_ajouter from uo_picturebutton_390x120 within w_nouveau_numero
end type
type cb_annuler from uo_picturebutton_390x120 within w_nouveau_numero
end type
type em_dernier from editmask within w_nouveau_numero
end type
type st_dernier from statictext within w_nouveau_numero
end type
type em_maxi from editmask within w_nouveau_numero
end type
type em_mini from editmask within w_nouveau_numero
end type
type em_num from editmask within w_nouveau_numero
end type
type st_saisie from statictext within w_nouveau_numero
end type
type st_maxi from statictext within w_nouveau_numero
end type
type st_mini from statictext within w_nouveau_numero
end type
type pb_aide from uo_bouton_aide within w_nouveau_numero
end type
end forward

global type w_nouveau_numero from w_fenetre_arakis
integer x = 681
integer y = 480
integer width = 1554
integer height = 984
string title = "Saisie d~'un nouveau Numéro de Dossier"
windowtype windowtype = response!
cb_ajouter cb_ajouter
cb_annuler cb_annuler
em_dernier em_dernier
st_dernier st_dernier
em_maxi em_maxi
em_mini em_mini
em_num em_num
st_saisie st_saisie
st_maxi st_maxi
st_mini st_mini
pb_aide pb_aide
end type
global w_nouveau_numero w_nouveau_numero

event open;double min, max, var_message
int	propo_auto

//récup du message d'ouverture
// 1 : mode normal ouverture par le menu ; 2 : ouverture par l'agenda ; 3 : ouverture par importation Doctolib (comme 2 mais sans interface)
var_message = message.doubleparm

//maj var globale
var_suite = false

//retrouve les numéro de dossier patient min et max ds base
SELECT min(numero_dossier),max(numero_dossier) INTO :min,:max 
FROM "patient" WHERE   -100000000 < numero_dossier and numero_dossier < 100000000;

//on maj l'UI
em_maxi.text = string(max)
em_mini.text = string(min)
em_dernier.text = string(var_numero_dossier)
//nouveau = suivant une option des param généraux
choose case var_message
	case 1
		//mode normale (par menu patient --> nouveau dossier)
		select num_patient_auto_normale into :propo_auto from param ;
	case 2, 3
		//mode rapide (par bouton droit souris ds agenda graph) ou importation Doctolib
		select num_patient_auto_rapide into :propo_auto from param ;
end choose

//rappel : si 1 => le plus grand +1 ; si 2 => le plus petit -1
choose case propo_auto
	case 1
		em_num.text = string(max +1)
	case 2
		em_num.text = string(min -1)
end choose


//st_mini.backcolor = couleur_fond_fenetre
//st_maxi.backcolor = couleur_fond_fenetre
//st_dernier.backcolor = couleur_fond_fenetre
//st_saisie.backcolor = couleur_fond_fenetre

this.backcolor = couleur_fond_fenetre

if var_message = 3 then 
	// Importation Doctolib : On valide de suite l'ajout
	this.hide()
	cb_ajouter.postevent(clicked!)
else
	//position à l'ouverture
	centrer(this)
end if
end event

on w_nouveau_numero.create
int iCurrent
call super::create
this.cb_ajouter=create cb_ajouter
this.cb_annuler=create cb_annuler
this.em_dernier=create em_dernier
this.st_dernier=create st_dernier
this.em_maxi=create em_maxi
this.em_mini=create em_mini
this.em_num=create em_num
this.st_saisie=create st_saisie
this.st_maxi=create st_maxi
this.st_mini=create st_mini
this.pb_aide=create pb_aide
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_ajouter
this.Control[iCurrent+2]=this.cb_annuler
this.Control[iCurrent+3]=this.em_dernier
this.Control[iCurrent+4]=this.st_dernier
this.Control[iCurrent+5]=this.em_maxi
this.Control[iCurrent+6]=this.em_mini
this.Control[iCurrent+7]=this.em_num
this.Control[iCurrent+8]=this.st_saisie
this.Control[iCurrent+9]=this.st_maxi
this.Control[iCurrent+10]=this.st_mini
this.Control[iCurrent+11]=this.pb_aide
end on

on w_nouveau_numero.destroy
call super::destroy
destroy(this.cb_ajouter)
destroy(this.cb_annuler)
destroy(this.em_dernier)
destroy(this.st_dernier)
destroy(this.em_maxi)
destroy(this.em_mini)
destroy(this.em_num)
destroy(this.st_saisie)
destroy(this.st_maxi)
destroy(this.st_mini)
destroy(this.pb_aide)
end on

type p_fond from w_fenetre_arakis`p_fond within w_nouveau_numero
end type

type cb_ajouter from uo_picturebutton_390x120 within w_nouveau_numero
integer x = 375
integer y = 692
integer width = 517
integer taborder = 20
string text = "&Ajouter"
boolean default = true
string iconname = "ACTIONS_ajouter.png"
end type

event clicked;call super::clicked;double num

NUM = double(em_num.text)

if num = 0 or isnull(num) then
	son(5)
	MessageBox("ATTENTION !","Le numéro de dossier peut être positif,~nnégatif, mais pas nul !")
else
	if not (-99999999<=num and num<=99999999) then
		son(5)
		MessageBox("ATTENTION !","Le numéro de dossier doit être compris entre -99999999 et 99999999 !")
	else
		
		if ajout_nouveau_patient(num) = 1 then
			var_suite = true
			close(parent)
		end if
		

	end if
end if


end event

type cb_annuler from uo_picturebutton_390x120 within w_nouveau_numero
integer x = 919
integer y = 692
integer width = 517
integer taborder = 20
string text = "A&nnuler"
string iconname = "ACTIONS_abandonner.png"
end type

event clicked;call super::clicked;var_suite = false
close(parent)
end event

type em_dernier from editmask within w_nouveau_numero
integer x = 859
integer y = 284
integer width = 370
integer height = 96
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 134217731
alignment alignment = right!
boolean displayonly = true
string mask = "########0"
string displaydata = ""
end type

type st_dernier from statictext within w_nouveau_numero
integer x = 201
integer y = 300
integer width = 649
integer height = 64
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
string facename = "Arial"
long backcolor = 553648127
string text = "Dernier N° manipulé :"
end type

type em_maxi from editmask within w_nouveau_numero
integer x = 859
integer y = 172
integer width = 370
integer height = 96
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 134217731
alignment alignment = right!
boolean displayonly = true
string mask = "########0"
string displaydata = ""
end type

type em_mini from editmask within w_nouveau_numero
integer x = 859
integer y = 60
integer width = 370
integer height = 96
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 134217731
alignment alignment = right!
boolean displayonly = true
string mask = "########0"
string displaydata = ""
end type

type em_num from editmask within w_nouveau_numero
integer x = 859
integer y = 480
integer width = 439
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
string mask = "#########"
boolean spin = true
string displaydata = "~r"
double increment = 1
string minmax = "-999999~~9999999"
end type

type st_saisie from statictext within w_nouveau_numero
integer x = 201
integer y = 496
integer width = 617
integer height = 72
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
string facename = "Arial"
long backcolor = 553648127
string text = "N° Dossier à Saisir :"
end type

type st_maxi from statictext within w_nouveau_numero
integer x = 201
integer y = 188
integer width = 549
integer height = 64
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
string facename = "Arial"
long backcolor = 553648127
string text = "N° Dossier Maxi :"
end type

type st_mini from statictext within w_nouveau_numero
integer x = 201
integer y = 76
integer width = 549
integer height = 64
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
string facename = "Arial"
long backcolor = 553648127
string text = "N° Dossier Mini :"
end type

type pb_aide from uo_bouton_aide within w_nouveau_numero
string tag = "Fiche Administrative"
integer x = 96
integer y = 684
integer taborder = 120
boolean bringtotop = true
end type

on pb_aide.destroy
call uo_bouton_aide::destroy
end on

