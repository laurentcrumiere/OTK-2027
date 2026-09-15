$PBExportHeader$uo_document_a_signer.sru
forward
global type uo_document_a_signer from picturebutton
end type
end forward

global type uo_document_a_signer from picturebutton
integer width = 110
integer height = 96
integer textsize = -14
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "lc_signature.png"
boolean map3dcolors = true
string powertiptext = "Documents en attente de signature"
long textcolor = 255
long backcolor = 553648127
end type
global uo_document_a_signer uo_document_a_signer

type variables

double var_code_local
end variables

forward prototypes
public function integer init (double db_code_patient)
end prototypes

public function integer init (double db_code_patient);integer i_doc_a_signer

var_code_local = db_code_patient

// Renvoie le nombre de document à signer et met le chiffre sur le bouton
Select isnull(count(*), 0) into :i_doc_a_signer
    FROM "patient",   
         "historique_editions"  
   WHERE 
         ( "patient"."code" = "historique_editions"."code" ) and  
         (  "patient"."code" = :db_code_patient ) AND  
         ( "historique_editions"."statut_signature" in ('A1', 'A2', 'A3')  ) ;
			
if i_doc_a_signer > 0 then
	this.text = string(i_doc_a_signer)
	if i_doc_a_signer  = 1 then
		this.PowerTipText = "1 document en attente de signature"
	else
		this.PowerTipText = string(i_doc_a_signer) + " documents en attente de signature"
	end if
else
	this.visible = false
end if

return i_doc_a_signer
end function

on uo_document_a_signer.create
end on

on uo_document_a_signer.destroy
end on

event clicked;// Ouverture de la liste des documents
if ui_v2020 then 
	if isvalid(w_liste_documents_attente_signature_en_ligne) then
		// on la ferme par sécurité pour etre sur qu on a les bonnes infos
		fermer_fenetre(w_liste_documents_attente_signature_en_ligne)
	end if

	if fxg_ouverture_onglet_possible() then
		
		w_mdi_2020.uo_powerdock.of_openDocument(w_liste_documents_attente_signature_en_ligne, "Documents en attente de Signature", image_menu_listes_admini)

		// Mise en place des param qui vont bien
		w_liste_documents_attente_signature_en_ligne.em_date_min.text = "01/01/1900"
		w_liste_documents_attente_signature_en_ligne.rb_un_pat.checked = true
		w_liste_documents_attente_signature_en_ligne.var_code_local = this.var_code_local
		// Pour que le titre de la liste soit correct 
		string s_nom
		select nom + ' '+ prenom into :s_nom from patient where code = :var_code_local ;
		w_liste_documents_attente_signature_en_ligne.sle_pat.text = s_nom
		w_liste_documents_attente_signature_en_ligne.cb_ecran.triggerevent(clicked!)
	
	end if

end if
end event

