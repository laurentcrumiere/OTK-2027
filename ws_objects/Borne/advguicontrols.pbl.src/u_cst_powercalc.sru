$PBExportHeader$u_cst_powercalc.sru
forward
global type u_cst_powercalc from u_cst_pbus_base
end type
type sle_calchidden from singlelineedit within u_cst_powercalc
end type
type uo_17x from u_cst_powercalcbutton within u_cst_powercalc
end type
type uo_18x from u_cst_powercalcbutton within u_cst_powercalc
end type
type uo_19x from u_cst_powercalcbutton within u_cst_powercalc
end type
type uo_20x from u_cst_powercalcbutton within u_cst_powercalc
end type
type uo_13x from u_cst_powercalcbutton within u_cst_powercalc
end type
type uo_14x from u_cst_powercalcbutton within u_cst_powercalc
end type
type uo_15x from u_cst_powercalcbutton within u_cst_powercalc
end type
type uo_16x from u_cst_powercalcbutton within u_cst_powercalc
end type
type uo_9x from u_cst_powercalcbutton within u_cst_powercalc
end type
type uo_10x from u_cst_powercalcbutton within u_cst_powercalc
end type
type uo_11x from u_cst_powercalcbutton within u_cst_powercalc
end type
type uo_12x from u_cst_powercalcbutton within u_cst_powercalc
end type
type uo_5x from u_cst_powercalcbutton within u_cst_powercalc
end type
type uo_6x from u_cst_powercalcbutton within u_cst_powercalc
end type
type uo_7x from u_cst_powercalcbutton within u_cst_powercalc
end type
type uo_8x from u_cst_powercalcbutton within u_cst_powercalc
end type
type uo_4x from u_cst_powercalcbutton within u_cst_powercalc
end type
type uo_3x from u_cst_powercalcbutton within u_cst_powercalc
end type
type uo_2x from u_cst_powercalcbutton within u_cst_powercalc
end type
type uo_1x from u_cst_powercalcbutton within u_cst_powercalc
end type
type sle_value from singlelineedit within u_cst_powercalc
end type
type st_pbus_powercalc from statictext within u_cst_powercalc
end type
type inv_win32 from n_cst_win32 within u_cst_powercalc
end type
end forward

global type u_cst_powercalc from u_cst_pbus_base
integer width = 1289
integer height = 1080
event keydown pbm_keydown
sle_calchidden sle_calchidden
uo_17x uo_17x
uo_18x uo_18x
uo_19x uo_19x
uo_20x uo_20x
uo_13x uo_13x
uo_14x uo_14x
uo_15x uo_15x
uo_16x uo_16x
uo_9x uo_9x
uo_10x uo_10x
uo_11x uo_11x
uo_12x uo_12x
uo_5x uo_5x
uo_6x uo_6x
uo_7x uo_7x
uo_8x uo_8x
uo_4x uo_4x
uo_3x uo_3x
uo_2x uo_2x
uo_1x uo_1x
sle_value sle_value
st_pbus_powercalc st_pbus_powercalc
inv_win32 inv_win32
end type
global u_cst_powercalc u_cst_powercalc

type variables
String is_CurrentTheme
n_cst_pbui_theme inv_color_theme

//Styles
CONSTANT Long FLAT = 1
CONSTANT Long RAISED = 2

Private Double mdblResult
Private Double mdblSavedNumber
Private String mstrDot
Private String mstrOp
Private String mstrDisplay
Private Boolean mblnDecEntered
Private Boolean mblnOpPending
Private Boolean mblnNewEquals
Private Boolean mblnEqualsPressed
Private Integer mintCurrKeyIndex

Private String decimalSep
end variables

forward prototypes
public function integer of_settheme (string as_color)
public function long of_getcolor (string as_color)
public function integer of_keypressed (string as_key)
public function long of_bitwiseor (long aul_arg1, long aul_arg2)
public function integer of_setfocus ()
public function double of_getvalue ()
public function integer of_setbackcolor (long al_color)
public function integer of_setstyle (long al_style)
public function integer of_settextcolor (long al_color)
end prototypes

