$PBExportHeader$n_uspb_cryptoapi.sru
forward
global type n_uspb_cryptoapi from nonvisualobject
end type
end forward

global type n_uspb_cryptoapi from nonvisualobject autoinstantiate
end type

type prototypes
Function ulong GetLastError( ) Library "kernel32.dll"

Function ulong FormatMessage( &
	ulong dwFlags, &
	ulong lpSource, &
	ulong dwMessageId, &
	ulong dwLanguageId, &
	Ref string lpBuffer, &
	ulong nSize, &
	ulong Arguments &
	) Library "kernel32.dll" Alias For "FormatMessageW"

Function ulong CreateFile ( &
	string lpFileName, &
	ulong dwDesiredAccess, &
	ulong dwShareMode, &
	ulong lpSecurityAttributes, &
	ulong dwCreationDisposition, &
	ulong dwFlagsAndAttributes, &
	ulong hTemplateFile &
	) Library "kernel32.dll" Alias For "CreateFileW"

Function boolean CloseHandle ( &
	ulong hObject &
	) Library "kernel32.dll"

Function boolean ReadFile ( &
	ulong hFile, &
	Ref Blob lpBuffer, &
	ulong nNumberOfBytesToRead, &
	Ref ulong lpNumberOfBytesRead, &
	ulong lpOverlapped &
	) Library "kernel32.dll"

Function boolean WriteFile ( &
	ulong hFile, &
	blob lpBuffer, &
	ulong nNumberOfBytesToWrite, &
	Ref ulong lpNumberOfBytesWritten, &
	ulong lpOverlapped &
	) Library "kernel32.dll"

Function Boolean CryptAcquireContext ( &
	Ref ulong phProv, &
	string pszContainer, &
	string pszProvider, &
	ulong dwProvType, &
	ulong dwFlags &
	) Library "advapi32.dll" Alias For "CryptAcquireContextW"

Function Boolean CryptCreateHash ( &
	ulong hProv, &
	ulong Algid, &
	ulong hKey, &
	ulong dwFlags, &
	Ref ulong phHash &
	) Library "advapi32.dll" Alias For "CryptCreateHash"

Function Boolean CryptDecrypt ( &
	ulong hKey, &
	ulong hHash, &
	boolean Final, &
	ulong dwFlags, &
	Ref blob pbData, &
	Ref ulong pdwDataLen &
	) Library "advapi32.dll" Alias For "CryptDecrypt"

Function Boolean CryptDeriveKey ( &
	ulong hProv, &
	ulong Algid, &
	ulong hBaseData, &
	ulong dwFlags, &
	Ref ulong phKey &
	) Library "advapi32.dll" Alias For "CryptDeriveKey"

Function Boolean CryptDestroyHash ( &
	ulong hHash &
	) Library "advapi32.dll" Alias For "CryptDestroyHash"

Function Boolean CryptDestroyKey ( &
	ulong hKey &
	) Library "advapi32.dll" Alias For "CryptDestroyKey"

Function Boolean CryptEncrypt ( &
	ulong hKey, &
	ulong hHash, &
	boolean Final, &
	ulong dwFlags, &
	Ref blob pbData, &
	Ref ulong pdwDataLen, &
	ulong dwBufLen &
	) Library "advapi32.dll" Alias For "CryptEncrypt"

Function Boolean CryptHashData ( &
	ulong hHash, &
	string pbData, &
	ulong dwDataLen, &
	ulong dwFlags &
	) Library "advapi32.dll" Alias For "CryptHashData;Ansi"

Function Boolean CryptReleaseContext ( &
	ulong hProv, &
	ulong dwFlags &
	) Library "advapi32.dll" Alias For "CryptReleaseContext"

Function Boolean CryptGetDefaultProvider ( &
	ulong dwProvType, &
	ulong pdwReserved, &
	ulong dwFlags, &
	Ref string pszProvName, &
	Ref ulong pcbProvName &
	) Library "advapi32.dll" Alias For "CryptGetDefaultProviderW"

