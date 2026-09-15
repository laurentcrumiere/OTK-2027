$PBExportHeader$w_tracabilite_fiche.srw
forward
global type w_tracabilite_fiche from w_fenetre_arakis
end type
type cb_supprimer from uo_picturebutton_250x120 within w_tracabilite_fiche
end type
type pb_enregistrer from uo_picturebutton_250x120 within w_tracabilite_fiche
end type
type cb_fermer from uo_picturebutton_250x120 within w_tracabilite_fiche
end type
type cb_ajouter from uo_picturebutton_390x120 within w_tracabilite_fiche
end type
type cb_imprimer from uo_picturebutton_250x120 within w_tracabilite_fiche
end type
type cbx_1 from checkbox within w_tracabilite_fiche
end type
type dw_produit from datawindow within w_tracabilite_fiche
end type
type st_5 from statictext within w_tracabilite_fiche
end type
type dw_resultat from u_basedw within w_tracabilite_fiche
end type
type dw_lieu from datawindow within w_tracabilite_fiche
end type
type dw_liste from u_basedw within w_tracabilite_fiche
end type
type dw_choix from datawindow within w_tracabilite_fiche
end type
type rb_type from radiobutton within w_tracabilite_fiche
end type
type rb_code_barre from radiobutton within w_tracabilite_fiche
end type
type rb_liste from radiobutton within w_tracabilite_fiche
end type
type rb_produit from radiobutton within w_tracabilite_fiche
end type
type gb_2 from groupbox within w_tracabilite_fiche
end type
type gb_3 from groupbox within w_tracabilite_fiche
end type
type gb_4 from groupbox within w_tracabilite_fiche
end type
type dw_invisible from datawindow within w_tracabilite_fiche
end type
type pb_1 from uo_picturebutton_250x120 within w_tracabilite_fiche
end type
type pb_2 from uo_picturebutton_250x120 within w_tracabilite_fiche
end type
type pb_3 from uo_picturebutton_250x120 within w_tracabilite_fiche
end type
type pb_4 from uo_picturebutton_250x120 within w_tracabilite_fiche
end type
type dw_sortie from datawindow within w_tracabilite_fiche
end type
type gb_1 from groupbox within w_tracabilite_fiche
end type
type st_lieu from statictext within w_tracabilite_fiche
end type
type dw_ste from u_basedw within w_tracabilite_fiche
end type
type pb_5 from uo_picturebutton_250x120 within w_tracabilite_fiche
end type
type pb_udi from picturebutton within w_tracabilite_fiche
end type
type sle_code_barre from singlelineedit within w_tracabilite_fiche
end type
end forward

global type w_tracabilite_fiche from w_fenetre_arakis
integer width = 4247
integer height = 2868
string title = "Fiche de Tracabilité"
windowtype windowtype = response!
cb_supprimer cb_supprimer
pb_enregistrer pb_enregistrer
cb_fermer cb_fermer
cb_ajouter cb_ajouter
cb_imprimer cb_imprimer
cbx_1 cbx_1
dw_produit dw_produit
st_5 st_5
dw_resultat dw_resultat
dw_lieu dw_lieu
dw_liste dw_liste
dw_choix dw_choix
rb_type rb_type
rb_code_barre rb_code_barre
rb_liste rb_liste
rb_produit rb_produit
gb_2 gb_2
gb_3 gb_3
gb_4 gb_4
dw_invisible dw_invisible
pb_1 pb_1
pb_2 pb_2
pb_3 pb_3
pb_4 pb_4
dw_sortie dw_sortie
gb_1 gb_1
st_lieu st_lieu
dw_ste dw_ste
pb_5 pb_5
pb_udi pb_udi
sle_code_barre sle_code_barre
end type
global w_tracabilite_fiche w_tracabilite_fiche

type variables
str_traca struct
string code_lieu_utilisation,code_praticien
datawindowchild idw_code_produit, idw_code_barre

string v_sortie_stock_en_tracabilite
long v_quantite_ajout
end variables

forward prototypes
public subroutine effacer ()
public subroutine ajouter ()
public subroutine ajout_liste ()
public subroutine inserer (double code_barre)
end prototypes

public subroutine effacer ();dw_resultat.visible = false
dw_resultat.reset()
st_5.visible = false
end subroutine

public subroutine ajouter ();//ajoute un produit dans l'historique grace à inserer()
//on recupère le code barre du produit à ajouter
//on vérifie que le code barre existe bien puis on appelle inserer(code barre)

double code_barre
integer compteur
long lig
boolean v_suite

if rb_code_barre.checked then
	code_barre = double(sle_code_barre.text)
end if
if rb_type.checked then
	code_barre = dw_produit.getitemnumber(dw_produit.getrow(),"code_barre")
end if

select count(*)
 into :compteur
 from stock_produit
 where code_barre = :code_barre; 
 
if compteur = 1 then
	// C'est bien un produit du stock ....
	
	if v_sortie_stock_en_tracabilite = "O" then
		// SORTIE DE STOCK !!!!
	
		// 2 pour sortie "traçabilité"
		param_win[1] = string(code_barre)
		openWithParm(w_sortie_stock,2)
		v_quantite_ajout = Message.DoubleParm
		
		// Si -1 c'est erreur ou annulé
		if v_quantite_ajout <> -1 then
			
			inserer(code_barre)
			
			dw_liste.retrieve(struct.code_patient,struct.date_rdv,struct.date_rdv)
			sle_code_barre.text = ""
			sle_code_barre.setfocus()
		end if
			
	else
		
		v_quantite_ajout = 1
		inserer(code_barre)
		dw_liste.retrieve(struct.code_patient,struct.date_rdv,struct.date_rdv)
		sle_code_barre.text = ""
		sle_code_barre.setfocus()
		
	end if
