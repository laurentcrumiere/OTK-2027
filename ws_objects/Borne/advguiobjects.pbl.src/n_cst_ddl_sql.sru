$PBExportHeader$n_cst_ddl_sql.sru
forward
global type n_cst_ddl_sql from nonvisualobject
end type
end forward

global type n_cst_ddl_sql from nonvisualobject autoinstantiate
end type

type prototypes

Function integer SQLAllocHandle ( &
	integer HandleType, &
	long InputHandle, &
	Ref long OutputHandlePtr &
	) Library "odbc32.dll"

Function integer SQLFreeHandle ( &
	integer HandleType, &
	long Handle &
	) Library "odbc32.dll"


//Function integer SQLBindCol ( &
//	long StatementHandle, &
//	UInt ColumnNumber, &
//	integer TargetType, &
//	Ref string TargetValuePtr, &
//	long BufferLength, &
//	Ref integer StrLen_or_IndPtr &
//	) Library "odbc32.dll"
	
FUNCTION int SQLBindCol(long statementhandle, int columnnumber, int targettype, ref string targetvalueptr, long bufferlength, ref int strlen) library "odbc32.dll"
FUNCTION int SQLBindCol(long statementhandle, int columnnumber, int targettype, ref blob targetvalueptr, long bufferlength, ref int strlen) library "odbc32.dll" 
FUNCTION int SQLGetData(long statementhandle, int columnnumber, int targettype, ref string targetvalueptr, long bufferlength, ref int strlen) library "odbc32.dll"


Function integer SQLBindCol ( &
	long StatementHandle, &
	Int ColumnNumber, &
	integer TargetType, &
	Ref integer TargetValuePtr, &
	long BufferLength, &
	Ref int StrLen_or_IndPtr &
	) Library "odbc32.dll"

Function integer SQLBindCol ( &
	long StatementHandle, &
	Int ColumnNumber, &
	integer TargetType, &
	Ref long TargetValuePtr, &
	long BufferLength, &
	Ref int StrLen_or_IndPtr &
	) Library "odbc32.dll"

Function integer SQLFetch ( &
	long statementhandle &
	) Library "odbc32.dll"

Function integer SQLTables ( &
	long StatementHandle, &
	string CatalogName, &
	integer NameLength1, &
	string SchemaName, &
	integer NameLength2, &
	string TableName, &
	integer NameLength3, &
	string TableType, &
	integer NameLength4 &
	) Library "odbc32.dll" alias for "SQLTablesW"

Function integer SQLColumns ( &
	long StatementHandle, &
	string CatalogName, &
	integer NameLength1, &
	string SchemaName, &
	integer NameLength2, &
	string TableName, &
	integer NameLength3, &
	string ColumnName, &
	integer NameLength4 &
	) Library "odbc32.dll" alias for "SQLColumnsW"

Function integer SQLPrimaryKeys ( &
	long StatementHandle, &
	string CatalogName, &
	integer NameLength1, &
	string SchemaName, &
	integer NameLength2, &
	string TableName, &
	integer NameLength3 &
	) Library "odbc32.dll" alias for "SQLPrimaryKeysW"

Function integer SQLForeignKeys ( &
	long StatementHandle, &
	string PKCatalogName, &
	integer NameLength1, &
	string PKSchemaName, &
	integer NameLength2, &
	string PKTableName, &
	integer NameLength3, &
	string FKCatalogName, &
	integer NameLength4, &
	string FKSchemaName, &
	integer NameLength5, &
	string FKTableName, &
	integer NameLength6 &
	) Library "odbc32.dll" alias for "SQLForeignKeysW"

Function integer SQLProcedures ( &
	long StatementHandle, &
	string CatalogName, &
	integer NameLength1, &
	string SchemaName, &
	integer NameLength2, &
	string ProcName, &
	integer NameLength3 &
	) Library "odbc32.dll" alias for "SQLProceduresW"

Function integer SQLGetInfo ( &
	long ConnectionHandle, &
	integer InfoType, &
	Ref string InfoValuePtr, &
	integer BufferLength, &
	Ref int StringLengthPtr &
	) Library "odbc32.dll" alias for "SQLGetInfoW"

end prototypes

type variables
String is_servername
String is_database
String is_user
Boolean ib_oracledba

n_changesql inv_ChangeSQL

CONSTANT Long ObjectLength = 129

Constant Long TABLELIST = 1
Constant Long SPLIST = 2
Constant Long VIEWLIST = 3
Constant Long TRIGGERLIST = 4
Constant Long INDEXLIST = 5
Constant Long TABLEEXTRACT = 6
Constant Long SPEXTRACT = 7
Constant Long VIEWEXTRACT = 8
Constant Long TRIGGEREXTRACT = 9
Constant Long INDEXEXTRACT = 10

Constant Long DEFAULTEXTRACT = 11
Constant Long DEFAULTLIST = 12

Constant Long EXTENDEDPROCEDUREEXTRACT = 13
Constant Long EXTENDEDPROCEDURELIST = 14
Constant Long LOGINLIST = 15
Constant Long RULESLIST = 16
Constant Long RULESEXTRACT = 17

Constant Long TABLEVIEWLIST = 18

Constant Long OWNERLIST = 19
Constant Long TABLEOWNERLIST = 20

Constant Long PACKAGELIST = 21
Constant Long PACKAGEBODYLIST = 22
Constant Long PACKAGEEXTRACT = 23
Constant Long PACKAGEBODYEXTRACT = 24

Constant Long FUNCTIONLIST = 25
Constant Long FUNCTIONEXTRACT = 26

Constant Long DATATYPELIST = 27
Constant Long DATATYPEEXTRACT = 28

Constant Long SYNONYMLIST = 29
Constant Long SYNONYMEXTRACT = 30

Constant Long ROLELIST = 31
Constant Long ROLEEXTRACT = 32

Constant Long MATERIALIZEDVIEWLIST = 33

Protected: 
// return values from functions
Constant Integer SQL_SUCCESS				= 0
Constant Integer SQL_SUCCESS_WITH_INFO = 1
Constant Integer SQL_NO_DATA				= 100
Constant Integer SQL_ERROR					= -1
Constant Integer SQL_INVALID_HANDLE		= -2
Constant Integer SQL_NEED_DATA			= 99

// other values
Constant Integer SQL_NTS				= -3
Constant Long SQL_NULL_HANDLE			= 0
Constant Integer SQL_MAX_DSN_LENGTH = 32
Constant Long SQL_ATTR_ODBC_VERSION = 200
Constant ULong SQL_OV_ODBC3			= 3

// SQLAllocHandle constants
Constant Integer SQL_HANDLE_ENV	= 1
Constant Integer SQL_HANDLE_DBC	= 2
Constant Integer SQL_HANDLE_STMT	= 3
Constant Integer SQL_HANDLE_DESC	= 4

// SQLTables column numbers
constant UInt SQLTAB_TABLE_CAT	= 1
Constant UInt SQLTAB_TABLE_SCHEM	= 2
Constant UInt SQLTAB_TABLE_NAME	= 3
Constant UInt SQLTAB_TABLE_TYPE	= 4
Constant UInt SQLTAB_REMARKS		= 5

// SQLColumns column numbers
constant UInt SQLCOL_TABLE_CAT			= 1
Constant UInt SQLCOL_TABLE_SCHEM			= 2
Constant UInt SQLCOL_TABLE_NAME			= 3
Constant UInt SQLCOL_COLUMN_NAME			= 4
Constant UInt SQLCOL_DATA_TYPE			= 5
Constant UInt SQLCOL_TYPE_NAME			= 6
Constant UInt SQLCOL_COLUMN_SIZE			= 7
Constant UInt SQLCOL_BUFFER_LENGTH		= 8
Constant UInt SQLCOL_DECIMAL_DIGITS		= 9
Constant UInt SQLCOL_NUM_PREC_RADIX		= 10
Constant UInt SQLCOL_NULLABLE				= 11
Constant UInt SQLCOL_REMARKS				= 12
Constant UInt SQLCOL_COLUMN_DEF			= 13
Constant UInt SQLCOL_SQL_DATA_TYPE		= 14
Constant UInt SQLCOL_SQL_DATETIME_SUB	= 15
Constant UInt SQLCOL_CHAR_OCTET_LENGTH = 16
Constant UInt SQLCOL_ORDINAL_POSITION	= 17
Constant UInt SQLCOL_IS_NULLABLE			= 18

// SQLPrimaryKeys column numbers
Constant UInt SQLPK_TABLE_CAT		= 1
Constant UInt SQLPK_TABLE_SCHEM	= 2
Constant UInt SQLPK_TABLE_NAME	= 3
Constant UInt SQLPK_COLUMN_NAME	= 4
Constant UInt SQLPK_KEY_SEQ		= 5
Constant UInt SQLPK_PK_NAME		= 6

// SQLForeignKeys column numbers
Constant UInt SQLFK_PKTABLE_CAT			= 1
Constant UInt SQLFK_PKTABLE_SCHEM		= 2
Constant UInt SQLFK_PKTABLE_NAME			= 3
Constant UInt SQLFK_PKCOLUMN_NAME		= 4
Constant UInt SQLFK_FKTABLE_CAT			= 5
Constant UInt SQLFK_FKTABLE_SCHEM		= 6
Constant UInt SQLFK_FKTABLE_NAME			= 7
Constant UInt SQLFK_FKCOLUMN_NAME		= 8
Constant UInt SQLFK_KEY_SEQ				= 9
Constant UInt SQLFK_UPDATE_RULE			= 10
Constant UInt SQLFK_DELETE_RULE			= 11
Constant UInt SQLFK_FK_NAME				= 12
Constant UInt SQLFK_PK_NAME				= 13
Constant UInt SQLFK_DEFERRABILITY		= 14

// SQLProcedures column numbers
Constant UInt SQLSP_PROCEDURE_CAT	= 1
Constant UInt SQLSP_PROCEDURE_SCHEM	= 2
Constant UInt SQLSP_PROCEDURE_NAME	= 3
Constant UInt SQLSP_REMARKS			= 7
Constant UInt SQLSP_PROCEDURE_TYPE	= 8
Constant Integer SQL_DBMS_NAME = 17

// SQL data type codes
Constant Long SQL_CHAR			= 1
Constant Long SQL_NUMERIC		= 2
Constant Long SQL_DECIMAL		= 3
Constant Long SQL_INTEGER		= 4
Constant Long SQL_SMALLINT		= 5
Constant Long SQL_FLOAT			= 6
Constant Long SQL_REAL			= 7
Constant Long SQL_DOUBLE		= 8
Constant Long SQL_DATETIME		= 9
Constant Long SQL_VARCHAR		= 12
Constant Long SQL_NVARCHAR		= 247
Constant Long SQL_TEXT			= -1
Constant Long SQL_BINARY		= -2
Constant Long SQL_VARBINARY	= -3
Constant Long SQL_IMAGE			= -4
Constant Long SQL_TINYINT		= -6
Constant Long SQL_BIT			= -7
Constant Long SQL_WCHAR			= -8
Constant Long SQL_WVARCHAR		= -9

// DateTime sub-types
Constant Long SQL_CODE_DATE		= 1
Constant Long SQL_CODE_TIME		= 2
Constant Long SQL_CODE_TIMESTAMP	= 3

