$PBExportHeader$w_reception_commande.srw
forward
global type w_reception_commande from w_fenetre_arakis
end type
type pb_7 from uo_picturebutton_390x120_fermer within w_reception_commande
end type
type cb_modifier from uo_picturebutton_390x120 within w_reception_commande
end type
type cb_imprimer_toutes from uo_picturebutton_390x120 within w_reception_commande
end type
type pb_recherche from uo_picturebutton_390x120 within w_reception_commande
end type
type cb_receptionner from uo_picturebutton_390x120 within w_reception_commande
end type
type cb_option from uo_picturebutton_390x120 within w_reception_commande
end type
type cb_annuler from uo_picturebutton_390x120 within w_reception_commande
end type
type cb_valider from uo_picturebutton_390x120 within w_reception_commande
end type
type cb_impression from uo_picturebutton_390x120 within w_reception_commande
end type
type uo_tag from resize_tag within w_reception_commande
end type
type uo_1 from resize_fenetre within w_reception_commande
end type
type dw_impr_etiq from datawindow within w_reception_commande
end type
type dw_code_barre from datawindow within w_reception_commande
end type
type ole_photo_arakis003 from gearbox_fournisseur within w_reception_commande
end type
type dw_edition from datawindow within w_reception_commande
end type
type dw_liste from u_basedw within w_reception_commande
end type
type dw_fiche from datawindow within w_reception_commande
end type
type dw_basic from datawindow within w_reception_commande
end type
type gb_1 from groupbox within w_reception_commande
end type
type dw_data from datawindow within w_reception_commande
end type
type dw_controle_commande from datawindow within w_reception_commande
end type
type pb_annuler from uo_picturebutton_250x120 within w_reception_commande
end type
type pb_1 from uo_picturebutton_250x120 within w_reception_commande
end type
type pb_fournisseur from uo_picturebutton_390x120 within w_reception_commande
end type
type pb_udi from picturebutton within w_reception_commande
end type
type gb_2 from groupbox within w_reception_commande
end type
type gb_3 from groupbox within w_reception_commande
end type
type gb_4 from groupbox within w_reception_commande
end type
type gb_5 from groupbox within w_reception_commande
end type
end forward

global type w_reception_commande from w_fenetre_arakis
integer width = 4247
integer height = 2308
string title = "Réception de commande fournisseur"
pb_7 pb_7
cb_modifier cb_modifier
cb_imprimer_toutes cb_imprimer_toutes
pb_recherche pb_recherche
cb_receptionner cb_receptionner
cb_option cb_option
cb_annuler cb_annuler
cb_valider cb_valider
cb_impression cb_impression
uo_tag uo_tag
uo_1 uo_1
dw_impr_etiq dw_impr_etiq
dw_code_barre dw_code_barre
ole_photo_arakis003 ole_photo_arakis003
dw_edition dw_edition
dw_liste dw_liste
dw_fiche dw_fiche
dw_basic dw_basic
gb_1 gb_1
dw_data dw_data
dw_controle_commande dw_controle_commande
pb_annuler pb_annuler
pb_1 pb_1
pb_fournisseur pb_fournisseur
pb_udi pb_udi
gb_2 gb_2
gb_3 gb_3
gb_4 gb_4
gb_5 gb_5
end type
global w_reception_commande w_reception_commande

type variables
string code_fournisseur //fournisseur de la commande
string utilisateur //code utilisateur du dernier utilisateur ayant réalisé la commande
string code_praticien_local //praticien de la commande
string poste_utilisation //code utilisateur de l'utilisateur logué a la saisie
double numero_commande //numero de la commande
integer type_gestion_courant //type_de_gestion du produit en cours de reception
str_format_planche struct
environment	lenv_obj
boolean prems
end variables

forward prototypes
public subroutine maj_liste ()
public subroutine receptionner ()
public subroutine maj_histo ()
public subroutine resize_ole_tag (boolean test)
public subroutine resize_ole_800x600 (boolean test)
public subroutine imprimer_etiquettes (boolean toutes)
end prototypes

public subroutine maj_liste ();//mise a jour de la ligne de commande concernee
//on met a jour la quantite et eventuellement si la ligne est soldé ou pas

string code_produit_local,solde
int quantite,quantite_commandee
double code_barre

dw_fiche.accepttext()

code_produit_local = dw_fiche.getitemstring(dw_fiche.getrow(),"stock_produit_code_produit")
quantite_commandee = dw_liste.getitemnumber(dw_liste.getrow(),"ligne_commande_qte_commandee")

select "qte_livree" 
	into :quantite
	from "ligne_commande"
	where "code_produit" = :code_produit_local and "numero_commande" = :numero_commande;

if isnull(quantite) then
	quantite = 0
end if
quantite = quantite + dw_fiche.getitemnumber(dw_fiche.getrow(),"stock_produit_quantite")
if quantite >= quantite_commandee then
	solde = "o"
