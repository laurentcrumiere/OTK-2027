$PBExportHeader$w_liste_produit_stock_insuffisant.srw
forward
global type w_liste_produit_stock_insuffisant from w_liste_produit
end type
type rb_tous_fournisseurs from radiobutton within w_liste_produit_stock_insuffisant
end type
type rb_un_fournisseur from radiobutton within w_liste_produit_stock_insuffisant
end type
type dw_fourni from datawindow within w_liste_produit_stock_insuffisant
end type
type pb_generer from uo_picturebutton_390x120 within w_liste_produit_stock_insuffisant
end type
type gb_4 from groupbox within w_liste_produit_stock_insuffisant
end type
type cbx_que_principal from checkbox within w_liste_produit_stock_insuffisant
end type
end forward

global type w_liste_produit_stock_insuffisant from w_liste_produit
string title = "Liste des stocks en dessous du seuil d~'alerte"
rb_tous_fournisseurs rb_tous_fournisseurs
rb_un_fournisseur rb_un_fournisseur
dw_fourni dw_fourni
pb_generer pb_generer
gb_4 gb_4
cbx_que_principal cbx_que_principal
end type
global w_liste_produit_stock_insuffisant w_liste_produit_stock_insuffisant

type variables


string v_filtre_avec_inactifs, v_filtre_sans_inactifs
end variables

forward prototypes
public subroutine prepa ()
end prototypes

public subroutine prepa ();string pra_min,pra_max, code_produit_courant, code_praticien_courant
integer type_gestion_min, type_gestion_max,quantite, type_gestion_dw, quantite_min, etat_stock
double nb_ligne,i
string fou_min, fou_max, v_nom_fournisseur


if not prepa_faite then
	//prepa_faite = true
	if rb_tous.checked then
		pra_min="      "
		pra_max="ZZZZZZ"
	else
		pra_min=dw_prati.getitemstring(dw_prati.getrow(),"code")
		pra_max=pra_min
	end if

	if rb_tous_gestion.checked then
		type_gestion_min = 1
		type_gestion_max = 2
	else
		type_gestion_min = dw_gestion.getitemnumber(dw_gestion.getrow(),"type_gestion")
		type_gestion_max = type_gestion_min
	end if
	
	if rb_tous_fournisseurs.checked then
		fou_min="      "
		fou_max="ZZZZZZ"
	else
		fou_min=dw_fourni.getitemstring(dw_fourni.getrow(),"code")
		fou_max=fou_min
		select fournisseur.nom into :v_nom_fournisseur from fournisseur where code = :fou_min ;
	end if
	
	if cbx_que_principal.checked then
		v_filtre_avec_inactifs = "reference_produit_fournisseur_par_defaut = 'O'"
		v_filtre_sans_inactifs = "reference_produit_fournisseur_par_defaut = 'O' and actif = 1"	
	else
		v_filtre_avec_inactifs = ""
		v_filtre_sans_inactifs = "actif = 1"
	end if

	
	if cbx_avec_les_inactifs.checked then 
		dw_liste.setfilter(v_filtre_avec_inactifs)
	else
		dw_liste.setfilter(v_filtre_sans_inactifs)
	end if
	
	open(w_patience)
	dw_liste.retrieve(type_gestion_min,type_gestion_max,pra_min,pra_max,code_type_produit,code_categorie_produit)

	nb_ligne = dw_liste.rowcount()
	
	// pour éliminer les produits avec un stock suffisant ou si 1 seul fournisseur, les autres
	
	FOR i = nb_ligne to 1 step -1
		
		// test sur le fournisseur 
		
		if fou_min = fou_max and dw_liste.getitemstring(i,"nom_fournisseur_principal") <> v_nom_fournisseur then
			dw_liste.deleterow(i)
		else
			
			// test sur la quantité en stock 
		
		
			code_produit_courant = dw_liste.getitemstring(i,"param_stock_fournisseur_code_produit")
			code_praticien_courant = dw_liste.getitemstring(i,"param_stock_fournisseur_code_praticien")
			
			if code_produit_courant = '957' then
				string a
				a = "hh"
			end if
			
	//		  SELECT SUM("stock_produit"."quantite_colisee")  
	//		 	 INTO :quantite  
	//		    FROM "stock_produit"  
	//		   WHERE "stock_produit"."code_produit" = :code_produit_courant AND "stock_produit"."code_praticien" = :code_praticien_courant  ;
	//		
			  SELECT "param_stock_produit"."type_gestion","param_stock_produit"."qte_stock_min","param_stock_produit"."etat_stock" 
				 INTO :type_gestion_dw,:quantite_min,:etat_stock 
				 FROM "param_stock_produit"  
				WHERE ( "param_stock_produit"."code_produit" = :code_produit_courant ) AND  
						( "param_stock_produit"."code_praticien" = :code_praticien_courant );
	
	//		dw_liste.setitem(i,"stock_produit_code_produit_quantite",string(quantite))
			quantite = dw_liste.getitemnumber(i,"quantite_stock")
	
			if isnull(quantite_min) then
				quantite_min = 0 
			end if
			if type_gestion_dw = 1 then
				if quantite >= quantite_min then
					dw_liste.deleterow(i)
				end if
			end if
			if type_gestion_dw = 2 then
				if etat_stock > 1 then
					dw_liste.deleterow(i)
				end if
			end if
		end if
	NEXT
	
	
	close(w_patience)

	em_nb.text = string(dw_liste.rowcount())+" Produits"
	em_nb.visible = true
