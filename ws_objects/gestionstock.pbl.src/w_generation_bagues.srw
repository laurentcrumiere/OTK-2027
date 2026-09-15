$PBExportHeader$w_generation_bagues.srw
forward
global type w_generation_bagues from w_fenetre_arakis
end type
type cb_generer from uo_picturebutton_390x120 within w_generation_bagues
end type
type cb_maj from uo_picturebutton_390x120 within w_generation_bagues
end type
type cb_supprimer from uo_picturebutton_390x120 within w_generation_bagues
end type
type cb_annuler from uo_picturebutton_390x120 within w_generation_bagues
end type
type dw_param_produit from datawindow within w_generation_bagues
end type
type dw_param_fournisseur from datawindow within w_generation_bagues
end type
type dw_fiche from datawindow within w_generation_bagues
end type
type dw_liste from u_basedw within w_generation_bagues
end type
type dw_affiche from datawindow within w_generation_bagues
end type
type mle_titre from multilineedit within w_generation_bagues
end type
type gb_1 from groupbox within w_generation_bagues
end type
type gb_2 from groupbox within w_generation_bagues
end type
type gb_3 from groupbox within w_generation_bagues
end type
type gb_4 from groupbox within w_generation_bagues
end type
end forward

global type w_generation_bagues from w_fenetre_arakis
integer width = 2501
integer height = 2332
string title = "Génération automatique de fiche produit"
windowtype windowtype = response!
long backcolor = 15780518
cb_generer cb_generer
cb_maj cb_maj
cb_supprimer cb_supprimer
cb_annuler cb_annuler
dw_param_produit dw_param_produit
dw_param_fournisseur dw_param_fournisseur
dw_fiche dw_fiche
dw_liste dw_liste
dw_affiche dw_affiche
mle_titre mle_titre
gb_1 gb_1
gb_2 gb_2
gb_3 gb_3
gb_4 gb_4
end type
global w_generation_bagues w_generation_bagues

type variables
str_bague struct
str_boolstring struct_retour
double retour
datawindowchild idw_ref
end variables

forward prototypes
public subroutine generer ()
public subroutine maj ()
end prototypes

public subroutine generer ();int compteur //calcul l'existence de produit en stock pour ce produit
int compteur2 //pour savoir si on effacer les fiches paramstockproduit et produit
boolean effacer //pour savoir si le la generation a bien ete efectue et si on peut effacer
//valeurs des references de la fiche produit qu'on va generer
int unite_vente 
int qte_com_min 
int fact_colisage
int remise
double prix
string description,archive,type_taxe
string code_produit //code produit actuel+"tail"+'taille'
string designation_produit //genere par rapport au format indique dans la table index_taille
string designation_prod
string code_type_produit
int code_type_gestion
int qte_stock_min
string lieu_stockage_hab
string interdiction_commande
int duree_limite

int deb_index//debut de l'index des tailles 1 par exemple si les tailles s'echelonnent de 1 à 30
int fin_index//fin de l'index des tailles
int code_index//code de l'index stocké dans la table param_stock_fournisseur
int i,j //pour les boucle for
int nb_ligne //nb de ligne de la dw dw_liste

string format[] //tableau des references génériques
int indice_taille
string reference[] //tableau de toutes les references a generer
string reference_courante //sert a remplir le tableau

int rapport_update1, rapport_update2,rapport_update3

effacer = false

  SELECT count(*)
    INTO :compteur  
    FROM "stock_produit"  
   WHERE ( "stock_produit"."code_produit" = :struct.code_produit ) AND  
         ( "stock_produit"."code_fournisseur" = :struct.code_fournisseur ) AND  
         ( "stock_produit"."code_praticien" = :struct.code_praticien )   ;

