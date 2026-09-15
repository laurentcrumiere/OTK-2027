$PBExportHeader$w_modification_entree.srw
forward
global type w_modification_entree from w_fenetre_arakis
end type
type cb_annuler from uo_picturebutton_250x120 within w_modification_entree
end type
type cb_enregistrer from uo_picturebutton_250x120 within w_modification_entree
end type
type cb_impression from uo_picturebutton_250x120 within w_modification_entree
end type
type cb_option from uo_picturebutton_250x120 within w_modification_entree
end type
type pb_1 from uo_picturebutton_390x120_fermer within w_modification_entree
end type
type cb_modifier from uo_picturebutton_250x120 within w_modification_entree
end type
type cb_supprimer from uo_picturebutton_250x120 within w_modification_entree
end type
type dw_liste from u_basedw within w_modification_entree
end type
type dw_modif from datawindow within w_modification_entree
end type
type dw_fiche from datawindow within w_modification_entree
end type
type uo_1 from resize_fenetre within w_modification_entree
end type
type gb_1 from groupbox within w_modification_entree
end type
type gb_2 from groupbox within w_modification_entree
end type
type gb_3 from groupbox within w_modification_entree
end type
end forward

global type w_modification_entree from w_fenetre_arakis
integer width = 3529
integer height = 1804
string title = "Modification entrée en stock"
windowtype windowtype = response!
cb_annuler cb_annuler
cb_enregistrer cb_enregistrer
cb_impression cb_impression
cb_option cb_option
pb_1 pb_1
cb_modifier cb_modifier
cb_supprimer cb_supprimer
dw_liste dw_liste
dw_modif dw_modif
dw_fiche dw_fiche
uo_1 uo_1
gb_1 gb_1
gb_2 gb_2
gb_3 gb_3
end type
global w_modification_entree w_modification_entree

type variables
string code_produit_local //code produit du produit entré en stock à modifier
string code_fournisseur_local //fournisseur du produit entré en stock à modifier
double numero_commande_local //numero de la commande du produit entré en stock à modifier
datawindowchild idw_type //dw fille de dw_fiche
integer type_gestion
end variables

forward prototypes
public subroutine maj_stock ()
public subroutine modifier ()
public subroutine maj_histo ()
end prototypes

public subroutine maj_stock ();//mise a jour de la ligne de commande
//idem maj_liste() de reception commande

//la mise a jour de la quantite en stock se fait par update de dw_modif

string solde
int quantite,quantite_initiale,quantite_modifiee, quantite_commandee,facteur_colisage
double code_barre_courant

dw_modif.accepttext()

select "qte_commandee" 
	into :quantite_commandee
	from "ligne_commande"
	where "code_produit" = :code_produit_local and "numero_commande" = :numero_commande_local;

if isnull(quantite_commandee) then
	quantite_commandee = 0
end if

select "qte_livree" 
	into :quantite
	from "ligne_commande"
	where "code_produit" = :code_produit_local and "numero_commande" = :numero_commande_local;

if isnull(quantite) then
	quantite = 0
end if

code_barre_courant = dw_modif.getitemnumber(dw_modif.getrow(),"stock_produit_code_barre")
facteur_colisage = dw_modif.getitemnumber(dw_modif.getrow(),"stock_produit_facteur_colisage")

  SELECT "historique_es"."quantite"  
    INTO :quantite_initiale  
    FROM "historique_es"  
   WHERE ( "historique_es"."code_barre" = :code_barre_courant ) AND  
         ( "historique_es"."code_es" = 'e' )   ;

quantite_initiale = integer(quantite_initiale / facteur_colisage)
quantite = quantite + dw_modif.getitemnumber(dw_modif.getrow(),"stock_produit_quantite") - quantite_initiale
if quantite >= quantite_commandee then
	solde = 'o'
else
	solde = 'n'
end if

update "ligne_commande" set qte_livree = :quantite, solde = :solde
	where "code_produit" = :code_produit_local and "numero_commande" = :numero_commande_local;

if sqlca.sqlcode = -1 then
	rollback;
	MessageBox("Erreur SQL",SQLCA.SQLErrText)
else
	commit;
end if
end subroutine

public subroutine modifier ();//affiche les infos de l'entrée en stock du produit sélectionner dans la liste
//et permet la modification de ces données

string type_taxe,code_lieu_stockage
double prix

