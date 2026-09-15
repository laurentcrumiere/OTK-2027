$PBExportHeader$uo_barre_titre.sru
forward
global type uo_barre_titre from userobject
end type
type st_barre from statictext within uo_barre_titre
end type
type p_barre from picture within uo_barre_titre
end type
end forward

global type uo_barre_titre from userobject
integer width = 1001
integer height = 96
long backcolor = 67108864
string text = "none"
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
st_barre st_barre
p_barre p_barre
end type
global uo_barre_titre uo_barre_titre

type variables


string texte_titre


end variables

forward prototypes
public subroutine retaille ()
end prototypes

public subroutine retaille ();
p_barre.width = this.width
st_barre.width = this.width

st_barre.x = 0
p_barre.x = 0

p_barre.height = this.height 
st_barre.height = this.height 

// on met la transparence après car sinon trace à l'écran
//st_barre.backcolor = couleur_transparente
//
end subroutine

on uo_barre_titre.create
this.st_barre=create st_barre
this.p_barre=create p_barre
this.Control[]={this.st_barre,&
this.p_barre}
end on

on uo_barre_titre.destroy
destroy(this.st_barre)
destroy(this.p_barre)
end on

event constructor;

st_barre.text = texte_titre
end event

type st_barre from statictext within uo_barre_titre
integer width = 997
integer height = 92
integer textsize = -12
integer weight = 700
fontcharset fontcharset = ansi!
string facename = "Tahoma"
long textcolor = 16777215
long backcolor = 12639424
boolean enabled = false
string text = "titre"
alignment alignment = center!
boolean focusrectangle = false
end type

type p_barre from picture within uo_barre_titre
integer width = 997
integer height = 92
boolean focusrectangle = false
end type

event constructor;

p_barre.PictureName = pb_barre
end event

