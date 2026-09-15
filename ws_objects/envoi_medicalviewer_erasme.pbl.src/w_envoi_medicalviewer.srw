$PBExportHeader$w_envoi_medicalviewer.srw
forward
global type w_envoi_medicalviewer from window
end type
type cb_lancer from commandbutton within w_envoi_medicalviewer
end type
type em_d2 from editmask within w_envoi_medicalviewer
end type
type st_2 from statictext within w_envoi_medicalviewer
end type
type em_d1 from editmask within w_envoi_medicalviewer
end type
type st_1 from statictext within w_envoi_medicalviewer
end type
type cb_1 from commandbutton within w_envoi_medicalviewer
end type
type st_statut from statictext within w_envoi_medicalviewer
end type
type dw_coment from datawindow within w_envoi_medicalviewer
end type
type dw_docus from datawindow within w_envoi_medicalviewer
end type
type dw_planning from datawindow within w_envoi_medicalviewer
end type
type uo_gearbox from gearbox within w_envoi_medicalviewer
end type
type cb_fermer from commandbutton within w_envoi_medicalviewer
end type
end forward

global type w_envoi_medicalviewer from window
integer width = 3794
integer height = 676
boolean titlebar = true
string title = "Envoi vers MedicalViever - Mode Manuel"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
cb_lancer cb_lancer
em_d2 em_d2
st_2 st_2
em_d1 em_d1
st_1 st_1
cb_1 cb_1
st_statut st_statut
dw_coment dw_coment
dw_docus dw_docus
dw_planning dw_planning
uo_gearbox uo_gearbox
cb_fermer cb_fermer
end type
global w_envoi_medicalviewer w_envoi_medicalviewer

type variables



double v_code_patient
string v_dossier_envoi_medicalviewer 
end variables

forward prototypes
public function string nom_fichier_medicalviewer (string type_docu)
public subroutine decouper_ligne_tab (string v_ligne, ref string tab[], ref integer v_nb_lignes_tab)
public subroutine ecrire_tab (string tab[], integer v_nb_lignes_tab, integer v_fichier)
public subroutine traitement_journee (date date_jour)
end prototypes

public function string nom_fichier_medicalviewer (string type_docu);
// Construction du nom de fichier Medical Viewer

// Type docu : 
// - P : pages cliniques
// - C : Commentaires cliniques
// - W : Word


string v_identifiant_erasme
string v_nom_fichier, v_from_application
double v_chrono

select isnull(identifiant_erasme,'') into :v_identifiant_erasme from erasme_patient where code_patient = :v_code_patient ;

string v_dossier_envoi

select first isnull(chrono_medicalviewer,0) into :v_chrono from erasme_param ;
v_chrono = v_chrono + 1
update erasme_param set chrono_medicalviewer = :v_chrono ;
commit ;

if type_docu = "C" then
	v_dossier_envoi = v_dossier_envoi_medicalviewer + "txt\"
	v_from_application = "orthokis"
else
	v_dossier_envoi = v_dossier_envoi_medicalviewer + "doc\"
	if type_docu = "P" then
		v_from_application = "orthokis_clinical"
	else
		v_from_application = "orthokis_general"
	end if
end if


//v_nom_fichier = v_dossier_envoi + string(today(),"yyyymmddhhmm") + "." + string(v_chrono) + "." + v_from_application + "." + v_identifiant_erasme 


v_nom_fichier = v_dossier_envoi + string(today(),"yyyymmdd") + string(now(),"hhmm") + "." + string(v_chrono) + "." + v_from_application + "." + v_identifiant_erasme 



if type_docu = "P" or type_docu = "W" then
	v_nom_fichier = v_nom_fichier + ".doc"
else
	v_nom_fichier = v_nom_fichier + ".txt"
end if
	

return v_nom_fichier
end function

public subroutine decouper_ligne_tab (string v_ligne, ref string tab[], ref integer v_nb_lignes_tab);

// remplit tab[] avec les lignes de v_ligne , séparé par un char(10)
// renvoie aussi le nombre de lignes dans v_nb_lignes_tab

integer v_pos_char10, v_pos_cour
integer v_cpt

//setnull(tab)

v_pos_char10 = pos(v_ligne, char(10), 1)

if v_pos_char10 = 0 then
	tab[1] = v_ligne
	v_nb_lignes_tab = 1
