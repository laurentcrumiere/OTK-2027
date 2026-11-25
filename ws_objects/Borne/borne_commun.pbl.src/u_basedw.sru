$PBExportHeader$u_basedw.sru
forward
global type u_basedw from datawindow
end type
end forward

global type u_basedw from datawindow
integer width = 494
integer height = 360
integer taborder = 1
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = styleraised!
end type
global u_basedw u_basedw

type variables
Private:
   string is_sort
end variables

forward prototypes
public subroutine uf_colsort ()
end prototypes

public subroutine uf_colsort ();//if this.getClickedRow ( ) = 0 then

	string	ls_col, ls_sort
	integer	li_pos
	
	SetPointer(HourGlass!)
	
	/*******************************************************/
	/* Donne le nom de l'objet cliqué sous la forme nom + tabultaion + N° de ligne     */
	/*******************************************************/
	ls_col = this.GetObjectAtPointer()
	
	
	/*******************************************************/
	/* On isole ce qui est avant la tabulation						 */
	/*******************************************************/
	li_pos = Pos(ls_col, "~t")
	
	/*******************************************************/
	/* Check last 2 characters 									 */
	/*******************************************************/
	ls_col = Left(ls_col, li_pos - 1)
	
	/*******************************************************/
	/* if not a column heading, then return 					 */
	/*******************************************************/
	if NOT Lower(Right(ls_col, 2)) = "_t" then Return
	
	//*******************************************************
	// On part du principe que l'entête de la colonne se nomme comme la colonne + "_t".	 */
	// On enlève donc les 2 derniers caractère pour avoir le nom de la colonne
	/*******************************************************/
	ls_col  = Left(ls_col, Len(ls_col) - 2)
	ls_sort = ls_col + " A"
	
	string nom_colonne, libelle_colonne,modif
	string sens
	
	// On enlève le sens du tri précédent sur l'intitulé de la colonne
	if not isnull(is_sort) and is_sort <> "" then
		// On isole la colonne de tri précédent
		nom_colonne = left(is_sort,len(is_sort) - 2)+"_t"
		// on prend le libellé de la colonne
		libelle_colonne = this.describe(nom_colonne+".text")
		
		if right(libelle_colonne,2) = ' ^' or right(libelle_colonne,2) = ' v' then
			libelle_colonne = left(libelle_colonne,len(libelle_colonne) - 2)
			// Correction du libellé
			modif = nom_colonne+".text = '"+libelle_colonne+"'"
			// Modification effective
			this.modify(modif)
		end if
	end if	
	
	// Si le tri demandé et le même que le tri d'avant, on inverse le sens du tri
	if ls_sort = is_sort then
		ls_sort = ls_col + " D"
		sens = ' v'
	else
		ls_sort = ls_col + " A"
		sens = ' ^'
	end if
	
	is_sort = ls_sort
	
	this.SetSort(is_sort)
	this.Sort()
	this.groupcalc()
	
	// On mey le sens du tri courant sur l'intitulé de la colonne
	
	// On isole la colonne de tri 
	nom_colonne = left(is_sort,len(is_sort) - 2)+"_t"
	
	// on prend le libellé de la colonne
	libelle_colonne = this.describe(nom_colonne+".text")
		
	// Correction du libellé
	modif = nom_colonne+".text = '"+libelle_colonne+sens+"'"
	
	// Modification effective
	this.modify(modif)
	
//end if

end subroutine

on u_basedw.create
end on

on u_basedw.destroy
end on

event rbuttondown;If row > 0 Then
	This.SelectRow(0,False)
	This.SelectRow(row,True)
	This.setrow(row)
End If
end event

event dberror;db_erreur(u_basedw,sqldbcode,sqlerrtext)
return 1
end event

event clicked;If row > 0 Then
	// On envoie cette fonction pour les libellés de colonne qui ne sonts pas mis en entête
	This.uf_ColSort()
	
	This.SelectRow(0,False)
	This.SelectRow(row,True)
	This.setrow(row)
else
	This.uf_ColSort()
End If

end event

