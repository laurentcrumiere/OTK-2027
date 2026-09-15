$PBExportHeader$uov_property_datawindow.sru
forward
global type uov_property_datawindow from datawindow
end type
end forward

global type uov_property_datawindow from datawindow
integer width = 686
integer height = 400
string title = "none"
boolean border = false
boolean livescroll = true
borderstyle borderstyle = stylelowered!
event ue_post_scroll ( integer direction )
event ue_vscroll pbm_vscroll
end type
global uov_property_datawindow uov_property_datawindow

type variables
n_cst_pbwc_string inv_string
long mscroll = 0
end variables

forward prototypes
public subroutine of_size_columns ()
end prototypes

event ue_post_scroll(integer direction);integer k = 1
if direction = 2 then k = -1
this.mscroll = this.mscroll + (50 * k)
if this.mscroll < 0 then this.mscroll = 0
if this.mscroll > (integer(this.Describe("DataWindow.Detail.Height")) - this.height) then this.mscroll = integer(this.Describe("DataWindow.Detail.Height")) - this.height
this.Object.datawindow.verticalscrollposition = this.mscroll
this.setredraw(true)
end event

event ue_vscroll;if (scrollcode = 2) or (scrollcode = 3) then
this.setredraw(false)
this.post event ue_post_scroll(scrollcode)
elseif (scrollcode = 5) then
this.mscroll = scrollpos
end if
end event

public subroutine of_size_columns ();//resize columns so that they fit all available space
long ll_nb_cols, ii
long ll_x, ll_width
string ls_bitmap
ll_nb_cols = long(this.describe("datawindow.column.count"))
FOR ii = 1 to ll_nb_cols
	ll_x = long(this.describe("#"+string(ii)+".x"))
	IF ll_x > 0 THEN
		ll_width = this.width - ll_x - 80
		ls_bitmap = this.describe("#"+string(ii)+".bitmapname")
		//do do resize if too small
		IF ll_width > 120 and ls_bitmap<> "yes" THEN
			this.modify("#"+string(ii)+".width="+string(ll_width))
		END IF
	END IF
NEXT
end subroutine

on uov_property_datawindow.create
end on

on uov_property_datawindow.destroy
end on

event resize;this.of_size_columns()
end event

