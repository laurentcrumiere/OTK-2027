$PBExportHeader$u_cst_imageeditor.sru
forward
global type u_cst_imageeditor from userobject
end type
type htb_brightness from u_cst_imageeditor_trackbar within u_cst_imageeditor
end type
type htb_zoom from u_cst_imageeditor_trackbar within u_cst_imageeditor
end type
type st_zoom from statictext within u_cst_imageeditor
end type
type uo_autofit from u_cst_togglebutton within u_cst_imageeditor
end type
type uo_brightness from u_cst_toolbarstrip within u_cst_imageeditor
end type
type uo_tools from u_cst_toolbarstrip within u_cst_imageeditor
end type
type uo_actions from u_cst_toolbarstrip within u_cst_imageeditor
end type
type uo_1 from u_cst_canvas within u_cst_imageeditor
end type
type uo_cropactions from u_cst_toolbarstrip within u_cst_imageeditor
end type
type uo_zoom from u_cst_toolbarstrip within u_cst_imageeditor
end type
type r_bottom from rectangle within u_cst_imageeditor
end type
type r_top from rectangle within u_cst_imageeditor
end type
type st_uspb_imageeditor from statictext within u_cst_imageeditor
end type
type inv_pbusexternal from n_cst_pbusexternal within u_cst_imageeditor
end type
type inv_win32 from n_cst_win32 within u_cst_imageeditor
end type
end forward

global type u_cst_imageeditor from userobject
integer width = 2007
integer height = 1584
long backcolor = 16777215
string text = "none"
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
event resize pbm_size
event savecomplete ( string a_filename,  integer a_return )
htb_brightness htb_brightness
htb_zoom htb_zoom
st_zoom st_zoom
uo_autofit uo_autofit
uo_brightness uo_brightness
uo_tools uo_tools
uo_actions uo_actions
uo_1 uo_1
uo_cropactions uo_cropactions
uo_zoom uo_zoom
r_bottom r_bottom
r_top r_top
st_uspb_imageeditor st_uspb_imageeditor
inv_pbusexternal inv_pbusexternal
inv_win32 inv_win32
end type
global u_cst_imageeditor u_cst_imageeditor

type prototypes

end prototypes

type variables
public:

Boolean AutoFit = TRUE

String RotateLeftText = "BTN_IMG_Editor_Rotate_Left"
String RotateRightText = "BTN_IMG_Editor_Rotate_Right"
String FlipHorizontalText = "BTN_IMG_Editor_Flip_Horizontal"
String FlipVerticalText = "BTN_IMG_Editor_Flip_Vertical"
String CopyText = "BTN_IMG_Editor_Copy"
String CropText = "BTN_IMG_Editor_Crop"
String SaveText = "BTN_IMG_Editor_Save"
String SaveAsText = "BTN_IMG_Editor_Save_As"
String PrintText = "BTN_IMG_Editor_Print"
String LoadFromFileText = "BTN_IMG_Editor_Load_from_File"
String PasteFromClipboardText = "BTN_IMG_Editor_Paste_from_Clipboard"
String AcceptText = "BTN_IMG_Editor_Accept"
String CancelText = "BTN_IMG_Editor_Cancel"
String UndoText = "BTN_IMG_Editor_Undo"
String RedoText = "BTN_IMG_Editor_Redo"
String EffectsText = "BTN_IMG_Editor_Effects"
String GreyScaleText = "BTN_IMG_Editor_Grey_Scale"
String InvertColorsText = "BTN_IMG_Editor_Invert_Colors"
String SepiaText = "BTN_IMG_Editor_Sepia"
String BrightnessText = "BTN_IMG_Editor_Brightness"
String BlackAndWhiteText = "BTN_IMG_Editor_Black_and_White"
String ContrastText = "BTN_IMG_Editor_Contrast"
String ZoomInText = "BTN_IMG_Editor_Zoom_In"
String ZoomOutText = "BTN_IMG_Editor_Zoom_Out"
String AutoFitText = "BTN_IMG_Editor_Auto_Fit"
String ResizeImageText = "BTN_IMG_Editor_Resize_Image"

String RotateLeftImage = "imageeditor_rotateleft.png"
String RotateRightImage = "imageeditor_rotateright.png"
String FlipHorizontalImage = "imageeditor_fliphorizontal.png"
String FlipVerticalImage = "imageeditor_flipvertical.png"
String CopyImage = "imageeditor_copy.png"
String CropImage = "imageeditor_crop.png"
String SaveImage = "imageeditor_save.png"
String SaveAsImage = "imageeditor_saveas.png"
String PrintImage = "imageeditor_print.png"
String LoadFromFileImage = "imageeditor_openfile.png"
String PasteFromClipboardImage = "imageeditor_pastefromclipboard.png"
String AcceptImage = "imageeditor_cropaccept.png"
String CancelImage = "imageeditor_cropcancel.png"
String UndoImage = "imageeditor_undo.png"
String RedoImage = "imageeditor_redo.png"
String EffectsImage = "imageeditor_effects.png"
String GreyScaleImage = "imageeditor_greyscale.png"
String InvertColorsImage = "imageeditor_negative.png"
String SepiaImage = "imageeditor_sepia.png"
String BrightnessImage = "imageeditor_brightness.png"
String BlackAndWhiteImage = "imageeditor_blackandwhite.png"
String ContrastImage = "imageeditor_contrast.png"
String ZoomInImage = "imageeditor_zoomin.png"
String ZoomOutImage = "imageeditor_zoomout.png"
String ResizeImage = "imageeditor_resize.png"

CONSTANT Int UnitWorld =  0 // World coordinate (non-physical unit)
CONSTANT Int UnitDisplay =  1 // Variable -- for PageTransform only
CONSTANT Int UnitPixel =  2 // Each unit is one device pixel.
CONSTANT Int UnitPoint =  3 // Each unit is a printer's point, or 1/72 inch.
CONSTANT Int UnitInch =  4 // Each unit is 1 inch.
CONSTANT Int UnitDocument =  5 // Each unit is 1/300 inch.
CONSTANT Int UnitMillimeter =  6 // Each unit is 1 millimeter.

Long Quality = -1

//Save error codes:
CONSTANT Int Ok = 0
CONSTANT Int GenericError = 1
CONSTANT Int InvalidParameter = 2
CONSTANT Int OutOfMemory = 3
CONSTANT Int ObjectBusy = 4
CONSTANT Int InsufficientBuffer = 5
CONSTANT Int NotImplemented = 6
CONSTANT Int Win32Error = 7
CONSTANT Int WrongState = 8
CONSTANT Int Aborted = 9
CONSTANT Int FileNotFound = 10
CONSTANT Int ValueOverflow = 11
CONSTANT Int AccessDenied = 12
CONSTANT Int UnknownImageFormat = 13
CONSTANT Int FontFamilyNotFound = 14
CONSTANT Int FontStyleNotFound = 15
CONSTANT Int NotTrueTypeFont = 16
CONSTANT Int UnsupportedGdiplusVersion = 17
CONSTANT Int GdiplusNotInitialized = 18
CONSTANT Int PropertyNotFound = 19
CONSTANT Int PropertyNotSupported = 20
CONSTANT Int ProfileNotFound = 21

ULong ImageBackgroundColor = RGB(255,255,255)

//Private:

imageeditorhist ActionUndo[]
imageeditorhist ActionRedo[]
Boolean ib_trackundo = TRUE
Boolean ib_modified

//Actions
CONSTANT Int FlipHorizontal = 0
CONSTANT Int FlipVertical = 1
CONSTANT Int RotateLeft = 2
CONSTANT Int RotateRight = 3
CONSTANT Int Crop = 4
CONSTANT Int GreyScale = 5
CONSTANT Int InvertColors = 6
CONSTANT Int Sepia = 7
CONSTANT Int BlackAndWhite = 8
CONSTANT Int Brightness = 9
CONSTANT Int Contrast = 10
CONSTANT Int ImageResize = 11

string is_filename, is_fullname


LongPtr hdcSrc
LongPtr hBitMap
LongPtr hBitMap_Orig
LongPtr hBitMap_Brightness
LongPtr hdcMem
LongPtr iul_pImageStream = 0
LongPtr iul_pGlobalBuffer = 0
LongPtr iul_hGlobal = 0

GdiplusStartupInput  lstr_input
GdiplusStartupOutput lstr_output
LongPtr lul_GdiToken

int cx,cy

RECT lpRect

LongPtr hwnd

CONSTANT Long SM_CXSCREEN = 0
CONSTANT Long SM_CYSCREEN = 1
CONSTANT Long SRCCOPY = 13369376

window iw_parent

n_cst_pbus_lic iu_lic

Rect lr_clipregion
LongPtr lul_croppath
Int il_HandleSize = 10

Int TargetClicked = 0

Boolean ib_clipstarted
Boolean ib_brightnessstarted
Boolean ib_contraststarted
Boolean ib_panning

Int ii_imagex, ii_imagey, ii_imagewidth, ii_imageheight
Int ii_centerx, ii_centery
Int ii_controlwidth, ii_controlheight

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

Double ResizeFactor

CONSTANT Int Rotate180FlipNone = 2
CONSTANT Int Rotate180FlipX = 6
CONSTANT Int Rotate180FlipXY = 0
CONSTANT Int Rotate180FlipY = 4	
CONSTANT Int Rotate270FlipNone = 3
CONSTANT Int Rotate270FlipX = 7
CONSTANT Int Rotate270FlipXY = 1
CONSTANT Int Rotate270FlipY = 5
CONSTANT Int Rotate90FlipNone = 1
CONSTANT Int Rotate90FlipX = 5
CONSTANT Int Rotate90FlipXY = 3
CONSTANT Int Rotate90FlipY = 7
CONSTANT Int RotateNoneFlipNone = 0
CONSTANT Int RotateNoneFlipX = 4
CONSTANT Int RotateNoneFlipXY = 2
CONSTANT Int RotateNoneFlipY = 6

n_uspb_resourcemanager inv_resourcemanager
end variables

