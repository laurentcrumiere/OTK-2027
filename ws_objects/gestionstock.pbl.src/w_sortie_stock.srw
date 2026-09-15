$PBExportHeader$w_sortie_stock.srw
forward
global type w_sortie_stock from w_fenetre_arakis
end type
type cb_enregistrer from uo_picturebutton_390x120 within w_sortie_stock
end type
type cb_annuler_sortie from uo_picturebutton_390x120 within w_sortie_stock
end type
type cb_rechercher from uo_picturebutton_390x120 within w_sortie_stock
end type
type cb_fermer from uo_picturebutton_390x120_fermer within w_sortie_stock
end type
type dw_prati from datawindow within w_sortie_stock
end type
type rb_un_prati from radiobutton within w_sortie_stock
end type
type rb_tous_prati from radiobutton within w_sortie_stock
end type
type st_resultat from statictext within w_sortie_stock
end type
type em_numero from editmask within w_sortie_stock
end type
type em_code_produit from editmask within w_sortie_stock
end type
type em_code_barre from editmask within w_sortie_stock
end type
type rb_seul from radiobutton within w_sortie_stock
end type
type rb_tous from radiobutton within w_sortie_stock
end type
type rb_numero from radiobutton within w_sortie_stock
end type
type rb_code_produit from radiobutton within w_sortie_stock
end type
type rb_type from radiobutton within w_sortie_stock
end type
type rb_code_barre from radiobutton within w_sortie_stock
end type
type dw_liste from u_basedw within w_sortie_stock
end type
type gb_1 from groupbox within w_sortie_stock
end type
type gb_3 from groupbox within w_sortie_stock
end type
type gb_sortie from groupbox within w_sortie_stock
end type
type dw_sortie from datawindow within w_sortie_stock
end type
type dw_recherche from datawindow within w_sortie_stock
end type
type dw_nom from datawindow within w_sortie_stock
end type
type st_resultat_chiffre from statictext within w_sortie_stock
end type
type uo_1 from resize_fenetre within w_sortie_stock
end type
type rb_identifiant_udi from radiobutton within w_sortie_stock
end type
type sle_identifiant_udi from singlelineedit within w_sortie_stock
end type
type pb_udi from picturebutton within w_sortie_stock
end type
type gb_2 from groupbox within w_sortie_stock
end type
type gb_5 from groupbox within w_sortie_stock
end type
type gb_6 from groupbox within w_sortie_stock
end type
end forward

global type w_sortie_stock from w_fenetre_arakis
integer width = 4247
integer height = 2296
string title = "Sortie de Stock"
windowtype windowtype = response!
cb_enregistrer cb_enregistrer
cb_annuler_sortie cb_annuler_sortie
cb_rechercher cb_rechercher
cb_fermer cb_fermer
dw_prati dw_prati
rb_un_prati rb_un_prati
rb_tous_prati rb_tous_prati
st_resultat st_resultat
em_numero em_numero
em_code_produit em_code_produit
em_code_barre em_code_barre
rb_seul rb_seul
rb_tous rb_tous
rb_numero rb_numero
rb_code_produit rb_code_produit
rb_type rb_type
rb_code_barre rb_code_barre
dw_liste dw_liste
gb_1 gb_1
gb_3 gb_3
gb_sortie gb_sortie
dw_sortie dw_sortie
dw_recherche dw_recherche
dw_nom dw_nom
st_resultat_chiffre st_resultat_chiffre
uo_1 uo_1
rb_identifiant_udi rb_identifiant_udi
sle_identifiant_udi sle_identifiant_udi
pb_udi pb_udi
gb_2 gb_2
gb_5 gb_5
gb_6 gb_6
end type
global w_sortie_stock w_sortie_stock

type variables
datawindowchild idw_type //dw fille de dw_recherche
string sel,clausew,clauseo,clausea,clauseaa, groupby //variable servant au retrieve param de la liste

long  type_sortie

boolean v_suite = true
end variables

forward prototypes
public subroutine reset ()
public subroutine maj_histo_s ()
public subroutine rechercher ()
end prototypes

public subroutine reset ();//reinitialise les differents champs

//champs de la recherche
em_code_barre.text = ""
dw_recherche.reset()
dw_recherche.insertrow(0)
em_code_produit.text = ""
em_numero.text = ""
sle_identifiant_udi.text = ""

