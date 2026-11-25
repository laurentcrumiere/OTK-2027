$PBExportHeader$w_pbus_powersnip.srw
forward
global type w_pbus_powersnip from window
end type
type uo_2 from u_cst_toolbarstrip within w_pbus_powersnip
end type
type uo_1 from u_cst_canvas within w_pbus_powersnip
end type
type inv_win32 from n_cst_win32 within w_pbus_powersnip
end type
end forward

global type w_pbus_powersnip from window
integer width = 3282
integer height = 1164
boolean border = false
windowtype windowtype = popup!
long backcolor = 67108864
string icon = "AppIcon!"
windowanimationstyle openanimation = fadeanimation!
windowanimationstyle closeanimation = fadeanimation!
uo_2 uo_2
uo_1 uo_1
inv_win32 inv_win32
end type
global w_pbus_powersnip w_pbus_powersnip

type prototypes

end prototypes

type variables
n_cst_powersnip iuo_snip

Rect lr_clipregion
Int il_HandleSize = 10

Int TargetClicked = 0

CONSTANT Int TOPLEFT = 1
CONSTANT Int TOPRIGHT = 2
CONSTANT Int BOTTOMLEFT = 3
CONSTANT Int BOTTOMRIGHT = 4
CONSTANT Int CLIPREGION = 5

CONSTANT Long PNG2 = 1
CONSTANT Long BMP2 = 2
CONSTANT Long JPG2 = 3
CONSTANT Long GIF2 = 4


Long il_lastxX = -1
Long il_lastyX = -1

Long il_parentwidth
Long il_parentheight

GdiplusStartupInput  lstr_input
GdiplusStartupOutput lstr_output
LongPtr lul_Graphic, lul_GdiToken, lul_path

Boolean ib_parentresizable

n_uspb_resourcemanager inv_resourcemanager
end variables

forward prototypes
public function boolean of_inclipregion (long xpos, long ypos)
public function boolean of_intoplefthandle (long xpos, long ypos)
public function boolean of_intoprighthandle (long xpos, long ypos)
public function boolean of_inbottomlefthandle (long xpos, long ypos)
public function boolean of_inbottomrighthandle (long xpos, long ypos)
public function integer of_copyimage ()
public function integer of_close ()
public function integer of_fixclipregion ()
public function integer of_saveimage ()
public function integer of_getclsid (long al_format, ref clsid a_classid)
end prototypes

public function boolean of_inclipregion (long xpos, long ypos);//find out if a tab was clicked
long ll_count, ll_index
ulong lul_rgn
integer lix, liy
int l_inside

lix = UnitsToPixels(xpos, XUnitsToPixels!)
liy = UnitsToPixels(ypos, YUnitsToPixels!)

IF lix > lr_clipregion.Left AND lix < lr_clipregion.Right AND liy > lr_clipregion.Top AND liy < lr_clipregion.BOTTOM THEN
	RETURN TRUE
END IF

if l_inside > 0 THEN RETURN TRUE

RETURN FALSE
end function

public function boolean of_intoplefthandle (long xpos, long ypos);//find out if a tab was clicked
long ll_count, ll_index
ulong lul_rgn
integer lix, liy

lix = UnitsToPixels(xpos, XUnitsToPixels!)
liy = UnitsToPixels(ypos, YUnitsToPixels!)

Rect lr_handle

lr_handle.Left = lr_clipregion.Left - 3
lr_handle.Top = lr_clipregion.Top - 3
lr_handle.Right = lr_handle.Left + il_HandleSize + 3
lr_handle.Bottom = lr_handle.Top + il_HandleSize + 3

IF lix > lr_handle.Left AND lix < lr_handle.Right AND liy > lr_handle.Top AND liy < lr_handle.BOTTOM THEN
	RETURN TRUE
END IF

RETURN FALSE
end function

public function boolean of_intoprighthandle (long xpos, long ypos);//find out if a tab was clicked
long ll_count, ll_index
ulong lul_rgn
integer lix, liy

lix = UnitsToPixels(xpos, XUnitsToPixels!)
liy = UnitsToPixels(ypos, YUnitsToPixels!)

Rect lr_handle

