$PBExportHeader$w_table_produit.srw
forward
global type w_table_produit from w_fenetre_arakis
end type
type gb_filtre from groupbox within w_table_produit
end type
type cb_imprimer from uo_picturebutton_390x120 within w_table_produit
end type
type cb_ajouter from uo_picturebutton_390x120 within w_table_produit
end type
type cb_annuler from uo_picturebutton_390x120 within w_table_produit
end type
type cb_supprimer from uo_picturebutton_390x120 within w_table_produit
end type
type cb_enregistrer from uo_picturebutton_390x120 within w_table_produit
end type
type cb_fermer from uo_picturebutton_390x120 within w_table_produit
end type
type cb_modifier from uo_picturebutton_390x120 within w_table_produit
end type
type dw_liste_edition from datawindow within w_table_produit
end type
type dw_choix from datawindow within w_table_produit
end type
type dw_liste from u_basedw within w_table_produit
end type
type uo_1 from resize_fenetre within w_table_produit
end type
type cb_tous from uo_picturebutton_390x120 within w_table_produit
end type
type pb_rechercher from uo_picturebutton_390x120 within w_table_produit
end type
type pb_internet from uo_picturebutton_390x120 within w_table_produit
end type
type cbx_avec_les_inactifs from checkbox within w_table_produit
end type
type cb_1 from uo_picturebutton_390x120 within w_table_produit
end type
end forward

global type w_table_produit from w_fenetre_arakis
integer width = 4503
integer height = 2968
string title = "Produits"
gb_filtre gb_filtre
cb_imprimer cb_imprimer
cb_ajouter cb_ajouter
cb_annuler cb_annuler
cb_supprimer cb_supprimer
cb_enregistrer cb_enregistrer
cb_fermer cb_fermer
cb_modifier cb_modifier
dw_liste_edition dw_liste_edition
dw_choix dw_choix
dw_liste dw_liste
uo_1 uo_1
cb_tous cb_tous
pb_rechercher pb_rechercher
pb_internet pb_internet
cbx_avec_les_inactifs cbx_avec_les_inactifs
cb_1 cb_1
end type
global w_table_produit w_table_produit

type variables
str_twostring struct //pour la passage de param
datawindowchild idw_type //dddw de la dw choix


string v_catego_cherche, v_type_cherche
end variables

forward prototypes
public subroutine ajouter ()
public subroutine modifier ()
public subroutine reference ()
end prototypes

public subroutine ajouter ();str_twostring struct_retour //pour récuperer les infos de la response window
struct.code = "      " //variable de la str passée en param à la response window pour distinguer entre ajout et modif
struct.message = dw_choix.getitemstring(dw_choix.getrow(),"code_categorie_produit") //passage du param code catégorie produit
struct.auxiliaire =  dw_choix.getitemstring(dw_choix.getrow(),"code")


//je me suis un peu fait chier, on passe en param le type et on distingue apres en fonction du fait qu'il soit 
//nul ou pas car il peut etre null de si on affiche le type dans la fenetre d'ajout, et puis de si au retour on 
//arrive sur une fenetre ou toute la categorie est affiché ou seulement un type
OpenWithParm(w_produit_fiche,struct)

//on permet à l'utilisateur de choisir la categorie et le type du produit ajouter,ce qui semble normal
//mais assez chiant pour nous. On doit donc recuperer les infos du prod ajouter pour afficher la categorie
//et eventuellement le type correspondant

struct_retour = message.powerobjectparm //param de retour de la response window

dw_choix.Setitem(dw_choix.getrow(),"code_categorie_produit",struct_retour.message)//on affiche la categorie passée en param
idw_type.retrieve(struct_retour.message)//on récupère la dddw type correspondant a la categorie
if struct_retour.auxiliaire = "" then
	//la variable auxillaire de retour est égale au type du produit ajouté si on avait fourni
	//un type initial d'ajout, sinon elle est nulle
	
	//dans ce cas la elle est nulle on retrieve sur la categorie independamment du type
	 v_catego_cherche = struct_retour.message
	 v_type_cherche = '%'
	dw_liste.retrieve( v_catego_cherche, v_type_cherche)
	reference()//remplissage de la colonne reference de la dw dw_liste
	dw_choix.Setitem(dw_choix.getrow(),"code","")
