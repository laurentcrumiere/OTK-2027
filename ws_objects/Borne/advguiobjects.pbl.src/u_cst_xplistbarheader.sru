$PBExportHeader$u_cst_xplistbarheader.sru
forward
global type u_cst_xplistbarheader from u_cst_canvas
end type
type st_1 from statictext within u_cst_xplistbarheader
end type
end forward

global type u_cst_xplistbarheader from u_cst_canvas
integer height = 100
string pointer = "HyperLink!"
event mouseenter ( )
event mouseleave ( )
event mousemove pbm_mousemove
event lbuttonup pbm_lbuttonup
st_1 st_1
end type
global u_cst_xplistbarheader u_cst_xplistbarheader

type prototypes

end prototypes

type variables
n_cst_xplistbar_painter in_Gradient
n_cst_ui_imagelist inv_imagelist
u_cst_xplistbargroup iuo_parent

Boolean ib_selected

Boolean ib_used

String is_text
String is_image

LongPtr il_imagelistsmall
Long il_GroupStyle
Long il_image
Long il_height

CONSTANT Long ILD_TRANSPARENT = 1
CONSTANT Long LVM_GETIMAGELIST = 4098
CONSTANT Long LVSIL_NORMAL = 0

GdiplusStartupInput  istr_input
GdiplusStartupOutput istr_output
LongPtr iul_GdiToken
end variables

forward prototypes
public function integer of_setparent (u_cst_xplistbargroup auo_parent)
public function integer of_settext (string as_text)
public function integer of_setimage (string as_image)
public function integer of_capturemouse ()
public function boolean of_ismousecaptured ()
public function integer of_releasemouse ()
public function string of_gettext ()
public function integer of_setstyle (long al_style)
public function integer of_drawarrow (longptr ahdc)
public function integer of_drawcorners (longptr ahdc)
public function integer of_gettextsize (string as_text)
end prototypes

event mouseenter();SetRedraw(TRUE)
end event

event mouseleave();SetRedraw(TRUE)
end event

event mousemove;
if NOT of_ismousecaptured() then 
	
	of_capturemouse()
	
	this.event mouseenter()
		
else
	
	if xpos < 0 or ypos < 0 or xpos > width or ypos > height OR &
	   (iuo_parent.iuo_parent.PointerY() < iuo_parent.iuo_parent.uo_scrolldown.Height) OR &
		(iuo_parent.iuo_parent.PointerY() > iuo_parent.iuo_parent.uo_scrolldown.Y) then
	
		of_releasemouse()
		
		this.event post mouseleave()
		
	end if

end if
end event

public function integer of_setparent (u_cst_xplistbargroup auo_parent);iuo_parent = auo_parent

RETURN 1
end function

public function integer of_settext (string as_text);is_text = as_text

RETURN 1
end function

public function integer of_setimage (string as_image);is_image = as_image

IF Len(Trim(is_image)) > 0 THEN

	il_image = inv_imagelist.of_AddImage(as_image)
	il_imagelistsmall = inv_imagelist.of_GetSmallHandle()

END IF

RETURN 1
end function

public function integer of_capturemouse ();
if of_ismousecaptured() then Return -1

inv_win32.SetCapture(handle(this))

ib_mousecaptured = TRUE

return 1
end function

public function boolean of_ismousecaptured ();return ib_mousecaptured
end function

public function integer of_releasemouse ();
if NOT of_ismousecaptured() then return -1

inv_win32.ReleaseCapture()

ib_mousecaptured = FALSE

Return 1
end function

public function string of_gettext ();RETURN is_text
end function

public function integer of_setstyle (long al_style);il_GroupStyle = al_style
SetRedraw(TRUE)

RETURN 1

end function

public function integer of_drawarrow (longptr ahdc);Long ll_color
Long ll_x, ll_y
Boolean lb_rtl
//Setup
LongPtr lul_Graphic
LongPtr lul_Pen, lul_fillcolor, lul_path, lul_color
n_uspb_colors lnv_colors
Int li_red, li_green, li_blue

inv_win32.GdipCreateFromHDC(ahdc, lul_Graphic)
inv_win32.GdipSetSmoothingMode(lul_Graphic, 5)


lb_rtl = iuo_parent.iuo_parent.ib_rtl