//dw liste et sortie
dw_liste.reset()
dw_sortie.reset()
dw_sortie.enabled = false
cb_annuler_sortie.enabled = false
cb_enregistrer.enabled = false

end subroutine

public subroutine maj_histo_s ();//mise à jour de l'historique des es 
//idem maj_histo de reception commande

string code_utilisateur,libelle,code_lieu_utilisation,type_taxe,poste_utilisation
int quantite
double code_barre,prix
date date_sortie
time heure

dw_sortie.accepttext()

code_barre = dw_sortie.getitemnumber(dw_sortie.getrow(),"stock_produit_code_barre")
quantite = dw_sortie.getitemnumber(dw_sortie.getrow(),"historique_es_quantite")
type_taxe = dw_sortie.getitemstring(dw_sortie.getrow(),"historique_es_code_type_taxe")
code_lieu_utilisation = dw_sortie.getitemstring(dw_sortie.getrow(),"historique_es_code_lieu_utilisation")
date_sortie = dw_sortie.getitemdate(dw_sortie.Getrow(),"historique_es_date")
prix = dw_sortie.getitemnumber(dw_sortie.getrow(),"historique_es_prix")
code_utilisateur = dw_sortie.getitemstring(dw_sortie.getrow(),"historique_es_utilisateur")
libelle = dw_sortie.getitemstring(dw_sortie.getrow(),"historique_es_libelle")
poste_utilisation = dw_sortie.getitemstring(dw_sortie.getrow(),"historique_es_poste_utilisation")
heure = dw_sortie.getitemtime(dw_sortie.getrow(),"historique_es_heure")

insert into "historique_es"
	("code_barre","code_es","date","quantite","prix","utilisateur","libelle","code_type_taxe","code_lieu_utilisation","poste_utilisation","heure")
	values (:code_barre,'s',:date_sortie,:quantite,:prix,:code_utilisateur,:libelle,:type_taxe,:code_lieu_utilisation,:poste_utilisation,:heure);

if SQLCA.SQLcode = -1 Then
// Problème dans le INSERT
	Messagebox("Erreur SQL",SQLCA.SQLErrText)
else
	commit;
	//verification qu'on est pas passé en dessous de la qte stock min
	
end if
end subroutine

public subroutine rechercher ();//lance la recherche des produits à sortir du stock en fonction des critères de recherche sélectionné

string rapport
integer nb_row

v_suite = true

rapport = dw_liste.modify('datawindow.table.select ="' + sel + clausew + clausea + clauseaa + groupby + clauseo +'"')
if rapport = "" then
	//pas de pb dans la modif du select
	nb_row =dw_liste.retrieve()
	if nb_row > 0 then
		st_resultat_chiffre.text = string(nb_row)
		st_resultat.text = "Résultats"
	else
		st_resultat_chiffre.text = "Aucun"
		st_resultat.text = "Résultat"
		if  type_sortie = 2 then
			// pas trouvé en traçabilité
			Messagebox("ATTENTION","Ce code barre correspond à un produit déjà sorti du stock.")
			v_suite = false
		end if
	end if
	if dw_liste.rowcount() = 1 and v_suite then
		st_resultat.text = "Résultat"
		st_resultat_chiffre.text = ""
		dw_liste.selectrow(1,true)
		dw_sortie.reset()
		dw_sortie.enabled = true
		cb_annuler_sortie.enabled ( true)
		cb_enregistrer.enabled ( true)
		dw_sortie.retrieve(dw_liste.getitemnumber(dw_liste.getrow(),"stock_produit_code_barre"))
		dw_sortie.setitem(dw_sortie.getrow(),"historique_es_utilisateur",utilisateur_code)
		dw_sortie.setitem(dw_sortie.getrow(),"historique_es_poste_utilisation",utilisateur_code)
		dw_sortie.setitem(dw_sortie.getrow(),"historique_es_heure",now())
		dw_sortie.setitem(dw_sortie.getrow(),"historique_es_libelle","")
		dw_sortie.setitem(dw_sortie.getrow(),"historique_es_date",today())
		dw_sortie.setitem(dw_sortie.getrow(),"historique_es_quantite",1)
		if type_sortie = 1 then
			dw_sortie.setitem(dw_sortie.getrow(),"historique_es_libelle","Sortie manuelle")
		else
			dw_sortie.setitem(dw_sortie.getrow(),"historique_es_libelle","Sortie traçabilité")
		end if
		dw_sortie.setfocus()
		dw_sortie.selecttext(1,6)
	else
		dw_sortie.reset()
	end if
