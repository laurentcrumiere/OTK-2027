$PBExportHeader$w_modification_entree_sortie.srw
forward
global type w_modification_entree_sortie from w_fenetre_arakis
end type
type cb_annuler from uo_picturebutton_250x120 within w_modification_entree_sortie
end type
type cb_enregistrer from uo_picturebutton_250x120 within w_modification_entree_sortie
end type
type cb_supprimer from uo_picturebutton_250x120 within w_modification_entree_sortie
end type
type cb_modifier from uo_picturebutton_250x120 within w_modification_entree_sortie
end type
type cb_rechercher from uo_picturebutton_390x120 within w_modification_entree_sortie
end type
type pb_1 from uo_picturebutton_390x120_fermer within w_modification_entree_sortie
end type
type dw_sortie from datawindow within w_modification_entree_sortie
end type
type em_resultat from editmask within w_modification_entree_sortie
end type
type st_resultat from statictext within w_modification_entree_sortie
end type
type em_date_debut from editmask within w_modification_entree_sortie
end type
type em_date_fin from editmask within w_modification_entree_sortie
end type
type st_1 from statictext within w_modification_entree_sortie
end type
type st_2 from statictext within w_modification_entree_sortie
end type
type gb_1 from groupbox within w_modification_entree_sortie
end type
type gb_2 from groupbox within w_modification_entree_sortie
end type
type gb_3 from groupbox within w_modification_entree_sortie
end type
type dw_fiche from datawindow within w_modification_entree_sortie
end type
type dw_entree from datawindow within w_modification_entree_sortie
end type
type dw_liste from u_basedw within w_modification_entree_sortie
end type
type uo_1 from resize_fenetre within w_modification_entree_sortie
end type
type gb_4 from groupbox within w_modification_entree_sortie
end type
type gb_5 from groupbox within w_modification_entree_sortie
end type
end forward

global type w_modification_entree_sortie from w_fenetre_arakis
integer width = 3296
integer height = 2136
string title = "Modification des entrées sorties"
windowtype windowtype = response!
boolean center = true
cb_annuler cb_annuler
cb_enregistrer cb_enregistrer
cb_supprimer cb_supprimer
cb_modifier cb_modifier
cb_rechercher cb_rechercher
pb_1 pb_1
dw_sortie dw_sortie
em_resultat em_resultat
st_resultat st_resultat
em_date_debut em_date_debut
em_date_fin em_date_fin
st_1 st_1
st_2 st_2
gb_1 gb_1
gb_2 gb_2
gb_3 gb_3
dw_fiche dw_fiche
dw_entree dw_entree
dw_liste dw_liste
uo_1 uo_1
gb_4 gb_4
gb_5 gb_5
end type
global w_modification_entree_sortie w_modification_entree_sortie

type variables
string code_produit_local //code produit du produit entré ou sorti en stock à modifier
string code_fournisseur_local //fournisseur du produit entré ou sorti en stock à modifier
string code_praticien_local //praticien du produit entré ou sorti en stock à modifier
integer type_gestion //type de gestion du produit

double numero_commande_courant //numero de la commande du produit de la ligne d'historique qu'on traite
boolean from_commande //pour savoir si l'entrée est directe ou d'une commande

double color_authorized = 0 //noir
double color_unauthorized =255 //rouge

date date_sortie_initiale //pour la maj des historiques de sortie

datawindowchild idw_type //dw fille de dw_fiche
end variables

forward prototypes
public subroutine modifier_entree ()
public subroutine visi (boolean visi)
public subroutine supprimer_entree ()
public subroutine maj_stock (double numero_commande)
public subroutine maj_histo_entree ()
public subroutine color ()
public subroutine maj_stock_histo_sortie ()
public subroutine supprimer_sortie ()
end prototypes

public subroutine modifier_entree ();
end subroutine

public subroutine visi (boolean visi);dw_entree.visible = visi
//cb_option.visible = visi
//cb_impression.visible = visi
dw_sortie.visible = not visi
//cb_option.enabled = true
//cb_impression.enabled = true
cb_enregistrer.enabled ( true)
cb_annuler.enabled ( true)
end subroutine

public subroutine supprimer_entree ();//suppression d'une entrée en stock de produit

//il faut supprimer en premier lieu l'historique d'entrée du produit
//puis le produit en stock
//et ensuite maj la ligne de commande si le produit a été entré lors d'une commande

