$PBExportHeader$w_pays.srw
forward
global type w_pays from w_param
end type
type st_1 from statictext within w_pays
end type
type st_2 from statictext within w_pays
end type
type st_3 from statictext within w_pays
end type
type st_4 from statictext within w_pays
end type
type gb_1 from groupbox within w_pays
end type
end forward

global type w_pays from w_param
string title = "Table des Pays"
st_1 st_1
st_2 st_2
st_3 st_3
st_4 st_4
gb_1 gb_1
end type
global w_pays w_pays

on w_pays.create
int iCurrent
call super::create
this.st_1=create st_1
this.st_2=create st_2
this.st_3=create st_3
this.st_4=create st_4
this.gb_1=create gb_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.st_1
this.Control[iCurrent+2]=this.st_2
this.Control[iCurrent+3]=this.st_3
this.Control[iCurrent+4]=this.st_4
this.Control[iCurrent+5]=this.gb_1
end on

on w_pays.destroy
call super::destroy
destroy(this.st_1)
destroy(this.st_2)
destroy(this.st_3)
destroy(this.st_4)
destroy(this.gb_1)
end on

event open;call super::open;
verification_ordre_par_defaut = true
v_nom_table_a_verifier = "pays"
end event

type p_fond from w_param`p_fond within w_pays
end type

type pb_raz_ordre_trie from w_param`pb_raz_ordre_trie within w_pays
boolean visible = true
integer x = 942
integer y = 2008
end type

type cb_annuler from w_param`cb_annuler within w_pays
integer x = 2601
end type

type cb_enregistrer from w_param`cb_enregistrer within w_pays
integer x = 3127
end type

type cb_fermer from w_param`cb_fermer within w_pays
integer x = 3653
end type

type cb_supprimer from w_param`cb_supprimer within w_pays
integer x = 480
integer y = 2008
end type

type cb_ajouter from w_param`cb_ajouter within w_pays
integer x = 18
integer y = 2008
end type

type dw_liste from w_param`dw_liste within w_pays
integer x = 119
integer y = 40
integer width = 3977
integer height = 1524
string dataobject = "dw_pays_liste"
end type

type uo_1 from w_param`uo_1 within w_pays
end type

type cbx_avec_les_inactifs from w_param`cbx_avec_les_inactifs within w_pays
end type

type gb_filtre from w_param`gb_filtre within w_pays
end type

type st_1 from statictext within w_pays
integer x = 1605
integer y = 1676
integer width = 517
integer height = 64
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 15780518
string text = "# pour un nombre"
boolean focusrectangle = false
end type

type st_2 from statictext within w_pays
integer x = 1605
integer y = 1856
integer width = 658
integer height = 64
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 15780518
string text = "( ) - /    pour séparateurs"
boolean focusrectangle = false
end type

type st_3 from statictext within w_pays
integer x = 1605
integer y = 1796
integer width = 878
integer height = 64
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 15780518
string text = "X pour n~'importe quel caractère"
boolean focusrectangle = false
end type

type st_4 from statictext within w_pays
integer x = 1605
integer y = 1736
integer width = 864
integer height = 64
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 15780518
string text = "! pour une majuscule (ou nombre)"
boolean focusrectangle = false
end type

type gb_1 from groupbox within w_pays
integer x = 1545
integer y = 1600
integer width = 946
integer height = 344
integer taborder = 50
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Eras Demi ITC"
long textcolor = 33554432
long backcolor = 15780518
string text = "Aide aux formats"
end type

