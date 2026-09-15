$PBExportHeader$w_envoi_vers_money.srw
forward
global type w_envoi_vers_money from w_fenetre_arakis
end type
type uo_1 from resize_fenetre within w_envoi_vers_money
end type
type dw_envoi from datawindow within w_envoi_vers_money
end type
type dw_liste from datawindow within w_envoi_vers_money
end type
type dw_prati from datawindow within w_envoi_vers_money
end type
type cb_rechercher from commandbutton within w_envoi_vers_money
end type
type cb_imprimer from commandbutton within w_envoi_vers_money
end type
type em_da from editmask within w_envoi_vers_money
end type
type cb_3 from commandbutton within w_envoi_vers_money
end type
type cb_lancer from commandbutton within w_envoi_vers_money
end type
type gb_2 from groupbox within w_envoi_vers_money
end type
type gb_1 from groupbox within w_envoi_vers_money
end type
end forward

global type w_envoi_vers_money from w_fenetre_arakis
integer x = 27
integer y = 140
integer width = 2857
integer height = 1540
string title = "Envois des Règlements vers Microsoft Money"
windowtype windowtype = response!
long backcolor = 15780518
uo_1 uo_1
dw_envoi dw_envoi
dw_liste dw_liste
dw_prati dw_prati
cb_rechercher cb_rechercher
cb_imprimer cb_imprimer
em_da em_da
cb_3 cb_3
cb_lancer cb_lancer
gb_2 gb_2
gb_1 gb_1
end type
global w_envoi_vers_money w_envoi_vers_money

event open;call super::open;em_da.text = string(today())
dw_prati.settransobject(SQLCA)
dw_envoi.settransobject(SQLCA)
dw_prati.retrieve()
dw_liste.settransobject(SQLCA)
uo_1.taille(this)
end event

on w_envoi_vers_money.create
int iCurrent
call super::create
this.uo_1=create uo_1
this.dw_envoi=create dw_envoi
this.dw_liste=create dw_liste
this.dw_prati=create dw_prati
this.cb_rechercher=create cb_rechercher
this.cb_imprimer=create cb_imprimer
this.em_da=create em_da
this.cb_3=create cb_3
this.cb_lancer=create cb_lancer
this.gb_2=create gb_2
this.gb_1=create gb_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.uo_1
this.Control[iCurrent+2]=this.dw_envoi
this.Control[iCurrent+3]=this.dw_liste
this.Control[iCurrent+4]=this.dw_prati
this.Control[iCurrent+5]=this.cb_rechercher
this.Control[iCurrent+6]=this.cb_imprimer
this.Control[iCurrent+7]=this.em_da
this.Control[iCurrent+8]=this.cb_3
this.Control[iCurrent+9]=this.cb_lancer
this.Control[iCurrent+10]=this.gb_2
this.Control[iCurrent+11]=this.gb_1
end on

on w_envoi_vers_money.destroy
call super::destroy
destroy(this.uo_1)
destroy(this.dw_envoi)
destroy(this.dw_liste)
destroy(this.dw_prati)
destroy(this.cb_rechercher)
destroy(this.cb_imprimer)
destroy(this.em_da)
destroy(this.cb_3)
destroy(this.cb_lancer)
destroy(this.gb_2)
destroy(this.gb_1)
end on

event resize;uo_1.retaille(this)
end event