IF  il_GroupStyle = 4 THEN
		ll_color = RGB(255,255,255)
ELSE

	IF ib_mousecaptured THEN
		choose case il_GroupStyle
			case 1 // SPECIAL
				ll_color = iuo_parent.iuo_parent.of_GetColor('SPECIALARROW')
			case 2 // FREEZED
				// FREEZED style does not display an arrow
			case else // ORIGINAL
				ll_color = iuo_parent.iuo_parent.of_GetColor('ITEMTEXTSELECTED')
		end choose
	
	ELSE
		IF il_GroupStyle = 1 THEN
			ll_color = RGB(255,255,255)
		ELSE
			ll_color = iuo_parent.iuo_parent.of_GetColor('ITEMTEXT')
		END IF
	END IF
END IF

IF lb_rtl THEN
	ll_x = ScaleDPI(16)
ELSE
	ll_x = UnitsToPixels(Width, XUnitsToPixels!) - ScaleDPI(11)
END IF

ll_y = ScaleDPI(8)

IF il_groupstyle <> 4 THEN
	Int CircleSize
	CircleSize = inv_win32.ScaleDPI(Handle(THIS), 16)
	
	IF il_GroupStyle = 1 THEN
		lnv_colors.of_SplitRGB(iuo_parent.iuo_parent.of_GetColor('SPECIALCIRCLEBORDER'), li_red, li_green, li_blue)
		lul_color = inv_win32.PBUSMakeARGB (255, li_red, li_green, li_blue)
		inv_win32.GdipCreatePen1(lul_color,2, 2, lul_Pen)
	
		lnv_colors.of_SplitRGB(iuo_parent.iuo_parent.of_GetColor('SPECIALCIRCLEFILL'), li_red, li_green, li_blue)
		lul_color = inv_win32.PBUSMakeARGB (255, li_red, li_green, li_blue)
		inv_win32.GdipCreateSolidFill(lul_color, lul_fillcolor)	
	ELSE
		lnv_colors.of_SplitRGB(iuo_parent.iuo_parent.of_GetColor('CIRCLEBORDER'), li_red, li_green, li_blue)
		lul_color = inv_win32.PBUSMakeARGB (255, li_red, li_green, li_blue)
		inv_win32.GdipCreatePen1(lul_color,2, 2, lul_Pen)
	
		lnv_colors.of_SplitRGB(iuo_parent.iuo_parent.of_GetColor('CIRCLEFILL'), li_red, li_green, li_blue)
		lul_color = inv_win32.PBUSMakeARGB (255, li_red, li_green, li_blue)
		inv_win32.GdipCreateSolidFill(lul_color, lul_fillcolor)	
	END IF
	
	inv_win32.GdipCreatePath(0, lul_path)
	inv_win32.GdipAddPathArcI(lul_path, ll_x - ScaleDPI(12), ScaleDPI(5), CircleSize,  CircleSize, -90, 360);
	inv_win32.GdipDrawPath(lul_graphic, lul_Pen, lul_path)
	inv_win32.GdipFillPath(lul_graphic, lul_fillcolor, lul_path)
	
	inv_win32.GdipDeletePath(lul_path)
	inv_win32.GdipDeletePen(lul_Pen)
	inv_win32.GdipDeleteBrush(lul_fillcolor)
END IF