else
	if profileString(dir_ini+inifile_orthokis,"Stock_Tracabilité","pas_alerte_sterilisation","N") = "O" then 
		v_suite = true
	else
		if messagebox("Attention","Ce code barre ne correspond à aucun produit en stock.~n~nAjout d'une stérilisation ?",Question!, YesNo!, 1) = 1 then
			v_suite = true
		else
			v_suite = false
		end if
	end if
	if v_suite then
		dw_ste.insertrow(0)
		lig = dw_ste.rowcount()
		dw_ste.Setitem(lig, "date_saisie", today())
		dw_ste.Setitem(lig, "date_sterilisation", today())
		dw_ste.Setitem(lig, "code_patient", struct.code_patient)
		dw_ste.Setitem(lig, "code_sterilisation", sle_code_barre.text)
		sle_code_barre.text = ""
	end if
end if
end subroutine

public subroutine ajout_liste ();//on ajoute une liste de produit
//pour cela on récupère la liste dans dw_invisible ce sui nous permet en parcourant la
//dw de traiter les produits de la liste un par un
//pour un produit de la liste on connait son fournisseur et son code produit
//il nous faut récupérer si possible un code barre en fonction de certains critères de priorités

//première distinction : 
//      il existe des produits passés dans un stock qui ont ce référencement
//					on affiche alors un code barre selon une liste de priorite
//      il n'existe aucun produit passés dans un stock ayant ce referencement
//					on affiche dans dw_résultat le code produit et le fournisseur
//					pour que l'utilisateur sache que toute sa liste n'a pas été récupéré

//Critères de priorités :
//		1) le lieu d'utilisation : si on trouve dans l'historique de sortie des produits
//				ayant ce référencement et le lieu d'utilisation indiqué en haut de la fiche 
//				on prend celui ayant la plus récente date de sortie
//		2) le praticien : si on trouve dans l'historique de sortie des produits appartenant au
//				stock du praticien de la fiche de traca et ayant de référencement on sélectionne
//				celui ayant la plus récente date de sortie

integer nb_row //nombre d'éléments de la liste de produit
integer i //pour la boucle for
integer compteur //pour le premier critère de distinction

//variable du produit de la liste qu'on est en train de traiter dans la boucle
string code_fournisseur_courant
string code_produit_courant
string designation_courante
string code_type_produit_courant

//variable résultat de la recherche selon les critères de priorités
double code_barre
date date_sortie_courante

nb_row = dw_invisible.retrieve(dw_choix.getitemstring(dw_choix.getrow(),"code"))
FOR i = 1 to nb_row
	code_fournisseur_courant = dw_invisible.getitemstring(i,"code_fournisseur")
	code_produit_courant = dw_invisible.getitemstring(i,"code_produit")
	
	  SELECT count(*)  
	    INTO :compteur  
	    FROM "stock_produit"  
	   WHERE ( "stock_produit"."code_produit" = :code_produit_courant ) AND  
	         ( "stock_produit"."code_fournisseur" = :code_fournisseur_courant )   ;

	if compteur > 0 then
		
		SELECT MAX("historique_es"."date")  
		 INTO :date_sortie_courante
	    FROM "historique_es",   
	         "stock_produit"  
	   WHERE (( "stock_produit"."code_barre" = "historique_es"."code_barre" ) and  
	         ( "stock_produit"."code_produit" = :code_produit_courant ) AND  
	         ( "stock_produit"."code_fournisseur" = :code_fournisseur_courant ) AND
				( "historique_es"."code_es" = 's' )  AND
	         ( "historique_es"."code_lieu_utilisation" = :code_lieu_utilisation ))    ;

		if isnull(date_sortie_courante) or date_sortie_courante = date(1900,1,1) then
			//premier critère de priorité a échouer
		  SELECT MAX("historique_es"."date")  
		    INTO :date_sortie_courante
		    FROM "historique_es",   
   	      "stock_produit"  
		   WHERE ( "stock_produit"."code_barre" = "historique_es"."code_barre" ) and  
      		   ( ( "historique_es"."code_es" = 's' ) AND  
		         ( "stock_produit"."code_produit" = :code_produit_courant ) AND  
		         ( "stock_produit"."code_fournisseur" = :code_fournisseur_courant ) AND  
      		   ( "stock_produit"."code_praticien" = :code_praticien ) )   ;
			
			if isnull(date_sortie_courante) or date_sortie_courante = date(1900,1,1) then
		  		//deuxième critère à échouer
				SELECT MAX("stock_produit"."code_barre")  
		    	INTO :code_barre  
		    	FROM "stock_produit"  
	   		WHERE ( "stock_produit"."code_produit" = :code_produit_courant ) AND  
 	     	   	( "stock_produit"."code_fournisseur" = :code_fournisseur_courant );
				inserer(code_barre)
			else
				//deuxième critère à réussi on insere le code barre correspondant
				  SELECT "stock_produit"."code_barre"  
				    INTO :code_barre  
				    FROM "historique_es",   
				         "stock_produit"  
				   WHERE ( "stock_produit"."code_barre" = "historique_es"."code_barre" ) and  
 				        ( ( "historique_es"."code_es" = 's' ) AND  
  				     	  ( "historique_es"."date" = :date_sortie_courante ) AND  
 				        ( "stock_produit"."code_produit" = :code_produit_courant ) AND  
 			   	     ( "stock_produit"."code_fournisseur" = :code_fournisseur_courant ) )   ;
					inserer(code_barre)
			end if
		else
			//premier critère a réussi on insère le code barre correspondant
			  SELECT "stock_produit"."code_barre"  
			    INTO :code_barre  
			    FROM "historique_es",   
			         "stock_produit"  
			   WHERE ( "stock_produit"."code_barre" = "historique_es"."code_barre" ) and  
 			        ( ( "historique_es"."code_es" = 's' ) AND  
  			     	  ( "historique_es"."date" = :date_sortie_courante ) AND  
 			        ( "stock_produit"."code_produit" = :code_produit_courant ) AND  
 			        ( "stock_produit"."code_fournisseur" = :code_fournisseur_courant ) )   ;
				inserer(code_barre)
		end if
	else
		//aucun produit avec ces références n'est passé dans leur stock
		//on lui affiche la fenêtre des produits infructueux dw_resultat
		  SELECT "produit"."code_type_produit",   
       	  "produit"."designation"  
    		INTO :code_type_produit_courant,   
         		:designation_courante  
    		FROM "produit"  
   	  WHERE "produit"."code_interne" = :code_produit_courant   ;
		dw_resultat.visible = true
		st_5.visible = true
		dw_resultat.insertrow(0)
		dw_resultat.setitem(dw_resultat.rowcount(),"reference_produit_code_produit",code_produit_courant)
		dw_resultat.setitem(dw_resultat.rowcount(),"reference_produit_code_fournisseur",code_fournisseur_courant)
		dw_resultat.setitem(dw_resultat.rowcount(),"produit_code_type_produit",code_type_produit_courant)
		dw_resultat.setitem(dw_resultat.rowcount(),"produit_designation",designation_courante)
	end if
