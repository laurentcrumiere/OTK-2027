$PBExportHeader$u_cst_breadcrumb.sru
forward
global type u_cst_breadcrumb from userobject
end type
type st_pbus_breadcrumblabel from statictext within u_cst_breadcrumb
end type
type uo_breadcrumb_toolbar from u_cst_breadcrumb_toolbar within u_cst_breadcrumb
end type
type tv from treeview within u_cst_breadcrumb
end type
end forward

global type u_cst_breadcrumb from userobject
integer width = 2167
integer height = 108
long backcolor = 67108864
string text = "none"
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
event selectionchanged ( long oldhandle,  long newhandle )
event type long selectionchanging ( long oldhandle,  long newhandle )
event clicked ( long handle )
event deleteitem ( long handle )
event type long sort ( long handle1,  long handle2 )
event itempopulate ( long handle )
event resize pbm_size
st_pbus_breadcrumblabel st_pbus_breadcrumblabel
uo_breadcrumb_toolbar uo_breadcrumb_toolbar
tv tv
end type
global u_cst_breadcrumb u_cst_breadcrumb

type variables
CONSTANT Long SMALL = 16
CONSTANT Long MEDIUM = 24
CONSTANT Long LARGE = 32
CONSTANT Long XLARGE = 48

PRIVATE:
Long il_CurrentSize = SMALL

Long il_currenthandle = 0
Long il_toolbarhandles[]
String is_handleimages[]
end variables

forward prototypes
private function integer of_render ()
public function integer of_settheme (string as_theme)
public function integer of_setsize (integer al_size)
public function integer of_setfontsize (integer ai_fontsize)
public function integer of_setfontname (string as_font)
public function integer of_setfontcolor (long al_fontcolor)
public function integer insertitemfirst (long h, string label, string picture, any data)
public function long finditem (treenavigation navigationcode, long itemhandle)
public function integer clear ()
public function integer deleteitem (long itemhandle)
public function integer getitem (long itemhandle, ref treeviewitem item)
public function integer insertitem (long handleparent, long handleafter, string label, string picture, any data)
public function integer insertitem (long handleparent, long handleafter, string label, string picture)
public function integer insertitemfirst (long handleparent, string label, string picture)
public function integer insertitemlast (long handleparent, string label, string picture)
public function integer insertitemlast (long handleparent, string label, string picture, any data)
public function integer insertitemsort (long handleparent, string label, string picture)
public function integer selectitem (long itemhandle)
public function integer setitem (long itemhandle, treeviewitem item)
public function integer sort (long itemhandle, grsorttype sorttype)
public function integer sortall (long itemhandle, grsorttype sorttype)
public function integer updatelabel (long itemhandle, string label)
public function integer updatepicture (long itemhandle, string picture)
public function integer insertitemsort (long handleparent, string label, string picture, any data)
end prototypes

event resize;uo_breadcrumb_toolbar.Width = NewWidth
//of_Render()
end event

private function integer of_render ();Long ll_parent, ll_child, ll_current
Long ll_toplevels[], ll_toolbarhandles[]
IF il_currenthandle = 0 THEN RETURN 0

Long ll_index, ll_count, ll_tbitem, ll_tbchilditem
TreeViewItem tvi

SetRedraw(FALSE)

uo_breadcrumb_toolbar.of_Reset()

ll_current = il_currenthandle
ll_toplevels[1] = ll_current

//Find all top level treeview handles
DO UNTIL ll_parent = -1
	
	ll_parent = tv.FindItem(ParentTreeItem!, ll_current)
	
	IF ll_parent >= 0 THEN	
		ll_toplevels[UpperBound(ll_toplevels) + 1] = ll_parent
		
		ll_current = ll_parent
	END IF
	
LOOP

ll_count = UpperBound(ll_toplevels)