integer quantite, quantite_livree, quantite_commandee
double code_barre
string solde

if dw_liste.rowcount() > 0 then
	
	//acquisition des donnees pour la mise a jour de la ligne de commande
	quantite = dw_liste.getitemnumber(dw_liste.getrow(),"stock_produit_quantite")
	code_barre = dw_liste.getitemnumber(dw_liste.getrow(),"stock_produit_code_barre")
	numero_commande_courant = dw_liste.getitemnumber(dw_liste.getrow(),"stock_produit_numero_commande")
	
	if isnull(numero_commande_courant) or numero_commande_courant = 0 then
		from_commande = false
	else
		from_commande = true
		select "qte_commandee", "qte_livree"
			into :quantite_commandee, :quantite_livree
			from "ligne_commande"
			where "code_produit" = :code_produit_local and "numero_commande" = :numero_commande_courant;
		
		quantite = quantite_livree - quantite
		
		if quantite >= quantite_commandee then
			solde = 'o'
		else
			solde = 'n'
		end if
	end if
	//suppression de l'historique
	delete from "historique_es" where "code_barre" = :code_barre and "code_es"='e';
	
	IF SQLCA.SQLCode = -1 THEN 
		MessageBox("SQL error", SQLCA.SQLErrText)
		rollback;
	else
		//suppression du produit en stock
		delete from "stock_produit" where "code_barre" = :code_barre;
		IF SQLCA.SQLCode = -1 THEN 
			MessageBox("SQL error", SQLCA.SQLErrText)
			rollback;
		else
			commit;
			if from_commande then
				//maj de la ligne de commande : quantite et solde
				update "ligne_commande" set qte_livree = :quantite, solde = :solde
					where "code_produit" = :code_produit_local and "numero_commande" = :numero_commande_courant;
				
				commit;
			end if
			//tout c'est bien passé on retrieve la nouvelle liste
			color()
		end if
	END IF
else
	messagebox("ATTENTION","Vous devez sélectionner un produit !")
end if
end subroutine

public subroutine maj_stock (double numero_commande);//mise a jour de la ligne de commande
//idem maj_liste() de reception commande

//la mise a jour de la quantite en stock se fait par update de dw_entree

string solde
int quantite,quantite_initiale,quantite_modifiee, quantite_commandee,facteur_colisage
double code_barre_courant

dw_entree.accepttext()

select "qte_commandee" 
	into :quantite_commandee
	from "ligne_commande"
	where "code_produit" = :code_produit_local and "numero_commande" = :numero_commande;

if isnull(quantite_commandee) then
	quantite_commandee = 0
end if

select "qte_livree" 
	into :quantite
	from "ligne_commande"
	where "code_produit" = :code_produit_local and "numero_commande" = :numero_commande;

if isnull(quantite) then
	quantite = 0
end if

code_barre_courant = dw_entree.getitemnumber(dw_entree.getrow(),"stock_produit_code_barre")
facteur_colisage = dw_entree.getitemnumber(dw_entree.getrow(),"stock_produit_facteur_colisage")

  SELECT "historique_es"."quantite"  
    INTO :quantite_initiale  
    FROM "historique_es"  
   WHERE ( "historique_es"."code_barre" = :code_barre_courant ) AND  
         ( "historique_es"."code_es" = 'e' )   ;

quantite_initiale = integer(quantite_initiale / facteur_colisage)
quantite = quantite + dw_entree.getitemnumber(dw_entree.getrow(),"stock_produit_quantite") - quantite_initiale
if quantite >= quantite_commandee then
	solde = 'o'
else
	solde = 'n'
end if

update "ligne_commande" set qte_livree = :quantite, solde = :solde
	where "code_produit" = :code_produit_local and "numero_commande" = :numero_commande;

if sqlca.sqlcode = -1 then
	rollback;
	MessageBox("Erreur SQL",SQLCA.SQLErrText)
else
	commit;
end if
end subroutine

public subroutine maj_histo_entree ();//maj de l'historique des entree
//idem fonction de la fenetre reception commande