NEXT
dw_liste.retrieve(struct.code_patient,struct.date_rdv,struct.date_rdv)

end subroutine

public subroutine inserer (double code_barre);//insère une ligne dans l'historique

integer compteur //pour verification de l'existance du code barre
integer color_ligne //pour la couleur des champs de la ligne en fonction du critère de durée

//variables propres au produit qu'on insère
integer duree //pour stocker la durée d'utilisation limite du produit
date date_sortie //date de sortie du produit
date date_ste //date de sté du produit si elle existe
string code_lieu_utilisation_courant //lieu utilisation du produit
string code_produit_courant //code produit du produit
string code_praticien_courant //code praticien du produit
string en_cycle //determine si le produit est dans un cycle de sté ou pas

date v_date_peremption

color_ligne = 0 //on initialise la couleur de la ligne à noire

//verif de l'existence du code barre
select count(*)
 into :compteur
 from stock_produit
 where code_barre = :code_barre;

if compteur = 1 then
	//on récupère la date de stérilisation du produit s'il y en a une et la date de péremption
  SELECT "stock_produit"."date_sterilisation","stock_produit"."cycle_sterilisation"  ,  "stock_produit"."date_peremption"
    INTO :date_ste,:en_cycle, :v_date_peremption
    FROM "stock_produit"  
   WHERE "stock_produit"."code_barre" = :code_barre   ;
	
	if en_cycle = 'o' then
		  UPDATE "stock_produit"  
		     SET "cycle_sterilisation" = 'n'  
		   WHERE "stock_produit"."code_barre" = :code_barre;
			
		commit;
	end if
	
	
	// Alerte sur la date de péremption
	if v_date_peremption < today() then
		Messagebox("ATTENTION","La date de péremption de ce produit est dépassée depuis "+string(daysafter(v_date_peremption, today()))+" jour(s).~n~n("+string(v_date_peremption)+")")
	end if
	
	//on récupère la dernière date de sortie de stock du produit pour le lieu d'utilisation indiqué dans la fiche traca
	SELECT MAX("historique_es"."date")  
    INTO :date_sortie
    FROM "historique_es"  
   WHERE ( "historique_es"."code_barre" = :code_barre ) AND  
         ( "historique_es"."code_es" = 's' )   AND
			( "historique_es"."code_lieu_utilisation" = :code_lieu_utilisation );	

	if isnull(date_sortie) or date_sortie = date(1900,1,1) then
		//aucun produit n'a été sorti pour le lieu indiqué dans la fiche traca
		//on récupère la dernière date de sortie du produit
		SELECT MAX("historique_es"."date")
   	 INTO :date_sortie
	  	 FROM "historique_es"  
	   WHERE ( "historique_es"."code_barre" = :code_barre ) AND  
  		      ( "historique_es"."code_es" = 's' );
		//on récupère un lieu de sortie pour ce produit et cette date
		//il peut y en avoir plusieurs en théorie, généralement il n'y en aura mm pas, on choisit donc le max
	  SELECT MAX("historique_es"."code_lieu_utilisation")  
	    INTO :code_lieu_utilisation_courant  
   	 FROM "historique_es"  
	   WHERE ( "historique_es"."code_barre" = :code_barre ) AND  
	         ( "historique_es"."code_es" = 's' ) AND  
   	      ( "historique_es"."date" = :date_sortie )   ;
	else
		//le lieu d'utilisation est le lieu indiqué dans la fiche de tracabilite
		code_lieu_utilisation_courant = code_lieu_utilisation		
	end if

	if date_sortie = date(1900,1,1) then
		//précaution pour le insert à suivre
		//prog défencsive ne devrait jamais arrivé
		setnull(date_sortie)
	else
		//on récupère la durée d'utilisation limite du produit
	  	SELECT "stock_produit"."code_produit","stock_produit"."code_praticien"  
	    INTO :code_produit_courant ,:code_praticien_courant
	    FROM "stock_produit"  
	   WHERE "stock_produit"."code_barre" = :code_barre   ;

		SELECT isnull("param_stock_produit"."duree_limite_utilisation"  , 0)
	    INTO :duree  
	    FROM "param_stock_produit"  
	   WHERE ( "param_stock_produit"."code_produit" = :code_produit_courant ) AND  
	         ( "param_stock_produit"."code_praticien" = :code_praticien_courant )   ;
		
		
		if duree > 0 then	// Modif v16.03e
		
			if isnull(date_ste) or date_ste = date(1900,1,1) then
				if DaysAfter(date_sortie,struct.date_rdv) > duree * 30 then
					//si l'écart entre dernière date de sortie et la date du rdv est > duree limite on affiche la ligne en rouge
					color_ligne = 255
				end if
				setnull(date_ste)
			else
				if DaysAfter(date_ste,struct.date_rdv) > duree * 30 then
					//si l'écart entre dernière date de sortie et la date du rdv est > duree limite on affiche la ligne en rouge
					color_ligne = 255
				end if
				setnull(date_sortie)
			end if
		end if
	end if
	
	
	// depuis version 15.00h, si le produit est déjà dans la liste, on incrémente le compteur
	
	long lig
	
	lig = dw_liste.find("fiche_tracabilite_code_barre = " + string(code_barre), 0, 99999 )
	
	if lig > 0 then 
		// la ligne existe deja ...
		dw_liste.setitem(lig, "fiche_tracabilite_nb_unite" , dw_liste.getitemnumber(lig, "fiche_tracabilite_nb_unite") + v_quantite_ajout)
		
		if dw_liste.update() = 1 then
			commit ;
		else
			rollback ;
		end if

	else
	
		//on fait le insert, comme lieu_utilisation est une foreign key vers lieu on
		//ne peut pas le mettre à ""
		//on fait donc des insert différents si on a ou on n'a pas le code lieu utilisation
		if code_lieu_utilisation_courant = "" then
			insert into "fiche_tracabilite"
				("code_patient","code_barre","date_rdv","nb_unite","date_sortie","couleur_ligne","lieu_rdv","date_sterilisation")
				values(:struct.code_patient,:code_barre,:struct.date_rdv, :v_quantite_ajout,:date_sortie,:color_ligne,:code_lieu_utilisation,:date_ste);
		else
			insert into "fiche_tracabilite"
				("code_patient","code_barre","date_rdv","nb_unite","date_sortie","lieu","couleur_ligne","lieu_rdv","date_sterilisation")
				values(:struct.code_patient,:code_barre,:struct.date_rdv,:v_quantite_ajout,:date_sortie,:code_lieu_utilisation_courant,:color_ligne,:code_lieu_utilisation,:date_ste);
		end if
		IF SQLCA.SQLCode = -1 THEN 
			rollback ;
			MessageBox("Attention","Vous avez déjà saisi ce code barre")
		else
			commit;
		END IF
	end if
