$PBExportHeader$n_filesys.sru
forward
global type n_filesys from nonvisualobject
end type
type filetime from structure within n_filesys
end type
type win32_find_data from structure within n_filesys
end type
type systemtime from structure within n_filesys
end type
type shfileopstruct from structure within n_filesys
end type
end forward

type filetime from structure
	unsignedlong		dwlowdatetime
	unsignedlong		dwhighdatetime
end type

type win32_find_data from structure
	unsignedlong		dwfileattributes
	filetime		ftcreationtime
	filetime		ftlastaccesstime
	filetime		ftlastwritetime
	unsignedlong		nfilesizehigh
	unsignedlong		nfilesizelow
	unsignedlong		dwreserved0
	unsignedlong		dwreserved1
	character		cfilename[260]
	character		calternatefilename[14]
end type

type systemtime from structure
	unsignedinteger		wyear
	unsignedinteger		wmonth
	unsignedinteger		wdayofweek
	unsignedinteger		wday
	unsignedinteger		whour
	unsignedinteger		wminute
	unsignedinteger		wsecond
	unsignedinteger		wmilliseconds
end type

type shfileopstruct from structure
	longptr		hwnd
	unsignedlong		wfunc
	longptr		pfrom
	string		pto
	unsignedinteger		fflags
	boolean		banyoperationsaborted
	longptr		hnamemappings
	string		lpszprogresstitle
end type

global type n_filesys from nonvisualobject autoinstantiate
end type

type prototypes
Function ulong GetLogicalDrives ( &
	) Library "kernel32.dll" Alias For "GetLogicalDrives"

Function ulong GetDriveType ( &
	string lpRootPathName &
	) Library "kernel32.dll" Alias For "GetDriveTypeW"

Function ulong WNetGetConnection ( &
	string lpLocalName, &
	Ref string lpRemoteName, &
	Ref ulong lpnLength &
	) Library "mpr.dll" Alias For "WNetGetConnectionW"

Function ulong GetVolumeInformation( &
	string lpRootPathName, &
   Ref string lpVolumeNameBuffer, &
	ulong nVolumeNameSize, &
	Ref string lpVolumeSerialNumber, &
   Ref ulong lpMaximumComponentLength, &
	Ref ulong lpFileSystemFlags, &
	Ref string lpFileSystemNameBuffer, &
   ulong nFileSystemNameSize &
	) Library "kernel32.dll" Alias For "GetVolumeInformationW"

Function long FindFirstFile ( &
	string lpFileName, &
	Ref win32_find_data lpFindFileData &
	) Library "kernel32.dll" Alias For "FindFirstFileW"

Function boolean FindNextFile ( &
	long hFindFile, &
	Ref win32_find_data lpFindFileData &
	) Library "kernel32.dll" Alias For "FindNextFileW"

Function boolean FindClose ( &
	long hFindFile &
	) Library "kernel32.dll" Alias For "FindClose"

Function boolean FileTimeToLocalFileTime ( &
	Ref filetime lpFileTime, &
	Ref filetime lpLocalFileTime &
	) Library "kernel32.dll" Alias For "FileTimeToLocalFileTime"

Function boolean FileTimeToSystemTime ( &
	Ref filetime lpFileTime, &
	Ref systemtime lpSystemTime &
	) Library "kernel32.dll" Alias For "FileTimeToSystemTime"

Function boolean GetDiskFreeSpaceEx ( &
	string lpDirectoryName, &
	Ref longlong lpFreeBytesAvailable, &
	Ref longlong lpTotalNumberOfBytes, &
	Ref longlong lpTotalNumberOfFreeBytes &
	) Library "kernel32.dll" Alias For "GetDiskFreeSpaceExW"

Function ulong GetTempPath ( &
	ulong nBufferLength, &
	Ref string lpBuffer &
	) Library "kernel32.dll" Alias For "GetTempPathW"

Function boolean SetFileAttributes ( &
	string lpFileName, &
	ulong dwFileAttributes &
	) Library "kernel32.dll" Alias For "SetFileAttributesW"

Function long SHGetFolderPath ( &
	long hwnd, &
	ulong csidl, &
	long hToken, &
	ulong dwFlags, &
	Ref string pszPath &
	) Library "shell32.dll" Alias For "SHGetFolderPathW"

Function ulong SHFileOperation ( &
	shfileopstruct lpFileOp &
	) Library "SHELL32.DLL" Alias For "SHFileOperationW" progma_pack(1)

Function long RtlMoveMemory ( &
	long Destination, &
	Ref char Source[], &
	long Size &
	) Library "kernel32.dll" Alias For "RtlMoveMemory"

Function long LocalAlloc ( &
	ulong uFlags, &
	long uBytes &
	) Library "kernel32.dll"

Function long LocalFree ( &
	long hMem &
	) Library "kernel32.dll"

Function boolean SystemTimeToFileTime ( &
	SYSTEMTIME lpSystemTime, &
	Ref FILETIME lpFileTime &
	) Library "kernel32.dll"

Function boolean LocalFileTimeToFileTime ( &
	FILETIME lpLocalFileTime, &
	Ref FILETIME lpFileTime &
	) Library "kernel32.dll"

Function boolean SetFileTime ( &
	longptr hFile, &
	FILETIME lpCreationTime, &
	FILETIME lpLastAccessTime, &
	FILETIME lpLastWriteTime &
	) Library "kernel32.dll"

Function longptr CreateFile ( &
	string lpFileName, &
	ulong dwDesiredAccess, &
	ulong dwShareMode, &
	longptr lpSecurityAttributes, &
	ulong dwCreationDisposition, &
	ulong dwFlagsAndAttributes, &
	longptr hTemplateFile &
	) Library "kernel32.dll" Alias For "CreateFileW"

Function boolean CloseHandle ( &
	longptr hObject &
	) Library "kernel32.dll"

