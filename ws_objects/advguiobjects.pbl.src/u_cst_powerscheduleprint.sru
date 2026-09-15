$PBExportHeader$u_cst_powerscheduleprint.sru
forward
global type u_cst_powerscheduleprint from userobject
end type
type st_orientation from statictext within u_cst_powerscheduleprint
end type
type ddlb_orientation from dropdownlistbox within u_cst_powerscheduleprint
end type
type sle_title from singlelineedit within u_cst_powerscheduleprint
end type
type st_title from statictext within u_cst_powerscheduleprint
end type
type st_print from statictext within u_cst_powerscheduleprint
end type
type st_printer from statictext within u_cst_powerscheduleprint
end type
type cb_cancel from u_cst_commandbutton within u_cst_powerscheduleprint
end type
type em_copies from editmask within u_cst_powerscheduleprint
end type
type st_copies from statictext within u_cst_powerscheduleprint
end type
type cb_print from u_cst_commandbutton within u_cst_powerscheduleprint
end type
type ddlb_printers from dropdownlistbox within u_cst_powerscheduleprint
end type
type uo_preview from u_cst_imageeditor within u_cst_powerscheduleprint
end type
type r_1 from rectangle within u_cst_powerscheduleprint
end type
type paintstruct from structure within u_cst_powerscheduleprint
end type
type inv_pbusexternal from n_cst_pbusexternal within u_cst_powerscheduleprint
end type
type inv_win32 from n_cst_win32 within u_cst_powerscheduleprint
end type
end forward

type paintstruct from structure
	LongPtr		hdc
	boolean		ferase
	rect		rcpaint
	boolean		frestore
	boolean		fincupdate
	boolean		rgbreserved[32]
end type

global type u_cst_powerscheduleprint from userobject
integer width = 3104
integer height = 1968
long backcolor = 16777215
string text = "none"
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
event resize pbm_size
event cancelclicked ( )
event printcomplete ( )
st_orientation st_orientation
ddlb_orientation ddlb_orientation
sle_title sle_title
st_title st_title
st_print st_print
st_printer st_printer
cb_cancel cb_cancel
em_copies em_copies
st_copies st_copies
cb_print cb_print
ddlb_printers ddlb_printers
uo_preview uo_preview
r_1 r_1
inv_pbusexternal inv_pbusexternal
inv_win32 inv_win32
end type
global u_cst_powerscheduleprint u_cst_powerscheduleprint

type prototypes
FUNCTION Ulong GetDC (LongPtr hWnd) Library "USER32.DLL"
FUNCTION int ReleaseDC (LongPtr hWnd, ulong hDC) Library "USER32.DLL"
FUNCTION LongPtr GetModuleHandle(String lpModuleName) Library "kernel32.dll" Alias For "GetModuleHandleW"
FUNCTION ULong GetProcAddress(LongPtr hModule, LongPtr lpProcName) Library "kernel32.dll" 
FUNCTION ULong SetWindowLong32(LongPtr hWnd, Integer nIndex, LongPtr dwNewLong) Library "user32.dll" Alias For "SetWindowLongW"
FUNCTION LongPtr SetWindowLong64(LongPtr hWnd, Integer nIndex, LongPtr dwNewLong) Library "user32.dll" Alias For "SetWindowLongPtrW"
FUNCTION Boolean GetClientRect(LongPtr hWnd, Ref RECT lpRect) Library "user32.dll"
FUNCTION Boolean InvalidateRect(LongPtr hWnd, RECT lpRect, Boolean bErase) Library "user32.dll"
FUNCTION ULong BeginPaint(LongPtr hwnd, Ref PAINTSTRUCT lpPaint) Library "user32.dll" Alias For "BeginPaint;Ansi" 
FUNCTION Boolean EndPaint(LongPtr hwnd, PAINTSTRUCT lpPaint) Library "user32.dll" Alias For "EndPaint;Ansi" 
FUNCTION LongPtr CreateCompatibleDC(LongPtr hdc) Library "gdi32.dll"
FUNCTION LongPtr CreateCompatibleBitmap(LongPtr hdc, Integer nWidth, Integer nHeight) Library "gdi32.dll"
FUNCTION LongPtr SelectObject(LongPtr hdc, LongPtr hgdiobj) Library "gdi32.dll"
FUNCTION Boolean BitBlt(LongPtr hdcDest, Integer nXDest, Integer nYDest, Integer nWidth, Integer nHeight, LongPtr hdcSrc, Integer nXSrc, Integer nYSrc, ULong dwRop) Library "gdi32.dll"
FUNCTION Boolean DeleteDC(LongPtr hdc) Library "gdi32.dll"
FUNCTION Boolean DeleteObject(LongPtr hObject) Library "gdi32.dll"
FUNCTION LongPtr CreateSolidBrush(Long crColor) Library "gdi32.dll"
FUNCTION Integer FillRect(LongPtr hDC, RECT lpRect, LongPtr hbr) Library "user32.dll"
FUNCTION ULong GetSystemColor(Integer nIndex) Library "user32.dll" Alias For "GetSysColor"
FUNCTION long GetVolumeInformation (string lpRootPathName, REF string lpVolumeNameBuffer, long nVolumeNameSize, REF ulong lpVolumeSerialNumber, REF long lpMaximumComponentLength, REF long lpFileSystemFlags, REF string lpFileSystemNameBuffer, long nFileSystemNameSize)LIBRARY "Kernel32.dll" ALIAS FOR "GetVolumeInformationW"
FUNCTION boolean GetUserName (ref string  lpBuffer, ref ulong nSize) Library "ADVAPI32.DLL" Alias for "GetUserNameW"
end prototypes