if compteur = 0 then
  SELECT "produit"."code_type_produit",
  			"produit"."designation"
    INTO :code_type_produit,
	 		:designation_prod
    FROM "produit"  
   WHERE "produit"."code_interne" = :struct.code_produit   ;
	
	dw_fiche.accepttext()
	dw_param_fournisseur.accepttext()

	prix = dw_fiche.getitemnumber(dw_fiche.getrow(),"prix")
	type_taxe = dw_fiche.getitemstring(dw_fiche.getrow(),"code_type_taxe")
	unite_vente = dw_fiche.getitemnumber(dw_fiche.getrow(),"unite_vente")
	description = dw_fiche.getitemstring(dw_fiche.getrow(),"description")
	qte_com_min = dw_param_fournisseur.getitemnumber(dw_param_fournisseur.getrow(),"qte_com_min")
	fact_colisage = dw_param_fournisseur.getitemnumber(dw_param_fournisseur.getrow(),"qte_colisee")
	remise = dw_param_fournisseur.getitemnumber(dw_param_fournisseur.getrow(),"remise")
	archive = dw_param_fournisseur.getitemstring(dw_param_fournisseur.getrow(),"archive")
	code_index = dw_affiche.getitemnumber(dw_affiche.getrow(),"code_index")
	code_type_gestion = dw_param_produit.getitemnumber(dw_param_produit.getrow(),"type_gestion")
	qte_stock_min = dw_param_produit.getitemnumber(dw_param_produit.getrow(),"qte_stock_min")
	lieu_stockage_hab = dw_param_produit.getitemstring(dw_param_produit.getrow(),"code_lieu_stockage_habituel")
	interdiction_commande = dw_param_produit.getitemstring(dw_param_produit.getrow(),"interdiction_commande")
	duree_limite = dw_param_produit.getitemnumber(dw_param_produit.getrow(),"duree_limite_utilisation")
	
  SELECT "index_taille"."debut",   
         "index_taille"."fin"
    INTO :deb_index,   
         :fin_index
    FROM "index_taille"  
   WHERE ( "index_taille"."code_fournisseur" = :struct.code_fournisseur ) AND  
         ( "index_taille"."code_index" = :code_index )   ;
	
	nb_ligne = dw_liste.rowcount()
	indice_taille = 0
	FOR i = 1 to nb_ligne
		if dw_liste.getitemnumber(i,"designation") = 7 then
			format[i] = "taille"
			indice_taille = i
		else
			format[i] = dw_liste.getitemstring(i,"reference")
		end if
	NEXT
	
	FOR j = deb_index to fin_index
		reference_courante = ""
		FOR i = 1 to indice_taille -1
			reference_courante = reference_courante + format[i]
		NEXT
		reference_courante = reference_courante +string(j)
		FOR i = indice_taille + 1 to nb_ligne
			reference_courante = reference_courante + format[i]
		NEXT
		reference[j] = reference_courante
	NEXT
	
	FOR j = deb_index to fin_index
		if len(string(j)) = 1 then
			code_produit = struct.code_produit+"_tail_"+"0"+string(j)
			designation_produit = designation_prod + "_taille_" +"0" +string(j)
		else
			code_produit = struct.code_produit+"_tail_"+string(j)
			designation_produit = designation_prod + "_taille_" + string(j)
		end if
		  INSERT INTO "produit"  
         ( "code_interne",   
           "code_type_produit",   
           "designation" )  
		  VALUES ( :code_produit,   
           :code_type_produit,   
           :designation_produit )  ;
		
		IF SQLCA.SQLCode = -1 THEN 
			MessageBox("SQL error", SQLCA.SQLErrText)
			rollback;
		ELSE
			  INSERT INTO "param_stock_produit"  
         ( "code_produit",   
           "code_praticien",   
           "qte_stock_min",   
           "code_lieu_stockage_habituel",   
           "interdiction_commande",   
           "type_gestion",   
           "duree_limite_utilisation",   
           "quantite_indicative",   
           "etat_stock" )  
		  VALUES ( :code_produit,   
           :struct.code_praticien,   
           :qte_stock_min,   
           :lieu_stockage_hab,   
           :interdiction_commande,   
           :code_type_gestion,   
           :duree_limite,   
           null,   
           2 )  ;
			
			IF SQLCA.SQLCode = -1 THEN 
				MessageBox("SQL error", SQLCA.SQLErrText)
				rollback;
			ELSE
				  INSERT INTO "reference_produit"  
         ( "code_produit",   
           "code_fournisseur",   
           "code_fabricant",   
           "reference",   
           "prix",   
           "code_type_taxe",   
           "unite_vente",   
           "description" )  
  					VALUES ( :code_produit,   
           :struct.code_fournisseur,   
           :struct.code_fournisseur,   
           :reference[j],   
           :prix,   
           :type_taxe,   
           :unite_vente,   
           :description )  ;
			  
			   IF SQLCA.SQLCode = -1 THEN 
					MessageBox("SQL error", SQLCA.SQLErrText)
					rollback;
				ELSE
					  INSERT INTO "param_stock_fournisseur"  
         ( "code_produit",   
           "code_fournisseur",   
           "code_praticien",   
           "qte_com_min",   
           "qte_colisee",   
           "remise",   
           "archive",   
           "generer",   
           "code_index" )  
  							VALUES ( :code_produit,   
           :struct.code_fournisseur,   
           :struct.code_praticien,   
           :qte_com_min,   
           :fact_colisage,   
           :remise,   
           :archive,   
           'o',   
           :code_index )  ;

			   	IF SQLCA.SQLCode = -1 THEN 
						MessageBox("SQL error", SQLCA.SQLErrText)
						rollback;
					ELSE
						commit;
						effacer = true
					END IF
				END IF
			END IF
		END IF

	NEXT
	if effacer then
						

		
		DELETE FROM "param_stock_fournisseur"  
			WHERE ( "param_stock_fournisseur"."code_produit" = :struct.code_produit ) AND  
         		( "param_stock_fournisseur"."code_fournisseur" = :struct.code_fournisseur ) AND  
        			( "param_stock_fournisseur"."code_praticien" = :struct.code_praticien );
		DELETE FROM "reference_produit"  
			WHERE ( "reference_produit"."code_produit" = :struct.code_produit ) AND  
        			( "reference_produit"."code_fournisseur" = :struct.code_fournisseur );
		
		  SELECT count(*)  
		    INTO :compteur2  
		    FROM "param_stock_fournisseur"  
		   WHERE ( "param_stock_fournisseur"."code_produit" = :struct.code_produit ) AND  
      		   ( "param_stock_fournisseur"."code_praticien" = :struct.code_praticien )   ;
		
		retour = 1
		if isnull(compteur2) or compteur2 = 0 then
			DELETE FROM "param_stock_produit"  
   			WHERE ( "param_stock_produit"."code_produit" = :struct.code_produit ) AND  
      	   		( "param_stock_produit"."code_praticien" = :struct.code_praticien );
			
			DELETE FROM "produit"  
   			WHERE "produit"."code_interne" = :struct.code_produit;
			retour = 0
		end if
		
		commit;
		
		dw_liste.update()
		commit;
		
		MessageBox("Rapport","La génération s'est correctement effectuée")
		closewithreturn(this,retour)
	end if
