$PBExportHeader$u_cst_powerdockpanelheader.sru
forward
global type u_cst_powerdockpanelheader from u_cst_canvas
end type
type st_1 from statictext within u_cst_powerdockpanelheader
end type
type rect from structure within u_cst_powerdockpanelheader
end type
end forward

type rect from structure
	long		left
	long		top
	long		right
	long		bottom
end type

global type u_cst_powerdockpanelheader from u_cst_canvas
integer width = 603
integer height = 104
string pointer = "Arrow!"
event paint pbm_paint
event clicked pbm_lbuttonup
event mousewithin pbm_mousemove
event mouseenter ( )
event resize pbm_size
event lbuttondown pbm_lbuttondown
event lbuttonup pbm_lbuttonup
st_1 st_1
end type
global u_cst_powerdockpanelheader u_cst_powerdockpanelheader

type prototypes

end prototypes

type variables
n_cst_ui_imagelist inv_imagelist

LongPtr il_dc, il_imagelist
Long il_image

Boolean ib_rtl
Boolean ib_shadowtext
String is_image
string is_font = "Segoe UI"
Long il_fontsize = 9
Long il_imagepos

n_cst_powerpanelheader_painter	in_gradient

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

String is_CurrentTheme = "BLUE"
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
Long il_rightcolor = 0
Long il_leftcolor = 0

String is_lefttext
String is_righttext

Long il_x, il_y
Boolean ib_overpin
Boolean ib_overx

Boolean ib_selected
Boolean ib_mouseleave
Boolean ib_mousedown
Boolean ib_mouseover

Boolean ib_Vista = FALSE

u_cst_powerdockpanel iuo_parent


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
public function boolean of_isoverpin (long al_x, long al_y)
public function boolean of_isoverx (long al_x, long al_y)
public function integer of_setfontname (string as_font)
public function integer of_setfontsize (long al_fontsize)
public function integer of_righttoleft (boolean ab_switch)
public function integer of_drawimage (longptr ahdc)
public function integer of_drawpin (longptr hdc)
public function integer of_drawx (longptr hdc)
end prototypes

event mousewithin;il_x = xpos
il_y = ypos

if NOT of_ismousecaptured() then 
	
	of_capturemouse()
	
	this.event mouseenter()
else
	
	IF of_IsOverPin(il_x, il_y) THEN
		IF NOT ib_overpin THEN
			ib_overpin = TRUE
			SetRedraw(TRUE)
		END IF
	ELSE
		IF ib_overpin THEN
			ib_overpin = FALSE
			SetRedraw(TRUE)
		END IF
	END IF
	
	IF of_IsOverX(il_x, il_y) THEN
		IF NOT ib_overX THEN
			ib_overX = TRUE
			SetRedraw(TRUE)
		END IF
	ELSE
		IF ib_overX THEN
			ib_overX = FALSE
			SetRedraw(TRUE)
		END IF
	END IF
	
end if

end event

event resize;IF Len(Trim(is_image)) > 0 THEN
	CHOOSE CASE il_imagepos
		CASE RIGHT
			il_rightwidth = Width - 25 - 110
			il_leftx = 24
		CASE LEFT
			il_leftx = 80
			il_rightwidth = Width - 18 - 25
	END CHOOSE
	
ELSE
	il_rightwidth = Width - 18 - 25
END IF

il_leftwidth = Width - il_leftx - 10

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

public function long of_getcolor (string as_color);IF IsValid(iuo_parent) THEN
	IF IsValid(iuo_parent.iuo_parent) THEN
		IF iuo_parent.iuo_parent.il_CurrentStyle = iuo_parent.iuo_parent.VS2013 THEN
			CHOOSE CASE as_color
				CASE "HEADER1", "HEADER2"
					RETURN RGB(77, 96, 130)
				CASE "BORDER"
					RETURN RGB(142, 155, 188)
			END CHOOSE
		END IF
	END IF
END IF

RETURN inv_color_theme.of_GetColor(inv_color_theme.PowerDockPanel, as_color)
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

SetRedraw(TRUE)

RETURN 1
end function

public function integer of_setimage (string as_image, integer ai_pos);is_image = as_image
il_imagepos = ai_pos

IF Len(Trim(is_image)) > 0 THEN

	il_image = inv_imagelist.of_AddImage(as_image)
	il_imagelist = inv_imagelist.of_GetSmallHandle()

END IF

TriggerEvent('resize')

RETURN 1
end function

public function integer of_settheme (string as_color);IF IsValid(inv_color_theme) THEN DESTROY inv_color_theme
inv_color_theme = CREATE USING "n_cst_pbui_theme_" + as_color
is_CurrentTheme = as_color