string code_utilisateur,type_taxe,libelle
int quantite_livree,quantite_colisee,facteur_colisage
double code_barre,prix
date date_reception

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
	update "historique_es" set "date"=:date_reception,"prix"=:prix,"code_type_taxe"=:type_taxe,
				"quantite"=:quantite_colisee,"utilisateur"=:code_utilisateur,"libelle"=:libelle
	where "code_barre"=:code_barre and "code_es" = 'e';
	
	if sqlca.sqlcode = -1 then
		rollback;
		MessageBox("Erreur SQL",SQLCA.SQLErrText)
	else
		commit;	
		dw_entree.enabled = false
		cb_enregistrer.enabled ( false)
		cb_annuler.enabled ( false)
		if type_gestion = 1 then
//			cb_impression.enabled = true
//			cb_option.enabled = true
		end if
		color()
	
//		cb_impression.Setfocus()
	end if
end if
end subroutine

public subroutine color ();//fonction effectuant le retrieve de la liste en fonction des paramètres de recherche
//et paramétrant la couleur des lignes
//     en noir si la modification est possible cad pour une sortie ou une entrée pour laquelle
//					il n'y a jamais eu de sortie
//		 en rouge si la modification est indertide cad une entrée pour laquelle il y a eu des sorties


double code_barre_courant //code barre d'une ligne d'historique d'es
int nb_row //nb de ligne récupérer
int i //pour la boucle for
int compteur //pour le result du select du nombre de sortie pour une entrée 
date date_min, date_max //date de debut et de fin de periode de recherche
string code_es //pour savoir si la ligne est une entrée ou une sortie

//initialisation des variables
date_min = date(em_date_debut.text)
date_max = date(em_date_fin.text)

nb_row = dw_liste.retrieve(code_produit_local,code_fournisseur_local,code_praticien_local,date_min,date_max)
if nb_row > 0 then
	em_resultat.text = string(nb_row)
	FOR i = 1 to nb_row
		code_es = dw_liste.getitemstring(i,"historique_es_code_es")
		if code_es = 's' then
			dw_liste.setitem(i,"produit_couleur_texte",color_authorized)
		else
			code_barre_courant = dw_liste.getitemnumber(i,"stock_produit_code_barre")
			  SELECT count(*) 
			    INTO :compteur  
			    FROM "historique_es"  
			   WHERE ( "historique_es"."code_es" = 's' ) AND  
			         ( "historique_es"."code_barre" = :code_barre_courant )   ;
			if compteur > 0 then
				dw_liste.setitem(i,"produit_couleur_texte",color_unauthorized)
			else
				dw_liste.setitem(i,"produit_couleur_texte",color_authorized)
			end if
		end if
	NEXT
else
	em_resultat.text = 'Aucun'
	st_resultat.text = 'Résultat'
end if
end subroutine

public subroutine maj_stock_histo_sortie ();//maj de l'historique des sorties et du stock produit

string code_utilisateur,libelle,code_lieu_utilisation
int quantite, quantite_initiale,quantite_en_stock
double code_barre
date date_sortie
time heure

//on recupere les valeurs modifiées
code_barre = dw_sortie.getitemnumber(dw_sortie.getrow(),"stock_produit_code_barre")
quantite = dw_sortie.getitemnumber(dw_sortie.getrow(),"historique_es_quantite")
date_sortie = dw_sortie.getitemdate(dw_sortie.Getrow(),"historique_es_date")
code_utilisateur = dw_sortie.getitemstring(dw_sortie.getrow(),"historique_es_utilisateur")
libelle = dw_sortie.getitemstring(dw_sortie.getrow(),"historique_es_libelle")
code_lieu_utilisation = dw_sortie.getitemstring(dw_sortie.getrow(),"historique_es_code_lieu_utilisation")
heure = dw_sortie.getitemtime(dw_sortie.getrow(),"historique_es_heure")

//on recupere la qte initiale de l'historique de sortie pour la maj de la qte en stock
  SELECT "historique_es"."quantite"  
    INTO :quantite_initiale  
    FROM "historique_es"  
   WHERE ( "historique_es"."code_barre" = :code_barre ) AND  
         ( "historique_es"."code_es" = 's' ) AND  
         ( "historique_es"."date" = :date_sortie_initiale ) AND  
         ( "historique_es"."heure" = :heure )   ;

if isnull(quantite_initiale) then
	quantite_initiale = 0
end if

//on recupere la quantite en stock initiale
  SELECT "stock_produit"."quantite_colisee"  
    INTO :quantite_en_stock  
    FROM "stock_produit"  
   WHERE "stock_produit"."code_barre" = :code_barre   ;

