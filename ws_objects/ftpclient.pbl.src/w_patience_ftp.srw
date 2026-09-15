$PBExportHeader$w_patience_ftp.srw
forward
global type w_patience_ftp from window
end type
type uo_loading_circle from u_cst_loadingcircle within w_patience_ftp
end type
type st_avancement from statictext within w_patience_ftp
end type
type uo_circle from u_cst_circleprogress within w_patience_ftp
end type
type st_veuillez from statictext within w_patience_ftp
end type
end forward

global type w_patience_ftp from window
integer x = 681
integer y = 808
integer width = 1559
integer height = 240
boolean enabled = false
windowtype windowtype = popup!
long backcolor = 16777215
string pointer = "HourGlass!"
boolean clientedge = true
boolean center = true
uo_loading_circle uo_loading_circle
st_avancement st_avancement
uo_circle uo_circle
st_veuillez st_veuillez
end type
global w_patience_ftp w_patience_ftp

type variables
integer pourcentage_courant = 0
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
	uo_circle.visible = false
	st_avancement.visible = true
	st_avancement.text = libelle
	yield()

end subroutine

public subroutine wf_setvalue (integer pour);if not uo_circle.visible then
	uo_circle.visible = true
	this.height = 524
	//p_sablier.visible = false
	//this.height = 340
end if

yield()
uo_circle.of_setprogress  ( pour )
pourcentage_courant = pour



end subroutine

public subroutine wf_addvalue (integer pour);pourcentage_courant = pourcentage_courant + pour
if not uo_circle.visible then
	uo_circle.visible = true
	this.height = 524
	//p_sablier.visible = false
	//this.height = 340
end if

yield()

uo_circle.of_setprogress (pourcentage_courant)



end subroutine

event open;	// centrage de la fenêtre 
	//centrer(this)
	
	
	uo_loading_circle.of_SetStyle(uo_loading_circle.Custom)
	uo_loading_circle.visible = true
	uo_loading_circle.of_start()

end event

on w_patience_ftp.create
this.uo_loading_circle=create uo_loading_circle
this.st_avancement=create st_avancement
this.uo_circle=create uo_circle
this.st_veuillez=create st_veuillez
this.Control[]={this.uo_loading_circle,&
this.st_avancement,&
this.uo_circle,&
this.st_veuillez}
end on

on w_patience_ftp.destroy
destroy(this.uo_loading_circle)
destroy(this.st_avancement)
destroy(this.uo_circle)
destroy(this.st_veuillez)
end on

event timer;

yield()


end event

event close;	uo_loading_circle.of_stop()

end event

type uo_loading_circle from u_cst_loadingcircle within w_patience_ftp
integer x = 18
integer y = 20
integer width = 219
integer height = 172
integer taborder = 10
long backcolor = 16777215
end type

on uo_loading_circle.destroy
call u_cst_loadingcircle::destroy
end on

type st_avancement from statictext within w_patience_ftp
boolean visible = false
integer x = 265
integer y = 284
integer width = 1221
integer height = 76
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = script!
string facename = "Comic Sans MS"
long textcolor = 255
alignment alignment = center!
boolean focusrectangle = false
end type

type uo_circle from u_cst_circleprogress within w_patience_ftp
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

type st_veuillez from statictext within w_patience_ftp
integer x = 293
integer y = 40
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