public function integer of_settheme (string as_color);
IF IsValid(inv_color_theme) THEN DESTROY inv_color_theme
inv_color_theme = CREATE USING "n_cst_pbui_theme_" + as_color
is_CurrentTheme = as_color

sle_value.BackColor = of_GetColor("BACKGROUND1")
sle_value.TextColor = of_GetColor("ITEMTEXT")
of_SetBackColor(of_GetColor("BACKGROUND2"))
of_SetTextColor(of_GetColor("ITEMTEXT"))

SetRedraw(TRUE)

RETURN 1
end function

public function long of_getcolor (string as_color);IF NOT IsValid(inv_color_theme) THEN
	RETURN 0
END IF

RETURN inv_color_theme.of_GetColor(inv_color_theme.PowerCalc, as_color)
end function

public function integer of_keypressed (string as_key);String strPressedKey, lblDisplay

sle_calchidden.SetFocus()

If mstrDisplay = "ERROR" Then
  mstrDisplay = ""
End If

strPressedKey = as_key

CHOOSE Case strPressedKey
  Case "0", "1", "2", "3", "4", &
		 "5", "6", "7", "8", "9"
		If mblnOpPending Then
			 mstrDisplay = ""
			 mblnOpPending = False
		End If
		If mblnEqualsPressed Then
			 mstrDisplay = ""
			 mblnEqualsPressed = False
		End If
		mstrDisplay = mstrDisplay + strPressedKey
  Case ".", ","
		If mblnOpPending Then
			 mstrDisplay = ""
			 mblnOpPending = False
		End If
		If mblnEqualsPressed Then
			 mstrDisplay = ""
			 mblnEqualsPressed = False
		End If
		If Pos(mstrDisplay, ".", 1) > 0 OR Pos(mstrDisplay, ",", 1) > 0 Then
			 //Beep?
		Else
			 mstrDisplay = mstrDisplay + strPressedKey
		End If
  Case "+", "-", "X", "x", "/"
		IF Len(Trim(mstrOp)) > 0 THEN of_KeyPressed("=")
	
		mdblResult = Double(mstrDisplay)

		mstrOp = strPressedKey
		mblnOpPending = True
		mblnDecEntered = False
		mblnNewEquals = True
  Case "%"
		mdblSavedNumber = (Double(mstrDisplay) / 100) * mdblResult
		mstrDisplay = String(mdblSavedNumber)
  Case "="
		If mblnNewEquals Then
			 mdblSavedNumber = Double(mstrDisplay)
			 mblnNewEquals = False
		End If
		CHOOSE Case mstrOp
			 Case "+"
				  mdblResult = mdblResult + mdblSavedNumber
			 Case "-"
				  mdblResult = mdblResult - mdblSavedNumber
			 Case "X", "x"
				  mdblResult = mdblResult * mdblSavedNumber
			 Case "/"
				  If mdblSavedNumber = 0 Then
						mstrDisplay = "ERROR"
				  Else
						mdblResult = mdblResult / mdblSavedNumber
				  End If
			 Case Else
				  mdblResult = Double(mstrDisplay)
		End CHOOSE
		If mstrDisplay <> "ERROR" Then
			 mstrDisplay = String(mdblResult)
		End If
		mblnEqualsPressed = True
		
		mstrOp = ""
  Case "+/-"
		If mstrDisplay <> "" Then
			 If Left(mstrDisplay, 1) = "-" Then
				  mstrDisplay = Right(mstrDisplay, Len(mstrDisplay) - 1)
			 Else
				  mstrDisplay = "-" + mstrDisplay
			 End If
		End If
  Case "Backspace", "Õ"
		If Double(mstrDisplay) <> 0 Then
			 mstrDisplay = Left(mstrDisplay, Len(mstrDisplay) - 1)
			 mdblResult = Double(mstrDisplay)
		End If
  Case "CE"
		mstrDisplay = ""
  Case "C"
		mstrDisplay = ""
		mdblResult = 0
		mdblSavedNumber = 0
  Case "1/x"
		If Double(mstrDisplay) = 0 Then
			 mstrDisplay = "ERROR"
		Else
			 mdblResult = Double(mstrDisplay)
			 mdblResult = 1 / mdblResult
			 mstrDisplay = String(mdblResult)
		End If
  Case "sqrt"
