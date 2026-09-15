$PBExportHeader$w_choix_code_barre.srw
forward
global type w_choix_code_barre from w_fenetre_arakis
end type
type cb_fermer from uo_picturebutton_390x120_fermer within w_choix_code_barre
end type
type cb_annuler from uo_picturebutton_390x120 within w_choix_code_barre
end type
type dw_liste from u_basedw within w_choix_code_barre
end type
end forward

global type w_choix_code_barre from w_fenetre_arakis
integer width = 2683
integer height = 1376
string title = "Choix du produit"
boolean minbox = false
boolean maxbox = false
boolean resizable = false
windowtype windowtype = response!
boolean center = true
cb_fermer cb_fermer
cb_annuler cb_annuler
dw_liste dw_liste
end type
global w_choix_code_barre w_choix_code_barre

type variables
str_udi v_udi

end variables

on w_choix_code_barre.create
int iCurrent
call super::create
this.cb_fermer=create cb_fermer
this.cb_annuler=create cb_annuler
this.dw_liste=create dw_liste
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_fermer
this.Control[iCurrent+2]=this.cb_annuler
this.Control[iCurrent+3]=this.dw_liste
end on

on w_choix_code_barre.destroy
call super::destroy
destroy(this.cb_fermer)
destroy(this.cb_annuler)
destroy(this.dw_liste)
end on

event open;call super::open;dw_liste.settransobject(sqlca)
v_udi = message.PowerObjectParm

dw_liste.retrieve(v_udi.di,  v_udi.numero_lot)

if dw_liste.rowcount() = 0 then
	// en principe impossible mais ...
	MessageBox("ATTENTION","Erreur dans la recherche du produit en stock !")
	close(this)
else
	if dw_liste.rowcount() = 1 then 
		CloseWithReturn(this , dw_liste.Getitemnumber(dw_liste.getrow(), "code_barre"))
	end if
end if

end event

type p_fond from w_fenetre_arakis`p_fond within w_choix_code_barre
end type

type cb_fermer from uo_picturebutton_390x120_fermer within w_choix_code_barre
integer x = 1216
integer y = 1100
integer width = 562
integer taborder = 10
boolean bringtotop = true
end type

event clicked;

CloseWithReturn(parent, dw_liste.Getitemnumber(dw_liste.getrow(), "code_barre"))
end event

type cb_annuler from uo_picturebutton_390x120 within w_choix_code_barre
integer x = 608
integer y = 1100
integer width = 562
integer taborder = 20
boolean bringtotop = true
string text = "Annuler"
string iconname = "ACTIONS_abandonner.png"
end type

event clicked;call super::clicked;CloseWithReturn(parent, -1)
end event

type dw_liste from u_basedw within w_choix_code_barre
string tag = "brush"
integer x = 18
integer width = 2555
integer height = 1048
integer taborder = 30
boolean bringtotop = true
boolean titlebar = true
string title = "Liste des produits disponibles"
string dataobject = "dw_stock_produit_choix_code_barre"
boolean hscrollbar = false
boolean border = false
end type

event clicked;if this.dataobject = "dw_stock_produit_liste" then
	If row > 0 Then
		This.SelectRow(0,False)
		This.SelectRow(row,True)
		This.setrow(row)
	else
		This.uf_ColSort()
	End If
end if
end event

event doubleclicked;call super::doubleclicked;cb_fermer.triggerevent(clicked!)
end event

