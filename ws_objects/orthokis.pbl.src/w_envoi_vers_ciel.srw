$PBExportHeader$w_envoi_vers_ciel.srw
forward
global type w_envoi_vers_ciel from w_fenetre_arakis
end type
type sle_pourcent from singlelineedit within w_envoi_vers_ciel
end type
type rb_jour from radiobutton within w_envoi_vers_ciel
end type
type rb_regl from radiobutton within w_envoi_vers_ciel
end type
type st_2 from statictext within w_envoi_vers_ciel
end type
type sle_recettes from singlelineedit within w_envoi_vers_ciel
end type
type uo_1 from resize_fenetre within w_envoi_vers_ciel
end type
type dw_envoi from datawindow within w_envoi_vers_ciel
end type
type dw_liste from datawindow within w_envoi_vers_ciel
end type
type dw_prati from datawindow within w_envoi_vers_ciel
end type
type cb_rechercher from commandbutton within w_envoi_vers_ciel
end type
type cb_imprimer from commandbutton within w_envoi_vers_ciel
end type
type em_da from editmask within w_envoi_vers_ciel
end type
type cb_3 from commandbutton within w_envoi_vers_ciel
end type
type cb_lancer from commandbutton within w_envoi_vers_ciel
end type
type gb_2 from groupbox within w_envoi_vers_ciel
end type
type gb_1 from groupbox within w_envoi_vers_ciel
end type
type gb_3 from groupbox within w_envoi_vers_ciel
end type
type gb_ciel from groupbox within w_envoi_vers_ciel
end type
end forward

global type w_envoi_vers_ciel from w_fenetre_arakis
integer x = 27
integer y = 140
integer width = 3657
integer height = 1952
string title = "Envois des Règlements vers Ciel Compta Libérale"
windowtype windowtype = response!
long backcolor = 15780518
sle_pourcent sle_pourcent
rb_jour rb_jour
rb_regl rb_regl
st_2 st_2
sle_recettes sle_recettes
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
gb_3 gb_3
gb_ciel gb_ciel
end type
global w_envoi_vers_ciel w_envoi_vers_ciel

event open;call super::open;em_da.text = string(today())
dw_prati.settransobject(SQLCA)
dw_envoi.settransobject(SQLCA)
dw_prati.retrieve()
dw_liste.settransobject(SQLCA)
uo_1.taille(this)

// Paramètres de la dernière fois ....
sle_recettes.text =  profilestring(dir_ini+inifile_orthokis,"Ciel","recettes","01")  


string ecritures 
ecritures =  profilestring(dir_ini+inifile_orthokis,"Ciel","ecritures","R")  
if ecritures = 'R' then
	rb_regl.checked = true
else
	rb_jour.checked = true
end if



//sle_banque.text =  profilestring(dir_ini+inifile_orthokis,"Ciel","banque","BAN")  


end event

on w_envoi_vers_ciel.create
int iCurrent
call super::create
this.sle_pourcent=create sle_pourcent
this.rb_jour=create rb_jour
this.rb_regl=create rb_regl
this.st_2=create st_2
this.sle_recettes=create sle_recettes
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
this.gb_3=create gb_3
this.gb_ciel=create gb_ciel
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.sle_pourcent
this.Control[iCurrent+2]=this.rb_jour
this.Control[iCurrent+3]=this.rb_regl
this.Control[iCurrent+4]=this.st_2
this.Control[iCurrent+5]=this.sle_recettes
this.Control[iCurrent+6]=this.uo_1
this.Control[iCurrent+7]=this.dw_envoi
this.Control[iCurrent+8]=this.dw_liste
this.Control[iCurrent+9]=this.dw_prati
this.Control[iCurrent+10]=this.cb_rechercher
this.Control[iCurrent+11]=this.cb_imprimer
this.Control[iCurrent+12]=this.em_da
this.Control[iCurrent+13]=this.cb_3
this.Control[iCurrent+14]=this.cb_lancer
this.Control[iCurrent+15]=this.gb_2
this.Control[iCurrent+16]=this.gb_1
this.Control[iCurrent+17]=this.gb_3
this.Control[iCurrent+18]=this.gb_ciel
end on

on w_envoi_vers_ciel.destroy
call super::destroy
destroy(this.sle_pourcent)
destroy(this.rb_jour)
destroy(this.rb_regl)
destroy(this.st_2)
destroy(this.sle_recettes)
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
destroy(this.gb_3)
destroy(this.gb_ciel)
end on

