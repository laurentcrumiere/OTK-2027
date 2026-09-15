$PBExportHeader$u_cst_ribbonpanel.sru
forward
global type u_cst_ribbonpanel from u_cst_canvas
end type
type st_pbus_tooltip_font from statictext within u_cst_ribbonpanel
end type
end forward

global type u_cst_ribbonpanel from u_cst_canvas
boolean visible = false
integer width = 626
integer height = 308
event lbuttonup pbm_lbuttonup
event mouseenter ( )
event mousemove pbm_mousemove
event lbuttondown pbm_lbuttondown
event resize pbm_size
event ue_righttoleft ( )
event ue_lefttoright ( )
event wm_notify pbm_notify
event ue_timer ( )
st_pbus_tooltip_font st_pbus_tooltip_font
end type
global u_cst_ribbonpanel u_cst_ribbonpanel

type prototypes
Subroutine CopyNMHDR ( &
	Ref NMHDR Destination, &
	LongPtr Source, &
	long Length &
	) Library  "kernel32.dll" Alias For "RtlMoveMemory"

Subroutine CopyNMTTCUSTOMDRAW ( &
	Ref NMCUSTOMDRAWINFO Destination, &
	LongPtr Source, &
	long Length &
	) Library  "kernel32.dll" Alias For "RtlMoveMemory"
	
	
FUNCTION Long ClientToScreen(LongPTR hWnd,ref POINT lpPoint) LIBRARY "User32"

FUNCTION LongPTR GetFocusWin() LIBRARY "User32" Alias For "GetFocus"
FUNCTION LongPTR SetFocusWin(LongPTR hWnd) LIBRARY "User32" Alias For "SetFocus"
end prototypes

type variables
n_cst_ui_imagelist inv_imagelist

CONSTANT Long BLUE = RGB(203,220,249)
CONSTANT Long SILVER = RGB(232,232,240)
CONSTANT Long OLIVE = RGB(234,234,207)
CONSTANT Long CLASSIC = RGB(242,243,246)
CONSTANT Long DEFAULT = 0

String is_CurrentTheme = "BLUE"
n_cst_pbui_theme inv_color_theme

Integer ToolTipWidth = 215

boolean ib_statuspushed
Long il_selected
Long il_index
Long il_pressedIndex
Boolean ib_windows8
Boolean ib_dirty
Boolean ib_MouseDown
Boolean ib_mouseleave
Boolean ib_leftscrollvisible
Boolean ib_rightscrollvisible
Boolean ib_rtl
long il_ID
Long ll_oldWidth
Long ll_newWidth
n_cst_ribbon_tooltip inv_tooltip
ribbonitem items[]

CONSTANT Long SMALL = 0
CONSTANT Long LARGE = 1
CONSTANT Long SMALLCOLLECTION = 2
CONSTANT Long LARGECOLLECTION = 3

Long il_currenttheme
Long il_imagecount
LongPtr il_imagelistsmall
LongPtr il_imagelistlarge

n_cst_ribbongroup groups[]

window iw_parent
u_cst_ribboncontainer iuo_container

n_hashtable groupcollection
n_cst_ribbongroup_painter in_gradient

Long il_grouptextcolor = RGB(30,57,91)
Long il_itemtextcolor = RGB(30,57,91)
String is_groupfont = 'Segoe UI'
String is_itemfont = 'Segoe UI'
String is_alttag

Long il_fontsize = 10

CONSTANT Long ILD_TRANSPARENT = 1
CONSTANT Long LVM_GETIMAGELIST = 4098
CONSTANT Long LVSIL_NORMAL = 0

Boolean ib_ttmode
Long il_ttindex
n_cst_ribbon_timer inv_timer

LongPtr focusobject
end variables

forward prototypes
public function integer of_loadfrommenu (menu a_menu)
private function integer of_getgroups (menu a_menu, ref string a_groups[])
public function integer of_setparentwindow (window aw_parent)
public function integer of_groupsizechanged ()
public function integer of_addimage (string as_image)
public function long of_indexfrompoint (long xpos, long ypos)
public function integer of_mouseover (long al_index)
private function string of_gettiptext (menu a_menu)
private function string of_removeampersand (string as_text)
public function boolean of_isoverleftscroll (long xpos)
public function boolean of_isoverrightscroll (long xpos)
public function integer of_scrollright ()
public function integer of_scroll (long a_change)
public function integer of_addscrollbars ()
public function integer of_setcontainer (u_cst_ribboncontainer auo_container)
private function string of_getgroupname (menu a_menu, string as_parentname)
public function integer of_setgroupfont (string as_font)
public function integer of_setgrouptextcolor (long al_color)
public function integer of_setitemfont (string as_font)
public function integer of_setitemtextcolor (long al_color)
public function long of_settheme (string as_theme)
public function long of_getcolor (string as_color)
public function integer of_righttoleft (boolean ab_switch)
public function menu of_getalttagmenu (string as_tag)
public function string of_getalttag (string as_text)
public function ribbonitem of_getalttagitem (string as_tag)
public function integer of_setfontsize (integer al_size)
private function point of_gettooltippoint (integer al_index)
public function integer of_drawroundcontainer (longptr hdc)
end prototypes

event lbuttonup;Long ll_index, ll_x, ll_y
Long ll_count, ll_scroll

ll_count = UpperBound(groups)

 inv_tooltip.of_Settrack(This, il_Id,FALSE)


IF of_IsOverLeftScroll(xpos) THEN
	IF NOT iuo_container.of_GetParent().SmoothScroll THEN
		IF ib_rtl THEN
			ll_scroll = Width - 80
			
			IF Abs(groups[ll_count].X)  < ll_scroll THEN ll_scroll = Abs(groups[ll_count].X)
			
			of_Scroll(ll_scroll)
		ELSE
			ll_scroll = Width - 80
			
			IF Abs(groups[1].X) < ll_scroll THEN ll_scroll = Abs(groups[1].X)
			
			of_Scroll(ll_scroll)
		END IF
	END IF
	RETURN
END IF

