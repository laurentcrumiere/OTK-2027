$PBExportHeader$w_taches_purge.srw
forward
global type w_taches_purge from w_fenetre_arakis
end type
type cb_annuler from uo_picturebutton_390x120 within w_taches_purge
end type
type cb_supprimer from uo_picturebutton_390x120 within w_taches_purge
end type
type st_1 from statictext within w_taches_purge
end type
type st_2 from statictext within w_taches_purge
end type
type em_date_limite from editmask within w_taches_purge
end type
type rb_realisees from radiobutton within w_taches_purge
end type
type rb_toutes from radiobutton within w_taches_purge
end type
end forward

global type w_taches_purge from w_fenetre_arakis
integer width = 1897
integer height = 1460
string title = "Purge des Tâches"
boolean minbox = false
boolean maxbox = false
boolean resizable = false
windowtype windowtype = response!
boolean center = true
cb_annuler cb_annuler
cb_supprimer cb_supprimer
st_1 st_1
st_2 st_2
em_date_limite em_date_limite
rb_realisees rb_realisees
rb_toutes rb_toutes
end type
global w_taches_purge w_taches_purge

on w_taches_purge.create
int iCurrent
call super::create
this.cb_annuler=create cb_annuler
this.cb_supprimer=create cb_supprimer
this.st_1=create st_1
this.st_2=create st_2
this.em_date_limite=create em_date_limite
this.rb_realisees=create rb_realisees
this.rb_toutes=create rb_toutes
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_annuler
this.Control[iCurrent+2]=this.cb_supprimer
this.Control[iCurrent+3]=this.st_1
this.Control[iCurrent+4]=this.st_2
this.Control[iCurrent+5]=this.em_date_limite
this.Control[iCurrent+6]=this.rb_realisees
this.Control[iCurrent+7]=this.rb_toutes
end on

on w_taches_purge.destroy
call super::destroy
destroy(this.cb_annuler)
destroy(this.cb_supprimer)
destroy(this.st_1)
destroy(this.st_2)
destroy(this.em_date_limite)
destroy(this.rb_realisees)
destroy(this.rb_toutes)
end on

event open;call super::open;

em_date_limite.text = string(relativedate(today(), -365))




end event

type p_fond from w_fenetre_arakis`p_fond within w_taches_purge
end type

type cb_annuler from uo_picturebutton_390x120 within w_taches_purge
integer x = 197
integer y = 1064
integer width = 640
integer taborder = 10
boolean bringtotop = true
string text = "Annuler"
string iconname = "ACTIONS_abandonner.png"
end type

event clicked;call super::clicked;close(parent)
end event

type cb_supprimer from uo_picturebutton_390x120 within w_taches_purge
integer x = 910
integer y = 1064
integer width = 640
integer taborder = 10
boolean bringtotop = true
string text = "Supprimer"
string iconname = "ACTIONS_supprimer.png"
end type

event clicked;call super::clicked;string statut1, statut2
date date_limite
long tot_avant, tot_apres

if messagebox("ATTENTION","La suppression demandée sera IRREMEDIABLE !~n~nConfirmez-vous ?", Question!, Yesno!, 2) = 1 then
	
	if rb_realisees.checked then 
		statut1 = "O"
		statut2 = statut1
	else
		statut1 = ""
		statut2 = "Z"
	end if
	
	date_limite = date(em_date_limite.text)
	
	select count(*) into :tot_avant from taches ; 

	delete from taches where date(date_echeance) < :date_limite and statut between :statut1 and :statut2 ;
	
	if sqlca.sqlcode <> 0 then
		messagebox("ERREUR DANS LA SUPPRESSION" , sqlca.sqlerrtext)
		rollback ;
	else
		commit ;
		select count(*) into :tot_apres from taches ; 
		Messagebox("INFORMATION", string(tot_avant - tot_apres) + " tâches ont été supprimées !")
		
		// Refresh de la liste
		w_taches.filtre_taches(1,w_taches.dw_liste)
		
		close(parent)
	end if
end if
end event

type st_1 from statictext within w_taches_purge
integer x = 119
integer y = 144
integer width = 974
integer height = 72
boolean bringtotop = true
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 553648127
string text = "Supprimer toutes les tâches :"
boolean focusrectangle = false
end type

type st_2 from statictext within w_taches_purge
integer x = 494
integer y = 388
integer width = 338
integer height = 72
boolean bringtotop = true
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 553648127
string text = "Avant le : "
boolean focusrectangle = false
end type

type em_date_limite from editmask within w_taches_purge
integer x = 855
integer y = 372
integer width = 512
integer height = 108
integer taborder = 10
boolean bringtotop = true
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
string text = "none"
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "dd/mm/yyyy"
boolean spin = true
end type

type rb_realisees from radiobutton within w_taches_purge
integer x = 489
integer y = 640
integer width = 1125
integer height = 92
boolean bringtotop = true
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 553648127
string text = "Uniquement les tâches réalisées"
boolean checked = true
end type

type rb_toutes from radiobutton within w_taches_purge
integer x = 489
integer y = 752
integer width = 1125
integer height = 92
boolean bringtotop = true
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 553648127
string text = "Toutes les tâches"
end type

