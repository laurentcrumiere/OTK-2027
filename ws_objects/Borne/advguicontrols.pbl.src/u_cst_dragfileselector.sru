$PBExportHeader$u_cst_dragfileselector.sru
forward
global type u_cst_dragfileselector from u_uspb_base
end type
type st_pbus_dragfilelabel from statictext within u_cst_dragfileselector
end type
type st_or from statictext within u_cst_dragfileselector
end type
type cb_browse from commandbutton within u_cst_dragfileselector
end type
type st_maintext from statictext within u_cst_dragfileselector
end type
type r_1 from rectangle within u_cst_dragfileselector
end type
type ln_1 from line within u_cst_dragfileselector
end type
end forward

global type u_cst_dragfileselector from u_uspb_base
integer width = 1687
integer height = 688
event dropfiles pbm_dropfiles
event fileselected ( string as_path )
event resize pbm_size
st_pbus_dragfilelabel st_pbus_dragfilelabel
st_or st_or
cb_browse cb_browse
st_maintext st_maintext
r_1 r_1
ln_1 ln_1
end type
global u_cst_dragfileselector u_cst_dragfileselector

type prototypes
Subroutine DragAcceptFiles(Long hwnd,Boolean fAccept) library "shell32.dll" 
function ulong DragQueryFileW( ulong ul_Drop, ulong ul_index, ref string LPTSTR, ulong cb ) library 'shell32.dll'

end prototypes

type variables
Boolean AllowMultipleFiles = TRUE
String OpenFileDialogTitle = "LBL_Select_Files"
String BrowseButtonText = "LBL_Browse_Files"
String MainText = "LBL_Drag_Drop_Files_Here"

PRIVATE:

n_uspb_resourcemanager inv_resourcemanager
end variables

forward prototypes
public function integer of_refresh ()
private function integer of_setbackcolor (unsignedlong al_backcolor)
end prototypes

event dropfiles;Long ll_index, ll_count
String ls_name

ll_count = DragQueryFileW(handle,-1,ls_name,0)

FOR ll_index = 1 TO ll_count
	ls_name = space(255)
	DragQueryFileW(handle,ll_index - 1,ls_name,255)
	
	EVENT fileselected(ls_name)

	IF NOT AllowMultipleFiles THEN
		EXIT
	END IF
NEXT
end event

event resize;r_1.Resize(newwidth - 4, newheight - 4)
st_maintext.Width = newwidth - 28
st_maintext.Y = (newheight / 2 / 2) - (st_maintext.height / 2)
st_or.Move((newwidth / 2) - (st_or.width / 2), (newheight / 2) - (st_or.height / 2))
cb_browse.Move((newwidth / 2) - (cb_browse.width / 2), (newheight / 2) + (newheight / 2 / 2) - (cb_browse.height / 2))

ln_1.BeginX = (newwidth / 2) - 414
ln_1.EndX = ln_1.BeginX + 818

ln_1.BeginY = (newheight / 2)
ln_1.EndY = (newheight / 2)

end event

public function integer of_refresh ();cb_browse.Text = BrowseButtonText
st_maintext.Text = MainText

RETURN 1
end function

private function integer of_setbackcolor (unsignedlong al_backcolor);st_or.Backcolor = al_backcolor
st_maintext.Backcolor = al_backcolor
r_1.FillColor = al_backcolor

RETURN 1
end function

on u_cst_dragfileselector.create
int iCurrent
call super::create
this.st_pbus_dragfilelabel=create st_pbus_dragfilelabel
this.st_or=create st_or
this.cb_browse=create cb_browse
this.st_maintext=create st_maintext
this.r_1=create r_1
this.ln_1=create ln_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.st_pbus_dragfilelabel
this.Control[iCurrent+2]=this.st_or
this.Control[iCurrent+3]=this.cb_browse
this.Control[iCurrent+4]=this.st_maintext
this.Control[iCurrent+5]=this.r_1
this.Control[iCurrent+6]=this.ln_1
end on

on u_cst_dragfileselector.destroy
call super::destroy
destroy(this.st_pbus_dragfilelabel)
destroy(this.st_or)
destroy(this.cb_browse)
destroy(this.st_maintext)
destroy(this.r_1)
destroy(this.ln_1)
end on

event constructor;of_SetBackcolor(THIS.Backcolor)
st_pbus_dragfilelabel.Visible = FALSE

DragAcceptFiles(Handle(THIS), TRUE)

cb_browse.Text = inv_resourcemanager.of_GetString(BrowseButtonText)
st_maintext.Text = inv_resourcemanager.of_GetString(MainText)

Event Resize(1, Width, Height)
end event

type st_pbus_dragfilelabel from statictext within u_cst_dragfileselector
integer width = 10002
integer height = 10000
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 16777215
long backcolor = 8421376
string text = "  Drag and Drop Files"
boolean focusrectangle = false
end type

type st_or from statictext within u_cst_dragfileselector
integer x = 795
integer y = 296
integer width = 96
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 8421504
long backcolor = 16777215
string text = "or"
alignment alignment = center!
boolean focusrectangle = false
end type

type cb_browse from commandbutton within u_cst_dragfileselector
integer x = 640
integer y = 448
integer width = 402
integer height = 112
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Browse Files"
end type

event clicked;String ls_file
String ls_files[]
String ls_path
Long ll_index

IF AllowMultipleFiles THEN
	IF GetFileOpenName (inv_resourcemanager.of_GetString(OpenFileDialogTitle), ls_path, ls_files) = 1 THEN
		
		IF UpperBound(ls_files) = 1 THEN
			EVENT fileselected(ls_path)
		ELSE
			FOR ll_index = 1 TO UpperBound(ls_files)
				EVENT fileselected(ls_path + "\" + ls_files[ll_index])
			NEXT
		END IF
	END IF
ELSE
	IF GetFileOpenName (inv_resourcemanager.of_GetString(OpenFileDialogTitle), ls_path, ls_file) = 1 THEN
		EVENT fileselected(ls_path)
	END IF
END IF
end event

type st_maintext from statictext within u_cst_dragfileselector
integer x = 14
integer y = 152
integer width = 1655
integer height = 96
integer textsize = -12
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 8421504
long backcolor = 16777215
string text = "Drag and Drop Files Here"
alignment alignment = center!
boolean focusrectangle = false
end type

type r_1 from rectangle within u_cst_dragfileselector
linestyle linestyle = dash!
integer linethickness = 4
long fillcolor = 16777215
integer x = 5
integer y = 4
integer width = 1673
integer height = 672
end type

type ln_1 from line within u_cst_dragfileselector
long linecolor = 8421504
integer linethickness = 4
integer beginx = 439
integer beginy = 336
integer endx = 1257
integer endy = 336
end type

