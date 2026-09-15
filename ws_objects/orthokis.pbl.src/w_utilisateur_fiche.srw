$PBExportHeader$w_utilisateur_fiche.srw
$PBExportComments$Héritée de param_fiche
forward
global type w_utilisateur_fiche from w_param_fiche
end type
type tab_1 from tab within w_utilisateur_fiche
end type
type tabpage_1 from userobject within tab_1
end type
type dw_1 from datawindow within tabpage_1
end type
type tabpage_1 from userobject within tab_1
dw_1 dw_1
end type
type tabpage_2 from userobject within tab_1
end type
type dw_2 from datawindow within tabpage_2
end type
type tabpage_2 from userobject within tab_1
dw_2 dw_2
end type
type tabpage_3 from userobject within tab_1
end type
type dw_3 from datawindow within tabpage_3
end type
type tabpage_3 from userobject within tab_1
dw_3 dw_3
end type
type tabpage_4 from userobject within tab_1
end type
type dw_4 from datawindow within tabpage_4
end type
type tabpage_4 from userobject within tab_1
dw_4 dw_4
end type
type tabpage_5 from userobject within tab_1
end type
type dw_5 from datawindow within tabpage_5
end type
type tabpage_5 from userobject within tab_1
dw_5 dw_5
end type
type tabpage_6 from userobject within tab_1
end type
type dw_6 from datawindow within tabpage_6
end type
type tabpage_6 from userobject within tab_1
dw_6 dw_6
end type
type tabpage_9 from userobject within tab_1
end type
type dw_9 from datawindow within tabpage_9
end type
type tabpage_9 from userobject within tab_1
dw_9 dw_9
end type
type tabpage_7 from userobject within tab_1
end type
type dw_7 from datawindow within tabpage_7
end type
type tabpage_7 from userobject within tab_1
dw_7 dw_7
end type
type tabpage_8 from userobject within tab_1
end type
type dw_8 from datawindow within tabpage_8
end type
type tabpage_8 from userobject within tab_1
dw_8 dw_8
end type
type tab_1 from tab within w_utilisateur_fiche
tabpage_1 tabpage_1
tabpage_2 tabpage_2
tabpage_3 tabpage_3
tabpage_4 tabpage_4
tabpage_5 tabpage_5
tabpage_6 tabpage_6
tabpage_9 tabpage_9
tabpage_7 tabpage_7
tabpage_8 tabpage_8
end type
type pb_odrade from uo_picturebutton_390x120 within w_utilisateur_fiche
end type
type dw_chu_liege from datawindow within w_utilisateur_fiche
end type
type dw_erasme from datawindow within w_utilisateur_fiche
end type
type dw_fiche_duplication from datawindow within w_utilisateur_fiche
end type
end forward

global type w_utilisateur_fiche from w_param_fiche
integer width = 4315
integer height = 2268
string title = "Fiche Utilisateur"
tab_1 tab_1
pb_odrade pb_odrade
dw_chu_liege dw_chu_liege
dw_erasme dw_erasme
dw_fiche_duplication dw_fiche_duplication
end type
global w_utilisateur_fiche w_utilisateur_fiche

on w_utilisateur_fiche.create
int iCurrent
call super::create
this.tab_1=create tab_1
this.pb_odrade=create pb_odrade
this.dw_chu_liege=create dw_chu_liege
this.dw_erasme=create dw_erasme
this.dw_fiche_duplication=create dw_fiche_duplication
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.tab_1
this.Control[iCurrent+2]=this.pb_odrade
this.Control[iCurrent+3]=this.dw_chu_liege
this.Control[iCurrent+4]=this.dw_erasme
this.Control[iCurrent+5]=this.dw_fiche_duplication
end on

on w_utilisateur_fiche.destroy
call super::destroy
destroy(this.tab_1)
destroy(this.pb_odrade)
destroy(this.dw_chu_liege)
destroy(this.dw_erasme)
destroy(this.dw_fiche_duplication)
end on

event open;// Passage de paramètre entre fenêtre
// après un openwithparm(nom_fenêtre,paramètre(string,number...)
//
code = message.stringparm


if TEA then
	tab_1.tabpage_9.dw_9.object.t_monorthodontiste.text = LIBELLE_APPLICATION + " : "
	tab_1.tabpage_9.dw_9.object.autor_monorthodontiste.x = 1248
end if