else
	//pb ds le chagt de select
	messagebox("Attention","Problème dans le changement de select")
end if
end subroutine

on w_sortie_stock.create
int iCurrent
call super::create
this.cb_enregistrer=create cb_enregistrer
this.cb_annuler_sortie=create cb_annuler_sortie
this.cb_rechercher=create cb_rechercher
this.cb_fermer=create cb_fermer
this.dw_prati=create dw_prati
this.rb_un_prati=create rb_un_prati
this.rb_tous_prati=create rb_tous_prati
this.st_resultat=create st_resultat
this.em_numero=create em_numero
this.em_code_produit=create em_code_produit
this.em_code_barre=create em_code_barre
this.rb_seul=create rb_seul
this.rb_tous=create rb_tous
this.rb_numero=create rb_numero
this.rb_code_produit=create rb_code_produit
this.rb_type=create rb_type
this.rb_code_barre=create rb_code_barre
this.dw_liste=create dw_liste
this.gb_1=create gb_1
this.gb_3=create gb_3
this.gb_sortie=create gb_sortie
this.dw_sortie=create dw_sortie
this.dw_recherche=create dw_recherche
this.dw_nom=create dw_nom
this.st_resultat_chiffre=create st_resultat_chiffre
this.uo_1=create uo_1
this.rb_identifiant_udi=create rb_identifiant_udi
this.sle_identifiant_udi=create sle_identifiant_udi
this.pb_udi=create pb_udi
this.gb_2=create gb_2
this.gb_5=create gb_5
this.gb_6=create gb_6
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_enregistrer
this.Control[iCurrent+2]=this.cb_annuler_sortie
this.Control[iCurrent+3]=this.cb_rechercher
this.Control[iCurrent+4]=this.cb_fermer
this.Control[iCurrent+5]=this.dw_prati
this.Control[iCurrent+6]=this.rb_un_prati
this.Control[iCurrent+7]=this.rb_tous_prati
this.Control[iCurrent+8]=this.st_resultat
this.Control[iCurrent+9]=this.em_numero
this.Control[iCurrent+10]=this.em_code_produit
this.Control[iCurrent+11]=this.em_code_barre
this.Control[iCurrent+12]=this.rb_seul
this.Control[iCurrent+13]=this.rb_tous
this.Control[iCurrent+14]=this.rb_numero
this.Control[iCurrent+15]=this.rb_code_produit
this.Control[iCurrent+16]=this.rb_type
this.Control[iCurrent+17]=this.rb_code_barre
this.Control[iCurrent+18]=this.dw_liste
this.Control[iCurrent+19]=this.gb_1
this.Control[iCurrent+20]=this.gb_3
this.Control[iCurrent+21]=this.gb_sortie
this.Control[iCurrent+22]=this.dw_sortie
this.Control[iCurrent+23]=this.dw_recherche
this.Control[iCurrent+24]=this.dw_nom
this.Control[iCurrent+25]=this.st_resultat_chiffre
this.Control[iCurrent+26]=this.uo_1
this.Control[iCurrent+27]=this.rb_identifiant_udi
this.Control[iCurrent+28]=this.sle_identifiant_udi
this.Control[iCurrent+29]=this.pb_udi
this.Control[iCurrent+30]=this.gb_2
this.Control[iCurrent+31]=this.gb_5
this.Control[iCurrent+32]=this.gb_6
end on