if isnull(quantite_en_stock) then
	quantite_en_stock = 0
end if

//on calcule la nouvelle quantité en stock
quantite_en_stock = quantite_en_stock - quantite + quantite_initiale

//on met a jour l'historique de sortie et le stock
  UPDATE "historique_es"  
     SET "date" = :date_sortie,   
         "quantite" = :quantite,   
         "utilisateur" = :code_utilisateur,   
         "libelle" = :libelle,   
         "code_lieu_utilisation" = :code_lieu_utilisation  
   WHERE ( "historique_es"."code_barre" = :code_barre ) AND  
         ( "historique_es"."code_es" = 's' ) AND  
         ( "historique_es"."date" = :date_sortie_initiale ) AND  
         ( "historique_es"."heure" = :heure )   ;

  UPDATE "stock_produit"  
     SET "quantite_colisee" = :quantite_en_stock  
   WHERE "stock_produit"."code_barre" = :code_barre;

if sqlca.sqlcode = -1 then
	rollback;
	MessageBox("Erreur SQL",SQLCA.SQLErrText)
else
	commit;	
	color()
	dw_sortie.enabled = false
end if
end subroutine

public subroutine supprimer_sortie ();//suppression d'une sortie de stock d'un produit

//il suffit de supprimer la ligne d'historique de sortie du produit

double code_barre
date date_sortie
time heure
integer quantite,quantite_initiale


if dw_liste.rowcount() > 0 then
	code_barre = dw_liste.getitemnumber(dw_liste.getrow(),"stock_produit_code_barre")
	date_sortie = dw_liste.getitemdate(dw_liste.getrow(),"historique_es_date")
	heure = dw_liste.getitemtime(dw_liste.getrow(),"historique_es_heure")
	quantite = dw_liste.getitemnumber(dw_liste.getrow(),"historique_es_quantite")
	
	//on recupere la quantite en stock initiale
	  SELECT "stock_produit"."quantite_colisee"  
	    INTO :quantite_initiale  
	    FROM "stock_produit"  
	   WHERE "stock_produit"."code_barre" = :code_barre   ;

	if isnull(quantite_initiale) then
		quantite_initiale = 0
	end if
	//calcul nouvelle qte en stock
	quantite = quantite_initiale + quantite
	
	//suppression de l'historique
	delete from "historique_es" 
		where "code_barre" = :code_barre and "code_es"='s' and "date"=:date_sortie and "heure"=:heure ;
	
	IF SQLCA.SQLCode = -1 THEN 
		MessageBox("SQL error", SQLCA.SQLErrText)
		rollback;
	else	
		//maj de la quantite en stock
		  UPDATE "stock_produit"  
		     SET "quantite_colisee" = :quantite  
		   WHERE "stock_produit"."code_barre" = :code_barre     ;
		if sqlca.sqlcode = -1 then
			rollback;
			MessageBox("SQL error", SQLCA.SQLErrText)
		else
			commit;
			color()
		end if
	END IF
else
	messagebox("ATTENTION","Vous devez sélectionner un produit !")
end if
end subroutine

on w_modification_entree_sortie.create
int iCurrent
call super::create
this.cb_annuler=create cb_annuler
this.cb_enregistrer=create cb_enregistrer
this.cb_supprimer=create cb_supprimer
this.cb_modifier=create cb_modifier
this.cb_rechercher=create cb_rechercher
this.pb_1=create pb_1
this.dw_sortie=create dw_sortie
this.em_resultat=create em_resultat
this.st_resultat=create st_resultat
this.em_date_debut=create em_date_debut
this.em_date_fin=create em_date_fin
this.st_1=create st_1
this.st_2=create st_2
this.gb_1=create gb_1
this.gb_2=create gb_2
this.gb_3=create gb_3
this.dw_fiche=create dw_fiche
this.dw_entree=create dw_entree
this.dw_liste=create dw_liste
this.uo_1=create uo_1
this.gb_4=create gb_4
this.gb_5=create gb_5
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_annuler
this.Control[iCurrent+2]=this.cb_enregistrer
this.Control[iCurrent+3]=this.cb_supprimer
this.Control[iCurrent+4]=this.cb_modifier
this.Control[iCurrent+5]=this.cb_rechercher
this.Control[iCurrent+6]=this.pb_1
this.Control[iCurrent+7]=this.dw_sortie
this.Control[iCurrent+8]=this.em_resultat
this.Control[iCurrent+9]=this.st_resultat
this.Control[iCurrent+10]=this.em_date_debut
this.Control[iCurrent+11]=this.em_date_fin
this.Control[iCurrent+12]=this.st_1
this.Control[iCurrent+13]=this.st_2
this.Control[iCurrent+14]=this.gb_1
this.Control[iCurrent+15]=this.gb_2
this.Control[iCurrent+16]=this.gb_3
this.Control[iCurrent+17]=this.dw_fiche
this.Control[iCurrent+18]=this.dw_entree
this.Control[iCurrent+19]=this.dw_liste
this.Control[iCurrent+20]=this.uo_1
this.Control[iCurrent+21]=this.gb_4
this.Control[iCurrent+22]=this.gb_5
end on