type variables
str_scheduleprint istr_print
u_cst_powerschedule_core iuo_schedule
u_cst_powerschedule_scheduleview iuo_scheduleview

n_cst_pbus_resize inv_resize

Integer MinWidth, MinHeight

n_uspb_resourcemanager inv_resourcemanager

boolean ib_landscape
end variables

forward prototypes
public function integer of_setresize (boolean ab_switch)
public function integer of_setschedulecontrol (u_cst_powerschedule auo_powerschedule)
public function integer of_printschedule ()
public function integer of_displayscheduleprintpreview (boolean ab_changetitle)
public function integer of_displayscheduleprintpreview ()
public function integer of_displayprintpreview (boolean ab_changetitle)
public function integer of_displayprintpreview ()
end prototypes

event resize;IF IsValid(inv_resize) THEN
	inv_resize.Trigger Event pfc_resize(sizetype, newwidth, newheight)
END IF

IF NewWidth < MinWidth THEN
	Width = MinWidth
END IF

IF NewHeight < MinHeight THEN
	Height = MinHeight
END IF
end event

public function integer of_setresize (boolean ab_switch);integer	li_rc

// Check arguments
if IsNull (ab_switch) then
	return -1
end if

if ab_Switch then
	if IsNull(inv_resize) Or not IsValid (inv_resize) then
		inv_resize = create n_cst_pbus_resize
		inv_resize.of_SetOrigSize (this.Width, this.Height)
		inv_resize.of_SetMinSize (this.Width, this.Height)
		li_rc = 1
	end if
else
	if IsValid (inv_resize) then
		destroy inv_resize
		li_rc = 1
	end if
end If

return li_rc
end function

public function integer of_setschedulecontrol (u_cst_powerschedule auo_powerschedule);iuo_schedule = auo_powerschedule.uo_schedule
iuo_scheduleview = auo_powerschedule.uo_scheduleview
RETURN 1
end function

public function integer of_printschedule ();LongPtr Job
Integer li_copies, ll_index
Long ll_width, ll_height
Integer ll_margin

PrintSetPrinter(ddlb_printers.Text)
 
li_copies = Integer(em_copies.Text)
 
// Define a new blank page.
IF Len(Trim(sle_title.Text)) = 0 THEN
	Job = PrintOpen("Schedule - Print")
ELSE
	Job = PrintOpen(sle_title.Text)
END IF

IF ib_landscape THEN
	ll_height = PixelsToUnits(10250, YPixelsToUnits!)
	ll_width = (Double(ll_height) / Double(iuo_scheduleview.il_printwidth)) * iuo_scheduleview.il_printheight
ELSE
	ll_width = PixelsToUnits(7750, XPixelsToUnits!)
	ll_height = (Double(ll_width) / Double(iuo_scheduleview.il_printwidth)) * iuo_scheduleview.il_printheight
END IF

ll_width = UnitsToPixels(ll_width, XUnitsToPixels!)
ll_height = UnitsToPixels(ll_height, YUnitsToPixels!)
ll_margin = 250

