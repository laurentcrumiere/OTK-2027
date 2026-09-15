$PBExportHeader$w_saisie_commande.srw
forward
global type w_saisie_commande from w_fenetre_arakis
end type
type cb_fermer from uo_picturebutton_390x120 within w_saisie_commande
end type
type cb_annuler from uo_picturebutton_390x120 within w_saisie_commande
end type
type cb_enregistrer from uo_picturebutton_390x120 within w_saisie_commande
end type
type cb_nouvelle from uo_picturebutton_390x120 within w_saisie_commande
end type
type cb_reception from uo_picturebutton_390x120 within w_saisie_commande
end type
type cb_rechercher from uo_picturebutton_390x120 within w_saisie_commande
end type
type cb_supprimer from uo_picturebutton_390x120 within w_saisie_commande
end type
type cb_ajouter from uo_picturebutton_390x120 within w_saisie_commande
end type
type st_4 from statictext within w_saisie_commande
end type
type rte_1 from richtextedit within w_saisie_commande
end type
type dw_edition from datawindow within w_saisie_commande
end type
type st_note_stock from statictext within w_saisie_commande
end type
type st_remarque from statictext within w_saisie_commande
end type
type em_resultat from editmask within w_saisie_commande
end type
type st_resultat from statictext within w_saisie_commande
end type
type em_code_produit from editmask within w_saisie_commande
end type
type rb_code from radiobutton within w_saisie_commande
end type
type dw_code from datawindow within w_saisie_commande
end type
type dw_resultat from u_basedw within w_saisie_commande
end type
type uo_1 from resize_fenetre within w_saisie_commande
end type
type dw_taxe from datawindow within w_saisie_commande
end type
type em_prix from editmask within w_saisie_commande
end type
type st_3 from statictext within w_saisie_commande
end type
type dw_data from datawindow within w_saisie_commande
end type
type dw_basic from datawindow within w_saisie_commande
end type
type dw_liste from u_basedw within w_saisie_commande
end type
type dw_recherche from datawindow within w_saisie_commande
end type
type em_designation from editmask within w_saisie_commande
end type
type rb_designation from radiobutton within w_saisie_commande
end type
type rb_type from radiobutton within w_saisie_commande
end type
type em_quantite from editmask within w_saisie_commande
end type
type st_2 from statictext within w_saisie_commande
end type
type st_1 from statictext within w_saisie_commande
end type
type cb_imprimer from uo_picturebutton_390x120 within w_saisie_commande
end type
type rb_reference_fournisseur from radiobutton within w_saisie_commande
end type
type em_reference_fournisseur from editmask within w_saisie_commande
end type
type rb_identifiant_udi from radiobutton within w_saisie_commande
end type
type sle_identifiant_udi from singlelineedit within w_saisie_commande
end type
type pb_udi from picturebutton within w_saisie_commande
end type
type gb_1 from groupbox within w_saisie_commande
end type
type gb_2 from groupbox within w_saisie_commande
end type
type gb_3 from groupbox within w_saisie_commande
end type
type gb_4 from groupbox within w_saisie_commande
end type
type gb_5 from groupbox within w_saisie_commande
end type
type gb_6 from groupbox within w_saisie_commande
end type
end forward

global type w_saisie_commande from w_fenetre_arakis
integer width = 4699
integer height = 2760
string title = "Saisie Commande"
long backcolor = 15780518
cb_fermer cb_fermer
cb_annuler cb_annuler
cb_enregistrer cb_enregistrer
cb_nouvelle cb_nouvelle
cb_reception cb_reception
cb_rechercher cb_rechercher
cb_supprimer cb_supprimer
cb_ajouter cb_ajouter
st_4 st_4
rte_1 rte_1
dw_edition dw_edition
st_note_stock st_note_stock
st_remarque st_remarque
em_resultat em_resultat
st_resultat st_resultat
em_code_produit em_code_produit
rb_code rb_code
dw_code dw_code
dw_resultat dw_resultat
uo_1 uo_1
dw_taxe dw_taxe
em_prix em_prix
st_3 st_3
dw_data dw_data
dw_basic dw_basic
dw_liste dw_liste
dw_recherche dw_recherche
em_designation em_designation
rb_designation rb_designation
rb_type rb_type
em_quantite em_quantite
st_2 st_2
st_1 st_1
cb_imprimer cb_imprimer
rb_reference_fournisseur rb_reference_fournisseur
em_reference_fournisseur em_reference_fournisseur
rb_identifiant_udi rb_identifiant_udi
sle_identifiant_udi sle_identifiant_udi
pb_udi pb_udi
gb_1 gb_1
gb_2 gb_2
gb_3 gb_3
gb_4 gb_4
gb_5 gb_5
gb_6 gb_6
end type
global w_saisie_commande w_saisie_commande

type variables
datawindowchild idw_type //dddw type de dw_recherche
string sel //select de dw resultat
string code_fournisseur, code_praticien //code fournisseur et code praticien de la commande
double numero_commande //numero de commande de la commande
str_commande struct //pour le passage de param
environment	lenv_obj
boolean prems

// pour le retrieve de la recherche de produits
string type_produit_recherche , reference_fournisseur_recherche, code_produit_recherche, designation_recherche
end variables

forward prototypes
public subroutine supprimer ()
public subroutine raz ()
public subroutine raz_total ()
public subroutine recuperer (string clausew)
public subroutine inserer ()
public function integer ajouter ()
public subroutine rechercher ()
end prototypes

public subroutine supprimer ();  DELETE FROM "commande"  
   WHERE "commande"."numero_commande" = :numero_commande;

IF SQLCA.SQLCode = -1 THEN 
	MessageBox("SQL error", SQLCA.SQLErrText)
	rollback;
else
	commit;
END IF

end subroutine

public subroutine raz ();//on efface les champs code produit, quantite, prix de la ligne d'ajout
//ainsi que les remarques éventuellement apparue sur le résultat de la recherche

dw_code.reset()
dw_code.insertrow(0)
em_quantite.text = ""
em_prix.text = ""
em_quantite.enabled = false
em_prix.enabled = false
st_remarque.visible = false
st_note_stock.visible = false
cb_ajouter.enabled = false

//em_resultat. text = ""
//dw_resultat.reset()



end subroutine

public subroutine raz_total ();//efface les critères de recherche
dw_resultat.reset()
if rb_designation.checked then
	em_designation.selecttext(1,30)
	em_designation.clear()
end if
if rb_type.checked then
	dw_recherche.reset()
	idw_type.insertrow(0)
	dw_recherche.insertrow(0)
end if
if rb_code.checked then
	em_code_produit.selecttext(1,30)
	em_code_produit.clear()
end if
end subroutine

public subroutine recuperer (string clausew);//retrieve programmé de la dw_resultat

string rapport //rapport du modify du select de la dw resultat
string clauseo //clause order de la dw_resultat
string code_produit_courant //code produit d'une ligne de dw_resultat
integer nb_row //nb de lignes du retrieve de la dw_resultat
integer i,j //pour les boucles for
integer compteur //pour savoir si le produit courant est reference
integer compteur_prati //pour savoir si le produit courant appartient à la gestion de stock du praticien
boolean afficher_non_reference //pour savoir si on affiche la remarque produit non reference chez ce fournisseur
boolean afficher_pas_stock //pour savoir si on affiche la remarque produit n'appartenant pas a votre stock
double color_non_reference //couleur d'affichage des produits non references
double color_non_stock //couleur d'affichage des produits n'appartenant pas a la gestion de stock du praticien

