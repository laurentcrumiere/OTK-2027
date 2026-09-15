$PBExportHeader$w_efacturation_belgique_factures_un_envoi.srw
forward
global type w_efacturation_belgique_factures_un_envoi from w_fenetre_arakis
end type
type cb_fermer from uo_picturebutton_390x120_fermer within w_efacturation_belgique_factures_un_envoi
end type
type uo_size from resize_fenetre within w_efacturation_belgique_factures_un_envoi
end type
type em_nb from editmask within w_efacturation_belgique_factures_un_envoi
end type
type dw_oa from datawindow within w_efacturation_belgique_factures_un_envoi
end type
type ddlb_statuts from dropdownlistbox within w_efacturation_belgique_factures_un_envoi
end type
type dw_prati from datawindow within w_efacturation_belgique_factures_un_envoi
end type
type dw_liste from u_basedw within w_efacturation_belgique_factures_un_envoi
end type
end forward

global type w_efacturation_belgique_factures_un_envoi from w_fenetre_arakis
integer x = 27
integer y = 200
integer width = 3753
integer height = 2108
string title = "eFactures d~'un Envoi"
boolean minbox = false
boolean maxbox = false
boolean resizable = false
windowtype windowtype = response!
boolean center = true
cb_fermer cb_fermer
uo_size uo_size
em_nb em_nb
dw_oa dw_oa
ddlb_statuts ddlb_statuts
dw_prati dw_prati
dw_liste dw_liste
end type
global w_efacturation_belgique_factures_un_envoi w_efacturation_belgique_factures_un_envoi

type variables
string v_code_oa, v_code_praticien
date v_date_envoi

end variables

on w_efacturation_belgique_factures_un_envoi.create
int iCurrent
call super::create
this.cb_fermer=create cb_fermer
this.uo_size=create uo_size
this.em_nb=create em_nb
this.dw_oa=create dw_oa
this.ddlb_statuts=create ddlb_statuts
this.dw_prati=create dw_prati
this.dw_liste=create dw_liste
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_fermer
this.Control[iCurrent+2]=this.uo_size
this.Control[iCurrent+3]=this.em_nb
this.Control[iCurrent+4]=this.dw_oa
this.Control[iCurrent+5]=this.ddlb_statuts
this.Control[iCurrent+6]=this.dw_prati
this.Control[iCurrent+7]=this.dw_liste
end on

on w_efacturation_belgique_factures_un_envoi.destroy
call super::destroy
destroy(this.cb_fermer)
destroy(this.uo_size)
destroy(this.em_nb)
destroy(this.dw_oa)
destroy(this.ddlb_statuts)
destroy(this.dw_prati)
destroy(this.dw_liste)
end on

event open;call super::open;string ls_sous_titre, ls_nom_praticien, ls_nom_oa
integer li_numero_envoi

v_code_praticien  = param_win[1]
v_code_oa  = param_win[2]
v_date_envoi  = date(param_win[3])


open(w_patience)
select top 1 nom + ' ' + isnull(prenom, '') into :ls_nom_praticien from prati where code = :v_code_praticien ;
select top 1 nom  into :ls_nom_oa from organismes_assureurs_belgique where code = :v_code_oa ;
select top 1 numero_envoi  into :li_numero_envoi from envoi_efacture_belgique where code_praticien = :v_code_praticien and code_oa = :v_code_oa and date_envoi = :v_date_envoi ;

ls_sous_titre = "Envoi N°" + string(li_numero_envoi) +" du " + string(v_date_envoi) + " pour " + ls_nom_praticien + " vers " + ls_nom_oa


dw_liste.modify("sous_titre.text = '" + ls_sous_titre + "'")
dw_liste.settransobject(sqlca)
dw_liste.retrieve(v_code_praticien, v_code_oa, v_date_envoi)


close(w_patience)

end event

event resize;

uo_size.retaille(this)


end event

type p_fond from w_fenetre_arakis`p_fond within w_efacturation_belgique_factures_un_envoi
end type

type cb_fermer from uo_picturebutton_390x120_fermer within w_efacturation_belgique_factures_un_envoi
integer x = 1463
integer y = 1864
integer width = 567
integer taborder = 10
end type

event clicked;close(parent)
end event

type uo_size from resize_fenetre within w_efacturation_belgique_factures_un_envoi
boolean visible = false
integer x = 2235
integer y = 580
integer taborder = 20
end type

on uo_size.destroy
call resize_fenetre::destroy
end on

type em_nb from editmask within w_efacturation_belgique_factures_un_envoi
boolean visible = false
integer x = 23
integer y = 1700
integer width = 498
integer height = 100
integer taborder = 30
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean italic = true
long backcolor = 12632256
boolean enabled = false
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = stringmask!
string mask = "XXXXXXXXXXXXXXXXXXXX"
end type

type dw_oa from datawindow within w_efacturation_belgique_factures_un_envoi
string tag = "position brush"
boolean visible = false
integer x = 809
integer y = 604
integer width = 1966
integer height = 76
integer taborder = 110
boolean bringtotop = true
string dataobject = "dw_cherche_organismes_assureurs_belgique_ddlb"
boolean border = false
end type

type ddlb_statuts from dropdownlistbox within w_efacturation_belgique_factures_un_envoi
boolean visible = false
integer x = 763
integer y = 928
integer width = 1198
integer height = 588
integer taborder = 70
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
boolean sorted = false
string item[] = {"Non envoyées","Envoyées","A renvoyer","Validées par myCarenet","Rejetées par myCarenet","Non envoyées + A renvoyer"}
borderstyle borderstyle = stylelowered!
end type

type dw_prati from datawindow within w_efacturation_belgique_factures_un_envoi
string tag = "position brush"
boolean visible = false
integer x = 1079
integer y = 252
integer width = 859
integer height = 72
integer taborder = 120
boolean bringtotop = true
string dataobject = "dw_cherche_prati"
boolean border = false
end type

type dw_liste from u_basedw within w_efacturation_belgique_factures_un_envoi
event ue_leftbuttonup pbm_dwnlbuttonup
integer x = 23
integer y = 20
integer width = 3707
integer height = 1824
integer taborder = 40
boolean bringtotop = true
string dataobject = "dw_efacturation_belgique_factures_un_envoi"
borderstyle borderstyle = stylebox!
end type

event rbuttondown;if row > 0 then
	This.SelectRow(0,False)
	This.SelectRow(row,True)
	This.setrow(row)
	OpenMenuPatient_Listes(this)
end if
end event

event retrieverow;call super::retrieverow;
//if mod(row , 10) = 0 then 
//	// pour voir l'animation de patience !!!
//	yield()
//end if
end event

event doubleclicked;call super::doubleclicked;

// double clic, comme dans la salle d'attente !!
//
//if row > 0 then
//
//	var_code 				= 	this.getitemnumber(row,"code")
//	var_numero_dossier 	= 	this.getitemnumber(row,"numero_dossier")
//	var_nom 				= this.getitemstring(row,"nom")
//	var_nomp 				= ""
//	var_pay 					= ""
//	var_moul 				= ""
//
//	ouverture_salle_attente()
//end if
//

// Ouverture de la facture !

long l_numero_facture

l_numero_facture = this.getitemnumber(row,"efacture_belgique_numero_facture")

// Consultation de la facture
param_win[1] = "C"
// type de facture
param_win[2] = this.getitemString(row,"efacture_belgique_type_facture")
openwithparm(w_efacturation_belgique_maj, l_numero_facture)
end event

