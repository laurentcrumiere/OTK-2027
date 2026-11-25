$PBExportHeader$u_cst_xpheader.sru
forward
global type u_cst_xpheader from u_cst_canvas
end type
type st_pbus_xpheader from statictext within u_cst_xpheader
end type
type lv_imagelist from listview within u_cst_xpheader
end type
end forward

global type u_cst_xpheader from u_cst_canvas
integer width = 603
integer height = 104
string pointer = "Arrow!"
event paint pbm_paint
event clicked pbm_lbuttonup
event mousewithin pbm_mousemove
event mouseenter ( )
event mouseleave ( )
event resize pbm_size
st_pbus_xpheader st_pbus_xpheader
lv_imagelist lv_imagelist
end type
global u_cst_xpheader u_cst_xpheader

type prototypes

end prototypes

type variables
LongPtr il_dc, il_imagelist

Boolean ib_shadowtext
String is_image
Long il_imagepos

n_cst_xpheader_painter	in_gradient

CONSTANT Long ILD_TRANSPARENT = 1
CONSTANT Long LVM_GETIMAGELIST = 4098
CONSTANT Long LVSIL_NORMAL = 0
CONSTANT Long RIGHT = 1
CONSTANT Long LEFT = 2

CONSTANT Long BLUE = RGB(203,220,249)
CONSTANT Long SILVER = RGB(232,232,240)
CONSTANT Long OLIVE = RGB(234,234,207)
CONSTANT Long CLASSIC = RGB(242,243,246)
CONSTANT Long DEFAULT = 0
CONSTANT Long WINDOWS8_BLUE = 1
CONSTANT Long WINDOWS8_OLIVE = 2
CONSTANT Long WINDOWS8_SILVER = 3

String is_CurrentTheme = ""
n_cst_pbui_theme inv_color_theme

CONSTANT Long XP = 0
CONSTANT Long VISTAEMBOSSED = 1
CONSTANT Long VISTAORIGINAL = 2
CONSTANT Long VISTAGLASS = 3
CONSTANT Long CUSTOM = 4

Long il_CurrentStyle = XP
Long il_Gradient1 = RGB(255,255,255)
Long il_Gradient2 = RGB(255,255,255)
Long il_bordercolor

Long il_rightwidth
Long il_leftwidth
Long il_leftx
Long il_lefty = 10
Long il_rightcolor = 0
Long il_leftcolor = 0
Long il_leftfontsize = 13
Long il_rightfontsize = 9

String is_lefttext
String is_righttext
String is_leftfont = "Arial"
String is_rightfont = "Tahoma"

Boolean ib_Vista = FALSE
Boolean ib_lefttextbold = True
Boolean ib_righttextbold = False

end variables

forward prototypes
public function string of_getimage ()
public function integer of_settext (string as_text, long al_pos)
public function string of_gettext (long al_pos)
public function long of_getcolor (string as_color)
public function integer of_settheme (long al_theme)
public function integer of_setcolor (long al_gradient1, long al_gradient2)
public function integer of_settextcolor (long al_color, long al_pos)
public function integer of_setimage (string as_image, integer ai_pos)
public function integer of_settheme (string as_color)
public function integer of_setstyle (integer ai_style)
public function integer of_setshadowtext (boolean ab_switch)
public subroutine of_settextfont (string as_fontname, long al_fontsize, long al_pos)
public subroutine of_settextbold (boolean ab_bold, long al_pos)
public function string of_classname ()
public function integer of_drawimage (longptr ahdc)
end prototypes

event resize;IF Len(Trim(is_image)) > 0 THEN
	CHOOSE CASE il_imagepos
		CASE RIGHT
			il_rightwidth = Width - 25 - 110
			il_leftx = 24
		CASE LEFT
			il_leftx = 110
			il_rightwidth = Width - 18 - 25
	END CHOOSE
	
ELSE
	il_rightwidth = Width - 18 - 25
END IF

il_leftwidth = Width - il_leftx - 10

//TriggerEvent('paint')
SetRedraw(TRUE)
end event

public function string of_getimage ();RETURN is_image//p_1.PictureName
end function

public function integer of_settext (string as_text, long al_pos);CHOOSE CASE al_pos
	CASE RIGHT
		is_righttext = as_text
	CASE LEFT
		is_lefttext = as_text
END CHOOSE

//TriggerEvent('paint')
SetRedraw(TRUE)

RETURN 1
end function

public function string of_gettext (long al_pos);CHOOSE CASE al_pos
	CASE RIGHT
		RETURN is_righttext
	CASE LEFT
		RETURN is_lefttext
	CASE ELSE
		RETURN ''
END CHOOSE
end function

public function long of_getcolor (string as_color);IF NOT IsValid(inv_color_theme) THEN
	RETURN 0
END IF

RETURN inv_color_theme.of_GetColor(inv_color_theme.XPHeader, as_color)
end function

public function integer of_settheme (long al_theme);CHOOSE CASE al_theme
	CASE BLUE
		RETURN of_SetTheme('BLUE')
	CASE SILVER
		RETURN of_SetTheme('SILVER')
	CASE OLIVE
		RETURN of_SetTheme('OLIVE')
	CASE CLASSIC
		RETURN of_SetTheme('CLASSIC')
	CASE WINDOWS8_BLUE
		RETURN of_SetTheme('WINDOWS8_BLUE')
	CASE WINDOWS8_OLIVE
		RETURN of_SetTheme('WINDOWS8_OLIVE')
	CASE WINDOWS8_SILVER
		RETURN of_SetTheme('WINDOWS8_SILVER')
	CASE ELSE
		RETURN of_SetTheme('CLASSIC')
END CHOOSE