//		If Val(mstrDisplay) < 0 Then
//			 mstrDisplay = "ERROR"
//		Else
//			 mdblResult = Double(mstrDisplay)
//			 mdblResult = Sqr(mdblResult)
//			 mstrDisplay = Format$(mdblResult)
//		End If
END CHOOSE
  
If mstrDisplay = "" Then
  lblDisplay = "0"
Else
//	IF Pos(mstrDisplay, ".", 1) > 0 THEN
//		mstrDot = ""
//	ELSE
//		mstrDot = "."
//	END IF
  lblDisplay = mstrDisplay// + mstrDot
//  If Left(lblDisplay, 1) = "0" Then
//		lblDisplay = Mid(lblDisplay, 2)
//  End If
End If

//If lblDisplay = "." Then lblDisplay = "0."

IF decimalSep = "." THEN
	IF strPressedKey <> "." THEN
		IF Right(lblDisplay, 1) = "." AND Left(lblDisplay, 1) <> '.' THEN
			lblDisplay = Right(lblDisplay, Len(lblDisplay) - 1)
		END IF
	END IF
END IF 

IF decimalSep = "," THEN
	IF strPressedKey <> "," THEN
		IF Right(lblDisplay, 1) = "," AND Left(lblDisplay, 1) <> ',' THEN
			lblDisplay = Right(lblDisplay, Len(lblDisplay) - 1)
		END IF
	END IF
END IF

sle_value.Text = lblDisplay

RETURN 1
end function

public function long of_bitwiseor (long aul_arg1, long aul_arg2);
ulong ul_exp, ul_exp_last=1, ul_bit1, ul_bit2, ul_ret
long ll_i

for ll_i = 1 to 31

            ul_exp=2^ll_i
            ul_bit1=mod(aul_arg1,ul_exp)
            ul_bit2=mod(aul_arg2,ul_exp)

            if ul_bit1>0 or ul_bit2>0 then
                        ul_ret+=ul_exp_last
            end if

            ul_exp_last=ul_exp
            aul_arg1 -=ul_bit1
            aul_arg2 -=ul_bit2
next

if aul_arg1>0 or aul_arg2>0 then
            ul_ret+=ul_exp_last
end if


return ul_ret
end function

public function integer of_setfocus ();sle_value.SetFocus()

RETURN 1
end function

public function double of_getvalue ();IF IsNumber(sle_value.Text) THEN
	RETURN Double(sle_value.Text)
ELSE
	RETURN 0
END IF
end function

public function integer of_setbackcolor (long al_color);u_cst_powercalcbutton luo_button
Long ll_index, ll_count

THIS.Backcolor = al_color

ll_count = UpperBound(THIS.Control)

FOR ll_index = 1 TO ll_count
	
	IF Pos(THIS.Control[ll_index].ClassName(), "uo_", 1) > 0 AND &
	   Pos(THIS.Control[ll_index].ClassName(), "x", 1) > 0 THEN
			luo_button = THIS.Control[ll_index]
			luo_button.of_SetBackcolor(al_color)
	END IF
	
NEXT

RETURN 1
end function

public function integer of_setstyle (long al_style);u_cst_powercalcbutton luo_button
Long ll_index, ll_count

ll_count = UpperBound(THIS.Control)

