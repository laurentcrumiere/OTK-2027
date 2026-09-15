$PBExportHeader$nca_dragdrop.sru
$PBExportComments$Drag Drop Component V1.0
forward
global type nca_dragdrop from nonvisualobject
end type
end forward

global type nca_dragdrop from nonvisualobject autoinstantiate
end type

type prototypes
// WIN 32 API Calls Required for drag and drop
subroutine DragAcceptFiles( long l_hWnd, boolean b_Accept ) library 'shell32'
subroutine DragFinish( long l_hWnd ) library 'shell32'
function int DragQueryFile( long l_hDrop, int i_File, ref string s_FileName, int i_cb ) library 'shell32' alias for "DragQueryFile;Ansi"

end prototypes

type variables
Private:
WindowObject	iwo_Objects[]
Boolean		ib_DragEnabled[]
Long		il_Count
String		is_Filter
Integer		ii_FilterLen
end variables

forward prototypes
public function integer begindragdrop (windowobject awo_windowobject)
public function integer getdragdrop (unsignedlong aul_hdrop, ref string as_filenames[])
public subroutine enddragdrop (windowobject awo_object)
public function integer populate (unsignedlong aul_hdrop, singlelineedit asle_sle)
public function integer populate (unsignedlong aul_hdrop, listbox alb_listbox)
public function integer populate (unsignedlong aul_hdrop, datawindow adw_dw, string as_column)
public function integer filterfiletype (string as_filetype)
public function integer begindragdropwindow (window awo_window)
end prototypes

public function integer begindragdrop (windowobject awo_windowobject);
/********************************************************************
	BeginDragDrop
	
	<DESC>	Register a control to be drag drop enabled.</DESC>
	
	<RETURN>	Integer
				1, Control Registered
				-1, Registration Failed

	<ACCESS>	Public

	<ARGS>	awo_WindowObject, Object to be registered</ARGS>
	
********************************************************************/
Boolean lb_Found
Long ll_I

// Check to see if the control is already registed with this service
FOR ll_I = 1 TO il_Count
	IF iwo_Objects[ ll_I ] = awo_windowobject THEN
		IF ib_DragEnabled[ ll_I ] THEN
			DragFinish( Handle( awo_WindowObject ) )
			lb_Found = TRUE
			EXIT
		END IF
	END IF
NEXT

DragAcceptFiles( Handle( awo_WindowObject ), TRUE )
IF NOT lb_Found THEN
	il_Count ++
	ll_I = il_Count
END IF

// Register the control
ib_DragEnabled[ ll_I ] = TRUE
iwo_Objects[ ll_I ] = awo_WindowObject

RETURN 1
end function

public function integer getdragdrop (unsignedlong aul_hdrop, ref string as_filenames[]);
/********************************************************************
	GetDragDrop
	
	<DESC>	Get a list of all the files that where dragged and
				dropped on the given controls.</DESC>
	
	<RETURN>	integer, Number of Files Dropped

	<ACCESS>	Public

	<ARGS>	aul_hdrop, Handle of the Dropped Object
				as_filenames[], Array To receive the Filenames</ARGS>
	
********************************************************************/
String ls_FileName
Integer li_I, li_Files, li_J

ls_FileName = Space( 255 )

li_Files = DragQueryFile( aul_hDrop, -1, ls_FileName, 255 )
FOR li_I = 1 TO li_Files
	ls_FileName = Space( 255 )
	DragQueryFile( aul_hDrop, li_I - 1, ls_FileName, 255 )
	IF is_Filter <> '' THEN
		IF Right( ls_FileName, ii_FilterLen ) = is_Filter THEN
			li_J ++
			as_FileNames[ li_J ] = ls_FileName
		END IF
	ELSE
		li_J ++
		as_FileNames[ li_J ] = ls_FileName
	END IF
NEXT

RETURN li_J

end function

public subroutine enddragdrop (windowobject awo_object);
/********************************************************************
	EndDragDrop
	
	<DESC>	Unregister a control from DragDrop.</DESC>
	
	<RETURN>	(none)

	<ACCESS>	Public

	<ARGS>	awo_Object, Control to unregister</ARGS>
	
********************************************************************/
Long ll_I

FOR ll_I = 1 TO il_Count
	IF ib_DragEnabled[ ll_I ] THEN
		IF iwo_Objects[ ll_I ] = awo_Object THEN
			DragFinish( Handle( iwo_Objects[ ll_I ] ) )
			ib_DragEnabled[ ll_I ] = FALSE
		END IF
	END IF
NEXT

end subroutine