else
	messagebox("Attention","Aucun de votre stock n'a eu ce code barre")
end if
end subroutine

on w_tracabilite_fiche.create
int iCurrent
call super::create
this.cb_supprimer=create cb_supprimer
this.pb_enregistrer=create pb_enregistrer
this.cb_fermer=create cb_fermer
this.cb_ajouter=create cb_ajouter
this.cb_imprimer=create cb_imprimer
this.cbx_1=create cbx_1
this.dw_produit=create dw_produit
this.st_5=create st_5
this.dw_resultat=create dw_resultat
this.dw_lieu=create dw_lieu
this.dw_liste=create dw_liste
this.dw_choix=create dw_choix
this.rb_type=create rb_type
this.rb_code_barre=create rb_code_barre
this.rb_liste=create rb_liste
this.rb_produit=create rb_produit
this.gb_2=create gb_2
this.gb_3=create gb_3
this.gb_4=create gb_4
this.dw_invisible=create dw_invisible
this.pb_1=create pb_1
this.pb_2=create pb_2
this.pb_3=create pb_3
this.pb_4=create pb_4
this.dw_sortie=create dw_sortie
this.gb_1=create gb_1
this.st_lieu=create st_lieu
this.dw_ste=create dw_ste
this.pb_5=create pb_5
this.pb_udi=create pb_udi
this.sle_code_barre=create sle_code_barre
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_supprimer
this.Control[iCurrent+2]=this.pb_enregistrer
this.Control[iCurrent+3]=this.cb_fermer
this.Control[iCurrent+4]=this.cb_ajouter
this.Control[iCurrent+5]=this.cb_imprimer
this.Control[iCurrent+6]=this.cbx_1
this.Control[iCurrent+7]=this.dw_produit
this.Control[iCurrent+8]=this.st_5
this.Control[iCurrent+9]=this.dw_resultat
this.Control[iCurrent+10]=this.dw_lieu
this.Control[iCurrent+11]=this.dw_liste
this.Control[iCurrent+12]=this.dw_choix
this.Control[iCurrent+13]=this.rb_type
this.Control[iCurrent+14]=this.rb_code_barre
this.Control[iCurrent+15]=this.rb_liste
this.Control[iCurrent+16]=this.rb_produit
this.Control[iCurrent+17]=this.gb_2
this.Control[iCurrent+18]=this.gb_3
this.Control[iCurrent+19]=this.gb_4
this.Control[iCurrent+20]=this.dw_invisible
this.Control[iCurrent+21]=this.pb_1
this.Control[iCurrent+22]=this.pb_2
this.Control[iCurrent+23]=this.pb_3
this.Control[iCurrent+24]=this.pb_4
this.Control[iCurrent+25]=this.dw_sortie
this.Control[iCurrent+26]=this.gb_1
this.Control[iCurrent+27]=this.st_lieu
this.Control[iCurrent+28]=this.dw_ste
this.Control[iCurrent+29]=this.pb_5
this.Control[iCurrent+30]=this.pb_udi
this.Control[iCurrent+31]=this.sle_code_barre
end on

on w_tracabilite_fiche.destroy
call super::destroy
destroy(this.cb_supprimer)
destroy(this.pb_enregistrer)
destroy(this.cb_fermer)
destroy(this.cb_ajouter)
destroy(this.cb_imprimer)
destroy(this.cbx_1)
destroy(this.dw_produit)
destroy(this.st_5)
destroy(this.dw_resultat)
destroy(this.dw_lieu)
destroy(this.dw_liste)
destroy(this.dw_choix)
destroy(this.rb_type)
destroy(this.rb_code_barre)
destroy(this.rb_liste)
destroy(this.rb_produit)
destroy(this.gb_2)
destroy(this.gb_3)
destroy(this.gb_4)
destroy(this.dw_invisible)
destroy(this.pb_1)
destroy(this.pb_2)
destroy(this.pb_3)
destroy(this.pb_4)
destroy(this.dw_sortie)
destroy(this.gb_1)
destroy(this.st_lieu)
destroy(this.dw_ste)
destroy(this.pb_5)
destroy(this.pb_udi)
destroy(this.sle_code_barre)
end on