end prototypes

type variables
// Constants for of_GetDrives
Constant ULong DRIVE_UNKNOWN		= 0
Constant ULong DRIVE_NO_ROOT_DIR	= 1
Constant ULong DRIVE_REMOVABLE	= 2
Constant ULong DRIVE_FIXED			= 3
Constant ULong DRIVE_REMOTE		= 4
Constant ULong DRIVE_CDROM			= 5
Constant ULong DRIVE_RAMDISK		= 6

// Constants for SHGetFolderPath
Constant Long CSIDL_DESKTOP					= 0
Constant Long CSIDL_INTERNET					= 1
Constant Long CSIDL_PROGRAMS					= 2
Constant Long CSIDL_CONTROLS					= 3
Constant Long CSIDL_PRINTERS					= 4
Constant Long CSIDL_PERSONAL					= 5
Constant Long CSIDL_FAVORITES					= 6
Constant Long CSIDL_STARTUP					= 7
Constant Long CSIDL_RECENT						= 8
Constant Long CSIDL_SENDTO						= 9
Constant Long CSIDL_BITBUCKET					= 10
Constant Long CSIDL_STARTMENU					= 11
Constant Long CSIDL_MYDOCUMENTS				= CSIDL_PERSONAL
Constant Long CSIDL_MYMUSIC					= 13
Constant Long CSIDL_MYVIDEO					= 14
Constant Long CSIDL_DESKTOPDIRECTORY		= 16
Constant Long CSIDL_DRIVES						= 17
Constant Long CSIDL_NETWORK					= 18
Constant Long CSIDL_NETHOOD					= 19
Constant Long CSIDL_FONTS						= 20
Constant Long CSIDL_TEMPLATES					= 21
Constant Long CSIDL_COMMON_STARTMENU		= 22
Constant Long CSIDL_COMMON_PROGRAMS			= 23
Constant Long CSIDL_COMMON_STARTUP			= 24
Constant Long CSIDL_COMMON_DESKTOPDIRECTORY	= 25
Constant Long CSIDL_APPDATA					= 26
Constant Long CSIDL_PRINTHOOD					= 27
Constant Long CSIDL_LOCAL_APPDATA			= 28
Constant Long CSIDL_ALTSTARTUP				= 29
Constant Long CSIDL_COMMON_ALTSTARTUP		= 30
Constant Long CSIDL_COMMON_FAVORITES		= 31
Constant Long CSIDL_INTERNET_CACHE			= 32
Constant Long CSIDL_COOKIES					= 33
Constant Long CSIDL_HISTORY					= 34
Constant Long CSIDL_COMMON_APPDATA			= 35
Constant Long CSIDL_WINDOWS					= 36
Constant Long CSIDL_SYSTEM						= 37
Constant Long CSIDL_PROGRAM_FILES			= 38
Constant Long CSIDL_MYPICTURES				= 39
Constant Long CSIDL_PROFILE					= 40
Constant Long CSIDL_SYSTEMX86					= 41
Constant Long CSIDL_PROGRAM_FILESX86		= 42
Constant Long CSIDL_PROGRAM_FILES_COMMON	= 43
Constant Long CSIDL_PROGRAM_FILES_COMMONX86	= 44
Constant Long CSIDL_COMMON_TEMPLATES		= 45
Constant Long CSIDL_COMMON_DOCUMENTS		= 46
Constant Long CSIDL_COMMON_ADMINTOOLS		= 47
Constant Long CSIDL_ADMINTOOLS				= 48
Constant Long CSIDL_CONNECTIONS				= 49
Constant Long CSIDL_COMMON_MUSIC				= 53
Constant Long CSIDL_COMMON_PICTURES			= 54
Constant Long CSIDL_COMMON_VIDEO				= 55
Constant Long CSIDL_RESOURCES					= 56
Constant Long CSIDL_RESOURCES_LOCALIZED	= 57
Constant Long CSIDL_COMMON_OEM_LINKS		= 58
Constant Long CSIDL_CDBURN_AREA				= 59

// File operation types
Constant ULong FO_MOVE = 1
Constant ULong FO_COPY = 2
Constant ULong FO_DELETE = 3
Constant ULong FO_RENAME = 4

// File operation flags
Constant ULong FOF_MULTIDESTFILES 		= 1
Constant ULong FOF_CONFIRMMOUSE 			= 2
Constant ULong FOF_SILENT					= 4
Constant ULong FOF_RENAMEONCOLLISION	= 8
Constant ULong FOF_NOCONFIRMATION 		= 16
Constant ULong FOF_WANTMAPPINGHANDLE	= 32
Constant ULong FOF_ALLOWUNDO 				= 64
Constant ULong FOF_FILESONLY 				= 128
Constant ULong FOF_SIMPLEPROGRESS		= 256
Constant ULong FOF_NOCONFIRMMKDIR 		= 512
Constant ULong FOF_NOERRORUI				= 1024
Constant ULong FOF_NOCOPYSECURITYATTRIBS = 2048

// Constants for CreateFile
Constant ULong INVALID_HANDLE_VALUE		= -1
Constant ULong GENERIC_READ				= 2147483648
Constant ULong GENERIC_WRITE				= 1073741824
Constant ULong FILE_ATTRIBUTE_NORMAL	= 128
Constant ULong FILE_SHARE_READ			= 1
Constant ULong FILE_SHARE_WRITE			= 2
Constant ULong CREATE_NEW					= 1
Constant ULong CREATE_ALWAYS				= 2
Constant ULong OPEN_EXISTING				= 3
Constant ULong OPEN_ALWAYS					= 4
Constant ULong TRUNCATE_EXISTING			= 5

end variables

