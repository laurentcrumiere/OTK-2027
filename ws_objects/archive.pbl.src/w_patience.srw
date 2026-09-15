$PBExportHeader$w_patience.srw
forward
global type w_patience from window
end type
type sle_status from singlelineedit within w_patience
end type
type hpb_patience from hprogressbar within w_patience
end type
type st_veuillez from statictext within w_patience
end type
end forward

global type w_patience from window
integer x = 681
integer y = 808
integer width = 1344
integer height = 436
boolean enabled = false
boolean titlebar = true
string title = "Traitement en cours ..."
boolean minbox = true
windowtype windowtype = popup!
long backcolor = 16776960
string pointer = "HourGlass!"
sle_status sle_status
hpb_patience hpb_patience
st_veuillez st_veuillez
end type
global w_patience w_patience

forward prototypes
public subroutine wf_setvalue (integer pour)
public subroutine maj_status (string libelle)
end prototypes

public subroutine wf_setvalue (integer pour);if not hpb_patience.visible then
	hpb_patience.visible = true
end if

hpb_patience.OffsetPos ( pour )

end subroutine

public subroutine maj_status (string libelle);

sle_status.text = libelle
yield()


return
end subroutine

event open;// centrage de la fenêtre 
centrer(this)



end event

on w_patience.create
this.sle_status=create sle_status
this.hpb_patience=create hpb_patience
this.st_veuillez=create st_veuillez
this.Control[]={this.sle_status,&
this.hpb_patience,&
this.st_veuillez}
end on

on w_patience.destroy
destroy(this.sle_status)
destroy(this.hpb_patience)
destroy(this.st_veuillez)
end on

type sle_status from singlelineedit within w_patience
integer x = 119
integer y = 28
integer width = 1065
integer height = 92
integer taborder = 10
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 255
long backcolor = 16776960
boolean border = false
end type

type hpb_patience from hprogressbar within w_patience
boolean visible = false
integer x = 46
integer y = 148
integer width = 1221
integer height = 64
unsignedinteger maxposition = 100
integer setstep = 10
boolean smoothscroll = true
end type

type st_veuillez from statictext within w_patience
integer x = 338
integer y = 244
integer width = 603
integer height = 76
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 16776960
boolean enabled = false
string text = "Veuillez patienter ..."
alignment alignment = center!
boolean focusrectangle = false
end type

