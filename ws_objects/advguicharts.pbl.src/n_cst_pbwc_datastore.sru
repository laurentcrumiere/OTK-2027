$PBExportHeader$n_cst_pbwc_datastore.sru
forward
global type n_cst_pbwc_datastore from datastore
end type
end forward

global type n_cst_pbwc_datastore from datastore
end type
global n_cst_pbwc_datastore n_cst_pbwc_datastore

type variables
string is_dberror
n_cst_pbwc_string inv_string
string is_argument_values
string is_default_value = '0'
end variables

forward prototypes
public function string of_getitem_string (integer al_row, string as_column)
public function boolean of_check_required_column (long al_row, string as_column, boolean ab_0_empty_is_null)
public function string of_get_data ()
public function any of_cast_from_string (string as_value, string as_datatype)
public function long of_retrieve_from_argument_value_list (string as_argument_values)
public function string of_getitem_string (integer al_row, string as_column, dwbuffer adwbuffer)
public function boolean of_column_exists (string as_column)
public function integer of_generic_setitem (long al_row, string as_column, any aa_value, dwbuffer adwbuffer)
public subroutine of_setitem_string (integer al_row, string as_column, string as_value, dwbuffer adwbuffer)
public subroutine of_get_data_separator (string as_column, ref string as_before, ref string as_after)
public function integer of_get_arguments (ref string as_name[], ref string as_type[])
public function string of_getitem_value (integer al_row, string as_column)
public function string of_getitem_value (integer al_row, string as_column, dwbuffer adwbuffer)
end prototypes

public function string of_getitem_string (integer al_row, string as_column);return of_getitem_string(al_row, as_column, primary!)
end function

public function boolean of_check_required_column (long al_row, string as_column, boolean ab_0_empty_is_null);//returns true if column is not empty
string ls_value
ls_value = this.of_getitem_string(al_row, as_column)
IF isnull(ls_value) then return false
IF ab_0_empty_is_null and (ls_value = "" or ls_value = "0" ) THEN return false
return true
end function

public function string of_get_data ();//returns the datastore data into a string ready for import
string ls_temp_folder,ls_data,ls_file
integer li_FileNum
this.setfilter("")
this.filter()
ls_temp_folder = gnv_config.of_get_temp_folder()
ls_file = ls_temp_folder+"\tempdata.txt"
this.saveas(ls_file,text!,false)
li_FileNum = FileOpen(ls_file,  TextMode!)
FileReadEx(li_FileNum, ls_data)
fileclose(li_FileNum)

return ls_data
end function

public function any of_cast_from_string (string as_value, string as_datatype);//cassts a string into an any variable
CHOOSE CASE as_datatype
	CASE "number"
		return  double(as_value)
	CASE "string"
		return  as_value
	CASE "date"
		return  date(as_value)
	CASE "datetime"
		return  datetime(as_value)
	CASE "time"
		return  time(as_value)
	CASE "decimal"
		return dec(as_value)
END CHOOSE

			
			
		
end function

public function long of_retrieve_from_argument_value_list (string as_argument_values);// -----------------------------------------------------------------------------
// SCRIPT:     of_retrieve_from_argument_value_list
//
// PURPOSE:    Retrieves data with arguments passed in a coma separated list string
//
// ARGUMENTS: string : arg1,arg2,arg3... up to 9
//
// RETURN:		Long: result of the retrieve function
//
// DATE        PROG/ID		DESCRIPTION OF CHANGE / REASON
// ----------  --------		-----------------------------------------------------
// 01/01/2018	FFasolin	Initial Coding
// ------------------------------------------------------------------------------
long ll_ret
string ls_arguments,ls_arg_desc,ls_arg_type,ls_arg_name, ls_arg_value
is_argument_values = as_argument_values
any arg1,arg2,arg3,arg4,arg5,arg6,arg7,arg8,arg9
int ii

