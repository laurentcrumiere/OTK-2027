$PBExportHeader$w_calc.srw
forward
global type w_calc from window
end type
type uo_1 from u_cst_powercalc within w_calc
end type
end forward

global type w_calc from window
integer width = 1458
integer height = 1184
boolean titlebar = true
string title = "Calculatrice"
boolean controlmenu = true
boolean minbox = true
boolean resizable = true
windowtype windowtype = popup!
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
uo_1 uo_1
end type
global w_calc w_calc

event resize;uo_1.Resize(newwidth,newheight)
end event

on w_calc.create
this.uo_1=create uo_1
this.Control[]={this.uo_1}
end on

on w_calc.destroy
destroy(this.uo_1)
end on

event open;uo_1.of_SetStyle(uo_1.RAISED)
end event

type uo_1 from u_cst_powercalc within w_calc
integer width = 1417
integer taborder = 30
end type

on uo_1.destroy
call u_cst_powercalc::destroy
end on

