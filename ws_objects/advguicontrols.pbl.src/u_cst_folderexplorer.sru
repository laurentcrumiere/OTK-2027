$PBExportHeader$u_cst_folderexplorer.sru
forward
global type u_cst_folderexplorer from treeview
end type
type imageinfo from structure within u_cst_folderexplorer
end type
end forward

type imageinfo from structure
	long		hbmimage
	long		hbmmask
	long		unused1
	long		unused2
	long		rcimage
end type

global type u_cst_folderexplorer from treeview
integer width = 1038
integer height = 1368
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
string picturename[] = {"AddWatch!"}
long picturemaskcolor = 536870912
long statepicturemaskcolor = 536870912
end type
global u_cst_folderexplorer u_cst_folderexplorer

type prototypes
Function long ImageList_Create(long cx, long cy, ulong flags, long cInitial, long cGrow) Library "comctl32.dll"
Function long ImageList_GetImageCount(long himl) Library "comctl32.dll"
Function long ImageList_Add(long himl, long hbmImage, long hbmMask) Library "comctl32.dll"
Function long ImageList_ReplaceIcon(long himl, long i, long hicon) Library "comctl32.dll"
Function long ImageList_AddMasked( long himl, long hbmImage, ulong crMask) Library "comctl32.dll"
Function long ImageList_GetIcon( long himl, long i, ulong flags) Library "comctl32.dll"
Function long ImageList_LoadImageA( long hInstance, String lpbmp, long cx, long cGrow, ulong crMask, ulong uType, ulong uFlags) Library "comctl32.dll" alias for "ImageList_LoadImageA;Ansi"
Function long ImageList_Merge(long himl1, long i1, long himl2, long i2, long dx, long dy) Library "comctl32.dll"
Function long ImageList_GetDragImage( Ref POINT ppt, Ref POINT pptHotspot) Library "comctl32.dll" alias for "ImageList_GetDragImage;Ansi"
Function ulong ImageList_SetBkColor(long himl, ulong clrBk) Library "comctl32.dll"
Function ulong ImageList_GetBkColor(long himl) Library "comctl32.dll"
Function boolean ImageList_Destroy(long himl) Library "comctl32.dll"
Function boolean ImageList_SetOverlayImage(long himl, long iImage, long iOverlay) Library "comctl32.dll"
Function boolean ImageList_Draw(long himl, long i, long hdcDst, long ax, long ay, ulong fStyle) Library "comctl32.dll"
Function boolean ImageList_Replace( long himl, long i, long hbmImage, long hbmMask) Library "comctl32.dll"
Function boolean ImageList_DrawEx( long himl, long i, long hdcDst, long ax, long ay, long dx, long dy, ulong rgbBk, ulong rgbFg, ulong fStyle) Library "comctl32.dll"
Function boolean ImageList_Remove( long himl, long i) Library "comctl32.dll"
Function boolean ImageList_BeginDrag( long himlTrack, long iTrack, long dxHotspot, long dyHotspot) Library "comctl32.dll"
Function boolean ImageList_EndDrag() Library "comctl32.dll"
Function boolean ImageList_DragEnter( long  hwndLock, long ax, long ay) Library "comctl32.dll"
Function boolean ImageList_DragLeave( long hwndLock) Library "comctl32.dll"
Function boolean ImageList_DragMove( long ax, long ay) Library "comctl32.dll"
Function boolean ImageList_SetDragCursorImage( long himlDrag, long iDrag, long dxHotspot, long dyHotspot) Library "comctl32.dll"
Function boolean ImageList_DragShowNolock( boolean fShow) Library "comctl32.dll"
Function boolean ImageList_GetIconSize(long himl, Ref long cx, Ref Long cy) Library "comctl32.dll"
Function boolean ImageList_SetIconSize(long himl, long cx, long cy) Library "comctl32.dll"
Function boolean ImageList_GetImageInfo(long himl, long i, Ref IMAGEINFO pImageInfo) Library "comctl32.dll" alias for "ImageList_GetImageInfo;Ansi"
Function long LoadLibraryA( String lpLibFileName ) Library "kernel32" alias for "LoadLibraryA;Ansi"
Function boolean FreeLibrary( long hLibModule ) Library "kernel32"
Function long LoadIconA( long hInstance, long IconID ) Library "user32" 

Function long ImageList_Read( long pstm) Library "comctl32.dll"

Function ulong ExtractIconEx( &
	string lpszFile, &
	long nIconIndex, &
	Ref long phIconLarge[], &
	Ref long phIconSmall[], &
	ulong nIcons &
	) Library "shell32.dll" Alias For "ExtractIconExW"

