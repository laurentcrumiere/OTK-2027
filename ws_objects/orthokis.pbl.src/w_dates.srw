$PBExportHeader$w_dates.srw
forward
global type w_dates from w_fenetre_arakis
end type
type cb_annuler from uo_picturebutton_390x120 within w_dates
end type
type cb_enregistrer from uo_picturebutton_390x120 within w_dates
end type
type cb_fermer from uo_picturebutton_390x120 within w_dates
end type
type dw_1 from datawindow within w_dates
end type
end forward

global type w_dates from w_fenetre_arakis
integer width = 4224
integer height = 2080
string title = "Dates"
windowtype windowtype = response!
boolean center = true
cb_annuler cb_annuler
cb_enregistrer cb_enregistrer
cb_fermer cb_fermer
dw_1 dw_1
end type
global w_dates w_dates

type variables
double var_code_local
end variables

forward prototypes
public subroutine appliquer_libelles_dates (datawindow dw_dates)
end prototypes

public subroutine appliquer_libelles_dates (datawindow dw_dates);// Libellés des dates
dw_dates.object.premiere_demande_t.text = libelle_date_prem_demande+" :"
dw_dates.object.debut_traitement_t.text = libelle_debut_traitement+" :"
dw_dates.object.interruption_t.text = libelle_date_interruption+" :"

//dw_dates.object.accord_toc_t.text = libelle_date_accord_toc+" :"
dw_dates.object.date_reprise_t.text = libelle_date_reprise+" :"
dw_dates.object.fin_traitement_t.text = libelle_fin_traitement+" :"

// 1 date de moins hors Belgique
if not belgique then
	// On masque la date de fin tpi et et on remonte
	
	dw_dates.object.fin_tpi_t.visible  = 0
	dw_dates.object.b_fin_tpi.visible = 0
	dw_dates.object.patient_date_fin_tpi.visible = 0

	dw_dates.object.premiere_demande_t.y = long(dw_dates.object.patient_date_moulage.y) + 110
	dw_dates.object.b_prem_demande.y = dw_dates.object.premiere_demande_t.y
	dw_dates.object.date_prem_demande.y = dw_dates.object.premiere_demande_t.y

	dw_dates.object.debut_traitement_t.y = long(dw_dates.object.patient_date_moulage.y) + 2 * 110
	dw_dates.object.b_debut_traitement.y =dw_dates.object.debut_traitement_t.y
	dw_dates.object.debut_traitement.y = dw_dates.object.debut_traitement_t.y
	
	dw_dates.object.interruption_t.y = long(dw_dates.object.patient_date_moulage.y) + 3 * 110
	dw_dates.object.b_interruption.y = dw_dates.object.interruption_t.y
	dw_dates.object.patient_date_interruption.y = dw_dates.object.interruption_t.y

	dw_dates.object.date_reprise_t.y = long(dw_dates.object.patient_date_moulage.y) + 4 * 110
	dw_dates.object.b_reprise.y = dw_dates.object.date_reprise_t.y
	dw_dates.object.patient_date_reprise.y = dw_dates.object.date_reprise_t.y
	
	dw_dates.object.fin_traitement_t.y = long(dw_dates.object.patient_date_moulage.y) + 5 * 110
	dw_dates.object.b_fin_traitement.y = dw_dates.object.fin_traitement_t.y
	dw_dates.object.patient_fin_traitement.y = dw_dates.object.fin_traitement_t.y

	dw_dates.object.debut_contention_t.y = long(dw_dates.object.patient_date_moulage.y) + 6 * 110
	dw_dates.object.b_debut_contention.y = dw_dates.object.debut_contention_t.y
	dw_dates.object.patient_debut_contention.y = dw_dates.object.debut_contention_t.y

	dw_dates.object.fin_contention_t.y = long(dw_dates.object.patient_date_moulage.y) + 7 * 110
	dw_dates.object.b_fin_contention.y = dw_dates.object.fin_contention_t.y
	dw_dates.object.patient_fin_contention.y = dw_dates.object.fin_contention_t.y