forward prototypes
public function integer of_loadfromfile (string as_file)
public function integer of_loadfromfile (string as_file)
public function integer of_startclip ()
public function integer of_fixclipregion ()
public function integer of_rotateleft ()
public function integer of_rotateright ()
public function integer of_fliphorizontal ()
public function integer of_flipvertical ()
private function integer of_drawbackground (longptr hdc)
private function integer of_drawcrop (longptr lul_graphic)
private function integer of_drawimage (longptr lul_graphic)
private function clsid of_getclsid (long al_format)
private function boolean of_inbottomlefthandle (long xpos, long ypos)
private function boolean of_inbottomrighthandle (long xpos, long ypos)
private function boolean of_inclipregion (long xpos, long ypos)
private function boolean of_intoplefthandle (long xpos, long ypos)
private function boolean of_intoprighthandle (long xpos, long ypos)
public function integer of_acceptclip ()
public function integer of_saveasfile ()
public function integer of_savefile (string as_filename)
public function integer of_loadfromclipboard ()
private function integer of_rotateright (longptr ahbitmap)
private function integer of_rotateleft (longptr ahbitmap)
private function integer of_flipvertical (longptr ahbitmap)
private function integer of_fliphorizontal (longptr ahbitmap)
private function longptr of_crop (longptr ahbitmap, rect cropregion)
private function integer of_addundo (integer ai_action)
private function integer of_addundo (integer ai_action, rect ai_crop)
public function integer of_undo ()
public function integer of_redo ()
public function integer of_greyscale ()
private function integer of_greyscale (longptr ahbitmap)
private function integer of_transformcolor (longptr ahbitmap, real colormatix[5, 5])
private function integer of_invertcolors (longptr ahbitmap)
public function integer of_invertcolors ()
public function integer of_sepia ()
private function integer of_sepia (longptr ahbitmap)
private function integer of_blackandwhite (longptr ahbitmap)
public function integer of_blackandwhite ()
public function integer of_startbrightness ()
public function integer of_brightness (integer ai_brightness)
private function integer of_createbrightnessimage (longptr ahbitmap)
private function integer of_brightness (longptr ahbitmap, integer ai_brightness)
private function integer of_adjustbrightness (integer ai_brightness)
private function integer of_addundo (integer ai_action, integer ai_value)
private function integer of_contrast (longptr ahbitmap, integer ai_contrast)
public function integer of_contrast (integer ai_contrast)
private function integer of_acceptbrightness ()
private function integer of_acceptcontrast ()
private function integer of_adjustcontrast (integer ai_contrast)
private function integer of_endbrightness ()
private function integer of_endcontrast ()
public function integer of_startcontrast ()
public function integer of_autofit ()
public function integer of_displayactionbuttons (boolean ab_switch)
public function integer of_displayzoombuttons (boolean ab_switch)
public function integer of_updateui ()
public function integer of_settheme (string as_theme)
public function integer of_endclip ()
public function integer of_copy ()
public function boolean of_ismodified ()
public function integer of_resizeimage (real ar_wpercent, real ar_hpercent)
public function integer of_resizeimage (real ar_percent)
public function integer of_resizeimage (real ar_width, real ar_height, boolean ab_percent)
private function integer of_addundo (integer ai_action, imageeditorhistscale ai_scalevalues)
public function rectf of_getimagesize (long a_unit)
public function rectf of_getimagesize ()
public function integer of_undoall ()
public function integer of_print ()
end prototypes

event resize;Long ll_adjust

IF uo_actions.Visible THEN
	ll_adjust = r_top.Height
END IF
IF uo_zoom.Visible THEN
	ll_adjust += r_bottom.Height
END IF

uo_1.Resize(newwidth, newheight - ll_adjust)

uo_tools.X = uo_1.X + (newwidth / 2) - (uo_tools.width / 2)
IF uo_tools.X < uo_actions.X + uo_actions.Width THEN
	uo_tools.X = uo_actions.X + uo_actions.Width
END IF

uo_cropactions.Move(uo_1.X + (newwidth / 2) - (uo_cropactions.width / 2),  uo_1.Y)
uo_brightness.Move(uo_1.X + (newwidth / 2) - (uo_brightness.width / 2),  uo_1.Y)
uo_zoom.Move(uo_1.X + (newwidth / 2) - (uo_zoom.width / 2), uo_1.Y + uo_1.Height + 20)

r_bottom.Move(uo_1.X, uo_1.Y + uo_1.Height)
r_bottom.Width = uo_1.Width

r_top.Width = uo_1.Width

IF ib_clipstarted THEN
	of_EndClip()
END IF
end event

public function integer of_loadfromfile (string as_file);RECTF lstr_gRect
Long ll_Units
ULong ll_Length
Constant ULong GMEM_MOVEABLE = 2
Blob bimage

IF NOT FileExists(as_file) THEN RETURN 0

IF NOT iu_lic.of_Registered() OR &
   iu_lic.of_Key() <> "38017E06-84A2-4B73-9CE5-87C0BD9A39A8" THEN
	RETURN 0
END IF

IF hBitMap > 0 THEN
	inv_win32.GdipDisposeImage(hBitMap)
	hBitMap = 0
END IF
IF hBitMap_orig > 0 THEN
	inv_win32.GdipDisposeImage(hBitMap_orig)
	hBitMap_orig = 0
END IF
IF iul_pGlobalBuffer > 0 THEN
	inv_win32.GlobalUnlock(iul_pGlobalBuffer)
	iul_pGlobalBuffer = 0
END IF
IF iul_hGlobal > 0 THEN
	inv_win32.GlobalFree(iul_hGlobal)
	iul_hGlobal = 0
END IF

is_fullname = as_file

int li_file

li_file = FileOpen(is_fullname, StreamMode!, Read!, Shared! )
FileReadEx (li_file,bimage )
FileClose(li_file)

ll_Length = Len(bimage)

// Allocate memory to hold the image
iul_hGlobal = inv_win32.GlobalAlloc(GMEM_MOVEABLE, ll_Length)
If iul_hGlobal > 0 Then
	// Lock the memory
	iul_pGlobalBuffer = inv_win32.GlobalLock(iul_hGlobal)
	If iul_pGlobalBuffer > 0 Then
		// Copy the image from the string buffer to global memory
		inv_win32.CopyMemory(iul_pGlobalBuffer, bimage, ll_Length)
		// Create a stream in global memory
		If inv_win32.CreateStreamOnHGlobal(iul_hGlobal, False, iul_pImageStream) = 0 Then
			// Create bitmap from the data contained in the stream
			inv_win32.GdipLoadImageFromStream(iul_pImageStream, hBitMap)
		End If
	End If
End If

of_AutoFit()

//Create original copy for undo
inv_win32.GdipGetImageBounds(hBitMap, lstr_gRect, ll_Units)

inv_win32.GdipCloneBitmapArea(lstr_gRect.X,lstr_gRect.Y,lstr_gRect.Width,lstr_gRect.Height,0, hBitMap, hBitMap_orig)

imageeditorhist empty[]

ActionUndo = empty
ActionRedo = empty

ib_modified = FALSE

uo_1.SetRedraw(TRUE)

RETURN 1
end function

public function integer of_startclip ();IF ib_brightnessstarted THEN
	of_EndBrightness()
END IF
IF ib_contraststarted THEN
	of_EndContrast()
END IF

IF ib_clipstarted THEN
	ib_clipstarted = FALSE
	uo_cropactions.Hide()
	SetRedraw(TRUE)
ELSE
	Rect lstr_Rect
	Long ll_width, ll_height, ll_x, ll_y
	
	inv_win32.GetClientRect(Handle(uo_1), lstr_Rect)
	
	ll_width = Min(lstr_Rect.Right, ii_imagewidth)
	ll_height = Min(lstr_Rect.Bottom, ii_imageheight)
	ll_x = Max(ii_imagex, 0)
	ll_y = Max(ii_imagey, 0)
	
	lr_clipregion.Left = ll_x + (ll_width * .10)
	lr_clipregion.Right = ll_x + ll_width -  (ll_width * .10)
	lr_clipregion.Top = ll_y + (ll_height * .10)
	lr_clipregion.Bottom = ll_y + ll_height - (ll_height * .10)
	
	uo_cropactions.Show()
	
	ib_clipstarted = TRUE
	
	uo_1.SetRedraw(TRUE)
END IF

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

public function integer of_rotateleft ();RETURN of_RotateLeft(hBitMap)
end function

public function integer of_rotateright ();RETURN of_RotateRight(hBitMap)
end function

public function integer of_fliphorizontal ();RETURN of_FlipHorizontal(hbitmap)
end function

public function integer of_flipvertical ();RETURN of_flipVertical(hBitMap)
end function

private function integer of_drawbackground (longptr hdc);ULong ull_BackBrushColor
RECT rc
// determine control size
inv_win32.GetClientRect(Handle(THIS), rc)
// create a brush
//ull_BackBrushColor = inv_win32.CreateSolidBrush(RGB(207,207,207))
ull_BackBrushColor = inv_win32.CreateSolidBrush(ImageBackgroundColor)
// fill the background
inv_win32.FillRect(hdc, rc, ull_BackBrushColor)

inv_win32.DeleteObject(ull_BackBrushColor)

RETURN 1
end function

private function integer of_drawcrop (longptr lul_graphic);ULong lul_overlay
LongPtr ll_overlaybrush, lul_sizer, lul_handlebrush, lul_Pen
Int li_handlesizehalf

IF NOT ib_clipstarted THEN RETURN 0

//Create our brushes
lul_overlay = inv_win32.PBUSMakeARGB (100, 0, 0, 0)
inv_win32.GdipCreateSolidFill(lul_overlay, ll_overlaybrush)

//Create star cut outs
IF lul_croppath > 0 THEN
	inv_win32.GdipDeletePath(lul_croppath)
END IF

inv_win32.GdipCreatePath(0, lul_croppath)

inv_win32.GdipAddPathLineI(lul_croppath, lr_clipregion.Left, lr_clipregion.Top, lr_clipregion.Right,  lr_clipregion.Top)
inv_win32.GdipAddPathLineI(lul_croppath, lr_clipregion.Right,  lr_clipregion.Top, lr_clipregion.Right,  lr_clipregion.Bottom)
inv_win32.GdipAddPathLineI(lul_croppath, lr_clipregion.Right,  lr_clipregion.Bottom, lr_clipregion.Left,  lr_clipregion.Bottom)
inv_win32.GdipAddPathLineI(lul_croppath, lr_clipregion.Left,  lr_clipregion.Bottom, lr_clipregion.Left, lr_clipregion.Top)

//Setting the clip path so that our stars are not draw (punch out)
inv_win32.GdipSetClipPath(lul_graphic, lul_croppath, 4)

//Draw our overlay, the code above will cause this to dray everything but our stars
inv_win32.GdipFillRectangleI(lul_graphic, ll_overlaybrush,  ii_imagex, ii_imagey, ii_imagewidth, ii_imageheight)

lul_sizer = inv_win32.PBUSMakeARGB (255, 255, 106, 0)
inv_win32.GdipCreatePen1(lul_sizer,6, 2, lul_Pen)
inv_win32.GdipCreateSolidFill(lul_sizer, lul_handlebrush)


inv_win32.GdipDrawPath(lul_graphic, lul_Pen, lul_croppath);

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
end function

private function integer of_drawimage (longptr lul_graphic);LongPtr lul_Attribs
RECT lstr_Rect
RECTF lstr_gRect
Long ll_Units, ll_controlwidth, ll_controlheight, ll_width, ll_height
Double ld_factor, ld_xfactor, ld_yfactor
LongPtr l_hbitmap

