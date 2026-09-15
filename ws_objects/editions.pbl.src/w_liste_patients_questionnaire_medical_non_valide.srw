$PBExportHeader$w_liste_patients_questionnaire_medical_non_valide.srw
$PBExportComments$Héritée de liste_patients
forward
global type w_liste_patients_questionnaire_medical_non_valide from w_liste_patients
end type
type st_1 from statictext within w_liste_patients_questionnaire_medical_non_valide
end type
type st_3 from statictext within w_liste_patients_questionnaire_medical_non_valide
end type
type em_date_min from uo_date_calendrier within w_liste_patients_questionnaire_medical_non_valide
end type
type em_date_max from uo_date_calendrier within w_liste_patients_questionnaire_medical_non_valide
end type
type st_2 from statictext within w_liste_patients_questionnaire_medical_non_valide
end type
type pb_archive from uo_picturebutton_390x120 within w_liste_patients_questionnaire_medical_non_valide
end type
type uo_filtre_email from uo_filtre_emails within w_liste_patients_questionnaire_medical_non_valide
end type
end forward

global type w_liste_patients_questionnaire_medical_non_valide from w_liste_patients
string title = "Questionnaires Médicaux non validés selon Rendez-vous"
st_1 st_1
st_3 st_3
em_date_min em_date_min
em_date_max em_date_max
st_2 st_2
pb_archive pb_archive
uo_filtre_email uo_filtre_email
end type
global w_liste_patients_questionnaire_medical_non_valide w_liste_patients_questionnaire_medical_non_valide

forward prototypes
public subroutine prepa ()
end prototypes

public subroutine prepa ();string v_type_dossier_min, v_type_dossier_max
string pra_min,pra_max
double v_type_min, v_type_max
double v_temps_min, v_temps_max
date v_date_min, v_date_max
string filtre

double code_min,code_max

string titre

if not prepa_faite then
	//prepa_faite = true
	
	// Praticien
	if rb_tous.checked then
		pra_min="      "
		pra_max="ZZZZZZ"
		Titre = "Tous praticiens"
	else
		pra_min=dw_prati.getitemstring(dw_prati.getrow(),"code")
		pra_max=dw_prati.getitemstring(dw_prati.getrow(),"code")
		Titre = "Un praticien"
	end if



	code_min = double(em_min.text)
	code_max = double(em_max.text)

	Titre = Titre + " - Du dossier "+string(code_min)+" au "+string(code_max)
	
	v_date_min = em_date_min.gettheDate()
	v_date_max = em_date_max.gettheDate()

	Titre = Titre + " - Rendez-vous du "+string(v_date_min)+" au "+string(v_date_max)


	dw_liste.SetFilter(filtre)
	dw_liste.filter()
	uo_filtre_email.filtre_initial = filtre

	

	open(w_patience)
	
	dw_liste.object.titre.text = titre

	dw_liste.retrieve(code_min,code_max,pra_min,pra_max, v_date_min, v_date_max)
	close(w_patience)

	//em_nb.text = string(dw_liste.rowcount())+" Questionnaires"
	//em_nb.visible = true
end if

end subroutine

on w_liste_patients_questionnaire_medical_non_valide.create
int iCurrent
call super::create
this.st_1=create st_1
this.st_3=create st_3
this.em_date_min=create em_date_min
this.em_date_max=create em_date_max
this.st_2=create st_2
this.pb_archive=create pb_archive
this.uo_filtre_email=create uo_filtre_email
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.st_1
this.Control[iCurrent+2]=this.st_3
this.Control[iCurrent+3]=this.em_date_min
this.Control[iCurrent+4]=this.em_date_max
this.Control[iCurrent+5]=this.st_2
this.Control[iCurrent+6]=this.pb_archive
this.Control[iCurrent+7]=this.uo_filtre_email
end on

on w_liste_patients_questionnaire_medical_non_valide.destroy
call super::destroy
destroy(this.st_1)
destroy(this.st_3)
destroy(this.em_date_min)
destroy(this.em_date_max)
destroy(this.st_2)
destroy(this.pb_archive)
destroy(this.uo_filtre_email)
end on

event open;call super::open;
em_date_min.SetDate(today())
em_date_max.SetDate(relativeDate(today(),7))
uo_filtre_email.dw_liste = dw_liste
uo_filtre_email.em_statut_mere = em_nb

em_min.text = string(min)


end event

type p_fond from w_liste_patients`p_fond within w_liste_patients_questionnaire_medical_non_valide
integer x = 2674
integer y = 272
end type

type cb_imprimer from w_liste_patients`cb_imprimer within w_liste_patients_questionnaire_medical_non_valide
integer x = 2235
end type

type cb_autre from w_liste_patients`cb_autre within w_liste_patients_questionnaire_medical_non_valide
integer x = 1760
end type

event cb_autre::clicked;call super::clicked;

	pb_archive.enabled ( false)

end event

type cb_fermer from w_liste_patients`cb_fermer within w_liste_patients_questionnaire_medical_non_valide
integer x = 3186
integer taborder = 120
end type

