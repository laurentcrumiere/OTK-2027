$PBExportHeader$n_cst_win32.sru
forward
global type n_cst_win32 from nonvisualobject
end type
type inv_pbusexternal from n_cst_pbusexternal within n_cst_win32
end type
end forward

global type n_cst_win32 from nonvisualobject
inv_pbusexternal inv_pbusexternal
end type
global n_cst_win32 n_cst_win32

type prototypes
Function Ulong FN_ResGetBitmapID (string lpImageName) Library "pbvm126.dll"

FUNCTION boolean BeginPath (LongPtr hdc) Library "gdi32.dll"
FUNCTION boolean EndPath (LongPtr hdc) Library "gdi32.dll"
FUNCTION boolean SelectClipPath (LongPtr hdc, long iMode) Library "gdi32.dll"
FUNCTION Ulong Chord (LongPtr hdc2 , Long X1 , Long Y1 , Long X2 , Long Y2 , Long X3 , Long Y3 , Long X4 , Long Y4 ) Library "gdi32.dll" 
FUNCTION Ulong ChildWindowFromPoint (LongPtr hWnd, ref POINT lpPoint) Library "USER32.DLL"
FUNCTION uLong CloseThemeData (LongPtr hTheme )  Library "UxTheme.dll"
Subroutine CopyMemory ( LongPtr Destination, blob Source, long Length) Library "kernel32.dll" Alias For "RtlMoveMemory"
Function LongPtr CreateCompatibleDC (LongPtr hdc) Library "gdi32.dll"
FUNCTION LongPtr CreateFontIndirect (ref LOGFONT lpLogFont) LIBRARY "gdi32.dll" ALIAS FOR "CreateFontIndirectA;ANSI"
FUNCTION LongPtr CreatePen (ulong nPenStyle, ulong nWidth, ulong crColor) LIBRARY "Gdi32.dll"
FUNCTION LongPtr CreateRectRgn (Long X1, Long Y1 , Long X2 , Long Y2 ) LIBRARY "Gdi32.dll"
FUNCTION LongPtr CreateRoundRectRgn (long X1 , long Y1 , long X2 , long Y2 , long X3 , long Y3 ) LIBRARY "Gdi32.dll"
FUNCTION LongPtr CreatePolygonRgn (ref POINT ppoint[], int count, int fillMode) Library "GDI32.DLL" alias for "CreatePolygonRgn;Ansi"
FUNCTION LongPtr CreateSolidBrush (LongPtr crColor) Library "gdi32.dll"
FUNCTION LongPtr CreateWindowEx (ulong dwExStyle, string ClassName, long WindowName, ulong dwStyle, ulong X, ulong Y, ulong nWidth, ulong nHeight, Longptr hWndParent, Longptr hMenu, Longptr hInstance, Longptr lpParam) library "user32.dll" alias for "CreateWindowExW"
FUNCTION LongPtr CopyImage (LongPtr h, uint uitype, int cx, int cy, uint flags) library "user32.dll"
FUNCTION boolean DeleteObject(LongPtr hgdiobject) library "gdi32.dll" 
Function boolean DeleteDC (LongPtr hdc) Library "gdi32.dll"
Function boolean DestroyIcon (LongPtr hIcon) Library "user32.dll"
FUNCTION integer DestroyWindow (LongPtr hWnd) library "user32.dll"
Function boolean DrawIconEx (LongPtr hdc, long xLeft, long yTop, LongPtr hIcon, long cxWidth, long cyWidth, ulong istepIfAniCur, long hbrFlickerFreeDraw, ulong diFlags) Library "user32.dll"
FUNCTION ulong DrawText (LongPtr lhdc,ref string lpStr,ulong nCount,ref RECT lpRect,ulong wFormat) LIBRARY "user32.dll" ALIAS FOR "DrawTextW"
FUNCTION boolean Ellipse (LongPtr hwnd,long x1,long y1,long x2,long y2) LIBRARY "Gdi32.dll"
Function Ulong ExtractIconEx (string lpszFile, long nIconIndex, Ref long phIconLarge[], Ref long phIconSmall[], ulong nIcons) Library "shell32.dll" Alias For "ExtractIconExW"
FUNCTION ulong ExtCreatePen ( ulong dwPenStyle, ulong dwWidth, REF LOGBRUSH lplb, ulong dwStyleCount, ulong lpStyle ) LIBRARY "gdi32.dll"
FUNCTION ULONG FillRgn (LongPtr hdc6, LongPtr hRgn , LongPtr hBrush ) LIBRARY "Gdi32.dll"
FUNCTION ULONG FrameRgn (LongPtr hdc, LongPtr hRgn , LongPtr hBrush, int w, int h ) LIBRARY "Gdi32.dll"
Function boolean FreeLibrary(LongPtr hModule) Library "kernel32.dll"
FUNCTION Long GetClientRect (LongPtr hwnd, REF RECT lpRect) Library 'user32' alias for "GetClientRect"
FUNCTION uLong GetColorAdjustment (LongPtr hdc , ref coloradjustment mystructure) Library "gdi32.dll"
FUNCTION uLong GetCurrentThemeName (Ref String pszThemeFileName, long dwMaxNameChars, Ref String pszColorBuff, Long cchMaxColorChars, Ref String pszSizeBuff, Long cchMaxSizeChars ) Library "UxTheme.dll"
FUNCTION uLong GetCurrentThemeName (Ref Blob pszThemeFileName, long dwMaxNameChars, Ref Blob pszColorBuff, Long cchMaxColorChars, Ref Blob pszSizeBuff, Long cchMaxSizeChars ) Library "UxTheme.dll"
FUNCTION boolean GetCursorPos (ref POINT lpPoint) Library "USER32.DLL"
FUNCTION Ulong GetDC (LongPtr hWnd) Library "USER32.DLL"
FUNCTION Ulong GetDeviceCaps (LongPtr Hdc, Long nIndex) Library "gdi32.dll" 
FUNCTION Ulong GetDpiForWindow (LongPtr hwnd) Library "user32.dll" 
FUNCTION ulong GetGraphicsMode (LongPtr lhdc) LIBRARY "gdi32.dll"
FUNCTION Long GetNearestColor (LongPtr hdc, Long crColor ) Library "gdi32.dll"
Function Ulong GetObject(LongPtr hgdiobj, LongPtr cbBuffer, Ref BITMAP lpvObject) Library "gdi32.dll" Alias For "GetObjectW" 
FUNCTION Ulong GetParent (LongPtr lChild) LIBRARY "user32.dll"
FUNCTION Long GetPixel (LongPtr ahdc, int aX, int aY) Library "Gdi32.dll"
FUNCTION Ulong	GetStretchBltMode (LongPtr hdc) Library "gdi32.dll"
FUNCTION ULong SetStretchBltMode (LongPtr hdc, Long nStretchMode) Library "gdi32.dll"
FUNCTION ulong GetSysColor (ulong nIndex) LIBRARY "user32.dll"
FUNCTION integer GetSystemMetrics (int nIndex ) Library "user32.dll"
FUNCTION boolean GetTextExtentPoint32 (LongPtr hdcr, string lpString, long nCount, Ref SIZE size) Library "gdi32.dll" Alias For "GetTextExtentPoint32W"
FUNCTION uLong GetThemeColor (LongPtr hTheme, Int iPartId, Int iStateId, Int iPropId, Ref Long pColor ) Library "UxTheme.dll"
FUNCTION uLong GetThemeEnumValue (LongPtr hTheme, Int iPartId, Int iStateId, Int iPropId, Ref Integer piVal ) Library "UxTheme.dll"
FUNCTION uLong GetThemeInt (LongPtr hTheme, Int iPartId, Int iStateId, Int iPropId, Ref Integer piVal ) Library "UxTheme.dll"
FUNCTION uLong GetThemePartSize (LongPtr hTheme, LongPtr hdc, Int iPartId, Int iStateId, uLong prc, Integer eSize, Ref Size psz ) Library "UxTheme.dll" alias for "GetThemePartSize;Ansi"
FUNCTION Ulong GetWindowLong (LongPtr hWnd, Long offset) LIBRARY 'user32.dll' ALIAS FOR "GetWindowLongA"
FUNCTION BOOLEAN GetWindowRect (LongPtr hWnd,  REF Rect rect) library "user32.dll" alias for "GetWindowRect;Ansi"
FUNCTION Ulong GetWindowTheme (LongPtr hwnd ) Library "UxTheme.dll" Alias for "GetWindowTheme"
FUNCTION longPtr GetStockObject (int fnObject) LIBRARY "gdi32.dll"
FUNCTION LongPtr GlobalAlloc (long Flags, long Bytes) Library "kernel32.dll"
FUNCTION long GlobalFree (LongPtr MemHandle) Library "kernel32.dll"
FUNCTION LongPtr GlobalLock(LongPtr MemHandle) Library "kernel32.dll"
FUNCTION long GlobalUnlock (LongPtr MemHandle) Library "kernel32.dll"
FUNCTION Boolean GradientRectangle (LongPtr hdc2, TRIVERTEX pVert[], ULong numVert, GRADIENT_RECT pMesh [], ULong numMesh, ULong dMode) Library 'msimg32' Alias For 'GradientFill'
FUNCTION Boolean GradientTriangle (LongPtr hdc3, TRIVERTEX pVert[], ULong numVert, GRADIENT_TRIANGLE pMesh [], ULong numMesh, ULong dMode) Library 'msimg32' Alias For 'GradientFill;Ansi'
FUNCTION boolean ImageList_Draw (LongPtr himl, long i, LongPtr hdcDst, long lx, long ly, ulong fStyle) Library "comctl32.dll"
FUNCTION boolean ImageList_DrawEx (LongPtr himl, long i, LongPtr hdcDst, long lx, long ly, long lwidth, long lheight, long lback, long lfore , ulong fStyle) Library "comctl32.dll"
FUNCTION Boolean InitCommonControlsEx (REF INITCOMMONCONTROLSEX iccex) library "comctl32.dll" alias for "InitCommonControlsEx;Ansi" progma_pack(1)
Function LongPtr LoadImage (LongPtr hinst, string lpszName, ulong uType, long cxDesired, long cyDesired, ulong fuLoad) Library "user32.dll" Alias For "LoadImageW"
FUNCTION LongPtr LocalAlloc (long Flags, long Bytes) library "kernel32.dll"
FUNCTION LongPtr LocalFree (LongPtr MemHandle) library "kernel32.dll"
Function Ulong LoadLibrary(string lpFileName) Library "kernel32.dll" Alias For "LoadLibraryW"
FUNCTION ulong LineTo (LongPtr hdc,ulong lx,ulong ly) LIBRARY "gdi32.dll"
FUNCTION Boolean IsAppThemed () Library "UxTheme.dll"
FUNCTION Boolean IsThemeActive () Library "UxTheme.dll"
FUNCTION Boolean IsThemePartDefined (LongPtr hTheme, Int iPartId, Int iStateId ) Library "UxTheme.dll"
FUNCTION long lstrcpy (LongPtr Destination, string Source) library "kernel32.dll" alias for "lstrcpyW"
FUNCTION ulong MoveToEx (LongPtr hdc,ulong lx,ulong ly,ref POINT lpPoint) LIBRARY "gdi32.dll" alias for "MoveToEx" 
FUNCTION Long MulDiv (Long nNumber, Long nNumerator, Long nDenominator ) Library "kernel32.dll"
FUNCTION Long OpenThemeData (LongPtr hWnd, String pszClassList )  Library "UxTheme.dll"
FUNCTION Long OpenThemeData (LongPtr hWnd, Blob pszClassList )  Library "UxTheme.dll"
FUNCTION Boolean PolyBezier (LongPtr hdc7, REF RECT lpRect, long cPoints ) LIBRARY "Gdi32.dll" alias for "PolyBezier;Ansi" 
FUNCTION Boolean Polygon(LongPtr hdc, point apt[], int cpt) LIBRARY "Gdi32.dll" alias for "Polygon;Ansi" 
FUNCTION Boolean Polyline (LongPtr hdc8, GRADIENT_RECT lppt[], long cPoints) LIBRARY "Gdi32.dll" alias for "Polyline;Ansi" 
FUNCTION Boolean Polyline (LongPtr hdc8, point lppt[], int cPoints) LIBRARY "Gdi32.dll" alias for "Polyline;Ansi" 
FUNCTION Integer PtInRegion (LongPtr hrgn, int x, int y) LIBRARY "GDI32.dll"
FUNCTION Boolean Rectangle (LongPtr hwnd, ulong X1, ulong Y1, ulong X2, ulong Y2) library "gdi32" 
FUNCTION integer RelayMsg (longptr hWnd, long uMsg, longptr wParam, REF MSG Msg) library "user32.dll" Alias For "SendMessageW" 
FUNCTION Boolean ReleaseCapture () Library "USER32.DLL"
FUNCTION int ReleaseDC (LongPtr hWnd, ulong hDC) Library "USER32.DLL"
FUNCTION Boolean RoundRect (LongPtr hdc5 , uLong X1, ulong Y1 , ulong X2 , ulong Y2 , ulong X3 , ulong Y3 ) LIBRARY "Gdi32.dll"
FUNCTION boolean ScreenToClient (LongPtr hWnd, ref POINT lpPoint) Library "USER32.DLL" 
FUNCTION long SelectClipRgn (LongPtr lhdc, LongPtr lhrgn) Library "GDI32.DLL"
FUNCTION LongPtr SelectObject (LongPtr hdc, LongPtr hWnd ) Library "gdi32.dll"
FUNCTION uLong SendMessageString (longptr hwnd, uLong Msg, longptr wParam, Ref String lpzString ) Library "user32.dll" Alias For "SendMessageW"
FUNCTION uLong SendMessageRect (longptr hwnd, uLong Msg, longptr wParam, Ref Rect lpzString ) Library "user32.dll" Alias For "SendMessageW"
FUNCTION ulong SetBkColor (LongPtr lhdc,ulong nColor) LIBRARY "gdi32.dll"
FUNCTION ulong SetBkMode (LongPtr lhdc,ulong nBkMode) LIBRARY "gdi32.dll"
FUNCTION ulong SetCapture (LongPtr hWnd) Library "USER32.DLL"
FUNCTION uLong SetColorAdjustment (LongPtr	hdc , ref coloradjustment mystructure) Library "gdi32.dll"  
FUNCTION ulong SetGraphicsMode (LongPtr lhdc,ulong nMode) LIBRARY "gdi32.dll"
FUNCTION Long SetLayeredWindowAttributes (LongPtr hWnd, LongPtr colorref, Char Transparency, ULong flag) LIBRARY 'user32.dll' alias for "SetLayeredWindowAttributes"
FUNCTION Long SetParent (LongPtr lChild, LongPtr lParent) LIBRARY "user32.dll"
FUNCTION Long SetPixel (LongPtr ahdc, int aX, int aY, Long crColor) Library "Gdi32.dll"
FUNCTION Ulong SetROP2 (LongPtr hdc , uLong nDrawMode ) Library "gdi32.dll" 
FUNCTION ulong SetTextColor (LongPtr lhdc,ulong crColor) LIBRARY "gdi32.dll"
FUNCTION Long SetWindowLong (LongPtr hWnd, Long offset, LongPtr attributes) LIBRARY 'user32.dll' ALIAS FOR "SetWindowLongW"
FUNCTION Long SetWindowLongPtr (LongPtr hWnd, Long offset, LongPtr attributes) LIBRARY 'user32.dll' ALIAS FOR "SetWindowLongPtrW"
FUNCTION Long SetWindowPos (LongPtr hWnd, LongPtr m, Long nleft, Long ntop, Long nwidth, Long nheight, Long flags) Library "USER32.dll"
FUNCTION Long SetWindowTheme (LongPtr hwnd, Ref String pszSubAppName, ref String pszSubIdList ) Library "UxTheme.dll" Alias for "SetWindowTheme;Ansi"
FUNCTION Long SetWindowTheme (LongPtr hwnd, Ref Blob pszSubAppName, ref Blob pszSubIdList ) Library "UxTheme.dll" Alias for "SetWindowTheme"
FUNCTION BOOLEAN ShowWindow(LongPtr hWnd, INT nCmdShow) LIBRARY "USER32.DLL"
FUNCTION ULong StretchBlt (LongPtr hdc,Long x2, Long y2, Long nWidth, Long nHeight, LongPtr hSrcDC, Long xSrc, Long ySrc, Long nSrcWidth, Long nSrcHeight,Long dwRop) Library "gdi32.dll"
//Function boolean StretchBlt (ulong hdcDest, long nXOriginDest, long nYOriginDest, long nWidthDest, long nHeightDest, ulong hdcSrc, long nXOriginSrc, long nYOriginSrc, long nWidthSrc, long nHeightSrc, long dwRop) Library "gdi32.dll"
FUNCTION Boolean SystemParametersInfo (uInt uiAction, uInt uiParam, Ref Any pvPAram, uInt fWinIni ) Library "user32.dll" Alias For "SystemParametersInfoA"
FUNCTION Boolean SystemParametersInfo (uInt uiAction, uInt uiParam, Long pvPAram, uInt fWinIni ) Library "user32.dll" Alias For "SystemParametersInfoA"//A"
FUNCTION ulong TextOut (LongPtr lhdc,ulong lx,ulong ly,ref string lpString,ulong nCount) LIBRARY "gdi32.dll" ALIAS FOR "TextOutW"
FUNCTION Ulong ToolTipMsg (longptr hWnd, long uMsg, longptr wParam, REF TOOLINFO ToolInfo) library "user32.dll" Alias For "SendMessageW" progma_pack(1)
FUNCTION Boolean TrackMouseEvent (ref trackmouseevent lpTrackMouseEvent ) Library 'user32.dll' alias for "TrackMouseEvent"
Function boolean TransparentBlt (LongPtr hdcDest, long xoriginDest, long yoriginDest, long wDest, long hDest, LongPtr hdcSrc, long xoriginSrc, long yoriginSrc, long wSrc, long hSrc, ulong crTransparent) Library "msimg32.dll"
FUNCTION LongPtr WindowFromDC (LongPtr hdc) LIBRARY "user32.dll"