Function Boolean CryptEnumProviders ( &
	ulong dwIndex, &
	ulong pdwReserved, &
	ulong dwFlags, &
	Ref ulong pdwProvType, &
	Ref string pszProvName, &
	Ref ulong pcbProvName &
	) Library "advapi32.dll" Alias For "CryptEnumProvidersW"

Function Boolean CryptEnumProviders ( &
	ulong dwIndex, &
	ulong pdwReserved, &
	ulong dwFlags, &
	Ref ulong pdwProvType, &
	ulong pszProvName, &
	Ref ulong pcbProvName &
	) Library "advapi32.dll" Alias For "CryptEnumProvidersW"

end prototypes

type variables
Private:

// constants for CreateFile API function
Constant ULong INVALID_HANDLE_VALUE = -1
Constant ULong GENERIC_READ     = 2147483648
Constant ULong GENERIC_WRITE    = 1073741824
Constant ULong FILE_SHARE_READ  = 1
Constant ULong FILE_SHARE_WRITE = 2
Constant ULong CREATE_NEW			= 1
Constant ULong CREATE_ALWAYS		= 2
Constant ULong OPEN_EXISTING		= 3
Constant ULong OPEN_ALWAYS			= 4
Constant ULong TRUNCATE_EXISTING = 5

// constants for cypto api
Constant String KEY_CONTAINER 	= "MyKeyContainer"
Constant ULong CALG_MD5				= 32771
Constant ULong CALG_RC4				= 26625
Constant ULong ENCRYPT_ALGORITHM = CALG_RC4
Constant ULong CRYPT_NEWKEYSET   = 8
Constant ULong ERROR_MORE_DATA	= 234

// active Cryptographic service provider
String is_cryptoservice

Public:

// Provider Types
Constant ULong PROV_RSA_FULL			= 1
Constant ULong PROV_RSA_SIG			= 2
Constant ULong PROV_DSS					= 3
Constant ULong PROV_FORTEZZA			= 4
Constant ULong PROV_MS_EXCHANGE		= 5
Constant ULong PROV_SSL					= 6
Constant ULong PROV_RSA_SCHANNEL		= 12
Constant ULong PROV_DSS_DH				= 13
Constant ULong PROV_EC_ECDSA_SIG		= 14
Constant ULong PROV_EC_ECNRA_SIG		= 15
Constant ULong PROV_EC_ECDSA_FULL	= 16
Constant ULong PROV_EC_ECNRA_FULL	= 17
Constant ULong PROV_SPYRUS_LYNKS		= 20

end variables

forward prototypes
public subroutine of_getlasterror (ref unsignedlong aul_error, ref string as_msgtext)
private function blob of_encryptdecrypt (blob ablob_data, string as_password, boolean ab_encrypt)
public function string of_getdefaultprovider ()
public function blob of_encrypt (blob ablob_data, string as_password)
public function blob of_decrypt (blob ablob_data, string as_password)
public function string of_encrypt (string as_data, string as_password, boolean ab_removebad)
public function string of_decrypt (string as_data, string as_password, boolean ab_removebad)
public function unsignedlong of_readfile (string as_filename, ref blob ablob_contents)
public function integer of_writefile (string as_filename, blob ablob_filedata)
public subroutine of_setprovider (string as_cryptoservice)
public function string of_encrypt (string as_data, string as_password)
public function string of_decrypt (string as_data, string as_password)
public function integer of_enumproviders (unsignedlong aul_dwtype, ref string as_provider[])
end prototypes

public subroutine of_getlasterror (ref unsignedlong aul_error, ref string as_msgtext);// -----------------------------------------------------------------------------
// SCRIPT:     n_cryptoapi.of_GetLastError
//
// PURPOSE:    This function returns the most recent API error message.
//
// ARGUMENTS:  aul_error	- The error number ( by ref )
//					as_msgtext	- The error text ( by ref )
//
// DATE        PROG/ID		DESCRIPTION OF CHANGE / REASON
// ----------  --------		-----------------------------------------------------
// 12/26/2006	RolandS		Initial Coding
// -----------------------------------------------------------------------------

