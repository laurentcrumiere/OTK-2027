$PBExportHeader$w_powerdockfloat.srw
forward
global type w_powerdockfloat from w_pbus_spa_captionless
end type
type uo_header from u_cst_powerdockpanelheader within w_powerdockfloat
end type
type rect from structure within w_powerdockfloat
end type
end forward

type rect from structure
	long		left
	long		top
	long		right
	long		bottom
end type

global type w_powerdockfloat from w_pbus_spa_captionless
integer width = 2994
integer height = 1040
boolean controlmenu = false
boolean minbox = false
boolean maxbox = false
windowtype windowtype = popup!
long backcolor = 67108864
boolean toolbarvisible = false
event killfocus pbm_killfocus
uo_header uo_header
end type
global w_powerdockfloat w_powerdockfloat

type prototypes
Function LongPtr ImageList_GetIcon( LongPtr himl, long i, ulong flags) Library "comctl32.dll"
end prototypes

type variables
Constant Long GWL_STYLE = -16
CONSTANT Integer SM_CYCAPTION = 4
CONSTANT Integer SM_CYBORDER = 6

u_cst_powerdock iuo_powerdock
Window iw_parentwindow

Window iw_object
UserObject iuo_object

String is_fname
Long il_handle
Boolean ib_movingX
Boolean ib_bypasscloseX
Long il_lastxX
Long il_lastyX
Long il_style

ULong il_parent

String is_image
LongPtr hIcon
end variables

forward prototypes
public function integer of_addobject (string as_text, userobject auo_object)
public function integer of_addobject (string as_text, window aw_object)
public function integer of_setpowerdock (u_cst_powerdock auo_powerdock)
public function integer of_floatmode ()
public function integer of_setparentwindow (window aw_parent)
public function integer of_move (long al_x, long al_y)
public function integer of_settext (string as_text)
public function userobject of_getchildobject ()
public function window of_getchildwindow ()
public function integer of_move (long al_x)
public function integer of_setimage (long al_image)
end prototypes

public function integer of_addobject (string as_text, userobject auo_object);inv_win32.SetParent(Handle(auo_object), Handle(THIS))

iuo_object = auo_object

THIS.Title = as_text
uo_header.of_SetText("  " + as_text, uo_header.LEFT)

TriggerEvent("Resize")

iuo_object.Show()
iuo_object.SetFocus()

RETURN 1
end function

public function integer of_addobject (string as_text, window aw_object);inv_win32.SetParent(Handle(aw_object), Handle(THIS))

iw_object = aw_object

THIS.Title = as_text
uo_header.of_SetText("  " + as_text, uo_header.LEFT)

TriggerEvent("Resize")

aw_object.Show()
aw_object.SetFocus()

RETURN 1
end function

public function integer of_setpowerdock (u_cst_powerdock auo_powerdock);iuo_powerdock = auo_powerdock
RETURN 1
end function

public function integer of_floatmode ();Long ll_x, ll_y, ll_width, ll_height

il_lastxX = -1
il_lastyX = -1
ib_movingX = TRUE
inv_win32.SetCapture(Handle(uo_header))
SetRedraw(TRUE)


RETURN 1
end function

public function integer of_setparentwindow (window aw_parent);iw_parentwindow = aw_parent


//inv_win32.SetParent(Handle(THIS), Handle(aw_parent))


RETURN 1
end function

public function integer of_move (long al_x, long al_y);Long ll_x, ll_y

ll_x = iw_parentwindow.X + al_x
ll_y = iw_parentwindow.Y + al_y

Move(ll_x, ll_y) 

RETURN 1
end function

public function integer of_settext (string as_text);THIS.Title = as_text
uo_header.of_SetText("  " + as_text, uo_header.LEFT)

RETURN 1
end function

public function userobject of_getchildobject ();RETURN iuo_object
end function

public function window of_getchildwindow ();RETURN iw_object
end function

public function integer of_move (long al_x);Long ll_x, ll_y

