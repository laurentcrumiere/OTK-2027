$PBExportHeader$n_cst_imageeditor.sru
forward
global type n_cst_imageeditor from nonvisualobject
end type
type inv_pbusexternal from n_cst_pbusexternal within n_cst_imageeditor
end type
type inv_win32 from n_cst_win32 within n_cst_imageeditor
end type
end forward

global type n_cst_imageeditor from nonvisualobject
inv_pbusexternal inv_pbusexternal
inv_win32 inv_win32
end type
global n_cst_imageeditor n_cst_imageeditor

type prototypes

end prototypes

type variables
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

Long Quality = -1

CONSTANT Int UnitWorld =  0 // World coordinate (non-physical unit)
CONSTANT Int UnitDisplay =  1 // Variable -- for PageTransform only
CONSTANT Int UnitPixel =  2 // Each unit is one device pixel.
CONSTANT Int UnitPoint =  3 // Each unit is a printer's point, or 1/72 inch.
CONSTANT Int UnitInch =  4 // Each unit is 1 inch.
CONSTANT Int UnitDocument =  5 // Each unit is 1/300 inch.
CONSTANT Int UnitMillimeter =  6 // Each unit is 1 millimeter.

Private:

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
end variables

forward prototypes
public function integer of_loadfromfile (string as_file)
public function integer of_loadfromfile (string as_file)
public function integer of_rotateleft ()
public function integer of_rotateright ()
public function integer of_fliphorizontal ()
public function integer of_flipvertical ()
private function clsid of_getclsid (long al_format)
public function integer of_savefile (string as_filename)
public function integer of_loadfromclipboard ()
private function integer of_rotateright (longptr ahbitmap)
private function integer of_rotateleft (longptr ahbitmap)
private function integer of_flipvertical (longptr ahbitmap)
private function integer of_fliphorizontal (longptr ahbitmap)
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
public function integer of_brightness (integer ai_brightness)
private function integer of_createbrightnessimage (longptr ahbitmap)
private function integer of_brightness (longptr ahbitmap, integer ai_brightness)
private function integer of_addundo (integer ai_action, integer ai_value)
private function integer of_contrast (longptr ahbitmap, integer ai_contrast)
public function integer of_contrast (integer ai_contrast)
public function integer of_copy ()
public function integer of_savefile ()
public function boolean of_ismodified ()
public function rectf of_getimagesize ()
public function rectf of_getimagesize (long a_unit)
public function integer of_setdpi (real dpix, real dpiy)
private function longptr of_crop (longptr ahbitmap, rectf cropregion)
public function integer of_crop (rectf cropregion)
public function integer of_resizeimage (real ar_wpercent, real ar_hpercent)
public function integer of_resizeimage (real ar_percent)
public function integer of_resizeimage (real ar_width, real ar_height, boolean ab_percent)
private function integer of_addundo (integer ai_action, imageeditorhistscale ai_scalevalues)
public function integer of_undoall ()
end prototypes

public function integer of_loadfromfile (string as_file);RECTF lstr_gRect
Long ll_Units
Long ll_Length
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

//Create original copy for undo
inv_win32.GdipGetImageBounds(hBitMap, lstr_gRect, ll_Units)

inv_win32.GdipCloneBitmapArea(lstr_gRect.X,lstr_gRect.Y,lstr_gRect.Width,lstr_gRect.Height,0, hBitMap, hBitMap_orig)

imageeditorhist empty[]

ActionUndo = empty
ActionRedo = empty

ib_modified = FALSE

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

public function integer of_savefile (string as_filename);LongPtr ll_encoder
clsid l_clsid

is_fullname = as_filename

IF Len(Trim(is_fullname)) = 0 THEN
	RETURN -1
END IF

SetNull(ll_encoder)

CHOOSE CASE Upper(Right(is_fullname, 3))
	CASE "PNG"
		l_clsid = of_GetClsid(PNG2)
	CASE "JPG", "EPG"
		l_clsid = of_GetClsid(JPG2)
	CASE "BMP"
		l_clsid = of_GetClsid(BMP2)
	CASE "GIF"
		l_clsid = of_GetClsid(GIF2)
END CHOOSE

Long ll_rtn

IF Quality >= 0 AND Quality <= 100 THEN
	ll_encoder = inv_pbusexternal.PBUSGetEncoderStructRef(Quality)
END IF

ll_rtn = inv_win32.GdipSaveImageToFile(hBitMap, is_fullname, l_clsid, ll_encoder) 

ib_modified = FALSE

RETURN ll_rtn
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

inv_win32.GdipCreateBitmapFromHBITMAP(clipBoardHBitmap, 0, hBitMap)
inv_win32.GdipCreateBitmapFromHBITMAP(clipBoardHBitmap, 0, hBitMap_orig)

inv_win32.CloseClipboard()

imageeditorhist empty[]

ActionUndo = empty
ActionRedo = empty

ib_modified = FALSE

RETURN 1
end function

private function integer of_rotateright (longptr ahbitmap);IF ahbitmap > 0 THEN
	inv_win32.GdipImageRotateFlip(ahbitmap, Rotate90FlipNone)
	
	of_AddUndo(RotateRight)