IF ib_landscape THEN
	ll_margin = 7750 - ll_width + 250
END IF

FOR ll_index = 1 TO li_copies
	PrintBitmap(Job, istr_print.ImageFile, ll_margin, 250, ll_width, ll_height)
	
	IF ll_index < li_copies THEN
		PrintPage(Job)
	END IF
	
NEXT

// Send the page to the printer and close Job.
PrintClose(Job)

POST Event PrintComplete()

RETURN 1
end function

public function integer of_displayscheduleprintpreview (boolean ab_changetitle);Integer ll_yscroll, ll_xscroll, li_totalhours
Constant Long SRCCOPY = 13369376
PAINTSTRUCT ps
RECT rc
LongPtr ll_hDC, ll_MemDC, ll_MemBitmap, ll_OrigBitmap, lul_bitmap
ULong ll_encoder
clsid l_clsid
String ls_filename
n_cst_pbus_filesys lnv_filesys
Double ld_pagewidth = 8
Double ld_pageheight = 10.5

iuo_scheduleview.SetRedraw(FALSE)

//Scroll to top
ll_yscroll = iuo_scheduleview.il_yscroll
ll_xscroll = iuo_scheduleview.il_xscroll
iuo_scheduleview.il_yscroll = 0
iuo_scheduleview.il_xscroll = 0

iuo_scheduleview.ib_printing = TRUE

// prepare control for painting
ll_hDC = BeginPaint(Handle(iuo_scheduleview), ps)

IF 	iuo_scheduleview.OnlyShowWorkingHours THEN
	li_totalhours = iuo_scheduleview.of_GetTotalWorkingHours()
ELSE
	li_totalhours = iuo_scheduleview.of_GetTotalHours()
END IF

iuo_scheduleview.il_printheight = PixelsToUnits(iuo_scheduleview.il_totalheight + iuo_scheduleview.HeaderHeight, YPixelsToUnits!)
iuo_scheduleview.il_printwidth = PixelsToUnits((li_totalhours * iuo_scheduleview.TimeColumnWidth) + iuo_scheduleview.ResourceColumnWidth, XPixelsToUnits!)

IF Len(Trim(sle_title.Text)) = 0 AND ab_changetitle THEN
	IF iuo_scheduleview.DefaultView = iuo_scheduleview.WEEK OR iuo_scheduleview.DefaultView = iuo_scheduleview.WorkWeek THEN
		istr_print.title = String(iuo_scheduleview.id_startdate) + " - " + String(RelativeDate(iuo_scheduleview.id_startdate, iuo_scheduleview.of_GetDayCount() - 1))
	ELSEIF iuo_scheduleview.DefaultView = iuo_schedule.DAY THEN
		istr_print.title = String(iuo_scheduleview.id_startdate)
	ELSE
		istr_print.title = String(iuo_scheduleview.id_startdate, "MMM, yyyy")
	END IF
	
	sle_title.Text = istr_print.title
END IF

iuo_scheduleview.is_printtitle = sle_title.Text

// set up bitmap buffer
ll_MemDC = CreateCompatibleDC(ll_hDC)
ll_MemBitmap = CreateCompatibleBitmap(ll_hDC, UnitsToPixels(iuo_scheduleview.il_printwidth, XUnitsToPixels!), UnitsToPixels(iuo_scheduleview.il_printheight, YUnitsToPixels!))
ll_OrigBitmap = SelectObject(ll_MemDC, ll_MemBitmap)

// trigger event in descendant
iuo_scheduleview.Event OnPaint(ll_MemDC)

// copy buffer to device context
BitBlt(ll_hDC, 0, 0, UnitsToPixels(iuo_scheduleview.il_printwidth, XUnitsToPixels!), UnitsToPixels(iuo_scheduleview.il_printheight, YUnitsToPixels!), &
		 ll_MemDC, 0, 0, SRCCOPY)

SetNull(ll_encoder)

//BMP clsid
l_clsid.Data1 = 1434252288
l_clsid.Data2 = 6660
l_clsid.Data3 = 4563
l_clsid.Data4[1] = 154
l_clsid.Data4[2] = 115
l_clsid.Data4[3] = 0
l_clsid.Data4[4] = 0
l_clsid.Data4[5] = 248
l_clsid.Data4[6] = 30
l_clsid.Data4[7] = 243
l_clsid.Data4[8] = 46