//GDI+
function Long CreatePathGradient (REF PointF pPoints, Long count, Long wrapMode, REF LongPtr polyGradient) library "Gdiplus.dll" Alias For "GdipCreatePathGradient"
Function long GdipCreateBitmapFromFileICM(string filename, Ref LongPtr bitmap ) Library "gdiplus.dll"
Function long GdipDisposeImage(LongPtr image) Library "gdiplus.dll"
function long GdipCreateFromHDC(LongPtr hdc, ref LongPtr graphics) library "gdiplus.dll"
function long GdipSetSmoothingMode(LongPtr graphics, long smoothingmode) library "gdiplus.dll"
function long GdipDrawImageRectRectI(LongPtr graphics, LongPtr gImage, long dx, long dy, long dw, long dh, long sx, long sy, long sw, long sh, long unit, LongPtr gImageAttrib, long callback, long callbackData) library "gdiplus.dll"
function long GdipDrawImageRectRect(LongPtr graphics, LongPtr gImage, real dx, real dy, real dw, real dh, real sx, real sy, real sw, real sh, long unit, LongPtr gImageAttrib, long callback, long callbackData) library "gdiplus.dll"
function long GdipDrawImageRectI(LongPtr graphics, LongPtr gImage, long x, long y, long width, long height) library "gdiplus.dll"
function long GdipDrawEllipseI(LongPtr graphics, LongPtr upen, int x, int y, int width, int height) library "gdiplus.dll"
function long GdipFillEllipse(LongPtr graphics, LongPtr ubrush, long x, long y, long width, long height) library "gdiplus.dll"
function long GdipFillEllipseI(LongPtr graphics, LongPtr ubrush, long x, long y, long width, long height) library "gdiplus.dll"
function long GdipDeleteBrush(LongPtr ubrush) library "gdiplus.dll"
function long GdipCreateSolidFill(LongPtr argb, ref LongPtr ubrush) library "gdiplus.dll"
function long GdipCreateLineBrushI(point point1, point point2, ULong color1, ULong color2, int wrapmode, ref LongPtr ubrush) library "gdiplus.dll"
function long GdipClosePathFigure(LongPtr upath) library "gdiplus.dll"
function long GdipAddPathArcI(LongPtr upath, long x, long y, long width, long height, real startAngle, real sweepAngle) library "gdiplus.dll"
function long GdipCreatePath(int fillMode, ref LongPtr nativePath) library "gdiplus.dll"
function long GdipAddPathLineI(LongPtr upath,long x1,long y1,long x2, long y2) library "gdiplus.dll"
function long GdipDrawPath(LongPtr graphics,LongPtr pen,LongPtr upath) library "gdiplus.dll"
function long GdipFillPath(LongPtr graphics,LongPtr ubrush,LongPtr upath) library "gdiplus.dll"
function long GdipDeletePath(LongPtr upath) library "gdiplus.dll"
function long GdipDeletePen(LongPtr pen) library "gdiplus.dll"
function long GdipCreatePen1(ULong argb, real width, long unit, ref LongPtr pen) library "gdiplus.dll"
function long GdipSetPenStartCap(LongPtr pen, int startCap) library "gdiplus.dll"
function long GdipSetPenEndCap(LongPtr pen, int endCap) library "gdiplus.dll"
function long GdipDeleteGraphics(LongPtr graphics) library "gdiplus.dll"
Function long GdipGetImageBounds(LongPtr image, Ref RECTF srcRect, Ref long srcUnit) Library "gdiplus.dll"
Function long GdiplusStartup (Ref LongPtr token, GdiplusStartupInput input, Ref GdiplusStartupOutput output) Library "gdiplus.dll"
Subroutine GdiplusShutdown (LongPtr token) Library "gdiplus.dll"
function long GdipSetImageAttributesWrapMode(LongPtr gImgattr, long wrapMode, ulong argb, boolean clamp) library "gdiplus.dll"
Function long GdipCreateImageAttributes(Ref LongPtr gImgattr) Library "gdiplus.dll"
Function long GdipDisposeImageAttributes(LongPtr gImgattr) Library "gdiplus.dll"
Function long GdipBitmapGetPixel(LongPtr gBitmap, long lx, long ly, Ref ulong argb) Library "gdiplus.dll"
Function long GdipSetImageAttributesColorKeys( LongPtr gImgattr, long colorAdjustType, boolean enableFlag, ulong argbColorLow, ulong argbColorHigh) Library "gdiplus.dll"
function Long GdipDrawLine (LongPtr graphics, LongPtr pen, real x1, real y1, real x2, real y2) library "Gdiplus.dll" Alias For "GdipDrawLine"
function Long GdipSetPenStartCap (LongPtr pen, long startcap) library "Gdiplus.dll"
function Long GdipSetPenEndCap (LongPtr pen, long startcap) library "Gdiplus.dll"
function long GdipDrawString(LongPtr graphics, string textString, int length, LongPtr font, ref RECTF layoutRect, ulong stringFormat, LongPtr brush) library "gdiplus.dll"
function long GdipSetClipPath(LongPtr ugraphics, LongPtr upath, int combinemode) library "gdiplus.dll"
function long GdipResetClip(LongPtr ugraphics) library "gdiplus.dll"
function long GdipSetInterpolationMode(LongPtr graphics, int mode) library "gdiplus.dll"
function long GdipIsVisiblePathPointI(LongPtr apath,int ax,int ay, LongPtr agraphics,ref int avisible) library "gdiplus.dll"
function long GdipIsOutlineVisiblePathPointI(LongPtr apath,int ax, int ay,LongPtr apen, LongPtr agraphics, ref int avisible) library "gdiplus.dll"
function long GdipCreatePathGradientFromPath(LongPtr upath, ref LongPtr ugradientbrush) library "gdiplus.dll"
function long GdipSetPathGradientCenterColor(LongPtr ugradientbrush, ulong upencolor) library "gdiplus.dll"
function long GdipSetPathGradientSurroundColorsWithCount(LongPtr ugradientbrush,ref LongPtr upencolor, ref long var2) library "gdiplus.dll" 
function long GdipSetLineBlend(LongPtr ugradientbrush, REAL blend[], REAL positions[], INT count) library "gdiplus.dll"
function long GdipSetPathGradientFocusScales(LongPtr ugradientbrush, REAL xScale,  REAL yScale) library "gdiplus.dll"
function long GdipLoadImageFromFile(string filename, ref LongPtr ulimage) library "gdiplus.dll"
function long GdipFillRectangleI(LongPtr graphics, LongPtr ubrush, long ax, long ay, long awidth, long aheight) library "gdiplus.dll"
function long GdipAddPathRectangleI(LongPtr ppath,long px,long py,long pwidth,long pheight) library "gdiplus.dll"
function long CreateStreamOnHGlobal(LongPtr hGlobal, boolean fDeleteOnRelease, Ref LongPtr ppstm) Library "ole32.dll"
function long GdipCreateBitmapFromStreamICM(LongPtr stream, Ref LongPtr bitmap) Library "gdiplus.dll"