// Lien 3Shape
tab_1.tabpage_7.dw_7.object.t_scanner_3shape.visible = SHAPE or SHAPE_2026
tab_1.tabpage_7.dw_7.object.scanner_3shape.visible = SHAPE or SHAPE_2026
tab_1.tabpage_7.dw_7.object.b_effacer_scanner_3shape.visible = SHAPE or SHAPE_2026

double max

uo_1.taille(this)
centrer(this)

colore_tous_objets_tab(tab_1,couleur_fond_datawindow)


if not ODR  then		// pas de lien ODRADE
	pb_odrade.visible = false
end if


dw_fiche.settransobject(SQLCA)
tab_1.tabpage_1.dw_1.settransobject(SQLCA)
tab_1.tabpage_2.dw_2.settransobject(SQLCA)
tab_1.tabpage_3.dw_3.settransobject(SQLCA)
tab_1.tabpage_4.dw_4.settransobject(SQLCA)
tab_1.tabpage_5.dw_5.settransobject(SQLCA)
tab_1.tabpage_6.dw_6.settransobject(SQLCA)
tab_1.tabpage_7.dw_7.settransobject(SQLCA)
tab_1.tabpage_8.dw_8.settransobject(SQLCA)
tab_1.tabpage_9.dw_9.settransobject(SQLCA)

// Partage des Dw
dw_fiche.ShareData(tab_1.tabpage_1.dw_1)
dw_fiche.ShareData(tab_1.tabpage_2.dw_2)
dw_fiche.ShareData(tab_1.tabpage_3.dw_3)
dw_fiche.ShareData(tab_1.tabpage_4.dw_4)
dw_fiche.ShareData(tab_1.tabpage_5.dw_5)
dw_fiche.ShareData(tab_1.tabpage_6.dw_6)
dw_fiche.ShareData(tab_1.tabpage_7.dw_7)
dw_fiche.ShareData(tab_1.tabpage_8.dw_8)
dw_fiche.ShareData(tab_1.tabpage_9.dw_9)

if CHU_LIEGE then 
	dw_chu_liege.visible = true
	dw_chu_liege.settransobject(sqlca)
else
	if HOPITAL_ERASME then
		// On se sert de la même dw que pour le CHU de Liège pour simplifier le code
		dw_chu_liege.visible = true
		dw_chu_liege.title = "Matricule Erasme"
		dw_chu_liege.dataobject = "dw_erasme_maj_matricule"
		dw_chu_liege.settransobject(sqlca)
	else
		// HOPITAL ST LUC
		if serial = "87874" then
			dw_chu_liege.visible = true
			dw_chu_liege.title = "Matricule St Luc"
			dw_chu_liege.dataobject = "dw_stluc_maj_matricule"
			dw_chu_liege.settransobject(sqlca)
		else
			dw_chu_liege.visible = false
		end if
	end if
end if


if BELGIQUE then
	tab_1.tabpage_6.dw_6.object.Autorisation_suppression_soin_t.text = "Autorisation pour supprimer un soin ayant fait l'objet d'une Attestation :"
	tab_1.tabpage_6.dw_6.object.t_suppression_facture.text = "Autorisation pour supprimer une Attestation :"
	
	
end if

// Onglet gestion de stock
tab_1.tabpage_5.visible = stock

// Depuis 2014, on gère un ajout mini ou maxi
// Si "      ", ajout maxi comme avant
// Si "à@23&#" ajout avec droits miini

// Depuis 2018
// Si "@#;?q1xxxxxx" : ajout pour dupliqur les droits du user xxxxxx

constant string code_mini =  "à@23&#"
constant string code_duplication =  "@#;?q1"

