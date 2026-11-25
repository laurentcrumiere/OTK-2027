$PBExportHeader$u_cst_ribbonmenu.sru
forward
global type u_cst_ribbonmenu from userobject
end type
type sle_altkey from singlelineedit within u_cst_ribbonmenu
end type
type uo_menu from u_cst_ribbonmenulist within u_cst_ribbonmenu
end type
type uo_footer from u_canvas within u_cst_ribbonmenu
end type
type uo_header from u_canvas within u_cst_ribbonmenu
end type
type inv_win32 from n_cst_win32 within u_cst_ribbonmenu
end type
end forward

global type u_cst_ribbonmenu from userobject
integer width = 1486
integer height = 860
long backcolor = 67108864
string text = "none"
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
event lbuttondown pbm_lbuttondown
sle_altkey sle_altkey
uo_menu uo_menu
uo_footer uo_footer
uo_header uo_header
inv_win32 inv_win32
end type
global u_cst_ribbonmenu u_cst_ribbonmenu

type variables
n_cst_tabstrip_painter in_Gradient
n_cst_ui_imagelist inv_imagelist

w_ribbonwindow iw_parent
u_cst_ribboncontainer iuo_container
n_cst_ribbontiming inv_timer

tabstrip ist_tabs[]
Buttons ist_buttons[]
Boolean ib_splitbuttons = FALSE
Boolean ib_captured
Boolean ib_rtl
Boolean ib_drawaltkeys
LongPtr il_imagelistsmall

n_uspb_hashtable inv_altkeymap
n_uspb_hashtable inv_altindexmap
Integer ii_altkeynumber

CONSTANT Long BLUE = RGB(203,220,249)
CONSTANT Long SILVER = RGB(232,232,240)
CONSTANT Long OLIVE = RGB(234,234,207)
CONSTANT Long CLASSIC = RGB(242,243,246)
string is_CurrentTheme = "BLUE"
n_cst_pbui_theme inv_color_theme

end variables

forward prototypes
public function integer of_setimage (string as_image)
public function integer of_settheme (string as_theme)
private function long of_getcolor (string as_color)
private function integer of_resizecontrols ()
public function integer of_addsplitbutton (string as_text, string as_image)
public function integer of_addsplitbuttonoption (long al_index, string as_text, string as_image, string as_description)
public function integer of_addseperator ()
public function integer of_addseperator (long al_index)
public function integer of_addcommandbutton (string as_text, string as_image, string as_command)
public function integer of_setparent (window aw_parent)
public function integer of_setcontainer (u_cst_ribboncontainer auo_container)
public function integer of_hide ()
public function integer of_show (boolean ab_altpressed)
public function integer of_righttoleft (boolean ab_switch)
public function integer of_removecommandbutton (string as_text)
public function string of_convertkeytoletter (keycode akc_key)
public function string of_getalttag (string as_text)
public function integer hide ()
end prototypes

event lbuttondown;
inv_timer.Stop()
inv_win32.ReleaseCapture()
ib_captured = FALSE
THIS.Hide()

end event

public function integer of_setimage (string as_image);ist_tabs[1].al_pic_index = inv_imagelist.of_AddImage(as_image)
il_imagelistsmall = inv_imagelist.of_GetSmallHandle()

RETURN 1
end function

public function integer of_settheme (string as_theme);IF IsValid(inv_color_theme) THEN DESTROY inv_color_theme
inv_color_theme = CREATE USING "n_cst_pbui_theme_" + as_theme

is_CurrentTheme = as_theme

uo_menu.of_SetTheme(as_theme)
uo_menu.ib_dirty = TRUE
SetRedraw(TRUE)

RETURN 1
end function

private function long of_getcolor (string as_color);RETURN inv_color_theme.of_GetColor(inv_color_theme.RibbonMenuList, as_color)