IF of_IsOverRightScroll(xpos) THEN
	IF NOT iuo_container.of_GetParent().SmoothScroll THEN
		IF ib_rtl THEN
			ll_scroll = Width - 80
			
			IF Width > (groups[1].X + groups[1].Width - Width) THEN ll_scroll =  (groups[1].X + groups[1].Width) - Width  + 10
			
			of_Scroll(ll_scroll * -1)
		ELSE
			ll_scroll = Width - 80
			
			IF Width > (groups[ll_count].X + groups[ll_count].Width - Width) THEN ll_scroll =  (groups[ll_count].X + groups[ll_count].Width) - (Width) + 10
			
			of_Scroll(ll_scroll * -1)
	
		END IF
	END IF
	RETURN
END IF

ll_index = of_IndexFromPoint(xpos, ypos)

IF ll_index > 0 AND ll_index = il_pressedIndex THEN
	IF items[ll_index].a_menu.Enabled THEN
		CHOOSE CASE items[ll_index].ai_type
			CASE SMALL, LARGE
				items[ll_index].a_menu.PostEvent("Clicked")
			CASE LARGECOLLECTION, SMALLCOLLECTION
				ll_x = PixelsToUnits(items[ll_index].ast_point[1].px, XPixelsToUnits!) + iuo_container.X
				ll_y = PixelsToUnits(items[ll_index].ast_point[3].py, YPixelsToUnits!) + THIS.Y + iuo_container.of_GetY()
				items[ll_index].a_menu.TriggerEvent("Clicked")
				items[ll_index].a_menu.PopMenu ( ll_x, ll_y )
				
		END CHOOSE
	END IF
	
	IF IsValid(THIS) THEN
		IF ll_index <= UpperBound(items) THEN
			IF IsValid(items[ll_index]) THEN
				items[ll_index].ab_selected = FALSE
			END IF
		END IF
	END IF
END IF

IF IsValid(THIS) THEN
	SetRedraw(TRUE)
	
	IF iuo_container.ib_expanded AND NOT iuo_container.ib_docked  THEN
		iuo_container.of_UnDock()
	END IF
END IF
end event

event mouseenter();SetRedraw(TRUE)
end event

event mousemove;String ls_tiptext
Long ll_index
Boolean lb_tooltipenabled

focusobject = GetFocusWin()

if NOT of_ismousecaptured() then 
	
	IF iuo_container.of_GetParent().of_RibbonMenu().Visible THEN
		inv_tooltip.of_UpdatetipRect( This, il_ID, &
													0, 0, &
													0, &
													0 )
		RETURN 0
	END IF
	
	of_capturemouse()
	
	this.event mouseenter()
		
else
	IF of_IsOverLeftScroll(xpos) THEN
		IF iuo_container.of_GetParent().SmoothScroll THEN
			IF ib_rtl THEN
				of_Scroll(-8)
			ELSE
				of_Scroll(8)
			END IF
		END IF
		RETURN
	END IF
	
	IF of_IsOverRightScroll(xpos) THEN
		IF iuo_container.of_GetParent().SmoothScroll THEN
			IF ib_rtl THEN
				of_Scroll(8)
			ELSE
				of_Scroll(-8)
			END IF
		END IF
		RETURN
	END IF
	
	ll_index = of_IndexFromPoint(xpos, ypos)
	IF il_index <> ll_index THEN
		
		IF ib_statuspushed THEN
			iuo_container.iw_parent.of_StatusPop()
			ib_statuspushed = FALSE
		END IF
		
		IF ll_index > 0 THEN
			IF Len(Trim(items[ll_index].a_menu.MicroHelp)) > 0 THEN
				iuo_container.iw_parent.of_StatusPush(Trim(items[ll_index].a_menu.MicroHelp))
				ib_statuspushed = TRUE
			END IF
		ELSE
			IF ib_statuspushed THEN
				iuo_container.iw_parent.of_StatusPop()
				ib_statuspushed = FALSE
			END IF
		END IF
		
		of_MouseOver(ll_index)
		
		lb_tooltipenabled = TRUE
		
		IF IsValid(iuo_container) THEN
			IF IsValid(iuo_container.iw_parent) THEN
				IF iuo_container.iw_parent.DisableRibbonTooltip THEN
					lb_tooltipenabled = FALSE
				END IF
			END IF
		END IF
		
		IF  lb_tooltipenabled AND ll_index > 0 THEN
			Long li_X, li_Y, ll_return
			
			
			IF il_Id > 0 THEN
				li_X = 0
				li_Y = 0
				
				inv_tooltip.of_UpdatetipRect( This, il_ID, &
												li_x, li_y, &
												li_x + UnitsToPixels( Integer( Width ), XUnitsToPixels! ), &
												li_y + UnitsToPixels( Integer( Height ), YUnitsToPixels! ) )
				
				IF NOT ib_ttmode THEN
					il_ttindex = ll_index
					inv_timer.Stop()
					inv_timer.Start(1)
				ELSE
					Point lp
					lp = of_gettooltippoint(ll_index)
					inv_tooltip.of_settipposition(lp.px,lp.py)
					inv_tooltip.Of_SetTipText( This, il_Id, " ")
					inv_tooltip.of_Settrack(This, il_Id,TRUE)
				END IF
				
			END IF
		ELSE
			inv_tooltip.of_UpdatetipRect( This, il_ID, &
												0, 0, &
												0, &
												0 )
			 inv_tooltip.of_Settrack(This, il_Id,FALSE)
			 
			 inv_timer.Stop()
		END IF
		
	END IF


end if
end event

event lbuttondown;Long ll_index

ll_index = of_IndexFromPoint(xpos, ypos)

il_pressedIndex = ll_index

IF ll_index > 0 THEN
	il_index = ll_index
	items[il_index].ab_selected = TRUE
	
	SetRedraw(TRUE)
END IF

 inv_tooltip.of_Settrack(This, il_Id,FALSE)
 inv_timer.Stop()
 
// IF focusobject > 0 THEN
//	SetFocusWin(focusobject)
//END IF
end event

event resize;of_AddScrollbars()

IF NOT ib_leftscrollvisible AND ib_rightscrollvisible THEN
	IF NewWidth > ll_oldWidth THEN
		of_Scroll(NewWidth - ll_oldWidth)
	END IF
END IF

IF ib_rtl THEN
	IF NewWidth > 0 THEN
		ll_newWidth = NewWidth
	ELSE
		ll_newWidth = Width
	END IF
	of_RightToLeft(ib_rtl)
END IF

ll_oldWidth = Width

SetRedraw(TRUE)
end event

event ue_righttoleft();of_RightToLeft(TRUE)
end event

event ue_lefttoright();of_RightToLeft(FALSE)
end event

