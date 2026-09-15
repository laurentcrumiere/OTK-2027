$PBExportHeader$u_cst_powersearchbox.sru
forward
global type u_cst_powersearchbox from userobject
end type
type uo_searchresults from u_cst_powersearchresults within u_cst_powersearchbox
end type
type uo_searchfield from u_cst_powersearchfield within u_cst_powersearchbox
end type
type st_uspb_powersearchbox from statictext within u_cst_powersearchbox
end type
type trackmouseevent2 from structure within u_cst_powersearchbox
end type
type inv_pbusexternal from n_cst_pbusexternal within u_cst_powersearchbox
end type
type inv_win32 from n_cst_win32 within u_cst_powersearchbox
end type
end forward

type trackmouseevent2 from structure
	unsignedlong		cbsize
	unsignedlong		dwflags
	unsignedlong		hwndtrack
	unsignedlong		dwhovertime
end type

global type u_cst_powersearchbox from userobject
integer width = 1710
integer height = 1004
long backcolor = 67108864
string text = "none"
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
event resize pbm_size
event itemselected ( long rownumber,  string itemtext )
event lbuttondown pbm_lbuttondown
event mousemove pbm_mousemove
event itemdoubleclicked ( long rownumber,  string itemtext )
event onenter ( string searchterm )
event searchmodified ( string as_term )
uo_searchresults uo_searchresults
uo_searchfield uo_searchfield
st_uspb_powersearchbox st_uspb_powersearchbox
inv_pbusexternal inv_pbusexternal
inv_win32 inv_win32
end type
global u_cst_powersearchbox u_cst_powersearchbox

type prototypes
FUNCTION LongPTR GetFocusWin() LIBRARY "User32" Alias For "GetFocus"
FUNCTION Boolean TrackMouseEvent (ref trackmouseevent2 lpTrackMouseEvent ) Library 'user32.dll' alias for "TrackMouseEvent"
end prototypes

type variables
Double MatchThreshold = .25
Long MaxResultCount = 10000
Boolean SearchOnEnter = FALSE
String Theme = "BLUE"
Int FrameThickness = 4
String SearchPlaceholder = "LBL_Search"
n_uspb_resourcemanager inv_resourcemanager

PROTECTED:

Window iw_parent
Boolean IsDropdown

PRIVATE:

n_cst_PowerSearch inv_powersearch
n_cst_pbui_theme inv_color_theme

Boolean ib_mousecaptured

constant ulong WM_MOUSELEAVE = 675 
constant uLong TME_LEAVE = 2

private trackmouseevent2 istr_TRACKMOUSEEVENT

end variables

forward prototypes
private function integer of_search (string as_searchterm)
private function integer of_resize (integer newwidth, integer newheight)
public function integer of_settheme (string as_color)
public function integer of_setfontname (string as_font)
private function integer of_search (string as_searchterm)
private function integer of_resize (integer newwidth, integer newheight)
public function integer of_settheme (string as_color)
public function integer of_setfontname (string as_font)
public function integer of_setfontsize (integer ai_size)
public function integer of_setplaceholdertext (string as_text)
public function integer of_setcornerradius (integer ai_radius)
public function integer of_setparentwindow (window aw_parent)
public function integer of_clear ()
private function integer of_getparentwindow ()
public function integer of_setdatasource (datastore lds_sourcedata, integer li_searchcolumn)
private function integer of_closedropdown ()
end prototypes

event resize;of_Resize(NewWidth, NewHeight)

end event

event lbuttondown;IF NOT IsDropDown THEN RETURN

Long ll_posx, ll_posy

ll_posx = THIS.PointerX()
ll_posy = THIS.PointerY()

IF ll_posx < 0 OR &
    ll_posy < 0 OR &
    ll_posx > Width OR &
    ll_posy > Height + uo_searchresults.Height THEN
	
	of_CloseDropDown()
	
	RETURN
END IF
end event

private function integer of_search (string as_searchterm);DataStore lds_powersearchresults
Long ll_index, ll_count, ll_row
Integer ll_x, ll_y, ll_height, ll_rowcount
Double ld_dice

uo_searchresults.SetRedraw(FALSE)

uo_searchresults.dw_searchresults.Reset()

inv_powersearch.SetMatchThreshold(MatchThreshold)
inv_powersearch.SetMaxResultCount(Maxresultcount)
lds_powersearchresults = inv_powersearch.Search(as_searchterm)

ll_count = lds_powersearchresults.RowCount()

