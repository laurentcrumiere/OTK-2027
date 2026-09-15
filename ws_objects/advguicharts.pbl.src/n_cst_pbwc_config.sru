$PBExportHeader$n_cst_pbwc_config.sru
forward
global type n_cst_pbwc_config from nonvisualobject
end type
end forward

global type n_cst_pbwc_config from nonvisualobject autoinstantiate
end type

type variables
//get dbprofile info
string is_db_profile_registry// "HKEY_CURRENT_USER\Software\Sybase\PowerBuilder\12.0\DatabaseProfiles\PowerBuilder"
string is_pb_registry // "HKEY_CURRENT_USER\Software\Sybase\PowerBuilder\12.0"

string is_pbwc_registry = "HKEY_CURRENT_USER\Software\pbwc"
string is_current_db_profile_key = "MRUProfile"
string is_tool_name
//n_cst_pbwc_string inv_string
string is_pb_workspace
string is_target
string is_target_libraries[]

//PB2025
boolean ib_solution
boolean ib_debug = FALSE
end variables

forward prototypes
public function integer of_db_connect ()
public function string of_get_temp_folder ()
public function string of_get_filename (string as_url, boolean ab_remove_extension)
public function string of_get_url_from_file (string as_filename)
public function string of_get_current_pb_workspace ()
public function string of_get_current_pb_target ()
public function string of_get_library_file (string as_library, string as_path_array[])
public function integer of_split_path (string as_path, ref string as_folders[])
public function integer of_count_dot_dot (ref string as_lib_name)
public function integer of_get_target_libraries (string as_pbt_file, ref string as_libraries[])
public function string of_get_pbversion ()
public function string of_get_filename_from_uri (string as_url, boolean ab_remove_extension)
public function string of_librarydirectory (string as_library, libdirtype as_objecttype, listbox alb)
public function string of_get_file_extension (LibDirType as_libdirtype)
end prototypes

public function integer of_db_connect ();string ls_current_db_profile_key,ls_password 

IF RegistryGet( is_db_profile_registry,is_current_db_profile_key, RegString!, ls_current_db_profile_key)  = -1 THEN
	Messagebox(is_tool_name,"No default Db profile found", stopsign!)
	return -1
END IF

