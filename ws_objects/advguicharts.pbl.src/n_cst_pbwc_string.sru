$PBExportHeader$n_cst_pbwc_string.sru
forward
global type n_cst_pbwc_string from nonvisualobject
end type
end forward

global type n_cst_pbwc_string from nonvisualobject autoinstantiate
end type

forward prototypes
public function string of_globalreplace (string as_source, string as_old, string as_new)
public function string of_globalreplace (string as_source, string as_old, string as_new, boolean ab_ignorecase)
public function string of_gettoken (ref string as_source, string as_separator)
public subroutine of_refglobalreplace (ref string as_source, string as_oldstring, string as_newstring)
public function string of_binglobalreplace (string as_source, string as_search, string as_replacement)
public function string of_getxml_value (string as_xml_string, string as_xml_tag)
public function string of_gettokken_number (string as_source, string as_separator, integer ai_number)
end prototypes

public function string of_globalreplace (string as_source, string as_old, string as_new);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_GlobalReplace
//
//	Access:  		public
//
//	Arguments:
//	as_Source		The string being searched.
//	as_Old			The old string being replaced.
//	as_New			The new string.
// 
//Returns:  		string
//						as_Source with all occurrences of as_Old replaced with as_New.
//						If any argument's value is NULL, function returns NULL.
//
//	Description:  	Replace all occurrences of one string inside another with
//						a new string.
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	5.0   Initial version
//
//////////////////////////////////////////////////////////////////////////////
//
/*
 * Open Source PowerBuilder Foundation Class Libraries
 *
 * Copyright (c) 2004-2005, All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted in accordance with the GNU Lesser General
 * Public License Version 2.1, February 1999
 *
 * http://www.gnu.org/copyleft/lesser.html
 *
 * ====================================================================
 *
 * This software consists of voluntary contributions made by many
 * individuals and was originally based on software copyright (c) 
 * 1996-2004 Sybase, Inc. http://www.sybase.com.  For more
 * information on the Open Source PowerBuilder Foundation Class
 * Libraries see http://pfc.codexchange.sybase.com
*/
//
//////////////////////////////////////////////////////////////////////////////

//Check parameters

If IsNull(as_source) or IsNull(as_old) or IsNull(as_new) Then
	string ls_null
	SetNull(ls_null)
	Return ls_null
End If

//The default is to ignore Case
as_Source = of_GlobalReplace (as_source, as_old, as_new, True)

Return as_Source


end function

public function string of_globalreplace (string as_source, string as_old, string as_new, boolean ab_ignorecase);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_GlobalReplace
//
//	Access:  		public
//
//	Arguments:
//	as_Source		The string being searched.
//	as_Old			The old string being replaced.
//	as_New			The new string.
// ab_IgnoreCase	A boolean stating to ignore case sensitivity.
//
//	Returns:  		string
//						as_Source with all occurrences of as_Old replaced with as_New.
//						If any argument's value is NULL, function returns NULL.
//
//	Description:  	Replace all occurrences of one string inside another with
//						a new string.
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	5.0   Initial version
//
//////////////////////////////////////////////////////////////////////////////
//
/*
 * Open Source PowerBuilder Foundation Class Libraries
 *
 * Copyright (c) 2004-2005, All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted in accordance with the GNU Lesser General
 * Public License Version 2.1, February 1999
 *
 * http://www.gnu.org/copyleft/lesser.html
 *
 * ====================================================================
 *
 * This software consists of voluntary contributions made by many
 * individuals and was originally based on software copyright (c) 
 * 1996-2004 Sybase, Inc. http://www.sybase.com.  For more
 * information on the Open Source PowerBuilder Foundation Class
 * Libraries see http://pfc.codexchange.sybase.com
*/
//
//////////////////////////////////////////////////////////////////////////////

Long	ll_Start
Long	ll_OldLen
Long	ll_NewLen
String ls_Source

//Check parameters
If IsNull(as_source) or IsNull(as_old) or IsNull(as_new) or IsNull(ab_ignorecase) Then
	string ls_null
	SetNull(ls_null)
	Return ls_null
End If

//Get the string lenghts
ll_OldLen = Len(as_Old)
ll_NewLen = Len(as_New)

//Should function respect case.
If ab_ignorecase Then
	as_old = Lower(as_old)
	ls_source = Lower(as_source)
Else
	ls_source = as_source
End If

//Search for the first occurrence of as_Old
ll_Start = Pos(ls_Source, as_Old)

Do While ll_Start > 0
	// replace as_Old with as_New
	as_Source = Replace(as_Source, ll_Start, ll_OldLen, as_New)
	
	//Should function respect case.
	If ab_ignorecase Then 
		ls_source = Lower(as_source)
	Else
		ls_source = as_source
	End If
	
	// find the next occurrence of as_Old
	ll_Start = Pos(ls_Source, as_Old, (ll_Start + ll_NewLen))
Loop

Return as_Source

end function