clauseo = " ORDER by produit.code_interne ASC" //on ordonne la dw par le code du produit

STRING toto
toto =  sel + clausew + clauseo

if rb_reference_fournisseur.checked then
	// On ne modifie pas
	rapport = ""
else
	rapport = dw_resultat.modify('datawindow.table.select ="' + sel + clausew + clauseo +'"')
end if


raz() //on efface la ligne d'ajout

//on initialise les variables
afficher_non_reference = true
afficher_pas_stock = true
color_non_reference = 255
color_non_stock = 16711935

if rapport = "" then
	
	//ok on continue
//	nb_row =dw_resultat.retrieve(ref_four)
	
	if nb_row > 0 then
		i = nb_row
		//a été codé en do while pour permettre plusieurs conditions d'arret, mais dans sa version actuelle est equivalent à un for next
		//on parcours les lignes de la dw en mettant a jour les couleurs de chaque ligne
		//   -noir- pour produit reference chez le fournisseur et apparenant à la gestion de stock du praticien
		//   -rouge- pour non référencé chez le praticien : soit l'utilisateur s'est trompé dans la recherche 
		//          soit il doit aller dans la table produit ajouter le referencement du produit pour ce fournisseur
		//   -magenta- pour référencé chez ce fournisseur mais pas pour ce praticien
		//					l'utilisateur doit aller dans maj produit referencer le produit pour le praticien
		
		DO WHILE  i > 0
			
			code_produit_courant = dw_resultat.getitemstring(i,"code_interne")
			
			select count(*)
				into :compteur
				from "reference_produit"
			where "code_produit" = :code_produit_courant and "code_fournisseur" = :code_fournisseur;

			if compteur = 1 then
				
				  SELECT count(*)  
				    INTO :compteur_prati  
				    FROM "param_stock_produit"  
			   	WHERE ( "param_stock_produit"."code_produit" = :code_produit_courant ) AND  
				         ( "param_stock_produit"."code_praticien" in (:code_praticien, 'COMMUN') )   ;
				
				if compteur_prati >= 1 then
					dw_resultat.setitem(i,"couleur_texte",0) //noir
					afficher_non_reference = false
					afficher_pas_stock = false
				else
					dw_resultat.setitem(i,"couleur_texte",color_non_stock) //magenta
					st_note_stock.visible = true
				end if
			else
				dw_resultat.setitem(i,"couleur_texte",color_non_reference) //rouge
				st_remarque.visible = true
			end if
			i = i - 1
		LOOP
		
		
		if not afficher_non_reference  and not afficher_pas_stock  then
			st_remarque.visible = false
			st_note_stock.visible = false
			FOR j = nb_row to 1 STEP -1
				code_produit_courant = dw_resultat.getitemstring(j,"code_interne")
				if dw_resultat.getitemnumber(j,"couleur_texte") = color_non_reference or dw_resultat.getitemnumber(j,"couleur_texte") = color_non_stock then
					dw_resultat.deleterow(j)
				end if
			NEXT
		end if
		
		//remplissage du nombre de resultat
		if dw_resultat.rowcount() = 1 then
			inserer()
			em_resultat.text = "1"
		else
			em_resultat.text = string(dw_resultat.rowcount())
		end if
	else
		em_resultat.text = "Aucun"
	end if
end if




























////retrieve programmé de la dw_resultat
//
//string rapport //rapport du modify du select de la dw resultat
//string clauseo //clause order de la dw_resultat
//string code_produit_courant //code produit d'une ligne de dw_resultat
//integer nb_row //nb de lignes du retrieve de la dw_resultat
//integer i,j //pour les boucles for
//integer compteur //pour savoir si le produit courant est reference
//integer compteur_prati //pour savoir si le produit courant appartient à la gestion de stock du praticien
//boolean afficher_non_reference //pour savoir si on affiche la remarque produit non reference chez ce fournisseur
//boolean afficher_pas_stock //pour savoir si on affiche la remarque produit n'appartenant pas a votre stock
//double color_non_reference //couleur d'affichage des produits non references
//double color_non_stock //couleur d'affichage des produits n'appartenant pas a la gestion de stock du praticien
//
//clauseo = " ORDER by produit.code_interne ASC" //on ordonne la dw par le code du produit
//
//STRING toto
//toto =  sel + clausew + clauseo
//
//if rb_reference_fournisseur.checked then
//	// On ne modifie pas
//	rapport = ""
//else
//	rapport = dw_resultat.modify('datawindow.table.select ="' + sel + clausew + clauseo +'"')
//end if
//
//
//raz() //on efface la ligne d'ajout
//
////on initialise les variables
//afficher_non_reference = true
//afficher_pas_stock = true
//color_non_reference = 255
//color_non_stock = 16711935
//
//if rapport = "" then
//	
//	//ok on continue
//	nb_row =dw_resultat.retrieve(ref_four)
//	
//	if nb_row > 0 then
//		i = nb_row
//		//a été codé en do while pour permettre plusieurs conditions d'arret, mais dans sa version actuelle est equivalent à un for next
//		//on parcours les lignes de la dw en mettant a jour les couleurs de chaque ligne
//		//   -noir- pour produit reference chez le fournisseur et apparenant à la gestion de stock du praticien
//		//   -rouge- pour non référencé chez le praticien : soit l'utilisateur s'est trompé dans la recherche 
//		//          soit il doit aller dans la table produit ajouter le referencement du produit pour ce fournisseur
//		//   -magenta- pour référencé chez ce fournisseur mais pas pour ce praticien
//		//					l'utilisateur doit aller dans maj produit referencer le produit pour le praticien
//		
//		DO WHILE  i > 0
//			
//			code_produit_courant = dw_resultat.getitemstring(i,"code_interne")
//			
//			select count(*)
//				into :compteur
//				from "reference_produit"
//			where "code_produit" = :code_produit_courant and "code_fournisseur" = :code_fournisseur;
//
//			if compteur = 1 then
//				
//				  SELECT count(*)  
//				    INTO :compteur_prati  
//				    FROM "param_stock_fournisseur"  
//			   	WHERE ( "param_stock_fournisseur"."code_produit" = :code_produit_courant ) AND  
//				         ( "param_stock_fournisseur"."code_fournisseur" = :code_fournisseur ) AND  
//				         ( "param_stock_fournisseur"."code_praticien" in (:code_praticien, 'COMMUN') )   ;
//				
//				if compteur_prati >= 1 then
//					dw_resultat.setitem(i,"couleur_texte",0) //noir
//					afficher_non_reference = false
//					afficher_pas_stock = false
//				else
//					dw_resultat.setitem(i,"couleur_texte",color_non_stock) //magenta
//					st_note_stock.visible = true
//				end if
//			else
//				dw_resultat.setitem(i,"couleur_texte",color_non_reference) //rouge
//				st_remarque.visible = true
//			end if
//			i = i - 1
//		LOOP
//		
//		
//		if afficher_non_reference = false and afficher_pas_stock = false then
//			st_remarque.visible = false
//			st_note_stock.visible = false
//			FOR j = nb_row to 1 STEP -1
//				code_produit_courant = dw_resultat.getitemstring(j,"code_interne")
//				if dw_resultat.getitemnumber(j,"couleur_texte") = color_non_reference or dw_resultat.getitemnumber(j,"couleur_texte") = color_non_stock then
//					dw_resultat.deleterow(j)
//				end if
//			NEXT
//		end if
//		
//		//remplissage du nombre de resultat
//		if dw_resultat.rowcount() = 1 then
//			inserer()
//			em_resultat.text = "1"
//		else
//			em_resultat.text = string(dw_resultat.rowcount())
//		end if
//	else
//		em_resultat.text = "Aucun"
//	end if
//end if
//
//
//
end subroutine

