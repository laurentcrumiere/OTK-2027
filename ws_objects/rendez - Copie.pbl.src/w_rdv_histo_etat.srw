$PBExportHeader$w_rdv_histo_etat.srw
forward
global type w_rdv_histo_etat from w_fenetre_arakis
end type
type cb_annuler from uo_picturebutton_250x120 within w_rdv_histo_etat
end type
type cb_fermer from uo_picturebutton_250x120 within w_rdv_histo_etat
end type
type cb_enregistrer from uo_picturebutton_250x120 within w_rdv_histo_etat
end type
type cb_supprimer from uo_picturebutton_250x120 within w_rdv_histo_etat
end type
type dw_liste from datawindow within w_rdv_histo_etat
end type
end forward

global type w_rdv_histo_etat from w_fenetre_arakis
integer width = 2789
integer height = 1444
cb_annuler cb_annuler
cb_fermer cb_fermer
cb_enregistrer cb_enregistrer
cb_supprimer cb_supprimer
dw_liste dw_liste
end type
global w_rdv_histo_etat w_rdv_histo_etat

type variables


double var_code_interne_local
end variables

on w_rdv_histo_etat.create
int iCurrent
call super::create
this.cb_annuler=create cb_annuler
this.cb_fermer=create cb_fermer
this.cb_enregistrer=create cb_enregistrer
this.cb_supprimer=create cb_supprimer
this.dw_liste=create dw_liste
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_annuler
this.Control[iCurrent+2]=this.cb_fermer
this.Control[iCurrent+3]=this.cb_enregistrer
this.Control[iCurrent+4]=this.cb_supprimer
this.Control[iCurrent+5]=this.dw_liste
end on

on w_rdv_histo_etat.destroy
call super::destroy
destroy(this.cb_annuler)
destroy(this.cb_fermer)
destroy(this.cb_enregistrer)
destroy(this.cb_supprimer)
destroy(this.dw_liste)
end on

event open;call super::open;colore_datawindow(dw_liste)

dw_liste.settransobject(sqlca)

// On passe en pamètre le code interne du RDV dont on souhaite l'histo
var_code_interne_local = message.DoubleParm


dw_liste.retrieve(var_code_interne_local)

if dw_liste.rowcount() = 0 then
	Messagebox("ATTENTION","Aucun changement d'état pour ce rendez-vous !")
	close(this)
else
	centrer(this)

	// Recherche du rdv pour le mettre dans le titre
	
	datetime v_rdv
	select rdv into :v_rdv from rdv where round(code_interne,0) = :var_code_interne_local ;
	
	this.title = "Etats pour le Rendez-vous du "+string(v_rdv,"dd/mm/yyyy à hh:mm")
	
	// parcours de la datawindow pour mettre à jour les écrarts
	time t1,t2
	long lig 

	// On est sur qu'il y a au moins une ligne
	t1 = time(dw_liste.getitemdatetime(1,"historique_etat_rdv_date_modif"))
	t1 = time(string( hour(t1)) + ":"+ string(minute(t1)) ) // pour tronquer les secondes
	dw_liste.setitem(1,"v1","")
	
	for lig = 2 to dw_liste.rowcount()
		t2 = time(dw_liste.getitemdatetime(lig,"historique_etat_rdv_date_modif"))
		t2 = time(string( hour(t2)) + ":"+ string(minute(t2)) ) // pour tronquer les secondes
		
		dw_liste.setitem(lig,"v1",string(secondsafter(t1,t2) / 60, '0') +"'")
		
		t1 = t2
	next
	
	
end if


end event

type p_fond from w_fenetre_arakis`p_fond within w_rdv_histo_etat
end type

type cb_annuler from uo_picturebutton_250x120 within w_rdv_histo_etat
boolean visible = false
integer x = 357
integer y = 1108
integer taborder = 20
string text = "&Annuler"
end type

event clicked;call super::clicked;rollback ;
dw_liste.retrieve(var_code_interne_local)

end event

type cb_fermer from uo_picturebutton_250x120 within w_rdv_histo_etat
integer x = 1088
integer y = 1124
integer width = 539
integer height = 140
integer taborder = 30
string text = "&Fermer"
string iconname = "ACTIONS_fermer.png"
end type

event clicked;call super::clicked;close(parent)

end event

type cb_enregistrer from uo_picturebutton_250x120 within w_rdv_histo_etat
boolean visible = false
integer x = 585
integer y = 1132
integer taborder = 30
string text = "&Enregistrer"
end type

event clicked;call super::clicked;dw_liste.accepttext()
if dw_liste.update() = 1 then
	commit ;
	// si tout va bien on retrieve pour remetre l'ordre entre autre
	cb_annuler.TriggerEvent(Clicked!)
else
//	MessageBox("ATTENTION !","La mise à jour de la base de données a échoué !~n"+&
//	"Aucune modification ne sera prise en compte !",Exclamation!)
	Rollback ;
end if


end event

type cb_supprimer from uo_picturebutton_250x120 within w_rdv_histo_etat
boolean visible = false
integer y = 1116
integer width = 411
integer height = 112
integer taborder = 20
string text = "&Supprimer"
end type

event clicked;call super::clicked;if dw_liste.rowcount() > 0 then
	dw_liste.deleterow(dw_liste.getrow())
end if
end event

type dw_liste from datawindow within w_rdv_histo_etat
integer x = 18
integer width = 2693
integer height = 1092
integer taborder = 10
string title = "none"
string dataobject = "dw_rdv_histo_etat"
boolean livescroll = true
end type