// FetchOrientation
Constant UInt SQL_FETCH_NEXT		= 1
Constant UInt SQL_FETCH_FIRST		= 2
Constant UInt SQL_FETCH_LAST		= 3
Constant UInt SQL_FETCH_PRIOR		= 4
Constant UInt SQL_FETCH_ABSOLUTE	= 5
Constant UInt SQL_FETCH_RELATIVE	= 6

// FetchOrientation for SQLDataSources only
Constant UInt SQL_FETCH_FIRST_USER		= 31
Constant UInt SQL_FETCH_FIRST_SYSTEM	= 32
long il_stmt_handle 
end variables

forward prototypes
public function string of_gettablelistsql (string as_dbms)
public function string of_getsplistsql (string as_dbms)
public function string of_getviewlistsql (string as_dbms)
public function string of_gettriggerlistsql (string as_dbms)
public function string of_getindexlistsql (string as_dbms)
public function string of_getindexextractsql (string as_dbms, string as_name)
public function string of_getspextractsql (string as_dbms, string as_name)
public function string of_gettableextractsql (string as_dbms, string as_name)
public function string of_gettriggerextractsql (string as_dbms, string as_name)
public function string of_getviewextractsql (string as_dbms, string as_name)
public function long of_getdbhandle (transaction atr)
public function long of_odbcsplist (transaction atr, ref string as_sp_list[])
public function integer of_error ()
public function long of_odbcspextract (transaction atr, string as_sp, ref string as_sp_sql)
public function string of_getdefaultlistsql (string as_dbms)
public function string of_getextendedprocedurelistsql (string as_dbms)
public function string of_getloginlistsql (string as_dbms)
public function string of_getdefaultextractsql (string as_dbms, string as_name)
public function long of_odbctableextract (transaction atr, string as_tablename, ref str_tabledef as_column_list[])
public function string of_gettableviewlistsql (string as_dbms)
public function string of_getownerlistsql (string as_dbms)
public function string of_gettablelistownersql (string as_dbms, string as_owner)
public function string of_getpackagelistsql (string as_dbms)
public function string of_getpackagebodylistsql (string as_dbms, string as_name)
public function string of_getpackageextractsql (string as_dbms, string as_name)
public function string of_getpackagebodyextractsql (string as_dbms, string as_name)
public function string of_getfunctionlistsql (string as_dbms)
public function string of_getfunctionextractsql (string as_dbms, string as_name)
public function long of_odbcownerlist (transaction atr, ref string as_table_list[])
public function long of_odbcviewextract (transaction atr, string as_table_name, ref string as_sp_sql)
public function long of_odbcfunctionlist (transaction atr, ref string as_sp_list[])
public function long of_odbctablelist (transaction atr, ref string as_table_list[], string as_owner)
public function long of_odbcviewlist (transaction atr, ref string as_table_list[], string as_owner)
public function string of_getdatatypelistsql (string as_dbms)
public function string of_getdatatypeextractsql (string as_dbms, string as_name)
public function string of_getrulelistsql (string as_dbms)
public function string of_getruleextractsql (string as_dbms, string as_name)
public function string of_getsynonymlistsql (string as_dbms)
public function string of_getsynonymextractsql (string as_dbms, string as_name)
public function string of_getrolelistsql (string as_dbms)
public function string of_getroleextractsql (string as_dbms, string as_name)
public function long of_odbctablepk (transaction atr, string as_tablename, ref string as_column_list[])
public function string of_getmaterializedviewlistsql (string as_dbms)
public function integer of_changesql (transaction atr, long as_action, string as_dbms, datastore a_dw, string as_name)
public function integer of_changesql (transaction atr, long as_action, string as_dbms, datawindow a_dw, string as_name)
end prototypes

public function string of_gettablelistsql (string as_dbms);String ls_sql, ls_logname
String ls_table[]
Long ll_index, ll_count
transaction ltr
n_cst_pbus_string lnv_string

CHOOSE CASE Lower(as_dbms)
	CASE 'syc'
		ls_sql = inv_ChangeSQL.of_GetSQL(inv_ChangeSQL.TABLELISTSYBASE)
	CASE 'mss'
		ls_sql = inv_ChangeSQL.of_GetSQL(inv_ChangeSQL.TABLELISTSQLSERVER)
	CASE 'asa'
		ls_sql = inv_ChangeSQL.of_GetSQL(inv_ChangeSQL.TABLELISTSQLANYWHERE)
	CASE 'ora'
		inv_ChangeSQL.ib_OracleDBA = ib_OracleDBA
		ls_sql = inv_ChangeSQL.of_GetSQL(inv_ChangeSQL.TABLELISTORACLE)
		ls_sql = lnv_string.of_GlobalReplace(ls_sql, "%1", Upper(is_user))
	CASE 'odb'
//		ltr = gnv_app.of_GetTransaction(gnv_app.of_GetActiveTransaction())
//
//		of_ODBCTableList(ltr, ls_table)
//		
//		ll_count = UpperBound(ls_table)
//		
//		FOR ll_index = 1 TO ll_count
//			IF ll_index = 1 THEN
//				ls_sql = "SELECT ~~'" + ls_table[ll_index] + "~~', 1, 'jan 1, 1900', '' ,0,'U' "
//			ELSE
//				ls_sql = ls_sql + " UNION ALL SELECT ~~'" + ls_table[ll_index] + "~~', 1, '', '' ,0,'U' "
//			END IF
//			
//		NEXT
	
END CHOOSE

RETURN ls_sql
end function

public function string of_getsplistsql (string as_dbms);String ls_sql, ls_logname
String ls_sp[]
Long ll_index, ll_count
transaction ltr
n_cst_pbus_string lnv_string

CHOOSE CASE Lower(as_dbms)
	CASE 'syc'
		ls_sql = inv_ChangeSQL.of_GetSQL(inv_ChangeSQL.SPLISTSYBASE)
	CASE 'mss'
		ls_sql = inv_ChangeSQL.of_GetSQL(inv_ChangeSQL.SPLISTSQLSERVER)
	CASE 'asa'
		ls_sql = inv_ChangeSQL.of_GetSQL(inv_ChangeSQL.SPLISTSQLANYWHERE)
	CASE 'ora'
		inv_ChangeSQL.ib_OracleDBA = ib_OracleDBA
		ls_sql = inv_ChangeSQL.of_GetSQL(inv_ChangeSQL.SPLISTORACLE)
		ls_sql = lnv_string.of_GlobalReplace(ls_sql, "%1", Upper(is_user))
	CASE 'odb'
		//ltr = gnv_app.of_GetTransaction(gnv_app.of_GetActiveTransaction())

		of_ODBCSPList(ltr, ls_sp)
		
		ll_count = UpperBound(ls_sp)
		
		FOR ll_index = 1 TO ll_count
			IF ll_index = 1 THEN
				ls_sql = "SELECT ~~'" + ls_sp[ll_index] + "~~', 1 "
			ELSE
				ls_sql = ls_sql + " UNION SELECT ~~'" + ls_sp[ll_index] + "~~', 1 "
			END IF
			
		NEXT
END CHOOSE

RETURN ls_sql
end function

public function string of_getviewlistsql (string as_dbms);String ls_sql, ls_logname
String ls_table[]
Long ll_count, ll_index
transaction ltr
n_cst_pbus_string lnv_string

CHOOSE CASE Lower(as_dbms)
	CASE 'syc'
		ls_sql = inv_ChangeSQL.of_GetSQL(inv_ChangeSQL.VIEWLISTSYBASE)
	CASE 'mss'
		ls_sql = inv_ChangeSQL.of_GetSQL(inv_ChangeSQL.VIEWLISTSQLSERVER)
	CASE 'asa'
		ls_sql = inv_ChangeSQL.of_GetSQL(inv_ChangeSQL.VIEWLISTSQLANYWHERE)
	CASE 'ora'
		inv_ChangeSQL.ib_OracleDBA = ib_OracleDBA
		ls_sql = inv_ChangeSQL.of_GetSQL(inv_ChangeSQL.VIEWLISTORACLE)
		ls_sql = lnv_string.of_GlobalReplace(ls_sql, "%1", Upper(is_user))
	CASE 'odb'
//		ltr = gnv_app.of_GetTransaction(gnv_app.of_GetActiveTransaction())
//
//		of_ODBCViewList(ltr, ls_table)
//		
//		ll_count = UpperBound(ls_table)
//		
//		FOR ll_index = 1 TO ll_count
//			IF ll_index = 1 THEN
//				ls_sql = "SELECT ~~'" + ls_table[ll_index] + "~~', 1 "
//			ELSE
//				ls_sql = ls_sql + " UNION SELECT ~~'" + ls_table[ll_index] + "~~', 1 "
//			END IF
//			
//		NEXT
END CHOOSE

RETURN ls_sql
end function

public function string of_gettriggerlistsql (string as_dbms);String ls_sql, ls_logname
n_cst_pbus_string lnv_string

CHOOSE CASE Lower(as_dbms)
	CASE 'syc'
		ls_sql = inv_ChangeSQL.of_GetSQL(inv_ChangeSQL.TRIGGERLISTSYBASE)
	CASE 'mss'
		ls_sql = inv_ChangeSQL.of_GetSQL(inv_ChangeSQL.TRIGGERLISTSQLSERVER)
	CASE 'asa'
		ls_sql = inv_ChangeSQL.of_GetSQL(inv_ChangeSQL.TRIGGERLISTSQLANYWHERE)
	CASE 'ora'
		inv_ChangeSQL.ib_OracleDBA = ib_OracleDBA
		ls_sql = inv_ChangeSQL.of_GetSQL(inv_ChangeSQL.TRIGGERLISTORACLE)
		ls_sql = lnv_string.of_GlobalReplace(ls_sql, "%1", Upper(is_user))
	CASE 'odb'
		ls_sql = 'select name, id, crdate, "" from sysobjects	where type = "TR" order by name'
END CHOOSE

RETURN ls_sql
end function

public function string of_getindexlistsql (string as_dbms);String ls_sql, ls_logname
n_cst_pbus_string lnv_string

CHOOSE CASE Lower(as_dbms)
	CASE 'syc'
		ls_sql = inv_ChangeSQL.of_GetSQL(inv_ChangeSQL.INDEXLISTSYBASE)
	CASE 'mss'
		ls_sql = inv_ChangeSQL.of_GetSQL(inv_ChangeSQL.INDEXLISTSQLSERVER)
	CASE 'asa'
		ls_sql = inv_ChangeSQL.of_GetSQL(inv_ChangeSQL.INDEXLISTSQLANYWHERE)
	CASE 'ora'
		inv_ChangeSQL.ib_OracleDBA = ib_OracleDBA
		ls_sql = inv_ChangeSQL.of_GetSQL(inv_ChangeSQL.INDEXLISTORACLE)
		ls_sql = lnv_string.of_GlobalReplace(ls_sql, "%1", Upper(is_user))
	CASE 'odb'
		ls_sql = "SELECT O.name as ~"table_name~", " + &
					"		 I.name as ~"index_name~", " + &
					"		 I.indid, " + &
					"		 I.status, " + &
					"		 O.crdate, " + &
					"		 ~"~" " + &
					"FROM sysindexes I, " + &
					"	  sysobjects O  " + &
					"WHERE I.indid>0  " + &
					"  AND I.indid<255  " + &
					"  AND O.id=I.id " + &
					"ORDER BY O.name "
