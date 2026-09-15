$PBExportHeader$w_efacturation_belgique_ajout_envoi.srw
forward
global type w_efacturation_belgique_ajout_envoi from w_fenetre_arakis
end type
type cb_ajouter from uo_picturebutton_390x120 within w_efacturation_belgique_ajout_envoi
end type
type cb_annuler from uo_picturebutton_390x120 within w_efacturation_belgique_ajout_envoi
end type
type dw_liste from datawindow within w_efacturation_belgique_ajout_envoi
end type
type st_1 from statictext within w_efacturation_belgique_ajout_envoi
end type
type dw_oa from datawindow within w_efacturation_belgique_ajout_envoi
end type
type st_2 from statictext within w_efacturation_belgique_ajout_envoi
end type
type em_numero from editmask within w_efacturation_belgique_ajout_envoi
end type
type dw_prati from datawindow within w_efacturation_belgique_ajout_envoi
end type
type st_3 from statictext within w_efacturation_belgique_ajout_envoi
end type
type cb_ajouter_tous from uo_picturebutton_390x120 within w_efacturation_belgique_ajout_envoi
end type
type dw_oa_liste from datawindow within w_efacturation_belgique_ajout_envoi
end type
end forward

global type w_efacturation_belgique_ajout_envoi from w_fenetre_arakis
integer width = 2597
integer height = 2000
string title = "Ajout d~'envoi eFacturation fictifs"
boolean center = true
cb_ajouter cb_ajouter
cb_annuler cb_annuler
dw_liste dw_liste
st_1 st_1
dw_oa dw_oa
st_2 st_2
em_numero em_numero
dw_prati dw_prati
st_3 st_3
cb_ajouter_tous cb_ajouter_tous
dw_oa_liste dw_oa_liste
end type
global w_efacturation_belgique_ajout_envoi w_efacturation_belgique_ajout_envoi

on w_efacturation_belgique_ajout_envoi.create
int iCurrent
call super::create
this.cb_ajouter=create cb_ajouter
this.cb_annuler=create cb_annuler
this.dw_liste=create dw_liste
this.st_1=create st_1
this.dw_oa=create dw_oa
this.st_2=create st_2
this.em_numero=create em_numero
this.dw_prati=create dw_prati
this.st_3=create st_3
this.cb_ajouter_tous=create cb_ajouter_tous
this.dw_oa_liste=create dw_oa_liste
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_ajouter
this.Control[iCurrent+2]=this.cb_annuler
this.Control[iCurrent+3]=this.dw_liste
this.Control[iCurrent+4]=this.st_1
this.Control[iCurrent+5]=this.dw_oa
this.Control[iCurrent+6]=this.st_2
this.Control[iCurrent+7]=this.em_numero
this.Control[iCurrent+8]=this.dw_prati
this.Control[iCurrent+9]=this.st_3
this.Control[iCurrent+10]=this.cb_ajouter_tous
this.Control[iCurrent+11]=this.dw_oa_liste
end on

on w_efacturation_belgique_ajout_envoi.destroy
call super::destroy
destroy(this.cb_ajouter)
destroy(this.cb_annuler)
destroy(this.dw_liste)
destroy(this.st_1)
destroy(this.dw_oa)
destroy(this.st_2)
destroy(this.em_numero)
destroy(this.dw_prati)
destroy(this.st_3)
destroy(this.cb_ajouter_tous)
destroy(this.dw_oa_liste)
end on

event open;call super::open;

dw_liste.settransobject(sqlca)
dw_liste.retrieve()

dw_oa.settransobject(sqlca)
dw_oa.retrieve()

dw_prati.settransobject(sqlca)
dw_prati.retrieve()

dw_oa_liste.settransobject(sqlca)
dw_oa_liste.retrieve()

if version_ce_logiciel < "36.90" then 
	cb_ajouter_tous.visible = false
end if


end event