else
	//on retrieve sur le type de produit
	 v_catego_cherche = struct_retour.message
	 v_type_cherche = struct_retour.auxiliaire
	dw_liste.retrieve( v_catego_cherche, v_type_cherche )
	reference()
	dw_choix.Setitem(dw_choix.getrow(),"code",struct_retour.auxiliaire)
end if
end subroutine

public subroutine modifier ();str_twostring struct_retour //struct pour passage de param de retour de la response window

if dw_liste.rowcount() > 0 then
	//maj de la struct passée en param à la response window
	struct.code = dw_liste.getitemstring(dw_liste.getrow(),"produit_code_interne")
	struct.message = dw_choix.getitemstring(dw_choix.getrow(),"code_categorie_produit")
	struct.auxiliaire =  dw_choix.getitemstring(dw_choix.getrow(),"code")
	
	// On ajoute une tempo sinon le 2ème clique porte sur la fenêtre qu'on ouvre => Etonnant !!!!!!!
	sleep(100)
	OpenWithParm(w_produit_fiche,struct)
	
	//récupération des infos en retour de la response window
	struct_retour = message.powerobjectparm
	
	//explication des passages de param : cf fonction ajout
	dw_choix.Setitem(dw_choix.getrow(),"code_categorie_produit",struct_retour.message)
	idw_type.retrieve(struct_retour.message)
	if struct_retour.auxiliaire = "" then
		 v_catego_cherche = struct_retour.message
		 v_type_cherche = '%'
		dw_liste.retrieve( v_catego_cherche, v_type_cherche)
		reference()
		dw_choix.Setitem(dw_choix.getrow(),"code","")
	else
		 v_catego_cherche = struct_retour.message
		 v_type_cherche = struct_retour.auxiliaire
		dw_liste.retrieve(v_catego_cherche, v_type_cherche)
		reference()
		dw_choix.Setitem(dw_choix.getrow(),"code",struct_retour.auxiliaire)
	end if
	
	// Repositionnement de la liste
	long lig
	lig = dw_liste.find("produit_code_interne = '"+ string(struct.code)+"'" , 0, 99999)
	dw_liste.Scrolltorow(lig)
	dw_liste.setrow(lig)
	dw_liste.SelectRow(0,False)
	dw_liste.SelectRow(lig,True)
end if
end subroutine

public subroutine reference ();//remplissage de la colonne reference de la dw liste
//cette colonne est une colonne fictive elle ne correspond à aucun champ de table de la relation de la bsd
//pour les prises en compte de modif cela posait prob car on modif la dw apres le retrieve
//pour remedier a cela on ne prend en compte que le deletecount de la dw à la fermeture de la fenetre
//cela n'est pas genant car on ne peut directement que supprimer une ligne et pas la modifier


//pour chaque ligne de la dw on regarde s'il existe une fiche de produit reference correspondant
//si oui on met le champ a vrai et si non on le met a faux

integer nb_row, compteur, i
string code_produit_courant
nb_row = dw_liste.rowcount()

FOR i = 1 to nb_row
	
	code_produit_courant = dw_liste.getitemstring(i,"produit_code_interne")
	  SELECT count(*) 
	    INTO :compteur  
	    FROM "reference_produit"  
	   WHERE "reference_produit"."code_produit" = :code_produit_courant   ;
		if compteur > 0 then
			dw_liste.setitem(i,"produit_couleur_texte",1)
		else
			dw_liste.setitem(i,"produit_couleur_texte",0)
		end if
NEXT

// pour ne pas avoir de message de maj de la table
dw_liste.ResetUpdate()



end subroutine

