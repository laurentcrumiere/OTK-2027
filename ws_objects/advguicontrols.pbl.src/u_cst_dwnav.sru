$PBExportHeader$u_cst_dwnav.sru
forward
global type u_cst_dwnav from u_cst_canvas
end type
type st_pbus_vcrnav from statictext within u_cst_dwnav
end type
type sle_value from singlelineedit within u_cst_dwnav
end type
end forward

global type u_cst_dwnav from u_cst_canvas
integer width = 498
integer height = 104
event ue_buttonclicked ( string as_button )
event ue_mousemove ( string as_button,  integer ai_xpos,  integer ai_ypos )
event ue_mouseenter ( string as_button )
event ue_mouseleave ( string as_button )
event resize pbm_size
event mousemove pbm_mousemove
event mouseenter ( long xpos,  long ypos )
event lbuttondown pbm_lbuttondown
event lbuttonup pbm_lbuttonup
event type integer ue_buttonclicking ( string as_button )
event move pbm_move
event lbuttondblclick pbm_lbuttondblclk
event type long rowinserting ( )
event rowinserted ( long row )
event rowdeleted ( long row )
event type long rowdeleting ( long al_row )
st_pbus_vcrnav st_pbus_vcrnav
sle_value sle_value
end type
global u_cst_dwnav u_cst_dwnav

type prototypes

FUNCTION unsignedlong GetSysColor(int nIndex) LIBRARY "user32.dll"
end prototypes

type variables
n_cst_ui_imagelist inv_imagelist
Datawindow i_dw

String DisplayColumn
String DefaultDisplayValue = "LBL_DWNAV_RowCountLabel"

String FirstButtonText = "BTN_DWNAV_First"
String FirstButtonTipText = "LBL_DWNAV_First_Record"
String PrevButtonText = "BTN_DWNAV_Prev"
String PrevButtonTipText = "LBL_DWNAV_Previous_Record"
String NextButtonText = "BTN_DWNAV_Next"
String NextButtonTipText = "LBL_DWNAV_Next_Record"
String LastButtonText = "BTN_DWNAV_Last"
String LastButtonTipText = "LBL_DWNAV_Last_Record"
String DeleteButtonText = "BTN_DWNAV_Delete"
String DeleteButtonTipText = "LBL_DWNAV_Delete_Record"
String InsertButtonText = "BTN_DWNAV_Insert"
String InsertButtonTipText = "LBL_DWNAV_Insert_Record"

n_uspb_resourcemanager inv_resourcemanager

CONSTANT Long BLUE = RGB(203,220,249)
CONSTANT Long SILVER = RGB(232,232,240)
CONSTANT Long OLIVE = RGB(234,234,207)
CONSTANT Long CLASSIC = RGB(242,243,246)
CONSTANT Long DEFAULT = 0
CONSTANT Long WINDOWS8_BLUE = 1
CONSTANT Long WINDOWS8_OLIVE = 2
CONSTANT Long WINDOWS8_SILVER = 3

CONSTANT Long FIRST_RECORD = 1
CONSTANT Long PREV_RECORD = 2
CONSTANT Long NEXT_RECORD = 3
CONSTANT Long LAST_RECORD = 4
CONSTANT Long INSERT_RECORD = 5
CONSTANT Long DELETE_RECORD = 6


String is_CurrentTheme = ""
n_cst_pbui_theme inv_color_theme

CONSTANT Long LINK = 1
CONSTANT Long LABEL = 2
CONSTANT Long LINE = 3

CONSTANT Long XP = 0
CONSTANT Long VISTAEMBOSSED = 1
CONSTANT Long VISTAORIGINAL = 2
CONSTANT Long VISTAGLASS = 3
CONSTANT Long CUSTOM = 4
CONSTANT Long VS2013 = 5

CONSTANT Long LEFT = 1
CONSTANT Long RIGHT = 2

//Text Position
CONSTANT Long TEXTTOP = 1
CONSTANT Long TEXTBOTTOM = 2
CONSTANT Long TEXTRIGHT = 3
CONSTANT Long TEXTLEFT = 4

Long il_CurrentTextPosition = TEXTRIGHT

Long MinWidth
Boolean TextUnderImage
String FontName = 'Tahoma'
Long FontSize = 8
Long FontColor = 0
Boolean Bold = FALSE
Boolean AutoSize = FALSE

//BCW - 2.0.0
CONSTANT Long HORIZONTAL = 1
CONSTANT Long VERTICAL = 2
Long il_CurrentOrientation = 1
//BCW - 2.0.0

Long il_CurrentStyle = XP
Long il_CurrentTheme = BLUE

Long il_TextHeight

Boolean ib_quickaccessmode
Long il_custombackground

Boolean ib_displaytext = FALSE
Boolean ib_displayborder = TRUE
Boolean ib_raisedborder = FALSE
Boolean ib_solidbackground = FALSE
Boolean ib_displaytooltips = TRUE

long il_index
long il_ID
long il_MOIndex
Long il_ChevronIndex = -1
boolean ib_mouseover = FALSE
boolean ib_mouseleave = FALSE
boolean ib_selected = FALSE
boolean ib_mousedown = FALSE
Boolean ib_fontcoloroverride = FALSE

n_cst_pbus_tooltip inv_tooltip

ToolbarItem ToolbarItemsLeft[]

window iw_parent
window iw_parentwindow
n_cst_toolbarstrip_painter in_Gradient

CONSTANT Long SMALL = 16
CONSTANT Long MEDIUM = 24
CONSTANT Long LARGE = 32
CONSTANT Long XLARGE = 48

Long il_CurrentSize = SMALL
LongPtr il_imagelistsmall
LongPtr il_imagelistmedium
LongPtr il_imagelistlarge
LongPtr il_imagelistxlarge

CONSTANT Long ILD_TRANSPARENT = 1
CONSTANT Long LVM_GETIMAGELIST = 4098
CONSTANT Long LVSIL_NORMAL = 0

Long ImageCount
Long il_LeftEndPoint
boolean ib_LeftHidden


end variables

forward prototypes
public function integer of_settheme (string as_color)
public function integer of_getwindow ()
public function integer of_displaytext (boolean ab_display)
public function long of_getcolor (string as_color)
public function integer of_displayborder (boolean ab_border)
public function integer of_setstyle (long al_style)
public function integer of_displayraisedborder (boolean ab_show)
public function integer of_displaysolidbackground (boolean ab_switch)
public function integer of_setfontname (string as_font)
public function integer of_setfontcolor (long al_color)
public function integer of_setfontsize (integer ai_fontsize)
public function integer of_getfontsize ()
public function point of_gettextwidth (string as_text, boolean ab_bold)
public function integer of_indexfrompoint (long xpos, long ypos)
private function boolean of_isinobject (long xpos, long ypos)
public function boolean of_isenabled (string as_item)
public function integer of_updatepointsleft ()
public function integer of_updatepoints ()
private function integer of_getheight ()
public function integer of_disabletooltips ()
public function integer of_enabletooltips ()
public function integer of_getactualwidth ()
public function integer of_setminbuttonwidth (long al_width)
public function long of_getindex (string as_item)
public function integer of_setparentwindow (window aw_window)
private function integer of_getwidth ()
public function long of_settheme (long al_color)
public function integer of_capturemouse ()
public function integer of_releasemouse ()
private function integer of_paint2013 (unsignedlong hdc)
public function integer of_setvisible (long al_item, boolean ab_switch)
public function integer of_settiptext (long al_item, string as_text)
public function integer of_settext (long al_item, string as_text)
public function integer of_setenabled (long al_item, boolean ab_switch)
public function boolean of_isvisible (long al_item)
public function integer of_addobject (string as_text, dragobject ado_object)
public function integer of_setdatawindow (datawindow a_dw)
public function integer of_updatevalue ()
public function integer of_updatepointsright ()
public function integer of_additem (string as_text, long al_button, string as_tiptext, integer ai_position)
public function integer of_setvaluetext (string as_text)
public function integer of_setdisplaycolumn (string as_column)
public function integer of_setvaluewidth (long al_width)
public function string of_classname ()
private function integer of_drawfirst (longptr hdc, point paintregion[], boolean ab_selected)
private function integer of_drawinsert (longptr hdc, point paintregion[], boolean ab_selected)
private function integer of_drawlast (longptr hdc, point paintregion[], boolean ab_selected)
private function integer of_drawnext (longptr hdc, point paintregion[], boolean ab_selected)
private function integer of_drawprevious (longptr hdc, point paintregion[], boolean ab_selected)
private function integer of_drawdelete (longptr hdc, point paintregion[], boolean ab_selected)
end prototypes

event ue_buttonclicked(string as_button);// button item clicked on

