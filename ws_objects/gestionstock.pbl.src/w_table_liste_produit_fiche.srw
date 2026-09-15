$PBExportHeader$w_table_liste_produit_fiche.srw
forward
global type w_table_liste_produit_fiche from w_fenetre_arakis
end type
type cb_supprimer from uo_picturebutton_390x120 within w_table_liste_produit_fiche
end type
type cb_ajouter from uo_picturebutton_390x120 within w_table_liste_produit_fiche
end type
type cb_valider from uo_picturebutton_390x120 within w_table_liste_produit_fiche
end type
type cb_fermer from uo_picturebutton_390x120_fermer within w_table_liste_produit_fiche
end type
type uo_1 from resize_fenetre within w_table_liste_produit_fiche
end type
type dw_recherche from datawindow within w_table_liste_produit_fiche
end type
type dw_liste from u_basedw within w_table_liste_produit_fiche
end type
type dw_basic from datawindow within w_table_liste_produit_fiche
end type
type gb_1 from groupbox within w_table_liste_produit_fiche
end type
type gb_2 from groupbox within w_table_liste_produit_fiche
end type
type gb_3 from groupbox within w_table_liste_produit_fiche
end type
end forward

global type w_table_liste_produit_fiche from w_fenetre_arakis
integer width = 2843
integer height = 1820
string title = "Fiche Liste de Produits (Traçabilité)"
windowtype windowtype = response!
cb_supprimer cb_supprimer
cb_ajouter cb_ajouter
cb_valider cb_valider
cb_fermer cb_fermer
uo_1 uo_1
dw_recherche dw_recherche
dw_liste dw_liste
dw_basic dw_basic
gb_1 gb_1
gb_2 gb_2
gb_3 gb_3
end type
global w_table_liste_produit_fiche w_table_liste_produit_fiche

type variables
string code //pour le passage de param
datawindowchild idw_type //dw fille de recherche pour le type de produit
datawindowchild idw_code_produit //dw fille de recherche pour le code produit

end variables

on w_table_liste_produit_fiche.create
int iCurrent
call super::create
this.cb_supprimer=create cb_supprimer
this.cb_ajouter=create cb_ajouter
this.cb_valider=create cb_valider
this.cb_fermer=create cb_fermer
this.uo_1=create uo_1
this.dw_recherche=create dw_recherche
this.dw_liste=create dw_liste
this.dw_basic=create dw_basic
this.gb_1=create gb_1
this.gb_2=create gb_2
this.gb_3=create gb_3
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_supprimer
this.Control[iCurrent+2]=this.cb_ajouter
this.Control[iCurrent+3]=this.cb_valider
this.Control[iCurrent+4]=this.cb_fermer
this.Control[iCurrent+5]=this.uo_1
this.Control[iCurrent+6]=this.dw_recherche
this.Control[iCurrent+7]=this.dw_liste
this.Control[iCurrent+8]=this.dw_basic
this.Control[iCurrent+9]=this.gb_1
this.Control[iCurrent+10]=this.gb_2
this.Control[iCurrent+11]=this.gb_3
end on

on w_table_liste_produit_fiche.destroy
call super::destroy
destroy(this.cb_supprimer)
destroy(this.cb_ajouter)
destroy(this.cb_valider)
destroy(this.cb_fermer)
destroy(this.uo_1)
destroy(this.dw_recherche)
destroy(this.dw_liste)
destroy(this.dw_basic)
destroy(this.gb_1)
destroy(this.gb_2)
destroy(this.gb_3)
end on

event open;call super::open;// Passage de paramètre entre fenêtre
// après un openwithparm(nom_fenêtre,paramètre(string,number...)
//
code = message.stringparm

uo_1.taille(this)
centrer(this)

dw_basic.settransobject(SQLCA)
dw_liste.settransobject(SQLCA)
dw_recherche.settransobject(SQLCA)
dw_recherche.getchild("produit_code_type_produit",idw_type)
dw_recherche.getchild("reference_produit_code_produit",idw_code_produit)
idw_type.settransobject(sqlca)
idw_code_produit.settransobject(sqlca)
idw_type.insertrow(0)
idw_code_produit.insertrow(0)