string ls_argument_names[], ls_argument_types[]
this.of_get_arguments(ls_argument_names, ls_argument_types)
FOR ii = 1 to upperbound(ls_argument_names)
	ls_arg_value =  inv_string.of_gettoken(as_argument_values,",")
	ls_arg_name = 	ls_argument_names[ii]
	ls_arg_type = 	 ls_argument_types[ii]
	CHOOSE CASE ii
		CASE 1
			arg1 = of_cast_from_string(ls_arg_value,ls_arg_type)
		CASE 2
			arg2 = of_cast_from_string(ls_arg_value,ls_arg_type)
		CASE 3
			arg3 = of_cast_from_string(ls_arg_value,ls_arg_type)
		CASE 4
			arg4 = of_cast_from_string(ls_arg_value,ls_arg_type)
		CASE 5
			arg5 = of_cast_from_string(ls_arg_value,ls_arg_type)
		CASE 6
			arg6 = of_cast_from_string(ls_arg_value,ls_arg_type)
		CASE 7
			arg7 = of_cast_from_string(ls_arg_value,ls_arg_type)
		CASE 8
			arg8 = of_cast_from_string(ls_arg_value,ls_arg_type)
		CASE 9
			arg9 = of_cast_from_string(ls_arg_value,ls_arg_type)
	END CHOOSE

NEXT


ll_ret = this.retrieve(arg1,arg2,arg3,arg4,arg5,arg6,arg7,arg8,arg9)
return ll_ret
end function

public function string of_getitem_string (integer al_row, string as_column, dwbuffer adwbuffer);//returns colupmn value as a string

string ls_null,ls_return
setnull(ls_null)
int li_pos_coma




string ls_type,ls_mid_type
ls_type = lower(describe(as_column+".coltype"))
ls_mid_type = mid(ls_type,1,4)
CHOOSE case ls_mid_type
	case "char"
		ls_return = getitemstring(al_row,as_column,adwbuffer,false)
		return ls_return
	case "date"
		IF ls_type = "date" then
			ls_return= string(getitemdate(al_row,as_column,adwbuffer,false),'yyyy-mm-dd')
			return ls_return
		else
			ls_return= string(getitemdatetime(al_row,as_column,adwbuffer,false),'yyyy-mm-dd"T"hh:mm:ss')
			return ls_return
		end if
	case "real","int","long","numb","ulon"
		ls_return = string(getitemnumber(al_row,as_column,adwbuffer,false))
				//check decimal point
		IF pos(string(1.1),",") >0 THEN 
			li_pos_coma = pos(ls_return,",")
			IF li_pos_coma > 0 THEN ls_return = replace(ls_return,li_pos_coma,1,".")
		END IF
		return ls_return
	case "deci"
		ls_return = string(getitemdecimal(al_row,as_column,adwbuffer,false))
		//check decimal point
		IF dec("1.1") = 0 THEN 
			li_pos_coma = pos(ls_return,",")
			IF li_pos_coma > 0 THEN ls_return = replace(ls_return,li_pos_coma,1,".")
		END IF
		return ls_return

	case "time"
		if ls_type = "time" then
			return string(getitemtime(al_row,as_column,adwbuffer,false),'yyyy-mm-dd"T"hh:mm:ss')
		else
			return string(getitemdatetime(al_row,as_column,adwbuffer,false))
		end if
	case else
		return ls_null
		
END CHOOSE
		
end function

public function boolean of_column_exists (string as_column);string ls_type
ls_type = lower(describe(as_column+".coltype"))
IF ls_type = "?" or ls_type = "!" THEN return FALSE
return true
end function

public function integer of_generic_setitem (long al_row, string as_column, any aa_value, dwbuffer adwbuffer);//generic setitem in any buffer
integer ai_column
ai_column = integer(this.describe(as_column+".id"))
IF ai_column = 0 THEN 
	Messagebox("datastore  error","Error accessing column " + as_column + " for datastore "+ this.classname())
	return 0
END IF

Choose Case adwbuffer
Case Primary!
	this.Object.Data[al_row, ai_column] = aa_value
Case Filter!
	IF filteredcount() = 0 THEN return -1
	this.Object.Data.Filter.Current[al_row, ai_column] = aa_value
Case Delete!
	IF deletedcount() = 0 THEN return -1
	this.Object.Data.delete.current[al_row, ai_column] = aa_value
End Choose

return 1


end function