else
	MessageBox("Attention","Génération annulé ce produit a deja figuré dans votre stock")
end if
end subroutine

public subroutine maj ();boolean maj //pour savoir si la maj a bien ete efectue et si on peut mettre a jour
//valeurs des references de la fiche produit qu'on va generer
int unite_vente 
int qte_com_min 
int fact_colisage
int remise
double prix
string description,archive,type_taxe
string code_produit //code produit actuel+"tail"+'taille'
string designation_produit //genere par rapport au format indique dans la table index_taille
string designation_prod
string code_type_produit
int code_type_gestion
int qte_stock_min
string lieu_stockage_hab
string interdiction_commande
int duree_limite

int deb_index//debut de l'index des tailles 1 par exemple si les tailles s'echelonnent de 1 à 30
int fin_index//fin de l'index des tailles
int code_index//code de l'index stocké dans la table param_stock_fournisseur
int i,j //pour les boucle for
int nb_ligne //nb de ligne de la dw dw_liste

string format[] //tableau des references génériques
int indice_taille
string reference[] //tableau de toutes les references a generer
string reference_courante //sert a remplir le tableau

int rapport_update1, rapport_update2,rapport_update3

maj = false

  SELECT "produit"."code_type_produit",
  			"produit"."designation"
    INTO :code_type_produit,
	 		:designation_prod
    FROM "produit"  
   WHERE "produit"."code_interne" = :struct.code_produit   ;
	
	dw_fiche.accepttext()
	dw_param_fournisseur.accepttext()

	prix = dw_fiche.getitemnumber(dw_fiche.getrow(),"prix")
	type_taxe = dw_fiche.getitemstring(dw_fiche.getrow(),"code_type_taxe")
	unite_vente = dw_fiche.getitemnumber(dw_fiche.getrow(),"unite_vente")
	description = dw_fiche.getitemstring(dw_fiche.getrow(),"description")
	qte_com_min = dw_param_fournisseur.getitemnumber(dw_param_fournisseur.getrow(),"qte_com_min")
	fact_colisage = dw_param_fournisseur.getitemnumber(dw_param_fournisseur.getrow(),"qte_colisee")
	remise = dw_param_fournisseur.getitemnumber(dw_param_fournisseur.getrow(),"remise")
	archive = dw_param_fournisseur.getitemstring(dw_param_fournisseur.getrow(),"archive")
	code_index = dw_affiche.getitemnumber(dw_affiche.getrow(),"code_index")
	code_type_gestion = dw_param_produit.getitemnumber(dw_param_produit.getrow(),"type_gestion")
	qte_stock_min = dw_param_produit.getitemnumber(dw_param_produit.getrow(),"qte_stock_min")
	lieu_stockage_hab = dw_param_produit.getitemstring(dw_param_produit.getrow(),"code_lieu_stockage_habituel")
	interdiction_commande = dw_param_produit.getitemstring(dw_param_produit.getrow(),"interdiction_commande")
	duree_limite = dw_param_produit.getitemnumber(dw_param_produit.getrow(),"duree_limite_utilisation")
	
  SELECT "index_taille"."debut",   
         "index_taille"."fin"
    INTO :deb_index,   
         :fin_index
    FROM "index_taille"  
   WHERE ( "index_taille"."code_fournisseur" = :struct.code_fournisseur ) AND  
         ( "index_taille"."code_index" = :code_index )   ;
	
	nb_ligne = dw_liste.rowcount()
	indice_taille = 0
	FOR i = 1 to nb_ligne
		if dw_liste.getitemnumber(i,"designation") = 7 then
			format[i] = "taille"
			indice_taille = i
		else
			format[i] = dw_liste.getitemstring(i,"reference")
		end if
	NEXT
	
	FOR j = deb_index to fin_index
		reference_courante = ""
		FOR i = 1 to indice_taille -1
			reference_courante = reference_courante + format[i]
		NEXT
		reference_courante = reference_courante +string(j)
		FOR i = indice_taille + 1 to nb_ligne
			reference_courante = reference_courante + format[i]
		NEXT
		reference[j] = reference_courante
	NEXT
	
	FOR j = deb_index to fin_index
		if len(string(j)) = 1 then
			code_produit = left(struct.code_produit,len(struct.code_produit) -8)+"_tail_"+"0"+string(j)
			designation_produit = left(designation_prod,len(designation_prod) -10 )+ "_taille_" +"0"+ string(j)
		else
			code_produit = left(struct.code_produit,len(struct.code_produit) -8)+"_tail_"+string(j)
			designation_produit = left(designation_prod,len(designation_prod) -10 )+ "_taille_" + string(j)
		end if
			
		  UPDATE "reference_produit"  
		     SET "reference" = :reference[j],   
		         "prix" = :prix,   
      		   "code_type_taxe" = :type_taxe,   
		         "unite_vente" = :unite_vente,   
      		   "description" = :description  
   		WHERE "reference_produit"."code_produit" = :code_produit   ;
			  
			   IF SQLCA.SQLCode = -1 THEN 
					MessageBox("SQL error", SQLCA.SQLErrText)
					rollback;
				ELSE
					  UPDATE "param_stock_fournisseur"  
					     SET "qte_com_min" = :qte_com_min,   
					         "qte_colisee" = :fact_colisage,   
					         "remise" = :remise,   
      					   "archive" = :archive  
   					WHERE "param_stock_fournisseur"."code_produit" = :code_produit   ;

			   	IF SQLCA.SQLCode = -1 THEN 
						MessageBox("SQL error", SQLCA.SQLErrText)
						rollback;
					ELSE
						commit;
						maj = true
					END IF
				END IF

	NEXT
	retour = 1
	if maj then
		MessageBox("Rapport","La mise à jour s'est correctement effectuée")
		closewithreturn(this,retour)
	end if

