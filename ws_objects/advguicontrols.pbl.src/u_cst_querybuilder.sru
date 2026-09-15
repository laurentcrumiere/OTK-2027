$PBExportHeader$u_cst_querybuilder.sru
forward
global type u_cst_querybuilder from u_cst_pbus_base
end type
type st_1 from u_cst_splitbar within u_cst_querybuilder
end type
type uo_client from u_cst_pbus_client within u_cst_querybuilder
end type
type tab_1 from tab within u_cst_querybuilder
end type
type tp_select from userobject within tab_1
end type
type dw_6 from datawindow within tp_select
end type
type tp_select from userobject within tab_1
dw_6 dw_6
end type
type tabpage_5 from userobject within tab_1
end type
type dw_5 from u_dw_grid within tabpage_5
end type
type tabpage_5 from userobject within tab_1
dw_5 dw_5
end type
type tabpage_2 from userobject within tab_1
end type
type dw_2 from u_dw_grid within tabpage_2
end type
type tabpage_2 from userobject within tab_1
dw_2 dw_2
end type
type tabpage_3 from userobject within tab_1
end type
type dw_8 from datawindow within tabpage_3
end type
type dw_3 from datawindow within tabpage_3
end type
type tabpage_3 from userobject within tab_1
dw_8 dw_8
dw_3 dw_3
end type
type tabpage_4 from userobject within tab_1
end type
type dw_4 from u_dw_grid within tabpage_4
end type
type tabpage_4 from userobject within tab_1
dw_4 dw_4
end type
type tabpage_1 from userobject within tab_1
end type
type dw_7 from datawindow within tabpage_1
end type
type dw_1 from datawindow within tabpage_1
end type
type tabpage_1 from userobject within tab_1
dw_7 dw_7
dw_1 dw_1
end type
type tabpage_6 from userobject within tab_1
end type
type uo_1 from u_cst_pbus_editor within tabpage_6
end type
type tabpage_6 from userobject within tab_1
uo_1 uo_1
end type
type tab_1 from tab within u_cst_querybuilder
tp_select tp_select
tabpage_5 tabpage_5
tabpage_2 tabpage_2
tabpage_3 tabpage_3
tabpage_4 tabpage_4
tabpage_1 tabpage_1
tabpage_6 tabpage_6
end type
end forward

global type u_cst_querybuilder from u_cst_pbus_base
integer width = 2601
integer height = 1380
string text = "Graphic Query"
string picturename = "Join!"
long picturemaskcolor = 12632256
st_1 st_1
uo_client uo_client
tab_1 tab_1
end type
global u_cst_querybuilder u_cst_querybuilder

type prototypes
PUBLIC FUNCTION Long SetParent(Long hChild, Long hParent) Library 'user32.dll'
end prototypes

type variables
CONSTANT String SQLServer = "mss"
CONSTANT String Sybase = "syc"
CONSTANT String SQLAnywhere = "asa"
CONSTANT String Oracle = "ora"
CONSTANT String GenericODBC = "odb"

transaction itr
n_cst_ddl_sql inv_schema
u_dw_table idw_table[]
window iw_parent

Boolean ib_togglejoin

String is_database
String is_file
String is_dbms

end variables

forward prototypes
public function integer of_settransactionobject (transaction atr)
public function window of_getparentwindow ()
public function integer of_loadcolumnlist ()
public function integer of_additem (string as_item)
public function integer of_removeitem (string as_item)
public function string of_getsyntax ()
public function integer of_addtable ()
public function string of_gettablename (string as_table)
public function integer of_gettableiteration (string as_table)
public function integer of_closetable (u_dw_table adw_table)
public function long of_getrightmost ()
public function integer of_rearrange ()
public function integer of_loadtable (string as_table)
public function integer of_openquery ()
public function integer of_closealltables ()
public function u_dw_table of_gettable (string as_table)
public function integer of_savequeryas ()
public function integer of_savequery ()
public function integer of_openquery (string as_file)
public function integer of_savereport ()
public function integer of_newquery ()
public function integer of_parsetoarray (string as_source, string as_delimiter, ref string as_array[])
public function integer of_copy ()
public function integer of_cut ()
public function integer of_paste ()
public function integer of_undo ()
public function integer of_selectall ()
public function integer of_savequeryas (string as_file, integer ai_flag)
public function integer of_additem (string as_item, boolean ab_refreshsql)
public function integer of_removeitem (string as_item, boolean ab_refreshsql)
public function integer of_refreshsql ()
public function integer of_createrelationship (u_dw_table tablea, long rowa, u_dw_table tableb, long rowb)
public function integer of_createrelationships (u_dw_table newtable)
public function u_dw_table of_gettablebybase (string as_table)
public function string of_GetDBMS ()
public function integer of_SetDBMS (string dbms)
public function integer of_changedb (string as_dbase)
public function integer of_toggleautojoin (boolean ab_switch)
public function integer of_updatesqlsyntax ()
public function string of_getjoinsyntax (ref boolean ab_whereadded)
private function boolean of_tableisinarrary (string as_tablename, str_pbus_primarytable astr_primarytables[])
private function long of_tablefromarrary (string as_tablename, str_pbus_primarytable astr_primarytables[])
private function long of_tablefromsecondaryarrary (string as_tablename, str_pbus_primarytable astr_primarytable)
private function boolean of_tableisinsecondaryarrary (string as_tablename, str_pbus_primarytable astr_primarytables[])
public function boolean of_isfileutf8 (string as_file)
public function integer of_setparentwindow (window aw_parent)
end prototypes

public function integer of_settransactionobject (transaction atr);itr = atr

RETURN 1
end function

public function window of_getparentwindow ();Window lw_parent
GraphicObject lgo

lgo = THIS.GetParent()

DO UNTIL lgo.TypeOf() = Window!
	lgo = lgo.GetParent()
LOOP

lw_parent = lgo

RETURN lw_parent
end function

public function integer of_loadcolumnlist ();Long ll_count, ll_index, ll_row, ll_sortrow, ll_grouprow, ll_havingrow
Long ll_computerow
Long ll_innerindex, ll_rowcount
string ls_item
n_cst_pbus_string lnv_string

ll_count = UpperBound(idw_table)
DataWindowChild ldwc
DataWindowChild ldwchaving
DataWindowChild ldwccompute


tab_1.tabpage_1.dw_1.Reset()
tab_1.tabpage_3.dw_3.Reset()

tab_1.tabpage_2.dw_2.GetChild('column_name', ldwc)
ldwc.Reset()

tab_1.tabpage_4.dw_4.GetChild('column_name', ldwchaving)
ldwchaving.Reset()

tab_1.tabpage_5.dw_5.GetChild('column_name', ldwccompute)
ldwccompute.Reset()

FOR ll_index = 1 TO ll_count
	
	IF NOT IsValid(idw_table[ll_index]) THEN
		CONTINUE
	END IF
	
	ll_rowcount = idw_table[ll_index].RowCount()
	
	FOR ll_innerindex = 1 TO ll_rowcount
		ll_row = ldwc.InsertRow(0)
		ll_havingrow = ldwchaving.InsertRow(0)
		ll_sortrow = tab_1.tabpage_1.dw_1.InsertRow(0)
		ll_grouprow = tab_1.tabpage_3.dw_3.InsertRow(0)
		ll_computerow = ldwccompute.InsertRow(0)
		
		
		ls_item = '"' + lnv_string.of_GlobalReplace(idw_table[ll_index].of_GetTable() + '.' + idw_table[ll_index].GetItemString(ll_innerindex, 'syscolumns_name'), ".", '"."') + '"'
		
		ldwc.SetItem(ll_row, 1, ls_item)
		ldwchaving.SetItem(ll_havingrow, 1, ls_item)
		ldwccompute.SetItem(ll_computerow, 1, ls_item)
		tab_1.tabpage_1.dw_1.SetItem(ll_sortrow, 1, ls_item)
		tab_1.tabpage_3.dw_3.SetItem(ll_grouprow, 1, ls_item)
		
	NEXT
	
NEXT

RETURN 1


end function

public function integer of_additem (string as_item);RETURN of_AddItem(as_item, TRUE)
end function

public function integer of_removeitem (string as_item);RETURN of_RemoveItem(as_item, TRUE)
end function

public function string of_getsyntax ();String ls_syntax, ls_join, ls_item
Long ll_index, ll_rowcount
n_cst_pbus_string lnv_string

ls_syntax ='SELECT '

tab_1.tabpage_2.dw_2.AcceptText()
tab_1.tabpage_1.dw_7.AcceptText()
tab_1.tabpage_4.dw_4.AcceptText()
tab_1.tabpage_5.dw_5.AcceptText()

ll_rowcount = tab_1.tp_select.dw_6.RowCount()


FOR ll_index = 1 TO ll_rowcount
	
	ls_item = '"' + lnv_string.of_GlobalReplace(tab_1.tp_select.dw_6.GetItemString(ll_index, 1), ".", '"."') + '"'
	
	IF ll_index = ll_rowcount THEN
		IF tab_1.tabpage_5.dw_5.GetItemString(1,1) <> '' THEN
			ls_syntax = ls_syntax + ls_item + ',~r~n'
		ELSE
			ls_syntax = ls_syntax + ls_item + '~r~n'
		END IF
	ELSE
		ls_syntax = ls_syntax + ls_item + ',~r~n'
	END IF
	
NEXT

//Compute
ll_rowcount = tab_1.tabpage_5.dw_5.RowCount()

FOR ll_index = 1 TO ll_rowcount
	IF Len(Trim(tab_1.tabpage_5.dw_5.GetItemString(ll_index, 1))) > 0 AND &
	   NOT IsNull(tab_1.tabpage_5.dw_5.GetItemString(ll_index, 1)) THEN
		IF ll_index = ll_rowcount THEN	
			ls_syntax = ls_syntax + tab_1.tabpage_5.dw_5.GetItemString(ll_index, 1) + '~r~n'
		ELSE
			ls_syntax = ls_syntax + tab_1.tabpage_5.dw_5.GetItemString(ll_index, 1) + ',~r~n'
		END IF
	END IF
