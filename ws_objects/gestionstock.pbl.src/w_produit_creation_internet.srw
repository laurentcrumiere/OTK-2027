$PBExportHeader$w_produit_creation_internet.srw
forward
global type w_produit_creation_internet from w_fenetre_arakis
end type
type st_1 from statictext within w_produit_creation_internet
end type
type sle_ref from singlelineedit within w_produit_creation_internet
end type
type pb_rechercher from uo_picturebutton_390x120 within w_produit_creation_internet
end type
type dw_liste from datawindow within w_produit_creation_internet
end type
type pb_creation from uo_picturebutton_390x120 within w_produit_creation_internet
end type
type dw_resultat from u_basedw within w_produit_creation_internet
end type
type pb_fermer from uo_picturebutton_390x120 within w_produit_creation_internet
end type
end forward

global type w_produit_creation_internet from w_fenetre_arakis
integer width = 4475
integer height = 1732
string title = "Création d~'un produit à partir d~'Internet"
boolean minbox = false
boolean maxbox = false
boolean resizable = false
windowtype windowtype = response!
boolean center = true
st_1 st_1
sle_ref sle_ref
pb_rechercher pb_rechercher
dw_liste dw_liste
pb_creation pb_creation
dw_resultat dw_resultat
pb_fermer pb_fermer
end type
global w_produit_creation_internet w_produit_creation_internet

type variables


// Accées internet
Inet iinet_base

// Retour XML
n_inetresult in_irdata


constant string url_arakis = "https://www.arakis.fr/produits/getinfo.php?"

constant string nom_fichier_recu = "produit_tmp.xml"

string v_ref_cherche
end variables

forward prototypes
public subroutine ajout_produit (integer lig)
end prototypes

public subroutine ajout_produit (integer lig);

// Essaie d'ajouter un produit de la dw_liste, ligne lig

string produit_lu

string v_designation , v_nom_fournisseur, v_reference
string v_code_fournisseur, v_code_fournisseur_arakis
string v_type_prix, v_unite_vente, v_categorie
double v_prix


boolean erreur_ajout

// Au cas ou il y a substitution, on reprend la référence renvoyée
v_reference = dw_liste.GetItemString(lig, "reference")
v_designation = dw_liste.GetitemString(lig, "designation")
v_nom_fournisseur = dw_liste.GetitemString(lig, "nom_fournisseur")
v_code_fournisseur_arakis = dw_liste.GetitemString(lig, "code_fournisseur")
v_prix = dw_liste.GetitemNumber(lig, "prix")
v_type_prix = dw_liste.GetitemString(lig, "type_prix")
v_unite_vente = dw_liste.GetitemString(lig, "unite_vente")
v_categorie = dw_liste.GetitemString(1, "categorie") 

zeros(v_reference)
zeros(v_designation)
zeros(v_nom_fournisseur)
zeros(v_code_fournisseur_arakis)
zeros(v_type_prix)
zerodb(v_prix)
zeros(v_unite_vente)
zeros(v_categorie)

produit_lu = "Référence : " + v_reference  + "~nDésignation : "+v_designation +"~nCatégorie : " + v_categorie + "~nFournisseur : "+v_nom_fournisseur
produit_lu = produit_lu + "~nPrix  : "+string(v_prix) + "~nType de prix : "+ v_type_prix+"~nUnité de vente : " + v_unite_vente 

if v_reference <> v_ref_cherche then
	Messagebox("INFORMATION","La référence que vous avez cherché n'est plus disponible chez le fournisseur.~n~nIl va vous proposer une référence de substitution.")
end if

