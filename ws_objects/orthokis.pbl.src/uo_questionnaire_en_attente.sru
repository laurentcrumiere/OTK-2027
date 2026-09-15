$PBExportHeader$uo_questionnaire_en_attente.sru
forward
global type uo_questionnaire_en_attente from picturebutton
end type
end forward

global type uo_questionnaire_en_attente from picturebutton
integer width = 110
integer height = 96
integer textsize = -14
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "lc_questionnaire.png"
string powertiptext = "Questionnaireen attente"
long textcolor = 255
long backcolor = 553648127
end type
global uo_questionnaire_en_attente uo_questionnaire_en_attente

type variables


double var_code_local
end variables

forward prototypes
public function integer init (double db_code_patient)
end prototypes

public function integer init (double db_code_patient);integer i_questionnaires

var_code_local = db_code_patient


// Renvoie le nombre de qeustionnaire en attente de validation
select isnull(count(*), 0) into :i_questionnaires 
    FROM "patient",   
         "patient_questionnaires_medicaux"  
   WHERE
         ( "patient"."code" = "patient_questionnaires_medicaux"."code" ) and  
         ( "patient"."code" = :db_code_patient ) AND  (validation is null) ; 
      
			
if i_questionnaires > 0 then
	this.text = string(i_questionnaires)
	if i_questionnaires  = 1 then
		this.PowerTipText = "1 questionnaire en attente"
	else
		this.PowerTipText = string(i_questionnaires) + " questionnaires en attente"
	end if
else
	this.visible = false
end if

return i_questionnaires
end function

on uo_questionnaire_en_attente.create
end on

on uo_questionnaire_en_attente.destroy
end on

event clicked;// Ouverture de la liste des documents
if ui_v2020 then 
	if isvalid(w_liste_patients_questionnaire_medical) then
		// on la ferme par sécurité pour etre sur qu on a les bonnes infos
		fermer_fenetre(w_liste_patients_questionnaire_medical)
	end if

	if fxg_ouverture_onglet_possible() then
		
		w_mdi_2020.uo_powerdock.of_openDocument(w_liste_patients_questionnaire_medical, "Documents en attente de Signature", image_menu_listes_clinique)

		// Mise en place des param qui vont bien
		w_liste_patients_questionnaire_medical.em_date_min.SetDate(date(1900, 1, 1))

		double db_numero_dossier
		select numero_dossier into :db_numero_dossier from patient where code = :var_code_local ;
		w_liste_patients_questionnaire_medical.em_min.text = string(db_numero_dossier)
		w_liste_patients_questionnaire_medical.em_max.text = string(db_numero_dossier)
		w_liste_patients_questionnaire_medical.cb_ecran.triggerevent(clicked!)
	
	end if

end if
end event