else
	solde = "n"
end if

	
update "ligne_commande" set qte_livree = :quantite, solde = :solde
	where "code_produit" = :code_produit_local and "numero_commande" = :numero_commande;

commit;

dw_liste.retrieve(numero_commande,code_fournisseur)
end subroutine

public subroutine receptionner ();//recupère le code produit de la ligne de commande sélectionner et lance la réception du produit
//on initialise la fiche d'entree en stock avec toutes les informations dont on dispose
//valeur d'initialisation :
//date :aujourdhui, prix : prix du produit dans la table reference produit
//libelle : reception commande n° X
//quantite livree : qte_commandee - qte deja livrée
//lieu de stockage : lieu de stockage habituel du produit
//utilisateur : utilisateur courant

string code_produit_local,code_lieu_stockage,libelle
double prix
integer quantite_livree,quantite_commandee,quantite

if dw_liste.rowcount() > 0 then
	dw_fiche.enabled = true
	dw_fiche.reset()
	dw_fiche.insertrow(0)
	
	code_produit_local = dw_liste.getitemstring(dw_liste.getrow(),"ligne_commande_code_produit")
	
	SELECT "prix"
		into :prix
		from "ligne_commande"
		where code_produit = :code_produit_local and numero_commande = :numero_commande;
	
	if isnull(prix) then
		prix = 0
	end if
	
  SELECT "param_stock_produit"."code_lieu_stockage_habituel","param_stock_produit"."type_gestion"  
    INTO :code_lieu_stockage,:type_gestion_courant
    FROM "param_stock_produit"  
   WHERE ( "param_stock_produit"."code_produit" = :code_produit_local ) AND  
         ( "param_stock_produit"."code_praticien" = :code_praticien_local );

	
	quantite_commandee = dw_liste.getitemnumber(dw_liste.getrow(),"ligne_commande_qte_commandee")
	quantite_livree = dw_liste.getitemnumber(dw_liste.getrow(),"ligne_commande_qte_livree")
	if isnull(quantite_livree) then
		quantite_livree = 0
	end if
	quantite = quantite_commandee - quantite_livree
	
	dw_fiche.setitem(dw_fiche.getrow(),"stock_produit_code_produit",code_produit_local)
	dw_fiche.setitem(dw_fiche.getrow(),"stock_produit_code_praticien",code_praticien_local)
	dw_fiche.setitem(dw_fiche.getrow(),"historique_es_date",today())
	dw_fiche.setitem(dw_fiche.getrow(),"historique_es_utilisateur",utilisateur)
	dw_fiche.setitem(dw_fiche.getrow(),"historique_es_poste_utilisation",poste_utilisation)
	dw_fiche.setitem(dw_fiche.getrow(),"historique_es_prix",prix)
	dw_fiche.setitem(dw_fiche.getrow(),"historique_es_code_type_taxe",'TTC')
	dw_fiche.setitem(dw_fiche.getrow(),"stock_produit_quantite",quantite)
	dw_fiche.setitem(dw_fiche.getrow(),"stock_produit_code_lieu_stockage",code_lieu_stockage)
	libelle = "Réception commande n° "+string(numero_commande)
	dw_fiche.setitem(dw_fiche.getrow(),"historique_es_libelle",libelle)
	cb_impression.enabled ( false )
	dw_fiche.object.stock_produit_code_barre.visible = true
	cb_valider.enabled ( true )
	cb_annuler.enabled ( true )
	pb_udi.enabled = true
	if type_gestion_courant = 1 then
		dw_fiche.object.stock_produit_code_barre.visible = true
	else
		dw_fiche.object.stock_produit_code_barre.visible = false
	end if
	dw_fiche.setfocus()
else
	messagebox("Attention","Vous devez sélectionner un produit")
end if
end subroutine

public subroutine maj_histo ();//mise a jour de l'historique des es suite a une validation de l'entree en stock d'un produit
//mise à jour du champ quantite_colisee de stock_produit
//on recupere les infos dans dw_fiche

string type_taxe,libelle
int quantite_livree,quantite_colisee,facteur_colisage
double code_barre,prix
date date_reception