dw_recherche.insertrow(0)

gb_3.visible = false
dw_recherche.visible = false
cb_valider.visible = false

if code = "      " then
	// Ajout
	dw_basic.reset()
	dw_basic.insertrow(0)
	
	double max
		
  SELECT MAX(cast (code as float))  
    INTO :max  
    FROM "tracabilite_liste_produit"  
   WHERE ("code" not between 'a' AND 'z' ) AND  
         ("code" not between 'A' AND 'Z' )   ;

	IF IsNull(max) THEN
		max = 1
	ELSE	
		max = max + 1
	END IF	
	dw_basic.SetItem(dw_basic.RowCount(),"code",string(max))
	dw_basic.SetFocus()
else
	// Modif
	dw_basic.Modify("Code.Edit.DisplayOnly = Yes")
	dw_basic.retrieve(code)
	dw_liste.retrieve(code)
end if

// Verrouillage selon les droits d'accès
//-------------------------------------------

choose case droits_acces[70]
	Case 'C'
		// Consultation 
		cb_ajouter.enabled = false
		cb_supprimer.enabled = false
end choose

end event

event resize;call super::resize;uo_1.retaille(this)
end event

event close;call super::close;string code_traca
string libelle

dw_basic.accepttext()
code_traca = dw_basic.getitemstring(dw_basic.getrow(),"code")
libelle = dw_basic.getitemstring(dw_basic.getrow(),"libelle")

  UPDATE "tracabilite_liste_produit"  
     SET "libelle" = :libelle  
   WHERE "tracabilite_liste_produit"."code" = :code_traca;

IF SQLCA.SQLCode = -1 THEN 
	MessageBox("SQL error", SQLCA.SQLErrText)
else
	commit;
END IF


colore_tous_objets_window(this,couleur_fond_datawindow)

end event