NEXT

Boolean lb_whereadded
ls_syntax = ls_syntax + of_GetJoinSyntax(lb_whereadded)

ll_rowcount = tab_1.tabpage_2.dw_2.RowCount()

FOR ll_index = 1 TO ll_rowcount
	IF Len(tab_1.tabpage_2.dw_2.GetItemString(ll_index, 1)) > 0 THEN
		IF lb_whereadded THEN
			ls_syntax = ls_syntax + ' AND '
		ELSE
			ls_syntax = ls_syntax + ' WHERE '
			lb_whereadded = TRUE
		END IF
		
		ls_syntax = ls_syntax + '(' + tab_1.tabpage_2.dw_2.GetItemString(ll_index, 1) + ' ' + &
		                        tab_1.tabpage_2.dw_2.GetItemString(ll_index, 2) + ' ' + &
										lnv_string.of_IsNull(tab_1.tabpage_2.dw_2.GetItemString(ll_index, 3), 'NULL') + ' ) ' + &
										Upper(tab_1.tabpage_2.dw_2.GetItemString(ll_index, 4)) + '~r~n'
	END IF
NEXT

ll_rowcount = tab_1.tabpage_3.dw_8.RowCount()

IF ll_rowcount > 0 THEN
	ls_syntax = ls_syntax + 'GROUP BY '
END IF

FOR ll_index = 1 TO ll_rowcount
	IF ll_index = ll_rowcount THEN	
		ls_syntax = ls_syntax + tab_1.tabpage_3.dw_8.GetItemString(ll_index, 1) + '~r~n'
	ELSE
		ls_syntax = ls_syntax + tab_1.tabpage_3.dw_8.GetItemString(ll_index, 1) + ',~r~n'
	END IF
	
NEXT

ll_rowcount = tab_1.tabpage_4.dw_4.RowCount()

IF ll_rowcount > 0 THEN
	IF Len(tab_1.tabpage_4.dw_4.GetItemString(1, 1)) > 0 THEN
		ls_syntax = ls_syntax + 'HAVING '
	END IF
END IF

FOR ll_index = 1 TO ll_rowcount
	IF Len(tab_1.tabpage_4.dw_4.GetItemString(ll_index, 1)) > 0 THEN
		ls_syntax = ls_syntax + '(' + tab_1.tabpage_4.dw_4.GetItemString(ll_index, 1) + ' ' + &
		                        tab_1.tabpage_4.dw_4.GetItemString(ll_index, 2) + ' ' + &
										tab_1.tabpage_4.dw_4.GetItemString(ll_index, 3) + ' ) ' + &
										tab_1.tabpage_4.dw_4.GetItemString(ll_index, 4) + '~r~n'
	END IF
NEXT

ll_rowcount = tab_1.tabpage_1.dw_7.RowCount()

IF ll_rowcount > 0 THEN
	ls_syntax = ls_syntax + 'ORDER BY '
END IF

FOR ll_index = 1 TO ll_rowcount
	IF ll_index = ll_rowcount THEN	
		ls_syntax = ls_syntax + tab_1.tabpage_1.dw_7.GetItemString(ll_index, 1) + ' ' + &
		                        tab_1.tabpage_1.dw_7.GetItemString(ll_index, 2) + '~r~n'
	ELSE
		ls_syntax = ls_syntax + tab_1.tabpage_1.dw_7.GetItemString(ll_index, 1) + ' ' + &
		                        tab_1.tabpage_1.dw_7.GetItemString(ll_index, 2) + ',~r~n'
	END IF
NEXT

RETURN ls_syntax
end function

public function integer of_addtable ();DataStore lds
u_dw_table ldw_table
Long ll_item, ll_pos, ll_prev, ll_x, ll_period, ll_count, ll_index
String ls_name, ls_selected, ls_newname

IF of_GetDBMS() = 'ora' THEN
	OpenWithParm(w_tablelist_oracle, itr)
ELSE
	lds = CREATE DataStore
	lds.DataObject = 'd_table_list_display'
	
	inv_schema.is_user = itr.LogId
	inv_schema.of_ChangeSQL(itr, inv_schema.TABLELIST, of_GetDBMS(), lds, '')
	
	lds.SetTransObject(itr)
	IF of_GetDBMS() <> 'odb' THEN lds.Retrieve()
	
	OpenWithParm(w_tablelist, lds)
END IF

ls_selected = Message.StringParm

IF ls_selected = '@@CANCEL@@' THEN
   IF IsValid(lds) THEN	DESTROY lds
	RETURN 0
END IF

ll_pos = Pos(ls_selected, ';')
ll_prev = 1

DO UNTIL ll_pos = 0
	
	ls_name = Mid(ls_selected, ll_prev, ll_pos - ll_prev)
	
	ll_x = of_GetRightMost()
	
	ll_item = UpperBound(idw_table) + 1
	idw_table[ll_item] = ldw_table
	
	of_GetParentWindow().OpenUserObject(idw_table[ll_item])
	idw_table[ll_item].of_SetParent(THIS)
	SetParent(Handle(idw_table[ll_item]), Handle(uo_client))
	
	
	IF of_GetDBMS() = 'ora' THEN
		ll_period = Pos(ls_name, '.', 1)
		
		IF ll_period > 0 THEN
			inv_schema.is_user = Left(ls_name, ll_period - 1)
			ls_newname = Mid(ls_name, ll_period + 1, Len(ls_name))
		ELSE
			inv_schema.is_user = itr.LogId
			ls_newname = ls_name 
		END IF
	ELSE
		ls_newname = ls_name 
	END IF
	
	inv_schema.of_ChangeSQL(itr, inv_schema.TABLEEXTRACT, of_GetDBMS(), idw_table[ll_item], ls_newname)
	
	idw_table[ll_item].of_SetBaseTableName(ls_name)
	
	IF Len(Trim(is_database)) > 0 THEN
		CHOOSE CASE of_GetDBMS()
			CASE 'syc'
				ls_name = is_database + '.' + ls_name
			CASE 'mss'
				ls_name = is_database + '.' + ls_name
			CASE 'ora'
				ls_name = ls_name
		END CHOOSE
	END IF
	
	idw_table[ll_item].of_SetTable(ls_name)
	idw_table[ll_item].of_SetIteration(of_GetTableIteration(ls_name),of_GetTableName(ls_name))
	idw_table[ll_item].SetTransObject(itr)
	
	IF of_GetDBMS() <> 'odb' THEN 
		idw_table[ll_item].Retrieve()
	ELSE
		idw_table[ll_item].of_AdjustHeight()
	END IF
	
	idw_table[ll_item].X = ll_x
	
	ll_prev = ll_pos + 1
	ll_pos = Pos(ls_selected, ';', ll_prev)

	//of_CreateRelationships(idw_table[ll_item])

LOOP

ll_count = UpperBound(idw_table)

FOR ll_index = 1 TO ll_count
	IF IsValid(idw_table[ll_index]) THEN
		of_CreateRelationships(idw_table[ll_index])
	END IF
NEXT

of_LoadColumnList()

tab_1.tabpage_6.uo_1.of_SetText(of_GetSyntax())
tab_1.tabpage_6.uo_1.of_Format()
tab_1.tabpage_6.uo_1.of_SetFocus()

IF IsValid(lds) THEN	DESTROY lds

of_UpdateSqlSyntax()

RETURN 1
end function

public function string of_gettablename (string as_table);String ls_tablename
Long ll_iteration

ll_iteration = of_GetTableIteration(as_table)

IF ll_iteration > 1 THEN
	ls_tablename = as_table + '_' + String(ll_iteration)
ELSE
	ls_tablename = as_table
END IF

RETURN ls_tablename
end function

public function integer of_gettableiteration (string as_table);Integer li_iteration
Long ll_index, ll_rowcount

ll_rowcount = UpperBound(idw_table)

FOR ll_index = 1 TO ll_rowcount
	
	IF IsValid(idw_table[ll_index]) THEN
		IF idw_table[ll_index].is_table = as_table THEN
			IF idw_table[ll_index].ii_iteration > li_iteration THEN
				li_iteration = idw_table[ll_index].ii_iteration
			END IF
		END IF
	END IF
	
NEXT

li_iteration = li_iteration + 1

RETURN li_iteration
end function

public function integer of_closetable (u_dw_table adw_table);Long ll_index, ll_rowcount, ll_found
u_dw_table ldw
String ls_table

ll_rowcount = UpperBound(idw_table)

FOR ll_index = 1 TO ll_rowcount
	
	IF IsValid(idw_table[ll_index]) THEN
		IF idw_table[ll_index] = adw_table THEN
			ls_table = idw_table[ll_index].Title + '.%'
			idw_table[ll_index] = ldw
		END IF
	END IF
	
NEXT

of_LoadColumnList()

ll_rowcount = tab_1.tp_select.dw_6.RowCount()
ll_found = tab_1.tp_select.dw_6.Find('table_column like "' + ls_table + '"', 1, ll_rowcount)

DO UNTIL ll_found = 0
	tab_1.tp_select.dw_6.DeleteRow(ll_found)
	ll_found = tab_1.tp_select.dw_6.Find('table_column like "' + ls_table + '"', 1, ll_rowcount)

LOOP

RETURN 1
end function

public function long of_getrightmost ();Long ll_index, ll_rowcount
Long ll_x

ll_rowcount = UpperBound(idw_table)

FOR ll_index = 1 TO ll_rowcount
	
	IF IsValid(idw_table[ll_index]) THEN
		IF idw_table[ll_index].X + idw_table[ll_index].Width > ll_x THEN
			ll_x = idw_table[ll_index].X + idw_table[ll_index].Width + 100
		END IF
	END IF
	