IF IsValid(i_dw) THEN
	CHOOSE CASE as_button
		CASE inv_resourcemanager.of_GetString(FirstButtonText)
			i_dw.SetRow(1)
			i_dw.ScrollToRow(1)
		CASE inv_resourcemanager.of_GetString(PrevButtonText)
			i_dw.SetRow(i_dw.GetRow() - 1)
			i_dw.ScrollToRow(i_dw.GetRow())
		CASE inv_resourcemanager.of_GetString(NextButtonText)
			i_dw.SetRow(i_dw.GetRow() + 1)
			i_dw.ScrollToRow(i_dw.GetRow())
		CASE inv_resourcemanager.of_GetString(LastButtonText)
			i_dw.SetRow(i_dw.RowCount())
			i_dw.ScrollToRow(i_dw.RowCount())
		CASE inv_resourcemanager.of_GetString(InsertButtonText)
			Long ll_row
			IF THIS.EVENT RowInserting() = 1 THEN
				ll_row = i_dw.InsertRow(i_dw.RowCount() + 1)
				i_dw.SetRow(ll_row)
				i_dw.ScrollToRow(ll_row)
				THIS.EVENT RowInserted(ll_row)
			END IF
		CASE inv_resourcemanager.of_GetString(DeleteButtonText)
			ll_row = i_dw.GetRow()
			IF THIS.EVENT RowDeleting(ll_row) = 1 THEN
				IF ll_row > 0 THEN
					i_dw.DeleteRow(ll_row)
					i_dw.SetRow(ll_row)
					i_dw.ScrollToRow(ll_row)
					THIS.EVENT RowDeleted(ll_row)
				END IF
			END IF
	END CHOOSE
	
	of_UpdateValue()
END IF


end event

event ue_mousemove(string as_button, integer ai_xpos, integer ai_ypos);// mouse moved over button item

end event

event ue_mouseenter(string as_button);// mouse entered button item

end event

event ue_mouseleave(string as_button);// mouse leaving button item

end event

event resize;of_UpdatePoints()
end event

event mousemove;Long ll_index, ll_chevronindex

if NOT of_ismousecaptured() then 
	
	of_capturemouse()
	ib_mouseleave = FALSE
	this.event mouseenter(xpos, ypos)
		
end if
	
	if xpos < 0 or ypos < 0 or xpos > of_GetWidth() or ypos > height or of_IsInObject(xpos, ypos) then
			IF NOT ib_selected THEN
				of_releasemouse()
				
				this.event post mouseleave()
			ELSE
				ib_mouseleave = TRUE
				of_UpdatePoints()
				SetRedraw(TRUE)
			END IF
	
	ELSE
		ib_mouseleave = FALSE
		
		Long ll_MOIndex
		ll_MOIndex = of_IndexFromPoint(xpos, ypos)
		
		IF ib_MouseDown THEN
			IF ll_MOIndex <> il_MOIndex THEN
				il_MOIndex = ll_MOIndex
				of_UpdatePoints()
				SetRedraw(TRUE)
			END IF
		END IF
			
		IF NOT ib_MouseDown THEN
			ll_index = of_IndexFromPoint(xpos, ypos)
			
			
			
			IF il_index <> ll_index THEN
				
				IF il_index > 0 THEN
					EVENT ue_mouseleave(ToolbarItemsLeft[il_index].Text)
				END IF
				
				il_index = ll_index
				
				of_UpdatePoints()
				SetRedraw(TRUE)
				
				IF il_index > 0 THEN
					EVENT ue_mouseenter(ToolbarItemsLeft[il_index].Text)
				END IF
				
				
				IF ll_index > 0 THEN
					IF Len(Trim(ToolbarItemsLeft[ll_index].TipText)) > 0 AND &
						NOT ToolbarItemsLeft[ll_index].Hidden AND ib_displaytooltips THEN
						
				
						Long li_X, li_Y, ll_return
			
						IF il_Id > 0 THEN
							li_X = 0//UnitsToPixels( Integer( X ),XUnitsToPixels! )
							li_Y = 0//UnitsToPixels( Integer( Y ), YUnitsToPixels! )
							inv_tooltip.of_UpdatetipRect( This, il_ID, &
															li_x, li_y, &
															li_x + UnitsToPixels( Integer( Width ), XUnitsToPixels! ), &
															li_y + UnitsToPixels( Integer( Height ), YUnitsToPixels! ) )
								
							
							inv_tooltip.Of_SetTipText( This, il_Id, ToolbarItemsLeft[ll_index].TipText) 
						END IF
					END IF
				ELSE
					inv_tooltip.of_UpdatetipRect( This, il_ID, &
														0, 0, &
														0, &
														0 )
				END IF
			
			END IF
		END IF
	end if

//end if
end event

event mouseenter(long xpos, long ypos);Long li_X, li_Y, ll_return

//inv_win32.TrackMouseEvent(istr_TRACKMOUSEEVENT) 

end event

event lbuttondown;ib_mousedown = TRUE
ib_selected = TRUE

il_index = of_IndexFromPoint(xpos, ypos)

IF il_index > 0 THEN
	IF  NOT ToolbarItemsLeft[il_index].Enabled THEN
		il_index = -1
	END IF
END IF

il_MOIndex = il_index
of_UpdatePoints()
SetRedraw(TRUE)
end event

event lbuttonup;Boolean ib_click
Long ll_index

IF ib_selected AND NOT ib_mouseleave AND il_index = il_MOIndex THEN
	ib_click = TRUE
END IF

ll_index = il_index

ib_selected = FALSE
ib_mouseleave = FALSE
ib_mousedown = FALSE
of_ReleaseMouse()
il_index = of_IndexFromPoint(xpos, ypos)

IF il_index > 0 THEN
	IF  NOT ToolbarItemsLeft[il_index].Enabled THEN
		il_index = -1
	END IF
END IF

il_MOIndex = il_index
of_UpdatePoints()
SetRedraw(TRUE)

IF ib_click AND ll_index > 0 THEN
	Long ll_return
	ll_return = Event ue_ButtonClicking(ToolbarItemsLeft[ll_index].Text)
	
	IF IsNull(ll_return) THEN ll_return = 0
	
	IF ll_return = 0 THEN
		Event ue_ButtonClicked(ToolbarItemsLeft[ll_index].Text)
	END IF
END IF

end event

event move;Integer	 li_RC
li_RC	 = Super::Move(X, Y)

of_UpdatePoints()

Return(li_RC)
end event

event lbuttondblclick;il_index = of_IndexFromPoint(xpos, ypos)
RETURN THIS.EVENT lbuttonup(flags, xpos, ypos)
end event

event type long rowinserting();RETURN 1
end event

event type long rowdeleting(long al_row);RETURN 1
end event

public function integer of_settheme (string as_color);
IF IsValid(inv_color_theme) THEN DESTROY inv_color_theme
inv_color_theme = CREATE USING "n_cst_pbui_theme_" + as_color
is_CurrentTheme = as_color

of_UpdatePoints()
SetRedraw(TRUE)

RETURN 1
end function

public function integer of_getwindow ();PowerObject	lpo_parent
Window lw_window

IF IsValid(iw_parent) THEN RETURN 0

// loop thru parents until a window is found
lpo_parent = GetParent()
Do While lpo_parent.TypeOf() <> Window! and IsValid(lpo_parent)
	lpo_parent = lpo_parent.GetParent()
Loop

// set return to the window or null if not found
If IsValid (lpo_parent) Then
	lw_window = lpo_parent
Else
	SetNull(lw_window)
End If

iw_parent = lw_window

RETURN 1
end function

public function integer of_displaytext (boolean ab_display);Long ll_index, ll_count

ll_count = UpperBound(ToolbarItemsLeft)

FOR ll_index = 1 TO ll_count
	ToolbarItemsLeft[ll_index].DisplayText = ab_display
NEXT

of_UpdatePoints()
SetRedraw(TRUE)

RETURN 1
end function

public function long of_getcolor (string as_color);IF il_CurrentStyle = VS2013 THEN
	CHOOSE CASE as_color
		CASE "BACKGROUND3"
			RETURN RGB(41, 57, 85)
	END CHOOSE
END IF

IF NOT IsValid(inv_color_theme) THEN
	RETURN 0
END IF

RETURN inv_color_theme.of_GetColor(inv_color_theme.Toolbar, as_color)
end function

public function integer of_displayborder (boolean ab_border);ib_displayborder = ab_border

of_UpdatePoints()

SetRedraw(TRUE)

RETURN 1
end function

public function integer of_setstyle (long al_style);il_CurrentStyle = al_style
SetRedraw(TRUE)

RETURN 1
end function

public function integer of_displayraisedborder (boolean ab_show);ib_raisedborder = ab_show
of_DisplayBorder(FALSE)
RETURN 1
end function

public function integer of_displaysolidbackground (boolean ab_switch);ib_solidbackground = ab_switch
SetRedraw(TRUE)
RETURN 1
end function

public function integer of_setfontname (string as_font);FontName = as_font
of_GetFontSize()
SetRedraw(TRUE)
RETURN 1
end function

public function integer of_setfontcolor (long al_color);ib_fontcoloroverride = TRUE
FontColor = al_color
SetRedraw(TRUE)
RETURN 1
end function

public function integer of_setfontsize (integer ai_fontsize);FontSize = ai_fontsize
of_GetFontSize()
of_UpdatePoints()
SetRedraw(TRUE)
RETURN 1
end function

public function integer of_getfontsize ();ULong lul_Handle, lul_hDC
String ls_text
n_uspb_text_helper lnv_texthelper
Point p

lul_Handle = Handle(st_pbus_vcrnav)
lul_hDC = inv_win32.GetDC(lul_Handle)

lnv_texthelper.of_SetHdc(lul_hDC)
ls_text = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz"
p = lnv_texthelper.of_GetTextSize (lul_hDC, ls_text, FontName, FontSize, lnv_texthelper.ALIGN_LEFT, 50, Bold, FALSE, FALSE)

inv_win32.ReleaseDC(lul_Handle, lul_hDC)

il_TextHeight = p.PY

RETURN 1
end function

public function point of_gettextwidth (string as_text, boolean ab_bold);LongPtr lul_Handle, lul_hDC
n_uspb_text_helper lnv_texthelper
Point p