event wm_notify;NMHDR l_NMHDR
NMCUSTOMDRAWINFO l_NMTTCUSTOMDRAW
CONSTANT long NM_FIRST = 0
CONSTANT long NM_CUSTOMDRAW           = (NM_FIRST -12)
CONSTANT Long TTN_FIRST = -520
CONSTANT Long TTN_SHOW = (TTN_FIRST -1) 
CONSTANT long CDDS_PREPAINT = 1
CONSTANT long CDDS_POSTPAINT = 2
CONSTANT long CDDS_PREERASE = 3
CONSTANT long CDDS_POSTERASE = 4
CONSTANT long CDRF_DODEFAULT = 0
CONSTANT long CDRF_NEWFONT = 2
CONSTANT long CDRF_SKIPDEFAULT = 4
CONSTANT long CDRF_DOERASE = 8 // draw the background
CONSTANT long CDRF_SKIPPOSTPAINT = 256 // don't draw the focus rect
CONSTANT long CDRF_NOTIFYPOSTPAINT  = 16
CONSTANT Long TTM_GETTEXTW =  (1024 +56)
CONSTANT Long TTM_ADJUSTRECT = (1024 + 31)

string ls_tip
Long ll_null
Rect rc
n_uspb_text_helper lnv_texthelper
Integer li_newHeight, li_newWidth
n_cst_pbus_string ln_string
Environment env

IF il_index <= 0 THEN RETURN

GetEnvironment(env)

IF env.ProcessBitness = 64 THEN
	CopyNMHDR (Ref l_NMHDR , lparam, 20)
ELSE
	CopyNMHDR (Ref l_NMHDR , lparam, 12)
END IF

IF l_NMHDR.hwndFrom = inv_tooltip.hWndTT THEN
	CHOOSE CASE  l_NMHDR.code
		CASE TTN_SHOW
			SetNull(ll_null)
			ULong ll_dc
			
			ls_tip = of_GetTipText(items[il_index].a_menu)
			
			inv_win32.GetWindowRect(inv_tooltip.hWndTT, rc)
			ll_dc = inv_win32.GetDC(Handle(st_pbus_tooltip_font))
			lnv_texthelper.of_SetHDC(ll_dc)
			
			li_newHeight = lnv_texthelper.of_gettextheight (ll_dc, ls_tip, is_itemfont, il_fontsize, lnv_texthelper.ALIGN_LEFT, ScaleDPI(ToolTipWidth - 16), FALSE, FALSE, TRUE)
			
			inv_win32.ReleaseDC(Handle(st_pbus_tooltip_font), ll_dc)
			
			rc.Right = rc.Left + ScaleDPI(ToolTipWidth)
			rc.Bottom = rc.Top + li_newHeight + ScaleDPI(8)
			
			inv_win32.SendMessageRect(inv_tooltip.hWndTT, TTM_ADJUSTRECT, 1, rc)
			inv_win32.SetWindowPos(inv_tooltip.hWndTT, Handle(iuo_container.iw_parent), rc.left, rc.top, rc.right - rc.left, rc.bottom - rc.top, 16)
			
		CASE NM_CUSTOMDRAW
			
			IF env.ProcessBitness = 64 THEN
				CopyNMTTCUSTOMDRAW (Ref l_NMTTCUSTOMDRAW , lparam, 64)
			ELSE
				CopyNMTTCUSTOMDRAW (Ref l_NMTTCUSTOMDRAW , lparam, 48)
			END IF
			
			CHOOSE CASE l_NMTTCUSTOMDRAW.dwDrawStage
				CASE CDDS_PREPAINT
						Constant long TTM_GETTIPBKCOLOR	= 1046
						ULong clrBg
						
						clrBg = Send(inv_tooltip.hWndTT, TTM_GETTIPBKCOLOR, 0, 0)
						inv_win32.SetTextColor(l_NMTTCUSTOMDRAW.hdc, clrBg)
						inv_win32.SetBkColor(l_NMTTCUSTOMDRAW.hdc, clrBg)
						return CDRF_NOTIFYPOSTPAINT
				CASE CDDS_POSTPAINT
						String ls_parts[]
						n_cst_buttonlistbar_painter ln_gradient
						
						ln_gradient.of_SetDeviceContext(THIS)
						
						ls_tip = of_GetTipText(items[il_index].a_menu)
						
						ln_string.of_ParseToArray(ls_tip, "~r~n", ls_parts)
						
						inv_win32.GetWindowRect(inv_tooltip.hWndTT, rc)
						
						IF UpperBound(ls_parts) > 0 THEN
							ln_gradient.of_DrawText(l_NMTTCUSTOMDRAW.hdc, &
								ls_parts[1], &
								0, &
								is_itemfont, &
								il_fontsize, TRUE, ln_gradient.ALIGN_LEFT, &
								8, &
								4, &
								ScaleDPI(ToolTipWidth - 8), &
								rc.bottom - rc.top, &
								FALSE, FALSE, FALSE, TRUE)
						END IF
				
						IF UpperBound(ls_parts) > 2 THEN
							
							ll_dc = inv_win32.GetDC(Handle(st_pbus_tooltip_font))
							lnv_texthelper.of_SetHDC(ll_dc)
							li_newHeight = lnv_texthelper.of_gettextheight (ll_dc, ls_parts[1], is_itemfont, il_fontsize, lnv_texthelper.ALIGN_LEFT, ScaleDPI(ToolTipWidth - 16), FALSE, FALSE, TRUE)
							inv_win32.ReleaseDC(Handle(st_pbus_tooltip_font), ll_dc)
							
							ls_tip = "~r~n" + ls_parts[3]
							ln_gradient.of_DrawText(l_NMTTCUSTOMDRAW.hdc, &
								ls_tip, &
								0, &
								is_itemfont, &
								il_fontsize, FALSE, ln_gradient.ALIGN_LEFT, &
								8, &
								4 + li_newHeight, &								
								ScaleDPI(ToolTipWidth - 8), &
								rc.bottom - rc.top, &
								FALSE, FALSE, FALSE, TRUE)
						END IF
						
						RETURN  CDRF_SKIPDEFAULT

		END CHOOSE
		
		RETURN CDRF_DODEFAULT
	END CHOOSE
END IF

RETURN 0
end event

event ue_timer();Point lp
								
