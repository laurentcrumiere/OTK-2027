$PBExportHeader$u_cst_spa_icon.sru
forward
global type u_cst_spa_icon from u_cst_canvas
end type
end forward

global type u_cst_spa_icon from u_cst_canvas
integer width = 110
integer height = 96
event lbuttonup pbm_lbuttonup
end type
global u_cst_spa_icon u_cst_spa_icon

type prototypes

end prototypes

type variables
Public:

// colors
CONSTANT Long BLACK = 0

Boolean Transparent = TRUE

Private:

Long il_BackColor = BLACK
String is_image

n_cst_ui_imagelist inv_imagelist
LongPtr il_imagelist
Long il_image
n_cst_buttonlistbar_painter in_gradient

end variables

forward prototypes
public function boolean of_loadimage (string as_filename)
public subroutine of_settransparencycolor (long al_value)
end prototypes

public function boolean of_loadimage (string as_filename);IF Len(Trim(as_filename)) = 0 THEN
	RETURN FALSE
END IF

message l_message

l_message = CREATE Message
l_message.Handle = Message.Handle
l_message.Number = Message.Number
l_message.WordParm = Message.WordParm
l_message.LongParm = Message.LongParm
l_message.DoubleParm = Message.DoubleParm
l_message.StringParm = Message.StringParm
l_message.PowerObjectParm = Message.PowerObjectParm
l_message.Processed = Message.Processed
l_message.ReturnValue = Message.ReturnValue

is_image = as_filename

il_image = inv_imagelist.of_AddImage(is_image)

il_imagelist = inv_imagelist.of_GetMediumHandle()


Message.Handle = l_message.Handle
Message.Number = l_message.Number
Message.WordParm = l_message.WordParm
Message.LongParm = l_message.LongParm
Message.DoubleParm = l_message.DoubleParm
Message.StringParm = l_message.StringParm
Message.PowerObjectParm = l_message.PowerObjectParm
Message.Processed = l_message.Processed
Message.ReturnValue = l_message.ReturnValue


RETURN TRUE

end function

public subroutine of_settransparencycolor (long al_value);il_BackColor = al_value
end subroutine

on u_cst_spa_icon.create
call super::create
end on

on u_cst_spa_icon.destroy
call super::destroy
end on

event constructor;call super::constructor;PowerObject	lpo_parent
UserObject luo_parent
Window lw_parent

lpo_parent = this.GetParent()
choose case lpo_parent.TypeOf()
	case UserObject!
		luo_parent = lpo_parent
		il_BackColor = luo_parent.BackColor
	case Window!
		lw_parent = lpo_parent
		il_BackColor = lw_parent.BackColor
end choose

of_SetTransparent(Transparent)

end event

event onpaint;call super::onpaint;CONSTANT Long ILD_TRANSPARENT = 1

in_Gradient.of_SetHDC(hdc)

in_Gradient.of_XPGradient (il_BackColor, il_BackColor, THIS,FALSE,il_BackColor, TRUE)	


// draw bitmap
If Len(Trim(is_image)) > 0 Then
	inv_win32.ImageList_Draw(il_imagelist, &
								  il_image - 1, &
								  hdc, &
								  0 , 0, &
								  ILD_TRANSPARENT )
End If

Return 1

end event