function long GdipSetPageUnit(LongPtr graphics, int unit) Library "gdiplus.dll"
function long GetDeviceCaps(LongPtr hdc,int index) Library "gdi32.dll"
function LongPtr GetDesktopWindow () library "user32.dll"
function LongPtr GetDCEx(LongPtr  ahWnd, LongPtr  hrgnClip, Long flags) library "user32.dll"
function LongPtr CreateCompatibleBitmap(LongPtr hdc, Integer nWidth, Integer nHeight) Library "gdi32.dll"
function Boolean BitBlt(LongPtr hdcDest, Integer nXDest, Integer nYDest, Integer nWidth, Integer nHeight, LongPtr ahdcSrc, Integer nXSrc, Integer nYSrc, ULong dwRop) Library "gdi32.dll"
function LongPtr CreateBitmap( int nWidth,int nHeight,UINT nPlanes,UINT nBitCount, ULong lpBits) Library "gdi32.dll"
function Long OpenClipboard(LongPtr hWndNewOwner) Library "user32.dll"
function Long EmptyClipboard() Library "user32.dll"
function ULong SetClipboardData(UInt uFormat, LongPtr hMem) Library "user32.dll"
function Long CloseClipboard() Library "user32.dll"
function long GdipSaveImageToFile(LongPtr hbitmap, string filename, ref clsid pclsid, LongPtr hencoder)  library "gdiplus.dll" ALIAS FOR "GdipSaveImageToFile"
function long GdipCreateBitmapFromHBITMAP(LongPtr hbm, LongPtr hpal, REF LongPtr bitmap) library "gdiplus.dll"
function long GdipCreateHBITMAPFromBitmap(LongPtr pbitmap, REF LongPtr hbmReturn, LongPtr background) library "gdiplus.dll"