IF hBitMap <= 0 THEN RETURN 0

SetNull(lul_Attribs)

IF ib_brightnessstarted OR ib_contraststarted THEN
	l_hbitmap = hBitMap_Brightness
ELSE
	l_hbitmap = hBitMap
END IF

inv_win32.GetClientRect(Handle(uo_1), lstr_Rect)
inv_win32.GdipSetInterpolationMode(lul_Graphic, 7)
inv_win32.GdipGetImageBounds(l_hbitmap, lstr_gRect, ll_Units)

ll_controlwidth = lstr_Rect.Right
ll_controlheight = lstr_Rect.Bottom
	
ll_Width  = lstr_gRect.Width
ll_Height = lstr_gRect.Height

IF AutoFit THEN

	IF ll_width > 0 THEN
		ld_xfactor = ll_controlwidth / ll_width
		ld_yfactor = ll_controlheight / ll_height
	END IF
	
	ld_factor = min(ld_xfactor, ld_yfactor)
	
	IF ld_factor < 1 THEN
		ii_imagewidth = ll_width * ld_factor
		ii_imageheight = ll_Height * ld_factor
	ELSE
		ld_factor = 1
		ii_imagewidth = ll_width
		ii_imageheight = ll_Height
	END IF
	
	ii_imagex = (ll_controlwidth - ii_imagewidth) / 2
	ii_imagey = (ll_controlheight - ii_imageheight) / 2
	
	ii_centerx = ll_Width / 2
	ii_centery = ll_Height / 2
	
	resizefactor = ld_factor
	
	htb_Zoom.of_SetCurrentValue(resizefactor * 100)
	st_zoom.Text = String(Integer(resizefactor * 100)) + "%"
ELSE
	
	ii_imagewidth = ll_width * resizefactor
	ii_imageheight = ll_Height * resizefactor
		
	IF ResizeFactor < 1 AND ii_imagewidth < ll_controlwidth AND ii_imageheight <  ll_controlheight THEN
		ii_imagex = (ll_controlwidth - ii_imagewidth) / 2
		ii_imagey = (ll_controlheight - ii_imageheight) / 2
	
		ii_centerx = ll_Width / 2
		ii_centery = ll_Height / 2
	ELSE
		
		ii_imagex = (ll_controlwidth - ii_imagewidth) * (ii_centerx / ll_Width)
		ii_imagey = (ll_controlheight - ii_imageheight)  * (ii_centery / ll_Height)
	
	END IF
	
END IF

//REMOVE!
inv_win32.GdipDrawImageRectRectI(lul_Graphic, l_hbitmap, &
					ii_imagex, ii_imagey, ii_imagewidth, ii_imageheight, &
					0, 0, lstr_gRect.Width, lstr_gRect.Height, &
					UnitPixel, lul_Attribs, 0, 0)
end function

private function clsid of_getclsid (long al_format);String ls_encoding
ULong ll_encodercount, ll_encodersize
clsid a_classid
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

RETURN a_classid

end function

private function boolean of_inbottomlefthandle (long xpos, long ypos);//find out if a tab was clicked
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

private function boolean of_inbottomrighthandle (long xpos, long ypos);//find out if a tab was clicked
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

private function boolean of_inclipregion (long xpos, long ypos);//find out if a tab was clicked
long ll_count, ll_index
ulong lul_rgn
integer lix, liy
int l_inside

lix = UnitsToPixels(xpos, XUnitsToPixels!)
liy = UnitsToPixels(ypos, YUnitsToPixels!)

IF lix > lr_clipregion.Left AND lix < lr_clipregion.Right AND liy > lr_clipregion.Top AND liy < lr_clipregion.BOTTOM THEN
	RETURN TRUE
END IF

RETURN FALSE
end function

private function boolean of_intoplefthandle (long xpos, long ypos);//find out if a tab was clicked
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

private function boolean of_intoprighthandle (long xpos, long ypos);//find out if a tab was clicked
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

public function integer of_acceptclip ();LongPtr hBitmap_copy
Rect lr_crop
Rect lstr_Rect
Long ll_width, ll_height, ll_x, ll_y

inv_win32.GetClientRect(Handle(uo_1), lstr_Rect)

lr_crop.Left = (lr_clipregion.Left - ii_imagex) / resizefactor
lr_crop.Right = (lr_clipregion.Right - lr_clipregion.Left) / resizefactor
lr_crop.Top = (lr_clipregion.Top - ii_imagey) / resizefactor
lr_crop.Bottom = (lr_clipregion.Bottom - lr_clipregion.Top ) / resizefactor

hBitmap_copy = of_Crop(hBitMap, lr_crop)

IF hBitMap > 0 THEN inv_win32.GdipDisposeImage(hBitMap)

hBitmap = hBitmap_copy

of_AutoFit()

of_EndClip()

RETURN 1
end function

public function integer of_saveasfile ();ULong ll_null
LongPtr hBitmap_copy, lul_bitmap
LongPtr newDC
LongPtr oldBitmap
clsid l_clsid
string ls_path, ls_file
int li_rc
string ls_currdir
		
ls_currdir = GetCurrentDirectory()

li_rc = GetFileSaveName ( inv_resourcemanager.of_GetString("LBL_Select_File"), &
	ls_path, ls_file, "PNG", &
	  + "PNG Files (*.PNG),*.png," &
	+ "JPG Files (*.JPG;*.JPEG),*.jpg;*.jpeg,"  & 
	+ "BMP Files (*.BMP),*.bmp,"  & 
	+ "GIF Files (*.GIF),*.gif"  & 
	, "", &
	8194)

ChangeDirectory(ls_currdir)
 
IF li_rc <> 1 THEN
	RETURN 0
END IF

of_SaveFile(ls_path)
	
RETURN 1
end function

public function integer of_savefile (string as_filename);ULong ll_encoder
clsid l_clsid

is_fullname = as_filename

IF Len(Trim(is_fullname)) = 0 THEN
	RETURN of_SaveAsFile()
END IF

SetNull(ll_encoder)

CHOOSE CASE Upper(Right(is_fullname, 4))
	CASE ".PNG"
		l_clsid = of_GetClsid(PNG2)
	CASE ".JPG", "JPEG"
		l_clsid = of_GetClsid(JPG2)
	CASE ".BMP"
		l_clsid = of_GetClsid(BMP2)
	CASE ".GIF"
		l_clsid = of_GetClsid(GIF2)
END CHOOSE

int li_return

IF Quality >= 0 AND Quality <= 100 THEN
	ll_encoder = inv_pbusexternal.PBUSGetEncoderStructRef(Quality)
END IF

li_return = inv_win32.GdipSaveImageToFile(hBitMap, is_fullname, l_clsid, ll_encoder) 

ib_modified = FALSE

Event SaveComplete(is_fullname, li_return)

RETURN li_return
end function

public function integer of_loadfromclipboard ();LongPtr clipBoardHBitmap
CONSTANT Int CF_BITMAP = 2
CONSTANT Int CF_DIB = 8
CONSTANT Int CF_ENHMETAFILE = 14

inv_win32.OpenClipboard(Handle(THIS))

IF inv_win32.IsClipboardFormatAvailable(CF_BITMAP) THEN
	clipBoardHBitmap = inv_win32.GetClipboardData(CF_BITMAP)
ELSEIF inv_win32.IsClipboardFormatAvailable(CF_DIB) THEN
	clipBoardHBitmap = inv_win32.GetClipboardData(CF_DIB)
ELSE
	inv_win32.CloseClipboard()
	
	RETURN 0
END IF

IF hBitMap > 0 THEN
	inv_win32.GdipDisposeImage(hBitMap)
	hBitMap = 0
END IF
IF hBitMap_orig > 0 THEN
	inv_win32.GdipDisposeImage(hBitMap_orig)
	hBitMap_orig = 0
END IF
IF iul_pGlobalBuffer > 0 THEN
	inv_win32.GlobalUnlock(iul_pGlobalBuffer)
	iul_pGlobalBuffer = 0
END IF
IF iul_hGlobal > 0 THEN
	inv_win32.GlobalFree(iul_hGlobal)
	iul_hGlobal = 0
END IF

of_AutoFit()

inv_win32.GdipCreateBitmapFromHBITMAP(clipBoardHBitmap, 0, hBitMap)
inv_win32.GdipCreateBitmapFromHBITMAP(clipBoardHBitmap, 0, hBitMap_orig)

inv_win32.CloseClipboard()

imageeditorhist empty[]

ActionUndo = empty
ActionRedo = empty

ib_modified = FALSE

uo_1.SetRedraw(TRUE)

RETURN 1
end function

private function integer of_rotateright (longptr ahbitmap);IF ahbitmap > 0 THEN
	inv_win32.GdipImageRotateFlip(ahbitmap, Rotate90FlipNone)
	
	of_AddUndo(RotateRight)
	
	of_AutoFit()
	
	IF ib_trackundo THEN uo_1.SetRedraw(TRUE)
END IF

RETURN 1
end function

private function integer of_rotateleft (longptr ahbitmap);IF ahBitMap > 0 THEN
	inv_win32.GdipImageRotateFlip(ahBitMap, Rotate270FlipNone)
	
	of_AddUndo(RotateLeft)
	
	of_AutoFit()
	
	IF ib_trackundo THEN uo_1.SetRedraw(TRUE)
END IF

RETURN 1
end function

private function integer of_flipvertical (longptr ahbitmap);IF ahBitMap > 0 THEN
	inv_win32.GdipImageRotateFlip(ahBitMap, RotateNoneFlipX)
	
	of_AddUndo(FlipVertical)
	
	IF ib_trackundo THEN uo_1.SetRedraw(TRUE)
END IF

RETURN 1
end function

private function integer of_fliphorizontal (longptr ahbitmap);IF ahbitmap > 0 THEN
	inv_win32.GdipImageRotateFlip(ahbitmap, RotateNoneFlipY)
	
	of_AddUndo(FlipHorizontal)
	
	IF ib_trackundo THEN uo_1.SetRedraw(TRUE)
END IF

RETURN 1
end function

private function longptr of_crop (longptr ahbitmap, rect cropregion);LongPtr hBitmap_copy

inv_win32.GdipCloneBitmapAreaI(cropregion.Left, &
                                                cropregion.Top, &
						                     cropregion.Right, &
										   cropregion.Bottom,&
											0,ahbitmap, hBitmap_copy)

of_AddUndo(Crop, cropregion)

RETURN hBitmap_copy
end function

private function integer of_addundo (integer ai_action);imageeditorhist empty[]
imageeditorhist lstr_action

IF NOT ib_trackundo THEN RETURN 0

lstr_action.Action = ai_action
ActionUndo[UpperBound(ActionUndo) + 1 ] = lstr_action

