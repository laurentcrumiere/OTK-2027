$PBExportHeader$w_liste_patient_tracabilite.srw
forward
global type w_liste_patient_tracabilite from w_liste_fournisseur_hitparade
end type
type st_4 from statictext within w_liste_patient_tracabilite
end type
type st_5 from statictext within w_liste_patient_tracabilite
end type
type st_6 from statictext within w_liste_patient_tracabilite
end type
type dw_fournisseur from datawindow within w_liste_patient_tracabilite
end type
type em_code_produit from editmask within w_liste_patient_tracabilite
end type
type em_numero from editmask within w_liste_patient_tracabilite
end type
type st_1 from statictext within w_liste_patient_tracabilite
end type
type sle_identifiant_udi from singlelineedit within w_liste_patient_tracabilite
end type
type pb_udi from picturebutton within w_liste_patient_tracabilite
end type
end forward

global type w_liste_patient_tracabilite from w_liste_fournisseur_hitparade
string title = "Traçabilité - Recherche Fournisseur"
st_4 st_4
st_5 st_5
st_6 st_6
dw_fournisseur dw_fournisseur
em_code_produit em_code_produit
em_numero em_numero
st_1 st_1
sle_identifiant_udi sle_identifiant_udi
pb_udi pb_udi
end type
global w_liste_patient_tracabilite w_liste_patient_tracabilite

type variables
string select_initial		// select initial de la datawindow liste
end variables

forward prototypes
public subroutine prepa ()
end prototypes

public subroutine prepa ();string pra_min,pra_max
date date_min,date_max
string code_fournisseur, numero,code_produit
string sel

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
	
	
	sel = select_initial 
	
	code_fournisseur = dw_fournisseur.getitemstring(dw_fournisseur.getrow(),"code")
	
	if len(trim(code_fournisseur)) > 0 then
		code_fournisseur = "'"+code_fournisseur+"'"
		sel = sel + ' and (stock_produit.code_fournisseur = '+ code_fournisseur+")"
	end if
	
	code_produit = em_code_produit.text

	if len(trim(code_produit)) > 0 then
		code_produit = "'"+code_produit+"'"
		sel = sel + ' and (stock_produit.code_produit = '+ code_produit+")"
	end if

	numero = em_numero.text
	if len(trim(numero)) > 0 then
		numero = "'"+numero+"'"
		sel = sel + ' and (stock_produit.numero_lot = '+ numero+")"
	end if
	
//	messagebox ("trace",sel)
	
	dw_liste.Modify('datawindow.table.select ="'+ sel +'"')

	
	
	open(w_patience)
//	dw_liste.retrieve(pra_min,pra_max,date_min,date_max,code_fournisseur,code_produit,numero)
	dw_liste.retrieve(pra_min,pra_max,date_min,date_max)
	close(w_patience)

	em_nb.text = string(dw_liste.rowcount())+" Parients"
	em_nb.visible = true
end if
end subroutine

on w_liste_patient_tracabilite.create
int iCurrent
call super::create
this.st_4=create st_4
this.st_5=create st_5
this.st_6=create st_6
this.dw_fournisseur=create dw_fournisseur
this.em_code_produit=create em_code_produit
this.em_numero=create em_numero
this.st_1=create st_1
this.sle_identifiant_udi=create sle_identifiant_udi
this.pb_udi=create pb_udi
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.st_4
this.Control[iCurrent+2]=this.st_5
this.Control[iCurrent+3]=this.st_6
this.Control[iCurrent+4]=this.dw_fournisseur
this.Control[iCurrent+5]=this.em_code_produit
this.Control[iCurrent+6]=this.em_numero
this.Control[iCurrent+7]=this.st_1
this.Control[iCurrent+8]=this.sle_identifiant_udi
this.Control[iCurrent+9]=this.pb_udi
end on

on w_liste_patient_tracabilite.destroy
call super::destroy
destroy(this.st_4)
destroy(this.st_5)
destroy(this.st_6)
destroy(this.dw_fournisseur)
destroy(this.em_code_produit)
destroy(this.em_numero)
destroy(this.st_1)
destroy(this.sle_identifiant_udi)
destroy(this.pb_udi)
end on

event open;call super::open;dw_fournisseur.settransobject(sqlca)
dw_fournisseur.insertrow(0)

select_initial = dw_liste.Describe("datawindow.table.select")

end event

type p_fond from w_liste_fournisseur_hitparade`p_fond within w_liste_patient_tracabilite
end type

type cb_imprimer from w_liste_fournisseur_hitparade`cb_imprimer within w_liste_patient_tracabilite
end type

type cb_autre from w_liste_fournisseur_hitparade`cb_autre within w_liste_patient_tracabilite
end type

type cb_ecran from w_liste_fournisseur_hitparade`cb_ecran within w_liste_patient_tracabilite
end type

type cb_fermer from w_liste_fournisseur_hitparade`cb_fermer within w_liste_patient_tracabilite
end type

event cb_fermer::clicked;fermer_fenetre(parent)
end event

type st_3 from w_liste_fournisseur_hitparade`st_3 within w_liste_patient_tracabilite
integer y = 656
end type