type p_fond from w_fenetre_arakis`p_fond within w_envoi_vers_money
end type

type uo_1 from resize_fenetre within w_envoi_vers_money
boolean visible = false
integer x = 1019
integer y = 440
integer taborder = 21
long backcolor = 1090519039
end type

on uo_1.destroy
call resize_fenetre::destroy
end on

type dw_envoi from datawindow within w_envoi_vers_money
boolean visible = false
integer x = 302
integer y = 656
integer width = 494
integer height = 360
integer taborder = 30
string dataobject = "dw_envoi_money"
boolean livescroll = true
end type

type dw_liste from datawindow within w_envoi_vers_money
boolean visible = false
integer x = 37
integer y = 16
integer width = 2793
integer height = 1248
integer taborder = 60
string dataobject = "dw_liste_envoi_money"
boolean vscrollbar = true
boolean livescroll = true
end type

type dw_prati from datawindow within w_envoi_vers_money
string tag = "no resizeall brush"
integer x = 233
integer y = 124
integer width = 864
integer height = 76
integer taborder = 20
string dataobject = "dw_cherche_prati"
boolean border = false
boolean livescroll = true
end type

type cb_rechercher from commandbutton within w_envoi_vers_money
integer x = 297
integer y = 1292
integer width = 398
integer height = 128
integer taborder = 100
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Rechercher"
boolean cancel = true
boolean default = true
end type

event clicked;string var_pra
date date_max

var_pra = dw_prati.getitemstring(dw_prati.getrow(),"code")

date_max = date(em_da.text)

		ok_mdp = false

	  SELECT "prati"."pasfin"  
	    INTO :pasfin  
	    FROM "prati"  
	   WHERE ( "prati"."code" = :var_pra ) ;

		guo_fenetre_modale.wf_ouvrir(w_mot_passe_financier)

	if ok_mdp then
	
		open(w_patience)

		dw_liste.retrieve(var_pra,date_max)

		close(w_patience)

	if dw_liste.rowcount() > 0 then

		this.enabled = false
		dw_liste.visible = true
		cb_lancer.enabled = true
		cb_imprimer.enabled = true
	else
		Messagebox("ATTENTION !","Il n'y a aucun règlement à transférer !")
	end if


	end if

end event

type cb_imprimer from commandbutton within w_envoi_vers_money
integer x = 768
integer y = 1292
integer width = 384
integer height = 128
integer taborder = 90
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean enabled = false
string text = "&Imprimer"
end type

on clicked;dw_liste.print()
end on

type em_da from editmask within w_envoi_vers_money
integer x = 1787
integer y = 120
integer width = 517
integer height = 100
integer taborder = 10
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "dd/mm/yyyy"
boolean spin = true
double increment = 1
string minmax = "~~"
end type

type cb_3 from commandbutton within w_envoi_vers_money
integer x = 2011
integer y = 1288
integer width = 384
integer height = 128
integer taborder = 80
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Fermer"
end type

event clicked;fermer_fenetre(parent)

end event

type cb_lancer from commandbutton within w_envoi_vers_money
integer x = 1262
integer y = 1292
integer width = 384
integer height = 128
integer taborder = 70
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean enabled = false
string text = "&Lancer"
end type

event clicked;
if MessageBox("ATTENTION !","1°/ Cette opération va générer le fichier 'C:\POWER\ORTHO\ORTHO.QIF' contenant les écritures à envoyer vers Microsoft Money.~n~n2°/ Vous allez écraser le transfert précédent.~n~n3°/ Cette opération est~nABSOLUMENT IRREMEDIABLE !~n~nConfirmez-vous ?",Question!,Yesno!,2) = 1 then

	open(w_patience)

	double tot,cpt
	string l

	tot = dw_liste.rowcount()

	dw_envoi.insertrow(0)
	dw_envoi.setitem(1,"ligne","!Type:Bank")
	
	FOR cpt = 1 TO tot

		// Date
		dw_envoi.insertrow(0)
		L = "D" + string(dw_liste.getitemdate(cpt,"paye_date"),"dd/mm/yy")		
		dw_envoi.setitem(dw_envoi.rowcount(),"ligne",l)

		// Montant
		dw_envoi.insertrow(0)
		L = "T" + string(dw_liste.getitemnumber(cpt,"paye_montant"),"#######0.00")		
		dw_envoi.setitem(dw_envoi.rowcount(),"ligne",l)

		// Tiers
		dw_envoi.insertrow(0)
		L = "P" + dw_liste.getitemstring(cpt,"paye_payeur")
		dw_envoi.setitem(dw_envoi.rowcount(),"ligne",l)

		// Compte - Catégorie
		dw_envoi.insertrow(0)
		L = "LRecettes Cabinet"
		dw_envoi.setitem(dw_envoi.rowcount(),"ligne",l)

		// Fin de l'écriture
		dw_envoi.insertrow(0)
		L = "^"
		dw_envoi.setitem(dw_envoi.rowcount(),"ligne",l)

		dw_liste.setitem(cpt,"paye_transfert",today())

	NEXT


	close(w_patience)


	if dw_envoi.SaveAs("c:\power\ORTHO\ORTHO.QIF",Text!,false) = 1 then

		if dw_liste.update() = 1 then
			commit ;
			MessageBox("ATTENTION !","L'envoi a été réalisé avec succès !")
			fermer_fenetre(parent)
		else
			MessageBox("ATTENTION !","Une erreur N°1 est survenue durant l'envoi.~nIl n'a pas été effectué avec succés !")	
			Rollback ;
		end if
	else
		MessageBox("ATTENTION !","Une erreur N°2 est survenue durant l'envoi.~nIl n'a pas été effectué avec succés !")	
	end if


end if


end event

type gb_2 from groupbox within w_envoi_vers_money
integer x = 1449
integer y = 20
integer width = 1253
integer height = 236
integer taborder = 40
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean italic = true
long textcolor = 33554432
long backcolor = 15780518
string text = "Règlements jusqu~'au"
end type

type gb_1 from groupbox within w_envoi_vers_money
integer x = 123
integer y = 20
integer width = 1253
integer height = 236
integer taborder = 50
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean italic = true
long textcolor = 33554432
long backcolor = 15780518
string text = "Praticien"
end type