END CHOOSE					

RETURN ls_sql
end function

public function string of_getindexextractsql (string as_dbms, string as_name);String ls_sql

CHOOSE CASE Lower(as_dbms)
	CASE 'syc'
		ls_sql = inv_ChangeSQL.of_GetSQL(inv_ChangeSQL.INDEXLISTSYBASE)
	CASE 'mss'
		ls_sql = inv_ChangeSQL.of_GetSQL(inv_ChangeSQL.INDEXLISTSQLSERVER)
	CASE 'asa'
		ls_sql = inv_ChangeSQL.of_GetSQL(inv_ChangeSQL.INDEXLISTSQLANYWHERE)
	CASE 'ora'
		inv_ChangeSQL.ib_OracleDBA = ib_OracleDBA
		ls_sql = inv_ChangeSQL.of_GetSQL(inv_ChangeSQL.INDEXLISTORACLE)
END CHOOSE					

RETURN ls_sql
end function

public function string of_getspextractsql (string as_dbms, string as_name);String ls_sql, ls_number
Long ll_pos
transaction ltr
n_cst_pbus_string lnv_string


CHOOSE CASE Lower(as_dbms)
	CASE 'syc'
		
		ls_sql = inv_ChangeSQL.of_GetSQL(inv_ChangeSQL.SPEXTRACTSYBASE)
		
//		ll_pos = Pos(as_name, ";", 1)
//		
//		IF ll_pos = 0 THEN
//			ls_number = "1"
//		ELSE
//			ls_number = Right(as_name, Len(as_name) - ll_pos)
//			as_name = Left(as_name, ll_pos - 1)
//		END IF
//		
//		ls_sql = lnv_string.of_GlobalReplace(ls_sql, "%2", ls_number)
		
	CASE 'mss'
		ls_sql = inv_ChangeSQL.of_GetSQL(inv_ChangeSQL.SPEXTRACTSQLSERVER)
	CASE 'asa'
		ls_sql = inv_ChangeSQL.of_GetSQL(inv_ChangeSQL.SPEXTRACTSQLANYWHERE)
	CASE 'ora'
		inv_ChangeSQL.ib_OracleDBA = ib_OracleDBA
		ls_sql = inv_ChangeSQL.of_GetSQL(inv_ChangeSQL.SPEXTRACTORACLE)
		ls_sql = lnv_string.of_GlobalReplace(ls_sql, "%2", Upper(is_user))
	CASE 'odb'
		//ltr = gnv_app.of_GetTransaction(is_servername)

		of_ODBCSPExtract(ltr, as_name, ls_sql)
END CHOOSE

ls_sql = lnv_string.of_GlobalReplace(ls_sql, "%1", as_name)

RETURN ls_sql
end function

public function string of_gettableextractsql (string as_dbms, string as_name);String ls_sql
Long ll_index, ll_count
str_tabledef lstr_tabledef[]
transaction ltr
n_cst_pbus_string lnv_string

CHOOSE CASE Lower(as_dbms)
	CASE 'syc'
		ls_sql = inv_ChangeSQL.of_GetSQL(inv_ChangeSQL.TABLEEXTRACTSYBASE)
	CASE 'mss'
		ls_sql = inv_ChangeSQL.of_GetSQL(inv_ChangeSQL.TABLEEXTRACTSQLSERVER)
	CASE 'asa'
		ls_sql = inv_ChangeSQL.of_GetSQL(inv_ChangeSQL.TABLEEXTRACTSQLANYWHERE)
	CASE 'ora'
		inv_ChangeSQL.ib_OracleDBA = ib_OracleDBA
		ls_sql = inv_ChangeSQL.of_GetSQL(inv_ChangeSQL.TABLEEXTRACTORACLE)
		ls_sql = lnv_string.of_GlobalReplace(ls_sql, "%2", Upper(is_user))
		as_name = Upper(as_name)
	CASE 'odb'
//		ltr = gnv_app.of_GetTransaction(is_servername)
//
//		of_ODBCTableExtract(ltr, as_name, lstr_tabledef)
//		
//		ll_count = UpperBound(lstr_tabledef)
//		
//		FOR ll_index = 1 TO ll_count
//			IF ll_index = 1 THEN
//				ls_sql = "SELECT ~~'" + lstr_tabledef[ll_index].Table_name + "~~', ~~'" + &
//				                        lstr_tabledef[ll_index].Data_type + "~~', " + &
//												String(lstr_tabledef[ll_index].Length) + ", " + &
//												String(lstr_tabledef[ll_index].Prec) + ", " + &
//												String(lstr_tabledef[ll_index].Scale) + ", " + &
//												String(lstr_tabledef[ll_index].nullable) + " "
//			ELSE
//				ls_sql = ls_sql + " UNION SELECT ~~'" + lstr_tabledef[ll_index].Table_name + "~~', ~~'" + &
//				                        lstr_tabledef[ll_index].Data_type + "~~', " + &
//												String(lstr_tabledef[ll_index].Length) + ", " + &
//												String(lstr_tabledef[ll_index].Prec) + ", " + &
//												String(lstr_tabledef[ll_index].Scale) + ", " + &
//												String(lstr_tabledef[ll_index].nullable) + " "
//
//			END IF
//			
//		NEXT
END CHOOSE


ls_sql = lnv_string.of_GlobalReplace(ls_sql, "%1", as_name)

RETURN ls_sql
end function

public function string of_gettriggerextractsql (string as_dbms, string as_name);String ls_sql
n_cst_pbus_string lnv_string

CHOOSE CASE Lower(as_dbms)
		CASE 'syc'
		ls_sql = inv_ChangeSQL.of_GetSQL(inv_ChangeSQL.TRIGGEREXTRACTSYBASE)
	CASE 'mss'
		ls_sql = inv_ChangeSQL.of_GetSQL(inv_ChangeSQL.TRIGGEREXTRACTSQLSERVER)
	CASE 'asa'
		ls_sql = inv_ChangeSQL.of_GetSQL(inv_ChangeSQL.TRIGGEREXTRACTSQLANYWHERE)
	CASE 'ora'
		inv_ChangeSQL.ib_OracleDBA = ib_OracleDBA
		ls_sql = inv_ChangeSQL.of_GetSQL(inv_ChangeSQL.TRIGGEREXTRACTORACLE)
		ls_sql = lnv_string.of_GlobalReplace(ls_sql, "%2", Upper(is_user))
END CHOOSE


ls_sql = lnv_string.of_GlobalReplace(ls_sql, "%1", as_name)

RETURN ls_sql
end function

public function string of_getviewextractsql (string as_dbms, string as_name);String ls_sql
Long ll_index, ll_count
str_tabledef lstr_tabledef[]
transaction ltr

CHOOSE CASE Lower(as_dbms)
	CASE 'syc'
		ls_sql = inv_ChangeSQL.of_GetSQL(inv_ChangeSQL.VIEWEXTRACTSYBASE)
	CASE 'mss'
		ls_sql = inv_ChangeSQL.of_GetSQL(inv_ChangeSQL.VIEWEXTRACTSQLSERVER)
	CASE 'asa'
		ls_sql = inv_ChangeSQL.of_GetSQL(inv_ChangeSQL.VIEWEXTRACTSQLANYWHERE)
	CASE 'odb'
		//ltr = gnv_app.of_GetTransaction(gnv_app.of_GetActiveTransaction())

		of_ODBCViewExtract(ltr, as_name, ls_sql)
END CHOOSE

n_cst_pbus_string lnv_string
ls_sql = lnv_string.of_GlobalReplace(ls_sql, "%1", as_name)

RETURN ls_sql
end function

public function long of_getdbhandle (transaction atr);long ll_db_handle 

ll_db_handle = atr.DbHandle() 

SQLAllocHandle(SQL_HANDLE_STMT, ll_db_handle, il_stmt_handle) 

RETURN il_stmt_handle
end function

public function long of_odbcsplist (transaction atr, ref string as_sp_list[]);integer li_total_tables = 0 
integer li_rc 
integer li_str_len 
string ls_catlog 
string ls_schema 
string ls_spname 
Long ll_handle
Long ll_pos
Long ll_type

ll_handle = of_GetDBHandle(atr) 

SetNull(ls_catlog) 
SetNull(ls_schema) 
SetNull(ls_spname) 

li_rc = SQLProcedures(ll_handle, ls_spname, 0, ls_spname, 0, & 
      ls_spname, 0) 
		


IF li_rc = SQL_SUCCESS OR li_rc = SQL_SUCCESS_WITH_INFO THEN 
//	SQLBindCol(ll_handle, SQLSP_PROCEDURE_NAME, SQL_WCHAR, ls_spname, ObjectLength, li_str_len) 
//	SQLBindCol(ll_handle, SQLSP_PROCEDURE_CAT, SQL_WCHAR, ls_catlog, ObjectLength, li_str_len) 
//	SQLBindCol(ll_handle, SQLSP_PROCEDURE_SCHEM, SQL_WCHAR, ls_schema, ObjectLength, li_str_len) 
	

	SQLBindCol(ll_handle, 8, SQL_SMALLINT, ll_type, 0, li_str_len) 
	
	li_rc = SQLFetch(ll_handle) 
	
	DO WHILE li_rc = SQL_SUCCESS 
		IF ll_type = 1 THEN
			li_total_tables += 1 
			ls_spname = space(ObjectLength) 
			ls_catlog = space(ObjectLength) 
			ls_schema = space(ObjectLength) 
			SQLGetData(ll_handle, SQLSP_PROCEDURE_NAME, SQL_WCHAR, ls_spname, ObjectLength, li_str_len) 
			SQLGetData(ll_handle, SQLSP_PROCEDURE_CAT, SQL_WCHAR, ls_catlog, ObjectLength, li_str_len) 
			SQLGetData(ll_handle, SQLSP_PROCEDURE_SCHEM, SQL_WCHAR, ls_schema, ObjectLength, li_str_len) 
			
			ll_pos = Pos(ls_spname,';')
			IF ll_pos > 0 THEN
				ll_pos = ll_pos - 1
			ELSE
				ll_pos = Len(ls_spname)
			END IF
			
			IF Len(Trim(ls_schema)) > 0 THEN
				as_sp_list[li_total_tables] = ls_schema + "." + Left(ls_spname, ll_pos)
			ELSE
				as_sp_list[li_total_tables] = Left(ls_spname, ll_pos)
			END IF
		END IF
		
		li_rc = SQLFetch(ll_handle) 
	LOOP 
END IF 


RETURN li_total_tables 
end function

public function integer of_error ();// display sql error message

String ls_sqlstate, ls_errtext, ls_title
Integer li_rc, li_textlen
Long ll_errcode

ls_sqlstate = Space(5)
ls_errtext = Space(128)

//li_rc = SQLGetDiagRec(ai_handletype, al_handle, 1, &
//				ls_sqlstate, ll_errcode, ls_errtext, 128, li_textlen)
//If ll_errcode = 0 Then
//	ls_title = as_function + " SQL Error"
//Else
//	ls_title = as_function + " SQL Error #" + String(ll_errcode)
//End If

MessageBox( ls_title, "SQLSTATE = " + &
				ls_sqlstate + "~r~n" + ls_errtext, StopSign!)