public subroutine of_setitem_string (integer al_row, string as_column, string as_value, dwbuffer adwbuffer);//sets value from a string
int li_pos_coma
long ll_value
date ldt_value
datetime lddt_value
time lt_value
double ldb_value
decimal ldc_value
string ls_date, ls_time

string ls_type,ls_mid_type
ls_type = lower(describe(as_column+".coltype"))
ls_mid_type = mid(ls_type,1,4)
CHOOSE case ls_mid_type
	case "char"
		 of_generic_setitem(al_row, as_column,as_value,adwbuffer)
	case "date"
		IF ls_type = "date" then
			ldt_value = date(as_value)
			of_generic_setitem(al_row, as_column,ldt_value,adwbuffer)
		else
			ls_date = inv_string.of_gettoken(as_value," ")
			ldt_value = date(as_value)
			ls_time = as_value
			lt_value =  time(as_value)
			lddt_value = datetime(ldt_value,lt_value)
			of_generic_setitem(al_row, as_column,lddt_value,adwbuffer)
		end if
	case "real","int","long","numb","ulon"
		//check decimal point
		IF dec("1.1") = 0 THEN 
			li_pos_coma = pos(as_value,".")
			IF li_pos_coma > 0 THEN as_value = replace(as_value,li_pos_coma,1,",")
		END IF
		ldb_value = double(as_value)
		of_generic_setitem(al_row, as_column,ldb_value,adwbuffer)
	case "deci"
			//check decimal point
		IF dec("1.1") = 0 THEN 
			li_pos_coma = pos(as_value,".")
			IF li_pos_coma > 0 THEN as_value = replace(as_value,li_pos_coma,1,",")
		END IF
		ldb_value = dec(as_value)
		of_generic_setitem(al_row, as_column,ldc_value,adwbuffer)
	case "time"
			lt_value =time(as_value)
			of_generic_setitem(al_row, as_column,lt_value,adwbuffer)
	case else
		return
		
END CHOOSE
		
end subroutine

public subroutine of_get_data_separator (string as_column, ref string as_before, ref string as_after);// -----------------------------------------------------------------------------
// SCRIPT:     of_get_data_separator
//
// PURPOSE:    Returns the separators for a column depending on its datatype
//
// ARGUMENTS: string : column name
//					ref string : separator before value
//					ref string : separator after value
//
// RETURN:		
//
// DATE        PROG/ID		DESCRIPTION OF CHANGE / REASON
// ----------  --------		-----------------------------------------------------
// 01/01/2018	FFasolin	Initial Coding
// ------------------------------------------------------------------------------
string ls_return

string ls_type,ls_mid_type
ls_type = lower(describe(as_column+".coltype"))
ls_mid_type = mid(ls_type,1,4)
CHOOSE case ls_mid_type
	case "char"
		as_before = "'"
		as_after = "'"
	case "date"
		IF ls_type = 'datetime' THEN
			as_before = "datetime('"
			as_after = "')"
		ELSE
			as_before = "date('"
			as_after = "')"
		END IF
	case "real","int","long","numb","ulon"
		as_before = ""
		as_after = ""
	case "deci"
		as_before = ""
		as_after = ""

	case "time"
		as_before = "time('"
		as_after = "')"
	case else
		as_before = "'"
		as_after = "'"
		
END CHOOSE
		
end subroutine

public function integer of_get_arguments (ref string as_name[], ref string as_type[]);////////////////////////////////////////////////////////////////////////////
//
//
// Function:     of_GetArguments
//
// Access:       Public
//
// Arguments:    
//               as_name       - (ref) array of argument names
//               as_type       - (ref) array of argument types
//
// Returns:      Integer
//                >0 if it succeeds (the number of arguments)
//                 0 if there are no arguments
//                -1 if an error occurs
//
// Description:  Returns the names and types of arguments that are used inthe
//               given DataWindow.
//
////////////////////////////////////////////////////////////////////////////
//
//
// Revision History
//
// Version
// 1.0 Initial version
//
////////////////////////////////////////////////////////////////////////////
//

String ls_name[], ls_type[], ls_syntax, ls_arguments
Long   ll_begin, ll_end, ll_index