ActionRedo = empty

ib_modified = TRUE

RETURN 1
end function

private function integer of_addundo (integer ai_action, rect ai_crop);imageeditorhist empty[]
imageeditorhist lstr_action

IF NOT ib_trackundo THEN RETURN 0

lstr_action.Action = ai_action
lstr_action.CropRegion =  ai_crop
ActionUndo[UpperBound(ActionUndo) + 1 ] = lstr_action

ActionRedo = empty

ib_modified = TRUE

RETURN 1
end function

public function integer of_undo ();RECTF lstr_gRect
Long ll_Units
LongPtr hBitMap_Copy, hCropped
ImageEditorHist lastUndo
ImageEditorHist newList[]
Long ll_index, ll_count

IF hBitMap <= 0 THEN RETURN 0
IF UpperBound(ActionUndo) <= 0 THEN RETURN 0

ib_trackundo = FALSE

inv_win32.GdipGetImageBounds(hBitMap_Orig, lstr_gRect, ll_Units)
inv_win32.GdipCloneBitmapArea(lstr_gRect.X,lstr_gRect.Y,lstr_gRect.Width,lstr_gRect.Height,0, hBitMap_Orig, hBitMap_Copy)

lastUndo = ActionUndo[UpperBound(ActionUndo)]
ActionRedo[UpperBound(ActionRedo) + 1] = lastUndo

ll_count = UpperBound(ActionUndo) - 1

FOR ll_index = 1 TO ll_count
	
	CHOOSE CASE ActionUndo[ll_index].Action
		CASE FlipHorizontal
			of_FlipHorizontal(hBitMap_Copy)
		CASE FlipVertical
			of_FlipVertical(hBitMap_Copy)
		CASE RotateLeft
			of_RotateLeft(hBitMap_Copy)
		CASE RotateRight
			of_RotateRight(hBitMap_Copy)
		CASE Crop
			hCropped = of_Crop(hBitMap_Copy, ActionUndo[ll_index].CropRegion)
			
			IF hBitMap_Copy > 0 THEN inv_win32.GdipDisposeImage(hBitMap_Copy)
			
			hBitMap_Copy = hCropped
		CASE InvertColors
			of_InvertColors(hBitMap_Copy)
		CASE GreyScale
			of_GreyScale(hBitMap_Copy)
		CASE Sepia
			of_Sepia(hBitMap_Copy)
		CASE BlackAndWhite
			of_BlackAndWhite(hBitMap_Copy)
		CASE Brightness
			of_Brightness(hBitMap_Copy, ActionUndo[ll_index].IntValue)
		CASE Contrast
			of_Contrast(hBitMap_Copy, ActionUndo[ll_index].IntValue)
		CASE ImageResize
			of_ResizeImage(ActionUndo[ll_index].ScaleValues.rw, ActionUndo[ll_index].ScaleValues.rh, ActionUndo[ll_index].ScaleValues.bpercent)
	END CHOOSE
	
	newList[ll_index] = ActionUndo[ll_index]
	
NEXT

IF hBitMap > 0 THEN inv_win32.GdipDisposeImage(hBitMap)

hBitMap = hBitMap_Copy

ActionUndo = newList

ib_trackundo = TRUE

uo_1.SetRedraw(TRUE)

RETURN 1
end function

public function integer of_redo ();RECTF lstr_gRect
Long ll_Units
LongPtr hBitMap_Copy, hCropped
ImageEditorHist lastUndo
ImageEditorHist newList[]
Long ll_index, ll_count

IF hBitMap <= 0 THEN RETURN 0
IF UpperBound(ActionRedo) <= 0 THEN RETURN 0

ib_trackundo = FALSE

lastUndo = ActionRedo[UpperBound(ActionRedo)]
ActionUndo[UpperBound(ActionUndo) + 1] = lastUndo

CHOOSE CASE lastUndo.Action
	CASE FlipHorizontal
		of_FlipHorizontal(hBitMap)
	CASE FlipVertical
		of_FlipVertical(hBitMap)
	CASE RotateLeft
		of_RotateLeft(hBitMap)
	CASE RotateRight
		of_RotateRight(hBitMap)
	CASE Crop
		hCropped = of_Crop(hBitMap, lastUndo.CropRegion)
		
		IF hBitMap > 0 THEN inv_win32.GdipDisposeImage(hBitMap)
		
		hBitMap = hCropped
	CASE GreyScale
		of_GreyScale(hBitMap)
	CASE InvertColors
		of_InvertColors(hBitMap)
	CASE Sepia
		of_Sepia(hBitMap)
	CASE BlackAndWhite
		of_BlackAndWhite(hBitMap)
	CASE Brightness
			of_Brightness(hBitMap, lastUndo.IntValue)
	CASE Contrast
		of_Contrast(hBitMap, lastUndo.IntValue)
	CASE ImageResize
		of_ResizeImage(lastUndo.ScaleValues.rw, lastUndo.ScaleValues.rh, lastUndo.ScaleValues.bpercent)
END CHOOSE

ll_count = UpperBound(ActionRedo) - 1

FOR ll_index = 1 TO ll_count
	newList[ll_index] = ActionRedo[ll_index]
NEXT

ActionRedo = newList

ib_trackundo = TRUE

uo_1.SetRedraw(TRUE)

RETURN 1
end function

public function integer of_greyscale ();RETURN of_GreyScale(hbitmap)
end function

private function integer of_greyscale (longptr ahbitmap);Real ColorMatix[5, 5]

IF ahBitMap <= 0 THEN RETURN 0

ColorMatix[1,1] = 0.299
ColorMatix[1,2] = 0.587
ColorMatix[1,3] = 0.114
ColorMatix[1,4] = 0
ColorMatix[1,5] = 0
ColorMatix[2,1] = 0.299
ColorMatix[2,2] = 0.587
ColorMatix[2,3] = 0.114
ColorMatix[2,4] = 0
ColorMatix[2,5] = 0
ColorMatix[3,1] = 0.299
ColorMatix[3,2] = 0.587
ColorMatix[3,3] = 0.114
ColorMatix[3,4] = 0
ColorMatix[3,5] = 0
ColorMatix[4,1] = 0
ColorMatix[4,2] = 0
ColorMatix[4,3] = 0
ColorMatix[4,4] = 1
ColorMatix[4,5] = 0
ColorMatix[5,1] = 0
ColorMatix[5,2] = 0
ColorMatix[5,3] = 0
ColorMatix[5,4] = 0
ColorMatix[5,5] = 1

of_AddUndo(GreyScale)

RETURN of_TransformColor(ahbitmap, ColorMatix)
end function

private function integer of_transformcolor (longptr ahbitmap, real colormatix[5, 5]);RECTF lstr_gRect
Long ll_Units
LongPtr hBitMap_Copy, lul_graphics, lul_attributes, lul_colormatrix, lul_null
ULong ll_null

IF hBitMap <= 0 THEN RETURN 0

SetNull(ll_null)
SetNull(lul_null)

inv_win32.GdipGetImageBounds(ahbitmap, lstr_gRect, ll_Units)
inv_win32.GdipGetImageGraphicsContext(ahbitmap, lul_graphics)
inv_win32.GdipCreateImageAttributes(lul_attributes)
inv_win32.GdipSetImageAttributesColorMatrix (lul_attributes, 0, 1,ColorMatix, lul_null, 0)
inv_win32.GdipDrawImageRectRect (lul_graphics, ahbitmap,0,0,Int(lstr_gRect.Width),Int(lstr_gRect.Height),0,0,Int(lstr_gRect.Width),Int(lstr_gRect.Height),2, lul_attributes, ll_null, 0)

//Cleanup
inv_win32.GdipDisposeImageAttributes(lul_attributes)
inv_win32.GdipDeleteGraphics(lul_graphics)

IF ib_trackundo THEN uo_1.SetRedraw(TRUE)

RETURN 1
end function

private function integer of_invertcolors (longptr ahbitmap);Real ColorMatix[5, 5]

IF ahBitMap <= 0 THEN RETURN 0
									
									 
ColorMatix[1,1] = -1
ColorMatix[1,2] = 0
ColorMatix[1,3] = 0
ColorMatix[1,4] = 0
ColorMatix[1,5] = 1

ColorMatix[2,1] = 0
ColorMatix[2,2] = -1
ColorMatix[2,3] = 0
ColorMatix[2,4] = 0
ColorMatix[2,5] = 1

ColorMatix[3,1] = 0
ColorMatix[3,2] = 0
ColorMatix[3,3] = -1
ColorMatix[3,4] = 0
ColorMatix[3,5] = 1

ColorMatix[4,1] = 0
ColorMatix[4,2] = 0
ColorMatix[4,3] = 0
ColorMatix[4,4] = 1
ColorMatix[4,5] = 0

ColorMatix[5,1] = 0
ColorMatix[5,2] = 0
ColorMatix[5,3] = 0
ColorMatix[5,4] = 0
ColorMatix[5,5] = 1

of_AddUndo(InvertColors)

RETURN of_TransformColor(ahbitmap, ColorMatix)
end function

public function integer of_invertcolors ();RETURN of_InvertColors(hbitmap)
end function

public function integer of_sepia ();RETURN of_Sepia(hbitmap)
end function

private function integer of_sepia (longptr ahbitmap);Real ColorMatix[5, 5]

IF ahBitMap <= 0 THEN RETURN 0

ColorMatix[1,1] = 0.393
ColorMatix[1,2] = 0.769
ColorMatix[1,3] = 0.189
ColorMatix[1,4] = 0
ColorMatix[1,5] = 0

ColorMatix[2,1] = 0.349
ColorMatix[2,2] = 0.686
ColorMatix[2,3] = 0.168
ColorMatix[2,4] = 0
ColorMatix[2,5] = 0

ColorMatix[3,1] = 0.272
ColorMatix[3,2] = 0.534
ColorMatix[3,3] = 0.131
ColorMatix[3,4] = 0
ColorMatix[3,5] = 0

ColorMatix[4,1] = 0
ColorMatix[4,2] = 0
ColorMatix[4,3] = 0
ColorMatix[4,4] = 1
ColorMatix[4,5] = 0

ColorMatix[5,1] = 0
ColorMatix[5,2] = 0
ColorMatix[5,3] = 0
ColorMatix[5,4] = 0
ColorMatix[5,5] = 1

of_AddUndo(Sepia)

RETURN of_TransformColor(ahbitmap, ColorMatix)
end function

private function integer of_blackandwhite (longptr ahbitmap);Real ColorMatix[5, 5]

IF ahBitMap <= 0 THEN RETURN 0

ColorMatix[1,1] = 1.5
ColorMatix[1,2] = 1.5
ColorMatix[1,3] =1.5
ColorMatix[1,4] = 0
ColorMatix[1,5] = -1

