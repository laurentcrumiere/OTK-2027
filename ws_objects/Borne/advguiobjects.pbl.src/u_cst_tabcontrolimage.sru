$PBExportHeader$u_cst_tabcontrolimage.sru
forward
global type u_cst_tabcontrolimage from u_cst_canvas
end type
end forward

global type u_cst_tabcontrolimage from u_cst_canvas
end type
global u_cst_tabcontrolimage u_cst_tabcontrolimage

type prototypes
FUNCTION int GetModuleFileNameW(&  
           LongPtr hinstModule, &  
           REF string lpszPath, &  
           ulong cchPath) LIBRARY "kernel32"  
end prototypes

type variables
Long il_position
String is_image
Long il_backcolor

CONSTANT Long TILED = 1
CONSTANT Long STRETCHED = 2
CONSTANT Long TOPLEFT = 3
CONSTANT Long TOPCENTER = 4
CONSTANT Long TOPRIGHT = 5
CONSTANT Long MIDDLELEFT = 6
CONSTANT Long MIDDLECENTER = 7
CONSTANT Long MIDDLERIGHT = 8
CONSTANT Long BOTTOMLEFT = 9
CONSTANT Long BOTTOMCENTER = 10
CONSTANT Long BOTTOMRIGHT = 11
end variables

forward prototypes
public function integer of_setbackcolor (long al_color)
public function integer of_setimage (string as_image, long al_position, long al_color)
end prototypes

public function integer of_setbackcolor (long al_color);il_backcolor = al_color
SetRedraw(TRUE)

RETURN 1
end function

public function integer of_setimage (string as_image, long al_position, long al_color);string ls_Path  
unsignedlong lul_handle  
 
IF Handle(GetApplication()) > 0 THEN
	ls_Path = space(1024)  
	  
	lul_handle = Handle(GetApplication())  
	GetModuleFilenameW(lul_handle, ls_Path, 1024)
	
	ls_Path = Left(ls_Path, LastPos ( ls_Path, "\"))
	
	IF Left(as_image, 1) = "\" THEN
		as_image = Right(as_image, Len(as_image) - 1)
	END IF
	
	as_image = ls_Path + as_image
END IF

is_image = as_image
il_position = al_position
il_backcolor = al_color

RETURN 1

end function

on u_cst_tabcontrolimage.create
call super::create
end on

on u_cst_tabcontrolimage.destroy
call super::destroy
end on

event onpaint;call super::onpaint;Constant Long ColorAdjustTypeBitmap = 1
Constant Long UnitPixel = 2
Constant ULong ImageLockModeRead = 1
Constant Long PixelFormatDontCare = 0
GdiplusStartupInput  lstr_input
GdiplusStartupOutput lstr_output
RECT lstr_Rect
RECTF lstr_gRect
Long ll_Status, ll_Width, ll_Height, ll_Units, ll_rtn, ll_x, ll_y, ll_controlwidth, ll_controlheight
Integer il_LastStatus
LongPtr lul_Graphic, lul_BitmapData, lul_GdiToken, lul_Attribs, lul_Color, lul_hBitmap
LongPtr hRgn, hRPen

lstr_input.GdiplusVersion = 1
ll_rtn = inv_win32.GdiplusStartup(lul_GdiToken, lstr_input, lstr_output)

If ll_rtn = 0 Then
	hRgn = inv_win32.CreateRectRgn (0, 0 , UnitsToPixels(Width, XUnitsToPixels!) , UnitsToPixels(Height, YUnitsToPixels!))
	hRPen = inv_win32.CreatePen(0,0,il_backcolor)
	inv_win32.FillRgn (hdc, hRgn , hRPen )
	inv_win32.DeleteObject(hRPen)
	inv_win32.DeleteObject(hRgn)
	
	
	inv_win32.GetClientRect(Handle(this), lstr_Rect)
	inv_win32.GdipCreateFromHDC(hdc, lul_Graphic)
	inv_win32.GdipSetSmoothingMode(lul_Graphic, 0)
	inv_win32.GdipCreateBitmapFromFileICM(is_image, lul_hBitmap)
	inv_win32.GdipGetImageBounds(lul_hBitmap, lstr_gRect, ll_Units)
	
	ll_controlwidth = lstr_Rect.Right
   ll_controlheight = lstr_Rect.Bottom
		
	If il_position = STRETCHED OR il_position = TILED THEN
		ll_Width  = lstr_Rect.Right
		ll_Height = lstr_Rect.Bottom
		
		IF il_position = TILED THEN
			lstr_gRect.Width = lstr_gRect.Width * Abs(ll_Width / lstr_gRect.Width)
			lstr_gRect.Height = lstr_gRect.Height * Abs(ll_Height / lstr_gRect.Height)
		END IF
	Else
		ll_Width  = lstr_gRect.Width
		ll_Height = lstr_gRect.Height
	End If

	CHOOSE CASE il_position
		CASE TOPCENTER
			ll_x = (ll_controlwidth - ll_Width) / 2
		CASE TOPRIGHT
			ll_x = (ll_controlwidth - ll_Width)
		CASE MIDDLELEFT
			ll_x = 1
			ll_y = (ll_controlheight - ll_Height) / 2
		CASE MIDDLECENTER
			ll_x = (ll_controlwidth - ll_Width) / 2
			ll_y = (ll_controlheight - ll_Height) / 2
		CASE MIDDLERIGHT
			ll_x = (ll_controlwidth - ll_Width)
			ll_y = (ll_controlheight - ll_Height) / 2
		CASE BOTTOMLEFT
			ll_x = 1
			ll_y = (ll_controlheight - ll_Height)
		CASE BOTTOMCENTER
			ll_x = (ll_controlwidth - ll_Width) / 2
			ll_y = (ll_controlheight - ll_Height)
		CASE BOTTOMRIGHT
			ll_x = (ll_controlwidth - ll_Width)
			ll_y = (ll_controlheight - ll_Height)
	END CHOOSE
	

	IF il_position = TILED THEN
		inv_win32.GdipCreateImageAttributes(lul_Attribs)
		inv_win32.GdipSetImageAttributesWrapMode( &
						lul_Attribs, &
						0, &
						lul_Color, &
						FALSE)
	ELSE
		SetNull(lul_Attribs)
	END IF
	
	// draw the image
	il_LastStatus = inv_win32.GdipDrawImageRectRectI(lul_Graphic, lul_hBitmap, &
								ll_x, ll_y, ll_Width, ll_Height, &
								0, 0, lstr_gRect.Width, lstr_gRect.Height, &
								UnitPixel, lul_Attribs, 0, 0)

	
	// cleanup
	IF il_position = TILED THEN
		inv_win32.GdipDisposeImageAttributes(lul_Attribs)
	END IF
	
	inv_win32.GdipDeleteGraphics(lul_Graphic)
	inv_win32.GdipDisposeImage(lul_hBitmap)
	inv_win32.GdiplusShutdown(lul_GdiToken)
END IF

RETURN 0
end event