uo_searchresults.dw_searchresults.SetRedraw(FALSE)
FOR ll_index = 1 TO ll_count
	ll_row = uo_searchresults.dw_searchresults.InsertRow(0)
	uo_searchresults.dw_searchresults.SetItem(ll_row, "rownumber", lds_powersearchresults.GetItemNumber(ll_index, 1))
	uo_searchresults.dw_searchresults.SetItem(ll_row, "searchresult", lds_powersearchresults.GetItemString(ll_index, 3))
NEXT
uo_searchresults.dw_searchresults.SetRedraw(TRUE)

IF IsDropDown THEN
	IF uo_searchresults.dw_searchresults.RowCount() > 0 THEN
		ll_rowcount = Min(uo_searchresults.dw_searchresults.RowCount(), 10)
		
		ll_height = ((ll_rowcount + 1) * 76) + 20
		
		uo_searchresults.BringToTop = TRUE
		uo_searchresults.POST Resize(THIS.Width, ll_height)
		uo_searchresults.Move(THIS.X, THIS.Y + THIS.Height)
		
		IF NOT uo_searchresults.Visible THEN
			inv_pbusexternal.PBUSInstallMouseHook(Handle(THIS))
		END IF
		
		uo_searchresults.Show()
		
	ELSE
		POST of_CloseDropDown()
	END IF
END IF

uo_searchresults.SetRedraw(TRUE)

RETURN 1
end function

private function integer of_resize (integer newwidth, integer newheight);uo_searchfield.Width = NewWidth

IF NOT IsDropDown THEN
	uo_searchresults.Resize(NewWidth, NewHeight - uo_searchresults.Y)
END IF

RETURN 1
end function

public function integer of_settheme (string as_color);IF IsValid(inv_color_theme) THEN DESTROY inv_color_theme
inv_color_theme = CREATE USING "n_cst_pbui_theme_" + as_color

Theme = as_color
uo_searchfield.of_SetTheme(as_color)


ULong ll_color, ll_selectedtextcolor

ll_color = inv_color_theme.of_GetColor(inv_color_theme.SPA, "BACKGROUND1")
ll_selectedtextcolor = inv_color_theme.of_GetColor("", "ITEMTEXTHOVER")

uo_searchresults.dw_searchresults.modify("selectedtextcolor.Expression='"+String(ll_selectedtextcolor)+"'")
uo_searchresults.dw_searchresults.Modify("t_rowselector.Background.Color='" + String(ll_color) + "'")

uo_searchresults.of_SetBorderColor(inv_color_theme.of_GetColor(inv_color_theme.SPA, "BACKGROUND1"))

SetRedraw(TRUE)

RETURN 1
end function

public function integer of_setfontname (string as_font);uo_searchresults.dw_searchresults.Modify("searchresult.Font.Face='" + as_font + "'")

RETURN uo_searchfield.of_SetFontName(as_font)
end function

public function integer of_setfontsize (integer ai_size);uo_searchresults.dw_searchresults.Modify("searchresult.Font.Height='" + String(ai_size * -1) + "'")

RETURN uo_searchfield.of_SetFontSize(ai_size)
end function

public function integer of_setplaceholdertext (string as_text);RETURN uo_searchfield.of_SetPlaceholderText(as_text)
end function

public function integer of_setcornerradius (integer ai_radius);RETURN uo_searchfield.of_SetCornerRadius(ai_radius)
end function

public function integer of_setparentwindow (window aw_parent);iw_parent = aw_parent
RETURN 1
end function

public function integer of_clear ();uo_searchfield.of_Clear()
uo_searchresults.dw_searchresults.Reset()
RETURN 1
end function

private function integer of_getparentwindow ();PowerObject	lpo_parent
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

public function integer of_setdatasource (datastore lds_sourcedata, integer li_searchcolumn);IF NOT IsValid(inv_powersearch) THEN inv_powersearch = CREATE n_cst_powersearch

RETURN inv_powersearch.SetDataSource(lds_SourceData, li_SearchColumn)
end function

private function integer of_closedropdown ();inv_pbusexternal.PBUSRemoveMouseHook()
uo_searchresults.Hide()

RETURN 1
end function

on u_cst_powersearchbox.create
this.uo_searchresults=create uo_searchresults
this.uo_searchfield=create uo_searchfield
this.st_uspb_powersearchbox=create st_uspb_powersearchbox
this.inv_pbusexternal=create inv_pbusexternal
this.inv_win32=create inv_win32
this.Control[]={this.uo_searchresults,&
this.uo_searchfield,&
this.st_uspb_powersearchbox}
end on

