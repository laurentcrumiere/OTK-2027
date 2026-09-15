$PBExportHeader$w_maj_stock_produit.srw
forward
global type w_maj_stock_produit from w_fenetre_arakis
end type
type cb_annuler_entree from uo_picturebutton_390x120 within w_maj_stock_produit
end type
type cb_valider from uo_picturebutton_390x120 within w_maj_stock_produit
end type
type cb_impression from uo_picturebutton_390x120 within w_maj_stock_produit
end type
type cb_option from uo_picturebutton_390x120 within w_maj_stock_produit
end type
type cb_continuer from uo_picturebutton_390x120 within w_maj_stock_produit
end type
type cb_annuler_sortie from uo_picturebutton_390x120 within w_maj_stock_produit
end type
type cb_recherche from uo_picturebutton_780x120 within w_maj_stock_produit
end type
type cb_fiche from uo_picturebutton_390x120 within w_maj_stock_produit
end type
type cb_supprimer from uo_picturebutton_780x120 within w_maj_stock_produit
end type
type cb_fermer from uo_picturebutton_390x120 within w_maj_stock_produit
end type
type cb_annuler from uo_picturebutton_390x120 within w_maj_stock_produit
end type
type cb_ajouter from uo_picturebutton_780x120 within w_maj_stock_produit
end type
type cb_enregistrer from uo_picturebutton_390x120 within w_maj_stock_produit
end type
type cb_generer from uo_picturebutton_780x120 within w_maj_stock_produit
end type
type dw_1 from datawindow within w_maj_stock_produit
end type
type dw_code_barre from datawindow within w_maj_stock_produit
end type
type dw_edition from datawindow within w_maj_stock_produit
end type
type dw_titre from datawindow within w_maj_stock_produit
end type
type cbx_archive from checkbox within w_maj_stock_produit
end type
type dw_entree from datawindow within w_maj_stock_produit
end type
type dw_sortie from datawindow within w_maj_stock_produit
end type
type dw_basic2 from datawindow within w_maj_stock_produit
end type
type uo_1 from resize_fenetre within w_maj_stock_produit
end type
type dw_liste from u_basedw within w_maj_stock_produit
end type
type tab_stock from tab within w_maj_stock_produit
end type
type tabpage_etat from userobject within tab_stock
end type
type cb_imp_liste from uo_picturebutton_250x120 within tabpage_etat
end type
type cb_modifier from uo_picturebutton_250x120 within tabpage_etat
end type
type cb_entree from uo_picturebutton_250x120 within tabpage_etat
end type
type cb_sortie from uo_picturebutton_250x120 within tabpage_etat
end type
type cb_impr_etiq from uo_picturebutton_250x120 within tabpage_etat
end type
type cb_impr_ste from uo_picturebutton_250x120 within tabpage_etat
end type
type dw_liste2 from u_basedw within tabpage_etat
end type
type tabpage_etat from userobject within tab_stock
cb_imp_liste cb_imp_liste
cb_modifier cb_modifier
cb_entree cb_entree
cb_sortie cb_sortie
cb_impr_etiq cb_impr_etiq
cb_impr_ste cb_impr_ste
dw_liste2 dw_liste2
end type
type tabpage_gestion from userobject within tab_stock
end type
type dw_fiche2 from datawindow within tabpage_gestion
end type
type dw_fiche from datawindow within tabpage_gestion
end type
type tabpage_gestion from userobject within tab_stock
dw_fiche2 dw_fiche2
dw_fiche dw_fiche
end type
type tab_stock from tab within w_maj_stock_produit
tabpage_etat tabpage_etat
tabpage_gestion tabpage_gestion
end type
type dw_basic from datawindow within w_maj_stock_produit
end type
type pb_udi from picturebutton within w_maj_stock_produit
end type
type dw_stock_produit from datawindow within w_maj_stock_produit
end type
type gb_1 from groupbox within w_maj_stock_produit
end type
type gb_2 from groupbox within w_maj_stock_produit
end type
type gb_3 from groupbox within w_maj_stock_produit
end type
type gb_4 from groupbox within w_maj_stock_produit
end type
type gb_5 from groupbox within w_maj_stock_produit
end type
end forward

global type w_maj_stock_produit from w_fenetre_arakis
integer width = 3141
integer height = 2548
string title = "Mise à jour Stock Produit"
windowtype windowtype = response!
cb_annuler_entree cb_annuler_entree
cb_valider cb_valider
cb_impression cb_impression
cb_option cb_option
cb_continuer cb_continuer
cb_annuler_sortie cb_annuler_sortie
cb_recherche cb_recherche
cb_fiche cb_fiche
cb_supprimer cb_supprimer
cb_fermer cb_fermer
cb_annuler cb_annuler
cb_ajouter cb_ajouter
cb_enregistrer cb_enregistrer
cb_generer cb_generer
dw_1 dw_1
dw_code_barre dw_code_barre
dw_edition dw_edition
dw_titre dw_titre
cbx_archive cbx_archive
dw_entree dw_entree
dw_sortie dw_sortie
dw_basic2 dw_basic2
uo_1 uo_1
dw_liste dw_liste
tab_stock tab_stock
dw_basic dw_basic
pb_udi pb_udi
dw_stock_produit dw_stock_produit
gb_1 gb_1
gb_2 gb_2
gb_3 gb_3
gb_4 gb_4
gb_5 gb_5
end type
global w_maj_stock_produit w_maj_stock_produit

type variables
datawindowchild idw_type //dw fille de dw_basic
string code_interne_local //code du produit de la fiche
string code_praticien_local //code du praticien de la fiche
string code_fournisseur_courant //code fournisseur courant sélectionner parmi la liste des fournisseurs listés pour ce produit
str_boolstring struct //pour la passage de param
integer type_gestion //type de gestion du produit de la fiche pour l'affichage de dw_liste2
str_format_planche struct_format
environment	lenv_obj
boolean prems
end variables

forward prototypes
public subroutine maj_histo_s ()
public subroutine recuperer (long ligne)
public subroutine imprimer_etiquettes ()
public subroutine maj_histo ()
public subroutine resize_tab_stock (boolean test)
public subroutine generer ()
public subroutine ajouter ()
public subroutine visi (integer code)
public function long color (boolean checked)
end prototypes

public subroutine maj_histo_s ();////////////////////////////////////
//    MAJ Histo Sortie de Stock   //
////////////////////////////////////

//mise a jour de l'historique des es
//commentaires idem reception commande

string code_utilisateur,libelle,code_lieu_utilisation,type_taxe,poste_utilisation
int quantite
double code_barre,prix
date date_sortie
time heure

dw_sortie.accepttext()

code_barre = dw_sortie.getitemnumber(dw_sortie.getrow(),"stock_produit_code_barre")
quantite = dw_sortie.getitemnumber(dw_sortie.getrow(),"historique_es_quantite")
type_taxe = dw_sortie.getitemstring(dw_sortie.getrow(),"historique_es_code_type_taxe")
code_lieu_utilisation = dw_sortie.getitemstring(dw_sortie.getrow(),"historique_es_code_lieu_utilisation")
date_sortie = dw_sortie.getitemdate(dw_sortie.Getrow(),"historique_es_date")
prix = dw_sortie.getitemnumber(dw_sortie.getrow(),"historique_es_prix")
code_utilisateur = dw_sortie.getitemstring(dw_sortie.getrow(),"historique_es_utilisateur")
libelle = dw_sortie.getitemstring(dw_sortie.getrow(),"historique_es_libelle")
poste_utilisation = dw_sortie.getitemstring(dw_sortie.getrow(),"historique_es_poste_utilisation")
heure = dw_sortie.getitemtime(dw_sortie.getrow(),"historique_es_heure")

insert into "historique_es"
	("code_barre","code_es","date","quantite","prix","utilisateur","libelle","code_type_taxe","code_lieu_utilisation","poste_utilisation","heure")
	values (:code_barre,'s',:date_sortie,:quantite,:prix,:code_utilisateur,:libelle,:type_taxe,:code_lieu_utilisation,:poste_utilisation,:heure);

if SQLCA.SQLcode = -1 Then
// Problème dans le INSERT
		CHOOSE CASE SQLCA.SQLdbCode
		CASE -193
		// Problème de clé 
			Messagebox("ATTENTION !","Ce soin ne peut être temporairement mis à jour !~nRefaites une tentative ou abandonnez l'ajout !")
		CASE ELSE
			Messagebox("Erreur SQL",SQLCA.SQLErrText)
		END CHOOSE
else
	commit;
end if
end subroutine

public subroutine recuperer (long ligne);integer index_table_courante
long row
index_table_courante = tab_stock.selectedtab

if ligne = 0 then
	row = dw_liste.getrow()
else
	row = ligne
end if

if color(cbx_archive.checked) > 0 then
	dw_liste.selectrow(row,true)
	code_fournisseur_courant = dw_liste.getitemstring(row,"param_stock_fournisseur_code_fournisseur")
	dw_basic2.retrieve(code_interne_local,code_fournisseur_courant)
	if type_gestion = 1 then
		tab_stock.tabpage_etat.dw_liste2.retrieve(code_interne_local,code_fournisseur_courant,code_praticien_local)
	end if
	if type_gestion = 2 then
		tab_stock.tabpage_etat.dw_liste2.retrieve(code_interne_local,code_praticien_local)
	end if
	tab_stock.tabpage_gestion.dw_fiche.retrieve(code_interne_local,code_fournisseur_courant,code_praticien_local)
	tab_stock.Selecttab(index_table_courante)
end if
end subroutine

public subroutine imprimer_etiquettes ();integer nb_ligne_commande //nombre de ligne dans la commande
integer i,j,k,l
integer ligne_courante, colonne_courante
integer quantite_courante //quantite commandee du produit traité
integer nombre_entree_par_produit
integer nombre_produit_par_entree
str_code_barre tab[]
string code_produit,designation
date date_commande
double code_barre