Function boolean DestroyIcon ( &
	long hIcon &
	) Library "user32.dll"
end prototypes

type variables
PUBLIC:
boolean DisplayFiles = TRUE

PRIVATE:
ULong il_root
ULong il_mycomputer

ULong hImageList
Long il_foldericon
Long il_folderopenicon
Long il_uknownfileicon

Constant Long TV_FIRST				= 4352 //  0x1100
Constant Long TVM_GETIMAGELIST	= (TV_FIRST + 8)
Constant Long TVM_SETIMAGELIST	= (TV_FIRST + 9)
Constant Long TVSIL_NORMAL			= 0

n_cst_win32 inv_win32
n_hashtable i_loadedicons

Constant Int PERSONAL = 2
Constant Int APPLICATION = 3
Constant Int FOLDER_CLOSED = 4
Constant Int FOLDER_OPEN = 5
Constant Int DRIVE_FLOPPY = 6
Constant Int DRIVE_STIFFY = 7
Constant Int DRIVE_TAPE = 8
Constant Int DRIVE_HDD = 9
Constant Int DRIVE_NETWORK = 10
Constant Int DRIVE_NETWORK_DISCONNECTED = 11
Constant Int DRIVE_CDROM = 12
Constant Int RAM = 13
Constant Int GLOBE = 14
Constant Int NETWORK = 15
Constant Int PC = 16
Constant Int PRINTER = 17
Constant Int NETWORK_PC = 18
Constant Int WORKGROUP = 19
Constant Int FOLDER_WITH_CONTENTS = 21
Constant Int SETTINGS = 22 
Constant Int FIND = 23
Constant Int HELP = 24
Constant Int SHARE = 29
Constant Int RECYCLE_BIN_EMPTY = 32
Constant Int RECYCLE_BIN_FULL = 33
Constant Int DESKTOP = 35
Constant Int WINDOWS = 40
Constant Int NETWARE_TREE = 42

n_uspb_resourcemanager inv_resourcemanager
end variables

forward prototypes
public function integer of_clear ()
public function integer of_load ()
private function integer of_loaditem (long handle)
private function integer of_loadmycomputer (unsignedlong al_handle, unsignedlong hinstance)
private function integer of_getfileicon (string as_file)
public function integer of_load (string as_initialdir)
public function string of_getpath (long handle)
end prototypes

public function integer of_clear ();RETURN THIS.DeleteItem ( il_root )
end function

public function integer of_load ();n_cst_pbus_filesys ln_fsys
TreeViewItem ltvi_item
String ls_drive[], ls_label[]
String ls_path, ls_name[]
Integer li_cnt, li_max, li_type[]
Long ll_parent, ll_root, ll_doc
DateTime ldt_write[]
Boolean lb_subdir[]
Double ld_size[]
ULong hInstance
ULong hIcon
ULong imageIndex
ULong imageIndex2
SetPointer(HourGlass!)

of_Clear()

hImageList = Send( Handle(THIS), TVM_GETIMAGELIST, TVSIL_NORMAL, 0 )
hInstance = inv_win32.LoadLibrary( "shell32.dll" )

hIcon = LoadIconA( hInstance, Long(1, 0) )
il_uknownfileicon = ImageList_ReplaceIcon( This.hImageList, -1, hicon) + 1

hIcon = LoadIconA( hInstance, Long(PC, 0) )
imageIndex = ImageList_ReplaceIcon( This.hImageList, -1, hicon)

// Insert My Computer
ltvi_item.Expanded = TRUE
ltvi_item.Data = ""
ltvi_item.Label = inv_resourcemanager.of_GetString("LBL_This_PC")
ltvi_item.PictureIndex = imageIndex + 1
ltvi_item.SelectedPictureIndex = imageIndex + 1
ll_parent = THIS.InsertItemLast(0, ltvi_item)

il_mycomputer = ll_parent
ll_root = ll_parent
il_root = ll_parent

hIcon = LoadIconA( hInstance, Long(DESKTOP, 0) )
imageIndex = ImageList_ReplaceIcon( This.hImageList, -1, hicon)

// Insert My Documents
ltvi_item.Expanded = FALSE
ltvi_item.Data = ln_fsys.of_GetFolderPath("DESKTOP")
ltvi_item.Label = inv_resourcemanager.of_GetString("LBL_Desktop")
ltvi_item.PictureIndex = imageIndex + 1
ltvi_item.SelectedPictureIndex = imageIndex + 1
ltvi_item.Children = ln_fsys.of_DirsExist(ltvi_item.Data, False)
THIS.InsertItemLast(il_mycomputer, ltvi_item)