public subroutine inserer ();//insertion du code produit de la ligne de dw resultat selectionnee dans dw_code

string code_produit,type_taxe
double prix,couleur_texte
long quantite
integer remise

if dw_resultat.getitemnumber(dw_resultat.getrow(),"couleur_texte") = 0 then
	//on ne permet l'insertion que si le produit est affiche en noir ce qui veut dire qu'il appartient 
	//a la gestion de stock du praticien, pour le fournisseur de la commande
	
	//preparation de l'insertion, on rend editable les champs prix et quantite
	dw_code.reset()
	dw_code.insertrow(0)
	code_produit = dw_resultat.getitemstring(dw_resultat.getrow(),"code_interne")
	dw_code.setitem(dw_code.getrow(),"code_interne",code_produit)
	em_prix.enabled = true

  	SELECT "reference_produit"."prix","reference_produit"."code_type_taxe"  
    INTO :prix, :type_taxe  
    FROM "reference_produit"  
   WHERE ( "reference_produit"."code_produit" = :code_produit ) AND  
         ( "reference_produit"."code_fournisseur" = :code_fournisseur )   ;

	  SELECT "param_stock_fournisseur"."remise"  ,  "param_stock_fournisseur"."qte_com_min" 
	    INTO :remise  , :quantite
	    FROM "param_stock_fournisseur"  
	   WHERE ( "param_stock_fournisseur"."code_produit" = :code_produit ) AND  
   	      ( "param_stock_fournisseur"."code_fournisseur" = :code_fournisseur ) AND  
      	   ( "param_stock_fournisseur"."code_praticien" = :code_praticien )   ;

	if isnull(remise) then
		remise = 0
	end if
	
	//on met quantite et type taxe au valeur par default 1 et TTC
	//et on met dans le champ prix le prix saisi dans les references du produit
	prix = prix *(1 - remise/100)
	em_prix.text = string(prix)
	em_quantite.text = string(quantite)
	
	if isnull(type_taxe) then
		type_taxe = "TTC"
	end if
	dw_taxe.setitem(dw_taxe.getrow(),"code_type_taxe",type_taxe)
	em_quantite.enabled = true
	em_quantite.setfocus()
	cb_ajouter.enabled = true
end if
end subroutine

public function integer ajouter ();//ajout d'une ligne de la commmande
//on vérifie que les champs quantité, prix sont remplis
//puis que le produit est bien reférencé chez le fournisseur de la commande pour le praticien de la commande
//bien qu'il soit normalement implossible qu'il en soit autrement

string code_produit,type_taxe,reference_courante,code_type_produit_courant,designation_courante
integer compteur
double quantite,prix

integer val_retour

double puttc
string type_taxe_puttc

if not dec(em_quantite.text) > 0 then
	MessageBox("Attention","Vous n'avez pas saisi la quantité de produit à commander")
	return(1)
end if
if not dec(em_prix.text) > 0 then
	MessageBox("Attention","Vous n'avez pas saisi le prix du produit")
end if

code_produit = dw_code.getitemstring(dw_code.Getrow(),"code_interne")
type_taxe = dw_taxe.getitemstring(dw_taxe.getrow(),"code_type_taxe")
quantite = dec(em_quantite.text)
prix = dec(em_prix.text)

boolean v_suite 

v_suite = false

// Pour savoir si produit OK chez CE fournisseur
  SELECT count(*)     INTO :compteur 
    FROM "param_stock_fournisseur"  
   WHERE ( "param_stock_fournisseur"."code_produit" = :code_produit ) AND  
         ( "param_stock_fournisseur"."code_fournisseur" = :code_fournisseur ) AND  
         ( "param_stock_fournisseur"."code_praticien" = :code_praticien )   ;

if not compteur = 1 then
	
// Si le produit est en commun UNIQUEMENT et qu'on le commande, on le bascule pour le fournisseur !!!

	string v_prat
	
	// combien de fournisseur et le code
  SELECT count(*) , min(code_praticien)    INTO :compteur , :v_prat
    FROM "param_stock_fournisseur"  
   WHERE ( "param_stock_fournisseur"."code_produit" = :code_produit ) AND  
         ( "param_stock_fournisseur"."code_fournisseur" = :code_fournisseur )  ;
			
	if compteur = 1 and v_prat = 'COMMUN' then
		// On le bascule !!!!
		UPDATE  "param_stock_fournisseur"  SET "code_praticien" = :code_praticien
		WHERE ( "param_stock_fournisseur"."code_produit" = :code_produit ) AND  
		         ( "param_stock_fournisseur"."code_fournisseur" = :code_fournisseur ) AND  
		         ( "param_stock_fournisseur"."code_praticien" = 'COMMUN')  ;
		
		if sqlca.sqlcode = 0 then 
			
			UPDATE  "param_stock_produit"  SET "code_praticien" = :code_praticien
			WHERE ( "param_stock_produit"."code_produit" = :code_produit ) AND  
		         ( "param_stock_produit"."code_praticien" = 'COMMUN')  ;

			
			if sqlca.sqlcode = 0 then 
				commit ;
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
		Messagebox("Attention","Ce produit n'est pas référencé chez ce fournisseur.")
		v_suite = false
		val_retour = 3	
	end if
	
else
	
	v_suite = true
	
	
end if


// Verfication si le produit n'est pas en interdiction de commande
if v_suite then

	string v_interdiction
	
	SELECT interdiction_commande INTO :v_interdiction FROM  "param_stock_produit"  
	WHERE ( "param_stock_produit"."code_produit" = :code_produit ) AND  
				( "param_stock_produit"."code_praticien" = :code_praticien )   ;
				
	if upper(v_interdiction )  = "O" then
		Messagebox("ATTENTION","Ce produit est en interdiction de commande.~n~nIl n'a pas été ajouté.")
		v_suite = false
	end if

	
end if
	
if v_suite then
	
	//ajout du produit dans la ligne de commande
	//on récupère les infos à afficher sur la ligne un champ de celle ci etant éditable
	//l'ajout n'est donc pris en compte dans la bsd qu'a l'enregistrement
	
	  SELECT "reference_produit"."prix","reference_produit"."code_type_taxe" 
	    INTO :puttc,:type_taxe_puttc
	    FROM "reference_produit"  
	   WHERE ( "reference_produit"."code_produit" = :code_produit ) AND  
   	      ( "reference_produit"."code_fournisseur" = :code_fournisseur )   ;

	if type_taxe = 'HT' then
		prix = prix * 1.2
	end if
	
	if type_taxe_puttc = 'HT' then
		puttc = puttc * 1.2
	end if
	
	dw_liste.insertrow(0)
	dw_liste.scrolltorow(dw_liste.rowcount())
	dw_liste.setitem(dw_liste.getrow(),"ligne_commande_code_produit",code_produit)
	dw_liste.setitem(dw_liste.getrow(),"ligne_commande_numero_commande",numero_commande)
	dw_liste.setitem(dw_liste.getrow(),"ligne_commande_qte_commandee",quantite)
	dw_liste.setitem(dw_liste.getrow(),"ligne_commande_prix",prix)
	dw_liste.setitem(dw_liste.getrow(),"ligne_commande_solde",'n')
	dw_liste.setitem(dw_liste.getrow(),"reference_produit_prix",puttc)
	
	SELECT "reference_produit"."reference"  
    INTO :reference_courante  
    FROM "reference_produit"  
   WHERE ( "reference_produit"."code_produit" = :code_produit ) AND  
         ( "reference_produit"."code_fournisseur" = :code_fournisseur )   ;
	
	  SELECT "produit"."code_type_produit",   
         "produit"."designation"  
    INTO :code_type_produit_courant,   
         :designation_courante  
    FROM "produit"  
   WHERE "produit"."code_interne" = :code_produit ;

	dw_liste.setitem(dw_liste.getrow(),"reference_produit_reference",reference_courante)
	dw_liste.setitem(dw_liste.getrow(),"produit_code_type_produit",code_type_produit_courant)
	dw_liste.setitem(dw_liste.getrow(),"produit_designation",designation_courante)
	
	//la ligne est mise a jour on efface la recherche et on s'apprete à en effectuer une autre
	raz()
