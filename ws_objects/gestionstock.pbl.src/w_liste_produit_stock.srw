$PBExportHeader$w_liste_produit_stock.srw
forward
global type w_liste_produit_stock from w_liste_produit
end type
type rb_tous_fournisseurs from radiobutton within w_liste_produit_stock
end type
type rb_un_fournisseur from radiobutton within w_liste_produit_stock
end type
type dw_fourni from datawindow within w_liste_produit_stock
end type
type rb_tous_lieu from radiobutton within w_liste_produit_stock
end type
type rb_un_lieu from radiobutton within w_liste_produit_stock
end type
type dw_lieu from datawindow within w_liste_produit_stock
end type
type cbx_detail from checkbox within w_liste_produit_stock
end type
type dw_2 from datawindow within w_liste_produit_stock
end type
type gb_4 from groupbox within w_liste_produit_stock
end type
type gb_5 from groupbox within w_liste_produit_stock
end type
end forward

global type w_liste_produit_stock from w_liste_produit
string title = "Liste de tous les stocks"
rb_tous_fournisseurs rb_tous_fournisseurs
rb_un_fournisseur rb_un_fournisseur
dw_fourni dw_fourni
rb_tous_lieu rb_tous_lieu
rb_un_lieu rb_un_lieu
dw_lieu dw_lieu
cbx_detail cbx_detail
dw_2 dw_2
gb_4 gb_4
gb_5 gb_5
end type
global w_liste_produit_stock w_liste_produit_stock

forward prototypes
public subroutine prepa ()
end prototypes

public subroutine prepa ();string pra_min,pra_max, code_produit_courant,code_praticien_courant
integer type_gestion_min, type_gestion_max,quantite
double nb_ligne,i
string fou_min, fou_max,v_nom_fournisseur
string lieu_min, lieu_max, v_nom_lieu
string fournisseur_principal, v_fournisseur
		
if not prepa_faite then
	//prepa_faite = true
	if rb_tous.checked then
		pra_min="      "
		pra_max="ZZZZZZ"
	else
		pra_min=dw_prati.getitemstring(dw_prati.getrow(),"code")
		pra_max=dw_prati.getitemstring(dw_prati.getrow(),"code")
	end if

	if rb_tous_gestion.checked then
		type_gestion_min = 1
		type_gestion_max = 2
	else
		type_gestion_min = dw_gestion.getitemnumber(dw_gestion.getrow(),"type_gestion")
		type_gestion_max = type_gestion_min
	end if
	
	if rb_tous_fournisseurs.checked then
		fou_min=""
		fou_max="ZZZZZZ"
		dw_liste.object.titre.text = "Pour tous les fournisseurs"
	else
		fou_min=dw_fourni.getitemstring(dw_fourni.getrow(),"code")
		fou_max=fou_min
		
		select fournisseur.nom into :v_nom_fournisseur from fournisseur where code = :fou_min ;
		dw_liste.object.titre.text = "Pour le fournisseur : "+v_nom_fournisseur
		// pour être sûr
		cbx_detail.checked = false
	end if

	
	if rb_tous_lieu.checked then
		lieu_min=""
		lieu_max="ZZZZZZ"
		dw_liste.object.titre.text = dw_liste.object.titre.text + " - Pour tous les lieux"
	else
		lieu_min=dw_lieu.getitemstring(dw_lieu.getrow(),"code")
		lieu_max=lieu_min
		
		select lieu.lieu into :v_nom_lieu from lieu where code = :lieu_min ;
		dw_liste.object.titre.text = dw_liste.object.titre.text + " - Pour le lieu : "+v_nom_lieu
	end if

	
	if cbx_detail.checked then
		dw_liste.dataobject = "dw_impr_liste_produit_stock_detail"
	else
		dw_liste.dataobject = "dw_impr_liste_produit_stock"
	end if
	
	dw_liste.settransobject(sqlca)
	
	open(w_patience)
	nb_ligne = dw_liste.retrieve(type_gestion_min,type_gestion_max,pra_min,pra_max,code_type_produit,code_categorie_produit, lieu_min, lieu_max)
	
	// Calcul des quantités en stock
	FOR i = nb_ligne  to 1 step -1
		code_produit_courant = dw_liste.getitemstring(i,"param_stock_fournisseur_code_produit")
		code_praticien_courant = dw_liste.getitemstring(i,"param_stock_fournisseur_code_praticien")
		// On elimine les founisseurs si besoin

		select top 1 isnull(code_fournisseur,'')  into :fournisseur_principal from reference_produit where code_produit = :code_produit_courant and fournisseur_par_defaut = 'O' ; 
		
		if rb_un_fournisseur.checked and fournisseur_principal <> fou_min and not cbx_detail.checked then
			
			dw_liste.deleterow(i)

		else
		
			// 05/2011 :  on ajoute "stock_produit"."quantite_colisee" > 0 pour éviter les erreur avec des quantité colisée négatives
			
			// Il peut y avoir les lieux de stockage a NULL
			
			if cbx_detail.checked then

				v_fournisseur = dw_liste.getitemstring(i,"stock_produit_code_fournisseur")


				if lieu_min = lieu_max then
					
				  SELECT SUM("stock_produit"."quantite_colisee")  
					 INTO :quantite  
					 FROM "stock_produit"  
					WHERE "stock_produit"."code_produit" = :code_produit_courant AND "stock_produit"."code_praticien" = :code_praticien_courant  
					and "stock_produit"."quantite_colisee" > 0 and code_lieu_stockage = :lieu_min  and  "stock_produit"."code_fournisseur" = :v_fournisseur ;
					
				else
					
					// pour tous les lieux .. ne teste pas ...
				  SELECT SUM("stock_produit"."quantite_colisee")  
					 INTO :quantite  
					 FROM "stock_produit"  
					WHERE "stock_produit"."code_produit" = :code_produit_courant AND "stock_produit"."code_praticien" = :code_praticien_courant  
					and "stock_produit"."quantite_colisee" > 0   and  "stock_produit"."code_fournisseur" = :v_fournisseur ;
					
				end if
				
				dw_liste.setitem(i,"stock_produit_code_produit_quantite",string(quantite))
			else		
			
				if lieu_min = lieu_max then
					
				  SELECT SUM("stock_produit"."quantite_colisee")  
					 INTO :quantite  
					 FROM "stock_produit"  
					WHERE "stock_produit"."code_produit" = :code_produit_courant AND "stock_produit"."code_praticien" = :code_praticien_courant  
					and "stock_produit"."quantite_colisee" > 0 and code_lieu_stockage = :lieu_min  ;
					
				else
					
					// pour tous les lieux .. ne teste pas ...
				  SELECT SUM("stock_produit"."quantite_colisee")  
					 INTO :quantite  
					 FROM "stock_produit"  
					WHERE "stock_produit"."code_produit" = :code_produit_courant AND "stock_produit"."code_praticien" = :code_praticien_courant  
					and "stock_produit"."quantite_colisee" > 0  ;
					
				end if
				
				dw_liste.setitem(i,"stock_produit_code_produit_quantite",string(quantite))
			end if
		end if

	NEXT
	
	// actualisation de la liste
	dw_liste.groupcalc()

	close(w_patience)

	em_nb.text = string(dw_liste.rowcount())+" Produits"
	em_nb.visible = true