//on imprime juste les etiquettes correspondant a une entrée
nombre_entree_par_produit = dw_entree.getitemnumber(dw_entree.getrow(),"stock_produit_quantite")
code_barre = dw_entree.getitemnumber(dw_entree.getrow(),"stock_produit_code_barre")
code_produit = dw_entree.getitemstring(dw_entree.getrow(),"stock_produit_code_produit")
date_commande = dw_entree.getitemdate(dw_entree.getrow(),"historique_es_date")
  SELECT "produit"."designation"  
    INTO :designation  
    FROM "produit"  
   WHERE "produit"."code_interne" = :code_produit   ;

i = 0
FOR j = 1 to nombre_entree_par_produit
	i = i+1
	tab[i].code_barre = code_barre
	tab[i].code_produit = code_produit
	tab[i].designation = designation
	tab[i].jour = date_commande
NEXT

//initialisation du remplissage de dw_format
ligne_courante = int((struct_format.premiere_etiquette - 1)/struct_format.nb_colonne) + 1
colonne_courante = struct_format.premiere_etiquette - (ligne_courante - 1)*struct_format.nb_colonne
dw_code_barre.reset()
FOR j = 1 to ligne_courante
	dw_code_barre.insertrow(0)
NEXT

//remplissage des etiquettes
FOR j = 1 to i
	dw_code_barre.setitem(ligne_courante,"code_barre"+string(colonne_courante),tab[j].code_barre)
	dw_code_barre.setitem(ligne_courante,"designation"+string(colonne_courante),tab[j].designation)
	dw_code_barre.setitem(ligne_courante,"date"+string(colonne_courante),tab[j].jour)
	dw_code_barre.setitem(ligne_courante,"code_produit"+string(colonne_courante),tab[j].code_produit)
	if colonne_courante = struct_format.nb_colonne then
		colonne_courante = 1
		if ligne_courante = struct_format.nb_ligne then
			ligne_courante = 1
			dw_code_barre.print()
			dw_code_barre.reset()
			dw_code_barre.insertrow(0)
		else
			ligne_courante = ligne_courante + 1
			dw_code_barre.insertrow(0)
		end if
	else
		colonne_courante = colonne_courante + 1
	end if
NEXT
if colonne_courante = 1 then
	dw_code_barre.deleterow(ligne_courante)
end if
dw_code_barre.print()
struct_format.premiere_etiquette = 1
end subroutine

public subroutine maj_histo ();////////////////////////////////////
//    MAJ Histo Entree en Stock   //
////////////////////////////////////

//mise à jour historique des es
//commentaires idem reception commande

string code_utilisateur,type_taxe,libelle
int quantite_livree,quantite_colisee,facteur_colisage
double code_barre,prix
date date_reception

dw_entree.accepttext()

code_barre = dw_entree.getitemnumber(dw_entree.getrow(),"stock_produit_code_barre")
quantite_livree = dw_entree.getitemnumber(dw_entree.getrow(),"stock_produit_quantite")
date_reception = dw_entree.getitemdate(dw_entree.Getrow(),"historique_es_date")
prix = dw_entree.getitemnumber(dw_entree.getrow(),"historique_es_prix")
type_taxe = dw_entree.getitemstring(dw_entree.getrow(),"historique_es_code_type_taxe")
code_utilisateur = dw_entree.getitemstring(dw_entree.getrow(),"historique_es_utilisateur")
libelle = dw_entree.getitemstring(dw_entree.getrow(),"historique_es_libelle")

//on récupère le facteur de colisage
  SELECT "param_stock_fournisseur"."qte_colisee"  
    INTO :facteur_colisage  
    FROM "param_stock_fournisseur",   
         "stock_produit"  
   WHERE ( "stock_produit"."code_produit" = "param_stock_fournisseur"."code_produit" ) and  
         ( "stock_produit"."code_fournisseur" = "param_stock_fournisseur"."code_fournisseur" ) and  
         ( "stock_produit"."code_praticien" = "param_stock_fournisseur"."code_praticien" ) and  
         ( ( "stock_produit"."code_barre" = :code_barre ) )   ;

if isnull(facteur_colisage) or facteur_colisage = 0 then
	facteur_colisage = 1
end if

//on met à jour le champ quantite colisée
quantite_colisee = facteur_colisage * quantite_livree

  UPDATE "stock_produit"  
     SET "quantite_colisee" = :quantite_colisee, "facteur_colisage" = :facteur_colisage 
   WHERE "stock_produit"."code_barre" = :code_barre              ;

if sqlca.sqlcode = -1 then
	MessageBox("SQL error", SQLCA.SQLErrText)
	rollback;
else
	insert into "historique_es"
		("code_barre","code_es","date","prix","code_type_taxe","quantite","utilisateur","poste_utilisation","libelle")
		values (:code_barre,'e',:date_reception,:prix,:type_taxe,:quantite_colisee,:code_utilisateur,:utilisateur_code,:libelle);

	IF SQLCA.SQLCode = -1 THEN 
		MessageBox("SQL error", SQLCA.SQLErrText)
		rollback;
	ELSE
		commit;
	END IF
end if
	
dw_entree.enabled = false
cb_valider.enabled ( false)
cb_annuler_entree.text = "C&ontinuer"
cb_annuler_entree.enabled ( true )
cb_impression.enabled ( true)
end subroutine

public subroutine resize_tab_stock (boolean test);if test then
	tab_stock.tabpage_gestion.dw_fiche.Object.DataWindow.zoom = "80"
	tab_stock.tabpage_gestion.dw_fiche.x = tab_stock.tabpage_gestion.dw_fiche.x * 0.8
	tab_stock.tabpage_gestion.dw_fiche2.Object.DataWindow.zoom = "80"
	tab_stock.tabpage_gestion.dw_fiche2.x = tab_stock.tabpage_gestion.dw_fiche2.x * 0.8
	tab_stock.tabpage_etat.dw_liste2.Object.DataWindow.zoom = "80"
	tab_stock.tabpage_etat.dw_liste2.x = tab_stock.tabpage_etat.dw_liste2.x * 0.8
				
	tab_stock.tabpage_etat.cb_sortie.textsize = tab_stock.tabpage_etat.cb_sortie.textsize * 0.8
	tab_stock.tabpage_etat.cb_sortie.x = tab_stock.tabpage_etat.cb_sortie.x * 0.8
	tab_stock.tabpage_etat.cb_sortie.y = tab_stock.tabpage_etat.cb_sortie.y * 0.8
	tab_stock.tabpage_etat.cb_sortie.width = tab_stock.tabpage_etat.cb_sortie.width * 0.8
	tab_stock.tabpage_etat.cb_sortie.height = tab_stock.tabpage_etat.cb_sortie.height * 0.8
	
	tab_stock.tabpage_etat.cb_impr_etiq.textsize = tab_stock.tabpage_etat.cb_impr_etiq.textsize * 0.8
	tab_stock.tabpage_etat.cb_impr_etiq.x = tab_stock.tabpage_etat.cb_impr_etiq.x * 0.8
	tab_stock.tabpage_etat.cb_impr_etiq.y = tab_stock.tabpage_etat.cb_impr_etiq.y * 0.8
	tab_stock.tabpage_etat.cb_impr_etiq.width = tab_stock.tabpage_etat.cb_impr_etiq.width * 0.8
	tab_stock.tabpage_etat.cb_impr_etiq.height = tab_stock.tabpage_etat.cb_impr_etiq.height * 0.8
	
	tab_stock.tabpage_etat.cb_impr_ste.textsize = tab_stock.tabpage_etat.cb_impr_ste.textsize * 0.8
	tab_stock.tabpage_etat.cb_impr_ste.x = tab_stock.tabpage_etat.cb_impr_ste.x * 0.8
	tab_stock.tabpage_etat.cb_impr_ste.y = tab_stock.tabpage_etat.cb_impr_ste.y * 0.8
	tab_stock.tabpage_etat.cb_impr_ste.width = tab_stock.tabpage_etat.cb_impr_ste.width * 0.8
	tab_stock.tabpage_etat.cb_impr_ste.height = tab_stock.tabpage_etat.cb_impr_ste.height * 0.8
	
	tab_stock.tabpage_etat.cb_entree.textsize = tab_stock.tabpage_etat.cb_entree.textsize * 0.8
	tab_stock.tabpage_etat.cb_entree.x = tab_stock.tabpage_etat.cb_entree.x * 0.8
	tab_stock.tabpage_etat.cb_entree.y = tab_stock.tabpage_etat.cb_entree.y * 0.8
	tab_stock.tabpage_etat.cb_entree.width = tab_stock.tabpage_etat.cb_entree.width * 0.8
	tab_stock.tabpage_etat.cb_entree.height = tab_stock.tabpage_etat.cb_entree.height * 0.8
	
	tab_stock.tabpage_etat.cb_modifier.textsize = tab_stock.tabpage_etat.cb_modifier.textsize * 0.8
	tab_stock.tabpage_etat.cb_modifier.x = tab_stock.tabpage_etat.cb_modifier.x * 0.8
	tab_stock.tabpage_etat.cb_modifier.y = tab_stock.tabpage_etat.cb_modifier.y * 0.8
	tab_stock.tabpage_etat.cb_modifier.width = tab_stock.tabpage_etat.cb_modifier.width * 0.8
	tab_stock.tabpage_etat.cb_modifier.height = tab_stock.tabpage_etat.cb_modifier.height * 0.8
end if
end subroutine

public subroutine generer ();str_bague struct_bague
double param

struct_bague.code_produit = code_interne_local
struct_bague.code_praticien = code_praticien_local
struct_bague.code_fournisseur = code_fournisseur_courant

openwithparm(w_generation_bagues,struct_bague)
param = message.doubleparm
if param = 0 then
	close(this)
else
	dw_liste.deleterow(dw_liste.getrow())
	cb_annuler.triggerevent(clicked!)
end if
end subroutine

public subroutine ajouter ();//ajout d'un fournisseur à la liste

//on peut choisir un nouveau fournisseur uniquement parmi la liste des fournisseurs référencés
//pour ce produit dans la table des produits 
//(et n'etant pas deja dans la liste des fournisseurs de cette fiche)

datawindowchild idw_fournisseur

