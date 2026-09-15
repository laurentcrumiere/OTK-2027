$PBExportHeader$uo_message_borne.sru
forward
global type uo_message_borne from userobject
end type
type pb_message_borne from picturebutton within uo_message_borne
end type
end forward

global type uo_message_borne from userobject
integer width = 142
integer height = 124
long backcolor = 67108864
string text = "none"
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
pb_message_borne pb_message_borne
end type
global uo_message_borne uo_message_borne

type variables
double var_code_local
end variables

forward prototypes
public subroutine maj_icone ()
public subroutine init (double v_code)
end prototypes

public subroutine maj_icone ();string v_message
select isnull(message_borne, '') into :v_message  from patient where code = :var_code_local ;
// Pour le bouton  de message de la borne
if len(trim(v_message)) = 0 then 
	// pas de message on change l'image du bouton
	pb_message_borne.PictureName = "borne_disabled.png"
else
	pb_message_borne.PictureName = "borne.png"
end if

end subroutine

public subroutine init (double v_code);var_code_local = v_code

maj_icone()

end subroutine

on uo_message_borne.create
this.pb_message_borne=create pb_message_borne
this.Control[]={this.pb_message_borne}
end on

on uo_message_borne.destroy
destroy(this.pb_message_borne)
end on

event constructor;
// Uniquement si on a la Borne
this.visible = BORNE

end event

type pb_message_borne from picturebutton within uo_message_borne
integer width = 142
integer height = 124
integer taborder = 10
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "borne.png"
string disabledname = "borne_disabled.png"
alignment htextalign = left!
string powertiptext = "Saisie d~'un message spécifique pour le patient sur la Borne Salle d~'Attente"
end type

event clicked;String v_message
// Message Spécifique pour la borne
OpenWithParm(w_patient_message_borne, var_code_local)
select isnull(message_borne, '') into :v_message  from patient where code = :var_code_local ;
// Pour le bouton  de message de la borne
if len(trim(v_message)) = 0 then 
	// pas de message on change l'image du bouton
	this.PictureName = "borne_disabled.png"
else
	this.PictureName = "borne.png"
end if

end event

