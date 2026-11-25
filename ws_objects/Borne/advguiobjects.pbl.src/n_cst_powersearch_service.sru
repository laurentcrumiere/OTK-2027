$PBExportHeader$n_cst_powersearch_service.sru
forward
global type n_cst_powersearch_service from nonvisualobject
end type
type inv_pbusexternal from n_cst_pbusexternal within n_cst_powersearch_service
end type
end forward

global type n_cst_powersearch_service from nonvisualobject autoinstantiate
inv_pbusexternal inv_pbusexternal
end type

type prototypes

end prototypes

type variables

end variables

forward prototypes
public function double dicecoefficient (string input, string comparedto)
public function double dicecoefficient (string input, string comparedto)
public function integer intersectcount (string ls_one[], string ls_two[])
public function double dicecoefficientngrams (string ngrams[], string comparetongrams[])
public function integer tobigrams (string input, ref string bigrams[])
end prototypes

public function double dicecoefficient (string input, string comparedto);String ngrams[], compareToNgrams[]
Double ld_return

input = Lower(input)
comparedto = Lower(comparedto)

ld_return = inv_pbusexternal.PBUSDiceCoefficient(input, comparedto)

IF Pos(comparedTo, input) > 0 THEN
	ld_return += 1
END IF

RETURN ld_return
end function

public function integer intersectcount (string ls_one[], string ls_two[]);Int ll_count, ll_arrayonecount, ll_arraytwocount, ll_indexone, ll_indextwo, ll_indexunique
String ls_unique[]
Boolean lb_found

ll_arrayonecount = UpperBound(ls_one)
ll_arraytwocount = UpperBound(ls_two)

FOR ll_indextwo = 1 TO ll_arraytwocount
	lb_found = FALSE
	
	FOR ll_indexunique = 1 TO UpperBound(ls_unique)
		IF ls_two[ll_indextwo] = ls_unique[ll_indexunique] THEN
			lb_found = TRUE
			EXIT
		END IF
	NEXT
	
	IF NOT lb_found THEN
		ls_unique[ll_indexunique] = ls_two[ll_indextwo]
	END IF
NEXT

ll_arraytwocount = UpperBound(ls_unique)

FOR ll_indexone = 1 TO ll_arrayonecount
	
	FOR ll_indextwo = 1 TO ll_arraytwocount		
		
		IF ls_unique[ll_indextwo] = ls_one[ll_indexone] THEN
			ll_count += 1
			ls_unique[ll_indextwo] = ""
		END IF
	
	NEXT
	
NEXT


RETURN ll_count
end function

public function double dicecoefficientngrams (string ngrams[], string comparetongrams[]);INT matches
Double totalBigrams

matches = IntersectCount(nGrams, compareToNGrams)

IF matches = 0 THEN RETURN 0

totalBigrams = UpperBound(nGrams) + UpperBound(compareToNGrams)

RETURN (2 * matches) / totalBigrams;
end function

public function integer tobigrams (string input, ref string bigrams[]);Long ll_itemsCount, ll_index
String ls_ngrams[]

input = "%" + input + "#"

ll_itemsCount = Len(input) - 1

FOR ll_index = 1 TO ll_itemsCount
	 ls_ngrams[ll_index] = Mid(input, ll_index, 2)
NEXT

bigrams = ls_ngrams
				
RETURN 1
end function

on n_cst_powersearch_service.create
call super::create
this.inv_pbusexternal=create inv_pbusexternal
TriggerEvent( this, "constructor" )
end on

on n_cst_powersearch_service.destroy
TriggerEvent( this, "destructor" )
call super::destroy
destroy(this.inv_pbusexternal)
end on

type inv_pbusexternal from n_cst_pbusexternal within n_cst_powersearch_service descriptor "pb_nvo" = "true" 
end type

on inv_pbusexternal.create
call super::create
end on

on inv_pbusexternal.destroy
call super::destroy
end on

