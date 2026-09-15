$PBExportHeader$w_liste_produit_limite_peremption.srw
forward
global type w_liste_produit_limite_peremption from w_liste_produit
end type
type st_1 from statictext within w_liste_produit_limite_peremption
end type
type em_date_limite from editmask within w_liste_produit_limite_peremption
end type
type gb_4 from groupbox within w_liste_produit_limite_peremption
end type
end forward

global type w_liste_produit_limite_peremption from w_liste_produit
string title = "Liste des produits en stock en limite de péremption"
st_1 st_1
em_date_limite em_date_limite
gb_4 gb_4
end type
global w_liste_produit_limite_peremption w_liste_produit_limite_peremption

forward prototypes
public subroutine prepa ()
end prototypes

public subroutine prepa ();string pra_min,pra_max, code_produit_courant,code_praticien_courant
integer type_gestion_min, type_gestion_max,quantite
double nb_ligne,i

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
	
	open(w_patience)
	dw_liste.retrieve(type_gestion_min,type_gestion_max,pra_min,pra_max,code_type_produit,code_categorie_produit, date(em_date_limite.text))
	close(w_patience)

	em_nb.text = string(dw_liste.rowcount())+" Produits"
	em_nb.visible = true
end if
end subroutine

on w_liste_produit_limite_peremption.destroy
call super::destroy
destroy(this.st_1)
destroy(this.em_date_limite)
destroy(this.gb_4)
end on

on w_liste_produit_limite_peremption.create
int iCurrent
call super::create
this.st_1=create st_1
this.em_date_limite=create em_date_limite
this.gb_4=create gb_4
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.st_1
this.Control[iCurrent+2]=this.em_date_limite
this.Control[iCurrent+3]=this.gb_4
end on

event open;call super::open;

em_date_limite.text = string(relativedate(today() , 30 ))
end event

type p_fond from w_liste_produit`p_fond within w_liste_produit_limite_peremption
end type

type cb_fermer from w_liste_produit`cb_fermer within w_liste_produit_limite_peremption
end type

type cb_imprimer from w_liste_produit`cb_imprimer within w_liste_produit_limite_peremption
end type

type cb_autre from w_liste_produit`cb_autre within w_liste_produit_limite_peremption
end type

type cb_ecran from w_liste_produit`cb_ecran within w_liste_produit_limite_peremption
end type

type dw_gestion from w_liste_produit`dw_gestion within w_liste_produit_limite_peremption
string tag = "no resizeall brush"
integer y = 600
end type

type dw_type from w_liste_produit`dw_type within w_liste_produit_limite_peremption
integer y = 1080
end type

type dw_categorie from w_liste_produit`dw_categorie within w_liste_produit_limite_peremption
string tag = "no resizeall brush"
integer y = 956
end type

type rb_un_produit from w_liste_produit`rb_un_produit within w_liste_produit_limite_peremption
integer y = 1048
end type

type rb_un_categorie from w_liste_produit`rb_un_categorie within w_liste_produit_limite_peremption
integer y = 956
end type

type rb_tous_produits from w_liste_produit`rb_tous_produits within w_liste_produit_limite_peremption
integer y = 864
end type

type rb_2 from w_liste_produit`rb_2 within w_liste_produit_limite_peremption
integer y = 600
end type

type rb_tous_gestion from w_liste_produit`rb_tous_gestion within w_liste_produit_limite_peremption
integer y = 500
end type

type cb_lien_word from w_liste_produit`cb_lien_word within w_liste_produit_limite_peremption
end type

type dw_liste from w_liste_produit`dw_liste within w_liste_produit_limite_peremption
string dataobject = "dw_impr_liste_produit_stock_limite_peremption"
end type

event dw_liste::rbuttondown;if row > 0 then
	This.SelectRow(0,False)
	This.SelectRow(row,True)
	This.setrow(row)
	OpenMenuProduit_liste_stock(this)
end if
end event

type uo_size from w_liste_produit`uo_size within w_liste_produit_limite_peremption
end type

type dw_prati from w_liste_produit`dw_prati within w_liste_produit_limite_peremption
integer y = 236
end type

type rb_un from w_liste_produit`rb_un within w_liste_produit_limite_peremption
integer y = 232
end type

type rb_tous from w_liste_produit`rb_tous within w_liste_produit_limite_peremption
integer y = 136
end type

type em_nb from w_liste_produit`em_nb within w_liste_produit_limite_peremption
end type

type dw_1 from w_liste_produit`dw_1 within w_liste_produit_limite_peremption
end type

type pb_exporter from w_liste_produit`pb_exporter within w_liste_produit_limite_peremption
end type

type cbx_avec_les_inactifs from w_liste_produit`cbx_avec_les_inactifs within w_liste_produit_limite_peremption
end type

type gb_1 from w_liste_produit`gb_1 within w_liste_produit_limite_peremption
integer y = 56
end type

type gb_2 from w_liste_produit`gb_2 within w_liste_produit_limite_peremption
integer y = 424
end type

type gb_3 from w_liste_produit`gb_3 within w_liste_produit_limite_peremption
integer y = 772
end type

type gb_filtre from w_liste_produit`gb_filtre within w_liste_produit_limite_peremption
end type

type st_1 from statictext within w_liste_produit_limite_peremption
integer x = 741
integer y = 1432
integer width = 402
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
string text = "A partir du "
boolean focusrectangle = false
end type

type em_date_limite from editmask within w_liste_produit_limite_peremption
integer x = 1189
integer y = 1404
integer width = 448
integer height = 112
integer taborder = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
string text = "none"
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "dd/mm/yyyy"
boolean spin = true
end type

type gb_4 from groupbox within w_liste_produit_limite_peremption
integer x = 283
integer y = 1328
integer width = 2117
integer height = 236
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
string text = "Limite de péremption"
end type

