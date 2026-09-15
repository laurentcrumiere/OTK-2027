$PBExportHeader$uo_couleur_patient.sru
forward
global type uo_couleur_patient from statictext
end type
end forward

global type uo_couleur_patient from statictext
integer width = 146
integer height = 104
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
boolean border = true
borderstyle borderstyle = styleraised!
boolean focusrectangle = false
end type
global uo_couleur_patient uo_couleur_patient

type variables


double var_code_local
end variables

forward prototypes
public subroutine maj_couleur ()
end prototypes

public subroutine maj_couleur ();// Sert pour couleur 1 ou couleur 2
// Le N° de la fenêtre doit être dans le TAG !!!

integer numero_couleur

numero_couleur = integer(this.tag)



//Declaration des variables locales
//--------------------------
long couleur_choisie

couleur_choisie = this.backcolor

//Appel de la fenetre couleur et au retour, met la couleur de fond
//--------------------------------------------------
if appel_palette(couleur_choisie) then
	boolean v_suite = false
	
	// Mise à jour du patient
	if enregistrement_automatique then 
		v_suite = true
	else
		if MessageBox("Mise à jour de la couleur du patient","Confirmez-vous la mise à jour de la couleur ?",Question!,YesNo!,1) = 1 then
			v_suite = true
		else
			v_suite = false 
		end if
	end if
	if v_suite then
		choose case numero_couleur
			case 1 
				update patient set couleur1 = :couleur_choisie where code = :var_code ;
			case 2
				update patient set couleur2 = :couleur_choisie where code = :var_code ;
			case 3
				update patient set couleur3 = :couleur_choisie where code = :var_code ;
			case 4
				update patient set couleur4 = :couleur_choisie where code = :var_code ;
		end choose
		this.backcolor = couleur_choisie
		this.text = ''
		commit ;
	end if
end if
end subroutine

on uo_couleur_patient.create
end on

on uo_couleur_patient.destroy
end on

event clicked;

maj_couleur()
end event

event rbuttondown;
double v_nul
setnull(v_nul)


// Sert pour couleur 1 ou couleur 2
// Le N° de la fenêtre doit être dans le TAG !!!

integer numero_couleur

numero_couleur = integer(this.tag)


if messagebox("Confirmation","Vous allez annuler la couleur de ce patient.~n~nConfirmez-vous ?", Question!, YesNo!, 2) = 1 then
	choose case numero_couleur
		case 1
			update patient set couleur1 = :v_nul where code = :var_code ;
		case 2
			update patient set couleur2 = :v_nul where code = :var_code ;
		case 3
			update patient set couleur3 = :v_nul where code = :var_code ;
		case 4
			update patient set couleur4 = :v_nul where code = :var_code ;
	end choose
	
	this.backcolor = couleur_jour_interdit
	this.text = '?'
	commit ;
end if

end event

