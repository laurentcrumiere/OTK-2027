$PBExportHeader$u_cst_icontray.sru
forward
global type u_cst_icontray from u_cst_canvas
end type
type uo_chevron from u_cst_chevron within u_cst_icontray
end type
end forward

global type u_cst_icontray from u_cst_canvas
integer width = 581
integer height = 124
long backcolor = 67108864
string text = "none"
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
event paint pbm_paint
event clicked pbm_lbuttonup
event resize pbm_size
event ue_constructordone ( )
uo_chevron uo_chevron
end type
global u_cst_icontray u_cst_icontray

type variables
Boolean ib_selected
Boolean ib_painting
n_cst_shortcutbar_painter	in_gradient

Long il_BorderColor

u_cst_shortcutbar iuo_parent

u_cst_icon iuo_items[]
u_cst_icon iuo_used[]


Long il_highlight1 = RGB(251,230,148)
Long il_highlight2 = RGB(238,150,21)
Long il_backcolor1 = RGB(203,225,252)
Long il_backcolor2 = RGB(126,166,225)
end variables

forward prototypes
public function integer of_setparent (u_cst_shortcutbar auo_parent)
public function integer of_refresh ()
public function integer of_additem (u_cst_shortcutitem auo_object, long al_index)
public function integer of_removeitem (u_cst_shortcutitem auo_object, long al_index)
public function integer of_setbackcolor (long al_color)
public function window of_getparentwindow ()
end prototypes

event resize;Long ll_index, ll_loop, ll_count
Boolean lb_rtl

IF IsValid(iuo_parent) THEN
	lb_rtl = iuo_parent.ib_rtl
END IF

ll_loop = UpperBound(iuo_used)

IF lb_rtl THEN
	uo_chevron.X = 0
	
	FOR ll_index = ll_loop TO 1 STEP -1
		IF IsValid(iuo_used[ll_index]) THEN
			ll_count++
			iuo_used[ll_index].X = (uo_chevron.X - 18) + (iuo_used[ll_index].Width * ll_count)
		END IF
	NEXT
ELSE
	uo_chevron.X = Width - uo_chevron.Width - 10
	
	FOR ll_index = ll_loop TO 1 STEP -1
		IF IsValid(iuo_used[ll_index]) THEN
			ll_count++
			iuo_used[ll_index].X = uo_chevron.X - (iuo_used[ll_index].Width * ll_count)
		END IF
	NEXT
END IF
end event

public function integer of_setparent (u_cst_shortcutbar auo_parent);iuo_parent = auo_parent

RETURN 1
end function

public function integer of_refresh ();Long ll_index, ll_loop

//ll_loop = UpperBound(iuo_used)
//
//FOR ll_index = 1 TO ll_loop
//	
//	IF IsValid(iuo_used[ll_index]) THEN
//		iuo_used[ll_index].TriggerEvent('paint')
//	END IF
//	
//NEXT
//
//uo_chevron.TriggerEvent('paint')
//
SetRedraw(TRUE)
RETURN 1
end function

public function integer of_additem (u_cst_shortcutitem auo_object, long al_index);
/*********************************************************
 *
 * Object			: u_cst_icontray
 *
 * Method		: of_AddItem
 *
 * Arguments	: auo_object			Shortcut Item
 *					  al_index				Item intex
 *
 * Returns		: SUCCESS
 *
 * Description	: Add a new shortcut item
 *
 * ---------------------------------------------------------------------------------------
 * DATE		NAME		DESCRIPTION
 * ---------------------------------------------------------------------------------------
 *	06/04/16	TBECK	Add header
 *******************************************************/

u_cst_icon l_newicon

of_GetParentWindow().OpenUserObject(l_newicon)
inv_win32.SetParent(Handle(l_newicon), Handle(THIS))
iuo_items[al_index] = l_newicon
iuo_items[al_index].of_SetParent(THIS)
iuo_items[al_index].Y = 8
iuo_used[al_index] = iuo_items[al_index]

iuo_used[al_index].iuo_shortcutitem = auo_object
IF iuo_used[al_index].is_image = '' THEN
	// Modified to call the getsmallimage instead if getimage
	iuo_used[al_index].of_SetImage(auo_object.of_GetSmallImage())
END IF

iuo_used[al_index].Show()

TriggerEvent('resize')

RETURN 1
end function

public function integer of_removeitem (u_cst_shortcutitem auo_object, long al_index);u_cst_icon luo_empty

iuo_items[al_index].Hide()
iuo_used[al_index] = luo_empty

TriggerEvent('resize')

RETURN 1
end function

public function integer of_setbackcolor (long al_color);Long ll_index, ll_loop

ll_loop = UpperBound(iuo_items)

FOR ll_index = 1 TO ll_loop
	IF IsValid(iuo_items[ll_index]) THEN
		iuo_items[ll_index].BackColor =al_color
	END IF
NEXT

uo_chevron.BackColor =al_color

RETURN 1
end function

public function window of_getparentwindow ();PowerObject lpo

lpo = THIS.GetParent()

DO UNTIL lpo.TypeOf() = Window!
	lpo = lpo.GetParent()
LOOP

RETURN lpo
end function

on u_cst_icontray.create
int iCurrent
call super::create
this.uo_chevron=create uo_chevron
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.uo_chevron
end on

on u_cst_icontray.destroy
call super::destroy
destroy(this.uo_chevron)
end on

event constructor;call super::constructor;Long ll_index

trigger event ue_constructordone()
end event

event onpaint;call super::onpaint;IF IsValid(iuo_parent) THEN
	in_Gradient.of_SetHDC(hdc)
	in_Gradient.of_VerticalGradient (iuo_parent.of_GetColor("BACKGROUND1"), iuo_parent.of_GetColor("BACKGROUND2"), THIS,TRUE,iuo_parent.of_GetColor("BORDER"), iuo_parent.of_GetStyle())
END IF

RETURN 1
end event

event destructor;call super::destructor;Window l_parent
Long ll_index, ll_count

ll_count = UpperBound(iuo_items)
l_parent = of_GetParentWindow()

IF IsValid(l_parent) THEN
	FOR ll_index = 1 TO ll_count
		inv_win32.SetParent(Handle(iuo_items[ll_index]), Handle(l_parent))
		l_parent.CloseUserObject(iuo_items[ll_index])
	NEXT
END IF
end event

type uo_chevron from u_cst_chevron within u_cst_icontray
integer x = 507
integer y = 8
integer width = 78
integer height = 108
integer taborder = 20
end type

on uo_chevron.destroy
call u_cst_chevron::destroy
end on

event constructor;call super::constructor;of_SetParent(PARENT)
end event