ls_filename = lnv_filesys.of_GetTempPath() + 'powerschedule.bmp'

IF FileExists(ls_filename) THEN
	FileDelete(ls_filename)
END IF

inv_win32.GdipCreateBitmapFromHBITMAP(ll_MemBitmap, 0, lul_bitmap)

IF ib_landscape THEN
	CONSTANT Int Rotate90FlipNone = 1
	inv_win32.GdipImageRotateFlip(lul_bitmap, Rotate90FlipNone)
END IF

inv_win32.GdipSaveImageToFile(lul_bitmap, ls_filename, l_clsid, ll_encoder) 

istr_print.imagefile = ls_filename
istr_print.width = iuo_scheduleview.il_printwidth
istr_print.height = iuo_scheduleview.il_printheight

uo_preview.of_LoadFromFile(ls_filename)

SelectObject(ll_MemDC, ll_OrigBitmap)

// cleanup memory objects
DeleteObject(lul_bitmap)
DeleteObject(ll_MemBitmap)
DeleteDC(ll_MemDC)

// mark painting as complete
EndPaint(Handle(iuo_schedule), ps)

//Clean up
iuo_scheduleview.il_yscroll = ll_yscroll
iuo_scheduleview.il_xscroll = ll_xscroll
iuo_scheduleview.ib_printing = FALSE
//FileDelete(ls_filename)

iuo_scheduleview.SetRedraw(TRUE)

RETURN 1
end function

public function integer of_displayscheduleprintpreview ();RETURN of_displayscheduleprintpreview(TRUE)
end function

public function integer of_displayprintpreview (boolean ab_changetitle);IF IsValid(iuo_scheduleview) THEN
	IF iuo_scheduleview.Visible THEN 
		RETURN of_DisplaySchedulePrintPreview(ab_changetitle)
	END IF
END IF

Integer ll_scroll
Constant Long SRCCOPY = 13369376
PAINTSTRUCT ps
RECT rc
LongPtr ll_hDC, ll_MemDC, ll_MemBitmap, ll_OrigBitmap, lul_bitmap
ULong ll_encoder
clsid l_clsid
String ls_filename
n_cst_pbus_filesys lnv_filesys
Double ld_pagewidth = 8
Double ld_pageheight = 10.5

iuo_schedule.SetRedraw(FALSE)

//Scroll to top
ll_scroll = iuo_schedule.il_yscroll
iuo_schedule.il_yscroll = 0

iuo_schedule.ib_printing = TRUE

// prepare control for painting
ll_hDC = BeginPaint(Handle(iuo_schedule), ps)

IF iuo_schedule.DefaultView = iuo_schedule.MONTH THEN
	IF ib_landscape THEN
		iuo_schedule.il_printwidth = PixelsToUnits(1200, XPixelsToUnits!)
		iuo_schedule.il_printheight = PixelsToUnits(927, YPixelsToUnits!)
	ELSE
		iuo_schedule.il_printwidth =PixelsToUnits(927, XPixelsToUnits!) //PixelsToUnits(2550, XPixelsToUnits!)
		iuo_schedule.il_printheight = PixelsToUnits(1200, YPixelsToUnits!)//PixelsToUnits(3300, YPixelsToUnits!)
	END IF
ELSE
	IF ib_landscape THEN
		iuo_schedule.il_printheight = PixelsToUnits((iuo_schedule.TimeRowHeight * 24) + iuo_schedule.HeaderHeight, YPixelsToUnits!)
		iuo_schedule.il_printwidth = Double(iuo_schedule.il_printheight) / Double(0.7) //Double(.883)
	ELSE
		iuo_schedule.il_printheight = PixelsToUnits((iuo_schedule.TimeRowHeight * 24) + iuo_schedule.HeaderHeight, YPixelsToUnits!)
		iuo_schedule.il_printwidth = Double(iuo_schedule.il_printheight) * Double(.883) //Double(0.7727272727272727) //Double(.883)
	END IF
END IF

IF Len(Trim(sle_title.Text)) = 0 AND ab_changetitle THEN
	IF iuo_schedule.DefaultView = iuo_schedule.WEEK OR iuo_schedule.DefaultView = iuo_schedule.WorkWeek THEN
		istr_print.title = String(iuo_schedule.id_startdate) + " - " + String(RelativeDate(iuo_schedule.id_startdate, iuo_schedule.of_GetDayCount() - 1))
	ELSEIF iuo_schedule.DefaultView = iuo_schedule.DAY THEN
		istr_print.title = String(iuo_schedule.id_startdate)
	ELSE
		istr_print.title = String(iuo_schedule.id_startdate, "MMM, yyyy")
	END IF
	
	sle_title.Text = istr_print.title