hIcon = LoadIconA( hInstance, Long(PERSONAL, 0) )
imageIndex = ImageList_ReplaceIcon( This.hImageList, -1, hicon)

// Insert My Documents
ltvi_item.Expanded = FALSE
ltvi_item.Data = ln_fsys.of_GetFolderPath("PERSONAL")
ltvi_item.Label = inv_resourcemanager.of_GetString("LBL_My_Documents")
ltvi_item.PictureIndex = imageIndex + 1
ltvi_item.SelectedPictureIndex = imageIndex + 1
ltvi_item.Children = ln_fsys.of_DirsExist(ltvi_item.Data, False)
THIS.InsertItemLast(il_mycomputer, ltvi_item)

of_LoadMyComputer(il_mycomputer, hInstance)
	
hIcon = LoadIconA( hInstance, Long(FOLDER_CLOSED, 0) )
il_foldericon = ImageList_ReplaceIcon( This.hImageList, -1, hicon) + 1

hIcon = LoadIconA( hInstance, Long(FOLDER_OPEN, 0) )
il_folderopenicon = ImageList_ReplaceIcon( This.hImageList, -1, hicon) + 1

inv_win32.FreeLibrary( hInstance )

RETURN 1
end function

private function integer of_loaditem (long handle);n_cst_pbus_filesys ln_fsys
TreeViewItem ltvi_item
TreeViewItem ltvi_parent
String ls_path, ls_name[]
DateTime ldt_write[]
Boolean lb_subdir[]
Double ld_size[]
Integer li_cnt, li_max
Boolean ib_haschildren

THIS.GetItem(handle, ltvi_parent)
ls_path = ltvi_parent.Data


IF FileExists(ls_path) AND NOT DirectoryExists(ls_path) THEN
	
	//Launch File
ELSE

	li_max = ln_fsys.of_GetFiles(ls_path, False, ls_name, &
						ld_size, ldt_write, lb_subdir)
	
	For li_cnt = 1 To li_max
		If lb_subdir[li_cnt] Then
			// define the item
			ltvi_item.Expanded = False
			ltvi_item.ExpandedOnce = FALSE
			ltvi_item.Data = ls_path + "\" + ls_name[li_cnt]
			ltvi_item.Label = ls_name[li_cnt]
			ltvi_item.PictureIndex = il_foldericon
			ltvi_item.SelectedPictureIndex = il_folderopenicon
			ltvi_item.Selected = False
			ltvi_item.Children = ln_fsys.of_DirsExist(ltvi_item.Data, False) OR ln_fsys.of_FilesExist(ltvi_item.Data+'\*.*', False)
			// insert the item
			THIS.InsertItemLast(handle, ltvi_item)
			ib_haschildren = TRUE
		End if
	Next
	
	IF DisplayFiles THEN
		For li_cnt = 1 To li_max
			If NOT lb_subdir[li_cnt] Then
				IF Lower(Right(ls_name[li_cnt], 4)) <> '.lnk' THEN
					// define the item
					ltvi_item.Expanded = False
					ltvi_item.Data = ls_path + "\" + ls_name[li_cnt]
					ltvi_item.Label = ls_name[li_cnt]
					ltvi_item.PictureIndex = of_GetFileIcon(ltvi_item.Data)
					ltvi_item.SelectedPictureIndex = ltvi_item.PictureIndex
					ltvi_item.Selected = False
					ltvi_item.Children = ln_fsys.of_DirsExist(ltvi_item.Data, False)
					// insert the item
					THIS.InsertItemLast(handle, ltvi_item)
					ib_haschildren = TRUE
				END IF
			End if
		Next
	END IF
	
	IF NOT ib_haschildren THEN
		THIS.GetItem(handle, ltvi_item)
		ltvi_item.Children = FALSE
		THIS.SetItem(handle, ltvi_item)
	END IF
	
END IF


RETURN 1
end function

private function integer of_loadmycomputer (unsignedlong al_handle, unsignedlong hinstance);n_cst_pbus_filesys ln_fsys
TreeViewItem ltvi_item
String ls_drive[], ls_label[]
String ls_path, ls_name[]
Integer li_cnt, li_max, li_type[]
Long ll_parent, ll_root, ll_doc
DateTime ldt_write[]
Boolean lb_subdir[]
Double ld_size[]
Constant UInt DRIVE_UNKNOWN		= 0
Constant UInt DRIVE_NO_ROOT_DIR	= 1
Constant UInt DRIVE_REMOVABLE		= 2
Constant UInt DRIVE_FIXED			= 3
Constant UInt DRIVE_REMOTE			= 4
Constant UInt DRIVE_CDROM2			= 5
Constant UInt DRIVE_RAMDISK		= 6
Long ll_index