on w_modification_entree_sortie.destroy
call super::destroy
destroy(this.cb_annuler)
destroy(this.cb_enregistrer)
destroy(this.cb_supprimer)
destroy(this.cb_modifier)
destroy(this.cb_rechercher)
destroy(this.pb_1)
destroy(this.dw_sortie)
destroy(this.em_resultat)
destroy(this.st_resultat)
destroy(this.em_date_debut)
destroy(this.em_date_fin)
destroy(this.st_1)
destroy(this.st_2)
destroy(this.gb_1)
destroy(this.gb_2)
destroy(this.gb_3)
destroy(this.dw_fiche)
destroy(this.dw_entree)
destroy(this.dw_liste)
destroy(this.uo_1)
destroy(this.gb_4)
destroy(this.gb_5)
end on

event open;call super::open;///////////////////////////////////////////////////////////////
//   Modification des entrée sortie dans maj_stock produit   //
///////////////////////////////////////////////////////////////


str_commande struct //pour le passage de param
date date_min, date_max //pour le retrieve
int nb_row //nombre de ligne recuperee

dw_fiche.settransobject(sqlca) //fiche du produit(code interne, categorie ..)
dw_liste.settransobject(sqlca) //liste des entrees sorties
dw_entree.settransobject(sqlca) //fiche de modification d'une entrée
dw_sortie.Settransobject(sqlca) //fiche de modification d'une sortie

//passage de param
struct = message.powerobjectparm

//initialisation des variables d'instances
code_produit_local = struct.code_prod
code_fournisseur_local = struct.code_fourn
code_praticien_local = struct.code_praticien

  SELECT "param_stock_produit"."type_gestion"  
    INTO :type_gestion  
    FROM "param_stock_produit"  
   WHERE ( "param_stock_produit"."code_produit" = :code_produit_local ) AND  
         ( "param_stock_produit"."code_praticien" = :code_praticien_local )   ;

//initialisation des variables de la window
em_date_debut.text = string(relativedate(today(), -365))
em_date_fin.text = string(today())

//on récupère les infos sur le produit
dw_fiche.retrieve(code_produit_local)

//on récupère la liste des entrées sorties du produit chez ce fournisseur et pour ce praticien
//et on la met en couleur
color()

//préparation de la window
dw_sortie.visible = false
dw_entree.visible = false
//cb_option.enabled  = false
//cb_impression.enabled = false
cb_enregistrer.enabled = false
cb_annuler.enabled = false
if type_gestion = 2 then
	dw_liste.object.stock_produit_code_barre.visible = false
end if


uo_1.taille(this)   // uniquement pour coloration
//centrer(this)
//this.backcolor = 16246738
end event