end subroutine

on w_generation_bagues.create
int iCurrent
call super::create
this.cb_generer=create cb_generer
this.cb_maj=create cb_maj
this.cb_supprimer=create cb_supprimer
this.cb_annuler=create cb_annuler
this.dw_param_produit=create dw_param_produit
this.dw_param_fournisseur=create dw_param_fournisseur
this.dw_fiche=create dw_fiche
this.dw_liste=create dw_liste
this.dw_affiche=create dw_affiche
this.mle_titre=create mle_titre
this.gb_1=create gb_1
this.gb_2=create gb_2
this.gb_3=create gb_3
this.gb_4=create gb_4
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_generer
this.Control[iCurrent+2]=this.cb_maj
this.Control[iCurrent+3]=this.cb_supprimer
this.Control[iCurrent+4]=this.cb_annuler
this.Control[iCurrent+5]=this.dw_param_produit
this.Control[iCurrent+6]=this.dw_param_fournisseur
this.Control[iCurrent+7]=this.dw_fiche
this.Control[iCurrent+8]=this.dw_liste
this.Control[iCurrent+9]=this.dw_affiche
this.Control[iCurrent+10]=this.mle_titre
this.Control[iCurrent+11]=this.gb_1
this.Control[iCurrent+12]=this.gb_2
this.Control[iCurrent+13]=this.gb_3
this.Control[iCurrent+14]=this.gb_4
end on