if MessageBox("CONFIRMATION", "Produit trouvé :~n~n" + produit_lu + "~n~nConfirmez-vous la création de ce produit ?", Question!, Yesno!, 2) = 1 then

	// Création du produit
	string v_code_interne
	string v_code_type_produit, v_code_categorie_produit
	long v_nb
	
	// on recherche si un produit existe avec la référence fournisseur comme code interne ... si non, on le créé avec  .. sinon, on mettra code par défaut
	select isnull(count(*),0) into :v_nb from produit where code_interne = :v_reference ;
	
	if v_nb = 0 then
		v_code_interne = v_reference
	else
		v_code_interne = string(get_next_code_produit())
	end if

	//	recherche du code_type_produit le plus utilisé
	select isnull(code_type_produit,''), count(*) as nb into :v_code_type_produit, :v_nb from produit, param_stock_produit
	where param_stock_produit.code_praticien <> 'COMMUN' and produit.code_interne = param_stock_produit.code_produit group by code_type_produit order by  nb desc ;
	
	// Pas de bol ... y en a pas
	if v_code_type_produit = "" then 
		select min(code) into :v_code_type_produit from type_produit ;
	end if
	
	select code_categorie_produit into :v_code_categorie_produit from type_produit where code = :v_code_type_produit ;

	
	// ajout dans la table produit
	insert into produit ("code_interne","designation", "code_type_produit", "actif")
	values (:v_code_interne, :v_designation, :v_code_type_produit, 1) ;
	
	if sqlca.sqlcode <> 0 then
		MessageBox("ATTENTION", "Erreur dans la création du produit.~n~n"  +  sqlca.sqlerrtext)
		rollback ;
	else
		
		commit ;
		
		erreur_ajout = false
		
		// Recherche si on a un fournisseur à ce nom
		select top 1 isnull(code,'') into :v_code_fournisseur from fournisseur where nom = :v_nom_fournisseur ;
		
		boolean v_ajout_reference
		
		if v_code_fournisseur = "" then
			
			if MessageBox("FOURNISSEUR", "Le fournisseur "+v_nom_fournisseur+" n'existe pas.~n~nSouhaitez-vous le créer  ?", Question!, Yesno!, 2) = 1 then
				v_code_fournisseur = v_code_fournisseur_arakis
				insert into fournisseur (code, nom, actif) values (:v_code_fournisseur, :v_nom_fournisseur, 1) ;
				if sqlca.sqlcode <> 0 then
					MessageBox("ATTENTION", "Erreur dans la création du fournisseur.~n~n"  +  sqlca.sqlerrtext)
					rollback ;
					erreur_ajout = true
				else
					commit ;
				end if
			else
				erreur_ajout = true
			end if
		end if

		
		if not erreur_ajout then
			// on a le fournisseur .. ajout du référencement
			insert into reference_produit ("code_produit","code_fournisseur", "code_fabricant", "reference", "prix", "code_type_taxe", "unite_vente", "description", "fournisseur_par_defaut", "code_fournisseur_arakis")
			values (:v_code_interne, :v_code_fournisseur, :v_code_fournisseur, :v_reference, :v_prix, :v_type_prix, :v_unite_vente, :v_designation, 'O', :v_code_fournisseur_arakis ) ;	
			if sqlca.sqlcode <> 0 then
				MessageBox("ATTENTION", "Erreur dans la création reférencement produit / fournisseur.~n~n"  +  sqlca.sqlerrtext)
				rollback ;
				erreur_ajout = true
			else
		
				// Ajout des 2 autres référencement ... param_stock fournisseur et praticien
				
				// Mise à jour du praticien par défaut 
				string v_prati_defaut
				SELECT min(code) into :v_prati_defaut from prati where prati_defaut = 1 ; 

				insert into param_stock_produit (code_produit, code_praticien, interdiction_commande, type_gestion, qte_stock_min)
				values (:v_code_interne, :v_prati_defaut, 'non', 1, 0) ;
				
				if sqlca.sqlcode <> 0 then
					MessageBox("ATTENTION", "Erreur dans la création reférencement produit / praticien.~n~n"  +  sqlca.sqlerrtext)
					rollback ;
					erreur_ajout = true
				else
				
					insert into param_stock_fournisseur (code_produit, code_praticien, code_fournisseur, qte_colisee, archive)
					values (:v_code_interne, :v_prati_defaut, :v_code_fournisseur, 1, 'n') ;
					
					if sqlca.sqlcode <> 0 then
						MessageBox("ATTENTION", "Erreur dans la création reférencement produit / praticien.~n~n"  +  sqlca.sqlerrtext)
						rollback ;
						erreur_ajout = true
					else
						commit ;
			
				
				
						// Le produit a été ajouté ... on ouvre sa fiche pour le compléter
						//maj de la struct passée en param à la response window
						str_twostring struct //pour la passage de param
	
						struct.code = v_code_interne
						struct.message = v_code_categorie_produit
						struct.auxiliaire =  v_code_type_produit
						
						OpenWithParm(w_produit_fiche,struct)
						
						//v_code_interne = struct.code
						
						// recup de la struture en retour
						struct = message.powerObjectParm