type cb_ecran from w_liste_patients`cb_ecran within w_liste_patients_questionnaire_medical_non_valide
integer x = 539
integer taborder = 130
end type

event cb_ecran::clicked;call super::clicked;

if dw_liste.rowcount() > 0 then 
	
	pb_archive.enabled ( true)
	
end if
	
end event

type cb_lien_word from w_liste_patients`cb_lien_word within w_liste_patients_questionnaire_medical_non_valide
end type

type uo_size from w_liste_patients`uo_size within w_liste_patients_questionnaire_medical_non_valide
end type

type rb_un from w_liste_patients`rb_un within w_liste_patients_questionnaire_medical_non_valide
integer x = 389
integer y = 212
end type

type rb_tous from w_liste_patients`rb_tous within w_liste_patients_questionnaire_medical_non_valide
integer x = 389
integer y = 116
end type

type em_nb from w_liste_patients`em_nb within w_liste_patients_questionnaire_medical_non_valide
end type

type em_max from w_liste_patients`em_max within w_liste_patients_questionnaire_medical_non_valide
integer y = 560
end type

type em_min from w_liste_patients`em_min within w_liste_patients_questionnaire_medical_non_valide
integer y = 560
end type

type dw_1 from w_liste_patients`dw_1 within w_liste_patients_questionnaire_medical_non_valide
end type

type gb_1 from w_liste_patients`gb_1 within w_liste_patients_questionnaire_medical_non_valide
integer y = 36
end type

type dw_prati from w_liste_patients`dw_prati within w_liste_patients_questionnaire_medical_non_valide
boolean visible = true
integer y = 216
end type

type cbx_filtre from w_liste_patients`cbx_filtre within w_liste_patients_questionnaire_medical_non_valide
end type

type st_min from w_liste_patients`st_min within w_liste_patients_questionnaire_medical_non_valide
integer y = 572
end type

type st_max from w_liste_patients`st_max within w_liste_patients_questionnaire_medical_non_valide
integer y = 572
end type

type dw_liste from w_liste_patients`dw_liste within w_liste_patients_questionnaire_medical_non_valide
integer x = 9
integer height = 1848
string dataobject = "dw_liste_patients_questionnaires_medicaux_non_valide"
end type

type st_1 from statictext within w_liste_patients_questionnaire_medical_non_valide
integer x = 343
integer y = 928
integer width = 878
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
string facename = "Arial"
boolean underline = true
long backcolor = 553648127
string text = "Période de rendez-vous :"
end type

type st_3 from statictext within w_liste_patients_questionnaire_medical_non_valide
integer x = 507
integer y = 1100
integer width = 256
integer height = 72
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
string facename = "Arial"
long backcolor = 553648127
string text = "Entre le "
end type

type em_date_min from uo_date_calendrier within w_liste_patients_questionnaire_medical_non_valide
integer x = 814
integer y = 1092
integer taborder = 250
boolean bringtotop = true
end type

on em_date_min.destroy
call uo_date_calendrier::destroy
end on

type em_date_max from uo_date_calendrier within w_liste_patients_questionnaire_medical_non_valide
integer x = 1563
integer y = 1092
integer taborder = 260
boolean bringtotop = true
end type

on em_date_max.destroy
call uo_date_calendrier::destroy
end on

type st_2 from statictext within w_liste_patients_questionnaire_medical_non_valide
integer x = 1257
integer y = 1100
integer width = 256
integer height = 72
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
string facename = "Arial"
long backcolor = 553648127
string text = "et le"
alignment alignment = center!
end type

type pb_archive from uo_picturebutton_390x120 within w_liste_patients_questionnaire_medical_non_valide
integer x = 2711
integer y = 1868
integer width = 457
integer taborder = 40
boolean bringtotop = true
boolean enabled = false
string text = "Arch/Désar."
end type

event clicked;call super::clicked;

long lig

if dw_liste.rowcount() > 0 then
	lig = dw_liste.getrow()

	if dw_liste.GetItemString(lig, "Archive") = "O" then
		if Messagebox("ATTENTION","Ce Questionnaire est actuellement Archivé.~n~nVous allez le réactiver.~n~nConfirmez-vous ?", Question!, YesNo!, 2) = 1 then
			dw_liste.SetItem(lig, "Archive", "N") 
			if dw_liste.update() = 1 then 
				commit ;
			else
				messagebox("ATTENTION","Erreur dans la mise à jour de la base de données : ~n~n"+Sqlca.Sqlerrtext)
				rollback ;
			end if
		end if
	else
		if Messagebox("ATTENTION","Ce Questionnaire est actuellement Actif.~n~nVous allez l'archiver.~n~nConfirmez-vous ?", Question!, YesNo!, 2) = 1 then
			dw_liste.SetItem(lig, "Archive", "O") 
			if dw_liste.update() = 1 then 
				commit ;
			else
				messagebox("ATTENTION","Erreur dans la mise à jour de la base de données : ~n~n"+Sqlca.Sqlerrtext)
				rollback ;
			end if
		end if
		
		
	end if
end if
end event

type uo_filtre_email from uo_filtre_emails within w_liste_patients_questionnaire_medical_non_valide
string tag = "no resize all"
integer x = 1015
integer y = 1852
integer taborder = 200
boolean bringtotop = true
end type

on uo_filtre_email.destroy
call uo_filtre_emails::destroy
end on

