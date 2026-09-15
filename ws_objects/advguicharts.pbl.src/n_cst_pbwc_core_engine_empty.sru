$PBExportHeader$n_cst_pbwc_core_engine_empty.sru
forward
global type n_cst_pbwc_core_engine_empty from nonvisualobject
end type
end forward

global type n_cst_pbwc_core_engine_empty from nonvisualobject autoinstantiate
end type

type variables
string is_source
string is_chart_version = "2.7.0"
string is_chart_datalabels_version = "0.3.0"
string is_pb_exe //="pb120.exe"
string is_ie_version_key="HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\Microsoft\Internet Explorer\MAIN\FeatureControl\FEATURE_BROWSER_EMULATION"
string is_ie_3D_key="HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\Microsoft\Internet Explorer\MAIN\FeatureControl\FEATURE_GPU_RENDERING"
end variables

forward prototypes
public function boolean of_check_version (string as_path, string as_module, string as_version)
public function integer of_write_file (string as_filename)
public function string of_get_temp_folder ()
public function string of_getpbexename ()
public function integer of_check_browser (string as_exe_name)
public function integer of_init (string as_exe_name)
end prototypes

public function boolean of_check_version (string as_path, string as_module, string as_version);string ls_file,ls_version
//check if file exists, if not, create it.
ls_file = as_path + "\"+"pwbc.ver"
If fileexists(ls_file) = FALSE THEN
	integer li_FileNum
	li_FileNum = FileOpen(ls_file,   textmode!, Write!, LockWrite!, Replace!)
	filewrite(li_FileNum,"[PBWC]")
	fileclose(li_FileNum)
END IF

ls_version = profilestring(ls_file,"PBWC",as_module,"")
IF ls_version <> as_version THEN
	CHOOSE CASE as_module
		CASE "powergraph"
	END CHOOSE
END IF


return TRUE
end function

public function integer of_write_file (string as_filename);//writes a file
integer li_FileNum, li_ret
li_FileNum = FileOpen(as_filename, textMode!, Write!, LockWrite!, Replace!)
li_ret = filewriteex(li_FileNum,is_source)
fileclose(li_FileNum)
return li_ret
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

public function string of_getpbexename ();Environment le_env
String ls_vmname
Integer li_major

GetEnvironment(le_env)

li_major = le_env.PBMajorRevision
If li_major = 6 Then
	ls_vmname = "pb" + String(li_major) + "0.exe"
Else
	choose case le_env.PBMinorRevision
		case 5
			ls_vmname = "pb" + String(li_major) + "5.exe"
		case 6
			ls_vmname = "pb" + String(li_major) + "6.exe"
		case else
			ls_vmname = "pb" + String(li_major) + "0.exe"
	end choose
End If

Return ls_vmname

end function

public function integer of_check_browser (string as_exe_name);//checks that IE activex can support HTML5 for the application and for PB
ulong ll_version,ll_3D
int li_ret

IF as_exe_name = "" THEN as_exe_name = getapplication().appname +".exe"


registryget(is_ie_version_key, is_pb_exe, regulong!,ll_version)
IF ll_version < 11000 THEN 
	li_ret= registryset(is_ie_version_key, is_pb_exe, regulong!,11999) 
	registryget(is_ie_version_key, is_pb_exe, regulong!,ll_version)
	IF li_ret < 0 OR ll_version < 11000 THEN
		Messagebox("PWBC","Unable to configure computer registry, please run the application once as administrator")
		return -1
	END IF
END IF
ll_version = 0
registryget(is_ie_version_key,as_exe_name, regulong!,ll_version)
IF ll_version < 11000 THEN 
	li_ret= registryset(is_ie_version_key, as_exe_name, regulong!,11999) 
	registryget(is_ie_version_key,as_exe_name, regulong!,ll_version)
		IF li_ret < 0 OR ll_version < 11000 THEN
		Messagebox("PWBC","Unable to configure computer registry , please run the application once as administrator")
		return -1
	END IF
END IF	

registryget(is_ie_3D_key, is_pb_exe, regulong!,ll_3D)
IF ll_3D <>1 THEN 
	IF registryset(is_ie_3D_key, is_pb_exe, regulong!,1) < 0 THEN
		Messagebox("PWBC","Unable to configure computer registry, please run the application once as administrator")
		return -1
	END IF
END IF
ll_3D = 0
registryget(is_ie_3D_key, as_exe_name, regulong!,ll_3D)
IF ll_3D<> 1 THEN 
	IF registryset(is_ie_3D_key, as_exe_name,regulong!, 1) < 0 THEN
		Messagebox("PWBC","Unable to configure computer registry , please run the application once as administrator")
		return -1
	END IF
END IF	


end function

public function integer of_init (string as_exe_name);string ls_path
ls_path = of_get_temp_folder()
of_check_version(ls_path, "chart_js",is_chart_version)
of_check_version(ls_path, "chart_js_datalabels",is_chart_datalabels_version)
IF of_check_browser(as_exe_name) < 1 THEN return -1
return 1
end function

on n_cst_pbwc_core_engine_empty.create
call super::create
TriggerEvent( this, "constructor" )
end on

on n_cst_pbwc_core_engine_empty.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

event constructor;is_pb_exe = of_GetPBExeName()
end event

