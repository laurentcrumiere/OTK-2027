$PBExportHeader$w_pbus_message.srw
forward
global type w_pbus_message from window
end type
type uo_tip from u_cst_canvas within w_pbus_message
end type
type shl_additionalinfo from statichyperlink within w_pbus_message
end type
type cb_1 from u_cst_commandbutton within w_pbus_message
end type
type cb_2 from u_cst_commandbutton within w_pbus_message
end type
type cb_3 from u_cst_commandbutton within w_pbus_message
end type
type st_message from statictext within w_pbus_message
end type
type st_title from statictext within w_pbus_message
end type
type inv_win32 from n_cst_win32 within w_pbus_message
end type
end forward

global type w_pbus_message from window
integer width = 3369
integer height = 772
windowtype windowtype = response!
long backcolor = 67108864
string icon = "AppIcon!"
boolean clientedge = true
event nccalcsize pbm_nccalcsize
uo_tip uo_tip
shl_additionalinfo shl_additionalinfo
cb_1 cb_1
cb_2 cb_2
cb_3 cb_3
st_message st_message
st_title st_title
inv_win32 inv_win32
end type
global w_pbus_message w_pbus_message

type prototypes
FUNCTION long ShellExecute( ulong hWnd, string Operation, string lpFile, string  lpParameters, string lpDirectory, int nShowCmd ) LIBRARY "shell32.dll" ALIAS FOR "ShellExecuteW"

Subroutine CopyNMHDR ( &
	Ref NMHDR Destination, &
	ulong Source, &
	long Length &
	) Library  "kernel32.dll" Alias For "RtlMoveMemory"

Subroutine CopyNMTTCUSTOMDRAW ( &
	Ref NMCUSTOMDRAWINFO Destination, &
	ulong Source, &
	long Length &
	) Library  "kernel32.dll" Alias For "RtlMoveMemory"
end prototypes

type variables
str_powermessage i_message

CONSTANT Integer SM_CYCAPTION = 4
CONSTANT Integer SM_CXBORDER = 5
CONSTANT Integer SM_CYBORDER = 6
CONSTANT Integer SM_CXSIZEFRAME = 32
CONSTANT Integer SM_CYSIZEFRAME = 33


end variables

forward prototypes
public subroutine of_close (string as_button)
public function long of_gettextheight (string as_text)
private function integer of_openfile (string as_file)
public function integer of_gettextwidth (string as_text)
public function integer of_displaytip (string as_tip)
public function integer of_resize ()
end prototypes

event nccalcsize;Message.Processed = TRUE
RETURN 0

end event

public subroutine of_close (string as_button);Long ll_rtn

CHOOSE CASE as_button
	CASE "Abort"
		ll_rtn = 1
	CASE "Yes", "OK", "Retry"
		IF i_message.Buttons = AbortRetryIgnore! THEN
			ll_rtn = 2
		ELSE
			ll_rtn = 1
		END IF
	CASE "No"
		ll_rtn = 2
	CASE "Cancel", "Ignore"
		IF i_message.Buttons = OKCancel! THEN
			ll_rtn = 2
		ELSEIF i_message.Buttons = RetryCancel! THEN
			ll_rtn = 2
		ELSE
			ll_rtn = 3
		END IF
	CASE i_message.Button1Text
		ll_rtn = 1
	CASE i_message.Button2Text
		ll_rtn = 2
	CASE i_message.Button3Text
		ll_rtn = 3
END CHOOSE

CloseWithReturn(THIS, ll_rtn)
end subroutine

public function long of_gettextheight (string as_text);LongPtr lul_Handle, lul_hDC
n_uspb_text_helper lnv_texthelper
Integer li_newHeight

lul_Handle = Handle(st_message)
lul_hDC = inv_win32.GetDC(lul_Handle)

lnv_texthelper.of_SetHdc(lul_hDC)