on u_cst_powersearchbox.destroy
destroy(this.uo_searchresults)
destroy(this.uo_searchfield)
destroy(this.st_uspb_powersearchbox)
destroy(this.inv_pbusexternal)
destroy(this.inv_win32)
end on

event destructor;IF IsValid(inv_powersearch) THEN DESTROY inv_powersearch
inv_pbusexternal.PBUSRemoveMouseHook()
end event

event constructor;n_cst_ui_imagelist lnv_theme
of_SetTheme(lnv_theme.of_GetGlobalTheme())

IF NOT IsValid(inv_powersearch) THEN inv_powersearch = CREATE n_cst_powersearch
IF NOT IsValid(iw_parent) THEN of_GetParentWindow()

uo_SearchField.SearchOnEnter = SearchOnEnter
uo_SearchField.IsDropDown = IsDropDown
uo_SearchField.Theme =Theme
uo_SearchField.FrameThickness = FrameThickness
uo_SearchField.SearchPlaceholder = inv_resourcemanager.of_GetString(SearchPlaceholder)
uo_SearchField.BackColor = THIS.BackColor
uo_SearchField.of_Init()

of_Resize(Width, Height)
end event

event rbuttondown;IF NOT IsDropDown THEN RETURN

Long ll_posx, ll_posy

ll_posx = THIS.PointerX()
ll_posy = THIS.PointerY()

IF ll_posx < 0 OR &
    ll_posy < 0 OR &
    ll_posx > Width OR &
    ll_posy > Height + uo_searchresults.Height THEN
	
	of_CloseDropDown()
	
	RETURN
END IF
end event

type uo_searchresults from u_cst_powersearchresults within u_cst_powersearchbox
event destroy ( )
integer y = 132
integer taborder = 20
end type

on uo_searchresults.destroy
call u_cst_powersearchresults::destroy
end on

event itemdoubleclicked;call super::itemdoubleclicked;IF IsDropDown THEN
	PARENT.Trigger Event ItemSelected(rownumber, itemtext)
	of_CloseDropdown()
ELSE
	PARENT.Trigger Event ItemDoubleClicked(rownumber, itemtext)
END IF
	
end event

event losefocus;call super::losefocus;IF IsDropDown THEN
	IF GetFocusWin() = Handle(uo_SearchField.sle_searchterm) THEN RETURN
	
	of_CloseDropDown()
END IF
end event

event ue_mousemove;call super::ue_mousemove;PARENT.Trigger Event MouseMove(0, xpos, ypos)
end event

event ue_uparrow;call super::ue_uparrow;uo_searchfield.sle_searchterm.SetFocus()

end event

event itemselected;call super::itemselected;IF NOT IsDropDown THEN
	PARENT.Trigger Event ItemSelected(rownumber, itemtext)
END IF
	
end event

type uo_searchfield from u_cst_powersearchfield within u_cst_powersearchbox
integer height = 136
integer taborder = 20
end type

event ue_search;call super::ue_search;POST of_Search(as_term)

PARENT.Trigger Event SearchModified(as_term)

end event

on uo_searchfield.destroy
call u_cst_powersearchfield::destroy
end on

event losefocus;call super::losefocus;IF IsDropDown THEN
	IF GetFocusWin() = Handle(uo_SearchResults.dw_searchresults) THEN RETURN
	
	of_CloseDropDown()
END IF
end event

event ue_downarrow;call super::ue_downarrow;uo_searchresults.dw_searchresults.SetFocus()

end event

event ue_mousemove;call super::ue_mousemove;PARENT.Trigger Event MouseMove(0, xpos, ypos)
end event

event ue_onenter;call super::ue_onenter;PARENT.Trigger Event OnEnter(as_term)
end event

type st_uspb_powersearchbox from statictext within u_cst_powersearchbox
integer width = 10002
integer height = 10000
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 16777215
long backcolor = 8421376
string text = "  Power SearchBox"
boolean focusrectangle = false
end type

event constructor;Hide()
end event

type inv_pbusexternal from n_cst_pbusexternal within u_cst_powersearchbox descriptor "pb_nvo" = "true" 
end type

on inv_pbusexternal.create
call super::create
end on

on inv_pbusexternal.destroy
call super::destroy
end on

type inv_win32 from n_cst_win32 within u_cst_powersearchbox descriptor "pb_nvo" = "true" 
end type

on inv_win32.create
call super::create
end on

on inv_win32.destroy
call super::destroy
end on