//	raz_total()
//	dw_resultat.reset()
//	if rb_designation.checked then
//		em_designation.selecttext(1,30)
//		em_designation.clear()
//	end if
//	if rb_type.checked then
//		dw_recherche.reset()
//		idw_type.insertrow(0)
//		dw_recherche.insertrow(0)
//	end if
//	if rb_code.checked then
//		em_code_produit.selecttext(1,30)
//		em_code_produit.clear()
//	end if
	val_retour = 0
end if

return val_retour
end function

public subroutine rechercher ();//retrieve programmé de la dw_resultat

string rapport //rapport du modify du select de la dw resultat
string clauseo //clause order de la dw_resultat
string code_produit_courant //code produit d'une ligne de dw_resultat
integer nb_row //nb de lignes du retrieve de la dw_resultat
integer i,j //pour les boucles for
integer compteur //pour savoir si le produit courant est reference
integer compteur_prati //pour savoir si le produit courant appartient à la gestion de stock du praticien
boolean afficher_non_reference //pour savoir si on affiche la remarque produit non reference chez ce fournisseur
boolean afficher_pas_stock //pour savoir si on affiche la remarque produit n'appartenant pas a votre stock
double color_non_reference //couleur d'affichage des produits non references
double color_non_stock //couleur d'affichage des produits n'appartenant pas a la gestion de stock du praticien


// depuis 19.02e on ne liste que les produits référencés chez le fournisseur

raz() //on efface la ligne d'ajout

//on initialise les variables
afficher_non_reference = true
afficher_pas_stock = true
color_non_reference = 255
color_non_stock = 16711935

// pour la recherche

string v_code_min = ""
string v_code_max = "ZZZZZZZZZZZZZZZZZZZZ"
string v_reference = "%"
string v_designation = "%"
string v_type_min = ""
string v_type_max = "ZZZZZZZZZZZZZZZZZZZZ"
string v_identifiant_udi = "%"

if rb_type.checked then
	v_type_min = type_produit_recherche
	v_type_max = type_produit_recherche
else
	if rb_designation.checked then
		v_designation = trim(em_designation.text)+"%"
	else
		if rb_reference_fournisseur.checked then
			v_reference = trim(em_reference_fournisseur.text)+"%"
		else
			if rb_code.checked then
				v_code_min = trim(em_code_produit.text)
				v_code_max = trim(em_code_produit.text)
			else
				if rb_identifiant_udi.checked then
					v_identifiant_udi = sle_identifiant_udi.text
				end if
			end if
		end if
	end if
end if
	
//ok on continue
nb_row =dw_resultat.retrieve(v_code_min, v_code_max, v_reference, v_designation, v_type_min, v_type_max, code_fournisseur,v_identifiant_udi )

if nb_row > 0 then
	i = nb_row
	//a été codé en do while pour permettre plusieurs conditions d'arret, mais dans sa version actuelle est equivalent à un for next
	//on parcours les lignes de la dw en mettant a jour les couleurs de chaque ligne
	//   -noir- pour produit reference chez le fournisseur et apparenant à la gestion de stock du praticien
	//   -rouge- pour non référencé chez le praticien : soit l'utilisateur s'est trompé dans la recherche 
	//          soit il doit aller dans la table produit ajouter le referencement du produit pour ce fournisseur
	//   -magenta- pour référencé chez ce fournisseur mais pas pour ce praticien
	//					l'utilisateur doit aller dans maj produit referencer le produit pour le praticien
	
	DO WHILE  i > 0
		
		code_produit_courant = dw_resultat.getitemstring(i,"code_interne")
		
		select count(*)
			into :compteur
			from "reference_produit"
		where "code_produit" = :code_produit_courant and "code_fournisseur" = :code_fournisseur;

		if compteur = 1 then
			
			  SELECT count(*)  
				 INTO :compteur_prati  
				 FROM "param_stock_produit"  
				WHERE ( "param_stock_produit"."code_produit" = :code_produit_courant ) AND  
						( "param_stock_produit"."code_praticien" in (:code_praticien, 'COMMUN') )   ;
			
			if compteur_prati >= 1 then
				dw_resultat.setitem(i,"couleur_texte",0) //noir
				afficher_non_reference = false
				afficher_pas_stock = false
			else
				dw_resultat.setitem(i,"couleur_texte",color_non_stock) //magenta
				st_note_stock.visible = true
			end if
		else
			dw_resultat.setitem(i,"couleur_texte",color_non_reference) //rouge
			st_remarque.visible = true
		end if
		i = i - 1
	LOOP
	
	
	if not afficher_non_reference and not afficher_pas_stock then
		st_remarque.visible = false
		st_note_stock.visible = false
		FOR j = nb_row to 1 STEP -1
			code_produit_courant = dw_resultat.getitemstring(j,"code_interne")
			if dw_resultat.getitemnumber(j,"couleur_texte") = color_non_reference or dw_resultat.getitemnumber(j,"couleur_texte") = color_non_stock then
				dw_resultat.deleterow(j)
			end if
		NEXT
	end if
	
	//remplissage du nombre de resultat
	if dw_resultat.rowcount() = 1 then
		inserer()
		em_resultat.text = "1"
	else
		em_resultat.text = string(dw_resultat.rowcount())
	end if
else
	em_resultat.text = "Aucun"
end if


















end subroutine

