$PBExportHeader$n_cst_ui_imagelist.sru
forward
global type n_cst_ui_imagelist from nonvisualobject
end type
end forward

global type n_cst_ui_imagelist from nonvisualobject autoinstantiate
end type

type variables

end variables

forward prototypes
public function long of_addimage (string as_image)
public function integer of_setglobaltheme (string as_theme)
public function string of_getglobaltheme ()
public function longptr of_getlargehandle ()
public function longptr of_getmediumhandle ()
public function longptr of_getsmallhandle ()
public function longptr of_getxlargehandle ()
public function integer of_setgloballanguagecode (string as_languagecode)
public function string of_getgloballanguagecode ()
public function string of_getimagefromindex (long al_index)
end prototypes

public function long of_addimage (string as_image);IF NOT IsValid(w_imagelist) THEN
	Open(w_imagelist)
END IF

RETURN w_imagelist.of_AddImage(as_image)
end function

public function integer of_setglobaltheme (string as_theme);IF NOT IsValid(w_imagelist) THEN
	Open(w_imagelist)
END IF

w_imagelist.of_SetGlobalTheme(as_theme)

RETURN 1
end function

public function string of_getglobaltheme ();IF NOT IsValid(w_imagelist) THEN
	RETURN "Windows10_BLUE"
END IF

String ls_theme

ls_theme = w_imagelist.of_GetGlobalTheme()

IF Len(Trim(ls_theme)) = 0 THEN
	RETURN "Windows10_BLUE"
END IF

RETURN ls_theme
end function

public function longptr of_getlargehandle ();IF NOT IsValid(w_imagelist) THEN
	Open(w_imagelist)
END IF

RETURN w_imagelist.of_GetLargeHandle()
end function

public function longptr of_getmediumhandle ();IF NOT IsValid(w_imagelist) THEN
	Open(w_imagelist)
END IF

RETURN w_imagelist.of_GetMediumHandle()
end function

public function longptr of_getsmallhandle ();IF NOT IsValid(w_imagelist) THEN
	Open(w_imagelist)
END IF

RETURN w_imagelist.of_GetSmallHandle()
end function

public function longptr of_getxlargehandle ();IF NOT IsValid(w_imagelist) THEN
	Open(w_imagelist)
END IF

RETURN w_imagelist.of_GetXLargeHandle()
end function

public function integer of_setgloballanguagecode (string as_languagecode);IF NOT IsValid(w_imagelist) THEN
	Open(w_imagelist)
END IF

w_imagelist.of_SetGlobalLanguageCode(as_languagecode)


RETURN 1
end function

public function string of_getgloballanguagecode ();IF NOT IsValid(w_imagelist) THEN
	RETURN "en"
END IF

String ls_language

ls_language = w_imagelist.of_GetGlobalLanguageCode()

IF Len(Trim(ls_language)) = 0 THEN
	RETURN "en"
END IF

RETURN ls_language
end function

public function string of_getimagefromindex (long al_index);IF NOT IsValid(w_imagelist) THEN RETURN ""

RETURN w_imagelist.of_GetImageFromIndex(al_index)
end function

on n_cst_ui_imagelist.create
call super::create
TriggerEvent( this, "constructor" )
end on

on n_cst_ui_imagelist.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