// release the statement handle
//SQLFreeHandle(SQL_HANDLE_STMT, al_handle)

Return -1
end function

public function long of_odbcspextract (transaction atr, string as_sp, ref string as_sp_sql);integer li_total_tables = 0 
integer li_rc 
integer li_str_len 
string ls_catlog 
string ls_schema , ls_owner
string ls_spname 
String ls_DBMS, ls_DBMSSytax, ls_procsql
Long ll_handle, ll_pos

ll_handle = of_GetDBHandle(atr) 

SetNull(ls_catlog) 
SetNull(ls_schema) 

//li_rc = SQLProcedures(ll_handle, ls_catlog, 0, ls_schema, 0, & 
//      as_sp, Len(as_sp)) 
//		
//ls_spname = space(128) 
//ls_catlog = space(128) 
//ls_schema = space(128) 
//
//IF li_rc = SQL_SUCCESS OR li_rc = SQL_SUCCESS_WITH_INFO THEN 
//	SQLBindCol(ll_handle, 2, SQL_WCHAR, ls_schema, 128, li_str_len) 
//	
//	li_rc = SQLFetch(ll_handle) 
//	ls_owner = ls_schema
//
//	DO WHILE li_rc = SQL_SUCCESS OR li_rc = SQL_SUCCESS_WITH_INFO
//		li_rc = SQLFetch(ll_handle) 
//	LOOP
//END IF

//SQLCancel(ll_handle)

ls_DBMS = Space(128)

SQLGetInfo(atr.DBHandle(), SQL_DBMS_NAME, ls_DBMS, ObjectLength, li_str_len) 

//ls_DBMSSytax = ProfileString(gnv_app.of_GetProgramFilesDir() + 'QBODBC.ini', ls_DBMS, 'PBSyntax', '')
//ls_procsql = ProfileString(gnv_app.of_GetProgramFilesDir() + 'QBODBC.ini', ls_DBMSSytax, 'PBSelectProcSyntax', '')

IF Pos(as_sp, ".", 1) > 0 THEN
	ls_owner = Left(as_sp, Pos(as_sp, ".", 1) - 1)
	as_sp = Mid(as_sp, Pos(as_sp, ".", 1) + 1, Len(as_sp))
ELSE
	
END IF

n_cst_pbus_string lnv_string

IF Pos(ls_procsql, "&ObjectName") > 0 THEN ls_procsql = lnv_string.of_GlobalReplace(ls_procsql, "&ObjectName", as_sp)
IF Pos(ls_procsql, "&ObjectOwner") > 0 THEN ls_procsql = lnv_string.of_GlobalReplace(ls_procsql, "&ObjectOwner", ls_owner)

ll_pos = Pos(ls_procsql, "''")

DO UNTIL ll_pos = 0
	ls_procsql = Replace(ls_procsql, ll_pos, 2, "~~'")
	ll_pos = Pos(ls_procsql, "''", ll_pos)
LOOP

as_sp_sql = ls_procsql

RETURN 1 
end function

public function string of_getdefaultlistsql (string as_dbms);String ls_sql, ls_logname
String ls_sp[]
Long ll_index, ll_count
transaction ltr
n_cst_pbus_string lnv_string

CHOOSE CASE Lower(as_dbms)
	CASE 'syc'
		ls_sql = inv_ChangeSQL.of_GetSQL(inv_ChangeSQL.DEFAULTLISTSYBASE)
	CASE 'mss'
		ls_sql = inv_ChangeSQL.of_GetSQL(inv_ChangeSQL.DEFAULTLISTSQLSERVER)
	CASE 'asa'
		
	CASE 'ora'

	CASE 'odb'
		
END CHOOSE

RETURN ls_sql
end function

public function string of_getextendedprocedurelistsql (string as_dbms);String ls_sql, ls_logname
String ls_table[]
Long ll_index, ll_count
transaction ltr

CHOOSE CASE Lower(as_dbms)
	CASE 'syc'
		ls_logname = '""'

		ls_sql = 'SELECT USER_NAME(uid)+"."+name, O.id, crdate, ' + ls_logname + ',0   FROM sysobjects WHERE type="XP" AND uid=USER_ID("dbo") ORDER BY 1'
END CHOOSE

RETURN ls_sql
end function

public function string of_getloginlistsql (string as_dbms);String ls_sql, ls_logname
String ls_table[]
Long ll_index, ll_count
transaction ltr

CHOOSE CASE Lower(as_dbms)
	CASE 'syc'
		ls_logname = " loginame "

		ls_sql = 'SELECT name, 0, "jan 1 1900", "", 0 FROM master.dbo.syslogins WHERE name!="probe" ORDER BY name'

END CHOOSE

RETURN ls_sql
end function

public function string of_getdefaultextractsql (string as_dbms, string as_name);String ls_sql
transaction ltr
n_cst_pbus_string lnv_string

CHOOSE CASE Lower(as_dbms)
	CASE 'syc'
		ls_sql = inv_ChangeSQL.of_GetSQL(inv_ChangeSQL.DEFAULTEXTRACTSYBASE)
	CASE 'mss'
		ls_sql = inv_ChangeSQL.of_GetSQL(inv_ChangeSQL.DEFAULTEXTRACTSQLSERVER)
	CASE 'asa'
		
	CASE 'ora'
		
	CASE 'odb'
		
END CHOOSE

ls_sql = lnv_string.of_GlobalReplace(ls_sql, "%1", as_name)

RETURN ls_sql
end function

public function long of_odbctableextract (transaction atr, string as_tablename, ref str_tabledef as_column_list[]);// get list of columns

Long ll_handle, ll_position, ll_width, ll_coldecimal
Integer li_rc, li_count, li_strlen, li_coltype
String ls_catalog, ls_schema, ls_colname, ls_datatype
String ls_nullable, ls_default
String as_schema

IF Pos(as_tablename, '.') > 0 THEN
	as_schema = Left(as_tablename, Pos(as_tablename, '.') - 1)
	as_tablename = Mid(as_tablename, Pos(as_tablename, '.') + 1, Len(as_tablename))
END IF

// null out the search vars
SetNull(ls_catalog)
SetNull(ls_colname)
If as_schema = "" Then
	SetNull(as_schema)
End If

// allocate a statement handle
li_rc = SQLAllocHandle(SQL_HANDLE_STMT, atr.DbHandle(), ll_handle)

// get a list of columns
li_rc = SQLColumns(ll_handle, ls_catalog, 0, as_schema, Len(as_schema), & 
				as_tablename, Len(as_tablename), ls_colname, 0) 

// bind local variables to result set columns
long ll_rtn
SQLBindCol(	ll_handle, SQLCOL_ORDINAL_POSITION, SQL_INTEGER, ll_position, 0, li_strlen)
				

SQLBindCol(	ll_handle, SQLCOL_DATA_TYPE, SQL_SMALLINT, li_coltype, 0, li_strlen)
SQLBindCol(	ll_handle, SQLCOL_COLUMN_SIZE, SQL_INTEGER, ll_width, 0, li_strlen)
SQLBindCol(	ll_handle, SQLCOL_DECIMAL_DIGITS, SQL_INTEGER, ll_coldecimal, 0, li_strlen)

ls_nullable = Space(ObjectLength)
SQLBindCol(	ll_handle, SQLCOL_IS_NULLABLE, SQL_WCHAR, ls_nullable, Len(ls_nullable), li_strlen)
ls_default = Space(ObjectLength)
SQLBindCol(	ll_handle, SQLCOL_COLUMN_DEF, SQL_WCHAR, ls_default, Len(ls_default), li_strlen)

// fetch the first row
li_rc = SQLFetch(ll_handle)
Do While li_rc = SQL_SUCCESS
	li_count += 1
	//astr_columns[li_count].Position = ll_position
	
	ls_colname = Space(ObjectLength)
     SQLGetData(	ll_handle, SQLCOL_COLUMN_NAME, SQL_WCHAR, ls_colname, Len(ls_colname), li_strlen)
	
	ls_datatype = Space(ObjectLength)
	SQLGetData(	ll_handle, SQLCOL_TYPE_NAME, SQL_WCHAR, ls_datatype, Len(ls_datatype), li_strlen)
	
	as_column_list[li_count].Table_Name = Trim(ls_colname)
	as_column_list[li_count].data_type = Trim(ls_datatype)
	Choose Case li_coltype
		Case SQL_DECIMAL, SQL_NUMERIC, SQL_FLOAT
			as_column_list[li_count].Prec = ll_width - ll_coldecimal
			as_column_list[li_count].Scale = ll_coldecimal
		Case SQL_WCHAR, SQL_VARCHAR, SQL_WCHAR, SQL_WVARCHAR, &
			  SQL_NVARCHAR, SQL_BINARY, SQL_VARBINARY
			as_column_list[li_count].Length = ll_width
	End Choose
	If Upper(ls_nullable) = "YES" Then
		as_column_list[li_count].nullable = 1
	End If
	//astr_columns[li_count].Default = Trim(ls_default)
	// fetch the next row
	li_rc = SQLFetch(ll_handle)
LOOP 

// release the statement handle
SQLFreeHandle(SQL_HANDLE_STMT, ll_handle)

Return li_count
end function

public function string of_gettableviewlistsql (string as_dbms);String ls_sql, ls_logname
String ls_table[]
Long ll_index, ll_count
transaction ltr
n_cst_pbus_string lnv_string

CHOOSE CASE Lower(as_dbms)
	CASE 'syc'
		ls_sql = inv_ChangeSQL.of_GetSQL(inv_ChangeSQL.TABLEVIEWLISTSYBASE)
	CASE 'mss'
		ls_sql = inv_ChangeSQL.of_GetSQL(inv_ChangeSQL.TABLEVIEWLISTSQLSERVER)
	CASE 'asa'
		ls_sql = inv_ChangeSQL.of_GetSQL(inv_ChangeSQL.TABLEVIEWLISTSQLANYWHERE)	
	CASE 'ora'
		inv_ChangeSQL.ib_OracleDBA = ib_OracleDBA
		ls_sql = inv_ChangeSQL.of_GetSQL(inv_ChangeSQL.TABLEVIEWLISTORACLE)	
		ls_sql = lnv_string.of_GlobalReplace(ls_sql, "%1", Upper(is_user))
	CASE 'odb'
//		ltr = gnv_app.of_GetTransaction(is_servername)
//
//		of_ODBCTableList(ltr, ls_table)
//		
//		ll_count = UpperBound(ls_table)
//		
//		FOR ll_index = 1 TO ll_count
//			IF ll_index = 1 THEN
//				ls_sql = "SELECT ~~'" + ls_table[ll_index] + "~~', 1 "
//			ELSE
//				ls_sql = ls_sql + " UNION SELECT ~~'" + ls_table[ll_index] + "~~', 1 "
//			END IF
//			
//		NEXT
	
END CHOOSE

RETURN ls_sql
end function

public function string of_getownerlistsql (string as_dbms);String ls_sql, ls_logname
String ls_table[]
Long ll_index, ll_count
transaction ltr

