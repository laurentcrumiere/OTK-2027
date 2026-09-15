$PBExportHeader$uo_nom_patient.sru
$PBExportComments$Plus utilisée depuis V2009
forward
global type uo_nom_patient from userobject
end type
type st_couleur from statictext within uo_nom_patient
end type
type st_cmu from statictext within uo_nom_patient
end type
type st_code from statictext within uo_nom_patient
end type
type st_nom from statictext within uo_nom_patient
end type
end forward

global type uo_nom_patient from userobject
string tag = "centrer"
integer width = 3113
integer height = 120
long backcolor = 15780518
string text = "none"
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
st_couleur st_couleur
st_cmu st_cmu
st_code st_code
st_nom st_nom
end type
global uo_nom_patient uo_nom_patient

type variables



double var_code_local
end variables

forward prototypes
public subroutine set_backcolor (long couleur)
public subroutine maj (double v_code)
end prototypes

public subroutine set_backcolor (long couleur);

// Permet de définir un couleur de fond pour tous les objets du uo


this.backcolor = couleur
st_code.backcolor = couleur
st_cmu.backcolor = couleur
st_nom.backcolor = couleur



end subroutine

public subroutine maj (double v_code);

// PLUS UTILISEE EN VERSION 2009

st_nom.text = var_nom
st_code.text = string(v_code)

string v_cmu
double v_couleur1
select mise_en_evidence, couleur1 into :v_cmu, :v_couleur1 from patient where code = :v_code ;

st_cmu.text = v_cmu

//if v_cmu = "O" then
//	if belgique then
//		st_cmu.text = "V"
//	else
//		st_cmu.text = "C"
//	end if
//else
//	st_cmu.text = ""
//end if
//
//if not isnull(v_couleur1) and v_couleur1 > 0 then
//	rr_1.fillcolor = v_couleur1 
//	//rr_1.linecolor = v_couleur1 
//else
//	rr_1.visible = false
//end if


if not isnull(v_couleur1) and v_couleur1 > 0 then
	st_couleur.backcolor = v_couleur1 
	st_couleur.text = ""
else
	//st_couleur.visible = false
	st_couleur.backcolor = rgb(192,192,192)
	st_couleur.text = "?"
end if

end subroutine

event constructor;


// instance
var_code_local = var_code 

maj(var_code_local)


colore_tous_objets(this)


end event

on uo_nom_patient.create
this.st_couleur=create st_couleur
this.st_cmu=create st_cmu
this.st_code=create st_code
this.st_nom=create st_nom
this.Control[]={this.st_couleur,&
this.st_cmu,&
this.st_code,&
this.st_nom}
end on

on uo_nom_patient.destroy
destroy(this.st_couleur)
destroy(this.st_cmu)
destroy(this.st_code)
destroy(this.st_nom)
end on

type st_couleur from statictext within uo_nom_patient
integer x = 14
integer y = 16
integer width = 110
integer height = 92
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
alignment alignment = center!
boolean border = true
borderstyle borderstyle = styleraised!
boolean focusrectangle = false
end type

event clicked;	//Declaration des variables locales
	//--------------------------
	long couleur_choisie
	
	couleur_choisie = this.backcolor
	
	//Appel de la fenetre couleur et au retour, met la couleur de fond
	//--------------------------------------------------
	if appel_palette(couleur_choisie) then
		
		// Mise à jour du patient
		if MessageBox("Mise à jour de la couleur du patient","Confirmez-vous la mise à jour de la couleur ?",Question!,YesNo!,1) = 1 then
			update patient set couleur1 = :couleur_choisie where code = :var_code ;
			this.backcolor = couleur_choisie
			this.text = ''
			commit ;
		end if
	end if
end event

type st_cmu from statictext within uo_nom_patient
integer x = 2313
integer y = 12
integer width = 105
integer height = 96
integer textsize = -16
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 15780518
boolean focusrectangle = false
end type

type st_code from statictext within uo_nom_patient
integer x = 2469
integer y = 12
integer width = 631
integer height = 96
integer textsize = -16
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 15780518
alignment alignment = right!
boolean focusrectangle = false
end type

type st_nom from statictext within uo_nom_patient
integer x = 133
integer y = 12
integer width = 2153
integer height = 100
integer textsize = -16
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 15780518
boolean focusrectangle = false
end type