//
Function Integer FillRect(LongPtr hDC, RECT lpRect, LongPtr hbr) Library "user32.dll"
function long GdipImageRotateFlip(LongPtr hbm, int rfType) library "gdiplus.dll"
function LongPtr GetClipboardData(UInt uFormat) Library "user32.dll"
function long GdipCloneBitmapAreaI( INT x, INT y, INT width, INT height,int format, LongPtr srcBitmap, REF LongPtr dstBitmap) library "gdiplus.dll"
function long GdipCloneBitmapArea(real x,real y,real width,real height,int format, LongPtr srcBitmap, REF LongPtr dstBitmap) library "gdiplus.dll"
function long GdipGetImageGraphicsContext(LongPtr hbm, REF LongPtr graphics) library "gdiplus.dll"
function long GdipDrawImageRectRect (LongPtr graphics, LongPtr pImage, int dstx,int dsty,int dstwidth,int dstheight,int srcx,int srcy,int srcwidth,int srcheight,Long srcUnit, LongPtr imageAttributes, ULong pcallback , ULong callbackData) library "gdiplus.dll"
function long GdipSetImageAttributesColorMatrix (LongPtr imageattr, Long pType, Long enableFlag,REF Real ColorMatix[5, 5], Ref LongPtr grayMatrix, Long flags) library "gdiplus.dll"
function long GdipLoadImageFromFileICM(string filename, ref LongPtr ulimage) library "gdiplus.dll"
function long GdipLoadImageFromStream(LongPtr ustream, ref LongPtr ulimage) library "gdiplus.dll"
function Boolean IsClipboardFormatAvailable(UINT format) Library "user32.dll"
function long GdipCreateMetafileFromEmf(LongPtr henhmetafile, boolean deleteEmf, Ref LongPtr metafile) library "gdiplus.dll"
function long GdipBitmapSetResolution(LongPtr pbitmap, real dpix, real dpiy) library "gdiplus.dll"
function long GdipScaleWorldTransform(LongPtr graphics, real sx, real sy, int matrixorder) library "gdiplus.dll"
function long GdipCreateBitmapFromGraphics(int w, int h, LongPtr graphics, REF LongPtr bitmap)  library "gdiplus.dll"