IF NOT ib_ttmode THEN
	IF il_ttindex = il_index THEN
		lp = of_gettooltippoint(il_ttindex)
		inv_tooltip.of_settipposition(lp.px,lp.py)
		inv_tooltip.Of_SetTipText( This, il_Id, " ")
		inv_tooltip.of_Settrack(This, il_Id,TRUE)
		ib_ttmode = TRUE
		inv_timer.Stop()
		inv_timer.Start(2)
	END IF
	
ELSEIF il_index = 0 OR il_index = -1 THEN
	ib_ttmode = FALSE
	inv_timer.Stop()
END IF



end event

public function integer of_loadfrommenu (menu a_menu);string ls_groups[]
Long ll_index, ll_count, ll_x, ll_type
n_cst_ribbongroup l_group
ribbonitem empty[]

is_alttag = of_GetAltTag(a_menu.Text)
THIS.Tag = a_menu.ClassName()

ll_count = of_GetGroups(a_menu, ls_groups)
IF ib_rtl THEN
	ll_x = Width - 410
ELSE
	ll_x = 10
END IF
FOR ll_index = 1 TO ll_count
	groups[UpperBound(groups) + 1] = CREATE n_cst_ribbongroup
	
	IF ll_index > 1 THEN
		IF ib_rtl THEN
			ll_x = groups[UpperBound(groups) - 1].X - 410
		ELSE
			ll_x = groups[UpperBound(groups) - 1].X + groups[UpperBound(groups) - 1].Width + 10
		END IF
	END IF
	
	groups[UpperBound(groups)].of_FontColor(il_grouptextcolor)
	groups[UpperBound(groups)].of_FontName(is_groupfont)
	groups[UpperBound(groups)].of_SetTheme(il_currenttheme)
	groups[UpperBound(groups)].X = ll_x
	groups[UpperBound(groups)].Y = 0
	groups[UpperBound(groups)].Height = THIS.Height - 5
	groups[UpperBound(groups)].Width = 400
	groups[UpperBound(groups)].iuo_parent = THIS
	groups[UpperBound(groups)].#FontSize = il_fontsize
	
	IF ib_rtl THEN
		groups[UpperBound(groups)].of_RightToLeft(ib_rtl)
	END IF
	groups[UpperBound(groups)].of_Text(ls_groups[ll_index])
	
	groupcollection.Put(ls_groups[ll_index], groups[UpperBound(groups)])
NEXT

FOR ll_index = 1 TO UpperBound(a_menu.item)
	IF a_menu.item[ll_index].Text = "-" THEN CONTINUE
	IF a_menu.item[ll_index].Visible = FALSE THEN CONTINUE
	
	l_group = groupcollection.Get(of_GetGroupName(a_menu.item[ll_index], a_menu.Text))
	
	IF UpperBound(a_menu.item[ll_index].Item) > 0 THEN
		IF Pos(Lower(a_menu.item[ll_index].Tag), "size:large", 1) > 0 THEN
			ll_type = l_group.LARGECOLLECTION
		ELSE
			ll_type = l_group.SMALLCOLLECTION
		END IF
	ELSEIF Pos(Lower(a_menu.item[ll_index].Tag), "size:large", 1) > 0 THEN
		ll_type = l_group.LARGE
	ELSE
		ll_type = l_group.SMALL
	END IF
	
	l_group.of_AddItem(ll_type, a_menu.item[ll_index], is_itemfont, il_itemtextcolor)

NEXT

items = empty

FOR ll_index = 1 TO UpperBound(ls_groups)
	l_group = groupcollection.Get(ls_groups[ll_index])
	l_group.Width = l_group.of_CalculateWidth()
	of_GroupSizeChanged()
	l_group.of_UpdatePoints()
	l_group.of_CopyItems(items)
NEXT

RETURN 1
end function

private function integer of_getgroups (menu a_menu, ref string a_groups[]);Long ll_index, ll_pos, ll_pos2
Long ll_index2
Boolean lb_addblank, lb_found
String ls_name

IF NOT IsValid(a_menu) THEN RETURN 0

FOR ll_index = 1 TO UpperBound(a_menu.item)
	IF a_menu.item[ll_index].Text = "-" THEN CONTINUE
	IF a_menu.item[ll_index].Visible = FALSE THEN CONTINUE
	
	ls_name = of_GetGroupName(a_menu.item[ll_index], a_menu.Text)
	
	IF Len(Trim(ls_name)) > 0 THEN
		
		lb_found = FALSE
		
		FOR ll_index2 = 1 TO UpperBound(a_groups)
			IF Lower(a_groups[ll_index2]) = Lower(ls_name) THEN 
				lb_found = TRUE
				EXIT
			END IF
		NEXT
		
		IF NOT lb_found THEN a_groups[UpperBound(a_groups) + 1] = ls_name
		
	ELSE
		lb_addblank = TRUE
	END IF
NEXT

IF lb_addblank THEN a_groups[UpperBound(a_groups) + 1] = " "

RETURN UpperBound(a_groups)
end function

public function integer of_setparentwindow (window aw_parent);iw_parent = aw_parent

inv_ToolTip.of_Create(Handle(iw_parent))
il_ID = inv_ToolTip.of_AddTool( THIS, "" , inv_ToolTip.TTF_SUBCLASS ) 
inv_tooltip.of_Settrack(This, il_Id,FALSE)
 
RETURN 1
end function

public function integer of_groupsizechanged ();Long ll_index, ll_count
Long ll_x

ll_count = UpperBound(groups)

IF ib_RTL THEN
	IF ll_count > 0 THEN
		IF ll_newWidth > 0 THEN
			ll_x = ll_newWidth
		ELSE
			ll_x = Width
		END IF

		FOR ll_index = 1 TO ll_count
			groups[ll_index].X = ll_x - groups[ll_index].Width
			ll_x = groups[ll_index].X - 10
		NEXT
		
		of_AddScrollbars()
		
	END IF
	
ELSE

	IF ll_count > 0 THEN
		ll_x = groups[1].X
		
		FOR ll_index = 1 TO ll_count
			groups[ll_index].X = ll_x
			ll_x = groups[ll_index].X + 10 + groups[ll_index].Width
		NEXT
		
		of_AddScrollbars()
		
	END IF

END IF



RETURN 1
end function

