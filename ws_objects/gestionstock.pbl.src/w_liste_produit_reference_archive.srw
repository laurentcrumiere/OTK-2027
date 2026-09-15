$PBExportHeader$w_liste_produit_reference_archive.srw
forward
global type w_liste_produit_reference_archive from w_liste_produit
end type
type rb_tous_fournisseur from radiobutton within w_liste_produit_reference_archive
end type
type rb_un_fournisseur from radiobutton within w_liste_produit_reference_archive
end type
type dw_fournisseur from datawindow within w_liste_produit_reference_archive
end type
type gb_4 from groupbox within w_liste_produit_reference_archive
end type
end forward

global type w_liste_produit_reference_archive from w_liste_produit
string title = "Liste des produits référencés"
rb_tous_fournisseur rb_tous_fournisseur
rb_un_fournisseur rb_un_fournisseur
dw_fournisseur dw_fournisseur
gb_4 gb_4
end type
global w_liste_produit_reference_archive w_liste_produit_reference_archive

type variables
string code_fournisseur
end variables

forward prototypes
public subroutine prepa ()
end prototypes

public subroutine prepa ();string pra_min,pra_max
integer type_gestion_min, type_gestion_max

if not prepa_faite then
	//prepa_faite = true
	if rb_tous.checked then
		pra_min="      "
		pra_max="ZZZZZZ"
	else
		pra_min=dw_prati.getitemstring(dw_prati.getrow(),"code")
		pra_max=dw_prati.getitemstring(dw_prati.getrow(),"code")
	end if
	
	open(w_patience)
	dw_liste.retrieve(code_fournisseur,pra_min,pra_max,code_type_produit,code_categorie_produit,'o')
	close(w_patience)

	em_nb.text = string(dw_liste.rowcount())+" Produits"
	em_nb.visible = true
end if
end subroutine

event open;call super::open;dw_fournisseur.settransobject(sqlca)
dw_fournisseur.insertrow(0)
dw_fournisseur.visible = false
code_fournisseur = '%'
end event

on w_liste_produit_reference_archive.create
int iCurrent
call super::create
this.rb_tous_fournisseur=create rb_tous_fournisseur
this.rb_un_fournisseur=create rb_un_fournisseur
this.dw_fournisseur=create dw_fournisseur
this.gb_4=create gb_4
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.rb_tous_fournisseur
this.Control[iCurrent+2]=this.rb_un_fournisseur
this.Control[iCurrent+3]=this.dw_fournisseur
this.Control[iCurrent+4]=this.gb_4
end on

on w_liste_produit_reference_archive.destroy
call super::destroy
destroy(this.rb_tous_fournisseur)
destroy(this.rb_un_fournisseur)
destroy(this.dw_fournisseur)
destroy(this.gb_4)
end on

type p_fond from w_liste_produit`p_fond within w_liste_produit_reference_archive
end type

type cb_fermer from w_liste_produit`cb_fermer within w_liste_produit_reference_archive
end type

type cb_imprimer from w_liste_produit`cb_imprimer within w_liste_produit_reference_archive
end type

type cb_autre from w_liste_produit`cb_autre within w_liste_produit_reference_archive
end type

type cb_ecran from w_liste_produit`cb_ecran within w_liste_produit_reference_archive
end type

type dw_gestion from w_liste_produit`dw_gestion within w_liste_produit_reference_archive
boolean visible = false
end type

type dw_type from w_liste_produit`dw_type within w_liste_produit_reference_archive
integer height = 156
end type

type dw_categorie from w_liste_produit`dw_categorie within w_liste_produit_reference_archive
string tag = "no resizeall brush"
integer height = 72
end type

type rb_un_produit from w_liste_produit`rb_un_produit within w_liste_produit_reference_archive
long backcolor = 553648127
end type

type rb_un_categorie from w_liste_produit`rb_un_categorie within w_liste_produit_reference_archive
long backcolor = 553648127
end type

type rb_tous_produits from w_liste_produit`rb_tous_produits within w_liste_produit_reference_archive
long backcolor = 553648127
end type

type rb_2 from w_liste_produit`rb_2 within w_liste_produit_reference_archive
boolean visible = false
end type

type rb_tous_gestion from w_liste_produit`rb_tous_gestion within w_liste_produit_reference_archive
boolean visible = false
end type

type cb_lien_word from w_liste_produit`cb_lien_word within w_liste_produit_reference_archive
end type

type dw_liste from w_liste_produit`dw_liste within w_liste_produit_reference_archive
string dataobject = "dw_impr_liste_produit_reference"
end type

event dw_liste::rbuttondown;if row > 0 then
	This.SelectRow(0,False)
	This.SelectRow(row,True)
	This.setrow(row)
	OpenMenuProduit_liste_reference(this,true)
end if
end event

type uo_size from w_liste_produit`uo_size within w_liste_produit_reference_archive
end type

type dw_prati from w_liste_produit`dw_prati within w_liste_produit_reference_archive
end type

type rb_un from w_liste_produit`rb_un within w_liste_produit_reference_archive
long backcolor = 553648127
end type

type rb_tous from w_liste_produit`rb_tous within w_liste_produit_reference_archive
long backcolor = 553648127
end type

type em_nb from w_liste_produit`em_nb within w_liste_produit_reference_archive
end type

type dw_1 from w_liste_produit`dw_1 within w_liste_produit_reference_archive
end type

type pb_exporter from w_liste_produit`pb_exporter within w_liste_produit_reference_archive
end type

type cbx_avec_les_inactifs from w_liste_produit`cbx_avec_les_inactifs within w_liste_produit_reference_archive
end type

type gb_1 from w_liste_produit`gb_1 within w_liste_produit_reference_archive
long backcolor = 16777215
end type

type gb_2 from w_liste_produit`gb_2 within w_liste_produit_reference_archive
boolean visible = false
end type

type gb_3 from w_liste_produit`gb_3 within w_liste_produit_reference_archive
long backcolor = 16777215
end type

type gb_filtre from w_liste_produit`gb_filtre within w_liste_produit_reference_archive
end type

type rb_tous_fournisseur from radiobutton within w_liste_produit_reference_archive
integer x = 448
integer y = 592
integer width = 686
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 553648127
string text = "Tous les fournisseurs"
boolean checked = true
end type

event clicked;dw_fournisseur.visible = false
code_fournisseur = '%'
end event

type rb_un_fournisseur from radiobutton within w_liste_produit_reference_archive
integer x = 448
integer y = 708
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
long backcolor = 553648127
string text = "Un fournisseur"
end type

event clicked;dw_fournisseur.visible = true
code_fournisseur = '%'
end event

type dw_fournisseur from datawindow within w_liste_produit_reference_archive
string tag = "no resizeall brush"
integer x = 1161
integer y = 696
integer width = 864
integer height = 84
integer taborder = 60
boolean bringtotop = true
string title = "none"
string dataobject = "dw_fournisseur_affich_liste_ddlb"
boolean border = false
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event itemchanged;code_fournisseur = data
end event

type gb_4 from groupbox within w_liste_produit_reference_archive
integer x = 283
integer y = 492
integer width = 2117
integer height = 340
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
string text = "Choix du fournisseur"
end type