FOR ll_index = 1 TO ll_count
	IF Pos(THIS.Control[ll_index].ClassName(), "uo_", 1) > 0 AND &
	   Pos(THIS.Control[ll_index].ClassName(), "x", 1) > 0 THEN
		
			luo_button = THIS.Control[ll_index]
			
			IF al_style = RAISED THEN
				luo_button.Border = TRUE
				luo_button.BorderStyle = StyleRaised!
			ELSE
				luo_button.Border = FALSE
			END IF
	END IF
	
NEXT

RETURN 1
end function

public function integer of_settextcolor (long al_color);u_cst_powercalcbutton luo_button
Long ll_index, ll_count

ll_count = UpperBound(THIS.Control)

FOR ll_index = 1 TO ll_count
	
	IF Pos(THIS.Control[ll_index].ClassName(), "uo_", 1) > 0 AND &
	   Pos(THIS.Control[ll_index].ClassName(), "x", 1) > 0 THEN
			luo_button = THIS.Control[ll_index]
			luo_button.of_SetTextcolor(al_color)
	END IF
	
NEXT

RETURN 1
end function

on u_cst_powercalc.create
int iCurrent
call super::create
this.sle_calchidden=create sle_calchidden
this.uo_17x=create uo_17x
this.uo_18x=create uo_18x
this.uo_19x=create uo_19x
this.uo_20x=create uo_20x
this.uo_13x=create uo_13x
this.uo_14x=create uo_14x
this.uo_15x=create uo_15x
this.uo_16x=create uo_16x
this.uo_9x=create uo_9x
this.uo_10x=create uo_10x
this.uo_11x=create uo_11x
this.uo_12x=create uo_12x
this.uo_5x=create uo_5x
this.uo_6x=create uo_6x
this.uo_7x=create uo_7x
this.uo_8x=create uo_8x
this.uo_4x=create uo_4x
this.uo_3x=create uo_3x
this.uo_2x=create uo_2x
this.uo_1x=create uo_1x
this.sle_value=create sle_value
this.st_pbus_powercalc=create st_pbus_powercalc
this.inv_win32=create inv_win32
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.sle_calchidden
this.Control[iCurrent+2]=this.uo_17x
this.Control[iCurrent+3]=this.uo_18x
this.Control[iCurrent+4]=this.uo_19x
this.Control[iCurrent+5]=this.uo_20x
this.Control[iCurrent+6]=this.uo_13x
this.Control[iCurrent+7]=this.uo_14x
this.Control[iCurrent+8]=this.uo_15x
this.Control[iCurrent+9]=this.uo_16x
this.Control[iCurrent+10]=this.uo_9x
this.Control[iCurrent+11]=this.uo_10x
this.Control[iCurrent+12]=this.uo_11x
this.Control[iCurrent+13]=this.uo_12x
this.Control[iCurrent+14]=this.uo_5x
this.Control[iCurrent+15]=this.uo_6x
this.Control[iCurrent+16]=this.uo_7x
this.Control[iCurrent+17]=this.uo_8x
this.Control[iCurrent+18]=this.uo_4x
this.Control[iCurrent+19]=this.uo_3x
this.Control[iCurrent+20]=this.uo_2x
this.Control[iCurrent+21]=this.uo_1x
this.Control[iCurrent+22]=this.sle_value
this.Control[iCurrent+23]=this.st_pbus_powercalc
end on

on u_cst_powercalc.destroy
call super::destroy
destroy(this.sle_calchidden)
destroy(this.uo_17x)
destroy(this.uo_18x)
destroy(this.uo_19x)
destroy(this.uo_20x)
destroy(this.uo_13x)
destroy(this.uo_14x)
destroy(this.uo_15x)
destroy(this.uo_16x)
destroy(this.uo_9x)
destroy(this.uo_10x)
destroy(this.uo_11x)
destroy(this.uo_12x)
destroy(this.uo_5x)
destroy(this.uo_6x)
destroy(this.uo_7x)
destroy(this.uo_8x)
destroy(this.uo_4x)
destroy(this.uo_3x)
destroy(this.uo_2x)
destroy(this.uo_1x)
destroy(this.sle_value)
destroy(this.st_pbus_powercalc)
destroy(this.inv_win32)
end on