if trim(code) = ""  or code = code_mini then
	// Ajout
	dw_fiche.retrieve(" ")
	dw_fiche.insertrow(0)
	
	// On vire le bouton Odrade pour éviter les pb de codes
	pb_odrade.visible = false
	

		
  SELECT MAX(cast(code as float))
  	INTO :max
    FROM "utilisateurs"  
   WHERE ("code" not between 'a' AND 'z' ) AND  
         ("code" not between 'A' AND 'Z' )    ;

	IF IsNull(max) THEN
		max = 1
	ELSE	
		max = max + 1
	END IF	
	dw_fiche.SetItem(dw_fiche.RowCount(),"code",string(max))
	
	dw_fiche.ScrollToRow(dw_fiche.rowcount())
	dw_fiche.SetFocus()
	if CHU_LIEGE then 
		dw_chu_liege.insertrow(1)
		// on gère le code dans l'enregistrement des dw
	end if
	
	If code = code_mini then 
		
		// C'est un utilisateur mini => on met les droits mini par défaut
		dw_fiche.setItem(1, "patient_admini", "N")
		dw_fiche.setItem(1, "patient_soin", "N")
		dw_fiche.setItem(1, "patient_reglement", "N")
		dw_fiche.setItem(1, "patient_suivi", "N")
		dw_fiche.setItem(1, "patient_commentaire", "N")
		dw_fiche.setItem(1, "patient_page", "N")
		dw_fiche.setItem(1, "patient_rendez", "N")
		dw_fiche.setItem(1, "liste_soin", "N")
		dw_fiche.setItem(1, "liste_secu", "N")
		dw_fiche.setItem(1, "liste_patient", "N")
		dw_fiche.setItem(1, "liste_financier", "N")
		dw_fiche.setItem(1, "liste_previsionnel", "N")
		dw_fiche.setItem(1, "liste_divers", "N")
		dw_fiche.setItem(1, "liste_tp", "N")
		dw_fiche.setItem(1, "liste_clinique", "N")
		dw_fiche.setItem(1, "liste_rendez", "N")
		dw_fiche.setItem(1, "liste_historique", "N")
		dw_fiche.setItem(1, "table_adresse", "N")
		dw_fiche.setItem(1, "table_soin", "N")
		dw_fiche.setItem(1, "table_caisse", "N")
		dw_fiche.setItem(1, "table_rendez", "N")
		dw_fiche.setItem(1, "outils_partie1", "N")
		dw_fiche.setItem(1, "outils_param", "N")
		dw_fiche.setItem(1, "outils_envoi", "N")
		dw_fiche.setItem(1, "table_graphique", "N")
		dw_fiche.setItem(1, "patient_soin_prevu", "N")
		dw_fiche.setItem(1, "finance_devant", "N")
		dw_fiche.setItem(1, "finance_relance", "N")
		dw_fiche.setItem(1, "finance_remise", "N")
		dw_fiche.setItem(1, "finance_recettes", "N")
		dw_fiche.setItem(1, "finance_reg_type", "N")
		dw_fiche.setItem(1, "finance_reg_remis", "N")
		dw_fiche.setItem(1, "finance_payeur", "N")
		dw_fiche.setItem(1, "patient_commentaire_admini", "N")
		dw_fiche.setItem(1, "table_stock", "N")
		dw_fiche.setItem(1, "stock_commande", "N")
		dw_fiche.setItem(1, "stock_maj_produit", "N")
		dw_fiche.setItem(1, "stock_sortie", "N")
		dw_fiche.setItem(1, "stock_liste", "N")
		dw_fiche.setItem(1, "stock_impr_etiq", "N")
		dw_fiche.setItem(1, "reglt_saisie_jour", "N")
		dw_fiche.setItem(1, "reglt_modif_mdp", "O")
		dw_fiche.setItem(1, "maj_word", "N")
		dw_fiche.setItem(1, "reglt_multi_fs", "N")
		dw_fiche.setItem(1, "suppression_historique_editions", "N")
		dw_fiche.setItem(1, "secu_remise", "O")
		dw_fiche.setItem(1, "sup_soin_fs", "N")
		dw_fiche.setItem(1, "super_user", "N")
		dw_fiche.setItem(1, "autor_jours_interdits", "N")
		dw_fiche.setItem(1, "autor_myorthokis", "N")
		dw_fiche.setItem(1, "autor_monorthodontiste", "N")
		dw_fiche.setItem(1, "autor_suppression_facture", "N")
		
		// 2025
		dw_fiche.setItem(1, "autor_report_journee_rdv", "N")
		dw_fiche.setItem(1, "autor_forcage_blocage_rdv", "N")
		dw_fiche.setItem(1, "autor_agregation_finaniere", "N")
		
		//2026
		dw_fiche.setItem(1, "autor_modif_tarif_soin", "N")

		Messagebox("ATTENTION","Vous venez d'ajouter un utilisateur avec AUCUN droit.~n~nA vous de lui autoriser telle ou telle fonctionnalité.")

	end if