on w_sortie_stock.destroy
call super::destroy
destroy(this.cb_enregistrer)
destroy(this.cb_annuler_sortie)
destroy(this.cb_rechercher)
destroy(this.cb_fermer)
destroy(this.dw_prati)
destroy(this.rb_un_prati)
destroy(this.rb_tous_prati)
destroy(this.st_resultat)
destroy(this.em_numero)
destroy(this.em_code_produit)
destroy(this.em_code_barre)
destroy(this.rb_seul)
destroy(this.rb_tous)
destroy(this.rb_numero)
destroy(this.rb_code_produit)
destroy(this.rb_type)
destroy(this.rb_code_barre)
destroy(this.dw_liste)
destroy(this.gb_1)
destroy(this.gb_3)
destroy(this.gb_sortie)
destroy(this.dw_sortie)
destroy(this.dw_recherche)
destroy(this.dw_nom)
destroy(this.st_resultat_chiffre)
destroy(this.uo_1)
destroy(this.rb_identifiant_udi)
destroy(this.sle_identifiant_udi)
destroy(this.pb_udi)
destroy(this.gb_2)
destroy(this.gb_5)
destroy(this.gb_6)
end on

event open;call super::open;////////////////////////////////////////////
//       Sortie de stock manuelle         //
////////////////////////////////////////////

// Paramètre passé
// 1. Sortie manuelle classiqu
// 2. Sortie faite par traçabilié => fenêtre réduite

type_sortie = message.DoubleParm

if type_sortie = 2 then
	
	uo_1.tous_invisibles(this)
	
	// On ne remet que besoin
	gb_sortie.visible = true
	dw_sortie.visible = true
	cb_annuler_sortie.visible = true
	cb_enregistrer.visible = true
	//cb_fermer.visible = true
	
	gb_sortie.y = 56
	dw_sortie.y = 120
	cb_annuler_sortie.y = 236
	cb_enregistrer.y = 392
	//cb_fermer.y = 512
	this.height = 900
	
end if



colore_tous_objets_window(this, couleur_fond_fenetre)

dw_recherche.settransobject(sqlca) //dw du recherche du type de produit
dw_nom.settransobject(sqlca) //nom du fournisseur
dw_sortie.settransobject(sqlca) //fiche de sortie du produit
dw_liste.settransobject(sqlca) //liste des résultats de la recherche
dw_prati.settransobject(sqlca) //nom du praticien

//evite le retrieve automatique de la dw fille de dw_recherche
dw_recherche.getchild("produit_code_type_produit",idw_type)
idw_type.settransobject(sqlca)
idw_type.insertrow(0)

//retrieve parametre de la liste
sel = dw_liste.describe("datawindow.table.select")
clausew = ""
clauseo = " ORDER by stock_produit.code_produit"
groupby = " GROUP BY produit.code_type_produit,stock_produit.code_barre,stock_produit.code_produit,stock_produit.code_fournisseur,stock_produit.code_praticien,stock_produit.numero_lot,stock_produit.quantite,stock_produit.quantite_colisee, produit.designation  "   
clausea = ""

dw_recherche.insertrow(0)
dw_nom.insertrow(0)
dw_prati.insertrow(0)

em_code_barre.visible = true
dw_recherche.visible = false
em_code_produit.visible = false
em_numero.visible = false
rb_tous.enabled = false
rb_seul.enabled = false
rb_tous_prati.enabled = false
rb_un_prati.enabled = false
dw_nom.visible = false
dw_prati.visible = false

centrer(this)
em_code_barre.setfocus()

if type_sortie = 2 then
	em_code_barre.text = param_win[1]
	clausew = " AND stock_produit.code_barre ="+em_code_barre.text
	cb_rechercher.triggerevent(clicked!)
	if v_suite then
		em_code_barre.visible = false
	else
		closeWithReturn(this, -1)
	end if
end if



end event

