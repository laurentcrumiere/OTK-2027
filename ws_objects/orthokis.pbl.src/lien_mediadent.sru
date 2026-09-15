$PBExportHeader$lien_mediadent.sru
forward
global type lien_mediadent from userobject
end type
type st_1 from statictext within lien_mediadent
end type
type cb_ajouter from commandbutton within lien_mediadent
end type
end forward

global type lien_mediadent from userobject
integer width = 686
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
global lien_mediadent lien_mediadent

type variables
private 	uo_lien_mediadent	uo_mediadent

w_patient_maj		win_parent


double var_code_local


// Mode VDDS ou non pour DIXEL
boolean mode_vdds = false
string nom_lien_vdds
end variables

forward prototypes
public subroutine init (readonly window win)
end prototypes

public subroutine init (readonly window win);win_parent = win

// 

string ini_vdds, v_name
integer i

// Est ce que VDDS est installé pour I-Dixel
ini_vdds = "C:\Windows\VDDS_MMI.INI"
i = 1
mode_vdds = false
nom_lien_vdds = ""
if FileExists(ini_vdds) then
	do while i <= 10 and  not mode_vdds
		v_name = trim( profilestring(ini_vdds, "BVS", "NAME" + string(i), "") )
		if upper(v_name) = "I-DIXEL" then
			mode_vdds = true
			nom_lien_vdds = v_name
		end if
		i = i + 1
	loop 
end if

if mode_vdds then
	st_1.text = "Lien I-Dixel"
end if
end subroutine

on lien_mediadent.create
this.st_1=create st_1
this.cb_ajouter=create cb_ajouter
this.Control[]={this.st_1,&
this.cb_ajouter}
end on

on lien_mediadent.destroy
destroy(this.st_1)
destroy(this.cb_ajouter)
end on

event constructor;// allocation mem pour obj uo_lien_trophy
uo_mediadent = create uo_lien_mediadent

end event

event destructor;destroy uo_mediadent

end event

type st_1 from statictext within lien_mediadent
integer x = 5
integer y = 16
integer width = 654
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
string text = "Lien MEDIADENT"
alignment alignment = center!
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type cb_ajouter from commandbutton within lien_mediadent
integer x = 5
integer y = 88
integer width = 654
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



if mode_vdds then
	// Lien avec D-Ixel
	// Mode VDDS  => Acquisition.exe
	uo_lien_radios lien_radios
	lien_radios = create uo_lien_radios
	if lien_radios.init(5) = 1 then
		lien_radios.prepa_fichier_ini_vdds("Creer", nom_lien_vdds)
		if isvalid(win_parent) then
			// désactivé en 2022 car mic mac sur le clic droit de l'imagerie
			//win_parent.cb_enregister.TriggerEvent ( Clicked! )
			var_code_local = double(win_parent.var_code_local)
		else
			// var_code_local mis à jour par l'appelant
		end if
		lien_radios.lancer_lien( var_code_local )
	end if
	
else
	
	// Mediadent classique
	rep_radio = uo_mediadent.get_rep_radio( )
	
	if rep_radio <> "" then
		
		if isvalid(win_parent) then
			// désactivé en 2022 car mic mac sur le clic droit de l'imagerie
			//win_parent.cb_enregister.TriggerEvent ( Clicked! )
			string r
			r = win_parent.title
			var_code_local = win_parent.var_code_local
		else
			// var_code_local mis à jour par l'appelant
		end if
		
		if uo_mediadent.connection_mediadent() = 1 then
			// info patient
			uo_mediadent.set_info_patient_to_mediadent( var_code_local , rep_radio )
			
	//		// on ferme connection MEDIADENT
	//		uo_mediadent.deconnection_mediadent()
		end if
	else
		messagebox("ATTENTION ...", "Impossible de poursuivre ! ~n~nConfiguration du lien non effectuée, ~nou répertoire photo d'Orthokis mal indiqué, ~nou problème de réseau.", Exclamation! )
	end if
end if
end event