public function integer of_addimage (string as_image);IF Len(Trim(as_image)) > 0 THEN
	il_imagecount = il_imagecount + 1
	
	Long ll_index
	
	ll_index = inv_imagelist.of_AddImage(as_image)

	il_imagelistsmall = inv_imagelist.of_GetSmallHandle()
	il_imagelistlarge = inv_imagelist.of_GetLargeHandle()

	RETURN ll_index
	
END IF

RETURN 0
end function

public function long of_indexfrompoint (long xpos, long ypos);//find out if a tab was clicked
long ll_count, ll_index
ulong lul_rgn
integer lix, liy

IF of_IsOverLeftScroll(xpos) OR of_IsOverRightScroll(xpos) THEN
	RETURN -1
END IF

lix = UnitsToPixels(xpos, XUnitsToPixels!)
liy = UnitsToPixels(ypos, YUnitsToPixels!)

ll_count = UPPERBOUND(items)
FOR ll_index = 1 to ll_count
	//skip if disabled
	IF NOT items[ll_index].a_menu.Enabled THEN CONTINUE
	
	//Don't bother testing any items that are wel before the mouse x position
	IF items[ll_index].ast_point[UpperBound(items[ll_index].ast_point) - 1].px < lix THEN CONTINUE
	
	lul_rgn = inv_win32.CreatePolygonRgn(items[ll_index].ast_point, UPPERBOUND(items[ll_index].ast_point), 1)
	IF inv_win32.PtInRegion(lul_rgn, lix, liy) <> 0 THEN
		inv_win32.DeleteObject(lul_rgn)
		RETURN ll_index
	ELSE
		inv_win32.DeleteObject(lul_rgn)
	END IF
NEXT

RETURN -1
end function

public function integer of_mouseover (long al_index);IF il_index > 0 THEN
	items[il_index].ab_mouseover = FALSE
	items[il_index].ab_selected = FALSE
END IF

IF al_index > 0 THEN
	IF KeyDown(KeyLeftButton!) THEN
		IF al_index = il_pressedIndex THEN
			items[al_index].ab_mouseover = TRUE
			items[al_index].ab_selected = TRUE
		ELSE
			items[al_index].ab_mouseover = FALSE
			items[al_index].ab_selected = FALSE
		END IF
	ELSE
		IF il_selected = al_index THEN
			items[al_index].ab_mouseover = TRUE
			items[al_index].ab_selected = TRUE
		ELSE
			items[al_index].ab_mouseover = TRUE
			items[al_index].ab_selected = FALSE
		END IF
	END IF
	
	//Trigger menu selected event
	IF items[al_index].a_menu.Enabled THEN
		items[al_index].a_menu.PostEvent("Selected")
	END IF
	
END IF

il_index = al_index

ib_dirty = FALSE
SetRedraw(TRUE)

RETURN 1
end function

private function string of_gettiptext (menu a_menu);String ls_tiptext
Long ll_pos

ls_tiptext = of_RemoveAmpersand(a_menu.Text)
					
ll_pos = Pos(ls_tiptext, "~t", 1)

IF ll_pos > 0 THEN
	ls_tiptext = Replace(ls_tiptext, ll_pos, 1, "  (") + ")"
END IF
					
IF Len(Trim(a_menu.MicroHelp)) > 0 THEN
	ls_tiptext = ls_tiptext + "~r~n~r~n" + a_menu.MicroHelp
END IF

RETURN ls_tiptext
end function

private function string of_removeampersand (string as_text);Long ll_pos 

ll_pos = Pos(as_text, "&", 1)

IF ll_pos > 0 THEN
	RETURN Replace(as_text, ll_pos, 1, "")
ELSE
	RETURN as_text
END IF
end function

public function boolean of_isoverleftscroll (long xpos);IF ib_leftscrollvisible THEN
	IF xpos <= 40 THEN
		RETURN TRUE
	END IF
END IF

RETURN FALSE
end function

public function boolean of_isoverrightscroll (long xpos);IF ib_rightscrollvisible THEN
	IF Width - xpos <= 40 THEN
		RETURN TRUE
	END IF
END IF

RETURN FALSE
end function

public function integer of_scrollright ();RETURN 1
end function

public function integer of_scroll (long a_change);Long ll_index, ll_count
ribbonitem empty[]

ll_count = UpperBound(groups)

IF ib_rtl THEN
	IF ll_count > 0 THEN
		SetRedraw(FALSE)
		
		
		items = empty
	
		FOR ll_index = 1 TO ll_count
			groups[ll_index].X = groups[ll_index].X + a_change
			groups[ll_index].of_UpdatePoints()
			groups[ll_index].of_CopyItems(items)
		NEXT
		of_AddScrollbars()
		SetRedraw(TRUE)
	END IF
ELSE
	IF ll_count > 0 THEN
		SetRedraw(FALSE)
		
		groups[1].X = groups[1].X + a_change
		
		IF groups[1].X > 10 THEN
			groups[1].X = 10
		END IF
		
		items = empty
	
		FOR ll_index = 1 TO ll_count
			groups[ll_index].of_UpdatePoints()
			groups[ll_index].of_CopyItems(items)
			of_GroupSizeChanged()
		NEXT
	
		SetRedraw(TRUE)
	END IF
END IF
RETURN 1
end function

public function integer of_addscrollbars ();Long ll_count

ll_count = UpperBound(groups)

IF ib_RTL THEN
	IF ll_count > 0 THEN
		IF groups[1].X + groups[1].Width <= Width THEN
			ib_rightscrollvisible = FALSE
		ELSE
			ib_rightscrollvisible = TRUE
		END IF
		
		IF groups[ll_count].X < 0 THEN
			ib_leftscrollvisible = TRUE
		ELSE
			ib_leftscrollvisible = FALSE
		END IF
	END IF

ELSE

	IF ll_count > 0 THEN
		IF groups[ll_count].X + groups[ll_count].Width < Width THEN
			ib_rightscrollvisible = FALSE
		ELSE
			ib_rightscrollvisible = TRUE
		END IF
		
		IF groups[1].X < 0 THEN
			ib_leftscrollvisible = TRUE
		ELSE
			ib_leftscrollvisible = FALSE
		END IF
	END IF
END IF
RETURN 1
end function

public function integer of_setcontainer (u_cst_ribboncontainer auo_container);iuo_container = auo_container

RETURN 1
end function

private function string of_getgroupname (menu a_menu, string as_parentname);Long ll_pos, ll_pos2
String ls_tag, ls_group