type st_2 from w_liste_fournisseur_hitparade`st_2 within w_liste_patient_tracabilite
integer y = 656
end type

type cb_lien_word from w_liste_fournisseur_hitparade`cb_lien_word within w_liste_patient_tracabilite
end type

type dw_liste from w_liste_fournisseur_hitparade`dw_liste within w_liste_patient_tracabilite
string dataobject = "dw_impr_liste_patient_traca"
end type

event dw_liste::rbuttondown;call super::rbuttondown;if row > 0 then
	This.SelectRow(0,False)
	This.SelectRow(row,True)
	This.setrow(row)
	OpenMenuPatient_Listes(this)
end if
end event

type uo_size from w_liste_fournisseur_hitparade`uo_size within w_liste_patient_tracabilite
end type

type dw_prati from w_liste_fournisseur_hitparade`dw_prati within w_liste_patient_tracabilite
end type

type rb_un from w_liste_fournisseur_hitparade`rb_un within w_liste_patient_tracabilite
end type

type rb_tous from w_liste_fournisseur_hitparade`rb_tous within w_liste_patient_tracabilite
end type

type em_nb from w_liste_fournisseur_hitparade`em_nb within w_liste_patient_tracabilite
end type

type dw_1 from w_liste_fournisseur_hitparade`dw_1 within w_liste_patient_tracabilite
end type

type em_date_min from w_liste_fournisseur_hitparade`em_date_min within w_liste_patient_tracabilite
integer y = 644
end type

type em_date_max from w_liste_fournisseur_hitparade`em_date_max within w_liste_patient_tracabilite
integer y = 644
end type

type gb_1 from w_liste_fournisseur_hitparade`gb_1 within w_liste_patient_tracabilite
end type

type gb_4 from w_liste_fournisseur_hitparade`gb_4 within w_liste_patient_tracabilite
integer y = 516
string text = "Date de Pose du Produit"
end type

type st_4 from statictext within w_liste_patient_tracabilite
integer x = 411
integer y = 992
integer width = 402
integer height = 72
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
string facename = "Arial"
long backcolor = 553648127
boolean enabled = false
string text = "Fournisseur"
boolean focusrectangle = false
end type

type st_5 from statictext within w_liste_patient_tracabilite
integer x = 411
integer y = 1136
integer width = 430
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
string facename = "Arial"
long backcolor = 553648127
boolean enabled = false
string text = "Code Produit"
boolean focusrectangle = false
end type

type st_6 from statictext within w_liste_patient_tracabilite
integer x = 411
integer y = 1292
integer width = 462
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
string facename = "Arial"
long backcolor = 553648127
boolean enabled = false
string text = "Numéro de lot"
boolean focusrectangle = false
end type

type dw_fournisseur from datawindow within w_liste_patient_tracabilite
string tag = "no resizeall brush"
integer x = 910
integer y = 984
integer width = 859
integer height = 72
integer taborder = 60
boolean bringtotop = true
string title = "none"
string dataobject = "dw_fournisseur_affich_liste_ddlb"
boolean border = false
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type em_code_produit from editmask within w_liste_patient_tracabilite
integer x = 910
integer y = 1128
integer width = 599
integer height = 80
integer taborder = 70
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = stringmask!
end type

type em_numero from editmask within w_liste_patient_tracabilite
integer x = 910
integer y = 1284
integer width = 599
integer height = 80
integer taborder = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = stringmask!
end type

type st_1 from statictext within w_liste_patient_tracabilite
integer x = 411
integer y = 1456
integer width = 462
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
string facename = "Arial"
long backcolor = 553648127
boolean enabled = false
string text = "Identifiant UDI"
boolean focusrectangle = false
end type

type sle_identifiant_udi from singlelineedit within w_liste_patient_tracabilite
integer x = 905
integer y = 1440
integer width = 695
integer height = 80
integer taborder = 90
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
integer limit = 14
borderstyle borderstyle = stylelowered!
end type

type pb_udi from picturebutton within w_liste_patient_tracabilite
integer x = 1659
integer y = 1428
integer width = 123
integer height = 116
integer taborder = 80
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "lc_gs1.png"
alignment htextalign = left!
string powertiptext = "Scan du code barre pour saisir l~'identifiant UDI et le N° de Lot"
end type

event clicked;sle_identifiant_udi.setfocus()

open(w_udi_lecture)
double  v_code_produit
str_udi v_udi
v_udi = message.PowerObjectParm

if not isnull(v_udi.di) then
	
	// recherche du patient de ce code udi
	select top 1 isnull(code_interne,0) into :v_code_produit 
	from produit where gtin = :v_udi.di ;
	
	if v_code_produit = 0 then 
		Messagebox("ATTENTION","Aucun produit ne correspond à cet identifiant UDI !")
		em_code_produit.text = ""
	else
		em_code_produit.text = string(v_code_produit)
	end if
	
	sle_identifiant_udi.text = v_udi.di
	em_numero.text = v_udi.numero_lot
	cb_ecran.triggerevent(clicked!)
end if
end event