//Draw triangle if it's that style and return
IF il_groupstyle = 4 THEN

	lnv_colors.of_SplitRGB(iuo_parent.iuo_parent.of_GetColor('CIRCLEBORDER'), li_red, li_green, li_blue)
	lul_color = inv_win32.PBUSMakeARGB (255, li_red, li_green, li_blue)
	inv_win32.GdipCreatePen1(lul_color,2, 2, lul_Pen)
		
	lnv_colors.of_SplitRGB(ll_color, li_red, li_green, li_blue)
	lul_color = inv_win32.PBUSMakeARGB (255, li_red, li_green, li_blue)
	inv_win32.GdipCreateSolidFill(lul_color, lul_fillcolor)
	
	inv_win32.GdipCreatePath(0, lul_path)

	ll_x = ll_x - ScaleDPI(10)
	ll_y = ll_y - ScaleDPI(1)
	
	IF iuo_parent.ib_expanded THEN
		//Up Arrow
		inv_win32.GdipAddPathLineI(lul_path, ll_x, ll_y + ScaleDPI(10), ll_x + ScaleDPI(12), ll_y + ScaleDPI(10))
		inv_win32.GdipAddPathLineI(lul_path, ll_x + ScaleDPI(12), ll_y + ScaleDPI(10), ll_x + ScaleDPI(6), ll_y)
		inv_win32.GdipAddPathLineI(lul_path, ll_x + ScaleDPI(6), ll_y, ll_x, ll_y + ScaleDPI(10))
	ELSE
		//Down Arrow
		inv_win32.GdipAddPathLineI(lul_path, ll_x, ll_y, ll_x + ScaleDPI(12), ll_y)
		inv_win32.GdipAddPathLineI(lul_path,  ll_x + ScaleDPI(12), ll_y, ll_x + ScaleDPI(6), ll_y + ScaleDPI(10))
		inv_win32.GdipAddPathLineI(lul_path, ll_x + ScaleDPI(6), ll_y + ScaleDPI(10), ll_x, ll_y)
	END IF
	
	inv_win32.GdipDrawPath(lul_graphic, lul_Pen, lul_path)
	inv_win32.GdipFillPath(lul_graphic, lul_fillcolor, lul_path)
	
	inv_win32.GdipDeleteGraphics(lul_Graphic)
	inv_win32.GdipDeletePath(lul_path)
	inv_win32.GdipDeletePen(lul_Pen)
	inv_win32.GdipDeleteBrush(lul_fillcolor)
	
	RETURN 1
END IF

lnv_colors.of_SplitRGB(ll_color, li_red, li_green, li_blue)
lul_color = inv_win32.PBUSMakeARGB (255, li_red, li_green, li_blue)
inv_win32.GdipCreatePen1(lul_color,1.60, 2, lul_Pen)

IF iuo_parent.ib_expanded THEN
	//Up Arrow
	ll_y = ll_y + ScaleDPI(1)
	ll_x = ll_x - ScaleDPI(4)
	inv_win32.GdipCreatePath(0, lul_path)
	inv_win32.GdipAddPathLineI(lul_path, ll_x, ll_y, ll_x - ScaleDPI(3), ll_y + ScaleDPI(3))
	inv_win32.GdipAddPathLineI(lul_path, ll_x, ll_y, ll_x + ScaleDPI(3), ll_y + ScaleDPI(3))
	inv_win32.GdipDrawPath(lul_graphic, lul_Pen, lul_path)
	inv_win32.GdipDeletePath(lul_path)
	
	//Adjust
	ll_y = ll_y + ScaleDPI(4)
	//Line 2
	inv_win32.GdipCreatePath(0, lul_path)
	inv_win32.GdipAddPathLineI(lul_path, ll_x, ll_y, ll_x - ScaleDPI(3), ll_y + ScaleDPI(3))
	inv_win32.GdipAddPathLineI(lul_path, ll_x, ll_y, ll_x + ScaleDPI(3), ll_y + ScaleDPI(3))
	inv_win32.GdipDrawPath(lul_graphic, lul_Pen, lul_path)
	inv_win32.GdipDeletePath(lul_path)
ELSE
	//Down Arrow
	ll_y = ll_y + ScaleDPI(2)
	ll_x = ll_x - ScaleDPI(4)
	inv_win32.GdipCreatePath(0, lul_path)
	inv_win32.GdipAddPathLineI(lul_path, ll_x, ll_y + ScaleDPI(3), ll_x + ScaleDPI(3), ll_y)
	inv_win32.GdipAddPathLineI(lul_path, ll_x, ll_y + ScaleDPI(3), ll_x - ScaleDPI(3), ll_y)
	inv_win32.GdipDrawPath(lul_graphic, lul_Pen, lul_path)
	inv_win32.GdipDeletePath(lul_path)
	
	//Adjust
	ll_y = ll_y + ScaleDPI(4)
	//Line 2
	inv_win32.GdipCreatePath(0, lul_path)
	inv_win32.GdipAddPathLineI(lul_path, ll_x, ll_y + ScaleDPI(3), ll_x + ScaleDPI(3), ll_y)
	inv_win32.GdipAddPathLineI(lul_path, ll_x, ll_y + ScaleDPI(3), ll_x - ScaleDPI(3), ll_y)
	inv_win32.GdipDrawPath(lul_graphic, lul_Pen, lul_path)
	inv_win32.GdipDeletePath(lul_path)
	