lr_handle.Left = lr_clipregion.Right - il_HandleSize - 3
lr_handle.Top = lr_clipregion.Top - 3
lr_handle.Right = lr_handle.Left + il_HandleSize + 6
lr_handle.Bottom = lr_handle.Top + il_HandleSize + 3

IF lix > lr_handle.Left AND lix < lr_handle.Right AND liy > lr_handle.Top AND liy < lr_handle.BOTTOM THEN
	RETURN TRUE
END IF

RETURN FALSE
end function

public function boolean of_inbottomlefthandle (long xpos, long ypos);//find out if a tab was clicked
long ll_count, ll_index
ulong lul_rgn
integer lix, liy

lix = UnitsToPixels(xpos, XUnitsToPixels!)
liy = UnitsToPixels(ypos, YUnitsToPixels!)

Rect lr_handle

lr_handle.Left = lr_clipregion.Left - 3
lr_handle.Top = lr_clipregion.Bottom - il_HandleSize - 3
lr_handle.Right = lr_handle.Left + il_HandleSize
lr_handle.Bottom = lr_handle.Top + il_HandleSize + 6

IF lix > lr_handle.Left AND lix < lr_handle.Right AND liy > lr_handle.Top AND liy < lr_handle.BOTTOM THEN
	RETURN TRUE
END IF

RETURN FALSE
end function

public function boolean of_inbottomrighthandle (long xpos, long ypos);//find out if a tab was clicked
long ll_count, ll_index
ulong lul_rgn
integer lix, liy

lix = UnitsToPixels(xpos, XUnitsToPixels!)
liy = UnitsToPixels(ypos, YUnitsToPixels!)

Rect lr_handle

lr_handle.Left = lr_clipregion.Right - il_HandleSize - 3
lr_handle.Top = lr_clipregion.Bottom - il_HandleSize - 3
lr_handle.Right = lr_handle.Left + il_HandleSize + 3
lr_handle.Bottom = lr_handle.Top + il_HandleSize + 6

IF lix > lr_handle.Left AND lix < lr_handle.Right AND liy > lr_handle.Top AND liy < lr_handle.BOTTOM THEN
	RETURN TRUE
END IF

RETURN FALSE
end function

public function integer of_copyimage ();ULong ll_null
LongPtr hBitmap_copy
LongPtr newDC
LongPtr newBitmap
CONSTANT Int CF_BITMAP = 2

SetNull(ll_null)

// Create a new bitmap
hBitmap_copy = inv_win32.CreateBitmap(lr_clipregion.Right - lr_clipregion.Left, lr_clipregion.Bottom - lr_clipregion.Top, 1, 32, ll_null)

// Copy the source bitmap to the new one    
newDC = inv_win32.CreateCompatibleDC(iuo_snip.hdcMem)
newBitmap = inv_win32.SelectObject(newDC, hBitmap_copy)

inv_win32.BitBlt(newDC, 0, 0,lr_clipregion.Right - lr_clipregion.Left, lr_clipregion.Bottom - lr_clipregion.Top,&
             iuo_snip.hdcMem, iuo_snip.lpRect.Left + lr_clipregion.Left,iuo_snip.lpRect.Top + lr_clipregion.Top, iuo_snip.SRCCOPY)

inv_win32.SelectObject(newDC, newBitmap)

inv_win32.DeleteDC(newDC)

// hBitmap_copy can now be copied to the clipboard
inv_win32.OpenClipboard(Handle(iuo_snip.iw_parent))
inv_win32.EmptyClipboard()

inv_win32.SetClipboardData(CF_BITMAP, hBitmap_copy)

inv_win32.CloseClipboard()

inv_win32.DeleteObject(hBitmap_copy)

IF IsValid(iuo_snip.iw_parent) THEN iuo_snip.iw_parent.TriggerEvent("ue_powersnip_copied")

RETURN 1
end function

public function integer of_close ();inv_win32.DeleteObject(iuo_snip.hBitMap)
inv_win32.DeleteDC(iuo_snip.hdcMem)
inv_win32.ReleaseDC(iuo_snip.hwnd,iuo_snip.hdcSrc)

IF IsValid(iuo_snip.iw_parent) THEN iuo_snip.iw_parent.TriggerEvent("ue_powersnip_closing")