type p_fond from w_fenetre_arakis`p_fond within w_sortie_stock
integer x = 841
integer y = 884
end type

type cb_enregistrer from uo_picturebutton_390x120 within w_sortie_stock
integer x = 2203
integer y = 1828
integer width = 507
integer taborder = 140
string text = "&Enregistrer"
string iconname = "ACTIONS_enregistrer.png"
end type

event clicked;call super::clicked;integer quantite_prec,quantite,quantite_stock_min, quantite_saisie
double code_barre
string code_praticien,code_produit

dw_sortie.accepttext()

if dw_sortie.rowcount() > 0 then
	code_barre = dw_sortie.getitemnumber(dw_sortie.Getrow(),"stock_produit_code_barre")
	quantite = dw_sortie.getitemnumber(dw_sortie.Getrow(),"historique_es_quantite")
	code_praticien = dw_sortie.getitemstring(dw_sortie.Getrow(),"stock_produit_code_praticien")
	code_produit = dw_sortie.getitemstring(dw_sortie.Getrow(),"stock_produit_code_produit")
	quantite_saisie = quantite
	
	if Isnull(quantite) then
		messagebox("Attention","Vous devez saisir une quantité.")
	else

		if quantite < 0 then
			messagebox("Attention","Vous devez saisir une quantité positive.")
		else
			
			select "quantite_colisee"
				into :quantite_prec
				from "stock_produit"
				where code_barre = :code_barre;
				
		  SELECT "param_stock_produit"."qte_stock_min"  
			 INTO :quantite_stock_min  
			 FROM "param_stock_produit",   
					"stock_produit"  
			WHERE ( "param_stock_produit"."code_produit" = "stock_produit"."code_produit" ) and  
					( ( "stock_produit"."code_barre" = :code_barre ) AND
					( "param_stock_produit"."code_praticien" = :code_praticien ) and
					( "param_stock_produit"."code_praticien" = "stock_produit"."code_praticien" ) )   ;
					
			if isnull(quantite_stock_min) then
				quantite_stock_min = 1
			end if
			if isnull(quantite_prec) then
				quantite_prec = 0
			end if
			quantite = quantite_prec - quantite
			if quantite < 0 then
				MessageBox("Attention","La quantité à sortir du stock est supérieure à celle en stock.~n~nLa mise à jour du stock n'a pas eu lieu.")
				if type_sortie = 2 then
					closeWithReturn(parent, -1)
				end if
			else
				update "stock_produit" set "quantite_colisee" = :quantite
					where code_barre = :code_barre;
				
				if sqlca.sqlcode <> 0 then
					rollback;
					MessageBox("Erreur SQL","La mise à jour du stock n'a pas eu lieu.")
					if type_sortie = 2 then
						closeWithReturn(parent, -1)
					end if
				else
					commit;
					
					// 05/2011 :  on ajoute "stock_produit"."quantite_colisee" > 0 pour éviter les erreur avec des quantité colisée négatives
					//on récupère la quantite en stock du produit			
				  SELECT sum("stock_produit"."quantite_colisee")  
					 INTO :quantite  
					 FROM "stock_produit"  
					WHERE ( "stock_produit"."code_produit" = :code_produit ) AND  
							( "stock_produit"."code_praticien" = :code_praticien )  and "stock_produit"."quantite_colisee" > 0  ;
				
					if quantite < quantite_stock_min then
						MessageBox("Attention","La quantité en stock de ce produit est en dessous du seuil que vous avez fixé.~n~nPensez à recommander ce produit.")
					end if
					maj_histo_s()
					dw_sortie.enabled = false
					cb_annuler_sortie.enabled ( false)
					cb_enregistrer.enabled ( false )
					dw_liste.retrieve()
					cb_rechercher.default ( true)
					em_code_barre.text = ""
					if rb_code_barre.checked then
						em_code_barre.setfocus()
					end if
					
				// La sortie est OK ... on retourne la quantité
				if type_sortie = 2 then 
					closeWithReturn(parent, quantite_saisie)
				end if
	
				end if
			end if
		end if
	end if
end if
end event

type cb_annuler_sortie from uo_picturebutton_390x120 within w_sortie_stock
integer x = 2203
integer y = 1664
integer width = 507
integer height = 152
integer taborder = 150
string text = "&Annuler"
string iconname = "ACTIONS_annuler.png"
end type

event clicked;call super::clicked;dw_sortie.reset()


if type_sortie = 2 then
	closeWithReturn(parent, -1)
end if
end event

type cb_rechercher from uo_picturebutton_390x120 within w_sortie_stock
integer x = 3406
integer y = 352
integer width = 539
integer height = 152
integer taborder = 180
string text = "&Rechercher"
boolean default = true
string iconname = "ACTIONS_chercher.png"
end type

event clicked;call super::clicked;rechercher()
end event

type cb_fermer from uo_picturebutton_390x120_fermer within w_sortie_stock
integer x = 3383
integer y = 1732
integer width = 471
integer height = 152
integer taborder = 110
end type

type dw_prati from datawindow within w_sortie_stock
string tag = "no resizeall brush"
integer x = 2418
integer y = 476
integer width = 663
integer height = 72
integer taborder = 120
boolean bringtotop = true
string title = "none"
string dataobject = "dw_affich_prati_petit"
boolean border = false
boolean livescroll = true
borderstyle borderstyle = styleraised!
end type

event itemchanged;if not rb_code_barre.checked then
	clauseaa = " AND stock_produit.code_praticien ='"+data+"'"
end if
end event

type rb_un_prati from radiobutton within w_sortie_stock
integer x = 1755
integer y = 480
integer width = 581
integer height = 80
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 16777215
string text = "un praticien"
end type

event clicked;dw_prati.visible = true
end event

type rb_tous_prati from radiobutton within w_sortie_stock
integer x = 1755
integer y = 400
integer width = 631
integer height = 80
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 16777215
string text = "tous les praticiens"
boolean checked = true
end type

event clicked;dw_prati.visible = false
clauseaa = ""
end event

type st_resultat from statictext within w_sortie_stock
integer x = 3653
integer y = 152
integer width = 261
integer height = 60
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 553648127
string text = "Résultats"
boolean focusrectangle = false
end type

type em_numero from editmask within w_sortie_stock
integer x = 690
integer y = 608
integer width = 599
integer height = 88
integer taborder = 30
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = stringmask!
string mask = "xxxxxxxxxxxxxxx"
end type

event modified;if isnull(em_numero.text) or em_numero.text = "" then
	clausew = ""
else
	clausew = " AND stock_produit.numero_lot = '" + trim(em_numero.text) + "'"
end if

end event

type em_code_produit from editmask within w_sortie_stock
integer x = 690
integer y = 488
integer width = 599
integer height = 88
integer taborder = 40
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

event losefocus;if isnull(em_code_produit.text) or em_code_produit.text = "" then
	clausew = ""
else
	clausew = " AND stock_produit.code_produit like '"+em_code_produit.text+"%'"
end if

end event

type em_code_barre from editmask within w_sortie_stock
integer x = 690
integer y = 140
integer width = 599
integer height = 88
integer taborder = 10
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
string mask = "#######"
end type

event losefocus;if isnull(em_code_barre.text) or em_code_barre.text = "" then
	clausew = ""
else
	clausew = " AND stock_produit.code_barre ="+em_code_barre.text
end if
end event

type rb_seul from radiobutton within w_sortie_stock
integer x = 1760
integer y = 192
integer width = 581
integer height = 80
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 16777215
string text = "un fournisseur"
end type

event clicked;dw_nom.visible = true
dw_nom.reset()
dw_nom.insertrow(0)
end event

type rb_tous from radiobutton within w_sortie_stock
integer x = 1760
integer y = 112
integer width = 631
integer height = 80
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 16777215
string text = "tous les fournisseurs"
boolean checked = true
end type

event clicked;dw_nom.visible = false
clausea = ""
end event

type rb_numero from radiobutton within w_sortie_stock
integer x = 178
integer y = 612
integer width = 402
integer height = 80
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 16777215
string text = "Numéro Lot"
end type

event clicked;sle_identifiant_udi.visible = false
em_code_barre.visible = false
dw_recherche.visible = false
em_code_produit.visible = false
em_numero.visible = true
rb_tous.enabled = true
rb_seul.enabled = true
rb_tous_prati.enabled = true
rb_un_prati.enabled = true
if rb_seul.checked then
	dw_nom.visible = true
end if
reset()

if isnull(em_numero.text) or em_numero.text = "" then
	clausew = ""
else
	clausew = " AND stock_produit.numero_lot ="+em_numero.text
end if

end event

type rb_code_produit from radiobutton within w_sortie_stock
integer x = 178
integer y = 492
integer width = 425
integer height = 80
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 16777215
string text = "Code Produit"
end type

event clicked;sle_identifiant_udi.visible = false
em_code_barre.visible = false
dw_recherche.visible = false
em_code_produit.visible = true
em_numero.visible = false
rb_tous.enabled = true
rb_seul.enabled = true
rb_tous_prati.enabled = true
rb_un_prati.enabled = true
if rb_seul.checked then
	dw_nom.visible = true
end if
reset()
if isnull(em_code_produit.text) or em_code_produit.text = "" then
	clausew = ""
else
	clausew = " AND stock_produit.code_produit like '"+em_code_produit.text+"%'"
end if

end event

type rb_type from radiobutton within w_sortie_stock
integer x = 178
integer y = 272
integer width = 416
integer height = 80
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 16777215
string text = "Type Produit"
end type

event clicked;sle_identifiant_udi.visible = false
em_code_barre.visible = false
dw_recherche.visible = true
em_code_produit.visible = false
em_numero.visible = false
rb_tous.enabled = true
rb_seul.enabled = true
rb_tous_prati.enabled = true
rb_un_prati.enabled = true
if rb_seul.checked then
	dw_nom.visible = true
end if
reset()

end event

type rb_code_barre from radiobutton within w_sortie_stock
integer x = 178
integer y = 140
integer width = 402
integer height = 80
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 16777215
string text = "Code Barre"
boolean checked = true
end type

event clicked;sle_identifiant_udi.visible = false
em_code_barre.visible = true
dw_recherche.visible = false
em_code_produit.visible = false
em_numero.visible = false
rb_tous.enabled = false
rb_seul.enabled = false
rb_tous_prati.enabled = false
rb_un_prati.enabled = false
dw_nom.visible = false
reset()
if isnull(em_code_barre.text) or em_code_barre.text = "" then
	clausew = ""
else
	clausew = " AND stock_produit.code_barre ="+em_code_barre.text
end if
end event

type dw_liste from u_basedw within w_sortie_stock
string tag = "brush"
integer x = 114
integer y = 1008
integer width = 4041
integer height = 428
integer taborder = 50
string dataobject = "dw_sortie_stock_liste"
boolean hscrollbar = false
boolean border = false
end type

event clicked;call super::clicked;if row > 0 then
	dw_sortie.reset()
	dw_sortie.enabled = true
	cb_annuler_sortie.enabled ( true)
	cb_enregistrer.enabled ( true)
	dw_sortie.retrieve(dw_liste.getitemnumber(row,"stock_produit_code_barre"))
	dw_sortie.setitem(dw_sortie.getrow(),"historique_es_utilisateur",utilisateur_code)
	dw_sortie.setitem(dw_sortie.getrow(),"historique_es_poste_utilisation",utilisateur_code)
	dw_sortie.setitem(dw_sortie.getrow(),"historique_es_heure",now())
	dw_sortie.setitem(dw_sortie.getrow(),"historique_es_libelle","")
	dw_sortie.setitem(dw_sortie.getrow(),"historique_es_date",today())
	dw_sortie.setitem(dw_sortie.getrow(),"historique_es_quantite",1)
	dw_sortie.setitem(dw_sortie.getrow(),"historique_es_libelle","Sortie manuelle")
	dw_sortie.setfocus()
	dw_sortie.selecttext(1,6)
end if
end event

type gb_1 from groupbox within w_sortie_stock
integer x = 91
integer y = 44
integer width = 1554
integer height = 824
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 16777215
string text = "Recherche Produit en stock par"
end type

type gb_3 from groupbox within w_sortie_stock
integer x = 91
integer y = 920
integer width = 4091
integer height = 544
integer taborder = 70
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 16777215
string text = "Résultats Recherche"
end type

type gb_sortie from groupbox within w_sortie_stock
integer x = 96
integer y = 1492
integer width = 2647
integer height = 620
integer taborder = 160
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 16777215
string text = "Sortie de stock"
end type

type dw_sortie from datawindow within w_sortie_stock
string tag = "brush"
integer x = 128
integer y = 1556
integer width = 2011
integer height = 548
integer taborder = 130
boolean bringtotop = true
string title = "none"
string dataobject = "dw_historique_sortie"
boolean border = false
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event itemchanged;//if dwo.name = "historique_es_libelle" then
//	messagebox("att",data)
//end if
end event

type dw_recherche from datawindow within w_sortie_stock
string tag = "no resizeall brush"
integer x = 690
integer y = 268
integer width = 905
integer height = 152
integer taborder = 60
boolean bringtotop = true
string dataobject = "dw_recherche_produit"
boolean border = false
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event itemchanged;if dwo.name = 'type_produit_code_categorie_produit' then
	idw_type.retrieve(data)
	dw_recherche.setitem(dw_recherche.getrow(),"produit_code_type_produit","")
end if
if dwo.name = 'produit_code_type_produit' then
	clausew = " AND produit.code_type_produit = '"+data+"'"
	rechercher()
end if
end event

type dw_nom from datawindow within w_sortie_stock
string tag = "no resizeall brush"
integer x = 2423
integer y = 188
integer width = 658
integer height = 72
integer taborder = 80
boolean bringtotop = true
string title = "none"
string dataobject = "dw_fournisseur_affich_ddlb"
boolean border = false
boolean livescroll = true
borderstyle borderstyle = styleraised!
end type

event itemchanged;if not rb_code_barre.checked then
	clausea = " AND stock_produit.code_fournisseur ='"+data+"'"
end if
end event

type st_resultat_chiffre from statictext within w_sortie_stock
integer x = 3383
integer y = 152
integer width = 238
integer height = 68
boolean bringtotop = true
integer textsize = -10
fontcharset fontcharset = ansi!
string facename = "Arial"
long backcolor = 553648127
end type

type uo_1 from resize_fenetre within w_sortie_stock
boolean visible = false
integer x = 338
integer y = 1968
integer taborder = 170
boolean bringtotop = true
end type

on uo_1.destroy
call resize_fenetre::destroy
end on

type rb_identifiant_udi from radiobutton within w_sortie_stock
integer x = 178
integer y = 732
integer width = 421
integer height = 80
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 16777215
string text = "Identifiant UDI"
end type

event clicked;em_code_barre.visible = false
dw_recherche.visible = false
em_code_produit.visible = false
em_numero.visible = false
rb_tous.enabled = true
rb_seul.enabled = true
rb_tous_prati.enabled = true
rb_un_prati.enabled = true
if rb_seul.checked then
	dw_nom.visible = true
end if
reset()

sle_identifiant_udi.visible = true
sle_identifiant_udi.setfocus()

open(w_udi_lecture)

str_udi v_udi
v_udi = message.PowerObjectParm

if not isnull(v_udi.di) then
	
	sle_identifiant_udi.text = v_udi.di
	
	string v_code_produit
	// est ce que cet identifiant correspont à un produit en stock ?
	select top 1 isnull(code_interne,'') into :v_code_produit 
	from produit
	where gtin = :v_udi.di ;

	if v_code_produit = '' then 
		Messagebox("ATTENTION","Aucun produit n'existe dans votre base de données pour ce code UDI !")
	else
		
		em_code_produit.text = v_code_produit
		em_code_produit.visible = true
		clausew = " AND stock_produit.code_produit like '"+em_code_produit.text+"%'"

		if not isnull(v_udi.numero_lot) then
			em_numero.text = v_udi.numero_lot
			em_numero.visible = true
			clausew = clausew + " AND stock_produit.numero_lot ='"+em_numero.text +"'"
		end if
		
		cb_rechercher.triggerevent(clicked!)
	end if
	
	
end if


end event

type sle_identifiant_udi from singlelineedit within w_sortie_stock
integer x = 690
integer y = 728
integer width = 599
integer height = 88
integer taborder = 90
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
integer limit = 14
borderstyle borderstyle = stylelowered!
end type

type pb_udi from picturebutton within w_sortie_stock
integer x = 1381
integer y = 600
integer width = 155
integer height = 136
integer taborder = 190
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "lc_gs1.png"
alignment htextalign = left!
string powertiptext = "Scan du code barre pour saisir l~'identifiant UDI, le code du produit et le numéro de lot"
end type

event clicked;
rb_identifiant_udi.checked = true




rb_identifiant_udi.triggerevent(clicked!)

end event

type gb_2 from groupbox within w_sortie_stock
integer x = 1701
integer y = 44
integer width = 1467
integer height = 268
integer taborder = 20
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 16777215
string text = "Pour"
end type

type gb_5 from groupbox within w_sortie_stock
integer x = 1705
integer y = 332
integer width = 1463
integer height = 284
integer taborder = 100
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 16777215
string text = "Pour"
end type

type gb_6 from groupbox within w_sortie_stock
integer x = 3342
integer y = 100
integer width = 585
integer height = 144
integer taborder = 200
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 16777215
end type