//						if string(v_code_interne) <> struct.code then
//							
//							// l'utilisateur a changé le code interne !!!
//							// faut refaire le référencement 
//							
//							update param_stock_produit 
//							set code_produit = :v_nouveau_code_interne
//							where code_praticien = :v_prati_defaut and code_produit = :v_code_interne  ;
//							
//				
//							update param_stock_fournisseur 
//							set code_produit = :v_nouveau_code_interne
//							where code_praticien = :v_prati_defaut and code_fournisseur = :v_code_fournisseur and code_produit = :v_code_interne  ;
//							
//							commit ;
//
//						end if
						
						CloseWithReturn(this, struct)
						
					end if
				end if
			end if
		end if
		
		if erreur_ajout then
			// on supprime le produit
			delete from produit where "code_interne" = :v_code_interne ;
			commit ;
			
			Messagebox("ANNULATION","Le produit n'a pas été ajouté à votre base de données.")
			
		end if
	end if

end if


end subroutine

on w_produit_creation_internet.create
int iCurrent
call super::create
this.st_1=create st_1
this.sle_ref=create sle_ref
this.pb_rechercher=create pb_rechercher
this.dw_liste=create dw_liste
this.pb_creation=create pb_creation
this.dw_resultat=create dw_resultat
this.pb_fermer=create pb_fermer
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.st_1
this.Control[iCurrent+2]=this.sle_ref
this.Control[iCurrent+3]=this.pb_rechercher
this.Control[iCurrent+4]=this.dw_liste
this.Control[iCurrent+5]=this.pb_creation
this.Control[iCurrent+6]=this.dw_resultat
this.Control[iCurrent+7]=this.pb_fermer
end on

on w_produit_creation_internet.destroy
call super::destroy
destroy(this.st_1)
destroy(this.sle_ref)
destroy(this.pb_rechercher)
destroy(this.dw_liste)
destroy(this.pb_creation)
destroy(this.dw_resultat)
destroy(this.pb_fermer)
end on

event open;call super::open;
// instantiate internet service objects
this.GetContextService("Internet", iinet_base)
in_irdata = CREATE n_inetresult


dw_resultat.settransobject(sqlca)
end event