end prototypes

type variables
CONSTANT Long LOGPIXELSX = 88
CONSTANT Long LOGPIXELSY = 90

CONSTANT Long WM_MOUSEWHEEL = 522

Constant Long SWP_NOSIZE = 1
Constant Long SWP_NOMOVE = 2
Constant Long SWP_NOZORDER = 4
Constant Long SWP_NOREDRAW = 8
Constant Long SWP_NOACTIVATE = 16
Constant Long SWP_FRAMECHANGED = 32
Constant Long SWP_SHOWWINDOW = 64
Constant Long SWP_HIDEWINDOW = 128
Constant Long SWP_NOCOPYBITS = 256
Constant Long SWP_NOOWNERZORDER = 512
Constant Long SWP_NOSENDCHANGING = 1024
Constant Long SWP_DRAWFRAME = SWP_FRAMECHANGED
Constant Long SWP_NOREPOSITION = SWP_NOOWNERZORDER
Constant Long SWP_DEFERERASE = 8192
Constant Long SWP_ASYNCWINDOWPOS = 16384

Constant Long ValueTypeByte = 1
Constant Long ValueTypeAscii  = 2
Constant Long ValueTypeShort  = 3
Constant Long ValueTypeLong = 4
Constant Long ValueTypeRational = 5
Constant Long ValueTypeLongRange = 6
Constant Long ValueTypeUndefined = 7
Constant Long ValueTypeRationalRange = 8
end variables

