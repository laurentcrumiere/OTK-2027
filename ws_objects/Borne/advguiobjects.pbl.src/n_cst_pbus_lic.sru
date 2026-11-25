$PBExportHeader$n_cst_pbus_lic.sru
forward
global type n_cst_pbus_lic from nonvisualobject
end type
end forward

shared variables
Boolean ib_messagedisplayed
Boolean ib, ib2
Boolean ib_regchecked
end variables

global type n_cst_pbus_lic from nonvisualobject autoinstantiate
end type

type prototypes
	FUNCTION long GetVolumeInformation & 
  (string lpRootPathName, REF string lpVolumeNameBuffer, long nVolumeNameSize, & 
   REF ulong lpVolumeSerialNumber, REF long lpMaximumComponentLength, & 
   REF long lpFileSystemFlags, REF string lpFileSystemNameBuffer, & 
   long nFileSystemNameSize) & 
   LIBRARY "Kernel32.dll" ALIAS FOR "GetVolumeInformationW"
	
	Function boolean GetUserName (ref string  lpBuffer, ref ulong nSize) Library "ADVAPI32.DLL" Alias for "GetUserNameW"

end prototypes

type variables

Private:


Constant Long GWL_WNDPROC = -4
Boolean IsTransparent
Boolean PaintBackground
ULong il_hCanvas
ULong il_OriginalProc

end variables

forward prototypes
public function string of_getlocalid ()
public function string of_getusername ()
public function boolean of_freeversion (string as_type)
public function integer of_checkreg ()
public function boolean of_registered ()
public function string of_key ()
public function date of_decrypt (string a_date)
end prototypes

public function string of_getlocalid ();Long ll_MaxCompLength, ll_FileSystemFlags, ll_rtn
String ls_fsname, ls_ret, ls_UserName, ls_volbuffer
ulong ll_serial
n_uspb_crypto lcrypto
Blob lblb