ColorMatix[2,1] = 1.5
ColorMatix[2,2] = 1.5
ColorMatix[2,3] = 1.5
ColorMatix[2,4] = 0
ColorMatix[2,5] = -1

ColorMatix[3,1] = 1.5
ColorMatix[3,2] = 1.5
ColorMatix[3,3] = 1.5
ColorMatix[3,4] = 0
ColorMatix[3,5] = -1

ColorMatix[4,1] = 0
ColorMatix[4,2] = 0
ColorMatix[4,3] = 0
ColorMatix[4,4] = 1
ColorMatix[4,5] = 0

ColorMatix[5,1] = 0
ColorMatix[5,2] = 0
ColorMatix[5,3] = 0
ColorMatix[5,4] = 0
ColorMatix[5,5] = 1

of_AddUndo(BlackAndWhite)

RETURN of_TransformColor(ahbitmap, ColorMatix)
end function

public function integer of_blackandwhite ();RETURN of_BlackAndWhite(hbitmap)
end function

public function integer of_startbrightness ();rectf lstr_gRect
Long ll_Units

IF ib_brightnessstarted THEN RETURN 0

IF ib_clipstarted THEN
	of_EndClip()
END IF

IF ib_contraststarted THEN
	of_EndContrast()
END IF


ib_trackundo = FALSE

uo_brightness.Show()
htb_brightness.Show()

htb_brightness.of_SetCurrentValue(100)

ib_brightnessstarted = TRUE

of_CreateBrightnessImage(hBitMap)

RETURN 1
end function

public function integer of_brightness (integer ai_brightness);RETURN of_Brightness(hbitmap, ai_brightness)
end function

private function integer of_createbrightnessimage (longptr ahbitmap);RectF lstr_gRect
Long ll_Units

IF hBitMap_Brightness > 0 THEN
	inv_win32.GdipDisposeImage(hBitMap_Brightness)
	hBitMap_Brightness = 0
END IF

inv_win32.GdipGetImageBounds(ahbitmap, lstr_gRect, ll_Units)
inv_win32.GdipCloneBitmapArea(lstr_gRect.X,lstr_gRect.Y,lstr_gRect.Width,lstr_gRect.Height,0, ahbitmap, hBitMap_Brightness)

RETURN 1
end function

private function integer of_brightness (longptr ahbitmap, integer ai_brightness);Real ColorMatix[5, 5]
Double ld_brightness
IF ahBitMap <= 0 THEN RETURN 0

ld_brightness =  (Double(ai_brightness) / 100.00)

ColorMatix[1,1] = 1
ColorMatix[1,2] = 0
ColorMatix[1,3] = 0
ColorMatix[1,4] = 0
ColorMatix[1,5] = ld_brightness

ColorMatix[2,1] = 0
ColorMatix[2,2] = 1
ColorMatix[2,3] = 0
ColorMatix[2,4] = 0
ColorMatix[2,5] = ld_brightness

ColorMatix[3,1] = 0
ColorMatix[3,2] = 0
ColorMatix[3,3] = 1
ColorMatix[3,4] = 0
ColorMatix[3,5] =ld_brightness

ColorMatix[4,1] = 0
ColorMatix[4,2] = 0
ColorMatix[4,3] = 0
ColorMatix[4,4] = 1
ColorMatix[4,5] = 0

ColorMatix[5,1] = 0
ColorMatix[5,2] = 0
ColorMatix[5,3] = 0
ColorMatix[5,4] = 0
ColorMatix[5,5] = 1

of_AddUndo(Brightness, ai_brightness)

RETURN of_TransformColor(ahbitmap, ColorMatix)
end function

private function integer of_adjustbrightness (integer ai_brightness);of_CreateBrightnessImage(hBitMap)

of_Brightness(hBitMap_Brightness, ai_brightness)

uo_1.SetRedraw(TRUE)

RETURN 1
end function

private function integer of_addundo (integer ai_action, integer ai_value);imageeditorhist empty[]
imageeditorhist lstr_action

IF NOT ib_trackundo THEN RETURN 0

lstr_action.Action = ai_action
lstr_action.IntValue =  ai_value
ActionUndo[UpperBound(ActionUndo) + 1 ] = lstr_action

ActionRedo = empty

ib_modified = TRUE

RETURN 1
end function

private function integer of_contrast (longptr ahbitmap, integer ai_contrast);Real ColorMatix[5, 5]
Double ld_brightness
Double ld_contrast

IF ahBitMap <= 0 THEN RETURN 0

IF ai_contrast = 0 THEN
	ai_contrast = 1
ELSEIF ai_contrast > 0 THEN
	ld_contrast =  1.0 + (Double(ai_contrast) / 100.00)
ELSE
	ld_contrast =   (Double(Abs(ai_contrast)) / 100.00)
END IF


ld_brightness = (1.0 - ld_contrast) / 2.0

ColorMatix[1,1] = ld_contrast
ColorMatix[1,2] = 0
ColorMatix[1,3] = 0
ColorMatix[1,4] = 0
ColorMatix[1,5] = ld_brightness

ColorMatix[2,1] = 0
ColorMatix[2,2] = ld_contrast
ColorMatix[2,3] = 0
ColorMatix[2,4] = 0
ColorMatix[2,5] = ld_brightness

ColorMatix[3,1] = 0
ColorMatix[3,2] = 0
ColorMatix[3,3] = ld_contrast
ColorMatix[3,4] = 0
ColorMatix[3,5] = ld_brightness

ColorMatix[4,1] = 0
ColorMatix[4,2] = 0
ColorMatix[4,3] = 0
ColorMatix[4,4] = 1
ColorMatix[4,5] = 0

ColorMatix[5,1] = 0
ColorMatix[5,2] = 0
ColorMatix[5,3] = 0
ColorMatix[5,4] = 0
ColorMatix[5,5] = 1

of_AddUndo(Contrast, ai_contrast)

RETURN of_TransformColor(ahbitmap, ColorMatix)
end function

public function integer of_contrast (integer ai_contrast);RETURN of_Contrast(hbitmap, ai_contrast)
end function

private function integer of_acceptbrightness ();ib_trackundo = TRUE
ib_brightnessstarted = FALSE

uo_brightness.Hide()
htb_brightness.Hide()

of_Brightness(hbitmap, htb_brightness.CurrentValue - 100)

IF hBitMap_Brightness > 0 THEN
	inv_win32.GdipDisposeImage(hBitMap_Brightness)
	hBitMap_Brightness = 0
END IF

uo_1.SetRedraw(TRUE)

RETURN 1
end function

private function integer of_acceptcontrast ();ib_trackundo = TRUE
ib_contraststarted = FALSE

uo_brightness.Hide()
htb_brightness.Hide()

of_Contrast(hbitmap, htb_brightness.CurrentValue - 100)

IF hBitMap_Brightness > 0 THEN
	inv_win32.GdipDisposeImage(hBitMap_Brightness)
	hBitMap_Brightness = 0
END IF

uo_1.SetRedraw(TRUE)

RETURN 1
end function

private function integer of_adjustcontrast (integer ai_contrast);of_CreateBrightnessImage(hBitMap)

of_Contrast(hBitMap_Brightness, ai_contrast)

uo_1.SetRedraw(TRUE)

RETURN 1
end function

private function integer of_endbrightness ();ib_trackundo = TRUE
ib_brightnessstarted = FALSE

uo_brightness.Hide()
htb_brightness.Hide()

IF hBitMap_Brightness > 0 THEN
	inv_win32.GdipDisposeImage(hBitMap_Brightness)
	hBitMap_Brightness = 0
END IF

uo_1.SetRedraw(TRUE)

RETURN 1
end function

private function integer of_endcontrast ();ib_trackundo = TRUE
ib_contraststarted = FALSE

uo_brightness.Hide()
htb_brightness.Hide()

IF hBitMap_Brightness > 0 THEN
	inv_win32.GdipDisposeImage(hBitMap_Brightness)
	hBitMap_Brightness = 0
END IF

uo_1.SetRedraw(TRUE)

RETURN 1
end function

public function integer of_startcontrast ();rectf lstr_gRect
Long ll_Units

IF ib_contraststarted THEN RETURN 0

IF ib_clipstarted THEN
	of_EndClip()
END IF

IF ib_brightnessstarted THEN
	of_EndBrightness()
END IF

ib_trackundo = FALSE

uo_brightness.Show()
htb_brightness.Show()

htb_brightness.of_SetCurrentValue(100)

ib_contraststarted = TRUE

of_CreateBrightnessImage(hBitMap)

RETURN 1
end function

public function integer of_autofit ();AutoFit = TRUE
uo_autofit.of_SetValue(TRUE)
htb_zoom.of_Enabled(FALSE)
uo_zoom.of_SetEnabled(inv_resourcemanager.of_GetString(ZoomInText), FALSE)
uo_zoom.of_SetEnabled(inv_resourcemanager.of_GetString(ZoomOutText), FALSE)

RETURN 1
end function

public function integer of_displayactionbuttons (boolean ab_switch);IF ab_switch THEN
	uo_actions.Show()
	uo_tools.Show()
	r_top.Show()
	
	uo_1.Y = 160
ELSE
	uo_actions.Hide()
	uo_tools.Hide()
	r_top.Hide()
	
	uo_1.Y = 0
END IF

Trigger Event Resize(1, Width,Height)

RETURN 1
end function

public function integer of_displayzoombuttons (boolean ab_switch);IF ab_switch THEN
	uo_zoom.Show()
	htb_zoom.Show()
	uo_autofit.Show()
	st_zoom.Show()
	r_bottom.Show()	
ELSE
	uo_zoom.Hide()
	htb_zoom.Hide()
	uo_autofit.Hide()
	st_zoom.Hide()
	r_bottom.Hide()
END IF

Trigger Event Resize(1, Width,Height)

RETURN 1
end function

public function integer of_updateui ();Int li_savegroup
Int li_effectsgroup

message l_message

l_message = CREATE Message
l_message.Handle = Message.Handle
l_message.Number = Message.Number
l_message.WordParm = Message.WordParm
l_message.LongParm = Message.LongParm
l_message.DoubleParm = Message.DoubleParm
l_message.StringParm = Message.StringParm
l_message.PowerObjectParm = Message.PowerObjectParm
l_message.Processed = Message.Processed
l_message.ReturnValue = Message.ReturnValue

uo_actions.of_Reset()
uo_tools.of_Reset()
uo_brightness.of_Reset()
uo_cropactions.of_Reset()
uo_zoom.of_Reset()