forward prototypes
public function double getdpix ()
public function double getdpiy ()
public function long scaledpi (longptr aul_hwnd, long ai_value)
public function long scaley (longptr aul_hwnd, long ai_value)
public function long scalex (longptr aul_hwnd, long ai_value)
public function long of_scalebydpi (longptr aul_hwnd, long al_value, boolean ab_isx)
public function long scaledpidown (longptr aul_hwnd, long al_value)
public function unsignedlong pbusmakeargb (integer a, integer r, integer g, integer b)
end prototypes

public function double getdpix ();ULong screen
Double scale
screen = GetDC(0)
scale = GetDeviceCaps(screen, LOGPIXELSX) / 96.0
ReleaseDC(0, screen)
RETURN scale
end function

public function double getdpiy ();ULong screen
Double scale
screen = GetDC(0)
scale = GetDeviceCaps(screen, LOGPIXELSY) / 96.0
ReleaseDC(0, screen)
RETURN scale
end function

public function long scaledpi (longptr aul_hwnd, long ai_value);RETURN of_scalebyDPI(aul_hwnd, ai_value, TRUE)
end function

public function long scaley (longptr aul_hwnd, long ai_value);RETURN of_scalebyDPI(aul_hwnd, ai_value, FALSE)
end function

public function long scalex (longptr aul_hwnd, long ai_value);RETURN of_scalebyDPI(aul_hwnd, ai_value, TRUE)
end function