ls_volbuffer = Space(255)
ls_fsname = Space(255)
ll_rtn = GetVolumeinformation("C:\", ls_volbuffer, 255, ll_serial, ll_MaxCompLength, ll_FileSystemFlags , ls_fsname, 255)

ls_UserName = lower(of_GetUserName())

if ll_rtn = 1 then
	if lcrypto.of_md5(string(ll_serial)+ls_UserName, lblb)=0 then
		ls_ret = lcrypto.of_blobtohex(lblb)
	else
		ls_ret = ""
	end if
else
  ls_ret = ""
end if

return ls_ret
end function

public function string of_getusername ();boolean lb_ret
string ls_UserName
ulong BufferLength = 250  // you may need to adjust this. see Note

ls_UserName  = Space(BufferLength)

lb_ret = GetUserName(ls_UserName, BufferLength)

return ls_UserName
end function

public function boolean of_freeversion (string as_type);IF ib2 THEN
	CHOOSE CASE as_type
		CASE "u_cst_buttonlistbar", "u_cst_togglebutton", "u_cst_toolbarstrip",&
			  "u_cst_xpheader", "u_cst_buttonlistbarscroll", "u_cst_toolbarchevron",&
			  "u_cst_commandbutton", "u_cst_groupbox", "u_cst_powercalc",&
			  "u_cst_static_text", "n_cst_powermessage"
			RETURN TRUE
		CASE ELSE
			RETURN FALSE
	END CHOOSE
END IF

RETURN FALSE

end function

public function integer of_checkreg ();blob lblb
string ls_source
string as_company, as_localid, ls_ip, as_email, as_phone, as_firstname, as_lastname, ls_installdir
string as_countryid, as_type, ls_input, ls_output, ls_key, ls_date, ls_savedkey, ls_data
Date ld_filedate
n_uspb_cryptoapi ln_crypto
Long ll_file
ULong al_countryid
n_uspb_crypto lcrypto

IF Handle(GetApplication()) <> 0 THEN
	ib = TRUE
	ib2 = TRUE
	ib_regchecked = TRUE
	RETURN 1
END IF

IF ib_regchecked THEN
	RETURN 1
END IF

ib_regchecked = TRUE

RegistryGet("HKEY_CURRENT_USER\SOFTWARE\Werysoft\PBUS\", 'CountryId', RegULong!, al_countryid)
RegistryGet("HKEY_CURRENT_USER\SOFTWARE\Werysoft\PBUS\", 'Company', RegString!, as_company)
RegistryGet("HKEY_CURRENT_USER\Software\Werysoft\PBUS\", 'Email', RegString!, as_email) 
RegistryGet("HKEY_CURRENT_USER\Software\Werysoft\PBUS\", 'Phone', RegString!, as_phone)
RegistryGet("HKEY_CURRENT_USER\Software\Werysoft\PBUS\", 'FirstName', RegString!, as_firstname)
RegistryGet("HKEY_CURRENT_USER\Software\Werysoft\PBUS\", 'LastName', RegString!, as_lastname)
RegistryGet("HKEY_CURRENT_USER\Software\Werysoft\PBUS\", 'KeyType', RegString!, as_type)

RegistryGet("HKEY_CURRENT_USER\Software\Werysoft\PBUS\", "Process", RegString!, ls_date)
RegistryGet("HKEY_CURRENT_USER\Software\Werysoft\PBUS\", "Key", RegString!, ls_savedkey)

IF ls_savedkey = "FD63EBAFC37DD8DBCEADBAD6A2B73CC6" AND as_email = "robert@datametics.nl" THEN
	ib = TRUE
	RETURN 1
END IF

as_type = Upper(as_type)

IF Len(Trim(as_type)) = 0 OR Len(Trim(ls_savedkey)) = 0 THEN
	IF NOT ib_messagedisplayed THEN 
		IF MessageBox("PowerBuilder Ultimate Suite", "A Trial, Developer key, or Free Edition Key needs to be installed before you can use PowerBuilder Ultimate Suite.~r~n~r~nWould you like to request a key now?", Information!, YesNo!, 1) = 1 THEN
			RegistryGet("HKEY_CURRENT_USER\Software\Werysoft\PBUS\", "InstallDir", RegString!, ls_installdir)
			
			IF FileExists(ls_InstallDir + "PBUSKeyManager.exe") THEN
				Run(ls_InstallDir + "PBUSKeyManager.exe")
			END IF
		END IF
		ib_messagedisplayed = TRUE
	END IF
	
	ib = FALSE
	RETURN 0
END IF

IF as_type = "DEVELOPER" THEN
	ld_filedate = of_Decrypt(ls_date)

	IF DaysAfter (Today(), ld_filedate ) >= 1 THEN
		
		IF DaysAfter (Today(), ld_filedate ) <= 30 THEN
			IF NOT ib_messagedisplayed THEN 
				MessageBox("PowerBuilder Ultimate Suite", "Your PBUS subscription will expire in " + String(DaysAfter (Today(), ld_filedate )) + " days.", Information!, ok!)
				ib_messagedisplayed = TRUE
			END IF
		END IF
	ELSE
		//subscription expired
		IF NOT ib_messagedisplayed THEN 
			IF MessageBox("PowerBuilder Ultimate Suite", "The developer key for PBUS has expired.~r~n~r~nWould you like to open the PBUS Key Manager to see if an update is available?", Information!, YesNo!, 1) = 1 THEN
				RegistryGet("HKEY_CURRENT_USER\Software\Werysoft\PBUS\", "InstallDir", RegString!, ls_installdir)
				
				IF FileExists(ls_InstallDir + "PBUSKeyManager.exe") THEN
					Run(ls_InstallDir + "PBUSKeyManager.exe")
				END IF
			END IF
			ib_messagedisplayed = TRUE
		END IF
		
		ib = FALSE
		RETURN 0
	END IF
END IF

ib2 = FALSE

IF as_type = "FREE" THEN
	ib = FALSE
	
//	ld_filedate = of_Decrypt(ls_date)
//	
//	IF DaysAfter (Today(), ld_filedate ) >= 1 THEN
//		
//		IF DaysAfter (Today(), ld_filedate ) <= 30 THEN
//			IF NOT ib_messagedisplayed THEN 
//				MessageBox("PowerBuilder Ultimate Suite", "Your Free PBUS subscription will expire in " + String(DaysAfter (Today(), ld_filedate )) + " days. To get another 1 year free subscription, request a new Free Edition key in the PBUS Key Manager. ", Information!, ok!)
//				ib_messagedisplayed = TRUE
//			END IF
//		END IF
//	ELSE
//		//subscription expired
//		IF NOT ib_messagedisplayed THEN 
//			IF MessageBox("PowerBuilder Ultimate Suite", "The Free Edition key for PBUS has expired.~r~n~r~nWould you like to open the PBUS Key Manager to request another 1 year free subscription?", Information!, YesNo!, 1) = 1 THEN
//				RegistryGet("HKEY_CURRENT_USER\Software\Werysoft\PBUS\", "InstallDir", RegString!, ls_installdir)
//				
//				IF FileExists(ls_InstallDir + "PBUSKeyManager.exe") THEN
//					Run(ls_InstallDir + "PBUSKeyManager.exe")
//				END IF
//			END IF
//			ib_messagedisplayed = TRUE
//		END IF
//
//		ib2 = FALSE
//		RETURN 0
//	END IF
	
	ib2 = TRUE
	RETURN 1
END IF

IF as_type = "TRIAL" THEN
	ld_filedate = of_Decrypt(ls_date)

	IF DaysAfter ( ld_filedate, Today() ) >= 30 OR &
		DaysAfter ( ld_filedate, Today() ) < 0 THEN
		ib = FALSE
		RETURN 0
	END IF
END IF

as_countryid = String(al_countryid)
as_company = as_company
as_localid = of_GetLocalId()
as_email = as_email
as_phone = as_phone
as_firstname = as_firstname
as_lastname = as_lastname
as_type = Upper(as_type)

//ls_source = as_countryid + as_company + as_localid + as_email + as_phone + as_firstname + as_lastname + as_type
ls_source = as_localid + as_type

IF lcrypto.of_md5UTF8(ls_source,lblb) = 0 THEN
	ls_key = lcrypto.of_BlobToHex(lblb)
	IF ls_savedkey = ls_key THEN
		ib = TRUE
	ELSE
		ib = FALSE
	END IF
END IF

RETURN 1
end function

public function boolean of_registered ();RETURN TRUE
IF NOT ib_regchecked THEN
	of_checkreg()
END IF

RETURN ib
end function

public function string of_key ();RETURN "38017E06-84A2-4B73-9CE5-87C0BD9A39A8"
end function

public function date of_decrypt (string a_date);string ls_list[10] = {"4","j","l","f","s","0","9","u","a","w"}

string ls_Month, ls_Day, ls_Year
string ls_newMonth, ls_newDay, ls_newYear
Long ll_Month, ll_Day, ll_Year
Long ll_index, ll_innerindex
Date ld_rtn

IF Len(Trim(a_date)) = 0 THEN RETURN ld_rtn

ls_day = Mid ( a_date, 1, 2 )
ls_month = Mid ( a_date, 3, 2 )
ls_year = Mid ( a_date, 5, 4 )

FOR ll_index = 1 TO Len(ls_day)
	FOR ll_innerindex = 1 TO UpperBound(ls_list)
		IF ls_list[ll_innerindex] = Mid ( ls_day, ll_index, 1 ) THEN
			ls_newDay += String(ll_innerindex - 1)
		END IF
	NEXT
NEXT

FOR ll_index = 1 TO Len(ls_month)
	FOR ll_innerindex = 1 TO UpperBound(ls_list)
		IF ls_list[ll_innerindex] = Mid ( ls_month, ll_index, 1 ) THEN
			ls_newmonth += String(ll_innerindex - 1)
		END IF
	NEXT
NEXT

FOR ll_index = 1 TO Len(ls_year)
	FOR ll_innerindex = 1 TO UpperBound(ls_list)
		IF ls_list[ll_innerindex] = Mid ( ls_year, ll_index, 1 ) THEN
			ls_newyear += String(ll_innerindex - 1)
		END IF
	NEXT
NEXT

ll_day = Long(ls_newday)
ll_month = Long(ls_newmonth)
ll_year = Long(ls_newyear)

IF ll_day = 0 OR ll_month = 0 OR ll_year = 0 THEN RETURN ld_rtn

RETURN date(ll_year, ll_month, ll_day)
end function

on n_cst_pbus_lic.create
call super::create
TriggerEvent( this, "constructor" )
end on

on n_cst_pbus_lic.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