uo_actions.of_AddItem(inv_resourcemanager.of_GetString(LoadFromFileText), LoadFromFileImage)
li_savegroup = uo_actions.of_AddGroup(inv_resourcemanager.of_GetString(SaveText), SaveImage)
uo_actions.of_AddSeparator()
uo_actions.of_AddItem(inv_resourcemanager.of_GetString(PasteFromClipboardText), PasteFromClipboardImage)
uo_actions.of_AddItem(inv_resourcemanager.of_GetString(CopyText), CopyImage)
uo_actions.of_DisplayText(li_savegroup, FALSE)
uo_actions.of_AssignItemToGroup(li_savegroup,uo_actions.of_AddItem(inv_resourcemanager.of_GetString(SaveText), SaveImage))
uo_actions.of_AssignItemToGroup(li_savegroup,uo_actions.of_AddItem(inv_resourcemanager.of_GetString(SaveAsText), SaveAsImage))
uo_actions.of_AddSeparator()
uo_actions.of_AddItem(inv_resourcemanager.of_GetString(PrintText), PrintImage)
uo_actions.of_AddSeparator()
uo_actions.of_AddItem(inv_resourcemanager.of_GetString(UndoText), UndoImage)
uo_actions.of_AddItem(inv_resourcemanager.of_GetString(RedoText), RedoImage)
uo_actions.of_AddSeparator()

uo_tools.of_AddItem(inv_resourcemanager.of_GetString(RotateLeftText), RotateLeftImage)
uo_tools.of_AddItem(inv_resourcemanager.of_GetString(RotateRightText), RotateRightImage)
uo_tools.of_AddItem(inv_resourcemanager.of_GetString(FlipHorizontalText), FlipHorizontalImage)
uo_tools.of_AddItem(inv_resourcemanager.of_GetString(FlipVerticalText), FlipVerticalImage)
uo_tools.of_AddSeparator()
uo_tools.of_AddItem(inv_resourcemanager.of_GetString(ResizeImageText), ResizeImage)
uo_tools.of_AddItem(inv_resourcemanager.of_GetString(CropText), CropImage)
uo_tools.of_AddSeparator()

li_effectsgroup = uo_tools.of_AddGroup(inv_resourcemanager.of_GetString(EffectsText), EffectsImage)
uo_tools.of_DisplayText(li_effectsgroup, FALSE)
uo_tools.of_AssignItemToGroup(li_effectsgroup, uo_tools.of_AddItem(inv_resourcemanager.of_GetString(BlackAndWhiteText), BlackAndWhiteImage))
uo_tools.of_AssignItemToGroup(li_effectsgroup, uo_tools.of_AddItem(inv_resourcemanager.of_GetString(BrightnessText), BrightnessImage))
uo_tools.of_AssignItemToGroup(li_effectsgroup, uo_tools.of_AddItem(inv_resourcemanager.of_GetString(ContrastText), ContrastImage))
uo_tools.of_AssignItemToGroup(li_effectsgroup, uo_tools.of_AddItem(inv_resourcemanager.of_GetString(GreyScaleText), GreyScaleImage))
uo_tools.of_AssignItemToGroup(li_effectsgroup, uo_tools.of_AddItem(inv_resourcemanager.of_GetString(InvertColorsText), InvertColorsImage))
uo_tools.of_AssignItemToGroup(li_effectsgroup, uo_tools.of_AddItem(inv_resourcemanager.of_GetString(SepiaText), SepiaImage))

uo_tools.Width = uo_tools.Width - (24 * 6)

uo_cropactions.of_AddItem(inv_resourcemanager.of_GetString(AcceptText), AcceptImage)
uo_cropactions.of_AddItem(inv_resourcemanager.of_GetString(CancelText), CancelImage)

uo_brightness.of_AddObject("", htb_brightness)
uo_brightness.of_AddItem(inv_resourcemanager.of_GetString(AcceptText), AcceptImage)
uo_brightness.of_AddItem(inv_resourcemanager.of_GetString(CancelText), CancelImage)

uo_zoom.of_AddObject(inv_resourcemanager.of_GetString(AutoFitText), uo_autofit)
uo_zoom.of_AddItem(inv_resourcemanager.of_GetString(ZoomOutText), ZoomOutImage)
uo_zoom.of_AddObject("", htb_zoom)
uo_zoom.of_AddItem(inv_resourcemanager.of_GetString(ZoomInText), ZoomInImage)
uo_zoom.of_AddObject("", st_zoom)

	
Message.Handle = l_message.Handle
Message.Number = l_message.Number
Message.WordParm = l_message.WordParm
Message.LongParm = l_message.LongParm
Message.DoubleParm = l_message.DoubleParm
Message.StringParm = l_message.StringParm
Message.PowerObjectParm = l_message.PowerObjectParm
Message.Processed = l_message.Processed
Message.ReturnValue = l_message.ReturnValue

RETURN 1
end function

public function integer of_settheme (string as_theme);Long li_color
Long li_textcolor

IF Pos(Lower(as_theme), "dark", 1) > 0 OR Pos(Lower(as_theme), "black", 1) > 0 THEN
	li_color = RGB(54,54,54)
	li_textcolor = RGB(255,255,255)
ELSE
	li_color = RGB(245,245,245)
END IF

uo_zoom.of_DisplaySolidBackground(TRUE)
uo_actions.of_DisplaySolidBackground(TRUE)
uo_tools.of_DisplaySolidBackground(TRUE)

uo_Brightness.of_SetTheme(as_theme)
uo_actions.of_SetTheme(as_theme)
uo_tools.of_SetTheme(as_theme)
uo_cropactions.of_SetTheme(as_theme)
uo_zoom.of_SetTheme(as_theme)

st_zoom.BackColor = li_color
htb_zoom.BackColor = li_color
uo_autofit.BackColor = li_color
uo_zoom.of_SetBackColor(li_color)
uo_actions.of_SetBackColor(li_color)
uo_tools.of_SetBackColor(li_color)

st_zoom.TextColor = li_textcolor
uo_zoom.of_SetFontColor(li_textcolor)

r_bottom.FillColor = li_color
r_top.FillColor = li_color

r_bottom.LineColor = RGB(200,200,200)
r_top.LineColor = RGB(200,200,200)

THIS.BackColor = li_color

RETURN 1
end function

public function integer of_endclip ();ib_clipstarted = FALSE

uo_cropactions.Hide()

uo_1.SetRedraw(TRUE)

RETURN 1
end function

public function integer of_copy ();LongPtr clipBoardHBitmap
LongPtr newBitmap
CONSTANT Int CF_BITMAP = 2

inv_win32.OpenClipboard(Handle(THIS))

inv_win32.EmptyClipboard()

inv_win32.GdipCreateHBITMAPFromBitmap(hBitMap, clipBoardHBitmap, 0)

newBitmap = inv_win32.CopyImage(clipBoardHBitmap,0,0,0,12)

inv_win32.SetClipboardData(CF_BITMAP, newBitmap)

inv_win32.DeleteObject(clipBoardHBitmap)

inv_win32.CloseClipboard()

RETURN 1
end function

public function boolean of_ismodified ();RETURN ib_modified
end function

public function integer of_resizeimage (real ar_wpercent, real ar_hpercent);RETURN of_ResizeImage(ar_wpercent, ar_hpercent, TRUE)
end function

public function integer of_resizeimage (real ar_percent);RETURN of_ResizeImage(ar_percent, ar_percent)
end function

public function integer of_resizeimage (real ar_width, real ar_height, boolean ab_percent);LongPtr lul_graphics
RectF lstr_gRect
LongPtr lul_attributes, lul_newbitmap
Long ll_null, ll_Units
Real lr_wratio, lr_hratio
ImageEditorHistScale lstr_scalevalues

SetNull(ll_null)
SetNull(lul_attributes)

inv_win32.GdipGetImageBounds(hbitmap, lstr_gRect, ll_Units)

IF ab_percent THEN
	lr_wratio =  ar_width / 100.00
	lr_hratio = ar_height / 100.00
ELSE
	lr_wratio =  ar_width / lstr_gRect.Width
	lr_hratio = ar_height / lstr_gRect.Height
END IF

inv_win32.GdipGetImageGraphicsContext(hbitmap, lul_graphics)
inv_win32.GdipScaleWorldTransform(lul_graphics, lr_wratio, lr_hratio, 0);

inv_win32.GdipCreateBitmapFromGraphics(Int(lstr_gRect.Width * (lr_wratio)), &
                                                               Int(lstr_gRect.Height * (lr_hratio)), lul_graphics,lul_newbitmap)

inv_win32.GdipDeleteGraphics(lul_graphics)
inv_win32.GdipGetImageGraphicsContext(lul_newbitmap, lul_graphics)

inv_win32.GdipDrawImageRectRect (lul_graphics, hbitmap,0,0,Int(lstr_gRect.Width * (lr_wratio)),&
                                                                                          Int(lstr_gRect.Height * (lr_hratio)), 0,0,&
																	              Int(lstr_gRect.Width), &
																			     Int(lstr_gRect.Height),2, lul_attributes, ll_null, 0)
																				  

IF hBitMap > 0 THEN inv_win32.GdipDisposeImage(hBitMap)
																				  
hbitmap = lul_newbitmap

inv_win32.GdipDeleteGraphics(lul_graphics)

lstr_scalevalues.rw = ar_width
lstr_scalevalues.rh = ar_height
lstr_scalevalues.bpercent = ab_percent

of_AddUndo(ImageResize, lstr_scalevalues)

IF NOT AutoFit THEN
	inv_win32.GdipGetImageBounds(hBitMap, lstr_gRect, ll_Units)

	ii_centerx =  lstr_gRect.Width / 2
	ii_centery = lstr_gRect.Height / 2
END IF

IF ib_trackundo THEN uo_1.SetRedraw(TRUE)
	
RETURN 1
end function

private function integer of_addundo (integer ai_action, imageeditorhistscale ai_scalevalues);imageeditorhist empty[]
imageeditorhist lstr_action

IF NOT ib_trackundo THEN RETURN 0

lstr_action.Action = ai_action
lstr_action.ScaleValues =  ai_scalevalues
ActionUndo[UpperBound(ActionUndo) + 1 ] = lstr_action

ActionRedo = empty
ib_modified = TRUE

RETURN 1
end function

public function rectf of_getimagesize (long a_unit);RectF lstr_gRect

inv_win32.GdipGetImageBounds(hbitmap, lstr_gRect, a_unit)

RETURN lstr_gRect
end function

public function rectf of_getimagesize ();RETURN of_GetImageSize(UnitPixel)
end function

public function integer of_undoall ();ImageEditorHist newList[]

IF hBitMap <= 0 THEN RETURN 0
IF UpperBound(ActionUndo) <= 0 THEN RETURN 0

hBitMap = hBitMap_Orig

ActionUndo = newList
ActionRedo = newList

ib_modified = FALSE

uo_1.SetRedraw(TRUE)

RETURN 1
end function

public function integer of_print ();String ls_filename
Long ll_encoder
clsid l_clsid
n_cst_pbus_filesys lnv_filesys