if dw_liste.rowcount() > 0 then
	dw_modif.enabled = true
	dw_modif.retrieve(dw_liste.getitemnumber(dw_liste.getrow(),"stock_produit_code_barre"))
	
	cb_impression.enabled ( false)
	cb_option.enabled ( false)
	cb_enregistrer.enabled ( true )
	cb_annuler.enabled ( true )
	if type_gestion = 1 then
		dw_modif.object.stock_produit_code_barre.visible = true
	else
		dw_modif.object.stock_produit_code_barre.visible = false
	end if
	dw_modif.setfocus()
else
	messagebox("Attention","Vous devez sélectionner un produit")
end if
end subroutine

public subroutine maj_histo ();//maj de l'historique des es
//idem fonction de la fenetre reception commande

string code_utilisateur,type_taxe,libelle
int quantite_livree,quantite_colisee,facteur_colisage
double code_barre,prix
date date_reception

code_barre = dw_modif.getitemnumber(dw_modif.getrow(),"stock_produit_code_barre")
quantite_livree = dw_modif.getitemnumber(dw_modif.getrow(),"stock_produit_quantite")
date_reception = dw_modif.getitemdate(dw_modif.Getrow(),"historique_es_date")
prix = dw_modif.getitemnumber(dw_modif.getrow(),"historique_es_prix")
type_taxe = dw_modif.getitemstring(dw_modif.getrow(),"historique_es_code_type_taxe")
code_utilisateur = dw_modif.getitemstring(dw_modif.getrow(),"historique_es_utilisateur")
libelle = dw_modif.getitemstring(dw_modif.getrow(),"historique_es_libelle")

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
	
	commit;
	
	if dw_modif.object.stock_produit_code_barre.visible = "1" then
		cb_impression.enabled = true
		cb_option.enabled = true
	end if
	dw_fiche.enabled = false
	cb_enregistrer.enabled = false
	cb_annuler.enabled = false
	if type_gestion = 1 then
		cb_impression.enabled = true
		cb_option.enabled = true
	end if
end if

if dw_liste.retrieve(numero_commande_local,code_produit_local) > 0 then
	dw_liste.selectrow(dw_liste.getrow(),true)
end if
cb_impression.Setfocus()
end subroutine

on w_modification_entree.create
int iCurrent
call super::create
this.cb_annuler=create cb_annuler
this.cb_enregistrer=create cb_enregistrer
this.cb_impression=create cb_impression
this.cb_option=create cb_option
this.pb_1=create pb_1
this.cb_modifier=create cb_modifier
this.cb_supprimer=create cb_supprimer
this.dw_liste=create dw_liste
this.dw_modif=create dw_modif
this.dw_fiche=create dw_fiche
this.uo_1=create uo_1
this.gb_1=create gb_1
this.gb_2=create gb_2
this.gb_3=create gb_3
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_annuler
this.Control[iCurrent+2]=this.cb_enregistrer
this.Control[iCurrent+3]=this.cb_impression
this.Control[iCurrent+4]=this.cb_option
this.Control[iCurrent+5]=this.pb_1
this.Control[iCurrent+6]=this.cb_modifier
this.Control[iCurrent+7]=this.cb_supprimer
this.Control[iCurrent+8]=this.dw_liste
this.Control[iCurrent+9]=this.dw_modif
this.Control[iCurrent+10]=this.dw_fiche
this.Control[iCurrent+11]=this.uo_1
this.Control[iCurrent+12]=this.gb_1
this.Control[iCurrent+13]=this.gb_2
this.Control[iCurrent+14]=this.gb_3
end on

on w_modification_entree.destroy
call super::destroy
destroy(this.cb_annuler)
destroy(this.cb_enregistrer)
destroy(this.cb_impression)
destroy(this.cb_option)
destroy(this.pb_1)
destroy(this.cb_modifier)
destroy(this.cb_supprimer)
destroy(this.dw_liste)
destroy(this.dw_modif)
destroy(this.dw_fiche)
destroy(this.uo_1)
destroy(this.gb_1)
destroy(this.gb_2)
destroy(this.gb_3)
end on

event open;call super::open;///////////////////////////////////////////////////////////////
// Modification des entrées lors d'une réception de commande //
///////////////////////////////////////////////////////////////


str_commande struct //pour le passage de param

