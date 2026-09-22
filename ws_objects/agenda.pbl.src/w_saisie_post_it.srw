$PBExportHeader$w_saisie_post_it.srw
forward
global type w_saisie_post_it from w_fenetre_arakis
end type
type cb_annuler from uo_picturebutton_390x120 within w_saisie_post_it
end type
type cb_enregistrer from uo_picturebutton_390x120 within w_saisie_post_it
end type
type cb_couleur from uo_picturebutton_390x120 within w_saisie_post_it
end type
type dw_detail from datawindow within w_saisie_post_it
end type
type pb_fermer from uo_picturebutton_390x120 within w_saisie_post_it
end type
type rb_non_repeter from radiobutton within w_saisie_post_it
end type
type rb_repeter_jour from radiobutton within w_saisie_post_it
end type
type rb_repeter_semaine from radiobutton within w_saisie_post_it
end type
type em_date_limite from uo_date_calendrier within w_saisie_post_it
end type
type cb_supprimer from uo_picturebutton_390x120 within w_saisie_post_it
end type
type cb_supprimer_plus from uo_picturebutton_390x120 within w_saisie_post_it
end type
type gb_1 from groupbox within w_saisie_post_it
end type
end forward

global type w_saisie_post_it from w_fenetre_arakis
integer x = 1198
integer y = 716
integer width = 2414
integer height = 1976
string title = "Saisie d~'un Post-it"
windowtype windowtype = response!
boolean center = true
cb_annuler cb_annuler
cb_enregistrer cb_enregistrer
cb_couleur cb_couleur
dw_detail dw_detail
pb_fermer pb_fermer
rb_non_repeter rb_non_repeter
rb_repeter_jour rb_repeter_jour
rb_repeter_semaine rb_repeter_semaine
em_date_limite em_date_limite
cb_supprimer cb_supprimer
cb_supprimer_plus cb_supprimer_plus
gb_1 gb_1
end type
global w_saisie_post_it w_saisie_post_it

type variables
boolean creation 

post_it post_it

// pour repositionnement de la palette de couleur
integer  ii_palette_x = 0
integer ii_palette_y = 0




end variables

on w_saisie_post_it.create
int iCurrent
call super::create
this.cb_annuler=create cb_annuler
this.cb_enregistrer=create cb_enregistrer
this.cb_couleur=create cb_couleur
this.dw_detail=create dw_detail
this.pb_fermer=create pb_fermer
this.rb_non_repeter=create rb_non_repeter
this.rb_repeter_jour=create rb_repeter_jour
this.rb_repeter_semaine=create rb_repeter_semaine
this.em_date_limite=create em_date_limite
this.cb_supprimer=create cb_supprimer
this.cb_supprimer_plus=create cb_supprimer_plus
this.gb_1=create gb_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_annuler
this.Control[iCurrent+2]=this.cb_enregistrer
this.Control[iCurrent+3]=this.cb_couleur
this.Control[iCurrent+4]=this.dw_detail
this.Control[iCurrent+5]=this.pb_fermer
this.Control[iCurrent+6]=this.rb_non_repeter
this.Control[iCurrent+7]=this.rb_repeter_jour
this.Control[iCurrent+8]=this.rb_repeter_semaine
this.Control[iCurrent+9]=this.em_date_limite
this.Control[iCurrent+10]=this.cb_supprimer
this.Control[iCurrent+11]=this.cb_supprimer_plus
this.Control[iCurrent+12]=this.gb_1
end on

on w_saisie_post_it.destroy
call super::destroy
destroy(this.cb_annuler)
destroy(this.cb_enregistrer)
destroy(this.cb_couleur)
destroy(this.dw_detail)
destroy(this.pb_fermer)
destroy(this.rb_non_repeter)
destroy(this.rb_repeter_jour)
destroy(this.rb_repeter_semaine)
destroy(this.em_date_limite)
destroy(this.cb_supprimer)
destroy(this.cb_supprimer_plus)
destroy(this.gb_1)
end on

event open;call super::open;
//Centre la fenetre
//---------------
//centrer(this)

colore_datawindow(dw_detail)

//Recuperation de la structure passe en paramètre
//--------------------------------------
post_it = message.powerobjectparm

//Connexion de la datawindows
//----------------------------------
dw_detail.settransobject(sqlca)

//Retrieve si nouveau a False
//----------------------
dw_detail.retrieve(post_it.date, post_it.code_praticien)

//Si aucun post_it trouvé .. on l'ajoute
//---------------------------------------------------

if dw_detail.rowcount() < 1 then
	// creéation du post it
	creation = true
	dw_detail.insertrow(0)
	dw_detail.setitem(dw_detail.getrow(),"texte",space(1000))
	dw_detail.setitem(dw_detail.getrow(),"date",post_it.date)
	dw_detail.setitem(dw_detail.getrow(),"code_praticien",post_it.code_praticien)
	dw_detail.setitem(dw_detail.getrow(),"couleur",post_it.couleur)