event open;call super::open;//fiche de tracabilite

colore_tous_objets_window(this, couleur_fond_fenetre)

//plusieurs mode de recherce des produits possibles
//   par code barre : le mode par default et le plus fiable
//   par code produit : on choisit un type de produit puis le déroulant suivant 
//								nous donne le choix entre differents produit en stock
//   par liste : assez complexe, on recupere les produits en stock correspondant à ceux
//					indiqués dans la liste avec des critères de priorité car pour un produit
//             de la liste il peut y avoir beaucoup de produits en stock correspondant
//					voir ajout_liste() pour plus de détails sur les priorités

//une fois le ou les produits choisi affichage du(des) résultat(s) dans la liste des produits
//affichage en couleur pour les produits dont la date limite d'utilisation dépassé
dw_liste.settransobject(sqlca) //historique de ltracabilité
dw_choix.settransobject(sqlca) //choix de la liste de produit
dw_lieu.settransobject(sqlca) //affichage du lieu
dw_invisible.settransobject(sqlca) //résultat de la recherche de la liste de produit,sert uniquement à passer en revue les produits d'une liste
dw_produit.settransobject(sqlca) //choix du type de produit 
dw_produit.getchild("code_produit",idw_code_produit)
idw_code_produit.settransobject(sqlca)
idw_code_produit.insertrow(0)
dw_produit.getchild("code_barre",idw_code_barre)
idw_code_barre.settransobject(sqlca)
idw_code_barre.insertrow(0)


dw_ste.settransobject(sqlca)

// Ordre de tri
if profileString(dir_ini+inifile_orthokis,"Stock_Tracabilité","tri_fenetre_tracabilite","C") = "D" then
	// Par défaut les dw sont en ordre croissant
	dw_liste.setSort("fiche_tracabilite_date_rdv desc, fiche_tracabilite_code_barre asc, reference_produit_code_produit asc, stock_produit_code_fournisseur asc")
	dw_liste.Sort()
	dw_ste.setSort("date_saisie desc, code_sterilisation asc, date_sterilisation asc")
	dw_ste.Sort()
end if

// pour gérer la suppression des sortie de stocks
dw_sortie.settransobject(sqlca)

//passage de paramètres : code patient, date rdv
struct = message.powerobjectparm

//dw_nom.insertrow(0)
//dw_prenom.insertrow(0)
//dw_date.insertrow(0)
dw_lieu.insertrow(0)

//dw_date.Setitem(dw_date.getrow(),"date_rdv",struct.date_rdv)
//dw_prenom.setitem(dw_prenom.getrow(),"code",struct.code_patient)
//dw_nom.setitem(dw_nom.getrow(),"code",struct.code_patient)
code_praticien = struct.code_praticien

  SELECT "fiche_tracabilite"."lieu_rdv"  
    INTO :code_lieu_utilisation
    FROM "fiche_tracabilite"  
   WHERE ( "fiche_tracabilite"."code_patient" = :struct.code_patient ) AND  
         ( "fiche_tracabilite"."date_rdv" = :struct.date_rdv )   ;

dw_lieu.setitem(dw_lieu.getrow(),"code",code_lieu_utilisation)

dw_choix.visible = false
dw_invisible.visible = false



dw_liste.retrieve(struct.code_patient,struct.date_rdv,struct.date_rdv)
dw_ste.retrieve(struct.code_patient,struct.date_rdv,struct.date_rdv)


dw_resultat.visible = false
st_5.visible = false
dw_produit.visible = false
dw_produit.insertrow(0)

centrer(this)


select top 1 sortie_stock_en_tracabilite into :v_sortie_stock_en_tracabilite from param ;

if v_sortie_stock_en_tracabilite = "O" then
	// Si sortie de stock ici ... pas de possibilité de modifier les quantités en live
	pb_enregistrer.visible = false
	dw_liste.modify("fiche_tracabilite_nb_unite.TabSequence = 0")
end if


// Spécifique Favali
if serial = '87230' then
	rb_produit.visible = true
	rb_liste.visible = true
	dw_lieu.visible = true
	st_lieu.visible = true
	rb_produit.setfocus()
end if


// lecture du code barre par défaut
sle_code_barre.setfocus()

end event

event close;call super::close;

// Vérification de l'existence d'un commentaire à la date du jour si saisie à la late du jour
long v_cpt1, v_cpt2 , v_cpt3
double v_patient

v_patient = struct.code_patient

select count(*) into :v_cpt1 from fiche_tracabilite 
where date_rdv = cast(getdate() as date) and code_patient = :v_patient ;

select count(*) into :v_cpt2 from sterilisation  
where date_saisie = cast(getdate() as date) ;


if v_cpt1 + v_cpt2 > 0 then
	// Y a une saisie ce jour .. y a t il un commentaire ?
	select count(*) into :v_cpt3 from coment  
	where dat = cast(getdate() as date) and code = :v_patient ;
	
	if v_cpt3 = 0 then
		// On ajoute un commentaire vierge ... si option à "O"
		string v_ajout_commentaire
		select top 1 isnull("ajout_commentaire_tracabilite",'O') into :v_ajout_commentaire from param ;
		
		if v_ajout_commentaire = "O" then
			string v_com
			double v_couleur_noire, v_couleur_blanche
			double v_code_interne_rdv
			v_couleur_noire = couleur_noire
			v_couleur_blanche = couleur_blanche
			v_com = string_to_rtf(' ', couleur_noire, couleur_blanche)
			v_code_interne_rdv = fxg_rdv_pour_commentaire(v_patient,datetime(today(), now()))
			
			
			insert into coment (code, dat, ordre, date_modif, user_modif, com, com_html, coul_texte, coul_fond, code_interne_rdv)
			values (:v_patient, cast(getdate() as date), 1, getdate(), :utilisateur_code , :v_com , ' ', :v_couleur_noire, :v_couleur_blanche, :v_code_interne_rdv ) ;
			
			if sqlca.sqlcode = 0 then
				commit ;
			else
				Messagebox("ATTENTION", "Erreur dans l'ajout automatique de commentaire.~n~n" + sqlca.sqlerrtext)
				rollback ;
			end if
		end if
			
	end if
	