lul_Handle = Handle(st_pbus_vcrnav)
lul_hDC = inv_win32.GetDC(lul_Handle)

lnv_texthelper.of_SetHdc(lul_hDC)

p = lnv_texthelper.of_GetTextSize (lul_hDC, as_text, FontName, FontSize, lnv_texthelper.ALIGN_LEFT, ScaleDPI(50), ab_bold, FALSE, FALSE)

p.PX = p.PX + ScaleDPI(4)
p.PY = p.PY + ScaleDPI(4)

inv_win32.ReleaseDC(lul_Handle, lul_hDC)

IF MinWidth > 0 THEN p.PX = MinWidth
	
RETURN p
 
end function

public function integer of_indexfrompoint (long xpos, long ypos);//find out if a tab was clicked
long ll_count, ll_index
LongPtr lul_rgn
integer lix, liy

lix = UnitsToPixels(xpos, XUnitsToPixels!)
liy = UnitsToPixels(ypos, YUnitsToPixels!)

ll_count = UPPERBOUND(ToolbarItemsLeft)
FOR ll_index = 1 to ll_count

	IF NOT ToolbarItemsLeft[ll_index].Visible THEN CONTINUE
	IF ToolbarItemsLeft[ll_index].Hidden THEN CONTINUE
	
	lul_rgn = inv_win32.CreatePolygonRgn(ToolbarItemsLeft[ll_index].PaintRegion, UPPERBOUND(ToolbarItemsLeft[ll_index].PaintRegion), 1)
	IF inv_win32.PtInRegion(lul_rgn, lix, liy) <> 0 THEN
		inv_win32.DeleteObject(lul_rgn)
		RETURN ll_index
	ELSE
		inv_win32.DeleteObject(lul_rgn)
	END IF
NEXT

RETURN -1
end function

private function boolean of_isinobject (long xpos, long ypos);Long ll_index, ll_count

ll_count = UpperBound(ToolbarItemsLeft)

FOR ll_index = 1 TO ll_count
	IF ToolbarItemsLeft[ll_index].ObjectType THEN
	
		IF ToolbarItemsLeft[ll_index].ObjectReference.Visible AND &
			(xpos + X) > ToolbarItemsLeft[ll_index].ObjectReference.X AND &
			(xpos + X) < ToolbarItemsLeft[ll_index].ObjectReference.X + &
			ToolbarItemsLeft[ll_index].ObjectReference.Width AND &
			(ypos + Y) > ToolbarItemsLeft[ll_index].ObjectReference.Y AND &
			(ypos + Y) < ToolbarItemsLeft[ll_index].ObjectReference.Y + &
			ToolbarItemsLeft[ll_index].ObjectReference.Height &
		THEN
			RETURN TRUE
		END IF
	END IF
NEXT

RETURN FALSE
end function

public function boolean of_isenabled (string as_item);Long ll_index, ll_count

ll_count = UpperBound(ToolbarItemsLeft)

FOR ll_index = 1 TO ll_count
	
	IF Upper(as_item) = Upper(ToolbarItemsLeft[ll_index].Text) THEN
		RETURN ToolbarItemsLeft[ll_index].Enabled
	END IF
	
NEXT

RETURN FALSE
end function

public function integer of_updatepointsleft ();Long ll_index, ll_count, ll_x, ll_y, ll_textheight, ll_textwidth, ll_item, ll_childIndex
Long ll_width, ll_height, ll_controlWidth, ll_chevronwidth
Long ll_paintwidth
boolean lb_SomeHidden = FALSE
point lp_empty[]
Point p

ll_count = UpperBound(ToolbarItemsLeft)

ll_y = ScaleDPI(3)
ll_x = ScaleDPI(3)

ll_height = UnitsToPixels(Height, YUnitsToPixels!)
ll_controlWidth = UnitsToPixels(Width, XUnitsToPixels!)
ll_paintwidth = UnitsToPixels(of_GetWidth(), XUnitsToPixels!)

FOR ll_index = 1 TO ll_count
	IF NOT ToolbarItemsLeft[ll_index].Visible OR ToolbarItemsLeft[ll_index].Position = RIGHT THEN
		
		ToolbarItemsLeft[ll_index].PaintRegion = lp_empty
		
		CONTINUE
	END IF
	
	ll_item++
		
	ll_childIndex = ll_index
		
	ToolbarItemsLeft[ll_index].PaintRegion = lp_empty
	
	ToolbarItemsLeft[ll_index].BackColor1 = -1
	ToolbarItemsLeft[ll_index].BackColor2 = -1
	
	ToolbarItemsLeft[ll_index].TextColor = of_GetColor("ITEMTEXT")
	
	IF ll_index = il_index AND ToolbarItemsLeft[ll_index].Enabled THEN
		IF ib_mousedown AND NOT ib_mouseleave AND il_MOIndex = ll_index THEN
			ToolbarItemsLeft[ll_index].BackColor1 = of_GetColor('SELECTED1')
			ToolbarItemsLeft[ll_index].BackColor2 = of_GetColor('SELECTED2')
			ToolbarItemsLeft[ll_index].BorderColor = of_GetColor("ITEMBORDER")
			ToolbarItemsLeft[ll_index].TextColor = of_GetColor("ITEMTEXTSELECTED")
		ELSE
			ToolbarItemsLeft[ll_index].BackColor1 = of_GetColor("HOVER1")
			ToolbarItemsLeft[ll_index].BackColor2 = of_GetColor("HOVER2")
			ToolbarItemsLeft[ll_index].BorderColor = of_GetColor("ITEMBORDER")
			ToolbarItemsLeft[ll_index].TextColor = of_GetColor("ITEMTEXTSELECTED")
		END IF
	END IF
	
	IF ToolbarItemsLeft[ll_childIndex].Toggle THEN
		ToolbarItemsLeft[ll_index].BackColor1 = of_GetColor("ITEMTOGGLED1")
		ToolbarItemsLeft[ll_index].BackColor2 = of_GetColor("ITEMTOGGLED2")
		ToolbarItemsLeft[ll_index].BorderColor = of_GetColor("ITEMBORDER")		
		ToolbarItemsLeft[ll_index].TextColor = of_GetColor("ITEMTEXTSELECTED")
	ELSE
		
	END IF
	
		
		IF ToolbarItemsLeft[ll_index].Separator THEN
			ToolbarItemsLeft[ll_index].SeparatorColor = of_GetColor('SEPARATOR')
			
			ToolbarItemsLeft[ll_index].PaintRegion[1].px = ll_x
			ToolbarItemsLeft[ll_index].PaintRegion[1].py = ll_y + ScaleDPI(3)
			ToolbarItemsLeft[ll_index].PaintRegion[2].px = ll_x
			ToolbarItemsLeft[ll_index].PaintRegion[2].py = ll_height - ll_y - ScaleDPI(4)
			
			IF ToolbarItemsLeft[ll_index].PaintRegion[2].px > ll_paintwidth THEN
				ToolbarItemsLeft[ll_index].Hidden = TRUE
				lb_SomeHidden = TRUE
			ELSE
				ToolbarItemsLeft[ll_index].Hidden = FALSE
			END IF
			
			ll_x = ll_x + ScaleDPI(5)
		ELSE 
			IF ToolbarItemsLeft[ll_index].ObjectType THEN
				
				IF Len(Trim(ToolbarItemsLeft[ll_index].Text)) > 0 THEN
					p = of_GetTextWidth(ToolbarItemsLeft[ll_index].Text, FALSE)
					ToolbarItemsLeft[ll_index].TextWidth = p.PX
					ToolbarItemsLeft[ll_index].TextHeight = p.PY
					ToolbarItemsLeft[ll_index].PaintRegion[3].py = UnitsToPixels(Height, YUnitsToPixels!)
					ToolbarItemsLeft[ll_index].PaintRegion[1].px = ll_x
					ll_textwidth = p.PX + ScaleDPI(2)
				ELSE
					ll_textwidth = 0
				END IF
				
				IF this = ToolbarItemsLeft[ll_index].ObjectReference.GetParent() THEN
					ToolbarItemsLeft[ll_index].ObjectReference.Move(PixelsToUnits(ll_textwidth + ll_x + ScaleDPI(4), XPixelsToUnits!),	 &
					PixelsToUnits(ll_y - 1, XPixelsToUnits!))
				ELSE
					ToolbarItemsLeft[ll_index].ObjectReference.Move(PixelsToUnits(ll_textwidth + ll_x + ScaleDPI(4), XPixelsToUnits!) + THIS.X,	&
					PixelsToUnits(ll_y - 1, XPixelsToUnits!) + THIS.Y)
				END IF
				
				ll_x = ll_x + ll_textwidth + ScaleDPI(8) + UnitsToPixels(ToolbarItemsLeft[ll_index].ObjectReference.Width, XUnitsToPixels!)
			ELSE
				IF ToolbarItemsLeft[ll_index].DisplayText THEN
					
					p = of_GetTextWidth(ToolbarItemsLeft[ll_childIndex].Text, FALSE)
					ll_textwidth = p.PX
					ll_textheight = p.PY
					ToolbarItemsLeft[ll_index].TextHeight = p.PY
					
				ELSE
					ll_textwidth = 0
				END IF
				
				ToolbarItemsLeft[ll_index].ImageSize = ScaleDPI(il_CurrentSize)
				
				IF TextUnderImage THEN
					ll_width = (il_CurrentSize + 4)
					IF ll_width < ll_textwidth THEN ll_width = ll_textwidth + ScaleDPI(4)
					ll_width = ll_width + ScaleDPI(1)
				ELSE
					ll_width = ScaleDPI(il_CurrentSize + 6) + ll_textwidth
				END IF
				
				ToolbarItemsLeft[ll_index].TextWidth = ll_textwidth
			
				ll_width += ll_chevronwidth
			
				ToolbarItemsLeft[ll_index].PaintRegion[1].px = ll_x
				ToolbarItemsLeft[ll_index].PaintRegion[1].py = ll_y
				ToolbarItemsLeft[ll_index].PaintRegion[2].px = ll_width + ll_x
				ToolbarItemsLeft[ll_index].PaintRegion[2].py = ll_y
				ToolbarItemsLeft[ll_index].PaintRegion[3].px = ll_width + ll_x
				ToolbarItemsLeft[ll_index].PaintRegion[3].py = ll_height - ll_y + ScaleDPI(1)
				ToolbarItemsLeft[ll_index].PaintRegion[4].px = ll_x
				ToolbarItemsLeft[ll_index].PaintRegion[4].py = ll_height - ll_y + ScaleDPI(1)
				
				IF ToolbarItemsLeft[ll_index].PaintRegion[3].px > ll_paintwidth THEN
					ToolbarItemsLeft[ll_index].Hidden = TRUE
					lb_SomeHidden = TRUE
				ELSE
					ToolbarItemsLeft[ll_index].Hidden = FALSE
				END IF
				
				IF NOT lb_SomeHidden THEN
					il_LeftEndPoint = ll_x + ll_width + 2
				END IF
				
				ll_x = ll_x + ll_width + ScaleDPI(2)
			END IF
		END IF

