$PBExportHeader$w_response_main.srw
forward
global type w_response_main from window
end type
end forward

global type w_response_main from window
integer width = 1065
integer height = 668
boolean titlebar = true
string title = "Untitled"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
end type
global w_response_main w_response_main

type prototypes
Function long GetWindowLong (long hWindow, integer nIndex) Library "user32.dll" ALIAS FOR GetWindowLongA
Function long SetWindowLong (long hWindow, integer nIndex, long dwNewLong) Library "user32.dll" ALIAS FOR SetWindowLongA
FUNCTION ulong GetSystemMenu(ulong hWnd, BOOLEAN bRevert)  Library "USER32"
FUNCTION boolean DeleteMenu( ulong hMenu, uint uPosition, uint uFlags ) LIBRARY "user32.dll"
FUNCTION boolean InsertMenu( ulong HMenu, uint uPosition, uint uFlags, ulong uIDNewItem, string lpNewItem ) LIBRARY "user32.dll" ALIAS FOR "InsertMenuA;Ansi"
FUNCTION boolean DrawMenuBar( ulong hWnd ) LIBRARY "user32.dll"
FUNCTION boolean SetWindowPos ( ulong hWnd, ulong hWinInsertAfter, int newx, int newy, int newwidth, int newheight, long flags ) LIBRARY "user32.dll"

end prototypes

type variables
CONSTANT int 	GWL_STYLE	= -16
CONSTANT int 	SBS_SIZEGRIP	= 16
CONSTANT int	SM_CYHSCROLL	= 3
CONSTANT int 	SM_CXHSCROLL	= 21

CONSTANT ulong WS_SYSMENU 		= 524288
CONSTANT ulong WS_THICKFRAME 		= 262144
CONSTANT ulong WS_MINIMIZEBOX		= 65536
CONSTANT ulong WS_MAXIMIZEBOX		= 131072

CONSTANT uint 	SC_RESTORE      	= 61728
CONSTANT uint 	SC_MAXIMIZE     	= 61488
CONSTANT uint 	SC_MINIMIZE     	= 61472
CONSTANT uint	SC_SIZE			= 61440

CONSTANT uint 	MF_BYCOMMAND 		= 0
CONSTANT uint	MF_STRING		= 0
CONSTANT uint	MF_BYPOSITION		= 1024

CONSTANT uint	SWP_NOSIZE		= 1
CONSTANT uint	SWP_NOMOVE		= 2
CONSTANT uint	SWP_NOZORDER		= 4
CONSTANT uint	SWP_FRAMECHANGED	= 32


Boolean ib_resizeable
Boolean ib_show_szgrip
Long il_orig_width
Long il_orig_height

n_cst_pbus_resize inv_resize
end variables

forward prototypes
public function integer of_setbackcolor (long al_color)
public function integer of_setresize (boolean ab_switch)
public function integer of_setresizable ()
end prototypes

public function integer of_setbackcolor (long al_color);Long ll_index, ll_count

THIS.Backcolor = al_color

ll_count = UpperBound(THIS.Control)

FOR ll_index = 1 TO ll_count
	
	CHOOSE CASE THIS.Control[ll_index].TypeOf()
		CASE DataWindow!
		CASE StaticText!
			StaticText st
			st = THIS.Control[ll_index]
			st.Backcolor = al_color
	END CHOOSE
	
NEXT

RETURN 1
end function

public function integer of_setresize (boolean ab_switch);integer	li_rc

// Check arguments
if IsNull (ab_switch) then
	return -1
end if

if ab_Switch then
	if IsNull(inv_resize) Or not IsValid (inv_resize) then
		inv_resize = create n_cst_pbus_resize
		inv_resize.of_SetOrigSize (this.WorkSpaceWidth(), this.WorkSpaceHeight())
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

public function integer of_setresizable ();ulong 	ll_style, hMenu, hWnd, ll_newstyle

hWnd = Handle( this )

//Turn on the instance variable that is used elsewhere to see if the window is resizeable
ib_resizeable = TRUE

//Get the original size of the window, which we will prevent the user from sizing the window
//less than

//this.width = this.width + 100
//this.height = this.height + 100

il_orig_width = this.width
il_orig_height = this.height

//Get the current window style
ll_style = GetWindowLong(handle(this), GWL_STYLE)

IF this.ControlMenu THEN
	//You have to include the MINIMIZEBOX attribute to get the controls to show

	ll_newstyle = ll_style + WS_THICKFRAME + WS_MINIMIZEBOX
ELSE
	ll_newstyle = ll_style + WS_THICKFRAME
END IF

IF ll_style <> 0 THEN
	IF SetWindowLong ( hWnd, GWL_STYLE, ll_newstyle ) <> 0 THEN
		IF this.ControlMenu THEN
			//Get a handle to the system menu
			hMenu = GetSystemMenu( hWnd, FALSE )
			IF hMenu > 0 THEN
				InsertMenu( hMenu, 1, MF_BYPOSITION +MF_STRING, SC_MAXIMIZE, "Maximize" ) ;
				InsertMenu( hMenu, 1, MF_BYPOSITION +MF_STRING, SC_RESTORE, "Restore" ) ;
				//The Size menu option has to be added to allow the resize gripper towork
				//if there is a control menu
				InsertMenu( hMenu, 1, MF_BYPOSITION +MF_STRING, SC_SIZE, "Size" ) ;
				DrawMenuBar( hWnd )
			END IF
	
		END IF
		//Force a repaint
		SetWindowPos ( hWnd, 0, 0, 0, 0, 0, &
			SWP_NOSIZE + SWP_NOMOVE + SWP_NOZORDER + SWP_FRAMECHANGED )
		this.SetRedraw( TRUE )
	END IF
END IF

Return 1

end function

on w_response_main.create
end on

on w_response_main.destroy
end on

event open;of_SetBackcolor(RGB(240,240,240))
end event

event resize;If IsValid (inv_resize) Then
	inv_resize.Event pfc_Resize (sizetype, This.WorkSpaceWidth(), This.WorkSpaceHeight())
End If
end event

event close;of_SetResize(FALSE)
end event