on w_generation_bagues.destroy
call super::destroy
destroy(this.cb_generer)
destroy(this.cb_maj)
destroy(this.cb_supprimer)
destroy(this.cb_annuler)
destroy(this.dw_param_produit)
destroy(this.dw_param_fournisseur)
destroy(this.dw_fiche)
destroy(this.dw_liste)
destroy(this.dw_affiche)
destroy(this.mle_titre)
destroy(this.gb_1)
destroy(this.gb_2)
destroy(this.gb_3)
destroy(this.gb_4)
end on

event open;call super::open;string type_produit,praticien,fournisseur
int code_index,compteur
string genere

datawindowchild idw_index

struct = message.powerobjectparm

  SELECT "type_produit"."type_produit"  
    INTO :type_produit  
    FROM "produit",   
         "type_produit"  
   WHERE ( "type_produit"."code" = "produit"."code_type_produit" ) and  
         ( ( "produit"."code_interne" = :struct.code_produit ) )   ;

  SELECT "fournisseur"."nom"  
    INTO :fournisseur  
    FROM "fournisseur"  
   WHERE "fournisseur"."code" = :struct.code_fournisseur   ;

  SELECT "prati"."nom"  
    INTO :praticien  
    FROM "prati"  
   WHERE "prati"."code" = :struct.code_praticien   ;


mle_titre.text = "Génération automatique de "+type_produit+" du fournisseur "+fournisseur+" du stock de "+praticien

dw_affiche.settransobject(sqlca)
dw_liste.settransobject(sqlca)
dw_fiche.settransobject(sqlca)
dw_param_fournisseur.settransobject(sqlca)
dw_param_produit.settransobject(sqlca)

dw_liste.GetChild ("reference", idw_ref)
idw_ref.SetTransObject (sqlca)
idw_ref.insertrow(0)

dw_affiche.GetChild ("code_index", idw_index)
idw_index.SetTransObject (sqlca)
if idw_index.retrieve(struct.code_fournisseur) = 0 then
	idw_index.insertrow(0)
end if

dw_affiche.insertrow(0)

  SELECT "param_stock_fournisseur"."code_index"  
    INTO :code_index  
    FROM "param_stock_fournisseur"  
   WHERE ( "param_stock_fournisseur"."code_produit" = :struct.code_produit ) AND  
         ( "param_stock_fournisseur"."code_fournisseur" = :struct.code_fournisseur ) AND  
         ( "param_stock_fournisseur"."code_praticien" = :struct.code_praticien )   ;