//dw_dates.object.gb_dates.height = 696
end if
end subroutine

on w_dates.create
int iCurrent
call super::create
this.cb_annuler=create cb_annuler
this.cb_enregistrer=create cb_enregistrer
this.cb_fermer=create cb_fermer
this.dw_1=create dw_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_annuler
this.Control[iCurrent+2]=this.cb_enregistrer
this.Control[iCurrent+3]=this.cb_fermer
this.Control[iCurrent+4]=this.dw_1
end on

on w_dates.destroy
call super::destroy
destroy(this.cb_annuler)
destroy(this.cb_enregistrer)
destroy(this.cb_fermer)
destroy(this.dw_1)
end on

event open;call super::open;//récup du message d'ouverture
var_code_local = message.doubleparm

dw_1.dataobject = "dw_patient_fiche_dates"
	

colore_datawindow(dw_1)

appliquer_libelles_dates(dw_1)
	
//retrieve de la datawindow
dw_1.settransobject(SQLCA)
dw_1.retrieve(var_code_local)

if profilestring(dir_ini+inifile_orthokis,"commentaires_cliniques","multiligne_infobulle","O") = "N" then
	dw_1.object.patient_motif_relance_admini.Tooltip.enabled = 0
end if


if not Belgique then
	// pas de barre d'avancement paramétrable en dehors de la belgique
	dw_1.object.patient_barre_avancement.visible = false
	dw_1.object.patient_barre_avancement_t.visible = false
end if



if enregistrement_automatique then
	cb_annuler.visible = false
	cb_enregistrer.visible = false
end if
end event

event close;call super::close;
if enregistrement_automatique then
	cb_enregistrer.triggerevent(clicked!)
end if



end event