forward prototypes
public function string of_getvolumelabel (string as_drive)
public function boolean of_checkbit (long al_number, unsignedinteger ai_bit)
public function string of_wnetgetconnection (string as_drive)
public function integer of_getfileattributes (string as_filename, ref boolean ab_readonly, ref boolean ab_hidden, ref boolean ab_system, ref boolean ab_subdir, ref boolean ab_archive)
public function boolean of_dirsexist (string as_filespec, boolean ab_hidden)
public function boolean of_filesexist (string as_filespec, boolean ab_hidden)
public function integer of_getfiles (string as_filespec, boolean ab_hidden, ref string as_name[], ref double ad_size[], ref datetime adt_writedate[], ref boolean ab_subdir[])
public function string of_gettemppath ()
public function unsignedlong of_setfileattributes (string as_filename, boolean ab_readonly, boolean ab_hidden, boolean ab_system, boolean ab_archive)
private function unsignedlong of_calcfileattributes (string as_filename, boolean ab_readonly, boolean ab_hidden, boolean ab_system, boolean ab_archive)
public function string of_getfiledescription (string as_filename)
public function integer of_getfiles (string as_filespec, ref string as_name[], ref boolean ab_subdir[])
public function datetime of_filedatetimetopb (filetime astr_filetime, boolean ab_msecs)
public function datetime of_filedatetimetopb_utc (filetime astr_filetime, boolean ab_msecs)
public function string of_getfolderpath (long al_csidl)
public function datetime of_getlastwritetime (string as_filename)
private function long of_makechar (string as_strings[], ref character ac_char[])
public function boolean of_shellcopyfiles (long al_window, string as_source[], string as_target)
public subroutine of_getdiskfreespace (string as_drive, ref longlong all_size, ref longlong all_used, ref longlong all_free)
public function unsignedlong of_getdrivetype (string as_drive)
public function integer of_getdrives (ref string as_drive[], ref unsignedlong aul_type[], ref string as_label[])
public function integer of_pbdatetimetofile (datetime adt_filetime, ref filetime astr_filetime)
public function integer of_setfiletime (string as_filename, datetime adt_createtime, datetime adt_accesstime, datetime adt_writetime)
end prototypes

public function string of_getvolumelabel (string as_drive);// -----------------------------------------------------------------------------
// SCRIPT:     n_filesys.of_GetVolumeLabel
//
// PURPOSE:    This function returns the volume label for local files.
//
// ARGUMENTS:  as_drive	- Drive letter
//
// RETURN:		Volume label
//
// DATE        PROG/ID		DESCRIPTION OF CHANGE / REASON
// ----------  --------		-----------------------------------------------------
// 04/22/2005	RolandS		Initial Coding
// -----------------------------------------------------------------------------

String ls_path, ls_label
String ls_serial, ls_sysname
ULong lul_rtncode, lul_size, lul_complen, lul_flags

ls_path = as_drive + ":\"

lul_size = 260
ls_label   = Space(lul_size)
ls_serial  = Space(lul_size)
ls_sysname = Space(lul_size)

lul_rtncode = GetVolumeInformation(ls_path, &
		ls_label, lul_size, ls_serial, &
		lul_complen, lul_flags, ls_sysname, lul_size)

Return Trim(ls_label)

end function

public function boolean of_checkbit (long al_number, unsignedinteger ai_bit);// -----------------------------------------------------------------------------
// SCRIPT:     n_filesys.of_Checkbit
//
// PURPOSE:    This function determines if a certain bit is on or off within
//					the number.
//
// ARGUMENTS:  al_number	- Number to check bits
//             ai_bit		- Bit number ( starting at 1 )
//
// RETURN:		True = On, False = Off
//
// DATE        PROG/ID		DESCRIPTION OF CHANGE / REASON
// ----------  --------		-----------------------------------------------------
// 04/22/2005	RolandS		Initial Coding
// -----------------------------------------------------------------------------

If Int(Mod(al_number / (2 ^(ai_bit - 1)), 2)) > 0 Then
	Return True
End If

Return False

end function

public function string of_wnetgetconnection (string as_drive);// -----------------------------------------------------------------------------
// SCRIPT:     n_filesys.of_WNetGetConnection
//
// PURPOSE:    This function retrieves the name of the network resource
//					associated with a local device.
//
// ARGUMENTS:  as_drive	- Drive letter
//
// RETURN:		Network path
//
// DATE        PROG/ID		DESCRIPTION OF CHANGE / REASON
// ----------  --------		-----------------------------------------------------
// 04/22/2005	RolandS		Initial Coding
// -----------------------------------------------------------------------------

CONSTANT ulong NO_ERROR = 0
String ls_connection, ls_drive, ls_msg
ULong lul_result, lul_buflen

lul_buflen = 260
ls_connection = Space(lul_buflen)
ls_drive = Upper(Left(as_drive,1)) + ":"

lul_result = WNetGetConnection(ls_drive, ls_connection, lul_buflen)

Return Trim(ls_connection)

end function

public function integer of_getfileattributes (string as_filename, ref boolean ab_readonly, ref boolean ab_hidden, ref boolean ab_system, ref boolean ab_subdir, ref boolean ab_archive);// -----------------------------------------------------------------------------
// SCRIPT:     n_filesys.of_GetFileAttributes
//
// PURPOSE:    This function returns attributes of the specified file.
//
// ARGUMENTS:  as_filename	- Name of the file
//             ab_readonly	- Read Only attribute (By Ref)
//             ab_hidden	- Hidden attribute (By Ref)
//             ab_system	- System attribute (By Ref)
//             ab_subdir	- Subdirectory attribute (By Ref)
//             ab_archive	- Archive attribute (By Ref)
//
// RETURN:		1 = Success, -1 = Error
//
// DATE        PROG/ID		DESCRIPTION OF CHANGE / REASON
// ----------  --------		-----------------------------------------------------
// 04/22/2005	RolandS		Initial Coding
// -----------------------------------------------------------------------------