//Long ll_color
//
//CHOOSE CASE Upper(as_color)
////	CASE "BORDER"
////		ll_color = RGB(171,184,201)
//	CASE "HEADER1"
//		CHOOSE CASE il_CurrentTheme
//			CASE BLUE
//				ll_color = RGB(247,251,255)
//			CASE SILVER
//				ll_color = RGB(243,244,250)
//			CASE OLIVE
//				ll_color = RGB(244,247,222)
//			CASE CLASSIC
//				ll_color = RGB(245,244,242)
//		END CHOOSE
//		
//	CASE "HEADER2"
//		
//		CHOOSE CASE il_CurrentTheme
//			CASE BLUE
//				ll_color = RGB(228,239,251)
//			CASE SILVER
//				ll_color = RGB(243,244,250)
//			CASE OLIVE
//				ll_color = RGB(244,247,222)
//			CASE CLASSIC
//				ll_color = RGB(245,244,242)
//		END CHOOSE
//	CASE "FOOTER1"
//		
//		CHOOSE CASE il_CurrentTheme
//			CASE BLUE
//				ll_color = RGB(249,252,255)
//			CASE SILVER
//				ll_color = RGB(243,244,250)
//			CASE OLIVE
//				ll_color = RGB(244,247,222)
//			CASE CLASSIC
//				ll_color = RGB(245,244,242)
//		END CHOOSE
//	CASE "FOOTER2"
//		CHOOSE CASE il_CurrentTheme
//			CASE BLUE
//				ll_color = RGB(226,235,249)
//			CASE SILVER
//				ll_color = RGB(243,244,250)
//			CASE OLIVE
//				ll_color = RGB(244,247,222)
//			CASE CLASSIC
//				ll_color = RGB(245,244,242)
//		END CHOOSE
//	CASE "PROGRAMTABBORDER"
//		CHOOSE CASE il_CurrentTheme
//			CASE BLUE
//				ll_color = RGB(65,106,189)
//			CASE SILVER
//				ll_color = RGB(112,111,145)
//			CASE OLIVE
//				ll_color = RGB(99,122,68)
//			CASE CLASSIC
//				ll_color = RGB(128,128,128)
//		END CHOOSE
//	CASE "PROGRAMTABHOVERBORDER"
//		CHOOSE CASE il_CurrentTheme
//			CASE BLUE
//				ll_color = RGB(65,106,189)
//			CASE SILVER
//				ll_color = RGB(112,111,145)
//			CASE OLIVE
//				ll_color = RGB(99,122,68)
//			CASE CLASSIC
//				ll_color = RGB(128,128,128)
//		END CHOOSE
//	CASE "PROGRAMTABHOVER"
//		CHOOSE CASE il_CurrentTheme
//			CASE BLUE
//				ll_color = RGB(129,169,226)
//			CASE SILVER
//				ll_color = RGB(177,179,200)
//			CASE OLIVE
//				ll_color = RGB(165,189,132)
//			CASE CLASSIC
//				ll_color = RGB(177,179,200)
//		END CHOOSE
//	CASE "PROGRAMTABBACKCOLOR1"
//	
//		CHOOSE CASE il_CurrentTheme
//			CASE BLUE
//				ll_color = RGB(221,236,254)
//			CASE SILVER
//				ll_color = RGB(243,244,250)
//			CASE OLIVE
//				ll_color = RGB(244,247,222)
//			CASE CLASSIC
//				ll_color = RGB(245,244,242)
//		END CHOOSE
//		
//	CASE "PROGRAMTABBACKCOLOR2"
//		CHOOSE CASE il_CurrentTheme
//			CASE BLUE
//				ll_color = RGB(129,169,226)
//			CASE SILVER
//				ll_color = RGB(177,179,200)
//			CASE OLIVE
//				ll_color = RGB(165,189,132)
//			CASE CLASSIC
//				ll_color = RGB(177,179,200)
//		END CHOOSE
//END CHOOSE
//
//RETURN ll_color
end function

private function integer of_resizecontrols ();Long ll_width

IF ib_splitbuttons THEN
	ll_width = inv_win32.scalex(Handle(THIS), 520)
ELSE
	ll_width =  inv_win32.scalex(Handle(THIS), 220)
END IF

uo_menu.Height = uo_menu.of_GetTotalHeight()

THIS.Width = PixelsToUnits(ll_width, XPixelsToUnits!)
uo_header.Resize(THIS.Width, PixelsToUnits( inv_win32.ScaleY(Handle(THIS), 22), YPixelsToUnits!))
uo_footer.Resize(THIS.Width, PixelsToUnits( inv_win32.ScaleY(Handle(THIS), 16), YPixelsToUnits!))
uo_menu.Width = PixelsToUnits( inv_win32.scalex(Handle(THIS), 220), XPixelsToUnits!)