li_newHeight = lnv_texthelper.of_gettextheight (lul_hDC, as_text,"Segoe UI",  i_message.MessageTextSize, lnv_texthelper.ALIGN_LEFT, UnitsToPixels(st_message.Width, XUnitsToPixels!), FALSE, FALSE, TRUE)

inv_win32.ReleaseDC(lul_Handle, lul_hDC)

RETURN PixelsToUnits(li_newHeight, YPixelsToUnits!) + 4
end function

private function integer of_openfile (string as_file);String ls_null

SetNull(ls_null)

ShellExecute( 0 , "open", as_file, ls_Null, ls_Null, 1)

RETURN 1
end function

public function integer of_gettextwidth (string as_text);LongPtr lul_Handle, lul_hDC
n_uspb_text_helper lnv_texthelper
Integer li_newWidth

lul_Handle = Handle(shl_additionalinfo)
lul_hDC = inv_win32.GetDC(lul_Handle)

lnv_texthelper.of_SetHdc(lul_hDC)

li_newWidth = lnv_texthelper.of_gettextwidth (lul_hDC, as_text,"Segoe UI",  10, lnv_texthelper.ALIGN_LEFT, 50, FALSE, FALSE, FALSE)

inv_win32.ReleaseDC(lul_Handle, lul_hDC)

RETURN PixelsToUnits(li_newWidth, XPixelsToUnits!) + 4
 
end function

public function integer of_displaytip (string as_tip);Long ll_null
Rect rc
ULong ll_dc
n_uspb_text_helper lnv_texthelper
Integer li_newHeight

SetNull(ll_null)

IF uo_tip.Visible THEN
	uo_tip.Hide()
ELSE

	ll_dc = inv_win32.GetDC(Handle(shl_additionalinfo))
	lnv_texthelper.of_SetHDC(ll_dc)
	li_newHeight = lnv_texthelper.of_gettextheight (ll_dc, as_tip, 'Segoe UI', 9, lnv_texthelper.ALIGN_LEFT, 350 - 8, FALSE, FALSE, TRUE)
	
	inv_win32.ReleaseDC(Handle(shl_additionalinfo), ll_dc)
	
	uo_tip.Move(shl_additionalinfo.X + (shl_additionalinfo.Width / 2) - PixelsToUnits(175, XPixelsToUnits!) , shl_additionalinfo.Y - PixelsToUnits(li_newHeight + 8 + 20, YPixelsToUnits!))
	uo_tip.Resize(PixelsToUnits(350, XPixelsToUnits!), PixelsToUnits(li_newHeight + 8 + 10, YPixelsToUnits!))
	
	uo_tip.Show()
END IF

RETURN 1
end function

public function integer of_resize ();long ll_workingx, ll_workingwidth
Long ll_textheight, ll_adjust, ll_maxheight, ll_yadjust, ll_xadjust

i_message = Message.PowerObjectParm

cb_1.of_SetTheme(i_message.Theme)
cb_2.of_SetTheme(i_message.Theme)
cb_3.of_SetTheme(i_message.Theme)

IF i_message.ParentWindow.TriggerEvent("pbus_customcaptionwindow") < 1 THEN
	ll_yadjust = PixelsToUnits(inv_win32.GetSystemMetrics(SM_CYBORDER), YPixelsToUnits!)
	ll_xadjust += PixelsToUnits(inv_win32.GetSystemMetrics(SM_CXSIZEFRAME), XPixelsToUnits!)
END IF

THIS.Width = i_message.ParentWindow.Width - (ll_xadjust * 2)
THIS.Y = i_message.ParentWindow.Y + ((i_message.ParentWindow.Height - THIS.Height) / 2)
THIS.X = i_message.ParentWindow.X + ll_xadjust

ll_workingwidth = Width / 2
ll_workingx = ll_workingwidth / 2

st_title.X = ll_workingx
st_title.Width = ll_workingwidth
st_message.X = ll_workingx + 50
st_message.Width = ll_workingwidth - 50

