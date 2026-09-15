$PBExportHeader$w_jours_interdits_suppression_agenda.srw
forward
global type w_jours_interdits_suppression_agenda from w_fenetre_arakis
end type
type cb_enregistrer from uo_picturebutton_390x120 within w_jours_interdits_suppression_agenda
end type
type cb_annuler from uo_picturebutton_390x120 within w_jours_interdits_suppression_agenda
end type
type cb_supprimer from uo_picturebutton_390x120 within w_jours_interdits_suppression_agenda
end type
type dw_liste from datawindow within w_jours_interdits_suppression_agenda
end type
end forward

global type w_jours_interdits_suppression_agenda from w_fenetre_arakis
integer x = 1198
integer y = 716
integer width = 3538
integer height = 1620
string title = "Modification d~'une période interdite"
windowtype windowtype = response!
boolean center = true
cb_enregistrer cb_enregistrer
cb_annuler cb_annuler
cb_supprimer cb_supprimer
dw_liste dw_liste
end type
global w_jours_interdits_suppression_agenda w_jours_interdits_suppression_agenda

type variables
boolean creation 

// pour repositionnement de la palette de couleur
integer  ii_palette_x = 0
integer ii_palette_y = 0



end variables

on w_jours_interdits_suppression_agenda.create
int iCurrent
call super::create
this.cb_enregistrer=create cb_enregistrer
this.cb_annuler=create cb_annuler
this.cb_supprimer=create cb_supprimer
this.dw_liste=create dw_liste
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_enregistrer
this.Control[iCurrent+2]=this.cb_annuler
this.Control[iCurrent+3]=this.cb_supprimer
this.Control[iCurrent+4]=this.dw_liste
end on

on w_jours_interdits_suppression_agenda.destroy
call super::destroy
destroy(this.cb_enregistrer)
destroy(this.cb_annuler)
destroy(this.cb_supprimer)
destroy(this.dw_liste)
end on

event open;call super::open;



colore_datawindow(dw_liste)

//Centre la fenetre
//---------------
//centrer(this)


st_rdv param_rdv


//Recuperation de la structure passe en paramètre
//--------------------------------------
param_rdv = message.powerobjectparm

//Connexion de la datawindows
//----------------------------------
dw_liste.settransobject(sqlca)
 
//string filter
//
//string rdv_da, rdv_he
//
//rdv_da = string(date(param_rdv.date_debut),'yyyy-mm-dd')
//rdv_he = string(time(param_rdv.date_debut),'hh:mm')
//
//filter = "date_debut <= datetime('"+rdv_da+ "', '+  rdv_he+"'    ) "
////filter = "date_debut <= datetime('"+rdv_da+ "','" +rdv_he+"') "
//
////and datetime(" + string(param_rdv.date_debut) + ") <= date_fin "


//messagebox("trace",filter)
//dw_detail.setfilter (filter) 
//


// Ajout du jour ....
dw_liste.retrieve(param_rdv.date_debut, param_rdv.numero_fauteuil, param_rdv.praticien_de, param_rdv.praticien_a)


if dw_liste.rowcount() = 0 then
	Messagebox("ATTENTION !","Aucune période interdite pour ces critères !")
	close(this)
end if
	
end event

event timer;call super::timer;if version_ce_logiciel >= "36.90" then
	Timer(0)
	fxg_set_position_palette_windows(this, ii_palette_x, ii_palette_y)
end if

end event