type p_fond from w_fenetre_arakis`p_fond within w_modification_entree_sortie
end type

type cb_annuler from uo_picturebutton_250x120 within w_modification_entree_sortie
integer x = 2162
integer y = 1716
integer width = 498
integer taborder = 60
string text = "&Annuler"
string iconname = "ACTIONS_annuler.png"
end type

event clicked;call super::clicked;dw_entree.reset()
dw_sortie.reset()
if dw_liste.rowcount() > 0 then
	dw_liste.Selectrow(dw_liste.getrow(),true)
end if
end event

type cb_enregistrer from uo_picturebutton_250x120 within w_modification_entree_sortie
integer x = 2162
integer y = 1588
integer width = 498
integer height = 112
integer taborder = 60
string text = "&Enregistrer"
string iconname = "ACTIONS_enregistrer.png"
end type

event clicked;call super::clicked;int rapport_update
double numero_commande

if dw_entree.visible = true then
	dw_entree.accepttext()
	
	rapport_update = dw_entree.Update()
	
	if rapport_update = 1  then
		commit using sqlca ;
		numero_commande = dw_entree.getitemnumber(dw_entree.getrow(),"stock_produit_numero_commande")
		if not(isnull(numero_commande) or numero_commande = 0) then
			maj_stock(numero_commande)
		end if
		maj_histo_entree()
	else
		rollback using sqlca ;
	end if
else
	dw_sortie.accepttext()
	maj_stock_histo_sortie()
end if
end event

type cb_supprimer from uo_picturebutton_250x120 within w_modification_entree_sortie
integer x = 2149
integer y = 1180
integer width = 485
integer height = 112
integer taborder = 50
string text = "&Supprimer"
string iconname = "ACTIONS_supprimer.png"
end type

event clicked;call super::clicked;//suppression d'une ligne d'historique
//supression différente pour une entrée ou une sortie
//on empêche la suppression si la ligne est en rouge

string code_es //pour connaitre la nature du mouvement
double couleur //couleur de la ligne

if dw_liste.rowcount() > 0 then
	code_es = dw_liste.getitemstring(dw_liste.getrow(),"historique_es_code_es")
	if code_es = 's' then
		supprimer_sortie()
	else
		couleur = dw_liste.getitemnumber(dw_liste.getrow(),"produit_couleur_texte")
		if couleur = color_authorized then
			supprimer_entree()
		end if
		if couleur = color_unauthorized then
			MessageBox("ATTENTION","Vous ne pouvez pas supprimer cette entrée car des sorties de ce produit ont été effectuées !")
		end if
	end if
else
	messagebox("ATTENTION","Vous devez sélectionner un produit !")
end if
	
end event

type cb_modifier from uo_picturebutton_250x120 within w_modification_entree_sortie
integer x = 2642
integer y = 1180
integer width = 485
integer height = 112
integer taborder = 50
string text = "&Modifier"
string iconname = "ACTIONS_modifier.png"
end type

event clicked;call super::clicked;//modification d'une ligne d'historique
//modif différente pour une entrée ou une sortie on affiche la bonne dw avec les bonnes données
//on empêche la modification si la ligne est en rouge

string code_es //pour connaitre la nature du mouvement
double couleur //couleur de la ligne

double code_barre //code barre du produit considéré
date date_mvt //date du mvt
time heure //heure du mvt ( pour les sorties )

if dw_liste.rowcount() > 0 then
	code_es = dw_liste.getitemstring(dw_liste.getrow(),"historique_es_code_es")
	code_barre = dw_liste.getitemnumber(dw_liste.getrow(),"stock_produit_code_barre")
	date_mvt = dw_liste.getitemdate(dw_liste.getrow(),"historique_es_date")
	heure = dw_liste.getitemtime(dw_liste.getrow(),"historique_es_heure")
	if type_gestion = 1 then
		dw_entree.object.stock_produit_code_barre.visible = true
	else
		dw_entree.object.stock_produit_code_barre.visible = false
	end if
	
	if code_es = 's' then
		visi(false)
		dw_sortie.enabled = true
		dw_sortie.retrieve(code_barre,date_mvt,heure)
		date_sortie_initiale = date_mvt
		cb_enregistrer.enabled ( true)
		cb_annuler.enabled ( true)
	else
		couleur = dw_liste.getitemnumber(dw_liste.getrow(),"produit_couleur_texte")
		if couleur = color_authorized then
			visi(true)
			dw_entree.enabled = true
			cb_enregistrer.enabled ( true)
			cb_annuler.enabled ( true)
//			cb_impression.enabled = false
//			cb_option.enabled = false
			dw_entree.retrieve(code_barre)
		end if
		if couleur = color_unauthorized then
			MessageBox("ATTENTION","Vous ne pouvez pas supprimer cette entrée car des sorties de ce produit ont été effectuées !")
		end if
	end if
else
	messagebox("ATTENTION","Vous devez sélectionner un produit !")
end if
	
end event

type cb_rechercher from uo_picturebutton_390x120 within w_modification_entree_sortie
integer x = 2277
integer y = 88
integer width = 567
integer height = 152
integer taborder = 50
string text = "&Rechercher"
boolean default = true
string iconname = "ACTIONS_chercher.png"
end type

event clicked;call super::clicked;color()
end event

type pb_1 from uo_picturebutton_390x120_fermer within w_modification_entree_sortie
integer x = 2702
integer y = 1748
integer width = 512
integer height = 152
integer taborder = 50
end type

type dw_sortie from datawindow within w_modification_entree_sortie
string tag = "brush"
integer x = 110
integer y = 1392
integer width = 2016
integer height = 548
integer taborder = 50
string title = "none"
string dataobject = "dw_modif_sortie"
boolean border = false
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type em_resultat from editmask within w_modification_entree_sortie
integer x = 2318
integer y = 332
integer width = 201
integer height = 60
integer taborder = 60
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 553648127
boolean border = false
alignment alignment = right!
maskdatatype maskdatatype = stringmask!
end type

type st_resultat from statictext within w_modification_entree_sortie
integer x = 2542
integer y = 332
integer width = 279
integer height = 60
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 16777215
string text = "Résultats"
boolean focusrectangle = false
end type

type em_date_debut from editmask within w_modification_entree_sortie
integer x = 1449
integer y = 148
integer width = 421
integer height = 80
integer taborder = 40
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
string text = "none"
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "dd/mm/yyyy"
boolean spin = true
double increment = 1
end type

type em_date_fin from editmask within w_modification_entree_sortie
integer x = 1445
integer y = 264
integer width = 421
integer height = 80
integer taborder = 40
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "dd/mm/yyyy"
boolean spin = true
double increment = 1
end type

type st_1 from statictext within w_modification_entree_sortie
integer x = 1211
integer y = 152
integer width = 201
integer height = 64
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 553648127
string text = "Entre le"
boolean focusrectangle = false
end type

type st_2 from statictext within w_modification_entree_sortie
integer x = 1266
integer y = 264
integer width = 114
integer height = 68
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 553648127
string text = "et le"
boolean focusrectangle = false
end type

type gb_1 from groupbox within w_modification_entree_sortie
integer x = 78
integer y = 24
integer width = 1070
integer height = 464
integer taborder = 20
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 553648127
string text = "Produit"
end type

type gb_2 from groupbox within w_modification_entree_sortie
integer x = 78
integer y = 508
integer width = 3081
integer height = 800
integer taborder = 10
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 553648127
string text = "Historique des entrées sorties du produit"
end type

type gb_3 from groupbox within w_modification_entree_sortie
integer x = 78
integer y = 1336
integer width = 2601
integer height = 640
integer taborder = 30
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 553648127
string text = "Modification"
end type

type dw_fiche from datawindow within w_modification_entree_sortie
string tag = "brush"
integer x = 105
integer y = 104
integer width = 1015
integer height = 368
integer taborder = 30
boolean bringtotop = true
string title = "none"
string dataobject = "dw_produit_data_little"
boolean border = false
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type dw_entree from datawindow within w_modification_entree_sortie
string tag = "brush"
boolean visible = false
integer x = 114
integer y = 1396
integer width = 2030
integer height = 564
integer taborder = 20
boolean bringtotop = true
string title = "none"
string dataobject = "dw_modif_entree"
boolean border = false
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type dw_liste from u_basedw within w_modification_entree_sortie
string tag = "brush"
integer x = 110
integer y = 576
integer width = 3017
integer height = 584
integer taborder = 10
boolean bringtotop = true
string dataobject = "dw_modification_entree_sortie_liste"
boolean hscrollbar = false
boolean border = false
end type

event clicked;call super::clicked;//modifier()
end event

type uo_1 from resize_fenetre within w_modification_entree_sortie
boolean visible = false
integer x = 1038
integer y = 708
integer taborder = 40
boolean bringtotop = true
end type

on uo_1.destroy
call resize_fenetre::destroy
end on

type gb_4 from groupbox within w_modification_entree_sortie
integer x = 1157
integer y = 24
integer width = 782
integer height = 464
integer taborder = 40
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 553648127
string text = "Recherche par date"
end type

type gb_5 from groupbox within w_modification_entree_sortie
integer x = 2258
integer y = 264
integer width = 631
integer height = 184
integer taborder = 50
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 553648127
end type