type p_fond from w_fenetre_arakis`p_fond within w_table_liste_produit_fiche
end type

type cb_supprimer from uo_picturebutton_390x120 within w_table_liste_produit_fiche
integer x = 2235
integer y = 1036
integer width = 485
integer taborder = 60
string text = "&Supprimer"
string iconname = "ACTIONS_supprimer.png"
end type

event clicked;call super::clicked;//suppression d'une ligne dans dw_liste
//on recupere les donnees de la ligne puis on supprime par une requete sql

string code_traca
string code_fournisseur
string code_produit

if dw_liste.rowcount() > 0 then
	//recuperation des donnees
	code_traca = dw_liste.getitemstring(dw_liste.getrow(),"tracabilite_liste_produit_code")
	code_fournisseur = dw_liste.getitemstring(dw_liste.getrow(),"tracabilite_liste_produit_code_fournisse")
	code_produit = dw_liste.getitemstring(dw_liste.getrow(),"tracabilite_liste_produit_code_produit")
	
	//suppression par requete sql
	  DELETE FROM "tracabilite_liste_produit"  
	   WHERE ( "tracabilite_liste_produit"."code" = :code_traca ) AND  
         ( "tracabilite_liste_produit"."code_produit" = :code_produit ) AND  
         ( "tracabilite_liste_produit"."code_fournisseur" = :code_fournisseur );

	IF SQLCA.SQLCode = -1 THEN 
		MessageBox("SQL error", SQLCA.SQLErrText)
	else
		commit;
		dw_liste.retrieve(code_traca)
	END IF
else
	MessageBox("Attention","Vous devez sélectionner une ligne")
end if
end event

type cb_ajouter from uo_picturebutton_390x120 within w_table_liste_produit_fiche
integer x = 1733
integer y = 1036
integer width = 485
integer height = 152
integer taborder = 50
string text = "&Ajouter"
string iconname = "ACTIONS_ajouter.png"
end type

event clicked;call super::clicked;gb_3.visible = true
dw_recherche.visible = true
cb_valider.visible = true
end event

type cb_valider from uo_picturebutton_390x120 within w_table_liste_produit_fiche
integer x = 1582
integer y = 1468
integer width = 485
integer height = 152
integer taborder = 50
string text = "&Valider"
string iconname = "ACTIONS_enregistrer.png"
end type

event clicked;call super::clicked;//ajout d'une ligne dans dw_liste
//on recupere les donnees dans dw recherche
//on les teste, puis si elles sont valides on ajoute et on reset dw_recherche

string code_traca
string code_fournisseur
string code_produit
integer compteur

//recuperation des donnees
code_traca = dw_basic.getitemstring(dw_basic.getrow(),"code")
code_fournisseur = dw_recherche.getitemstring(dw_recherche.getrow(),"reference_produit_code_fournisseur")
code_produit = dw_recherche.getitemstring(dw_recherche.getrow(),"reference_produit_code_produit")

  SELECT count(*)  
    INTO :compteur  
    FROM "reference_produit"  
   WHERE ( "reference_produit"."code_produit" = :code_produit ) AND  
         ( "reference_produit"."code_fournisseur" = :code_fournisseur )   ;

if compteur = 1 then
	  INSERT INTO "tracabilite_liste_produit"  
         ( "code",   
           "code_produit",   
           "code_fournisseur" )  
	  VALUES ( :code_traca,   
           :code_produit,   
           :code_fournisseur )  ;
	IF SQLCA.SQLCode = -1 THEN 
		MessageBox("Attention", "Ce produit figure déja dans votre liste")
		rollback;
	else
		commit;
		dw_liste.retrieve(code_traca)
		dw_recherche.reset()
		idw_type.reset()
		idw_code_produit.reset()
		idw_type.insertrow(0)
		idw_code_produit.insertrow(0)
		dw_recherche.insertrow(0)
	END IF
	gb_3.visible = false
	dw_recherche.visible = false
	cb_valider.visible = false
else
	MessageBox("Attention","Vous devez entrer un fournisseur et un code produit")
end if
end event

type cb_fermer from uo_picturebutton_390x120_fermer within w_table_liste_produit_fiche
integer x = 2181
integer y = 1512
integer width = 494
integer height = 152
integer taborder = 40
end type

type uo_1 from resize_fenetre within w_table_liste_produit_fiche
event destroy ( )
boolean visible = false
integer x = 1618
integer y = 1040
integer taborder = 40
end type

on uo_1.destroy
call resize_fenetre::destroy
end on

type dw_recherche from datawindow within w_table_liste_produit_fiche
string tag = "brush"
integer x = 192
integer y = 1304
integer width = 1326
integer height = 324
integer taborder = 40
string title = "none"
string dataobject = "dw_choix_code_produit"
boolean border = false
boolean livescroll = true
end type

event itemchanged;if dwo.name = "type_produit_code_categorie_produit" then
	if idw_type.retrieve(data) = 0 then
		idw_type.insertrow(0)
	end if
end if
if dwo.name = "reference_produit_code_fournisseur" then
	if idw_code_produit.retrieve(this.getitemstring(this.getrow(),"produit_code_type_produit"),data) = 0 then
		idw_code_produit.insertrow(0)
	end if
end if
end event

type dw_liste from u_basedw within w_table_liste_produit_fiche
string tag = "brush"
integer x = 160
integer y = 432
integer width = 2528
integer height = 576
integer taborder = 30
string dataobject = "dw_table_liste_produit_fiche_liste"
boolean hscrollbar = false
boolean border = false
end type

type dw_basic from datawindow within w_table_liste_produit_fiche
string tag = "brush"
integer x = 151
integer y = 96
integer width = 1353
integer height = 200
integer taborder = 10
string title = "none"
string dataobject = "dw_table_liste_produit_fiche_entete"
boolean border = false
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type gb_1 from groupbox within w_table_liste_produit_fiche
integer x = 123
integer y = 16
integer width = 1417
integer height = 312
integer taborder = 10
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 16777215
string text = "Entête de la liste"
end type

type gb_2 from groupbox within w_table_liste_produit_fiche
integer x = 119
integer y = 368
integer width = 2615
integer height = 832
integer taborder = 20
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 16777215
string text = "Liste de produit"
end type

type gb_3 from groupbox within w_table_liste_produit_fiche
integer x = 114
integer y = 1228
integer width = 1989
integer height = 428
integer taborder = 30
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 16777215
string text = "Ajout Produit"
end type