Constant ULong FORMAT_MESSAGE_FROM_SYSTEM = 4096
Constant ULong LANG_NEUTRAL = 0
ULong lul_rtn

aul_error = GetLastError()

as_msgtext = Space(200)

lul_rtn = FormatMessage(FORMAT_MESSAGE_FROM_SYSTEM, 0, &
				aul_error, LANG_NEUTRAL, as_msgtext, 200, 0)

end subroutine

private function blob of_encryptdecrypt (blob ablob_data, string as_password, boolean ab_encrypt);// -----------------------------------------------------------------------------
// SCRIPT:     n_cryptoapi.of_EncryptDecrypt
//
// PURPOSE:    This function will encrypt/decrypt the blob passed to it. Both
//					encrypt/decrypt have the same api calls except one so they
//					are combined to save coding.
//
// ARGUMENTS:  ablob_data	- The blob to be decrypted
//					as_password	- The secret password
//
// RETURN:		Blob containing the decrypted data.
//
// DATE        PROG/ID		DESCRIPTION OF CHANGE / REASON
// ----------  --------		-----------------------------------------------------
// 12/26/2006	RolandS		Initial Coding
// -----------------------------------------------------------------------------

ULong hCryptProv, hHash, hKey
ULong lul_datalen, lul_buflen, lul_error
Blob lblob_buffer, lblob_value
String ls_msgtext

// Get handle to CSP
If Not CryptAcquireContext(hCryptProv, &
				KEY_CONTAINER, is_cryptoservice, PROV_RSA_FULL, 0) Then
	If Not CryptAcquireContext(hCryptProv, &
					KEY_CONTAINER, is_cryptoservice, PROV_RSA_FULL, CRYPT_NEWKEYSET) Then
		of_GetLastError(lul_error, ls_msgtext)
		SignalError(lul_error, "CryptAcquireContext:~r~n~r~n" + ls_msgtext)
	End If
End If

// Create a hash object
If Not CryptCreateHash(hCryptProv, CALG_MD5, 0, 0, hHash) Then
	of_GetLastError(lul_error, ls_msgtext)
	SignalError(lul_error, &
		"CryptCreateHash:~r~n~r~n" + ls_msgtext)
End If

// Hash the password
If Not CryptHashData(hHash, as_password, Len(as_password), 0) Then
	of_GetLastError(lul_error, ls_msgtext)
	SignalError(lul_error, &
		"CryptHashData:~r~n~r~n" + ls_msgtext)
End If

// Derive a session key from the hash object
If Not CryptDeriveKey(hCryptProv, ENCRYPT_ALGORITHM, hHash, 0, hKey) Then
	of_GetLastError(lul_error, ls_msgtext)
	SignalError(lul_error, &
		"CryptDeriveKey:~r~n~r~n" + ls_msgtext)
End If

// allocate buffer space
lul_datalen = Len(ablob_data)
lblob_buffer = ablob_data + Blob(Space(8))
lul_buflen = Len(lblob_buffer)

If ab_encrypt Then
	// Encrypt data
	If CryptEncrypt(hKey, 0, True, 0, &
				lblob_buffer, lul_datalen, lul_buflen) Then
		lblob_value = BlobMid(lblob_buffer, 1, lul_datalen)
	Else
		of_GetLastError(lul_error, ls_msgtext)
		SignalError(lul_error, &
			"CryptEncrypt:~r~n~r~n" + ls_msgtext)
	End If
Else
	// Decrypt data
	If CryptDecrypt(hKey, 0, True, 0, lblob_buffer, lul_datalen) Then
		lblob_value = BlobMid(lblob_buffer, 1, lul_datalen)
	Else
		of_GetLastError(lul_error, ls_msgtext)
		SignalError(lul_error, &
			"CryptDecrypt:~r~n~r~n" + ls_msgtext)
	End If
End If

// Destroy session key
If hKey > 0 Then
	CryptDestroyKey(hKey)
End If

// Destroy hash object
If hHash > 0 Then
	CryptDestroyHash(hHash)
End If

// Release CSP handle
If hCryptProv > 0 Then
	CryptReleaseContext(hCryptProv, 0)