END IF

iuo_schedule.is_printtitle = sle_title.Text

// set up bitmap buffer
ll_MemDC = CreateCompatibleDC(ll_hDC)
ll_MemBitmap = CreateCompatibleBitmap(ll_hDC, UnitsToPixels(iuo_schedule.il_printwidth, XUnitsToPixels!), UnitsToPixels(iuo_schedule.il_printheight, YUnitsToPixels!))
ll_OrigBitmap = SelectObject(ll_MemDC, ll_MemBitmap)

// trigger event in descendant
iuo_schedule.Event OnPaint(ll_MemDC)

// copy buffer to device context
BitBlt(ll_hDC, 0, 0, UnitsToPixels(iuo_schedule.il_printwidth, XUnitsToPixels!), UnitsToPixels(iuo_schedule.il_printheight, YUnitsToPixels!), &
		 ll_MemDC, 0, 0, SRCCOPY)

SetNull(ll_encoder)

//BMP clsid
l_clsid.Data1 = 1434252288
l_clsid.Data2 = 6660
l_clsid.Data3 = 4563
l_clsid.Data4[1] = 154
l_clsid.Data4[2] = 115
l_clsid.Data4[3] = 0
l_clsid.Data4[4] = 0
l_clsid.Data4[5] = 248
l_clsid.Data4[6] = 30
l_clsid.Data4[7] = 243
l_clsid.Data4[8] = 46

ls_filename = lnv_filesys.of_GetTempPath() + 'powerschedule.bmp'

IF FileExists(ls_filename) THEN
	FileDelete(ls_filename)
END IF

inv_win32.GdipCreateBitmapFromHBITMAP(ll_MemBitmap, 0, lul_bitmap)

IF ib_landscape THEN
	CONSTANT Int Rotate90FlipNone = 1
	inv_win32.GdipImageRotateFlip(lul_bitmap, Rotate90FlipNone)
END IF

inv_win32.GdipSaveImageToFile(lul_bitmap, ls_filename, l_clsid, ll_encoder) 

istr_print.imagefile = ls_filename
istr_print.width = iuo_schedule.il_printwidth
istr_print.height = iuo_schedule.il_printheight
//istr_print.theme = Theme

uo_preview.of_LoadFromFile(ls_filename)

SelectObject(ll_MemDC, ll_OrigBitmap)

// cleanup memory objects
DeleteObject(lul_bitmap)
DeleteObject(ll_MemBitmap)
DeleteDC(ll_MemDC)

// mark painting as complete
EndPaint(Handle(iuo_schedule), ps)

//Clean up
iuo_schedule.il_yscroll = ll_scroll
iuo_schedule.ib_printing = FALSE
//FileDelete(ls_filename)

iuo_schedule.SetRedraw(TRUE)

RETURN 1
end function

public function integer of_displayprintpreview ();RETURN of_displayprintpreview(TRUE)
end function

on u_cst_powerscheduleprint.create
this.st_orientation=create st_orientation
this.ddlb_orientation=create ddlb_orientation
this.sle_title=create sle_title
this.st_title=create st_title
this.st_print=create st_print
this.st_printer=create st_printer
this.cb_cancel=create cb_cancel
this.em_copies=create em_copies
this.st_copies=create st_copies
this.cb_print=create cb_print
this.ddlb_printers=create ddlb_printers
this.uo_preview=create uo_preview
this.r_1=create r_1
this.inv_pbusexternal=create inv_pbusexternal
this.inv_win32=create inv_win32
this.Control[]={this.st_orientation,&
this.ddlb_orientation,&
this.sle_title,&
this.st_title,&
this.st_print,&
this.st_printer,&
this.cb_cancel,&
this.em_copies,&
this.st_copies,&
this.cb_print,&
this.ddlb_printers,&
this.uo_preview,&
this.r_1}
end on