end if
end subroutine

on w_liste_produit_stock.destroy
call super::destroy
destroy(this.rb_tous_fournisseurs)
destroy(this.rb_un_fournisseur)
destroy(this.dw_fourni)
destroy(this.rb_tous_lieu)
destroy(this.rb_un_lieu)
destroy(this.dw_lieu)
destroy(this.cbx_detail)
destroy(this.dw_2)
destroy(this.gb_4)
destroy(this.gb_5)
end on

on w_liste_produit_stock.create
int iCurrent
call super::create
this.rb_tous_fournisseurs=create rb_tous_fournisseurs
this.rb_un_fournisseur=create rb_un_fournisseur
this.dw_fourni=create dw_fourni
this.rb_tous_lieu=create rb_tous_lieu
this.rb_un_lieu=create rb_un_lieu
this.dw_lieu=create dw_lieu
this.cbx_detail=create cbx_detail
this.dw_2=create dw_2
this.gb_4=create gb_4
this.gb_5=create gb_5
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.rb_tous_fournisseurs
this.Control[iCurrent+2]=this.rb_un_fournisseur
this.Control[iCurrent+3]=this.dw_fourni
this.Control[iCurrent+4]=this.rb_tous_lieu
this.Control[iCurrent+5]=this.rb_un_lieu
this.Control[iCurrent+6]=this.dw_lieu
this.Control[iCurrent+7]=this.cbx_detail
this.Control[iCurrent+8]=this.dw_2
this.Control[iCurrent+9]=this.gb_4
this.Control[iCurrent+10]=this.gb_5
end on

event open;call super::open;

dw_fourni.settransobject(sqlca)
dw_fourni.retrieve()

dw_lieu.settransobject(sqlca)
dw_lieu.retrieve()



end event

type p_fond from w_liste_produit`p_fond within w_liste_produit_stock
integer y = 648
end type

type cb_fermer from w_liste_produit`cb_fermer within w_liste_produit_stock
end type

type cb_imprimer from w_liste_produit`cb_imprimer within w_liste_produit_stock
end type

type cb_autre from w_liste_produit`cb_autre within w_liste_produit_stock
end type

type cb_ecran from w_liste_produit`cb_ecran within w_liste_produit_stock
end type

type dw_gestion from w_liste_produit`dw_gestion within w_liste_produit_stock
string tag = "no resizeall brush"
integer y = 580
end type

type dw_type from w_liste_produit`dw_type within w_liste_produit_stock
integer y = 1060
end type

type dw_categorie from w_liste_produit`dw_categorie within w_liste_produit_stock
string tag = "no resizeall brush"
integer y = 936
end type

type rb_un_produit from w_liste_produit`rb_un_produit within w_liste_produit_stock
integer y = 1028
end type

type rb_un_categorie from w_liste_produit`rb_un_categorie within w_liste_produit_stock
integer y = 936
end type