public function string of_gettoken (ref string as_source, string as_separator);//////////////////////////////////////////////////////////////////////////////
//	Public Function:		of_GetToken
//	Arguments:			as_source		The source string passed by reference
//							as_separator	Separator character in the source string which will be 
//												used to determine the length of characters to strip from
//												the left end of the source string.
//	Returns:  			string
//							The token stripped off of the source string.
//							If the separator character does not appear in the string, 
//							the entire source string is returned.
//							Otherwise, it returns the token stripped off of the left
//							end of the source string (not including the separator character)
//							If any argument's value is NULL, function returns NULL.
//	Description:  		This function strips a source string (from the left) up 
//							to the occurrence of a specified separator character.
//////////////////////////////////////////////////////////////////////////////
//	Rev. History:	Version
//						5.0   Initial version
//						8.0  Changed li_pos variable to type long ll_pos
//////////////////////////////////////////////////////////////////////////////
/*
 * Open Source PowerBuilder Foundation Class Libraries
 *
 * Copyright (c) 2004-2005, All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted in accordance with the GNU Lesser General
 * Public License Version 2.1, February 1999
 *
 * http://www.gnu.org/copyleft/lesser.html
 *
 * ====================================================================
 *
 * This software consists of voluntary contributions made by many
 * individuals and was originally based on software copyright (c) 
 * 1996-2004 Sybase, Inc. http://www.sybase.com.  For more
 * information on the Open Source PowerBuilder Foundation Class
 * Libraries see http://pfc.codexchange.sybase.com
*/
//////////////////////////////////////////////////////////////////////////////
long 		ll_pos
string 	ls_ret

//Check parameters
If IsNull(as_source) or IsNull(as_separator) Then
	string ls_null
	SetNull(ls_null)
	Return ls_null
End If

/////////////////////////////////////////////////////////////////////////////////
// Get the position of the separator
/////////////////////////////////////////////////////////////////////////////////
ll_pos = Pos(as_source, as_separator)	

/////////////////////////////////////////////////////////////////////////////////
// Compute the length of the token to be stripped off of the source string.
/////////////////////////////////////////////////////////////////////////////////

// If no separator, the token to be stripped is the entire source string
if ll_pos = 0 then
	ls_ret = as_source
	as_source = ""	
else
	// Otherwise, return just the token and strip it & the separator from the source string
	ls_ret = Mid(as_source, 1, ll_pos - 1)
	as_source = Right(as_source, Len(as_source) - (ll_pos+Len(as_separator)-1) )
end if

return ls_ret
end function

public subroutine of_refglobalreplace (ref string as_source, string as_oldstring, string as_newstring);//replace all occurence of a string from another string passed by ref (to speed up the process)
long ll_startpos
ll_startpos = Pos(as_source,as_oldstring)
 
DO WHILE ll_startpos > 0
	as_source = Replace(as_source,ll_startpos,Len(as_oldstring),as_newstring)
	ll_startpos = Pos(as_source,as_oldstring,ll_startpos+Len(as_newstring))
LOOP


end subroutine

public function string of_binglobalreplace (string as_source, string as_search, string as_replacement);// -----------------------------------------------------------------------------
// SCRIPT:     of_global_replace
//
// PURPOSE:    replace a string by another into a string using blob functions to go faster
//
// ARGUMENTS:  string	- source text
//					string text to replace
//					string : text replacing
//
// RETURN:		string - resulting text 
//
// DATE        PROG/ID		DESCRIPTION OF CHANGE / REASON
// ----------  --------		-----------------------------------------------------
// 01/01/2018	FFasolin	Initial Coding
// ------------------------------------------------------------------------------
IF IsNull(as_source)    THEN     RETURN as_source
IF Trim(as_source) = "" THEN     RETURN as_source

string ls_mid, ls_result
long ll_pos_start=1,ll_len_as_search , ll_next_pos=1,ll_pos_search
blob lblb_source,lblb_replacement,lblb_result,lblb_mid
lblb_source =  Blob(as_source)
lblb_replacement = Blob(as_replacement)
lblb_result = blob(space(len(as_source)*4))

ll_len_as_search = len(as_search)  
ll_pos_search = Pos(as_source,as_search,1) 
DO WHILE ll_pos_search > 0 
	ll_next_pos = BlobEdit(lblb_result,ll_next_pos, blobmid(lblb_source,ll_pos_start *2 -1, (ll_pos_search - ll_pos_start)*2  ) )
	ll_next_pos = BlobEdit(lblb_result,ll_next_pos, lblb_replacement )
	ll_pos_start = ll_pos_search+ll_len_as_search
	ll_pos_search = Pos(as_source,as_search,ll_pos_start) 
LOOP 
IF ll_pos_start > 0 THEN
	ll_pos_search = len(as_source) +1
	ll_next_pos = BlobEdit(lblb_result,ll_next_pos, blobmid(lblb_source,ll_pos_start *2 -1, (ll_pos_search - ll_pos_start)*2  ) )
END IF

ls_result = string( blobmid(lblb_result,1,ll_next_pos))
return ls_result 






end function

public function string of_getxml_value (string as_xml_string, string as_xml_tag);// -----------------------------------------------------------------------------
// SCRIPT:     of_of_getxml_value
//
// PURPOSE:    return the value of an xml tag
//
// ARGUMENTS: string : xml code
// RETURN:		string : value
//
// DATE        PROG/ID		DESCRIPTION OF CHANGE / REASON
// ----------  --------		-----------------------------------------------------
// 01/01/2018	FFasolin	Initial Coding
// ------------------------------------------------------------------------------
long ll_pos_start,ll_pos_end
string ls_value 
ll_pos_start = pos(as_xml_string,"<"+as_xml_tag+">")
IF ll_pos_start = 0 THEN return "?"
ll_pos_start += len(as_xml_tag) + 2
ll_pos_end  = pos(as_xml_string,"</"+as_xml_tag+">",ll_pos_start)
IF ll_pos_end = 0 THEN return "?"
ls_value = mid(as_xml_string,ll_pos_start,ll_pos_end - ll_pos_start )
return ls_value


end function

public function string of_gettokken_number (string as_source, string as_separator, integer ai_number);//Returns the tokken number ai_number of a string
int ii
string ls_return

FOR ii =1 to ai_number
	ls_return = this.of_gettoken(as_source, as_separator)
NEXT

return ls_return
end function

on n_cst_pbwc_string.create
call super::create
TriggerEvent( this, "constructor" )
end on

on n_cst_pbwc_string.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

