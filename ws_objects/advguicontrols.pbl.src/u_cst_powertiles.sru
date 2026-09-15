$PBExportHeader$u_cst_powertiles.sru
forward
global type u_cst_powertiles from u_uspb_base
end type
type st_pbus_tileslabel from statictext within u_cst_powertiles
end type
type inv_win32 from n_cst_win32 within u_cst_powertiles
end type
end forward

global type u_cst_powertiles from u_uspb_base
integer width = 2185
integer height = 860
integer unitsperline = 22
integer linesperpage = 5
event resize pbm_size
event tileclicked ( string as_tile,  integer ai_index )
event tilerightclicked ( string as_tile,  integer ai_index )
event wm_mousewheel ( longptr wparam,  longptr lparam )
st_pbus_tileslabel st_pbus_tileslabel
inv_win32 inv_win32
end type
global u_cst_powertiles u_cst_powertiles

type variables
Public:
	String FontName = "Segoe UI"
	Long FontSize = 12
	boolean AutoAlign = TRUE

	CONSTANT	integer		SUCCESS	= 1
	CONSTANT	integer		FAILURE		= -1
	CONSTANT	integer		NO_ACTION	= 0
	
	CONSTANT	alignment	ALIGN_LEFT		= Left!
	CONSTANT	alignment	ALIGN_CENTER	= Center!
	CONSTANT	alignment	ALIGN_RIGHT	= Right!

	CONSTANT Integer 		SMALL = 1
	CONSTANT Integer 		LARGE = 2


	n_cst_pbui_theme 		inv_color_theme
	u_cst_tile 					iuo_tiles[]
	window 						iw_parent
	
	
end variables

forward prototypes
public function integer of_settheme (string as_color)
public function integer of_settilecolor (string as_title, long al_color)
public function integer of_getparentwindow ()
public function integer of_reorganize ()
public function integer of_aligntitle (alignment ae_alignment)
public function integer of_addtile (string as_title, string as_image)
public function integer of_addtile (string as_title, string as_image, integer ai_size)
public function integer of_addtile (string as_title, string as_image, string as_description, integer ai_size)
public function integer of_addtile (string as_title, string as_image, long al_color, integer ai_size)
public function integer of_addtile (string as_title, string as_image, string as_description, long al_color, integer ai_size)
public function integer of_addtile (string as_title, string as_image, long al_color, integer ai_size, alignment ae_alignment)
public function integer of_addtile (string as_title, string as_image, long al_color, integer ai_size, string as_alignment)
public function integer of_addtile (string as_title, string as_image, string as_description, long al_color, integer ai_size, alignment ae_alignment)
public function integer of_addtile (string as_title, string as_image, string as_description, long al_color, integer ai_size, string as_alignment)
public function integer of_addtile (string as_title, string as_image, integer ai_size, alignment ae_alignment)
public function integer of_addtile (string as_title, string as_image, string as_description, integer ai_size, alignment ae_alignment)
public function integer of_addtile (string as_title, string as_image, alignment ae_alignment)
public function integer of_addtile (string as_title, string as_image, string as_description, alignment ae_alignment)
public function integer of_reset ()
public function integer of_addtile (string as_title, string as_image, string as_description)
public function integer of_setfont (string as_font, integer ai_fontsize)
public function integer of_setfontname (string as_font)
public function integer of_setfontsize (integer ai_fontsize)
public function integer of_settiletextcolor (string as_title, long al_color)
end prototypes

event resize;
of_Reorganize()
end event

event wm_mousewheel(longptr wparam, longptr lparam);IF NOT THIS.VScrollBar THEN RETURN

CONSTANT Integer WM_VSCROLL = 277

 IF wparam < 0 THEN
	Send(Handle(THIS), WM_VSCROLL, 1, 0)
	Send(Handle(THIS), WM_VSCROLL, 1, 0)
	Send(Handle(THIS), WM_VSCROLL, 1, 0)
ELSE
	Send(Handle(THIS), WM_VSCROLL, 0, 0)
	Send(Handle(THIS), WM_VSCROLL, 0, 0)
	Send(Handle(THIS), WM_VSCROLL, 0, 0)
