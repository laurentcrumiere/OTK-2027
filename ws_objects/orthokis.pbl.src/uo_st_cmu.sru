$PBExportHeader$uo_st_cmu.sru
forward
global type uo_st_cmu from statictext
end type
end forward

global type uo_st_cmu from statictext
integer width = 197
integer height = 60
integer textsize = -16
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 553648127
boolean focusrectangle = false
end type
global uo_st_cmu uo_st_cmu

on uo_st_cmu.create
end on

on uo_st_cmu.destroy
end on

event rbuttondown;if len(trim(tag)) > 0 then
	Messagebox("Information", "Date de validité : "+ string(tag))
else
	if TextColor = 255 then
		Messagebox("Information", "Date de validité Non Renseignée")
	end if
end if

end event