else
	// post it existant
	creation = false
end if

gb_1.backcolor = this.backcolor
rb_non_repeter.backcolor = this.backcolor
rb_repeter_jour.backcolor = this.backcolor
rb_repeter_semaine.backcolor = this.backcolor


// Les boutons selon si modif autorisée ou pas
if not post_it.modif_autorisee then
	pb_fermer.visible = true
	cb_annuler.visible = false
	cb_enregistrer.visible = false
	cb_couleur.visible = false
	rb_non_repeter.enabled = false
	rb_repeter_jour.enabled = false
	rb_repeter_semaine.enabled = false
	dw_detail.tabOrder = 0
end if

em_date_limite.SetDate(post_it.date)

// Quel jour somme nous ? pour le libellé

rb_repeter_semaine.text = "Répéter ce Post-it tous les "+ jour[daynumber( post_it.date)] + "s jusqu'au"





end event

event timer;call super::timer;Timer(0)
fxg_set_position_palette_windows(this, ii_palette_x, ii_palette_y)


end event

type p_fond from w_fenetre_arakis`p_fond within w_saisie_post_it
integer y = 1556
integer width = 329
end type

type cb_annuler from uo_picturebutton_390x120 within w_saisie_post_it
integer x = 937
integer y = 1468
integer width = 567
integer taborder = 20
string text = "&Annuler"
string iconname = "ACTIONS_abandonner.png"
end type

event clicked;call super::clicked;dw_detail.accepttext()


if dw_detail.modifiedcount() > 0 then

	if (trim(dw_detail.getitemstring(dw_detail.getrow(),"texte")) <> ''  and creation) or (trim(dw_detail.getitemstring(dw_detail.getrow(),"texte")) = '' and not creation) Then
	
		If MessageBox("ATTENTION","Vous avez fait des modifications sur le fichier !~n~nVoulez-vous tout de même quitter~ncette fenêtre ?",Question!,YesNo!) = 1 Then
	
			if trim(dw_detail.getitemstring(dw_detail.getrow(),"texte")) = '' then
				// plus de texte => on supprime le post-it
				dw_detail.deleterow(dw_detail.getrow())
				setnull(post_it.texte)
			end if
	
			closewithreturn(parent,post_it)
		end if
	else
		if trim(dw_detail.getitemstring(dw_detail.getrow(),"texte")) = '' then
			// plus de texte => on supprime le post-it
			dw_detail.deleterow(dw_detail.getrow())
			setnull(post_it.texte)
		end if
			closewithreturn(parent,post_it)
	END IF
else
	if trim(dw_detail.getitemstring(dw_detail.getrow(),"texte")) = '' then
		// plus de texte => on supprime le post-it
		dw_detail.deleterow(dw_detail.getrow())
		setnull(post_it.texte)
	end if
			closewithreturn(parent,post_it)
end if
end event

type cb_enregistrer from uo_picturebutton_390x120 within w_saisie_post_it
integer x = 1554
integer y = 1468
integer width = 567
integer taborder = 30
string text = "&Enregistrer"
boolean default = true
string iconname = "ACTIONS_enregistrer.png"
end type

event clicked;call super::clicked;
dw_detail.accepttext()

if trim(dw_detail.getitemstring(dw_detail.getrow(),"texte")) = '' then
	// plus de texte => on supprime le post-it
	dw_detail.deleterow(dw_detail.getrow())
	setnull(post_it.texte)
else
	// On garde la ligne => on renvoie les valeur
	post_it.date = dw_detail.getitemdate(dw_detail.getrow(),"date")
	post_it.couleur = dw_detail.getitemnumber(dw_detail.getrow(),"couleur")
	post_it.texte = dw_detail.getitemstring(dw_detail.getrow(),"texte")
	post_it.code_praticien = dw_detail.getitemstring(dw_detail.getrow(),"code_praticien")
	post_it.alerte_prise_de_rdv = dw_detail.getitemstring(dw_detail.getrow(),"alerte_prise_de_rdv")
	fxg_set_infos_modifs(dw_detail, 1)
end if

if dw_detail.update()=1 then
	commit;
	
	
	if len(trim(post_it.texte)) >0 then
		date v_date_limite, v_date_p
		long lig
		
		v_date_limite = date(em_date_limite.text)
		v_date_p = post_it.date 
		
		// Faut il répéter le post it
		if rb_repeter_jour.checked or  rb_repeter_semaine.checked then
			
		
			// toules les jours ... ou presque
			v_date_p = relativedate(v_date_p, 1)
			do while v_date_p <= v_date_limite 
				
				// pas pour le dimanche ou autres jours si semaines
				if (daynumber(v_date_p) <> 1 and not rb_repeter_semaine.checked) or  (rb_repeter_semaine.checked and daynumber(v_date_p) = daynumber(post_it.date)) then
					dw_detail.insertrow(0)
					lig = dw_detail.rowcount()
					dw_detail.Setitem(lig,"date", v_date_p)
					dw_detail.Setitem(lig,"couleur",post_it.couleur)
					dw_detail.Setitem(lig,"texte", post_it.texte)
					dw_detail.Setitem(lig,"code_praticien", post_it.code_praticien)
					dw_detail.Setitem(lig,"alerte_prise_de_rdv", post_it.alerte_prise_de_rdv)
					fxg_set_infos_modifs(dw_detail, lig)
				end if
				
				v_date_p = relativedate(v_date_p, 1)
			loop 
			if dw_detail.update()=1 then
				commit;
			else
				rollback ;
			end if

		end if
		
	end if
	
	
else
	rollback;
end if

closewithreturn(parent,post_it)


end event

type cb_couleur from uo_picturebutton_390x120 within w_saisie_post_it
integer x = 320
integer y = 1468
integer width = 567
integer taborder = 40
string text = "&Couleur"
string iconname = "Custom073_2!"
end type

event clicked;call super::clicked;long couleur_choisie

if dw_detail.rowcount() > 0 then
	
	couleur_choisie = dw_detail.getitemnumber(dw_detail.getrow(),"couleur")
	
	// Les positions seront utilisées dans le timer de la fenêtre	
	ii_palette_x = unitstopixels( w_mdi_2020.pointerx() , XUnitsToPixels! ) 
	ii_palette_y = unitstopixels( w_mdi_2020.pointery() , YUnitsToPixels! ) 
					
	Timer(0.05)	// pour déclencher le repositionnement de la palette
	
	//Appel de la fenetre couleur et au retour, met la couleur de fond
	//--------------------------------------------------
	if appel_palette(couleur_choisie) then
			dw_detail.accepttext()
			dw_detail.setitem(dw_detail.getrow(),"couleur",couleur_choisie)
	end if
end if
end event

type dw_detail from datawindow within w_saisie_post_it
string tag = "brush"
integer x = 27
integer y = 40
integer width = 2277
integer height = 904
integer taborder = 10
string dataobject = "dw_post_it"
boolean border = false
boolean livescroll = true
end type

event dberror;
if sqldbcode = -193 then
	// pour message plus précis
	son(4)
	MessageBox("Alerte Base de Données","Vous essayez de répeter un post-it sur un jour (ou plusieurs) qui en a déjà un.~n~nAjout annulé !",Information!)
else
	db_erreur(dw_detail,sqldbcode,sqlerrtext)
end if
return 1

end event

type pb_fermer from uo_picturebutton_390x120 within w_saisie_post_it
boolean visible = false
integer x = 937
integer y = 1528
integer width = 603
integer height = 152
integer taborder = 50
boolean bringtotop = true
string text = "&Fermer"
boolean default = true
string iconname = "ACTIONS_fermer.png"
end type

event clicked;call super::clicked;

close(parent)
end event

type rb_non_repeter from radiobutton within w_saisie_post_it
integer x = 160
integer y = 1036
integer width = 745
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Ne pas répéter ce Post-it"
boolean checked = true
end type

event clicked;em_date_limite.visible= false
end event

type rb_repeter_jour from radiobutton within w_saisie_post_it
integer x = 160
integer y = 1136
integer width = 1170
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Répéter ce Post-it tous les jours jusqu~'au"
end type

event clicked;em_date_limite.visible= true
end event

type rb_repeter_semaine from radiobutton within w_saisie_post_it
integer x = 160
integer y = 1236
integer width = 1353
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Répéter ce Post-it tous les jours jusqu~'au          "
end type

event clicked;em_date_limite.visible= true
end event

type em_date_limite from uo_date_calendrier within w_saisie_post_it
boolean visible = false
integer x = 1477
integer y = 1172
integer taborder = 210
boolean bringtotop = true
end type

on em_date_limite.destroy
call uo_date_calendrier::destroy
end on

type cb_supprimer from uo_picturebutton_390x120 within w_saisie_post_it
integer x = 311
integer y = 1644
integer width = 567
integer taborder = 50
boolean bringtotop = true
string text = "Supprimer"
string iconname = "ACTIONS_supprimer.png"
end type

event clicked;call super::clicked;if messagebox("ATTENTION", "Confirmez-vous la suppression de ce post-it ?", Question!, YesNo!, 2) = 1 then 
	dw_detail.deleterow(1)
	cb_enregistrer.postevent(clicked!)
end if
end event

type cb_supprimer_plus from uo_picturebutton_390x120 within w_saisie_post_it
integer x = 937
integer y = 1644
integer width = 567
integer taborder = 60
boolean bringtotop = true
string text = "Supprimer +"
string iconname = "ACTIONS_supprimer.png"
end type

event clicked;call super::clicked;
open(w_post_it_suppression)

if message.doubleparm = 1 then 
	close(parent)
end if
end event

type gb_1 from groupbox within w_saisie_post_it
integer x = 59
integer y = 932
integer width = 2190
integer height = 464
integer taborder = 20
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean italic = true
long textcolor = 33554432
long backcolor = 67108864
string text = "Répétition"
end type