NEXT

RETURN ll_x
end function

public function integer of_rearrange ();Long ll_index, ll_rowcount

ll_rowcount = UpperBound(idw_table)

FOR ll_index = 1 TO ll_rowcount
	
	IF IsValid(idw_table[ll_index]) THEN
		idw_table[ll_index].TriggerEvent('positionchanging')
	END IF
	
NEXT

RETURN 1
end function

public function integer of_loadtable (string as_table);DataStore lds
u_dw_table ldw_table
Long ll_item, ll_pos, ll_x
String ls_name, ls_database

ls_name = as_table
	
ll_x = of_GetRightMost()

ll_item = UpperBound(idw_table) + 1
idw_table[ll_item] = ldw_table

of_GetParentWindow().OpenUserObject(idw_table[ll_item])
idw_table[ll_item].of_SetParent(THIS)
SetParent(Handle(idw_table[ll_item]), Handle(uo_client))

ll_pos = Pos(ls_name, '.', 1)

IF ll_pos > 0 THEN
	CHOOSE CASE of_GetDBMS()
		CASE 'syc', 'mss', 'ora'
			ls_database = Left(ls_name, ll_pos - 1)
			inv_schema.is_user = ls_database
			
			of_ChangeDB(ls_database)
			
			ls_name = Right(ls_name, Len(ls_name) - ll_pos)
	END CHOOSE
	
END IF

inv_schema.of_ChangeSQL(itr, inv_schema.TABLEEXTRACT, of_GetDBMS(), idw_table[ll_item], ls_name)

CHOOSE CASE of_GetDBMS()
		CASE 'syc', 'mss', 'ora'
			IF Len(Trim(ls_database)) > 0 THEN
				ls_name = ls_database + '.' + ls_name
			END IF
	END CHOOSE

idw_table[ll_item].of_SetTable(ls_name)
idw_table[ll_item].of_SetIteration(of_GetTableIteration(ls_name),of_GetTableName(ls_name))
idw_table[ll_item].SetTransObject(itr)
IF of_GetDBMS() <> 'odb' THEN idw_table[ll_item].Retrieve()
idw_table[ll_item].X = ll_x

of_LoadColumnList()

DESTROY lds

RETURN 1
end function

public function integer of_openquery ();String ls_path, ls_file

IF GetFileOpenName ( "Select File", &
                          ls_path, ls_file, "QRY", &
							     "Query Files (*.qry),*.qry" , "C:\My Documents", 32770) <> 1 THEN
	RETURN 0
ELSE
	RETURN of_OpenQuery(ls_path)
END IF
end function

public function integer of_closealltables ();Long ll_index, ll_rowcount

ll_rowcount = UpperBound(idw_table)

FOR ll_index = 1 TO ll_rowcount
	IF IsValid(idw_table[ll_index]) THEN
		idw_table[ll_index].Visible = FALSE
		idw_table[ll_index].Trigger Event SysCommand(61536,0,0)
	END IF
NEXT

of_RefreshSQL()

RETURN 1
end function

public function u_dw_table of_gettable (string as_table);Long ll_index, ll_rowcount

ll_rowcount = UpperBound(idw_table)

FOR ll_index = 1 TO ll_rowcount
	
	IF IsValid(idw_table[ll_index]) THEN
		IF idw_table[ll_index].Title = as_table THEN
			RETURN idw_table[ll_index]
		END IF
	END IF
	
NEXT
end function

public function integer of_savequeryas ();
//TODO: FIX
String ls_path, ls_file
integer li_rc
					
IF GetFileSaveName ( "Select File", &
                          ls_path, ls_file, "QRY", &
							     "Query Files (*.qry),*.qry" ) <> 1 THEN
	RETURN 0
ELSE
	IF Pos(ls_path, ".", 1) = 0 THEN
		ls_path = ls_path + ".qry"
	END IF
		
	RETURN of_SaveQueryAs(ls_path, 0)
END IF
RETURN 1
end function

public function integer of_savequery ();IF Len(Trim(is_file)) = 0 THEN
	RETURN of_SaveQueryAs()
ELSE
	RETURN of_SaveQueryAs(is_file, 0)
END IF
end function

public function integer of_openquery (string as_file);String ls_data
Long ll_index, ll_rowcount, ll_count
String ls_table
String ls_rows[]
u_dw_table ldw_table
n_cst_pbus_string lnv_string

is_file = as_file
	
of_CloseAllTables()

Long ll_file
String ls_firstline, ls_all

ll_file = FileOpen(is_file, LineMode!, Read!, Shared!)
FileRead(ll_file, ls_firstline)
FileClose(ll_file)
IF Len(Trim(ls_firstline)) <> 0 THEN
	ll_file = FileOpen(is_file, TextMode!, Read!, Shared!)
	FileReadEx(ll_file, ls_all)
	FileClose(ll_file)

	ll_file = FileOpen(is_file, TextMode!, Write!, Shared!, Replace!)
	FileWriteEx(ll_file, " ~r~n" + ls_all)
	FileClose(ll_file)
END IF

//SELECT
ll_count = 1
ls_data = ProfileString(is_file, 'SELECT', String(ll_count), '')
tab_1.tp_select.dw_6.Reset()

DO UNTIL ls_data = ''
	tab_1.tp_select.dw_6.ImportString(ls_data)
	ll_count ++
	ls_data = ProfileString(is_file, 'SELECT', String(ll_count), '')
LOOP

//COMPUTE	
ll_count = 1
ls_data = ProfileString(is_file, 'COMPUTE', String(ll_count), '')
tab_1.tabpage_5.dw_5.Reset()

DO UNTIL ls_data = ''
	tab_1.tabpage_5.dw_5.ImportString(ls_data)
	ll_count ++
	ls_data = ProfileString(is_file, 'COMPUTE', String(ll_count), '')
LOOP

IF tab_1.tabpage_5.dw_5.RowCount() = 0 THEN
	tab_1.tabpage_5.dw_5.InsertRow(0)
END IF

//FROM
ll_count = 1
ls_data = ProfileString(is_file, 'FROM', String(ll_count), '')

DO UNTIL ls_data = ''
	of_LoadTable(ls_data)
	ll_count ++
	ls_data = ProfileString(is_file, 'FROM', String(ll_count), '')
LOOP

//WHERE
ll_count = 1
ls_data = ProfileString(is_file, 'WHERE', String(ll_count), '')
tab_1.tabpage_2.dw_2.Reset()

DO UNTIL ls_data = ''
	tab_1.tabpage_2.dw_2.ImportString(lnv_string.of_GlobalReplace(ls_data, '"', '!@#', TRUE))
	ll_count ++
	ls_data = ProfileString(is_file, 'WHERE', String(ll_count), '')
LOOP

ll_rowcount = tab_1.tabpage_2.dw_2.RowCount()

FOR ll_index = 1 TO ll_rowcount
	tab_1.tabpage_2.dw_2.SetItem(ll_index, 1, lnv_string.of_GlobalReplace(tab_1.tabpage_2.dw_2.GetItemString(ll_index, 1), '!@#', '"', TRUE))
	tab_1.tabpage_2.dw_2.SetItem(ll_index, 3, lnv_string.of_GlobalReplace(tab_1.tabpage_2.dw_2.GetItemString(ll_index, 3), '!@#', '"', TRUE))
NEXT


//GROUP BY
ll_count = 1
ls_data = ProfileString(is_file, 'GROUPBY', String(ll_count), '')
tab_1.tabpage_3.dw_8.Reset()

DO UNTIL ls_data = ''
	tab_1.tabpage_3.dw_8.ImportString(lnv_string.of_GlobalReplace(ls_data, '"', '!@#', TRUE))
	ll_count ++
	ls_data = ProfileString(is_file, 'GROUPBY', String(ll_count), '')
LOOP

ll_rowcount = tab_1.tabpage_3.dw_8.RowCount()

FOR ll_index = 1 TO ll_rowcount
	tab_1.tabpage_3.dw_8.SetItem(ll_index, 1, lnv_string.of_GlobalReplace(tab_1.tabpage_3.dw_8.GetItemString(ll_index, 1), '!@#', '"', TRUE))
NEXT

//HAVING
ll_count = 1
ls_data = ProfileString(is_file, 'HAVING', String(ll_count), '')
tab_1.tabpage_4.dw_4.Reset()

DO UNTIL ls_data = ''
	tab_1.tabpage_4.dw_4.ImportString(lnv_string.of_GlobalReplace(ls_data, '"', '!@#', TRUE))
	ll_count ++
	ls_data = ProfileString(is_file, 'HAVING', String(ll_count), '')
LOOP

ll_rowcount = tab_1.tabpage_4.dw_4.RowCount()

FOR ll_index = 1 TO ll_rowcount
	tab_1.tabpage_4.dw_4.SetItem(ll_index, 1, lnv_string.of_GlobalReplace(tab_1.tabpage_4.dw_4.GetItemString(ll_index, 1), '!@#', '"', TRUE))
	tab_1.tabpage_4.dw_4.SetItem(ll_index, 3, lnv_string.of_GlobalReplace(tab_1.tabpage_4.dw_4.GetItemString(ll_index, 3), '!@#', '"', TRUE))
NEXT

//ORDER BY
ll_count = 1
ls_data = ProfileString(is_file, 'ORDERBY', String(ll_count), '')
tab_1.tabpage_1.dw_7.Reset()

DO UNTIL ls_data = ''
	tab_1.tabpage_1.dw_7.ImportString(lnv_string.of_GlobalReplace(ls_data, '"', '!@#', TRUE))
	ll_count ++
	ls_data = ProfileString(is_file, 'ORDERBY', String(ll_count), '')
LOOP

ll_rowcount = tab_1.tabpage_1.dw_7.RowCount()