ls_tag = a_menu.tag

ll_pos = Pos(Lower(ls_tag), "group:", 1)
	
IF ll_pos > 0 THEN
	ll_pos = ll_pos + Len("group:")
	ll_pos2 = Pos(ls_tag, ";", ll_pos)
	
	IF ll_pos2 = 0 THEN 
		ll_pos2 = Len(ls_tag)
	ELSE
		ll_pos2 = ll_pos2 - 1
	END IF
		
	RETURN Trim(Mid(ls_tag, ll_pos, ll_pos2 - ll_pos + 1))

END IF

ls_group = as_parentname//a_menu.Text
ll_pos = Pos(ls_group, "&", 1)

IF ll_pos > 0 THEN
	RETURN Replace(ls_group, ll_pos, 1, "")
ELSE
	RETURN ls_group
END IF
end function

public function integer of_setgroupfont (string as_font);Long ll_index, ll_count
String ls_keys[]
n_cst_ribbongroup l_group

groupcollection.GetKeys(ls_keys)

ll_count = UpperBound(ls_keys)

FOR ll_index = 1 TO ll_count
	l_group = groupcollection.Get(ls_keys[ll_index])
	l_group.of_FontName(as_font)
NEXT

is_groupfont = as_font

RETURN 1
end function

public function integer of_setgrouptextcolor (long al_color);Long ll_index, ll_count
String ls_keys[]
n_cst_ribbongroup l_group

groupcollection.GetKeys(ls_keys)

ll_count = UpperBound(ls_keys)

FOR ll_index = 1 TO ll_count
	l_group = groupcollection.Get(ls_keys[ll_index])
	l_group.of_FontColor(al_color)
NEXT

il_grouptextcolor = al_color

RETURN 1
end function

public function integer of_setitemfont (string as_font);Long ll_index, ll_count, ll_index2, ll_count2
String ls_keys[]
n_cst_ribbongroup l_group
ribbonitem empty[]

groupcollection.GetKeys(ls_keys)

ll_count = UpperBound(ls_keys)

items = empty

FOR ll_index = 1 TO ll_count
	l_group = groupcollection.Get(ls_keys[ll_index])
	
	ll_count2 = UpperBound(l_group.items)

	FOR ll_index2 = 1 TO ll_count2
		l_group.items[ll_index2].as_font = as_font
	NEXT
	
	l_group.of_UpdatePoints()
	l_group.of_CopyItems(items)
	of_GroupSizeChanged()
NEXT

is_itemfont = as_font

RETURN 1
end function

public function integer of_setitemtextcolor (long al_color);Long ll_index, ll_count, ll_index2, ll_count2
String ls_keys[]
n_cst_ribbongroup l_group
ribbonitem empty[]

groupcollection.GetKeys(ls_keys)

ll_count = UpperBound(ls_keys)

items = empty

FOR ll_index = 1 TO ll_count
	l_group = groupcollection.Get(ls_keys[ll_index])
	
	ll_count2 = UpperBound(l_group.items)

	FOR ll_index2 = 1 TO ll_count2
		l_group.items[ll_index2].al_textcolor = al_color
	NEXT
	
	l_group.of_CopyItems(items)
NEXT

il_itemtextcolor = al_color

RETURN 1
end function

public function long of_settheme (string as_theme);Long ll_index
ribbonitem empty[]

SetRedraw(FALSE)

IF IsValid(inv_color_theme) THEN DESTROY inv_color_theme
inv_color_theme = CREATE USING "n_cst_pbui_theme_" + as_theme
is_currenttheme = as_theme

THIS.BackColor = of_GetColor("BackGround1")

ib_windows8 = Left(Lower(as_theme), 7) = 'windows' OR Left(Lower(as_theme), 12) = 'powerbuilder'

items = empty

FOR ll_index = 1 TO UpperBound(groups)
	groups[ll_index].of_UpdatePoints()
	groups[ll_index].of_CopyItems(items)
NEXT

SetRedraw(TRUE)

RETURN 1
end function

public function long of_getcolor (string as_color);IF iuo_container.ib_office365 OR iuo_container.ib_office365_2 THEN
	CHOOSE CASE Upper(as_color)
		CASE "BACKGROUND1", "BACKGROUND2"
			RETURN iuo_container.Backcolor
		CASE "BORDER"
			RETURN RGB(179,176,173)
	END CHOOSE
END IF

RETURN inv_color_theme.of_GetColor(inv_color_theme.RibbonPanel, as_color)
end function

public function integer of_righttoleft (boolean ab_switch);ib_rtl = ab_switch

Long ll_index, ll_count, ll_x

ll_count = UpperBound(groups)
SetRedraw(FALSE)

IF ab_switch THEN
	FOR ll_index = 1 TO ll_count
		of_GroupSizeChanged()
	NEXT
	
	ribbonitem empty[]
	items = empty

	FOR ll_index = 1 TO ll_count
		groups[ll_index].of_UpdatePointsRight()
		groups[ll_index].of_CopyItems(items)
	NEXT

ELSE
	FOR ll_index = 1 TO ll_count
	
		IF ll_index > 1 THEN
			ll_x = ll_x + groups[ll_index].Width + 10
		END IF
		
		groups[UpperBound(groups)].X = ll_x
		
		groups[UpperBound(groups)].of_RightToLeft(ab_switch)
	NEXT
END IF

SetRedraw(TRUE)

RETURN 1
end function

public function menu of_getalttagmenu (string as_tag);Long ll_index, ll_count
Menu l_menu

ll_count = UpperBound(items)

FOR ll_index = 1 TO ll_count
	IF Lower(items[ll_index].as_alttag) = Lower(as_tag) THEN
		RETURN items[ll_index].a_menu
	END IF
NEXT

RETURN l_menu
end function

public function string of_getalttag (string as_text);Long ll_pos
ll_pos = Pos(as_text, "&", 1)

IF ll_pos = 0 THEN RETURN ""

RETURN Mid(as_text, ll_pos + 1, 1)
end function

public function ribbonitem of_getalttagitem (string as_tag);Long ll_index, ll_count
RibbonItem l_ribbonitem

ll_count = UpperBound(items)

FOR ll_index = 1 TO ll_count
	IF Lower(items[ll_index].as_alttag) = Lower(as_tag) THEN
		items[ll_index].ab_selected = true
		il_index = ll_index
		RETURN items[ll_index]
	END IF
