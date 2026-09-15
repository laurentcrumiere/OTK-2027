$PBExportHeader$w_prati_fiche_87644.srw
forward
global type w_prati_fiche_87644 from w_fenetre_arakis
end type
type pb_annuler from uo_picturebutton_390x120 within w_prati_fiche_87644
end type
type pb_enregistrer from uo_picturebutton_390x120 within w_prati_fiche_87644
end type
type dw_fiche from datawindow within w_prati_fiche_87644
end type
end forward

global type w_prati_fiche_87644 from w_fenetre_arakis
integer width = 1865
integer height = 796
string title = "Modification d~'un matricule Faculté"
boolean minbox = false
boolean maxbox = false
boolean resizable = false
windowtype windowtype = response!
boolean center = true
pb_annuler pb_annuler
pb_enregistrer pb_enregistrer
dw_fiche dw_fiche
end type
global w_prati_fiche_87644 w_prati_fiche_87644

type variables


string v_code_praticien
end variables

on w_prati_fiche_87644.create
int iCurrent
call super::create
this.pb_annuler=create pb_annuler
this.pb_enregistrer=create pb_enregistrer
this.dw_fiche=create dw_fiche
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.pb_annuler
this.Control[iCurrent+2]=this.pb_enregistrer
this.Control[iCurrent+3]=this.dw_fiche
end on

on w_prati_fiche_87644.destroy
call super::destroy
destroy(this.pb_annuler)
destroy(this.pb_enregistrer)
destroy(this.dw_fiche)
end on

event open;call super::open;
v_code_praticien = message.StringParm 

dw_fiche.settransobject(sqlca)

dw_fiche.retrieve(v_code_praticien)

if dw_fiche.rowcount() = 0 then
	// création
	dw_fiche.InsertRow(0)
	string v_nom
	dw_fiche.Setitem(1, "fac_montpellier_praticien_code_praticien", v_code_praticien)
	select nom into :v_nom from prati where code = :v_code_praticien ;
	dw_fiche.Setitem(1, "prati_nom", v_nom)
	
end if
end event

type p_fond from w_fenetre_arakis`p_fond within w_prati_fiche_87644
end type

type pb_annuler from uo_picturebutton_390x120 within w_prati_fiche_87644
integer x = 402
integer y = 496
integer width = 411
integer height = 152
integer taborder = 10
boolean bringtotop = true
string text = "Annuler"
end type

event clicked;call super::clicked;
close(parent)


end event

type pb_enregistrer from uo_picturebutton_390x120 within w_prati_fiche_87644
integer x = 869
integer y = 496
integer width = 411
integer height = 152
integer taborder = 20
boolean bringtotop = true
string text = "Enregistrer"
boolean originalsize = false
end type

event clicked;call super::clicked;

if dw_fiche.update() = 1 then 
	commit ;
	close(parent)
else
	rollback ;
	messagebox("ATTENTION","Une erreur s'est produit dans l'enregistrement.~n~n" + sqlca.sqlerrtext)
end if
end event

type dw_fiche from datawindow within w_prati_fiche_87644
string tag = "brush"
integer x = 27
integer y = 28
integer width = 1723
integer height = 416
integer taborder = 10
boolean bringtotop = true
string title = "none"
string dataobject = "dw_prati_fiche_87644"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

