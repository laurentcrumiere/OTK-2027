$PBExportHeader$st_transparent.sru
forward
global type st_transparent from statictext
end type
end forward

global type st_transparent from statictext
integer width = 197
integer height = 60
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "@Arial Unicode MS"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
boolean focusrectangle = false
event paint pbm_paint
event mousewithin pbm_mousemove
event mouseenter ( )
event mouseleave ( )
end type
global st_transparent st_transparent

type prototypes

end prototypes

type variables
Boolean	ib_painting, &
			ib_mousecaptured

end variables

forward prototypes
public function integer of_capturemouse ()
public function boolean of_ismousecaptured ()
public function integer of_releasemouse ()
end prototypes

event paint;

IF NOT IsValid (This) THEN Return 0
IF ib_painting THEN Return 0

ib_painting		= TRUE
This.Visible	= FALSE

long cpt 
cpt = 0
DO WHILE cpt < nombre_boucles_st_transparent and Yield ()
	cpt ++
LOOP

IF IsValid (This) THEN 
	// pour éviter certains plantages ....
	This.Visible	= TRUE
	ib_painting		= FALSE
end if

Return 0
end event

event mousewithin;//
//
//if NOT of_ismousecaptured() then 
//	
//	of_capturemouse()
//	
//	this.event mouseenter()
//		
//else
//	
//	if xpos < 0 or ypos < 0 or xpos > width or ypos > height then
//	
//		of_releasemouse()
//		
//		this.event post mouseleave()
//		
//	end if
//
//end if
end event

public function integer of_capturemouse ();
if of_ismousecaptured() then Return -1

SetCapture(handle(this))

ib_mousecaptured = TRUE

return 1
end function

public function boolean of_ismousecaptured ();
return ib_mousecaptured
end function

public function integer of_releasemouse ();
if NOT of_ismousecaptured() then return -1

ReleaseCapture()

ib_mousecaptured = FALSE

Return 1
end function

event constructor;This.BackColor = 2^29


//THIS.POST EVENT MouseLeave ()
end event

on st_transparent.create
end on

on st_transparent.destroy
end on