uo_menu.Y = uo_header.Height - PixelsToUnits( inv_win32.scaleY(Handle(THIS), 1), YPixelsToUnits!)
uo_footer.Y = uo_menu.Y + uo_menu.Height - PixelsToUnits( inv_win32.scaleY(Handle(THIS), 2), YPixelsToUnits!)

THIS.Height = uo_footer.Y + uo_footer.Height


in_Gradient.il_adjustment = 2

RETURN 1
end function

public function integer of_addsplitbutton (string as_text, string as_image);

RETURN 1
end function

public function integer of_addsplitbuttonoption (long al_index, string as_text, string as_image, string as_description);

RETURN 1
end function

public function integer of_addseperator ();uo_menu.of_AddLine()
of_ResizeControls()
RETURN 1
end function

public function integer of_addseperator (long al_index);RETURN 1
end function

public function integer of_addcommandbutton (string as_text, string as_image, string as_command);Integer ll_index
String ls_alttag

ll_index = uo_menu.of_AddItem(as_text, as_image, as_command)

ls_alttag = of_GetAltTag(uo_menu.ist_buttons[ll_index].as_originaltext)

IF inv_altkeymap.KeyExists(ls_alttag) OR Len(Trim(ls_alttag)) = 0 THEN
	ii_altkeynumber += 1
	inv_altkeymap.Put(String(ii_altkeynumber), ll_index)
	inv_altindexmap.Put(String(ll_index), String(ii_altkeynumber))
ELSE
	inv_altkeymap.Put(ls_alttag, ll_index)
	inv_altindexmap.Put(String(ll_index),ls_alttag)
END IF

of_ResizeControls()
RETURN 1
end function

public function integer of_setparent (window aw_parent);iw_parent = aw_parent
RETURN 1
end function

public function integer of_setcontainer (u_cst_ribboncontainer auo_container);iuo_container = auo_container
RETURN 1
end function

public function integer of_hide ();
POINT lp
ulong ll
ulong lul

lul = Handle(this)

inv_win32.GetCursorPos(lp)
inv_win32.Screentoclient(lul, lp)

IF lp.px < UnitsToPixels(this.X, XUnitsToPixels!) OR lp.px > UnitsToPixels(this.width, XUnitsToPixels!) OR &
	lp.py < UnitsToPixels(this.Y, YUnitsToPixels!) OR lp.py > UnitsToPixels(this.height, YUnitsToPixels!) THEN

	inv_win32.SetCapture(lul)
	ib_captured = TRUE
ELSE
	IF ib_captured THEN
		ib_captured = FALSE
		inv_win32.ReleaseCapture()
	END IF
END IF

RETURN 1
end function

public function integer of_show (boolean ab_altpressed);ib_drawaltkeys = ab_altpressed

IF ab_altpressed THEN
	sle_altkey.SetFocus()
END IF

inv_timer.Start(.1)
THIS.Show()
RETURN 1
end function

public function integer of_righttoleft (boolean ab_switch);ib_rtl = ab_switch

Long ll_width

ist_tabs[1].ab_mouseover = FALSE
ist_tabs[1].ab_selected = FALSE
ist_tabs[1].ab_programtab = TRUE
ist_tabs[1].ab_visible = TRUE
ist_tabs[1].ab_enabled = TRUE

IF ab_switch THEN
	ll_width = UnitsToPixels(1477, XUnitsToPixels!)

	ist_tabs[1].al_textx = ll_width -  inv_win32.ScaleX(Handle(THIS), 130)
	ist_tabs[1].ast_point[1].px = ll_width - inv_win32.ScaleX(Handle(THIS), 157)
	ist_tabs[1].ast_point[2].px = ll_width - inv_win32.ScaleX(Handle(THIS), 157)
	ist_tabs[1].ast_point[3].px = ll_width - inv_win32.ScaleX(Handle(THIS), 105)
	ist_tabs[1].ast_point[4].px = ll_width - inv_win32.ScaleX(Handle(THIS), 105)
	
	ist_tabs[1].ast_point[1].py = inv_win32.ScaleY(Handle(THIS), 22)
	ist_tabs[1].ast_point[2].py = inv_win32.ScaleY(Handle(THIS), 0)
	ist_tabs[1].ast_point[3].py = inv_win32.ScaleY(Handle(THIS), 0)
	ist_tabs[1].ast_point[4].py = inv_win32.ScaleY(Handle(THIS), 22)