Long ll_Handle
win32_find_data lstr_fd

// Find the file
ll_Handle = FindFirstFile(as_filename, lstr_fd)
If ll_Handle <= 0 Then Return -1
FindClose(ll_Handle)

// Return file attributes in by reference arguments
ab_ReadOnly = this.of_checkbit(lstr_fd.dwFileAttributes, 1)
ab_Hidden   = this.of_checkbit(lstr_fd.dwFileAttributes, 2)
ab_System   = this.of_checkbit(lstr_fd.dwFileAttributes, 3)
ab_SubDir   = this.of_checkbit(lstr_fd.dwFileAttributes, 5)
ab_Archive  = this.of_checkbit(lstr_fd.dwFileAttributes, 6)

Return 1

end function

public function boolean of_dirsexist (string as_filespec, boolean ab_hidden);// -----------------------------------------------------------------------------
// SCRIPT:     n_filesys.of_DirsExist
//
// PURPOSE:    This function determines if any directories exist with the
//					passed path.
//
// ARGUMENTS:  as_filespec	- File path
//             ab_hidden	- Whether hidden/system directories are reported
//
// RETURN:		True = Directories found, False = Directories not found
//
// DATE        PROG/ID		DESCRIPTION OF CHANGE / REASON
// ----------  --------		-----------------------------------------------------
// 04/22/2005	RolandS		Initial Coding
// -----------------------------------------------------------------------------

Long ll_Handle
Boolean lb_found, lb_subdir, lb_hidden, lb_system
String ls_filename
win32_find_data lstr_fd

// append filename pattern
If Right(as_filespec, 1) = "\" Then
	as_filespec += "*.*"
Else
	as_filespec += "\*.*"
End If

// find first file
ll_Handle = FindFirstFile(as_filespec, lstr_fd)
If ll_Handle < 1 Then Return False

// loop through each file
Do
	// add file to array
	ls_filename = String(lstr_fd.cFilename)
	If ls_filename = "." Or ls_filename = ".." Then
	Else
		lb_subdir = of_checkbit(lstr_fd.dwFileAttributes, 5)
		If lb_subdir Then
			// check for hidden/system attributes
			lb_hidden = of_checkbit(lstr_fd.dwFileAttributes, 2)
			lb_system = of_checkbit(lstr_fd.dwFileAttributes, 3)
			If ( lb_hidden Or lb_system ) And &
				( ab_hidden = False ) Then
			Else
				// close find handle
				FindClose(ll_Handle)
				Return True
			End If
		End If
	End If
	// find next file
	lb_Found = FindNextFile(ll_Handle, lstr_fd)
Loop Until Not lb_Found

// close find handle
FindClose(ll_Handle)

Return False

end function

public function boolean of_filesexist (string as_filespec, boolean ab_hidden);// -----------------------------------------------------------------------------
// SCRIPT:     n_filesys.of_FilesExist
//
// PURPOSE:    This function determines if any files exist with the
//					passed path.
//
// ARGUMENTS:  as_filespec	- File path
//             ab_hidden	- Whether hidden/system files are reported
//
// RETURN:		True = Files found, False = Files not found
//
// DATE        PROG/ID		DESCRIPTION OF CHANGE / REASON
// ----------  --------		-----------------------------------------------------
// 04/22/2005	RolandS		Initial Coding
// -----------------------------------------------------------------------------

Long ll_Handle
Boolean lb_found, lb_hidden, lb_system
String ls_filename
win32_find_data lstr_fd

// append filename pattern
If Right(as_filespec, 1) = "\" Then
	as_filespec += "*.*"
Else
	as_filespec += "\*.*"
End If

// find first file
ll_Handle = FindFirstFile(as_filespec, lstr_fd)
If ll_Handle < 1 Then Return False

// loop through each file
Do
	// add file to array
	ls_filename = String(lstr_fd.cFilename)
	If ls_filename = "." Or ls_filename = ".." Then
	Else
		// check for hidden/system attributes
		lb_hidden = of_checkbit(lstr_fd.dwFileAttributes, 2)
		lb_system = of_checkbit(lstr_fd.dwFileAttributes, 3)
		If ( lb_hidden Or lb_system ) And &
			( ab_hidden = False ) Then
		Else
			// close find handle
			FindClose(ll_Handle)
			Return True
		End If
	End If
	// find next file
	lb_Found = FindNextFile(ll_Handle, lstr_fd)
Loop Until Not lb_Found

// close find handle
FindClose(ll_Handle)

Return False

end function

public function integer of_getfiles (string as_filespec, boolean ab_hidden, ref string as_name[], ref double ad_size[], ref datetime adt_writedate[], ref boolean ab_subdir[]);// -----------------------------------------------------------------------------
// SCRIPT:     n_filesys.of_GetFiles
//
// PURPOSE:    This function returns a list of files with their size,
//					last write datetime and subdirectory flag.
//
// ARGUMENTS:  as_filespec		- File path
//             ab_hidden		- Whether hidden/system files are reported
//             as_name			- File Name array (By Ref)
//             ad_size			- File Size array (By Ref)
//             adt_writedate	- LastWrite Datetime array (By Ref)
//             ab_subdir		- Subdirectory flag (By Ref)
//
// RETURN:		Number of files found
//
// DATE        PROG/ID		DESCRIPTION OF CHANGE / REASON
// ----------  --------		-----------------------------------------------------
// 04/22/2005	RolandS		Initial Coding
// -----------------------------------------------------------------------------

Integer li_file
Long ll_Handle
Boolean lb_found, lb_hidden, lb_system
String ls_filename
win32_find_data lstr_fd

// append filename pattern
If Right(as_filespec, 1) = "\" Then
	as_filespec += "*.*"
Else
	as_filespec += "\*.*"
