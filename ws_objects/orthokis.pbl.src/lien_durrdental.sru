$PBExportHeader$lien_durrdental.sru
forward
global type lien_durrdental from userobject
end type
type st_1 from statictext within lien_durrdental
end type
type cb_ajouter from commandbutton within lien_durrdental
end type
end forward

global type lien_durrdental from userobject
integer width = 690
integer height = 200
boolean border = true
long backcolor = 16777215
string text = "none"
borderstyle borderstyle = stylelowered!
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
st_1 st_1
cb_ajouter cb_ajouter
end type
global lien_durrdental lien_durrdental

type variables
private 	uo_lien_durrdental 	uo_durrdental

w_patient_maj		win_parent

double var_code_local

// Mode VDDS ou non pour MyRay
boolean mode_vdds = false
string nom_lien_vdds

end variables

forward prototypes
public subroutine init (readonly window win, double v_code)
end prototypes

public subroutine init (readonly window win, double v_code);win_parent = win
var_code_local = v_code

// Mode VDDS ou non ??

string ini_vdds = "C:\Windows\VDDS_MMI.INI"
string v_name
integer i = 1
mode_vdds = false
nom_lien_vdds = ""
if FileExists(ini_vdds) then
	do while i <= 10 and  not mode_vdds
		v_name = trim( profilestring(ini_vdds, "BVS", "NAME" + string(i), "") )
		if upper(v_name) = "DUERR_DENTAL_VISTASOFT" then
			mode_vdds = true
			nom_lien_vdds = v_name
		end if
		i = i + 1
	loop 
end if


end subroutine

on lien_durrdental.create
this.st_1=create st_1
this.cb_ajouter=create cb_ajouter
this.Control[]={this.st_1,&
this.cb_ajouter}
end on

on lien_durrdental.destroy
destroy(this.st_1)
destroy(this.cb_ajouter)
end on

event constructor;// allocation mem pour obj
uo_durrdental = create uo_lien_durrdental



end event

event destructor;destroy uo_durrdental

end event

type st_1 from statictext within lien_durrdental
integer x = 5
integer y = 12
integer width = 663
integer height = 72
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean italic = true
long textcolor = 16711680
long backcolor = 16777215
string text = "Lien DURR DENTAL"
alignment alignment = center!
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type cb_ajouter from commandbutton within lien_durrdental
integer x = 5
integer y = 84
integer width = 663
integer height = 96
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Module Radio"
end type

event clicked;string		rep_radio

if not mode_vdds then
	// on enregiste le patient
	if isvalid(win_parent) then
		win_parent.cb_enregister.TriggerEvent ( Clicked! )
		var_code_local = win_parent.var_code_local
	else
		// var_code_local est mis à jour par l'appelant
	end if
	
	uo_durrdental.ouvrir_dbswin( var_code_local  )

else

	// 	mode VDDS => Acquisition.exe
	uo_lien_radios lien_radios
	lien_radios = create uo_lien_radios
	if lien_radios.init(5) = 1 then
		lien_radios.prepa_fichier_ini_vdds("Creer", nom_lien_vdds)
		lien_radios.lancer_lien( var_code_local )
	end if

end if
	
end event