END IF
end event

public function integer of_settheme (string as_color);IF IsValid(inv_color_theme) THEN DESTROY inv_color_theme
inv_color_theme = CREATE USING "n_cst_pbui_theme_" + as_color

Long ll_index, ll_count

ll_count = UpperBound(iuo_tiles)

FOR ll_index = 1 TO ll_count
	iuo_tiles[ll_index].of_SetTileColor(inv_color_theme.of_GetColor(inv_color_theme.Tiles, "TILE"))
NEXT


RETURN 1
end function

public function integer of_settilecolor (string as_title, long al_color);Long ll_index, ll_count

ll_count = UpperBound(iuo_tiles)

as_title = Lower(as_title)

FOR ll_index = 1 TO ll_count
	IF Lower(iuo_tiles[ll_index].of_GetTitle()) = as_title THEN
		iuo_tiles[ll_index].of_SetTileColor(al_color)
	END IF
NEXT


RETURN 1
end function

public function integer of_getparentwindow ();PowerObject	lpo_parent
Window lw_window

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

public function integer of_reorganize ();//THIS IS THE HARD PART....
Long ll_index, ll_count, ll_colcount
Long ll_columns
Boolean lb_done

ll_columns = Abs((Width + 40)/690)

ll_count = UpperBound(iuo_tiles)

IF ll_count = 0 THEN
	lb_done = TRUE
END IF

IF AutoAlign THEN
	//Figure out the best number of columns
	DO UNTIL lb_done
		//Minimum size is two columns
		IF ll_columns <= 2 THEN
			ll_columns = 2
			lb_done = TRUE
			EXIT
		END IF
		
		ll_colcount = 0
		
		FOR ll_index = 1 TO ll_count
			
			IF iuo_tiles[ll_index].of_GetSize() = SMALL THEN
				ll_colcount = ll_colcount + 1
			ELSE
				ll_colcount = ll_colcount + 2
			END IF
			
			IF ll_colcount > ll_columns THEN
				ll_columns = ll_columns - 1
				lb_done = FALSE
				EXIT
			END IF
			
			IF ll_colcount = ll_columns THEN
				ll_colcount = 0
			END IF
			
			lb_done = TRUE
		NEXT
	LOOP
END IF

Long ll_x, ll_y
ll_colcount = 0

FOR ll_index = 1 TO ll_count
	
	IF ll_colcount >= ll_columns OR &
		(NOT AutoAlign AND iuo_tiles[ll_index].of_GetSize() = SMALL AND (ll_x + 690) > Width) OR &
		(NOT AutoAlign AND iuo_tiles[ll_index].of_GetSize() = LARGE AND (ll_x + 1380) > Width) &
	THEN
		ll_x = 0
		ll_y = ll_y + 424 + 32
		ll_colcount = 0
	END IF
	
	iuo_tiles[ll_index].Move(ll_x, ll_y)
	
	IF iuo_tiles[ll_index].of_GetSize() = SMALL THEN
		ll_x = ll_x + 690
		ll_colcount = ll_colcount + 1
	ELSE
		ll_x = ll_x + 1380
		ll_colcount = ll_colcount + 2
	END IF

NEXT

IF ll_y + 424 > THIS.Height THEN
	THIS.VScrollBar = TRUE
	
	UnitsPerLine = (ll_y + 424)  * .75 / 100
	LinesPerPage = ((ll_y + 424) / 2) / UnitsPerLine
ELSE 
	THIS.VScrollBar = FALSE
END IF

RETURN 1
end function

public function integer of_aligntitle (alignment ae_alignment);integer	li_Return	= FAILURE

Long 		ll_index
Long		ll_count

IF NOT IsNull( ae_alignment ) THEN
	li_return	= SUCCESS
	ll_count 	= UpperBound(iuo_tiles)
	
	FOR ll_index = 1 TO ll_count
		iuo_tiles[ll_index].of_AlignText( ae_alignment )
	NEXT