type p_fond from w_fenetre_arakis`p_fond within w_jours_interdits_suppression_agenda
end type

type cb_enregistrer from uo_picturebutton_390x120 within w_jours_interdits_suppression_agenda
integer x = 2258
integer y = 1272
integer width = 562
integer taborder = 20
string text = "&Enregistrer"
string iconname = "ACTIONS_enregistrer.png"
end type

event clicked;call super::clicked;
dw_liste.accepttext()

boolean ok_suite = true

if dw_liste.rowcount() > 0 then
	// On vérifie s'il y a déjà des rdv à ce moment là !!!!
	long nb
	
	datetime debut, fin
	integer f1,f2
	string prat 
	
	prat = dw_liste.getitemstring(1,"code_praticien")
	
	debut = dw_liste.getitemdatetime(1,"date_debut")
	fin = dw_liste.getitemdatetime(1,"date_fin")
	
	f1 = dw_liste.getitemnumber(1,"fauteuil_debut")
	f2 = dw_liste.getitemnumber(1,"fauteuil_fin")
	
	
	nb = verif_nb_rendez_vous_periode(debut, fin, f1, f2, prat)
	
	ok_suite = false
	
	if nb > 0 then
		if MessageBox("ATTENTION !","Il y a "+string(nb)+" rendez-vous déjà saisis durant cette période pour ce praticien. Confirmez-vous ?",Question!,YesNo!,2) = 1 then
			ok_suite = true
		end if
	else
		ok_suite = true
	end if
end if

if ok_suite then
	if verif_jours_interdit(dw_liste)  then
		if dw_liste.update()=1 then
			commit;
		else
			rollback;
		end if
		close(parent)
	end if
end if



end event

type cb_annuler from uo_picturebutton_390x120 within w_jours_interdits_suppression_agenda
integer x = 1673
integer y = 1272
integer width = 562
integer taborder = 20
string text = "&Annuler"
string iconname = "ACTIONS_abandonner.png"
end type

event clicked;call super::clicked;dw_liste.accepttext()


if dw_liste.modifiedcount() > 0 then

	If MessageBox("ATTENTION","Vous avez fait des modifications sur le fichier !~n~nVoulez-vous tout de même quitter~ncette fenêtre ?",Question!,YesNo!) = 1 Then

		close(parent)
	end if
else
	close(parent)
END IF

end event

type cb_supprimer from uo_picturebutton_390x120 within w_jours_interdits_suppression_agenda
integer x = 1088
integer y = 1272
integer width = 562
integer taborder = 20
string text = "&Supprimer"
string iconname = "ACTIONS_supprimer.png"
end type

event clicked;call super::clicked;if dw_liste.rowcount() > 0 then
	dw_liste.deleterow(dw_liste.getrow())
end if
end event

type dw_liste from datawindow within w_jours_interdits_suppression_agenda
string tag = "brush"
integer x = 32
integer y = 24
integer width = 3438
integer height = 1172
integer taborder = 10
string dataobject = "dw_jours_interdits_suppresion_agenda"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
end type

event dberror;db_erreur(dw_liste,sqldbcode,sqlerrtext)
return 1

end event

event itemchanged;

if row > 0 then
	// informations de modifications
	fxg_set_infos_modifs(this, row)
end if


end event

event rbuttondown;long couleur_choisie

if getcolumn() = 8 then 
	
	// Les positions seront utilisées dans le timer de la fenêtre	
		ii_palette_x = xpos
		ii_palette_y = ypos
		
		Timer(0.05)	// pour déclencher le repositionnement de la palette

//Appel de la fenetre couleur et au retour, met la couleur de fond
	//--------------------------------------------------
	if appel_palette(couleur_choisie)  then
		// Clic droit dans le zone commentaire => couleur
		if couleur_choisie=couleur_jour_interdit then
			messagebox("Attention", "Vous ne pouvez pas choisir cette couleur, car elle correspond à la couleur de fond des jours interdits.")
		else
			if couleur_choisie=couleur_rouge then
				messagebox("Attention", "Vous ne pouvez pas choisir cette couleur, car elle correspond à la couleur de présence de rendez-vous durant une période interdite.")
			else
				this.setitem(row,"couleur",couleur_choisie)
				// On bouge le focus pour appliquer la couleur dans la zone
				this.setcolumn(1)
				this.setcolumn(8)
				this.accepttext()
			end if
		end if
	end if
end if

end event