FOR ll_index = ll_count TO 1 STEP -1
	
	tv.GetItem(ll_toplevels[ll_index], tvi)
	
	IF tvi.Children THEN
		ll_tbitem = uo_breadcrumb_toolbar.of_AddGroup(tvi.Label, is_handleimages[ll_toplevels[ll_index]])
	ELSE
		ll_tbitem = uo_breadcrumb_toolbar.of_AddItem(tvi.Label, is_handleimages[ll_toplevels[ll_index]])
	END IF
	
	ll_toolbarhandles[ll_tbitem] = ll_toplevels[ll_index]
	
	IF tvi.Children THEN
		
		ll_child = 0
		
		TreeNavigation l_tn
		l_tn = ChildTreeItem!
		ll_parent = ll_toplevels[ll_index]
		
		//Find all child treeview handles
		DO UNTIL ll_child = -1
			
			ll_child = tv.FindItem(l_tn, ll_parent)
			
			IF ll_child >= 0 THEN
				
				//Get the child item
				tv.GetItem(ll_child, tvi)
				//Add the child item to toolbar
				ll_tbchilditem = uo_breadcrumb_toolbar.of_AddItem(tvi.Label, is_handleimages[ll_child])
				//Track the child item handle
				ll_toolbarhandles[ll_tbchilditem] = ll_child
				
				//Assign the child to the group
				uo_breadcrumb_toolbar.of_AssignItemToGroup(ll_tbitem, ll_tbchilditem)
				
				l_tn = NextTreeItem!
				ll_parent = ll_child
			END IF
			
		LOOP
		
	END IF
	
NEXT

uo_breadcrumb_toolbar.of_UpdatePoints()

il_toolbarhandles = ll_toolbarhandles

SetRedraw(TRUE)

RETURN 1
end function

public function integer of_settheme (string as_theme);uo_breadcrumb_toolbar.of_SetTheme(as_theme)

RETURN 1
end function

public function integer of_setsize (integer al_size);Long ll_return

ll_return = uo_breadcrumb_toolbar.of_SetSize(al_size)

THIS.Height = uo_breadcrumb_toolbar.Height

RETURN ll_return
end function

public function integer of_setfontsize (integer ai_fontsize);RETURN uo_breadcrumb_toolbar.of_SetFontSize(ai_fontsize)
end function

public function integer of_setfontname (string as_font);RETURN uo_breadcrumb_toolbar.of_SetFontName(as_font)
end function

public function integer of_setfontcolor (long al_fontcolor);RETURN uo_breadcrumb_toolbar.of_SetFontColor(al_fontcolor)
end function

public function integer insertitemfirst (long h, string label, string picture, any data);Long ll_return
TreeViewItem tvi

tvi.Label = label
tvi.Data = data

ll_return = tv.InsertItemFirst(h,tvi)

is_handleimages[ll_return] = picture

of_Render()

RETURN ll_return
end function

public function long finditem (treenavigation navigationcode, long itemhandle);RETURN tv.FindItem(navigationcode, itemhandle)
end function

public function integer clear ();RETURN tv.DeleteItem(0)
end function

public function integer deleteitem (long itemhandle);Long ll_return

ll_return = tv.DeleteItem(itemhandle)

is_handleimages[itemhandle] = ""

of_Render()

RETURN ll_return
end function

public function integer getitem (long itemhandle, ref treeviewitem item);RETURN tv.GetItem(itemhandle, item)
end function

public function integer insertitem (long handleparent, long handleafter, string label, string picture, any data);Long ll_return
TreeViewItem tvi

tvi.Label = label
tvi.Data = data

ll_return = tv.InsertItem(handleparent,handleafter,tvi)

is_handleimages[ll_return] = picture

of_Render()

RETURN ll_return
end function

public function integer insertitem (long handleparent, long handleafter, string label, string picture);RETURN InsertItem(handleparent,handleafter,label,picture,0)
end function

public function integer insertitemfirst (long handleparent, string label, string picture);RETURN InsertItemFirst(handleparent,label,picture,0)
end function

public function integer insertitemlast (long handleparent, string label, string picture);RETURN InsertItemLast(handleparent,label,picture,0)
end function

public function integer insertitemlast (long handleparent, string label, string picture, any data);Long ll_return
TreeViewItem tvi

tvi.Label = label
tvi.Data = data

ll_return = tv.InsertItemLast(handleparent,tvi)