ELSE

	ist_tabs[1].al_textx = inv_win32.ScaleX(Handle(THIS), 10)
	ist_tabs[1].ast_point[1].px = inv_win32.ScaleX(Handle(THIS), 0)
	ist_tabs[1].ast_point[1].py = inv_win32.ScaleY(Handle(THIS), 22)
	ist_tabs[1].ast_point[2].px = 0
	ist_tabs[1].ast_point[2].py = 0
	ist_tabs[1].ast_point[3].px = inv_win32.ScaleX(Handle(THIS), 52)
	ist_tabs[1].ast_point[3].py = 0
	ist_tabs[1].ast_point[4].px = inv_win32.ScaleX(Handle(THIS), 52)
	ist_tabs[1].ast_point[4].py = inv_win32.ScaleY(Handle(THIS), 22)
END IF

uo_menu.of_RightToLeft(ab_switch)

SetRedraw(TRUE)

RETURN 1
end function

public function integer of_removecommandbutton (string as_text);uo_menu.of_RemoveItem(as_text)

//Rebuild alt map
Integer ll_index, ll_count
String ls_alttag

inv_altkeymap.Clear()
inv_altindexmap.Clear()
ii_altkeynumber = 0

ll_count = UpperBound(uo_menu.ist_buttons)

FOR ll_index = 1 TO ll_count
	
	IF uo_menu.ist_buttons[ll_index].ab_line THEN CONTINUE
	
	ls_alttag = of_GetAltTag(uo_menu.ist_buttons[ll_index].as_originaltext)
	
	IF inv_altkeymap.KeyExists(ls_alttag) THEN
		ii_altkeynumber += 1
		inv_altkeymap.Put(String(ii_altkeynumber), ll_index)
		inv_altindexmap.Put(String(ll_index), String(ii_altkeynumber))
	ELSE
		inv_altkeymap.Put(ls_alttag, ll_index)
		inv_altindexmap.Put(String(ll_index), ls_alttag)
	END IF
NEXT


of_ResizeControls()
RETURN 1
end function

public function string of_convertkeytoletter (keycode akc_key);String ls_letter

 CHOOSE CASE akc_key
	CASE KeyA!
		ls_letter = 'a'
	CASE KeyB!
		ls_letter = 'b'
	CASE KeyC!
		ls_letter = 'c'
	CASE KeyD!
		ls_letter = 'd'
	CASE KeyE!
		ls_letter = 'e'
	CASE KeyF!
		ls_letter = 'f'
	CASE KeyG!
		ls_letter = 'g'
	CASE KeyH!
		ls_letter = 'h'
	CASE KeyI!
		ls_letter = 'i'
	CASE KeyJ!
		ls_letter = 'j'
	CASE KeyK!
		ls_letter = 'k'
	CASE KeyL!
		ls_letter = 'l'
	CASE KeyM!
		ls_letter = 'm'
	CASE KeyN!
		ls_letter = 'n'
	CASE KeyO!
		ls_letter = 'o'
	CASE KeyP!
		ls_letter = 'p'
	CASE KeyQ!
		ls_letter = 'q'
	CASE KeyR!
		ls_letter = 'r'
	CASE KeyS!
		ls_letter = 's'
	CASE KeyT!
		ls_letter = 't'
	CASE KeyU!
		ls_letter = 'u'
	CASE KeyV!
		ls_letter = 'v'
	CASE KeyW!
		ls_letter = 'w'
	CASE KeyX!
		ls_letter = 'x'
	CASE KeyY!
		ls_letter = 'y'
	CASE KeyZ!
		ls_letter = 'z'
	CASE Key0!
		ls_letter = '0'
	CASE Key1!
		ls_letter = '1'
	CASE Key2!
		IF KeyDown(KeyShift!) THEN
			ls_letter = '@'
		ELSE
			ls_letter = '2'
		END IF
	CASE Key3!
		ls_letter = '3'
	CASE Key4!
		ls_letter = '4'
	CASE Key5!
		ls_letter = '5'
	CASE Key6!
		ls_letter = '6'
	CASE Key7!
		ls_letter = '7'
	CASE Key8!
		IF KeyDown(KeyShift!) THEN
			ls_letter = '*'
		ELSE
			ls_letter = '8'
		END IF
	CASE Key9!
		ls_letter = '9'
	CASE KeyDash!
		IF KeyDown(KeyShift!) THEN
			ls_letter = '_'
		ELSE
			ls_letter = '-'
		END IF