event constructor;IF Len(Trim(is_CurrentTheme)) = 0 THEN
	n_cst_ui_imagelist lnv_theme
	of_SetTheme(lnv_theme.of_GetGlobalTheme())
ELSE
	of_SetTheme(is_CurrentTheme)
END IF

Double d_val
String s_temp
d_val = 1
s_temp = String(d_val / 2)

IF Pos(s_temp, ",") > 0 THEN
	decimalSep = ","
ELSE
	decimalSep = "."
END IF

uo_19x.of_SetButton(decimalSep)

uo_1x.of_SetParent(THIS)
uo_2x.of_SetParent(THIS)
uo_3x.of_SetParent(THIS)
uo_4x.of_SetParent(THIS)
uo_5x.of_SetParent(THIS)
uo_6x.of_SetParent(THIS)
uo_7x.of_SetParent(THIS)
uo_8x.of_SetParent(THIS)
uo_9x.of_SetParent(THIS)
uo_10x.of_SetParent(THIS)
uo_11x.of_SetParent(THIS)
uo_12x.of_SetParent(THIS)
uo_13x.of_SetParent(THIS)
uo_14x.of_SetParent(THIS)
uo_15x.of_SetParent(THIS)
uo_16x.of_SetParent(THIS)
uo_17x.of_SetParent(THIS)
uo_18x.of_SetParent(THIS)
uo_19x.of_SetParent(THIS)
uo_20x.of_SetParent(THIS)

uo_3x.st_1.facename = "Wingdings"

inv_resize = CREATE n_cst_pbus_resize
inv_resize.of_SetOrigSize (1289, 1080)

inv_resize.of_register(sle_value, inv_resize.SCALERIGHT)

THIS.EVENT Resize(0, Width,Height)



Long ES_RIGHT = 2
Constant Long GWL_STYLE = -16
Long oldStyle
Long newStyle

oldStyle = inv_win32.GetWindowLong(Handle(sle_value), GWL_STYLE)
newStyle = of_BitWiseOr(oldStyle , ES_RIGHT)
inv_win32.SetWindowLong(Handle(sle_value), GWL_STYLE, newStyle)



end event

event resize;call super::resize;Long ll_width, ll_height, ll_fontsize, ll_backy

ll_height = (newheight - 12 - uo_1x.Y - 16) / 5
ll_width = (newwidth - 10 - 15) / 4

uo_1x.Resize(ll_width, ll_height)
uo_2x.Move(ll_width + 5, uo_2x.Y)
uo_2x.Resize(ll_width, ll_height)
uo_3x.Move((ll_width + 5) * 2, uo_3x.Y)
uo_3x.Resize(ll_width, ll_height)
uo_4x.Move((ll_width + 5) * 3, uo_4x.Y)
uo_4x.Resize(ll_width, ll_height)

uo_5x.Move(uo_5x.X, uo_2x.Y + ll_height + 4)
uo_5x.Resize(ll_width, ll_height)
uo_6x.Move(ll_width + 5, uo_2x.Y + ll_height + 4)
uo_6x.Resize(ll_width, ll_height)
uo_7x.Move((ll_width + 5) * 2, uo_3x.Y + ll_height + 4)
uo_7x.Resize(ll_width, ll_height)
uo_8x.Move((ll_width + 5) * 3, uo_4x.Y + ll_height + 4)
uo_8x.Resize(ll_width, ll_height)

