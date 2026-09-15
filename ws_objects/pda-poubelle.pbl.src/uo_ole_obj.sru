$PBExportHeader$uo_ole_obj.sru
forward
global type uo_ole_obj from oleobject
end type
end forward

global type uo_ole_obj from oleobject
end type
global uo_ole_obj uo_ole_obj

type variables
private boolean		existant
end variables

forward prototypes
public function integer connecter_ole_obj (string ole_class_name)
public subroutine deconnecter_ole_obj ()
end prototypes

public function integer connecter_ole_obj (string ole_class_name);// pour se connecter à un object ole
// dont le type est passé en param
// return 1 si OK, -1 si pb

int	returnval = -1


if ConnectToObject("", ole_class_name) = 0 then
// si on arrive à se connecter à un object existant
	// on indique qu'il était existant
	existant = true
	// maj return val
	returnval = 1
else
// impossible de se connecter
	// on essaye d'en créer un
	if connecttoNEWobject(ole_class_name) = 0 then
	// si création = OK
		// on indique qu'il n'était pas existant
		existant = false
		// maj var de retour
		returnval = 1
	end if
end if

return returnval
end function

public subroutine deconnecter_ole_obj ();//deconnection au serveur OLE
disconnectobject()
end subroutine

on uo_ole_obj.create
call super::create
TriggerEvent( this, "constructor" )
end on

on uo_ole_obj.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

