$PBExportHeader$w_liste_patients_incoherence_type_dossier.srw
forward
global type w_liste_patients_incoherence_type_dossier from w_liste_patients
end type
type pb_corriger from uo_picturebutton_390x120 within w_liste_patients_incoherence_type_dossier
end type
end forward

global type w_liste_patients_incoherence_type_dossier from w_liste_patients
string title = "Liste des Patients avec une incohérence de type de dossier"
pb_corriger pb_corriger
end type
global w_liste_patients_incoherence_type_dossier w_liste_patients_incoherence_type_dossier

forward prototypes
public subroutine prepa ()
end prototypes

public subroutine prepa ();string pra_min,pra_max		// Praticiens
double code_min,code_max	// N° Dossiers

string v_doc

string v_titre

if not prepa_faite then
	//prepa_faite = true
	if rb_tous.checked then
		pra_min="      "
		pra_max="ZZZZZZ"
		v_titre = "Pour tous les praticiens"
	else
		pra_min=dw_prati.getitemstring(dw_prati.getrow(),"code")
		pra_max=pra_min
		select trim(nom)+isnull(' '+prenom, '') into :v_doc from prati where code = :pra_min ;
		v_titre = "Pour le Dr " + v_doc
	end if

	code_min = double(em_min.text)
	code_max = double(em_max.text)

	
	v_titre = v_titre + " - Du dossier N°"+string(code_min)+" au dossier N°"+string(code_max) 
	
	dw_liste.Modify("t_titre.text = '"+v_titre + "'")
	open(w_patience)
	dw_liste.retrieve(code_min,code_max,pra_min,pra_max)
	close(w_patience)

	//em_nb.text = string(dw_liste.rowcount())+" Dossiers"
	//em_nb.visible = true

end if

end subroutine

on w_liste_patients_incoherence_type_dossier.create
int iCurrent
call super::create
this.pb_corriger=create pb_corriger
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.pb_corriger
end on

on w_liste_patients_incoherence_type_dossier.destroy
call super::destroy
destroy(this.pb_corriger)
end on

type p_fond from w_liste_patients`p_fond within w_liste_patients_incoherence_type_dossier
end type

type cb_imprimer from w_liste_patients`cb_imprimer within w_liste_patients_incoherence_type_dossier
integer taborder = 80
end type

type cb_autre from w_liste_patients`cb_autre within w_liste_patients_incoherence_type_dossier
end type

event cb_autre::clicked;call super::clicked;pb_corriger.enabled ( false)
end event

type cb_fermer from w_liste_patients`cb_fermer within w_liste_patients_incoherence_type_dossier
integer x = 2665
integer taborder = 90
end type

type cb_ecran from w_liste_patients`cb_ecran within w_liste_patients_incoherence_type_dossier
integer taborder = 100
end type

type cb_lien_word from w_liste_patients`cb_lien_word within w_liste_patients_incoherence_type_dossier
end type

type uo_size from w_liste_patients`uo_size within w_liste_patients_incoherence_type_dossier
end type

type rb_un from w_liste_patients`rb_un within w_liste_patients_incoherence_type_dossier
end type

type rb_tous from w_liste_patients`rb_tous within w_liste_patients_incoherence_type_dossier
end type

type em_nb from w_liste_patients`em_nb within w_liste_patients_incoherence_type_dossier
end type

type em_max from w_liste_patients`em_max within w_liste_patients_incoherence_type_dossier
end type

type em_min from w_liste_patients`em_min within w_liste_patients_incoherence_type_dossier
end type

type dw_1 from w_liste_patients`dw_1 within w_liste_patients_incoherence_type_dossier
end type

type gb_1 from w_liste_patients`gb_1 within w_liste_patients_incoherence_type_dossier
end type

type dw_prati from w_liste_patients`dw_prati within w_liste_patients_incoherence_type_dossier
end type

type cbx_filtre from w_liste_patients`cbx_filtre within w_liste_patients_incoherence_type_dossier
end type

type st_min from w_liste_patients`st_min within w_liste_patients_incoherence_type_dossier
end type

type st_max from w_liste_patients`st_max within w_liste_patients_incoherence_type_dossier
end type

type dw_liste from w_liste_patients`dw_liste within w_liste_patients_incoherence_type_dossier
string dataobject = "dw_liste_patients_incoherence_type_dossier"
end type

event dw_liste::retrieveend;call super::retrieveend;

if rowcount > 0 then
	pb_corriger.enabled ( true)
end if
end event

type pb_corriger from uo_picturebutton_390x120 within w_liste_patients_incoherence_type_dossier
integer x = 2199
integer y = 1868
integer width = 457
integer taborder = 90
boolean bringtotop = true
boolean enabled = false
string text = "&Corriger"
string iconname = "ACTIONS_executer.png"
end type

event clicked;call super::clicked;
boolean v_suite = false

if PLANIFICATION_EN_COURS then
	v_suite = true
else
	if Messagebox("ATTENTION", "Vous allez corriger les dossiers listés et modifier leur type de dossier en leur applicant le type de dossier attendu !~n~nCette opération est IRREVERSIBLE !~n~nConfirmez-vous ?", Question!, YesNo!, 2) = 1 then
		v_suite = true
	else
		v_suite = false
	end if
end if

if v_suite then
	
	long lig, tot
	string v_type
	double var_code_local
	
	tot = dw_liste.rowcount() 
	
	for lig = 1 to tot
		
		v_type = dw_liste.GetitemString(lig, "code_soins_type_dossier_attendu")
		var_code_local =  dw_liste.GetitemNumber(lig, "code")
		
		dw_liste.Setitem(lig, "type_dossier", v_type)
		
		// Mise à jour de l'historique des dossiers
		INSERT INTO histo_dossier (code, date_heure, type_dossier) VALUES (:var_code_local, getdate(), :v_type) ;
		
	next
	
	
	if dw_liste.update() = 1 then 
		commit ;
		if not PLANIFICATION_EN_COURS then
			Messagebox("ATTENTION", "La correction des types de dossiers a été effectuée !")
		end if
	else
		if not PLANIFICATION_EN_COURS then
			Messagebox("ATTENTION", "Erreur dans la correction des dossier.~n~nErreur N°"+ string(sqlca.sqlcode)+"~n~n"+sqlca.Sqlerrtext)
		end if
		rollback ;
	end if
	if not PLANIFICATION_EN_COURS then
		close(parent)
	end if
end if
end event