FOR ll_index = 1 TO ll_rowcount
	tab_1.tabpage_1.dw_7.SetItem(ll_index, 1, lnv_string.of_GlobalReplace(tab_1.tabpage_1.dw_7.GetItemString(ll_index, 1), '!@#', '"', TRUE))
NEXT

IF tab_1.tabpage_2.dw_2.RowCount() = 0 THEN
	tab_1.tabpage_2.dw_2.InsertRow(0)
END IF

IF tab_1.tabpage_4.dw_4.RowCount() = 0 THEN
	tab_1.tabpage_4.dw_4.InsertRow(0)
END IF

ll_rowcount = UpperBound(idw_table)

FOR ll_index = 1 TO ll_rowcount
	IF IsValid(idw_table[ll_index]) THEN
		idw_table[ll_index].X = ProfileInt(is_file, idw_table[ll_index].of_GetTableName(), 'X', idw_table[ll_index].X)
		idw_table[ll_index].Y = ProfileInt(is_file, idw_table[ll_index].of_GetTableName(), 'Y', idw_table[ll_index].Y)
		idw_table[ll_index].Width = ProfileInt(is_file, idw_table[ll_index].of_GetTableName(), 'Width', idw_table[ll_index].Width)
		idw_table[ll_index].Height = ProfileInt(is_file, idw_table[ll_index].of_GetTableName(), 'Height', idw_table[ll_index].Height)
		
		of_ParseToArray(ProfileString(is_file, idw_table[ll_index].of_GetTableName(), 'Rows', ''), ',', ls_rows)
		
		FOR ll_count = 1 TO UpperBound(ls_rows)
			
			IF IsNumber(ls_rows[ll_count]) THEN
				idw_table[ll_index].SelectRow(Long(ls_rows[ll_count]), TRUE)
			END IF
			
		NEXT
	END IF
NEXT

ll_rowcount = UpperBound(uo_client.iuo_join)

FOR ll_index = 1 TO ll_rowcount
	IF ProfileString(is_file, 'ln_' + String(ll_index), 'Visible', 'N') = 'Y' THEN
		uo_client.iuo_join[ll_index].Visible = TRUE
		uo_client.iuo_join[ll_index].iuo_relationship.Visible = TRUE
		uo_client.iuo_join[ll_index].BeginX = ProfileInt(is_file, 'ln_' + String(ll_index), 'BeginX', uo_client.iuo_join[ll_index].BeginX)
		uo_client.iuo_join[ll_index].EndX = ProfileInt(is_file, 'ln_' + String(ll_index), 'EndX', uo_client.iuo_join[ll_index].EndX)
		uo_client.iuo_join[ll_index].BeginY = ProfileInt(is_file, 'ln_' + String(ll_index), 'BeginY', uo_client.iuo_join[ll_index].BeginY)
		uo_client.iuo_join[ll_index].EndY = ProfileInt(is_file, 'ln_' + String(ll_index), 'BeginX', uo_client.iuo_join[ll_index].EndY)
		uo_client.iuo_join[ll_index].ii_rowA = ProfileInt(is_file, 'ln_' + String(ll_index), 'RowA', 0)
		uo_client.iuo_join[ll_index].ii_rowB = ProfileInt(is_file, 'ln_' + String(ll_index), 'RowB', 0)
		uo_client.iuo_join[ll_index].iuo_relationship.Text = ProfileString(is_file, 'ln_' + String(ll_index), 'Relationship', '=')
		
		ls_table = ProfileString(is_file, 'ln_' + String(ll_index), 'TableA', '')
		
		IF Len(Trim(ls_table)) = 0 THEN
			Continue
		END IF
		
		ldw_table = of_GetTable(ls_table)
		
		ldw_table.iuo_join[UpperBound(ldw_table.iuo_join) + 1] = uo_client.iuo_join[ll_index]
		ldw_table.is_position[UpperBound(ldw_table.iuo_join)] = 'B'
		uo_client.iuo_join[ll_index].idw_tableA = ldw_table
		
		ls_table = ProfileString(is_file, 'ln_' + String(ll_index), 'TableB', '')
		
		IF Len(Trim(ls_table)) = 0 THEN
			Continue
		END IF
		
		ldw_table = of_GetTable(ls_table)
		
		ldw_table.iuo_join[UpperBound(ldw_table.iuo_join) + 1] = uo_client.iuo_join[ll_index]
		ldw_table.is_position[UpperBound(ldw_table.iuo_join)] = 'E'
		uo_client.iuo_join[ll_index].idw_tableB = ldw_table
		
		uo_client.iuo_join[ll_index].of_PositionRelationship()
	END IF
NEXT

RETURN 1
end function

public function integer of_savereport ();
//tab_1.tabpage_7.dw_9.SaveAs()

RETURN 1
end function

public function integer of_newquery ();
of_CloseAllTables()

tab_1.tabpage_2.dw_2.Reset()
tab_1.tabpage_2.dw_2.InsertRow(0)
tab_1.tabpage_1.dw_7.Reset()
tab_1.tabpage_3.dw_8.Reset()
tab_1.tabpage_4.dw_4.Reset()
tab_1.tabpage_4.dw_4.InsertRow(0)
tab_1.tp_select.dw_6.Reset()
tab_1.tabpage_6.uo_1.of_SetText('')
//tab_1.tabpage_7.dw_9.DataObject = ''
tab_1.tabpage_5.dw_5.Reset()
tab_1.tabpage_5.dw_5.InsertRow(0)

RETURN 1
end function

public function integer of_parsetoarray (string as_source, string as_delimiter, ref string as_array[]);long		ll_DelLen, ll_Pos, ll_Count, ll_Start, ll_Length
string 	ls_holder

//Check for NULL
IF IsNull(as_source) or IsNull(as_delimiter) Then
	long ll_null
	SetNull(ll_null)
	Return ll_null
End If

//Check for at leat one entry
If Trim (as_source) = '' Then
	Return 0
End If

//Get the length of the delimeter
ll_DelLen = Len(as_Delimiter)

ll_Pos =  Pos(Upper(as_source), Upper(as_Delimiter))

//Only one entry was found
if ll_Pos = 0 then
	as_Array[1] = as_source
	return 1
end if

//More than one entry was found - loop to get all of them
ll_Count = 0
ll_Start = 1
Do While ll_Pos > 0
	
	//Set current entry
	ll_Length = ll_Pos - ll_Start
	ls_holder = Mid (as_source, ll_start, ll_length)

	// Update array and counter
	ll_Count ++
	as_Array[ll_Count] = ls_holder
	
	//Set the new starting position
	ll_Start = ll_Pos + ll_DelLen

	ll_Pos =  Pos(Upper(as_source), Upper(as_Delimiter), ll_Start)
Loop

//Set last entry
ls_holder = Mid (as_source, ll_start, Len (as_source))

// Update array and counter if necessary
if Len (ls_holder) > 0  then
	ll_count++
	as_Array[ll_Count] = ls_holder
end if

//Return the number of entries found
Return ll_Count
end function

public function integer of_copy ();CHOOSE CASE tab_1.SelectedTab
	CASE 1
	CASE 2
		tab_1.tabpage_5.dw_5.Copy()
	CASE 3
		tab_1.tabpage_2.dw_2.Copy()
	CASE 4
	CASE 5
		tab_1.tabpage_4.dw_4.Copy()
	CASE 6
	CASE 7
		tab_1.tabpage_6.uo_1.of_Copy()
END CHOOSE

RETURN 1
end function

public function integer of_cut ();CHOOSE CASE tab_1.SelectedTab
	CASE 1
	CASE 2
		tab_1.tabpage_5.dw_5.Cut()
	CASE 3
		tab_1.tabpage_2.dw_2.Cut()
	CASE 4
	CASE 5
		tab_1.tabpage_4.dw_4.Cut()
	CASE 6
	CASE 7
		tab_1.tabpage_6.uo_1.of_Cut()
END CHOOSE

RETURN 1
end function

public function integer of_paste ();CHOOSE CASE tab_1.SelectedTab
	CASE 1
	CASE 2
		tab_1.tabpage_5.dw_5.Paste()
	CASE 3
		tab_1.tabpage_2.dw_2.Paste()
	CASE 4
	CASE 5
		tab_1.tabpage_4.dw_4.Paste()
	CASE 6
	CASE 7
		tab_1.tabpage_6.uo_1.of_Paste()
END CHOOSE

RETURN 1
end function

public function integer of_undo ();CHOOSE CASE tab_1.SelectedTab
	CASE 1
	CASE 2
		tab_1.tabpage_5.dw_5.Undo()
	CASE 3
		tab_1.tabpage_2.dw_2.Undo()
	CASE 4
	CASE 5
		tab_1.tabpage_4.dw_4.Undo()
	CASE 6
	CASE 7
		tab_1.tabpage_6.uo_1.of_Undo()
END CHOOSE

RETURN 1
end function

public function integer of_selectall ();CHOOSE CASE tab_1.SelectedTab
	CASE 1
	CASE 2
	CASE 3
	CASE 4
	CASE 5
	CASE 6
	CASE 7
		tab_1.tabpage_6.uo_1.of_SelectAll()
END CHOOSE

RETURN 1
end function

public function integer of_savequeryas (string as_file, integer ai_flag);
//TODO: FIX
Int il_file
Long ll_row, ll_index, ll_rowcount, ll_count
String ls_rows, ls_title, ls_filebkup

ls_filebkup = is_file

is_file = as_file

tab_1.tp_select.dw_6.AcceptText( )
tab_1.tabpage_2.dw_2.AcceptText( )
tab_1.tabpage_3.dw_8.AcceptText( )
tab_1.tabpage_4.dw_4.AcceptText( )
tab_1.tabpage_1.dw_7.AcceptText( )
tab_1.tabpage_5.dw_5.AcceptText( )

