$PBExportHeader$n_changesql.sru
forward
global type n_changesql from nonvisualobject
end type
end forward

global type n_changesql from nonvisualobject autoinstantiate
end type

type variables
Boolean ib_oracledba

CONSTANT Long DATABASESYBASE = 1
CONSTANT Long DATABASESQLSERVER = 2

CONSTANT Long TABLELISTSYBASE = 3
CONSTANT Long TABLELISTSQLSERVER = 4
CONSTANT Long TABLELISTORACLE = 100
CONSTANT Long TABLEEXTRACTSYBASE = 5
CONSTANT Long TABLEEXTRACTSQLSERVER = 6
CONSTANT Long TABLEEXTRACTORACLE = 101
CONSTANT Long TABLELISTSQLANYWHERE = 25
CONSTANT Long TABLEEXTRACTSQLANYWHERE = 26

CONSTANT Long SPLISTSYBASE = 7
CONSTANT Long SPLISTSQLSERVER = 8
CONSTANT Long SPLISTORACLE = 102
CONSTANT Long SPEXTRACTSYBASE = 9
CONSTANT Long SPEXTRACTSQLSERVER = 10
CONSTANT Long SPEXTRACTORACLE = 103
CONSTANT Long SPLISTSQLANYWHERE = 27
CONSTANT Long SPEXTRACTSQLANYWHERE = 28

CONSTANT Long TRIGGERLISTSYBASE = 11
CONSTANT Long TRIGGERLISTSQLSERVER = 12
CONSTANT Long TRIGGERLISTORACLE = 104
CONSTANT Long TRIGGEREXTRACTSYBASE = 13
CONSTANT Long TRIGGEREXTRACTSQLSERVER = 14
CONSTANT Long TRIGGEREXTRACTORACLE = 105
CONSTANT Long TRIGGERLISTSQLANYWHERE = 29
CONSTANT Long TRIGGEREXTRACTSQLANYWHERE = 30

CONSTANT Long VIEWLISTSYBASE = 15
CONSTANT Long VIEWLISTSQLSERVER = 16
CONSTANT Long VIEWLISTORACLE = 106
CONSTANT Long VIEWEXTRACTSYBASE = 17
CONSTANT Long VIEWEXTRACTSQLSERVER = 18
CONSTANT Long VIEWEXTRACTORACLE = 107
CONSTANT Long VIEWLISTSQLANYWHERE = 31
CONSTANT Long VIEWEXTRACTSQLANYWHERE = 32

CONSTANT Long INDEXLISTSYBASE = 19
CONSTANT Long INDEXLISTSQLSERVER = 20
CONSTANT Long INDEXLISTORACLE = 108
CONSTANT Long INDEXEXTRACTSYBASE = 21
CONSTANT Long INDEXEXTRACTSQLSERVER = 22
CONSTANT Long INDEXEXTRACTORACLE = 109
CONSTANT Long INDEXLISTSQLANYWHERE = 33
CONSTANT Long INDEXEXTRACTSQLANYWHERE = 34

CONSTANT Long TABLEVIEWLISTSYBASE = 23
CONSTANT Long TABLEVIEWLISTSQLSERVER = 24
CONSTANT Long TABLEVIEWLISTSQLANYWHERE = 35
CONSTANT Long TABLEVIEWLISTORACLE = 110

CONSTANT Long OWNERLISTSQLSYBASE = 36
CONSTANT Long OWNERLISTSQLSQLSERVER = 37
CONSTANT Long OWNERLISTSQLSQLANYWHERE = 38
CONSTANT Long OWNERLISTSQLORACLE = 111

CONSTANT Long TABLEOWNERLISTSYBASE = 39
CONSTANT Long TABLEOWNERLISTSQLSERVER = 40
CONSTANT Long TABLEOWNERLISTSQLANYWHERE = 41
CONSTANT Long TABLEOWNERLISTORACLE = 112

CONSTANT Long PACKAGELISTORACLE = 113
CONSTANT Long PACKAGEBODYLISTORACLE = 114
CONSTANT Long PACKAGEEXTRACTORACLE = 115
CONSTANT Long PACKAGEBODYEXTRACTORACLE = 116