of_SetTextColor(inv_color_theme.of_GetColor(inv_color_theme.PowerDockPanel, "HEADERTEXT"), LEFT)

SetRedraw(TRUE)
RETURN 1
end function

public function integer of_setstyle (integer ai_style);il_CurrentStyle = ai_style

SetRedraw(TRUE)
RETURN 1
end function

public function integer of_setshadowtext (boolean ab_switch);ib_shadowtext = ab_switch

SetRedraw(TRUE)
RETURN 1
end function

public function boolean of_isoverpin (long al_x, long al_y);Long ll_pos

ll_pos = ScaleDPI(35)

IF IsValid(iuo_parent) THEN
	IF IsValid(iuo_parent.iuo_parent) THEN
		IF NOT iuo_parent.iuo_parent.ib_allowpanelstoclose THEN
			ll_pos = ScaleDPI(15)
		END IF
	END IF
END IF

IF ib_rtl THEN
	IF UnitsToPixels(al_x, XUnitsToPixels!) >= ScaleDPI(20) AND & 
		UnitsToPixels(al_x, XUnitsToPixels!) <= ScaleDPI(33)  AND &
		UnitsToPixels(al_y, XUnitsToPixels!) <= UnitsToPixels(Height, XUnitsToPixels!) - ScaleDPI(2) AND & 
		UnitsToPixels(al_y, XUnitsToPixels!) > ScaleDPI(2)  AND &
		ib_mousecaptured THEN
		RETURN TRUE
	ELSE
		RETURN FALSE
	END IF
ELSE
	IF UnitsToPixels(al_x, XUnitsToPixels!) >= UnitsToPixels(Width, XUnitsToPixels!) - ll_pos AND & 
		UnitsToPixels(al_x, XUnitsToPixels!) <= UnitsToPixels(Width, XUnitsToPixels!) - (ll_pos - ScaleDPI(13))  AND &
		UnitsToPixels(al_y, XUnitsToPixels!) <= UnitsToPixels(Height, XUnitsToPixels!) - ScaleDPI(2) AND & 
		UnitsToPixels(al_y, XUnitsToPixels!) > ScaleDPI(2)  AND &
		ib_mousecaptured THEN
		RETURN TRUE
	ELSE
		RETURN FALSE
	END IF
END IF
end function

public function boolean of_isoverx (long al_x, long al_y);

IF IsValid(iuo_parent) THEN
	IF IsValid(iuo_parent.iuo_parent) THEN
		IF NOT iuo_parent.iuo_parent.ib_allowpanelstoclose THEN
			RETURN FALSE
		END IF
	END IF
END IF

IF ib_rtl THEN
	IF UnitsToPixels(al_x, XUnitsToPixels!) <= ScaleDPI(17) AND & 
		UnitsToPixels(al_x, XUnitsToPixels!) > ScaleDPI(4)  AND &
		UnitsToPixels(al_y, XUnitsToPixels!) <= UnitsToPixels(Height, XUnitsToPixels!) - ScaleDPI(2) AND & 
		UnitsToPixels(al_y, XUnitsToPixels!) > ScaleDPI(2)  AND &
		ib_mousecaptured THEN
		RETURN TRUE
	ELSE
		RETURN FALSE
	END IF	
ELSE	
	IF UnitsToPixels(al_x, XUnitsToPixels!) >= UnitsToPixels(Width, XUnitsToPixels!) - ScaleDPI(17) AND & 
		UnitsToPixels(al_x, XUnitsToPixels!) <= UnitsToPixels(Width, XUnitsToPixels!) - ScaleDPI(4)  AND &
		UnitsToPixels(al_y, XUnitsToPixels!) <= UnitsToPixels(Height, XUnitsToPixels!) - ScaleDPI(2) AND & 
		UnitsToPixels(al_y, XUnitsToPixels!) > ScaleDPI(2)  AND &
		ib_mousecaptured THEN
		RETURN TRUE
	ELSE
		RETURN FALSE
	END IF
END IF
end function

public function integer of_setfontname (string as_font);is_font = as_font
RETURN 1
end function

public function integer of_setfontsize (long al_fontsize);il_fontsize = al_fontsize

RETURN 1
end function

public function integer of_righttoleft (boolean ab_switch);ib_rtl = ab_switch

RETURN 1
end function