Close(THIS)

RETURN 1
end function

public function integer of_fixclipregion ();Int li_left, li_right, li_top, li_bottom


IF lr_clipregion.Right < lr_clipregion.Left THEN
	li_left = lr_clipregion.Left
	li_right = lr_clipregion.Right
	
	lr_clipregion.Left = li_right
	lr_clipregion.Right = li_left
	
	IF TargetClicked = TOPLEFT THEN
		TargetClicked = TOPRIGHT
	ELSEIF TargetClicked = TOPRIGHT THEN
		TargetClicked = TOPLEFT
	ELSEIF TargetClicked = BOTTOMLEFT THEN
		TargetClicked = BOTTOMRIGHT
	ELSEIF TargetClicked = BOTTOMRIGHT THEN
		TargetClicked = BOTTOMLEFT
	END IF
	
END IF

IF lr_clipregion.Bottom < lr_clipregion.Top THEN
	li_top = lr_clipregion.Top
	li_bottom = lr_clipregion.Bottom
	
	lr_clipregion.Top = li_bottom
	lr_clipregion.Bottom = li_top
	
	IF TargetClicked = BOTTOMLEFT THEN
		TargetClicked = TOPLEFT
	ELSEIF TargetClicked = BOTTOMRIGHT THEN
		TargetClicked = TOPRIGHT
	ELSEIF TargetClicked = TOPLEFT THEN
		TargetClicked = BOTTOMLEFT
	ELSEIF TargetClicked = TOPRIGHT THEN
		TargetClicked = BOTTOMRIGHT
	END IF
	
END IF

RETURN 1
end function

public function integer of_saveimage ();ULong ll_null
LongPtr hBitmap_copy, lul_bitmap
LongPtr newDC
LongPtr oldBitmap
clsid l_clsid
string ls_path, ls_file
int li_rc

IF Len(Trim(iuo_snip.DefaultFile)) > 0 THEN
	ls_file = iuo_snip.DefaultFile
	ls_path = iuo_snip.DefaultFile
ELSE
	li_rc = GetFileSaveName ( inv_resourcemanager.of_GetString("LBL_Select_File"), &
		ls_path, ls_file, "PNG", &
		  + "PNG Files (*.PNG),*.png," &
		+ "JPG Files (*.JPG),*.jpg,"  & 
		+ "BMP Files (*.BMP),*.bmp,"  & 
		+ "GIF Files (*.GIF),*.gif"  & 
		, "", &
		8194)
	 
	IF li_rc <> 1 THEN
		RETURN 0
	END IF
END IF

SetNull(ll_null)

// Create a new bitmap
hBitmap_copy = inv_win32.CreateBitmap(lr_clipregion.Right - lr_clipregion.Left, lr_clipregion.Bottom - lr_clipregion.Top, 1, 32, ll_null)

// Copy the source bitmap to the new one    
newDC = inv_win32.CreateCompatibleDC(iuo_snip.hdcMem)

//Select new bitmap
oldBitmap = inv_win32.SelectObject(newDC, hBitmap_copy)

//Copy image from memdc to bitmap
inv_win32.BitBlt(newDC, 0, 0,lr_clipregion.Right - lr_clipregion.Left, lr_clipregion.Bottom - lr_clipregion.Top,&
             iuo_snip.hdcMem, iuo_snip.lpRect.Left + lr_clipregion.Left,iuo_snip.lpRect.Top + lr_clipregion.Top, iuo_snip.SRCCOPY)


CHOOSE CASE Upper(Right(ls_file, 3))
	CASE "PNG"
		of_GetClsid(PNG2, l_clsid)
	CASE "JPG"
		of_GetClsid(JPG2, l_clsid)
	CASE "BMP"
		of_GetClsid(BMP2, l_clsid)
	CASE "GIF"
		of_GetClsid(GIF2, l_clsid)
END CHOOSE

inv_win32.GdipCreateBitmapFromHBITMAP(hBitmap_copy, 0, lul_bitmap)
inv_win32.GdipSaveImageToFile(lul_bitmap, ls_path, l_clsid, ll_null) 