public function integer populate (unsignedlong aul_hdrop, singlelineedit asle_sle);
/********************************************************************
	Populate
	
	<DESC>	Populate a SingleLineEdit with the first dropped
				filename.</DESC>
	
	<RETURN>	1, SingleLineEdit Populated

	<ACCESS>	Public

	<ARGS>	aul_hdrop, handle of dropped control
				asle_sle, SingleLineEdit to populate</ARGS>
	
********************************************************************/
Integer li_Files
String ls_FileNames[]

li_Files = this.GetDragDrop( aul_hDrop, ls_FileNames )
asle_SLE.Text = ls_FileNames[ 1 ]

RETURN 1

end function

public function integer populate (unsignedlong aul_hdrop, listbox alb_listbox);
/********************************************************************
	Populate
	
	<DESC>	Populate a Listbox with the dropped filenames.</DESC>
	
	<RETURN>	1, ListBox Populated

	<ACCESS>	Public

	<ARGS>	aul_hdrop, handle of dropped control
				alb_listbox, ListBox to populate</ARGS>
	
********************************************************************/
Integer li_Files, li_I
String ls_FileNames[]

li_Files = this.GetDragDrop( aul_hDrop, ls_FileNames )
FOR li_I = 1 TO li_Files

	
	// pour avoir le chemin complet !
	//alb_ListBox.AddItem( ls_FileNames[ li_I ] )
	
	alb_ListBox.AddItem( gfx_extraire_nom_fichier( ls_FileNames[ li_I ] ))
NEXT

RETURN 1

end function

public function integer populate (unsignedlong aul_hdrop, datawindow adw_dw, string as_column);
/********************************************************************
	Populate
	
	<DESC>	Populate a Datawindow with the dropped filenames.</DESC>
	
	<RETURN>	1, Datawindow Populated

	<ACCESS>	Public

	<ARGS>	aul_hdrop, handle of dropped control
				adw_dw, datawindow to populate
				as_column, column to populate in the datawindow</ARGS>
	
********************************************************************/
Integer li_Files, li_I, ll_Row
String ls_FileNames[]

li_Files = this.GetDragDrop( aul_hDrop, ls_FileNames )
FOR li_I = 1 TO li_Files
	ll_Row = adw_DW.InsertRow( 0 )
	adw_DW.SetItem( ll_Row, as_Column, ls_FileNames[ li_I ] )
NEXT

RETURN 1

end function

public function integer filterfiletype (string as_filetype);
/********************************************************************
	FilterFileType
	
	<DESC>	Filter all droped files by a given file type such as
				pbl or exe.</DESC>
	
	<RETURN>	1, Filter Set, -1 Filter Invalid

	<ACCESS>	Public

	<ARGS>	as_filetype, Filter File Type</ARGS>
	
********************************************************************/

IF Len( as_FileType ) > 3 THEN RETURN -1

is_Filter = as_FileType
ii_FilterLen = Len( is_filter )

RETURN 1

end function

public function integer begindragdropwindow (window awo_window);
/********************************************************************
	BeginDragDrop
	
	<DESC>	Register a control to be drag drop enabled.</DESC>
	
	<RETURN>	Integer
				1, Control Registered
				-1, Registration Failed

	<ACCESS>	Public

	<ARGS>	awo_WindowObject, Object to be registered</ARGS>
	
********************************************************************/

DragAcceptFiles(handle(awo_window), true)

RETURN 1
end function

on nca_dragdrop.create
call super::create
TriggerEvent( this, "constructor" )
end on

on nca_dragdrop.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

event destructor;// <DESC>Clean up any outstanding valid registered controls.</DESC>
Long ll_I

FOR ll_I = 1 TO il_Count
	IF IsValid( iwo_Objects[ ll_I ] ) THEN
		EndDragDrop( iwo_Objects[ ll_I ] )
	END IF
NEXT


end event

event constructor;
/********************************************************************
	nca_dragdrop: File Drag and Drop Service

	<OBJECT>	This object is designed to enabled controls to have
				lists of files dragged from an explorer or file manager
				program and dropped on the control. Depending on the
				control type the filenames are added to the control.

				This object is designed to handle multiple controls
				at the same time. You can register multiple controls
				on the same window with the service.

				In the open event of your window call BeginDragDrop
				passing in the control you want to be Drag Drop enabled.

				On your controls define a user event 'dropfiles' which
				is mapped to the pbm_dropfiles event. In the 'dropfiles'
				event call the Populate method to have your control
				automatically populated.

				The Filter function allows you to filter certain file
				types such as pbr, dll, txt, exe files.</OBJECT>
	<DESC>	No processing</DESC>

	  Date	Ref	Author			Comments
	09/25/97			Ken Howe			First Version
********************************************************************/

end event