End If

// find first file
ll_Handle = FindFirstFile(as_filespec, lstr_fd)
If ll_Handle < 1 Then Return -1

// loop through each file
Do
	// add file to array
	ls_filename = String(lstr_fd.cFilename)
	If ls_filename = "." Or ls_filename = ".." Then
	Else
		// check for hidden attrib
		lb_hidden = of_checkbit(lstr_fd.dwFileAttributes, 2)
		lb_system = of_checkbit(lstr_fd.dwFileAttributes, 3)
		If ( lb_hidden Or lb_system ) And &
			( ab_hidden = False ) Then
		Else
			// get file properties
			li_file++
			as_name[li_file]  = ls_filename
			ad_size[li_file] = (lstr_fd.nFileSizeHigh * (2.0 ^ 32)) + lstr_fd.nFileSizeLow
			adt_writedate[li_file] = of_filedatetimetopb(lstr_fd.ftlastwritetime, True)
			ab_subdir[li_file] = of_checkbit(lstr_fd.dwFileAttributes, 5)
		End If
	End If
	// find next file
	lb_Found = FindNextFile(ll_Handle, lstr_fd)
Loop Until Not lb_Found

// close find handle
FindClose(ll_Handle)

Return li_file

end function

public function string of_gettemppath ();// -----------------------------------------------------------------------------
// SCRIPT:     n_filesys.of_GetTempPath
//
// PURPOSE:    This function returns the system temporary file directory.
//
// RETURN:		Temp directory
//
// DATE        PROG/ID		DESCRIPTION OF CHANGE / REASON
// ----------  --------		-----------------------------------------------------
// 04/22/2005	RolandS		Initial Coding
// -----------------------------------------------------------------------------

String ls_path
ULong lul_buflen

lul_buflen = 260
ls_path = Space(lul_buflen)

GetTempPath(lul_buflen, ls_path)

Return ls_path

end function

public function unsignedlong of_setfileattributes (string as_filename, boolean ab_readonly, boolean ab_hidden, boolean ab_system, boolean ab_archive);// -----------------------------------------------------------------------------
// SCRIPT:     n_filesys.of_SetFileAttributes
//
// PURPOSE:    This function determines if any files exist with the
//					passed path.
//
// ARGUMENTS:  as_filename	- Name of the file
//             ab_readonly	- Read Only attribute
//             ab_hidden	- Hidden attribute
//             ab_system	- System attribute
//             ab_archive	- Archive attribute
//
// RETURN:		1 = Success, -1 = Error
//
// DATE        PROG/ID		DESCRIPTION OF CHANGE / REASON
// ----------  --------		-----------------------------------------------------
// 04/22/2005	RolandS		Initial Coding
// -----------------------------------------------------------------------------

Integer li_rc
ULong lul_attrib

// Calculate the new attribute byte for the file
lul_attrib = of_CalcFileAttributes(as_FileName, ab_ReadOnly, ab_Hidden, ab_System, ab_Archive)
If lul_attrib = -1 Then Return -1

If SetFileAttributes(as_FileName, lul_attrib) Then
	li_rc = 1
Else
	li_rc = -1
End If

Return li_rc

end function

private function unsignedlong of_calcfileattributes (string as_filename, boolean ab_readonly, boolean ab_hidden, boolean ab_system, boolean ab_archive);// -----------------------------------------------------------------------------
// SCRIPT:     n_filesys.of_CalcFileAttributes
//
// PURPOSE:    This function is called by of_SetFileAttributes to calculate
//             numeric attribute from the boolean values.
//
// ARGUMENTS:  as_filename	- Name of the file
//             ab_readonly	- Read Only attribute
//             ab_hidden	- Hidden attribute
//             ab_system	- System attribute
//             ab_archive	- Archive attribute
//
// RETURN:		Numeric attribute
//
// DATE        PROG/ID		DESCRIPTION OF CHANGE / REASON
// ----------  --------		-----------------------------------------------------
// 04/22/2005	RolandS		Initial Coding
// -----------------------------------------------------------------------------

Boolean	lb_ReadOnly, lb_Hidden, lb_System, lb_Subdirectory, lb_Archive
ULong		lul_Attrib

// Get the current attribute values
If this.of_GetFileAttributes(as_FileName, lb_ReadOnly, lb_Hidden, &
		lb_System, lb_Subdirectory, lb_Archive) = -1 Then 
	Return -1
End If

// Preserve the Subdirectory attribute
If lb_Subdirectory Then
	lul_Attrib = 16
Else
	lul_Attrib = 0
End If

// Set Read-Only
If Not IsNull(ab_ReadOnly) Then
	If ab_ReadOnly Then lul_Attrib = lul_Attrib + 1
Else
	If lb_ReadOnly Then lul_Attrib = lul_Attrib + 1
End If

// Set Hidden
If Not IsNull(ab_Hidden) Then
	If ab_Hidden Then lul_Attrib = lul_Attrib + 2
Else
	If lb_Hidden Then lul_Attrib = lul_Attrib + 2
End If

// Set System
If Not IsNull(ab_System) Then
	If ab_System Then lul_Attrib = lul_Attrib + 4
Else
	If lb_System Then lul_Attrib = lul_Attrib + 4
End If

// Set Archive
If Not IsNull(ab_Archive) Then
	If ab_Archive Then lul_Attrib = lul_Attrib + 32
Else
	If lb_Archive Then lul_Attrib = lul_Attrib + 32
End If

Return lul_Attrib

end function

public function string of_getfiledescription (string as_filename);// -----------------------------------------------------------------------------
// SCRIPT:     n_filesys.of_GetFileDescription
//
// PURPOSE:    This function gets a file's description from the registry.
//
// ARGUMENTS:  as_filename	- Name of the file
//
// RETURN:		File Description
//
// DATE        PROG/ID		DESCRIPTION OF CHANGE / REASON
// ----------  --------		-----------------------------------------------------
// 04/22/2005	RolandS		Initial Coding
// -----------------------------------------------------------------------------