type p_fond from w_fenetre_arakis`p_fond within w_efacturation_belgique_ajout_envoi
end type

type cb_ajouter from uo_picturebutton_390x120 within w_efacturation_belgique_ajout_envoi
integer x = 859
integer y = 1656
integer width = 631
integer taborder = 10
boolean bringtotop = true
string text = "Ajouter"
string iconname = "ACTIONS_enregistrer.png"
end type

event clicked;call super::clicked;

if messagebox("CONFIRMATION", "Confirmez vous l'ajout de cet envoi fictif ?", Question!, YesNo!, 2) = 1 then 
	
	string v_code_oa , v_code_praticien
	integer v_numero_max, v_numero_a_ajouter
	date v_hier
	
	v_code_oa = string(dw_oa.getitemNumber(1, "code"))
	v_code_praticien = dw_prati.getitemstring(1, "code")
	v_numero_a_ajouter = integer(em_numero.text)
	v_hier = relativedate(today(), -1)
	
	select max(numero_envoi) into :v_numero_max from envoi_efacture_belgique 
	where year(date_envoi) = year(today(*)) and envoi_efacture_belgique.code_oa = :v_code_oa and code_praticien = :v_code_praticien ; 
	
	if v_numero_a_ajouter <= v_numero_max then 
		Messagebox("ERREUR", "Ajout impossible : le numéro à ajouter (" + string(v_numero_a_ajouter) +   ") est plus petit que le numéro max actuel (" + string(v_numero_max)+") pour l'OA N°"+ v_code_OA+ " et le praticien de code " + v_code_praticien + " !")
	else
		
		// Ajout effectif de l'envoi 
		insert into envoi_efacture_belgique  ("code_praticien", "code_oa", "numero_envoi", "date_envoi", "statut_envoi", "nom_contact")
		values (:v_code_praticien, :v_code_oa, :v_numero_a_ajouter, :v_hier, 'E', 'FICTIF') ;
		
		if sqlca.sqlcode = 0 then 
			commit ;
			Messagebox("INFORMATION", "L'envoi a été ajouté avec succés !")
			dw_liste.retrieve()
		else
			Messagebox("ATTENTION", "Erreur dans la mémorisation de l'envoi :~n~n" + sqlca.sqlerrtext)
			rollback ; 
		end if
	end if
	
	
end if
end event

type cb_annuler from uo_picturebutton_390x120 within w_efacturation_belgique_ajout_envoi
integer x = 224
integer y = 1656
integer width = 567
integer taborder = 20
boolean bringtotop = true
string text = "Annuler"
string iconname = "ACTIONS_sortir.png"
end type

event clicked;call super::clicked;close(parent)
end event

type dw_liste from datawindow within w_efacturation_belgique_ajout_envoi
integer x = 41
integer y = 24
integer width = 2409
integer height = 1268
integer taborder = 10
boolean bringtotop = true
string title = "none"
string dataobject = "dw_efacture_belgique_ajout_envoi"
boolean vscrollbar = true
boolean livescroll = true
end type

type st_1 from statictext within w_efacturation_belgique_ajout_envoi
integer x = 69
integer y = 1352
integer width = 325
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
string text = "Code OA :"
alignment alignment = right!
boolean focusrectangle = false
end type

type dw_oa from datawindow within w_efacturation_belgique_ajout_envoi
string tag = "position brush"
integer x = 494
integer y = 1352
integer width = 1979
integer height = 76
integer taborder = 120
boolean bringtotop = true
string dataobject = "dw_cherche_organismes_assureurs_belgique_ddlb"
boolean border = false
end type

type st_2 from statictext within w_efacturation_belgique_ajout_envoi
integer x = 1719
integer y = 1472
integer width = 325
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
string text = "N° Envoi :"
alignment alignment = right!
boolean focusrectangle = false
end type

type em_numero from editmask within w_efacturation_belgique_ajout_envoi
integer x = 2144
integer y = 1456
integer width = 297
integer height = 88
integer taborder = 130
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
string mask = "##0"
boolean spin = true
end type

type dw_prati from datawindow within w_efacturation_belgique_ajout_envoi
string tag = "position brush"
integer x = 494
integer y = 1472
integer width = 859
integer height = 76
integer taborder = 130
boolean bringtotop = true
string dataobject = "dw_cherche_prati"
boolean border = false
end type

type st_3 from statictext within w_efacturation_belgique_ajout_envoi
integer x = 69
integer y = 1472
integer width = 325
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
string text = "Praticien :"
alignment alignment = right!
boolean focusrectangle = false
end type

type cb_ajouter_tous from uo_picturebutton_390x120 within w_efacturation_belgique_ajout_envoi
integer x = 1559
integer y = 1656
integer width = 631
integer taborder = 20
boolean bringtotop = true
string text = "Ajouter tous OA"
string iconname = "ACTIONS_enregistrer.png"
end type

event clicked;call super::clicked;

if messagebox("CONFIRMATION", "Confirmez vous l'ajout de cet envoi fictif POUR TOUS LES OA ?", Question!, YesNo!, 2) = 1 then 
	
	string v_code_oa , v_code_praticien
	integer v_numero_max, v_numero_a_ajouter
	date v_hier
	long lig, tot
	
	v_code_praticien = dw_prati.getitemstring(1, "code")
	v_numero_a_ajouter = integer(em_numero.text)
	v_hier = relativedate(today(), -1)
	
	tot = dw_oa_liste.rowcount()
	
	for lig = 1 to tot 
	
		v_code_oa = string(dw_oa_liste.getitemNumber(lig, "code"))
	
		
		select max(numero_envoi) into :v_numero_max from envoi_efacture_belgique 
		where year(date_envoi) = year(today(*)) and envoi_efacture_belgique.code_oa = :v_code_oa and code_praticien = :v_code_praticien ; 
		
		if v_numero_a_ajouter <= v_numero_max then 
			Messagebox("ERREUR", "Ajout impossible : le numéro à ajouter (" + string(v_numero_a_ajouter) +   ") est plus petit que le numéro max actuel (" + string(v_numero_max)+") pour l'OA N°"+ v_code_OA+ " et le praticien de code " + v_code_praticien + " !")
		else
			
			// Ajout effectif de l'envoi 
			insert into envoi_efacture_belgique  ("code_praticien", "code_oa", "numero_envoi", "date_envoi", "statut_envoi", "nom_contact")
			values (:v_code_praticien, :v_code_oa, :v_numero_a_ajouter, :v_hier, 'E', 'FICTIF') ;
			
			if sqlca.sqlcode = 0 then 
				commit ;
			else
				Messagebox("ATTENTION", "Erreur dans la mémorisation de l'envoi :~n~n" + sqlca.sqlerrtext)
				rollback ; 
			end if
		end if
	next
	
	dw_liste.retrieve()
	
end if
end event

type dw_oa_liste from datawindow within w_efacturation_belgique_ajout_envoi
boolean visible = false
integer x = 1193
integer y = 828
integer width = 686
integer height = 400
integer taborder = 20
boolean bringtotop = true
string title = "none"
string dataobject = "dw_organismes_assureurs_belgique_envois_ddlb"
boolean border = false
boolean livescroll = true
end type