NEXT

ib_LeftHidden = lb_somehidden

RETURN 1
end function

public function integer of_updatepoints ();of_UpdatePointsLeft()
of_UpdatePointsRight()

return 1
end function

private function integer of_getheight ();RETURN Height
end function

public function integer of_disabletooltips ();ib_displaytooltips = FALSE

RETURN 1
end function

public function integer of_enabletooltips ();ib_displaytooltips = TRUE

RETURN 1
end function

public function integer of_getactualwidth ();Long ll_item

ll_item = UpperBound(ToolbarItemsLeft)

RETURN PixelsToUnits(ToolbarItemsLeft[ll_item].PaintRegion[2].px, XPixelsToUnits!) + 20
end function

public function integer of_setminbuttonwidth (long al_width);MinWidth = al_width

RETURN 1
end function

public function long of_getindex (string as_item);Long ll_index, ll_count

ll_count = UpperBound(ToolbarItemsLeft)

FOR ll_index = 1 TO ll_count
	
	IF Upper(as_item) = Upper(ToolbarItemsLeft[ll_index].Text) THEN
		RETURN ll_index
	END IF
	
NEXT

RETURN 0
end function

public function integer of_setparentwindow (window aw_window);iw_parentwindow = aw_window
RETURN 1
end function

private function integer of_getwidth ();RETURN Width
end function

public function long of_settheme (long al_color);CHOOSE CASE al_color
	CASE BLUE
		RETURN of_SetTheme('BLUE')
	CASE SILVER
		RETURN of_SetTheme('SILVER')
	CASE OLIVE
		RETURN of_SetTheme('OLIVE')
	CASE CLASSIC
		RETURN of_SetTheme('CLASSIC')
	CASE WINDOWS8_BLUE
		RETURN of_SetTheme('WINDOWS8_BLUE')
	CASE WINDOWS8_OLIVE
		RETURN of_SetTheme('WINDOWS8_OLIVE')
	CASE WINDOWS8_SILVER
		RETURN of_SetTheme('WINDOWS8_SILVER')
	CASE ELSE
		RETURN of_SetTheme('CLASSIC')
END CHOOSE

RETURN 0
end function

public function integer of_capturemouse ();if of_ismousecaptured() then Return -1

inv_win32.SetCapture(Handle(THIS))

of_TrackMouseEvent(TME_Leave, Handle(THIS), 0)

ib_mousecaptured = TRUE

return 1
end function

public function integer of_releasemouse ();if NOT of_ismousecaptured() then return -1

inv_win32.ReleaseCapture()

ib_mousecaptured = FALSE

Return 1
end function

private function integer of_paint2013 (unsignedlong hdc);Long ll_color1, ll_color2

ll_color1 = of_GetColor("BACKGROUND3")
ll_color2 = of_GetColor("BACKGROUND3")

in_Gradient.of_SetHDC(hdc)

boolean lb_Horizontal

IF il_CurrentOrientation = HORIZONTAL THEN
	lb_Horizontal = TRUE
ELSE
	lb_Horizontal = FALSE
END IF
	
in_Gradient.of_XPGradient(ll_color1, ll_color2, THIS,ib_displayborder,of_GetColor("BORDER"), lb_Horizontal)

LongPtr il_imagelist
CHOOSE CASE il_CurrentSize
	CASE SMALL
		il_imagelist = il_imagelistsmall
	CASE MEDIUM
		il_imagelist = il_imagelistmedium
	CASE LARGE
		il_imagelist = il_imagelistlarge
	CASE XLARGE
		il_imagelist = il_imagelistxlarge
END CHOOSE

string ls_panelposition

CHOOSE CASE il_CurrentOrientation
	CASE VERTICAL
		ls_panelposition = "LEFT"
	CASE HORIZONTAL
		ls_panelposition = "BOTTOM"
END CHOOSE

in_Gradient.of_DrawVS2013Buttons(THIS, ToolbarItemsLeft, FontName, FontSize, RGB(255,255,255), il_ImageList, il_CurrentOrientation, il_ChevronIndex, TextUnderImage, ib_quickaccessmode, TRUE,ls_panelposition)

Long ll_index, ll_count

ll_count = UpperBound(ToolbarItemsLeft)

FOR ll_index = 1 TO ll_count
	CHOOSE CASE ToolbarItemsLeft[ll_index].ImageIndex
		CASE FIRST_RECORD
			of_DrawFirst(hdc, ToolbarItemsLeft[ll_index].paintregion, ll_index = il_index)
		CASE PREV_RECORD
			of_DrawPrevious(hdc, ToolbarItemsLeft[ll_index].paintregion, ll_index = il_index)
		CASE NEXT_RECORD
			of_DrawNext(hdc, ToolbarItemsLeft[ll_index].paintregion, ll_index = il_index)
		CASE LAST_RECORD
			of_DrawLast(hdc, ToolbarItemsLeft[ll_index].paintregion, ll_index = il_index)
		CASE INSERT_RECORD
			of_DrawInsert(hdc, ToolbarItemsLeft[ll_index].paintregion, ll_index = il_index)
		CASE DELETE_RECORD
			of_DrawDelete(hdc, ToolbarItemsLeft[ll_index].paintregion, ll_index = il_index)
	END CHOOSE
NEXT

of_DrawEval(hdc)

RETURN 1
end function

public function integer of_setvisible (long al_item, boolean ab_switch);Long ll_index, ll_count

ll_count = UpperBound(ToolbarItemsLeft)

FOR ll_index = 1 TO ll_count
	
	IF al_item = ToolbarItemsLeft[ll_index].ImageIndex THEN
		IF ToolbarItemsLeft[ll_index].Visible = (NOT ab_switch) THEN
			ToolbarItemsLeft[ll_index].Visible = ab_switch
			of_UpdatePoints()
			SetRedraw(TRUE)
		END IF
	END IF
	
NEXT

RETURN 0
end function

public function integer of_settiptext (long al_item, string as_text);Long ll_index, ll_count

ll_count = UpperBound(ToolbarItemsLeft)

FOR ll_index = 1 TO ll_count
	IF ToolbarItemsLeft[ll_index].ImageIndex = al_item THEN
		ToolbarItemsLeft[ll_index].TipText = as_text
		RETURN 1
	END IF
NEXT

RETURN 1
end function

public function integer of_settext (long al_item, string as_text);Long ll_index, ll_count

ll_count = UpperBound(ToolbarItemsLeft)

FOR ll_index = 1 TO ll_count
	IF ToolbarItemsLeft[ll_index].ImageIndex = al_item THEN
		ToolbarItemsLeft[ll_index].Text = as_text
		RETURN 1
	END IF
NEXT


RETURN 0
end function

public function integer of_setenabled (long al_item, boolean ab_switch);Long ll_index, ll_count

ll_count = UpperBound(ToolbarItemsLeft)

FOR ll_index = 1 TO ll_count
	
	IF al_item = ToolbarItemsLeft[ll_index].ImageIndex THEN
		IF ToolbarItemsLeft[ll_index].Enabled = (NOT ab_switch) THEN
			ToolbarItemsLeft[ll_index].Enabled = ab_switch
			
			of_UpdatePoints()
			SetRedraw(TRUE)
		END IF
	END IF
	
NEXT

RETURN 1
end function

public function boolean of_isvisible (long al_item);Long ll_index, ll_count

ll_count = UpperBound(ToolbarItemsLeft)

FOR ll_index = 1 TO ll_count
	
	IF al_item = ToolbarItemsLeft[ll_index].ImageIndex THEN
		RETURN ToolbarItemsLeft[ll_index].Visible
	END IF
	
NEXT

RETURN FALSE
end function

public function integer of_addobject (string as_text, dragobject ado_object);Long ll_index, ll_count, ll_loop, ll_item, ll_width
ToolbarItem tbiButton

IF il_CurrentOrientation = VERTICAL THEN
	RETURN -1
END IF

SetRedraw(FALSE)