on u_cst_powerscheduleprint.destroy
destroy(this.st_orientation)
destroy(this.ddlb_orientation)
destroy(this.sle_title)
destroy(this.st_title)
destroy(this.st_print)
destroy(this.st_printer)
destroy(this.cb_cancel)
destroy(this.em_copies)
destroy(this.st_copies)
destroy(this.cb_print)
destroy(this.ddlb_printers)
destroy(this.uo_preview)
destroy(this.r_1)
destroy(this.inv_pbusexternal)
destroy(this.inv_win32)
end on

event constructor;of_SetResize(TRUE)
MinWidth = Width
MinHeight = Height
inv_resize.of_SetMinSize(MinWidth, MinHeight)
inv_resize.of_Register(uo_preview, inv_resize.SCALERIGHTBOTTOM)
inv_resize.of_Register(r_1, inv_resize.SCALERIGHTBOTTOM)
inv_resize.of_Register(cb_print, inv_resize.FIXEDBOTTOM)
inv_resize.of_Register(cb_cancel, inv_resize.FIXEDBOTTOM)

uo_preview.of_DisplayActionButtons(FALSE)

cb_print.Text = inv_resourcemanager.of_GetString("btn_print")
cb_cancel.Text = inv_resourcemanager.of_GetString("btn_cancel")
st_copies.Text = inv_resourcemanager.of_GetString("lbl_copies")
st_printer.Text = inv_resourcemanager.of_GetString("lbl_printer")
st_title.Text = inv_resourcemanager.of_GetString("lbl_printtitle")
st_print.Text = inv_resourcemanager.of_GetString("lbl_print")
st_orientation.Text = inv_resourcemanager.of_GetString("LBL_PrintOrientation")

ddlb_orientation.AddItem(inv_resourcemanager.of_GetString("LBL_PrintPortriat"))
ddlb_orientation.AddItem(inv_resourcemanager.of_GetString("LBL_PrintLandscape"))
ddlb_orientation.Text = inv_resourcemanager.of_GetString("LBL_PrintPortriat")

Long ll_posreturn, ll_postab
String ls_left, ls_prntrs
String ls_fullstring
String ls_name

ls_prntrs  = PrintGetPrinters ( )
DO WHILE Len(Trim(ls_prntrs)) > 0
	ll_posreturn=pos (ls_prntrs, "~n" ) 
	
	IF ll_posreturn = 0 THEN EXIT
	
	ls_left = Left (ls_prntrs, ll_posreturn - 1)
	
	IF Len(Trim(ls_left)) = 0 THEN EXIT
	
	ll_postab=pos (ls_left, "~t")
	ls_name=left(ls_left, ll_postab -1)
	
	ddlb_printers.AddItem(ls_name)
	ls_prntrs = Mid (ls_prntrs, ll_posreturn + 1)
LOOP


ls_fullstring=PrintGetPrinter()
ll_postab=pos (ls_fullstring, "~t")
ls_name=left(ls_fullstring, ll_postab -1)

ddlb_printers.Text = ls_name
end event

event destructor;of_SetResize(FALSE)
end event

type st_orientation from statictext within u_cst_powerscheduleprint
integer x = 82
integer y = 984
integer width = 457
integer height = 88
boolean bringtotop = true
integer textsize = -11
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Segoe UI"
long textcolor = 33554432
long backcolor = 16777215
string text = "Orientation"
boolean focusrectangle = false
end type

type ddlb_orientation from dropdownlistbox within u_cst_powerscheduleprint
integer x = 82
integer y = 1088
integer width = 960
integer height = 300
integer taborder = 50
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Segoe UI"
long textcolor = 33554432
boolean sorted = false
borderstyle borderstyle = stylelowered!
end type

event selectionchanged;CHOOSE CASE index
	CASE 1
		ib_landscape = FALSE
		of_DisplayPrintPreview()
	CASE 2
		ib_landscape = TRUE
		of_DisplayPrintPreview()
END CHOOSE
end event

type sle_title from singlelineedit within u_cst_powerscheduleprint
integer x = 82
integer y = 280
integer width = 960
integer height = 112
integer taborder = 40
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Segoe UI"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
end type

event losefocus;of_DisplayPrintPreview(FALSE)
end event

type st_title from statictext within u_cst_powerscheduleprint
integer x = 82
integer y = 172
integer width = 457
integer height = 88
boolean bringtotop = true
integer textsize = -11
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Segoe UI"
long textcolor = 33554432
long backcolor = 16777215
string text = "Title"
boolean focusrectangle = false
end type

