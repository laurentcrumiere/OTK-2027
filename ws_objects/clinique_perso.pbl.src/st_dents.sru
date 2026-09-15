$PBExportHeader$st_dents.sru
forward
global type st_dents from statictext
end type
end forward

global type st_dents from statictext
integer width = 87
integer height = 72
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 16777215
alignment alignment = center!
boolean border = true
boolean focusrectangle = false
end type
global st_dents st_dents

type variables
int	i
long	c1,c2,c3,c4
long	var_code_local
end variables

forward prototypes
public subroutine couleur (integer i_couleur)
end prototypes

public subroutine couleur (integer i_couleur);choose case i_couleur
	case 1
		backcolor = c1
	case 2
		backcolor = c2
	case 3
		backcolor = c3
	case 4
		backcolor = c4
	case else
		backcolor = c1
end choose

end subroutine

on st_dents.create
end on

on st_dents.destroy
end on

event clicked;i++
if i = 5 then i = 1
couleur(i)

end event

event constructor;string	page

//récupère le num patient
var_code_local = message.doubleparm

//prend les données ds var local PAGE
SELECT perso INTO :page FROM diagnos WHERE code = :var_code_local ;
i = integer(mid(page,long(this.tag),1))
if i<1 or i>4 then i = 1	//si donnée pas bonne (rien ou autre carac) --> par défaut = "1"
end event

event destructor;string	page

SELECT perso INTO :page FROM diagnos WHERE code = :var_code_local ;
place(string(i),page,integer(this.tag))
UPDATE diagnos SET perso = :page WHERE code = :var_code_local ;
COMMIT ;

end event