type p_fond from w_fenetre_arakis`p_fond within w_produit_creation_internet
end type

type st_1 from statictext within w_produit_creation_internet
integer x = 78
integer y = 36
integer width = 704
integer height = 72
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
string facename = "Arial"
long backcolor = 553648127
boolean enabled = false
string text = "Référence Fournisseur :"
boolean focusrectangle = false
end type

type sle_ref from singlelineedit within w_produit_creation_internet
integer x = 832
integer y = 24
integer width = 1413
integer height = 100
integer taborder = 10
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
borderstyle borderstyle = stylelowered!
end type

type pb_rechercher from uo_picturebutton_390x120 within w_produit_creation_internet
integer x = 2359
integer y = 16
integer width = 549
integer height = 152
integer taborder = 30
boolean bringtotop = true
fontcharset fontcharset = ansi!
string text = "&Rechercher"
boolean default = true
string iconname = "ACTIONS_chercher.png"
end type

event clicked;call super::clicked;Integer li_rc, li_last
String ls_filename, ls_ext

string url_complete

pb_creation.visible = false
dw_liste.visible = false
dw_resultat.visible = false

if len(trim(sle_ref.text)) > 0 then

	v_ref_cherche = upper(trim(sle_ref.text))
	
	boolean v_suite = true
	
	// Vérif si référence pas déjà dans notre BD, active ou pas
	dw_resultat.retrieve("", "ZZZZZZ", "", "ZZZZZZ", "", "ZZZZZZ" ,"%", "", "ZZZZZZZZZ", v_ref_cherche,'COMMUN', 0, 1, '%')
	
	if dw_resultat.rowcount() > 0 then
		dw_resultat.visible = true
		if Messagebox("ATTENTION", "vous avez déjà "+string(dw_resultat.rowcount())+" produit(s) avec cette référence fournisseur dans votre Base de Données.~n~nSouhaitez-vous poursuivre ?", Question!, Yesno!, 2) = 2 then
			v_suite = false
		end if
	end if
			
		
	if v_suite then 
	
		dw_resultat.visible = false
		
		url_complete = url_arakis + "ref="+v_ref_cherche+"&mdp=67JatyR26Y"
		
		li_rc = iinet_base.GetURL(url_complete, in_irdata)
		
		IF li_rc = 1 THEN 
			
			in_irdata.of_WriteFile(dir_ini + nom_fichier_recu, in_irdata.iblob_data)
		
		
			dw_liste.reset()
			dw_liste.importFile(dir_ini + nom_fichier_recu, xml!)
			
			long r
			r = dw_liste.rowcount() 
			
			if dw_liste.rowcount() = 0 then
					MessageBox("ATTENTION", "Aucun produit ne correspond à cette référence dans la Base de Données Internet ARAKIS.")
			else
				
				if dw_liste.rowcount() = 1 then
					if isnull(dw_liste.GetItemString(1, "reference"))  then
						// ligne vide
						MessageBox("ATTENTION", "Aucun produit ne correspond à cette référence dans la Base de Données Internet ARAKIS.")
					else
						ajout_produit(1)
					end if
				else
					MessageBox("ATTENTION", "Plusieurs produits correspondent à cette référence dans la Base de Données Internet ARAKIS.~n~nNous allons les lister pour vous permettre de choisir le produit que vous souhaitez créer.")
					pb_creation.visible = true
					dw_liste.visible = true
				end if
			end if
		ELSE
			MessageBox("ATTENTION", "Impossible de se connecter à la Base de Données Internet ARAKIS")
		END IF
	end if
end if
end event

type dw_liste from datawindow within w_produit_creation_internet
boolean visible = false
integer x = 9
integer y = 304
integer width = 4416
integer height = 1032
integer taborder = 40
boolean bringtotop = true
string title = "none"
string dataobject = "dw_produit_liste_internet"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;If row > 0 Then
	This.SelectRow(0,False)
	This.SelectRow(row,True)
	This.setrow(row)
end if
end event

type pb_creation from uo_picturebutton_390x120 within w_produit_creation_internet
boolean visible = false
integer x = 1504
integer y = 1396
integer width = 549
integer height = 152
integer taborder = 40
boolean bringtotop = true
string text = "&Création"
boolean default = true
string iconname = "Insertrow!"
end type

event clicked;call super::clicked;


ajout_produit(dw_liste.getrow())
end event

type dw_resultat from u_basedw within w_produit_creation_internet
string tag = "brush"
boolean visible = false
integer x = 5
integer y = 304
integer width = 4416
integer height = 1032
integer taborder = 50
boolean bringtotop = true
boolean titlebar = true
string title = "Produits déjà référencés"
string dataobject = "dw_produit_liste_recherche"
boolean border = false
end type

type pb_fermer from uo_picturebutton_390x120 within w_produit_creation_internet
integer x = 2153
integer y = 1396
integer width = 549
integer height = 152
integer taborder = 30
boolean bringtotop = true
string text = "&Fermer"
string iconname = "ACTIONS_fermer.png"
end type

event clicked;call super::clicked;str_twostring struct //pour la passage de param

setnull(struct.code)

CloseWithReturn(parent, struct)



end event

