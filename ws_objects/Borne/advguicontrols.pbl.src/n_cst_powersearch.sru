$PBExportHeader$n_cst_powersearch.sru
forward
global type n_cst_powersearch from nonvisualobject
end type
end forward

global type n_cst_powersearch from nonvisualobject
end type
global n_cst_powersearch n_cst_powersearch

type variables
DataStore SourceData
Integer SearchColumn = 1
Double MatchThreshold = .25
Long MaxResultCount = 10000

Private:
n_cst_powersearch_service inv_powersearchservice
DataStore ids_powersearchresults
end variables

forward prototypes
public function datastore search (string ls_search)
public function integer setmatchthreshold (double newthreshold)
public function integer setdatasource (datastore lds_source, integer li_searchcolumn)
public function integer setmaxresultcount (long al_maxcount)
end prototypes

public function datastore search (string ls_search);Long ll_index, ll_count, ll_row
Double ld_dice

IF NOT Isvalid(ids_powersearchresults) THEN
	ids_powersearchresults = CREATE DataStore
	ids_powersearchresults.DataObject = "d_powersearchresults"
END IF

ids_powersearchresults.Reset()

IF NOT IsValid(SourceData) THEN RETURN ids_powersearchresults

ll_count = SourceData.RowCount()

FOR ll_index = 1 TO ll_count 
	ld_dice = inv_powersearchservice.DiceCoefficient(ls_search, SourceData.GetItemString(ll_index, SearchColumn))
	
	IF ld_dice >= MatchThreshold THEN
		ll_row = ids_powersearchresults.InsertRow(0)
	
		ids_powersearchresults.SetItem(ll_row, 1, ll_index)
		ids_powersearchresults.SetItem(ll_row, 2, ld_dice)
		ids_powersearchresults.SetItem(ll_row, 3, SourceData.GetItemString(ll_index, SearchColumn))
	END IF
	
	IF MaxResultCount <> -1 AND ll_row >= MaxResultCount THEN
		EXIT
	END IF
	
NEXT

ids_powersearchresults.SetSort("#2 D, #3")
ids_powersearchresults.Sort()

RETURN ids_powersearchresults
end function

public function integer setmatchthreshold (double newthreshold);MatchThreshold = newthreshold

RETURN 1
end function

public function integer setdatasource (datastore lds_source, integer li_searchcolumn);SourceData = lds_source
SearchColumn = li_searchcolumn

RETURN 0
end function

public function integer setmaxresultcount (long al_maxcount);MaxResultCount = al_maxcount
RETURN 1
end function

on n_cst_powersearch.create
call super::create
TriggerEvent( this, "constructor" )
end on

on n_cst_powersearch.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

event destructor;IF IsValid(ids_powersearchresults) THEN DESTROY ids_powersearchresults
end event