END CHOOSE

RETURN ls_letter
end function

public function string of_getalttag (string as_text);Long ll_pos
ll_pos = Pos(as_text, "&", 1)

IF ll_pos = 0 THEN RETURN ""

RETURN Upper(Mid(as_text, ll_pos + 1, 1))
end function

public function integer hide ();ib_drawaltkeys = FALSE
RETURN SUPER::Hide()

end function

on u_cst_ribbonmenu.create
this.sle_altkey=create sle_altkey
this.uo_menu=create uo_menu
this.uo_footer=create uo_footer
this.uo_header=create uo_header
this.inv_win32=create inv_win32
this.Control[]={this.sle_altkey,&
this.uo_menu,&
this.uo_footer,&
this.uo_header}
end on

on u_cst_ribbonmenu.destroy
destroy(this.sle_altkey)
destroy(this.uo_menu)
destroy(this.uo_footer)
destroy(this.uo_header)
destroy(this.inv_win32)
end on

event constructor;
Long ll_index
ll_index = 1
ist_tabs[ll_index].ab_mouseover = FALSE
ist_tabs[ll_index].ab_selected = FALSE
ist_tabs[ll_index].ab_programtab = TRUE
ist_tabs[ll_index].ab_visible = TRUE
ist_tabs[ll_index].ab_enabled = TRUE
ist_tabs[ll_index].al_textwidth = inv_win32.ScaleDPI(Handle(THIS), 50)
ist_tabs[ll_index].al_textx =  inv_win32.ScaleDPIDown(Handle(THIS), 10)

ist_tabs[ll_index].ast_point[1].px = 0
ist_tabs[ll_index].ast_point[1].py =  inv_win32.ScaleDPI(Handle(THIS), 22)
ist_tabs[ll_index].ast_point[2].px = 0
ist_tabs[ll_index].ast_point[2].py = 0
ist_tabs[ll_index].ast_point[3].px =  inv_win32.ScaleDPI(Handle(THIS), 52)
ist_tabs[ll_index].ast_point[3].py = 0
ist_tabs[ll_index].ast_point[4].px =  inv_win32.ScaleDPI(Handle(THIS), 52)
ist_tabs[ll_index].ast_point[4].py =  inv_win32.ScaleDPI(Handle(THIS), 22)

ist_tabs[ll_index].al_style = iuo_container.uo_ribbon.PROGRAMTAB

inv_timer = CREATE n_cst_ribbontiming
inv_timer.i_menu = THIS
end event

type sle_altkey from singlelineedit within u_cst_ribbonmenu
event keydown pbm_keydown
boolean visible = false
integer x = 923
integer y = 344
integer width = 402
integer height = 112
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
end type

event keydown;String ls_key
Integer li_index

IF key = KeyEscape! THEN
	ib_drawaltkeys = FALSE
	IF IsValid(PARENT) THEN PARENT.TriggerEvent("lbuttondown")
END IF

ls_key = of_ConvertKeyToLetter(key)

IF NOT inv_altkeymap.KeyExists(ls_key) THEN RETURN 0

li_index = Integer(inv_altkeymap.Get(ls_key))

uo_menu.Event SelectionChanged(0, li_index)

ib_drawaltkeys = FALSE
SetRedraw(TRUE)

Message.Processed = TRUE
	
RETURN 0

end event

event losefocus;IF ib_drawaltkeys THEN
	THIS.SetFocus()
END IF

RETURN 1
end event

type uo_menu from u_cst_ribbonmenulist within u_cst_ribbonmenu
integer y = 108
integer width = 754
integer taborder = 20
integer fontsize = 10
end type

on uo_menu.destroy
call u_cst_ribbonmenulist::destroy
end on