else
	
	v_cpt = 1
	v_pos_cour = 1
	
	do while v_pos_char10 > 0 
		
		tab[v_cpt] = mid(v_ligne, v_pos_cour, v_pos_char10 - v_pos_cour )
		v_pos_cour = v_pos_char10 + 1
		v_pos_char10 = pos(v_ligne, char(10), v_pos_cour)
		v_cpt = v_cpt + 1
		
	loop

	// pour la dernière partie
	tab[v_cpt] = mid(v_ligne, v_pos_cour, len(v_ligne) - v_pos_cour + 1 )
	v_nb_lignes_tab = v_cpt
end if

end subroutine

public subroutine ecrire_tab (string tab[], integer v_nb_lignes_tab, integer v_fichier);// Ecrit le tableau en autant de ligne dans le fichier


integer lig 

for lig = 1 to v_nb_lignes_tab
	
	FileWrite(v_fichier, tab[lig])
	
next
end subroutine

public subroutine traitement_journee (date date_jour);// pour tous les patients de la journée ...


string v_dossier_patient_photos
string v_document
long lig, tot, ligcom, totcom
boolean fin_patient

string tab[]

string v_fichier_pages_cliniques, v_fichier_pages_cliniques_medicalviewer

string v_fichier_word_medicalviewer

integer v_nb_lignes_tab

select first dossier_envoi_medicalviewer into :v_dossier_envoi_medicalviewer from erasme_param ;


string v_nom_fichier_coment_temp, v_fichier_coment_medicalviewer
long v_fichier_coment_temp

string v_identifiant_erasme
string v_nom, v_prenom, v_sexe
date v_date_naissance

// pour utiliser des fonctions standards
m_btdroit_gearbox m_menu_gearbox
m_menu_gearbox = create m_btdroit_gearbox

uo_lien_word uo_word
uo_word = create uo_lien_word

// fichiers temporaires
v_nom_fichier_coment_temp = dir_ini + "comment_txt.tmp"

// Commentaires cliniques
dw_coment.settransobject(sqlca)

// rendez-vous du jour
//------------------------------------------------------
dw_planning.SetTransObject(sqlca)
dw_planning.retrieve(date_jour)

tot = dw_planning.rowcount()

for lig = 1 to tot
	
	v_code_patient = dw_planning.GetItemNumber(lig, "code")
	
	v_dossier_patient_photos = dir_photos + string(v_code_patient) + "\"
	
	st_statut.text = "Patient journée du " + string(date_jour) + " : "+string(lig)+"/"+string(tot) 
	yield()
	
	//	Pages Cliniques 
	//  Docu Word : "Pages_Cliniques_MedicalViewer.doc"
	// ===============================================================================

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
	
	// patient courant
	var_code = v_code_patient 
	
	// Génération du courrier Word contenant
	m_menu_gearbox.utiliser_office("E", 0)

	// Le fichier généré est inscrit en base de registre
	
	RegistryGet(uo_word.param_inter_proc, uo_word.var8, RegString!, v_fichier_pages_cliniques)
	 
	if FileExists(v_fichier_pages_cliniques) then
		// Le fichier Word est bien généré dans le doosier du patient
		v_fichier_pages_cliniques_medicalviewer = nom_fichier_MedicalViewer("P")
		// Copie du fichier au bon endroit
		FileCopy(v_fichier_pages_cliniques, v_fichier_pages_cliniques_medicalviewer)
		trace("Fichier départ : " + v_fichier_pages_cliniques)
		trace("Fichier arrivée : " + v_fichier_pages_cliniques_medicalviewer)
		// Suppression du fichier d'origine
		FileDelete(v_fichier_pages_cliniques)
	end if
	
	//	Commentaires Cliniques 
	// ===============================================================================


	dw_coment.retrieve(v_code_patient, date_jour)
	totcom =  dw_coment.rowcount()
	
	if totcom > 0 then
		// Génération du fichier comment.tmp
		v_fichier_coment_temp= FileOpen(v_nom_fichier_coment_temp, LineMode! , Write!, LockReadWrite! , Replace! )
		FileWrite (v_fichier_coment_temp, "Commentaire du  : "+string(date_jour)  + "  (" +  dw_coment.GetItemString(1, "intervenant")  + ")"   )  
		FileWrite (v_fichier_coment_temp, "")
		
		for ligcom = 1 to totcom
			decouper_ligne_tab (dw_coment.GetItemString(ligcom, "com_html") , tab[], v_nb_lignes_tab )
			Ecrire_tab( tab, v_nb_lignes_tab, v_fichier_coment_temp )
		Next
		
		// acte prevu
		FileWrite (v_fichier_coment_temp, "")
		FileWrite (v_fichier_coment_temp, "Acte prévu  : ")
		FileWrite (v_fichier_coment_temp, "")
		for ligcom = 1 to totcom
			decouper_ligne_tab (dw_coment.GetItemString(ligcom, "acte_prevu_html") , tab[], v_nb_lignes_tab )
			Ecrire_tab( tab, v_nb_lignes_tab, v_fichier_coment_temp )
		Next
		FileClose(v_fichier_coment_temp)
		
		// Copie du fichier au bon endroit
		v_fichier_coment_medicalviewer = nom_fichier_MedicalViewer("C")
		// Copie du fichier au bon endroit
		FileCopy(v_nom_fichier_coment_temp, v_fichier_coment_medicalviewer)
		trace("Fichier départ : " + v_nom_fichier_coment_temp)
		trace("Fichier arrivée : " + v_fichier_coment_medicalviewer)
		// Suppression du fichier d'origine
		FileDelete(v_nom_fichier_coment_temp)
	
	end if
	
	
	