on w_saisie_commande.create
int iCurrent
call super::create
this.cb_fermer=create cb_fermer
this.cb_annuler=create cb_annuler
this.cb_enregistrer=create cb_enregistrer
this.cb_nouvelle=create cb_nouvelle
this.cb_reception=create cb_reception
this.cb_rechercher=create cb_rechercher
this.cb_supprimer=create cb_supprimer
this.cb_ajouter=create cb_ajouter
this.st_4=create st_4
this.rte_1=create rte_1
this.dw_edition=create dw_edition
this.st_note_stock=create st_note_stock
this.st_remarque=create st_remarque
this.em_resultat=create em_resultat
this.st_resultat=create st_resultat
this.em_code_produit=create em_code_produit
this.rb_code=create rb_code
this.dw_code=create dw_code
this.dw_resultat=create dw_resultat
this.uo_1=create uo_1
this.dw_taxe=create dw_taxe
this.em_prix=create em_prix
this.st_3=create st_3
this.dw_data=create dw_data
this.dw_basic=create dw_basic
this.dw_liste=create dw_liste
this.dw_recherche=create dw_recherche
this.em_designation=create em_designation
this.rb_designation=create rb_designation
this.rb_type=create rb_type
this.em_quantite=create em_quantite
this.st_2=create st_2
this.st_1=create st_1
this.cb_imprimer=create cb_imprimer
this.rb_reference_fournisseur=create rb_reference_fournisseur
this.em_reference_fournisseur=create em_reference_fournisseur
this.rb_identifiant_udi=create rb_identifiant_udi
this.sle_identifiant_udi=create sle_identifiant_udi
this.pb_udi=create pb_udi
this.gb_1=create gb_1
this.gb_2=create gb_2
this.gb_3=create gb_3
this.gb_4=create gb_4
this.gb_5=create gb_5
this.gb_6=create gb_6
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_fermer
this.Control[iCurrent+2]=this.cb_annuler
this.Control[iCurrent+3]=this.cb_enregistrer
this.Control[iCurrent+4]=this.cb_nouvelle
this.Control[iCurrent+5]=this.cb_reception
this.Control[iCurrent+6]=this.cb_rechercher
this.Control[iCurrent+7]=this.cb_supprimer
this.Control[iCurrent+8]=this.cb_ajouter
this.Control[iCurrent+9]=this.st_4
this.Control[iCurrent+10]=this.rte_1
this.Control[iCurrent+11]=this.dw_edition
this.Control[iCurrent+12]=this.st_note_stock
this.Control[iCurrent+13]=this.st_remarque
this.Control[iCurrent+14]=this.em_resultat
this.Control[iCurrent+15]=this.st_resultat
this.Control[iCurrent+16]=this.em_code_produit
this.Control[iCurrent+17]=this.rb_code
this.Control[iCurrent+18]=this.dw_code
this.Control[iCurrent+19]=this.dw_resultat
this.Control[iCurrent+20]=this.uo_1
this.Control[iCurrent+21]=this.dw_taxe
this.Control[iCurrent+22]=this.em_prix
this.Control[iCurrent+23]=this.st_3
this.Control[iCurrent+24]=this.dw_data
this.Control[iCurrent+25]=this.dw_basic
this.Control[iCurrent+26]=this.dw_liste
this.Control[iCurrent+27]=this.dw_recherche
this.Control[iCurrent+28]=this.em_designation
this.Control[iCurrent+29]=this.rb_designation
this.Control[iCurrent+30]=this.rb_type
this.Control[iCurrent+31]=this.em_quantite
this.Control[iCurrent+32]=this.st_2
this.Control[iCurrent+33]=this.st_1
this.Control[iCurrent+34]=this.cb_imprimer
this.Control[iCurrent+35]=this.rb_reference_fournisseur
this.Control[iCurrent+36]=this.em_reference_fournisseur
this.Control[iCurrent+37]=this.rb_identifiant_udi
this.Control[iCurrent+38]=this.sle_identifiant_udi
this.Control[iCurrent+39]=this.pb_udi
this.Control[iCurrent+40]=this.gb_1
this.Control[iCurrent+41]=this.gb_2
this.Control[iCurrent+42]=this.gb_3
this.Control[iCurrent+43]=this.gb_4
this.Control[iCurrent+44]=this.gb_5
this.Control[iCurrent+45]=this.gb_6
end on

on w_saisie_commande.destroy
call super::destroy
destroy(this.cb_fermer)
destroy(this.cb_annuler)
destroy(this.cb_enregistrer)
destroy(this.cb_nouvelle)
destroy(this.cb_reception)
destroy(this.cb_rechercher)
destroy(this.cb_supprimer)
destroy(this.cb_ajouter)
destroy(this.st_4)
destroy(this.rte_1)
destroy(this.dw_edition)
destroy(this.st_note_stock)
destroy(this.st_remarque)
destroy(this.em_resultat)
destroy(this.st_resultat)
destroy(this.em_code_produit)
destroy(this.rb_code)
destroy(this.dw_code)
destroy(this.dw_resultat)
destroy(this.uo_1)
destroy(this.dw_taxe)
destroy(this.em_prix)
destroy(this.st_3)
destroy(this.dw_data)
destroy(this.dw_basic)
destroy(this.dw_liste)
destroy(this.dw_recherche)
destroy(this.em_designation)
destroy(this.rb_designation)
destroy(this.rb_type)
destroy(this.em_quantite)
destroy(this.st_2)
destroy(this.st_1)
destroy(this.cb_imprimer)
destroy(this.rb_reference_fournisseur)
destroy(this.em_reference_fournisseur)
destroy(this.rb_identifiant_udi)
destroy(this.sle_identifiant_udi)
destroy(this.pb_udi)
destroy(this.gb_1)
destroy(this.gb_2)
destroy(this.gb_3)
destroy(this.gb_4)
destroy(this.gb_5)
destroy(this.gb_6)
end on

event open;call super::open;integer rapport_share //au cas ou le partage de buffers entre dw_basic et dw_data se passe mal
string transport, type_taxe, libelle, code_transport, reference_personnelle, nom_praticien
double var_mois, var_jours, frais
//variable de valeurs par défault de l'entête et du mode de livraison
date aujourdhui //date d'aujourd'hui pour la date de commande

struct = message.powerobjectparm
//passage de param de la response window w_saisie_libelle_commande
numero_commande = struct.numero //numero de commande
code_fournisseur = struct.code_fourn //code fournisseur
code_praticien = struct.code_praticien // code praticien

dw_basic.settransobject(sqlca) //dw de l'entête de la commande
dw_code.settransobject(sqlca) //dw du code produit
dw_edition.settransobject(sqlca) //dw de l'impression des bon de commande
rapport_share = dw_basic.ShareData(dw_data) //partage de buffers de dw entre dw data (dw de la livraison) et dw_basic(entete de commande)
if rapport_share <> 1 then
	messagebox ("Sharedata error","error sharing data with dw_data")
end if
dw_liste.settransobject(sqlca) //dw des lignes de commmandes
dw_resultat.settransobject(sqlca) //dw des resultats de recherche de produit
dw_recherche.settransobject(sqlca) //dw de la recherche du type de produit
dw_taxe.settransobject(sqlca) //dw du type taxe dans l'ajout d'un produit (en fond transparent)
dw_code.insertrow(0) 
dw_taxe.insertrow(0)

sel = dw_resultat.describe("datawindow.table.select")
//on effectue des retrieve différents selon les critères de recherche

dw_recherche.getchild("produit_code_type_produit",idw_type)
//on insere un ligne dans la dddw type de dw recherche pour eviter la requete du retrieval argumment de la dddw fille de dw recherche
idw_type.settransobject(sqlca)
idw_type.insertrow(0)


if struct.maj = false then
	//saisie d'une nouvelle commande
	
	//on met les valeurs par default de l'entete et de la livraison en fonction du passage de param
	SELECT "code_mode_transport","delai_livraison_mois","delai_livraison_jours","frais_port","code_type_taxe","libelle"
		into :code_transport,:var_mois,:var_jours,:frais,:type_taxe,:libelle
		from "livraison"
		where "code" = :struct.code_livraison;

	SELECT "mode_transport"
		into :transport
		from mode_transport
		where "code" = :code_transport;
	
	aujourdhui = today()
	  SELECT "prati"."nom"  
	    INTO :nom_praticien  
	    FROM "prati"  
	   WHERE "prati"."code" = :code_praticien   ;
	
	
	// Recherche des valeurs par défaut ....
	string v_ref, v_com
	
	select min(isnull(comfou_reference_personnelle_defaut,'')), min(isnull(comfou_commentaires_defaut,'')) into :v_ref, :v_com from param ;
	
	if len(trim(v_ref)) > 0 then
		reference_personnelle = v_ref
	else
		reference_personnelle = "A l'attention de "+nom_praticien
	end if
	  
	
	
	
	  INSERT INTO "commande"  
         ( "numero_commande",   
           "date_commande",   
           "code_fournisseur",
			  "reference_personnelle",
			  "code_praticien",
           "utilisateur",
			  "poste_utilisation",
           "mode_transport",   
           "delai_livraison_mois",   
           "delai_livraison_jours",   
           "frais_port",   
           "code_type_taxe",   
           "valeur_tva",   
           "libelle_livraison",
			  "commentaires")  
  VALUES ( :numero_commande,   
           :aujourdhui,   
           :code_fournisseur,
			  :reference_personnelle,
			  :code_praticien,
           :utilisateur_code,
			  :utilisateur_code,
           :transport,   
           :var_mois,   
           :var_jours,   
           :frais,   
           :type_taxe,   
           20.6,   
           :libelle,
			  :v_com)  ;
	IF SQLCA.SQLCode = -1 THEN 
		MessageBox("SQL error", SQLCA.SQLErrText)
		rollback ;
		close(this)
	else
		commit;
		dw_basic.retrieve(numero_commande)
	END IF
