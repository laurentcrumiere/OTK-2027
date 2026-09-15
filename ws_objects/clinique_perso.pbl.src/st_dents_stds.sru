$PBExportHeader$st_dents_stds.sru
forward
global type st_dents_stds from statictext
end type
end forward

global type st_dents_stds from statictext
integer width = 110
integer height = 96
integer textsize = -12
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
global st_dents_stds st_dents_stds

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

on st_dents_stds.create
end on

on st_dents_stds.destroy
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

//on initialise les 4 var avec bonne couleur
c1 = rgb(255,255,255)	//blanc
c2 = rgb(255,255,0)		//jaune
c3 = rgb(255,0,0)			//rouge
c4 = rgb(0,128,128)		//cyan foncé

//on charge la couleur de fond du user object
couleur(i)

end event

event destructor;string	page

SELECT perso INTO :page FROM diagnos WHERE code = :var_code_local ;
place(string(i),page,integer(this.tag))
UPDATE diagnos SET perso = :page WHERE code = :var_code_local ;
COMMIT ;

end event

