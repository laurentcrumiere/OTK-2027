$PBExportHeader$n_uspb_crypto.sru
$PBExportComments$crypting algorithms
forward
global type n_uspb_crypto from nonvisualobject
end type
end forward

global type n_uspb_crypto from nonvisualobject autoinstantiate
end type

type prototypes
//private:
  FUNCTION Boolean CryptAcquireContext (ref LongPtr hProv, &
     ref string pszContainer, &
      ref string pszProvider, ulong dwProvType, &
      ulong dwFlags) &
	alias for "CryptAcquireContextW" &
    LIBRARY "advapi32.dll"
 FUNCTION Boolean CryptReleaseContext (LongPtr hProv, ulong dwFlags) &
    LIBRARY "advapi32.dll"

 FUNCTION Boolean CryptCreateHash (LongPtr hProv, uint Algid, ulong hKey, &
      ulong dwFlags, ref LongPtr phHash) &
    LIBRARY "advapi32.dll"

 FUNCTION Boolean CryptHashData (LongPtr hHash,  ref string pbData, &
      ulong dwDataLen, ulong dwFlags) &
    LIBRARY "advapi32.dll"

 FUNCTION Boolean CryptHashData (LongPtr hHash,  ref blob pbData, &
      ulong dwDataLen, ulong dwFlags) &
    LIBRARY "advapi32.dll"

 FUNCTION Boolean CryptDestroyHash (LongPtr hHash) &
    LIBRARY "advapi32.dll"

 FUNCTION Boolean CryptGetHashParam (LongPtr hHash, ulong dwParam, &
     ref blob pbData, &
     ref ulong pdwDataLen, ulong dwFlags) &
    LIBRARY "advapi32.dll"

 FUNCTION Ulong GetLastError () Library "kernel32.dll"
end prototypes

type variables
// Constants
private:
CONSTANT ULONG PROV_RSA_FULL = 1
CONSTANT ULONG CRYPT_VERIFYCONTEXT  =  4026531840 // 0xF0000000
CONSTANT ULONG CALG_MD5 = 32771 // 4<<13 | 0 | 3
CONSTANT ULONG HP_HASHVAL = 2 //  0x0002

protected:

end variables

forward prototypes
public function integer of_md5 (string as_text, ref blob ablb_md5)
public function integer of_md5 (blob ablb_in, ref blob ablb_md5)
public function string of_blobtohex (blob ablb)
private function integer of_hexval (character ac_digit)
public function blob of_hextoblob (string as_string)
public function integer of_md5utf8 (string as_text, ref blob ablb_md5)
public function integer of_md5 (string as_text, ref blob ablb_md5)
public function integer of_md5 (blob ablb_in, ref blob ablb_md5)
public function string of_blobtohex (blob ablb)
private function integer of_hexval (character ac_digit)
public function blob of_hextoblob (string as_string)
public function integer of_md5utf8 (string as_text, ref blob ablb_md5)
end prototypes

public function integer of_md5 (string as_text, ref blob ablb_md5);// Calculate the MD5 message digest hash of a string
// Using the Windows Crypto API
// Note: if as_text is a Unicode String... you will find extra chars (1x2x3x4x, x is char(0), 1..4 are chars 1..4)

return of_md5(Blob(as_text), ablb_md5)


end function

public function integer of_md5 (blob ablb_in, ref blob ablb_md5);// Calculate the MD5 message digest hash of a blob
// Using the Windows Crypto API

integer li_ret
ulong lul_md5len = 16
LongPtr lul_hprov // provider handle
LongPtr lul_hHash // hash handle
ulong lul_err // error number
ulong lul_cbHash = 0
blob{16} lblb_hash
blob{1} lblb_byte
string ls_null
integer li_multi // for double byte characters

setnull(ls_null)
exception le
le = CREATE exception

