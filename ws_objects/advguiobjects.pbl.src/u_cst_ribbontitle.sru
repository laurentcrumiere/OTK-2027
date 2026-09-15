$PBExportHeader$u_cst_ribbontitle.sru
forward
global type u_cst_ribbontitle from u_cst_toolbarstrip
end type
end forward

global type u_cst_ribbontitle from u_cst_toolbarstrip
end type
global u_cst_ribbontitle u_cst_ribbontitle

forward prototypes
public function integer of_updatepointsquickaccess ()
end prototypes

public function integer of_updatepointsquickaccess ();Long ll_index, ll_count, ll_x, ll_y, ll_textheight, ll_textwidth, ll_item, ll_childIndex
Long ll_width, ll_height, ll_controlWidth, ll_chevronwidth
LongPtr ll_dc
boolean lb_SomeHidden = FALSE
point lp_empty[]
n_cst_toolbarstrip_painter ln_gradient
Point p

ll_count = UpperBound(ToolbarItemsLeft)

ll_y = ScaleX(2)
ll_x = ScaleY(28)

ll_height = ScaleY(il_CurrentSize + 4)
ll_width = ScaleX(il_CurrentSize + 4)
ll_controlWidth = UnitsToPixels(Width, XUnitsToPixels!)

ll_dc = inv_win32.GetDC(Handle(st_pbus_toolbar))
ln_gradient.of_SetHDC(ll_dc)

uo_toolbarchevron.of_ClearItems()

FOR ll_index = 1 TO ll_count
	IF ToolbarItemsLeft[ll_index].Position = RIGHT THEN
		CONTINUE
	END IF
	
	ll_item++
		
	ll_childIndex = ll_index
	ll_chevronwidth = 0
		
	ToolbarItemsLeft[ll_index].PaintRegion = lp_empty
	
	ToolbarItemsLeft[ll_index].BackColor1 = -1
	ToolbarItemsLeft[ll_index].BackColor2 = -1
	
	IF ll_index = il_index THEN
		IF ib_mousedown AND NOT ib_mouseleave AND il_MOIndex = ll_index THEN
			ToolbarItemsLeft[ll_index].BackColor1 = of_GetColor('SELECTED1')
			ToolbarItemsLeft[ll_index].BackColor2 = of_GetColor('SELECTED2')
			ToolbarItemsLeft[ll_index].BorderColor = of_GetColor("ITEMBORDER")
		ELSE
			ToolbarItemsLeft[ll_index].BackColor1 = of_GetColor("HOVER1")
			ToolbarItemsLeft[ll_index].BackColor2 = of_GetColor("HOVER2")
			ToolbarItemsLeft[ll_index].BorderColor = of_GetColor("ITEMBORDER")
		END IF
	END IF
	
	IF ToolbarItemsLeft[ll_childIndex].Toggle THEN
		ToolbarItemsLeft[ll_index].BackColor1 = of_GetColor("HOVER1")
		ToolbarItemsLeft[ll_index].BackColor2 = of_GetColor("HOVER2")
		ToolbarItemsLeft[ll_index].BorderColor = of_GetColor("ITEMBORDER")				
	ELSE
		
	END IF
		
	IF ToolbarItemsLeft[ll_index].Separator THEN
		ToolbarItemsLeft[ll_index].SeparatorColor = of_GetColor('SEPARATOR')
		
		ToolbarItemsLeft[ll_index].PaintRegion[1].px = ll_x
		ToolbarItemsLeft[ll_index].PaintRegion[1].py = ll_y + ScaleY(3)
		ToolbarItemsLeft[ll_index].PaintRegion[2].px = ll_x
		ToolbarItemsLeft[ll_index].PaintRegion[2].py = ll_height - ll_y - ScaleY(1)
		
		ToolbarItemsLeft[ll_index].Hidden = FALSE
		
		ll_x = ll_x + ScaleX(5)
	ELSE 
		ll_textwidth = 0
		ToolbarItemsLeft[ll_index].ImageSize = il_CurrentSize
		
		ToolbarItemsLeft[ll_index].TextWidth = ll_textwidth
	
		ToolbarItemsLeft[ll_index].PaintRegion[1].px = ll_x
		ToolbarItemsLeft[ll_index].PaintRegion[1].py = ll_y
		ToolbarItemsLeft[ll_index].PaintRegion[2].px = ll_width + ll_x
		ToolbarItemsLeft[ll_index].PaintRegion[2].py = ll_y
		ToolbarItemsLeft[ll_index].PaintRegion[3].px = ll_width + ll_x
		ToolbarItemsLeft[ll_index].PaintRegion[3].py = ll_height - ll_y + ScaleY(2)
		ToolbarItemsLeft[ll_index].PaintRegion[4].px = ll_x
		ToolbarItemsLeft[ll_index].PaintRegion[4].py = ll_height - ll_y + ScaleY(2)
		
		ll_x = ll_x + ll_width + ScaleX(2)
	END IF

NEXT

inv_win32.ReleaseDC (Handle(st_pbus_toolbar), ll_dc)

RETURN 1
end function

on u_cst_ribbontitle.create
call super::create
end on

on u_cst_ribbontitle.destroy
call super::destroy
end on

type uo_toolbarchevron from u_cst_toolbarstrip`uo_toolbarchevron within u_cst_ribbontitle
end type

type st_pbus_toolbar from u_cst_toolbarstrip`st_pbus_toolbar within u_cst_ribbontitle
end type