inv_win32.SelectObject(newDC, oldBitmap)
inv_win32.DeleteDC(newDC)
inv_win32.GdipDisposeImage(lul_bitmap)
inv_win32.DeleteObject(hBitmap_copy)

IF IsValid(iuo_snip.iw_parent) THEN iuo_snip.iw_parent.TriggerEvent("ue_powersnip_imagesaved", 0, ls_path)

IF iuo_snip.AutoCloseOnSave THEN
	RETURN of_Close()
END IF

RETURN 1
end function

public function integer of_getclsid (long al_format, ref clsid a_classid);String ls_encoding
ULong ll_encodercount, ll_encodersize
clsid emptyclsid
String ls_type
Long ll_index, ll_count
ULong ll_encoding

CHOOSE CASE al_format
	CASE PNG2
		ls_encoding = "image/png"
		ll_encoding = 1434252294
	CASE BMP2
		ls_encoding = "image/bmp"
		ll_encoding = 1434252288
	CASE JPG2
		ls_encoding = "image/jpeg"
		ll_encoding = 1434252289
	CASE GIF2
		ls_encoding = "image/gif"
		ll_encoding = 1434252290
END CHOOSE

a_classid.Data1 = ll_encoding
a_classid.Data2 = 6660
a_classid.Data3 = 4563
a_classid.Data4[1] = 154
a_classid.Data4[2] = 115
a_classid.Data4[3] = 0
a_classid.Data4[4] = 0
a_classid.Data4[5] = 248
a_classid.Data4[6] = 30
a_classid.Data4[7] = 243
a_classid.Data4[8] = 46

RETURN 1

end function

on w_pbus_powersnip.create
this.uo_2=create uo_2
this.uo_1=create uo_1
this.inv_win32=create inv_win32
this.Control[]={this.uo_2,&
this.uo_1}
end on

on w_pbus_powersnip.destroy
destroy(this.uo_2)
destroy(this.uo_1)
destroy(this.inv_win32)
end on

event open;iuo_snip = Message.PowerObjectParm

IF iuo_snip.iw_parent.TriggerEvent("pbus_customcaptionwindow") = 1 THEN
	iuo_snip.iw_parent.Dynamic of_PauseResize(TRUE)
END IF

lstr_input.GdiplusVersion = 1
inv_win32.GdiplusStartup(lul_GdiToken, lstr_input, lstr_output)

il_parentwidth = UnitsToPixels(iuo_snip.iw_parent.Width, XUnitsToPixels!)
il_parentheight = UnitsToPixels(iuo_snip.iw_parent.Height, YUnitsToPixels!)

lr_clipregion.Left = il_parentwidth * .10
lr_clipregion.Right = il_parentwidth - lr_clipregion.Left
lr_clipregion.Top = il_parentheight * .10
lr_clipregion.Bottom = il_parentheight - lr_clipregion.Top

THIS.Move(iuo_snip.iw_parent.X, iuo_snip.iw_parent.Y)
THIS.Resize(iuo_snip.iw_parent.Width, iuo_snip.iw_parent.Height)

IF iuo_snip.DisplayCopy THEN
	uo_2.of_AddItem(inv_resourcemanager.of_GetString(iuo_snip.CopyText), "Copy!")
END IF
IF iuo_snip.DisplaySave THEN
	uo_2.of_AddItem(inv_resourcemanager.of_GetString(iuo_snip.SaveText), "Save!")
END IF
uo_2.of_AddItem(inv_resourcemanager.of_GetString(iuo_snip.CloseText), "Exit!")

uo_2.of_DisplayText(TRUE)
end event

event resize;IF IsValid(iuo_snip) AND iuo_snip.toolbarcustomposition THEN
	uo_2.Move(iuo_snip.toolbarx, iuo_snip.toolbary)
ELSE
	uo_2.X = (newwidth / 2) - (uo_2.Width / 2)
END IF

uo_1.Resize(newwidth, newheight)
end event

event close;IF lul_path > 0 THEN
	inv_win32.GdipDeletePath(lul_path)
END IF
IF lul_Graphic > 0 THEN
	inv_win32.GdipDeleteGraphics(lul_Graphic)
END IF
inv_win32.GdiplusShutdown(lul_GdiToken)