SetNull(ll_encoder)

IF hBitMap = 0 THEN RETURN -1

IF Len(Trim(is_fullname)) > 0 THEN
	ls_filename = lnv_filesys.of_GetTempPath() + 'uspb_imageeditor.' + Right(is_fullName, Len(is_fullname) - LastPos ( is_fullname, "."))
ELSE
	ls_filename = lnv_filesys.of_GetTempPath() + 'uspb_imageeditor.bmp'
END IF

CHOOSE CASE Upper(Right(ls_filename, 4))
	CASE ".PNG"
		l_clsid = of_GetClsid(PNG2)
	CASE ".JPG", "JPEG"
		l_clsid = of_GetClsid(JPG2)
	CASE ".BMP"
		l_clsid = of_GetClsid(BMP2)
	CASE ".GIF"
		l_clsid = of_GetClsid(GIF2)
END CHOOSE

int li_return

IF Quality >= 0 AND Quality <= 100 THEN
	ll_encoder = inv_pbusexternal.PBUSGetEncoderStructRef(Quality)
END IF

li_return = inv_win32.GdipSaveImageToFile(hBitMap, ls_filename, l_clsid, ll_encoder) 


OpenWithParm(w_pbus_printmodal, ls_filename)

RETURN 1
end function

on u_cst_imageeditor.create
this.htb_brightness=create htb_brightness
this.htb_zoom=create htb_zoom
this.st_zoom=create st_zoom
this.uo_autofit=create uo_autofit
this.uo_brightness=create uo_brightness
this.uo_tools=create uo_tools
this.uo_actions=create uo_actions
this.uo_1=create uo_1
this.uo_cropactions=create uo_cropactions
this.uo_zoom=create uo_zoom
this.r_bottom=create r_bottom
this.r_top=create r_top
this.st_uspb_imageeditor=create st_uspb_imageeditor
this.inv_pbusexternal=create inv_pbusexternal
this.inv_win32=create inv_win32
this.Control[]={this.htb_brightness,&
this.htb_zoom,&
this.st_zoom,&
this.uo_autofit,&
this.uo_brightness,&
this.uo_tools,&
this.uo_actions,&
this.uo_1,&
this.uo_cropactions,&
this.uo_zoom,&
this.r_bottom,&
this.r_top,&
this.st_uspb_imageeditor}
end on

on u_cst_imageeditor.destroy
destroy(this.htb_brightness)
destroy(this.htb_zoom)
destroy(this.st_zoom)
destroy(this.uo_autofit)
destroy(this.uo_brightness)
destroy(this.uo_tools)
destroy(this.uo_actions)
destroy(this.uo_1)
destroy(this.uo_cropactions)
destroy(this.uo_zoom)
destroy(this.r_bottom)
destroy(this.r_top)
destroy(this.st_uspb_imageeditor)
destroy(this.inv_pbusexternal)
destroy(this.inv_win32)
end on

event destructor;IF hBitMap > 0 THEN inv_win32.GdipDisposeImage(hBitMap)
IF hBitMap_orig > 0 THEN inv_win32.GdipDisposeImage(hBitMap_orig)
IF iul_pGlobalBuffer > 0 THEN inv_win32.GlobalUnlock(iul_pGlobalBuffer)
IF iul_hGlobal > 0 THEN inv_win32.GlobalFree(iul_hGlobal)


inv_win32.GdiplusShutdown(lul_GdiToken)

end event

event constructor;n_cst_ui_imagelist lnv_theme

lstr_input.GdiplusVersion = 1
inv_win32.GdiplusStartup(lul_GdiToken, lstr_input, lstr_output)

of_UpdateUI()
of_SetTheme(lnv_theme.of_GetGlobalTheme())
of_AutoFit()

Event Resize(1, Width, Height)
end event

type htb_brightness from u_cst_imageeditor_trackbar within u_cst_imageeditor
event destroy ( )
boolean visible = false
integer x = 818
integer y = 36
integer width = 951
integer taborder = 80
long backcolor = 16777215
integer currentvalue = 100
integer maxvalue = 200
end type

on htb_brightness.destroy
call u_cst_imageeditor_trackbar::destroy
end on

event moved;call super::moved;IF ib_brightnessstarted THEN
	of_AdjustBrightness(scrollpos - 100)
	RETURN
END IF

IF ib_contraststarted THEN
	of_AdjustContrast(scrollpos - 100)
	RETURN
END IF

end event

type htb_zoom from u_cst_imageeditor_trackbar within u_cst_imageeditor
integer x = 832
integer y = 32
integer height = 80
integer taborder = 80
boolean enabled = false
long backcolor = 16777215
integer minvalue = 10
integer currentvalue = 100
integer maxvalue = 500
integer tickfrequency = 10
end type

on htb_zoom.destroy
call u_cst_imageeditor_trackbar::destroy
end on

event moved;call super::moved;IF hbitmap > 0 THEN
	IF NOT AutoFit THEN
		ResizeFactor = scrollpos / 100
		uo_1.SetRedraw(TRUE)
	END IF
	
	st_zoom.Text = String(scrollpos) + "%"
END IF
end event

type st_zoom from statictext within u_cst_imageeditor
integer x = 1655
integer y = 1452
integer width = 201
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 16777215
string text = "100%"
boolean focusrectangle = false
end type

type uo_autofit from u_cst_togglebutton within u_cst_imageeditor
integer x = 727
integer y = 40
integer width = 142
integer height = 72
integer taborder = 80
long backcolor = 16777215
boolean #value = true
end type

event clicked;call super::clicked;AutoFit = value

htb_zoom.of_Enabled(NOT Value)
uo_zoom.of_SetEnabled(inv_resourcemanager.of_GetString(ZoomInText), NOT Value)
uo_zoom.of_SetEnabled(inv_resourcemanager.of_GetString(ZoomOutText), NOT Value)

uo_1.SetRedraw(TRUE)
end event

on uo_autofit.destroy
call u_cst_togglebutton::destroy
end on

type uo_brightness from u_cst_toolbarstrip within u_cst_imageeditor
boolean visible = false
integer x = 1138
integer y = 40
integer taborder = 70
boolean autosize = true
end type

on uo_brightness.destroy
call u_cst_toolbarstrip::destroy
end on

event ue_buttonclicked;call super::ue_buttonclicked;IF ib_brightnessstarted THEN
	CHOOSE CASE as_button
		CASE inv_resourcemanager.of_GetString(AcceptText)
			of_AcceptBrightness()
		CASE inv_resourcemanager.of_GetString(CancelText)
			of_EndBrightness()
	END CHOOSE
END IF
IF ib_contraststarted THEN
	CHOOSE CASE as_button
		CASE inv_resourcemanager.of_GetString(AcceptText)
			of_AcceptContrast()
		CASE inv_resourcemanager.of_GetString(CancelText)
			of_EndContrast()
	END CHOOSE	
END IF
end event

type uo_tools from u_cst_toolbarstrip within u_cst_imageeditor
integer x = 549
integer y = 4
integer taborder = 70
boolean autosize = true
boolean ib_displayborder = false
long il_currentsize = 24
end type

event ue_buttonclicked;call super::ue_buttonclicked;CHOOSE CASE as_button
	CASE inv_resourcemanager.of_GetString(RotateLeftText)
		of_RotateLeft()
	CASE inv_resourcemanager.of_GetString(RotateRightText)
		of_RotateRight()
	CASE inv_resourcemanager.of_GetString(FlipHorizontalText)
		of_FlipHorizontal()
	CASE inv_resourcemanager.of_GetString(FlipVerticalText)
		of_FlipVertical()
	CASE inv_resourcemanager.of_GetString(CropText)
		of_StartClip()
	CASE inv_resourcemanager.of_GetString(GreyScaleText)
		of_GreyScale()
	CASE inv_resourcemanager.of_GetString(InvertColorsText)
		of_InvertColors()
	CASE inv_resourcemanager.of_GetString(SepiaText)
		of_Sepia()
	CASE inv_resourcemanager.of_GetString(BlackAndWhiteText)
		of_BlackAndWhite()
	CASE inv_resourcemanager.of_GetString(BrightnessText)
		of_StartBrightness()
	CASE inv_resourcemanager.of_GetString(ContrastText)
		of_StartContrast()
	CASE inv_resourcemanager.of_GetString(ResizeImageText)
		ImageEditorHistScale lstr_resizeparms
		RectF lstr_imagesize
		
		lstr_imagesize = of_GetImageSize()
		
		OpenWithParm(w_pbus_resizeimage, lstr_imagesize)
		
		IF IsValid(Message.PowerObjectParm) THEN
			lstr_resizeparms = Message.PowerObjectParm
			
			IF lstr_resizeparms.rw > 0 AND lstr_resizeparms.rh > 0 THEN
				of_ResizeImage(lstr_resizeparms.rw, lstr_resizeparms.rh, lstr_resizeparms.bpercent)
			END IF
		END IF
		
END CHOOSE

end event

on uo_tools.destroy
call u_cst_toolbarstrip::destroy
end on

type uo_actions from u_cst_toolbarstrip within u_cst_imageeditor
integer x = 27
integer y = 4
integer taborder = 60
boolean autosize = true
boolean ib_displayborder = false
long il_currentsize = 24
end type

event ue_buttonclicked;call super::ue_buttonclicked;CHOOSE CASE as_button
	CASE inv_resourcemanager.of_GetString(PrintText)
		of_Print()
	CASE inv_resourcemanager.of_GetString(UndoText)
		of_Undo()
	CASE inv_resourcemanager.of_GetString(RedoText)
		of_Redo()
	CASE inv_resourcemanager.of_GetString(SaveText)
		of_SaveFile(is_fullname)
	CASE inv_resourcemanager.of_GetString(SaveAsText)
		of_SaveAsFile()
	CASE inv_resourcemanager.of_GetString(LoadFromFileText)
		String ls_fullname, ls_filename
		Int   li_fileid
		string ls_currdir
		
		ls_currdir = GetCurrentDirectory()
		
		IF GetFileOpenName ("Open", ls_fullname, ls_filename, &
			"png", "Image Files  (*.png;*.bmp;*.gif;*.jpg;*.jpeg),*.png;*.bmp;*.gif;*.jpg;*.jpeg, All Files, *.*", &
			"", 8194) < 1 THEN
			ChangeDirectory(ls_currdir)
			RETURN
		END IF
		
		ChangeDirectory(ls_currdir)
		
		of_LoadFromFile(ls_fullname)
	CASE inv_resourcemanager.of_GetString(PasteFromClipboardText)
		of_LoadFromClipboard()
	CASE inv_resourcemanager.of_GetString(CopyText)
		of_Copy()
END CHOOSE

end event

on uo_actions.destroy
call u_cst_toolbarstrip::destroy
end on