NEXT

RETURN l_ribbonitem
end function

public function integer of_setfontsize (integer al_size);Long ll_index, ll_count
String ls_keys[]
n_cst_ribbongroup l_group
ribbonitem empty[]

il_fontsize = al_size

groupcollection.GetKeys(ls_keys)

ll_count = UpperBound(ls_keys)

items = empty

FOR ll_index = 1 TO ll_count
	l_group = groupcollection.Get(ls_keys[ll_index])
	l_group.#FontSize = al_size
	
	l_group.of_UpdatePoints()
	l_group.of_CopyItems(items)
	of_GroupSizeChanged()
NEXT


RETURN 1
end function

private function point of_gettooltippoint (integer al_index);Point lp

lp.px = UnitsToPixels(iuo_container.X, XUnitsToPixels!) + items[al_index].ast_point[1].px
lp.py = UnitsToPixels(iuo_container.Y + iuo_container.Height, YUnitsToPixels!) - 6

ClientToScreen(Handle(iw_parent),ref lp)

RETURN lp
			
end function

public function integer of_drawroundcontainer (longptr hdc);LongPtr lul_Graphic, lul_Pen
Long ll_index, ll_count, ll_stepcenters, ll_circlewidth, ll_circleheight
LongPtr lul_color, ull_BrushColor, lul_pencolor, lul_pencolorrgb, ull_BrushColorPast
LongPtr lul_greycolor, lul_greycolorRGB, lul_GreyPen, lul_linecolor, lul_colorRGB
LongPtr lul_textcolor, lul_path, lul_gradientbrush
Long ll_pixelwidth, ll_pixelheight, ll_length
Boolean lb_horizontal, lb_done
GdiplusStartupInput  istr_input
GdiplusStartupOutput istr_output
LongPtr iul_GdiToken
Constant ULong GMEM_MOVEABLE = 2

Int CornerRadius = 16

istr_input.GdiplusVersion = 1
inv_win32.GdiplusStartup(iul_GdiToken, istr_input, istr_output)	

ll_pixelwidth = UnitsToPixels(Width, XUnitsToPixels!)
ll_pixelheight = UnitsToPixels(Height, YUnitsToPixels!) + (CornerRadius / 5)

//Setup
inv_win32.GdipCreateFromHDC(hdc, lul_Graphic)
inv_win32.GdipSetSmoothingMode(lul_Graphic, 5)

//Get PenColor for circle outline
lul_pencolor = inv_win32.PBUSMakeARGB (255, 220, 220, 220)
LongPtr lul_pencolor2, lul_pencolor2rgb
lul_pencolor2 = inv_win32.PBUSMakeARGB (0, 255,255, 255)
lul_pencolor2rgb = RGB (229,229, 229)

//Get color for circle fill
lul_color = inv_win32.PBUSMakeARGB (255, 255, 255, 255)
lul_colorRGB = RGB(255,255,255)

lul_greycolor = inv_win32.PBUSMakeARGB (255, 203, 203, 203)

inv_win32.GdipCreatePen1(lul_pencolor2,1, 2, lul_Pen)
inv_win32.GdipCreatePen1(lul_greycolor, 1, 2, lul_GreyPen)
inv_win32.GdipCreateSolidFill(lul_pencolor, ull_BrushColorPast)
inv_win32.GdipCreateSolidFill(lul_color, ull_BrushColor)

//Draw Shadow

inv_win32.GdipCreatePath(0, lul_path)

// define a corner 
Rect Corner
Corner.Left = 0 //x
Corner.Top = 0 //y
Corner.Right = CornerRadius + CornerRadius //radius
Corner.Bottom =CornerRadius + CornerRadius//radius

// top left
inv_win32.GdipAddPathArcI(lul_path, Corner.Left, Corner.Top, Corner.Right,Corner.Bottom, 180, 90);

// tweak needed for radius of 10 (dia of 20)
Corner.Right += 1
Corner.Bottom += 1
ll_pixelwidth -= 1
ll_pixelheight -= 1


// top right
Corner.Left += (ll_pixelwidth - CornerRadius - CornerRadius  - 1);
inv_win32.GdipAddPathArcI(lul_path, Corner.Left, Corner.Top, Corner.Right,Corner.Bottom,  270, 90);

// bottom right
Corner.Top += (ll_pixelheight - CornerRadius - CornerRadius - 1);
inv_win32.GdipAddPathArcI(lul_path, Corner.Left, Corner.Top, Corner.Right,Corner.Bottom, 0, 90);

// bottom left
Corner.Left -= (ll_pixelwidth - CornerRadius - CornerRadius - 1);
inv_win32.GdipAddPathArcI(lul_path, Corner.Left, Corner.Top, Corner.Right,Corner.Bottom, 90, 90);

inv_win32.GdipClosePathFigure(lul_path)

inv_win32.GdipCreatePathGradientFromPath(lul_path,lul_gradientbrush)
inv_win32.GdipSetPathGradientCenterColor(lul_gradientbrush,lul_pencolor)
long var = 1
inv_win32.GdipSetPathGradientSurroundColorsWithCount(lul_gradientbrush,lul_pencolor2,var)

int var2 = 4
REAL blendFactors[] = {0.0, 0.20, 0.7, 1.0};
REAL blendPos[] = {0.0, 0.2, 0.5, 1.0};
inv_win32.GdipSetLineBlend(lul_gradientbrush, blendFactors, blendPos, var2)

Real xscale, yscale
xscale = Double(ll_pixelwidth - 8) / Double(ll_pixelwidth) //  .92
yscale = Double(ll_pixelheight - 8) / Double(ll_pixelheight) //  .92
inv_win32.GdipSetPathGradientFocusScales(lul_gradientbrush, xscale, yscale);

inv_win32.GdipFillPath(lul_graphic,lul_gradientbrush,lul_path)

inv_win32.GdipDeleteBrush(lul_gradientbrush)

inv_win32.GdipDeletePath(lul_path)

//Draw Main Rectangle

inv_win32.GdipCreatePath(0, lul_path)

// define a corner 
ll_pixelwidth -= 6
ll_pixelheight -= 6
Corner.Left = 3 //x
Corner.Top = 2 //y
Corner.Right = CornerRadius //radius
Corner.Bottom =CornerRadius //radius