IF of_IsFileUTF8(is_file) THEN
	il_file = FileOpen(is_file, LineMode!, Write!, LockWrite!, Replace!, EncodingUTF8!)
ELSE
	il_file = FileOpen(is_file, LineMode!, Write!, LockWrite!, Replace!)
END IF

FileWrite(il_file, ' ')

FileWrite(il_file, '[SELECT]')
ll_rowcount = tab_1.tp_select.dw_6.RowCount()

FOR ll_index = 1 TO ll_rowcount
	FileWrite(il_file, String(ll_index) + '="' + tab_1.tp_select.dw_6.GetItemString(ll_index, 1) + '"')
NEXT

FileWrite(il_file, '')

FileWrite(il_file, '[COMPUTE]')
ll_rowcount = tab_1.tabpage_5.dw_5.RowCount()

FOR ll_index = 1 TO ll_rowcount
	FileWrite(il_file, String(ll_index) + '="' + tab_1.tabpage_5.dw_5.GetItemString(ll_index, 1) + '"')
NEXT

FileWrite(il_file, '')

FileWrite(il_file, '[FROM]')

ll_rowcount = UpperBound(idw_table)
ll_count = 0
FOR ll_index = 1 TO ll_rowcount
	IF IsValid(idw_table[ll_index]) THEN
		ll_count++
		FileWrite(il_file, String(ll_count) + '=' + idw_table[ll_index].is_table)
	END IF
NEXT

FileWrite(il_file, '')

FileWrite(il_file, '[WHERE]')
ll_rowcount = tab_1.tabpage_2.dw_2.RowCount()

FOR ll_index = 1 TO ll_rowcount
	FileWrite(il_file, String(ll_index) + '="' + tab_1.tabpage_2.dw_2.GetItemString(ll_index, 1) +'~t'+ &
																tab_1.tabpage_2.dw_2.GetItemString(ll_index, 2) +'~t'+ &
																tab_1.tabpage_2.dw_2.GetItemString(ll_index, 3) +'~t'+ &
																tab_1.tabpage_2.dw_2.GetItemString(ll_index, 4) + '"')
NEXT
FileWrite(il_file, '')

FileWrite(il_file, '[GROUPBY]')
ll_rowcount = tab_1.tabpage_3.dw_8.RowCount()

FOR ll_index = 1 TO ll_rowcount
	FileWrite(il_file, String(ll_index) + '="' + tab_1.tabpage_3.dw_8.GetItemString(ll_index,1) + '"')
NEXT
FileWrite(il_file, '')

FileWrite(il_file, '[HAVING]')
ll_rowcount = tab_1.tabpage_4.dw_4.RowCount()

FOR ll_index = 1 TO ll_rowcount
	FileWrite(il_file, String(ll_index) + '="' + tab_1.tabpage_4.dw_4.GetItemString(ll_index, 1) +'~t'+ &
																tab_1.tabpage_4.dw_4.GetItemString(ll_index, 2) +'~t'+ &
																tab_1.tabpage_4.dw_4.GetItemString(ll_index, 3) +'~t'+ &
																tab_1.tabpage_4.dw_4.GetItemString(ll_index, 4) + '"')
NEXT
FileWrite(il_file, '')

FileWrite(il_file, '[ORDERBY]')
ll_rowcount = tab_1.tabpage_1.dw_7.RowCount()

FOR ll_index = 1 TO ll_rowcount
	FileWrite(il_file, String(ll_index) + '="' + tab_1.tabpage_1.dw_7.GetItemString(ll_index, 1) +'~t'+&
																tab_1.tabpage_1.dw_7.GetItemString(ll_index, 2) + '"')
NEXT
FileWrite(il_file, '')

ll_rowcount = UpperBound(idw_table)
FOR ll_index = 1 TO ll_rowcount
	IF IsValid(idw_table[ll_index]) THEN
		FileWrite(il_file, '[' + idw_table[ll_index].of_GetTableName() + ']')
		FileWrite(il_file, 'X=' + String(idw_table[ll_index].X))
		FileWrite(il_file, 'Y=' + String(idw_table[ll_index].Y))
		FileWrite(il_file, 'Width=' + String(idw_table[ll_index].Width))
		FileWrite(il_file, 'Height=' + String(idw_table[ll_index].Height))
		
		ll_row = idw_table[ll_index].GetSelectedRow(0)
		ls_rows = ''
		
		DO UNTIL ll_row = 0
			ls_rows = ls_rows + String(ll_row) + ','
			ll_row = idw_table[ll_index].GetSelectedRow(ll_row)
		LOOP
		FileWrite(il_file, 'Rows="' + ls_rows + '"')
		
		FileWrite(il_file, '')
	END IF
NEXT

ll_rowcount = UpperBound(uo_client.iuo_join)
FOR ll_index = 1 TO ll_rowcount
	IF uo_client.iuo_join[ll_index].Visible THEN
		FileWrite(il_file, '[ln_' + String(ll_index) + ']')
		FileWrite(il_file, 'Visible="Y"')
		FileWrite(il_file, 'BeginX=' + String(uo_client.iuo_join[ll_index].BeginX))
		FileWrite(il_file, 'EndX=' + String(uo_client.iuo_join[ll_index].EndX))
		FileWrite(il_file, 'BeginY=' + String(uo_client.iuo_join[ll_index].BeginY))
		FileWrite(il_file, 'EndY=' + String(uo_client.iuo_join[ll_index].EndY))
		FileWrite(il_file, 'TableA="' + uo_client.iuo_join[ll_index].idw_tableA.Title + '"')
		FileWrite(il_file, 'TableB="' + uo_client.iuo_join[ll_index].idw_tableB.Title + '"')
		FileWrite(il_file, 'RowA="' + String(uo_client.iuo_join[ll_index].ii_rowA) + '"')
		FileWrite(il_file, 'RowB="' + String(uo_client.iuo_join[ll_index].ii_rowB) + '"')
		FileWrite(il_file, 'Relationship="' + String(uo_client.iuo_join[ll_index].iuo_relationship.Text) + '"')
		
		FileWrite(il_file, '')
	END IF
NEXT

FileClose(il_file)

RETURN 1
end function

public function integer of_additem (string as_item, boolean ab_refreshsql);Long ll_row

ll_row = tab_1.tp_select.dw_6.InsertRow(0)

tab_1.tp_select.dw_6.SetItem(ll_row, 1, as_item)

IF ab_refreshsql THEN
	of_RefreshSQL()
END IF

RETURN 1
end function

public function integer of_removeitem (string as_item, boolean ab_refreshsql);Long ll_row

ll_row = tab_1.tp_select.dw_6.Find('table_column="' + as_item + '"', 1, tab_1.tp_select.dw_6.RowCount())

IF ll_row > 0 THEN
	tab_1.tp_select.dw_6.DeleteRow(ll_row)
END IF

IF ab_refreshsql THEN
	of_RefreshSQL()
END IF

RETURN 1
end function

public function integer of_refreshsql ();tab_1.tabpage_6.uo_1.of_SetReadOnly(FALSE)
tab_1.tabpage_6.uo_1.of_SetText(of_GetSyntax())
tab_1.tabpage_6.uo_1.of_Format()
tab_1.tabpage_6.uo_1.of_SetFocus()
tab_1.tabpage_6.uo_1.of_SetReadOnly(TRUE)

RETURN 1
end function

public function integer of_createrelationship (u_dw_table tablea, long rowa, u_dw_table tableb, long rowb);
TableA.iuo_join[UpperBound(TableA.iuo_join) + 1] = uo_client.of_GetNextLine()
TableA.is_position[UpperBound(TableA.is_position) + 1] = 'B'
uo_client.of_StartJoin(TableA,RowA)

TableB.iuo_join[UpperBound(TableB.iuo_join) + 1] = uo_client.iuo_current
TableB.is_position[UpperBound(TableB.is_position) + 1] = 'E'
uo_client.of_EndJoin(TableB,RowB)
	
of_RefreshSQL()

RETURN 1
end function

public function integer of_createrelationships (u_dw_table newtable);Long ll_index, ll_count
Long ll_colindex, ll_rowa, ll_rowb
String ls_refcol, ls_sourcecol
u_dw_table ldw_reftable
Datastore lds

//1. Get foreign keys for NewTable
lds = CREATE Datastore

CHOOSE CASE of_GetDBMS()
	CASE 'mss'
		lds.Dataobject = 'd_foriegnkeylist2_mss'
		lds.SetTransObject(itr)
		lds.Retrieve(newtable.of_GetBaseTableName())
	CASE 'syc'
		lds.Dataobject = 'd_foriegnkeylist2_syc'
		lds.SetTransObject(itr)
		lds.Retrieve(newtable.of_GetBaseTableName())
	CASE 'asa'
		lds.Dataobject = 'd_foriegnkeylist2_asa'
		lds.SetTransObject(itr)
		lds.Retrieve(newtable.of_GetBaseTableName())
	CASE 'ora'
		lds.Dataobject = 'd_foriegnkeylist2_ora'
		lds.SetTransObject(itr)
		lds.Retrieve(newtable.of_GetBaseTableName())
	CASE ELSE
		DESTROY lds
		RETURN 0
END CHOOSE