SetPointer(HourGlass!)


ll_parent = al_handle

li_max = ln_fsys.of_GetDrives(ls_drive, li_type, ls_label)

ULong hIcon
Long imageIndex

Long DRIVE_REMOVABLE_index
Long DRIVE_FIXED_index
Long DRIVE_REMOTE_index
Long DRIVE_CDROM_index
Long DRIVE_RAMDISK_index

hIcon = LoadIconA( hInstance, Long(DRIVE_TAPE, 0) )
DRIVE_REMOVABLE_index = ImageList_ReplaceIcon( This.hImageList, -1, hicon) + 1

hIcon = LoadIconA( hInstance, Long(DRIVE_HDD, 0) )
DRIVE_FIXED_index = ImageList_ReplaceIcon( This.hImageList, -1, hicon) + 1

hIcon = LoadIconA( hInstance, Long(DRIVE_TAPE, 0) )
DRIVE_REMOTE_index = ImageList_ReplaceIcon( This.hImageList, -1, hicon) + 1

hIcon = LoadIconA( hInstance, Long(DRIVE_CDROM, 0) )
DRIVE_CDROM_index = ImageList_ReplaceIcon( This.hImageList, -1, hicon) + 1

hIcon = LoadIconA( hInstance, Long(RAM, 0) )
DRIVE_RAMDISK_index = ImageList_ReplaceIcon( This.hImageList, -1, hicon) + 1

For li_cnt = 1 To li_max
	// define the item
	ltvi_item.Expanded = False
	ltvi_item.Data = ls_drive[li_cnt] + ":"
	ltvi_item.Label = ls_label[li_cnt] + " (" + ltvi_item.Data + ")"
	CHOOSE CASE li_type[li_cnt]
		CASE DRIVE_REMOVABLE
			ll_index = DRIVE_REMOVABLE_index
		CASE DRIVE_FIXED
			ll_index = DRIVE_FIXED_index
		CASE DRIVE_REMOTE
			ll_index = DRIVE_REMOTE_index
		CASE DRIVE_CDROM2
			ll_index = DRIVE_CDROM_index
		CASE DRIVE_RAMDISK
			ll_index =DRIVE_RAMDISK_index
	END CHOOSE
	ltvi_item.PictureIndex = ll_index
	ltvi_item.SelectedPictureIndex = ll_index
	IF Lower(ls_drive[li_cnt]) <> 'a' THEN
		IF li_type[li_cnt] = ln_fsys.DRIVE_CDROM OR &
		   li_type[li_cnt] = ln_fsys.DRIVE_REMOVABLE OR &
		   li_type[li_cnt] = ln_fsys.DRIVE_REMOTE OR &
		   li_type[li_cnt] = ln_fsys.DRIVE_RAMDISK THEN
			
			
			ltvi_item.Children = TRUE
		ELSE
			ltvi_item.Children = ln_fsys.of_DirsExist(ltvi_item.Data, False)
		END IF
	ELSE
		ltvi_item.Children = FALSE
	END IF
	// insert the item
	THIS.InsertItemLast(ll_parent, ltvi_item)
Next

RETURN 1
end function

private function integer of_getfileicon (string as_file);Long ll_index
string ls_extension
string ls_classname
string ls_icon
string ls_CLSID
string defaultIcon[]
Long ll_LargeIcons[], ll_SmallIcons[]
Long ll_rtn, imageIndex
Long ll_lastpos
n_cst_pbus_string lnv_string

as_file = Lower(as_file)

ll_lastpos = lnv_string.of_LastPos(as_file, ".")
ls_extension = Right(as_file, Len(as_file) - ll_lastpos + 1)

IF Len(Trim(ls_extension)) = 0 THEN
	RETURN il_uknownfileicon
END IF

