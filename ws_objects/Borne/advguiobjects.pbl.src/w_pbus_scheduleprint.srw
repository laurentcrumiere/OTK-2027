$PBExportHeader$w_pbus_scheduleprint.srw
forward
global type w_pbus_scheduleprint from w_pbus_spa_captionless
end type
type uo_print from u_cst_powerscheduleprint within w_pbus_scheduleprint
end type
end forward

global type w_pbus_scheduleprint from w_pbus_spa_captionless
integer width = 3131
integer height = 1996
string title = "Print Preview"
boolean minbox = false
boolean maxbox = false
windowtype windowtype = response!
uo_print uo_print
end type
global w_pbus_scheduleprint w_pbus_scheduleprint

type variables
str_scheduleprint istr_print
n_cst_pbus_resize inv_resize

Integer MinWidth, MinHeight

n_uspb_resourcemanager inv_resourcemanager
end variables

forward prototypes
public function integer of_setresize (boolean ab_switch)
end prototypes

public function integer of_setresize (boolean ab_switch);integer	li_rc

// Check arguments
if IsNull (ab_switch) then
	return -1
end if

if ab_Switch then
	if IsNull(inv_resize) Or not IsValid (inv_resize) then
		inv_resize = create n_cst_pbus_resize
		inv_resize.of_SetOrigSize (this.WorkSpaceWidth(), this.WorkSpaceHeight())
		inv_resize.of_SetMinSize (this.WorkSpaceWidth(), this.WorkSpaceHeight())
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

on w_pbus_scheduleprint.create
int iCurrent
call super::create
this.uo_print=create uo_print
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.uo_print
end on

on w_pbus_scheduleprint.destroy
call super::destroy
destroy(this.uo_print)
end on

event open;call super::open;istr_print = Message.PowerObjectParm
uo_print.iuo_schedule =  istr_print.PowerSchedule
uo_print.iuo_scheduleview =  istr_print.PowerScheduleView

of_SetTheme(istr_print.theme)
of_UseCustomColors(RGB(255,255,255), 0)

of_SetResize(TRUE)
MinWidth = Width
MinHeight = Height
inv_resize.of_SetMinSize(MinWidth, MinHeight)
inv_resize.of_Register(uo_print, inv_resize.SCALERIGHTBOTTOM)

uo_print.of_DisplayPrintPreview()
end event

event resize;call super::resize;IF IsValid(inv_resize) THEN
	inv_resize.Trigger Event pfc_resize(sizetype, newwidth, newheight)
END IF

IF NewWidth < MinWidth THEN
	Width = MinWidth
END IF

IF NewHeight < MinHeight THEN
	Height = MinHeight
END IF
end event

type uo_spa_controls from w_pbus_spa_captionless`uo_spa_controls within w_pbus_scheduleprint
end type

type uo_print from u_cst_powerscheduleprint within w_pbus_scheduleprint
event lbuttondown pbm_lbuttondown
integer taborder = 50
boolean bringtotop = true
end type

event lbuttondown;PARENT.TRIGGER EVENT lbuttondown(flags, xpos, ypos)
end event

on uo_print.destroy
call u_cst_powerscheduleprint::destroy
end on

event cancelclicked;call super::cancelclicked;Close(PARENT)
end event

event printcomplete;call super::printcomplete;Close(PARENT)
end event