on w_table_produit.create
int iCurrent
call super::create
this.gb_filtre=create gb_filtre
this.cb_imprimer=create cb_imprimer
this.cb_ajouter=create cb_ajouter
this.cb_annuler=create cb_annuler
this.cb_supprimer=create cb_supprimer
this.cb_enregistrer=create cb_enregistrer
this.cb_fermer=create cb_fermer
this.cb_modifier=create cb_modifier
this.dw_liste_edition=create dw_liste_edition
this.dw_choix=create dw_choix
this.dw_liste=create dw_liste
this.uo_1=create uo_1
this.cb_tous=create cb_tous
this.pb_rechercher=create pb_rechercher
this.pb_internet=create pb_internet
this.cbx_avec_les_inactifs=create cbx_avec_les_inactifs
this.cb_1=create cb_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.gb_filtre
this.Control[iCurrent+2]=this.cb_imprimer
this.Control[iCurrent+3]=this.cb_ajouter
this.Control[iCurrent+4]=this.cb_annuler
this.Control[iCurrent+5]=this.cb_supprimer
this.Control[iCurrent+6]=this.cb_enregistrer
this.Control[iCurrent+7]=this.cb_fermer
this.Control[iCurrent+8]=this.cb_modifier
this.Control[iCurrent+9]=this.dw_liste_edition
this.Control[iCurrent+10]=this.dw_choix
this.Control[iCurrent+11]=this.dw_liste
this.Control[iCurrent+12]=this.uo_1
this.Control[iCurrent+13]=this.cb_tous
this.Control[iCurrent+14]=this.pb_rechercher
this.Control[iCurrent+15]=this.pb_internet
this.Control[iCurrent+16]=this.cbx_avec_les_inactifs
this.Control[iCurrent+17]=this.cb_1
end on

on w_table_produit.destroy
call super::destroy
destroy(this.gb_filtre)
destroy(this.cb_imprimer)
destroy(this.cb_ajouter)
destroy(this.cb_annuler)
destroy(this.cb_supprimer)
destroy(this.cb_enregistrer)
destroy(this.cb_fermer)
destroy(this.cb_modifier)
destroy(this.dw_liste_edition)
destroy(this.dw_choix)
destroy(this.dw_liste)
destroy(this.uo_1)
destroy(this.cb_tous)
destroy(this.pb_rechercher)
destroy(this.pb_internet)
destroy(this.cbx_avec_les_inactifs)
destroy(this.cb_1)
end on

event open;call super::open;string code_categorie

dw_liste.settransobject(sqlca) //dw de la liste des produits
dw_liste_edition.settransobject(sqlca) //dw de la liste des produits editions
dw_choix.settransobject(sqlca) //dw du choix de categorie et type du produit
dw_choix.getchild("code",idw_type) //dddw du type de produit (dw fille de dw choix)
idw_type.settransobject(sqlca)
idw_type.insertrow(0) //on insère une ligne pour éviter la requête du retrieval argument var_code_categorie de la dddw type

if dw_choix.retrieve() > 0 then
	//on retrieve cette dw pour récupérer une categorie de produit
	code_categorie = dw_choix.getitemstring(dw_choix.getrow(),"code_categorie_produit")
	dw_choix.reset()
	//idw_type.retrieve(code_categorie)
	dw_choix.insertrow(0)
	//dw_choix.setitem(dw_choix.rowcount(),"code_categorie_produit",code_categorie)
//	dw_liste.retrieve(code_categorie,'%')
 	v_catego_cherche = "%"
 	v_type_cherche = "%"
	dw_liste.retrieve( v_catego_cherche, v_type_cherche)
	reference()


	// Verrouillage selon les droits d'accès
	//-------------------------------------------
	
	choose case droits_acces[70]
		Case 'C'
			// Consultation 
			cb_ajouter.enabled = false
			cb_supprimer.enabled = false
			cb_enregistrer.enabled = false
		Case 'M'
			// Modification 
		//		cb_ajouter.enabled = false
			cb_supprimer.enabled = false
	end choose

	uo_1.taille(this)
	
	// que les actifs en entrant
	dw_liste.setfilter("actif = 1")
	dw_liste.filter()

	if enregistrement_automatique then
		cb_annuler.visible = false
		cb_enregistrer.visible = false
	end if


else
	//prog defensive si l'utilisateur ouvre cette fenêtre sans avoir entrer de classification cad de categorie et type de produit
	uo_1.taille(this)
	MessageBox("Attention","Vous devez saisir une classification de produit avant de saisir un produit")
	close(this)