IF iuo_snip.iw_parent.TriggerEvent("pbus_customcaptionwindow") = 1 THEN
	iuo_snip.iw_parent.Dynamic of_PauseResize(FALSE)
END IF
end event

type uo_2 from u_cst_toolbarstrip within w_pbus_powersnip
integer x = 1326
integer taborder = 50
boolean autosize = true
end type

event ue_buttonclicked;call super::ue_buttonclicked;CHOOSE CASE as_button
	CASE inv_resourcemanager.of_GetString(iuo_snip.CopyText)
		of_CopyImage()
	CASE inv_resourcemanager.of_GetString(iuo_snip.SaveText)
		of_SaveImage()
	CASE inv_resourcemanager.of_GetString(iuo_snip.CloseText)
		Post of_Close()
END CHOOSE

end event

on uo_2.destroy
call u_cst_toolbarstrip::destroy
end on

type uo_1 from u_cst_canvas within w_pbus_powersnip
event mousemove pbm_mousemove
event lbuttonup pbm_lbuttonup
event lbuttondown pbm_lbuttondown
integer width = 3250
integer height = 1144
integer taborder = 10
end type

event mousemove;Int li_posx, li_posy
Int li_width, li_height
Boolean ib_lbuttondown

ib_lbuttondown = KeyDown(KeyLeftButton!)

li_posx = UnitsToPixels(xpos, XUnitsToPixels!)
li_posy = UnitsToPixels(ypos, YUnitsToPixels!)

IF (of_InTopLeftHandle(xpos, ypos) AND NOT ib_lbuttondown)  OR TargetClicked = TOPLEFT THEN
	SetPointer(SizeNWSE!)
	
	IF TargetClicked > 0 THEN
		lr_clipregion.Left = lr_clipregion.Left + (li_posx - il_lastxX)
		
		IF lr_clipregion.Left < 0 THEN
			lr_clipregion.Left = 0
		ELSE
			il_lastxX = li_posx
		END IF
		
		lr_clipregion.Top = lr_clipregion.Top + (li_posy - il_lastyX)
		
		IF lr_clipregion.Top < 0 THEN
			lr_clipregion.Top = 0
		ELSE
			il_lastyX = li_posy
		END IF

		of_FixClipRegion()
		
		SetRedraw(TRUE)		
	END IF
	
ELSEIF (of_InTopRightHandle(xpos, ypos) AND NOT ib_lbuttondown)  OR TargetClicked = TOPRIGHT  THEN
	SetPointer(SizeNESW!)
		
	IF TargetClicked > 0 THEN
		lr_clipregion.Right = lr_clipregion.Right + (li_posx - il_lastxX)
		
		IF lr_clipregion.Right > il_parentwidth THEN
			lr_clipregion.Right = il_parentwidth
		ELSE
			il_lastxX = li_posx
		END IF
		
		lr_clipregion.Top = lr_clipregion.Top + (li_posy - il_lastyX)
		
		IF lr_clipregion.Top < 0 THEN
			lr_clipregion.Top = 0
		ELSE
			il_lastyX = li_posy
		END IF
		
		of_FixClipRegion()
		
		SetRedraw(TRUE)
	END IF
	
ELSEIF (of_InBottomLeftHandle(xpos, ypos) AND NOT ib_lbuttondown)  OR TargetClicked = BOTTOMLEFT  THEN
	SetPointer(SizeNESW!)
		
	IF TargetClicked > 0 THEN
		lr_clipregion.Left = lr_clipregion.Left +  (li_posx - il_lastxX)
		
		IF lr_clipregion.Left < 0 THEN
			lr_clipregion.Left = 0
		ELSE
			il_lastxX = li_posx
		END IF
		
		lr_clipregion.Bottom = lr_clipregion.Bottom + (li_posy - il_lastyX)
		
		IF lr_clipregion.Bottom > il_parentheight THEN
			lr_clipregion.Bottom = il_parentheight
		ELSE
			il_lastyX = li_posy
		END IF
		
		of_FixClipRegion()
		
		SetRedraw(TRUE)
	END IF
	