END IF

inv_win32.GdipDeleteGraphics(lul_Graphic)
inv_win32.GdipDeletePen(lul_Pen)

RETURN 1
end function

public function integer of_drawcorners (longptr ahdc);Long ll_color
LongPtr ll_dc
Long ll_width

ll_dc = inv_win32.GetDC(Handle(iuo_parent.iuo_parent))

ll_color = inv_win32.GetPixel(ll_dc, 5, UnitsToPixels(iuo_parent.Y, YUnitsToPixels!))

ll_width = UnitsToPixels(Width, XUnitsToPixels!)

inv_win32.SetPixel(ahdc, 0, 0, ll_color)
inv_win32.SetPixel(ahdc, 1, 0, ll_color)
inv_win32.SetPixel(ahdc, 0, 1, ll_color)

inv_win32.SetPixel(ahdc, ll_width - 1, 0, ll_color)
inv_win32.SetPixel(ahdc, ll_width - 2, 0, ll_color)
inv_win32.SetPixel(ahdc, ll_width - 1, 1, ll_color)

inv_win32.ReleaseDC (Handle(iuo_parent.iuo_parent), ll_dc)


RETURN 1
end function

public function integer of_gettextsize (string as_text);LongPtr lul_Handle, lul_hDC, lul_hFont
SIZE lstr_size
long ll_x
n_uspb_text_helper lnv_texthelper
Integer li_newHeight

IF is_image = '' THEN
	ll_x = 60
ELSE
	ll_x = 160
END IF

lul_Handle = Handle(st_1)
lul_hDC = inv_win32.GetDC(lul_Handle)

lnv_texthelper.of_SetHdc(lul_hDC)

li_newHeight = PixelsToUnits(lnv_texthelper.of_gettextheight (lul_hDC,as_text,  iuo_parent.iuo_parent.is_fontname, iuo_parent.iuo_parent.il_fontsize, lnv_texthelper.ALIGN_LEFT, UnitsToPixels(Width - 60, XUnitsToPixels!) , FALSE, FALSE, TRUE), XPixelsToUnits!)

inv_win32.ReleaseDC(lul_Handle, lul_hDC)

IF li_newHeight + 30 > 100 THEN
	Height = li_newHeight + 30
ELSE
	Height = 100
END IF

RETURN 1
end function

on u_cst_xplistbarheader.create
int iCurrent
call super::create
this.st_1=create st_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.st_1
end on

on u_cst_xplistbarheader.destroy
call super::destroy
destroy(this.st_1)
end on

event onpaint;call super::onpaint;Boolean lb_rtl
Long ll_align, ll_imgx, ll_x, ll_width, ll_textcolor, ll_back1, ll_back2