end if
end event

event resize;call super::resize;
// Spécial Favali
if serial = '87230' then
	sle_code_barre.width = 1000
	sle_code_barre.y = rb_produit.y
	sle_code_barre.x = 400
end if
end event

type p_fond from w_fenetre_arakis`p_fond within w_tracabilite_fiche
integer y = 560
end type

type cb_supprimer from uo_picturebutton_250x120 within w_tracabilite_fiche
integer x = 3141
integer y = 1508
integer width = 494
integer taborder = 50
string text = "&Supprimer"
string iconname = "ACTIONS_supprimer.png"
end type

event clicked;call super::clicked;
if dw_liste.rowcount() > 0 then

	long v_quantite_supprimee
	long v_code_barre
	
	if v_sortie_stock_en_tracabilite = 'O' then
		
		long lig
		lig = dw_liste.getrow()
		v_quantite_supprimee = dw_liste.getItemNumber(dw_liste.getrow(), "fiche_tracabilite_nb_unite" )
		v_code_barre = dw_liste.getItemNumber(dw_liste.getrow(), "fiche_tracabilite_code_barre" ) 

		// recherche d'un prix pour valoriser
		double v_prix
		select top 1 isnull(prix, 0) into :v_prix 
		from historique_es
		where code_es = 'e' and code_barre = :v_code_barre ;

		dw_sortie.reset()
		dw_sortie.insertrow(0)
		dw_sortie.SetItem(1,"historique_es_code_barre", v_code_barre)
		dw_sortie.SetItem(1,"historique_es_code_es", "e")
		dw_sortie.setitem(1,"historique_es_utilisateur",utilisateur_code)
		dw_sortie.setitem(1,"historique_es_poste_utilisation",utilisateur_code)
		dw_sortie.setitem(1,"historique_es_heure",now())
		dw_sortie.setitem(1,"historique_es_prix",v_prix)
		dw_sortie.setitem(1,"historique_es_date",today())
		dw_sortie.setitem(1,"historique_es_quantite",1)
		dw_sortie.setitem(1,"historique_es_libelle","Annulation Sortie traçabilité")

		if dw_sortie.update() = 1 then
			// On remet la quantité en stock
			update "stock_produit" set "quantite_colisee" =   "quantite_colisee" + :v_quantite_supprimee
					where code_barre = :v_code_barre;
			if sqlca.sqlcode = 0 then 
				commit ;
			else
				rollback ;
				Messagebox("ATTENTION", "Une erreur s'est produite durant la mise à jour du stock. Opération Annulée.")
			end if
			
			dw_liste.deleterow(dw_liste.getrow())
			
			pb_enregistrer.triggerevent(clicked!)
		end if

	else
		
		dw_liste.deleterow(dw_liste.getrow())

	end if
		
end if


effacer()
end event

type pb_enregistrer from uo_picturebutton_250x120 within w_tracabilite_fiche
integer x = 3662
integer y = 1508
integer width = 494
integer taborder = 50
string text = "&Enregistrer"
string iconname = "ACTIONS_enregistrer.png"
end type

event clicked;call super::clicked;
dw_liste.accepttext()


if dw_liste.Update() = 1  then
	commit ;
else
	rollback using sqlca ;
	Messagebox("Attention","Erreur dans l'enregistrement")
end if
effacer()
end event

type cb_fermer from uo_picturebutton_250x120 within w_tracabilite_fiche
integer x = 3319
integer y = 88
integer width = 791
integer height = 148
integer taborder = 50
string text = "&Enregistrer et Fermer"
string iconname = "ACTIONS_enregistrer.png"
end type

event clicked;call super::clicked;// Depuis 2019 on enregistre TOUT et on ferme

pb_enregistrer.triggerevent(clicked!)
pb_3.triggerevent(clicked!)
close(parent)
//dw_liste.accepttext()
//if dw_liste.modifiedcount() > 0 or dw_liste.deletedcount()>0 Then
//	If MessageBox("ATTENTION","Vous avez fait des modifications sur le fichier !~n~nVoulez-vous vraiment fermer cette fenêtre sans enregistrer (et ainsi perdre les modifications) ?",Question!,YesNo!, 2) = 1 Then
//		Close(parent)
//	end if
//else
//	close(parent)
//end if
end event

type cb_ajouter from uo_picturebutton_390x120 within w_tracabilite_fiche
integer x = 1531
integer y = 80
integer width = 549
integer height = 152
integer taborder = 80
string text = "&Ajouter"
boolean default = true
string iconname = "ACTIONS_ajouter.png"
end type

event clicked;call super::clicked;if rb_produit.checked then
	if len(trim(sle_code_barre.text)) > 0 then
		ajouter()
	end if
end if
if rb_liste.checked then
	ajout_liste()
	dw_choix.reset()
	dw_choix.insertrow(0)
end if

sle_code_barre.setfocus()
end event

type cb_imprimer from uo_picturebutton_250x120 within w_tracabilite_fiche
integer x = 3141
integer y = 1408
integer width = 494
integer taborder = 40
string text = "&Imprimer"
string iconname = "ACTIONS_imprimer.png"
end type

event clicked;call super::clicked;if dw_liste.rowcount() > 0 then
	dw_liste.print()
else
	messagebox("ATTENTION","La liste est vide !")
end if

end event

type cbx_1 from checkbox within w_tracabilite_fiche
integer x = 2304
integer y = 136
integer width = 933
integer height = 72
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 15780518
string text = "Affichage de tout l~'historique"
end type

event clicked;if this.checked then
	dw_liste.retrieve(struct.code_patient,date('1900-01-01'),date('2999-12-31'))
	dw_ste.retrieve(struct.code_patient,date('1900-01-01'),date('2999-12-31'))
else
	dw_liste.retrieve(struct.code_patient,struct.date_rdv,struct.date_rdv)
	dw_ste.retrieve(struct.code_patient,struct.date_rdv,struct.date_rdv)
end if
end event

type dw_produit from datawindow within w_tracabilite_fiche
string tag = "brush"
boolean visible = false
integer x = 1563
integer y = 336
integer width = 736
integer height = 268
integer taborder = 70
string title = "none"
string dataobject = "dw_traca_recherche_produit"
boolean border = false
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event itemchanged;if dwo.name = 'code_fournisseur' then
	idw_code_produit.retrieve(data)
	dw_produit.setitem(row,"code_barre","")
	dw_produit.setitem(row,"code_produit","")
end if
if dwo.name = 'code_produit' then
	idw_code_barre.retrieve(data,dw_produit.getitemstring(row,"code_fournisseur"))
	dw_produit.setitem(row,"code_barre","")
end if
end event

type st_5 from statictext within w_tracabilite_fiche
integer x = 960
integer y = 1560
integer width = 1051
integer height = 68
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean italic = true
long textcolor = 16711680
long backcolor = 16777215
string text = "Ces produits n~'ont pas figuré dans votre stock"
boolean focusrectangle = false
end type

type dw_resultat from u_basedw within w_tracabilite_fiche
integer x = 41
integer y = 1372
integer width = 3081
integer height = 224
integer taborder = 60
string dataobject = "dw_traca_liste_resultat"
boolean border = false
borderstyle borderstyle = stylelowered!
end type

type dw_lieu from datawindow within w_tracabilite_fiche
string tag = "brush"
boolean visible = false
integer x = 421
integer y = 204
integer width = 809
integer height = 80
integer taborder = 30
string title = "none"
string dataobject = "dw_lieu_affich"
boolean border = false
boolean livescroll = true
borderstyle borderstyle = styleraised!
end type

event itemchanged;code_lieu_utilisation = data
  UPDATE "fiche_tracabilite"  
     SET "lieu_rdv" = :data  
   WHERE ( "fiche_tracabilite"."code_patient" = :struct.code_patient ) AND  
         ( "fiche_tracabilite"."date_rdv" = :struct.date_rdv );


end event

type dw_liste from u_basedw within w_tracabilite_fiche
string tag = "brush"
integer x = 18
integer y = 372
integer width = 4123
integer height = 964
integer taborder = 50
string dataobject = "dw_tracabilite_liste"
boolean border = false
end type

type dw_choix from datawindow within w_tracabilite_fiche
string tag = "brush"
boolean visible = false
integer x = 421
integer y = 120
integer width = 521
integer height = 84
integer taborder = 60
string title = "none"
string dataobject = "dw_affich_liste_traca"
boolean border = false
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event getfocus;effacer()
end event

type rb_type from radiobutton within w_tracabilite_fiche
boolean visible = false
integer x = 178
integer y = 240
integer width = 443
integer height = 80
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 553648127
string text = "Code Produit"
end type

event clicked;effacer()
sle_code_barre.visible = false
dw_produit.visible = true
end event

type rb_code_barre from radiobutton within w_tracabilite_fiche
boolean visible = false
integer x = 169
integer y = 116
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
string text = "Code Barre"
boolean checked = true
end type

event clicked;effacer()
sle_code_barre.visible = true
dw_produit.visible = false
sle_code_barre.setfocus()
end event

type rb_liste from radiobutton within w_tracabilite_fiche
boolean visible = false
integer x = 55
integer y = 144
integer width = 215
integer height = 80
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 553648127
string text = "Liste"
end type

event clicked;dw_choix.visible = true
dw_choix.reset()
dw_choix.insertrow(0)
rb_type.enabled = false
rb_code_barre.enabled = false
sle_code_barre.visible = false
dw_produit.enabled = false
rb_type.enabled = false
effacer()
if dw_lieu.getitemstring(dw_lieu.getrow(),"code") ="" then
	MessageBox("Attention","Vous devez selectionner un lieu !")
	rb_produit.triggerevent(clicked!)
	rb_produit.checked = true
end if
end event

type rb_produit from radiobutton within w_tracabilite_fiche
boolean visible = false
integer x = 55
integer y = 60
integer width = 274
integer height = 80
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 553648127
string text = "Produit"
boolean checked = true
end type

event clicked;dw_choix.visible = false
rb_type.enabled = true
rb_code_barre.enabled = true
sle_code_barre.visible = true
dw_produit.enabled = true
rb_type.enabled = true
effacer()
sle_code_barre.setfocus()
end event

type gb_2 from groupbox within w_tracabilite_fiche
boolean visible = false
integer x = 9
integer y = 4
integer width = 1248
integer height = 492
integer taborder = 20
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 16777215
string text = "Recherche par"
end type

type gb_3 from groupbox within w_tracabilite_fiche
integer x = 9
integer y = 4
integer width = 3264
integer height = 288
integer taborder = 30
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 16777215
string text = "Code Barre Stock ou Stérilisation"
end type

type gb_4 from groupbox within w_tracabilite_fiche
integer x = 9
integer y = 304
integer width = 4169
integer height = 1332
integer taborder = 40
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 16777215
string text = "Historique tracabilité"
end type

type dw_invisible from datawindow within w_tracabilite_fiche
integer x = 434
integer y = 392
integer width = 1504
integer height = 352
integer taborder = 70
string title = "none"
string dataobject = "dw_liste_traca"
boolean livescroll = true
end type

type pb_1 from uo_picturebutton_250x120 within w_tracabilite_fiche
integer x = 3205
integer y = 1920
integer width = 494
integer taborder = 60
boolean bringtotop = true
string text = "&Supprimer"
string iconname = "ACTIONS_supprimer.png"
end type

event clicked;call super::clicked;
if dw_ste.rowcount() > 0 then
	dw_ste.deleterow(dw_ste.getrow())
end if
end event

type pb_2 from uo_picturebutton_250x120 within w_tracabilite_fiche
integer x = 3205
integer y = 2052
integer width = 494
integer taborder = 50
boolean bringtotop = true
string text = "&Imprimer"
string iconname = "ACTIONS_imprimer.png"
end type

event clicked;call super::clicked;if dw_ste.rowcount() > 0 then
	dw_ste.print()
else
	messagebox("ATTENTION","La liste est vide !")
end if

end event

type pb_3 from uo_picturebutton_250x120 within w_tracabilite_fiche
integer x = 3205
integer y = 2316
integer width = 494
integer taborder = 60
boolean bringtotop = true
string text = "&Enregistrer"
string iconname = "ACTIONS_enregistrer.png"
end type

event clicked;call super::clicked;dw_ste.accepttext()
if dw_ste.update() = 1 then
	commit ;
else
	rollback ;
end if

end event

type pb_4 from uo_picturebutton_250x120 within w_tracabilite_fiche
integer x = 3205
integer y = 2184
integer width = 494
integer taborder = 70
boolean bringtotop = true
string text = "&Annuler"
string iconname = "ACTIONS_annuler.png"
end type

event clicked;call super::clicked;if cbx_1.checked then
	dw_ste.retrieve(struct.code_patient,date('1900-01-01'),date('2999-12-31'))
else
	dw_ste.retrieve(struct.code_patient,struct.date_rdv,struct.date_rdv)
end if
end event

type dw_sortie from datawindow within w_tracabilite_fiche
boolean visible = false
integer x = 667
integer y = 1652
integer width = 686
integer height = 400
integer taborder = 60
boolean bringtotop = true
string title = "none"
string dataobject = "dw_historique_sortie"
boolean border = false
boolean livescroll = true
end type

type gb_1 from groupbox within w_tracabilite_fiche
integer x = 9
integer y = 1656
integer width = 3744
integer height = 1080
integer taborder = 50
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 16777215
string text = "Historique stérilisatation"
end type

type st_lieu from statictext within w_tracabilite_fiche
boolean visible = false
integer x = 224
integer y = 212
integer width = 169
integer height = 64
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 553648127
string text = "Lieu"
boolean focusrectangle = false
end type

type dw_ste from u_basedw within w_tracabilite_fiche
string tag = "brush"
integer x = 50
integer y = 1728
integer width = 3095
integer height = 960
integer taborder = 11
boolean bringtotop = true
string dataobject = "dw_fiche_sterilisation"
boolean hscrollbar = false
boolean border = false
end type

type pb_5 from uo_picturebutton_250x120 within w_tracabilite_fiche
integer x = 3662
integer y = 1408
integer width = 494
integer taborder = 60
boolean bringtotop = true
string text = "&Annuler"
string iconname = "ACTIONS_annuler.png"
end type

event clicked;call super::clicked;dw_liste.retrieve(struct.code_patient,struct.date_rdv,struct.date_rdv)

end event

type pb_udi from picturebutton within w_tracabilite_fiche
integer x = 2103
integer y = 84
integer width = 155
integer height = 144
integer taborder = 100
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "lc_gs1.png"
alignment htextalign = left!
string powertiptext = "Scan du code barre pour saisir l~'identifiant UDI et le numéro de lot puis rechercher le produit"
end type

event clicked;
open(w_udi_lecture)

str_udi v_udi
string v_identifiant_udi_lu, v_lot_lu
boolean v_suite 
integer v_cpt
double v_code_barre

v_udi = message.PowerObjectParm

if not isnull(v_udi.di) then
	v_identifiant_udi_lu = string_non_nulle( v_udi.di)
	v_lot_lu = string_non_nulle( v_udi.numero_lot)
	
	v_suite = false
	
	// Recherche dans le stock si existe et unique
	select min(code_barre), isnull(count(*),0) into :v_code_barre, :v_cpt 
	from stock_produit, produit 
	where  produit.code_interne = stock_produit.code_produit and numero_lot = :v_lot_lu and produit.gtin = :v_identifiant_udi_lu  ;
	
	if v_cpt = 0 then
		Messagebox("ATTENTION", "Ce code UDI ne correspond à aucun produit en stock !")
	else
		if v_sortie_stock_en_tracabilite = "O" then
			// SORTIE DE STOCK !!!!
			if v_cpt = 1 then 
				// 1 produit correspond => on le prend
				sle_code_barre.text  = string(v_code_barre)
				v_suite = true
			else
				if v_cpt = 0 then
					Messagebox("ATTENTION", "Ce code UDI ne correspond à aucun produit en stock !")
				else
					// Il y en a plusieurs ... 
					openwithParm(w_choix_code_barre, v_udi)
					// reçoit le code barre en retour .. -1 sinon 
					v_code_barre = message.Doubleparm 
					if v_code_barre > 0 then
						sle_code_barre.text  = string(v_code_barre)
						v_suite = true
					else
						v_suite = false
					end if
				end if
			end if
		else
			// On n'est pas en mode SORTIE DE STOCK => on prendre le 1er produit qui correspont !
			sle_code_barre.text  = string(v_code_barre)
			v_suite = true
		end if
			
		if v_suite then 
			cb_ajouter.triggerevent(clicked!)
		end if
	end if
end if



end event

type sle_code_barre from singlelineedit within w_tracabilite_fiche
integer x = 55
integer y = 112
integer width = 1454
integer height = 92
integer taborder = 80
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
end type

event getfocus;effacer()
cb_ajouter.default = true
end event