CHOOSE CASE Lower(as_dbms)
	CASE 'syc'
		ls_sql = inv_ChangeSQL.of_GetSQL(inv_ChangeSQL.OWNERLISTSQLSYBASE)
	CASE 'mss'
		ls_sql = inv_ChangeSQL.of_GetSQL(inv_ChangeSQL.OWNERLISTSQLSQLSERVER)
	CASE 'asa'
		ls_sql = inv_ChangeSQL.of_GetSQL(inv_ChangeSQL.OWNERLISTSQLSQLANYWHERE)
	CASE 'ora'
		inv_ChangeSQL.ib_OracleDBA = ib_OracleDBA
		ls_sql = inv_ChangeSQL.of_GetSQL(inv_ChangeSQL.OWNERLISTSQLORACLE)
END CHOOSE

RETURN ls_sql
end function

public function string of_gettablelistownersql (string as_dbms, string as_owner);String ls_sql, ls_logname
String ls_table[]
Long ll_index, ll_count
transaction ltr

CHOOSE CASE Lower(as_dbms)
	CASE 'syc'
		ls_sql = inv_ChangeSQL.of_GetSQL(inv_ChangeSQL.TABLEOWNERLISTSYBASE)
	CASE 'mss'
		ls_sql = inv_ChangeSQL.of_GetSQL(inv_ChangeSQL.TABLEOWNERLISTSQLSERVER)
	CASE 'asa'
		ls_sql = inv_ChangeSQL.of_GetSQL(inv_ChangeSQL.TABLEOWNERLISTSQLANYWHERE)
	CASE 'ora'
		inv_ChangeSQL.ib_OracleDBA = ib_OracleDBA
		ls_sql = inv_ChangeSQL.of_GetSQL(inv_ChangeSQL.TABLEOWNERLISTORACLE)
		as_owner = Upper(as_owner)
END CHOOSE

n_cst_pbus_string lnv_string
ls_sql = lnv_string.of_GlobalReplace(ls_sql, "%1", as_owner)


RETURN ls_sql
end function

public function string of_getpackagelistsql (string as_dbms);String ls_sql, ls_logname
String ls_table[]
Long ll_index, ll_count
transaction ltr
n_cst_pbus_string lnv_string

CHOOSE CASE Lower(as_dbms)
	CASE 'ora'
		inv_ChangeSQL.ib_OracleDBA = ib_OracleDBA
		ls_sql = inv_ChangeSQL.of_GetSQL(inv_ChangeSQL.PACKAGELISTORACLE)
		ls_sql = lnv_string.of_GlobalReplace(ls_sql, "%1", Upper(is_user))
END CHOOSE

RETURN ls_sql
end function

public function string of_getpackagebodylistsql (string as_dbms, string as_name);String ls_sql, ls_logname
String ls_table[]
Long ll_index, ll_count
transaction ltr
n_cst_pbus_string lnv_string

CHOOSE CASE Lower(as_dbms)
	CASE 'ora'
		inv_ChangeSQL.ib_OracleDBA = ib_OracleDBA
		ls_sql = inv_ChangeSQL.of_GetSQL(inv_ChangeSQL.PACKAGEBODYLISTORACLE)
		ls_sql = lnv_string.of_GlobalReplace(ls_sql, "%1", Upper(is_user))
END CHOOSE

ls_sql = lnv_string.of_GlobalReplace(ls_sql, "%2", as_name)


RETURN ls_sql
end function

public function string of_getpackageextractsql (string as_dbms, string as_name);String ls_sql
transaction ltr
n_cst_pbus_string lnv_string

CHOOSE CASE Lower(as_dbms)
	CASE 'ora'
		inv_ChangeSQL.ib_OracleDBA = ib_OracleDBA
		ls_sql = inv_ChangeSQL.of_GetSQL(inv_ChangeSQL.PACKAGEEXTRACTORACLE)
		ls_sql = lnv_string.of_GlobalReplace(ls_sql, "%2", Upper(is_user))
END CHOOSE

ls_sql = lnv_string.of_GlobalReplace(ls_sql, "%1", as_name)

RETURN ls_sql
end function

public function string of_getpackagebodyextractsql (string as_dbms, string as_name);String ls_sql
transaction ltr
n_cst_pbus_string lnv_string

CHOOSE CASE Lower(as_dbms)
	CASE 'ora'
		inv_ChangeSQL.ib_OracleDBA = ib_OracleDBA
		ls_sql = inv_ChangeSQL.of_GetSQL(inv_ChangeSQL.PACKAGEBODYEXTRACTORACLE)
		ls_sql = lnv_string.of_GlobalReplace(ls_sql, "%2", Upper(is_user))
END CHOOSE

ls_sql = lnv_string.of_GlobalReplace(ls_sql, "%1", as_name)

RETURN ls_sql
end function

public function string of_getfunctionlistsql (string as_dbms);String ls_sql, ls_logname
String ls_table[]
Long ll_index, ll_count
transaction ltr
n_cst_pbus_string lnv_string

CHOOSE CASE Lower(as_dbms)
	CASE 'syc'
		ls_sql = inv_ChangeSQL.of_GetSQL(inv_ChangeSQL.FUNCTIONLISTSYBASE)
	CASE 'mss'
		ls_sql = inv_ChangeSQL.of_GetSQL(inv_ChangeSQL.FUNCTIONLISTSQLSERVER)
	CASE 'asa'
		ls_sql = inv_ChangeSQL.of_GetSQL(inv_ChangeSQL.FUNCTIONLISTSQLANYWHERE)
	CASE 'ora'
		inv_ChangeSQL.ib_OracleDBA = ib_OracleDBA
		ls_sql = inv_ChangeSQL.of_GetSQL(inv_ChangeSQL.FUNCTIONLISTORACLE)
		ls_sql = lnv_string.of_GlobalReplace(ls_sql, "%1", Upper(is_user))
END CHOOSE

RETURN ls_sql
end function

public function string of_getfunctionextractsql (string as_dbms, string as_name);String ls_sql
transaction ltr
n_cst_pbus_string lnv_string

CHOOSE CASE Lower(as_dbms)
	CASE 'syc'
		ls_sql = inv_ChangeSQL.of_GetSQL(inv_ChangeSQL.FUNCTIONEXTRACTSYBASE)
	CASE 'mss'
		ls_sql = inv_ChangeSQL.of_GetSQL(inv_ChangeSQL.FUNCTIONEXTRACTSQLSERVER)
	CASE 'asa'
		ls_sql = inv_ChangeSQL.of_GetSQL(inv_ChangeSQL.FUNCTIONEXTRACTSQLANYWHERE)
	CASE 'ora'
		inv_ChangeSQL.ib_OracleDBA = ib_OracleDBA
		ls_sql = inv_ChangeSQL.of_GetSQL(inv_ChangeSQL.FUNCTIONEXTRACTORACLE)
		ls_sql = lnv_string.of_GlobalReplace(ls_sql, "%2", Upper(is_user))
	CASE 'odb'
		//ltr = gnv_app.of_GetTransaction(is_servername)

		of_ODBCSPExtract(ltr, as_name, ls_sql)
END CHOOSE

ls_sql = lnv_string.of_GlobalReplace(ls_sql, "%1", as_name)

RETURN ls_sql
end function

public function long of_odbcownerlist (transaction atr, ref string as_table_list[]);// get list of tables

Long ll_handle
Integer li_rc, li_count, li_strlen
String ls_catalog, ls_schema, ls_tabname, ls_tabtype
Long ll_index, ll_count
Boolean lb_exists

// null out the search vars
SetNull(ls_catalog)
SetNull(ls_schema)
SetNull(ls_tabname)

// allocate a statement handle
li_rc = SQLAllocHandle(SQL_HANDLE_STMT, atr.DbHandle(), ll_handle)

// get a list of tables
li_rc = SQLTables(ll_handle, ls_catalog, 0, ls_schema, &
				0, ls_tabname, 0, 'TABLE', 5)

// bind local variables to result set columns
//ls_schema = Space(ObjectLength)
//SQLBindCol(	ll_handle, SQLTAB_TABLE_SCHEM, &
//				SQL_WCHAR, ls_schema, Len(ls_schema), li_strlen)

// fetch the first row
li_rc = SQLFetch(ll_handle)
Do While li_rc = SQL_SUCCESS
	li_count += 1
	
	ls_schema = Space(ObjectLength)
	SQLGetData(	ll_handle, SQLTAB_TABLE_SCHEM, &
				SQL_WCHAR, ls_schema, Len(ls_schema), li_strlen)
	
	ll_count = UpperBound(as_table_list)
	lb_exists = FALSE
	
	FOR ll_index = 1 TO ll_count
		IF as_table_list[ll_index] = Trim(ls_schema) THEN
			lb_exists = TRUE
			EXIT
		END IF
	NEXT
	
	IF NOT lb_exists THEN
		IF NOT IsNull(ls_schema) AND Len(Trim(ls_schema)) > 0 THEN
			as_table_list[li_count] = Trim(ls_schema)
		END IF
	END IF
	
	// fetch the next row
	li_rc = SQLFetch(ll_handle)
Loop

// release the statement handle
SQLFreeHandle(SQL_HANDLE_STMT, ll_handle)

return 1

end function

public function long of_odbcviewextract (transaction atr, string as_table_name, ref string as_sp_sql);integer li_total_tables = 0 
integer li_rc 
integer li_str_len 
string ls_catlog 
string ls_schema , ls_owner
string ls_spname 
String ls_DBMS, ls_DBMSSytax, ls_procsql
Long ll_handle, ll_pos

ll_handle = of_GetDBHandle(atr) 

//SetNull(ls_catlog) 
//SetNull(ls_schema) 
//
//li_rc = SQLTables(ll_handle, ls_catlog, 0, ls_schema, &
//				0, as_table_name, 0, 'VIEW', 4)
//
//		
//ls_spname = space(128) 
//ls_catlog = space(128) 
//ls_schema = space(128) 
//
//IF li_rc = SQL_SUCCESS OR li_rc = SQL_SUCCESS_WITH_INFO THEN 
//	SQLBindCol(ll_handle, 2, SQL_WCHAR, ls_schema, 128, li_str_len) 
//	
//	li_rc = SQLFetch(ll_handle) 
//	ls_owner = ls_schema
//
//	DO WHILE li_rc = SQL_SUCCESS OR li_rc = SQL_SUCCESS_WITH_INFO
//		li_rc = SQLFetch(ll_handle) 
//	LOOP
//END IF

//SQLCancel(ll_handle)

ls_DBMS = Space(ObjectLength)

SQLGetInfo(atr.DBHandle(), SQL_DBMS_NAME, ls_DBMS, ObjectLength, li_str_len) 

//ls_DBMSSytax = ProfileString(gnv_app.of_GetProgramFilesDir() + 'QBODBC.ini', ls_DBMS, 'PBSyntax', '')
//ls_procsql = ProfileString(gnv_app.of_GetProgramFilesDir() + 'QBODBC.ini', ls_DBMSSytax, 'PBSelectViewSyntax', '')

IF Pos(as_table_name, ".", 1) > 0 THEN
	ls_owner = Left(as_table_name, Pos(as_table_name, ".", 1) - 1)
	as_table_name = Mid(as_table_name, Pos(as_table_name, ".", 1) + 1, Len(as_table_name))
END IF

n_cst_pbus_string lnv_string

IF Pos(ls_procsql, "&ObjectName") > 0 THEN ls_procsql = lnv_string.of_GlobalReplace(ls_procsql, "&ObjectName", as_table_name)
IF Pos(ls_procsql, "&ObjectOwner") > 0 THEN ls_procsql = lnv_string.of_GlobalReplace(ls_procsql, "&ObjectOwner", ls_owner)