type st_print from statictext within u_cst_powerscheduleprint
integer x = 50
integer y = 32
integer width = 402
integer height = 100
integer textsize = -14
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Segoe UI"
long textcolor = 33554432
long backcolor = 16777215
string text = "Print"
boolean focusrectangle = false
end type

type st_printer from statictext within u_cst_powerscheduleprint
integer x = 82
integer y = 448
integer width = 457
integer height = 88
boolean bringtotop = true
integer textsize = -11
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Segoe UI"
long textcolor = 33554432
long backcolor = 16777215
string text = "Printer"
boolean focusrectangle = false
end type

type cb_cancel from u_cst_commandbutton within u_cst_powerscheduleprint
integer x = 539
integer y = 1832
integer taborder = 40
boolean bringtotop = true
string text = "Cancel"
boolean cancel = true
end type

event clicked;call super::clicked;Event CancelClicked()
end event

type em_copies from editmask within u_cst_powerscheduleprint
integer x = 82
integer y = 808
integer width = 439
integer height = 112
integer taborder = 50
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Segoe UI"
long textcolor = 33554432
string text = "1"
borderstyle borderstyle = stylelowered!
string mask = "###"
boolean spin = true
double increment = 1
string minmax = "1~~"
end type

type st_copies from statictext within u_cst_powerscheduleprint
integer x = 82
integer y = 716
integer width = 402
integer height = 84
boolean bringtotop = true
integer textsize = -11
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 16777215
string text = "Copies:"
boolean focusrectangle = false
end type

type cb_print from u_cst_commandbutton within u_cst_powerscheduleprint
integer x = 82
integer y = 1832
integer taborder = 30
boolean bringtotop = true
string text = "Print"
string iconname = "print!"
end type

event clicked;call super::clicked;IF IsValid(iuo_scheduleview) THEN
	IF iuo_scheduleview.Visible THEN RETURN of_PrintSchedule()
END IF

LongPtr Job
Integer li_copies, ll_index
 
PrintSetPrinter(ddlb_printers.Text)
 
li_copies = Integer(em_copies.Text)
 
// Define a new blank page.
IF Len(Trim(sle_title.Text)) = 0 THEN
	Job = PrintOpen("Schedule - Print")
ELSE
	Job = PrintOpen(sle_title.Text)
END IF

//PrintDefineFont ( Job, 1, 'Segoe UI', -8, 400, Default!, AnyFont!, FALSE, FALSE )

FOR ll_index = 1 TO li_copies
	
	//PrintBitmap(Job, istr_print.ImageFile, 250, 250 + 125, 8000 - 250, 10500 - 375)
	PrintBitmap(Job, istr_print.ImageFile, 250, 250, 8000 - 250, 10500 - 250)
	//PrintText(Job, sle_title.Text, 250, 250, 1)
	
	IF ll_index < li_copies THEN
		PrintPage(Job)
	END IF
	
NEXT

// Send the page to the printer and close Job.
PrintClose(Job)

POST Event PrintComplete()
end event

type ddlb_printers from dropdownlistbox within u_cst_powerscheduleprint
integer x = 82
integer y = 552
integer width = 960
integer height = 772
integer taborder = 40
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Segoe UI"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
end type

type uo_preview from u_cst_imageeditor within u_cst_powerscheduleprint
event destroy ( )
integer x = 1129
integer y = 172
integer width = 1934
integer height = 1768
integer taborder = 30
boolean bringtotop = true
long backcolor = 67108864
end type

on uo_preview.destroy
call u_cst_imageeditor::destroy
end on

event constructor;call super::constructor;THIS.ImageBackgroundColor = RGB(225,225,225)
end event

type r_1 from rectangle within u_cst_powerscheduleprint
long linecolor = 10789024
integer linethickness = 4
long fillcolor = 1073741824
integer x = 1125
integer y = 168
integer width = 1943
integer height = 1776
end type

type inv_pbusexternal from n_cst_pbusexternal within u_cst_powerscheduleprint descriptor "pb_nvo" = "true" 
end type

on inv_pbusexternal.create
call super::create
end on

on inv_pbusexternal.destroy
call super::destroy
end on

type inv_win32 from n_cst_win32 within u_cst_powerscheduleprint descriptor "pb_nvo" = "true" 
end type

on inv_win32.create
call super::create
end on

on inv_win32.destroy
call super::destroy
end on