type p_fond from w_fenetre_arakis`p_fond within w_dates
end type

type cb_annuler from uo_picturebutton_390x120 within w_dates
integer x = 1179
integer y = 1756
integer width = 526
integer taborder = 20
string text = "&Annuler"
string iconname = "ACTIONS_annuler.png"
end type

event clicked;call super::clicked;dw_1.retrieve(var_code_local)
end event

type cb_enregistrer from uo_picturebutton_390x120 within w_dates
integer x = 1760
integer y = 1756
integer width = 526
integer taborder = 20
string text = "&Enregistrer"
string iconname = "ACTIONS_enregistrer.png"
end type

event clicked;call super::clicked;dw_1.accepttext()

if dw_1.update() = 1 then
	commit ;
else
	Rollback ;
end if

end event

type cb_fermer from uo_picturebutton_390x120 within w_dates
integer x = 2341
integer y = 1756
integer width = 526
integer taborder = 20
string text = "&Fermer"
string iconname = "Close1!"
end type

event clicked;call super::clicked;dw_1.accepttext()

if dw_1.modifiedcount() > 0 and not enregistrement_automatique Then
	If MessageBox("ATTENTION","Vous avez fait des modifications !~n~nVoulez-vous vraiment fermer cette fenêtre sans enregistrer (et ainsi perdre les modifications) ?",Question!,YesNo!, 2) = 1 Then
		Close(parent)
	end if
else
	close(parent)
end if
end event

type dw_1 from datawindow within w_dates
string tag = "brush"
integer x = 18
integer y = 24
integer width = 4187
integer height = 1724
integer taborder = 10
string title = "none"
string dataobject = "dw_patient_fiche_dates"
boolean border = false
end type

event itemchanged;

if enregistrement_automatique then
	cb_enregistrer.triggerevent(clicked!)
end if
end event

event buttonclicked;string ls_object

string v_nulle

SetNull(v_nulle)

ls_Object = String(dwo.name)

choose case ls_Object

case "b_debut_traitement" 
	// Date de jour
	set_today(this, "debut_traitement")
case "b_moulage" 
	// Date de jour
	set_today(this, "patient_date_moulage")
case "b_prem_demande" 
	// Date de jour
	set_today(this, "date_prem_demande")
case "b_interruption"  
	// Date de jour
	set_today(this, "patient_date_interruption")
case "b_reprise" 
	// Date de jour
	set_today(this, "patient_date_reprise")
case "b_fin_traitement" 
	// Date de jour
	set_today(this, "patient_fin_traitement")
case "b_contact" 
	// Date de jour
	set_today(this, "date_contact")
case "b_premiere_visite" 
	// Date de jour
	set_today(this, "premiere_visite")
case "b_relance" 
	// Date de jour
	set_today(this, "relance")
case "b_relance_admini" 
	// Date de jour
	set_today(this, "patient_date_relance_admini")
case "b_fin_tpi" 
	// Date de jour
	set_today(this, "patient_date_fin_tpi")
case "b_debut_contention" 
	// Date de jour
	set_today(this, "patient_debut_contention")
case "b_fin_contention" 
	// Date de jour
	set_today(this, "patient_fin_contention")
	
	
case "b_date_mandat" 
	// Date de jour
	set_today(this, "patient_date_mandat")


case "b_raz_code_banque" 
	SetItem(row, "patient_code_banque", v_nulle)
case "b_raz_mode_reglement_habituel" 
	SetItem(row, "patient_mode_reglement_habituel", v_nulle)
case "b_generer_rum" 
	double v_max_rum
	string v_rum
	boolean v_suite
	v_rum = trim(string_non_nulle(GetItemString(row, "patient_rum")))
	
	if v_rum <> "" then
		if messagebox("ATTENTION", "Ce patient a déjà un RUM.~n~nSouhaitez-vous en générer un nouveau ?", Question!, YesNo!, 2) = 1 then
			v_suite = true
		else
			v_suite = false
		end if
	else
		v_suite = true
	end if
	
	if v_suite then
		select isnull(max( cast (rum as double)),0) into :v_max_rum from patient ; 
		v_max_rum = v_max_rum + 1 
		SetItem(row, "patient_rum", string(v_max_rum))
	end if




end choose



//string ls_object
//
//ls_Object = String(dwo.name)
//
//
//If ls_Object = "b_debut_traitement" Then
//	// Date de jour
//	set_today(this, "debut_traitement")
//end if
//If ls_Object = "b_moulage" Then
//	// Date de jour
//	set_today(this, "patient_date_moulage")
//end if
//If ls_Object = "b_prem_demande" Then
//	// Date de jour
//	set_today(this, "date_prem_demande")
//end if
//If ls_Object = "b_interruption" Then
//	// Date de jour
//	set_today(this, "patient_date_interruption")
//end if
//If ls_Object = "b_reprise" Then
//	// Date de jour
//	set_today(this, "patient_date_reprise")
//end if
//If ls_Object = "b_fin_traitement" Then
//	// Date de jour
//	set_today(this, "patient_fin_traitement")
//end if
//If ls_Object = "b_fin_tpi" Then
//	// Date de jour
//	set_today(this, "patient_fin_tpi")
//end if
//If ls_Object = "b_contact" Then
//	// Date de jour
//	set_today(this, "date_contact")
//end if
//If ls_Object = "b_premiere_visite" Then
//	// Date de jour
//	set_today(this, "premiere_visite")
//end if
//If ls_Object = "b_relance" Then
//	// Date de jour
//	set_today(this, "relance")
//end if
//If ls_Object = "b_relance_admini" Then
//	// Date de jour
//	set_today(this, "patient_date_relance_admini")
//end if
//If ls_Object = "b_fin_tpi" Then
//	// Date de jour
//	set_today(this, "patient_date_fin_tpi")
//end if
//If ls_Object = "b_date_mandat" Then
//	// Date de jour
//	set_today(this, "patient_date_mandat")
//end if
//
end event

