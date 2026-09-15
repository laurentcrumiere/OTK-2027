$PBExportHeader$w_envoi_medicalviewer_scanflow.srw
forward
global type w_envoi_medicalviewer_scanflow from window
end type
type dw_docus from datawindow within w_envoi_medicalviewer_scanflow
end type
type dw_planning from datawindow within w_envoi_medicalviewer_scanflow
end type
type uo_gearbox from gearbox within w_envoi_medicalviewer_scanflow
end type
type cb_fermer from commandbutton within w_envoi_medicalviewer_scanflow
end type
end forward

global type w_envoi_medicalviewer_scanflow from window
integer width = 6011
integer height = 3008
windowtype windowtype = response!
long backcolor = 67108864
string icon = "AppIcon!"
dw_docus dw_docus
dw_planning dw_planning
uo_gearbox uo_gearbox
cb_fermer cb_fermer
end type
global w_envoi_medicalviewer_scanflow w_envoi_medicalviewer_scanflow

on w_envoi_medicalviewer_scanflow.create
this.dw_docus=create dw_docus
this.dw_planning=create dw_planning
this.uo_gearbox=create uo_gearbox
this.cb_fermer=create cb_fermer
this.Control[]={this.dw_docus,&
this.dw_planning,&
this.uo_gearbox,&
this.cb_fermer}
end on

on w_envoi_medicalviewer_scanflow.destroy
destroy(this.dw_docus)
destroy(this.dw_planning)
destroy(this.uo_gearbox)
destroy(this.cb_fermer)
end on

event open;


// pour tous les patients de la journée ...

double v_code_patient
string v_dossier_envoi_medicalviewer,v_dossier_patient_envoi_medicalviewer, v_dossier_patient_photos
string v_document
long lig, tot
boolean fin_patient


select first dossier_envoi_medicalviewer into :v_dossier_envoi_medicalviewer from erasme_param ;


string v_nom_fichier_xml_temp,  v_nom_fichier_xml_final
string v_nom_fichier_coment_temp
long v_fichier_xml_temp, v_fichier_coment_temp
string v_identifiant_erasme
string v_nom, v_prenom, v_sexe
date v_date_naissance


// fichiers temporaires
v_nom_fichier_xml_temp = dir_ini + "temp_xml.tmp"
v_nom_fichier_coment_temp = dir_ini + "comment_txt.tmp"


// rendez-vous du jour
//------------------------------------------------------
dw_planning.SetTransObject(sqlca)
dw_planning.retrieve(today())

tot = dw_planning.rowcount()

for lig = 1 to tot
	
	v_code_patient = dw_planning.GetItemNumber(lig, "code")
	
	v_nom_fichier_xml_final = v_dossier_envoi_medicalviewer + string(v_code_patient)+".xml"
	v_dossier_patient_envoi_medicalviewer = v_dossier_envoi_medicalviewer + string(v_code_patient)
	v_dossier_patient_photos = dir_photos + string(v_code_patient) + "\"
	
	
	// Génération du fichier XML qui va bien
	v_fichier_xml_temp = FileOpen(v_nom_fichier_xml_temp, LineMode! , Write!, LockReadWrite! , Replace! )
	
	// recherche des infios patients
	select identifiant_erasme into :v_identifiant_erasme from erasme_patient where code_patient = :v_code_patient ;
	select isnull(nom,''), isnull(prenom,''), isnull(sexe,''), date_naissance into :v_nom, :v_prenom, :v_sexe, :v_date_naissance from patient where code = :v_code_patient ;
	
	FileWrite(v_fichier_xml_temp, '<?xml version="1.0" encoding="ISO-8859-1"  ?>')
	FileWrite(v_fichier_xml_temp,'<SDB_XML>')
	FileWrite(v_fichier_xml_temp,'<TYPE LEVEL="" REFFIELD="">ADD</TYPE>')
	FileWrite(v_fichier_xml_temp,'<VERSION>2</VERSION>')
	FileWrite(v_fichier_xml_temp,'<SOURCE>ORTHOKIS</SOURCE>')
	FileWrite(v_fichier_xml_temp,'<IMAGE_PATH>' + v_dossier_patient_envoi_medicalviewer + '</IMAGE_PATH>')
	FileWrite(v_fichier_xml_temp,'<CREATION_DATE>' + string(today(), 'yyyymmdd') + '</CREATION_DATE>')
	FileWrite(v_fichier_xml_temp,'<SCANOPERATOR>ORTHOKIS</SCANOPERATOR>')
	FileWrite(v_fichier_xml_temp,'<BATCHNAME>' + string(v_code_patient) + '</BATCHNAME>')
	FileWrite(v_fichier_xml_temp,'<SDB_FILE>')
	
	// Commentaires cliniques
	FileWrite(v_fichier_xml_temp,'<SDB_DOCUMENT>')
	FileWrite(v_fichier_xml_temp,'<NUMERO_PATIENT>' + v_identifiant_erasme + '</NUMERO_PATIENT>')
	FileWrite(v_fichier_xml_temp,'<DOC_DATE>' + string(today(), 'yyyymmdd') + '</DOC_DATE>')
	FileWrite(v_fichier_xml_temp,'<TREE_FID>0</TREE_FID >')
	FileWrite(v_fichier_xml_temp,'<SOURCE_DOC_PID> Commentaire Clinique</ SOURCE_DOC_PID>')
	FileWrite(v_fichier_xml_temp,'<NUMERO_HOPITAL>01</NUMERO_HOPITAL>')