ll_x = iw_parentwindow.X + al_x
ll_y = iw_parentwindow.Y + iw_parentwindow.PointerY() + (uo_header.Height / 2) - 40

Move(ll_x, ll_y) 

RETURN 1
end function

public function integer of_setimage (long al_image);IF al_image > 0 THEN
	uo_header.il_image = al_image
	uo_header.is_image = "x"
	uo_header.il_imagepos = uo_header.LEFT
	uo_header.il_imagelist = uo_header.inv_imagelist.of_GetSmallHandle()
	is_image = "set"
	
	CONSTANT Long WM_SETICON = 128
	CONSTANT Long ICON_SMALL = 0
	CONSTANT Long ICON_BIG = 1
	
	hIcon = ImageList_GetIcon( uo_header.inv_imagelist.of_GetSmallHandle(), al_image - 1, 0)
	
	Send(Handle(THIS), WM_SETICON, ICON_SMALL, hIcon);
	Send(Handle(THIS), WM_SETICON, ICON_BIG, hIcon);
END IF

RETURN 1
end function

on w_powerdockfloat.create
int iCurrent
call super::create
this.uo_header=create uo_header
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.uo_header
end on

on w_powerdockfloat.destroy
call super::destroy
destroy(this.uo_header)
end on

event open;call super::open;CONSTANT ULong GWLP_HWNDPARENT = -8
LongPtr ll_null
Environment env

GetEnvironment(env)
SetNull(ll_null)

IF env.ProcessBitness = 32 THEN
	inv_win32.SetWindowLong(Handle(THIS), GWLP_HWNDPARENT, ll_null)
ELSE
	inv_win32.SetWindowLongPtr(Handle(THIS), GWLP_HWNDPARENT, ll_null)
END IF

n_cst_ui_imagelist lnv_globaltheme

uo_header.of_SetTextColor(RGB(255,255,255), uo_header.LEFT)
uo_header.of_SetTheme(lnv_globaltheme.of_GetGlobalTheme())

uo_spa_controls.Hide()
end event

event resize;call super::resize;uo_header.Width = WorkSpaceWidth()

IF IsValid(iuo_object) THEN
	iuo_object.Move(0,uo_header.Height)
	iuo_object.Resize(WorkSpaceWidth(), WorkSpaceHeight() - uo_header.Height)
END IF

IF IsValid(iw_object) THEN
	iw_object.Move(0,uo_header.Height)
	iw_object.Resize(WorkSpaceWidth(), WorkSpaceHeight() - uo_header.Height)
END IF
end event

event closequery;call super::closequery;IF NOT ib_bypasscloseX THEN
	IF IsValid(iuo_object) THEN
		iuo_object.Hide()
		inv_win32.SetParent(Handle(iuo_object), Handle(iw_parentwindow))
		iw_parentwindow.CloseUserObject(iuo_object)
	END IF
	
	IF IsValid(iw_object) THEN
		
		IF iuo_powerdock.iw_parent.WindowType = MDI! OR iuo_powerdock.iw_parent.WindowType = MDIHelp! THEN
			SetRedraw(FALSE)
			inv_win32.SetParent(Handle(iw_object), iuo_powerdock.uo_powerdocktab.il_parent)
		END IF
		
		IF Close(iw_object) <> 1 THEN
			IF iuo_powerdock.iw_parent.WindowType = MDI! OR iuo_powerdock.iw_parent.WindowType = MDIHelp! THEN
				SetRedraw(TRUE)
				inv_win32.SetParent(Handle(iw_object), Handle(THIS))
			END IF
		
			RETURN 1
		END IF
		
		
	END IF
END IF

iuo_powerdock.of_ActivateCurrentDocument()
SetRedraw(TRUE)
RETURN 0
end event

event activate;call super::activate;IF IsValid(iw_object) THEN
	iw_object.TriggerEvent('Activate')
END IF

IF IsValid(iuo_powerdock) THEN
	iuo_powerdock.iw_activefloatwindow = THIS
END IF
end event