ll_pos = Pos(ls_procsql, "''")

DO UNTIL ll_pos = 0
	ls_procsql = Replace(ls_procsql, ll_pos, 2, "~~'")
	ll_pos = Pos(ls_procsql, "''", ll_pos)
LOOP

as_sp_sql = ls_procsql

RETURN 1 
end function

public function long of_odbcfunctionlist (transaction atr, ref string as_sp_list[]);integer li_total_tables = 0 
integer li_rc 
integer li_str_len 
string ls_catlog 
string ls_schema 
string ls_spname 
Long ll_handle
Long ll_pos
Long ll_type

ll_handle = of_GetDBHandle(atr) 

SetNull(ls_catlog) 
SetNull(ls_schema) 
SetNull(ls_spname) 

li_rc = SQLProcedures(ll_handle, ls_spname, 0, ls_spname, 0, & 
      ls_spname, 0) 
		


IF li_rc = SQL_SUCCESS OR li_rc = SQL_SUCCESS_WITH_INFO THEN 
//	SQLBindCol(ll_handle, SQLSP_PROCEDURE_NAME, SQL_WCHAR, ls_spname, ObjectLength, li_str_len) 
//	SQLBindCol(ll_handle, SQLSP_PROCEDURE_CAT, SQL_WCHAR, ls_catlog, ObjectLength, li_str_len) 
//	SQLBindCol(ll_handle, SQLSP_PROCEDURE_SCHEM, SQL_WCHAR, ls_schema, ObjectLength, li_str_len) 
	
	SQLBindCol(ll_handle, 8, SQL_SMALLINT, ll_type, 0, li_str_len) 
	
	li_rc = SQLFetch(ll_handle) 
	
	DO WHILE li_rc = SQL_SUCCESS 
		IF ll_type = 2 THEN
			li_total_tables += 1 
			
			ls_spname = space(ObjectLength) 
			ls_catlog = space(ObjectLength) 
			ls_schema = space(ObjectLength) 
			SQLGetData(ll_handle, SQLSP_PROCEDURE_NAME, SQL_WCHAR, ls_spname, ObjectLength, li_str_len) 
			SQLGetData(ll_handle, SQLSP_PROCEDURE_CAT, SQL_WCHAR, ls_catlog, ObjectLength, li_str_len) 
			SQLGetData(ll_handle, SQLSP_PROCEDURE_SCHEM, SQL_WCHAR, ls_schema, ObjectLength, li_str_len) 
			
			ll_pos = Pos(ls_spname,';')
			IF ll_pos > 0 THEN
				ll_pos = ll_pos - 1
			ELSE
				ll_pos = Len(ls_spname)
			END IF
			
			IF Len(Trim(ls_schema)) > 0 THEN
				as_sp_list[li_total_tables] = ls_schema + "." + Left(ls_spname, ll_pos)
			ELSE
				as_sp_list[li_total_tables] = Left(ls_spname, ll_pos)
			END IF
		END IF
		
		li_rc = SQLFetch(ll_handle) 
	LOOP 
END IF 


RETURN li_total_tables 
end function

public function long of_odbctablelist (transaction atr, ref string as_table_list[], string as_owner);// get list of tables

Long ll_handle
Integer li_rc, li_count, li_strlen
String ls_catalog, ls_schema, ls_tabname, ls_tabtype

// null out the search vars
SetNull(ls_catalog)
SetNull(ls_schema)
SetNull(ls_tabname)

// allocate a statement handle
li_rc = SQLAllocHandle(SQL_HANDLE_STMT, atr.DbHandle(), ll_handle)

// get a list of tables
li_rc = SQLTables(ll_handle, ls_catalog, 0, ls_schema, &
				0, ls_tabname, 0, 'TABLE', 5)


// bind local variables to result set columns
//ls_schema = Space(ObjectLength)
//SQLBindCol(	ll_handle, SQLTAB_TABLE_SCHEM, &
//				SQL_WCHAR, ls_schema, Len(ls_schema), li_strlen)
//ls_tabname = Space(ObjectLength)
//SQLBindCol(	ll_handle, SQLTAB_TABLE_NAME, &
//				SQL_WCHAR, ls_tabname, Len(ls_tabname), li_strlen)
//ls_tabtype = Space(ObjectLength)
//SQLBindCol(	ll_handle, SQLTAB_TABLE_TYPE, &
//				SQL_WCHAR, ls_tabtype, Len(ls_tabtype), li_strlen)

boolean lb_add

// fetch the first row
li_rc = SQLFetch(ll_handle)
Do While li_rc = SQL_SUCCESS
	lb_add = true
	
	ls_schema = Space(ObjectLength)
	SQLGetData(	ll_handle, SQLTAB_TABLE_SCHEM, &
					SQL_WCHAR, ls_schema, Len(ls_schema), li_strlen)
	ls_tabname = Space(ObjectLength)
	SQLGetData(	ll_handle, SQLTAB_TABLE_NAME, &
					SQL_WCHAR, ls_tabname, Len(ls_tabname), li_strlen)
	ls_tabtype = Space(ObjectLength)
	SQLGetData(	ll_handle, SQLTAB_TABLE_TYPE, &
					SQL_WCHAR, ls_tabtype, Len(ls_tabtype), li_strlen)
	
	IF as_owner <> "" AND as_owner <> ls_schema THEN
		lb_add = false
	END IF
	
	IF lb_add THEN
		li_count += 1
		IF Len(Trim(ls_schema)) > 0 AND as_owner = '' THEN
			as_table_list[li_count] = Trim(ls_schema) + "." + Trim(ls_tabname)
		ELSE
			as_table_list[li_count] = Trim(ls_tabname)
		END IF
	END IF
	
	// fetch the next row
	li_rc = SQLFetch(ll_handle)
Loop

// release the statement handle
SQLFreeHandle(SQL_HANDLE_STMT, ll_handle)

Return li_count

end function

public function long of_odbcviewlist (transaction atr, ref string as_table_list[], string as_owner);integer li_total_tables = 0 
integer li_rc 
integer li_str_len 
string ls_tablename, ls_schema
Long ll_handle

li_rc = SQLAllocHandle(SQL_HANDLE_STMT, atr.DbHandle(), ll_handle)

SetNull(ls_tablename) 

li_rc = SQLTables(ll_handle, ls_tablename, 0, ls_tablename, 0, & 
      ls_tablename, 0, 'VIEW', 4)  
		


IF li_rc = SQL_SUCCESS OR li_rc = SQL_SUCCESS_WITH_INFO THEN 
//	SQLBindCol(ll_handle, SQLTAB_TABLE_NAME, SQL_WCHAR, ls_tablename, ObjectLength, li_str_len) 
//	SQLBindCol(ll_handle, SQLTAB_TABLE_SCHEM, SQL_WCHAR, ls_schema, ObjectLength, li_str_len) 

	li_rc = SQLFetch(ll_handle) 
	
	boolean lb_add
	
	DO WHILE li_rc = SQL_SUCCESS 
		lb_add = true
		ls_tablename = space(ObjectLength)  
		ls_schema = space(ObjectLength)  
		SQLGetData(ll_handle, SQLTAB_TABLE_NAME, SQL_WCHAR, ls_tablename, ObjectLength, li_str_len) 
		SQLGetData(ll_handle, SQLTAB_TABLE_SCHEM, SQL_WCHAR, ls_schema, ObjectLength, li_str_len) 
		
		IF as_owner <> "" AND as_owner <> ls_schema THEN
			lb_add = false
		END IF
		
		IF lb_add THEN
			li_total_tables += 1 
			
			IF Len(Trim(ls_schema)) > 0 AND as_owner = "" THEN
				as_table_list[li_total_tables] = ls_schema + "." + ls_tablename 
			ELSE
				as_table_list[li_total_tables] = ls_tablename 
			END IF
		END IF
		
		li_rc = SQLFetch(ll_handle) 
	LOOP 
END IF 


RETURN li_total_tables 
end function

public function string of_getdatatypelistsql (string as_dbms);String ls_sql, ls_logname
String ls_sp[]
Long ll_index, ll_count
transaction ltr
n_cst_pbus_string lnv_string

CHOOSE CASE Lower(as_dbms)
	CASE 'syc'
		ls_sql = inv_ChangeSQL.of_GetSQL(inv_ChangeSQL.DATATYPELISTSYBASE)
	CASE 'mss'
		ls_sql = inv_ChangeSQL.of_GetSQL(inv_ChangeSQL.DATATYPELISTSQLSERVER)
	CASE 'asa'
		ls_sql = inv_ChangeSQL.of_GetSQL(inv_ChangeSQL.DATATYPELISTSQLANYWHERE)
	CASE 'ora'
//		inv_ChangeSQL.ib_OracleDBA = ib_OracleDBA
//		ls_sql = inv_ChangeSQL.of_GetSQL(inv_ChangeSQL.SPLISTORACLE)
//		ls_sql = lnv_string.of_GlobalReplace(ls_sql, "%1", Upper(is_user))
	CASE 'odb'
		
END CHOOSE

RETURN ls_sql
end function

public function string of_getdatatypeextractsql (string as_dbms, string as_name);String ls_sql
transaction ltr
n_cst_pbus_string lnv_string

CHOOSE CASE Lower(as_dbms)
	CASE 'syc'
		ls_sql = inv_ChangeSQL.of_GetSQL(inv_ChangeSQL.DATATYPEEXTRACTSYBASE)
	CASE 'mss'
		
	CASE 'asa'
		
	CASE 'ora'
		
	CASE 'odb'
		
END CHOOSE

ls_sql = lnv_string.of_GlobalReplace(ls_sql, "%1", as_name)

RETURN ls_sql
end function

public function string of_getrulelistsql (string as_dbms);String ls_sql, ls_logname
String ls_sp[]
Long ll_index, ll_count
transaction ltr
n_cst_pbus_string lnv_string

CHOOSE CASE Lower(as_dbms)
	CASE 'syc'
		ls_sql = inv_ChangeSQL.of_GetSQL(inv_ChangeSQL.RULELISTSYBASE)
	CASE 'mss'
		ls_sql = inv_ChangeSQL.of_GetSQL(inv_ChangeSQL.RULELISTSQLSERVER)
	CASE 'asa'
		
	CASE 'ora'

	CASE 'odb'
		
END CHOOSE

RETURN ls_sql
end function

public function string of_getruleextractsql (string as_dbms, string as_name);String ls_sql
transaction ltr
n_cst_pbus_string lnv_string

CHOOSE CASE Lower(as_dbms)
	CASE 'syc'
		ls_sql = inv_ChangeSQL.of_GetSQL(inv_ChangeSQL.RULEEXTRACTSYBASE)
	CASE 'mss'
		ls_sql = inv_ChangeSQL.of_GetSQL(inv_ChangeSQL.RULEEXTRACTSQLSERVER)
	CASE 'asa'
		
	CASE 'ora'
		
	CASE 'odb'
		
END CHOOSE

ls_sql = lnv_string.of_GlobalReplace(ls_sql, "%1", as_name)

RETURN ls_sql
end function

public function string of_getsynonymlistsql (string as_dbms);String ls_sql, ls_logname
String ls_sp[]
Long ll_index, ll_count
transaction ltr
n_cst_pbus_string lnv_string