//	FileWrite(v_fichier_xml_temp,'<NOM_PATIENT>' + v_nom +'</NOM_PATIENT>')
//	FileWrite(v_fichier_xml_temp,'<PRENOM_PATIENT>' + v_prenom + '</PRENOM_PATIENT>')
//	FileWrite(v_fichier_xml_temp,'<SEXE_PATIENT>' + v_sexe + '</SEXE_PATIENT>')
//	FileWrite(v_fichier_xml_temp,'<DATE_NAISSANCE_PATIENT>' + string(v_date_naissance, 'yyyymmdd')+ '</DATE_NAISSANCE_PATIENT>')
//	FileWrite(v_fichier_xml_temp,'<DATE_ENVOI>' + string(today(), 'yyyymmdd') +'</DATE_ENVOI>')
	FileWrite(v_fichier_xml_temp,'<DATE_PRODUCTION>' + string(today(), 'yyyymmdd')  + '</DATE_PRODUCTION>')
	FileWrite(v_fichier_xml_temp,'<SERVICE_PRESTATAIRE>8478</SERVICE_PRESTATAIRE>')
	FileWrite(v_fichier_xml_temp,'<CLASSE_1>500006</CLASSE_1>')
	FileWrite(v_fichier_xml_temp,'<CLASSE_2>0</CLASSE_2>')
	FileWrite(v_fichier_xml_temp,'<CLASSE_3>0</CLASSE_3>')
	FileWrite(v_fichier_xml_temp,'<CLASSE_4>0</CLASSE_4>')
	FileWrite(v_fichier_xml_temp,'<CLASSE_5>0</CLASSE_5>')
	FileWrite(v_fichier_xml_temp,'<CLASSE_6>0</CLASSE_6>')
	
	FileWrite(v_fichier_xml_temp,'<SDB_PAGE>')
	FileWrite(v_fichier_xml_temp,'<SDB_IMAGE>')
	FileWrite(v_fichier_xml_temp,'<IMAGE_PATH>Commentaires.txt</IMAGE_PATH>')
	FileWrite(v_fichier_xml_temp,'<IMAGE_DEFAULT_VISIBLE>True</IMAGE_DEFAULT_VISIBLE>')
	FileWrite(v_fichier_xml_temp,'</SDB_IMAGE>')
	FileWrite(v_fichier_xml_temp,'</SDB_PAGE>')
	FileWrite(v_fichier_xml_temp,'</SDB_DOCUMENT> ')
	
	//	Page 1
	FileWrite(v_fichier_xml_temp,'<SDB_DOCUMENT>')
	FileWrite(v_fichier_xml_temp,'<NUMERO_PATIENT>' + v_identifiant_erasme + '</NUMERO_PATIENT>')
	FileWrite(v_fichier_xml_temp,'<DOC_DATE>' + string(today(), 'yyyymmdd') + '</DOC_DATE>')
	FileWrite(v_fichier_xml_temp,'<TREE_FID>0</TREE_FID >')
	FileWrite(v_fichier_xml_temp,'<SOURCE_DOC_PID>Pages Cliniques</ SOURCE_DOC_PID>')
	FileWrite(v_fichier_xml_temp,'<NUMERO_HOPITAL>01</NUMERO_HOPITAL>')
	FileWrite(v_fichier_xml_temp,'<DATE_PRODUCTION>' + string(today(), 'yyyymmdd')  + '</DATE_PRODUCTION>')
	FileWrite(v_fichier_xml_temp,'<SERVICE_PRESTATAIRE>8478</SERVICE_PRESTATAIRE>')
	FileWrite(v_fichier_xml_temp,'<CLASSE_1>500006</CLASSE_1>')
	FileWrite(v_fichier_xml_temp,'<CLASSE_2>0</CLASSE_2>')
	FileWrite(v_fichier_xml_temp,'<CLASSE_3>0</CLASSE_3>')
	FileWrite(v_fichier_xml_temp,'<CLASSE_4>0</CLASSE_4>')
	FileWrite(v_fichier_xml_temp,'<CLASSE_5>0</CLASSE_5>')
	FileWrite(v_fichier_xml_temp,'<CLASSE_6>0</CLASSE_6>')

	FileWrite(v_fichier_xml_temp,'<SDB_PAGE>')
	FileWrite(v_fichier_xml_temp,'<SDB_IMAGE>')
	FileWrite(v_fichier_xml_temp,'<IMAGE_PATH>Page1.jpg</IMAGE_PATH>')
	FileWrite(v_fichier_xml_temp,'<IMAGE_DEFAULT_VISIBLE>True</IMAGE_DEFAULT_VISIBLE>')
	FileWrite(v_fichier_xml_temp,'</SDB_IMAGE>')
	FileWrite(v_fichier_xml_temp,'</SDB_PAGE>')
	
	FileWrite(v_fichier_xml_temp,'<SDB_PAGE>')
	FileWrite(v_fichier_xml_temp,'<SDB_IMAGE>')
	FileWrite(v_fichier_xml_temp,'<IMAGE_PATH>Page2.jpg</IMAGE_PATH>')
	FileWrite(v_fichier_xml_temp,'<IMAGE_DEFAULT_VISIBLE>True</IMAGE_DEFAULT_VISIBLE>')
	FileWrite(v_fichier_xml_temp,'</SDB_IMAGE>')
	FileWrite(v_fichier_xml_temp,'</SDB_PAGE>')

	FileWrite(v_fichier_xml_temp,'<SDB_PAGE>')
	FileWrite(v_fichier_xml_temp,'<SDB_IMAGE>')
	FileWrite(v_fichier_xml_temp,'<IMAGE_PATH>Page3.jpg</IMAGE_PATH>')
	FileWrite(v_fichier_xml_temp,'<IMAGE_DEFAULT_VISIBLE>True</IMAGE_DEFAULT_VISIBLE>')
	FileWrite(v_fichier_xml_temp,'</SDB_IMAGE>')
	FileWrite(v_fichier_xml_temp,'</SDB_PAGE>')

	FileWrite(v_fichier_xml_temp,'<SDB_PAGE>')
	FileWrite(v_fichier_xml_temp,'<SDB_IMAGE>')
	FileWrite(v_fichier_xml_temp,'<IMAGE_PATH>Page4.jpg</IMAGE_PATH>')
	FileWrite(v_fichier_xml_temp,'<IMAGE_DEFAULT_VISIBLE>True</IMAGE_DEFAULT_VISIBLE>')
	FileWrite(v_fichier_xml_temp,'</SDB_IMAGE>')
	FileWrite(v_fichier_xml_temp,'</SDB_PAGE>')

	FileWrite(v_fichier_xml_temp,'</SDB_DOCUMENT> ')

	FileWrite(v_fichier_xml_temp,'</SDB_FILE>')
	FileWrite(v_fichier_xml_temp,'</SDB_XML>')

	
	FileClose(v_fichier_xml_temp)
	
	
	// Le fichier XML est prêt !!!
	
	// Génération du fichier comment.tmp
	v_fichier_coment_temp= FileOpen(v_nom_fichier_coment_temp, LineMode! , Write!, LockReadWrite! , Replace! )
	FileWrite(v_fichier_coment_temp,"Test de commentaire")
	FileClose(v_fichier_coment_temp)
	
	
	// Copie des ecrans ... 
	if Not DirectoryExists( v_dossier_patient_envoi_medicalviewer) then
		CreateDirectory(v_dossier_patient_envoi_medicalviewer)
	end if
	
	FileCopy(v_nom_fichier_coment_temp, v_dossier_patient_envoi_medicalviewer + "\Commentaires.txt", true )
	
	// Copie d'écran pages cliniques
	// Méthodologie :
	// - variable instance : 
	//				integer secondes_attente = 3
	//
	// - Script timer :
	//				secondes_attente = secondes_attente - 1
	//			
	//				if secondes_attente = 1 then
	//					fxg_copie_ecran(var_code_local,"page1.jpg", this)
	//				end if
	//				
	//				if secondes_attente = 0 then
	//					close(this)
	//				end if
	//	
	
	// Script show :
	//				secondes_attente = 3
	//				timer(1)
	//				

	// Fenêtre en Response 
	
	OpenWithParm(w_diagnos_maj_87669_1_timer, v_code_patient)
	OpenWithParm(w_diagnos_maj_87669_2_timer, v_code_patient)
	OpenWithParm(w_diagnos_maj_87669_3_timer, v_code_patient)
	OpenWithParm(w_diagnos_maj_87669_4_timer, v_code_patient)
	

	
	// Copie des Fichiers
	FileCopy(v_dossier_patient_photos+'page1.jpg', v_dossier_patient_envoi_medicalviewer + "\page1.jpg", true )
	FileCopy(v_dossier_patient_photos+'page2.jpg', v_dossier_patient_envoi_medicalviewer + "\page2.jpg", true )
	FileCopy(v_dossier_patient_photos+'page3.jpg', v_dossier_patient_envoi_medicalviewer + "\page3.jpg", true )
	FileCopy(v_dossier_patient_photos+'page4.jpg', v_dossier_patient_envoi_medicalviewer + "\page4.jpg", true )
	
	FileCopy(v_nom_fichier_xml_temp, v_nom_fichier_xml_final, true )
	