public function integer of_drawimage (longptr ahdc);CHOOSE CASE il_imagepos
	CASE RIGHT
		inv_win32.ImageList_Draw(il_imagelist, il_image - 1, ahdc, UnitsToPixels(width - 90, XUnitsToPixels!), UnitsToPixels(16, YUnitsToPixels!), ILD_TRANSPARENT )
	CASE LEFT
		inv_win32.ImageList_Draw(il_imagelist, il_image - 1, ahdc, UnitsToPixels(16, XUnitsToPixels!), (UnitsToPixels(Height, YUnitsToPixels!) - 16) / 2, ILD_TRANSPARENT )
END CHOOSE

RETURN 1
end function

public function integer of_drawpin (longptr hdc);Boolean lb_docked

IF NOT IsValid(iuo_parent) THEN
	lb_docked = FALSE
ELSE
	lb_docked = iuo_parent.#docked
END IF

LongPtr ll_brush, ll_oldbrush, ll_font, ll_oldfont
string ls_x
Rect rc
point lp
long llx, lly
LongPtr hRgn, hRPen
ULong ll_color

rc.Left = UnitsToPixels(Width, XUnitsToPixels!) - ScaleDPI(35)
rc.Bottom = UnitsToPixels(Height, YUnitsToPixels!)
rc.Top =  ((rc.Bottom - ScaleDPI(7)) / 2)

IF ib_rtl THEN
	rc.Left = ScaleDPI(20)
END IF

IF IsValid(iuo_parent) THEN
	IF IsValid(iuo_parent.iuo_parent) THEN
		IF NOT iuo_parent.iuo_parent.ib_allowpanelstoclose THEN
			IF ib_rtl THEN
				rc.Left = ScaleDPI(4)
			ELSE
				rc.Left = UnitsToPixels(Width, XUnitsToPixels!) - ScaleDPI(15)
			END IF
		END IF
	END IF
END IF

IF of_IsOverPin(il_x, il_y) THEN
	hRgn = inv_win32.CreateRectRgn (rc.Left - (2), (1) , rc.Left + ScaleDPI(13) , rc.Bottom + (1) )
	hRPen = inv_win32.CreatePen(0,0,RGB(49,106,197))
	inv_win32.FillRgn (hdc, hRgn , hRPen )
	inv_win32.DeleteObject(hRPen)
	inv_win32.DeleteObject(hRgn)
	
	hRgn = inv_win32.CreateRectRgn (rc.Left - (1), (2) , rc.Left + ScaleDPI(13) - 1 , rc.Bottom - (2) )
	hRPen = inv_win32.CreatePen(0,0,RGB(193,210,238))
	inv_win32.FillRgn (hdc, hRgn , hRPen )
	inv_win32.DeleteObject(hRPen)
	inv_win32.DeleteObject(hRgn)
	
	ll_color = 0
	ll_brush = inv_win32.CreatePen(0, 0, 0)
ELSE
	ll_color = RGB(255,255,255)
	ll_brush = inv_win32.CreatePen(0, 0, RGB(255,255,255))
END IF

inv_win32.SelectObject(hdc, ll_brush)

IF NOT lb_docked THEN	
	//draw unpinned
	llx = rc.left
	lly = (rc.bottom / 2) + ScaleDPI(1)
	inv_win32.Movetoex(hdc, llx, lly, lp)
	llx += ScaleDPI(4)
	inv_win32.LineTo(hdc, llx, lly)
	lly = rc.top + ScaleDPI(1)
	inv_win32.Movetoex(hdc, llx, lly, lp)
	lly += ScaleDPI(7)
	inv_win32.LineTo(hdc, llx, lly)
	lly = rc.top + ScaleDPI(2)
	inv_win32.Movetoex(hdc, llx, lly, lp)
	llx += ScaleDPI(7)
	inv_win32.LineTo(hdc, llx, lly)
	lly += ScaleDPI(4)
	inv_win32.LineTo(hdc, llx, lly)
	llx -= ScaleDPI(7)
	inv_win32.LineTo(hdc, llx, lly)
	lly -= ScaleDPI(1)
	inv_win32.Movetoex(hdc, llx, lly, lp)
	llx += ScaleDPI(7)
	inv_win32.LineTo(hdc, llx, lly)
ELSE
	//draw pinned
	llx = rc.left + ScaleDPI(5)
	lly = rc.bottom - ScaleDPI(6)
	inv_win32.Movetoex(hdc, llx, lly, lp)
	lly -= ScaleDPI(4)
	inv_win32.LineTo(hdc, llx, lly)
	llx = rc.left + ScaleDPI(2)
	inv_win32.Movetoex(hdc, llx, lly, lp)
	llx += ScaleDPI(7)
	inv_win32.LineTo(hdc, llx, lly)
	llx = rc.left + ScaleDPI(3)
	inv_win32.Movetoex(hdc, llx, lly, lp)
	lly -= ScaleDPI(6)
	inv_win32.LineTo(hdc, llx, lly)
	llx += ScaleDPI(4)
	inv_win32.LineTo(hdc, llx, lly)
	lly += ScaleDPI(6)
	inv_win32.LineTo(hdc, llx, lly)
	llx -= ScaleDPI(1)
	inv_win32.Movetoex(hdc, llx, lly, lp)
	lly -= ScaleDPI(6)
	inv_win32.LineTo(hdc, llx, lly)
