$PBExportHeader$w_liste_produit_valorisation.srw
forward
global type w_liste_produit_valorisation from w_liste_produit
end type
type st_2 from statictext within w_liste_produit_valorisation
end type
type em_date from editmask within w_liste_produit_valorisation
end type
type cbx_detail from checkbox within w_liste_produit_valorisation
end type
type gb_4 from gb_1 within w_liste_produit_valorisation
end type
type gb_detail from groupbox within w_liste_produit_valorisation
end type
end forward

global type w_liste_produit_valorisation from w_liste_produit
string title = "Valorisation du stock"
st_2 st_2
em_date em_date
cbx_detail cbx_detail
gb_4 gb_4
gb_detail gb_detail
end type
global w_liste_produit_valorisation w_liste_produit_valorisation

type variables
string code_praticien
end variables

forward prototypes
public subroutine prepa ()
end prototypes

public subroutine prepa ();date date_valorisation //date de valorisation entrée par l'utilisateur
integer i //pour la boucle for
integer nb_row //nb de ligne récupérer
integer somme_qte_sortie  //somme des qte de produit sortie entre date_valorisation et aujourdhui
integer qte_courante //qte en stock du produit à la date d'aujourd'hui
double code_barre_courant //code barre d'une ligne de la liste

if not prepa_faite then
	//prepa_faite = true
	if rb_tous.checked then
		code_praticien = '%'
	else
		code_praticien = dw_prati.getitemstring(dw_prati.Getrow(),"code")
	end if
	
	date_valorisation = relativedate(date(em_date.text),1)
	
	open(w_patience)
	dw_liste.retrieve(code_praticien,code_type_produit,code_categorie_produit,date_valorisation)
	close(w_patience)
	
	dw_liste.setfilter("quantite > 0")
	dw_liste.filter()
	dw_liste.groupcalc()
	//dw_liste.setfilter("")

	em_nb.text = string(dw_liste.rowcount())+" Produits"
	em_nb.visible = true
end if

end subroutine

on w_liste_produit_valorisation.create
int iCurrent
call super::create
this.st_2=create st_2
this.em_date=create em_date
this.cbx_detail=create cbx_detail
this.gb_4=create gb_4
this.gb_detail=create gb_detail
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.st_2
this.Control[iCurrent+2]=this.em_date
this.Control[iCurrent+3]=this.cbx_detail
this.Control[iCurrent+4]=this.gb_4
this.Control[iCurrent+5]=this.gb_detail
end on

on w_liste_produit_valorisation.destroy
call super::destroy
destroy(this.st_2)
destroy(this.em_date)
destroy(this.cbx_detail)
destroy(this.gb_4)
destroy(this.gb_detail)
end on

event open;call super::open;em_date.text = string(today())
dw_prati.visible = true
end event

event resize;call super::resize;// repositionnement 
cbx_detail.x = gb_detail.x + 55
cbx_detail.y = gb_detail.y + 55


end event

type p_fond from w_liste_produit`p_fond within w_liste_produit_valorisation
end type

type cb_fermer from w_liste_produit`cb_fermer within w_liste_produit_valorisation
integer x = 2578
end type

type cb_imprimer from w_liste_produit`cb_imprimer within w_liste_produit_valorisation
integer x = 1248
end type

type cb_autre from w_liste_produit`cb_autre within w_liste_produit_valorisation
integer x = 2135
end type

type cb_ecran from w_liste_produit`cb_ecran within w_liste_produit_valorisation
integer x = 805
end type

type dw_gestion from w_liste_produit`dw_gestion within w_liste_produit_valorisation
boolean visible = false
end type

type dw_type from w_liste_produit`dw_type within w_liste_produit_valorisation
end type

type dw_categorie from w_liste_produit`dw_categorie within w_liste_produit_valorisation
string tag = "no resizeall brush"
end type

type rb_un_produit from w_liste_produit`rb_un_produit within w_liste_produit_valorisation
end type

type rb_un_categorie from w_liste_produit`rb_un_categorie within w_liste_produit_valorisation
end type

type rb_tous_produits from w_liste_produit`rb_tous_produits within w_liste_produit_valorisation
end type

type rb_2 from w_liste_produit`rb_2 within w_liste_produit_valorisation
boolean visible = false
integer x = 443
integer y = 748
end type