//acquisition info du produit a entrer en stock
code_barre = dw_fiche.getitemnumber(dw_fiche.getrow(),"stock_produit_code_barre")
quantite_livree = dw_fiche.getitemnumber(dw_fiche.getrow(),"stock_produit_quantite")
date_reception = dw_fiche.getitemdate(dw_fiche.Getrow(),"historique_es_date")
prix = dw_fiche.getitemnumber(dw_fiche.getrow(),"historique_es_prix")
type_taxe = dw_fiche.getitemstring(dw_fiche.getrow(),"historique_es_code_type_taxe")
utilisateur = dw_fiche.getitemstring(dw_fiche.getrow(),"historique_es_utilisateur")
libelle = dw_fiche.getitemstring(dw_fiche.getrow(),"historique_es_libelle")

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
	//insertion dans la table des historiques d'es
	insert into "historique_es"
		("code_barre","code_es","date","prix","code_type_taxe","quantite","utilisateur","libelle","poste_utilisation", "heure")
		values (:code_barre,'e',:date_reception,:prix,:type_taxe,:quantite_colisee,:utilisateur,:libelle,:poste_utilisation, getdate());
	
	IF SQLCA.SQLCode = -1 THEN 
		MessageBox("SQL error", SQLCA.SQLErrText)
		rollback;
	ELSE
		commit;
		dw_fiche.enabled = false
		cb_valider.enabled ( false)
		cb_annuler.enabled ( false)
		pb_udi.enabled = false
		if type_gestion_courant = 1 then
			cb_impression.enabled ( true )
		end if
	END IF
end if
end subroutine

public subroutine resize_ole_tag (boolean test);if test then
	ole_photo_arakis003.x =ole_photo_arakis003.x * uo_tag.ratio
	ole_photo_arakis003.y =ole_photo_arakis003.y * uo_tag.ratio
end if
end subroutine

public subroutine resize_ole_800x600 (boolean test);if test then
	ole_photo_arakis003.x =ole_photo_arakis003.x * uo_1.ratio
	ole_photo_arakis003.y =ole_photo_arakis003.y * uo_1.ratio
end if
end subroutine

public subroutine imprimer_etiquettes (boolean toutes);integer nb_ligne_commande //nombre de ligne dans la commande
integer i,j,k,l
integer ligne_courante, colonne_courante
integer quantite_courante //quantite commandee du produit traité
integer nombre_entree_par_produit
integer nombre_produit_par_entree
str_code_barre tab[]
string code_produit,designation
date date_commande
double code_barre
string v_numero_lot




if toutes then

//	if profileString(dir_ini+inifile_orthokis,"Stock_Tracabilité","imprimer_lot_etiquettes","N") = "O" then
//		// impression du N° de lot fournisseur
//		dw_code_barre.modify("code_barre.y = 0")
//		dw_code_barre.modify("code_barre.height = 124")
//		dw_code_barre.modify("numero_lot.visible = 1")
//	end if
//
	
	//on imprime toutes les etiquettes de la commande
	  SELECT count(*)  
	    INTO :nb_ligne_commande
	    FROM "ligne_commande"  
	   WHERE "ligne_commande"."numero_commande" = :numero_commande   ;

	i=0
	date_commande = dw_basic.getitemdate(dw_basic.getrow(),"date_commande")
	for j = 1 to nb_ligne_commande
		quantite_courante = dw_liste.getitemnumber(j,"ligne_commande_qte_livree")
		code_produit = dw_liste.getitemstring(j,"ligne_commande_code_produit")
		designation = dw_liste.getitemstring(j,"produit_designation")
		nombre_entree_par_produit = dw_impr_etiq.retrieve(code_produit,code_fournisseur,code_praticien_local,numero_commande)
		FOR k=1 to nombre_entree_par_produit
				code_barre = dw_impr_etiq.getitemnumber(k,"code_barre")
				nombre_produit_par_entree = dw_impr_etiq.getitemnumber(k,"quantite")
				v_numero_lot = dw_impr_etiq.getitemString(k,"numero_lot")
				FOR l = 1 to nombre_produit_par_entree
					i =i+1
					tab[i].code_barre = code_barre
					tab[i].code_produit = code_produit
					tab[i].designation = designation
					tab[i].jour = date_commande
					tab[i].numero_lot = v_numero_lot
				NEXT
		NEXT
	next
else
	//on imprime juste les etiquettes correspondant a une entrée
	nombre_entree_par_produit = dw_fiche.getitemnumber(dw_fiche.getrow(),"stock_produit_quantite")
	code_barre = dw_fiche.getitemnumber(dw_fiche.getrow(),"stock_produit_code_barre")
	code_produit = dw_fiche.getitemstring(dw_fiche.getrow(),"stock_produit_code_produit")
	date_commande = dw_fiche.getitemdate(dw_fiche.getrow(),"historique_es_date")
	v_numero_lot = string_non_nulle(dw_fiche.getitemstring(dw_fiche.getrow(),"stock_produit_numero_lot"))
	
	
	
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
		tab[i].numero_lot = v_numero_lot
	NEXT
end if

//initialisation du remplissage de dw_format
ligne_courante = int((struct.premiere_etiquette - 1)/struct.nb_colonne) + 1
colonne_courante = struct.premiere_etiquette - (ligne_courante - 1)*struct.nb_colonne
dw_code_barre.reset()
FOR j = 1 to ligne_courante
	dw_code_barre.insertrow(0)
NEXT