try
	//Get handle to the crypto provider
	IF NOT CryptAcquireContext(lul_hProv, ls_null, ls_null, PROV_RSA_FULL, CRYPT_VERIFYCONTEXT) THEN
		lul_err = GetLastError() 
		li_ret = -1
		le.SetMessage("CryptAcquireContext failed " + String (lul_err))
		Throw le
	END IF
	
	// Create the hash object
	IF NOT CryptCreateHash(lul_hProv, CALG_MD5, 0, 0, lul_hHash) THEN
		lul_err = GetLastError()
		CryptReleaseContext(lul_hProv, 0) 
		li_ret = -2
		le.SetMessage("CryptCreateHash failed "+string(lul_err))
		Throw le
	END IF
	  
	// Add the input to the hash
	IF NOT CryptHashData(lul_hHash, ablb_in, Len(ablb_in), 0) THEN
		lul_err = GetLastError()
		CryptDestroyHash(lul_hHash)
		CryptReleaseContext(lul_hProv, 0)
		li_ret = -3
		le.SetMessage("CryptHashData failed "+string(lul_err))
		Throw le
	END IF
	
	// Get the hash value and convert it to readable characters
	lul_cbHash = lul_MD5LEN
	IF (CryptGetHashParam(lul_hHash, HP_HASHVAL, lblb_hash, lul_cbHash, 0)) THEN
		ablb_md5 = lblb_hash
	ELSE
		lul_err = GetLastError()
		//return 'gethashparam failed ' + String (err_number)
		li_ret = -4
		le.SetMessage( "CryptGetHashParam failed "+string(lul_err))
		Throw le
	END IF
	
	// clean up
	CryptDestroyHash(lul_hHash)
	CryptReleaseContext(lul_hProv, 0)
catch (exception e)
	Messagebox("Crypto Error", "Error in of_md5: "+le.getmessage())
end try

return li_ret

end function

public function string of_blobtohex (blob ablb);// converts a blob in a hex string in blob

blob{1} lblb_0
blob{2} lblb_byte
char lc_hex[0 to 15]={'0','1','2','3','4','5','6','7','8','9','A','B','C','D','E','F'}
integer li, li_byte, li_r, li_l
string ls_ret
blobedit(lblb_0, 1, char(0))
for li = 1 to 16
	lblb_byte = blobmid(ablb,li,1)+lblb_0 // word, LSB=char, MSB=0
	//li_byte = asc(string(lblb_byte,EncodingUTF16LE!)) // old
	li_byte = asc(string(lblb_byte)) // new
	li_r = mod(li_byte, 16) // right 4 bits
	li_l = li_byte / 16 // left 4 bits
	ls_ret += lc_hex[li_l]+lc_hex[li_r]
next

return ls_ret

end function

private function integer of_hexval (character ac_digit);// returns the digit value

choose case upper(ac_digit)
	case '0' to '9'
		return integer(ac_digit)
	case 'A' to 'F'
		return asc(ac_digit) - 55
	case else
		return 0
end choose

end function

public function blob of_hextoblob (string as_string);// converts a valid hex string in blob. If the string is not valid it returns an empty blob

blob lblb_ret
blob{2} lblb_byte
string ls_hex
integer li, li_byte
char lch
for li = 1 to len(as_string) step 2
	ls_hex = mid(as_string, li, 2)
	li_byte = of_hexval(left(ls_hex, 1))*16+of_hexval(right(ls_hex,1))
	//blobedit(lblb_byte, 1, li_byte,EncodingUTF16LE) // old
	blobedit(lblb_byte, 1, li_byte) // new
	lblb_ret += blobmid(lblb_byte,1,1)
next

return lblb_ret

end function

public function integer of_md5utf8 (string as_text, ref blob ablb_md5);// Calculate the MD5 message digest hash of a string
// Using the Windows Crypto API
// Note: if as_text is a Unicode String... you will find extra chars (1x2x3x4x, x is char(0), 1..4 are chars 1..4)

return of_md5(Blob(as_text, EncodingUTF16LE!), ablb_md5)


end function

on n_uspb_crypto.create
call super::create
TriggerEvent( this, "constructor" )
end on

on n_uspb_crypto.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