event resize;uo_1.retaille(this)
end event

type p_fond from w_fenetre_arakis`p_fond within w_envoi_vers_ciel
end type

type sle_pourcent from singlelineedit within w_envoi_vers_ciel
integer x = 2391
integer y = 1552
integer width = 951
integer height = 112
integer taborder = 50
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 81324524
borderstyle borderstyle = stylelowered!
end type

type rb_jour from radiobutton within w_envoi_vers_ciel
integer x = 1138
integer y = 1728
integer width = 640
integer height = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean italic = true
long textcolor = 33554432
long backcolor = 15780518
string text = "par Jour (totalisation)"
end type

type rb_regl from radiobutton within w_envoi_vers_ciel
integer x = 1143
integer y = 1640
integer width = 466
integer height = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean italic = true
long textcolor = 33554432
long backcolor = 15780518
string text = "par Règlement"
end type

type st_2 from statictext within w_envoi_vers_ciel
integer x = 27
integer y = 1668
integer width = 288
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 15780518
string text = "Recettes :"
boolean focusrectangle = false
end type

type sle_recettes from singlelineedit within w_envoi_vers_ciel
integer x = 311
integer y = 1656
integer width = 709
integer height = 92
integer taborder = 120
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
integer limit = 8
borderstyle borderstyle = stylelowered!
end type

type uo_1 from resize_fenetre within w_envoi_vers_ciel
boolean visible = false
integer x = 1595
integer y = 460
integer taborder = 21
long backcolor = 1090519039
end type

on uo_1.destroy
call resize_fenetre::destroy
end on

type dw_envoi from datawindow within w_envoi_vers_ciel
boolean visible = false
integer x = 302
integer y = 656
integer width = 494
integer height = 360
integer taborder = 30
string dataobject = "dw_envoi_ciel"
boolean livescroll = true
end type

type dw_liste from datawindow within w_envoi_vers_ciel
boolean visible = false
integer x = 69
integer y = 20
integer width = 3479
integer height = 1512
integer taborder = 60
string dataobject = "dw_liste_envoi_money"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type dw_prati from datawindow within w_envoi_vers_ciel
string tag = "no resizeall brush "
integer x = 576
integer y = 132
integer width = 864
integer height = 80
integer taborder = 20
string dataobject = "dw_cherche_prati"
boolean border = false
boolean livescroll = true
end type

type cb_rechercher from commandbutton within w_envoi_vers_ciel
integer x = 1984
integer y = 1676
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

type cb_imprimer from commandbutton within w_envoi_vers_ciel
integer x = 2400
integer y = 1676
integer width = 398
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

type em_da from editmask within w_envoi_vers_ciel
integer x = 2126
integer y = 128
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

type cb_3 from commandbutton within w_envoi_vers_ciel
integer x = 3232
integer y = 1676
integer width = 398
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

type cb_lancer from commandbutton within w_envoi_vers_ciel
integer x = 2816
integer y = 1676
integer width = 398
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
if MessageBox("ATTENTION !","1°/ Cette opération va générer le fichier 'C:\POWER\ORTHO\ORTCIEL.TXT' contenant les écritures à envoyer vers Ciel Compta Libérale.~n~n2°/ Vous allez écraser le transfert précédent.~n~n3°/ Cette opération est~nABSOLUMENT IRREMEDIABLE !~n~nConfirmez-vous ?",Question!,Yesno!,2) = 1 then

	open(w_patience)
	sle_pourcent.visible = true

	double tot,cpt, lig
	string m

	tot = dw_liste.rowcount()


	string compte_recettes
	//string compte_banque
	
	compte_recettes = trim(sle_recettes.text)
	
	// Mémorisation des éléments dans le .INI pour la prochaine fois ...
	setprofilestring(dir_ini+inifile_orthokis,"ciel","recettes",compte_recettes)
	if rb_regl.checked then
		setprofilestring(dir_ini+inifile_orthokis,"ciel","ecritures","R")
	else
		setprofilestring(dir_ini+inifile_orthokis,"ciel","ecritures","J")
	end if
	//setprofilestring(dir_ini+inifile_orthokis,"ciel","banque",compte_banque)

	date date_prec, date_cour
	string mode_prec, banque_prec, mode_cour, banque_cour
	double montant
	 


		cpt = 1
		
		do while cpt <= tot
			
			sle_pourcent.text = "Avancement : "+string(cpt)+"/"+string(tot)

			// Ajout de la ligne, sans le montant !!!!
			dw_envoi.insertrow(0)
			lig = dw_envoi.rowcount()
			dw_envoi.setitem(lig,"numero",string(cpt))
			dw_envoi.setitem(lig,"type","R")
			dw_envoi.setitem(lig,"date",string(dw_liste.getitemdate(cpt,"paye_date"),"yyyymmdd"))	
			if rb_regl.checked then
				dw_envoi.setitem(lig,"libelle",dw_liste.getitemstring(cpt,"paye_payeur"))
			else
				dw_envoi.setitem(lig,"libelle","Cumul du "+string(dw_liste.getitemdate(cpt,"paye_date"),"dd/mm/yyyy"))
			end if
			dw_envoi.setitem(lig,"poste",compte_recettes)
			dw_envoi.setitem(lig,"treso",dw_liste.getitemstring(cpt,"banque_compte_comptable"))
			dw_envoi.setitem(lig,"pointe","F")
			dw_envoi.setitem(lig,"attente","F")
			dw_envoi.setitem(lig,"pour","100")
	
			m = dw_liste.getitemstring(cpt,"paye_mode")
			CHOOSE CASE m
				CASE 'C'
					dw_envoi.setitem(lig,"mode","CHQ")
				CASE 'P'
					dw_envoi.setitem(lig,"mode","CCP")
				CASE 'E'
					dw_envoi.setitem(lig,"mode","ESP")
				CASE 'V'
					dw_envoi.setitem(lig,"mode","VIR")
				CASE 'B'
					dw_envoi.setitem(lig,"mode","CB")
				CASE ELSE
					dw_envoi.setitem(lig,"mode","CHQ")
				END CHOOSE
			
				dw_liste.setitem(cpt,"paye_transfert",today())

			
			
			if rb_jour.checked then
				// On calcule, pour 1 mode, 1 banque, 1 jour
				date_prec = dw_liste.getitemdate(cpt,"paye_date")
				mode_prec = dw_liste.getitemstring(cpt,"paye_mode")
				banque_prec = dw_liste.getitemstring(cpt,"banque_compte_comptable")
				
				date_cour = dw_liste.getitemdate(cpt,"paye_date")
				mode_cour = dw_liste.getitemstring(cpt,"paye_mode")
				banque_cour = dw_liste.getitemstring(cpt,"banque_compte_comptable")
				
				
				if isnull(banque_prec) then
					banque_prec = ""
				end if
				if isnull(banque_cour) then
					banque_cour = ""
				end if
				
				
				montant = 0
				
				do while cpt <= tot and date_prec = date_cour and mode_prec = mode_cour and banque_prec = banque_cour
					
					dw_liste.setitem(cpt,"paye_transfert",today())
					
					montant = montant + dw_liste.getitemnumber(cpt,"paye_montant")
					cpt = cpt + 1
					
					if cpt <= tot then
						date_cour = dw_liste.getitemdate(cpt,"paye_date")
						mode_cour = dw_liste.getitemstring(cpt,"paye_mode")
						banque_cour = dw_liste.getitemstring(cpt,"banque_compte_comptable")
					end if
				loop
				
				
			else
				
				montant = dw_liste.getitemnumber(cpt,"paye_montant")
				cpt = cpt + 1
				
			end if
			dw_envoi.setitem(lig,"totht",string(montant,"#########0.00"))		
			dw_envoi.setitem(lig,"totttc",string(montant,"#########0.00"))		
	
		loop

	sle_pourcent.visible = false
	close(w_patience)


	if dw_envoi.SaveAs("c:\power\ORTHO\ORTCIEL.txt",Text!,false) = 1 then

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

type gb_2 from groupbox within w_envoi_vers_ciel
integer x = 1792
integer y = 28
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

type gb_1 from groupbox within w_envoi_vers_ciel
integer x = 466
integer y = 28
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

type gb_3 from groupbox within w_envoi_vers_ciel
integer x = 5
integer y = 1568
integer width = 1056
integer height = 248
integer taborder = 110
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean italic = true
long textcolor = 33554432
long backcolor = 15780518
string text = "Paramêtre Ciel (N° de Compte) "
end type

type gb_ciel from groupbox within w_envoi_vers_ciel
integer x = 1083
integer y = 1572
integer width = 850
integer height = 248
integer taborder = 40
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean italic = true
long textcolor = 33554432
long backcolor = 15780518
string text = "Une écriture comptable"
end type

