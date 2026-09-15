$PBExportHeader$w_soins_suivis_fiche.srw
$PBExportComments$Héritée de param
forward
global type w_soins_suivis_fiche from w_param
end type
type dw_edition from datawindow within w_soins_suivis_fiche
end type
type cb_imprimer from uo_picturebutton_390x120 within w_soins_suivis_fiche
end type
end forward

global type w_soins_suivis_fiche from w_param
integer width = 2839
integer height = 1860
string title = "Soins Suivis en Statistique"
dw_edition dw_edition
cb_imprimer cb_imprimer
end type
global w_soins_suivis_fiche w_soins_suivis_fiche

type variables
double max

double code_soins_suivis_local
end variables

on w_soins_suivis_fiche.create
int iCurrent
call super::create
this.dw_edition=create dw_edition
this.cb_imprimer=create cb_imprimer
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_edition
this.Control[iCurrent+2]=this.cb_imprimer
end on

on w_soins_suivis_fiche.destroy
call super::destroy
destroy(this.dw_edition)
destroy(this.cb_imprimer)
end on

event open;

// Récupération du code soins suivis modifiés
code_soins_suivis_local = message.doubleparm

string v_nom 
select nom into :v_nom from soins_suivis where code = :code_soins_suivis_local ;
this.title = "Soin Suivi en Statistique : " + v_nom

uo_1.taille(this)
dw_liste.settransobject(SQLCA)
dw_liste.retrieve(code_soins_suivis_local)

if enregistrement_automatique then
	cb_annuler.visible = false
	cb_enregistrer.visible = false
end if

placer_image_fond(this, p_fond, image_fond_fenetre)

dw_edition.settransobject(SQLCA)
	

// Verrouillage selon les droits d'accès
//-------------------------------------------

choose case droits_acces[31]
	Case 'C'
		// Consultation 
		cb_ajouter.enabled = false
		cb_supprimer.enabled = false
		cb_enregistrer.enabled = false
	Case 'M'
		// Modification 
//		cb_ajouter.enabled = false
		cb_supprimer.enabled = false
end choose


centrer(this)

end event

type p_fond from w_param`p_fond within w_soins_suivis_fiche
end type

type pb_raz_ordre_trie from w_param`pb_raz_ordre_trie within w_soins_suivis_fiche
integer y = 1112
end type

type cb_annuler from w_param`cb_annuler within w_soins_suivis_fiche
integer x = 1157
integer y = 1528
end type

event cb_annuler::clicked;

rollback ;
dw_liste.retrieve(code_soins_suivis_local) ;
end event

type cb_enregistrer from w_param`cb_enregistrer within w_soins_suivis_fiche
integer x = 1687
integer y = 1528
end type

type cb_fermer from w_param`cb_fermer within w_soins_suivis_fiche
integer x = 2217
integer y = 1528
end type

event cb_fermer::clicked;dw_liste.accepttext()

boolean faut_fermer = false

if enregistrement_automatique and cb_enregistrer.enabled then
	 faut_fermer = true
else
	if (dw_liste.modifiedcount() > 0 or dw_liste.deletedcount()>0) and cb_enregistrer.enabled Then
		If MessageBox("ATTENTION","Vous avez fait des modifications sur la table !~n~nVoulez-vous vraiment fermer cette fenêtre sans enregistrer (et ainsi perdre les modifications) ?",Question!,YesNo!, 2) = 1 Then
			 faut_fermer = true
		end if
	else
		 faut_fermer = true
	end if
end if

if faut_fermer then
	
	if verification_ordre_par_defaut then 
		long v_cpt
		string cde
		
		DECLARE my_cursor DYNAMIC CURSOR FOR SQLSA ;
		cde = "select count(*) from " + v_nom_table_a_verifier + " where ordre_trie = (select min(ordre_trie) from " + v_nom_table_a_verifier +" where actif = 1) ;"
		PREPARE SQLSA FROM :cde ;
		OPEN DYNAMIC my_cursor  ;
		FETCH my_cursor INTO :v_cpt ;
		CLOSE my_cursor ;
				
		if v_cpt <> 1 then
			Messagebox("ATTENTION","Cette table nécessite d'avoir un élément 'Par défaut', avec une valeur d'ordre de tri unique.~n~nMerci de corriger !")
		else
			
			close(parent)
		end if
	else

		close(parent)
	end if
end if


end event

type cb_supprimer from w_param`cb_supprimer within w_soins_suivis_fiche
integer x = 626
integer y = 1528
integer width = 517
end type