IF IsValid(iuo_parent) THEN
	IF IsValid(iuo_parent.iuo_parent) THEN
		in_Gradient.of_SetHDC(hdc)
		
		lb_rtl = iuo_parent.iuo_parent.ib_rtl

		IF lb_rtl THEN
			ll_x = 30
			IF is_image = '' THEN
				ll_width = Width - ll_x
			ELSE
				ll_width = Width - 110
			END IF
			ll_align = in_Gradient.DT_RTLREADING
			ll_imgx = UnitsToPixels(Width - 25, XUnitsToPixels!) - 16
		ELSE
			IF is_image = '' THEN
				ll_x = 30
				ll_width = Width - 140
			ELSE
				ll_x = 130
				ll_width = Width - 240
			END IF
			ll_align = in_Gradient.ALIGN_LEFT
			ll_imgx = UnitsToPixels(25, XUnitsToPixels!)
		END IF

		IF iuo_parent.iuo_parent.is_CurrentStyle = iuo_parent.iuo_parent.ClassicStyle THEN
			choose case il_GroupStyle // added by Serge Samson
				case 1 // SPECIAL
					ll_back1 = iuo_parent.iuo_parent.of_GetColor('HEADERSPECIAL1')
					ll_back2 = iuo_parent.iuo_parent.of_GetColor('HEADERSPECIAL2')
				case else
					ll_back1 = iuo_parent.iuo_parent.of_GetColor('HEADER1')
					ll_back2 = iuo_parent.iuo_parent.of_GetColor('HEADER2')
			end choose
			
			IF iuo_parent.iuo_parent.ib_rtl THEN
				ULong ll_temp
				ll_temp = ll_back1
				ll_back1 = ll_back2
				ll_back2 = ll_temp
			END IF
			
		ELSE
			ll_back1 = iuo_parent.iuo_parent.of_GetBackColor(iuo_parent.iuo_parent.BackColor)
			ll_back2 = ll_back1
		END IF

		in_Gradient.of_HorizontalGradient(ll_back1, ll_back2, THIS, FALSE)
		
		IF iuo_parent.iuo_parent.is_CurrentStyle = iuo_parent.iuo_parent.ClassicStyle THEN
			IF ib_mousecaptured THEN
				IF il_GroupStyle = 1 THEN
					ll_textcolor = iuo_parent.iuo_parent.of_GetColor('HEADERSPECIALTEXTSELECTED')					 					
				ELSE
					IF Left(Lower(iuo_parent.iuo_parent.is_CurrentTheme), 8) <> 'windows8' AND &
						Left(Lower(iuo_parent.iuo_parent.is_CurrentTheme), 9) <> 'windows10' AND &
						Left(Lower(iuo_parent.iuo_parent.is_CurrentTheme), 12) <> 'powerbuilder' AND &
						Pos(Lower(iuo_parent.iuo_parent.is_CurrentTheme), "flat", 1) <=0 AND &
						Pos(Lower(iuo_parent.iuo_parent.is_CurrentTheme), "light", 1) <=0 AND &
						Pos(Lower(iuo_parent.iuo_parent.is_CurrentTheme), "dark", 1) <=0 THEN
						ll_textcolor = iuo_parent.iuo_parent.of_GetColor('ITEMTEXTSELECTED')
					ELSE
						ll_textcolor = iuo_parent.iuo_parent.of_GetColor('HEADERTEXT')
					END IF
				END IF
			ELSE
				IF il_GroupStyle = 1 THEN
					ll_textcolor = iuo_parent.iuo_parent.of_GetColor('HEADERSPECIALTEXT')
				ELSE
					ll_textcolor = iuo_parent.iuo_parent.of_GetColor('HEADERTEXT')
				END IF
			END IF
		ELSE
			ll_textcolor = 0
		END IF
		
		in_Gradient.of_DrawText(THIS, is_text, ll_textcolor, iuo_parent.iuo_parent.is_fontname, iuo_parent.iuo_parent.il_fontsize, TRUE, ll_align, ll_x, 25, ll_width, Height,FALSE, TRUE, FALSE, FALSE)
		
		IF is_image <> "" THEN
			inv_win32.ImageList_Draw(il_imagelistsmall, il_image - 1, hdc, ll_imgx, UnitsToPixels(18, YUnitsToPixels!), ILD_TRANSPARENT )		
		END IF
		
		IF il_groupstyle <> iuo_parent.iuo_parent.NOARROW THEN
			of_DrawArrow(hdc)
		END IF
		
		IF iuo_parent.iuo_parent.is_CurrentStyle = iuo_parent.iuo_parent.ClassicStyle THEN
			IF Left(Lower(iuo_parent.iuo_parent.is_CurrentTheme), 8) <> 'windows8' AND &
			   Left(Lower(iuo_parent.iuo_parent.is_CurrentTheme), 9) <> 'windows10' AND &
						Left(Lower(iuo_parent.iuo_parent.is_CurrentTheme), 12) <> 'powerbuilder' THEN
				of_DrawCorners(hdc)
			END IF
		END IF
		
	END IF
END IF

RETURN 0
end event

event constructor;call super::constructor;of_SetParent(PARENT)

istr_input.GdiplusVersion = 1
inv_win32.GdiplusStartup(iul_GdiToken, istr_input, istr_output)	

end event

event wm_mousewheel;call super::wm_mousewheel;iuo_parent.iuo_parent.Trigger Event wm_mousewheel(wparam, lparam)
end event

event destructor;call super::destructor;inv_win32.GdiplusShutdown(iul_GdiToken)
end event

type st_1 from statictext within u_cst_xplistbarheader
boolean visible = false
integer x = 151
integer y = 16
integer width = 411
integer height = 60
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "none"
boolean focusrectangle = false
end type