dw_fiche.settransobject(sqlca) //fiche du produit(code interne, categorie ..)
dw_liste.settransobject(sqlca) //liste des entrees
dw_modif.settransobject(sqlca) //fiche de l'entree en stock

//passage de param
struct = message.powerobjectparm

//initialisation des variables d'instances
code_produit_local = struct.code_prod
code_fournisseur_local = struct.code_fourn
numero_commande_local = struct.numero

  SELECT "param_stock_produit"."type_gestion"  
    INTO :type_gestion  
    FROM "commande",   
         "param_stock_produit",   
         "prati"  
   WHERE ( "commande"."code_praticien" = "param_stock_produit"."code_praticien" ) and  
         ( "prati"."code" = "param_stock_produit"."code_praticien" ) and  
         ( "prati"."code" = "commande"."code_praticien" ) and  
         ( ( "commande"."numero_commande" = :numero_commande_local ) AND  
         ( "param_stock_produit"."code_produit" = :code_produit_local ) )   ;

if type_gestion = 2 then
	dw_liste.object.stock_produit_code_barre.visible = false
end if

//on récupère les infos sur le produit
dw_fiche.retrieve(code_produit_local)

//on récupère la liste des entrées du produit pour la commande considérée
if dw_liste.retrieve(numero_commande_local,code_produit_local) > 0 then
	dw_liste.selectrow(dw_liste.getrow(),true)
	//on prepare la modif du premier prod de la liste etant donné qu'il n'y en aura tres souvent qu'un seul
	modifier()
end if


uo_1.taille(this)	// uniquement pour coloration
centrer(this)


//this.backcolor = 16246738


end event