// Get the DataWindow syntax
ls_syntax = this.Describe("DataWindow.Syntax")

// Locate the arguments cluster
ll_begin = Pos(ls_syntax, "arguments=((", 1)

IF ll_begin = 0 THEN
 // There are no arguments
 RETURN 0
ELSE
 // Go to the first argument
 ll_begin += 11
END IF

// Locate the end of the arguments cluster
ll_end = Pos(ls_syntax, "))", ll_begin) + 1

// Get all of the arguments
ls_arguments = Mid(ls_syntax, ll_begin, ll_end - ll_begin)

// Tokenize the argument string
DO WHILE Len(ls_arguments) > 1
 ll_index++

 // Compute the begin and end of the argument name
 ll_begin = Pos(ls_arguments, '"', 1) + 1
 ll_end = Pos(ls_arguments, '"', ll_begin + 1)

 // Store the argument name
 ls_name[ll_index] = Mid(ls_arguments, ll_begin, ll_end - ll_begin)

 // Remove the argument name from the list
 ls_arguments = Mid(ls_arguments, ll_end + 1)

 // Compute the begin and end of the argument type
 ll_begin = Pos(ls_arguments, ',', 1) + 1
 ll_end = Pos(ls_arguments, ")", 1)

 // Store the argument type
 ls_type[ll_index] = Trim(Mid(ls_arguments, ll_begin, ll_end - ll_begin))

 // Remove the argument type from the list
 ls_arguments = Trim(Mid(ls_arguments, ll_end + 1))
LOOP

// Return the arrays
as_name = ls_name
as_type = ls_type

RETURN ll_index
end function

public function string of_getitem_value (integer al_row, string as_column);return of_getitem_value(al_row, as_column, primary!)
end function

public function string of_getitem_value (integer al_row, string as_column, dwbuffer adwbuffer);//returns colupmn value as a string

string ls_null,ls_return
setnull(ls_null)
int li_pos_coma




string ls_type,ls_mid_type
ls_type = lower(describe(as_column+".coltype"))
ls_mid_type = mid(ls_type,1,4)
CHOOSE case ls_mid_type
	case "char"
		ls_return = getitemstring(al_row,as_column,adwbuffer,false)
		return ls_return
	case "date"
		IF ls_type = "date" then
			ls_return= string(getitemdate(al_row,as_column,adwbuffer,false))
			if isnull(ls_return) THEN ls_return = is_default_value
			return ls_return
		else
			ls_return= string(getitemdatetime(al_row,as_column,adwbuffer,false))
			if isnull(ls_return) THEN ls_return =is_default_value
			return ls_return
		end if
	case "real","int","long","numb","ulon"
		ls_return = string(getitemnumber(al_row,as_column,adwbuffer,false))
				//check decimal point
		IF pos(string(1.1),",") >0 THEN 
			li_pos_coma = pos(ls_return,",")
			IF li_pos_coma > 0 THEN ls_return = replace(ls_return,li_pos_coma,1,".")
		END IF
		if isnull(ls_return) THEN ls_return = is_default_value
		return ls_return
	case "deci"
		ls_return = string(getitemdecimal(al_row,as_column,adwbuffer,false))
		//check decimal point
		IF dec("1.1") = 0 THEN 
			li_pos_coma = pos(ls_return,",")
			IF li_pos_coma > 0 THEN ls_return = replace(ls_return,li_pos_coma,1,".")
		END IF
		if isnull(ls_return) THEN ls_return = is_default_value
		return ls_return

	case "time"
		if ls_type = "time" then
			return string(getitemtime(al_row,as_column,adwbuffer,false))
		else
			return string(getitemdatetime(al_row,as_column,adwbuffer,false))
		end if
	case else
		if isnull(ls_return) THEN ls_return = is_default_value
		return ls_null
		
END CHOOSE
		
end function

on n_cst_pbwc_datastore.create
call super::create
TriggerEvent( this, "constructor" )
end on

on n_cst_pbwc_datastore.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

event retrievestart;is_dberror = ""
end event

event dberror;is_dberror = sqlerrtext
messagebox(this.classname(),sqlerrtext)
end event

event error;messagebox(this.classname(),errortext)
end event