st_message.TextSize = i_message.MessageTextSize * -1
st_title.TextSize = i_message.TitleTextSize * -1

cb_1.X = ll_workingx + ll_workingwidth - ((cb_1.Width + 32) * 3)
cb_2.X = ll_workingx + ll_workingwidth - ((cb_2.Width + 32) * 2)
cb_3.X = ll_workingx + ll_workingwidth - ((cb_3.Width + 32))

ll_textheight = of_gettextheight(i_message.Message)

ll_adjust = ll_textheight - st_message.Height

ll_maxheight = i_message.ParentWindow.Height * .75

IF Height + ll_adjust > ll_maxheight THEN
	ll_adjust = ll_maxheight - Height
END IF

st_message.Height = st_message.Height + ll_adjust

cb_1.Y = cb_1.Y + ll_adjust
cb_2.Y = cb_2.Y + ll_adjust
cb_3.Y = cb_3.Y + ll_adjust

THIS.Y = THIS.Y - (ll_adjust / 2)
THIS.Height = Height + ll_adjust

IF Len(Trim(i_message.LinkLabel)) > 0 THEN
	shl_additionalinfo.Text = i_message.LinkLabel
	shl_additionalinfo.Y = cb_3.Y + ( (cb_3.Height / 2) -  (shl_additionalinfo.Height / 2)) - 8
	shl_additionalinfo.Width = of_GetTextWidth(i_message.LinkLabel)
	shl_additionalinfo.Show()
END IF
		
CHOOSE CASE i_message.Buttons
	CASE OK!
		IF shl_additionalinfo.Visible THEN
			shl_additionalinfo.X = cb_3.X - 100 - shl_additionalinfo.Width
		END IF
	CASE OKCancel!
		IF shl_additionalinfo.Visible THEN
			shl_additionalinfo.X = cb_2.X - 100 - shl_additionalinfo.Width
		END IF
	CASE YesNo!
		IF shl_additionalinfo.Visible THEN
			shl_additionalinfo.X = cb_2.X - 100 - shl_additionalinfo.Width
		END IF
	CASE YesNoCancel!
		IF shl_additionalinfo.Visible THEN
			shl_additionalinfo.X = cb_1.X - 100 - shl_additionalinfo.Width
		END IF
	CASE RetryCancel!
		IF shl_additionalinfo.Visible THEN
			shl_additionalinfo.X = cb_2.X - 100 - shl_additionalinfo.Width
		END IF
	CASE AbortRetryIgnore!		
		IF shl_additionalinfo.Visible THEN
			shl_additionalinfo.X = cb_1.X - 100 - shl_additionalinfo.Width
		END IF
END CHOOSE

RETURN 1
end function

on w_pbus_message.create
this.uo_tip=create uo_tip
this.shl_additionalinfo=create shl_additionalinfo
this.cb_1=create cb_1
this.cb_2=create cb_2
this.cb_3=create cb_3
this.st_message=create st_message
this.st_title=create st_title
this.inv_win32=create inv_win32
this.Control[]={this.uo_tip,&
this.shl_additionalinfo,&
this.cb_1,&
this.cb_2,&
this.cb_3,&
this.st_message,&
this.st_title}
end on

on w_pbus_message.destroy
destroy(this.uo_tip)
destroy(this.shl_additionalinfo)
destroy(this.cb_1)
destroy(this.cb_2)
destroy(this.cb_3)
destroy(this.st_message)
destroy(this.st_title)
destroy(this.inv_win32)
end on

event open;long ll_workingx, ll_workingwidth
Long ll_textheight, ll_adjust, ll_maxheight, ll_yadjust, ll_xadjust
n_uspb_resourcemanager inv_resourcemanager

i_message = Message.PowerObjectParm

IF i_message.TimeOut > 0 THEN
	Timer(i_message.TimeOut)