type uo_1 from u_cst_canvas within u_cst_imageeditor
event lbuttondown pbm_lbuttondown
event lbuttonup pbm_lbuttonup
event mousemove pbm_mousemove
integer y = 144
integer width = 1797
integer height = 1256
integer taborder = 10
boolean bringtotop = true
borderstyle borderstyle = stylelowered!
end type

event lbuttondown;IF NOT ib_clipstarted THEN
	
	IF NOT AutoFit and (ResizeFactor > 1.0 OR ii_imagex < 0 OR ii_imagey < 0 OR ii_imagewidth > UnitsToPixels(Width, XUnitsToPixels!) OR  ii_imageheight > UnitsToPixels(Height, YUnitsToPixels!)) THEN
		//Do panning
		SetPointer(Size!)
		
		ib_panning = TRUE
		
		il_lastxX = UnitsToPixels(xpos, XUnitsToPixels!)
		il_lastyX = UnitsToPixels(ypos, YUnitsToPixels!)
		ii_controlwidth = UnitsToPixels(Width, XUnitsToPixels!)
		ii_controlheight = UnitsToPixels(Height, YUnitsToPixels!)
		
		inv_win32.SetCapture(Handle(THIS))
		
	END IF
	
ELSE

	IF of_InTopLeftHandle(xpos, ypos) THEN
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
END IF
end event

event lbuttonup;inv_win32.ReleaseCapture()

SetPointer(Arrow!)
ib_panning = FALSE
TargetClicked = 0
end event

event mousemove;Int li_posx, li_posy
Int li_width, li_height
Boolean ib_lbuttondown

IF NOT ib_clipstarted THEN
	
	IF NOT ib_panning THEN
		IF NOT AutoFit and (ResizeFactor > 1.0 OR ii_imagex < 0 OR ii_imagey < 0 OR ii_imagewidth > UnitsToPixels(Width, XUnitsToPixels!) OR  ii_imageheight > UnitsToPixels(Height, YUnitsToPixels!)) THEN
			SetPointer(Size!)
		ELSE
			SetPointer(Arrow!)
		END IF
	END IF
	
	IF ib_panning THEN
		Boolean canpanX
		Boolean canpanY
		
		canpanX = TRUE
		canpanY = TRUE
		
		//Do panning
		li_posx = UnitsToPixels(xpos, XUnitsToPixels!)
		li_posy = UnitsToPixels(ypos, YUnitsToPixels!)
		
		IF (li_posy - il_lastyX) > 0 THEN
			IF ii_imagey >= 0 THEN
				canpanY = FALSE
			END IF
		END IF
		
		IF (li_posy - il_lastyX) < 0 THEN
			IF ii_imagey <= ii_controlheight - ii_imageHeight THEN
				canpanY = FALSE
			END IF
		END IF
		
		IF (li_posx - il_lastxX) > 0 THEN
			IF ii_imagex >= 0 THEN
				canpanX = FALSE
			END IF
		END IF
		
		IF (li_posx - il_lastxX) < 0 THEN
			IF ii_imagex <= ii_controlwidth - ii_imagewidth THEN
				canpanX = FALSE
			END IF
		END IF
		
		IF canpanX THEN
			ii_centerx = ii_centerx -  (((li_posx - il_lastxX) / ResizeFactor) * 2)
		END IF
		IF canpanY THEN
			ii_centery = ii_centery -  (((li_posy - il_lastyX) / ResizeFactor) * 2)
		END IF
		
		il_lastxX = li_posx
		il_lastyX = li_posy
	
		SetRedraw(TRUE)
	END IF
	
ELSE
	ib_lbuttondown = KeyDown(KeyLeftButton!)
	
	li_posx = UnitsToPixels(xpos, XUnitsToPixels!)
	li_posy = UnitsToPixels(ypos, YUnitsToPixels!)
	
	IF (of_InTopLeftHandle(xpos, ypos) AND NOT ib_lbuttondown)  OR TargetClicked = TOPLEFT THEN
		SetPointer(SizeNWSE!)
		
		IF TargetClicked > 0 THEN
			lr_clipregion.Left = lr_clipregion.Left + (li_posx - il_lastxX)
			
			IF lr_clipregion.Left < ii_imagex THEN
				lr_clipregion.Left = ii_imagex
			ELSE
				il_lastxX = li_posx
			END IF
			
			lr_clipregion.Top = lr_clipregion.Top + (li_posy - il_lastyX)
			
			IF lr_clipregion.Top < ii_imagey THEN
				lr_clipregion.Top = ii_imagey
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
			
			IF lr_clipregion.Right > (ii_imagex + ii_imagewidth) THEN
				lr_clipregion.Right = (ii_imagex + ii_imagewidth)
			ELSE
				il_lastxX = li_posx
			END IF
			
			lr_clipregion.Top = lr_clipregion.Top + (li_posy - il_lastyX)
			
			IF lr_clipregion.Top < ii_imagey THEN
				lr_clipregion.Top = ii_imagey
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
			
			IF lr_clipregion.Left < ii_imagex THEN
				lr_clipregion.Left = ii_imagex
			ELSE
				il_lastxX = li_posx
			END IF
			
			lr_clipregion.Bottom = lr_clipregion.Bottom + (li_posy - il_lastyX)
			
			IF lr_clipregion.Bottom > (ii_imagey + ii_imageheight) THEN
				lr_clipregion.Bottom = (ii_imagey + ii_imageheight)
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
			
			IF lr_clipregion.Right > (ii_imagex + ii_imagewidth) THEN
				lr_clipregion.Right = (ii_imagex + ii_imagewidth)
			ELSE
				il_lastxX = li_posx
			END IF
			
			lr_clipregion.Bottom = lr_clipregion.Bottom + (li_posy - il_lastyX)
			
			IF lr_clipregion.Bottom > (ii_imagey + ii_imageheight) THEN
				lr_clipregion.Bottom = (ii_imagey + ii_imageheight)
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
		
			
			IF (lr_clipregion.Left +  (li_posx - il_lastxX)) +  li_width > (ii_imagex + ii_imagewidth) THEN
				lr_clipregion.Right = (ii_imagex + ii_imagewidth)
			ELSE
				
				lr_clipregion.Left = lr_clipregion.Left +  (li_posx - il_lastxX)
			
				IF lr_clipregion.Left < ii_imagex THEN
					lr_clipregion.Left = ii_imagex
				END IF
				
				lr_clipregion.Right = lr_clipregion.Left +  li_width
					
			END IF
			
			IF ( lr_clipregion.Top + (li_posy - il_lastyX)) + li_height > (ii_imagey + ii_imageheight) THEN
				lr_clipregion.Bottom = (ii_imagey + ii_imageheight)
			ELSE
				lr_clipregion.Top = lr_clipregion.Top + (li_posy - il_lastyX)
			
				IF lr_clipregion.Top < ii_imagey THEN
					lr_clipregion.Top = ii_imagey
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
	
END IF
end event

event onpaint;call super::onpaint;LongPtr lul_Graphic

inv_win32.GdipCreateFromHDC(hdc, lul_Graphic)
inv_win32.GdipSetSmoothingMode(lul_Graphic, 2)

of_DrawBackground(hdc)
of_DrawImage(lul_graphic)
of_DrawCrop(lul_graphic)

//Cleanup
inv_win32.GdipDeleteGraphics(lul_Graphic)


RETURN 1
end event

on uo_1.destroy
call u_cst_canvas::destroy
end on

type uo_cropactions from u_cst_toolbarstrip within u_cst_imageeditor
boolean visible = false
integer x = 731
integer y = 128
integer taborder = 60
boolean bringtotop = true
boolean autosize = true
boolean ib_displaytext = true
end type

on uo_cropactions.destroy
call u_cst_toolbarstrip::destroy
end on

event ue_buttonclicked;call super::ue_buttonclicked;CHOOSE CASE as_button
	CASE inv_resourcemanager.of_GetString(AcceptText)
		of_AcceptClip()
	CASE inv_resourcemanager.of_GetString(CancelText)
		of_EndClip()
END CHOOSE

end event

type uo_zoom from u_cst_toolbarstrip within u_cst_imageeditor
integer x = 50
integer y = 1444
integer width = 1806
integer taborder = 20
boolean ib_displayborder = false
end type

on uo_zoom.destroy
call u_cst_toolbarstrip::destroy
end on

event ue_buttonclicked;call super::ue_buttonclicked;int newValue

IF hBitmap <= 0 THEN RETURN

CHOOSE CASE as_button
	CASE inv_resourcemanager.of_GetString(ZoomOutText)
		IF NOT AutoFit THEN
			newValue = (Ceiling (htb_zoom.CurrentValue / 10) * 10)
			
			IF newValue = htb_zoom.CurrentValue THEN
				newValue -= htb_zoom.TickFrequency
			END IF
			
			IF newValue >= htb_zoom.MinValue THEN
				htb_zoom.of_SetCurrentValue(newValue)
				ResizeFactor = newValue / 100
				st_zoom.Text = String(newValue) + "%"
				uo_1.SetRedraw(TRUE)
			END IF
		END IF
	CASE inv_resourcemanager.of_GetString(ZoomInText)
		IF NOT AutoFit THEN
			newValue = (Ceiling (htb_zoom.CurrentValue / 10) * 10)
			
			IF newValue = htb_zoom.CurrentValue THEN
				newValue += htb_zoom.TickFrequency
			END IF
			
			IF newValue <= htb_zoom.MaxValue THEN
				htb_zoom.of_SetCurrentValue(newValue)
				ResizeFactor = newValue / 100
				st_zoom.Text = String(newValue) + "%"
				uo_1.SetRedraw(TRUE)
			END IF
		END IF
END CHOOSE
end event

type r_bottom from rectangle within u_cst_imageeditor
long linecolor = 12632256
integer linethickness = 2
long fillcolor = 1073741824
integer y = 1424
integer width = 329
integer height = 136
end type

type r_top from rectangle within u_cst_imageeditor
long linecolor = 12632256
integer linethickness = 2
long fillcolor = 1073741824
integer width = 329
integer height = 144
end type

type st_uspb_imageeditor from statictext within u_cst_imageeditor
integer width = 10002
integer height = 10000
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 16777215
long backcolor = 8421376
string text = "  Image Editor"
boolean focusrectangle = false
end type

event constructor;Hide()
end event

type inv_pbusexternal from n_cst_pbusexternal within u_cst_imageeditor descriptor "pb_nvo" = "true" 
end type

on inv_pbusexternal.create
call super::create
end on

on inv_pbusexternal.destroy
call super::destroy
end on

type inv_win32 from n_cst_win32 within u_cst_imageeditor descriptor "pb_nvo" = "true" 
end type

on inv_win32.create
call super::create
end on

on inv_win32.destroy
call super::destroy
end on