//2. If any point to open tables, call of_CreateRelationship(...)
CHOOSE CASE of_GetDBMS()
	CASE 'mss', 'syc', 'asa', 'ora'
		ll_count = lds.RowCount()
		
		FOR ll_index = 1 TO ll_count
			ldw_reftable = of_GetTableByBase(lds.GetItemString(ll_index, "sysobjects_reference_table"))
			
			IF IsValid(ldw_reftable) THEN
				
				
				FOR ll_colindex = 1 TO 16
					ls_sourcecol = lds.GetItemString(ll_index, "col" + String(ll_colindex))
					ls_refcol = lds.GetItemString(ll_index, "ref" + String(ll_colindex))
					
					IF NOT IsNull(ls_refcol) AND NOT IsNull(ls_sourcecol) AND Len(ls_refcol) > 0 AND Len(ls_sourcecol) > 0 THEN
						
						ll_rowa = newtable.Find("syscolumns_name = '" + ls_sourcecol + "'", 1, newtable.RowCount())
						ll_rowb = ldw_reftable.Find("syscolumns_name = '" + ls_refcol + "'", 1, ldw_reftable.RowCount())
						
						IF uo_client.of_RelationshipExists(NewTable, ll_rowa, ldw_reftable, ll_rowb) THEN
							CONTINUE
						END IF
						
						of_CreateRelationship(newtable, ll_rowa, ldw_reftable, ll_rowb)
						
					END IF
					
				NEXT
			END IF
			
 		NEXT
END CHOOSE

DESTROY lds

RETURN 1
end function

public function u_dw_table of_gettablebybase (string as_table);Long ll_index, ll_rowcount
u_dw_table ldw_null

ll_rowcount = UpperBound(idw_table)

FOR ll_index = 1 TO ll_rowcount
	
	IF IsValid(idw_table[ll_index]) THEN
		IF idw_table[ll_index].of_GetBaseTableName() = as_table THEN
			RETURN idw_table[ll_index]
		END IF
	END IF
	
NEXT

RETURN ldw_null
end function

public function string of_GetDBMS ();RETURN is_dbms
end function

public function integer of_SetDBMS (string dbms);is_dbms = dbms

RETURN 1
end function

public function integer of_changedb (string as_dbase);String ls_changedb
Long ll_row

IF is_dbms = 'syc' OR is_dbms = 'mss' THEN
	IF is_dbms = 'mss' THEN
		ls_changedb = 'USE [' + as_dbase + ']'
	ELSE
		ls_changedb = 'USE ' + as_dbase
	END IF
	
	EXECUTE IMMEDIATE :ls_changedb USING itr;
	
	RETURN itr.SQLCode
ELSE
	RETURN 0
END IF
end function

public function integer of_toggleautojoin (boolean ab_switch);ib_togglejoin = ab_switch

RETURN 1
end function

public function integer of_updatesqlsyntax ();tab_1.tabpage_6.uo_1.of_SetReadOnly(FALSE)
tab_1.tabpage_6.uo_1.of_SetText(of_GetSyntax())
tab_1.tabpage_6.uo_1.of_Format()
tab_1.tabpage_6.uo_1.of_SetFocus()
tab_1.tabpage_6.uo_1.of_SetReadOnly(TRUE)

RETURN 1
end function

public function string of_getjoinsyntax (ref boolean ab_whereadded);str_pbus_primarytable lstr_primarytables[]
String ls_join, ls_from, ls_tableA, ls_tableB, ls_where, ls_aliasa, ls_aliasb, ls_relationship, ls_jointype
Long ll_primary, ll_secondary, ll_secondarycheck, ll_secondarycheckcount
Long ll_index, ll_rowcount, ll_innerindex, ll_innercount, ll_conditionindex, ll_conditioncount
Boolean lb_exists
n_cst_pbus_string lnv_string

ll_rowcount = UpperBound(uo_client.iuo_join)

FOR ll_index = 1 TO ll_rowcount
	
	IF uo_client.iuo_join[ll_index].Visible THEN
		
		ls_tableA = uo_client.iuo_join[ll_index].idw_tableA.of_GetFullTableName()
		ls_tableB = uo_client.iuo_join[ll_index].idw_tableB.of_GetFullTableName()
		
		ls_aliasa = uo_client.iuo_join[ll_index].idw_tableA.of_GetTable()
		ls_aliasb = uo_client.iuo_join[ll_index].idw_tableB.of_GetTable()
		
		
		IF uo_client.iuo_join[ll_index].iuo_relationship.ib_leftjoin OR &
			uo_client.iuo_join[ll_index].iuo_relationship.ib_rightjoin THEN

				IF uo_client.iuo_join[ll_index].iuo_relationship.ib_leftjoin THEN
					ls_jointype = " LEFT OUTER JOIN "
				ELSE
					ls_jointype = " RIGHT OUTER JOIN "
				END IF

				ll_secondarycheckcount = UpperBound(lstr_primarytables)
				ll_primary = 0
				FOR ll_secondarycheck = 1 TO ll_secondarycheckcount
					ll_secondary = of_TableFromSecondaryArrary(ls_aliasa, lstr_primarytables[ll_secondarycheck])
					
					IF ll_secondary > 0 AND lstr_primarytables[ll_secondarycheck].AliasName = ls_aliasb THEN
						ll_primary = ll_secondarycheck
						EXIT
					END IF
				NEXT
				
				IF ll_primary = 0 THEN
					ll_primary = of_TableFromArrary(ls_aliasa, lstr_primarytables)
				END IF
			
				IF ll_primary = 0 THEN
					ll_primary = UpperBound(lstr_primarytables) + 1
					lstr_primarytables[ll_primary].TableName = ls_tableA
					lstr_primarytables[ll_primary].AliasName = ls_aliasa
				END IF
				
				ll_secondary = of_TableFromSecondaryArrary(ls_aliasb, lstr_primarytables[ll_primary])
				
				IF ll_secondary = 0 THEN
					ll_secondary = UpperBound(lstr_primarytables[ll_primary].secondarytables) + 1
					lstr_primarytables[ll_primary].secondarytables[ll_secondary].tablename = ls_tableB
					lstr_primarytables[ll_primary].secondarytables[ll_secondary].AliasName = ls_aliasb
				END IF
				
				lstr_primarytables[ll_primary].secondarytables[ll_secondary].jointype = ls_jointype
				
				
				ls_tableA = '"' + lnv_string.of_GlobalReplace(ls_aliasa + '.' + uo_client.iuo_join[ll_index].idw_tableA.GetItemString(uo_client.iuo_join[ll_index].ii_rowA, 1), ".", '"."') + '"'		
				ls_tableB = '"' + lnv_string.of_GlobalReplace(ls_aliasb + '.' + uo_client.iuo_join[ll_index].idw_tableB.GetItemString(uo_client.iuo_join[ll_index].ii_rowB, 1), ".", '"."') + '"'
				
				lstr_primarytables[ll_primary].secondarytables[ll_secondary].Conditions[UpperBound(lstr_primarytables[ll_primary].secondarytables[ll_secondary].Conditions) + 1] = '(' + ls_tableA + ' = ' + ls_tableB + ')'

			ELSE
				
				IF NOT of_TableIsInArrary(ls_aliasa, lstr_primarytables) THEN
					lstr_primarytables[UpperBound(lstr_primarytables) + 1].TableName = ls_tableA
					lstr_primarytables[UpperBound(lstr_primarytables)].AliasName = ls_aliasa
				END IF
				
				IF NOT of_TableIsInArrary(ls_aliasb, lstr_primarytables) THEN
					lstr_primarytables[UpperBound(lstr_primarytables) + 1].TableName = ls_tableB
					lstr_primarytables[UpperBound(lstr_primarytables)].AliasName = ls_aliasb
				END IF
				
				IF Len(Trim(ls_where)) = 0 THEN
					ls_where = "~r~n WHERE "
					ab_whereadded = TRUE
				ELSE
					ls_where += " AND ~r~n"
				END IF
				
				ls_relationship = uo_client.iuo_join[ll_index].iuo_relationship.Text
		
				ls_tableA = '"' + lnv_string.of_GlobalReplace(ls_aliasa + '.' + uo_client.iuo_join[ll_index].idw_tableA.GetItemString(uo_client.iuo_join[ll_index].ii_rowA, 1), ".", '"."') + '"'		
				ls_tableB = '"' + lnv_string.of_GlobalReplace(ls_aliasb + '.' + uo_client.iuo_join[ll_index].idw_tableB.GetItemString(uo_client.iuo_join[ll_index].ii_rowB, 1), ".", '"."') + '"'
				
				ls_where += '(' + ls_tableA + ' ' + ls_relationship + ' ' + ls_tableB + ')'
		END IF 
		
		
	END IF
	
NEXT


ll_rowcount = UpperBound(lstr_primarytables)

FOR ll_index = 1 TO ll_rowcount
	ll_innercount = UpperBound(lstr_primarytables[ll_index].secondarytables)
	
	IF ll_innercount = 0 THEN
		IF of_TableIsInSecondaryArrary(lstr_primarytables[ll_index].AliasName, lstr_primarytables) THEN
			lstr_primarytables[ll_index].TableName = ""
		END IF
	END IF
NEXT

ls_from = " FROM "

//Add any table that doesn't have a defined join
ll_rowcount = UpperBound(idw_table)
FOR ll_index = 1 TO ll_rowcount
	IF IsValid(idw_table[ll_index]) THEN
		IF NOT of_TableIsInArrary(idw_table[ll_index].of_GetTable(), lstr_primarytables) THEN
			ll_primary = UpperBound(lstr_primarytables) + 1
			lstr_primarytables[ll_primary].TableName = idw_table[ll_index].of_GetFullTableName()
			lstr_primarytables[ll_primary].AliasName = idw_table[ll_index].of_GetTable()	
		END IF
	END IF
NEXT

ll_rowcount = UpperBound(lstr_primarytables)

