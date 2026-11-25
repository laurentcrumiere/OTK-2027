$PBExportHeader$w_fond.srw
forward
global type w_fond from window
end type
type p_fond from picture within w_fond
end type
end forward

global type w_fond from window
integer width = 2615
integer height = 1744
boolean border = false
windowtype windowtype = popup!
windowstate windowstate = maximized!
long backcolor = 15780518
p_fond p_fond
end type
global w_fond w_fond

on w_fond.create
this.p_fond=create p_fond
this.Control[]={this.p_fond}
end on

on w_fond.destroy
destroy(this.p_fond)
end on

event open;p_fond.picturename = image_fond
p_fond.x = 0
p_fond.y = 0
p_fond.bringtotop = false
p_fond.visible = true
	

end event

event resize;if p_fond.visible then
	p_fond.bringtotop = false
	p_fond.width = this.width
	p_fond.height = this.height
end if

end event

type p_fond from picture within w_fond
integer x = 274
integer y = 324
integer width = 229
integer height = 200
boolean originalsize = true
boolean focusrectangle = false
end type