else
	
	if left(code, 6) = code_duplication then
		
		// On va dupliquer le patient pour conserver ses droits
		dw_fiche_duplication.settransobject(SQLCA)
		string v_code_user 
		v_code_user = mid(code, 7, len(code) - 6)
		dw_fiche_duplication.retrieve(v_code_user)
		dw_fiche_duplication.rowscopy(1,1,primary!,dw_fiche,1, Primary!)	
				
		  SELECT MAX(cast(code as float))
			INTO :max
			 FROM "utilisateurs"  
			WHERE ("code" not between 'a' AND 'z' ) AND  
					("code" not between 'A' AND 'Z' )    ;
		
			IF IsNull(max) THEN
				max = 1
			ELSE	
				max = max + 1
			END IF	
			dw_fiche.SetItem(dw_fiche.RowCount(),"code",string(max))
			dw_fiche.SetItem(dw_fiche.RowCount(),"nom","")
			dw_fiche.SetItem(dw_fiche.RowCount(),"passe","")
			
	else
		// Modif
		dw_fiche.Modify("Code.Edit.DisplayOnly = Yes")
		dw_fiche.retrieve(code)
		if CHU_LIEGE then 
			dw_chu_liege.retrieve(code)
			// au cas ou 
			if 	dw_chu_liege.rowcount() = 0 then
				dw_chu_liege.insertrow(1)
				dw_chu_liege.setitem(1, "code_utilisateur",code)
			end if
	
		end if
	end if
end if


//this.backcolor = couleur_fond_fenetre





end event

type p_fond from w_param_fiche`p_fond within w_utilisateur_fiche
integer y = 552
end type

type cb_fermer from w_param_fiche`cb_fermer within w_utilisateur_fiche
integer x = 3200
integer y = 1948
integer width = 594
end type

type cb_enregistrer from w_param_fiche`cb_enregistrer within w_utilisateur_fiche
integer x = 2537
integer y = 1948
integer width = 594
end type

event cb_enregistrer::clicked;call super::clicked;if CHU_LIEGE then
	dw_chu_liege.accepttext()
	
	if dw_fiche.rowcount() > 0 then 
		dw_chu_liege.setitem(1,"code_utilisateur",dw_fiche.getitemstring(1,"code"))
	end if

	if dw_chu_liege.update() = 1 then
		commit ;
	else
		Rollback ;
	end if
end if

end event

type cb_annuler from w_param_fiche`cb_annuler within w_utilisateur_fiche
integer x = 1874
integer y = 1948
integer width = 594
end type

event cb_annuler::clicked;call super::clicked;
if CHU_LIEGE then
	dw_chu_liege.retrieve(code) ;
end if 
end event

type cb_imprimer from w_param_fiche`cb_imprimer within w_utilisateur_fiche
boolean visible = false
integer x = 1381
integer y = 1684
end type

type uo_1 from w_param_fiche`uo_1 within w_utilisateur_fiche
end type