is_handleimages[ll_return] = picture

of_Render()

RETURN ll_return
end function

public function integer insertitemsort (long handleparent, string label, string picture);RETURN InsertItemSort(handleparent,label,picture,0)
end function

public function integer selectitem (long itemhandle);IF tv.SelectItem(itemhandle) > 0 THEN
	il_currenthandle = itemhandle

	of_Render()
END IF

RETURN 1
end function

public function integer setitem (long itemhandle, treeviewitem item);Long ll_return

ll_return = tv.SetItem(itemhandle,item)

of_Render()

RETURN ll_return
end function

public function integer sort (long itemhandle, grsorttype sorttype);Long ll_return

ll_return = tv.Sort(itemhandle,sorttype)

of_Render()

RETURN ll_return
end function

public function integer sortall (long itemhandle, grsorttype sorttype);Long ll_return

ll_return = tv.SortAll(itemhandle,sorttype)

of_Render()

RETURN ll_return
end function

public function integer updatelabel (long itemhandle, string label);TreeViewItem l_tvi

IF tv.GetItem(itemhandle, l_tvi) > 0 THEN

	l_tvi.Label = label
	
	tv.SetItem(itemhandle, l_tvi)
	
	of_Render()
	
	RETURN 1
END IF

RETURN -1
end function

public function integer updatepicture (long itemhandle, string picture);IF itemhandle <= 0 OR itemhandle > UpperBound(is_handleimages) THEN RETURN -1

is_handleimages[itemhandle] = picture

of_Render()

RETURN 1
end function

public function integer insertitemsort (long handleparent, string label, string picture, any data);Long ll_return
TreeViewItem tvi

tvi.Label = label
tvi.Data = data

ll_return = tv.InsertItemSort(handleparent,tvi)

is_handleimages[ll_return] = picture

of_Render()

RETURN ll_return
end function

on u_cst_breadcrumb.create
this.st_pbus_breadcrumblabel=create st_pbus_breadcrumblabel
this.uo_breadcrumb_toolbar=create uo_breadcrumb_toolbar
this.tv=create tv
this.Control[]={this.st_pbus_breadcrumblabel,&
this.uo_breadcrumb_toolbar,&
this.tv}
end on

on u_cst_breadcrumb.destroy
destroy(this.st_pbus_breadcrumblabel)
destroy(this.uo_breadcrumb_toolbar)
destroy(this.tv)
end on

event constructor;of_SetSize(SMALL)
end event

type st_pbus_breadcrumblabel from statictext within u_cst_breadcrumb
integer width = 10002
integer height = 10000
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 16777215
long backcolor = 8421376
string text = "  Breadcrumb"
boolean focusrectangle = false
end type

event constructor;Hide()
end event

type uo_breadcrumb_toolbar from u_cst_breadcrumb_toolbar within u_cst_breadcrumb
integer width = 2167
integer taborder = 10
long backcolor = 268435456
boolean ib_displaytext = true
boolean ib_displaytooltips = false
end type

on uo_breadcrumb_toolbar.destroy
call u_cst_breadcrumb_toolbar::destroy
end on

event ue_buttonclicked;call super::ue_buttonclicked;IF al_index <= 0 OR al_index > UpperBound(il_toolbarhandles) THEN RETURN

PARENT.SelectItem(il_toolbarhandles[al_index])


end event

type tv from treeview within u_cst_breadcrumb
boolean visible = false
integer x = 169
integer y = 32
integer width = 480
integer height = 400
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
long picturemaskcolor = 536870912
long statepicturemaskcolor = 536870912
end type

event deleteitem;PARENT.TRIGGER EVENT DeleteItem(handle)
end event

event selectionchanged;PARENT.TRIGGER EVENT SelectionChanged(oldhandle, newhandle)
end event

event selectionchanging;RETURN PARENT.TRIGGER EVENT SelectionChanging(oldhandle, newhandle)
end event

event sort;RETURN PARENT.TRIGGER EVENT Sort(handle1, handle2)
end event

event itempopulate;PARENT.TRIGGER EVENT ItemPopulate(handle)
end event