uo_9x.Move(uo_9x.X, uo_2x.Y + ((ll_height + 4) * 2))
uo_9x.Resize(ll_width, ll_height)
uo_10x.Move(ll_width + 5, uo_2x.Y + ((ll_height + 4) * 2))
uo_10x.Resize(ll_width, ll_height)
uo_11x.Move((ll_width + 5) * 2, uo_3x.Y + ((ll_height + 4) * 2))
uo_11x.Resize(ll_width, ll_height)
uo_12x.Move((ll_width + 5) * 3, uo_4x.Y + ((ll_height + 4) * 2))
uo_12x.Resize(ll_width, ll_height)

uo_13x.Move(uo_13x.X, uo_2x.Y + ((ll_height + 4) * 3))
uo_13x.Resize(ll_width, ll_height)
uo_14x.Move(ll_width + 5, uo_2x.Y + ((ll_height + 4) * 3))
uo_14x.Resize(ll_width, ll_height)
uo_15x.Move((ll_width + 5) * 2, uo_3x.Y + ((ll_height + 4) * 3))
uo_15x.Resize(ll_width, ll_height)
uo_16x.Move((ll_width + 5) * 3, uo_4x.Y + ((ll_height + 4) * 3))
uo_16x.Resize(ll_width, ll_height)

uo_17x.Move(uo_17x.X, uo_2x.Y + ((ll_height + 4) * 4))
uo_17x.Resize(ll_width, ll_height)
uo_18x.Move(ll_width + 5, uo_2x.Y + ((ll_height + 4) * 4))
uo_18x.Resize(ll_width, ll_height)
uo_19x.Move((ll_width + 5) * 2, uo_3x.Y + ((ll_height + 4) * 4))
uo_19x.Resize(ll_width, ll_height)
uo_20x.Move((ll_width + 5) * 3, uo_4x.Y + ((ll_height + 4) * 4))
uo_20x.Resize(ll_width, ll_height)


IF newwidth > 2800 AND newheight > 2000 THEN
	ll_backy = 24
	ll_fontsize = -36
ELSE
	ll_backy = 24
	ll_fontsize = -26
END IF

IF newwidth < 2400 OR newheight < 1600 THEN
	ll_backy = 24
	ll_fontsize = -26
END IF

IF newwidth < 1600 OR newheight < 1400 THEN
	ll_backy = 24
	ll_fontsize = -20
END IF

IF newwidth < 1294 OR newheight < 1124 THEN
	ll_backy = 12
	ll_fontsize = -16
END IF

IF newwidth < 965 OR newheight < 800 THEN
	ll_backy = 4
	ll_fontsize = -10
END IF

uo_1x.st_1.textsize = ll_fontsize
uo_2x.st_1.textsize = ll_fontsize
uo_3x.st_1.textsize = ll_fontsize
uo_3x.st_1.Y = ll_backy
uo_4x.st_1.textsize = ll_fontsize
uo_5x.st_1.textsize = ll_fontsize
uo_6x.st_1.textsize = ll_fontsize
uo_7x.st_1.textsize = ll_fontsize
uo_8x.st_1.textsize = ll_fontsize
uo_9x.st_1.textsize = ll_fontsize
uo_10x.st_1.textsize = ll_fontsize
uo_11x.st_1.textsize = ll_fontsize
uo_12x.st_1.textsize = ll_fontsize
uo_13x.st_1.textsize = ll_fontsize
uo_14x.st_1.textsize = ll_fontsize
uo_15x.st_1.textsize = ll_fontsize
uo_16x.st_1.textsize = ll_fontsize
uo_17x.st_1.textsize = ll_fontsize
uo_18x.st_1.textsize = ll_fontsize
uo_19x.st_1.textsize = ll_fontsize
uo_20x.st_1.textsize = ll_fontsize
end event

event destructor;call super::destructor;//
end event