of_GetWindow()

//SetParent(Handle(ado_object), Handle(THIS))
tbiButton.ObjectReference = ado_object
tbiButton.ObjectType = TRUE
tbiButton.Visible = TRUE
tbiButton.Text = as_text
tbiButton.Position = LEFT

ado_object.BringToTop = TRUE

ll_item = UpperBound(ToolbarItemsLeft) + 1

tbiButton.Index = ll_item
ToolbarItemsLeft[ll_item] = tbiButton

of_UpdatePoints()

SetRedraw(TRUE)

RETURN ll_item
end function

public function integer of_setdatawindow (datawindow a_dw);i_dw = a_dw
of_UpdateValue()
RETURN 1
end function

public function integer of_updatevalue ();n_cst_pbus_string lnv_string
String ls_value
Long ll_currentrow
Long ll_rowcount

IF NOT IsValid(i_dw) THEN RETURN 0

DefaultDisplayValue = inv_resourcemanager.of_GetString(DefaultDisplayValue)

ll_currentrow = i_dw.GetRow()
ll_rowcount = i_dw.RowCount()

IF Len(Trim(DisplayColumn)) > 0 AND ll_currentrow > 0 THEN
	ls_value = i_dw.GetItemString(ll_currentrow, DisplayColumn)
ELSE
	IF ll_currentrow > 0 AND ll_rowcount > 0 THEN
		ls_value = lnv_string.of_GlobalReplace(DefaultDisplayValue, "{currentrow}", String(ll_currentrow), TRUE)
		ls_value = lnv_string.of_GlobalReplace(ls_value, "{rowcount}", String(ll_rowcount), TRUE)
	END IF	
END IF

sle_value.Text = ls_value

RETURN 1
end function

public function integer of_updatepointsright ();Long ll_index, ll_count, ll_x, ll_y, ll_textwidth, ll_item
Long ll_width, ll_height, ll_controlWidth, ll_childIndex
boolean lb_SomeHidden = FALSE
point lp_empty[]
Point p

ll_count = UpperBound(ToolbarItemsLeft)

IF il_CurrentOrientation = VERTICAL THEN
	ll_y = UnitsToPixels(Height, YUnitsToPixels!) - ScaleDPI(2)
ELSE
	ll_y = ScaleDPI(3)
END IF
	
ll_x = UnitsToPixels(Width, XUnitsToPixels!) - ScaleDPI(2)
ll_height = UnitsToPixels(Height, YUnitsToPixels!)
ll_controlWidth = UnitsToPixels(Width, XUnitsToPixels!)


FOR ll_index = 1 TO ll_count
	
	IF NOT ToolbarItemsLeft[ll_index].Visible OR ToolbarItemsLeft[ll_index].Position = LEFT OR &
	   ToolbarItemsLeft[ll_index].IsChild THEN
		CONTINUE
	END IF
	
	IF ToolbarItemsLeft[ll_index].IsParent AND ToolbarItemsLeft[ll_index].SelectedChild > 0 THEN
		ll_childIndex = ToolbarItemsLeft[ll_index].SelectedChild
	ELSE
		ll_childIndex = ll_index
	END IF
	
	ll_item++
	ToolbarItemsLeft[ll_index].PaintRegion = lp_empty
	
	ToolbarItemsLeft[ll_index].Hidden = FALSE
	
	ToolbarItemsLeft[ll_index].BackColor1 = -1
	ToolbarItemsLeft[ll_index].BackColor2 = -1
	ToolbarItemsLeft[ll_index].TextColor = of_GetColor("ITEMTEXT")
	
	IF ll_index = il_index AND ToolbarItemsLeft[ll_index].Enabled  THEN
		IF ib_mousedown AND NOT ib_mouseleave AND il_MOIndex = ll_index THEN
			ToolbarItemsLeft[ll_index].BackColor1 = of_GetColor('SELECTED1')
			ToolbarItemsLeft[ll_index].BackColor2 = of_GetColor('SELECTED2')
			ToolbarItemsLeft[ll_index].BorderColor = of_GetColor("ITEMBORDER")
			ToolbarItemsLeft[ll_index].TextColor = of_GetColor("ITEMTEXTSELECTED")
		ELSE
			ToolbarItemsLeft[ll_index].BackColor1 = of_GetColor("HOVER1")
			ToolbarItemsLeft[ll_index].BackColor2 = of_GetColor("HOVER2")
			ToolbarItemsLeft[ll_index].BorderColor = of_GetColor("ITEMBORDER")
			ToolbarItemsLeft[ll_index].TextColor = of_GetColor("ITEMTEXTSELECTED")
		END IF
	END IF
	
	IF ToolbarItemsLeft[ll_childIndex].Toggle THEN
		ToolbarItemsLeft[ll_index].BackColor1 = of_GetColor("HOVER1")
		ToolbarItemsLeft[ll_index].BackColor2 = of_GetColor("HOVER2")
		ToolbarItemsLeft[ll_index].BorderColor = of_GetColor("ITEMBORDER")	
		ToolbarItemsLeft[ll_index].TextColor = of_GetColor("ITEMTEXTSELECTED")
	ELSE
		
	END IF
		
	IF ToolbarItemsLeft[ll_index].Separator THEN
		ToolbarItemsLeft[ll_index].SeparatorColor = of_GetColor('SEPARATOR')
		
		ToolbarItemsLeft[ll_index].PaintRegion[1].px = ll_x - ScaleDPI(2)
		ToolbarItemsLeft[ll_index].PaintRegion[1].py = ll_y + ScaleDPI(3)
		ToolbarItemsLeft[ll_index].PaintRegion[2].px = ll_x - ScaleDPI(2)
		ToolbarItemsLeft[ll_index].PaintRegion[2].py = ll_height - ll_y - ScaleDPI(4)
		
		IF ToolbarItemsLeft[ll_index].PaintRegion[1].px < il_LeftEndPoint THEN
			ToolbarItemsLeft[ll_index].Hidden = TRUE
			lb_SomeHidden = TRUE
		ELSE
			ToolbarItemsLeft[ll_index].Hidden = FALSE
		END IF
		
		ll_x = ll_x - ScaleDPI(4)
	ELSE 
		IF ToolbarItemsLeft[ll_index].ObjectType THEN
			
			Long objectWidth
			
			objectWidth = UnitsToPixels(ToolbarItemsLeft[ll_index].ObjectReference.Width, XUnitsToPixels!)
			
			
			IF Len(Trim(ToolbarItemsLeft[ll_index].Text)) > 0 THEN
				p = of_GetTextWidth(ToolbarItemsLeft[ll_index].Text, FALSE)
				ll_textwidth = p.PX + ScaleDPI(2)
				ToolbarItemsLeft[ll_index].TextWidth = p.PX
				ToolbarItemsLeft[ll_index].TextHeight = p.PY
				ToolbarItemsLeft[ll_index].PaintRegion[3].py = UnitsToPixels(Height, YUnitsToPixels!)
				ToolbarItemsLeft[ll_index].PaintRegion[1].px = ll_x - objectWidth - ll_textwidth - ScaleDPI(4)
				
			ELSE
				ll_textwidth = 0
			END IF
			
			
			ToolbarItemsLeft[ll_index].ObjectReference.Move(PixelsToUnits(ll_x - objectWidth - ScaleDPI(4), XPixelsToUnits!) + THIS.X, &
																			PixelsToUnits(ll_y - ScaleDPI(1), XPixelsToUnits!) + THIS.Y)
			
			
			ll_x = ll_x - ll_textwidth - objectWidth - ScaleDPI(8)
		ELSE
			IF ToolbarItemsLeft[ll_index].DisplayText THEN
				
				p = of_GetTextWidth(ToolbarItemsLeft[ll_childIndex].Text, FALSE)
				ll_textwidth = p.PX
				ToolbarItemsLeft[ll_index].TextHeight = p.PY
				
			ELSE
				ll_textwidth = 0
			END IF
			
			ToolbarItemsLeft[ll_index].ImageSize = ScaleDPI(il_CurrentSize)
			
			IF TextUnderImage THEN
				ll_width = ScaleDPI(il_CurrentSize + 4)
				IF ll_width < ll_textwidth THEN ll_width = ll_textwidth + ScaleDPI(4)
				ll_width = ll_width + ScaleDPI(1)
			ELSE
				ll_width = ScaleDPI(il_CurrentSize + 6) + ll_textwidth
			END IF
		
			ToolbarItemsLeft[ll_index].TextWidth = ll_textwidth
		
			ToolbarItemsLeft[ll_index].PaintRegion[1].px = ll_x - ll_width
			ToolbarItemsLeft[ll_index].PaintRegion[1].py = ll_y
			ToolbarItemsLeft[ll_index].PaintRegion[2].px = ll_x
			ToolbarItemsLeft[ll_index].PaintRegion[2].py = ll_y
			ToolbarItemsLeft[ll_index].PaintRegion[3].px = ll_x
			ToolbarItemsLeft[ll_index].PaintRegion[3].py = ll_height - ll_y + ScaleDPI(1)
			ToolbarItemsLeft[ll_index].PaintRegion[4].px = ll_x - ll_width
			ToolbarItemsLeft[ll_index].PaintRegion[4].py = ll_height - ll_y + ScaleDPI(1)
			
			IF ToolbarItemsLeft[ll_index].PaintRegion[1].px < il_LeftEndPoint THEN
				ToolbarItemsLeft[ll_index].Hidden = TRUE
				lb_SomeHidden = TRUE
			ELSE
				ToolbarItemsLeft[ll_index].Hidden = FALSE
			END IF
			
			ll_x = ll_x - ll_width - ScaleDPI(2)
		END IF
	END IF

