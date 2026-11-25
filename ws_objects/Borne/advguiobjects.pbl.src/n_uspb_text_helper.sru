$PBExportHeader$n_uspb_text_helper.sru
forward
global type n_uspb_text_helper from nonvisualobject
end type
type inv_win32 from n_cst_win32 within n_uspb_text_helper
end type
end forward

global type n_uspb_text_helper from nonvisualobject autoinstantiate
inv_win32 inv_win32
end type

type prototypes

end prototypes

type variables
CONSTANT LONG ALIGN_LEFT = 0
CONSTANT LONG ALIGN_CENTER = 1
CONSTANT LONG ALIGN_RIGHT = 2
LONG DT_RTLREADING = 2//131072

CONSTANT LONG DT_NOCLIP = 256
CONSTANT LONG DT_VTOP = 0
CONSTANT LONG DT_VBOTTOM = 8
CONSTANT LONG DT_VCENTER = 4
CONSTANT LONG DT_HCENTER = 1
CONSTANT LONG DT_HRIGHT = 2
CONSTANT LONG DT_WORD_ELLIPSIS = 262144
CONSTANT LONG DT_CALCRECT = 1024
CONSTANT LONG DT_WORDBREAK = 16

LongPtr	il_HDC

// Object Handle
LongPtr	HDC

LongPtr iul_font

end variables

forward prototypes
public function boolean of_getbit (long al_decimal, integer ai_bit)
public function long of_bitwiseand (long al_value1, long al_value2)
public function long of_bitwiseor (long aul_arg1, long aul_arg2)
public function integer of_sethdc (LongPtr al_hdc)
public function longptr of_createfont (string as_name, long al_size, boolean ab_bold)
public function integer of_gettextheight (longptr ahdc, string as_text, string as_fontname, long al_textsize, integer al_align, long al_width, boolean ab_bold, boolean ab_elipse, boolean ab_wordwrap)
public function point of_gettextsize (longptr ahdc, string as_text, string as_fontname, long al_textsize, integer al_align, long al_height, boolean ab_bold, boolean ab_elipse, boolean ab_wordwrap)
public function integer of_gettextwidth (longptr ahdc, string as_text, string as_fontname, long al_textsize, integer al_align, long al_height, boolean ab_bold, boolean ab_elipse, boolean ab_wordwrap)
end prototypes

public function boolean of_getbit (long al_decimal, integer ai_bit);Boolean lb_null

//Check parameters
If IsNull(al_decimal) or IsNull(ai_bit) then
	SetNull(lb_null)
	Return lb_null
End If

//Assumption ai_bit is the nth bit counting right to left with
//the leftmost bit being bit one.
//al_decimal is a binary number as a base 10 long.
If Int(Mod(al_decimal / (2 ^(ai_bit - 1)), 2)) > 0 Then
	Return True
End If

Return False
end function

public function long of_bitwiseand (long al_value1, long al_value2);Integer		li_Cnt
Long			ll_Result
Boolean		lb_Value1[32], lb_Value2[32]

// Check for nulls
If IsNull(al_Value1) Or IsNull(al_Value2) Then
	SetNull(ll_Result)
	Return ll_Result
End If

// Get all bits for both values
For li_Cnt = 1 To 32
	lb_Value1[li_Cnt] = of_getbit(al_Value1, li_Cnt)
	lb_Value2[li_Cnt] = of_getbit(al_Value2, li_Cnt)
Next

// And them together
For li_Cnt = 1 To 32
	If lb_Value1[li_Cnt] And lb_Value2[li_Cnt] Then
		ll_Result = ll_Result + (2^(li_Cnt - 1))
	End If
Next

Return ll_Result
end function

public function long of_bitwiseor (long aul_arg1, long aul_arg2);//Integer		li_Cnt

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

public function integer of_sethdc (LongPtr al_hdc);il_HDC = al_hdc

RETURN 1
end function

public function longptr of_createfont (string as_name, long al_size, boolean ab_bold);LogFont lstr_Lf
LongPtr lul_Font
Char one

one = Char(1)

ULong dpi

dpi = inv_win32.GetDpiForWindow(inv_win32.WindowFromDC(il_HDC))

IF dpi = 0 THEN
	dpi = inv_win32.GetDeviceCaps(il_HDC, inv_win32.LOGPIXELSY)
END IF