type sle_calchidden from singlelineedit within u_cst_powercalc
event keypressed pbm_keydown
boolean visible = false
integer x = 187
integer y = 520
integer width = 686
integer height = 212
integer taborder = 30
integer textsize = -16
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Segoe UI"
long textcolor = 33554432
string text = "none"
borderstyle borderstyle = stylelowered!
end type

event keypressed;CHOOSE CASE Key
	CASE Key1!, KeyNumpad1!
		of_KeyPressed("1")
	CASE Key2!, KeyNumpad2!
		of_KeyPressed("2")
	CASE Key3!, KeyNumpad3!
		of_KeyPressed("3")
	CASE Key4!, KeyNumpad4!
		of_KeyPressed("4")
	CASE Key5!, KeyNumpad5!
		IF KeyDown(KeyShift!) THEN
			of_KeyPressed("%")
		ELSE
			of_KeyPressed("5")
		END IF
	CASE Key6!, KeyNumpad6!
		of_KeyPressed("6")
	CASE Key7!, KeyNumpad7!
		of_KeyPressed("7")
	CASE Key8!, KeyNumpad8!
		of_KeyPressed("8")
	CASE Key9!, KeyNumpad9!
		of_KeyPressed("9")
	CASE Key0!, KeyNumpad0!
		of_KeyPressed("0")
	CASE KeyMultiply!
		of_KeyPressed("x")
	CASE KeyAdd!
		of_KeyPressed("+")
	CASE KeySubtract!
		of_KeyPressed("-")
	CASE KeyDecimal!
		IF decimalSep = "." THEN
			of_KeyPressed(".")
		END IF
		IF decimalSep = "," THEN
			of_KeyPressed(",")
		END IF
	CASE KeyComma!
		IF decimalSep = "," THEN
			of_KeyPressed(",")
		END IF
	CASE KeyDivide!
		of_KeyPressed("/")
	CASE KeyBack!
		of_KeyPressed("Õ")
	CASE KeyDelete!
		of_KeyPressed("CE")
	CASE KeyEscape!
		of_KeyPressed("C")
	CASE KeyEnter!
		of_KeyPressed("=")
END CHOOSE

end event

type uo_17x from u_cst_powercalcbutton within u_cst_powercalc
integer x = 5
integer y = 884
integer taborder = 50
string ls_button = "+/-"
end type

on uo_17x.destroy
call u_cst_powercalcbutton::destroy
end on

type uo_18x from u_cst_powercalcbutton within u_cst_powercalc
integer x = 325
integer y = 884
integer taborder = 40
string ls_button = "0"
end type

on uo_18x.destroy
call u_cst_powercalcbutton::destroy
end on

type uo_19x from u_cst_powercalcbutton within u_cst_powercalc
integer x = 645
integer y = 884
integer taborder = 60
string ls_button = "."
end type

on uo_19x.destroy
call u_cst_powercalcbutton::destroy
end on

type uo_20x from u_cst_powercalcbutton within u_cst_powercalc
integer x = 965
integer y = 884
integer taborder = 50
string ls_button = "="
end type

on uo_20x.destroy
call u_cst_powercalcbutton::destroy
end on

type uo_13x from u_cst_powercalcbutton within u_cst_powercalc
integer x = 5
integer y = 704
integer taborder = 30
string ls_button = "1"
end type

on uo_13x.destroy
call u_cst_powercalcbutton::destroy
end on

type uo_14x from u_cst_powercalcbutton within u_cst_powercalc
integer x = 325
integer y = 704
integer taborder = 50
string ls_button = "2"
end type

on uo_14x.destroy
call u_cst_powercalcbutton::destroy
end on

type uo_15x from u_cst_powercalcbutton within u_cst_powercalc
integer x = 645
integer y = 704
integer taborder = 40
string ls_button = "3"
end type

on uo_15x.destroy
call u_cst_powercalcbutton::destroy
end on

type uo_16x from u_cst_powercalcbutton within u_cst_powercalc
integer x = 965
integer y = 704
integer taborder = 50
string ls_button = "+"
end type