End If

Return lblob_value

end function

public function string of_getdefaultprovider ();// -----------------------------------------------------------------------------
// SCRIPT:     n_cryptoapi.of_GetDefaultProvider
//
// PURPOSE:    This function will return the name of the default provider.
//
// RETURN:		String containing CSP name
//
// DATE        PROG/ID		DESCRIPTION OF CHANGE / REASON
// ----------  --------		-----------------------------------------------------
// 12/26/2006	RolandS		Initial Coding
// -----------------------------------------------------------------------------

String ls_provider, ls_msgtext
ULong lul_datalen = 256, lul_error
Constant ULong CRYPT_USER_DEFAULT = 2

ls_provider = Space(lul_datalen)

If Not CryptGetDefaultProvider(PROV_RSA_FULL, &
					0, CRYPT_USER_DEFAULT, ls_provider, lul_datalen) Then
	of_GetLastError(lul_error, ls_msgtext)
	SignalError(lul_error, &
		"CryptGetDefaultProvider:~r~n~r~n" + ls_msgtext)
End If

Return ls_provider

end function

public function blob of_encrypt (blob ablob_data, string as_password);// -----------------------------------------------------------------------------
// SCRIPT:     n_cryptoapi.of_Encrypt
//
// PURPOSE:    This function will encrypt the blob passed to it.
//
// ARGUMENTS:  ablob_data	- The blob to be encrypted
//					as_password	- The secret password
//
// RETURN:		Blob containing the encrypted data.
//
// DATE        PROG/ID		DESCRIPTION OF CHANGE / REASON
// ----------  --------		-----------------------------------------------------
// 12/26/2006	RolandS		Initial Coding
// -----------------------------------------------------------------------------

// This function will encrypt the blob passed to it.

Blob lblob_encrypted

// encrypt the data
lblob_encrypted = this.of_EncryptDecrypt( &
								ablob_data, as_password, True)

Return lblob_encrypted

end function

public function blob of_decrypt (blob ablob_data, string as_password);// -----------------------------------------------------------------------------
// SCRIPT:     n_cryptoapi.of_Decrypt
//
// PURPOSE:    This function will decrypt the blob passed to it.
//
// ARGUMENTS:  ablob_data	- The blob to be decrypted
//					as_password	- The secret password
//
// RETURN:		Blob containing the decrypted data.
//
// DATE        PROG/ID		DESCRIPTION OF CHANGE / REASON
// ----------  --------		-----------------------------------------------------
// 12/26/2006	RolandS		Initial Coding
// -----------------------------------------------------------------------------

Blob lblob_decrypted

// decrypt the data
lblob_decrypted = this.of_EncryptDecrypt( &
								ablob_data, as_password, False)

Return lblob_decrypted

end function

public function string of_encrypt (string as_data, string as_password, boolean ab_removebad);// -----------------------------------------------------------------------------
// SCRIPT:     n_cryptoapi.of_Encrypt
//
// PURPOSE:    This function will encrypt the string passed to it.
//
// ARGUMENTS:  as_data			- The string to be decrypted
//					as_password		- The secret password
//					ab_removebad	- True = remove TAB, LF, CR from encrypted result
//										  by adding a number to the password and
//										  prepending it to the result.
//
// RETURN:		String containing the decrypted data.
//
// DATE        PROG/ID		DESCRIPTION OF CHANGE / REASON
// ----------  --------		-----------------------------------------------------
// 12/26/2006	RolandS		Initial Coding
// -----------------------------------------------------------------------------

Constant Char TAB = Char(9)	// Tab
Constant Char LF  = Char(10)	// Linefeed
Constant Char CR  = Char(13)	// Carriage Return
String ls_encrypted, ls_newpass, ls_msgtext
Blob lblob_data, lblob_encrypted
Integer li_count = 1

// encrypt the data
lblob_data = Blob(as_data, EncodingAnsi!)
lblob_encrypted = this.of_EncryptDecrypt( &
								lblob_data, as_password, True)
ls_encrypted = String(lblob_encrypted, EncodingAnsi!)