type dw_fiche from w_param_fiche`dw_fiche within w_utilisateur_fiche
integer x = 453
integer y = 44
integer width = 2560
integer height = 332
string dataobject = "dw_utilisateur_fiche"
end type

type tab_1 from tab within w_utilisateur_fiche
integer x = 50
integer y = 420
integer width = 4169
integer height = 1468
integer taborder = 20
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long backcolor = 16777215
boolean focusonbuttondown = true
alignment alignment = center!
integer selectedtab = 1
tabpage_1 tabpage_1
tabpage_2 tabpage_2
tabpage_3 tabpage_3
tabpage_4 tabpage_4
tabpage_5 tabpage_5
tabpage_6 tabpage_6
tabpage_9 tabpage_9
tabpage_7 tabpage_7
tabpage_8 tabpage_8
end type

on tab_1.create
this.tabpage_1=create tabpage_1
this.tabpage_2=create tabpage_2
this.tabpage_3=create tabpage_3
this.tabpage_4=create tabpage_4
this.tabpage_5=create tabpage_5
this.tabpage_6=create tabpage_6
this.tabpage_9=create tabpage_9
this.tabpage_7=create tabpage_7
this.tabpage_8=create tabpage_8
this.Control[]={this.tabpage_1,&
this.tabpage_2,&
this.tabpage_3,&
this.tabpage_4,&
this.tabpage_5,&
this.tabpage_6,&
this.tabpage_9,&
this.tabpage_7,&
this.tabpage_8}
end on

on tab_1.destroy
destroy(this.tabpage_1)
destroy(this.tabpage_2)
destroy(this.tabpage_3)
destroy(this.tabpage_4)
destroy(this.tabpage_5)
destroy(this.tabpage_6)
destroy(this.tabpage_9)
destroy(this.tabpage_7)
destroy(this.tabpage_8)
end on

type tabpage_1 from userobject within tab_1
integer x = 18
integer y = 104
integer width = 4133
integer height = 1348
long backcolor = 16777215
string text = "Ruban Patient"
long tabtextcolor = 33554432
long tabbackcolor = 15780518
long picturemaskcolor = 536870912
dw_1 dw_1
end type

on tabpage_1.create
this.dw_1=create dw_1
this.Control[]={this.dw_1}
end on

on tabpage_1.destroy
destroy(this.dw_1)
end on

type dw_1 from datawindow within tabpage_1
string tag = "brush"
integer x = 393
integer y = 164
integer width = 2990
integer height = 720
integer taborder = 30
string title = "none"
string dataobject = "dw_utilisateur_fiche_patient"
boolean border = false
boolean livescroll = true
end type

type tabpage_2 from userobject within tab_1
integer x = 18
integer y = 104
integer width = 4133
integer height = 1348
long backcolor = 16777215
string text = "Ruban Listes"
long tabtextcolor = 33554432
long tabbackcolor = 15780518
long picturemaskcolor = 536870912
dw_2 dw_2
end type

on tabpage_2.create
this.dw_2=create dw_2
this.Control[]={this.dw_2}
end on

on tabpage_2.destroy
destroy(this.dw_2)
end on

type dw_2 from datawindow within tabpage_2
string tag = "brush"
integer x = 398
integer y = 168
integer width = 3118
integer height = 800
integer taborder = 10
string title = "none"
string dataobject = "dw_utilisateur_fiche_listes"
boolean border = false
boolean livescroll = true
end type

type tabpage_3 from userobject within tab_1
integer x = 18
integer y = 104
integer width = 4133
integer height = 1348
long backcolor = 16777215
string text = "Listes Financières"
long tabtextcolor = 33554432
long tabbackcolor = 15780518
long picturemaskcolor = 536870912
dw_3 dw_3
end type

on tabpage_3.create
this.dw_3=create dw_3
this.Control[]={this.dw_3}
end on

on tabpage_3.destroy
destroy(this.dw_3)
end on

type dw_3 from datawindow within tabpage_3
string tag = "brush"
integer x = 425
integer y = 248
integer width = 2985
integer height = 656
integer taborder = 10
string title = "none"
string dataobject = "dw_utilisateur_fiche_listes_financieres"
boolean border = false
boolean livescroll = true
end type

type tabpage_4 from userobject within tab_1
integer x = 18
integer y = 104
integer width = 4133
integer height = 1348
long backcolor = 16777215
string text = "Rubans Tables & Outils"
long tabtextcolor = 33554432
long tabbackcolor = 15780518
long picturemaskcolor = 536870912
dw_4 dw_4
end type

on tabpage_4.create
this.dw_4=create dw_4
this.Control[]={this.dw_4}
end on

on tabpage_4.destroy
destroy(this.dw_4)
end on

type dw_4 from datawindow within tabpage_4
string tag = "brush"
integer x = 315
integer y = 140
integer width = 3374
integer height = 828
integer taborder = 10
string title = "none"
string dataobject = "dw_utilisateur_fiche_autres"
boolean border = false
boolean livescroll = true
end type

type tabpage_5 from userobject within tab_1
integer x = 18
integer y = 104
integer width = 4133
integer height = 1348
long backcolor = 16777215
string text = "Ruban Gestion de Stock"
long tabtextcolor = 33554432
long tabbackcolor = 15780518
long picturemaskcolor = 536870912
dw_5 dw_5
end type

on tabpage_5.create
this.dw_5=create dw_5
this.Control[]={this.dw_5}
end on

on tabpage_5.destroy
destroy(this.dw_5)
end on

type dw_5 from datawindow within tabpage_5
string tag = "brush"
integer x = 1102
integer y = 168
integer width = 1481
integer height = 688
integer taborder = 20
string title = "none"
string dataobject = "dw_utilisateur_fiche_stock"
boolean border = false
boolean livescroll = true
end type

type tabpage_6 from userobject within tab_1
integer x = 18
integer y = 104
integer width = 4133
integer height = 1348
long backcolor = 16777215
string text = "Sécurité 1/2"
long tabtextcolor = 33554432
long tabbackcolor = 15780518
long picturemaskcolor = 536870912
dw_6 dw_6
end type

on tabpage_6.create
this.dw_6=create dw_6
this.Control[]={this.dw_6}
end on

on tabpage_6.destroy
destroy(this.dw_6)
end on

type dw_6 from datawindow within tabpage_6
string tag = "brush"
integer x = 151
integer y = 16
integer width = 3465
integer height = 1296
integer taborder = 30
string title = "none"
string dataobject = "dw_utilisateur_fiche_reglements"
boolean border = false
boolean livescroll = true
end type

type tabpage_9 from userobject within tab_1
integer x = 18
integer y = 104
integer width = 4133
integer height = 1348
long backcolor = 16777215
string text = "Sécurité 2/2"
long tabtextcolor = 33554432
long tabbackcolor = 15780518
long picturemaskcolor = 536870912
dw_9 dw_9
end type

on tabpage_9.create
this.dw_9=create dw_9
this.Control[]={this.dw_9}
end on

on tabpage_9.destroy
destroy(this.dw_9)
end on

type dw_9 from datawindow within tabpage_9
string tag = "brush"
integer x = 151
integer y = 56
integer width = 3726
integer height = 1084
integer taborder = 10
string title = "none"
string dataobject = "dw_utilisateur_fiche_securite2"
boolean border = false
boolean livescroll = true
end type

type tabpage_7 from userobject within tab_1
integer x = 18
integer y = 104
integer width = 4133
integer height = 1348
long backcolor = 16777215
string text = "Préférences"
long tabtextcolor = 33554432
long tabbackcolor = 15780518
long picturemaskcolor = 536870912
dw_7 dw_7
end type

on tabpage_7.create
this.dw_7=create dw_7
this.Control[]={this.dw_7}
end on

on tabpage_7.destroy
destroy(this.dw_7)
end on

type dw_7 from datawindow within tabpage_7
string tag = "brush"
integer x = 512
integer y = 76
integer width = 3159
integer height = 1040
integer taborder = 20
string title = "none"
string dataobject = "dw_utilisateur_fiche_divers"
boolean border = false
boolean livescroll = true
end type

event buttonclicked;string	ls_Object
string	ls_win
long couleur_choisie
string v_message
integer i_null

setnull(i_null)
ls_Object = String(dwo.name)


choose case ls_object
	case "b_effacer_praticien_par_defaut" 
		
		if row > 0 then
			setItem(row, "praticien_par_defaut", '')
		end if
	case "b_effacer_scanner_3shape"
		
		if row > 0 then
			setItem(row, "scanner_3shape", i_null)
		end if
	
end choose



// 
end event

type tabpage_8 from userobject within tab_1
integer x = 18
integer y = 104
integer width = 4133
integer height = 1348
long backcolor = 16777215
string text = "Emails"
long tabtextcolor = 33554432
long tabbackcolor = 15780518
long picturemaskcolor = 536870912
dw_8 dw_8
end type

on tabpage_8.create
this.dw_8=create dw_8
this.Control[]={this.dw_8}
end on

on tabpage_8.destroy
destroy(this.dw_8)
end on

type dw_8 from datawindow within tabpage_8
string tag = "brush"
integer x = 686
integer y = 12
integer width = 2706
integer height = 1120
integer taborder = 30
string title = "none"
string dataobject = "dw_utilisateur_emails"
boolean border = false
boolean livescroll = true
end type

type pb_odrade from uo_picturebutton_390x120 within w_utilisateur_fiche
integer x = 626
integer y = 1948
integer width = 594
integer taborder = 21
boolean bringtotop = true
string text = "&Odrade"
string iconname = "lc_odrade.png"
end type

event clicked;call super::clicked;

OpenWithParm(w_utilisateur_fiche_odrade, code)
end event

type dw_chu_liege from datawindow within w_utilisateur_fiche
string tag = "brush"
integer x = 3035
integer y = 56
integer width = 658
integer height = 256
integer taborder = 30
boolean bringtotop = true
boolean titlebar = true
string title = "Matricule CHU"
string dataobject = "dw_chu_maj_matricule"
boolean livescroll = true
borderstyle borderstyle = styleraised!
end type

type dw_erasme from datawindow within w_utilisateur_fiche
string tag = "uniquement pour la compilation"
boolean visible = false
integer x = 3287
integer y = 1572
integer width = 658
integer height = 256
integer taborder = 40
boolean bringtotop = true
boolean titlebar = true
string title = "DW ERASME"
string dataobject = "dw_erasme_maj_matricule"
boolean livescroll = true
borderstyle borderstyle = styleraised!
end type

type dw_fiche_duplication from datawindow within w_utilisateur_fiche
boolean visible = false
integer x = 128
integer width = 686
integer height = 400
integer taborder = 60
boolean bringtotop = true
string title = "none"
string dataobject = "dw_utilisateur_fiche"
boolean livescroll = true
borderstyle borderstyle = styleraised!
end type