END IF

cb_1.of_SetTheme(i_message.Theme)
cb_2.of_SetTheme(i_message.Theme)
cb_3.of_SetTheme(i_message.Theme)

of_Resize()

st_title.Text = i_message.Title
st_message.Text = i_message.Message

THIS.backcolor = i_message.Background
st_title.backcolor = i_message.Background
st_message.backcolor = i_message.Background
shl_additionalinfo.backcolor = i_message.Background

cb_1.Default = FALSE
cb_2.Default = FALSE
cb_3.Default = FALSE
		
CHOOSE CASE i_message.Buttons
	CASE OK!
		cb_1.Hide()
		cb_2.Hide()
		
		IF Len(Trim(i_message.Button1Text)) > 0 THEN
			cb_3.Text = i_message.Button1Text
		ELSE
			i_message.Button1Text =  inv_resourcemanager.of_GetString("BTN_OK")
			cb_3.Text = i_message.Button1Text
		END IF
		
		cb_3.Default = TRUE
	CASE OKCancel!
		cb_1.Hide()
		
		IF Len(Trim(i_message.Button1Text)) > 0 THEN
			cb_2.Text = i_message.Button1Text
		ELSE
			i_message.Button1Text = inv_resourcemanager.of_GetString("BTN_OK")
			cb_2.Text = i_message.Button1Text
		END IF
		
		IF Len(Trim(i_message.Button2Text)) > 0 THEN
			cb_3.Text = i_message.Button2Text
		ELSE
			i_message.Button2Text = inv_resourcemanager.of_GetString("BTN_Cancel")
			cb_3.Text = i_message.Button2Text
		END IF
		
		IF i_message.Default = 2 THEN
			cb_3.Default = TRUE
		ELSE
			cb_2.Default = TRUE
		END IF
		
	CASE YesNo!
		cb_1.Hide()

		IF Len(Trim(i_message.Button1Text)) > 0 THEN
			cb_2.Text = i_message.Button1Text
		ELSE
			i_message.Button1Text = inv_resourcemanager.of_GetString("BTN_Yes")
			cb_2.Text = i_message.Button1Text
		END IF
		
		IF Len(Trim(i_message.Button2Text)) > 0 THEN
			cb_3.Text = i_message.Button2Text
		ELSE
			i_message.Button2Text = inv_resourcemanager.of_GetString("BTN_No")
			cb_3.Text = i_message.Button2Text
		END IF
		
		IF i_message.Default = 2 THEN
			cb_3.Default = TRUE
		ELSE
			cb_2.Default = TRUE
		END IF
	CASE YesNoCancel!

		IF Len(Trim(i_message.Button1Text)) > 0 THEN
			cb_1.Text = i_message.Button1Text
		ELSE
			i_message.Button1Text = inv_resourcemanager.of_GetString("BTN_Yes")
			cb_1.Text = i_message.Button1Text
		END IF
		
		IF Len(Trim(i_message.Button2Text)) > 0 THEN
			cb_2.Text = i_message.Button2Text
		ELSE
			i_message.Button2Text = inv_resourcemanager.of_GetString("BTN_No")
			cb_2.Text = i_message.Button2Text
		END IF
		
		IF Len(Trim(i_message.Button3Text)) > 0 THEN
			cb_3.Text = i_message.Button3Text
		ELSE
			i_message.Button3Text = inv_resourcemanager.of_GetString("BTN_Cancel")
			cb_3.Text = i_message.Button3Text
		END IF
		
		IF i_message.Default = 2 THEN
			cb_2.Default = TRUE
		ELSEIF i_message.Default = 3 THEN
			cb_3.Default = TRUE
		ELSE
			cb_1.Default = TRUE
		END IF
	CASE RetryCancel!
		cb_1.Hide()

		IF Len(Trim(i_message.Button1Text)) > 0 THEN
			cb_2.Text = i_message.Button1Text
		ELSE
			i_message.Button1Text = inv_resourcemanager.of_GetString("BTN_Retry")
			cb_2.Text = i_message.Button1Text
		END IF
		
		IF Len(Trim(i_message.Button2Text)) > 0 THEN
			cb_3.Text = i_message.Button2Text
		ELSE
			i_message.Button2Text = inv_resourcemanager.of_GetString("BTN_Cancel")
			cb_3.Text = i_message.Button2Text
		END IF
		
		IF i_message.Default = 2 THEN
			cb_3.Default = TRUE
		ELSE
			cb_2.Default = TRUE
		END IF
	CASE AbortRetryIgnore!		
		IF Len(Trim(i_message.Button1Text)) > 0 THEN
			cb_1.Text = i_message.Button1Text
		ELSE
			i_message.Button1Text = inv_resourcemanager.of_GetString("BTN_Abort")
			cb_1.Text = i_message.Button1Text
		END IF
		
		IF Len(Trim(i_message.Button2Text)) > 0 THEN
			cb_2.Text = i_message.Button2Text
		ELSE
			i_message.Button2Text = inv_resourcemanager.of_GetString("BTN_Retry")
			cb_2.Text = i_message.Button2Text
		END IF
		
		IF Len(Trim(i_message.Button3Text)) > 0 THEN
			cb_3.Text = i_message.Button3Text
		ELSE
			i_message.Button3Text = inv_resourcemanager.of_GetString("BTN_Ignore")
			cb_3.Text = i_message.Button3Text
		END IF
		
		IF i_message.Default = 2 THEN
			cb_2.Default = TRUE
		ELSEIF i_message.Default = 3 THEN
			cb_3.Default = TRUE
		ELSE
			cb_1.Default = TRUE
		END IF