If ab_removebad Then
	// try again if result contains a bad character
	Do While Pos(ls_encrypted, LF,  1) > 0 &
			Or Pos(ls_encrypted, CR,  1) > 0 &
			Or Pos(ls_encrypted, TAB, 1) > 0 &
			Or Len(ls_encrypted) <> Len(as_data)
		// append counter to password
		If li_count = 1 Then
			li_count = 14
		Else
//			If li_count = 255 Then
//				ls_msgtext = "Unable to successfully encrypt this data"
//				SignalError(999, &
//					"of_EncryptData:~r~n~r~n" + ls_msgtext)
//			Else
				li_count++
			//End If
		End If
		ls_newpass = as_password + String(li_count)
		// try again to encrypt
		lblob_data = Blob(as_data, EncodingAnsi!)
		lblob_encrypted = this.of_EncryptDecrypt( &
										lblob_data, ls_newpass, True)
		ls_encrypted = String(lblob_encrypted, EncodingAnsi!)
	Loop
	// prepend attempt count
	If Len(ls_encrypted) > 0 Then
		ls_encrypted = Char(li_count) + ls_encrypted
	End If
End If

Return ls_encrypted

end function

public function string of_decrypt (string as_data, string as_password, boolean ab_removebad);// -----------------------------------------------------------------------------
// SCRIPT:     n_cryptoapi.of_Decrypt
//
// PURPOSE:    This function will decrypt the string passed to it.
//
// ARGUMENTS:  as_data			- The string to be decrypted
//					as_password		- The secret password
//					ab_removebad	- True = 1st character is a number to be
//										  added on to the password
//
// RETURN:		String containing the decrypted data.
//
// DATE        PROG/ID		DESCRIPTION OF CHANGE / REASON
// ----------  --------		-----------------------------------------------------
// 12/26/2006	RolandS		Initial Coding
// -----------------------------------------------------------------------------

String ls_decrypted, ls_data, ls_newpass
Blob lblob_data, lblob_decrypted
Integer li_count

If ab_removebad Then
	// first char is attempt count
	ls_data = Mid(as_data, 2)
	// get attempt count
	li_count = Asc(Left(as_data, 1))
	If li_count = 1 Then
		// decrypt the data
		lblob_data = Blob(ls_data, EncodingAnsi!)
		lblob_decrypted = this.of_EncryptDecrypt( &
										lblob_data, as_password, False)
		ls_decrypted = String(lblob_decrypted, EncodingAnsi!)
	Else
		ls_newpass = as_password + String(li_count)
		// decrypt the data
		lblob_data = Blob(ls_data, EncodingAnsi!)
		lblob_decrypted = this.of_EncryptDecrypt( &
										lblob_data, ls_newpass, False)
		ls_decrypted = String(lblob_decrypted, EncodingAnsi!)
	End If
Else
	// decrypt the data
	lblob_data = Blob(as_data, EncodingAnsi!)
	lblob_decrypted = this.of_EncryptDecrypt( &
									lblob_data, as_password, False)
	ls_decrypted = String(lblob_decrypted, EncodingAnsi!)
End If

Return ls_decrypted

end function

public function unsignedlong of_readfile (string as_filename, ref blob ablob_contents);// -----------------------------------------------------------------------------
// SCRIPT:     n_cryptoapi.of_ReadFile
//
// PURPOSE:    This function reads a file from disk.
//
// ARGUMENTS:  as_filename		- Name of the file
//					ablob_contents	- File contents (by ref)
//
// RETURN:		>0		= Number of bytes read
//					-1		= Error occurred
//
// DATE        PROG/ID		DESCRIPTION OF CHANGE / REASON
// ----------  --------		-----------------------------------------------------
// 12/26/2006	RolandS		Initial Coding
// -----------------------------------------------------------------------------

ULong lul_file, lul_bytes, lul_length
Boolean lb_result

// get file length
lul_length = FileLength(as_filename)

// open file for read
lul_file = CreateFile(as_filename, GENERIC_READ, &
					FILE_SHARE_READ, 0, OPEN_EXISTING, 0, 0)