event selectionchanged;call super::selectionchanged;PARENT.iw_parent.Post Event RibbonMenuClicked(String(of_GetData(newindex)))
IF IsValid(PARENT) THEN PARENT.TriggerEvent("lbuttondown")
THIS.ib_Dirty = TRUE
end event

event constructor;call super::constructor;THIS.iuo_parent = PARENT
end event

type uo_footer from u_canvas within u_cst_ribbonmenu
integer y = 760
integer width = 1477
integer height = 100
integer taborder = 10
end type

on uo_footer.destroy
call u_canvas::destroy
end on

event onpaint;call super::onpaint;in_Gradient.of_SetDeviceContext(THIS)
in_Gradient.of_SetHDC(hdc)

IF Left(Lower(is_CurrentTheme), 7) = 'windows' THEN
	in_Gradient.of_XpGradient(of_GetColor('FOOTER1'),  of_GetColor('FOOTER2'), THIS, TRUE, of_GetColor('BORDER'), FALSE)
ELSE
	in_Gradient.of_Vista2Gradient(of_GetColor('FOOTER1'),  of_GetColor('FOOTER2'), THIS, TRUE, of_GetColor('BORDER'), FALSE)
END IF

RETURN 1
end event

type uo_header from u_canvas within u_cst_ribbonmenu
event lbuttonup pbm_lbuttonup
event lbuttondown pbm_lbuttondown
integer width = 1477
integer height = 100
integer taborder = 10
end type

event lbuttondown;IF xpos < PixelsToUnits(inv_win32.ScaleDPI(Handle(THIS), 50), XPixelsToUnits!) THEN
	PARENT.Hide()
END IF
end event

on uo_header.destroy
call u_canvas::destroy
end on

event onpaint;call super::onpaint;ULong ll_color

in_Gradient.of_SetDeviceContext(THIS)
in_Gradient.of_SetHDC(hdc)

IF Left(Lower(is_CurrentTheme), 7) = 'windows' OR Left(Lower(is_CurrentTheme), 12) = 'powerbuilder' THEN
	in_Gradient.of_XpGradient( of_GetColor('HEADER1'),  of_GetColor('HEADER2'), THIS, TRUE, of_GetColor('BORDER'), FALSE)
ELSE
	in_Gradient.of_Vista2Gradient( of_GetColor('HEADER1'),  of_GetColor('HEADER2'), THIS, TRUE, of_GetColor('BORDER'), FALSE)
END IF

ist_tabs[1].ab_programtab = true

ist_tabs[1].al_backcolor1 = of_GetColor('PROGRAMTABBACKCOLOR1')
ist_tabs[1].al_backcolor2 = of_GetColor('PROGRAMTABBACKCOLOR2')
ist_tabs[1].al_bordercolor = of_GetColor('PROGRAMTABBORDER')
ist_tabs[1].al_textcolor = RGB(255,255,255)

ist_tabs[1].as_tab_text = iuo_container.uo_ribbon.ist_tabs[1].as_tab_text

ist_tabs[1].al_textwidth = iuo_container.uo_ribbon.ist_tabs[1].al_textwidth
ist_tabs[1].al_textx = iuo_container.uo_ribbon.ist_tabs[1].al_textx

ist_tabs[1].ast_point[1].px = iuo_container.uo_ribbon.ist_tabs[1].ast_point[1].px
ist_tabs[1].ast_point[2].px = iuo_container.uo_ribbon.ist_tabs[1].ast_point[2].px
ist_tabs[1].ast_point[3].px = iuo_container.uo_ribbon.ist_tabs[1].ast_point[3].px
ist_tabs[1].ast_point[4].px = iuo_container.uo_ribbon.ist_tabs[1].ast_point[4].px

in_Gradient.of_DrawTabs(FALSE, THIS, ist_tabs, UnitsToPixels(Width, XUnitsToPixels!), UnitsToPixels(Height, YUnitsToPixels!) , of_GetColor('BORDER'), il_imagelistsmall, FALSE, FALSE, 1, 'Segoe UI', iw_parent.FontSize, ib_rtl)

RETURN 1
end event

type inv_win32 from n_cst_win32 within u_cst_ribbonmenu descriptor "pb_nvo" = "true" 
end type

on inv_win32.create
call super::create
end on

on inv_win32.destroy
call super::destroy
end on