String ls_extn, ls_regkey, ls_regvalue, ls_desc
Long ll_pos

ll_pos = LastPos(as_filename, ".")
If ll_pos = 0 Then Return ""

ls_extn = Mid(as_filename, ll_pos)

ls_regkey = "HKEY_CLASSES_ROOT\" + ls_extn
RegistryGet(ls_regkey, "", ls_regvalue)

ls_regkey = "HKEY_CLASSES_ROOT\" + ls_regvalue
RegistryGet(ls_regkey, "", ls_desc)

If ls_desc = "" Then
	ls_desc = Upper(Mid(ls_extn,2)) + " File"
End If

Return ls_desc

end function

public function integer of_getfiles (string as_filespec, ref string as_name[], ref boolean ab_subdir[]);// -----------------------------------------------------------------------------
// SCRIPT:     n_filesys.of_GetFiles
//
// PURPOSE:    This function is a simplified version that only returns
//					filename and subdirectory flag.
//
// ARGUMENTS:  as_filespec		- File path
//             as_name			- File Name array (By Ref)
//             ab_subdir		- Subdirectory flag (By Ref)
//
// RETURN:		Number of files found
//
// DATE        PROG/ID		DESCRIPTION OF CHANGE / REASON
// ----------  --------		-----------------------------------------------------
// 04/17/2006	RolandS		Initial Coding
// -----------------------------------------------------------------------------

Double ld_size[]
DateTime ldt_writedate[]

Return of_GetFiles(as_filespec, False, &
					as_name, ld_size, ldt_writedate, ab_subdir)

end function

public function datetime of_filedatetimetopb (filetime astr_filetime, boolean ab_msecs);// -----------------------------------------------------------------------------
// SCRIPT:     n_filesys.of_FileDateTimeToPB
//
// PURPOSE:    This function converts file system datetimes to a PB datetime.
//
// ARGUMENTS:  astr_filetime	- FILETIME structure
//					ab_msecs			- Option to includes milliseconds
//
// RETURN:		Datetime for the file
//
// DATE        PROG/ID		DESCRIPTION OF CHANGE / REASON
// ----------  --------		-----------------------------------------------------
// 04/22/2005	RolandS		Initial Coding
// -----------------------------------------------------------------------------

DateTime ldt_filedate
FILETIME	lstr_localtime
SYSTEMTIME lstr_systime
String ls_time
Date ld_fdate
Time lt_ftime

SetNull(ldt_filedate)

If Not FileTimeToLocalFileTime(astr_FileTime, &
			lstr_localtime) Then Return ldt_filedate

If Not FileTimeToSystemTime(lstr_localtime, &
			lstr_systime) Then Return ldt_filedate

ld_fdate = Date(lstr_systime.wYear, &
					lstr_systime.wMonth, lstr_systime.wDay)

ls_time = String(lstr_systime.wHour) + ":" + &
			 String(lstr_systime.wMinute) + ":" + &
			 String(lstr_systime.wSecond)
If ab_msecs Then
	ls_time += ":" + String(lstr_systime.wMilliseconds)
End If

lt_ftime = Time(ls_Time)

ldt_filedate = DateTime(ld_fdate, lt_ftime)

Return ldt_filedate

end function

public function datetime of_filedatetimetopb_utc (filetime astr_filetime, boolean ab_msecs);// -----------------------------------------------------------------------------
// SCRIPT:     n_filesys.of_FileDateTimeToPB_UTC
//
// PURPOSE:    This function converts file system datetimes to a PB datetime
//					without converting to local time.
//
// ARGUMENTS:  astr_filetime	- FILETIME structure
//					ab_msecs			- Option to includes milliseconds
//
// RETURN:		Datetime for the file
//
// DATE        PROG/ID		DESCRIPTION OF CHANGE / REASON
// ----------  --------		-----------------------------------------------------
// 04/22/2005	RolandS		Initial Coding
// -----------------------------------------------------------------------------

DateTime ldt_filedate
SYSTEMTIME lstr_systime
String ls_time
Date ld_fdate
Time lt_ftime

SetNull(ldt_filedate)

If Not FileTimeToSystemTime(astr_FileTime, &
			lstr_systime) Then Return ldt_filedate

ld_fdate = Date(lstr_systime.wYear, &
					lstr_systime.wMonth, lstr_systime.wDay)

ls_time = String(lstr_systime.wHour) + ":" + &
			 String(lstr_systime.wMinute) + ":" + &
			 String(lstr_systime.wSecond)
If ab_msecs Then
	ls_time += ":" + String(lstr_systime.wMilliseconds)
End If

lt_ftime = Time(ls_Time)

ldt_filedate = DateTime(ld_fdate, lt_ftime)

Return ldt_filedate

end function

public function string of_getfolderpath (long al_csidl);// -----------------------------------------------------------------------------
// SCRIPT:     n_filesys.of_GetFolderPath
//
// PURPOSE:    This function returns the path to a shell folder.
//
// ARGUMENTS:  al_CSIDL	- Shell folder identifier
//
// DATE        PROG/ID		DESCRIPTION OF CHANGE / REASON
// ----------  --------		-----------------------------------------------------
// 05/10/2005	RolandS		Initial Coding
// 12/28/2010	RolandS		Changed argument to a long and added complete list of
//									constants as instance variables
// -----------------------------------------------------------------------------

Constant Long SHGFP_TYPE_CURRENT = 0
String ls_path

ls_path = Space(260)

SHGetFolderPath(0, al_CSIDL, 0, SHGFP_TYPE_CURRENT, ls_path)

Return ls_path

end function