If lul_file = INVALID_HANDLE_VALUE Then
	Return -1
End If

// read the entire file contents in one shot
ablob_contents = Blob(Space(lul_length), EncodingAnsi!)
lb_result = ReadFile(lul_file, ablob_contents, &
					lul_length, lul_bytes, 0)

// close the file
CloseHandle(lul_file)

Return lul_bytes

end function

public function integer of_writefile (string as_filename, blob ablob_filedata);// -----------------------------------------------------------------------------
// SCRIPT:     n_cryptoapi.of_WriteFile
//
// PURPOSE:    This function writes a blob to a file on disk.
//
// ARGUMENTS:  as_filename		- The name of the file
//					ablob_filedata	- The blob data of the file
//
// RETURN:		0	= Success
//
// DATE        PROG/ID		DESCRIPTION OF CHANGE / REASON
// ----------  --------		-----------------------------------------------------
// 05/01/2005	RolandS		Initial Coding
// -----------------------------------------------------------------------------

ULong lul_file, lul_length, lul_written
Boolean lb_rtn

// open file for write
lul_file = CreateFile(as_filename, GENERIC_WRITE, &
					FILE_SHARE_WRITE, 0, CREATE_ALWAYS, 0, 0)
If lul_file = INVALID_HANDLE_VALUE Then
	Return -999
End If

// write file to disk
lul_length = Len(ablob_filedata)
lb_rtn = WriteFile(lul_file, ablob_filedata, &
					lul_length, lul_written, 0)

// close the file
CloseHandle(lul_file)

Return 0

end function

public subroutine of_setprovider (string as_cryptoservice);// -----------------------------------------------------------------------------
// SCRIPT:     n_cryptoapi.of_SetProvider
//
// PURPOSE:    This function sets the provider name.
//
// ARGUMENTS:  as_cryptoservice - Name of the provider
//
// DATE        PROG/ID		DESCRIPTION OF CHANGE / REASON
// ----------  --------		-----------------------------------------------------
// 12/26/2006	RolandS		Initial Coding
// -----------------------------------------------------------------------------

is_cryptoservice = as_cryptoservice

end subroutine

public function string of_encrypt (string as_data, string as_password);// encrypt string defaulting last argument
Return of_Encrypt(as_data, as_password, False)

end function

public function string of_decrypt (string as_data, string as_password);// decrypt string defaulting last argument
Return of_Decrypt(as_data, as_password, False)

end function

public function integer of_enumproviders (unsignedlong aul_dwtype, ref string as_provider[]);// -----------------------------------------------------------------------------
// SCRIPT:     n_cryptoapi.of_EnumProviders
//
// PURPOSE:    This function will return a list of providers
//
// ARGUMENTS:  aul_dwType	- The type of providers to return
//					as_Provider	- Array of providers ( by ref )
//
// RETURN:		The number of returned providers
//
// DATE        PROG/ID		DESCRIPTION OF CHANGE / REASON
// ----------  --------		-----------------------------------------------------
// 05/01/2008	RolandS		Initial Coding
// -----------------------------------------------------------------------------

ULong lul_error, lul_dwIndex, lul_dwType, lul_cbName
String ls_provider, ls_msgtext
Integer li_index

lul_dwIndex = 0
do while CryptEnumProviders(lul_dwIndex, 0, 0, &
							lul_dwType, 0, lul_cbName)
	ls_provider = Space(lul_cbName)
	If CryptEnumProviders(lul_dwIndex, 0, 0, &
						lul_dwType, ls_provider, lul_cbName) Then
		If lul_dwType = aul_dwType Then
			li_index = UpperBound(as_provider) + 1
			as_Provider[li_index] = ls_provider
		End If
	Else
		of_GetLastError(lul_error, ls_msgtext)
		SignalError(lul_error, &
			"CryptEnumProviders:~r~n~r~n" + ls_msgtext)
	End If
	lul_dwIndex++
loop

Return UpperBound(as_provider)

end function

on n_uspb_cryptoapi.create
call super::create
TriggerEvent( this, "constructor" )
end on

on n_uspb_cryptoapi.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

