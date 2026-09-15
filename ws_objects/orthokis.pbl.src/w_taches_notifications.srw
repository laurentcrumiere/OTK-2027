$PBExportHeader$w_taches_notifications.srw
forward
global type w_taches_notifications from w_fenetre_arakis
end type
type cb_modifier from uo_picturebutton_390x120 within w_taches_notifications
end type
type cb_realisee from uo_picturebutton_390x120 within w_taches_notifications
end type
type dw_liste from u_basedw within w_taches_notifications
end type
type cb_annuler from uo_picturebutton_390x120 within w_taches_notifications
end type
end forward

global type w_taches_notifications from w_fenetre_arakis
integer width = 3611
integer height = 1628
string title = "Notification de Taches"
boolean minbox = false
boolean maxbox = false
boolean resizable = false
windowtype windowtype = response!
boolean center = true
cb_modifier cb_modifier
cb_realisee cb_realisee
dw_liste dw_liste
cb_annuler cb_annuler
end type
global w_taches_notifications w_taches_notifications

on w_taches_notifications.create
int iCurrent
call super::create
this.cb_modifier=create cb_modifier
this.cb_realisee=create cb_realisee
this.dw_liste=create dw_liste
this.cb_annuler=create cb_annuler
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_modifier
this.Control[iCurrent+2]=this.cb_realisee
this.Control[iCurrent+3]=this.dw_liste
this.Control[iCurrent+4]=this.cb_annuler
end on

on w_taches_notifications.destroy
call super::destroy
destroy(this.cb_modifier)
destroy(this.cb_realisee)
destroy(this.dw_liste)
destroy(this.cb_annuler)
end on

event open;call super::open;
dw_liste.dataobject = "dw_taches_notification"

dw_liste.settransobject(sqlca)

	// Application du filtre sur utilisateur / groupe
	dw_liste.retrieve()
	dw_liste.setfilter(fxg_filtre_taches_utilisateur(utilisateur_code))
	dw_liste.filter()

end event

type p_fond from w_fenetre_arakis`p_fond within w_taches_notifications
end type

type cb_modifier from uo_picturebutton_390x120 within w_taches_notifications
integer x = 1426
integer y = 1348
integer width = 695
integer taborder = 20
boolean bringtotop = true
string text = "Modifier"
string iconname = "ACTIONS_modifier.png"
end type

event clicked;call super::clicked;
if dw_liste.rowcount() > 0 then
	long v_id, lig
	lig = dw_liste.GetRow()
	v_id = dw_liste.GetItemNumber(lig, "id")
	//openWithParm(w_taches_fiche, v_id)
	param_win[1] = ""
	guo_fenetre_modale.wf_ouvrir_param_nombre(w_taches_fiche, v_id)	
	// on raffraichit la liste
	dw_liste.retrieve(utilisateur_code)
end if
end event

type cb_realisee from uo_picturebutton_390x120 within w_taches_notifications
integer x = 2203
integer y = 1348
integer width = 695
integer taborder = 20
boolean bringtotop = true
string text = "Réalisée"
string iconname = "ACTIONS_valider.png"
end type

event clicked;call super::clicked;

if dw_liste.rowcount() > 0 then
	if messagebox("ATTENTION","Confirmez-vous la réalisation de cette tâche ?", Question!, YesNo!, 2)  = 1 then
		long v_id, lig
		lig = dw_liste.GetRow()
		v_id = dw_liste.GetItemNumber(lig, "id")
		update taches set statut = 'O' where id = :v_id ;
		commit ;
		// on raffraichit la liste
		dw_liste.retrieve(utilisateur_code)
	end if
end if
end event

type dw_liste from u_basedw within w_taches_notifications
integer x = 41
integer y = 8
integer width = 3474
integer height = 1268
integer taborder = 10
boolean bringtotop = true
string dataobject = "dw_taches_notification"
boolean hscrollbar = false
end type

event retrieveend;call super::retrieveend;

// On fait des retrieve après chaque mise à jour
// Si la liste est vide, on ferme directement

if rowcount = 0 then
	close(parent)
end if
end event

event doubleclicked;call super::doubleclicked;
if row > 0 then
	cb_modifier.triggerevent(clicked!)
end if
end event

event buttonclicked;call super::buttonclicked;


string ls_object

ls_Object = String(dwo.name)


choose case  ls_Object


	case "b_ouvrir_patient"
		
		if  getitemnumber(row,"code") > 0 then
	
			var_code 				= 	getitemnumber(row,"code")
			var_numero_dossier 	= 	0
			var_nom 				= getitemstring(row,"nom_patient")
			var_nomp 				= ""
			var_pay 					= ""
			var_moul 				= ""
		
			ouverture_salle_attente()
			
			close(parent)
		end if

end choose
end event

type cb_annuler from uo_picturebutton_390x120 within w_taches_notifications
integer x = 649
integer y = 1348
integer width = 695
integer taborder = 30
boolean bringtotop = true
string text = "Annuler"
string iconname = "ACTIONS_abandonner.png"
end type

event clicked;call super::clicked;Close(parent)	
end event