type rb_tous_produits from w_liste_produit`rb_tous_produits within w_liste_produit_stock
integer y = 844
end type

type rb_2 from w_liste_produit`rb_2 within w_liste_produit_stock
integer y = 580
end type

type rb_tous_gestion from w_liste_produit`rb_tous_gestion within w_liste_produit_stock
integer y = 480
end type

type cb_lien_word from w_liste_produit`cb_lien_word within w_liste_produit_stock
end type

type dw_liste from w_liste_produit`dw_liste within w_liste_produit_stock
integer y = 4
string dataobject = "dw_impr_liste_produit_stock"
end type

event dw_liste::rbuttondown;if row > 0 then
	This.SelectRow(0,False)
	This.SelectRow(row,True)
	This.setrow(row)
	OpenMenuProduit_liste_stock(this)
end if
end event

type uo_size from w_liste_produit`uo_size within w_liste_produit_stock
end type

type dw_prati from w_liste_produit`dw_prati within w_liste_produit_stock
integer y = 212
end type

type rb_un from w_liste_produit`rb_un within w_liste_produit_stock
integer y = 212
end type

type rb_tous from w_liste_produit`rb_tous within w_liste_produit_stock
integer y = 116
end type

type em_nb from w_liste_produit`em_nb within w_liste_produit_stock
end type

type dw_1 from w_liste_produit`dw_1 within w_liste_produit_stock
end type

type pb_exporter from w_liste_produit`pb_exporter within w_liste_produit_stock
end type

type cbx_avec_les_inactifs from w_liste_produit`cbx_avec_les_inactifs within w_liste_produit_stock
end type

type gb_1 from w_liste_produit`gb_1 within w_liste_produit_stock
integer y = 36
end type

type gb_2 from w_liste_produit`gb_2 within w_liste_produit_stock
integer y = 404
end type

type gb_3 from w_liste_produit`gb_3 within w_liste_produit_stock
integer y = 752
end type

type gb_filtre from w_liste_produit`gb_filtre within w_liste_produit_stock
end type

type rb_tous_fournisseurs from radiobutton within w_liste_produit_stock
integer x = 443
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
long backcolor = 16777215
string text = "Tous les fournisseurs"
boolean checked = true
end type

event clicked;

if this.checked then
	dw_fourni.visible = false
	cbx_detail.visible = true
else
	dw_fourni.visible = true
	cbx_detail.visible = false
end if
end event

type rb_un_fournisseur from radiobutton within w_liste_produit_stock
integer x = 443
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
long backcolor = 16777215
string text = "Un fournisseur"
end type

event clicked;if this.checked then
	dw_fourni.visible = true
	cbx_detail.visible = false
else
	dw_fourni.visible = false
	cbx_detail.visible = true
end if
end event

type dw_fourni from datawindow within w_liste_produit_stock
string tag = "no resizeall brush"
boolean visible = false
integer x = 1440
integer y = 1476
integer width = 667
integer height = 76
integer taborder = 100
boolean bringtotop = true
string title = "none"
string dataobject = "dw_fournisseur_affich_ddlb"
boolean border = false
boolean livescroll = true
end type

type rb_tous_lieu from radiobutton within w_liste_produit_stock
integer x = 443
integer y = 1708
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
long backcolor = 16777215
string text = "Tous les lieux"
boolean checked = true
end type

event clicked;dw_lieu.visible = false
end event

type rb_un_lieu from radiobutton within w_liste_produit_stock
integer x = 443
integer y = 1808
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
long backcolor = 16777215
string text = "Un lieu"
end type

event clicked;dw_lieu.visible = true
end event

type dw_lieu from datawindow within w_liste_produit_stock
string tag = "no resizeall brush"
boolean visible = false
integer x = 1243
integer y = 1812
integer width = 827
integer height = 88
integer taborder = 100
boolean bringtotop = true
string title = "none"
string dataobject = "dw_lieu_affich"
boolean border = false
boolean livescroll = true
end type

type cbx_detail from checkbox within w_liste_produit_stock
integer x = 1326
integer y = 1396
integer width = 1038
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 16777215
string text = "Avec le stock de chaque fournisseur"
end type

type dw_2 from datawindow within w_liste_produit_stock
boolean visible = false
integer x = 3141
integer y = 712
integer width = 686
integer height = 400
integer taborder = 50
boolean bringtotop = true
string title = "none"
string dataobject = "dw_impr_liste_produit_stock_detail"
boolean livescroll = true
borderstyle borderstyle = styleraised!
end type

type gb_4 from groupbox within w_liste_produit_stock
integer x = 279
integer y = 1304
integer width = 2121
integer height = 304
integer taborder = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean italic = true
long textcolor = 33554432
long backcolor = 16777215
string text = "Choix du Fournisseur Principal"
end type

type gb_5 from groupbox within w_liste_produit_stock
integer x = 279
integer y = 1628
integer width = 2121
integer height = 304
integer taborder = 90
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean italic = true
long textcolor = 33554432
long backcolor = 16777215
string text = "Choix du Lieu de Stockage"
end type