type p_fond from w_fenetre_arakis`p_fond within w_modification_entree
end type

type cb_annuler from uo_picturebutton_250x120 within w_modification_entree
integer x = 1646
integer y = 1496
integer width = 457
integer taborder = 80
string text = "Annuler"
string iconname = "ACTIONS_annuler.png"
end type

event clicked;call super::clicked;dw_modif.reset()
if dw_liste.rowcount() > 0 then
	dw_liste.Selectrow(dw_liste.getrow(),true)
end if
end event

type cb_enregistrer from uo_picturebutton_250x120 within w_modification_entree
integer x = 1175
integer y = 1496
integer width = 457
integer taborder = 80
string text = "Enregistrer"
string iconname = "ACTIONS_enregistrer.png"
end type

event clicked;call super::clicked;int rapport_update

dw_modif.accepttext()

rapport_update = dw_modif.Update()

if rapport_update = 1  then
	commit using sqlca ;
	maj_stock()
	maj_histo()
else
	rollback using sqlca ;
end if

end event

type cb_impression from uo_picturebutton_250x120 within w_modification_entree
integer x = 704
integer y = 1496
integer width = 457
integer taborder = 80
string text = "Imprimer"
string iconname = "ACTIONS_imprimer.png"
end type

type cb_option from uo_picturebutton_250x120 within w_modification_entree
integer x = 233
integer y = 1496
integer width = 457
integer taborder = 70
string text = "&Options imp."
end type

type pb_1 from uo_picturebutton_390x120_fermer within w_modification_entree
integer x = 2661
integer y = 1480
integer taborder = 70
end type

type cb_modifier from uo_picturebutton_250x120 within w_modification_entree
integer x = 2830
integer y = 724
integer width = 462
integer taborder = 30
string text = "&Modifier"
string iconname = "ACTIONS_modifier.png"
end type

event clicked;call super::clicked;//suppression d'une entrée en stock de produit

//il faut supprimer en premier lieu l'historique d'entrée du produit
//puis le produit en stock
//et ensuite maj la ligne de commande

integer quantite, quantite_livree, quantite_commandee
double code_barre
string solde

if dw_liste.rowcount() > 0 then
	
	//acquisition des donnees pour la mise a jour de la ligne de commande
	quantite = dw_liste.getitemnumber(dw_liste.getrow(),"stock_produit_quantite")
	code_barre = dw_liste.getitemnumber(dw_liste.getrow(),"stock_produit_code_barre")
	
	select "qte_commandee", "qte_livree"
		into :quantite_commandee, :quantite_livree
		from "ligne_commande"
		where "code_produit" = :code_produit_local and "numero_commande" = :numero_commande_local;
	
	quantite = quantite_livree - quantite
	
	if quantite >= quantite_commandee then
		solde = 'o'
	else
		solde = 'n'
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
			//maj de la ligne de commande : quantite et solde
			update "ligne_commande" set qte_livree = :quantite, solde = :solde
				where "code_produit" = :code_produit_local and "numero_commande" = :numero_commande_local;
			
			commit;
	
			dw_modif.reset()
			if dw_liste.retrieve(numero_commande_local,code_produit_local) > 0 then
				dw_liste.selectrow(dw_liste.getrow(),true)
				modifier()
			end if
			cb_impression.enabled = false
			cb_option.enabled = false
			cb_enregistrer.enabled = false
			cb_annuler.enabled = false
		end if
	END IF
else
	messagebox("Attention","Vous devez sélectionner un produit")
end if
end event

type cb_supprimer from uo_picturebutton_250x120 within w_modification_entree
integer x = 2354
integer y = 724
integer width = 462
integer taborder = 30
string text = "&Supprimer"
string iconname = "ACTIONS_supprimer.png"
end type

event clicked;call super::clicked;//suppression d'une entrée en stock de produit

//il faut supprimer en premier lieu l'historique d'entrée du produit
//puis le produit en stock
//et ensuite maj la ligne de commande

integer quantite, quantite_livree, quantite_commandee
double code_barre
string solde

if dw_liste.rowcount() > 0 then
	
	//acquisition des donnees pour la mise a jour de la ligne de commande
	quantite = dw_liste.getitemnumber(dw_liste.getrow(),"stock_produit_quantite")
	code_barre = dw_liste.getitemnumber(dw_liste.getrow(),"stock_produit_code_barre")
	
	select "qte_commandee", "qte_livree"
		into :quantite_commandee, :quantite_livree
		from "ligne_commande"
		where "code_produit" = :code_produit_local and "numero_commande" = :numero_commande_local;
	
	quantite = quantite_livree - quantite
	
	if quantite >= quantite_commandee then
		solde = 'o'
	else
		solde = 'n'
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
			//maj de la ligne de commande : quantite et solde
			update "ligne_commande" set qte_livree = :quantite, solde = :solde
				where "code_produit" = :code_produit_local and "numero_commande" = :numero_commande_local;
			
			commit;
	
			dw_modif.reset()
			if dw_liste.retrieve(numero_commande_local,code_produit_local) > 0 then
				dw_liste.selectrow(dw_liste.getrow(),true)
				modifier()
			end if
			cb_impression.enabled = false
			cb_option.enabled = false
			cb_enregistrer.enabled = false
			cb_annuler.enabled = false
		end if
	END IF
else
	messagebox("Attention","Vous devez sélectionner un produit")
end if
end event

type dw_liste from u_basedw within w_modification_entree
string tag = "brush"
integer x = 133
integer y = 112
integer width = 3223
integer height = 584
integer taborder = 30
string dataobject = "dw_modification_entree_liste"
boolean hscrollbar = false
boolean border = false
end type

event clicked;call super::clicked;modifier()
end event

type dw_modif from datawindow within w_modification_entree
string tag = "brush"
integer x = 119
integer y = 924
integer width = 2030
integer height = 552
integer taborder = 30
string title = "none"
string dataobject = "dw_modif_entree"
boolean border = false
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type dw_fiche from datawindow within w_modification_entree
string tag = "brush"
integer x = 2267
integer y = 952
integer width = 1115
integer height = 368
integer taborder = 20
string title = "none"
string dataobject = "dw_produit_data_little"
boolean border = false
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type uo_1 from resize_fenetre within w_modification_entree
boolean visible = false
integer x = 393
integer y = 884
integer taborder = 20
boolean bringtotop = true
end type

on uo_1.destroy
call resize_fenetre::destroy
end on

type gb_1 from groupbox within w_modification_entree
integer x = 2240
integer y = 872
integer width = 1170
integer height = 464
integer taborder = 10
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 16777215
string text = "Produit"
end type

type gb_2 from groupbox within w_modification_entree
integer x = 91
integer y = 44
integer width = 3319
integer height = 800
integer taborder = 20
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 16777215
string text = "Historique des entrées en stock du produit pour cette commande"
end type

type gb_3 from groupbox within w_modification_entree
integer x = 91
integer y = 872
integer width = 2085
integer height = 772
integer taborder = 30
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 16777215
string text = "Modification"
end type

