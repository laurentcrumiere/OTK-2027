$PBExportHeader$w_pbus_printmodal.srw
forward
global type w_pbus_printmodal from window
end type
end forward

global type w_pbus_printmodal from window
boolean visible = false
integer width = 9
integer height = 80
boolean titlebar = true
string title = "Untitled"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
end type
global w_pbus_printmodal w_pbus_printmodal

type variables
String is_image
end variables

forward prototypes
public function integer of_openprintdialog ()
end prototypes

public function integer of_openprintdialog ();OLEObject OLEWIACommonDialog
OLEObject OLEWIAVector
OLEWIACommonDialog = CREATE OLEObject
OLEWIAVector = CREATE OLEObject

OLEWIACommonDialog.ConnectToNewObject("WIA.CommonDialog")
OLEWIAVector.ConnectToNewObject("WIA.Vector")
OLEWIAVector.Add(is_image);
OLEWIACommonDialog.ShowPhotoPrintingWizard(OLEWIAVector);

DESTROY OLEWIACommonDialog
DESTROY OLEWIAVector

Close(THIS)

RETURN 1
end function

event open;
is_image = Message.StringParm

POST of_OpenPrintDialog()
end event

on w_pbus_printmodal.create
end on

on w_pbus_printmodal.destroy
end on