if not(isnull(code_index) or code_index = 0) then
	dw_affiche.setitem(dw_affiche.getrow(),"code_index",code_index)
end if
dw_liste.retrieve(struct.code_fournisseur)

dw_fiche.retrieve(struct.code_produit,struct.code_fournisseur)
dw_param_fournisseur.retrieve(struct.code_produit,struct.code_fournisseur,struct.code_praticien)
dw_param_produit.retrieve(struct.code_produit,struct.code_praticien)

  SELECT "param_stock_fournisseur"."generer"  
    INTO :genere  
    FROM "param_stock_fournisseur"  
   WHERE ( "param_stock_fournisseur"."code_produit" = :struct.code_produit ) AND  
         ( "param_stock_fournisseur"."code_fournisseur" = :struct.code_fournisseur ) AND  
         ( "param_stock_fournisseur"."code_praticien" = :struct.code_praticien )   ;

centrer(this)

if genere = "o" then
	cb_generer.enabled ( false )
	cb_maj.enabled ( true )
	cb_supprimer.enabled  ( true)
	dw_affiche.enabled = false
else
	  SELECT count(*)
	    INTO :compteur  
	    FROM "param_stock_fournisseur"  
	   WHERE ( "param_stock_fournisseur"."code_produit" = :struct.code_produit ) AND  
   	      ( "param_stock_fournisseur"."code_praticien" = :struct.code_praticien ) AND
				( "param_stock_fournisseur"."code_fournisseur" <> :struct.code_fournisseur);
	
	if isnull(compteur) or compteur = 0 then
		cb_generer.enabled ( true )
		cb_maj.enabled  ( false)
		cb_supprimer.enabled ( false )
		dw_affiche.enabled = true
	else
		MessageBox("Attention","Vous ne pouvez générer des références sur un produit donné que pour un seul fournisseur")
		closewithreturn(this,1)
	end if
end if


end event