END IF

SetRedraw(TRUE)

RETURN li_Return
end function

public function integer of_addtile (string as_title, string as_image);RETURN of_AddTile(as_title, as_image, "", SMALL)
end function

public function integer of_addtile (string as_title, string as_image, integer ai_size);RETURN of_addtile(as_title, as_image, "", inv_color_theme.of_GetColor(inv_color_theme.Tiles, "TILE"), ai_size)

end function

public function integer of_addtile (string as_title, string as_image, string as_description, integer ai_size);RETURN of_addtile(as_title, as_image, as_description, inv_color_theme.of_GetColor(inv_color_theme.Tiles, "TILE"), ai_size)

end function

public function integer of_addtile (string as_title, string as_image, long al_color, integer ai_size);RETURN this.of_AddTile( as_title, as_image, "", al_color, ai_size, this.ALIGN_LEFT )
end function

public function integer of_addtile (string as_title, string as_image, string as_description, long al_color, integer ai_size);RETURN this.of_AddTile( as_title, as_image, as_description, al_color, ai_size, this.ALIGN_LEFT )
end function

public function integer of_addtile (string as_title, string as_image, long al_color, integer ai_size, alignment ae_alignment);RETURN of_addtile(as_title, as_image, "", al_color, ai_size, ae_alignment)

end function

public function integer of_addtile (string as_title, string as_image, long al_color, integer ai_size, string as_alignment);RETURN of_addtile(as_title, as_image, "", al_color, ai_size, as_alignment)

end function

public function integer of_addtile (string as_title, string as_image, string as_description, long al_color, integer ai_size, alignment ae_alignment);u_cst_tile 		luo_tile

Send(Handle(this), 277, 6, 0)

iw_parent.OpenUserObject(luo_tile)
inv_win32.SetParent (Handle(luo_tile), Handle(THIS))

luo_tile.of_SetText(as_title, as_image, as_description, ae_alignment)
luo_tile.of_SetFont(FontName, FontSize, FALSE)

IF ai_size = SMALL THEN
	luo_tile.of_SetSize(SMALL, 650)
ELSE
	luo_tile.of_SetSize(LARGE, 1340)
END IF

IF IsValid(inv_color_theme) THEN
	luo_tile.of_SetTileColor(al_color)
END IF
luo_tile.of_SetParent(THIS)

iuo_tiles[UpperBound(iuo_tiles) + 1] = luo_tile
iuo_tiles[UpperBound(iuo_tiles)].il_index = UpperBound(iuo_tiles)

of_Reorganize()
luo_tile.Show()

RETURN UpperBound(iuo_tiles)
end function

public function integer of_addtile (string as_title, string as_image, string as_description, long al_color, integer ai_size, string as_alignment);u_cst_tile 		luo_tile

Send(Handle(this), 277, 6, 0)

iw_parent.OpenUserObject(luo_tile)
inv_win32.SetParent (Handle(luo_tile), Handle(THIS))

CHOOSE CASE Upper( as_alignment )
	CASE "RIGHT"
		luo_tile.of_SetText(as_title, as_image, as_description, this.ALIGN_RIGHT)
	CASE "CENTER"
		luo_tile.of_SetText(as_title, as_image, as_description, this.ALIGN_CENTER)
	CASE ELSE
		luo_tile.of_SetText(as_title, as_image, as_description, this.ALIGN_LEFT)
END CHOOSE

luo_tile.of_SetFont(FontName, FontSize, FALSE)

IF ai_size = SMALL THEN
	luo_tile.of_SetSize(SMALL, 650)
ELSE
	luo_tile.of_SetSize(LARGE, 1340)
END IF

IF IsValid(inv_color_theme) THEN
	luo_tile.of_SetTileColor(al_color)
END IF
luo_tile.of_SetParent(THIS)

iuo_tiles[UpperBound(iuo_tiles) + 1] = luo_tile
iuo_tiles[UpperBound(iuo_tiles)].il_index = UpperBound(iuo_tiles)

of_Reorganize()
luo_tile.Show()

