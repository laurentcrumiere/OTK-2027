$PBExportHeader$lien_orthomoov.sru
forward
global type lien_orthomoov from userobject
end type
type cb_lancer from picturebutton within lien_orthomoov
end type
end forward

global type lien_orthomoov from userobject
integer width = 128
integer height = 112
long backcolor = 16777215
string text = "none"
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
cb_lancer cb_lancer
end type
global lien_orthomoov lien_orthomoov

type prototypes

end prototypes

type variables
double var_code_local
string var_praticien_local


end variables

forward prototypes
public subroutine init (double v_code)
end prototypes

public subroutine init (double v_code);

var_code_local = v_code

select code_praticien into :var_praticien_local from patient where code = :var_code_local ;
end subroutine

on lien_orthomoov.create
this.cb_lancer=create cb_lancer
this.Control[]={this.cb_lancer}
end on

on lien_orthomoov.destroy
destroy(this.cb_lancer)
end on

type cb_lancer from picturebutton within lien_orthomoov
integer width = 128
integer height = 112
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "lc_icone_orthomoov.png"
alignment htextalign = left!
string powertiptext = "Demande de prescription Orthomoov pour le patient / Ouvre le dossier du patient sur le cloud Orthomoov"
end type

event clicked;
if var_code_local > 0 then

string v_commande

// Syntaxe d'appel
// orthomoov  commande  code_patient  code_praticien
// commande = c pour création / o pour ouverture


v_commande = dir_ini + "orthomoov.exe c " +string(var_code_local)+" "+ serial + var_praticien_local

//messagebox("trace",v_commande)


run(v_commande, Minimized!)
	
end if
end event

event rbuttondown;
if var_code_local > 0 then

string v_commande

// Syntaxe d'appel
// orthomoov  commande  code_patient  code_praticien
// commande = c pour création / o pour ouverture


v_commande = dir_ini + "orthomoov.exe o " +string(var_code_local)+" "+ serial + var_praticien_local

//messagebox("trace",v_commande)


run(v_commande, Minimized!)
	
end if
end event