ELSEIF (of_InBottomRightHandle(xpos, ypos) AND NOT ib_lbuttondown)  OR TargetClicked = BOTTOMRIGHT  THEN
	SetPointer(SizeNWSE!)
		
	IF TargetClicked > 0 THEN
		lr_clipregion.Right = lr_clipregion.Right +  (li_posx - il_lastxX)
		
		IF lr_clipregion.Right > il_parentwidth THEN
			lr_clipregion.Right = il_parentwidth
		ELSE
			il_lastxX = li_posx
		END IF
		
		lr_clipregion.Bottom = lr_clipregion.Bottom + (li_posy - il_lastyX)
		
		IF lr_clipregion.Bottom > il_parentheight THEN
			lr_clipregion.Bottom = il_parentheight
		ELSE
			il_lastyX = li_posy
		END IF
		
		of_FixClipRegion()
		
		SetRedraw(TRUE)
	END IF
	
ELSEIF (of_InClipRegion(xpos, ypos) AND NOT ib_lbuttondown)  OR TargetClicked = CLIPREGION  THEN
	SetPointer(Size!)
		
	IF TargetClicked > 0 THEN
		li_width = lr_clipregion.Right - lr_clipregion.Left
		li_height = lr_clipregion.Bottom - lr_clipregion.Top
	
		
		IF (lr_clipregion.Left +  (li_posx - il_lastxX)) +  li_width > il_parentwidth THEN
			lr_clipregion.Right = il_parentwidth
		ELSE
			
			lr_clipregion.Left = lr_clipregion.Left +  (li_posx - il_lastxX)
		
			IF lr_clipregion.Left < 0 THEN
				lr_clipregion.Left = 0
			END IF
			
			lr_clipregion.Right = lr_clipregion.Left +  li_width
				
		END IF
		
		IF ( lr_clipregion.Top + (li_posy - il_lastyX)) + li_height > il_parentheight THEN
			lr_clipregion.Bottom = il_parentheight
		ELSE
			lr_clipregion.Top = lr_clipregion.Top + (li_posy - il_lastyX)
		
			IF lr_clipregion.Top < 0 THEN
				lr_clipregion.Top = 0
			END IF
			
			lr_clipregion.Bottom = lr_clipregion.Top + li_height
		
		END IF
		
		il_lastxX = li_posx
		il_lastyX = li_posy
		
		SetRedraw(TRUE)
	END IF
	
ELSE
	SetPointer(Arrow!)
END IF


end event

event lbuttonup;inv_win32.ReleaseCapture()

SetPointer(Arrow!)
TargetClicked = 0
end event

event lbuttondown;IF of_InTopLeftHandle(xpos, ypos) THEN
	SetPointer(SizeNWSE!)
	TargetClicked = TOPLEFT
ELSEIF of_InTopRightHandle(xpos, ypos) THEN
	SetPointer(SizeNESW!)
	TargetClicked = TOPRIGHT
ELSEIF of_InBottomLeftHandle(xpos, ypos) THEN
	SetPointer(SizeNESW!)
	TargetClicked = BOTTOMLEFT
ELSEIF of_InBottomRightHandle(xpos, ypos) THEN
	SetPointer(SizeNWSE!)
	TargetClicked = BOTTOMRIGHT
ELSEIF of_InClipRegion(xpos, ypos) THEN
	SetPointer(Size!)
	TargetClicked = CLIPREGION
ELSE
	SetPointer(Arrow!)
	TargetClicked = 0
END IF

IF TargetClicked > 0 THEN
	il_lastxX = UnitsToPixels(xpos, XUnitsToPixels!)
	il_lastyX = UnitsToPixels(ypos, YUnitsToPixels!)
	
	inv_win32.SetCapture(Handle(THIS))
	SetRedraw(TRUE)
END IF
end event

event onpaint;call super::onpaint;LongPtr  lul_Pen,lul_Pen2, lul_colorRGB
LongPtr ll_overlaybrush, lul_handlebrush

Long ll_width, ll_height
ULong lul_overlay, lul_sizer
Int li_handlesizehalf

IF lul_Graphic > 0 THEN
	inv_win32.GdipDeleteGraphics(lul_Graphic)
END IF

