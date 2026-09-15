$PBExportHeader$w_liste_fournisseur_achat.srw
forward
global type w_liste_fournisseur_achat from w_liste_fournisseur_hitparade
end type
type rb_tous_fournisseur from radiobutton within w_liste_fournisseur_achat
end type
type rb_un_fournisseur from radiobutton within w_liste_fournisseur_achat
end type
type dw_fournisseur from datawindow within w_liste_fournisseur_achat
end type
type gb_5 from groupbox within w_liste_fournisseur_achat
end type
end forward

global type w_liste_fournisseur_achat from w_liste_fournisseur_hitparade
string title = "Liste des achats"
rb_tous_fournisseur rb_tous_fournisseur
rb_un_fournisseur rb_un_fournisseur
dw_fournisseur dw_fournisseur
gb_5 gb_5
end type
global w_liste_fournisseur_achat w_liste_fournisseur_achat

type variables
string code_fournisseur
end variables

forward prototypes
public subroutine prepa ()
end prototypes

public subroutine prepa ();string pra_min,pra_max
date date_min,date_max

if not prepa_faite then
	//prepa_faite = true
	if rb_tous.checked then
		pra_min="      "
		pra_max="ZZZZZZ"
	else
		pra_min=dw_prati.getitemstring(dw_prati.getrow(),"code")
		pra_max=dw_prati.getitemstring(dw_prati.getrow(),"code")
	end if
	
	date_min = date(em_date_min.text)
	date_max = date(em_date_max.text)
	
	open(w_patience)
	dw_liste.retrieve(pra_min,pra_max,date_min,date_max,code_fournisseur)
	close(w_patience)

	em_nb.text = string(dw_liste.rowcount())+" Achats"
	em_nb.visible = true
end if

end subroutine

on w_liste_fournisseur_achat.create
int iCurrent
call super::create
this.rb_tous_fournisseur=create rb_tous_fournisseur
this.rb_un_fournisseur=create rb_un_fournisseur
this.dw_fournisseur=create dw_fournisseur
this.gb_5=create gb_5
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.rb_tous_fournisseur
this.Control[iCurrent+2]=this.rb_un_fournisseur
this.Control[iCurrent+3]=this.dw_fournisseur
this.Control[iCurrent+4]=this.gb_5
end on

on w_liste_fournisseur_achat.destroy
call super::destroy
destroy(this.rb_tous_fournisseur)
destroy(this.rb_un_fournisseur)
destroy(this.dw_fournisseur)
destroy(this.gb_5)
end on

event open;call super::open;dw_fournisseur.settransobject(sqlca)
dw_fournisseur.insertrow(0)
dw_fournisseur.visible = false
code_fournisseur = '%'
end event

type p_fond from w_liste_fournisseur_hitparade`p_fond within w_liste_fournisseur_achat
end type

type cb_imprimer from w_liste_fournisseur_hitparade`cb_imprimer within w_liste_fournisseur_achat
end type

type cb_autre from w_liste_fournisseur_hitparade`cb_autre within w_liste_fournisseur_achat
end type

type cb_ecran from w_liste_fournisseur_hitparade`cb_ecran within w_liste_fournisseur_achat
end type

type cb_fermer from w_liste_fournisseur_hitparade`cb_fermer within w_liste_fournisseur_achat
end type

event cb_fermer::clicked;fermer_fenetre(parent)
end event

type st_3 from w_liste_fournisseur_hitparade`st_3 within w_liste_fournisseur_achat
integer x = 507
integer y = 1020
end type

type st_2 from w_liste_fournisseur_hitparade`st_2 within w_liste_fournisseur_achat
integer x = 1307
integer y = 1020
end type

type cb_lien_word from w_liste_fournisseur_hitparade`cb_lien_word within w_liste_fournisseur_achat
end type

type dw_liste from w_liste_fournisseur_hitparade`dw_liste within w_liste_fournisseur_achat
string dataobject = "dw_impr_liste_fournisseur_achat"
end type

type uo_size from w_liste_fournisseur_hitparade`uo_size within w_liste_fournisseur_achat
end type

type dw_prati from w_liste_fournisseur_hitparade`dw_prati within w_liste_fournisseur_achat
end type

type rb_un from w_liste_fournisseur_hitparade`rb_un within w_liste_fournisseur_achat
end type

type rb_tous from w_liste_fournisseur_hitparade`rb_tous within w_liste_fournisseur_achat
end type

type em_nb from w_liste_fournisseur_hitparade`em_nb within w_liste_fournisseur_achat
end type

type dw_1 from w_liste_fournisseur_hitparade`dw_1 within w_liste_fournisseur_achat
end type

type em_date_min from w_liste_fournisseur_hitparade`em_date_min within w_liste_fournisseur_achat
integer x = 837
integer y = 1008
end type

type em_date_max from w_liste_fournisseur_hitparade`em_date_max within w_liste_fournisseur_achat
integer x = 1641
integer y = 1008
end type

type gb_1 from w_liste_fournisseur_hitparade`gb_1 within w_liste_fournisseur_achat
end type

type gb_4 from w_liste_fournisseur_hitparade`gb_4 within w_liste_fournisseur_achat
integer x = 288
integer y = 880
string text = "Liste des Achats"
end type

type rb_tous_fournisseur from radiobutton within w_liste_fournisseur_achat
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

type rb_un_fournisseur from radiobutton within w_liste_fournisseur_achat
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

type dw_fournisseur from datawindow within w_liste_fournisseur_achat
string tag = "no resizeall brush"
integer x = 1161
integer y = 696
integer width = 859
integer height = 76
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

type gb_5 from groupbox within w_liste_fournisseur_achat
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