FOR ll_index = 1 TO ll_rowcount
	
	IF Len(Trim(lstr_primarytables[ll_index].TableName)) > 0 THEN
		IF lstr_primarytables[ll_index].TableName = lstr_primarytables[ll_index].AliasName THEn
			ls_from += lstr_primarytables[ll_index].TableName
		ELSE
			ls_from += lstr_primarytables[ll_index].TableName + " " + lstr_primarytables[ll_index].AliasName
		END IF
		
		ll_innercount = UpperBound(lstr_primarytables[ll_index].secondarytables)
	
		FOR ll_innerindex = 1 TO ll_innercount
			IF lstr_primarytables[ll_index].secondarytables[ll_innerindex].TableName = lstr_primarytables[ll_index].secondarytables[ll_innerindex].AliasName THEN
				ls_from += lstr_primarytables[ll_index].secondarytables[ll_innerindex].JoinType + " " + lstr_primarytables[ll_index].secondarytables[ll_innerindex].TableName
			ELSE
				ls_from += lstr_primarytables[ll_index].secondarytables[ll_innerindex].JoinType + " " + lstr_primarytables[ll_index].secondarytables[ll_innerindex].TableName + " " + lstr_primarytables[ll_index].secondarytables[ll_innerindex].AliasName
			END IF
			
			ll_conditioncount = UpperBound(lstr_primarytables[ll_index].secondarytables[ll_innerindex].conditions)
			
			FOR ll_conditionindex = 1 TO ll_conditioncount
				IF ll_conditionindex = 1 THEN
					ls_from += "~r~n ON "
				ELSE
					ls_from += "~r~n AND "
				END IF
				ls_from += lstr_primarytables[ll_index].secondarytables[ll_innerindex].conditions[ll_conditionindex]
			NEXT
		NEXT
		
		IF ll_index < ll_rowcount THEN
			ls_from += ",~r~n"
		END IF
	END IF
NEXT

RETURN ls_from + ls_where + "~r~n"
end function

private function boolean of_tableisinarrary (string as_tablename, str_pbus_primarytable astr_primarytables[]);Long ll_index, ll_rowcount, ll_innerindex, ll_innercount

ll_rowcount = UpperBound(astr_primarytables)

FOR ll_index = 1 TO ll_rowcount
	IF astr_primarytables[ll_index].AliasName = as_tablename THEN
		RETURN TRUE
	END IF
	
	ll_innercount = UpperBound(astr_primarytables[ll_index].secondarytables)
	
	FOR ll_innerindex = 1 TO ll_innercount
		IF astr_primarytables[ll_index].secondarytables[ll_innerindex].AliasName = as_tablename THEN
			RETURN TRUE
		END IF
	NEXT
NEXT


RETURN FALSE

end function

private function long of_tablefromarrary (string as_tablename, str_pbus_primarytable astr_primarytables[]);Long ll_index, ll_rowcount, ll_innerindex, ll_innercount
str_pbus_primarytable lstr

ll_rowcount = UpperBound(astr_primarytables)

FOR ll_index = 1 TO ll_rowcount
	IF astr_primarytables[ll_index].AliasName = as_tablename THEN
		RETURN ll_index
	END IF
NEXT


RETURN 0

end function

private function long of_tablefromsecondaryarrary (string as_tablename, str_pbus_primarytable astr_primarytable);Long ll_index, ll_rowcount, ll_innerindex, ll_innercount
str_pbus_primarytable lstr

ll_rowcount = UpperBound(astr_primarytable.secondarytables)

FOR ll_index = 1 TO ll_rowcount
	IF astr_primarytable.secondarytables[ll_index].AliasName = as_tablename THEN
		RETURN ll_index
	END IF
NEXT


RETURN 0

end function

private function boolean of_tableisinsecondaryarrary (string as_tablename, str_pbus_primarytable astr_primarytables[]);Long ll_index, ll_rowcount, ll_innerindex, ll_innercount

ll_rowcount = UpperBound(astr_primarytables)

FOR ll_index = 1 TO ll_rowcount
	ll_innercount = UpperBound(astr_primarytables[ll_index].secondarytables)
	
	FOR ll_innerindex = 1 TO ll_innercount
		IF astr_primarytables[ll_index].secondarytables[ll_innerindex].AliasName = as_tablename THEN
			RETURN TRUE
		END IF
	NEXT
NEXT


RETURN FALSE

end function

public function boolean of_isfileutf8 (string as_file);Encoding l_encoding

l_encoding = FileEncoding(as_file) 

IF IsNull(l_encoding) OR l_encoding = EncodingUTF8! THEN
	RETURN TRUE
ELSE
	RETURN FALSE
END IF
end function

public function integer of_setparentwindow (window aw_parent);iw_parent = aw_parent
RETURN 1
end function

event resize;call super::resize;uo_client.Width = THIS.Width
tab_1.Width = THIS.Width
tab_1.Y = THIS.Height - tab_1.Height

uo_client.Height = tab_1.Y - uo_client.Y - 20
st_1.Width = THIS.Width - 25
st_1.Y = uo_client.Y + uo_client.Height
end event

on u_cst_querybuilder.create
int iCurrent
call super::create
this.st_1=create st_1
this.uo_client=create uo_client
this.tab_1=create tab_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.st_1
this.Control[iCurrent+2]=this.uo_client
this.Control[iCurrent+3]=this.tab_1
end on

on u_cst_querybuilder.destroy
call super::destroy
destroy(this.st_1)
destroy(this.uo_client)
destroy(this.tab_1)
end on

event constructor;call super::constructor;uo_client.of_SetParent(THIS)
TriggerEvent('resize')


tab_1.BackColor = THIS.BackColor

tab_1.SelectTab(3)

uo_client.of_SetParent(THIS)
end event

event destructor;call super::destructor;Long ll_index, ll_count

ll_count = UpperBound(idw_table)

FOR ll_index = 1 TO ll_count
	
	SetParent(Handle(idw_table[ll_index]), Handle(of_GetParentWindow()))
	of_GetParentWindow().CloseUserObject(idw_table[ll_index])
NEXT

end event

type st_1 from u_cst_splitbar within u_cst_querybuilder
integer y = 732
integer width = 2574
integer height = 12
end type

event constructor;call super::constructor;of_Register(uo_client, ABOVE)
of_Register(tab_1, BELOW)
end event

type uo_client from u_cst_pbus_client within u_cst_querybuilder
integer y = 4
integer width = 2574
integer height = 724
integer taborder = 30
end type

on uo_client.destroy
call u_cst_pbus_client::destroy
end on

event rbuttondown;call super::rbuttondown;of_AddTable()
end event

event constructor;call super::constructor;//THIS.BackColor = gnv_app.il_backcolor
end event

type tab_1 from tab within u_cst_querybuilder
integer y = 748
integer width = 2574
integer height = 612
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long backcolor = 67108864
boolean raggedright = true
boolean focusonbuttondown = true
tabposition tabposition = tabsonbottom!
integer selectedtab = 3
tp_select tp_select
tabpage_5 tabpage_5
tabpage_2 tabpage_2
tabpage_3 tabpage_3
tabpage_4 tabpage_4
tabpage_1 tabpage_1
tabpage_6 tabpage_6
end type

on tab_1.create
this.tp_select=create tp_select
this.tabpage_5=create tabpage_5
this.tabpage_2=create tabpage_2
this.tabpage_3=create tabpage_3
this.tabpage_4=create tabpage_4
this.tabpage_1=create tabpage_1
this.tabpage_6=create tabpage_6
this.Control[]={this.tp_select,&
this.tabpage_5,&
this.tabpage_2,&
this.tabpage_3,&
this.tabpage_4,&
this.tabpage_1,&
this.tabpage_6}
end on

on tab_1.destroy
destroy(this.tp_select)
destroy(this.tabpage_5)
destroy(this.tabpage_2)
destroy(this.tabpage_3)
destroy(this.tabpage_4)
destroy(this.tabpage_1)
destroy(this.tabpage_6)
end on

event selectionchanged;CHOOSE CASE newindex
	CASE 1
		tp_select.dw_6.SetFocus()
	CASE 2
		tabpage_5.dw_5.SetFocus()
	CASE 3
		tabpage_2.dw_2.SetFocus()
	CASE 4
		tabpage_3.dw_3.SetFocus()
	CASE 5
		tabpage_4.dw_4.SetFocus()
	CASE 6
		tabpage_1.dw_1.SetFocus()
	CASE 7
		of_UpdateSqlSyntax()
END CHOOSE

RETURN 1
end event

type tp_select from userobject within tab_1
event create ( )
event destroy ( )
event resize pbm_size
integer x = 18
integer y = 16
integer width = 2537
integer height = 484
long backcolor = 67108864
string text = "Select"
long tabtextcolor = 33554432
string picturename = "SelectTable5!"
long picturemaskcolor = 12632256
dw_6 dw_6
end type

on tp_select.create
this.dw_6=create dw_6
this.Control[]={this.dw_6}
end on

on tp_select.destroy
destroy(this.dw_6)
end on

event resize;dw_6.Resize(NewWidth, NewHeight - 10)
end event

type dw_6 from datawindow within tp_select
integer width = 914
integer height = 276
integer taborder = 50
string dragicon = "pbus_drag.ico"
string title = "none"
string dataobject = "d_columnlist"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;IF row > 0 THEN
	SetRow(row)
	Drag(Begin!)
END IF
end event

event dragdrop;IF Source.ClassName() = THIS.ClassName() THEN
	THIS.RowsMove(THIS.GetRow(), THIS.GetRow(), Primary!, THIS, row, Primary!)
END IF
end event

type tabpage_5 from userobject within tab_1
event resize pbm_size
integer x = 18
integer y = 16
integer width = 2537
integer height = 484
long backcolor = 67108864
string text = "Compute"
long tabtextcolor = 33554432
string picturename = "Compute5!"
long picturemaskcolor = 12632256
dw_5 dw_5
end type

event resize;dw_5.Resize(NewWidth, NewHeight - 10)
end event

on tabpage_5.create
this.dw_5=create dw_5
this.Control[]={this.dw_5}
end on

on tabpage_5.destroy
destroy(this.dw_5)
end on

type dw_5 from u_dw_grid within tabpage_5
integer taborder = 40
string dataobject = "d_compute"
boolean border = true
borderstyle borderstyle = stylelowered!
end type

event constructor;call super::constructor;InsertRow(0)
of_SetStyleXP()
end event