Next


// Courriers Word
//------------------------------------------------------
dw_docus.SetTransObject(sqlca)
dw_docus.retrieve(date_jour)

tot = dw_docus.rowcount()

for lig = 1 to tot
	
	v_code_patient = dw_docus.GetItemNumber(lig, "code")
	st_statut.text = "Courriers journée du " + string(date_jour) + " : "+string(lig)+"/"+string(tot) 
	yield()

	// pour chacun des documents du patient
	fin_patient = false
	do while  not fin_patient
		if v_code_patient = dw_docus.GetItemNumber(lig, "code") then
			v_document = dw_docus.GetItemString(lig, "nom_courrier") 
			v_dossier_patient_photos = dir_photos + string(v_code_patient) + "\"
			v_fichier_word_medicalviewer = nom_fichier_MedicalViewer("W")
			
			// Copie du fichier 
			FileCopy(v_dossier_patient_photos+v_document,v_fichier_word_medicalviewer )
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
	
next


st_statut.text = "" 
yield()

end subroutine

on w_envoi_medicalviewer.create
this.cb_lancer=create cb_lancer
this.em_d2=create em_d2
this.st_2=create st_2
this.em_d1=create em_d1
this.st_1=create st_1
this.cb_1=create cb_1
this.st_statut=create st_statut
this.dw_coment=create dw_coment
this.dw_docus=create dw_docus
this.dw_planning=create dw_planning
this.uo_gearbox=create uo_gearbox
this.cb_fermer=create cb_fermer
this.Control[]={this.cb_lancer,&
this.em_d2,&
this.st_2,&
this.em_d1,&
this.st_1,&
this.cb_1,&
this.st_statut,&
this.dw_coment,&
this.dw_docus,&
this.dw_planning,&
this.uo_gearbox,&
this.cb_fermer}
end on

on w_envoi_medicalviewer.destroy
destroy(this.cb_lancer)
destroy(this.em_d2)
destroy(this.st_2)
destroy(this.em_d1)
destroy(this.st_1)
destroy(this.cb_1)
destroy(this.st_statut)
destroy(this.dw_coment)
destroy(this.dw_docus)
destroy(this.dw_planning)
destroy(this.uo_gearbox)
destroy(this.cb_fermer)
end on

event open;

if mode_manuel then
	
	em_d1.text = string(today())
	em_d2.text = string(today())
	
else
	
	
	traitement_journee(today())
	
	st_statut.text = "" 
	yield()
	
	close(this)
end if
end event

type cb_lancer from commandbutton within w_envoi_medicalviewer
integer x = 2231
integer y = 16
integer width = 402
integer height = 112
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "&Lancer"
end type

event clicked;

// lancement plusieur jours

date v_date_jour


v_date_jour = date(em_d1.text)

do while v_date_jour <= date(em_d2.text)
	
	traitement_journee(v_date_jour)
	
	v_date_jour = relativedate(v_date_jour, 1)
	
loop



close(parent)
end event

type em_d2 from editmask within w_envoi_medicalviewer
integer x = 1248
integer y = 8
integer width = 599
integer height = 120
integer taborder = 20
integer textsize = -12
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
string text = "none"
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "dd/mm/yyyy"
boolean dropdowncalendar = true
end type

type st_2 from statictext within w_envoi_medicalviewer
integer x = 1006
integer y = 28
integer width = 288
integer height = 80
integer textsize = -12
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long backcolor = 67108864
string text = "Au"
alignment alignment = center!
boolean focusrectangle = false
end type