//if profileString(dir_ini+inifile_orthokis,"Stock_Tracabilité","imprimer_lot_etiquettes","N") = "O" then
//	if v_numero_lot <> "" then
//		// impression du N° de lot fournisseur
//		dw_code_barre.modify("code_barre.y = 0")
//		dw_code_barre.modify("code_barre.height = 124")
//		dw_code_barre.modify("numero_lot.visible = 1")
//	end if
//end if

//remplissage des etiquettes
FOR j = 1 to i
	dw_code_barre.setitem(ligne_courante,"code_barre"+string(colonne_courante),tab[j].code_barre)
	dw_code_barre.setitem(ligne_courante,"designation"+string(colonne_courante),tab[j].designation)
	dw_code_barre.setitem(ligne_courante,"date"+string(colonne_courante),tab[j].jour)
	dw_code_barre.setitem(ligne_courante,"code_produit"+string(colonne_courante),tab[j].code_produit)
	dw_code_barre.setitem(ligne_courante,"numero_lot"+string(colonne_courante),tab[j].numero_lot)
	if colonne_courante = struct.nb_colonne then
		colonne_courante = 1
		if ligne_courante = struct.nb_ligne then
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
struct.premiere_etiquette = 1




end subroutine

on w_reception_commande.create
int iCurrent
call super::create
this.pb_7=create pb_7
this.cb_modifier=create cb_modifier
this.cb_imprimer_toutes=create cb_imprimer_toutes
this.pb_recherche=create pb_recherche
this.cb_receptionner=create cb_receptionner
this.cb_option=create cb_option
this.cb_annuler=create cb_annuler
this.cb_valider=create cb_valider
this.cb_impression=create cb_impression
this.uo_tag=create uo_tag
this.uo_1=create uo_1
this.dw_impr_etiq=create dw_impr_etiq
this.dw_code_barre=create dw_code_barre
this.ole_photo_arakis003=create ole_photo_arakis003
this.dw_edition=create dw_edition
this.dw_liste=create dw_liste
this.dw_fiche=create dw_fiche
this.dw_basic=create dw_basic
this.gb_1=create gb_1
this.dw_data=create dw_data
this.dw_controle_commande=create dw_controle_commande
this.pb_annuler=create pb_annuler
this.pb_1=create pb_1
this.pb_fournisseur=create pb_fournisseur
this.pb_udi=create pb_udi
this.gb_2=create gb_2
this.gb_3=create gb_3
this.gb_4=create gb_4
this.gb_5=create gb_5
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.pb_7
this.Control[iCurrent+2]=this.cb_modifier
this.Control[iCurrent+3]=this.cb_imprimer_toutes
this.Control[iCurrent+4]=this.pb_recherche
this.Control[iCurrent+5]=this.cb_receptionner
this.Control[iCurrent+6]=this.cb_option
this.Control[iCurrent+7]=this.cb_annuler
this.Control[iCurrent+8]=this.cb_valider
this.Control[iCurrent+9]=this.cb_impression
this.Control[iCurrent+10]=this.uo_tag
this.Control[iCurrent+11]=this.uo_1
this.Control[iCurrent+12]=this.dw_impr_etiq
this.Control[iCurrent+13]=this.dw_code_barre
this.Control[iCurrent+14]=this.ole_photo_arakis003
this.Control[iCurrent+15]=this.dw_edition
this.Control[iCurrent+16]=this.dw_liste
this.Control[iCurrent+17]=this.dw_fiche
this.Control[iCurrent+18]=this.dw_basic
this.Control[iCurrent+19]=this.gb_1
this.Control[iCurrent+20]=this.dw_data
this.Control[iCurrent+21]=this.dw_controle_commande
this.Control[iCurrent+22]=this.pb_annuler
this.Control[iCurrent+23]=this.pb_1
this.Control[iCurrent+24]=this.pb_fournisseur
this.Control[iCurrent+25]=this.pb_udi
this.Control[iCurrent+26]=this.gb_2
this.Control[iCurrent+27]=this.gb_3
this.Control[iCurrent+28]=this.gb_4
this.Control[iCurrent+29]=this.gb_5
end on

on w_reception_commande.destroy
call super::destroy
destroy(this.pb_7)
destroy(this.cb_modifier)
destroy(this.cb_imprimer_toutes)
destroy(this.pb_recherche)
destroy(this.cb_receptionner)
destroy(this.cb_option)
destroy(this.cb_annuler)
destroy(this.cb_valider)
destroy(this.cb_impression)
destroy(this.uo_tag)
destroy(this.uo_1)
destroy(this.dw_impr_etiq)
destroy(this.dw_code_barre)
destroy(this.ole_photo_arakis003)
destroy(this.dw_edition)
destroy(this.dw_liste)
destroy(this.dw_fiche)
destroy(this.dw_basic)
destroy(this.gb_1)
destroy(this.dw_data)
destroy(this.dw_controle_commande)
destroy(this.pb_annuler)
destroy(this.pb_1)
destroy(this.pb_fournisseur)
destroy(this.pb_udi)
destroy(this.gb_2)
destroy(this.gb_3)
destroy(this.gb_4)
destroy(this.gb_5)
end on