IF RegistryGet( is_db_profile_registry+ "\"+ls_current_db_profile_key, "DBMS" , RegString!, sqlca.DBMS)  = -1 THEN
	Messagebox(is_tool_name,"No DBMS defined for DB profile " + ls_current_db_profile_key , stopsign!)
	return -1
END IF

//get password
RegistryGet( is_pbwc_registry, "pw_"+ls_current_db_profile_key , RegString!, ls_password)
IF ls_password = "" THEN
	open(w_pbwc_enter_password)
	ls_password = message.stringparm
	IF ls_password = "cancel" THEN return -1
	registryset(is_pbwc_registry, "pw_"+ls_current_db_profile_key , RegString!, ls_password)
END IF

RegistryGet(is_db_profile_registry+ "\"+ls_current_db_profile_key, "Database" , RegString!, sqlca.Database)
RegistryGet( is_db_profile_registry+ "\"+ls_current_db_profile_key, "DBParm" , RegString!, sqlca.DBParm)
RegistryGet( is_db_profile_registry+ "\"+ls_current_db_profile_key, "Logid" , RegString!, sqlca.Logid)
RegistryGet( is_db_profile_registry+ "\"+ls_current_db_profile_key, "ServerName" , RegString!, sqlca.ServerName)
RegistryGet( is_db_profile_registry+ "\"+ls_current_db_profile_key, "UserId" , RegString!, sqlca.UserId)
sqlca.DbPass = ls_password
sqlca.LogPass = ls_password
//replace crypt password in dbparm
long ll_pos_start,ll_pos_end
ll_pos_start = pos(sqlca.dbparm, "PWD=")
IF ll_pos_start > 0 THEN
	ll_pos_end =  pos(sqlca.dbparm, ";", ll_pos_start)
	IF ll_pos_end = 0 THEN ll_pos_end =  pos(sqlca.dbparm, "'", ll_pos_start)
	IF ll_pos_end = 0 THEN ll_pos_end =  len(sqlca.dbparm)
	sqlca.dbparm = mid(sqlca.dbparm,1,ll_pos_start -1) + "PWD="+ls_password+mid(sqlca.dbparm,ll_pos_end ) 
END IF


connect;
IF sqlca.sqlcode <> 0 THEN
Messagebox(is_tool_name,"Unable to connect to Database set in DBprofile : "+is_current_db_profile_key+". Check your selected DB profile in the database Painter.~r~nThe Chart.js Datawindow painter uses your current DBprofile in the PowerBuilder database painter, to connect to the database." , stopsign!)
registryset(is_pbwc_registry, "pw_"+ls_current_db_profile_key , RegString!, "")
	return -1
END IF

return 1

end function

public function string of_get_temp_folder ();// -----------------------------------------------------------------------------
// SCRIPT:     of_get_temp_folder
//
// PURPOSE:    
//
// ARGUMENTS: 
//
// RETURN:		String - workstation temp folder path
//
// DATE        PROG/ID		DESCRIPTION OF CHANGE / REASON
// ----------  --------		-----------------------------------------------------
// 01/01/2018	FFasolin	Initial Coding
// ------------------------------------------------------------------------------
ContextKeyword lcxk_base
string ls_temp[]
this.GetContextService("Keyword", lcxk_base)
lcxk_base.getContextKeywords("TEMP", ls_temp)
return ls_temp[1]
end function

public function string of_get_filename (string as_url, boolean ab_remove_extension);//returns filename from url
long ll_pos
ll_pos = pos(as_url,"\")
IF ll_pos > 0 THEN 
	return of_get_filename(mid(as_url,ll_pos +1),ab_remove_extension)
ELSE
	IF ab_remove_extension THEN
		ll_pos = pos(as_url,".")
		IF ll_pos > 0 THEN as_url = mid(as_url,1,ll_pos -1)
	END IF
	return as_url
END IF
end function

public function string of_get_url_from_file (string as_filename);//returns the url corresponding to a file on a drive
n_cst_pbwc_string inv_string
inv_string.of_refglobalreplace(as_filename,"\","/")
return "file:///" + as_filename

end function

public function string of_get_current_pb_workspace ();//returns current workspace from PB MRUList
string ls_workspaces[],ls_mru,ls_current_workspace, ls_letter,ls_workspace_time
int li_workspace,ii
//PB2025
long ll_workspace_time
n_cst_pbwc_string lnv_string


FOR ii = 1 to 35
	IF ii < 11 THEN
		RegistryGet( is_pb_registry+"\workspace\MRUList", string(ii -1) , RegString!, ls_workspaces[ii])
	ELSE
		ls_letter = char(54 +ii)
		RegistryGet( is_pb_registry+"\workspace\MRUList", ls_letter , RegString!, ls_workspaces[ii])
	END IF
NEXT
RegistryGet( is_pb_registry+"\workspace\MRUList","MRUList" , RegString!, ls_mru)
ls_letter =  mid(ls_mru,1,1)
IF ls_letter < 'A' THEN
	li_workspace = integer(ls_letter)
	li_workspace ++
ELSE
	li_workspace = ASC(ls_letter)-54
END IF
/*
workspace:///C|/pbwc%20-%202022/pbwc.pbw?action=open&time=1668444953&entry
*/
ls_current_workspace =  ls_workspaces[li_workspace]
lnv_string.of_refglobalreplace(ls_current_workspace,"workspace:///","")
long ll_pos_start, ll_pos_end
ll_pos_start = pos(ls_current_workspace,'?action=open')
//ll_pos_end = pos(ls_current_workspace, '&entry',ll_pos_start)
IF ll_pos_start > 0 THEN 

		
	//PB2025 
	long ll_pos_start_time, ll_pos_end_time
	ll_pos_start_time = pos(ls_current_workspace,'time=')
	ll_pos_end_time = pos(ls_current_workspace,'&',ll_pos_start_time)
	ls_workspace_time = mid(ls_current_workspace,ll_pos_start_time + 5, ll_pos_end_time - ll_pos_start_time -5)
	ll_workspace_time = long(ls_workspace_time)
	
	ls_current_workspace = mid(ls_current_workspace,1,ll_pos_start -1) 

END IF	
	
//IF ll_pos_start > 0 and ll_pos_end > ll_pos_start THEN ls_current_workspace = mid(ls_current_workspace,1,ll_pos_start -1) + mid(ls_current_workspace,ll_pos_end+6)
//inv_string.of_refglobalreplace(ls_current_workspace,"?action=open&entry","")
lnv_string.of_refglobalreplace(ls_current_workspace,"|",":")
lnv_string.of_refglobalreplace(ls_current_workspace,"/","\")
lnv_string.of_refglobalreplace(ls_current_workspace,"%20"," ")



//PB2025 Checking if workspace is a solution
string ls_current_solution, ls_solution_time
string ls_solutions[]
int li_solution
long ll_solution_time
FOR ii = 1 to 35
	IF ii < 11 THEN
		RegistryGet( is_pb_registry+"\workspace\SLN_MRUList", string(ii -1) , RegString!, ls_solutions[ii])
	ELSE
		ls_letter = char(54 +ii)
		RegistryGet( is_pb_registry+"\workspace\SLN_MRUList", ls_letter , RegString!, ls_solutions[ii])
	END IF
NEXT
RegistryGet( is_pb_registry+"\workspace\SLN_MRUList","MRUList" , RegString!, ls_mru)
ls_letter =  mid(ls_mru,1,1)
IF ls_letter < 'A' THEN
	li_solution = integer(ls_letter)
	li_solution ++
ELSE
	li_solution = ASC(ls_letter)-54
END IF
/*
workspace:///C|/pbwc%20-%202022/pbwc.pbw?action=open&time=1668444953&entry
*/
ls_current_solution =  ls_solutions[li_solution]

IF ib_debug THEN
	ls_current_solution = 'workspace:///C|/pbwc_demo%20-%202025/Windows/pbwc_demo.pbsln?action=open&time=1742843421&entry'
END IF
lnv_string.of_refglobalreplace(ls_current_solution,"workspace:///","")

ll_pos_start = pos(ls_current_solution,'?action=open')
//ll_pos_end = pos(ls_current_workspace, '&entry',ll_pos_start)
IF ll_pos_start > 0 THEN 
	
	ll_pos_start_time = pos(ls_current_solution,'time=')
	ll_pos_end_time = pos(ls_current_solution,'&',ll_pos_start_time)
	ls_solution_time = mid(ls_current_solution,ll_pos_start_time + 5, ll_pos_end_time - ll_pos_start_time -5)
	ll_solution_time = long(ls_solution_time)
	
	ls_current_solution = mid(ls_current_solution,1,ll_pos_start -1) 
	
END IF	
	
//IF ll_pos_start > 0 and ll_pos_end > ll_pos_start THEN ls_current_workspace = mid(ls_current_workspace,1,ll_pos_start -1) + mid(ls_current_workspace,ll_pos_end+6)
//inv_string.of_refglobalreplace(ls_current_workspace,"?action=open&entry","")
lnv_string.of_refglobalreplace(ls_current_solution,"|",":")
lnv_string.of_refglobalreplace(ls_current_solution,"/","\")
lnv_string.of_refglobalreplace(ls_current_solution,"%20"," ")

IF ll_solution_time > ll_workspace_time THEN
	ib_solution=TRUE
	ls_current_workspace = ls_current_solution
END IF

return ls_current_workspace




end function

public function string of_get_current_pb_target ();string ls_workspace,ls_target
n_cst_pbwc_string inv_string
ls_workspace = of_get_current_pb_workspace()
IF ls_workspace = "" THEN return ""

//PB2025
inv_string.of_refglobalreplace(ls_workspace,"\","$")
RegistryGet( is_pb_registry+"\workspace\"+ls_workspace,"LastChosenTarget" , RegString!, ls_target)

return ls_target
end function

public function string of_get_library_file (string as_library, string as_path_array[]);int li_dot_dot, li_size,ii
string ls_return
//evaluate begining of path from relative path in pbt
li_dot_dot = of_count_dot_dot(as_library)
li_size = upperbound(as_path_array) - li_dot_dot -1
FOR ii = 1 to li_size
	ls_return += as_path_array[ii]+"\"
NEXT

//adds the library path
ls_return += as_library

return ls_return
end function

public function integer of_split_path (string as_path, ref string as_folders[]);//splits path into an array of folders
string ls_folder
int ii
n_cst_pbwc_string inv_string
ls_folder = inv_string.of_gettoken(as_path,"\")
DO WHILE ls_folder <> ""
	ii++
	as_folders[ii] = ls_folder
	ls_folder = inv_string.of_gettoken(as_path,"\")
LOOP
return ii
end function

public function integer of_count_dot_dot (ref string as_lib_name);int ii
string ls_dot_dot
string ls_find="..\\"
n_cst_pbwc_string inv_string
//PB2025
IF ib_solution  THEN ls_find="..\"

ls_dot_dot = inv_string.of_gettoken(as_lib_name,ls_find)
DO WHILE  as_lib_name <> "" 
	ii++
	ls_dot_dot = inv_string.of_gettoken(as_lib_name,ls_find)
LOOP
IF ls_dot_dot <> "" THEN as_lib_name = ls_dot_dot

return ii
end function

public function integer of_get_target_libraries (string as_pbt_file, ref string as_libraries[]);integer li_FileNum
long li_pos_start,ii, li_pos_end
string ls_start = 'liblist "', ls_end = '";'
string ls_lib_list,ls_lib
string ls_folders[]
n_cst_pbwc_string inv_string

of_split_path(as_pbt_file,ls_folders)

li_FileNum = FileOpen(as_pbt_file,  TextMode!)
fileReadEx(li_FileNum, as_pbt_file)
fileclose(li_FileNum)


IF ib_solution = FALSE THEN
	as_pbt_file = lower(as_pbt_file)
	li_pos_start = pos(as_pbt_file,ls_start)
	IF li_pos_start = 0 THEN return -1
	li_pos_start = li_pos_start + len(ls_start)
	li_pos_end = pos(as_pbt_file,ls_end,li_pos_start)
	ls_lib_list = mid(as_pbt_file,li_pos_start, li_pos_end - li_pos_start )
	ls_lib= inv_string.of_gettoken(ls_lib_list,";")
	DO while ls_lib <> ""
		ii++
		ls_lib = of_get_library_file(ls_lib,ls_folders)
		as_libraries[ii] = ls_lib
		ls_lib= inv_string.of_gettoken(ls_lib_list,";")
	LOOP
ELSE
	ls_start = '<Library Path="'
	li_pos_start = pos(as_pbt_file,ls_start)
	IF li_pos_start = 0 THEN return -1
	DO WHILE li_pos_start > 0
		li_pos_start += len(ls_start)
		li_pos_end =  pos(as_pbt_file,'"',li_pos_start )
		ii++
		ls_lib = mid(as_pbt_file,li_pos_start,li_pos_end - li_pos_start)
		ls_lib = of_get_library_file(ls_lib,ls_folders)
		as_libraries[ii] = ls_lib
		li_pos_start = pos(as_pbt_file,ls_start, li_pos_end)
	
	LOOP
END IF

return 1
end function

public function string of_get_pbversion ();Environment le_env
String ls_vmname
Integer li_major

GetEnvironment(le_env)

li_major = le_env.PBMajorRevision
If li_major = 6 Then
	ls_vmname = String(li_major) + ".0"
Else
	choose case le_env.PBMinorRevision
		case 5
			ls_vmname =  String(li_major) + ".5"
		case 6
			ls_vmname =  String(li_major) + ".6"
		case else
			ls_vmname = String(li_major) + ".0"
	end choose
End If

Return ls_vmname

end function

public function string of_get_filename_from_uri (string as_url, boolean ab_remove_extension);//returns filename from url
long ll_pos
ll_pos = pos(as_url,"/")
IF ll_pos > 0 THEN 
	return of_get_filename_from_uri(mid(as_url,ll_pos +1),ab_remove_extension)
ELSE
	IF ab_remove_extension THEN
		ll_pos = pos(as_url,".")
		IF ll_pos > 0 THEN as_url = mid(as_url,1,ll_pos -1)
	END IF
	return as_url
END IF
end function

public function string of_librarydirectory (string as_library, libdirtype as_objecttype, listbox alb);//PB2025
string ls_librarylist
string ls_library
string ls_entry,ls_item
string ls_proj
string ls_file
boolean lb_valid
integer li_FileNum
long li_pos_start,ii, li_pos_end,ll_index
long ll_count
string ls_current_directory

n_cst_pbwc_string inv_string
ls_current_directory = getcurrentdirectory()

IF ib_solution = FALSE THEN
	return  LibraryDirectoryEx(as_library,as_objecttype)
ELSE
		alb.reset()
		alb.dirlist(as_library+"\*.srd",0)
		ll_count =  alb.totalitems()
        
        // Get the list of filenames in the folder
        FOR ll_index = 1 TO ll_count
             alb.Selectitem (ll_index)
            
            lb_valid = alb.DirSelect(ls_file)
            IF (NOT (lb_valid)) THEN
                ls_librarylist += inv_string.of_globalreplace(ls_file,'.srd',"") +"~r~n"
            END IF
        NEXT
		
		
		ChangeDirectory(ls_current_directory)
		return ls_librarylist
		
		
		
		
END IF

return ls_librarylist
end function

public function string of_get_file_extension (LibDirType as_libdirtype);CHOOSE CASE as_libdirtype
	CASE dirdatawindow!
		return ".srd"
END CHOOSE
end function

on n_cst_pbwc_config.create
call super::create
TriggerEvent( this, "constructor" )
end on

on n_cst_pbwc_config.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

event constructor;string ls_pb_version
ls_pb_version = of_get_pbversion()
is_db_profile_registry = "HKEY_CURRENT_USER\Software\Sybase\PowerBuilder\"+ls_pb_version+"\DatabaseProfiles\PowerBuilder"
is_pb_registry = "HKEY_CURRENT_USER\Software\Sybase\PowerBuilder\"+ls_pb_version

is_target  = of_get_current_pb_target()
of_get_target_libraries(is_target,is_target_libraries)
end event