//on change la dw basic2 car le champ fournisseur doit devenir editable avec always show arrow
//sinon c'est la mm dw
dw_basic2.dataobject = 'dw_fournisseur_produit_basic_data_ajout'
dw_basic2.settransobject(sqlca)
if lenv_obj.ScreenHeight = 600 then
	dw_basic2.Object.DataWindow.zoom = "80"
end if
tab_stock.tabpage_gestion.dw_fiche.settransobject(sqlca)
dw_basic2.getchild("code_fournisseur",idw_fournisseur)
idw_fournisseur.settransobject(sqlca)
if idw_fournisseur.retrieve(code_interne_local,code_praticien_local) = 0 then
	MessageBox("Attention","Impossible d'ajouter un fournisseur à la liste, vous devez d'abord le referencer ~n dans la table Gestion de stock->Produits->Reference Fournisseur")
	cb_annuler.triggerevent(clicked!)
else
	dw_basic2.insertrow(0)
	tab_stock.tabpage_gestion.dw_fiche.reset()
	dw_basic2.setfocus()
end if
end subroutine

public subroutine visi (integer code);//rend visible ou invisible les éléments de la fenetre
// cas 1 : entree en stock
// cas 2 : sortie de stock
// cas 3 : retour normal

choose case code
	case 1
		pb_udi.visible = true
		cbx_archive.visible = false
		cb_recherche.visible = false
		cb_generer.visible = false
		dw_basic2.visible = false
		cb_fermer.visible = false
		cb_fiche.visible = false
		cb_enregistrer.visible = false
		cb_annuler.visible = false
		cb_supprimer.visible = false
		cb_ajouter.visible = false
		dw_liste.visible = false
		tab_stock.visible = false
		dw_basic.visible = false
		gb_1.visible = false
		gb_2.visible = false
		gb_3.visible = false
		gb_4.visible = false
		dw_entree.visible = true
		cb_option.visible = true
		cb_impression.visible = true
		cb_annuler_entree.visible = true
		cb_valider.visible = true
		dw_sortie.visible = false
		cb_annuler_sortie.visible = false
		cb_continuer.visible = false
	case 2
		pb_udi.visible = false
		cbx_archive.visible = false
		gb_4.visible = false
		gb_3.visible = false
		gb_2.visible = false
		gb_1.visible = false
		cb_recherche.visible = false
		cb_generer.visible = false
		dw_basic2.visible = false
		cb_fermer.visible = false
		cb_fiche.visible = false
		cb_enregistrer.visible = false
		cb_annuler.visible = false
		cb_supprimer.visible = false
		cb_ajouter.visible = false
		dw_liste.visible = false
		tab_stock.visible = false
		dw_basic.visible = false
		cb_annuler_sortie.visible = true
		cb_continuer.visible = true
		dw_sortie.bringtotop = true
		dw_sortie.visible = true
		dw_entree.visible = false
		cb_option.visible = false
		cb_impression.visible = false
		cb_annuler_entree.visible = false
		cb_valider.visible = false
	case 3
		pb_udi.visible = false
		gb_4.visible = true
		gb_3.visible = true
		gb_2.visible = true
		gb_1.visible = true
		cb_recherche.visible = true
		cb_generer.visible = true
		dw_basic2.visible = true
		cb_fermer.visible = true
		cb_fiche.visible = true
		cb_enregistrer.visible = true
		cb_annuler.visible = true
		cb_supprimer.visible = true
		cb_ajouter.visible = true
		dw_liste.visible = true
		tab_stock.visible = true
		dw_basic.visible = true
		cbx_archive.visible = true
		dw_entree.visible = false
		cb_option.visible = false
		cb_impression.visible = false
		cb_annuler_entree.visible = false
		cb_valider.visible = false
		dw_sortie.visible = false
		cb_annuler_sortie.visible = false
		cb_continuer.visible = false
end choose
end subroutine

public function long color (boolean checked);//effectue le retrieve de la liste des fournisseurs
//met en couleur ceux qui sont archivés si archivé est coché

integer i,result_retrieve
string archive, code_fournisseur

//retrieve
result_retrieve = dw_liste.retrieve(code_interne_local,code_praticien_local)
if result_retrieve > 0 then
	FOR i = result_retrieve to 1 STEP -1
		//analyse de chaque ligne
		code_fournisseur = dw_liste.getitemstring(i,"param_stock_fournisseur_code_fournisseur")
	
	  SELECT "param_stock_fournisseur"."archive"  
	    INTO :archive  
	    FROM "param_stock_fournisseur"  
	   WHERE ( "param_stock_fournisseur"."code_produit" = :code_interne_local ) AND  
         ( "param_stock_fournisseur"."code_fournisseur" = :code_fournisseur ) AND  
         ( "param_stock_fournisseur"."code_praticien" = :code_praticien_local )   ;

		if archive = "o" then
			if checked then
				dw_liste.setitem(i,"produit_couleur_texte",255)
			else
				dw_liste.deleterow(i)
			end if
		else
				dw_liste.setitem(i,"produit_couleur_texte",0)
		end if
	NEXT
end if

//presentation de la liste en fonction du nb de resultat et maj des variables d'instances
if dw_liste.rowcount() = 0 then
	dw_basic2.reset()
	tab_stock.tabpage_etat.dw_liste2.reset()
else
	code_fournisseur = dw_liste.getitemstring(dw_liste.getrow(),"param_stock_fournisseur_code_fournisseur")
	dw_basic2.retrieve(code_interne_local,code_fournisseur)
	tab_stock.tabpage_gestion.dw_fiche.retrieve(code_interne_local,code_fournisseur,code_praticien_local)
	if type_gestion = 1 then
		tab_stock.tabpage_etat.dw_liste2.retrieve(code_interne_local,code_fournisseur_courant,code_praticien_local)
	end if
	if type_gestion = 2 then
		tab_stock.tabpage_etat.dw_liste2.retrieve(code_interne_local,code_praticien_local)
	end if
end if

return(dw_liste.rowcount())
end function

on w_maj_stock_produit.create
int iCurrent
call super::create
this.cb_annuler_entree=create cb_annuler_entree
this.cb_valider=create cb_valider
this.cb_impression=create cb_impression
this.cb_option=create cb_option
this.cb_continuer=create cb_continuer
this.cb_annuler_sortie=create cb_annuler_sortie
this.cb_recherche=create cb_recherche
this.cb_fiche=create cb_fiche
this.cb_supprimer=create cb_supprimer
this.cb_fermer=create cb_fermer
this.cb_annuler=create cb_annuler
this.cb_ajouter=create cb_ajouter
this.cb_enregistrer=create cb_enregistrer
this.cb_generer=create cb_generer
this.dw_1=create dw_1
this.dw_code_barre=create dw_code_barre
this.dw_edition=create dw_edition
this.dw_titre=create dw_titre
this.cbx_archive=create cbx_archive
this.dw_entree=create dw_entree
this.dw_sortie=create dw_sortie
this.dw_basic2=create dw_basic2
this.uo_1=create uo_1
this.dw_liste=create dw_liste
this.tab_stock=create tab_stock
this.dw_basic=create dw_basic
this.pb_udi=create pb_udi
this.dw_stock_produit=create dw_stock_produit
this.gb_1=create gb_1
this.gb_2=create gb_2
this.gb_3=create gb_3
this.gb_4=create gb_4
this.gb_5=create gb_5
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_annuler_entree
this.Control[iCurrent+2]=this.cb_valider
this.Control[iCurrent+3]=this.cb_impression
this.Control[iCurrent+4]=this.cb_option
this.Control[iCurrent+5]=this.cb_continuer
this.Control[iCurrent+6]=this.cb_annuler_sortie
this.Control[iCurrent+7]=this.cb_recherche
this.Control[iCurrent+8]=this.cb_fiche
this.Control[iCurrent+9]=this.cb_supprimer
this.Control[iCurrent+10]=this.cb_fermer
this.Control[iCurrent+11]=this.cb_annuler
this.Control[iCurrent+12]=this.cb_ajouter
this.Control[iCurrent+13]=this.cb_enregistrer
this.Control[iCurrent+14]=this.cb_generer
this.Control[iCurrent+15]=this.dw_1
this.Control[iCurrent+16]=this.dw_code_barre
this.Control[iCurrent+17]=this.dw_edition
this.Control[iCurrent+18]=this.dw_titre
this.Control[iCurrent+19]=this.cbx_archive
this.Control[iCurrent+20]=this.dw_entree
this.Control[iCurrent+21]=this.dw_sortie
this.Control[iCurrent+22]=this.dw_basic2
this.Control[iCurrent+23]=this.uo_1
this.Control[iCurrent+24]=this.dw_liste
this.Control[iCurrent+25]=this.tab_stock
this.Control[iCurrent+26]=this.dw_basic
this.Control[iCurrent+27]=this.pb_udi
this.Control[iCurrent+28]=this.dw_stock_produit
this.Control[iCurrent+29]=this.gb_1
this.Control[iCurrent+30]=this.gb_2
this.Control[iCurrent+31]=this.gb_3
this.Control[iCurrent+32]=this.gb_4
this.Control[iCurrent+33]=this.gb_5
end on

on w_maj_stock_produit.destroy
call super::destroy
destroy(this.cb_annuler_entree)
destroy(this.cb_valider)
destroy(this.cb_impression)
destroy(this.cb_option)
destroy(this.cb_continuer)
destroy(this.cb_annuler_sortie)
destroy(this.cb_recherche)
destroy(this.cb_fiche)
destroy(this.cb_supprimer)
destroy(this.cb_fermer)
destroy(this.cb_annuler)
destroy(this.cb_ajouter)
destroy(this.cb_enregistrer)
destroy(this.cb_generer)
destroy(this.dw_1)
destroy(this.dw_code_barre)
destroy(this.dw_edition)
destroy(this.dw_titre)
destroy(this.cbx_archive)
destroy(this.dw_entree)
destroy(this.dw_sortie)
destroy(this.dw_basic2)
destroy(this.uo_1)
destroy(this.dw_liste)
destroy(this.tab_stock)
destroy(this.dw_basic)
destroy(this.pb_udi)
destroy(this.dw_stock_produit)
destroy(this.gb_1)
destroy(this.gb_2)
destroy(this.gb_3)
destroy(this.gb_4)
destroy(this.gb_5)
end on