END CHOOSE

IF cb_1.Default THEN cb_1.SetFocus()
IF cb_2.Default THEN cb_2.SetFocus()
IF cb_3.Default THEN cb_3.SetFocus()
end event

event key;IF KeyDown(KeyControl!) AND key = KeyC! THEN
	
	String ls_copy
	ls_copy = "---------------------------~r~n"
	ls_copy += i_message.Title + "~r~n"
	ls_copy += "---------------------------~r~n"
	ls_copy += i_message.Message + "~r~n"
	ls_copy += "---------------------------~r~n"
	
	CHOOSE CASE i_message.Buttons
		CASE OK!
			 ls_copy += "OK~r~n"
		CASE OKCancel!
			ls_copy += "OK   Cancel~r~n"
		CASE YesNo!
			ls_copy += "Yes   No~r~n"
		CASE YesNoCancel!
			ls_copy += "Yes   No   Cancel~r~n"
		CASE RetryCancel!
			ls_copy += "Retry   Cancel~r~n"
		CASE AbortRetryIgnore!
			ls_copy += "Abort   Retry   Ignore~r~n"
	END CHOOSE
	
	
	ls_copy += "---------------------------~r~n"
	
	ClipBoard(ls_copy)
	
END IF
end event

event timer;Timer(0)

IF i_message.TimeOut > 0 THEN
	CloseWithReturn(THIS, i_message.Default)
END IF
end event

type uo_tip from u_cst_canvas within w_pbus_message
boolean visible = false
integer x = 2034
integer y = 328
integer taborder = 10
end type

on uo_tip.destroy
call u_cst_canvas::destroy
end on

event onpaint;call super::onpaint;LongPtr lul_tooltipbrush, lul_backgroundbrush
LongPtr lul_font
LongPtr lul_arrowpath
ULong lul_tooltipcolor,lul_backgroundcolor
int buttonareaheight
Int li_red, li_green, li_blue
Rect l_TextRect, lr_clipregion
GdiplusStartupInput  lstr_input
GdiplusStartupOutput lstr_output
LongPtr lul_Graphic, lul_GdiToken
n_uspb_colors lnv_colors