end if

end event

event resize;uo_1.retaille(this)

// repositionnement 
cbx_avec_les_inactifs.x = gb_filtre.x + 55
cbx_avec_les_inactifs.y = gb_filtre.y + 55
end event

event close;call super::close;
if enregistrement_automatique and cb_enregistrer.enabled then
	cb_enregistrer.triggerevent(clicked!)
end if 


end event

type p_fond from w_fenetre_arakis`p_fond within w_table_produit
end type

type gb_filtre from groupbox within w_table_produit
string tag = "no resize"
integer x = 1792
integer y = 2480
integer width = 773
integer height = 168
integer taborder = 70
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Filtre"
borderstyle borderstyle = styleraised!
end type

type cb_imprimer from uo_picturebutton_390x120 within w_table_produit
integer x = 2688
integer y = 2684
integer width = 448
integer taborder = 80
string text = "&Imprimer"
string iconname = "ACTIONS_imprimer.png"
end type

event clicked;call super::clicked;if Messagebox("Demande de confirmation","Confirmez-vous l'impression de la liste ?",Question!, YesNo!, 2) = 1 then 
	dw_liste_edition.retrieve( v_catego_cherche, v_type_cherche)
	if not cbx_avec_les_inactifs.checked  then
		dw_liste_edition.setfilter("actif = 1")
		dw_liste_edition.filter()
	end if
	dw_liste_edition.print()
end if
end event

type cb_ajouter from uo_picturebutton_390x120 within w_table_produit
integer y = 2684
integer width = 448
integer taborder = 40
string text = "&Ajouter"
string iconname = "ACTIONS_ajouter.png"
end type

event clicked;call super::clicked;ajouter()
end event

type cb_annuler from uo_picturebutton_390x120 within w_table_produit
integer x = 3136
integer y = 2684
integer width = 448
integer taborder = 50
string text = "&Annuler"
string iconname = "ACTIONS_annuler.png"
end type

event clicked;call super::clicked;string code_type_produit, code_categorie_produit

rollback ;

code_type_produit = dw_choix.getitemstring(dw_choix.getrow(),"code")
code_categorie_produit = dw_choix.getitemstring(dw_choix.getrow(),"code_categorie_produit")
if isnull(code_type_produit) or code_type_produit = "" then
	 v_catego_cherche = code_categorie_produit
	 v_type_cherche = '%'
	dw_liste.retrieve( v_catego_cherche, v_type_cherche)
	reference()
else
	 v_catego_cherche = code_categorie_produit
	 v_type_cherche = code_type_produit
	dw_liste.retrieve( v_catego_cherche, v_type_cherche)
	reference()
end if
end event

type cb_supprimer from uo_picturebutton_390x120 within w_table_produit
integer x = 1344
integer y = 2684
integer width = 448
integer taborder = 40
string text = "&Supprimer"
string iconname = "ACTIONS_supprimer.png"
end type

event clicked;call super::clicked;if dw_liste.rowcount() > 0 then
	son(7)
	
	// on va faire des delete AVANT dans certaines tables pour être sur que le deleterow passe bien
	
//	string v_code_produit
//	
//	v_code_produit = dw_liste.getitemstring(dw_liste.getrow(), "produit_code_interne")
//	
////	delete from "param_stock_produit" where code_produit = :v_code_produit ;
//	delete from "param_stock_fournisseur" where code_produit = :v_code_produit ;
//	delete from "reference_produit" where code_produit = :v_code_produit ;
	
	
	dw_liste.deleterow(dw_liste.getrow())
end if
end event

type cb_enregistrer from uo_picturebutton_390x120 within w_table_produit
integer x = 3584
integer y = 2684
integer width = 448
integer taborder = 50
string text = "&Enregistrer"
boolean default = true
string iconname = "ACTIONS_enregistrer.png"
end type

event clicked;call super::clicked;dw_liste.accepttext()
if dw_liste.update() = 1 then
	commit ;
else
	Rollback ;
end if
end event

type cb_fermer from uo_picturebutton_390x120 within w_table_produit
integer x = 4032
integer y = 2684
integer width = 448
integer taborder = 50
string text = "&Fermer"
string iconname = "ACTIONS_fermer.png"
end type

event clicked;call super::clicked;dw_liste.accepttext()
if (dw_liste.modifiedcount() > 0 or dw_liste.deletedcount() > 0) and not enregistrement_automatique Then
	If MessageBox("ATTENTION","Vous avez fait des modifications sur le fichier !~n~nVoulez-vous vraiment fermer cette fenêtre sans enregistrer (et ainsi perdre les modifications) ?",Question!,YesNo!, 2) = 1 Then
		fermer_fenetre(parent)
	end if
else
	fermer_fenetre(parent)
end if
end event

type cb_modifier from uo_picturebutton_390x120 within w_table_produit
integer x = 1792
integer y = 2684
integer width = 448
integer taborder = 40
string text = "&Modifier"
string iconname = "ACTIONS_modifier.png"
end type

event clicked;call super::clicked;modifier()
end event

type dw_liste_edition from datawindow within w_table_produit
boolean visible = false
integer x = 1038
integer y = 1068
integer width = 1774
integer height = 432
integer taborder = 30
string title = "none"
string dataobject = "dw_table_liste_produit_edition"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type dw_choix from datawindow within w_table_produit
string tag = "no resizeall brush centrer "
integer x = 1088
integer y = 20
integer width = 1687
integer height = 252
integer taborder = 10
string title = "none"
string dataobject = "dw_table_produit_choix"
boolean livescroll = true
end type

event itemchanged;if dwo.name = 'code_categorie_produit' then
	idw_type.retrieve(data)
	 v_catego_cherche = data
	 v_type_cherche = '%'
	dw_liste.retrieve( v_catego_cherche, v_type_cherche)
	reference()
	dw_choix.setitem(row,"code","")
end if
if dwo.name = 'code' then
	 v_catego_cherche = '%'
	 v_type_cherche = data
	dw_liste.retrieve( v_catego_cherche, v_type_cherche)
	reference()
end if
end event

event rbuttondown;if row > 0 then
	if dwo.name = "code" then
		dw_choix.setitem(row,"code","")
		dw_liste.retrieve(dw_choix.getitemstring(dw_choix.getrow(),"code_categorie_produit"),'%')
	end if
end if
end event

type dw_liste from u_basedw within w_table_produit
string tag = "no resize brush centrer "
integer x = 411
integer y = 288
integer width = 3931
integer height = 2144
integer taborder = 20
string dataobject = "dw_liste_produit"
boolean hscrollbar = false
borderstyle borderstyle = stylebox!
end type

event doubleclicked;call super::doubleclicked;if row > 0 then
	modifier()
end if
end event

event itemchanged;call super::itemchanged;
if enregistrement_automatique and cb_enregistrer.enabled then
	cb_enregistrer.triggerevent(clicked!)
end if
end event

type uo_1 from resize_fenetre within w_table_produit
boolean visible = false
integer x = 2789
integer y = 340
integer taborder = 20
end type

on uo_1.destroy
call resize_fenetre::destroy
end on

type cb_tous from uo_picturebutton_390x120 within w_table_produit
integer x = 3305
integer y = 68
integer width = 411
integer height = 152
integer taborder = 20
boolean bringtotop = true
string text = "&Tous"
end type

event clicked;call super::clicked;
 v_catego_cherche = '%'
 v_type_cherche = '%'


dw_liste.retrieve( v_catego_cherche, v_type_cherche)

end event

type pb_rechercher from uo_picturebutton_390x120 within w_table_produit
integer x = 2240
integer y = 2684
integer width = 448
integer taborder = 50
boolean bringtotop = true
string text = "&Rechercher"
string iconname = "ACTIONS_chercher.png"
end type

event clicked;call super::clicked;str_twostring struct_retour //struct pour passage de param de retour de la response window


OpenWithParm(w_cherche_produit , "3")

// Doit renvoyer le code du produit trouvé 
if Message.StringParm <> "" then
	
	string code_produit_a_modifier
	code_produit_a_modifier =  Message.StringParm
	 
	string v_type, v_cat
	
	// Code interne du produit
	struct.code = code_produit_a_modifier
	
	  SELECT "type_produit"."code",    "type_produit"."code_categorie_produit"  
    INTO :v_type,   :v_cat  
    FROM "produit",  "type_produit"  
   WHERE ( "type_produit"."code" = "produit"."code_type_produit" ) and  
         ( ( "produit"."code_interne" = :code_produit_a_modifier ) )   ;

	// Catégorie
	struct.message = v_cat
	// type de produit
	struct.auxiliaire =  v_type
	
	
	OpenWithParm(w_produit_fiche,struct)
	
	//récupération des infos en retour de la response window
	struct_retour = message.powerobjectparm
	
	//explication des passages de param : cf fonction ajout
	dw_choix.Setitem(dw_choix.getrow(),"code_categorie_produit",struct_retour.message)
	idw_type.retrieve(struct_retour.message)
	if struct_retour.auxiliaire = "" then
		 v_catego_cherche = struct_retour.message
		 v_type_cherche = '%'
		dw_liste.retrieve( v_catego_cherche, v_type_cherche)
		reference()
		dw_choix.Setitem(dw_choix.getrow(),"code","")
	else
		 v_catego_cherche = struct_retour.message
		 v_type_cherche = struct_retour.auxiliaire
		dw_liste.retrieve( v_catego_cherche, v_type_cherche)
		reference()
		dw_choix.Setitem(dw_choix.getrow(),"code",struct_retour.auxiliaire)
	end if
	
	// Repositionnement de la liste
	long lig
	lig = dw_liste.find("produit_code_interne = '"+ string(struct.code)+"'" , 0, 99999)
	dw_liste.Scrolltorow(lig)
	dw_liste.setrow(lig)
	dw_liste.SelectRow(0,False)
	dw_liste.SelectRow(lig,True)
end if
	 
	 
	 
	 
	 
	 
	 
//	 
//	 
//	
////	// pour pouvoir utiliser la fonction modifier il faut bien se positionner dans la liste
////	
////	// Est ce que le produit est dans la liste
////	long lig
////	lig = dw_liste.find('produit_code_interne = "'+  Message.StringParm +'"', 0, dw_liste.rowcount())
////	
////	if lig = 0 then
////		dw_liste.retrieve('%','%')
////		lig = dw_liste.find('produit_code_interne = "'+  Message.StringParm +'"', 0, dw_liste.rowcount())
////	end if
////	
////	if lig > 0 then
////		dw_liste.Scrolltorow(lig)
////		dw_liste.Setrow(lig)
////		modifier()
////	else
////		Messagebox("ATTENTION","Impossible d'accéder à la fiche de ce produit.")
////	end if
//end if
end event

type pb_internet from uo_picturebutton_390x120 within w_table_produit
integer x = 448
integer y = 2684
integer width = 448
integer taborder = 50
boolean bringtotop = true
string text = "&Créa. Inter."
string tiptext = "Ajout à partir de catalogues fournisseurs en ligne"
string iconname = "Custom042_2!"
end type

event clicked;call super::clicked;

open(w_produit_creation_internet)



//récupération des infos en retour de la response window
str_twostring struct_retour //pour la passage de param
struct_retour = message.powerobjectparm

if not isnull(struct_retour.code ) then

	//explication des passages de param : cf fonction ajout
	dw_choix.Setitem(dw_choix.getrow(),"code_categorie_produit",struct_retour.message)
	idw_type.retrieve(struct_retour.message)
	if struct_retour.auxiliaire = "" then
		 v_catego_cherche = struct_retour.message
		 v_type_cherche = '%'
		dw_liste.retrieve( v_catego_cherche, v_type_cherche)
		reference()
		dw_choix.Setitem(dw_choix.getrow(),"code","")
	else
		 v_catego_cherche = struct_retour.message
		 v_type_cherche = struct_retour.auxiliaire
		dw_liste.retrieve(v_catego_cherche, v_type_cherche)
		reference()
		dw_choix.Setitem(dw_choix.getrow(),"code",struct_retour.auxiliaire)
	end if
	
	// Repositionnement de la liste
	long lig
	lig = dw_liste.find("produit_code_interne = '"+ string(struct.code)+"'" , 0, 99999)
	dw_liste.Scrolltorow(lig)
	dw_liste.setrow(lig)
	dw_liste.SelectRow(0,False)
	dw_liste.SelectRow(lig,True)

end if
end event

type cbx_avec_les_inactifs from checkbox within w_table_produit
string tag = "no resize all"
integer x = 1906
integer y = 2552
integer width = 558
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Avec les inactifs"
borderstyle borderstyle = styleraised!
end type

event clicked;
// sélection ou pas des inactifs ..
if this.checked then
	dw_liste.setfilter("")
else
	dw_liste.setfilter("actif = 1")
end if

dw_liste.filter()

end event

type cb_1 from uo_picturebutton_390x120 within w_table_produit
integer x = 896
integer y = 2684
integer width = 448
integer taborder = 50
boolean bringtotop = true
string text = "Dupliquer"
string iconname = "lc_copy.png"
end type

event clicked;call super::clicked;

// duplication du produit

if dw_liste.rowcount() > 0 then
	string v_designation, v_designation_nouveau
	string v_code_interne, v_code_interne_nouveau
	
	v_code_interne = dw_liste.getitemstring(dw_liste.getrow(),"produit_code_interne")
	v_designation = dw_liste.getitemstring(dw_liste.getrow(),"produit_designation")
	
	if messagebox("ATTENTION","Confirmez-vous la duplication du produit : " + v_designation + " ?", Question!, YesNo!, 2) = 1 then
		// 
		v_designation_nouveau = left(trim(v_designation),90) + "(copie)"
		
		v_code_interne_nouveau = string(get_next_code_produit())
		
		insert into produit (code_interne, code_type_produit, designation, couleur_texte, actif) 
		 (select :v_code_interne_nouveau, code_type_produit, :v_designation_nouveau, couleur_texte, actif from produit where code_interne = :v_code_interne ) ;
	
		if sqlca.sqlcode = 0 then
			
			insert into param_stock_produit (code_produit, code_praticien, qte_stock_min, code_lieu_stockage_habituel, interdiction_commande, type_gestion, duree_limite_utilisation, quantite_indicative, etat_stock)
			 (select :v_code_interne_nouveau, code_praticien, qte_stock_min, code_lieu_stockage_habituel, interdiction_commande, type_gestion, duree_limite_utilisation, quantite_indicative, etat_stock
			 from param_stock_produit where code_produit = :v_code_interne ) ;
	
			if sqlca.sqlcode = 0 then
				
				insert into reference_produit (code_produit, code_fournisseur, code_fabricant, "reference", prix, code_type_taxe, unite_vente, description, fournisseur_par_defaut, code_fournisseur_arakis)
				 (select :v_code_interne_nouveau, code_fournisseur, code_fabricant, "reference", prix, code_type_taxe, unite_vente, description, fournisseur_par_defaut, code_fournisseur_arakis
				 from reference_produit where code_produit = :v_code_interne ) ;
					
				if sqlca.sqlcode = 0 then
					commit ; 
					MessageBox("INFORMATIONS !", "La duplication a réussi !~n~nVous allez accéder à la fiche du nouveau produit.")
					cb_tous.triggerevent(clicked!)
					long lig 
					lig = dw_liste.Find("produit_code_interne = '"+ v_code_interne_nouveau + "'", 1, 9999999)
					if lig > 0 then 
						dw_liste.scrolltorow(lig)
						dw_liste.setrow(lig)
						modifier()
					else
						Messagebox("ATTENTION !", "Imposssible d'accéder à la fiche du nouveau produit !")
					end if
					
				else
					MessageBox("ATTENTION !", "Erreur N°3 dans la duplication du produit !~n~n"+ sqlca.sqlerrtext)
					rollback ; 
				end if			
			
			else
				MessageBox("ATTENTION !", "Erreur N°2 dans la duplication du produit !~n~n"+ sqlca.sqlerrtext)
				rollback ; 
			end if			
					
		else
			MessageBox("ATTENTION !", "Erreur N°1 dans la duplication du produit !~n~n"+ sqlca.sqlerrtext)
			rollback ; 
		end if
	end if
end if

end event