else
	//mise à jour d'une commande déjà saisie
	dw_basic.retrieve(numero_commande)
	dw_liste.retrieve(numero_commande,code_fournisseur)
	this.title = "Mise à Jour Commande"
end if

//préparation de la fenêtre
dw_recherche.insertrow(0)

em_designation.visible = false
cb_ajouter.enabled = false
em_prix.enabled = false
em_quantite.enabled = false
em_code_produit.visible = false
cb_rechercher.visible = false
st_remarque.visible = false
st_note_stock.visible = false
dw_taxe.setitem(dw_taxe.getrow(),"code_type_taxe","TTC")

uo_1.taille(this)



end event

event resize;
uo_1.retaille(this)

double ratio
		
ratio = uo_1.ratio
		
dw_basic.Object.DataWindow.zoom = string(int(ratio*100))
dw_data.Object.DataWindow.zoom = string(int(ratio*100))
dw_liste.Object.DataWindow.zoom = string(int(ratio*90 ))


///*if prems then
//	if lenv_obj.ScreenHeight = 600 then
//		uo_800x600.retaille(this)
//	else
//		uo_tag.retaille(this)
//	end if
//	prems = false
//end if
//*/
end event

event close;call super::close;integer compteur

dw_basic.accepttext()
dw_data.accepttext()
dw_liste.accepttext()

  SELECT count(*)  
    INTO :compteur  
    FROM "ligne_commande"  
   WHERE "ligne_commande"."numero_commande" = :numero_commande   ;

if compteur = 0 then
	supprimer()
end if


end event