public function long of_scalebydpi (longptr aul_hwnd, long al_value, boolean ab_isx);ulong lul_dpi
ulong lul_hdc

// Try modern API first
 lul_dpi = GetDpiForWindow(aul_hwnd)

IF lul_dpi = 96 OR lul_dpi <= 0 THEN
	RETURN al_value
END IF

// Scale value relative to 96 DPI
RETURN long(Round(Double(al_value) * (Double(lul_dpi) / 96), 0))
end function

public function long scaledpidown (longptr aul_hwnd, long al_value);ulong lul_dpi
ulong lul_hdc

// Try modern API first
 lul_dpi = GetDpiForWindow(aul_hwnd)

IF lul_dpi = 96 OR lul_dpi <= 0 THEN
	RETURN al_value
END IF

// Scale value relative to 96 DPI
RETURN long(Round(Double(al_value) / (Double(lul_dpi) / 96), 0))
end function

public function unsignedlong pbusmakeargb (integer a, integer r, integer g, integer b);RETURN inv_pbusexternal.PBUSMakeARGB(a,r,g,b)
end function

on n_cst_win32.create
call super::create
this.inv_pbusexternal=create inv_pbusexternal
TriggerEvent( this, "constructor" )
end on

on n_cst_win32.destroy
TriggerEvent( this, "destructor" )
call super::destroy
destroy(this.inv_pbusexternal)
end on

type inv_pbusexternal from n_cst_pbusexternal within n_cst_win32 descriptor "pb_nvo" = "true" 
end type

on inv_pbusexternal.create
call super::create
end on

on inv_pbusexternal.destroy
call super::destroy
end on

