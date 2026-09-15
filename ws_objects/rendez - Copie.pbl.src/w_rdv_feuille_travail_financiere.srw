$PBExportHeader$w_rdv_feuille_travail_financiere.srw
forward
global type w_rdv_feuille_travail_financiere from w_rdv_planning
end type
type cbx_masquer_type_rdv from checkbox within w_rdv_feuille_travail_financiere
end type
type cbx_filtrer_somme_due from checkbox within w_rdv_feuille_travail_financiere
end type
end forward

global type w_rdv_feuille_travail_financiere from w_rdv_planning
string title = "Feuille de Travail Financière"
cbx_masquer_type_rdv cbx_masquer_type_rdv
cbx_filtrer_somme_due cbx_filtrer_somme_due
end type
global w_rdv_feuille_travail_financiere w_rdv_feuille_travail_financiere

forward prototypes
public subroutine prepa ()
end prototypes

public subroutine prepa ();string pra_min,pra_max
date var_date, var_date_ref

integer cpt,f_min,f_max
long lig, tot

decimal {2} var_montant, var_montant_tp
double var_code_local



	
	
	prepa_faite = true
	if rb_tous.checked then
		pra_min="      "
		pra_max="ZZZZZZ"
	else
		pra_min=dw_prati.getitemstring(dw_prati.getrow(),"code")
		pra_max=dw_prati.getitemstring(dw_prati.getrow(),"code")
	end if

	var_date_ref = date(em_date.text)
	f_min = integer(em_faut_min.text)
	f_max = integer(em_faut_max.text)

	open(w_patience)
	
	if cbx_masquer_type_rdv.checked then
		dw_liste.Modify("type_rdv_nom.visible = 1")
	else
		dw_liste.Modify("type_rdv_nom.visible = 0")
	end if
	
	
	string v_souligner_adultes
	v_souligner_adultes = profilestring(dir_ini+"orthokis.ini","admini","souligner_adultes","N")

	// Pas de resize des hauteurs de lignes
	//dw_liste.object.datawindow.Detail.Height.AutoSize = "No"
	
	dw_liste.retrieve(pra_min,pra_max,var_date_ref,f_min,f_max, v_souligner_adultes)

	// Mise à jour des éléments financier ...
	tot = dw_liste.rowcount()

	// du bas vers le haut car on va éliminer si besoin les non dus
	for lig = tot to 1 step -1
		
		var_code_local = dw_liste.GetItemNumber(lig, "code")
		
		
		// Sommes due ... on masque les trop payés
		var_montant = due (var_code_local, var_date_ref)
		var_montant_tp = due_tp (var_code_local, var_date_ref)

		if not cbx_filtrer_somme_due.checked or (cbx_filtrer_somme_due.checked and (var_montant_tp > 0 or var_montant >0) ) then
			
			// Pas de filtre 
			if var_montant < 0 then 
				var_montant = 0
			end if
			dw_liste.Setitem(lig, "due", var_montant)
			
			var_montant_tp = due_tp (var_code_local, var_date_ref)
			if var_montant_tp < 0 then 
				var_montant_tp = 0
			end if
			dw_liste.Setitem(lig, "due_tp", string(var_montant_tp, "0.00"))
			
			// Prochains règlements ...
			proc_reglt (var_code_local, var_date, var_montant, "P" )
			dw_liste.Setitem(lig, "date_proc_reglt", var_date)
			dw_liste.Setitem(lig, "mont_proc_reglt", var_montant)
			proc_reglt (var_code_local, var_date, var_montant, "T" )
			dw_liste.Setitem(lig, "date_proc_reglt_tp", string(var_date, "dd/mm/yyyy"))
			dw_liste.Setitem(lig, "mont_proc_reglt_tp", string(var_montant, "0.00"))
			
		else
			// filtre => on élimine
			dw_liste.deleterow(lig)
		end if
		
		
	next
	// Resize des hauteurs de lignes
	//dw_liste.object.datawindow.Detail.Height.AutoSize = "Yes"
	
	close(w_patience)

	cbx_filtre.visible = true
	//em_nb.text = string(tot)+" Rendez-vous"
	//em_nb.visible = true


end subroutine

on w_rdv_feuille_travail_financiere.create
int iCurrent
call super::create
this.cbx_masquer_type_rdv=create cbx_masquer_type_rdv
this.cbx_filtrer_somme_due=create cbx_filtrer_somme_due
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cbx_masquer_type_rdv
this.Control[iCurrent+2]=this.cbx_filtrer_somme_due
end on

