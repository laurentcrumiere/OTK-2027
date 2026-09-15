$PBExportHeader$n_bitmap.sru
$PBExportComments$Functions to capture bitmaps and save to .bmp file
forward
global type n_bitmap from nonvisualobject
end type
type bitmapheader from structure within n_bitmap
end type
type bitmapinfoheader from structure within n_bitmap
end type
type bitmapinfo from structure within n_bitmap
end type
end forward

type bitmapheader from structure
	character		bftype[2]
	unsignedlong		bfsize
	integer		bfreserved1
	integer		bfreserved2
	unsignedlong		bfoffbits
end type

type bitmapinfoheader from structure
	unsignedlong		bisize
	long		biwidth
	long		biheight
	integer		biplanes
	integer		bibitcount
	unsignedlong		bicompression
	unsignedlong		bisizeimage
	long		bixpelspermeter
	long		biypelspermeter
	unsignedlong		biclrused
	unsignedlong		biclrimportant
end type

type bitmapinfo from structure
	bitmapinfoheader		bmiheader
	unsignedlong		bmicolor[]
end type

global type n_bitmap from nonvisualobject autoinstantiate
end type

type prototypes
Function int GetTempPath ( &
	int nBufferLength, &
	Ref string lpBuffer &
	) Library "kernel32.dll" Alias For "GetTempPathA;Ansi"

Function ulong GetDesktopWindow ( &
	) Library "user32.dll"

Function ulong GetDC ( &
	ulong hWnd &
	) Library "user32.dll"

Function ulong CreateCompatibleDC ( &
	ulong hdc &
	) Library "gdi32.dll"

Function ulong CreateCompatibleBitmap ( &
	ulong hdc, &
	int nWidth, &
	int nHeight &
	) Library "gdi32.dll"

Function ulong SelectObject ( &
	ulong hdc, &
	ulong hgdiobj &
	) Library "gdi32.dll"

Function boolean BitBlt ( &
	ulong hdcDest, &
	int nXDest, &
	int nYDest, &
	int nWidth, &
	int nHeight, &
	ulong hdcSrc, &
	int nXSrc, &
	int nYSrc, &
	long dwRop &
	) Library "gdi32.dll"

Function int GetDIBits ( &
	ulong hdc, &
	ulong hbmp, &
	uint uStartScan, &
	uint cScanLines, &
	Ref blob lpvBits, &
	Ref bitmapinfo lpbi, &
	uint uUsage &
	) Library "gdi32.dll" alias for "GetDIBits;Ansi"

Function int GetDIBits ( &
	ulong hdc, &
	ulong hbmp, &
	uint uStartScan, &
	uint cScanLines, &
	ulong lpvBits, &
	ref bitmapinfo lpbi, &
	uint uUsage &
	) Library "gdi32.dll" alias for "GetDIBits;Ansi"

Subroutine CopyBitmapFileHeader ( &
	Ref blob Destination, &
	bitmapheader Source, &
	long Length &
	) Library "kernel32.dll" Alias For "RtlMoveMemory;Ansi"

Subroutine CopyBitmapInfo ( &
	Ref blob Destination, &
	bitmapinfo Source, &
	long Length &
	) Library "kernel32.dll" Alias For "RtlMoveMemory;Ansi"

Function boolean DeleteDC ( &
	ulong hdc &
	) Library "gdi32.dll"

Function int ReleaseDC ( &
	ulong hWnd, &
	ulong hDC &
	) Library "user32.dll"

end prototypes

forward prototypes
public function string of_gettemppath ()
public function blob of_screencapture ()
public function blob of_controlcapture (dragobject a_object)
public function blob of_windowcapture (window a_window)
public function unsignedlong of_writeblob (string as_filename, blob ablb_bitmap)
public function blob of_capture (unsignedlong aul_hwnd, unsignedlong aul_xpos, unsignedlong aul_ypos, unsignedlong aul_width, unsignedlong aul_height)
end prototypes

public function string of_gettemppath ();// returns temp directory name

String ls_path
Integer li_buflen

li_buflen = 250
ls_path = Space(li_buflen)

GetTempPath(li_buflen, ls_path)

Return ls_path

end function

public function blob of_screencapture ();// capture bitmap of entire screen

ULong lul_hWnd, lul_width, lul_height
Environment le_env

// get screen size
GetEnvironment(le_env)
lul_width  = le_env.ScreenWidth
lul_height = le_env.ScreenHeight

// get handle to windows background
lul_hWnd = GetDesktopWindow()

Return this.of_Capture(lul_hWnd, 0, 0, lul_width, lul_height)

end function

public function blob of_controlcapture (dragobject a_object);// capture bitmap of a control

PowerObject lpo_parent
ULong lul_xpos, lul_ypos, lul_width, lul_height, lul_hWnd

// loop thru parents until a window is found
lpo_parent = a_object.GetParent()
Do While lpo_parent.TypeOf() <> Window! and IsValid (lpo_parent)
	lpo_parent = lpo_parent.GetParent()
