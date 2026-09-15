$PBExportHeader$w_recherche_commande_reception.srw
forward
global type w_recherche_commande_reception from w_fenetre_arakis
end type
type cb_receptionner from uo_picturebutton_390x120 within w_recherche_commande_reception
end type
type cb_maj from uo_picturebutton_390x120 within w_recherche_commande_reception
end type
type cb_supprimer from uo_picturebutton_390x120 within w_recherche_commande_reception
end type
type cb_annuler from uo_picturebutton_390x120 within w_recherche_commande_reception
end type
type cb_rechercher from uo_picturebutton_390x120 within w_recherche_commande_reception
end type
type uo_1 from resize_fenetre within w_recherche_commande_reception
end type
type dw_prati from datawindow within w_recherche_commande_reception
end type
type rb_unprati from radiobutton within w_recherche_commande_reception
end type
type rb_tousprati from radiobutton within w_recherche_commande_reception
end type
type st_resultat from statictext within w_recherche_commande_reception
end type
type em_resultat from editmask within w_recherche_commande_reception
end type
type cbx_solde from checkbox within w_recherche_commande_reception
end type
type dw_nom from datawindow within w_recherche_commande_reception
end type
type st_2 from statictext within w_recherche_commande_reception
end type
type st_1 from statictext within w_recherche_commande_reception
end type
type em_date_fin from editmask within w_recherche_commande_reception
end type
type em_date_debut from editmask within w_recherche_commande_reception
end type
type em_numero from editmask within w_recherche_commande_reception
end type
type rb_numero from radiobutton within w_recherche_commande_reception
end type
type rb_date from radiobutton within w_recherche_commande_reception
end type
type rb_unseul from radiobutton within w_recherche_commande_reception
end type
type rb_tous from radiobutton within w_recherche_commande_reception
end type
type dw_ligne from u_basedw within w_recherche_commande_reception
end type
type dw_liste from u_basedw within w_recherche_commande_reception
end type
type bb_dupliquer from uo_picturebutton_390x120 within w_recherche_commande_reception
end type
type rb_tous_produits from radiobutton within w_recherche_commande_reception
end type
type rb_un_produit from radiobutton within w_recherche_commande_reception
end type
type st_designaton_produit from statictext within w_recherche_commande_reception
end type
type gb_1 from groupbox within w_recherche_commande_reception
end type
type gb_3 from groupbox within w_recherche_commande_reception
end type
type gb_4 from groupbox within w_recherche_commande_reception
end type
type gb_5 from groupbox within w_recherche_commande_reception
end type
type gb_2 from groupbox within w_recherche_commande_reception
end type
type gb_6 from groupbox within w_recherche_commande_reception
end type
type gb_7 from groupbox within w_recherche_commande_reception
end type
end forward

global type w_recherche_commande_reception from w_fenetre_arakis
integer width = 5371
integer height = 3020
string title = "Recherche Commande"
long backcolor = 15780518
cb_receptionner cb_receptionner
cb_maj cb_maj
cb_supprimer cb_supprimer
cb_annuler cb_annuler
cb_rechercher cb_rechercher
uo_1 uo_1
dw_prati dw_prati
rb_unprati rb_unprati
rb_tousprati rb_tousprati
st_resultat st_resultat
em_resultat em_resultat
cbx_solde cbx_solde
dw_nom dw_nom
st_2 st_2
st_1 st_1
em_date_fin em_date_fin
em_date_debut em_date_debut
em_numero em_numero
rb_numero rb_numero
rb_date rb_date
rb_unseul rb_unseul
rb_tous rb_tous
dw_ligne dw_ligne
dw_liste dw_liste
bb_dupliquer bb_dupliquer
rb_tous_produits rb_tous_produits
rb_un_produit rb_un_produit
st_designaton_produit st_designaton_produit
gb_1 gb_1
gb_3 gb_3
gb_4 gb_4
gb_5 gb_5
gb_2 gb_2
gb_6 gb_6
gb_7 gb_7
end type
global w_recherche_commande_reception w_recherche_commande_reception

type variables
string code_fournisseur_courant,code_praticien_courant
environment	lenv_obj
boolean prems


string s_code_produit, s_designation_produit
end variables

forward prototypes
public subroutine continuer ()
public subroutine color ()
public function boolean recuperer ()
end prototypes