type rb_tous_gestion from w_liste_produit`rb_tous_gestion within w_liste_produit_valorisation
boolean visible = false
integer x = 443
integer y = 648
end type

type cb_lien_word from w_liste_produit`cb_lien_word within w_liste_produit_valorisation
end type

type dw_liste from w_liste_produit`dw_liste within w_liste_produit_valorisation
string dataobject = "dw_impr_liste_produit_valorisation"
end type

event dw_liste::rbuttondown;if row > 0 then
	This.SelectRow(0,False)
	This.SelectRow(row,True)
	This.setrow(row)
	OpenMenuProduit_liste_stock(this)
end if
end event

type uo_size from w_liste_produit`uo_size within w_liste_produit_valorisation
end type

type dw_prati from w_liste_produit`dw_prati within w_liste_produit_valorisation
integer x = 1161
integer y = 384
end type

type rb_un from w_liste_produit`rb_un within w_liste_produit_valorisation
integer x = 443
integer y = 380
boolean checked = true
end type

type rb_tous from w_liste_produit`rb_tous within w_liste_produit_valorisation
integer x = 443
integer y = 284
boolean enabled = false
boolean checked = false
end type

type em_nb from w_liste_produit`em_nb within w_liste_produit_valorisation
end type

type dw_1 from w_liste_produit`dw_1 within w_liste_produit_valorisation
end type

type pb_exporter from w_liste_produit`pb_exporter within w_liste_produit_valorisation
integer x = 1691
end type

event pb_exporter::clicked;

// Avant d'exporter, on reprend le champ calcul valorisation pour qu'il soit dans l'export

long lig, tot
double v_valo

tot = dw_liste.rowcount()

for lig = 1 to tot
	v_valo = dw_liste.getitemNumber(lig, "compute_valorisation")
	dw_liste.setitem(lig, "valorisation", v_valo)
	
next

dw_liste.saveas()
end event

type cbx_avec_les_inactifs from w_liste_produit`cbx_avec_les_inactifs within w_liste_produit_valorisation
integer x = 3657
integer y = 2032
integer width = 549
end type

event cbx_avec_les_inactifs::clicked;
// sélection ou pas des inactifs ..
if this.checked then
	dw_liste.setfilter("quantite > 0")
else
	dw_liste.setfilter("actif = 1 and quantite > 0")
end if

dw_liste.filter()

end event

type gb_1 from w_liste_produit`gb_1 within w_liste_produit_valorisation
integer x = 279
integer y = 204
end type

type gb_2 from w_liste_produit`gb_2 within w_liste_produit_valorisation
boolean visible = false
end type

type gb_3 from w_liste_produit`gb_3 within w_liste_produit_valorisation
end type

type gb_filtre from w_liste_produit`gb_filtre within w_liste_produit_valorisation
integer x = 3616
integer width = 617
end type

type st_2 from statictext within w_liste_produit_valorisation
integer x = 480
integer y = 672
integer width = 745
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 15780518
string text = "Valorisation du stock au"
boolean focusrectangle = false
end type

type em_date from editmask within w_liste_produit_valorisation
integer x = 1230
integer y = 660
integer width = 421
integer height = 96
integer taborder = 70
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "dd/mm/yyyy"
boolean spin = true
double increment = 1
string minmax = "~~"
end type

type cbx_detail from checkbox within w_liste_produit_valorisation
string tag = "no resize all"
integer x = 3154
integer y = 2032
integer width = 393
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
string text = "Avec détail"
borderstyle borderstyle = styleraised!
end type

event clicked;if cbx_detail.checked then 
	dw_liste.object.datawindow.detail.height = 84
else
	dw_liste.object.datawindow.detail.height = 0
end if
end event

type gb_4 from gb_1 within w_liste_produit_valorisation
integer y = 532
integer taborder = 60
string text = "Date de valorisation"
end type

type gb_detail from groupbox within w_liste_produit_valorisation
string tag = "no resize all"
integer x = 3090
integer y = 1972
integer width = 489
integer height = 168
integer taborder = 110
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
end type