lstr_input.GdiplusVersion = 1
inv_win32.GdiplusStartup(lul_GdiToken, lstr_input, lstr_output)

inv_win32.GetClientRect(Handle(THIS), lr_clipregion)

IF lul_Graphic > 0 THEN
	inv_win32.GdipDeleteGraphics(lul_Graphic)
END IF

inv_win32.GdipCreateFromHDC(hdc, lul_Graphic)
inv_win32.GdipSetSmoothingMode(lul_Graphic, 5)

//Background
lnv_colors.of_SplitRGB(PARENT.backcolor, li_red, li_green, li_blue)

lul_backgroundcolor = inv_win32.PBUSMakeARGB (255, li_red, li_green, li_blue)
inv_win32.GdipCreateSolidFill(lul_backgroundcolor, lul_backgroundbrush)
inv_win32.GdipFillRectangleI(lul_graphic, lul_backgroundbrush, lr_clipregion.Left - 1, &
	                                                                               lr_clipregion.Top, &
																          lr_clipregion.Right + 1, &
																		lr_clipregion.Bottom)

//Draw ToolTip for Step
li_red = 245
li_green = 245
li_blue = 245

lul_tooltipcolor = inv_win32.PBUSMakeARGB (255, li_red, li_green, li_blue)

inv_win32.GdipCreateSolidFill(lul_tooltipcolor, lul_tooltipbrush)

inv_win32.GdipCreatePath(0, lul_arrowpath)

buttonareaheight = lr_clipregion.Bottom - 10

inv_win32.GdipAddPathLineI(lul_arrowpath, lr_clipregion.Left + ((lr_clipregion.Right - lr_clipregion.Left) / 2), buttonareaheight + 10 - 1, &
																				  lr_clipregion.Left + ((lr_clipregion.Right - lr_clipregion.Left) / 2) - 10,  buttonareaheight - 1)
inv_win32.GdipAddPathLineI(lul_arrowpath, lr_clipregion.Left + ((lr_clipregion.Right - lr_clipregion.Left) / 2) - 10, buttonareaheight - 1, &
																					lr_clipregion.Left + ((lr_clipregion.Right - lr_clipregion.Left) / 2) + 10,  buttonareaheight - 1)
	
inv_win32.GdipClosePathFigure(lul_arrowpath) 

inv_win32.GdipFillPath(lul_graphic,lul_tooltipbrush,lul_arrowpath)

inv_win32.GdipFillRectangleI(lul_graphic, lul_tooltipbrush, lr_clipregion.Left, &
	                                                                               lr_clipregion.Top, &
																          lr_clipregion.Right, &
																		lr_clipregion.Bottom - 10)

//Create Font
LogFont lstr_Lf
ULong dpi

dpi = inv_win32.GetDpiForWindow(Handle(THIS))

IF dpi = 0 THEN
	dpi = inv_win32.GetDeviceCaps(hdc, inv_win32.LOGPIXELSY)
END IF

lstr_Lf.lffacename = "Segoe UI"
lstr_Lf.lfweight = 400
lstr_Lf.lfheight = -1 * ( inv_win32.MulDiv(9, dpi, 72) )
lstr_Lf.lfPitchAndFamily = '1'
lstr_Lf.lfClipPrecision = Char(2)
lstr_Lf.lfOutPrecision = Char(1)
lstr_Lf.lfQuality = Char(1)
lstr_Lf.lfCharset = Char(1)

lul_font = inv_win32.CreateFontIndirect( lstr_Lf )

//Display Content
inv_win32.SelectObject(hdc, lul_font)
inv_win32.SetBkMode(hdc, 1)

// Position
l_TextRect.Left = lr_clipregion.Left + 4
l_TextRect.Top = lr_clipregion.Top + 4
l_TextRect.Right =  lr_clipregion.Right - 4
l_TextRect.Bottom =  lr_clipregion.Bottom - 4