public subroutine continuer ();
end subroutine

public subroutine color ();//on met en rouge les commandes soldées

integer compteur, i,nb_total, nb_archive
double numero_commande_courant

FOR i = 1 to dw_liste.rowcount()
  numero_commande_courant = dw_liste.getitemnumber(i,"numero_commande")
  SELECT count(*) 
    into :compteur
    FROM "commande"
  WHERE (exists(SELECT *FROM "ligne_commande" 
  						WHERE ( "ligne_commande"."numero_commande" = :numero_commande_courant ) 
								AND  ( "ligne_commande"."solde" = 'n' )  ) );   
  
	if compteur = 0 then
		dw_liste.setitem(i,"couleur_texte",255)
	else
		dw_liste.setitem(i,"couleur_texte",0)
	end if
NEXT
end subroutine

public function boolean recuperer ();//retrieve de dw_liste en fonction de l'état et de la valeur des différents champs de la fenetre

integer nb_row
integer compteur
integer compteur_solde
double numero_commande_courant

//sert uniquement dans le cas la recherche est parametree en numero de commmande////
double numero //numero saisi                                                    ////
		//variable servant au remplissage de la ligne de l'entête                 ////
date date_commande                                                              ////
string commentaires,code_utilisateur,mode_transport,code_fournisseur            ////
////////////////////////////////////////////////////////////////////////////////////

if rb_numero.checked then
	//recherche par numero de commande
	dw_liste.reset()
	numero = double(em_numero.text)
	SELECT count(*)  
    INTO :compteur
    FROM "commande"  
   WHERE "commande"."numero_commande" = :numero   ;
	
	if compteur = 1 then
		//si on trouve la commande on remplit les champs de la ligne etant donné que le retrieve 
		//est programme pour fonctionner par date de commande
	  	SELECT "commande"."date_commande",   
	         "commande"."code_fournisseur",   
	         "commande"."commentaires",   
	         "commande"."utilisateur",   
	         "commande"."mode_transport"  
	    INTO :date_commande,   
	         :code_fournisseur,   
	         :commentaires,   
	         :code_utilisateur,   
	         :mode_transport  
	    FROM "commande"
	   WHERE "commande"."numero_commande" = :numero;
		
		dw_liste.insertrow(0)
		dw_liste.setitem(dw_liste.rowcount(),"numero_commande",numero)
		dw_liste.setitem(dw_liste.rowcount(),"code_fournisseur",code_fournisseur)
		dw_liste.setitem(dw_liste.rowcount(),"date_commande",date_commande)
		dw_liste.setitem(dw_liste.rowcount(),"mode_transport",mode_transport)
		dw_liste.setitem(dw_liste.rowcount(),"utilisateur",code_utilisateur)
		dw_liste.setitem(dw_liste.rowcount(),"commentaires",commentaires)
		nb_row = 1
	else
		nb_row = 0
	end if
else
	//recherche par date de commande
	if cbx_solde.checked then
		nb_row = dw_liste.retrieve(date(em_date_debut.text),date(em_date_fin.text),code_fournisseur_courant,code_praticien_courant,'%')
		color() //on met en couleur les commandes soldées
	else
		nb_row = dw_liste.retrieve(date(em_date_debut.text),date(em_date_fin.text),code_fournisseur_courant,code_praticien_courant,'n')
	end if
end if

// V2023  : Pour la recherche pour 1 produit, on fait une surcouche (par optimal mais on casse pas l'existant !)
// On checke tous les lignes et on supprime de la liste si pas le produit
if rb_un_produit.checked then 
	long lig, tot, cpt
	tot = dw_liste.rowcount()
	for lig = tot to 1 step -1
		numero_commande_courant = dw_liste.getitemNumber(lig, "numero_commande")
		select isnull(count(*),0) into :cpt from commande, ligne_commande 
		where commande.numero_commande = ligne_commande.numero_commande and commande.numero_commande = :numero_commande_courant and ligne_commande.code_produit = :s_code_produit ;
		
		if cpt = 0 then
			dw_liste.deleterow(lig)
		end if
	next
	nb_row = dw_liste.rowcount()
end if

