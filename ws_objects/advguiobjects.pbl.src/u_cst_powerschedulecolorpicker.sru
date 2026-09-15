$PBExportHeader$u_cst_powerschedulecolorpicker.sru
forward
global type u_cst_powerschedulecolorpicker from u_cst_canvas
end type
end forward

global type u_cst_powerschedulecolorpicker from u_cst_canvas
integer width = 1221
integer height = 116
event colorselected ( unsignedlong al_color )
event lbuttonup pbm_lbuttonup
end type
global u_cst_powerschedulecolorpicker u_cst_powerschedulecolorpicker

type variables
ULong BackgroundColor = RGB(255,255,255)
str_scheduleeventcolor istr_colors[]
ULong il_selectedcolor
CONSTANT Long il_circlewidth = 20
CONSTANT Long il_circleheight = 20
end variables

forward prototypes
public function integer of_drawbackground (longptr hdc)
public function integer of_drawcolors (longptr hdc)
public function integer of_selectcolor (unsignedlong al_color)
public function integer of_addcolor (string as_name, unsignedlong al_value, unsignedlong al_valuergb)
end prototypes

event lbuttonup;Long ll_x, ll_y
Long ll_index

ll_x = UnitsToPixels(xpos, XUnitsToPixels!)
ll_y = UnitsToPixels(ypos, YUnitsToPixels!)

ll_index = (ll_x / (il_circlewidth + 6)) + 1

IF ll_index > 0 AND ll_index <= UpperBound(istr_colors) THEN

	Event ColorSelected(istr_colors[ll_index].ColorValueRGB)
	of_SelectColor(istr_colors[ll_index].ColorValueRGB)

END IF
end event

public function integer of_drawbackground (longptr hdc);LongPtr ull_BackBrushColor
RECT rc
// determine control size
GetClientRect(Handle(THIS), rc)
// create a brush
ull_BackBrushColor = CreateSolidBrush(BackgroundColor)
// fill the background
FillRect(hdc, rc, ull_BackBrushColor)

DeleteObject(ull_BackBrushColor)

RETURN 1
end function

public function integer of_drawcolors (longptr hdc);GdiplusStartupInput  lstr_input
GdiplusStartupOutput lstr_output
LongPtr lul_GdiToken, lul_Graphic
Long ll_rtn, ll_index, ll_count
LongPtr lul_BrushColor, lul_Pen
Integer li_x

lstr_input.GdiplusVersion = 1
ll_rtn = inv_win32.GdiplusStartup(lul_GdiToken, lstr_input, lstr_output)

IF ll_rtn = 0 THEN
	inv_win32.GdipCreateFromHDC(hdc, lul_Graphic)
	inv_win32.GdipSetSmoothingMode(lul_Graphic, 4)

	inv_win32.GdipCreatePen1(inv_win32.PBUSMakeARGB (255, 255, 255, 255), 2, 2, lul_Pen)
	
	ll_count = UpperBound(istr_colors)

	//Draw Circles
	FOR ll_index = 1 TO ll_count
		inv_win32.GdipCreateSolidFill(istr_colors[ll_index].ColorValue, lul_BrushColor)
		
		li_x = (il_circlewidth * (ll_index - 1)) + (6 * (ll_index - 1))
		
		ll_rtn = inv_win32.GdipFillEllipseI(lul_Graphic, lul_BrushColor, li_x, 0,il_circlewidth, il_circleheight)
		
		IF istr_colors[ll_index].ColorValueRGB = il_selectedcolor THEN
						
			inv_win32.GdipDrawLine (lul_Graphic, lul_Pen, li_x + 5, il_circleheight / 2, li_x + 5 + 4, il_circleheight / 2 + 4)
			inv_win32.GdipDrawLine (lul_Graphic, lul_Pen, li_x + 5 + 4, il_circleheight / 2 + 4, li_x + 15, 6 )
		END IF
		
		inv_win32.GdipDeleteBrush(lul_BrushColor)	
	NEXT
	
	//Cleanup
	inv_win32.GdipDeletePen(lul_Pen)
	inv_win32.GdipDeleteGraphics(lul_Graphic)
	inv_win32.GdiplusShutdown(lul_GdiToken)
END IF

RETURN 1
end function

public function integer of_selectcolor (unsignedlong al_color);il_selectedcolor = al_color
SetRedraw(TRUE)
RETURN 1
end function

public function integer of_addcolor (string as_name, unsignedlong al_value, unsignedlong al_valuergb);str_scheduleeventcolor lstr_color
lstr_color.ColorName = as_name
lstr_color.ColorValue = al_value
lstr_color.ColorValueRGB = al_valuergb
istr_colors[UpperBound(istr_colors) + 1] = lstr_color
RETURN 1
end function

on u_cst_powerschedulecolorpicker.create
call super::create
end on

on u_cst_powerschedulecolorpicker.destroy
call super::destroy
end on

event onpaint;call super::onpaint;of_DrawBackground(hdc)
of_DrawColors(hdc)

RETURN 1
end event