inv_win32.SetTextColor(hdc, 0)

inv_win32.Drawtext(hdc, i_message.LinkData, LEN(i_message.LinkData), l_TextRect, 16)

//Cleanup
inv_win32.DeleteObject(lul_font)

//Cleanup
inv_win32.GdipDeletePath(lul_arrowpath)
inv_win32.GdipDeleteBrush(lul_tooltipbrush)
inv_win32.GdipDeleteBrush(lul_backgroundbrush)
inv_win32.GdipDeleteGraphics(lul_Graphic)
inv_win32.GdiplusShutdown(lul_GdiToken)

RETURN 1
end event

type shl_additionalinfo from statichyperlink within w_pbus_message
boolean visible = false
integer x = 101
integer y = 548
integer width = 402
integer height = 76
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Segoe UI"
boolean underline = true
string pointer = "HyperLink!"
long textcolor = 16777215
long backcolor = 67108864
string text = "Info Link"
alignment alignment = right!
boolean focusrectangle = false
end type

event clicked;IF FileExists(i_message.LinkData) THEN
	of_OpenFile(i_message.LinkData)
ELSEIF Pos(Lower(i_message.LinkData), "http://", 1) > 0 OR Pos(Lower(i_message.LinkData), "https://", 1) > 0 THEN
	POST Run("rundll32.exe url.dll,FileProtocolHandler " + i_message.LinkData)
ELSEIF Pos(Lower(i_message.LinkData), ".chm#", 1) > 0 THEN
	n_cst_pbus_string lnv_string
	String ls_parts[]
	
	lnv_string.of_ParseToArray(i_message.LinkData, "#", ls_parts)
	
	IF UpperBound(ls_parts) = 2 THEN
		IF IsNumber(ls_parts[2]) THEN
			ShowHelp(ls_parts[1], Topic!, Long(ls_parts[2]))
		END IF
	ELSE
		of_DisplayTip(i_message.LinkData)
	END IF
	
	
ELSE
	of_DisplayTip(i_message.LinkData)
END IF
end event

type cb_1 from u_cst_commandbutton within w_pbus_message
event key pbm_keydown
integer x = 1477
integer y = 536
integer width = 384
integer height = 104
integer taborder = 20
string facename = "Segoe UI"
end type

event key;PARENT.Event Key(key, keyflags)

end event

event clicked;call super::clicked;of_Close(THIS.Text)
end event

type cb_2 from u_cst_commandbutton within w_pbus_message
event key pbm_keydown
integer x = 1070
integer y = 536
integer width = 384
integer height = 104
integer taborder = 10
string facename = "Segoe UI"
end type

event key;PARENT.Event Key(key, keyflags)
end event

event clicked;call super::clicked;of_Close(THIS.Text)
end event

type cb_3 from u_cst_commandbutton within w_pbus_message
event key pbm_keydown
integer x = 667
integer y = 536
integer width = 384
integer height = 104
integer taborder = 10
string facename = "Segoe UI"
end type

event key;PARENT.Event Key(key, keyflags)
end event

event clicked;call super::clicked;of_Close(THIS.Text)
end event

type st_message from statictext within w_pbus_message
integer x = 169
integer y = 312
integer width = 1079
integer height = 108
integer textsize = -11
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Segoe UI"
long textcolor = 16777215
long backcolor = 67108864
string text = "This is a message box message"
boolean focusrectangle = false
end type

type st_title from statictext within w_pbus_message
integer x = 69
integer y = 112
integer width = 1189
integer height = 136
integer textsize = -16
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Segoe UI"
long textcolor = 16777215
long backcolor = 67108864
string text = "Title"
boolean focusrectangle = false
end type

type inv_win32 from n_cst_win32 within w_pbus_message descriptor "pb_nvo" = "true" 
end type

on inv_win32.create
call super::create
end on

on inv_win32.destroy
call super::destroy
end on