CONSTANT Long FUNCTIONLISTORACLE = 117
CONSTANT Long FUNCTIONEXTRACTORACLE = 118

CONSTANT Long FUNCTIONLISTSYBASE = 119
CONSTANT Long FUNCTIONLISTSQLSERVER = 120
CONSTANT Long FUNCTIONLISTSQLANYWHERE = 121

CONSTANT Long FUNCTIONEXTRACTSYBASE = 122
CONSTANT Long FUNCTIONEXTRACTSQLSERVER = 123
CONSTANT Long FUNCTIONEXTRACTSQLANYWHERE = 124

CONSTANT Long DATATYPELISTSYBASE = 125
CONSTANT Long DATATYPELISTSQLSERVER = 126
CONSTANT Long DATATYPELISTSQLANYWHERE = 127

CONSTANT Long DATATYPEEXTRACTSYBASE = 128

CONSTANT Long RULELISTSYBASE = 129
CONSTANT Long RULELISTSQLSERVER = 130
CONSTANT Long RULEEXTRACTSQLSERVER = 131
CONSTANT Long RULEEXTRACTSYBASE = 132

CONSTANT Long SYNONYMLISTSQLSERVER = 133
CONSTANT Long SYNONYMEXTRACTSQLSERVER = 134

CONSTANT Long DEFAULTLISTSYBASE = 135
CONSTANT Long DEFAULTLISTSQLSERVER = 136
CONSTANT Long DEFAULTEXTRACTSQLSERVER = 137
CONSTANT Long DEFAULTEXTRACTSYBASE = 138

CONSTANT Long ROLELISTSYBASE = 139
CONSTANT Long ROLELISTSQLSERVER = 140
CONSTANT Long ROLEEXTRACTSQLSERVER = 141
CONSTANT Long ROLEEXTRACTSYBASE = 142

CONSTANT Long MATERIALIZEDVIEWLISTORACLE = 143
end variables

forward prototypes
public function integer of_loadsql (integer ai_sql, datawindow adw)
public function string of_getsql (long al_sql)
public function integer of_loadsql (integer ai_sql, datastore ads)
end prototypes

public function integer of_loadsql (integer ai_sql, datawindow adw);
adw.SetSQLSelect(of_GetSQL(ai_sql))

RETURN 1
end function

public function string of_getsql (long al_sql);String ls_data