event open;call super::open;//////////////////////////////////////////////
///        Réception des commandes         ///
//////////////////////////////////////////////

integer rapport_share //au cas ou le partage de buffers entre dw_basic(entete commande) et dw_data(fiche de la livraison) se passe mal

if UI_V2020 then
	str_param_string param
	param = message.PowerObjectParm
	numero_commande = double(param.param)
else
	numero_commande = message.doubleparm //passage de param par le numero de la commande
end if

dw_basic.settransobject(sqlca) //dw de l'entete de la commande

// Supprimé en V2011 car inutile, pas de MAJ des dw
//rapport_share = dw_basic.ShareData(dw_data) //partage de buffers entre l'entete et la livraison
//if rapport_share <> 1 then
//	messagebox ("Sharedata error","error sharing data with dw_data")
//end if
//
dw_liste.settransobject(sqlca) //ligne de la commande
dw_fiche.settransobject(sqlca) //entree en stock
dw_impr_etiq.settransobject(sqlca) //pour l'impression de toutes les etiquettes
dw_data.settransobject(sqlca)

dw_basic.retrieve(numero_commande) //retrieve de l'entete et de la livraison(grace au partage)
dw_data.retrieve(numero_commande) //retrieve de l'entete et de la livraison(grace au partage)

// controle de la commande
dw_controle_commande.settransobject(sqlca) 
dw_controle_commande.retrieve(numero_commande)


//initialisation des variables d'instances
code_fournisseur = dw_basic.getitemstring(dw_basic.getrow(),"code_fournisseur")
utilisateur = dw_basic.getitemstring(dw_basic.getrow(),"utilisateur")
poste_utilisation = dw_basic.getitemstring(dw_basic.getrow(),"poste_utilisation")
code_praticien_local = dw_basic.getitemstring(dw_basic.getrow(),"code_praticien")
dw_liste.retrieve(numero_commande,code_fournisseur)
struct.imprimante_c4 = true
struct.code = 1
struct.nb_ligne = 8
struct.nb_colonne = 3
struct.nom_dw = 'dw_format_planche'
struct.premiere_etiquette = 1

//preparation de la fenetre
cb_impression.enabled ( false)
cb_imprimer_toutes.enabled ( not(struct.imprimante_c4) )
cb_valider.enabled (false)
cb_annuler.enabled (false)
pb_udi.enabled = false

ole_photo_arakis003.dossier_fournisseur = code_fournisseur
ole_photo_arakis003.triggerevent(constructor!)
if not ole_photo_arakis003.ole_image.object.pagesloadedcount > 0 then
	ole_photo_arakis003.visible = false
end if

uo_1.taille(this)

///*  Get environment  */
//If GetEnvironment ( lenv_obj ) = -1 Then Return -1
//
///*  Determine current screen resolution and validate  */
//if lenv_obj.ScreenHeight = 600 then
//	uo_800x600.taille(this)
//else
//	uo_tag.taille(this)
//end if
//
//prems = true

//this.backcolor = 16246738 //bleu un peu plus clair que sky



// imprimante spécifique code_barre
dw_edition.Object.DataWindow.Print.PrinterName = get_imprimante_code_barre()
//dw_code_barre.Object.DataWindow.Print.PrinterName = get_imprimante_code_barre()

end event

event resize;call super::resize;uo_1.retaille(this)

double ratio

if uo_1.ratio < 1.5 then
	ratio = uo_1.ratio
else
	ratio = uo_1.ratio * 0.9
end if
		
dw_fiche.Object.DataWindow.zoom = string(int(ratio*100 ))
dw_liste.Object.DataWindow.zoom = string(int(ratio*100 ))
dw_data.Object.DataWindow.zoom = string(int(ratio*100 ))
dw_controle_commande.Object.DataWindow.zoom = string(int(ratio*100 ))


//if lenv_obj.ScreenHeight = 600 then
//	uo_800x600.retaille(this)
//	resize_ole_800x600(prems)
//else
//	uo_tag.retaille(this)
//	resize_ole_tag(prems)
//end if
//prems = false
end event