type cb_ajouter from w_param`cb_ajouter within w_soins_suivis_fiche
integer x = 96
integer y = 1528
integer width = 517
end type

event cb_ajouter::clicked;//dw_liste.InsertRow(0)
//	
//
//IF IsNull(max) THEN
//	max = 1
//ELSE	
//	max = max + 1
//END IF	
//dw_liste.SetItem(dw_liste.RowCount(),"code",string(max))
//
//dw_liste.ScrollToRow(dw_liste.rowcount())
//dw_liste.Setcolumn(1)
//dw_liste.SetFocus()
//

dw_liste.InsertRow(0)
dw_liste.SetItem(dw_liste.RowCount(),"code_soins_suivis",code_soins_suivis_local)
dw_liste.ScrollToRow(dw_liste.rowcount())
dw_liste.Setcolumn(1)
dw_liste.SetFocus()

end event

type dw_liste from w_param`dw_liste within w_soins_suivis_fiche
integer x = 64
integer y = 44
integer width = 2688
integer height = 1444
string dataobject = "dw_soins_suivis_detail"
end type

event dw_liste::buttonclicked;call super::buttonclicked;
string	ls_Object
integer i_valeur, i_lig, i_tot

ls_Object = String(dwo.name)

this.accepttext()


choose case ls_object
	case "b_prop1" 
		
		i_valeur = getItemNumber(row, "numero_min") 
		
		if MessageBox("ATTENTION","Vous allez propager la valeur '" + string(i_valeur) + "' à toutes les lignes (colonne de gauche).~n~nConfirmez-vous ?", Question!, Yesno!, 2) = 1 then
			i_tot = this.rowcount() 
			for i_lig = 1  to i_tot
				SetItem(i_lig, "numero_min", i_valeur) 
			next
		end if
		
	case "b_prop2" 
		
		i_valeur = getItemNumber(row, "numero_max") 
		
		if MessageBox("ATTENTION","Vous allez propager la valeur '" + string(i_valeur) + "' à toutes les lignes (colonne de droite).~n~nConfirmez-vous ?", Question!, Yesno!, 2) = 1 then
			i_tot = this.rowcount() 
			for i_lig = 1  to i_tot
				SetItem(i_lig, "numero_max", i_valeur) 
			next
		end if
		
end choose

end event

type uo_1 from w_param`uo_1 within w_soins_suivis_fiche
end type

type cbx_avec_les_inactifs from w_param`cbx_avec_les_inactifs within w_soins_suivis_fiche
boolean visible = false
integer y = 1584
end type

type gb_filtre from w_param`gb_filtre within w_soins_suivis_fiche
boolean visible = false
integer y = 1512
end type

type dw_edition from datawindow within w_soins_suivis_fiche
boolean visible = false
integer x = 151
integer y = 612
integer width = 494
integer height = 360
integer taborder = 11
boolean bringtotop = true
string dataobject = "dw_categorie_liste_edition"
boolean livescroll = true
end type

type cb_imprimer from uo_picturebutton_390x120 within w_soins_suivis_fiche
boolean visible = false
integer x = 882
integer y = 1264
integer taborder = 50
boolean bringtotop = true
string text = "&Imprimer"
end type

event clicked;call super::clicked;dw_edition.retrieve()
dw_edition.print()
end event

