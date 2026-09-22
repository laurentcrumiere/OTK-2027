$PBExportHeader$w_jours_interdits_ajout_agenda.srw
forward
global type w_jours_interdits_ajout_agenda from w_fenetre_arakis
end type
type cb_enregistrer from uo_picturebutton_390x120 within w_jours_interdits_ajout_agenda
end type
type cb_annuler from uo_picturebutton_390x120 within w_jours_interdits_ajout_agenda
end type
type dw_liste from datawindow within w_jours_interdits_ajout_agenda
end type
end forward

global type w_jours_interdits_ajout_agenda from w_fenetre_arakis
integer x = 1198
integer y = 716
integer width = 3259
integer height = 1272
string title = "Ajout d~'une Période interdite"
windowtype windowtype = response!
cb_enregistrer cb_enregistrer
cb_annuler cb_annuler
dw_liste dw_liste
end type
global w_jours_interdits_ajout_agenda w_jours_interdits_ajout_agenda

type variables
boolean creation 

// pour repositionnement de la palette de couleur
integer  ii_palette_x = 0
integer ii_palette_y = 0



end variables

on w_jours_interdits_ajout_agenda.create
int iCurrent
call super::create
this.cb_enregistrer=create cb_enregistrer
this.cb_annuler=create cb_annuler
this.dw_liste=create dw_liste
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_enregistrer
this.Control[iCurrent+2]=this.cb_annuler
this.Control[iCurrent+3]=this.dw_liste
end on

on w_jours_interdits_ajout_agenda.destroy
call super::destroy
destroy(this.cb_enregistrer)
destroy(this.cb_annuler)
destroy(this.dw_liste)
end on

event open;call super::open;colore_datawindow(dw_liste)

//Centre la fenetre
//---------------
centrer(this)


st_rdv param_rdv


//Recuperation de la structure passe en paramètre
//--------------------------------------
param_rdv = message.powerobjectparm

//Connexion de la datawindows
//----------------------------------
dw_liste.settransobject(sqlca)


// Ajout du jour ....
dw_liste.insertrow(0)
dw_liste.setitem(dw_liste.getrow(),"date_debut",param_rdv.date_debut)
dw_liste.setitem(dw_liste.getrow(),"date_fin",datetime ( date(param_rdv.date_debut), relativetime(time(param_rdv.date_debut),3540) )) 
dw_liste.setitem(dw_liste.getrow(),"date_modif",now())
dw_liste.setitem(dw_liste.getrow(),"user_modif",utilisateur_code)


if isnull(param_rdv.praticien_de) or len(trim(param_rdv.praticien_de)) = 0 then
	string cp
	select min(code) into :cp from "prati" where prati_defaut > 0 ;
	dw_liste.setitem(dw_liste.getrow(),"code_praticien",cp)
else
	dw_liste.setitem(dw_liste.getrow(),"code_praticien",param_rdv.praticien_de)
end if








end event

event timer;call super::timer;Timer(0)
fxg_set_position_palette_windows(this, ii_palette_x, ii_palette_y)


end event

type p_fond from w_fenetre_arakis`p_fond within w_jours_interdits_ajout_agenda
end type

type cb_enregistrer from uo_picturebutton_390x120 within w_jours_interdits_ajout_agenda
integer x = 1554
integer y = 980
integer width = 603
integer height = 152
integer taborder = 20
string text = "&Enregistrer"
boolean default = true
string iconname = "ACTIONS_enregistrer.png"
end type

event clicked;call super::clicked;
dw_liste.accepttext()


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

boolean ok_suite = false

if nb > 0 then
	if MessageBox("ATTENTION !","Il y a "+string(nb)+" rendez-vous déjà saisis durant cette période pour ce praticien. Confirmez-vous ?",Question!,YesNo!,2) = 1 then
		ok_suite = true
	end if
else
	ok_suite = true
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
else
	rollback ;
end if


end event

type cb_annuler from uo_picturebutton_390x120 within w_jours_interdits_ajout_agenda
integer x = 937
integer y = 980
integer width = 603
integer height = 152
integer taborder = 50
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

type dw_liste from datawindow within w_jours_interdits_ajout_agenda
string tag = "brush"
integer x = 27
integer y = 24
integer width = 3150
integer height = 908
integer taborder = 10
string dataobject = "dw_jours_interdits_ajout_agenda"
boolean livescroll = true
end type

event dberror;db_erreur(dw_liste,sqldbcode,sqlerrtext)
return 1

end event

event rbuttondown;long couleur_choisie

if getcolumn() = 6 then 
	
	// Les positions seront utilisées dans le timer de la fenêtre	
		ii_palette_x = xpos
		ii_palette_y = ypos
		
		Timer(0.05)	// pour déclencher le repositionnement de la palette

//Appel de la fenetre couleur et au retour, met la couleur de fond
	//--------------------------------------------------
	if appel_palette(couleur_choisie)  then
		// Clic droit dans le zone commentaire => couleur
		if couleur_choisie = couleur_jour_interdit then
			messagebox("Attention", "Vous ne pouvez pas choisir cette couleur, car elle correspond à la couleur de fond des jours interdits.")
		else
			if couleur_choisie = 255 then 
				messagebox("Attention", "Vous ne pouvez pas choisir cette couleur, car elle correspond à la couleur des rendez-vous saisis dans une periode interdite.")
			else
				this.setitem(row,"couleur",couleur_choisie)
				// On bouge le focus pour appliquer la couleur dans la zone
				this.setcolumn(1)
				this.setcolumn(6)
				this.accepttext()
			end if
		end if
	end if
end if

end event