NEXT

RETURN 1
end function

public function integer of_additem (string as_text, long al_button, string as_tiptext, integer ai_position);Long ll_index, ll_count, ll_loop, ll_item, ll_width

ToolbarItem tbiButton

SetRedraw(FALSE)

tbiButton.Text = as_text
tbiButton.TipText = as_tiptext
tbiButton.Enabled = TRUE
tbiButton.Visible = TRUE
tbiButton.DisplayText = ib_displaytext
tbiButton.separator = FALSE
tbiButton.ImageIndex = al_button
tbiButton.Position = ai_position

ll_item = UpperBound(ToolbarItemsLeft) + 1

tbiButton.Index = ll_item
ToolbarItemsLeft[ll_item] = tbiButton

of_UpdatePoints()

IF AutoSize THEN
	THIS.Width = of_GetActualWidth()
END IF

SetRedraw(TRUE)

RETURN ll_item
end function

public function integer of_setvaluetext (string as_text);DefaultDisplayValue = as_text
of_UpdateValue()
RETURN 1
end function

public function integer of_setdisplaycolumn (string as_column);DisplayColumn = as_column
of_UpdateValue()
RETURN 1
end function

public function integer of_setvaluewidth (long al_width);sle_value.Width = al_width

of_UpdatePoints()
SetRedraw(TRUE)

RETURN 1
end function

public function string of_classname ();RETURN "u_cst_dwnav"
end function

private function integer of_drawfirst (longptr hdc, point paintregion[], boolean ab_selected);GRADIENT_RECT l_Gradient[]
LongPtr hRPen, ll_DC
LongPtr hRgn
Long ll_color, ll_adjust
Integer ll_index, ll_count

CHOOSE CASE TRUE
	CASE il_CurrentStyle = VS2013
		ll_color = RGB(255,255,255)
	CASE ab_selected
		ll_color = of_GetColor("ITEMTEXTSELECTED")
	CASE ELSE
		ll_color = of_GetColor("ITEMTEXT")
END CHOOSE

IF il_CurrentStyle = VS2013 THEN	ll_adjust = 2

hRPen = inv_win32.CreatePen(0,0,ll_color)
inv_win32.SelectObject(hdc, hRPen)

Long ll_X1, ll_Y1, ll_X2, ll_Y2
Long ll_imagesize

ll_imagesize = ScaleDPI(il_CurrentSize + 6)

ll_X1 = paintregion[1].PX + (ll_imagesize / 2 / 2)
ll_Y1 = paintregion[1].PY + (ll_imagesize / 2 / 2) - ll_adjust
ll_X2 = (ll_X1 + (ll_imagesize / 2))
ll_Y2 = (ll_Y1 + (ll_imagesize / 2))


//Start Arrow

ll_count = ScaleDPI(6)

FOR ll_index = 1 TO ll_count
	l_Gradient[1].upperleft = ll_X1 + 2 + ll_index
	l_Gradient[1].lowerright = ll_Y1 + (ll_count + (ll_index - 1)) - 1
	l_Gradient[2].upperleft = ll_X1 + 2 + ll_index
	l_Gradient[2].lowerright = ll_Y2 - (ll_count + (ll_index - 1))  - 1
	
	inv_win32.PolyLine(hdc, l_Gradient, 2)
NEXT

//End arrow

//Line
l_Gradient[1].upperleft = ll_X1 + 1
l_Gradient[1].lowerright = ll_Y1
l_Gradient[2].upperleft = ll_X1 + 1
l_Gradient[2].lowerright = ll_Y2

inv_win32.PolyLine(hdc, l_Gradient, 2)

l_Gradient[1].upperleft = ll_X1
l_Gradient[1].lowerright = ll_Y1
l_Gradient[2].upperleft = ll_X1
l_Gradient[2].lowerright = ll_Y2

inv_win32.PolyLine(hdc, l_Gradient, 2)

inv_win32.DeleteObject(hRPen)
inv_win32.DeleteObject(hRgn)

RETURN 1
end function

private function integer of_drawinsert (longptr hdc, point paintregion[], boolean ab_selected);GRADIENT_RECT l_Gradient[]
LongPtr hRPen, ll_DC
LongPtr hRgn
Long ll_color, ll_adjust
Integer ll_count, ll_index

CHOOSE CASE TRUE
	CASE il_CurrentStyle = VS2013
		ll_color = RGB(255,255,255)
	CASE ab_selected
		ll_color = of_GetColor("ITEMTEXTSELECTED")
	CASE ELSE
		ll_color = of_GetColor("ITEMTEXT")
END CHOOSE

IF il_CurrentStyle = VS2013 THEN	ll_adjust = ScaleDPI(2)

hRPen = inv_win32.CreatePen(0,0,ll_color)
inv_win32.SelectObject(hdc, hRPen)

Long ll_X1, ll_Y1, ll_X2, ll_Y2
Long ll_imagesize

ll_imagesize = ScaleDPI(il_CurrentSize + 6)

ll_X1 = paintregion[1].PX + (ll_imagesize / 2 / 2)
ll_Y1 = paintregion[1].PY + (ll_imagesize / 2 / 2) - ll_adjust
ll_X2 = (ll_X1 + (ll_imagesize / 2))
ll_Y2 = (ll_Y1 + (ll_imagesize / 2))

//Horizontal

//Middle line
l_Gradient[1].upperleft = ll_X1
l_Gradient[1].lowerright = ll_Y1 + ((ll_Y2 - ll_Y1) / 2)
l_Gradient[2].upperleft = ll_X2
l_Gradient[2].lowerright = ll_Y1 + ((ll_Y2 - ll_Y1) / 2)
inv_win32.PolyLine(hdc, l_Gradient, 2)

ll_count = ScaleDPI(1)

FOR ll_index = 1 TO ll_count
	l_Gradient[1].upperleft = ll_X1
	l_Gradient[1].lowerright = ll_Y1 + ((ll_Y2 - ll_Y1) / 2) + ll_index
	l_Gradient[2].upperleft = ll_X2
	l_Gradient[2].lowerright = ll_Y1 + ((ll_Y2 - ll_Y1) / 2) + ll_index
	inv_win32.PolyLine(hdc, l_Gradient, 2)
NEXT

FOR ll_index = 1 TO ll_count
	l_Gradient[1].upperleft = ll_X1
	l_Gradient[1].lowerright = ll_Y1 + ((ll_Y2 - ll_Y1) / 2) - ll_index
	l_Gradient[2].upperleft = ll_X2
	l_Gradient[2].lowerright = ll_Y1 + ((ll_Y2 - ll_Y1) / 2) - ll_index
	inv_win32.PolyLine(hdc, l_Gradient, 2)
NEXT

//Vertical

FOR ll_index = 1 TO ll_count
	l_Gradient[1].upperleft = ll_X1 + ((ll_X2 - ll_X1) / 2) - ll_index
	l_Gradient[1].lowerright = ll_Y1
	l_Gradient[2].upperleft = ll_X1 + ((ll_X2 - ll_X1) / 2) - ll_index
	l_Gradient[2].lowerright = ll_Y2
	inv_win32.PolyLine(hdc, l_Gradient, 2)
NEXT

l_Gradient[1].upperleft = ll_X1 + ((ll_X2 - ll_X1) / 2)
l_Gradient[1].lowerright = ll_Y1
l_Gradient[2].upperleft = ll_X1 + ((ll_X2 - ll_X1) / 2)
l_Gradient[2].lowerright = ll_Y2
inv_win32.PolyLine(hdc, l_Gradient, 2)

FOR ll_index = 1 TO ll_count
	l_Gradient[1].upperleft = ll_X1 + ((ll_X2 - ll_X1) / 2) + ll_index
	l_Gradient[1].lowerright = ll_Y1
	l_Gradient[2].upperleft = ll_X1 + ((ll_X2 - ll_X1) / 2) + ll_index
	l_Gradient[2].lowerright = ll_Y2
	inv_win32.PolyLine(hdc, l_Gradient, 2)
NEXT

inv_win32.DeleteObject(hRPen)
inv_win32.DeleteObject(hRgn)

RETURN 1
end function

private function integer of_drawlast (longptr hdc, point paintregion[], boolean ab_selected);GRADIENT_RECT l_Gradient[]
LongPtr hRPen, ll_DC
LongPtr hRgn
Long ll_color, ll_adjust
Integer ll_index, ll_count

CHOOSE CASE TRUE
	CASE il_CurrentStyle = VS2013
		ll_color = RGB(255,255,255)
	CASE ab_selected
		ll_color = of_GetColor("ITEMTEXTSELECTED")
	CASE ELSE
		ll_color = of_GetColor("ITEMTEXT")
END CHOOSE

IF il_CurrentStyle = VS2013 THEN	ll_adjust = ScaleDPI(2)

hRPen = inv_win32.CreatePen(0,0,ll_color)
inv_win32.SelectObject(hdc, hRPen)

Long ll_X1, ll_Y1, ll_X2, ll_Y2
Long ll_imagesize

ll_imagesize = ScaleDPI(il_CurrentSize + 6)

ll_X1 = paintregion[1].PX + (ll_imagesize / 2 / 2)
ll_Y1 = paintregion[1].PY + (ll_imagesize / 2 / 2) - ll_adjust
ll_X2 = (ll_X1 + (ll_imagesize / 2))
ll_Y2 = (ll_Y1 + (ll_imagesize / 2))