type p_fond from w_fenetre_arakis`p_fond within w_saisie_commande
end type

type cb_fermer from uo_picturebutton_390x120 within w_saisie_commande
integer x = 3703
integer y = 2480
integer width = 503
integer taborder = 100
string text = "&Fermer"
string iconname = "ACTIONS_fermer.png"
end type

event clicked;call super::clicked;dw_basic.accepttext()
dw_data.accepttext()
dw_liste.accepttext()

if dw_basic.modifiedcount() > 0 or dw_basic.deletedcount()>0 or dw_data.modifiedcount() > 0 or dw_data.deletedcount()>0 or dw_liste.modifiedcount() > 0 or dw_liste.deletedcount()>0 Then
	If MessageBox("ATTENTION","Vous avez fait des modifications sur le fichier !~n~nVoulez-vous vraiment fermer cette fenêtre sans enregistrer (et ainsi perdre les modifications) ?",Question!,YesNo!, 2) = 1 Then
		fermer_fenetre(parent)
	end if
else
	fermer_fenetre(parent)
end if
end event

type cb_annuler from uo_picturebutton_390x120 within w_saisie_commande
integer x = 3173
integer y = 2480
integer width = 503
integer taborder = 100
string text = "&Annuler"
string iconname = "ACTIONS_annuler.png"
end type

event clicked;call super::clicked;rollback;
dw_liste.retrieve(numero_commande,code_fournisseur)
dw_basic.retrieve(numero_commande)
raz()
raz_total()
end event

type cb_enregistrer from uo_picturebutton_390x120 within w_saisie_commande
integer x = 2642
integer y = 2480
integer width = 503
integer taborder = 100
string text = "&Enregistrer"
string iconname = "ACTIONS_enregistrer.png"
end type

event clicked;call super::clicked;integer rapport_update1, rapport_update2 , rapport_update3

dw_basic.accepttext()
dw_data.accepttext()
dw_liste.accepttext()

rapport_update1 = dw_basic.Update()
rapport_update2 = dw_data.Update()
rapport_update3 = dw_liste.Update()

if rapport_update1 = 1 and rapport_update2 = 1 and rapport_update3 = 1 then
	commit using sqlca ;
else
	rollback using sqlca ;
	Messagebox("Attention","Erreur dans la mise a jour")
	cb_annuler.triggerevent(clicked!)
end if
end event

type cb_nouvelle from uo_picturebutton_390x120 within w_saisie_commande
integer x = 338
integer y = 2480
integer width = 503
integer taborder = 80
string text = "&Nouvelle"
string iconname = "ACTIONS_stock_nouvelle_ligne.png"
end type

event clicked;call super::clicked;dw_basic.accepttext()
dw_data.accepttext()
dw_liste.accepttext()

if dw_basic.modifiedcount() > 0 or dw_basic.deletedcount()>0 or dw_data.modifiedcount() > 0 or dw_data.deletedcount()>0 or dw_liste.modifiedcount() > 0 or dw_liste.deletedcount()>0 Then
	If MessageBox("ATTENTION","Vous avez fait des modifications sur le fichier !~n~nVoulez-vous vraiment fermer cette fenêtre sans enregistrer (et ainsi perdre les modifications) ?",Question!,YesNo!, 2) = 1 Then
		openwithparm(w_saisie_libelle_commande,"1")
	end if
else
	openwithparm(w_saisie_libelle_commande,"1")
end if
end event

type cb_reception from uo_picturebutton_390x120 within w_saisie_commande
integer x = 869
integer y = 2480
integer width = 503
integer taborder = 80
string text = "&Réception"
string iconname = "lc_stepin.png"
end type

event clicked;call super::clicked;dw_basic.accepttext()
dw_data.accepttext()
dw_liste.accepttext()

if dw_basic.modifiedcount() > 0 or dw_basic.deletedcount()>0 or dw_data.modifiedcount() > 0 or dw_data.deletedcount()>0 or dw_liste.modifiedcount() > 0 or dw_liste.deletedcount()>0 Then
	If MessageBox("ATTENTION","Vous avez fait des modifications sur le fichier !~n~nVoulez-vous vraiment fermer cette fenêtre sans enregistrer (et ainsi perdre les modifications) ?",Question!,YesNo!, 2) = 1 Then
		w_mdi_2020.uo_powerdock.of_openDocument(w_recherche_commande_reception, "Recherche Commande", m_orthokis_2020.m_gestion_de_stock.m_reception_commande.toolbarItemName)
		fermer_fenetre(parent)
	end if
else
	w_mdi_2020.uo_powerdock.of_openDocument(w_recherche_commande_reception, "Recherche Commande", m_orthokis_2020.m_gestion_de_stock.m_reception_commande.toolbarItemName)
	fermer_fenetre(parent)

end if


end event

type cb_rechercher from uo_picturebutton_390x120 within w_saisie_commande
integer x = 1230
integer y = 2144
integer width = 411
integer height = 124
integer taborder = 90
string text = "&Rechercher"
boolean default = true
end type

event clicked;call super::clicked;
rechercher()

//string clausew
//if rb_designation.checked then
//	clausew = " and produit.designation like '"+trim(em_designation.text)+"%'"
//	recuperer(clausew)
//end if
//if rb_code.checked then
//	clausew = " and produit.code_interne like '"+trim(em_code_produit.text)+"%'"
//	recuperer(clausew)
//end if
//if rb_reference_fournisseur.checked then
////	clausew = " WHERE reference_produit."+'~"reference~"'+" like '"+trim(em_reference_fournisseur.text)+"%'"
////	clausew = " WHERE "+'~"reference_produit~"' + "." + '~"reference~"'+" like '"+trim(em_reference_fournisseur.text)+"%'"
//	clausew = ""
//	ref_four = trim(em_reference_fournisseur.text)+"%'"
//	dw_resultat.retrieve(ref_four)
////	recuperer(clausew)
//end if
//
//
//
end event

type cb_supprimer from uo_picturebutton_390x120 within w_saisie_commande
integer x = 3218
integer y = 1592
integer width = 439
integer height = 128
integer taborder = 90
string text = "&Supprimer"
string iconname = "ACTIONS_supprimer.png"
end type

event clicked;call super::clicked;string code_produit
integer nb_ligne

if dw_liste.rowcount() = 0 then
	son(5)
	MessageBox("ATTENTION !","Aucun produit n'a été enregistré !")
else
//	code_produit = dw_liste.getitemstring(dw_liste.Getrow(),"ligne_commande_code_produit")
//	delete from ligne_commande 
//	where "code_produit" = :code_produit and "numero_commande" = :numero_commande;
//	nb_ligne = dw_liste.retrieve(numero_commande,code_fournisseur)
	dw_liste.deleterow(dw_liste.getrow())
end if
end event

type cb_ajouter from uo_picturebutton_390x120 within w_saisie_commande
integer x = 2752
integer y = 1592
integer width = 448
integer height = 136
integer taborder = 90
string text = "&Ajouter"
string iconname = "ACTIONS_ajouter.png"
end type

event clicked;call super::clicked;ajouter()


end event

type st_4 from statictext within w_saisie_commande
integer x = 2368
integer y = 1620
integer width = 55
integer height = 56
integer textsize = -9
fontcharset fontcharset = ansi!
string facename = "Arial"
long backcolor = 553648127
boolean enabled = false
string text = "€"
boolean focusrectangle = false
end type

type rte_1 from richtextedit within w_saisie_commande
boolean visible = false
integer x = 3182
integer y = 780
integer width = 571
integer height = 624
integer taborder = 90
boolean border = false
end type

type dw_edition from datawindow within w_saisie_commande
boolean visible = false
integer x = 2496
integer y = 584
integer width = 1111
integer height = 676
integer taborder = 80
string title = "none"
string dataobject = "dw_edition_bon_commande"
boolean border = false
boolean livescroll = true
end type

type st_note_stock from statictext within w_saisie_commande
integer x = 2738
integer y = 2376
integer width = 1047
integer height = 48
integer textsize = -8
fontcharset fontcharset = ansi!
string facename = "Arial"
boolean italic = true
long textcolor = 16711935
long backcolor = 553648127
boolean enabled = false
string text = "produit ne faisant pas partie de votre stock"
boolean focusrectangle = false
end type

type st_remarque from statictext within w_saisie_commande
integer x = 2734
integer y = 2328
integer width = 1047
integer height = 48
integer textsize = -8
fontcharset fontcharset = ansi!
string facename = "Arial"
boolean italic = true
long textcolor = 255
long backcolor = 553648127
boolean enabled = false
string text = "produit non référencé chez ce fournisseur"
boolean focusrectangle = false
end type

type em_resultat from editmask within w_saisie_commande
integer x = 1696
integer y = 2344
integer width = 247
integer height = 60
integer taborder = 90
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 15780518
boolean border = false
alignment alignment = right!
boolean displayonly = true
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = stringmask!
end type

type st_resultat from statictext within w_saisie_commande
integer x = 1957
integer y = 2344
integer width = 261
integer textsize = -9
fontcharset fontcharset = ansi!
string facename = "Arial"
long backcolor = 553648127
boolean enabled = false
string text = "Résultats"
boolean focusrectangle = false
end type

type em_code_produit from editmask within w_saisie_commande
integer x = 517
integer y = 2176
integer width = 699
integer height = 80
integer taborder = 110
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = stringmask!
end type

type rb_code from radiobutton within w_saisie_commande
integer x = 73
integer y = 2176
integer width = 439
integer height = 80
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 15780518
string text = "Code Produit"
end type

event clicked;em_reference_fournisseur.visible = false
em_designation.visible = false
sle_identifiant_udi.visible = false
dw_recherche.visible = false
em_code_produit.visible = true
cb_rechercher.visible = true
// depuis 2016 on efface pas la recherche précédente
//em_code_produit.text= ""
raz()
em_code_produit.setfocus()

end event

type dw_code from datawindow within w_saisie_commande
string tag = "brush"
integer x = 603
integer y = 1620
integer width = 576
integer height = 60
integer taborder = 90
boolean enabled = false
string title = "none"
string dataobject = "dw_code_produit"
boolean border = false
boolean livescroll = true
end type

type dw_resultat from u_basedw within w_saisie_commande
string tag = "brush"
integer x = 1701
integer y = 1772
integer width = 2843
integer height = 524
integer taborder = 60
string dataobject = "dw_produit_liste_commande"
boolean border = false
end type

event clicked;call super::clicked;if row > 0 then
	inserer()
end if
end event

type uo_1 from resize_fenetre within w_saisie_commande
boolean visible = false
integer x = 2139
integer y = 1752
integer taborder = 80
end type

on uo_1.destroy
call resize_fenetre::destroy
end on

type dw_taxe from datawindow within w_saisie_commande
integer x = 2418
integer y = 1620
integer width = 192
integer height = 60
integer taborder = 80
string title = "none"
string dataobject = "dw_code_type_taxe"
boolean border = false
boolean livescroll = true
end type

type em_prix from editmask within w_saisie_commande
integer x = 2007
integer y = 1608
integer width = 343
integer height = 80
integer taborder = 30
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
alignment alignment = right!
borderstyle borderstyle = stylelowered!
string mask = "#####0.00"
end type

type st_3 from statictext within w_saisie_commande
integer x = 1888
integer y = 1620
integer width = 224
integer textsize = -9
fontcharset fontcharset = ansi!
string facename = "Arial"
long backcolor = 553648127
boolean enabled = false
string text = "Prix"
boolean focusrectangle = false
end type

type dw_data from datawindow within w_saisie_commande
string tag = "brush"
integer x = 2853
integer y = 76
integer width = 1312
integer height = 488
integer taborder = 70
string title = "none"
string dataobject = "dw_commande_livraison_data"
boolean border = false
boolean livescroll = true
borderstyle borderstyle = styleraised!
end type

type dw_basic from datawindow within w_saisie_commande
string tag = "brush"
integer x = 23
integer y = 48
integer width = 2802
integer height = 532
string title = "none"
string dataobject = "dw_commande_basic_data"
boolean border = false
boolean livescroll = true
borderstyle borderstyle = styleraised!
end type

event buttonclicked;
string ls_object


ls_Object = String(dwo.name)
	
choose case ls_Object	
	case  "b_fournisseur" 
		OpenWithParm(w_fournisseur_fiche,this.getitemstring(this.getrow(),"code_fournisseur"))
	case "b_date_envoi"
		if row > 0 then
			this.setitem(row, "date_envoi", now())
		end if
	case "b_patient" 
		open(w_cherche)
		if var_suite then
			SetItem(row, "code_patient", var_code)
			SetItem(row, "nom_patient", var_nom+ "  (" + string(var_numero_dossier) + ")")
		end if
	case "b_raz_patient"
		long v_nul
		setnull(v_nul)
		setItem(row, "code_patient", v_nul)
		SetItem(row, "nom_patient", "")

end choose



end event

type dw_liste from u_basedw within w_saisie_commande
string tag = "grid brush"
integer x = 50
integer y = 668
integer width = 4517
integer height = 816
integer taborder = 120
string dataobject = "dw_saisie_ligne_commande_2"
boolean border = false
end type

type dw_recherche from datawindow within w_saisie_commande
string tag = "no resizeall brush"
integer x = 517
integer y = 1764
integer width = 919
integer height = 164
integer taborder = 90
string title = "none"
string dataobject = "dw_recherche_produit"
boolean border = false
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event itemchanged;string clausew, rapport
integer nb_row

if dwo.name = 'type_produit_code_categorie_produit' then
	idw_type.retrieve(data)
	dw_recherche.setitem(dw_recherche.getrow(),"produit_code_type_produit","")
end if
if dwo.name = 'produit_code_type_produit' then
	//clausew = " WHERE produit.code_type_produit = '"+data+"'"
	//recuperer(clausew)
	type_produit_recherche = data
	rechercher()
end if
end event

type em_designation from editmask within w_saisie_commande
integer x = 517
integer y = 1944
integer width = 1125
integer height = 80
integer taborder = 100
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = stringmask!
end type

type rb_designation from radiobutton within w_saisie_commande
integer x = 73
integer y = 1944
integer width = 402
integer height = 80
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 15780518
string text = "Désignation"
end type

event clicked;em_reference_fournisseur.visible = false
em_designation.visible = true
dw_recherche.visible = false
em_code_produit.visible = false
cb_rechercher.visible = true
// depuis 2016 on efface pas la recherche précédente
//em_designation.text = ""
raz()
em_designation.setfocus()

end event

type rb_type from radiobutton within w_saisie_commande
integer x = 73
integer y = 1804
integer width = 416
integer height = 80
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 15780518
string text = "Type Produit"
boolean checked = true
end type

event clicked;em_reference_fournisseur.visible = false
em_designation.visible = false
dw_recherche.visible = true
sle_identifiant_udi.visible = false

// depuis 2016 on efface pas la recherche précédente
//dw_recherche.reset()
//dw_recherche.insertrow(0)
em_code_produit.visible = false
cb_rechercher.visible = false
raz()
dw_recherche.setfocus()

end event

type em_quantite from editmask within w_saisie_commande
integer x = 1445
integer y = 1608
integer width = 402
integer height = 80
integer taborder = 20
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
string mask = "####"
end type

event getfocus;em_quantite.selecttext(1,4)
end event

type st_2 from statictext within w_saisie_commande
integer x = 1193
integer y = 1620
integer width = 315
integer textsize = -9
fontcharset fontcharset = ansi!
string facename = "Arial"
long backcolor = 553648127
boolean enabled = false
string text = "Quantité"
boolean focusrectangle = false
end type

type st_1 from statictext within w_saisie_commande
integer x = 91
integer y = 1620
integer width = 402
integer height = 64
integer textsize = -9
fontcharset fontcharset = ansi!
string facename = "Arial"
long backcolor = 553648127
boolean enabled = false
string text = "Code Produit"
boolean focusrectangle = false
end type

type cb_imprimer from uo_picturebutton_390x120 within w_saisie_commande
integer x = 2112
integer y = 2480
integer width = 503
integer taborder = 110
boolean bringtotop = true
string text = "&Impr. / Email"
string iconname = "ACTIONS_imprimer.png"
end type

event clicked;call super::clicked;
if dw_liste.rowcount() = 0 then
	son(5)
	MessageBox("ATTENTION !","Aucune commande n'a été saisi !")
else
	cb_enregistrer.triggerevent(clicked!)
	
	openwithparm(w_commande_impression,numero_commande)

	// Pour raffraichier date envoi si besoin
	dw_basic.retrieve(numero_commande)

end if
end event

type rb_reference_fournisseur from radiobutton within w_saisie_commande
integer x = 73
integer y = 2060
integer width = 402
integer height = 80
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 15780518
string text = "Réf. Fourn."
end type

event clicked;em_reference_fournisseur.visible = true
em_designation.visible = false
sle_identifiant_udi.visible = false
dw_recherche.visible = false
em_code_produit.visible = false
cb_rechercher.visible = true
// depuis 2016 on efface pas la recherche précédente
//em_reference_fournisseur.text = ""
raz()
em_reference_fournisseur.setfocus()

end event

type em_reference_fournisseur from editmask within w_saisie_commande
boolean visible = false
integer x = 517
integer y = 2060
integer width = 1125
integer height = 80
integer taborder = 110
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = stringmask!
end type

type rb_identifiant_udi from radiobutton within w_saisie_commande
integer x = 73
integer y = 2292
integer width = 439
integer height = 80
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 15780518
string text = "Identifiant UDI"
end type

event clicked;em_reference_fournisseur.visible = false
em_designation.visible = false
sle_identifiant_udi.visible = true
dw_recherche.visible = false
em_code_produit.visible = false
cb_rechercher.visible = true
// depuis 2016 on efface pas la recherche précédente
//em_code_produit.text= ""
raz()

sle_identifiant_udi.setfocus()

sle_identifiant_udi.visible = true
open(w_udi_lecture)

str_udi v_udi
v_udi = message.PowerObjectParm

if not isnull(v_udi.di) then
	sle_identifiant_udi.text = v_udi.di
	cb_rechercher.triggerevent(clicked!)
end if
end event

type sle_identifiant_udi from singlelineedit within w_saisie_commande
boolean visible = false
integer x = 517
integer y = 2292
integer width = 512
integer height = 80
integer taborder = 120
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
integer limit = 14
borderstyle borderstyle = stylelowered!
end type

type pb_udi from picturebutton within w_saisie_commande
integer x = 1335
integer y = 2276
integer width = 123
integer height = 116
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
string powertiptext = "Scan du code barre pour saisir l~'identifiant UDI"
end type

event clicked;
rb_identifiant_udi.checked = true
rb_identifiant_udi.triggerevent(clicked!)

end event

type gb_1 from groupbox within w_saisie_commande
integer x = 14
integer width = 2821
integer height = 592
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 15780518
string text = "Entête"
end type

type gb_2 from groupbox within w_saisie_commande
integer x = 2843
integer width = 1344
integer height = 592
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

type gb_3 from groupbox within w_saisie_commande
integer x = 23
integer y = 600
integer width = 4581
integer height = 916
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 15780518
string text = "Lignes Commande"
end type

type gb_4 from groupbox within w_saisie_commande
integer x = 59
integer y = 1700
integer width = 1595
integer height = 728
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 15780518
string text = "Critères Recherche Produit"
end type

type gb_5 from groupbox within w_saisie_commande
integer x = 1682
integer y = 1704
integer width = 2898
integer height = 624
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 15780518
string text = "Résultats Recherche"
end type

type gb_6 from groupbox within w_saisie_commande
integer x = 23
integer y = 1540
integer width = 4585
integer height = 924
integer taborder = 130
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 15780518
string text = "Ajout Produit"
end type