public function datetime of_getlastwritetime (string as_filename);// -----------------------------------------------------------------------------
// SCRIPT:     n_filesys.of_GetLastWriteTime
//
// PURPOSE:    This function returns the LastWriteTime of the specified file.
//
// ARGUMENTS:  as_filename	- Name of the file
//
// RETURN:		Datetime of LastWriteTime (Last Modified DateTime)
//
// DATE        PROG/ID		DESCRIPTION OF CHANGE / REASON
// ----------  --------		-----------------------------------------------------
// 08/24/2011	RolandS		Initial Coding
// -----------------------------------------------------------------------------

Long					ll_Handle
WIN32_FIND_DATA	lstr_FindData

// Get the file information
ll_Handle = FindFirstFile(as_FileName, lstr_FindData)
FindClose(ll_Handle)

// Convert the date and time
Return of_FileDateTimeToPB(lstr_FindData.ftlastwritetime, True)

end function

private function long of_makechar (string as_strings[], ref character ac_char[]);// Converts an array of strings into a single char array.
//	Each of the elements in the string array are separated
// with a null in the char array.  The last element has a double-null terminator.

Char lc_char[], lc_string[]
Long ll_StringCount, ll_StringIndex
Long ll_CharCount, ll_CharIndex

ll_StringCount = UpperBound(as_strings[])

If ll_StringCount = 0 Then Return 0

FOR ll_StringIndex = 1 TO ll_StringCount
	ll_CharCount = Len( as_strings[ll_StringIndex] )
	If ll_CharCount > 0 Then
		// Convert string into char array
		lc_string = as_strings[ll_StringIndex]
		// Concatenate string to existing char array
		FOR ll_CharIndex = 1 TO ll_CharCount
			lc_char[UpperBound(lc_char) + 1] = lc_string[ll_CharIndex]
		NEXT
		// Terminate each string with a null character
		SetNull(lc_char[UpperBound(lc_char) + 1])
	End If
NEXT

// The last element must be double-null terminated
SetNull(lc_char[UpperBound(lc_char) + 1])

// set char passed by array
ac_char = lc_char

// Return length of char array
Return UpperBound(lc_char)

end function

public function boolean of_shellcopyfiles (long al_window, string as_source[], string as_target);// -----------------------------------------------------------------------------
// SCRIPT:     n_filesys.of_ShellCopyFiles
//
// PURPOSE:    This function copies a list of files to the target location. If
//					the total size of the files warrant, Windows will display it's
//					copy progress window.
//
// ARGUMENTS:  al_window	- Handle of the parent window
//             as_source	- Array of file names
//             as_target	- The destination folder
//
// RETURN:		True=Success, False=Error
//
// DATE        PROG/ID		DESCRIPTION OF CHANGE / REASON
// ----------  --------		-----------------------------------------------------
// 03/22/2012	RolandS		Initial Coding
// -----------------------------------------------------------------------------

SHFILEOPSTRUCT lpFileOp
ULong lul_result
Long lp_string
Char lc_source[]

// Convert array of strings into a single null-separated char array
If this.of_MakeChar(as_source, lc_source) > 0 Then
	// Allocate memory for char array (pString)
	lp_string = LocalAlloc(0, UpperBound(lc_source) * 2)
	// Copy char array into newly allocated memory
	RtlMoveMemory(lp_string, lc_source, UpperBound(lc_source) * 2)
	// Populate FileOperation structure
	lpFileOp.hWnd							= al_window
	lpFileOp.wFunc							= FO_COPY
	lpFileOp.pFrom							= lp_string
	lpFileOp.pTo							= as_target
	lpFileOp.fFlags						= 0
	lpFileOp.bAnyOperationsAborted	= False
	lpFileOp.hNameMappings				= 0
	lpFileOp.lpszProgressTitle			= ""
	// Perform copy
	lul_result = SHFileOperation(lpFileOp)
	// Free allocated memory
	LocalFree(lp_string)
	If lul_result = 0 Then Return True
End If

Return False

end function

public subroutine of_getdiskfreespace (string as_drive, ref longlong all_size, ref longlong all_used, ref longlong all_free);// -----------------------------------------------------------------------------
// SCRIPT:     n_filesys.of_GetDiskFreeSpace
//
// PURPOSE:    This function returns the amount of space on the drive.
//
// ARGUMENTS:  as_drive	- Drive letter
//             all_size	- Total size in bytes of the drive (By Ref)
//             all_used	- Total number of used bytes on the drive (By Ref)
//             all_free	- Total number of free bytes on the drive (By Ref)
//
// DATE        PROG/ID		DESCRIPTION OF CHANGE / REASON
// ----------  --------		-----------------------------------------------------
// 04/22/2005	RolandS		Initial Coding
// -----------------------------------------------------------------------------

Boolean lb_result
LongLong lll_FreeBytes, lll_TotalBytes, lll_TotalFree
String ls_drive

ls_drive = as_drive + ":"

lb_result = GetDiskFreeSpaceEx(ls_drive, &
						lll_FreeBytes, lll_TotalBytes, lll_TotalFree)
If lb_result Then
	all_size = lll_TotalBytes
	all_free = lll_TotalFree
	all_used = all_size - all_free
Else
	all_size = 0
	all_free = 0
	all_used = 0
End If

end subroutine

public function unsignedlong of_getdrivetype (string as_drive);// -----------------------------------------------------------------------------
// SCRIPT:     n_filesys.of_GetDriveType
//
// PURPOSE:    This function determines whether a disk drive is a
//					removable, fixed, CD-ROM, RAM disk, or network drive.
//
// ARGUMENTS:  as_drive	- Drive letter
//
// RETURN:		Drive type:
//
//		Type	Meaning
//		----	--------------------------------------------
//		0		The drive type cannot be determined.
//		1		The root path is invalid. For example, no
//				volume is mounted at the path.
//		2		The disk can be removed from the drive.
//		3		The disk cannot be removed from the drive.
//		4		The drive is a remote (network) drive.
//		5		The drive is a CD-ROM drive.
//		6		The drive is a RAM disk.
//
// DATE        PROG/ID		DESCRIPTION OF CHANGE / REASON
// ----------  --------		-----------------------------------------------------
// 04/22/2005	RolandS		Initial Coding
// -----------------------------------------------------------------------------