RETURN 0
end function

public function integer of_setcolor (long al_gradient1, long al_gradient2);il_Gradient1 = al_gradient1
il_Gradient2 = al_gradient2
is_CurrentTheme = ""

SetRedraw(TRUE)

RETURN 1
end function

public function integer of_settextcolor (long al_color, long al_pos);CHOOSE CASE al_pos
	CASE RIGHT
		il_rightcolor = al_color
	CASE LEFT
		il_leftcolor = al_color
END CHOOSE

//TriggerEvent('paint')
SetRedraw(TRUE)

RETURN 1
end function

public function integer of_setimage (string as_image, integer ai_pos);is_image = as_image
il_imagepos = ai_pos

lv_imagelist.DeleteLargePictures ( )
lv_imagelist.AddLargePicture ( is_image )

il_imagelist = Send(Handle(lv_imagelist), LVM_GETIMAGELIST, LVSIL_NORMAL, 0)

TriggerEvent('resize')

RETURN 1
end function

public function integer of_settheme (string as_color);
IF IsValid(inv_color_theme) THEN DESTROY inv_color_theme
inv_color_theme = CREATE USING "n_cst_pbui_theme_" + as_color
is_CurrentTheme = as_color

IF Left(Lower(as_color), 8) = "windows8" THEN
	il_bordercolor = of_GetColor("border")
END IF

SetRedraw(TRUE)
RETURN 1
end function

public function integer of_setstyle (integer ai_style);il_CurrentStyle = ai_style

SetRedraw(TRUE)
RETURN 1
end function

public function integer of_setshadowtext (boolean ab_switch);ib_shadowtext = ab_switch
//TriggerEvent('paint')
SetRedraw(TRUE)
RETURN 1
end function

public subroutine of_settextfont (string as_fontname, long al_fontsize, long al_pos);// set font name and size

CHOOSE CASE al_pos
	CASE RIGHT
		is_rightfont     = as_fontname
		il_rightfontsize = al_fontsize
	CASE LEFT
		is_leftfont      = as_fontname
		il_leftfontsize  = al_fontsize
END CHOOSE

end subroutine

public subroutine of_settextbold (boolean ab_bold, long al_pos);// set font bold property

CHOOSE CASE al_pos
	CASE RIGHT
		ib_righttextbold = ab_bold
	CASE LEFT
		ib_lefttextbold = ab_bold
END CHOOSE

end subroutine

public function string of_classname ();RETURN "u_cst_xpheader"
end function

public function integer of_drawimage (longptr ahdc);CHOOSE CASE il_imagepos
	CASE RIGHT
		inv_win32.ImageList_Draw(il_imagelist, 0, ahdc, UnitsToPixels(width - 90, XUnitsToPixels!), UnitsToPixels(16, YUnitsToPixels!), ILD_TRANSPARENT )
	CASE LEFT
		inv_win32.ImageList_Draw(il_imagelist, 0, ahdc, UnitsToPixels(16, XUnitsToPixels!), UnitsToPixels(16, YUnitsToPixels!), ILD_TRANSPARENT )
END CHOOSE

RETURN 1
end function

on u_cst_xpheader.create
int iCurrent
call super::create
this.st_pbus_xpheader=create st_pbus_xpheader
this.lv_imagelist=create lv_imagelist
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.st_pbus_xpheader
this.Control[iCurrent+2]=this.lv_imagelist
end on

on u_cst_xpheader.destroy
call super::destroy
destroy(this.st_pbus_xpheader)
destroy(this.lv_imagelist)
end on

event constructor;call super::constructor;IF Len(Trim(is_CurrentTheme)) = 0 THEN
	n_cst_ui_imagelist lnv_theme
	of_SetTheme(lnv_theme.of_GetGlobalTheme())
ELSE
	of_SetTheme(is_CurrentTheme)
END IF

POST EVENT Resize(0, Width, Height)
end event

event onpaint;call super::onpaint;Long ll_color1, ll_color2

IF is_CurrentTheme = "" THEN
	ll_color1 = il_Gradient1
	ll_color2 = il_Gradient2
ELSE
	ll_color1 = of_GetColor("HEADER1")
	ll_color2 = of_GetColor("HEADER2")
END IF

in_Gradient.of_SetHDC(hdc)

in_Gradient.of_VerticalGradient(ll_color1, &
					ll_color2, THIS, TRUE, &
					il_bordercolor, il_CurrentStyle)

in_Gradient.of_DrawText(THIS, is_lefttext, il_leftcolor, &
					is_leftfont, il_leftfontsize, &
					ib_lefttextbold, in_Gradient.ALIGN_LEFT, &
					il_leftx, il_lefty, il_leftwidth, Height, ib_shadowtext)

in_Gradient.of_DrawText(THIS, is_righttext, il_rightcolor, &
					is_rightfont, il_rightfontsize, &
					ib_righttextbold, in_Gradient.ALIGN_RIGHT, &
					18, 20, il_rightwidth, Height, ib_shadowtext) 

of_DrawImage(hdc)

of_DrawEval(hdc)

RETURN 1
end event

event destructor;call super::destructor;IF IsValid(inv_color_theme) THEN DESTROY inv_color_theme
end event

type st_pbus_xpheader from statictext within u_cst_xpheader
integer width = 10002
integer height = 10000
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 16777215
long backcolor = 8421376
string text = "  Gradient Header"
boolean focusrectangle = false
end type

event constructor;Hide()
end event

type lv_imagelist from listview within u_cst_xpheader
boolean visible = false
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
long largepicturemaskcolor = 12632256
long smallpicturemaskcolor = 12632256
long statepicturemaskcolor = 536870912
end type