end if
end subroutine

on w_liste_produit_stock_insuffisant.create
int iCurrent
call super::create
this.rb_tous_fournisseurs=create rb_tous_fournisseurs
this.rb_un_fournisseur=create rb_un_fournisseur
this.dw_fourni=create dw_fourni
this.pb_generer=create pb_generer
this.gb_4=create gb_4
this.cbx_que_principal=create cbx_que_principal
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.rb_tous_fournisseurs
this.Control[iCurrent+2]=this.rb_un_fournisseur
this.Control[iCurrent+3]=this.dw_fourni
this.Control[iCurrent+4]=this.pb_generer
this.Control[iCurrent+5]=this.gb_4
this.Control[iCurrent+6]=this.cbx_que_principal
end on

on w_liste_produit_stock_insuffisant.destroy
call super::destroy
destroy(this.rb_tous_fournisseurs)
destroy(this.rb_un_fournisseur)
destroy(this.dw_fourni)
destroy(this.pb_generer)
destroy(this.gb_4)
destroy(this.cbx_que_principal)
end on

event open;call super::open;

dw_fourni.settransobject(sqlca)
dw_fourni.retrieve()



end event

type p_fond from w_liste_produit`p_fond within w_liste_produit_stock_insuffisant
integer y = 644
end type

type cb_fermer from w_liste_produit`cb_fermer within w_liste_produit_stock_insuffisant
integer x = 2990
end type

type cb_imprimer from w_liste_produit`cb_imprimer within w_liste_produit_stock_insuffisant
integer x = 1216
end type

type cb_autre from w_liste_produit`cb_autre within w_liste_produit_stock_insuffisant
integer x = 2546
end type

event cb_autre::clicked;call super::clicked;

pb_generer.enabled = false
end event

type cb_ecran from w_liste_produit`cb_ecran within w_liste_produit_stock_insuffisant
integer x = 773
end type

type dw_gestion from w_liste_produit`dw_gestion within w_liste_produit_stock_insuffisant
string tag = "no resizeall brush"
integer y = 576
end type

type dw_type from w_liste_produit`dw_type within w_liste_produit_stock_insuffisant
integer y = 1056
end type

type dw_categorie from w_liste_produit`dw_categorie within w_liste_produit_stock_insuffisant
string tag = "no resizeall brush"
integer y = 932
end type

type rb_un_produit from w_liste_produit`rb_un_produit within w_liste_produit_stock_insuffisant
integer y = 1024
end type

type rb_un_categorie from w_liste_produit`rb_un_categorie within w_liste_produit_stock_insuffisant
integer y = 932
end type

type rb_tous_produits from w_liste_produit`rb_tous_produits within w_liste_produit_stock_insuffisant
integer y = 840
end type

type rb_2 from w_liste_produit`rb_2 within w_liste_produit_stock_insuffisant
integer y = 576
end type

type rb_tous_gestion from w_liste_produit`rb_tous_gestion within w_liste_produit_stock_insuffisant
integer y = 476
end type

type cb_lien_word from w_liste_produit`cb_lien_word within w_liste_produit_stock_insuffisant
end type

type dw_liste from w_liste_produit`dw_liste within w_liste_produit_stock_insuffisant
string dataobject = "dw_impr_liste_produit_stock_insuffisant"
end type

event dw_liste::rbuttondown;if row > 0 then
	This.SelectRow(0,False)
	This.SelectRow(row,True)
	This.setrow(row)
	OpenMenuProduit_liste_stock(this)
end if
end event

event dw_liste::retrieveend;call super::retrieveend;

if rowcount > 0 then
	pb_generer.enabled ( true)
end if
end event

type uo_size from w_liste_produit`uo_size within w_liste_produit_stock_insuffisant
end type