type p_fond from w_fenetre_arakis`p_fond within w_reception_commande
integer y = 808
end type

type pb_7 from uo_picturebutton_390x120_fermer within w_reception_commande
integer x = 3575
integer y = 1344
integer width = 576
integer taborder = 60
end type

event clicked;fermer_fenetre(parent)
end event

type cb_modifier from uo_picturebutton_390x120 within w_reception_commande
integer x = 2990
integer y = 1344
integer width = 576
integer taborder = 110
string text = "&Modifier"
string iconname = "ACTIONS_modifier.png"
end type

event clicked;call super::clicked;string code_produit_courant
str_commande v_struct
if dw_liste.rowcount() > 0 then
	code_produit_courant = dw_liste.getitemstring(dw_liste.getrow(),"ligne_commande_code_produit")
	v_struct.code_prod = code_produit_courant
	v_struct.code_fourn = code_fournisseur
	v_struct.numero = numero_commande
	openwithparm(w_modification_entree,v_struct)
	dw_liste.retrieve(numero_commande,code_fournisseur)
else
	messagebox("Attention","Vous devez sélectionner un produit")
end if
end event

type cb_imprimer_toutes from uo_picturebutton_390x120 within w_reception_commande
integer x = 1234
integer y = 1344
integer width = 576
integer taborder = 110
string text = "Imp. Etiq."
string iconname = "ACTIONS_etiquettes.png"
end type

event clicked;call super::clicked;imprimer_etiquettes(true)
end event

type pb_recherche from uo_picturebutton_390x120 within w_reception_commande
integer x = 64
integer y = 1344
integer width = 576
integer taborder = 110
string text = "&Recherche"
string iconname = "ACTIONS_chercher.png"
end type

event clicked;call super::clicked;w_mdi_2020.uo_powerdock.of_openDocument(w_recherche_commande_reception, "Recherche Commande", m_orthokis_2020.m_gestion_de_stock.m_reception_commande.toolbarItemName)
fermer_fenetre(parent)

end event

type cb_receptionner from uo_picturebutton_390x120 within w_reception_commande
integer x = 2405
integer y = 1344
integer width = 576
integer taborder = 110
string text = "&Réceptionner"
string iconname = "lc_stepin.png"
end type

event clicked;call super::clicked;receptionner()
end event

type cb_option from uo_picturebutton_390x120 within w_reception_commande
integer x = 649
integer y = 1344
integer width = 576
integer taborder = 100
string text = "Options Imp."
string iconname = "ACTIONS_imprimer.png"
end type

event clicked;call super::clicked;openwithparm(w_option_impression,struct)
struct = message.powerobjectparm
if struct.imprimante_c4 then
	cb_imprimer_toutes.enabled ( false)
else
	cb_imprimer_toutes.enabled ( true)
end if
end event

type cb_annuler from uo_picturebutton_390x120 within w_reception_commande
integer x = 2286
integer y = 1996
integer width = 480
integer taborder = 90
string text = "&Annuler"
string iconname = "ACTIONS_annuler.png"
end type

event clicked;call super::clicked;dw_fiche.reset()
cb_annuler.enabled (false)
cb_valider.enabled (false)
pb_udi.enabled = false
end event

type cb_valider from uo_picturebutton_390x120 within w_reception_commande
integer x = 2286
integer y = 1852
integer width = 480
integer taborder = 80
string text = "&Valider"
string iconname = "ACTIONS_enregistrer.png"
end type

event clicked;call super::clicked;int rapport_update,quantite_livree
double code_barre,prix
date date_reception

dw_fiche.setitem(dw_fiche.getrow(),"stock_produit_code_fournisseur",code_fournisseur)
dw_fiche.setitem(dw_fiche.getrow(),"stock_produit_numero_commande",numero_commande)
utilisateur = dw_fiche.getitemstring(dw_fiche.getrow(),"historique_es_utilisateur")

	SELECT max("code_barre")
		into :code_barre
		from "stock_produit";

if code_barre > 0 then
	code_barre = code_barre + 1
else
	code_barre = 10000
end if

dw_fiche.setitem(dw_fiche.getrow(),"stock_produit_code_barre",code_barre)
dw_fiche.setitem(dw_fiche.getrow(),"stock_produit_code_patient",dw_basic.GetItemNumber(1, "code_patient"))

dw_fiche.accepttext()

quantite_livree = dw_fiche.getitemnumber(dw_fiche.getrow(),"stock_produit_quantite")
if isnull(quantite_livree) or quantite_livree = 0 then
	MessageBox("Attention","Vous devez entrer la quantite de produit livré")
else
	rapport_update = dw_fiche.Update()
	
	if rapport_update = 1  then
		commit using sqlca ;
		maj_liste()
		maj_histo()
	else
		rollback using sqlca ;
	end if
end if
end event

type cb_impression from uo_picturebutton_390x120 within w_reception_commande
integer x = 2286
integer y = 1700
integer width = 480
integer height = 152
integer taborder = 70
string text = "&Impression"
string iconname = "ACTIONS_imprimer.png"
end type

event clicked;call super::clicked;integer nombre_etiquette, i
//string nom_imprimante
string designation,code_produit
string v_numero_lot
//boolean is_c4

//nom_imprimante = dw_edition.Object.DataWindow.Printer
//is_c4 = match(nom_imprimante,'EasyCoder C4')
//	
if struct.imprimante_c4 then
	dw_edition.reset()
	dw_edition.insertrow(0)
	dw_edition.setitem(1,"code_barre",dw_fiche.getitemnumber(dw_fiche.getrow(),"stock_produit_code_barre"))
	dw_edition.setitem(1,"date_etiq",dw_fiche.getitemdate(dw_fiche.getrow(),"historique_es_date"))
	code_produit = dw_fiche.getitemstring(dw_fiche.getrow(),"stock_produit_code_produit")
	v_numero_lot = string_non_nulle(dw_fiche.getitemstring(dw_fiche.getrow(),"stock_produit_numero_lot"))
	dw_edition.setitem(1,"numero_lot",v_numero_lot)
	  SELECT "produit"."designation"  
	    INTO :designation  
	    FROM "produit"  
	   WHERE "produit"."code_interne" = :code_produit    ;

	dw_edition.setitem(1,"designation",designation)

	nombre_etiquette = dw_fiche.getitemnumber(dw_fiche.getrow(),"stock_produit_quantite")
	
	if profileString(dir_ini+inifile_orthokis,"Stock_Tracabilité","imprimer_lot_etiquettes","N") = "O" then
		if v_numero_lot <> "" then
			// impression du N° de lot fournisseur
			dw_edition.modify("code_barre.y = 0")
			dw_edition.modify("code_barre.height = 124")
			dw_edition.modify("numero_lot.visible = 1")
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
		imprimer_etiquettes(false)		
//	end if
end if
end event

type uo_tag from resize_tag within w_reception_commande
boolean visible = false
integer x = 1605
integer y = 408
integer taborder = 30
end type

on uo_tag.destroy
call resize_tag::destroy
end on

type uo_1 from resize_fenetre within w_reception_commande
boolean visible = false
integer x = 2409
integer y = 508
integer taborder = 30
end type

on uo_1.destroy
call resize_fenetre::destroy
end on

type dw_impr_etiq from datawindow within w_reception_commande
boolean visible = false
integer x = 247
integer y = 824
integer width = 571
integer height = 600
integer taborder = 60
string title = "none"
string dataobject = "dw_liste_impr_toutes_etiquettes"
boolean border = false
boolean livescroll = true
end type

type dw_code_barre from datawindow within w_reception_commande
boolean visible = false
integer x = 1472
integer y = 1292
integer width = 571
integer height = 600
integer taborder = 60
string title = "none"
string dataobject = "dw_code_barre"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type ole_photo_arakis003 from gearbox_fournisseur within w_reception_commande
integer x = 2784
integer y = 40
integer width = 928
integer height = 528
integer taborder = 20
boolean border = false
long backcolor = 82042848
end type

on ole_photo_arakis003.destroy
call gearbox_fournisseur::destroy
end on

type dw_edition from datawindow within w_reception_commande
boolean visible = false
integer x = 1774
integer y = 1084
integer width = 805
integer height = 452
integer taborder = 60
string dataobject = "dw_edition_etiquettes_3"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type dw_liste from u_basedw within w_reception_commande
string tag = "grid brush"
integer x = 87
integer y = 724
integer width = 4046
integer height = 608
integer taborder = 50
string dataobject = "dw_reception_ligne_commande"
boolean border = false
borderstyle borderstyle = stylebox!
end type

event doubleclicked;call super::doubleclicked;if row > 0 then
	receptionner()
end if
end event

event itemchanged;string solde,code_produit_courant

code_produit_courant = dw_liste.getitemstring(row,"ligne_commande_code_produit")
if dwo.name = "ligne_commande_solde" then
	
	UPDATE "ligne_commande"  
     	SET "solde" = :data  
   WHERE ( "ligne_commande"."numero_commande" = :numero_commande ) AND  
       ( "ligne_commande"."code_produit" = :code_produit_courant );
		
	commit;
end if
		

end event

event rbuttondown;if row > 0 then
	This.SelectRow(0,False)
	This.SelectRow(row,True)
	This.setrow(row)
	OpenMenuProduit_liste_commande(this)
end if
end event

type dw_fiche from datawindow within w_reception_commande
string tag = "brush"
integer x = 119
integer y = 1588
integer width = 2167
integer height = 532
integer taborder = 60
string title = "none"
string dataobject = "dw_historique_entree"
boolean border = false
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type dw_basic from datawindow within w_reception_commande
string tag = "brush "
integer x = 64
integer y = 52
integer width = 2734
integer height = 580
integer taborder = 30
string title = "none"
string dataobject = "dw_reception_basic_data"
boolean border = false
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event buttonclicked;
string ls_object


ls_Object = String(dwo.name)
	
choose case ls_Object	
	case  "b_fournisseur" 
		OpenWithParm(w_fournisseur_fiche,this.getitemstring(this.getrow(),"code_fournisseur"))

end choose



end event

type gb_1 from groupbox within w_reception_commande
integer x = 50
integer width = 2775
integer height = 640
integer taborder = 10
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 15780518
string text = "Entête de la Commande"
end type

type dw_data from datawindow within w_reception_commande
string tag = "brush"
integer x = 3013
integer y = 1664
integer width = 1083
integer height = 408
integer taborder = 30
boolean enabled = false
string title = "none"
string dataobject = "dw_reception_livraison_data"
boolean border = false
boolean livescroll = true
borderstyle borderstyle = styleraised!
end type

type dw_controle_commande from datawindow within w_reception_commande
string tag = "brush"
integer x = 2875
integer y = 104
integer width = 1056
integer height = 328
integer taborder = 40
boolean bringtotop = true
string title = "none"
string dataobject = "dw_commande_controle"
boolean border = false
boolean livescroll = true
end type

type pb_annuler from uo_picturebutton_250x120 within w_reception_commande
integer x = 3063
integer y = 440
integer width = 443
integer height = 132
integer taborder = 40
boolean bringtotop = true
string text = "&Annuler"
string iconname = "ACTIONS_annuler.png"
end type

event clicked;call super::clicked;

dw_controle_commande.retrieve(numero_commande)



end event

type pb_1 from uo_picturebutton_250x120 within w_reception_commande
integer x = 3506
integer y = 440
integer width = 443
integer height = 132
integer taborder = 50
boolean bringtotop = true
string text = "&Enregistrer"
string iconname = "ACTIONS_enregistrer.png"
end type

event clicked;call super::clicked;
dw_controle_commande.accepttext()


if dw_controle_commande.update() = 1 then
	commit ;
else
	MessageBox("ATTENTION","Erreur dans l'enrgistrement du contrôle de la commande !")
	rollback ;
end if
end event

type pb_fournisseur from uo_picturebutton_390x120 within w_reception_commande
integer x = 1819
integer y = 1344
integer width = 576
integer taborder = 120
boolean bringtotop = true
string text = "&Fournisseur"
string iconname = "ACTIONS_praticiens.png"
end type

event clicked;call super::clicked;

string v_fournisseur

if dw_basic.rowcount() > 0 then
	v_fournisseur = dw_basic.getItemString( 1, "code_fournisseur")
	
	
	OpenWithParm(w_fournisseur_fiche, v_fournisseur)
	parent.triggerevent(resize! )
	
end if
end event

type pb_udi from picturebutton within w_reception_commande
integer x = 2450
integer y = 1572
integer width = 155
integer height = 132
integer taborder = 80
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "lc_gs1.png"
alignment htextalign = left!
string powertiptext = "Scan du code barre pour saisir les informations UDI"
end type

event clicked;
if dw_fiche.rowcount() = 1 then

	open(w_udi_lecture)
	
	str_udi v_udi
	string v_identifiant_udi_lu, v_code_produit, v_identifiant_udi_produit
	boolean v_suite 
	
	v_udi = message.PowerObjectParm
	
	if not isnull(v_udi.di) then
		v_identifiant_udi_lu = v_udi.di
		
		
		v_code_produit = dw_fiche.getitemstring(1, "stock_produit_code_produit")
		
		// est ce le même que dans la fiche produit ???
		select gtin into :v_identifiant_udi_produit  from produit  
		where code_interne = :v_code_produit ;
		
		if isnull(v_identifiant_udi_produit) or len(trim(v_identifiant_udi_produit)) = 0 then
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
			dw_fiche.setitem(1, "stock_produit_numero_lot", v_udi.numero_lot)
			if not isnull( v_udi.date_peremption) and v_udi.date_peremption <> date(1900,1,1) then
				dw_fiche.setitem(1, "stock_produit_date_peremption", v_udi.date_peremption)
			end if
			if not isnull( v_udi.date_fabrication) and v_udi.date_fabrication <> date(1900,1,1) then
				dw_fiche.setitem(1, "stock_produit_date_fabrication", v_udi.date_fabrication)
			end if
		end if
	end if



end if
end event

type gb_2 from groupbox within w_reception_commande
integer x = 2862
integer y = 1528
integer width = 1307
integer height = 628
integer taborder = 20
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 15780518
string text = "Livraison"
end type

type gb_3 from groupbox within w_reception_commande
integer x = 46
integer y = 648
integer width = 4123
integer height = 864
integer taborder = 40
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 15780518
string text = "Lignes de la Commande"
end type

type gb_4 from groupbox within w_reception_commande
integer x = 50
integer y = 1524
integer width = 2743
integer height = 628
integer taborder = 50
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 15780518
string text = "Produit en réception"
end type

type gb_5 from groupbox within w_reception_commande
integer x = 2866
integer y = 40
integer width = 1298
integer height = 596
integer taborder = 20
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 15780518
string text = "Contrôle de la Commande"
end type