lstr_Lf.lffacename = as_name
lstr_Lf.lfweight = 400
lstr_Lf.lfheight =  -1 * ( inv_win32.MulDiv(al_size, dpi, 72) )
lstr_Lf.lfPitchAndFamily = '1'
lstr_Lf.lfClipPrecision = Char(2)
lstr_Lf.lfOutPrecision = one
lstr_Lf.lfQuality = one
lstr_Lf.lfCharset = one

IF ab_bold THEN
	lstr_Lf.lfweight = 700
END IF

iul_font = inv_win32.CreateFontIndirect( lstr_Lf )

RETURN 1
end function

public function integer of_gettextheight (longptr ahdc, string as_text, string as_fontname, long al_textsize, integer al_align, long al_width, boolean ab_bold, boolean ab_elipse, boolean ab_wordwrap);Long ll_parm
LongPtr ll_selectedobject
RECT l_Rect

IF Len(as_text) = 0 THEN
	RETURN 0
END IF

IF il_HDC = 0 THEN il_HDC = ahdc

of_CreateFont(as_fontname, al_textsize, ab_bold)

ll_selectedobject = inv_win32.SelectObject(ahdc, iul_font)

IF ab_wordwrap THEN
	ll_parm = 1040 //DT_CALCRECT |  DT_WORDBREAK
ELSE
	ll_parm = DT_CALCRECT
END IF

l_Rect.Right = al_width

inv_win32.Drawtext(ahdc, as_text, LEN(as_text), l_Rect, ll_parm)

inv_win32.SelectObject(ahdc, ll_selectedobject)
inv_win32.DeleteObject(iul_font)

RETURN l_Rect.Bottom
end function

public function point of_gettextsize (longptr ahdc, string as_text, string as_fontname, long al_textsize, integer al_align, long al_height, boolean ab_bold, boolean ab_elipse, boolean ab_wordwrap);Long ll_parm
LongPtr ll_selectedobject
RECT l_Rect
Point lp_return

IF Len(as_text) = 0 THEN
	RETURN lp_return
END IF

IF il_HDC = 0 THEN il_HDC = ahdc

of_CreateFont(as_fontname, al_textsize, ab_bold)

ll_selectedobject = inv_win32.SelectObject(ahdc, iul_font)

IF ab_wordwrap THEN
	ll_parm = 1040 //DT_CALCRECT |  DT_WORDBREAK
ELSE
	ll_parm = DT_CALCRECT
END IF

l_Rect.Bottom = al_height

inv_win32.Drawtext(ahdc, as_text, LEN(as_text), l_Rect, ll_parm)

inv_win32.SelectObject(ahdc, ll_selectedobject)
inv_win32.DeleteObject(iul_font)

lp_return.PX = l_Rect.RIGHT
lp_return.PY = l_Rect.BOTTOM

RETURN lp_return
end function

public function integer of_gettextwidth (longptr ahdc, string as_text, string as_fontname, long al_textsize, integer al_align, long al_height, boolean ab_bold, boolean ab_elipse, boolean ab_wordwrap);Long ll_parm
LongPtr ll_selectedobject
RECT l_Rect

IF Len(as_text) = 0 THEN
	RETURN 0
END IF

IF il_HDC = 0 THEN il_HDC = ahdc

of_CreateFont(as_fontname, al_textsize, ab_bold)

ll_selectedobject = inv_win32.SelectObject(ahdc, iul_font)

IF ab_wordwrap THEN
	ll_parm = 1040 //DT_CALCRECT |  DT_WORDBREAK
ELSE
	ll_parm = DT_CALCRECT
END IF

l_Rect.Bottom = al_height

inv_win32.Drawtext(ahdc, as_text, LEN(as_text), l_Rect, ll_parm)

inv_win32.SelectObject(ahdc, ll_selectedobject)
inv_win32.DeleteObject(iul_font)

RETURN l_Rect.RIGHT
end function

on n_uspb_text_helper.create
call super::create
this.inv_win32=create inv_win32
TriggerEvent( this, "constructor" )
end on

on n_uspb_text_helper.destroy
TriggerEvent( this, "destructor" )
call super::destroy
destroy(this.inv_win32)
end on

type inv_win32 from n_cst_win32 within n_uspb_text_helper descriptor "pb_nvo" = "true" 
end type

on inv_win32.create
call super::create
end on

on inv_win32.destroy
call super::destroy
end on