event open;call super::open;////////////////////////////////////////////
//  Mise à jour des produits référencés   //
////////////////////////////////////////////

//pour pouvoir mettre à jour un produit dans cette fiche il faut qu'au moins un fournisseur et un praticien
//soit référencés pour ce produit dans la table des produits
//l'affichage de l'etat du stock change en fonction du type de gestion du produit
// pour un type de gestion 1 cad normale on affiche la liste des produits en stock, la fiche est particulière à un praticien pour un fournisseur
// pour un type de gestion 2 cad sans sortie on affiche le commentaire d'état du STOCK qui ne depend pas du fournisseur
//    cela impose des retrieve différents c'est pour cela qu'on stocke le type de gestion dans une variable d'instance

//on peut donc mettre à jour l'etat des stocks, effectuer des entrees sorties mais aussi
//ajouter un produit dans la gestion de stock d'un praticien
//lors de l'ajout on a le choix parmi les fournisseurs etant référencés pour ce produit dans la table des produits

long color_result //nb de resultat du retrieve des fournisseurs en fonction de l'archivage ou non
int j //pour la boucle for


struct = message.powerobjectparm //passage de param

//initialisation des variables d'instances
code_interne_local= struct.code_produit
code_praticien_local = struct.code_praticien
cbx_archive.checked = struct.archive

long compteur 
string v_prat
string v_praticien_par_defaut


boolean v_suite = true

dw_stock_produit.settransobject(sqlca)
// Attention ... si praticien commun, on va transformer .... 

if code_praticien_local = 'COMMUN' then
	
	v_suite = false
	
	 
	// PRATICIEN par défaut
	SELECT code INTO :v_praticien_par_defaut FROM prati where prati_defaut = '1';
	if isnull(v_praticien_par_defaut) then
		select top 1 code  INTO :v_praticien_par_defaut FROM prati where actif = 1 order by ordre_trie  ;
	end if
		
	
	
	
// combien de fournisseur et le code
  SELECT count(*) , min(code_praticien)    INTO :compteur , :v_prat
    FROM "param_stock_produit"  
   WHERE ( "param_stock_produit"."code_produit" = :code_interne_local )  ;
			
	if compteur = 1 and v_prat = 'COMMUN' then


		// On le bascule !!!!
		UPDATE  "param_stock_fournisseur"  SET "code_praticien" = :v_praticien_par_defaut
		WHERE ( "param_stock_fournisseur"."code_produit" = :code_interne_local ) AND  
		         ( "param_stock_fournisseur"."code_praticien" = 'COMMUN')  ;
		
		if sqlca.sqlcode = 0 then 
			
			UPDATE  "param_stock_produit"  SET "code_praticien" = :v_praticien_par_defaut
			WHERE ( "param_stock_produit"."code_produit" = :code_interne_local ) AND  
		         ( "param_stock_produit"."code_praticien" = 'COMMUN')  ;


			if sqlca.sqlcode = 0 then 
				commit ;
				code_praticien_local = v_praticien_par_defaut
				v_suite = true
			else
				Messagebox("ATTENTION","Erreur N°2 dans l'affection du produit au praticien : ~n~n"+sqlca.sqlerrtext)
				rollback ;
			end if
		else
			Messagebox("ATTENTION","Erreur N°1 dans l'affection du produit au praticien : ~n~n"+sqlca.sqlerrtext)
			rollback ;
		end if
	else
		
		// Pas qu'un praticien !!!
		 if compteur > 1 then
			// On supprime le fournisseu COMMUN et ou ouvre la fiche avec un autre fournisseur
			DELETE FROM   "param_stock_fournisseur"  WHERE ( "param_stock_fournisseur"."code_produit" = :code_interne_local ) AND  
						( "param_stock_fournisseur"."code_praticien" = 'COMMUN')  ;
						
			if sqlca.sqlcode = 0 then 
				
				DELETE FROM  "param_stock_produit"  WHERE ( "param_stock_produit"."code_produit" = :code_interne_local ) AND  
						( "param_stock_produit"."code_praticien" = 'COMMUN')  ;
			
				if sqlca.sqlcode = 0 then 
					
					commit ;
					v_suite = true
					
					  SELECT min(code_praticien)    INTO :code_praticien_local
						 FROM "param_stock_produit"  
						WHERE ( "param_stock_produit"."code_produit" = :code_interne_local )  ;
				else
					Messagebox("ATTENTION","Erreur N°2 dans la suppression de l'affectation COMMUN : ~n~n"+sqlca.sqlerrtext)
					rollback ;
				end if
			else
				Messagebox("ATTENTION","Erreur N°1 dans la suppression de l'affectation COMMUN : ~n~n"+sqlca.sqlerrtext)
				rollback ;
			end if
		 end if
	
	end if
else
	v_suite = true
end if

if v_suite then

  SELECT "param_stock_produit"."type_gestion"  
    INTO :type_gestion  
    FROM "param_stock_produit"  
   WHERE ( "param_stock_produit"."code_produit" = :code_interne_local ) AND  
         ( "param_stock_produit"."code_praticien" = :code_praticien_local );

	//connexion des dw 
	dw_basic.settransobject(sqlca) //fiche du produit , code interne, categorie, type, designation
	dw_basic2.settransobject(sqlca) //fiche du fournisseur , fournisseur, reference, prix, ..
	tab_stock.tabpage_gestion.dw_fiche.settransobject(sqlca) //fiche de la gestion de stock du produit reference pour la praticien
	tab_stock.tabpage_gestion.dw_fiche2.settransobject(sqlca) //fiche de la gestion de stock du produit par le praticien
	dw_liste.settransobject(sqlca) //liste des fournisseurs
	dw_entree.settransobject(sqlca) //fiche d'entree en stock d'un produit (invisible ici)
	dw_sortie.settransobject(sqlca) //fiche de sortie en stock d'un produit (invisible ici)
	dw_titre.settransobject(sqlca) //nom du praticien
	
	//initialiasation de la planche d'impression
	struct_format.imprimante_c4 = true
	struct_format.code = 1
	struct_format.nb_ligne = 8
	struct_format.nb_colonne = 3
	struct_format.nom_dw = 'dw_format_planche'
	struct_format.premiere_etiquette = 1
	
	//choix de la dw de liste2 en fonction du type de gestion du produit
	if type_gestion = 2 then
		tab_stock.tabpage_etat.dw_liste2.dataobject = 'dw_etat_stock_indicatif'
		tab_stock.tabpage_etat.cb_sortie.visible = false
		tab_stock.tabpage_etat.cb_impr_etiq.visible = false
		tab_stock.tabpage_etat.cb_impr_ste.visible = false
	end if
	tab_stock.tabpage_etat.dw_liste2.settransobject(sqlca)
	
	//evite le retrieve automatique de la dw fille de dw_basic
	dw_basic.getchild("produit_code_type_produit",idw_type)
	idw_type.settransobject(sqlca)
	idw_type.insertrow(0)
	
	//retrieve des infos globales au maj et ajout en fonction du passage de param
	dw_basic.retrieve(code_interne_local)
	idw_type.retrieve(dw_basic.getitemstring(dw_basic.getrow(),"type_produit_code_categorie_produit"))
	tab_stock.tabpage_gestion.dw_fiche2.retrieve(code_interne_local,code_praticien_local)
	dw_titre.insertrow(0)
	dw_titre.setitem(dw_titre.rowcount(),"code",code_praticien_local)
	
	//distinction entre un ajout de fournisseur et une maj
	if struct.ajout then
		//ajout
		ajouter()
	else
		
		//maj
		color_result = color(struct.archive)			// ATTENTION !!! Fonction spécifique présente ici
		
		if color_result > 0 then
			//normalement tjrs le cas
			code_fournisseur_courant = dw_liste.getitemstring(dw_liste.getrow(),"param_stock_fournisseur_code_fournisseur")
			dw_basic2.retrieve(code_interne_local,code_fournisseur_courant)
			tab_stock.tabpage_gestion.dw_fiche.retrieve(code_interne_local,code_fournisseur_courant,code_praticien_local)
			if type_gestion = 1 then
				tab_stock.tabpage_etat.dw_liste2.retrieve(code_interne_local,code_fournisseur_courant,code_praticien_local)
				dw_stock_produit.retrieve(code_interne_local,code_fournisseur_courant,code_praticien_local)
			end if
			if type_gestion = 2 then
				tab_stock.tabpage_etat.dw_liste2.retrieve(code_interne_local,code_praticien_local)
			end if
			FOR j = 1 to color_result
				if dw_liste.getitemstring(j,"param_stock_fournisseur_code_fournisseur") = struct.code_fournisseur then
					recuperer(j)
				end if
			NEXT
		else
			MessageBox("Attention","Problème dans la récupération des données")
		end if
	end if
end if

uo_1.taille(this)
centrer(this)


prems = true


colore_tous_objets_window(this, couleur_fond_datawindow)
colore_tous_objets_tab(tab_stock, couleur_fond_datawindow)
this.backcolor = couleur_fond_fenetre

// imprimante spécifique code_barre
dw_edition.Object.DataWindow.Print.PrinterName = get_imprimante_code_barre()
//dw_code_barre.Object.DataWindow.Print.PrinterName = get_imprimante_code_barre()


//this.backcolor = 16246738


end event

event resize;//if lenv_obj.ScreenHeight = 600 then
//	uo_800x600.retaille(this)
//	resize_tab_stock(prems)
//	prems = false
//end if


//uo_1.retaille(this)

end event