END IF

RETURN 1
end function

private function integer of_rotateleft (longptr ahbitmap);IF ahBitMap > 0 THEN
	inv_win32.GdipImageRotateFlip(ahBitMap, Rotate270FlipNone)
	
	of_AddUndo(RotateLeft)
END IF

RETURN 1
end function

private function integer of_flipvertical (longptr ahbitmap);IF ahBitMap > 0 THEN
	inv_win32.GdipImageRotateFlip(ahBitMap, RotateNoneFlipX)
	
	of_AddUndo(FlipVertical)
END IF

RETURN 1
end function

private function integer of_fliphorizontal (longptr ahbitmap);IF ahbitmap > 0 THEN
	inv_win32.GdipImageRotateFlip(ahbitmap, RotateNoneFlipY)
	
	of_AddUndo(FlipHorizontal)
END IF

RETURN 1
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
			
			RectF lrectf
			
			lrectf.X = ActionUndo[ll_index].CropRegion.Left
			lrectf.Width = ActionUndo[ll_index].CropRegion.Right

			lrectf.Y = ActionUndo[ll_index].CropRegion.Top
			lrectf.Height = ActionUndo[ll_index].CropRegion.Bottom
			
			hCropped = of_Crop(hBitMap_Copy, lrectf)
			
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
		RectF lrectf
			
		lrectf.X = ActionUndo[ll_index].CropRegion.Left
		lrectf.Width = ActionUndo[ll_index].CropRegion.Right

		lrectf.Y = ActionUndo[ll_index].CropRegion.Top
		lrectf.Height = ActionUndo[ll_index].CropRegion.Bottom
		
		hCropped = of_Crop(hBitMap_Copy, lrectf)
		
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

public function integer of_savefile ();RETURN of_SaveFile(is_fullname)
end function

public function boolean of_ismodified ();RETURN ib_modified
end function

public function rectf of_getimagesize ();RETURN of_GetImageSize(UnitPixel)
end function

public function rectf of_getimagesize (long a_unit);RectF lstr_gRect

inv_win32.GdipGetImageBounds(hbitmap, lstr_gRect, a_unit)

RETURN lstr_gRect
end function

public function integer of_setdpi (real dpix, real dpiy);RETURN inv_win32.GdipBitmapSetResolution(hBitMap, dpix, dpiy)
end function

private function longptr of_crop (longptr ahbitmap, rectf cropregion);LongPtr hBitmap_copy
Rect lrect

lrect.Left = cropregion.X
lrect.Right = cropregion.Width
lrect.Top = cropregion.Y
lrect.Bottom = cropregion.Height

inv_win32.GdipCloneBitmapAreaI(lrect.Left, &
                                                lrect.Top, &
						                     lrect.Right, &
										   lrect.Bottom,&
											0,ahbitmap, hBitmap_copy)

of_AddUndo(Crop, lrect)

RETURN hBitmap_copy
end function

public function integer of_crop (rectf cropregion);LongPtr hBitmap_copy

hBitmap_copy = of_Crop(hbitmap, cropregion)

IF hBitMap > 0 THEN inv_win32.GdipDisposeImage(hBitMap)

hBitmap = hBitmap_copy

RETURN 1
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

public function integer of_undoall ();ImageEditorHist newList[]

IF hBitMap <= 0 THEN RETURN 0
IF UpperBound(ActionUndo) <= 0 THEN RETURN 0

hBitMap = hBitMap_Orig

ActionUndo = newList
ActionRedo = newList

ib_modified = FALSE

RETURN 1
end function

on n_cst_imageeditor.create
call super::create
this.inv_pbusexternal=create inv_pbusexternal
this.inv_win32=create inv_win32
TriggerEvent( this, "constructor" )
end on

on n_cst_imageeditor.destroy
TriggerEvent( this, "destructor" )
call super::destroy
destroy(this.inv_pbusexternal)
destroy(this.inv_win32)
end on

event destructor;IF hBitMap > 0 THEN inv_win32.GdipDisposeImage(hBitMap)
IF hBitMap_orig > 0 THEN inv_win32.GdipDisposeImage(hBitMap_orig)
IF iul_pGlobalBuffer > 0 THEN inv_win32.GlobalUnlock(iul_pGlobalBuffer)
IF iul_hGlobal > 0 THEN inv_win32.GlobalFree(iul_hGlobal)

inv_win32.GdiplusShutdown(lul_GdiToken)

end event

event constructor;lstr_input.GdiplusVersion = 1
inv_win32.GdiplusStartup(lul_GdiToken, lstr_input, lstr_output)

end event

type inv_pbusexternal from n_cst_pbusexternal within n_cst_imageeditor descriptor "pb_nvo" = "true" 
end type

on inv_pbusexternal.create
call super::create
end on

on inv_pbusexternal.destroy
call super::destroy
end on

type inv_win32 from n_cst_win32 within n_cst_imageeditor descriptor "pb_nvo" = "true" 
end type

on inv_win32.create
call super::create
end on

on inv_win32.destroy
call super::destroy
end on