type em_d1 from editmask within w_envoi_medicalviewer
integer x = 361
integer y = 8
integer width = 599
integer height = 120
integer taborder = 20
integer textsize = -12
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
string text = "none"
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "dd/mm/yyyy"
boolean dropdowncalendar = true
end type

type st_1 from statictext within w_envoi_medicalviewer
integer x = 78
integer y = 28
integer width = 288
integer height = 80
integer textsize = -12
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long backcolor = 67108864
string text = "Du"
alignment alignment = center!
boolean focusrectangle = false
end type

type cb_1 from commandbutton within w_envoi_medicalviewer
boolean visible = false
integer x = 1435
integer y = 56
integer width = 402
integer height = 112
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Test"
end type

event clicked;

// pour tous les patients de la journée ...


string v_dossier_patient_photos
string v_document
long lig, tot, ligcom, totcom
boolean fin_patient

string v_fichier_pages_cliniques, v_fichier_pages_cliniques_medicalviewer

string v_fichier_word_medicalviewer

select first dossier_envoi_medicalviewer into :v_dossier_envoi_medicalviewer from erasme_param ;


string v_nom_fichier_coment_temp, v_fichier_coment_medicalviewer
long v_fichier_coment_temp

string v_identifiant_erasme
string v_nom, v_prenom, v_sexe
date v_date_naissance

string v_ligne, tab[]

// pour utiliser des fonctions standards
m_btdroit_gearbox m_menu_gearbox
m_menu_gearbox = create m_btdroit_gearbox

uo_lien_word uo_word
uo_word = create uo_lien_word

// fichiers temporaires
v_nom_fichier_coment_temp = dir_ini + "comment_txt.tmp"

// Commentaires cliniques
dw_coment.settransobject(sqlca)

dw_planning.SetTransObject(sqlca)
dw_planning.retrieve(today())

tot = dw_planning.rowcount()


for lig = 1 to tot
	
	v_code_patient = dw_planning.GetItemNumber(lig, "code")

dw_coment.retrieve(v_code_patient, today())
	totcom =  dw_coment.rowcount()
	
	if totcom > 0 then
		// Génération du fichier comment.tmp
		v_fichier_coment_temp= FileOpen(v_nom_fichier_coment_temp, LineMode!  , Write!, LockReadWrite! , Replace! )
		FileWrite (v_fichier_coment_temp, "Commentaire du  : "+string(today()))
		for ligcom = 1 to totcom
			FileWrite (v_fichier_coment_temp, "")
			
//			decouper_ligne_tab (dw_coment.GetItemString(ligcom, "com_html") , tab[] )
//			Ecrire_tab( tab, v_fichier_coment_temp )
			
		Next
		FileClose(v_fichier_coment_temp)
	end if
	
			// Copie du fichier au bon endroit
		v_fichier_coment_medicalviewer = nom_fichier_MedicalViewer("C")
		// Copie du fichier au bon endroit
		FileCopy(v_nom_fichier_coment_temp, v_fichier_coment_medicalviewer)
		// Suppression du fichier d'origine
		FileDelete(v_nom_fichier_coment_temp)
		
next
end event

type st_statut from statictext within w_envoi_medicalviewer
integer x = 462
integer y = 288
integer width = 2592
integer height = 164
integer textsize = -12
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 255
long backcolor = 67108864
alignment alignment = center!
boolean focusrectangle = false
end type

type dw_coment from datawindow within w_envoi_medicalviewer
boolean visible = false
integer x = 1787
integer y = 172
integer width = 2455
integer height = 916
integer taborder = 20
string title = "none"
string dataobject = "dw_coment"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type dw_docus from datawindow within w_envoi_medicalviewer
boolean visible = false
integer x = 667
integer y = 304
integer width = 1307
integer height = 916
integer taborder = 20
string title = "none"
string dataobject = "dw_docus"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type dw_planning from datawindow within w_envoi_medicalviewer
boolean visible = false
integer x = 41
integer y = 4
integer width = 1307
integer height = 916
integer taborder = 10
string title = "none"
string dataobject = "dw_rdv"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type uo_gearbox from gearbox within w_envoi_medicalviewer
boolean visible = false
integer x = 160
integer y = 1180
integer taborder = 10
end type

on uo_gearbox.destroy
call gearbox::destroy
end on

type cb_fermer from commandbutton within w_envoi_medicalviewer
integer x = 2752
integer y = 16
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