on uo_16x.destroy
call u_cst_powercalcbutton::destroy
end on

type uo_9x from u_cst_powercalcbutton within u_cst_powercalc
integer x = 5
integer y = 524
integer taborder = 40
string ls_button = "4"
end type

on uo_9x.destroy
call u_cst_powercalcbutton::destroy
end on

type uo_10x from u_cst_powercalcbutton within u_cst_powercalc
integer x = 325
integer y = 524
integer taborder = 30
string ls_button = "5"
end type

on uo_10x.destroy
call u_cst_powercalcbutton::destroy
end on

type uo_11x from u_cst_powercalcbutton within u_cst_powercalc
integer x = 645
integer y = 524
integer taborder = 40
string ls_button = "6"
end type

on uo_11x.destroy
call u_cst_powercalcbutton::destroy
end on

type uo_12x from u_cst_powercalcbutton within u_cst_powercalc
integer x = 965
integer y = 524
integer taborder = 40
string ls_button = "-"
end type

on uo_12x.destroy
call u_cst_powercalcbutton::destroy
end on

type uo_5x from u_cst_powercalcbutton within u_cst_powercalc
integer x = 5
integer y = 344
integer taborder = 20
string ls_button = "7"
end type

on uo_5x.destroy
call u_cst_powercalcbutton::destroy
end on

type uo_6x from u_cst_powercalcbutton within u_cst_powercalc
integer x = 325
integer y = 344
integer taborder = 30
string ls_button = "8"
end type

on uo_6x.destroy
call u_cst_powercalcbutton::destroy
end on

type uo_7x from u_cst_powercalcbutton within u_cst_powercalc
integer x = 645
integer y = 344
integer taborder = 30
string ls_button = "9"
end type

on uo_7x.destroy
call u_cst_powercalcbutton::destroy
end on

type uo_8x from u_cst_powercalcbutton within u_cst_powercalc
integer x = 965
integer y = 344
integer taborder = 40
string ls_button = "x"
end type

on uo_8x.destroy
call u_cst_powercalcbutton::destroy
end on

type uo_4x from u_cst_powercalcbutton within u_cst_powercalc
integer x = 965
integer y = 164
integer taborder = 30
string ls_button = "/"
end type

on uo_4x.destroy
call u_cst_powercalcbutton::destroy
end on

type uo_3x from u_cst_powercalcbutton within u_cst_powercalc
integer x = 645
integer y = 164
integer taborder = 30
string ls_button = "Õ"
end type

on uo_3x.destroy
call u_cst_powercalcbutton::destroy
end on

type uo_2x from u_cst_powercalcbutton within u_cst_powercalc
integer x = 325
integer y = 164
integer taborder = 20
string ls_button = "C"
end type

on uo_2x.destroy
call u_cst_powercalcbutton::destroy
end on

type uo_1x from u_cst_powercalcbutton within u_cst_powercalc
integer x = 5
integer y = 164
integer taborder = 20
string ls_button = "CE"
end type

on uo_1x.destroy
call u_cst_powercalcbutton::destroy
end on

type sle_value from singlelineedit within u_cst_powercalc
event keydown pbm_keydown
integer x = 9
integer y = 8
integer width = 1262
integer height = 144
integer taborder = 10
boolean bringtotop = true
integer textsize = -18
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Segoe UI"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
end type

event getfocus;sle_calchidden.SetFocus()
end event

type st_pbus_powercalc from statictext within u_cst_powercalc
integer width = 10002
integer height = 10000
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 16777215
long backcolor = 8421376
string text = "  PowerCalc"
boolean focusrectangle = false
end type

event constructor;Hide()
end event

type inv_win32 from n_cst_win32 within u_cst_powercalc descriptor "pb_nvo" = "true" 
end type

on inv_win32.create
call super::create
end on

on inv_win32.destroy
call super::destroy
end on