event rbuttondown;call super::rbuttondown;Long ll_y, ll_x
m_clause lm_clause

IF Row > 0 AND IsValid(iw_parent) THEN
	
	ll_y = iw_parent.PointerY()
	ll_X = iw_parent.PointerX()
	
	IF GetRow() <> Row THEN
		SetRow(row)
	END IF
	
	lm_clause = CREATE m_clause
	lm_clause.of_SetDW(THIS)
	lm_clause.m_deleteclause.Text = 'Delete Expression'
	lm_clause.m_insertclause.Text = 'Insert Expression'
	lm_clause.PopMenu ( ll_x, ll_y )

END IF
end event

type tabpage_2 from userobject within tab_1
event resize pbm_size
integer x = 18
integer y = 16
integer width = 2537
integer height = 484
long backcolor = 67108864
string text = "Where"
long tabtextcolor = 33554432
string picturename = "Where!"
long picturemaskcolor = 12632256
dw_2 dw_2
end type

event resize;dw_2.Resize(NewWidth, NewHeight - 10)
end event

on tabpage_2.create
this.dw_2=create dw_2
this.Control[]={this.dw_2}
end on

on tabpage_2.destroy
destroy(this.dw_2)
end on

type dw_2 from u_dw_grid within tabpage_2
integer taborder = 50
string dataobject = "d_where"
boolean hscrollbar = true
boolean vscrollbar = true
boolean border = true
borderstyle borderstyle = stylelowered!
end type

event rbuttondown;call super::rbuttondown;Long ll_y, ll_x
m_clause lm_clause

IF Row > 0 THEN

	ll_y = iw_parent.PointerY()
	ll_X = iw_parent.PointerX()
	
	IF GetRow() <> Row THEN
		SetRow(row)
	END IF
	
	IF dwo.Type = 'column' THEN
		IF String(dwo.Name) <> GetColumnName() THEN
			SetColumn(String(dwo.Name))
		END IF
	END IF
	
	lm_clause = CREATE m_clause
	lm_clause.of_SetDW(THIS)
	lm_clause.PopMenu ( ll_x, ll_y )

END IF
end event

event constructor;call super::constructor;THIS.InsertRow(0)
of_SetStyleXP()
end event

event itemchanged;call super::itemchanged;IF dwo.name = 'logical' AND row = THIS.RowCount() THEN
	THIS.InsertRow(0)
END IF

IF row > 1 THEN
	IF Len(Trim(THIS.GetItemString(row - 1, 'logical'))) = 0 THEN
		THIS.SetItem(row - 1, 'logical', 'And')
	END IF
END IF
end event

type tabpage_3 from userobject within tab_1
event resize pbm_size
integer x = 18
integer y = 16
integer width = 2537
integer height = 484
long backcolor = 67108864
string text = "Group By"
long tabtextcolor = 33554432
string picturename = "Group!"
long picturemaskcolor = 12632256
dw_8 dw_8
dw_3 dw_3
end type

event resize;dw_3.Resize((NewWidth / 2) - 7, NewHeight - 10)
dw_8.Resize((NewWidth / 2) - 7, NewHeight - 10)
dw_8.X = dw_3.Width + 14

end event

on tabpage_3.create
this.dw_8=create dw_8
this.dw_3=create dw_3
this.Control[]={this.dw_8,&
this.dw_3}
end on

on tabpage_3.destroy
destroy(this.dw_8)
destroy(this.dw_3)
end on

type dw_8 from datawindow within tabpage_3
integer x = 695
integer width = 686
integer height = 400
integer taborder = 30
string dragicon = "pbus_drag.ico"
string title = "none"
string dataobject = "d_columnlist"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event dragdrop;DataWindow ldw
Long ll_row

IF Source.ClassName() = 'dw_3' THEN
	ldw = Source
	
	ll_row = THIS.InsertRow(row)
	
	THIS.SetItem(ll_row, 1, ldw.getitemstring(ldw.GetRow(),1))
	
END IF

IF Source.ClassName() = THIS.ClassName() THEN
	THIS.RowsMove(THIS.GetRow(), THIS.GetRow(), Primary!, THIS, row, Primary!)
END IF
end event

event clicked;IF row > 0 THEN
	SetRow(row)
	Drag(Begin!)
END IF
end event

type dw_3 from datawindow within tabpage_3
integer width = 686
integer height = 400
integer taborder = 30
string dragicon = "pbus_drag.ico"
string title = "none"
string dataobject = "d_columnlist"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;IF row > 0 THEN
	SetRow(row)
	Drag(Begin!)
END IF
end event

event dragdrop;DataWindow ldw

IF Source.ClassName() = 'dw_8' THEN
	ldw = Source
	
	ldw.DeleteRow(ldw.GetRow())
	
END IF
end event

type tabpage_4 from userobject within tab_1
event resize pbm_size
integer x = 18
integer y = 16
integer width = 2537
integer height = 484
long backcolor = 67108864
string text = "Having"
long tabtextcolor = 33554432
string picturename = "Having!"
long picturemaskcolor = 12632256
dw_4 dw_4
end type

event resize;dw_4.Resize(NewWidth, NewHeight - 10)
end event

on tabpage_4.create
this.dw_4=create dw_4
this.Control[]={this.dw_4}
end on

on tabpage_4.destroy
destroy(this.dw_4)
end on

type dw_4 from u_dw_grid within tabpage_4
integer taborder = 60
string dataobject = "d_where"
boolean hscrollbar = true
boolean vscrollbar = true
boolean border = true
borderstyle borderstyle = stylelowered!
end type

event constructor;call super::constructor;THIS.InsertRow(0)
of_SetStyleXP()
end event

event itemchanged;call super::itemchanged;IF dwo.name = 'logical' AND row = THIS.RowCount() THEN
	THIS.InsertRow(0)
END IF

IF row > 1 THEN
	IF Len(Trim(THIS.GetItemString(row - 1, 'logical'))) = 0 THEN
		THIS.SetItem(row - 1, 'logical', 'And')
	END IF
END IF
end event

event rbuttondown;call super::rbuttondown;Long ll_y, ll_x
m_clause lm_clause

IF Row > 0 AND IsValid(iw_parent) THEN

	ll_y = iw_parent.PointerY()
	ll_X = iw_parent.PointerX()
	
	IF GetRow() <> Row THEN
		SetRow(row)
	END IF
	
	IF dwo.Type = 'column' THEN
		IF String(dwo.Name) <> GetColumnName() THEN
			SetColumn(String(dwo.Name))
		END IF
	END IF
	
	lm_clause = CREATE m_clause
	lm_clause.of_SetDW(THIS)
	lm_clause.PopMenu ( ll_x, ll_y )

END IF
end event

type tabpage_1 from userobject within tab_1
event resize pbm_size
integer x = 18
integer y = 16
integer width = 2537
integer height = 484
long backcolor = 67108864
string text = "Order By"
long tabtextcolor = 33554432
string picturename = "Sort!"
long picturemaskcolor = 12632256
dw_7 dw_7
dw_1 dw_1
end type

event resize;dw_1.Resize((NewWidth / 2) - 7, NewHeight - 10)
dw_7.Resize((NewWidth / 2) - 7, NewHeight - 10)
dw_7.X = dw_1.Width + 14

end event

on tabpage_1.create
this.dw_7=create dw_7
this.dw_1=create dw_1
this.Control[]={this.dw_7,&
this.dw_1}
end on

on tabpage_1.destroy
destroy(this.dw_7)
destroy(this.dw_1)
end on

type dw_7 from datawindow within tabpage_1
integer x = 695
integer width = 686
integer height = 400
integer taborder = 30
string dragicon = "pbus_drag.ico"
string title = "none"
string dataobject = "d_columnlistsort"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event dragdrop;DataWindow ldw
Long ll_row

IF Source.ClassName() = 'dw_1' THEN
	ldw = Source
	
	ll_row = THIS.InsertRow(row)
	
	THIS.SetItem(ll_row, 1, ldw.getitemstring(ldw.GetRow(),1))
	THIS.SetItem(ll_row, 2, 'Asc')
	
END IF

IF Source.ClassName() = THIS.ClassName() THEN
	THIS.RowsMove(THIS.GetRow(), THIS.GetRow(), Primary!, THIS, row, Primary!)
END IF
end event

event clicked;IF row > 0 AND dwo.Name <> 'sort_order' THEN
	SetRow(row)
	Drag(Begin!)
END IF
end event

type dw_1 from datawindow within tabpage_1
integer width = 686
integer height = 400
integer taborder = 10
string dragicon = "pbus_drag.ico"
string title = "none"
string dataobject = "d_columnlist"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;IF row > 0 THEN
	SetRow(row)
	Drag(Begin!)
END IF
end event

event dragdrop;DataWindow ldw

IF Source.ClassName() = 'dw_7' THEN
	ldw = Source
	
	ldw.DeleteRow(ldw.GetRow())
	
END IF
end event

type tabpage_6 from userobject within tab_1
event resize pbm_size
integer x = 18
integer y = 16
integer width = 2537
integer height = 484
long backcolor = 67108864
string text = "Syntax"
long tabtextcolor = 33554432
string picturename = "SQL!"
long picturemaskcolor = 12632256
uo_1 uo_1
end type

event resize;uo_1.Resize(NewWidth, NewHeight - 10)
end event

on tabpage_6.create
this.uo_1=create uo_1
this.Control[]={this.uo_1}
end on

on tabpage_6.destroy
destroy(this.uo_1)
end on

type uo_1 from u_cst_pbus_editor within tabpage_6
integer width = 1490
integer height = 164
integer taborder = 50
end type

on uo_1.destroy
call u_cst_pbus_editor::destroy
end on

event constructor;call super::constructor;//uo_1.of_ShowLineNumbers(FALSE)

uo_1.Resize(THIS.Width, THIS.Height - 5)


end event