type p_fond from w_fenetre_arakis`p_fond within w_generation_bagues
end type

type cb_generer from uo_picturebutton_390x120 within w_generation_bagues
integer x = 1298
integer y = 2068
integer taborder = 110
string text = "&Générer"
end type

event clicked;call super::clicked;generer()
end event

type cb_maj from uo_picturebutton_390x120 within w_generation_bagues
integer x = 837
integer y = 2068
integer taborder = 110
string text = "&Mise à Jour"
end type

event clicked;call super::clicked;maj()
end event

type cb_supprimer from uo_picturebutton_390x120 within w_generation_bagues
integer x = 375
integer y = 2068
integer width = 411
integer height = 152
integer taborder = 110
string text = "Supp. Géné."
end type

event clicked;call super::clicked;int debut_index,fin_index
string code_produit
int j
int compteur

 SELECT count(*)
    INTO :compteur  
    FROM "stock_produit"  
   WHERE ( "stock_produit"."code_produit" = :struct.code_produit ) AND  
         ( "stock_produit"."code_fournisseur" = :struct.code_fournisseur ) AND  
         ( "stock_produit"."code_praticien" = :struct.code_praticien )   ;

  SELECT "index_taille"."debut",   
         "index_taille"."fin"  
    INTO :debut_index,   
         :fin_index  
    FROM "index_taille",   
         "param_stock_fournisseur"  
   WHERE ( "param_stock_fournisseur"."code_fournisseur" = "index_taille"."code_fournisseur" ) and  
         ( "param_stock_fournisseur"."code_index" = "index_taille"."code_index" ) and  
         ( ( "param_stock_fournisseur"."code_produit" = :struct.code_produit ) AND  
         ( "param_stock_fournisseur"."code_fournisseur" = :struct.code_fournisseur ) AND  
         ( "param_stock_fournisseur"."code_praticien" = :struct.code_praticien ) )   ;

if compteur = 0 then
	FOR j = debut_index to fin_index
		if len(string(j)) = 1 then
			code_produit = left(struct.code_produit,len(struct.code_produit) -8)+"_tail_"+"0"+string(j)
		else
			code_produit = left(struct.code_produit,len(struct.code_produit) -8)+"_tail_"+string(j)
		end if
		DELETE FROM "param_stock_fournisseur"  
			WHERE ( "param_stock_fournisseur"."code_produit" = :code_produit ) AND  
      		   ( "param_stock_fournisseur"."code_fournisseur" = :struct.code_fournisseur ) AND  
        			( "param_stock_fournisseur"."code_praticien" = :struct.code_praticien );
		DELETE FROM "reference_produit"  
			WHERE ( "reference_produit"."code_produit" = :code_produit ) AND  
      		  	( "reference_produit"."code_fournisseur" = :struct.code_fournisseur );
		
		DELETE FROM "param_stock_produit"  
   		WHERE ( "param_stock_produit"."code_produit" = :code_produit ) AND  
      			( "param_stock_produit"."code_praticien" = :struct.code_praticien );
			
		DELETE FROM "produit"  
   		WHERE "produit"."code_interne" = :code_produit;
			
		commit;
	NEXT
	MessageBox("Rapport","Suppression effectuée avec succès")
	retour = 0
	closewithreturn(parent,retour)
else
	MessageBox("Rapport","Echec suppression les fiches sont liées a d'autres tables")
end if
end event

type cb_annuler from uo_picturebutton_390x120 within w_generation_bagues
integer x = 1760
integer y = 2068
integer taborder = 100
string text = "&Fermer"
boolean default = true
end type

event clicked;call super::clicked;retour = 1
closewithreturn(parent,retour)
end event

type dw_param_produit from datawindow within w_generation_bagues
integer x = 1184
integer y = 1568
integer width = 1065
integer height = 408
integer taborder = 70
string title = "none"
string dataobject = "dw_param_produit_stock"
boolean border = false
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type dw_param_fournisseur from datawindow within w_generation_bagues
integer x = 265
integer y = 1584
integer width = 850
integer height = 388
integer taborder = 60
string title = "none"
string dataobject = "dw_produit_gestion_data"
boolean border = false
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type dw_fiche from datawindow within w_generation_bagues
integer x = 302
integer y = 480
integer width = 1696
integer height = 348
integer taborder = 40
string title = "none"
string dataobject = "dw_reference_produit_bague"
boolean border = false
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type dw_liste from u_basedw within w_generation_bagues
integer x = 416
integer y = 964
integer width = 1737
integer height = 424
integer taborder = 40
string dataobject = "dw_reference_bague"
boolean hscrollbar = false
boolean border = false
end type

event rowfocuschanged;int reference

if currentrow > 0 then
	reference = this.Object.designation[currentrow]
	idw_ref.Retrieve (struct.code_fournisseur,reference)	
end if
end event

type dw_affiche from datawindow within w_generation_bagues
integer x = 283
integer y = 284
integer width = 1381
integer height = 84
integer taborder = 20
string title = "none"
string dataobject = "dw_affich_index"
boolean border = false
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type mle_titre from multilineedit within w_generation_bagues
integer x = 160
integer y = 44
integer width = 2235
integer height = 132
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean italic = true
long textcolor = 33554432
long backcolor = 15780518
string text = "généré a l~'ouverture"
boolean border = false
alignment alignment = center!
boolean displayonly = true
borderstyle borderstyle = stylelowered!
end type

type gb_1 from groupbox within w_generation_bagues
integer x = 123
integer y = 224
integer width = 2254
integer height = 196
integer taborder = 10
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 15780518
string text = "Choix Index des tailles"
end type

type gb_2 from groupbox within w_generation_bagues
integer x = 114
integer y = 880
integer width = 2272
integer height = 572
integer taborder = 30
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 15780518
string text = "Référence à générer"
end type

type gb_3 from groupbox within w_generation_bagues
integer x = 114
integer y = 1472
integer width = 2258
integer height = 556
integer taborder = 50
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 15780518
string text = "Gestion du stock"
end type

type gb_4 from groupbox within w_generation_bagues
integer x = 119
integer y = 436
integer width = 2263
integer height = 408
integer taborder = 30
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 15780518
string text = "Référence Produit"
end type