inv_win32.GdipCreateFromHDC(hdc, lul_Graphic)
inv_win32.GdipSetSmoothingMode(lul_Graphic, 5)

inv_win32.SelectObject(hdc,iuo_snip.hBitMap)
inv_win32.BitBlt(hdc,0,0,iuo_snip.lpRect.Right,iuo_snip.lpRect.Bottom,iuo_snip.hdcMem,iuo_snip.lpRect.Left,iuo_snip.lpRect.Top,iuo_snip.SRCCOPY);

ll_width = UnitsToPixels(THIS.Width, XUnitsToPixels!)
ll_height = UnitsToPixels(THIS.Height, YUnitsToPixels!)

//Create our brushes
lul_overlay = inv_win32.PBUSMakeARGB (100, 0, 0, 0)
inv_win32.GdipCreateSolidFill(lul_overlay, ll_overlaybrush)

//Create star cut outs
IF lul_path > 0 THEN
	inv_win32.GdipDeletePath(lul_path)
END IF

inv_win32.GdipCreatePath(0, lul_path)

inv_win32.GdipAddPathLineI(lul_path, lr_clipregion.Left, lr_clipregion.Top, lr_clipregion.Right,  lr_clipregion.Top)
inv_win32.GdipAddPathLineI(lul_path, lr_clipregion.Right,  lr_clipregion.Top, lr_clipregion.Right,  lr_clipregion.Bottom)
inv_win32.GdipAddPathLineI(lul_path, lr_clipregion.Right,  lr_clipregion.Bottom, lr_clipregion.Left,  lr_clipregion.Bottom)
inv_win32.GdipAddPathLineI(lul_path, lr_clipregion.Left,  lr_clipregion.Bottom, lr_clipregion.Left, lr_clipregion.Top)

//Setting the clip path so that our stars are not draw (punch out)
inv_win32.GdipSetClipPath(lul_graphic, lul_path, 4)

//Draw our overlay, the code above will cause this to dray everything but our stars
inv_win32.GdipFillRectangleI(lul_graphic, ll_overlaybrush, 0, 0,  ll_width, ll_height)

lul_sizer = inv_win32.PBUSMakeARGB (255, 255, 106, 0)
inv_win32.GdipCreatePen1(lul_sizer,6, 2, lul_Pen)
inv_win32.GdipCreateSolidFill(lul_sizer, lul_handlebrush)


inv_win32.GdipDrawPath(lul_graphic, lul_Pen, lul_path);

//Rest the clip region
inv_win32.GdipResetClip(lul_graphic)

li_handlesizehalf = 3// ((il_HandleSize + 3) / 2)
inv_win32.GdipFillRectangleI(lul_graphic, lul_handlebrush,lr_clipregion.Left - li_handlesizehalf, lr_clipregion.Top - li_handlesizehalf, il_HandleSize,il_HandleSize)
inv_win32.GdipFillRectangleI(lul_graphic, lul_handlebrush,lr_clipregion.Right - li_handlesizehalf - li_handlesizehalf - 1, lr_clipregion.Top - li_handlesizehalf, il_HandleSize,il_HandleSize)
inv_win32.GdipFillRectangleI(lul_graphic, lul_handlebrush,lr_clipregion.Right - li_handlesizehalf - li_handlesizehalf - 1, lr_clipregion.Bottom - li_handlesizehalf - li_handlesizehalf - 1, il_HandleSize,il_HandleSize)
inv_win32.GdipFillRectangleI(lul_graphic, lul_handlebrush,lr_clipregion.Left - li_handlesizehalf, lr_clipregion.Bottom - li_handlesizehalf - li_handlesizehalf - 1, il_HandleSize,il_HandleSize)

//Cleanup
inv_win32.GdipDeletePen(lul_Pen)
inv_win32.GdipDeleteBrush(lul_handlebrush)
inv_win32.GdipDeleteBrush(ll_overlaybrush)

RETURN 1
end event

on uo_1.destroy
call u_cst_canvas::destroy
end on

type inv_win32 from n_cst_win32 within w_pbus_powersnip descriptor "pb_nvo" = "true" 
end type

on inv_win32.create
call super::create
end on

on inv_win32.destroy
call super::destroy
end on