if nb_row > 0 then
	//maj du champ nombre de résultat
	cb_receptionner.enabled ( true)
	cb_maj.enabled ( true)
	em_resultat.text = string(nb_row)
	st_resultat.text = "Résultats"
	
	//on recupere la premiere commande de la liste dans dw_ligne
	dw_ligne.retrieve(dw_liste.getitemnumber(dw_liste.getrow(),"numero_commande"),dw_liste.getitemstring(dw_liste.getrow(),"code_fournisseur"))
	dw_liste.selectrow(dw_liste.getrow(),true)
	
	//on utilise la dw de réception de commande, il faut donc modifier des couleurs et taborder de la dw
	dw_ligne.modify("ligne_commande_qte_livree.background.color = 14737632") 
	dw_ligne.settaborder("ligne_commande_solde",0)
	
	//on regarde si la commande a des lignes soldés 
	numero_commande_courant = dw_liste.getitemnumber(dw_liste.getrow(),"numero_commande")
	SELECT count(*)  
    INTO :compteur_solde  
    FROM "ligne_commande"  
   WHERE "ligne_commande"."numero_commande" = :numero_commande_courant
			AND "ligne_commande"."solde" = 'o';
	
	if compteur_solde > 0 then
		//si elle en a alors on empêche la maj de la commande
		cb_maj.enabled = false
		if nb_row = 1 and not prems then
			//si on est pas à l'ouverture de la fenetre qu'il y a une seule commande trouvée 
			//et qu'on ne peut que réceptionner alors on ouvre la fenetre de reception
			str_param_string param_passe  
			param_passe.param = string(numero_commande_courant)
			w_mdi_2020.uo_powerdock.of_openDocument(w_reception_commande, param_passe, "Réception de Commande", m_orthokis_2020.m_gestion_de_stock.m_reception_commande.toolbarItemName)
			return(true)
		end if
	else
		cb_maj.enabled = true
	end if
	cb_receptionner.setfocus()
else
	cb_receptionner.enabled = false
	cb_maj.enabled = false
	em_resultat.text = "Aucun"
	st_resultat.text = "Résultat"
	dw_ligne.reset()
end if
return(false)
end function

on w_recherche_commande_reception.create
int iCurrent
call super::create
this.cb_receptionner=create cb_receptionner
this.cb_maj=create cb_maj
this.cb_supprimer=create cb_supprimer
this.cb_annuler=create cb_annuler
this.cb_rechercher=create cb_rechercher
this.uo_1=create uo_1
this.dw_prati=create dw_prati
this.rb_unprati=create rb_unprati
this.rb_tousprati=create rb_tousprati
this.st_resultat=create st_resultat
this.em_resultat=create em_resultat
this.cbx_solde=create cbx_solde
this.dw_nom=create dw_nom
this.st_2=create st_2
this.st_1=create st_1
this.em_date_fin=create em_date_fin
this.em_date_debut=create em_date_debut
this.em_numero=create em_numero
this.rb_numero=create rb_numero
this.rb_date=create rb_date
this.rb_unseul=create rb_unseul
this.rb_tous=create rb_tous
this.dw_ligne=create dw_ligne
this.dw_liste=create dw_liste
this.bb_dupliquer=create bb_dupliquer
this.rb_tous_produits=create rb_tous_produits
this.rb_un_produit=create rb_un_produit
this.st_designaton_produit=create st_designaton_produit
this.gb_1=create gb_1
this.gb_3=create gb_3
this.gb_4=create gb_4
this.gb_5=create gb_5
this.gb_2=create gb_2
this.gb_6=create gb_6
this.gb_7=create gb_7
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_receptionner
this.Control[iCurrent+2]=this.cb_maj
this.Control[iCurrent+3]=this.cb_supprimer
this.Control[iCurrent+4]=this.cb_annuler
this.Control[iCurrent+5]=this.cb_rechercher
this.Control[iCurrent+6]=this.uo_1
this.Control[iCurrent+7]=this.dw_prati
this.Control[iCurrent+8]=this.rb_unprati
this.Control[iCurrent+9]=this.rb_tousprati
this.Control[iCurrent+10]=this.st_resultat
this.Control[iCurrent+11]=this.em_resultat
this.Control[iCurrent+12]=this.cbx_solde
this.Control[iCurrent+13]=this.dw_nom
this.Control[iCurrent+14]=this.st_2
this.Control[iCurrent+15]=this.st_1
this.Control[iCurrent+16]=this.em_date_fin
this.Control[iCurrent+17]=this.em_date_debut
this.Control[iCurrent+18]=this.em_numero
this.Control[iCurrent+19]=this.rb_numero
this.Control[iCurrent+20]=this.rb_date
this.Control[iCurrent+21]=this.rb_unseul
this.Control[iCurrent+22]=this.rb_tous
this.Control[iCurrent+23]=this.dw_ligne
this.Control[iCurrent+24]=this.dw_liste
this.Control[iCurrent+25]=this.bb_dupliquer
this.Control[iCurrent+26]=this.rb_tous_produits
this.Control[iCurrent+27]=this.rb_un_produit
this.Control[iCurrent+28]=this.st_designaton_produit
this.Control[iCurrent+29]=this.gb_1
this.Control[iCurrent+30]=this.gb_3
this.Control[iCurrent+31]=this.gb_4
this.Control[iCurrent+32]=this.gb_5
this.Control[iCurrent+33]=this.gb_2
this.Control[iCurrent+34]=this.gb_6
this.Control[iCurrent+35]=this.gb_7
end on