type dw_prati from w_liste_produit`dw_prati within w_liste_produit_stock_insuffisant
integer y = 212
end type

type rb_un from w_liste_produit`rb_un within w_liste_produit_stock_insuffisant
integer y = 208
end type

type rb_tous from w_liste_produit`rb_tous within w_liste_produit_stock_insuffisant
integer y = 112
end type

type em_nb from w_liste_produit`em_nb within w_liste_produit_stock_insuffisant
integer x = 32
end type

type dw_1 from w_liste_produit`dw_1 within w_liste_produit_stock_insuffisant
end type

type pb_exporter from w_liste_produit`pb_exporter within w_liste_produit_stock_insuffisant
integer x = 1659
end type

type cbx_avec_les_inactifs from w_liste_produit`cbx_avec_les_inactifs within w_liste_produit_stock_insuffisant
integer x = 3538
integer y = 2032
end type

event cbx_avec_les_inactifs::clicked;// sélection ou pas des inactifs ..
if this.checked then
	dw_liste.setfilter(v_filtre_avec_inactifs)
else
	dw_liste.setfilter(v_filtre_sans_inactifs)
end if

dw_liste.filter()
end event

type gb_1 from w_liste_produit`gb_1 within w_liste_produit_stock_insuffisant
integer y = 32
end type

type gb_2 from w_liste_produit`gb_2 within w_liste_produit_stock_insuffisant
integer y = 400
end type

type gb_3 from w_liste_produit`gb_3 within w_liste_produit_stock_insuffisant
integer y = 748
end type