ULong lul_type
String ls_drive

ls_drive = as_drive + ":\"

lul_type = GetDriveType(ls_drive)

Return lul_type

end function

public function integer of_getdrives (ref string as_drive[], ref unsignedlong aul_type[], ref string as_label[]);// -----------------------------------------------------------------------------
// SCRIPT:     n_filesys.of_GetDrives
//
// PURPOSE:    This function returns a list of disk drives with their type
//					and volume label.
//
// ARGUMENTS:  as_drive	- Drive letter array (By Ref)
//             aul_type	- Drive type array (By Ref)
//             as_label	- Volume label array (By Ref)
//
// RETURN:		Number of drives found
//
// DATE        PROG/ID		DESCRIPTION OF CHANGE / REASON
// ----------  --------		-----------------------------------------------------
// 04/22/2005	RolandS		Initial Coding
// -----------------------------------------------------------------------------

String ls_drive, ls_connection, ls_server, ls_share
Integer li_cnt, li_next, li_pos
ULong lul_type, lul_drives
Boolean lb_exists

// get active drive letters
lul_drives = GetLogicalDrives()
For li_cnt = 1 To 26
	// check if drive exists
	lb_exists = of_checkbit(lul_drives, li_cnt)
	If lb_exists Then
		// convert drive number to letter
		ls_drive = Char(li_cnt + 64)
		// get drive type
		lul_type = this.of_GetDriveType(ls_drive)
		If lul_type = DRIVE_UNKNOWN Or &
			lul_type = DRIVE_NO_ROOT_DIR Then
		Else
			li_next = UpperBound(as_drive) + 1
			as_drive[li_next] = ls_drive
			aul_type[li_next] = lul_type
			// check for network drive
			If lul_type = DRIVE_REMOTE Then
				// get network server and share names
				ls_connection = this.of_WNetGetConnection(ls_drive)
				li_pos = LastPos(ls_connection, "\")
				ls_share = Mid(ls_connection, li_pos + 1)
				ls_server = Mid(Left(ls_connection, li_pos - 1), 3)
				If ls_share = Upper(ls_share) Then
					ls_share = WordCap(ls_share)
				End If
				If ls_server = Upper(ls_server) Then
					ls_server = WordCap(ls_server)
				End If
				as_label[li_next] = ls_share + " on '" + ls_server + "'"
			Else
				// get volume label from local drives
				as_label[li_next] = this.of_GetVolumeLabel(ls_drive)
				If as_label[li_next] = "" Then
					choose case lul_type
						case DRIVE_REMOVABLE
							as_label[li_next] = "3½ Floppy"
						case DRIVE_FIXED
							as_label[li_next] = "Local Disk"
						case DRIVE_CDROM
							as_label[li_next] = "CD Drive"
						case DRIVE_RAMDISK
							as_label[li_next] = "RAM Drive"
					end choose
				End If
			End If
		End if
	End If
Next

Return li_next

end function

public function integer of_pbdatetimetofile (datetime adt_filetime, ref filetime astr_filetime);// convert a PB DateTime to a FILETIME structure

FILETIME	lstr_localtime
SYSTEMTIME lstr_systime
String ls_time
Date ld_fdate
Time lt_ftime

ld_fdate = Date(adt_filetime)
lstr_systime.wYear  = Year(ld_fdate)
lstr_systime.wMonth = Month(ld_fdate)
lstr_systime.wDay   = Day(ld_fdate)

ls_time = String(adt_filetime, "hh:mm:ss:fff")
lstr_systime.wHour   = Long(Left(ls_time, 2))
lstr_systime.wMinute = Long(Mid(ls_time, 4, 2))
lstr_systime.wSecond = Long(Mid(ls_time, 7, 2))
lstr_systime.wMilliseconds = Long(Right(ls_time, 3))

If Not SystemTimeToFileTime(lstr_systime, &
			lstr_localtime) Then Return -1

If Not LocalFileTimeToFileTime(lstr_localtime, &
			astr_filetime) Then Return -1

Return 1

end function

public function integer of_setfiletime (string as_filename, datetime adt_createtime, datetime adt_accesstime, datetime adt_writetime);// set the Create, Access and LastWrite datetime

FILETIME lstr_Create, lstr_Access, lstr_Write
Longptr ll_file
Integer li_rtn = 1

// convert createtime
If of_PBDateTimeToFile(adt_CreateTime, lstr_Create) = -1 Then
	Return -1
End If

// convert accesstime
If of_PBDateTimeToFile(adt_AccessTime, lstr_Access) = -1 Then
	Return -1
End If

// convert writetime
If of_PBDateTimeToFile(adt_WriteTime, lstr_Write) = -1 Then
	Return -1
End If

// open file for update
ll_File = CreateFile(as_FileName, GENERIC_WRITE, &
					FILE_SHARE_READ, 0, OPEN_EXISTING, &
					FILE_ATTRIBUTE_NORMAL, 0)
If ll_file = INVALID_HANDLE_VALUE Then
	Return -1
End If

// set the filetimes
If Not SetFileTime(ll_file, lstr_Create, &
				lstr_Access, lstr_Write) Then
	li_rtn = -1
End If

// close the file
CloseHandle(ll_file)

Return li_rtn

end function

on n_filesys.create
call super::create
TriggerEvent( this, "constructor" )
end on

on n_filesys.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

