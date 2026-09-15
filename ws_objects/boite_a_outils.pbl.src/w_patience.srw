$PBExportHeader$w_patience.srw
forward
global type w_patience from window
end type
type st_avancement from statictext within w_patience
end type
type st_veuillez from statictext within w_patience
end type
type hpb_patience from hprogressbar within w_patience
end type
end forward

global type w_patience from window
integer x = 681
integer y = 808
integer width = 1431
integer height = 788
boolean enabled = false
boolean titlebar = true
string title = "Traitement en cours ..."
boolean controlmenu = true
boolean minbox = true
windowtype windowtype = popup!
long backcolor = 16777215
string pointer = "HourGlass!"
boolean center = true
st_avancement st_avancement
st_veuillez st_veuillez
hpb_patience hpb_patience
end type
global w_patience w_patience

forward prototypes
public function boolean setrange (integer pos_start, integer pos_end)
public subroutine avancement (string libelle)
public subroutine wf_setvalue (integer pour)
end prototypes

public function boolean setrange (integer pos_start, integer pos_end);// initialise les min et max position de la progress bar
// param pos_start : min position (par defaut 0)
// param pos_end : max position (par defaut 100)
// renvoie true si pas de pb

boolean val_retour = false

if isnull(pos_start) OR isnull(pos_end) then return val_retour
if pos_end < pos_start then return val_retour

if hpb_patience.setrange(pos_start, pos_end) = 1 then val_retour = true
return val_retour
end function

public subroutine avancement (string libelle);
	// Mise à jour du libellé d'avancement
	w_patience.st_avancement.visible = true
	w_patience.st_avancement.text = libelle
	yield()

end subroutine

public subroutine wf_setvalue (integer pour);if not hpb_patience.visible then
	hpb_patience.visible = true
	//p_sablier.visible = false
	//this.height = 340
end if

yield()
hpb_patience.OffsetPos ( pour )



end subroutine

event open;// centrage de la fenêtre 
//centrer(this)

string fichier_gif, fichier_jpg


end event

on w_patience.create
this.st_avancement=create st_avancement
this.st_veuillez=create st_veuillez
this.hpb_patience=create hpb_patience
this.Control[]={this.st_avancement,&
this.st_veuillez,&
this.hpb_patience}
end on

on w_patience.destroy
destroy(this.st_avancement)
destroy(this.st_veuillez)
destroy(this.hpb_patience)
end on

event close;// On s'en sert aussi sans w_mdi
//w_mdi.setmicrohelp("Prêt")

end event

event timer;
//
//if st_veuillez.text = "" then
//	st_veuillez.text ="Veuillez patienter ..."
//else
//	st_veuillez.text =""
//end if


yield()


//this.triggerevent(resize!)

end event

type st_avancement from statictext within w_patience
integer x = 59
integer y = 240
integer width = 1271
integer height = 76
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = script!
string facename = "Comic Sans MS"
long textcolor = 255
long backcolor = 67108864
alignment alignment = center!
boolean focusrectangle = false
end type

type st_veuillez from statictext within w_patience
integer x = 283
integer y = 488
integer width = 763
integer height = 76
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = script!
string facename = "Comic Sans MS"
long textcolor = 255
long backcolor = 67108864
string text = "Veuillez patienter ..."
alignment alignment = center!
boolean focusrectangle = false
end type

type hpb_patience from hprogressbar within w_patience
boolean visible = false
integer x = 46
integer y = 588
integer width = 1221
integer height = 64
unsignedinteger maxposition = 100
integer setstep = 10
boolean smoothscroll = true
end type