on w_rdv_feuille_travail_financiere.destroy
call super::destroy
destroy(this.cbx_masquer_type_rdv)
destroy(this.cbx_filtrer_somme_due)
end on

event open;call super::open;


// Options d'impressions
if profilestring(dir_ini+inifile_orthokis,"FEUILLE_FINANCIERE","Type_rdv","N") = "O" then
	cbx_masquer_type_rdv.checked = true
else
	cbx_masquer_type_rdv.checked = false
end if

if profilestring(dir_ini+inifile_orthokis,"FEUILLE_FINANCIERE","Filtrer_somme_due","N") = "O" then
	cbx_filtrer_somme_due.checked = true
else
	cbx_filtrer_somme_due.checked = false
end if



end event

event close;call super::close;

// Options d'impressions
if cbx_masquer_type_rdv.checked  then
	Setprofilestring(dir_ini+inifile_orthokis,"FEUILLE_FINANCIERE","Type_rdv","O") 
else
	Setprofilestring(dir_ini+inifile_orthokis,"FEUILLE_FINANCIERE","Type_rdv","N") 
end if

if cbx_filtrer_somme_due.checked  then
	Setprofilestring(dir_ini+inifile_orthokis,"FEUILLE_FINANCIERE","Filtrer_somme_due","O") 
else
	Setprofilestring(dir_ini+inifile_orthokis,"FEUILLE_FINANCIERE","Filtrer_somme_due","N") 
end if

end event

type p_fond from w_rdv_planning`p_fond within w_rdv_feuille_travail_financiere
end type

type em_date from w_rdv_planning`em_date within w_rdv_feuille_travail_financiere
end type

type cb_fermer from w_rdv_planning`cb_fermer within w_rdv_feuille_travail_financiere
end type

type cb_ecran from w_rdv_planning`cb_ecran within w_rdv_feuille_travail_financiere
end type

type cb_imprimer from w_rdv_planning`cb_imprimer within w_rdv_feuille_travail_financiere
end type

type cb_autre from w_rdv_planning`cb_autre within w_rdv_feuille_travail_financiere
end type

type st_2 from w_rdv_planning`st_2 within w_rdv_feuille_travail_financiere
end type

type st_1 from w_rdv_planning`st_1 within w_rdv_feuille_travail_financiere
end type

type em_faut_max from w_rdv_planning`em_faut_max within w_rdv_feuille_travail_financiere
end type

type em_faut_min from w_rdv_planning`em_faut_min within w_rdv_feuille_travail_financiere
end type

type em_nb from w_rdv_planning`em_nb within w_rdv_feuille_travail_financiere
end type

type dw_prati from w_rdv_planning`dw_prati within w_rdv_feuille_travail_financiere
end type

type rb_un from w_rdv_planning`rb_un within w_rdv_feuille_travail_financiere
end type

type rb_tous from w_rdv_planning`rb_tous within w_rdv_feuille_travail_financiere
end type

type st_min from w_rdv_planning`st_min within w_rdv_feuille_travail_financiere
string tag = ""
integer x = 2185
integer width = 192
integer height = 80
boolean focusrectangle = false
end type

type gb_1 from w_rdv_planning`gb_1 within w_rdv_feuille_travail_financiere
end type

type uo_1 from w_rdv_planning`uo_1 within w_rdv_feuille_travail_financiere
end type

type pb_prec from w_rdv_planning`pb_prec within w_rdv_feuille_travail_financiere
end type

type pb_suiv from w_rdv_planning`pb_suiv within w_rdv_feuille_travail_financiere
end type

type cbx_filtre from w_rdv_planning`cbx_filtre within w_rdv_feuille_travail_financiere
end type

type em_date2 from w_rdv_planning`em_date2 within w_rdv_feuille_travail_financiere
boolean visible = false
end type

type st_au from w_rdv_planning`st_au within w_rdv_feuille_travail_financiere
boolean visible = false
end type

type dw_liste from w_rdv_planning`dw_liste within w_rdv_feuille_travail_financiere
integer width = 3575
string dataobject = "dw_rdv_feuille_travail_financiere"
end type

type cbx_masquer_type_rdv from checkbox within w_rdv_feuille_travail_financiere
integer x = 251
integer y = 616
integer width = 1070
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 553648127
string text = "Afficher le type de rendez-vous"
borderstyle borderstyle = styleraised!
end type

type cbx_filtrer_somme_due from checkbox within w_rdv_feuille_travail_financiere
integer x = 251
integer y = 772
integer width = 1376
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 553648127
string text = "N~'afficher que les patients devant de l~'argent"
borderstyle borderstyle = styleraised!
end type