IF ls_extension <> ".exe" THEN

	IF i_loadedicons.KeyExists(ls_extension) THEN
		RETURN i_loadedicons.Get(ls_extension)
	END IF
			
	RegistryGet("HKEY_CLASSES_ROOT\" + ls_extension, "", RegString!, ls_classname)
	RegistryGet("HKEY_CLASSES_ROOT\" + ls_classname + "\DefaultIcon", "", RegString!, ls_icon)
	
	IF Len(Trim(ls_icon)) = 0 THEN
		RegistryGet("HKEY_CLASSES_ROOT\" + ls_classname + "\DefaultIcon", "", RegExpandString!, ls_icon)
	END IF
	
	IF Len(Trim(ls_icon)) = 0 THEN
		RegistryGet("HKEY_CLASSES_ROOT\" + ls_classname + "\CLSID", "", RegString!, ls_CLSID)
		RegistryGet("HKEY_CLASSES_ROOT\CLSID\" + ls_CLSID + "\DefaultIcon", "", RegExpandString!, ls_icon)
	END IF
	
	IF Len(Trim(ls_icon)) = 0 THEN
		RegistryGet("HKEY_CLASSES_ROOT\Wow6432Node\CLSID\" + ls_CLSID + "\DefaultIcon", "", RegString!, ls_icon)
	END IF
	
	lnv_string.of_ParseToArray(ls_icon, ",", defaultIcon)
	
	IF UpperBound(defaultIcon) > 1 THEN
	
		defaultIcon[1] = lnv_string.of_GlobalReplace(defaultIcon[1], '"', "")
	
		ll_rtn = ExtractIconEx(defaultIcon[1], Long(defaultIcon[2]), &
							ll_LargeIcons, ll_SmallIcons, 1)
		IF ll_rtn > 0 THEN
			imageIndex = ImageList_ReplaceIcon( THIS.hImageList, -1, ll_SmallIcons[1]) + 1
			
			i_loadedicons.Put(ls_extension, imageIndex)
			
			DestroyIcon(ll_LargeIcons[1])
			DestroyIcon(ll_SmallIcons[1])
			
			RETURN imageIndex
		ELSE
			Return il_uknownfileicon
		END IF
	
	END IF
ELSE
	ll_rtn = ExtractIconEx(as_file, 0, ll_LargeIcons, ll_SmallIcons, 1)
	IF ll_rtn > 0 THEN
		imageIndex = ImageList_ReplaceIcon( THIS.hImageList, -1, ll_SmallIcons[1]) + 1
		
		DestroyIcon(ll_LargeIcons[1])
		DestroyIcon(ll_SmallIcons[1])
		
		RETURN imageIndex
	ELSE
		Return il_uknownfileicon
	END IF
	
END IF

RETURN il_uknownfileicon
end function

public function integer of_load (string as_initialdir);n_cst_pbus_filesys ln_fsys
TreeViewItem ltvi_item
String ls_path, ls_name[]
DateTime ldt_write[]
Boolean lb_subdir[]
Double ld_size[]
Integer li_cnt, li_max
Long handle
Long ll_lastpos
n_cst_pbus_string lnv_string
of_Clear()

IF DirectoryExists(as_initialdir) THEN	
	
	string ls_dirname
	
	ll_lastpos = lnv_string.of_LastPos(as_initialdir, "\")
	ls_dirname = Right(as_initialdir, Len(as_initialdir) - ll_lastpos)
	
	ltvi_item.Expanded = TRUE
	ltvi_item.ExpandedOnce = FALSE
	ltvi_item.Data = as_initialdir
	ltvi_item.Label = ls_dirname
	ltvi_item.PictureIndex = il_foldericon
	ltvi_item.SelectedPictureIndex = il_folderopenicon
	ltvi_item.Selected = False
	ltvi_item.Children = ln_fsys.of_DirsExist(ltvi_item.Data, False) OR ln_fsys.of_FilesExist(ltvi_item.Data+'\*.*', False)
	// insert the item
	handle = THIS.InsertItemLast(0, ltvi_item)


	RETURN of_LoadItem(handle)
	
END IF

RETURN 0
end function

public function string of_getpath (long handle);TreeViewItem ltvi_parent

THIS.GetItem(handle, ltvi_parent)
RETURN ltvi_parent.Data
end function

on u_cst_folderexplorer.create
end on

on u_cst_folderexplorer.destroy
end on

event constructor;inv_win32 = CREATE n_cst_win32
of_load()
end event

event itemexpanding;n_cst_pbus_filesys ln_fsys
TreeViewItem ltvi_item
String ls_path, ls_name[]
DateTime ldt_write[]
Boolean lb_subdir[]
Double ld_size[]
Integer li_cnt, li_max

this.GetItem(handle, ltvi_item)
ls_path = ltvi_item.Data

IF ltvi_item.ExpandedOnce THEN RETURN

of_LoadItem(handle)
end event

event destructor;DESTROY inv_win32
end event