on w_recherche_commande_reception.destroy
call super::destroy
destroy(this.cb_receptionner)
destroy(this.cb_maj)
destroy(this.cb_supprimer)
destroy(this.cb_annuler)
destroy(this.cb_rechercher)
destroy(this.uo_1)
destroy(this.dw_prati)
destroy(this.rb_unprati)
destroy(this.rb_tousprati)
destroy(this.st_resultat)
destroy(this.em_resultat)
destroy(this.cbx_solde)
destroy(this.dw_nom)
destroy(this.st_2)
destroy(this.st_1)
destroy(this.em_date_fin)
destroy(this.em_date_debut)
destroy(this.em_numero)
destroy(this.rb_numero)
destroy(this.rb_date)
destroy(this.rb_unseul)
destroy(this.rb_tous)
destroy(this.dw_ligne)
destroy(this.dw_liste)
destroy(this.bb_dupliquer)
destroy(this.rb_tous_produits)
destroy(this.rb_un_produit)
destroy(this.st_designaton_produit)
destroy(this.gb_1)
destroy(this.gb_3)
destroy(this.gb_4)
destroy(this.gb_5)
destroy(this.gb_2)
destroy(this.gb_6)
destroy(this.gb_7)
end on

event open;call super::open;/////////////////////////////
// recherche des commandes //
/////////////////////////////

//à l'ouverture on effectue une recherche des commandes non soldés pour tous les fournisseurs pour tous les praticiens
//sur une année avant aujourd'hui
//on permet ensuite une recherche des commandes par fournisseur, par praticien, par période ou numéro de commande
//des commandes soldées ou non

//les résultats de la recherche sont affichées dans dw_liste, liste des entetes de commandes trouvees
//en cliquant sur une ligne on accede au contenu de la commande dans dw_ligne
//on peut ensuite maj la commande si elle n'a pas encore été modifié par un début de réception
//ou maj la commande

dw_liste.settransobject(sqlca)//dw des entetes de commandes
dw_ligne.settransobject(sqlca)//dw du contenu de la commande selectionnee
dw_nom.settransobject(sqlca)//nom du fournisseur
dw_prati.settransobject(sqlca)//nom du praticien

//mise au valeur par défault : date d'aujourd'hui pour date de fin et un an avant pour date de debut
em_date_fin.text = string(today())
em_date_debut.text = string(relativedate(date(em_date_fin.text),-365))
code_fournisseur_courant = "%"
code_praticien_courant = "%"

dw_nom.insertrow(0)
dw_prati.insertrow(0)

dw_nom.visible = false
dw_prati.visible = false
em_numero.visible = false

//prems sert a eviter un lancement automatique de la réception si 1 seul résultat 
prems = true
recuperer()

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


//this.backcolor = 16246738 //bleu un peu plus clair que sky

end event

event resize;call super::resize;uo_1.retaille(this)

double ratio
		
ratio = uo_1.ratio
		
dw_ligne.Object.DataWindow.zoom = string(int(ratio*90))
dw_liste.Object.DataWindow.zoom = string(int(ratio*100 ))


end event