CHOOSE CASE Lower(as_dbms)
	CASE 'syc'
		
	CASE 'mss'
		ls_sql = inv_ChangeSQL.of_GetSQL(inv_ChangeSQL.SYNONYMLISTSQLSERVER)
	CASE 'asa'
		
	CASE 'ora'

	CASE 'odb'
		
END CHOOSE

RETURN ls_sql
end function

public function string of_getsynonymextractsql (string as_dbms, string as_name);String ls_sql
transaction ltr
n_cst_pbus_string lnv_string

CHOOSE CASE Lower(as_dbms)
	CASE 'syc'
		
	CASE 'mss'
		ls_sql = inv_ChangeSQL.of_GetSQL(inv_ChangeSQL.SYNONYMEXTRACTSQLSERVER)
	CASE 'asa'
		
	CASE 'ora'
		
	CASE 'odb'
		
END CHOOSE

ls_sql = lnv_string.of_GlobalReplace(ls_sql, "%1", as_name)

RETURN ls_sql
end function

public function string of_getrolelistsql (string as_dbms);String ls_sql, ls_logname
String ls_sp[]
Long ll_index, ll_count
transaction ltr
n_cst_pbus_string lnv_string

CHOOSE CASE Lower(as_dbms)
	CASE 'syc'
		ls_sql = inv_ChangeSQL.of_GetSQL(inv_ChangeSQL.ROLELISTSYBASE)
	CASE 'mss'
		ls_sql = inv_ChangeSQL.of_GetSQL(inv_ChangeSQL.ROLELISTSQLSERVER)
	CASE 'asa'
		
	CASE 'ora'

	CASE 'odb'
		
END CHOOSE

RETURN ls_sql
end function

public function string of_getroleextractsql (string as_dbms, string as_name);String ls_sql
transaction ltr
n_cst_pbus_string lnv_string

CHOOSE CASE Lower(as_dbms)
	CASE 'syc'
		ls_sql = inv_ChangeSQL.of_GetSQL(inv_ChangeSQL.ROLEEXTRACTSYBASE)
	CASE 'mss'
		ls_sql = inv_ChangeSQL.of_GetSQL(inv_ChangeSQL.ROLEEXTRACTSQLSERVER)
	CASE 'asa'
		
	CASE 'ora'
		
	CASE 'odb'
		
END CHOOSE

ls_sql = lnv_string.of_GlobalReplace(ls_sql, "%1", as_name)

RETURN ls_sql
end function

public function long of_odbctablepk (transaction atr, string as_tablename, ref string as_column_list[]);// get list of columns

Long ll_handle, ll_position, ll_width, ll_coldecimal
Integer li_rc, li_count, li_strlen, li_coltype
String ls_catalog, ls_schema, ls_colname, ls_datatype
String ls_nullable, ls_default
String as_schema

IF Pos(as_tablename, '.') > 0 THEN
	as_schema = Left(as_tablename, Pos(as_tablename, '.') - 1)
	as_tablename = Mid(as_tablename, Pos(as_tablename, '.') + 1, Len(as_tablename))
END IF

// null out the search vars
SetNull(ls_catalog)
SetNull(ls_colname)
If as_schema = "" Then
	SetNull(as_schema)
End If

// allocate a statement handle
li_rc = SQLAllocHandle(SQL_HANDLE_STMT, atr.DbHandle(), ll_handle)
//If li_rc = SQL_ERROR Then
//	Return of_SQLError("of_Columns", SQL_HANDLE_STMT, ll_handle)
//End If

// get a list of columns
li_rc = SQLPrimaryKeys(ll_handle, ls_catalog, 0, as_schema, Len(as_schema), & 
				as_tablename, Len(as_tablename)) 
//If li_rc = SQL_ERROR Then
//	Return of_SQLError("of_Columns", SQL_HANDLE_STMT, ll_handle)
//End If
//
// bind local variables to result set columns


// fetch the first row
li_rc = SQLFetch(ll_handle)
Do While li_rc = SQL_SUCCESS
	
	ls_colname = Space(ObjectLength)
	SQLGetData(	ll_handle, SQLCOL_COLUMN_NAME, &
				SQL_WCHAR, ls_colname, Len(ls_colname), li_strlen)
	
	li_count += 1
	//astr_columns[li_count].Position = ll_position
	as_column_list[li_count] = Trim(ls_colname)
	// fetch the next row
	li_rc = SQLFetch(ll_handle)
LOOP 

// release the statement handle
SQLFreeHandle(SQL_HANDLE_STMT, ll_handle)

Return li_count
end function

public function string of_getmaterializedviewlistsql (string as_dbms);String ls_sql, ls_logname
String ls_table[]
Long ll_count, ll_index
transaction ltr
n_cst_pbus_string lnv_string

CHOOSE CASE Lower(as_dbms)
	CASE 'syc'

	CASE 'mss'

	CASE 'asa'

	CASE 'ora'
		inv_ChangeSQL.ib_OracleDBA = ib_OracleDBA
		ls_sql = inv_ChangeSQL.of_GetSQL(inv_ChangeSQL.MATERIALIZEDVIEWLISTORACLE)
		ls_sql = lnv_string.of_GlobalReplace(ls_sql, "%1", Upper(is_user))
	CASE 'odb'

END CHOOSE

RETURN ls_sql
end function

public function integer of_changesql (transaction atr, long as_action, string as_dbms, datastore a_dw, string as_name);String ls_sql
Long ll_index, ll_count, ll_row
String ls_tables[]
		
Transaction ltr
ltr = atr

CHOOSE CASE as_action
	CASE TABLELIST
		ls_sql = of_GetTableListSQL(as_dbms)
	CASE TABLEVIEWLIST
		ls_sql = of_GetTableViewListSQL(as_dbms)
	CASE SPLIST
		ls_sql = of_GetSPListSQL(as_dbms)
	CASE VIEWLIST
		ls_sql = of_GetViewListSQL(as_dbms)
	CASE TRIGGERLIST
		ls_sql = of_GetTriggerListSQL(as_dbms)
	CASE INDEXLIST
		ls_sql = of_GetIndexListSQL(as_dbms)
	CASE DEFAULTLIST
		ls_sql = of_GetDefaultListSQL(as_dbms)
	CASE EXTENDEDPROCEDURELIST
		ls_sql = of_GetExtendedProcedureListSQL(as_dbms)
	CASE LOGINLIST
		ls_sql = of_GetLoginListSQL(as_dbms)
	CASE OWNERLIST
		ls_sql = of_GetOwnerListSQL(as_dbms)
	CASE TABLEOWNERLIST
		ls_sql = of_GetTableListOwnerSQL(as_dbms, as_name)
		
	CASE TABLEEXTRACT
		ls_sql = of_GetTableExtractSQL(as_dbms, as_name)
	CASE SPEXTRACT
		ls_sql = of_GetSPExtractSQL(as_dbms, as_name)
	CASE VIEWEXTRACT
		ls_sql = of_GetViewExtractSQL(as_dbms, as_name)
	CASE TRIGGEREXTRACT
		ls_sql = of_GetTriggerExtractSQL(as_dbms, as_name)
	CASE INDEXEXTRACT
		ls_sql = of_GetIndexExtractSQL(as_dbms, as_name)
	CASE DEFAULTEXTRACT
		ls_sql = of_GetDefaultExtractSQL(as_dbms, as_name)
	CASE PACKAGELIST
		ls_sql = of_GetPackageListSQL(as_dbms)
	CASE PACKAGEBODYLIST
		ls_sql = of_GetPackageBodyListSQL(as_dbms, as_name)
	CASE PACKAGEEXTRACT
		ls_sql = of_GetPackageExtractSQL(as_dbms, as_name)
	CASE PACKAGEBODYEXTRACT
		ls_sql = of_GetPackageBodyExtractSQL(as_dbms, as_name)
		
	CASE FUNCTIONLIST
		ls_sql = of_GetFunctionListSQL(as_dbms)
	CASE FUNCTIONEXTRACT
		ls_sql = of_GetFunctionExtractSQL(as_dbms, as_name)
		
	CASE DATATYPELIST
		ls_sql = of_GetDataTypeListSQL(as_dbms)
	CASE DATATYPEEXTRACT
		ls_sql = of_GetDataTypeExtractSQL(as_dbms, as_name)
		
	CASE RULESLIST
		ls_sql = of_GetRuleListSQL(as_dbms)
	CASE RULESEXTRACT
		ls_sql = of_GetRuleExtractSQL(as_dbms, as_name)
		
	CASE SYNONYMLIST
		ls_sql = of_GetSynonymListSQL(as_dbms)
	CASE SYNONYMEXTRACT
		ls_sql = of_GetSynonymExtractSQL(as_dbms, as_name)
		
	CASE ROLELIST
		ls_sql = of_GetRoleListSQL(as_dbms)
	CASE ROLEEXTRACT
		ls_sql = of_GetRoleExtractSQL(as_dbms, as_name)
		
	CASE MATERIALIZEDVIEWLIST
		ls_sql = of_getmaterializedviewlistsql(as_dbms)
END CHOOSE


IF as_action = TABLEEXTRACT AND as_dbms = 'odb' THEN
	str_tabledef lstr_tabledef[]
	
	of_ODBCTableExtract(ltr, as_name, lstr_tabledef)

	ll_count = UpperBound(lstr_tabledef)
	a_dw.Reset()
	
	FOR ll_index = 1 TO ll_count
		ll_row = a_dw.InsertRow(0)
		a_dw.SetItem(ll_row, 1, lstr_tabledef[ll_index].table_name)
		a_dw.SetItem(ll_row, 2, lstr_tabledef[ll_index].data_type)
		a_dw.SetItem(ll_row, 3, lstr_tabledef[ll_index].length)
		a_dw.SetItem(ll_row, 4, lstr_tabledef[ll_index].prec)
		a_dw.SetItem(ll_row, 5, lstr_tabledef[ll_index].scale)
		a_dw.SetItem(ll_row, 6, lstr_tabledef[ll_index].nullable)
	NEXT
	
ELSEIF (as_action = TABLELIST OR as_action = TABLEVIEWLIST) AND as_dbms = 'odb' THEN

	of_ODBCTableList(ltr, ls_tables, '')
	
	ll_count = UpperBound(ls_tables)
	a_dw.Reset()
	FOR ll_index = 1 TO ll_count
		ll_row = a_dw.InsertRow(0)
		a_dw.SetItem(ll_row, 1, ls_tables[ll_index])
		a_dw.SetItem(ll_row, 6, 'U')
	NEXT
	a_dw.SetSort("#1")
	a_dw.Sort()
	
ELSEIF as_action = OWNERLIST AND as_dbms = 'odb' THEN

	of_ODBCOwnerList(ltr, ls_tables)
	
	ll_count = UpperBound(ls_tables)
	a_dw.Reset()
	FOR ll_index = 1 TO ll_count
		ll_row = a_dw.InsertRow(0)
		a_dw.SetItem(ll_row, 1, ls_tables[ll_index])
	NEXT
	a_dw.SetSort("#1")
	a_dw.Sort()