Next


// Courriers Word
//------------------------------------------------------
dw_docus.SetTransObject(sqlca)
dw_docus.retrieve(today())

tot = dw_docus.rowcount()

for lig = 1 to tot
	
	v_code_patient = dw_docus.GetItemNumber(lig, "code")
	
	
	v_nom_fichier_xml_final = v_dossier_envoi_medicalviewer + "w"+ string(v_code_patient)+".xml"
	v_dossier_patient_envoi_medicalviewer = v_dossier_envoi_medicalviewer + "w" + string(v_code_patient)
	v_dossier_patient_photos = dir_photos + string(v_code_patient) + "\"
	
	
	// Génération du fichier XML qui va bien
	v_fichier_xml_temp = FileOpen(v_nom_fichier_xml_temp, LineMode! , Write!, LockReadWrite! , Replace! )
	
	// recherche des infios patients
	select identifiant_erasme into :v_identifiant_erasme from erasme_patient where code_patient = :v_code_patient ;
	select isnull(nom,''), isnull(prenom,''), isnull(sexe,''), date_naissance into :v_nom, :v_prenom, :v_sexe, :v_date_naissance from patient where code = :v_code_patient ;
	
	FileWrite(v_fichier_xml_temp, '<?xml version="1.0" encoding="ISO-8859-1"  ?>')
	FileWrite(v_fichier_xml_temp,'<SDB_XML>')
	FileWrite(v_fichier_xml_temp,'<TYPE LEVEL="" REFFIELD="">ADD</TYPE>')
	FileWrite(v_fichier_xml_temp,'<VERSION>2</VERSION>')
	FileWrite(v_fichier_xml_temp,'<SOURCE>ORTHOKIS</SOURCE>')
	FileWrite(v_fichier_xml_temp,'<IMAGE_PATH>' + v_dossier_patient_envoi_medicalviewer + '</IMAGE_PATH>')
	FileWrite(v_fichier_xml_temp,'<CREATION_DATE>' + string(today(), 'yyyymmdd') + '</CREATION_DATE>')
	FileWrite(v_fichier_xml_temp,'<SCANOPERATOR>ORTHOKIS</SCANOPERATOR>')
	FileWrite(v_fichier_xml_temp,'<BATCHNAME>' + 'w' + string(v_code_patient) + '</BATCHNAME>')
	FileWrite(v_fichier_xml_temp,'<SDB_FILE>')
	
	// Documents
	FileWrite(v_fichier_xml_temp,'<SDB_DOCUMENT>')
	FileWrite(v_fichier_xml_temp,'<NUMERO_PATIENT>' + v_identifiant_erasme + '</NUMERO_PATIENT>')
	FileWrite(v_fichier_xml_temp,'<DOC_DATE>' + string(today(), 'yyyymmdd') + '</DOC_DATE>')
	FileWrite(v_fichier_xml_temp,'<TREE_FID>0</TREE_FID >')
	
	// Création du dossier MedicalViewer
	if Not DirectoryExists( v_dossier_patient_envoi_medicalviewer) then
		CreateDirectory(v_dossier_patient_envoi_medicalviewer)
	end if

	
	// pour chacun des documents du patient
	fin_patient = false
	do while  not fin_patient
		if v_code_patient = dw_docus.GetItemNumber(lig, "code") then
			v_document = dw_docus.GetItemString(lig, "nom_courrier") 
			
			FileWrite(v_fichier_xml_temp,'<SOURCE_DOC_PID>Documents</ SOURCE_DOC_PID>')
			FileWrite(v_fichier_xml_temp,'<NUMERO_HOPITAL>01</NUMERO_HOPITAL>')
			FileWrite(v_fichier_xml_temp,'<DATE_PRODUCTION>' + string(today(), 'yyyymmdd')  + '</DATE_PRODUCTION>')
			FileWrite(v_fichier_xml_temp,'<SERVICE_PRESTATAIRE>8478</SERVICE_PRESTATAIRE>')
			FileWrite(v_fichier_xml_temp,'<CLASSE_1>500006</CLASSE_1>')
			FileWrite(v_fichier_xml_temp,'<CLASSE_2>0</CLASSE_2>')
			FileWrite(v_fichier_xml_temp,'<CLASSE_3>0</CLASSE_3>')
			FileWrite(v_fichier_xml_temp,'<CLASSE_4>0</CLASSE_4>')
			FileWrite(v_fichier_xml_temp,'<CLASSE_5>0</CLASSE_5>')
			FileWrite(v_fichier_xml_temp,'<CLASSE_6>0</CLASSE_6>')
			
			FileWrite(v_fichier_xml_temp,'<SDB_PAGE>')
			FileWrite(v_fichier_xml_temp,'<SDB_IMAGE>')
			FileWrite(v_fichier_xml_temp,'<IMAGE_PATH>' + v_document + '</IMAGE_PATH>')
			FileWrite(v_fichier_xml_temp,'<IMAGE_DEFAULT_VISIBLE>True</IMAGE_DEFAULT_VISIBLE>')
			FileWrite(v_fichier_xml_temp,'</SDB_IMAGE>')
			FileWrite(v_fichier_xml_temp,'</SDB_PAGE>')
			FileWrite(v_fichier_xml_temp,'</SDB_DOCUMENT> ')
			
			// Copie du fichier 
			FileCopy(v_dossier_patient_photos+v_document, v_dossier_patient_envoi_medicalviewer + +"\" + v_document, true )
		end if
		
		lig = lig + 1 
		if lig > tot  then 
			fin_patient = true
		else
			if v_code_patient <> dw_docus.GetItemNumber(lig, "code") then
				fin_patient = true
				// on fait un -1 car le next va en ajouter 1
				lig = lig - 1
			end if
		end if

	loop
	
	FileWrite(v_fichier_xml_temp,'</SDB_FILE>')
	FileWrite(v_fichier_xml_temp,'</SDB_XML>')
	FileClose(v_fichier_xml_temp)

	
	// Patient fini ... faut copier ce qu'il faut ....
	
	// Copie du XML.. 
	
	FileCopy(v_nom_fichier_xml_temp, v_nom_fichier_xml_final , true )
	
	
next

end event

type dw_docus from datawindow within w_envoi_medicalviewer_scanflow
boolean visible = false
integer x = 361
integer y = 1104
integer width = 1307
integer height = 916
integer taborder = 20
string title = "none"
string dataobject = "dw_docus"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type dw_planning from datawindow within w_envoi_medicalviewer_scanflow
boolean visible = false
integer x = 361
integer y = 168
integer width = 1307
integer height = 916
integer taborder = 10
string title = "none"
string dataobject = "dw_rdv"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type uo_gearbox from gearbox within w_envoi_medicalviewer_scanflow
boolean visible = false
integer x = 160
integer y = 1180
integer taborder = 10
end type

on uo_gearbox.destroy
call gearbox::destroy
end on

type cb_fermer from commandbutton within w_envoi_medicalviewer_scanflow
integer x = 3387
integer y = 1608
integer width = 402
integer height = 112
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "&Fermer"
end type

event clicked;


close(parent)


end event