RETURN UpperBound(iuo_tiles)
end function

public function integer of_addtile (string as_title, string as_image, integer ai_size, alignment ae_alignment);RETURN of_addtile(as_title, as_image, "", inv_color_theme.of_GetColor(inv_color_theme.Tiles, "TILE"), ai_size, ae_alignment)

end function

public function integer of_addtile (string as_title, string as_image, string as_description, integer ai_size, alignment ae_alignment);RETURN of_addtile(as_title, as_image, as_description, inv_color_theme.of_GetColor(inv_color_theme.Tiles, "TILE"), ai_size, ae_alignment)

end function

public function integer of_addtile (string as_title, string as_image, alignment ae_alignment);RETURN of_AddTile(as_title, as_image, "", SMALL, ae_alignment)
end function

public function integer of_addtile (string as_title, string as_image, string as_description, alignment ae_alignment);RETURN of_AddTile(as_title, as_image, as_description, SMALL, ae_alignment)
end function

public function integer of_reset ();Long ll_index, ll_count
u_cst_tile luo_tiles[]

Send(Handle(this), 277, 6, 0)

ll_count = UpperBound(iuo_tiles)

FOR ll_index = 1 TO ll_count
	iuo_tiles[ll_index].Hide()
	inv_win32.SetParent (Handle(iuo_tiles[ll_index]), Handle(iw_parent))
	iw_parent.CloseUserObject(iuo_tiles[ll_index])
NEXT

iuo_tiles = luo_tiles

RETURN 1
end function

public function integer of_addtile (string as_title, string as_image, string as_description);RETURN of_AddTile(as_title, as_image, as_description, SMALL)
end function

public function integer of_setfont (string as_font, integer ai_fontsize);Long ll_index, ll_count

FontName = as_font
FontSize = ai_fontsize

ll_count = UpperBound(iuo_tiles)

FOR ll_index = 1 TO ll_count
	iuo_tiles[ll_index].of_SetFont(FontName, FontSize, TRUE)
NEXT

RETURN 1
end function

public function integer of_setfontname (string as_font);FontName = as_font
RETURN of_SetFont(FontName, FontSize)
end function

public function integer of_setfontsize (integer ai_fontsize);FontSize = ai_fontsize
RETURN of_SetFont(FontName, FontSize)
end function

public function integer of_settiletextcolor (string as_title, long al_color);Long ll_index, ll_count

ll_count = UpperBound(iuo_tiles)

as_title = Lower(as_title)

FOR ll_index = 1 TO ll_count
	IF Lower(iuo_tiles[ll_index].of_GetTitle()) = as_title THEN
		iuo_tiles[ll_index].of_SetTileTextColor(al_color)
	END IF
NEXT


RETURN 1
end function

on u_cst_powertiles.create
int iCurrent
call super::create
this.st_pbus_tileslabel=create st_pbus_tileslabel
this.inv_win32=create inv_win32
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.st_pbus_tileslabel
end on

on u_cst_powertiles.destroy
call super::destroy
destroy(this.st_pbus_tileslabel)
destroy(this.inv_win32)
end on

event constructor;call super::constructor;n_cst_ui_imagelist lnv_theme
of_SetTheme(lnv_theme.of_GetGlobalTheme())

of_GetParentWindow()
end event

event destructor;call super::destructor;of_Reset()
end event

event other;call super::other;CONSTANT integer WM_MOUSEWHEEL = 522

IF Message.Number= WM_MOUSEWHEEL THEN
    Message.Processed = TRUE

	TRIGGER EVENT wm_MouseWheel(wparam, lparam)
END IF
end event

type st_pbus_tileslabel from statictext within u_cst_powertiles
integer width = 10002
integer height = 10000
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 16777215
long backcolor = 8421376
string text = "  Tiles"
boolean focusrectangle = false
end type

event constructor;Hide()
end event

type inv_win32 from n_cst_win32 within u_cst_powertiles descriptor "pb_nvo" = "true" 
end type

on inv_win32.create
call super::create
end on

on inv_win32.destroy
call super::destroy
end on