//Vertical

ll_count = ScaleDPI(6)

FOR ll_index = 1 TO ll_count
	l_Gradient[1].upperleft = ll_X1 + (ll_index - 1)
	l_Gradient[1].lowerright = ll_Y1 + (ll_index - 1)
	l_Gradient[2].upperleft = ll_X1 + (ll_index - 1)
	l_Gradient[2].lowerright = ll_Y2 - (ll_index - 1)
	
	inv_win32.PolyLine(hdc, l_Gradient, 2)
NEXT
/*

l_Gradient[1].upperleft = ll_X1 
l_Gradient[1].lowerright = ll_Y1
l_Gradient[2].upperleft = ll_X1
l_Gradient[2].lowerright = ll_Y2

inv_win32.PolyLine(hdc, l_Gradient, 2)

l_Gradient[1].upperleft = ll_X1 + 1
l_Gradient[1].lowerright = ll_Y1 + 1
l_Gradient[2].upperleft = ll_X1 + 1
l_Gradient[2].lowerright = ll_Y2 - 1

inv_win32.PolyLine(hdc, l_Gradient, 2)

l_Gradient[1].upperleft = ll_X1 + 2
l_Gradient[1].lowerright = ll_Y1 + 2
l_Gradient[2].upperleft = ll_X1 + 2
l_Gradient[2].lowerright = ll_Y2 - 2

inv_win32.PolyLine(hdc, l_Gradient, 2)


l_Gradient[1].upperleft = ll_X1 + 3
l_Gradient[1].lowerright = ll_Y1 + 3
l_Gradient[2].upperleft = ll_X1 + 3
l_Gradient[2].lowerright = ll_Y2 - 3

inv_win32.PolyLine(hdc, l_Gradient, 2)

l_Gradient[1].upperleft = ll_X1 + 4
l_Gradient[1].lowerright = ll_Y1 + 4
l_Gradient[2].upperleft = ll_X1 + 4
l_Gradient[2].lowerright = ll_Y2 - 4

inv_win32.PolyLine(hdc, l_Gradient, 2)

l_Gradient[1].upperleft = ll_X1 + 5
l_Gradient[1].lowerright = ll_Y1 + 5
l_Gradient[2].upperleft = ll_X1 + 5
l_Gradient[2].lowerright = ll_Y2 - 5

inv_win32.PolyLine(hdc, l_Gradient, 2)
*/

l_Gradient[1].upperleft = ll_X1 + ll_count + 1
l_Gradient[1].lowerright = ll_Y1
l_Gradient[2].upperleft = ll_X1 + ll_count + 1
l_Gradient[2].lowerright = ll_Y2

inv_win32.PolyLine(hdc, l_Gradient, 2)


l_Gradient[1].upperleft = ll_X1 + ll_count + 2
l_Gradient[1].lowerright = ll_Y1
l_Gradient[2].upperleft = ll_X1 + ll_count + 2
l_Gradient[2].lowerright = ll_Y2

inv_win32.PolyLine(hdc, l_Gradient, 2)

inv_win32.DeleteObject(hRPen)
inv_win32.DeleteObject(hRgn)

RETURN 1
end function

private function integer of_drawnext (longptr hdc, point paintregion[], boolean ab_selected);GRADIENT_RECT l_Gradient[]
LongPtr hRPen, ll_DC
LongPtr hRgn
Long ll_color, ll_adjust
Integer ll_index, ll_count

CHOOSE CASE TRUE
	CASE il_CurrentStyle = VS2013
		ll_color = RGB(255,255,255)
	CASE ab_selected
		ll_color = of_GetColor("ITEMTEXTSELECTED")
	CASE ELSE
		ll_color = of_GetColor("ITEMTEXT")
END CHOOSE

IF il_CurrentStyle = VS2013 THEN	ll_adjust = ScaleDPI(2)

hRPen = inv_win32.CreatePen(0,0,ll_color)
inv_win32.SelectObject(hdc, hRPen)

Long ll_X1, ll_Y1, ll_X2, ll_Y2
Long ll_imagesize

ll_imagesize = ScaleDPI(il_CurrentSize + 6)

ll_X1 = paintregion[1].PX + (ll_imagesize / 2 / 2) + ScaleDPI(4)
ll_Y1 = paintregion[1].PY + (ll_imagesize / 2 / 2) - ll_adjust
ll_X2 = (ll_X1 + (ll_imagesize / 2)) + ScaleDPI(4)
ll_Y2 = (ll_Y1 + (ll_imagesize / 2))

ll_count = ScaleDPI(6)

FOR ll_index = 1 TO ll_count
	l_Gradient[1].upperleft = ll_X1 + (ll_index - 1)
	l_Gradient[1].lowerright = ll_Y1 + (ll_index - 1)
	l_Gradient[2].upperleft = ll_X1 + (ll_index - 1)
	l_Gradient[2].lowerright = ll_Y2 - (ll_index - 1)
	
	inv_win32.PolyLine(hdc, l_Gradient, 2)
NEXT

inv_win32.DeleteObject(hRPen)
inv_win32.DeleteObject(hRgn)

RETURN 1
end function

private function integer of_drawprevious (longptr hdc, point paintregion[], boolean ab_selected);GRADIENT_RECT l_Gradient[]
LongPtr hRPen, ll_DC
LongPtr hRgn
Long ll_color, ll_adjust
Integer ll_index, ll_count

CHOOSE CASE TRUE
	CASE il_CurrentStyle = VS2013
		ll_color = RGB(255,255,255)
	CASE ab_selected
		ll_color = of_GetColor("ITEMTEXTSELECTED")
	CASE ELSE
		ll_color = of_GetColor("ITEMTEXT")
END CHOOSE

IF il_CurrentStyle = VS2013 THEN	ll_adjust = ScaleDPI(2)

hRPen = inv_win32.CreatePen(0,0,ll_color)
inv_win32.SelectObject(hdc, hRPen)

Long ll_X1, ll_Y1, ll_X2, ll_Y2
Long ll_imagesize

ll_imagesize = ScaleDPI(il_CurrentSize + 6)

ll_X1 = paintregion[1].PX + (ll_imagesize / 2 / 2) + ScaleDPI(3)
ll_Y1 = paintregion[1].PY + (ll_imagesize / 2 / 2) - ll_adjust
ll_X2 = (ll_X1 + (ll_imagesize / 2)) + ScaleDPI(3)
ll_Y2 = (ll_Y1 + (ll_imagesize / 2))

ll_count = ScaleDPI(6)

FOR ll_index = 1 TO ll_count
	l_Gradient[1].upperleft = ll_X1  + (ll_index - 1)
	l_Gradient[1].lowerright = ll_Y1 + (ll_count + (ll_index - 1)) - 1
	l_Gradient[2].upperleft = ll_X1 + (ll_index - 1)
	l_Gradient[2].lowerright = ll_Y2 - (ll_count + (ll_index - 1))  - 1
	
	inv_win32.PolyLine(hdc, l_Gradient, 2)
NEXT

inv_win32.DeleteObject(hRPen)
inv_win32.DeleteObject(hRgn)

RETURN 1
end function

private function integer of_drawdelete (longptr hdc, point paintregion[], boolean ab_selected);GRADIENT_RECT l_Gradient[]
LongPtr hRPen, ll_DC
LongPtr hRgn
Long ll_color, ll_adjust

CHOOSE CASE TRUE
	CASE il_CurrentStyle = VS2013
		ll_color = RGB(255,255,255)
	CASE ab_selected
		ll_color = of_GetColor("ITEMTEXTSELECTED")
	CASE ELSE
		ll_color = of_GetColor("ITEMTEXT")
END CHOOSE

IF il_CurrentStyle = VS2013 THEN	ll_adjust = ScaleDPI(2)

hRPen = inv_win32.CreatePen(0,0,ll_color)
inv_win32.SelectObject(hdc, hRPen)

Long ll_X1, ll_Y1, ll_X2, ll_Y2
Long ll_imagesize

ll_imagesize = ScaleDPI(il_CurrentSize + 6)

ll_X1 = paintregion[1].PX + (ll_imagesize / 2 / 2) + ScaleDPI(1)
ll_Y1 = paintregion[1].PY + (ll_imagesize / 2 / 2) - ll_adjust
ll_X2 = (ll_X1 + (ll_imagesize / 2))
ll_Y2 = (ll_Y1 + (ll_imagesize / 2))


//NEW
l_Gradient[1].upperleft = ll_X1 + ScaleDPI(2)
l_Gradient[1].lowerright = ll_Y1 
l_Gradient[2].upperleft = ll_X1 + ScaleDPI(7)
l_Gradient[2].lowerright = ll_Y1 

inv_win32.PolyLine(hdc, l_Gradient, 2)
//NEW

l_Gradient[1].upperleft = ll_X1
l_Gradient[1].lowerright = ll_Y1 + ScaleDPI(2)
l_Gradient[2].upperleft = ll_X2 - ScaleDPI(2)
l_Gradient[2].lowerright = ll_Y1 + ScaleDPI(2)

inv_win32.PolyLine(hdc, l_Gradient, 2)

l_Gradient[1].upperleft = ll_X1 + ScaleDPI(1)
l_Gradient[1].lowerright = ll_Y1 + ScaleDPI(4)
l_Gradient[2].upperleft = ll_X2 - ScaleDPI(3)
l_Gradient[2].lowerright = ll_Y1 + ScaleDPI(4)