type p_fond from w_fenetre_arakis`p_fond within w_recherche_commande_reception
integer x = 1184
end type

type cb_receptionner from uo_picturebutton_390x120 within w_recherche_commande_reception
integer x = 3301
integer y = 2624
integer width = 480
integer taborder = 60
string text = "&Réceptionner"
string iconname = "lc_stepin.png"
end type

event clicked;call super::clicked;double numero

if dw_liste.rowcount() > 0 then
	numero = dw_liste.getitemnumber(dw_liste.getrow(),"numero_commande")
	str_param_string param_passe  
	param_passe.param = string(numero)
	w_mdi_2020.uo_powerdock.of_openDocument(w_reception_commande, param_passe, "Réception de Commande", m_orthokis_2020.m_gestion_de_stock.m_reception_commande.toolbarItemName)
	fermer_fenetre(parent)
end if
end event

type cb_maj from uo_picturebutton_390x120 within w_recherche_commande_reception
integer x = 2770
integer y = 2624
integer width = 480
integer taborder = 60
string text = "&Mise à Jour"
string iconname = "ACTIONS_modifier.png"
end type

event clicked;call super::clicked;str_commande struct

struct.numero = dw_liste.getitemnumber(dw_liste.getrow(),"numero_commande")
struct.code_fourn = dw_liste.getitemstring(dw_liste.getrow(),"code_fournisseur")
struct.code_praticien = dw_liste.getitemstring(dw_liste.getrow(),"code_praticien")
struct.maj = true

w_mdi_2020.uo_powerdock.of_openDocument(w_saisie_commande, struct, "Mise à jour de Commande", m_orthokis_2020.m_gestion_de_stock.m_saisie_commande.toolbarItemName)
fermer_fenetre(parent)
end event

type cb_supprimer from uo_picturebutton_390x120 within w_recherche_commande_reception
integer x = 2240
integer y = 2624
integer width = 480
integer taborder = 60
string text = "&Supprimer"
string iconname = "ACTIONS_supprimer.png"
end type

event clicked;call super::clicked;double numero

if dw_liste.rowcount() > 0 then
	If MessageBox("ATTENTION","La suppression est définitive ~n~n Voulez vous continuer?",Question!,YesNo!) = 1 Then
		numero = dw_liste.getitemnumber(dw_liste.getrow(),"numero_commande")
		  DELETE FROM "ligne_commande"  
   		WHERE "ligne_commande"."numero_commande" = :numero;
		IF SQLCA.SQLCode = -1 THEN 
			MessageBox("SQL error", SQLCA.SQLErrText)
			rollback;
		else
			  DELETE FROM "commande"  
   			WHERE "commande"."numero_commande" = :numero   ;
			IF SQLCA.SQLCode = -1 THEN 
				MessageBox("SQL error", SQLCA.SQLErrText)
				rollback;
			else
				commit;
				dw_liste.deleterow(dw_liste.getrow())
				if dw_liste.rowcount() > 0 then
					dw_liste.selectrow(dw_liste.getrow(),true)
					//dw_ligne.retrieve(dw_liste.getitemnumber(dw_liste.getrow(),"numero_commande"))
					dw_ligne.retrieve(dw_liste.getitemnumber(dw_liste.getrow(),"numero_commande"),dw_liste.getitemstring(dw_liste.getrow(),"code_fournisseur"))

				end if
			end if
		END IF
	end if
else
	MessageBox("Attention","Vous devez sélectionner une commande")
end if
	
end event

type cb_annuler from uo_picturebutton_390x120 within w_recherche_commande_reception
integer x = 1701
integer y = 2624
integer width = 480
integer taborder = 60
string text = "&Annuler"
string iconname = "ACTIONS_abandonner.png"
end type

event clicked;call super::clicked;fermer_fenetre(parent)
end event

type cb_rechercher from uo_picturebutton_390x120 within w_recherche_commande_reception
integer x = 4581
integer y = 60
integer width = 594
integer height = 152
integer taborder = 50
string text = "&Rechercher"
boolean default = true
string iconname = "ACTIONS_chercher.png"
end type

event clicked;call super::clicked;if recuperer() then
	fermer_fenetre(parent)
end if
end event

type uo_1 from resize_fenetre within w_recherche_commande_reception
boolean visible = false
integer x = 859
integer y = 868
integer taborder = 60
end type

on uo_1.destroy
call resize_fenetre::destroy
end on

type dw_prati from datawindow within w_recherche_commande_reception
string tag = "no resizeall brush"
integer x = 1042
integer y = 316
integer width = 663
integer height = 76
integer taborder = 70
string title = "none"
string dataobject = "dw_affich_prati_petit"
boolean border = false
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event itemchanged;code_praticien_courant = data
if not rb_numero.checked then
	recuperer()
end if
end event

type rb_unprati from radiobutton within w_recherche_commande_reception
integer x = 1001
integer y = 228
integer width = 558
integer height = 64
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 15780518
string text = "pour un praticien"
end type

event clicked;dw_prati.visible = true
dw_prati.reset()
dw_prati.retrieve()
if dw_prati.rowcount() > 0 then
	code_praticien_courant = dw_prati.getitemstring(dw_prati.getrow(),"code")
end if
end event

type rb_tousprati from radiobutton within w_recherche_commande_reception
integer x = 1001
integer y = 124
integer width = 695
integer height = 64
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 15780518
string text = "pour tous les praticiens"
boolean checked = true
end type

event clicked;dw_prati.visible = false
code_praticien_courant = '%'//pour le retrieve

if not rb_numero.checked then
	recuperer()
end if
end event

type st_resultat from statictext within w_recherche_commande_reception
integer x = 4846
integer y = 392
integer width = 279
integer height = 60
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 15780518
string text = "Résultats"
boolean focusrectangle = false
end type

type em_resultat from editmask within w_recherche_commande_reception
integer x = 4626
integer y = 392
integer width = 201
integer height = 60
integer taborder = 40
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
maskdatatype maskdatatype = stringmask!
end type

type cbx_solde from checkbox within w_recherche_commande_reception
integer x = 4658
integer y = 308
integer width = 439
integer height = 64
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 15780518
string text = "avec soldées"
end type

event clicked;if recuperer() then
	fermer_fenetre(parent)
end if
end event

type dw_nom from datawindow within w_recherche_commande_reception
string tag = "no resizeall brush"
integer x = 192
integer y = 312
integer width = 663
integer height = 80
integer taborder = 60
string title = "none"
string dataobject = "dw_fournisseur_affich_ddlb"
boolean border = false
boolean livescroll = true
borderstyle borderstyle = styleraised!
end type

event itemchanged;code_fournisseur_courant = data
if not rb_numero.checked then
	recuperer()
end if
end event

type st_2 from statictext within w_recherche_commande_reception
integer x = 3922
integer y = 232
integer width = 73
integer height = 68
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 15780518
string text = "au"
boolean focusrectangle = false
end type

type st_1 from statictext within w_recherche_commande_reception
long backcolor = 15780518
end type

type em_date_fin from editmask within w_recherche_commande_reception
integer x = 4014
integer y = 224
integer width = 421
integer height = 80
integer taborder = 50
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

type em_date_debut from editmask within w_recherche_commande_reception
integer x = 4014
integer y = 116
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

type em_numero from editmask within w_recherche_commande_reception
integer x = 4046
integer y = 332
integer width = 457
integer height = 80
integer taborder = 40
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 15780518
borderstyle borderstyle = stylelowered!
string mask = "#########"
end type

type rb_numero from radiobutton within w_recherche_commande_reception
integer x = 3333
integer y = 332
integer width = 681
integer height = 80
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 15780518
string text = "Numéro de commande"
end type

event clicked;st_1.visible = false
st_2.visible = false
em_date_debut.visible = false
em_date_fin.visible = false
em_numero.visible = true
em_date_debut.text = string(date(2001,1,1))
em_date_fin.text = string(today())
rb_tous.checked = true
em_numero.setfocus()


end event

type rb_date from radiobutton within w_recherche_commande_reception
integer x = 3333
integer y = 116
integer width = 599
integer height = 80
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 15780518
string text = "Date de commande"
boolean checked = true
end type

event clicked;st_1.visible = true
st_2.visible = true
em_date_debut.visible = true
em_date_fin.visible = true
em_numero.visible = false
em_date_debut.text = string(date(2001,1,1))
em_date_fin.text = string(today())
em_date_debut.setfocus()


end event

type rb_unseul from radiobutton within w_recherche_commande_reception
integer x = 101
integer y = 220
integer width = 727
integer height = 80
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 15780518
string text = "pour un fournisseur"
end type

event clicked;dw_nom.visible = true
dw_nom.reset()
dw_nom.insertrow(0)
code_fournisseur_courant = ""
end event

type rb_tous from radiobutton within w_recherche_commande_reception
integer x = 101
integer y = 116
integer width = 763
integer height = 80
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 15780518
string text = "pour tous les fournisseurs"
boolean checked = true
end type

event clicked;dw_nom.visible = false
code_fournisseur_courant = '%' //pour le retrieve dans recuperer

if not rb_numero.checked then
	recuperer()
end if
end event

type dw_ligne from u_basedw within w_recherche_commande_reception
string tag = "grid brush"
integer x = 443
integer y = 1772
integer width = 4050
integer height = 756
integer taborder = 40
string dataobject = "dw_reception_ligne_commande"
boolean border = false
end type

event rbuttondown;if row > 0 then
	This.SelectRow(0,False)
	This.SelectRow(row,True)
	This.setrow(row)
	OpenMenuProduit_liste_commande(this)
end if
end event

type dw_liste from u_basedw within w_recherche_commande_reception
string tag = "grid brush"
integer x = 443
integer y = 600
integer width = 4128
integer height = 952
integer taborder = 30
string dataobject = "dw_commande_liste"
boolean hscrollbar = false
boolean border = false
end type

event clicked;call super::clicked;double numero_commande_courant
integer compteur_solde
if row > 0 then
	numero_commande_courant = dw_liste.getitemnumber(row,"numero_commande")
	dw_ligne.retrieve(numero_commande_courant,dw_liste.getitemstring(row,"code_fournisseur"))
	SELECT count(*)  
    INTO :compteur_solde  
    FROM "ligne_commande"  
   WHERE "ligne_commande"."numero_commande" = :numero_commande_courant
			AND "ligne_commande"."solde" = 'o';
//	if compteur_solde > 0 then
//		cb_maj.enabled = false
//	else
		cb_maj.enabled = true
		cb_maj.setfocus()
//	end if
//	cb_receptionner.setfocus()
end if
end event

event doubleclicked;call super::doubleclicked;double numero

if row > 0 then
	numero = dw_liste.getitemnumber(dw_liste.getrow(),"numero_commande")
	str_param_string param_passe  
	param_passe.param = string(numero)
	w_mdi_2020.uo_powerdock.of_openDocument(w_reception_commande, param_passe, "Réception de Commande", m_orthokis_2020.m_gestion_de_stock.m_reception_commande.toolbarItemName)
	fermer_fenetre(parent)
end if

end event

type bb_dupliquer from uo_picturebutton_390x120 within w_recherche_commande_reception
integer x = 1161
integer y = 2624
integer width = 480
integer taborder = 70
boolean bringtotop = true
string text = "&Dupliquer"
string iconname = "lc_copy.png"
end type

event clicked;call super::clicked;

if dw_liste.rowcount() > 0 then
		
	double v_ancien_numero, v_nouveau_numero
	
	open(w_commande_Duplication)
	
	v_nouveau_numero = Message.DoubleParm
	// La fenêtre renvoie -1 si annulée ou le numéro de la nouvelle commande
	
	
	v_ancien_numero = dw_liste.getitemnumber(dw_liste.getrow(),"numero_commande")
	
	
	string v_code_fournisseur, v_code_praticien
	
	// insertion de l'entête
	INSERT INTO  "commande" ("numero_commande",  "code_praticien",   
				"date_commande",   "code_fournisseur",   "reference_personnelle",   
				"utilisateur",   "poste_utilisation",   "mode_transport",   
				"delai_livraison_mois" )
	
	SELECT :v_nouveau_numero, "code_praticien",  cast(getdate() as date) , 
				"code_fournisseur",   "reference_personnelle",   "utilisateur",   "poste_utilisation",   
				"mode_transport",   "delai_livraison_mois"  FROM "commande" WHERE 
				"numero_commande" = :v_ancien_numero ;
				
	
		if sqlca.sqlcode <> 0 then
			MessageBox("ERREUR","Problème dans l'ajout de l'entête.~n~n"+SQLCA.sqlerrtext)
			rollback ;
		else
			
			
			// insertion des lignes
	
			INSERT INTO  "ligne_commande" ("numero_commande",  "code_produit", 	"qte_commandee",   
						"qte_livree",   "solde",  "prix",   "code_type_taxe" )
			
			SELECT :v_nouveau_numero, "code_produit",  "qte_commandee" , 
						0,   'N',   "prix",   "code_type_taxe"   FROM "ligne_commande" WHERE 
						"numero_commande" = :v_ancien_numero ;
						
	
			if sqlca.sqlcode <> 0 then
				MessageBox("ERREUR","Problème dans l'ajout des lignes.~n~n"+SQLCA.sqlerrtext)
				rollback ;
			else
				commit ;
				
				
				// L'ajout de la commande a été réussie => on y accède
				
				str_commande struct
				
				SELECT  "code_praticien",  "code_fournisseur"
				INTO :v_code_praticien, :v_code_fournisseur
				 FROM "commande" WHERE "numero_commande" = :v_nouveau_numero ;
				
				struct.numero = v_nouveau_numero
				struct.code_fourn = v_code_fournisseur
				struct.code_praticien = v_code_praticien
				struct.maj = true
				
				
				Messagebox("DUPLICATION REUSSIE","La duplication de la commande a été effectuée.~n~nVous allez y accéder !")
				
				w_mdi_2020.uo_powerdock.of_openDocument(w_saisie_commande, struct, "Mise à jour de Commande", m_orthokis_2020.m_gestion_de_stock.m_saisie_commande.toolbarItemName)
				
				fermer_fenetre(parent)
				
			end if
	
		end if
	end if		
			
		


end event

type rb_tous_produits from radiobutton within w_recherche_commande_reception
integer x = 1929
integer y = 124
integer width = 489
integer height = 76
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 15780518
string text = "tous les produits"
boolean checked = true
end type

event clicked;st_designaton_produit.text = ''
s_code_produit = ""
end event

type rb_un_produit from radiobutton within w_recherche_commande_reception
integer x = 1929
integer y = 228
integer width = 489
integer height = 76
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 15780518
string text = "un produit"
end type

event clicked;
OpenWithParm(w_cherche_produit , "3")

// Doit renvoyer le code du produit trouvé 
s_code_produit =  Message.StringParm

if s_code_produit <> "" then
	select designation into :s_designation_produit from produit where code_interne = :s_code_produit ;
	st_designaton_produit.text = s_designation_produit
else
	rb_tous_produits.checked = true
	this.checked = false
	
	st_designaton_produit.text = ""
end if
end event

type st_designaton_produit from statictext within w_recherche_commande_reception
integer x = 1929
integer y = 356
integer width = 1253
integer height = 60
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 15780518
boolean focusrectangle = false
end type

type gb_1 from groupbox within w_recherche_commande_reception
integer x = 37
integer y = 40
integer width = 864
integer height = 448
integer taborder = 10
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 15780518
string text = "Fournisseurs"
end type

type gb_3 from groupbox within w_recherche_commande_reception
integer x = 3287
integer y = 40
integer width = 1257
integer height = 448
integer taborder = 30
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 15780518
string text = "Recherche par"
end type

type gb_4 from groupbox within w_recherche_commande_reception
integer x = 443
integer y = 1692
integer width = 4183
integer height = 888
integer taborder = 40
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 15780518
string text = "Commande sélectionnée"
end type

type gb_5 from groupbox within w_recherche_commande_reception
integer x = 443
integer y = 528
integer width = 4183
integer height = 1084
integer taborder = 50
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 15780518
string text = "Entête des commandes"
end type

type gb_2 from groupbox within w_recherche_commande_reception
integer x = 933
integer y = 40
integer width = 891
integer height = 448
integer taborder = 20
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 15780518
string text = "Praticiens"
end type

type gb_6 from groupbox within w_recherche_commande_reception
integer x = 4581
integer y = 244
integer width = 594
integer height = 248
integer taborder = 60
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 15780518
end type

type gb_7 from groupbox within w_recherche_commande_reception
integer x = 1870
integer y = 40
integer width = 1371
integer height = 448
integer taborder = 30
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 15780518
string text = "Contenant Produits"
end type