Loop

// get handle to window
lul_hWnd = Handle(lpo_parent)

// convert x, y, width and height from PBU to Pixels
lul_xpos   = UnitsToPixels(a_object.X, XUnitsToPixels!)
lul_ypos   = UnitsToPixels(a_object.Y, YUnitsToPixels!)
lul_width  = UnitsToPixels(a_object.width, XUnitsToPixels!)
lul_height = UnitsToPixels(a_object.height, YUnitsToPixels!)

Return this.of_Capture(lul_hWnd, lul_xpos, lul_ypos, lul_width, lul_height)

end function

public function blob of_windowcapture (window a_window);// capture bitmap of a window

ULong lul_xpos, lul_ypos, lul_width, lul_height, lul_hWnd

// get handle to windows background
lul_hWnd = GetDesktopWindow()

// convert x, y, width and height from PBU to Pixels
lul_xpos   = UnitsToPixels(a_window.X, XUnitsToPixels!)
lul_ypos   = UnitsToPixels(a_window.Y, YUnitsToPixels!)
lul_width  = UnitsToPixels(a_window.width, XUnitsToPixels!)
lul_height = UnitsToPixels(a_window.height, YUnitsToPixels!)

Return this.of_Capture(lul_hWnd, lul_xpos, lul_ypos, lul_width, lul_height)

end function

public function unsignedlong of_writeblob (string as_filename, blob ablb_bitmap);// write a blob to a file

Integer li_fnum
ULong lul_total, lul_bytes, lul_length

li_fnum = FileOpen(as_filename, StreamMode!, Write!, LockWrite!, Replace!)
If li_fnum > 0 Then
	lul_length = Len(ablb_bitmap)
	DO WHILE lul_total < lul_length
		lul_bytes = FileWrite(li_fnum, &
				BlobMid(ablb_bitmap, lul_total + 1))
		lul_total += lul_bytes
	LOOP
	FileClose(li_fnum)
Else
	Return -1
End If

Return lul_total

end function

public function blob of_capture (unsignedlong aul_hwnd, unsignedlong aul_xpos, unsignedlong aul_ypos, unsignedlong aul_width, unsignedlong aul_height);// capture bitmap and return as blob

ULong lul_hdc, lul_hdcMem, lul_hBitmap, lul_pixels
Blob lblb_header, lblb_info, lblb_bitmap
BitmapInfo lstr_Info
BitmapHeader lstr_Header

// Get the device context of window and allocate memory
lul_hdc = GetDC(aul_hWnd)
lul_hdcMem = CreateCompatibleDC(lul_hdc)
lul_hBitmap = CreateCompatibleBitmap(lul_hdc, aul_width, aul_height)

If lul_hBitmap <> 0 Then
	// Copy the bitmap to memory location
	SelectObject(lul_hdcMem, lul_hBitmap)
   BitBlt(lul_hdcMem, 0, 0, aul_width, aul_height, lul_hdc, aul_xpos, aul_ypos, 13369376)
	// try to store the bitmap into a blob so we can save it
	lstr_Info.bmiheader.bisize = 40
	// Get the bitmapinfo
	If GetDIBits(lul_hdcMem, lul_hBitmap, 0, aul_height, 0, lstr_Info, 0) > 0 Then
		lul_pixels = lstr_info.bmiheader.biwidth * lstr_info.bmiheader.biheight
		lstr_Info.bmiColor[lul_pixels] = 0
		lblb_bitmap = Blob(space(lstr_Info.bmiheader.bisizeimage),EncodingANSI!)
		// get the actual bits
		GetDIBits(lul_hdcMem, lul_hBitmap, 0, aul_height, lblb_bitmap, lstr_Info, 0) 
		// create a bitmap header
		lstr_Header.bfType[1] = 'B'
		lstr_Header.bfType[2] = 'M'
		lstr_Header.bfSize 	= lstr_Info.bmiheader.bisizeimage
		lstr_Header.bfReserved1 = 0
		lstr_Header.bfReserved2 = 0
		lstr_Header.bfOffBits = 54 + (lul_pixels * 4)
		// copy the header structure to a blob
		lblb_header = Blob(space(14),EncodingANSI!)
		CopyBitmapFileHeader(lblb_header, lstr_Header, 14 )
		// copy the info structure to a blob
		lblb_Info = Blob(space(40  + lul_pixels * 4) ,EncodingANSI!)
		CopyBitmapInfo(lblb_Info, lstr_Info, 40 + lul_pixels * 4 )
		// add all together and we have a window bitmap in a blob
		lblb_bitmap = lblb_header + lblb_info + lblb_bitmap
	End If
End If

// Clean up handles
DeleteDC(lul_hdcMem)
ReleaseDC(aul_hWnd, lul_hdc)

Return lblb_bitmap

end function

on n_bitmap.create
call super::create
TriggerEvent( this, "constructor" )
end on

on n_bitmap.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

