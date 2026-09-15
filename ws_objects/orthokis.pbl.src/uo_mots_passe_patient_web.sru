$PBExportHeader$uo_mots_passe_patient_web.sru
forward
global type uo_mots_passe_patient_web from userobject
end type
type pb_1 from picturebutton within uo_mots_passe_patient_web
end type
end forward

global type uo_mots_passe_patient_web from userobject
integer width = 160
integer height = 144
long backcolor = 67108864
string text = "none"
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
pb_1 pb_1
end type
global uo_mots_passe_patient_web uo_mots_passe_patient_web

type variables

datawindow dw[]
integer nb_zone
string zone[]
string valeur[]


double var_code_local
end variables

forward prototypes
public function boolean match_email (string libelle, string email)
end prototypes

public function boolean match_email (string libelle, string email);

// Vérifie le format d'un email

if len(trim(email)) > 0 then
	if match(email, "^[A-Ba-z0-9\.\-_]+[@][A-Ba-z0-9\.\-_]+[.][A-Ba-z0-9]+$") then
		return true
	else
		Messagebox("Erreur dans la saisie d'une adresse email","L'adresse saisie pour le "+libelle+"~n~n("+email+")~n~nn'est pas correcte !")
		return false
	end if
else
	return true
end if
end function

on uo_mots_passe_patient_web.create
this.pb_1=create pb_1
this.Control[]={this.pb_1}
end on

on uo_mots_passe_patient_web.destroy
destroy(this.pb_1)
end on

event constructor;pb_1.width = this.width
pb_1.height = this.height
end event

type pb_1 from picturebutton within uo_mots_passe_patient_web
integer width = 151
integer height = 136
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean flatstyle = true
string picturename = "cadenas.png"
alignment htextalign = left!
string powertiptext = "Mots de passe Portail Patient"
long backcolor = 553648127
end type

event clicked;
// Récupération des information dans les varibales locales ...
int cpt

for cpt = 1 to nb_zone
	valeur[cpt] = dw[cpt].getitemstring(	1, zone[cpt] )
next


// Récupération du code du patient ....
var_code_local = 	dw[1].getitemnumber(	1, "code" )



openWithParm (w_patient_mdp_web, parent)


// remise en place des valeurs
for cpt = 1 to nb_zone
	 dw[cpt].setitem(1, zone[cpt],valeur[cpt] )
next

end event