type gb_filtre from w_liste_produit`gb_filtre within w_liste_produit_stock_insuffisant
integer x = 3433
end type

type rb_tous_fournisseurs from radiobutton within w_liste_produit_stock_insuffisant
integer x = 448
integer y = 1396
integer width = 713
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 15780518
string text = "Tous les fournisseurs"
boolean checked = true
end type

event clicked;

if this.checked then
	dw_fourni.visible = false
else
	dw_fourni.visible = true
end if
end event

type rb_un_fournisseur from radiobutton within w_liste_produit_stock_insuffisant
integer x = 448
integer y = 1484
integer width = 498
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 15780518
string text = "Un fournisseur"
end type

event clicked;if this.checked then
	dw_fourni.visible = true
else
	dw_fourni.visible = false
end if
end event

type dw_fourni from datawindow within w_liste_produit_stock_insuffisant
string tag = "no resizeall brush"
boolean visible = false
integer x = 1445
integer y = 1476
integer width = 667
integer height = 76
integer taborder = 80
boolean bringtotop = true
string title = "none"
string dataobject = "dw_fournisseur_affich_ddlb"
boolean border = false
boolean livescroll = true
end type

type pb_generer from uo_picturebutton_390x120 within w_liste_produit_stock_insuffisant
integer x = 2103
integer y = 1984
integer width = 425
integer taborder = 110
boolean bringtotop = true
boolean enabled = false
string text = "Gén. Cdes"
end type

event clicked;call super::clicked;

// Génération des commandes fournisseurs ....

if messagebox("ATTENTION","Vous allez générer des commandes fournisseurs pour tous les produits listés.~n~nConfirmez-vous ?",Question!, YesNo!, 2) = 1 then

	string v_tri, v_code_fournisseur_prec, v_code_fournisseur_cour
	long lig, tot
	double v_max_numero, v_numero_depart
	
	double v_prix, v_quantite_commandee
	double v_quantite_minimum_commande, v_stock_minimum, v_stock
	double v_quantite_deja_commande
	
	string v_type_taxe
	string v_code_praticien, v_nom_praticien
	string v_code_produit

	
	
	open(w_patience)
	// On réordonne on sait jamais
		
	v_tri = "nom_fournisseur_principal, code_fournisseur_principal, type_produit_code_categorie_produit, type_produit_type_produit, param_stock_fournisseur_code_produit"
	
	dw_liste.SetSort(v_tri)
	dw_liste.Sort()
	
	tot = dw_liste.rowcount()
	
	v_code_fournisseur_prec = '-*/*-'
	
	select isnull(max(numero_commande),0) into :v_max_numero from commande ;
	v_numero_depart = v_max_numero + 1
	
	for lig = 1 to tot
		v_code_fournisseur_cour = dw_liste.GetItemString(lig, "code_fournisseur_principal")
		
		if v_code_fournisseur_prec <> v_code_fournisseur_cour then
			
			v_code_fournisseur_prec = v_code_fournisseur_cour
			
			// Ajout d'une nouvelle commande fournisseur
			
			
			v_max_numero = v_max_numero + 1
			
			v_code_praticien = dw_liste.GetItemString(lig, "prati_code")
			
			  SELECT "prati"."nom"  
				 INTO :v_nom_praticien  
				 FROM "prati"  
				WHERE "prati"."code" = :v_code_praticien   ;
	
				// Recherche des valeurs par défaut ....
				string v_ref, v_com
				string v_reference_personnelle
				
				select min(isnull(comfou_reference_personnelle_defaut,'')), min(isnull(comfou_commentaires_defaut,'')) 
				into :v_ref, :v_com from param ;
				
				if len(trim(v_ref)) > 0 then
					v_reference_personnelle = v_ref
				else
					v_reference_personnelle = "A l'attention de "+v_nom_praticien
				end if
	
			
				// insertion de l'entête
				INSERT INTO  "commande" ("numero_commande",  "code_praticien",   
							"date_commande",   "code_fournisseur",   "reference_personnelle",   
							"utilisateur", "commentaires" )
				
				Values (:v_max_numero, :v_code_praticien,  cast(getdate() as date) , 
							:v_code_fournisseur_cour,   :v_reference_personnelle,   :utilisateur_code , :v_com)  ;
	
			end if
			
			// insertion des lignes
		
			v_code_produit = dw_liste.GetItemString(lig,"param_stock_fournisseur_code_produit")
			v_quantite_minimum_commande = dw_liste.GetItemNumber(lig,"param_stock_fournisseur_qte_com_min")
			v_stock_minimum = dw_liste.GetItemNumber(lig,"param_stock_produit_qte_stock_min")
			v_stock = dw_liste.GetItemNumber(lig,"quantite_stock")
			
			zerodb(v_stock_minimum)
			zerodb(v_quantite_minimum_commande)
			zerodb(v_stock)
			
			if v_stock < v_stock_minimum then
				
				// en principe tout le temps mais ...
				
				// on recherche s'il n'y a pas de commande en cours actuellement pour ce produit ....

				select sum(qte_commandee - isnull(qte_livree,0) ) 	into :v_quantite_deja_commande
				from ligne_commande 
				where "code_produit" = :v_code_produit and solde <> 'O';
				
				zerodb(v_quantite_deja_commande)

					
				v_quantite_commandee = v_stock_minimum - v_stock - v_quantite_deja_commande
				
				if v_quantite_commandee > 0 then
					// il faut VRAIMENT en commande 
					if v_quantite_commandee < v_quantite_minimum_commande then
						 v_quantite_commandee = v_quantite_minimum_commande 
					end if
					
					
					
					SELECT "reference_produit"."prix","reference_produit"."code_type_taxe" 
					 INTO :v_prix,:v_type_taxe 
						 FROM "reference_produit"  
						WHERE ( "reference_produit"."code_produit" = :v_code_produit ) AND  
							 ( "reference_produit"."code_fournisseur" = :v_code_fournisseur_cour )   ;
		
						insert into ligne_commande ("code_produit", "numero_commande", "qte_commandee", 
						"qte_livree", "solde", "prix", "code_type_taxe")
						
						values (:v_code_produit, :v_max_numero , :v_quantite_commandee, 0, 'N', :v_prix,:v_type_taxe ) ;
					end if
			end if
	next
	
	
	commit ;
	close(w_patience)
	
	if v_numero_depart <= v_max_numero then

		Messagebox("FIN DE LA GENERATION","Vous avez généré "+string(v_max_numero - v_numero_depart + 1 ) + " commande(s), numérotée(s) de "+string(v_numero_depart) + " à " + string(v_max_numero) +".")
	end if
	
end if

end event

type gb_4 from groupbox within w_liste_produit_stock_insuffisant
integer x = 283
integer y = 1304
integer width = 2121
integer height = 304
integer taborder = 70
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean italic = true
long textcolor = 33554432
long backcolor = 15780518
string text = "Choix du Fournisseur"
end type

type cbx_que_principal from checkbox within w_liste_produit_stock_insuffisant
integer x = 425
integer y = 1728
integer width = 1024
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 553648127
string text = "Ne lister que si fournisseur principal"
boolean checked = true
end type