type p_fond from w_fenetre_arakis`p_fond within w_maj_stock_produit
end type

type cb_annuler_entree from uo_picturebutton_390x120 within w_maj_stock_produit
boolean visible = false
integer x = 2121
integer y = 1060
integer width = 494
integer taborder = 30
string text = "Annuler"
string iconname = "ACTIONS_abandonner.png"
end type

event clicked;call super::clicked;visi(3)
tab_stock.tabpage_etat.dw_liste2.retrieve(code_interne_local,code_fournisseur_courant,code_praticien_local)
end event

type cb_valider from uo_picturebutton_390x120 within w_maj_stock_produit
boolean visible = false
integer x = 1609
integer y = 1060
integer width = 494
integer taborder = 30
string text = "Valider"
string iconname = "ACTIONS_enregistrer.png"
end type

event clicked;call super::clicked;int rapport_update,quantite_livree
double code_barre

dw_entree.setitem(dw_entree.getrow(),"stock_produit_code_fournisseur",code_fournisseur_courant)

	SELECT max("code_barre")
		into :code_barre
		from "stock_produit";

if code_barre > 0 then
	code_barre = code_barre + 1
else
	code_barre = 10000
end if

dw_entree.setitem(dw_entree.getrow(),"stock_produit_code_barre",code_barre)

dw_entree.accepttext()

rapport_update = dw_entree.Update()

quantite_livree = dw_entree.getitemnumber(dw_entree.getrow(),"stock_produit_quantite")

if isnull(quantite_livree) or quantite_livree = 0 then
	MessageBox("ATTENTION","Vous devez entrer la quantite de produit livré !")
else
	if rapport_update = 1  then
		commit using sqlca ;
		maj_histo()
	else
		rollback using sqlca ;
	end if
end if
end event

type cb_impression from uo_picturebutton_390x120 within w_maj_stock_produit
boolean visible = false
integer x = 585
integer y = 1060
integer width = 494
integer taborder = 30
string text = "Imprimer"
string iconname = "ACTIONS_imprimer.png"
end type

event clicked;call super::clicked;integer nombre_etiquette, i
string nom_imprimante
string designation,code_produit
boolean is_c4

//nom_imprimante = dw_edition.Object.DataWindow.Printer
//is_c4 = match(nom_imprimante,'EasyCoder C4')
	
if struct_format.imprimante_c4 then
	dw_edition.reset()
	dw_edition.insertrow(0)
	double v_code_barre
	v_code_barre = dw_entree.getitemnumber(dw_entree.getrow(),"stock_produit_code_barre")
	dw_edition.setitem(1,"code_barre", v_code_barre)
	dw_edition.setitem(1,"date_etiq",dw_entree.getitemdate(dw_entree.getrow(),"historique_es_date"))
	code_produit = dw_entree.getitemstring(dw_entree.getrow(),"stock_produit_code_produit")
	  SELECT "produit"."designation"  
	    INTO :designation  
	    FROM "produit"  
	   WHERE "produit"."code_interne" = :code_produit    ;

	dw_edition.setitem(1,"designation",designation)

	nombre_etiquette = dw_entree.getitemnumber(dw_entree.getrow(),"stock_produit_quantite")

	if profileString(dir_ini+inifile_orthokis,"Stock_Tracabilité","imprimer_lot_etiquettes","N") = "O" then
		string v_numero_lot = ''
		select isnull(numero_lot,'') into :v_numero_lot from stock_produit where code_barre = :v_code_barre ;
		if v_numero_lot <> "" then
			// impression du N° de lot fournisseur
			dw_edition.modify("code_barre.y = 0")
			dw_edition.modify("code_barre.height = 124")
			dw_edition.modify("numero_lot.visible = 1")
			dw_edition.setitem(1,"numero_lot",v_numero_lot)
		end if
	end if
	
	
//	if is_c4 then
		FOR i = 1 to nombre_etiquette
			dw_edition.print()
		NEXT
//	else
//		MessageBox("Attention","   Vous devez sélectionner l'imprimante à rouleau d'étiquette   ~n           dans le paramètrage des imprimantes,~n~n           ou choisir une autre imprimante~n   dans les options d'impressions d'étiquettes ci dessus")
//	end if
else
//	if is_c4 then
//		MessageBox("Attention","          Vous êtes en mode d'impression classique ~n Vous ne pouvez pas imprimer sur une imprimante à rouleau d'étiquettes ~n             Sélectionner une imprimante classique ~n          ou changer les options d'impressions ci dessus") 
//	else
		imprimer_etiquettes()		
//	end if
end if
end event

type cb_option from uo_picturebutton_390x120 within w_maj_stock_produit
boolean visible = false
integer x = 1097
integer y = 1060
integer width = 494
integer taborder = 30
string text = "Options Imp."
end type

event clicked;call super::clicked;openwithparm(w_option_impression,struct_format)
struct_format= message.powerobjectparm
end event

type cb_continuer from uo_picturebutton_390x120 within w_maj_stock_produit
boolean visible = false
integer x = 1979
integer y = 1104
integer width = 494
integer taborder = 80
string text = "Continuer"
string iconname = "ACTIONS_valider.png"
end type

event clicked;call super::clicked;integer quantite_prec,quantite,quantite_stock_min
double code_barre
string code_lieu_utilisation
boolean v_suite
date v_date_peremption

dw_sortie.accepttext()
code_barre = dw_sortie.getitemnumber(dw_sortie.Getrow(),"stock_produit_code_barre")
quantite = dw_sortie.getitemnumber(dw_sortie.Getrow(),"historique_es_quantite")
code_lieu_utilisation = dw_sortie.getitemstring(dw_sortie.Getrow(),"historique_es_code_lieu_utilisation")
v_date_peremption = dw_sortie.getitemDate(dw_sortie.Getrow(),"stock_produit_date_peremption")

if Isnull(quantite) then
	messagebox("ATTENTION","Vous devez saisir une quantité à sortir du stock !")
else
	visi(3)
	
	//quantite precedente
	select "quantite_colisee"
		into :quantite_prec
		from "stock_produit"
		where code_barre = :code_barre;
	
	if isnull(quantite_prec) then
		quantite_prec = 0
	end if
	
	//quantite de stock minimale
	 SELECT "param_stock_produit"."qte_stock_min"  
    INTO :quantite_stock_min  
    FROM "param_stock_produit",   
         "stock_produit"  
   WHERE ( "param_stock_produit"."code_produit" = "stock_produit"."code_produit" ) and  
         ( ( "stock_produit"."code_barre" = :code_barre ) AND
			( "param_stock_produit"."code_praticien" = :code_praticien_local ) and
         ( "param_stock_produit"."code_praticien" = "stock_produit"."code_praticien" ) )   ;
	
	if isnull(quantite_stock_min) then
		quantite_stock_min = 1
	end if
	
	//calcul de la nouvelle quantite de ce produit
	quantite = quantite_prec - quantite
	
	if quantite < 0 then
		MessageBox("ATTENTION","La quantité à sortir du stock est supérieure à celle en stock.~n~nLa mise à jour du stock n'a pas eu lieu !")
		v_suite = false
	else
		v_suite = true
		// Alerte sur la date de péremption
		if v_date_peremption < today() then
			if Messagebox("ATTENTION","La date de péremption de ce produit est dépassée depuis "+string(daysafter(v_date_peremption, today()))+" jour(s).~n~n("+string(v_date_peremption)+")~n~nConfirmez-vous ?", Question!, YesNo!, 2) = 2 then
				v_suite = false
			end if
		end if

		if v_suite then
			//mise à jour de la quantite du produit
			update "stock_produit" set "quantite_colisee" = :quantite
				where code_barre = :code_barre;
			
			if sqlca.sqlcode = -1 then
				rollback;
				MessageBox("Erreur SQL","La mise à jour n'a pas eu lieu.")
			else
				commit;
				
					//mise a jour de l'historique du stock
					maj_histo_s()

				//on récupère la quantite en stock du produit
				
				  SELECT sum("stock_produit"."quantite_colisee")  
					 INTO :quantite  
					 FROM "stock_produit"  
					WHERE ( "stock_produit"."code_produit" = :code_interne_local ) AND  
							( "stock_produit"."code_praticien" = :code_praticien_local )   ;
				
				if quantite < quantite_stock_min then
					MessageBox("ATTENTION","La quantité en stock de ce produit est en dessous du seuil que vous avez fixé.~n~nPensez à recommander ce produit.")
				end if
			end if
		end if
		
		tab_stock.tabpage_etat.dw_liste2.retrieve(code_interne_local,code_fournisseur_courant,code_praticien_local)
	end if
end if


end event

type cb_annuler_sortie from uo_picturebutton_390x120 within w_maj_stock_produit
boolean visible = false
integer x = 1458
integer y = 1104
integer width = 494
integer height = 152
integer taborder = 80
string text = "Annuler"
string iconname = "ACTIONS_abandonner.png"
end type

event clicked;call super::clicked;visi(3)
end event

type cb_recherche from uo_picturebutton_780x120 within w_maj_stock_produit
integer x = 183
integer y = 2236
integer width = 777
integer taborder = 120
string text = "Nouvelle &Recherche"
string iconname = "ACTIONS_chercher.png"
end type

event clicked;call super::clicked;openwithparm(w_cherche_produit,"2")
end event

type cb_fiche from uo_picturebutton_390x120 within w_maj_stock_produit
integer x = 1783
integer y = 2236
integer width = 498
integer taborder = 110
string text = "&Fiche"
string iconname = "ACTIONS_stock_fiche.png"
end type

event clicked;call super::clicked;boolean ok_close = false

dw_basic2.accepttext()
tab_stock.tabpage_gestion.dw_fiche.accepttext()
tab_stock.tabpage_etat.dw_liste2.accepttext()
if dw_basic2.modifiedcount() > 0 or dw_basic2.deletedcount()>0 or tab_stock.tabpage_gestion.dw_fiche.modifiedcount() > 0 or tab_stock.tabpage_gestion.dw_fiche.deletedcount()>0 or tab_stock.tabpage_etat.dw_liste2.modifiedcount() > 0 or tab_stock.tabpage_etat.dw_liste2.deletedcount()>0 Then
	If MessageBox("ATTENTION","Vous avez fait des modifications sur le fichier !~n~nVoulez-vous vraiment fermer cette fenêtre sans enregistrer (et ainsi perdre les modifications) ?",Question!,YesNo!, 2) = 1 Then
		ok_close = true
	end if
else
	ok_close = true
end if

if ok_close then

	str_twostring v_struct
	
	//maj de la struct passée en param à la response window
	v_struct.code = dw_basic.getitemstring(dw_basic.getrow(),"produit_code_interne")
	v_struct.message = dw_basic.getitemstring(dw_basic.getrow(),"type_produit_code_categorie_produit")
//	struct.auxiliaire =  dw_choix.getitemstring(dw_choix.getrow(),"code")
	OpenWithParm(w_produit_fiche,v_struct)
	//close (parent)
end if

end event

type cb_supprimer from uo_picturebutton_780x120 within w_maj_stock_produit
integer x = 983
integer y = 2236
integer width = 777
integer taborder = 100
string text = "&Supprimer Fournisseur"
string iconname = "ACTIONS_supprimer.png"
end type

event clicked;call super::clicked;If MessageBox("ATTENTION","La suppression est définitive !~n~nVoulez-vous continuer ?",Question!,YesNo!) = 1 Then
	  DELETE FROM "param_stock_fournisseur"  
	   WHERE ( "param_stock_fournisseur"."code_produit" = :code_interne_local ) AND  
	         ( "param_stock_fournisseur"."code_fournisseur" = :code_fournisseur_courant ) AND  
   	      ( "param_stock_fournisseur"."code_praticien" = :code_praticien_local )   ;
	
	if sqlca.sqlcode = -1 then
		rollback;
		MessageBox("Attention","Cette fiche est reliée à d'autres informations dans la base de données vous ne pouvez l'effacer.")
	else
		commit;
		dw_liste.deleterow(dw_liste.getrow())
		tab_stock.tabpage_etat.dw_liste2.reset()
		recuperer(0)
	end if
end if


end event

type cb_fermer from uo_picturebutton_390x120 within w_maj_stock_produit
integer x = 2304
integer y = 2236
integer width = 498
integer taborder = 100
string text = "&Fermer"
string iconname = "ACTIONS_fermer.png"
end type

event clicked;call super::clicked;dw_basic2.accepttext()
tab_stock.tabpage_gestion.dw_fiche.accepttext()
tab_stock.tabpage_etat.dw_liste2.accepttext()
if dw_basic2.modifiedcount() > 0 or dw_basic2.deletedcount()>0 or tab_stock.tabpage_gestion.dw_fiche.modifiedcount() > 0 or tab_stock.tabpage_gestion.dw_fiche.deletedcount()>0 or tab_stock.tabpage_etat.dw_liste2.modifiedcount() > 0 or tab_stock.tabpage_etat.dw_liste2.deletedcount()>0 Then
	If MessageBox("ATTENTION","Vous avez fait des modifications sur le fichier !~n~nVoulez-vous vraiment fermer cette fenêtre sans enregistrer (et ainsi perdre les modifications) ?",Question!,YesNo!, 2) = 1 Then
		Close(parent)
	end if
else
	close(parent)
end if
end event

type cb_annuler from uo_picturebutton_390x120 within w_maj_stock_produit
integer x = 2304
integer y = 2084
integer width = 498
integer taborder = 90
string text = "&Annuler"
string iconname = "ACTIONS_annuler.png"
end type

event clicked;call super::clicked;integer row
boolean test

test = false

if dw_liste.rowcount() > 0 then
	code_fournisseur_courant = dw_liste.getitemstring(dw_liste.getrow(),"param_stock_fournisseur_code_fournisseur")
	test = true
	row = dw_liste.getrow()
end if

rollback ;

dw_basic2.dataobject = 'dw_fournisseur_produit_basic_data'
dw_basic2.settransobject(sqlca)
if lenv_obj.ScreenHeight = 600 then
	dw_basic2.Object.DataWindow.zoom = "80"
end if

if color(cbx_archive.checked) > 0 then
	if not test  then
		code_fournisseur_courant = dw_liste.getitemstring(dw_liste.getrow(),"param_stock_fournisseur_code_fournisseur")
	end if
	dw_basic2.retrieve(code_interne_local,code_fournisseur_courant)
	tab_stock.tabpage_gestion.dw_fiche.retrieve(code_interne_local,code_fournisseur_courant,code_praticien_local)
	if type_gestion = 1 then
		tab_stock.tabpage_etat.dw_liste2.retrieve(code_interne_local,code_fournisseur_courant,code_praticien_local)
	end if
	if type_gestion = 2 then
		tab_stock.tabpage_etat.dw_liste2.retrieve(code_interne_local,code_praticien_local)
	end if
else
	dw_basic2.reset()
	tab_stock.tabpage_gestion.dw_fiche.reset()
	tab_stock.tabpage_etat.dw_liste2.reset()
end if

colore_datawindow (dw_basic2)

end event

type cb_ajouter from uo_picturebutton_780x120 within w_maj_stock_produit
integer x = 983
integer y = 2084
integer width = 777
integer taborder = 100
string text = "&Ajouter Fournisseur"
string iconname = "ACTIONS_ajouter.png"
end type

event clicked;call super::clicked;dw_basic2.accepttext()
tab_stock.tabpage_gestion.dw_fiche.accepttext()
if dw_basic2.modifiedcount() > 0 or dw_basic2.deletedcount()>0 or tab_stock.tabpage_gestion.dw_fiche.modifiedcount() > 0 or tab_stock.tabpage_gestion.dw_fiche.deletedcount()>0 Then
	If MessageBox("ATTENTION","Vous avez fait des modifications sur le fichier !~n~nVoulez-vous vraiment fermer cette fenêtre sans enregistrer (et ainsi perdre les modifications) ?",Question!,YesNo!, 2) = 1 Then
		ajouter()
	end if
else
	ajouter()
end if
end event

type cb_enregistrer from uo_picturebutton_390x120 within w_maj_stock_produit
integer x = 1783
integer y = 2084
integer width = 498
integer taborder = 90
string text = "&Enregistrer"
boolean default = true
string iconname = "ACTIONS_enregistrer.png"
end type

event clicked;call super::clicked;int rapport_update1, rapport_update2,rapport_update3, row
boolean test

dw_basic2.accepttext()
tab_stock.tabpage_gestion.dw_fiche.accepttext()
tab_stock.tabpage_etat.dw_liste2.accepttext()
test = false

rapport_update1 = dw_basic2.Update()
rapport_update2 = tab_stock.tabpage_gestion.dw_fiche.Update()
rapport_update3 = tab_stock.tabpage_etat.dw_liste2.Update()

if rapport_update1 = 1 and rapport_update2 = 1 and rapport_update3 = 1 then
	commit using sqlca ;
else
	rollback using sqlca ;
end if

dw_basic2.dataobject = 'dw_fournisseur_produit_basic_data'
dw_basic2.settransobject(sqlca)
if lenv_obj.ScreenHeight = 600 then
	dw_basic2.Object.DataWindow.zoom = "80"
end if

tab_stock.tabpage_gestion.dw_fiche.reset()
tab_stock.tabpage_etat.dw_liste2.reset()

if dw_liste.rowcount() > 0 then
	code_fournisseur_courant = dw_liste.getitemstring(dw_liste.getrow(),"param_stock_fournisseur_code_fournisseur")
	test = true
	row = dw_liste.getrow()
end if

if color(cbx_archive.checked) > 0 then
	if not test then
		code_fournisseur_courant = dw_liste.getitemstring(dw_liste.getrow(),"param_stock_fournisseur_code_fournisseur")
	end if
	dw_basic2.retrieve(code_interne_local,code_fournisseur_courant)
	tab_stock.tabpage_gestion.dw_fiche.retrieve(code_interne_local,code_fournisseur_courant,code_praticien_local)
	if type_gestion = 1 then
		tab_stock.tabpage_etat.dw_liste2.retrieve(code_interne_local,code_fournisseur_courant,code_praticien_local)
	end if
	if type_gestion = 2 then
		tab_stock.tabpage_etat.dw_liste2.retrieve(code_interne_local,code_praticien_local)
	end if
else
	dw_basic2.reset()
	tab_stock.tabpage_gestion.dw_fiche.reset()
	tab_stock.tabpage_etat.dw_liste2.reset()
end if

end event

type cb_generer from uo_picturebutton_780x120 within w_maj_stock_produit
integer x = 183
integer y = 2084
integer width = 777
integer taborder = 80
string text = "&Générer selon Index"
string iconname = "ACTIONS_stock_generer_selon_index.png"
end type

event clicked;call super::clicked;dw_basic2.accepttext()
tab_stock.tabpage_gestion.dw_fiche.accepttext()
tab_stock.tabpage_etat.dw_liste2.accepttext()
if dw_basic2.modifiedcount() > 0 or dw_basic2.deletedcount()>0 or tab_stock.tabpage_gestion.dw_fiche.modifiedcount() > 0 or tab_stock.tabpage_gestion.dw_fiche.deletedcount()>0 or tab_stock.tabpage_etat.dw_liste2.modifiedcount() > 0 or tab_stock.tabpage_etat.dw_liste2.deletedcount()>0 Then
	If MessageBox("ATTENTION","Vous avez fait des modifications sur le fichier !~n~nCette fonction annulera vos modifications ~n~nVoulez-vous continuer sans enregistrer (et ainsi perdre les modifications) ?",Question!,YesNo!) = 1 Then
		generer()
	end if
else
	generer()
end if


end event

type dw_1 from datawindow within w_maj_stock_produit
string tag = "brush"
boolean visible = false
integer x = 224
integer y = 1188
integer width = 571
integer height = 600
integer taborder = 50
string title = "none"
string dataobject = "dw_fournisseur_produit_basic_data_ajout"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type dw_code_barre from datawindow within w_maj_stock_produit
boolean visible = false
integer x = 873
integer y = 164
integer width = 571
integer height = 600
integer taborder = 50
string title = "none"
string dataobject = "dw_code_barre"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type dw_edition from datawindow within w_maj_stock_produit
boolean visible = false
integer x = 2130
integer y = 108
integer width = 571
integer height = 600
integer taborder = 50
string title = "none"
string dataobject = "dw_edition_etiquettes_3"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type dw_titre from datawindow within w_maj_stock_produit
string tag = "brush"
integer x = 677
integer y = 52
integer width = 2153
integer height = 80
integer taborder = 20
string title = "none"
string dataobject = "dw_titre_fiche_produit"
boolean border = false
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type cbx_archive from checkbox within w_maj_stock_produit
integer x = 1289
integer y = 524
integer width = 453
integer height = 64
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 553648127
string text = "avec archivés"
end type

event clicked;color(this.checked)


end event

type dw_entree from datawindow within w_maj_stock_produit
string tag = "brush"
boolean visible = false
integer x = 219
integer y = 508
integer width = 2254
integer height = 552
integer taborder = 40
string title = "none"
string dataobject = "dw_historique_entree"
boolean border = false
boolean livescroll = true
end type

type dw_sortie from datawindow within w_maj_stock_produit
string tag = "brush"
boolean visible = false
integer x = 366
integer y = 488
integer width = 2085
integer height = 560
integer taborder = 40
string title = "none"
string dataobject = "dw_historique_sortie"
boolean border = false
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type dw_basic2 from datawindow within w_maj_stock_produit
string tag = "brush"
integer x = 302
integer y = 732
integer width = 2240
integer height = 328
integer taborder = 30
string title = "none"
string dataobject = "dw_fournisseur_produit_basic_data"
boolean controlmenu = true
boolean border = false
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event itemchanged;string temp

if dwo.name = 'prix' then
	dw_basic2.setitem(dw_basic.getrow(),"code_type_taxe","TTC")
end if
if dwo.name = 'code_fournisseur' then
	select "statut"
		into :temp
		from "fournisseur"
		where code = :data;
		
	if temp = "3" then
		dw_basic2.modify("code_fabricant.visible = true")
		dw_basic2.modify("code_fabricant_t.visible = true")
	else
		dw_basic2.modify("code_fabricant.visible = false")
		dw_basic2.modify("code_fabricant_t.visible = false")
		dw_basic2.setitem(row,"code_fabricant",data)
	end if
	dw_basic2.retrieve(code_interne_local,data)
	tab_stock.selecttab(2)
	tab_stock.tabpage_gestion.dw_fiche.reset()
	tab_stock.tabpage_gestion.dw_fiche.insertrow(0)
	tab_stock.tabpage_gestion.dw_fiche.setitem(tab_stock.tabpage_gestion.dw_fiche.getrow(),"code_produit",code_interne_local)
	tab_stock.tabpage_gestion.dw_fiche.setitem(tab_stock.tabpage_gestion.dw_fiche.getrow(),"code_fournisseur",data)
	tab_stock.tabpage_gestion.dw_fiche.setitem(tab_stock.tabpage_gestion.dw_fiche.getrow(),"code_praticien",code_praticien_local)
	tab_stock.tabpage_gestion.dw_fiche.setitem(tab_stock.tabpage_gestion.dw_fiche.getrow(),"qte_colisee",1)
	tab_stock.tabpage_gestion.dw_fiche.setitem(tab_stock.tabpage_gestion.dw_fiche.getrow(),"archive","n")
end if
end event

event retrieveend;if dw_basic2.getitemstring(dw_basic2.getrow(),"code_fournisseur") = dw_basic2.getitemstring(dw_basic2.getrow(),"code_fabricant") then
	dw_basic2.modify("code_fabricant.visible=false")
	dw_basic2.modify("code_fabricant_t.visible=false")
else
	dw_basic2.modify("code_fabricant.visible=true")
	dw_basic2.modify("code_fabricant_t.visible=true")	
end if
end event

type uo_1 from resize_fenetre within w_maj_stock_produit
boolean visible = false
integer x = 567
integer y = 864
integer taborder = 20
end type

on uo_1.destroy
call resize_fenetre::destroy
end on

type dw_liste from u_basedw within w_maj_stock_produit
string tag = "brush"
integer x = 1870
integer y = 224
integer width = 1120
integer height = 376
integer taborder = 40
string dataobject = "dw_fournisseur_liste"
boolean hscrollbar = false
boolean border = false
end type

event clicked;call super::clicked;if row > 0 then
	dw_basic2.accepttext()
	tab_stock.tabpage_gestion.dw_fiche.accepttext()
	if dw_basic2.modifiedcount() > 0 or dw_basic2.deletedcount()>0 or tab_stock.tabpage_gestion.dw_fiche.modifiedcount() > 0 or tab_stock.tabpage_gestion.dw_fiche.deletedcount()>0 Then
		If MessageBox("ATTENTION","Vous avez fait des modifications sur le fichier !~n~nVoulez-vous vraiment fermer cette fenêtre sans enregistrer (et ainsi perdre les modifications) ?",Question!,YesNo!, 2) = 1 Then
			recuperer(row)
		end if
	else
		recuperer(row)
	end if
end if
end event

type tab_stock from tab within w_maj_stock_produit
integer x = 142
integer y = 1200
integer width = 2853
integer height = 804
integer taborder = 30
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
boolean focusonbuttondown = true
boolean boldselectedtext = true
alignment alignment = center!
integer selectedtab = 1
tabpage_etat tabpage_etat
tabpage_gestion tabpage_gestion
end type

on tab_stock.create
this.tabpage_etat=create tabpage_etat
this.tabpage_gestion=create tabpage_gestion
this.Control[]={this.tabpage_etat,&
this.tabpage_gestion}
end on

on tab_stock.destroy
destroy(this.tabpage_etat)
destroy(this.tabpage_gestion)
end on

type tabpage_etat from userobject within tab_stock
integer x = 18
integer y = 108
integer width = 2816
integer height = 680
long backcolor = 16777215
string text = "Etat du Stock"
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
cb_imp_liste cb_imp_liste
cb_modifier cb_modifier
cb_entree cb_entree
cb_sortie cb_sortie
cb_impr_etiq cb_impr_etiq
cb_impr_ste cb_impr_ste
dw_liste2 dw_liste2
end type

on tabpage_etat.create
this.cb_imp_liste=create cb_imp_liste
this.cb_modifier=create cb_modifier
this.cb_entree=create cb_entree
this.cb_sortie=create cb_sortie
this.cb_impr_etiq=create cb_impr_etiq
this.cb_impr_ste=create cb_impr_ste
this.dw_liste2=create dw_liste2
this.Control[]={this.cb_imp_liste,&
this.cb_modifier,&
this.cb_entree,&
this.cb_sortie,&
this.cb_impr_etiq,&
this.cb_impr_ste,&
this.dw_liste2}
end on

on tabpage_etat.destroy
destroy(this.cb_imp_liste)
destroy(this.cb_modifier)
destroy(this.cb_entree)
destroy(this.cb_sortie)
destroy(this.cb_impr_etiq)
destroy(this.cb_impr_ste)
destroy(this.dw_liste2)
end on

type cb_imp_liste from uo_picturebutton_250x120 within tabpage_etat
integer x = 960
integer y = 552
integer width = 443
integer height = 112
integer taborder = 70
string text = "Impr. Liste"
end type

event clicked;call super::clicked;if dw_stock_produit.rowcount() > 0 then
	dw_stock_produit.print()
else
	Messagebox("ATTENTION", "Il n'y a pas de stock à imprimer pour ce produit !")
end if
end event

type cb_modifier from uo_picturebutton_250x120 within tabpage_etat
integer x = 2304
integer y = 552
integer width = 443
integer height = 112
integer taborder = 40
string text = "Modifier"
string iconname = "ACTIONS_modifier.png"
end type

event clicked;call super::clicked;str_commande structure
structure.code_prod = code_interne_local
structure.code_fourn = code_fournisseur_courant
structure.code_praticien = code_praticien_local
openwithparm(w_modification_entree_sortie,structure)
if type_gestion = 1 then
	tab_stock.tabpage_etat.dw_liste2.retrieve(code_interne_local,code_fournisseur_courant,code_praticien_local)
else
	if type_gestion = 2 then
		tab_stock.tabpage_etat.dw_liste2.retrieve(code_interne_local,code_praticien_local)
	end if
end if
end event

type cb_entree from uo_picturebutton_250x120 within tabpage_etat
integer x = 1856
integer y = 552
integer width = 443
integer height = 112
integer taborder = 70
string text = "Entrée"
string iconname = "lc_stepin.png"
end type

event clicked;call super::clicked;	string type_taxe, code_lieu_stockage, libelle
	double prix
	integer remise
	
	visi(1)
	dw_entree.enabled = true
	dw_entree.reset()
	dw_entree.insertrow(0)
	dw_entree.setitem(dw_sortie.getrow(),"stock_produit_code_produit",code_interne_local)
	
	SELECT "prix","code_type_taxe"
		into :prix, :type_taxe
		from "reference_produit"
		where code_produit = :code_interne_local and code_fournisseur = :code_fournisseur_courant;
	
		  SELECT "param_stock_fournisseur"."remise"  
			 INTO :remise  
			 FROM "param_stock_fournisseur"  
			WHERE ( "param_stock_fournisseur"."code_produit" = :code_interne_local ) AND  
					( "param_stock_fournisseur"."code_fournisseur" = :code_fournisseur_courant ) AND  
					( "param_stock_fournisseur"."code_praticien" = :code_praticien_local )   ;
		if isnull(remise) then
			remise = 0
		end if
		
		prix = prix *(1 - remise/100)
		if isnull(prix) then
			prix = 0
		end if
	
	  SELECT "param_stock_produit"."code_lieu_stockage_habituel"  
		 INTO :code_lieu_stockage  
		 FROM "param_stock_produit"  
		WHERE ( "param_stock_produit"."code_produit" = :code_interne_local ) AND  
				( "param_stock_produit"."code_praticien" = :code_praticien_local )   ;
	
	libelle = "Entrée manuelle"
	
	dw_entree.setitem(dw_entree.getrow(),"stock_produit_code_produit",code_interne_local)
	dw_entree.setitem(dw_entree.getrow(),"stock_produit_code_praticien",code_praticien_local)
	dw_entree.setitem(dw_entree.getrow(),"historique_es_utilisateur",utilisateur_code)
	dw_entree.setitem(dw_entree.getrow(),"historique_es_libelle",libelle)
	dw_entree.setitem(dw_entree.getrow(),"historique_es_poste_utilisation",utilisateur_code)
	dw_entree.setitem(dw_entree.getrow(),"historique_es_date",today())
	dw_entree.setitem(dw_entree.getrow(),"historique_es_prix",prix)
	dw_entree.setitem(dw_entree.getrow(),"historique_es_code_type_taxe",type_taxe)
	dw_entree.setitem(dw_entree.getrow(),"stock_produit_quantite",1)
	dw_entree.setitem(dw_entree.getrow(),"stock_produit_code_lieu_stockage",code_lieu_stockage)
	cb_impression.enabled ( false )
	cb_valider.enabled ( true )
	cb_annuler_entree.text = "A&nnuler"
	cb_annuler_entree.enabled ( true )
	dw_entree.setfocus()

end event

type cb_sortie from uo_picturebutton_250x120 within tabpage_etat
integer x = 1408
integer y = 552
integer width = 443
integer height = 112
integer taborder = 60
string text = "Sortie"
string iconname = "lc_stepout.png"
end type

event clicked;call super::clicked;if dw_liste2.rowcount() > 0 then
	visi(2)
	dw_sortie.reset()
	dw_sortie.retrieve(dw_liste2.getitemnumber(dw_liste2.getrow(),"code_barre"))
	dw_sortie.setitem(dw_sortie.getrow(),"historique_es_utilisateur",utilisateur_code)
	dw_sortie.setitem(dw_sortie.getrow(),"historique_es_poste_utilisation",utilisateur_code)
	dw_sortie.setitem(dw_sortie.getrow(),"historique_es_heure",now())
	dw_sortie.setitem(dw_sortie.getrow(),"historique_es_libelle","")
	dw_sortie.setitem(dw_sortie.getrow(),"historique_es_date",today())
	dw_sortie.setitem(dw_sortie.getrow(),"historique_es_quantite",1)
else
	MessageBox("ATTENTION","Vous devez sélectionner un produit !")
end if
end event

type cb_impr_etiq from uo_picturebutton_250x120 within tabpage_etat
integer x = 512
integer y = 552
integer width = 443
integer height = 112
integer taborder = 60
string text = "Impr. Etiq"
end type

event clicked;call super::clicked;if dw_liste2.rowcount() > 0 then

	double code_barre
	code_barre = tab_stock.tabpage_etat.dw_liste2.getitemnumber(tab_stock.tabpage_etat.dw_liste2.getrow(),"code_barre")
	openwithparm(w_impr_etiq,code_barre)
else
	MessageBox("Attention","Vous devez sélectionner un produit")
end if

end event

type cb_impr_ste from uo_picturebutton_250x120 within tabpage_etat
integer x = 64
integer y = 552
integer width = 443
integer height = 112
integer taborder = 60
string text = "&Etiq Sté"
end type

event clicked;call super::clicked;
if dw_liste2.rowcount() > 0 then
	
	double code_barre
	string en_cycle
	
	code_barre = tab_stock.tabpage_etat.dw_liste2.getitemnumber(tab_stock.tabpage_etat.dw_liste2.getrow(),"code_barre")
	
	  SELECT "stock_produit"."cycle_sterilisation"  
		 INTO :en_cycle  
		 FROM "stock_produit"  
		WHERE "stock_produit"."code_barre" = :code_barre   ;
	
	if en_cycle = 'o' Then
		If MessageBox("ATTENTION","Ce produit est dans un cycle de stérilisation !~n~nVoulez-vous vraiment mettre à jour la date de stérilisation de cet instrument ?",Question!,YesNo!) = 1 Then
			  UPDATE "stock_produit"  
				  SET "cycle_sterilisation" = 'n'  
				WHERE "stock_produit"."code_barre" = :code_barre   ;
				commit ;
			openwithparm(w_impr_etiq_sterilisation,code_barre)
		end if
	else
		  UPDATE "stock_produit"  
		  SET "cycle_sterilisation" = 'n'  
		WHERE "stock_produit"."code_barre" = :code_barre   ;
		commit ;
		openwithparm(w_impr_etiq_sterilisation,code_barre)
	end if

else
	MessageBox("Attention","Vous devez sélectionner un produit")
end if

end event

type dw_liste2 from u_basedw within tabpage_etat
string tag = "brush"
integer x = 311
integer y = 32
integer width = 2258
integer height = 504
integer taborder = 10
string dataobject = "dw_stock_produit_liste"
boolean hscrollbar = false
boolean border = false
end type

event clicked;if this.dataobject = "dw_stock_produit_liste" then
	If row > 0 Then
		This.SelectRow(0,False)
		This.SelectRow(row,True)
		This.setrow(row)
	else
		This.uf_ColSort()
	End If
end if
end event

event doubleclicked;call super::doubleclicked;cb_modifier.triggerevent(clicked!)
end event

type tabpage_gestion from userobject within tab_stock
integer x = 18
integer y = 108
integer width = 2816
integer height = 680
long backcolor = 16777215
string text = "Paramètres de gestion"
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
dw_fiche2 dw_fiche2
dw_fiche dw_fiche
end type

on tabpage_gestion.create
this.dw_fiche2=create dw_fiche2
this.dw_fiche=create dw_fiche
this.Control[]={this.dw_fiche2,&
this.dw_fiche}
end on

on tabpage_gestion.destroy
destroy(this.dw_fiche2)
destroy(this.dw_fiche)
end on

type dw_fiche2 from datawindow within tabpage_gestion
string tag = "brush"
integer x = 1422
integer y = 108
integer width = 1207
integer height = 448
integer taborder = 30
boolean enabled = false
string title = "none"
string dataobject = "dw_param_produit_stock"
boolean border = false
boolean livescroll = true
end type

type dw_fiche from datawindow within tabpage_gestion
string tag = "brush"
integer x = 238
integer y = 152
integer width = 818
integer height = 408
integer taborder = 20
string title = "none"
string dataobject = "dw_produit_gestion_data"
boolean border = false
boolean livescroll = true
end type

type dw_basic from datawindow within w_maj_stock_produit
string tag = "brush"
integer x = 105
integer y = 208
integer width = 1650
integer height = 404
integer taborder = 10
string title = "none"
string dataobject = "dw_produit_basic_data"
boolean border = false
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event itemchanged;if dwo.name = 'type_produit_code_categorie_produit' then
	idw_type.retrieve(data)
end if
end event

type pb_udi from picturebutton within w_maj_stock_produit
boolean visible = false
integer x = 402
integer y = 1060
integer width = 155
integer height = 144
integer taborder = 90
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "lc_gs1.png"
alignment htextalign = left!
string powertiptext = "Scan du code barre pour saisir l~'identifiant UDI, le code du produit et le numéro de lot"
end type

event clicked;
if dw_entree.rowcount() = 1 then

	open(w_udi_lecture)
	
	str_udi v_udi
	string v_identifiant_udi_lu, v_code_produit, v_identifiant_udi_produit
	boolean v_suite 
	
	v_udi = message.PowerObjectParm
	
	if not isnull(v_udi.di) then
		v_identifiant_udi_lu =string_non_nulle( v_udi.di)
		
		
		v_code_produit = dw_entree.getitemstring(1, "stock_produit_code_produit")
		
		// est ce le même que dans la fiche produit ???
		select gtin into :v_identifiant_udi_produit  from produit  
		where code_interne = :v_code_produit ;
		
		if isnull(v_identifiant_udi_produit) or len(trim(v_identifiant_udi_produit)) = 0 and v_identifiant_udi_lu <> "" then
			// on met à jour de suite la fiche du produit
			if messagebox("ATTENTION","Ce produit n'avait pas encore d'identifiant UDI. Nous allons automatiquement le mettre à jour avec celui lu : " + v_identifiant_udi_lu + ".~n~nConfirmez-vous qu'il s'agit du bon produit ?", Question!, YesNo!, 2) = 1 then
				v_suite = true
			else
				v_suite = false
			end if
			
		else
			// on verfie l'identifiant
			if v_identifiant_udi_lu <> v_identifiant_udi_produit then
				Messagebox("ATTENTION","L'identifiant UDI lu sur l'étiquette (" + v_identifiant_udi_lu + ") diffère de celui de la fiche produit (" + v_identifiant_udi_produit + ").")
				v_suite = false
			else
				v_suite = true
			end if
		end if
		
		if v_suite then
			// Mise à jour de la dw de réception
			dw_entree.setitem(1, "stock_produit_numero_lot", v_udi.numero_lot)
			if not isnull( v_udi.date_peremption) and v_udi.date_peremption <> date(1900,1,1) then
				dw_entree.setitem(1, "stock_produit_date_peremption", v_udi.date_peremption)
			end if
			if not isnull( v_udi.date_fabrication) and v_udi.date_fabrication <> date(1900,1,1) then
				dw_entree.setitem(1, "stock_produit_date_fabrication", v_udi.date_fabrication)
			end if
		end if
	end if



end if
end event

type dw_stock_produit from datawindow within w_maj_stock_produit
boolean visible = false
integer x = 2235
integer y = 964
integer width = 686
integer height = 400
integer taborder = 100
boolean bringtotop = true
string title = "none"
string dataobject = "dw_stock_produit"
boolean border = false
boolean livescroll = true
end type

type gb_1 from groupbox within w_maj_stock_produit
integer x = 78
integer y = 648
integer width = 2953
integer height = 456
integer taborder = 20
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 16777215
string text = "Référencement du produit selon le fournisseur"
borderstyle borderstyle = styleraised!
end type

type gb_2 from groupbox within w_maj_stock_produit
integer x = 1847
integer y = 152
integer width = 1184
integer height = 480
integer taborder = 40
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 16777215
string text = "Sélection Fournisseur"
end type

type gb_3 from groupbox within w_maj_stock_produit
integer x = 73
integer y = 152
integer width = 1751
integer height = 484
integer taborder = 30
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 16777215
string text = "Produit"
borderstyle borderstyle = styleraised!
end type

type gb_4 from groupbox within w_maj_stock_produit
integer x = 78
integer y = 1124
integer width = 2953
integer height = 932
integer taborder = 60
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 16777215
string text = "Gestion de stock du produit référencé"
end type

type gb_5 from groupbox within w_maj_stock_produit
integer x = 78
integer y = 8
integer width = 2953
integer height = 140
integer taborder = 40
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 16777215
end type