ELSEIF as_action = VIEWLIST AND as_dbms = 'odb' THEN

	of_ODBCViewList(ltr, ls_tables, "")
	
	ll_count = UpperBound(ls_tables)
	a_dw.Reset()
	FOR ll_index = 1 TO ll_count
		ll_row = a_dw.InsertRow(0)
		a_dw.SetItem(ll_row, 1, ls_tables[ll_index])
		a_dw.SetItem(ll_row, 6, 'U')
	NEXT
	a_dw.SetSort("#1")
	a_dw.Sort()
ELSEIF as_action = SPLIST AND as_dbms = 'odb' THEN

	of_ODBCSPList(ltr, ls_tables)
	
	ll_count = UpperBound(ls_tables)
	a_dw.Reset()
	FOR ll_index = 1 TO ll_count
		ll_row = a_dw.InsertRow(0)
		a_dw.SetItem(ll_row, 1, ls_tables[ll_index])
		a_dw.SetItem(ll_row, 6, 'U')
	NEXT
	a_dw.SetSort("#1")
	a_dw.Sort()
	
ELSEIF as_action = FUNCTIONLIST AND as_dbms = 'odb' THEN

	of_ODBCFunctionList(ltr, ls_tables)
	
	ll_count = UpperBound(ls_tables)
	a_dw.Reset()
	FOR ll_index = 1 TO ll_count
		ll_row = a_dw.InsertRow(0)
		a_dw.SetItem(ll_row, 1, ls_tables[ll_index])
		a_dw.SetItem(ll_row, 6, 'U')
	NEXT
	
	a_dw.SetSort("#1")
	a_dw.Sort()
	
ELSEIF as_action = TABLEOWNERLIST AND as_dbms = 'odb' THEN

	
	of_ODBCTableList(ltr, ls_tables, as_name)
	
	ll_count = UpperBound(ls_tables)
	a_dw.Reset()
	FOR ll_index = 1 TO ll_count
		ll_row = a_dw.InsertRow(0)
		a_dw.SetItem(ll_row, 1, ls_tables[ll_index])
		a_dw.SetItem(ll_row, 2, 'U')
	NEXT
	
	string ls[]
	ls_tables = ls
	
	of_ODBCViewList(ltr, ls_tables, as_name)
	
	ll_count = UpperBound(ls_tables)

	FOR ll_index = 1 TO ll_count
		ll_row = a_dw.InsertRow(0)
		a_dw.SetItem(ll_row, 1, ls_tables[ll_index])
		a_dw.SetItem(ll_row, 2, 'V')
	NEXT
	
	a_dw.SetSort("#1")
	a_dw.Sort()
ELSE
	a_dw.Modify('DataWindow.Table.Select="' + ls_sql + '"')
END IF

RETURN 1
end function

public function integer of_changesql (transaction atr, long as_action, string as_dbms, datawindow a_dw, string as_name);String ls_sql
Long ll_index, ll_count, ll_row
String ls_tables[]

transaction ltr
ltr = atr

CHOOSE CASE as_action
	CASE TABLEOWNERLIST
		ls_sql = of_GetTableListOwnerSQL(as_dbms, as_name)
	CASE TABLELIST
		ls_sql = of_GetTableListSQL(as_dbms)
	CASE TABLEVIEWLIST
		ls_sql = of_GetTableViewListSQL(as_dbms)
	CASE SPLIST
		ls_sql = of_GetSPListSQL(as_dbms)
	CASE VIEWLIST
		ls_sql = of_GetViewListSQL(as_dbms)
	CASE TRIGGERLIST
		ls_sql = of_GetTriggerListSQL(as_dbms)
	CASE INDEXLIST
		ls_sql = of_GetIndexListSQL(as_dbms)
	CASE DEFAULTLIST
		ls_sql = of_GetDefaultListSQL(as_dbms)
	CASE EXTENDEDPROCEDURELIST
		ls_sql = of_GetExtendedProcedureListSQL(as_dbms)
	CASE LOGINLIST
		ls_sql = of_GetLoginListSQL(as_dbms)
	CASE OWNERLIST
		ls_sql = of_GetOwnerListSQL(as_dbms)
	CASE TABLEOWNERLIST
		ls_sql = of_GetTableListOwnerSQL(as_dbms, as_name)
		
	CASE TABLEEXTRACT
		ls_sql = of_GetTableExtractSQL(as_dbms, as_name)
	CASE SPEXTRACT
		ls_sql = of_GetSPExtractSQL(as_dbms, as_name)
	CASE VIEWEXTRACT
		ls_sql = of_GetViewExtractSQL(as_dbms, as_name)
	CASE TRIGGEREXTRACT
		ls_sql = of_GetTriggerExtractSQL(as_dbms, as_name)
	CASE INDEXEXTRACT
		ls_sql = of_GetIndexExtractSQL(as_dbms, as_name)
	CASE DEFAULTEXTRACT
		ls_sql = of_GetDefaultExtractSQL(as_dbms, as_name)
	CASE PACKAGELIST
		ls_sql = of_GetPackageListSQL(as_dbms)
	CASE PACKAGEBODYLIST
		ls_sql = of_GetPackageBodyListSQL(as_dbms, as_name)
	CASE PACKAGEEXTRACT
		ls_sql = of_GetPackageExtractSQL(as_dbms, as_name)
	CASE PACKAGEBODYEXTRACT
		ls_sql = of_GetPackageBodyExtractSQL(as_dbms, as_name)
		
	CASE FUNCTIONLIST
		ls_sql = of_GetFunctionListSQL(as_dbms)
	CASE FUNCTIONEXTRACT
		ls_sql = of_GetFunctionExtractSQL(as_dbms, as_name)
		
	CASE DATATYPELIST
		ls_sql = of_GetDataTypeListSQL(as_dbms)
	CASE DATATYPEEXTRACT
		ls_sql = of_GetDataTypeExtractSQL(as_dbms, as_name)
	
	CASE RULESLIST
		ls_sql = of_GetRuleListSQL(as_dbms)
	CASE RULESEXTRACT
		ls_sql = of_GetRuleExtractSQL(as_dbms, as_name)
		
	CASE SYNONYMLIST
		ls_sql = of_GetSynonymListSQL(as_dbms)
	CASE SYNONYMEXTRACT
		ls_sql = of_GetSynonymExtractSQL(as_dbms, as_name)
		
	CASE ROLELIST
		ls_sql = of_GetRoleListSQL(as_dbms)
	CASE ROLEEXTRACT
		ls_sql = of_GetRoleExtractSQL(as_dbms, as_name)
		
	CASE MATERIALIZEDVIEWLIST
		ls_sql = of_getmaterializedviewlistsql(as_dbms)
END CHOOSE



IF as_action = TABLEEXTRACT AND as_dbms = 'odb' THEN
	str_tabledef lstr_tabledef[]
	
	of_ODBCTableExtract(ltr, as_name, lstr_tabledef)

	ll_count = UpperBound(lstr_tabledef)
	a_dw.Reset()
	FOR ll_index = 1 TO ll_count
		ll_row = a_dw.InsertRow(0)
		a_dw.SetItem(ll_row, 1, lstr_tabledef[ll_index].table_name)
		a_dw.SetItem(ll_row, 2, lstr_tabledef[ll_index].data_type)
		a_dw.SetItem(ll_row, 3, lstr_tabledef[ll_index].length)
		a_dw.SetItem(ll_row, 4, lstr_tabledef[ll_index].prec)
		a_dw.SetItem(ll_row, 5, lstr_tabledef[ll_index].scale)
		a_dw.SetItem(ll_row, 6, lstr_tabledef[ll_index].nullable)
	NEXT
	
ELSEIF (as_action = TABLELIST OR as_action = TABLEVIEWLIST) AND as_dbms = 'odb' THEN

	of_ODBCTableList(ltr, ls_tables, '')
	
	ll_count = UpperBound(ls_tables)
	a_dw.Reset()
	FOR ll_index = 1 TO ll_count
		ll_row = a_dw.InsertRow(0)
		a_dw.SetItem(ll_row, 1, ls_tables[ll_index])
		a_dw.SetItem(ll_row, 6, 'U')
	NEXT
	
	a_dw.SetSort("#1")
	a_dw.Sort()
ELSEIF as_action = OWNERLIST AND as_dbms = 'odb' THEN

	of_ODBCOwnerList(ltr, ls_tables)
	
	ll_count = UpperBound(ls_tables)
	a_dw.Reset()
	FOR ll_index = 1 TO ll_count
		ll_row = a_dw.InsertRow(0)
		a_dw.SetItem(ll_row, 1, ls_tables[ll_index])
	NEXT
	a_dw.SetSort("#1")
	a_dw.Sort()
ELSEIF as_action = VIEWLIST AND as_dbms = 'odb' THEN

	of_ODBCViewList(ltr, ls_tables, "")
	
	ll_count = UpperBound(ls_tables)
	a_dw.Reset()
	FOR ll_index = 1 TO ll_count
		ll_row = a_dw.InsertRow(0)
		a_dw.SetItem(ll_row, 1, ls_tables[ll_index])
		a_dw.SetItem(ll_row, 6, 'U')
	NEXT
	
	a_dw.SetSort("#1")
	a_dw.Sort()
	
ELSEIF as_action = SPLIST AND as_dbms = 'odb' THEN

	of_ODBCSPList(ltr, ls_tables)
	
	ll_count = UpperBound(ls_tables)
	a_dw.Reset()
	FOR ll_index = 1 TO ll_count
		ll_row = a_dw.InsertRow(0)
		a_dw.SetItem(ll_row, 1, ls_tables[ll_index])
		a_dw.SetItem(ll_row, 6, 'U')
	NEXT
	
	a_dw.SetSort("#1")
	a_dw.Sort()
	
	
ELSEIF as_action = FUNCTIONLIST AND as_dbms = 'odb' THEN

	of_ODBCFunctionList(ltr, ls_tables)
	
	ll_count = UpperBound(ls_tables)
	a_dw.Reset()
	FOR ll_index = 1 TO ll_count
		ll_row = a_dw.InsertRow(0)
		a_dw.SetItem(ll_row, 1, ls_tables[ll_index])
		a_dw.SetItem(ll_row, 6, 'U')
	NEXT
	
	a_dw.SetSort("#1")
	a_dw.Sort()
ELSEIF as_action = TABLEOWNERLIST AND as_dbms = 'odb' THEN

	
	of_ODBCTableList(ltr, ls_tables, as_name)
	
	ll_count = UpperBound(ls_tables)
	a_dw.Reset()
	FOR ll_index = 1 TO ll_count
		ll_row = a_dw.InsertRow(0)
		a_dw.SetItem(ll_row, 1, ls_tables[ll_index])
		a_dw.SetItem(ll_row, 2, 'U')
	NEXT
	
	string ls[]
	ls_tables = ls
	
	of_ODBCViewList(ltr, ls_tables, as_name)
	
	ll_count = UpperBound(ls_tables)

	FOR ll_index = 1 TO ll_count
		ll_row = a_dw.InsertRow(0)
		a_dw.SetItem(ll_row, 1, ls_tables[ll_index])
		a_dw.SetItem(ll_row, 2, 'V')
	NEXT
	
	a_dw.SetSort("#1")
	a_dw.Sort()
ELSE
	a_dw.Modify('DataWindow.Table.Select="' + ls_sql + '"')
END IF


RETURN 1
end function

on n_cst_ddl_sql.create
call super::create
TriggerEvent( this, "constructor" )
end on

on n_cst_ddl_sql.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

