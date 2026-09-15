$PBExportHeader$lien_radios_2015.sru
forward
global type lien_radios_2015 from userobject
end type
type st_titre from statictext within lien_radios_2015
end type
type cb_ajouter from commandbutton within lien_radios_2015
end type
end forward

global type lien_radios_2015 from userobject
integer width = 686
integer height = 200
boolean border = true
long backcolor = 16777215
string text = "none"
borderstyle borderstyle = stylelowered!
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
st_titre st_titre
cb_ajouter cb_ajouter
end type
global lien_radios_2015 lien_radios_2015

type variables
private uo_lien_trophy		uo_trophy
w_patient_maj		win_parent


double var_code_local
end variables

forward prototypes
public function string get_programme_exe_path ()
public function integer set_programme_exe_path (string v_prog_exe)
end prototypes

public function string get_programme_exe_path ();string v_exe 
v_exe = profilestring(dir_ini+inifile_orthokis,"Liens_Radios_2015","exe","") 
return v_exe
end function

public function integer set_programme_exe_path (string v_prog_exe);integer result 

result = Setprofilestring(dir_ini+inifile_orthokis,"Liens_Radios_2015","exe",v_prog_exe) 
return result
end function

on lien_radios_2015.create
this.st_titre=create st_titre
this.cb_ajouter=create cb_ajouter
this.Control[]={this.st_titre,&
this.cb_ajouter}
end on

on lien_radios_2015.destroy
destroy(this.st_titre)
destroy(this.cb_ajouter)
end on

event constructor;

if OWANDY then
	st_titre.text = "Lien Owandy"
end if 

if VATECH then
	st_titre.text = "Lien Vatech"
end if
end event

type st_titre from statictext within lien_radios_2015
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
long textcolor = 33554432
long backcolor = 16777215
string text = "Lien Owandy"
alignment alignment = center!
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type cb_ajouter from commandbutton within lien_radios_2015
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

event clicked;// sauvegarde la fiche ad si valide
if isvalid(win_parent) then
	win_parent.cb_enregister.TriggerEvent ( Clicked! )
	var_code_local = win_parent.var_code_local 
else
	// Appel par autre part (commentaire clinique) => var_code_local mis à jour là bas !
end if
uo_lien_radios lien_radios
lien_radios = create uo_lien_radios


if OWANDY then
	// nouveau lien
	// lien Owandy
	
	if lien_radios.init(2) = 1 then
		lien_radios.prepa_fichier_ini_owandy("Creer")
		lien_radios.lancer_lien( var_code_local )
	end if

else


	if VATECH then
		// nouveau lien
		// lien Vatech
		
		if lien_radios.init(3) = 1 then
			lien_radios.prepa_fichier_ini_vatech("Creer")
			lien_radios.lancer_lien( var_code_local )
		end if
	
	end if

end if

end event

event constructor;

if OWANDY then
	st_titre.text = "Lien Owandy"
end if

if VATECH then
	st_titre.text = "Lien Vatech"
end if


end event

