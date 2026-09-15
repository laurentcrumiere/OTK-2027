$PBExportHeader$uo_patient_ins.sru
forward
global type uo_patient_ins from picturebutton
end type
end forward

global type uo_patient_ins from picturebutton
string tag = "no resize all"
integer width = 187
integer height = 120
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "lc_ins.png"
alignment htextalign = left!
string powertiptext = "Identification Nationale de Santé"
end type
global uo_patient_ins uo_patient_ins

type variables
double var_code_local
string v_ins_present
end variables

forward prototypes
public subroutine init (double v_code)
end prototypes

public subroutine init (double v_code);

var_code_local = v_code 

// si ins déjà fait, on met le boutons en vert


select isnull(ins_present, 'N') into :v_ins_present 
from patient 
where code = :var_code_local ;

if v_ins_present = "O" then
	this.PictureName = "lc_ins_vert.png"
end if
end subroutine

event clicked;// INS uniquement si CC Vitale

OpenWithParm(w_patient_ins, var_code_local)
end event

on uo_patient_ins.create
end on

on uo_patient_ins.destroy
end on