CHOOSE CASE al_sql
	CASE DATABASESYBASE
		ls_data = "select name from master.dbo.sysdatabases order by name"
	CASE DATABASESQLSERVER
		ls_data = "select name from master.dbo.sysdatabases order by name"

	CASE TABLELISTSYBASE
		ls_data = "select b.name + '.' + a.name, a.id, a.crdate, '', 0, a.type from sysobjects a, sysusers b where a.type in ('U', 'S') and a.uid = b.uid order by a.name"
	CASE TABLELISTSQLSERVER
		ls_data = "IF OBJECT_ID('sys.schemas') IS NULL  select B.name + '.' + A.name, A.id, A.crdate, '', 0, A.type from sysobjects A, sysusers B where A.type in ('U', 'S') and B.uid = OBJECTPROPERTY ( A.id , 'ownerid' )  order by B.name + '.' + A.name ELSE select B.name + '.' + A.name, A.id, A.crdate, '', 0, A.type from sysobjects A, sys.schemas B where A.type in ('U', 'S') and B.schema_id = A.uid  order by B.name + '.' + A.name"
	CASE TABLELISTSQLANYWHERE
		ls_data = "select b.name + '.' + a.name, a.id, a.crdate, '', CASE c.table_type WHEN 'GBL TEMP' THEN 1 ELSE 0 END, CASE b.name WHEN 'dbo' THEN 'S' ELSE a.type END from sysobjects a, sysusers b, systable c, dbo.sysusers d where a.type in ('U', 'S') and a.uid = b.uid and c.creator = d.suid AND b.Name = d.name AND c.table_name = a.name order by b.name, a.name "
	CASE TABLELISTORACLE
		ls_data = "select OBJECT_NAME, OBJECT_ID, CREATED, '', CASE STATUS WHEN 'VALID' THEN 1 ELSE 0 END, TEMPORARY from all_objects where owner = '%1' AND object_type = 'TABLE' AND OBJECT_NAME NOT LIKE 'BIN$%' ORDER BY OBJECT_NAME"
		
	CASE TABLEEXTRACTSYBASE
		ls_data = "select A.name, C.name as datatype, CASE Upper(C.name) WHEN 'UNICHAR' THEN A.length / @@unicharsize WHEN 'UNIVARCHAR' THEN A.length / @@unicharsize WHEN 'NCHAR' THEN A.length / @@ncharsize WHEN 'NVARCHAR' THEN A.length / @@ncharsize ELSE A.length END as length, A.prec, A.scale, CONVERT(bit,(A.status & 0x08)) FROM syscolumns A, systypes C WHERE A.id = IsNull((select id from sysobjects a, sysusers b where (Lower(a.name) = Lower('%1') OR Lower(b.name) + '.' + Lower(a.name) = Lower('%1')) and a.uid = b.uid and a.type in ('U', 'S', 'V') group by a.name having min(a.uid) = a.uid), Object_Id('%1')) AND A.usertype = C.usertype ORDER BY A.colid"
	CASE TABLEEXTRACTSQLSERVER
		ls_data = "IF OBJECT_ID('sys.schemas') IS NULL select A.name, C.name as datatype, CASE Upper(C.name) WHEN 'NCHAR' THEN A.length / 2 WHEN 'NVARCHAR' THEN A.length / 2 ELSE A.length END as length, A.prec, A.scale, CONVERT(bit,(A.status & 0x08)) FROM syscolumns A, sysobjects B, systypes C  WHERE A.id = B.id  AND A.xusertype = C.xusertype AND B.id = IsNull(Object_Id('%1'), (select TOP 1 a.id from sysobjects a, sysusers b where (Lower(a.name) = Lower('%1') OR Lower(b.name) + '.' + Lower(a.name) = Lower('%1')) and a.uid = b.uid order by a.uid)) ORDER BY A.colorder ELSE select A.name, C.name as datatype, CASE Upper(C.name) WHEN 'NCHAR' THEN A.length / 2 WHEN 'NVARCHAR' THEN A.length / 2 ELSE A.length END as length, A.prec, A.scale, CONVERT(bit,(A.status & 0x08)) FROM syscolumns A, sysobjects B, systypes C  WHERE A.id = B.id AND A.xusertype = C.xusertype AND B.id = IsNull(Object_Id('%1'), (select TOP 1 a.id from sysobjects a, sys.schemas b where (Lower(a.name) = Lower('%1') OR Lower(b.name) + '.' + Lower(a.name) = Lower('%1')) and a.uid = b.schema_id order by a.uid)) ORDER BY A.colorder"
	CASE TABLEEXTRACTSQLANYWHERE
		ls_data = "select c.column_name, d.domain_name, c.width, c.width, c.scale, case c.nulls when 'Y' then 1 else 0 end as nulls from sys.syscolumn c join sys.sysdomain d on c.domain_id=d.domain_id join sys.systable t on c.table_id=t.table_id where t.table_id = (select A.table_id from sys.SYSTABLE A, dbo.sysusers B where (upper(B.Name) + '.' + upper(A.table_name) = upper('%1') OR upper(A.table_name) = upper('%1')) and A.creator = B.suid) ORDER BY C.column_id"
	CASE TABLEEXTRACTORACLE
		ls_data = "SELECT COLUMN_NAME, DATA_TYPE, CHAR_LENGTH, DATA_PRECISION, DATA_SCALE, CASE NULLABLE WHEN 'Y' THEN 1 ELSE 0 END, COLUMN_ID FROM ALL_TAB_COLS WHERE Upper(TABLE_NAME) = Upper('%1') AND OWNER = '%2' ORDER BY COLUMN_ID"
		
	CASE SPLISTSYBASE
		ls_data = "Database SQL\SPListSybase.sql"
	CASE SPLISTSQLSERVER
		ls_data = "Database SQL\SPListSQLServer.sql"
	CASE SPLISTSQLANYWHERE
		ls_data = "Database SQL\SPListSQLAnywhere.sql"
	CASE SPLISTORACLE
		ls_data = "Database SQL\SPListORACLE.sql"

	CASE VIEWLISTSYBASE
		ls_data = "Database SQL\ViewListSybase.sql"
	CASE VIEWLISTSQLSERVER
		ls_data = "Database SQL\ViewListSQLServer.sql"
	CASE VIEWLISTSQLANYWHERE
		ls_data = "Database SQL\ViewListSQLAnywhere.sql"
	CASE VIEWLISTORACLE
		ls_data = "Database SQL\ViewListORACLE.sql"
		
	CASE VIEWEXTRACTSYBASE
		ls_data = "Database SQL\ViewExtractSybase.sql"
	CASE VIEWEXTRACTSQLSERVER
		ls_data = "Database SQL\ViewExtractSQLServer.sql"
	CASE VIEWEXTRACTSQLANYWHERE
		ls_data = "Database SQL\ViewExtractSQLAnywhere.sql"
	CASE VIEWEXTRACTORACLE
		ls_data = "Database SQL\ViewExtractORACLE.sql"
		
	CASE TABLEVIEWLISTSYBASE
		ls_data = "Database SQL\TableViewListSybase.sql"
	CASE TABLEVIEWLISTSQLSERVER
		ls_data = "Database SQL\TableViewListSQLServer.sql"
	CASE TABLEVIEWLISTSQLANYWHERE
		ls_data = "Database SQL\TableViewListSQLAnywhere.sql"
	CASE TABLEVIEWLISTORACLE
		ls_data = "Database SQL\TableViewListORACLE.sql"
		
	CASE OWNERLISTSQLSYBASE
		ls_data = "select name from sysusers where uid < 16000"
	CASE OWNERLISTSQLSQLSERVER
		ls_data = "IF OBJECT_ID('sys.schemas') IS NULL  select name from sysusers where uid < 16000 ELSE select name from sys.schemas where schema_id < 16000"
	CASE OWNERLISTSQLSQLANYWHERE
		ls_data = "select name from sysusers"
	CASE OWNERLISTSQLORACLE
		ls_data = "SELECT USERNAME, 0, sysdate, '', 0, '' FROM ALL_USERS ORDER BY USERNAME"
		
	CASE TABLEOWNERLISTSYBASE
		ls_data = "Database SQL\TableOwnerListSybase.sql"
	CASE TABLEOWNERLISTSQLSERVER
		ls_data = "Database SQL\TableOwnerListSQLServer.sql"
	CASE TABLEOWNERLISTSQLANYWHERE
		ls_data = "Database SQL\TableOwnerListSQLAnywhere.sql"
	CASE TABLEOWNERLISTORACLE
		ls_data = "Database SQL\TableOwnerListORACLE.sql"
		
	CASE PACKAGELISTORACLE
		ls_data = "Database SQL\PackageListORACLE.sql"
	
	CASE FUNCTIONLISTORACLE
		ls_data = "Database SQL\FunctionListORACLE.sql"
	CASE FUNCTIONLISTSYBASE
		ls_data = "Database SQL\FunctionListSybase.sql"
	CASE FUNCTIONLISTSQLSERVER
		ls_data = "Database SQL\FunctionListSQLServer.sql"
	CASE FUNCTIONLISTSQLANYWHERE
		ls_data = "Database SQL\FunctionListSQLAnywhere.sql"
	
	CASE MATERIALIZEDVIEWLISTORACLE
		ls_data = "Database SQL\MaterializedViewListOracle.sql"	
END CHOOSE

RETURN ls_data

end function

public function integer of_loadsql (integer ai_sql, datastore ads);
ads.SetSQLSelect(of_GetSQL(ai_sql))

RETURN 1
end function

on n_changesql.create
call super::create
TriggerEvent( this, "constructor" )
end on

on n_changesql.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