// top left
inv_win32.GdipAddPathArcI(lul_path, Corner.Left, Corner.Top, Corner.Right,Corner.Bottom, 180, 90);

// tweak needed for radius of 10 (dia of 20)
IF Corner.Bottom = 20 THEN
	Corner.Right += 1
	Corner.Bottom += 1
	ll_pixelwidth -= 1
	ll_pixelheight -= 1
END IF

// top right
Corner.Left += (ll_pixelwidth - CornerRadius - 1);
inv_win32.GdipAddPathArcI(lul_path, Corner.Left, Corner.Top, Corner.Right,Corner.Bottom,  270, 90);

// bottom right
Corner.Top += (ll_pixelheight - CornerRadius - 1);
inv_win32.GdipAddPathArcI(lul_path, Corner.Left, Corner.Top, Corner.Right,Corner.Bottom, 0, 90);

// bottom left
Corner.Left -= (ll_pixelwidth - CornerRadius - 1);
inv_win32.GdipAddPathArcI(lul_path, Corner.Left, Corner.Top, Corner.Right,Corner.Bottom, 90, 90);

inv_win32.GdipClosePathFigure(lul_path)

inv_win32.GdipDrawPath(lul_graphic, lul_GreyPen, lul_path);
inv_win32.GdipFillPath(lul_graphic,ull_BrushColor,lul_path)

inv_win32.GdipSetClipPath(lul_graphic, lul_path, 0)

inv_win32.GdipSetSmoothingMode(lul_Graphic, 5)

//Cleanup
inv_win32.GdipDeletePen(lul_GreyPen)
inv_win32.GdipDeletePen(lul_Pen)
inv_win32.GdipDeleteBrush(ull_BrushColorPast)
inv_win32.GdipDeleteBrush(ull_BrushColor)	
inv_win32.GdipDeleteGraphics(lul_Graphic)

inv_win32.GdiplusShutdown(iul_GdiToken)

RETURN 0
end function

event mouseleave;IF il_index > 0 THEN
	IF il_selected = il_index THEN
		
		items[il_index].ab_mouseover = FALSE
	ELSE
		items[il_index].ab_selected = FALSE
		items[il_index].ab_mouseover = FALSE
	END IF
END IF

il_index = 0

IF ib_statuspushed THEN
	iuo_container.iw_parent.of_StatusPop()
	ib_statuspushed = FALSE
END IF

 inv_tooltip.of_Settrack(This, il_Id,FALSE)
 inv_timer.Stop()
 ib_ttmode = FALSE
 
 focusobject = 0
 
SetRedraw(TRUE)
end event

on u_cst_ribbonpanel.create
int iCurrent
call super::create
this.st_pbus_tooltip_font=create st_pbus_tooltip_font
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.st_pbus_tooltip_font
end on

on u_cst_ribbonpanel.destroy
call super::destroy
destroy(this.st_pbus_tooltip_font)
end on

event onpaint;call super::onpaint;Long ll_index, ll_count
n_cst_ribbongroup l_group

in_Gradient.of_SetDeviceContext(THIS)
in_Gradient.of_SetHDC(hdc)

in_Gradient.of_DrawBackground(of_GetColor("BACKGROUND1"), of_GetColor("BACKGROUND2"),UnitsToPixels(Width, XUnitsToPixels!), UnitsToPixels(Height, YUnitsToPixels!))

IF iuo_container.ib_office365_2 THEN
	of_DrawRoundContainer(hdc)
END IF

ll_count = UpperBound(groups)

FOR ll_index = 1 TO ll_count
	l_group = groups[ll_index]
	
	strGroupBox lstr_GroupBox
	
	lstr_GroupBox.text = l_group.#Text
	lstr_GroupBox.fontfamily = l_group.#FontFamily
	lstr_GroupBox.fontsize = l_group.#FontSize
	lstr_GroupBox.bold = l_group.#Bold
	lstr_GroupBox.italics = l_group.#Italic
	lstr_GroupBox.strikeout = l_group.#StrikeOut
	lstr_GroupBox.underline = l_group.#Underline
	lstr_GroupBox.fontcolor = of_GetColor("GROUPTEXT")// l_group.#FontColor
	lstr_GroupBox.backcolor = l_group.of_GetColor()
	lstr_GroupBox.bordercolor = of_GetColor("BORDER")
	lstr_GroupBox.gradientdirection = 'V'
	lstr_GroupBox.X = UnitsToPixels(l_group.X, XUnitsToPixels!)
	lstr_GroupBox.Y = UnitsToPixels(l_group.Y, YUnitsToPixels!)
	lstr_GroupBox.Width = UnitsToPixels(l_group.Width, XUnitsToPixels!)
	lstr_GroupBox.Height = UnitsToPixels(l_group.Height, YUnitsToPixels!)
	lstr_GroupBox.Office365 = iuo_container.ib_Office365
	
	IF iuo_container.il_dockheight = 456 THEN
		in_Gradient.of_DrawRibbonGroup (THIS, lstr_GroupBox, FALSE)
	ELSE
		in_Gradient.of_DrawRibbonGroup (THIS, lstr_GroupBox, TRUE)
	END IF
NEXT

in_Gradient.of_DrawRibbonItems (il_imagelistsmall, il_imagelistlarge, items, ib_windows8, iuo_container.iw_parent.of_AltLetterKeyPressed(), ib_rtl)

IF ib_leftscrollvisible THEN
	in_Gradient.of_DrawLeftScroll (hdc, THIS, of_GetColor("SCROLLBAR"))
END IF

IF ib_rightscrollvisible THEN
	in_Gradient.of_DrawRightScroll (hdc, THIS, of_GetColor("SCROLLBAR"))
END IF

of_DrawEval(hdc)

RETURN 1
end event

event constructor;call super::constructor;inv_timer = CREATE n_cst_ribbon_timer
inv_timer.iuo_panel = THIS
end event

event destructor;call super::destructor;DESTROY inv_timer
end event

event wm_mouseleave;of_ReleaseMouse()
this.POST Event MouseLeave()
end event

event wm_mousewheel;call super::wm_mousewheel;iuo_container.Trigger Event ue_mousewheel(wparam, lparam)
end event

type st_pbus_tooltip_font from statictext within u_cst_ribbonpanel
boolean visible = false
integer x = 23
integer y = 40
integer width = 402
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "none"
boolean focusrectangle = false
end type