inv_win32.PolyLine(hdc, l_Gradient, 2)

l_Gradient[1].upperleft = ll_X1 + ScaleDPI(1)
l_Gradient[1].lowerright = ll_Y1 + ScaleDPI(10)
l_Gradient[2].upperleft = ll_X2 - ScaleDPI(3)
l_Gradient[2].lowerright = ll_Y1 + ScaleDPI(10)

inv_win32.PolyLine(hdc, l_Gradient, 2)

//Vertical

l_Gradient[1].upperleft = ll_X1 + ScaleDPI(1)
l_Gradient[1].lowerright = ll_Y1 + ScaleDPI(4)
l_Gradient[2].upperleft = ll_X1 + ScaleDPI(1)
l_Gradient[2].lowerright = ll_Y1 + ScaleDPI(11)

inv_win32.PolyLine(hdc, l_Gradient, 2)


l_Gradient[1].upperleft = ll_X1 + ScaleDPI(3)
l_Gradient[1].lowerright = ll_Y1 + ScaleDPI(4)
l_Gradient[2].upperleft = ll_X1 + ScaleDPI(3)
l_Gradient[2].lowerright = ll_Y1 + ScaleDPI(11)

inv_win32.PolyLine(hdc, l_Gradient, 2)

l_Gradient[1].upperleft = ll_X1 + ScaleDPI(5)
l_Gradient[1].lowerright = ll_Y1 + ScaleDPI(4)
l_Gradient[2].upperleft = ll_X1 + ScaleDPI(5)
l_Gradient[2].lowerright = ll_Y1 + ScaleDPI(11)

inv_win32.PolyLine(hdc, l_Gradient, 2)

l_Gradient[1].upperleft = ll_X1 + ScaleDPI(7)
l_Gradient[1].lowerright = ll_Y1 + ScaleDPI(4)
l_Gradient[2].upperleft = ll_X1 + ScaleDPI(7)
l_Gradient[2].lowerright = ll_Y1 + ScaleDPI(11)

inv_win32.PolyLine(hdc, l_Gradient, 2)

inv_win32.DeleteObject(hRPen)

RETURN 1
end function

event mouseleave();ib_mouseover = FALSE
ib_mousecaptured = FALSE

IF NOT ib_mousedown THEN
	il_index = 0
END IF

of_UpdatePoints()
SetRedraw(TRUE)

end event

on u_cst_dwnav.create
int iCurrent
call super::create
this.st_pbus_vcrnav=create st_pbus_vcrnav
this.sle_value=create sle_value
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.st_pbus_vcrnav
this.Control[iCurrent+2]=this.sle_value
end on

on u_cst_dwnav.destroy
call super::destroy
destroy(this.st_pbus_vcrnav)
destroy(this.sle_value)
end on

event onpaint;call super::onpaint;ULong ll_color1, ll_color2

IF il_currentstyle = VS2013 THEN
	RETURN of_Paint2013(hdc)
END IF

//BCW - 2.0.0
IF ib_solidbackground THEN
	IF ib_quickaccessmode THEN
		ll_color1 = of_GetColor("BACKGROUND4")
		ll_color2 = of_GetColor("BACKGROUND4")
	ELSE
		ll_color1 = of_GetColor("BACKGROUND3")
		ll_color2 = of_GetColor("BACKGROUND3")
	END IF
ELSE
	ll_color1 = of_GetColor("BACKGROUND1")
	ll_color2 = of_GetColor("BACKGROUND2")
END IF

in_Gradient.of_SetHDC(hdc)

boolean lb_Horizontal

IF il_CurrentOrientation = HORIZONTAL THEN
	lb_Horizontal = TRUE
ELSE
	lb_Horizontal = FALSE
END IF
	
CHOOSE CASE il_CurrentStyle
	CASE XP
		in_Gradient.of_XPGradient(ll_color1, ll_color2, THIS,ib_displayborder,of_GetColor("BORDER"), lb_Horizontal)
	CASE VISTAEMBOSSED
		in_Gradient.of_Vista1Gradient(ll_color1, ll_color2, THIS,ib_displayborder,of_GetColor("BORDER"), lb_Horizontal)
	CASE VISTAORIGINAL
		in_Gradient.of_Vista2Gradient(ll_color1, ll_color2, THIS,ib_displayborder,of_GetColor("BORDER"), lb_Horizontal)
	CASE VISTAGLASS
		in_Gradient.of_Vista3Gradient(ll_color1, ll_color2, THIS,ib_displayborder,of_GetColor("BORDER"), lb_Horizontal)	
	CASE CUSTOM
		in_Gradient.of_CustomGradient(ll_color1, ll_color2, THIS,ib_displayborder,of_GetColor("BORDER"), lb_Horizontal)	
END CHOOSE
//BCW - 2.0.0

//of_VerticalGradient (of_GetColor("BACKGROUND1"), of_GetColor("BACKGROUND2"), THIS,ib_displayborder,of_GetColor("BORDER"), il_CurrentStyle)

IF ib_raisedborder THEN
	in_Gradient.of_DrawLine(Width - 3,0,Width - 3, Height, of_GetColor("CAP"))
	in_Gradient.of_DrawLine(0,Height - 3,Width, Height - 3, of_GetColor("CAP"))
END IF

LongPtr il_imagelist
CHOOSE CASE il_CurrentSize
	CASE SMALL
		il_imagelist = il_imagelistsmall
	CASE MEDIUM
		il_imagelist = il_imagelistmedium
	CASE LARGE
		il_imagelist = il_imagelistlarge
	CASE XLARGE
		il_imagelist = il_imagelistxlarge
END CHOOSE

in_Gradient.of_DrawButtons(THIS, ToolbarItemsLeft, FontName, FontSize, FontColor, il_ImageList, il_CurrentOrientation, il_ChevronIndex, TextUnderImage, ib_quickaccessmode, ib_fontcoloroverride)

Long ll_index, ll_count
Boolean lb_selected
ll_count = UpperBound(ToolbarItemsLeft)

FOR ll_index = 1 TO ll_count
	IF ll_index = il_index THEN
		lb_selected = TRUE
	ELSE
		lb_selected = FALSE
	END IF
	IF ToolbarItemsLeft[ll_index].Visible THEN
		CHOOSE CASE ToolbarItemsLeft[ll_index].ImageIndex
			CASE FIRST_RECORD
				of_DrawFirst(hdc, ToolbarItemsLeft[ll_index].paintregion, lb_selected)
			CASE PREV_RECORD
				of_DrawPrevious(hdc, ToolbarItemsLeft[ll_index].paintregion, lb_selected)
			CASE NEXT_RECORD
				of_DrawNext(hdc, ToolbarItemsLeft[ll_index].paintregion, lb_selected)
			CASE LAST_RECORD
				of_DrawLast(hdc, ToolbarItemsLeft[ll_index].paintregion, lb_selected)
			CASE INSERT_RECORD
				of_DrawInsert(hdc, ToolbarItemsLeft[ll_index].paintregion, lb_selected)
			CASE DELETE_RECORD
				of_DrawDelete(hdc, ToolbarItemsLeft[ll_index].paintregion, lb_selected)
		END CHOOSE
	END IF
NEXT

of_DrawEval(hdc)

RETURN 1
end event

event destructor;call super::destructor;IF IsValid(inv_color_theme) THEN DESTROY inv_color_theme
end event

event constructor;call super::constructor;Long ll_color1, ll_color2, ll_index

IF Len(Trim(is_CurrentTheme)) = 0 THEN
	n_cst_ui_imagelist lnv_theme
	of_SetTheme(lnv_theme.of_GetGlobalTheme())
ELSE
	of_SetTheme(is_CurrentTheme)
END IF

il_ID = inv_ToolTip.of_AddTool( THIS, "" , inv_ToolTip.TTF_SUBCLASS ) 

of_GetWindow()

IF Width > Height THEN
	il_CurrentOrientation = HORIZONTAL
ELSE
	il_CurrentOrientation = VERTICAL
END IF

TriggerEvent('resize')

of_GetFontSize()

of_AddItem(inv_resourcemanager.of_GetString(FirstButtonText), FIRST_RECORD, inv_resourcemanager.of_GetString(FirstButtonTipText), LEFT)
of_AddItem(inv_resourcemanager.of_GetString(PrevButtonText), PREV_RECORD, inv_resourcemanager.of_GetString(PrevButtonTipText), LEFT)
of_AddObject("",sle_value)
of_AddItem(inv_resourcemanager.of_GetString(NextButtonText), NEXT_RECORD, inv_resourcemanager.of_GetString(NextButtonTipText), LEFT)
of_AddItem(inv_resourcemanager.of_GetString(LastButtonText), LAST_RECORD, inv_resourcemanager.of_GetString(LastButtonTipText), LEFT)

of_AddItem(inv_resourcemanager.of_GetString(DeleteButtonText), DELETE_RECORD, inv_resourcemanager.of_GetString(DeleteButtonTipText), RIGHT)
of_AddItem(inv_resourcemanager.of_GetString(InsertButtonText), INSERT_RECORD, inv_resourcemanager.of_GetString(InsertButtonTipText), RIGHT)
end event

type st_pbus_vcrnav from statictext within u_cst_dwnav
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
string text = "   VCR Navigation"
boolean focusrectangle = false
end type

event constructor;Hide()
end event

type sle_value from singlelineedit within u_cst_dwnav
integer x = 352
integer y = 352
integer width = 603
integer height = 88
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
boolean displayonly = true
borderstyle borderstyle = stylelowered!
end type

