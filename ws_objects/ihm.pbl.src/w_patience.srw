$PBExportHeader$w_patience.srw
forward
global type w_patience from window
end type
type st_avancement from statictext within w_patience
end type
type uo_circle from u_cst_circleprogress within w_patience
end type
type uo_loading_circle from u_cst_loadingcircle within w_patience
end type
type st_veuillez from statictext within w_patience
end type
end forward

global type w_patience from window
integer x = 681
integer y = 808
integer width = 1559
integer height = 192
boolean enabled = false
windowtype windowtype = popup!
long backcolor = 16777215
string pointer = "HourGlass!"
boolean clientedge = true
boolean center = true
st_avancement st_avancement
uo_circle uo_circle
uo_loading_circle uo_loading_circle
st_veuillez st_veuillez
end type
global w_patience w_patience

type variables
integer pourcentage_courant = 0
boolean avec_animation = true
end variables

forward prototypes
public function boolean setrange (integer pos_start, integer pos_end)
public subroutine avancement (string libelle)
public subroutine wf_setvalue (integer pour)
public subroutine wf_addvalue (integer pour)
end prototypes

public function boolean setrange (integer pos_start, integer pos_end);// initialise les min et max position de la progress bar
// param pos_start : min position (par defaut 0)
// param pos_end : max position (par defaut 100)
// renvoie true si pas de pb

boolean val_retour = false

if isnull(pos_start) OR isnull(pos_end) then return val_retour
if pos_end < pos_start then return val_retour

//if hpb_patience.setrange(pos_start, pos_end) = 1 then val_retour = true

return val_retour
end function

public subroutine avancement (string libelle);
// Mise à jour du libellé d'avancement
//if avec_animation then
//	if isvalid(uo_circle) then
//		uo_circle.visible = false
//	end if
//end if
this.height = 320
st_avancement.visible = true
st_avancement.text = libelle
yield()

end subroutine

public subroutine wf_setvalue (integer pour);if avec_animation then

	if not uo_circle.visible then
		uo_circle.visible = true
		this.height = 524
	end if
	
	yield()
	if isvalid(uo_circle) then
		// pour éviter des erreurs 2 à la con
		uo_circle.of_setprogress  ( pour )
	end if
	
end if


pourcentage_courant = pour
	
yield()


end subroutine

public subroutine wf_addvalue (integer pour);pourcentage_courant = pourcentage_courant + pour

if avec_animation then

	if not uo_circle.visible then
		uo_circle.visible = true
		this.height = 524
	end if
	
	yield()
	
	if isvalid(uo_circle) then
		uo_circle.of_setprogress (pourcentage_courant)
	end if

end if
	
yield()



end subroutine

event open;// centrage de la fenêtre 
//centrer(this)

//trace ("=== w_patience - Début Open === ")

string fichier_gif, fichier_jpg

st_veuillez.FaceName = "Tahoma"

uo_loading_circle.of_SetStyle(uo_loading_circle.Custom)


//if profilestring(dir_ini+inifile_orthokis,"UI_V2020","desactiver_animation_patience","N")  = "O" then
// Depuis 2023 on supprime l'animation d'office
	avec_animation = false
//end if

//if avec_animation then
//	uo_loading_circle.of_SetStyle(uo_loading_circle.Custom)
//	if couleur_fond_fenetre <> couleur_blanche then
//		uo_loading_circle.of_setcolor (couleur_fond_fenetre)
//	end if
//	uo_loading_circle.visible = true
//	uo_loading_circle.of_start()
//end if
yield()
//trace ("=== w_patience - Fin Open === ")


end event

on w_patience.create
this.st_avancement=create st_avancement
this.uo_circle=create uo_circle
this.uo_loading_circle=create uo_loading_circle
this.st_veuillez=create st_veuillez
this.Control[]={this.st_avancement,&
this.uo_circle,&
this.uo_loading_circle,&
this.st_veuillez}
end on

on w_patience.destroy
destroy(this.st_avancement)
destroy(this.uo_circle)
destroy(this.uo_loading_circle)
destroy(this.st_veuillez)
end on

event close;

//trace ("=== w_patience - Début Close === ")


//if ui_v2020 and avec_animation then
//	uo_loading_circle.of_stop()
//	yield()
//end if
	


//trace ("=== w_patience - Fin Close === ")

end event

event timer;
//
//if st_veuillez.text = "" then
//	st_veuillez.text ="Veuillez patienter ..."
//else
//	st_veuillez.text =""
//end if

if trace then trace ("w_patience - Timer - Avant Yield()")

yield()

if trace then trace ("w_patience - Timer - Après Yield()")

//this.triggerevent(resize!)

end event

type st_avancement from statictext within w_patience
boolean visible = false
integer x = 256
integer y = 184
integer width = 1221
integer height = 76
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 255
alignment alignment = center!
boolean focusrectangle = false
end type

type uo_circle from u_cst_circleprogress within w_patience
boolean visible = false
integer x = 649
integer y = 156
integer width = 421
integer height = 344
integer taborder = 20
long backcolor = 16777215
integer fontsize = 16
integer circlethickness = 4
end type

on uo_circle.destroy
call u_cst_circleprogress::destroy
end on

type uo_loading_circle from u_cst_loadingcircle within w_patience
integer x = 18
integer width = 219
integer height = 172
integer taborder = 10
long backcolor = 16777215
end type

on uo_loading_circle.destroy
call u_cst_loadingcircle::destroy
end on

type st_veuillez from statictext within w_patience
integer x = 293
integer y = 28
integer width = 1170
integer height = 112
integer textsize = -14
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean enabled = false
string text = "Veuillez patienter ..."
alignment alignment = center!
boolean focusrectangle = false
end type