END IF

inv_win32.DeleteObject(ll_brush)

RETURN 1

end function

public function integer of_drawx (longptr hdc);
LongPtr ll_brush, ll_oldbrush, ll_font, ll_oldfont, ll_color
string ls_x
Rect rc
point lp
long ll_x, ll_y
LongPtr hRgn, hRPen
Boolean lb_canclose

IF ib_rtl THEN
	rc.Left = 6
ELSE
	rc.Left = UnitsToPixels(Width, XUnitsToPixels!) - ScaleDPI(15)
END IF

rc.Top = 1
rc.Bottom = UnitsToPixels(Height, YUnitsToPixels!)

IF IsValid(iuo_parent) THEN
	lb_canclose = iuo_parent.of_CanDockPanelClose()
ELSE
	lb_canclose = TRUE
END IF
IF of_IsOverX(il_x, il_y) AND lb_canclose THEN
	hRgn = inv_win32.CreateRectRgn (rc.Left - ScaleDPI(4), 1 , rc.Left + ScaleDPI(13) , rc.Bottom + ScaleDPI(1))
	hRPen = inv_win32.CreatePen(0,0,RGB(49,106,197))
	inv_win32.FillRgn (hdc, hRgn , hRPen )
	inv_win32.DeleteObject(hRPen)
	inv_win32.DeleteObject(hRgn)
	
	hRgn = inv_win32.CreateRectRgn (rc.Left - ScaleDPI(4) + 1, (2) , rc.Left + ScaleDPI(13) - 1 , rc.Bottom - ScaleDPI(1) - 1 )
	hRPen = inv_win32.CreatePen(0,0,RGB(193,210,238))
	inv_win32.FillRgn (hdc, hRgn , hRPen )
	inv_win32.DeleteObject(hRPen)
	inv_win32.DeleteObject(hRgn)
	
	ll_color = 0
ELSE
	IF lb_canclose THEN
		ll_color = RGB(255,255,255)
	ELSE
		ll_color = RGB(200,200,200)
	END IF
END IF


ll_y = ((rc.Bottom - ScaleDPI(8)) / 2)// - ScaleDPI(4) //rc.Top
ll_x = rc.Left + ScaleDPI(1)

in_gradient.of_drawx(hdc, ll_x, ll_y, ScaleDPI(8), ScaleDPI(8), ll_color)

RETURN 1
end function

event mouseleave();ib_overpin = FALSE
ib_overx = FALSE

SetRedraw(TRUE)
end event

on u_cst_powerdockpanelheader.create
int iCurrent
call super::create
this.st_1=create st_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.st_1
end on

on u_cst_powerdockpanelheader.destroy
call super::destroy
destroy(this.st_1)
end on

event constructor;call super::constructor;
POST EVENT Resize(0, Width, Height)
end event

event onpaint;call super::onpaint;in_Gradient.of_SetHDC(hdc)

in_Gradient.of_VerticalGradient (of_GetColor("HEADER1"), of_GetColor("HEADER2"), THIS, TRUE, of_GetColor("HEADER2"), il_CurrentStyle)

IF ib_rtl THEN
	in_Gradient.of_DrawText(THIS, is_lefttext, il_leftcolor, is_font, il_fontsize, TRUE, in_Gradient.ALIGN_RIGHT, 18, 6, il_leftwidth, 80, ib_shadowtext) 
ELSE
	in_Gradient.of_DrawText(THIS, is_lefttext, il_leftcolor, is_font, il_fontsize, TRUE, in_Gradient.ALIGN_LEFT, il_leftx + 14, 6, il_leftwidth, 80, ib_shadowtext) 
END IF

IF Len(Trim(is_image)) > 0 THEN of_DrawImage(hdc)

of_DrawPin(hdc)

IF IsValid(iuo_parent) THEN
	IF IsValid(iuo_parent.iuo_parent) THEN
		IF iuo_parent.iuo_parent.ib_allowpanelstoclose THEN
			of_DrawX(hdc)
		END IF
	END IF
ELSE
	of_DrawX(hdc)
END IF

RETURN 1
end event

type st_1 from statictext within u_cst_powerdockpanelheader
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