event deactivate;call super::deactivate;IF IsValid(iw_object) THEN
	iw_object.TriggerEvent('Deactivate')
END IF
end event

event close;call super::close;IF hIcon > 0 THEN inv_win32.DestroyIcon(hIcon)
end event

type uo_spa_controls from w_pbus_spa_captionless`uo_spa_controls within w_powerdockfloat
end type

type uo_header from u_cst_powerdockpanelheader within w_powerdockfloat
event doubleclicked pbm_lbuttondblclk
integer height = 84
integer taborder = 20
end type

event doubleclicked;IF Len(Trim(is_image)) > 0 THEN
	IF xpos < PixelsToUnits(20, XPixelsToUnits!) THEN
		ib_bypasscloseX = FALSE
	
		IF IsValid(iw_object) THEN
			iuo_powerdock.of_CloseDocument(iw_object)
		ELSE
			IF IsValid(iuo_object) THEN
				iuo_powerdock.of_CloseDocument(iuo_object)
			END IF
		END IF
	END IF
END IF
end event

event mousewithin;IF NOT ib_movingX THEN
	
	il_x = xpos
	il_y = ypos
	
	if NOT of_ismousecaptured() then 
		
		of_capturemouse()
		
		this.event mouseenter()
	else
		
		if xpos < 0 or ypos < 0 or xpos > width or ypos > height then
			ib_movingX = false
			of_releasemouse()
			this.event post mouseleave()
	
		ELSE
			IF of_IsOverPin(il_x, il_y) THEN
				IF NOT ib_overpin THEN
					ib_overpin = TRUE
					SetRedraw(TRUE)
				END IF
			ELSE
				IF ib_overpin THEN
					ib_overpin = FALSE
					SetRedraw(TRUE)
				END IF
			END IF
			
			IF of_IsOverX(il_x, il_y) THEN
				IF NOT ib_overX THEN
					ib_overX = TRUE
					SetRedraw(TRUE)
				END IF
			ELSE
				IF ib_overX THEN
					ib_overX = FALSE
					SetRedraw(TRUE)
				END IF
			END IF
		end if
		
	end if
	
ELSE
	IF il_lastxX = -1 OR il_lastyX = -1 THEN
		il_lastxX = xpos
		il_lastyX = ypos
	END IF
	IF NOT KeyDown(KeyLeftButton!) THEN
		ib_movingX = FALSE
		inv_win32.ReleaseCapture()
		RETURN
	END IF
	
	PARENT.Move(PARENT.X + (xpos - il_lastxX), PARENT.Y + (ypos - il_lastyX))
end if

end event

event lbuttondown;call super::lbuttondown;of_FloatMode()
end event

event lbuttonup;call super::lbuttonup;ib_movingX = FALSE
inv_win32.ReleaseCapture()



IF uo_header.of_IsOverX(xpos, ypos) THEN
	ib_bypasscloseX = FALSE

	IF IsValid(iw_object) THEN
		iuo_powerdock.of_CloseDocument(iw_object)
	ELSE
		IF IsValid(iuo_object) THEN
			iuo_powerdock.of_CloseDocument(iuo_object)
		END IF
	END IF
ELSE

	IF uo_header.of_IsOverPin(xpos, ypos) THEN
		
		ib_bypasscloseX = TRUE
		
		PARENT.Hide()
		
		IF IsValid(iw_object) THEN
			iw_object.Hide()
			inv_win32.SetParent(Handle(iw_object),  iuo_powerdock.uo_powerdocktab.il_parent)
			iuo_powerdock.of_GetDocumentTabControl().of_AttachTab(iw_object)
		END IF
		
		IF IsValid(iuo_object) THEN
			iuo_object.Hide()
			inv_win32.SetParent(Handle(iuo_object), Handle(iw_parentwindow))
			iuo_powerdock.of_GetDocumentTabControl().of_AttachTab(iuo_object)
		END IF
		
		Close(PARENT)
		
	END IF
	
END IF

end event

on uo_header.destroy
call u_cst_powerdockpanelheader::destroy
end on

