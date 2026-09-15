$PBExportHeader$w_import_myray_as.srw
forward
global type w_import_myray_as from w_fenetre_arakis
end type
type cb_1 from uo_picturebutton_390x120_fermer within w_import_myray_as
end type
type st_patient from statictext within w_import_myray_as
end type
type cb_2 from uo_picturebutton_390x120 within w_import_myray_as
end type
type st_1 from statictext within w_import_myray_as
end type
type mle_commentaires from multilineedit within w_import_myray_as
end type
type cb_ajouter_moulage from uo_picturebutton_390x120 within w_import_myray_as
end type
type dw_documents from u_basedw within w_import_myray_as
end type
type cb_orthup from uo_picturebutton_390x120 within w_import_myray_as
end type
type lb_files from listbox within w_import_myray_as
end type
type cb_3 from uo_picturebutton_390x120 within w_import_myray_as
end type
end forward

global type w_import_myray_as from w_fenetre_arakis
integer width = 3346
integer height = 1032
string title = "Passerelle MyRay AS Connect / Dental Design"
boolean controlmenu = false
boolean minbox = false
boolean maxbox = false
boolean resizable = false
windowtype windowtype = response!
boolean center = true
cb_1 cb_1
st_patient st_patient
cb_2 cb_2
st_1 st_1
mle_commentaires mle_commentaires
cb_ajouter_moulage cb_ajouter_moulage
dw_documents dw_documents
cb_orthup cb_orthup
lb_files lb_files
cb_3 cb_3
end type
global w_import_myray_as w_import_myray_as

type variables

// Patient
double v_code_local
string v_nom_local, v_prenom_local
string v_sexe_local , v_email_local, v_portable_local
date v_date_naissance_local

// praticien
string v_nom_praticien_local, v_prenom_praticien_local
string v_email_praticien_local


string s_path_connect, s_exe_connect
string s_path_cas 

// Dossier des messages
string as_dossier_json 


string s_exe_model_builder, s_path_model_builder
string s_exe_treatment , s_path_treatment , s_echanges 

end variables

on w_import_myray_as.create
int iCurrent
call super::create
this.cb_1=create cb_1
this.st_patient=create st_patient
this.cb_2=create cb_2
this.st_1=create st_1
this.mle_commentaires=create mle_commentaires
this.cb_ajouter_moulage=create cb_ajouter_moulage
this.dw_documents=create dw_documents
this.cb_orthup=create cb_orthup
this.lb_files=create lb_files
this.cb_3=create cb_3
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_1
this.Control[iCurrent+2]=this.st_patient
this.Control[iCurrent+3]=this.cb_2
this.Control[iCurrent+4]=this.st_1
this.Control[iCurrent+5]=this.mle_commentaires
this.Control[iCurrent+6]=this.cb_ajouter_moulage
this.Control[iCurrent+7]=this.dw_documents
this.Control[iCurrent+8]=this.cb_orthup
this.Control[iCurrent+9]=this.lb_files
this.Control[iCurrent+10]=this.cb_3
end on

on w_import_myray_as.destroy
call super::destroy
destroy(this.cb_1)
destroy(this.st_patient)
destroy(this.cb_2)
destroy(this.st_1)
destroy(this.mle_commentaires)
destroy(this.cb_ajouter_moulage)
destroy(this.dw_documents)
destroy(this.cb_orthup)
destroy(this.lb_files)
destroy(this.cb_3)
end on

event open;call super::open;
v_code_local = message.doubleParm

// Récupération de l'exe à lancer
s_path_connect = profilestring(dir_ini+inifile_orthokis,"MYRAY_AS", "path_exe", "C:\Program Files\Alliedstar\Connect\") 
s_exe_connect = profilestring(dir_ini+inifile_orthokis,"MYRAY_AS", "exe", "connect.exe") 
s_path_cas = profilestring(dir_ini+inifile_orthokis,"MYRAY_AS", "path_cas", "C:\Users\Public\Documents\Alliedstar\Connect\") 


as_dossier_json = dir_ini




//if s_path_connect = "" then
//	s_path_connect = "C:\Program Files\Alliedstar\Connect"
//end if
//
//s_exe_connect = s_path_connect + win_delimiter + "Connect.exe"
//


//if not fileExists (s_exe_connect) then
//
//	Messagebox("ATTENTION", "Impossible de localiser le logiciel de AS Connect sur cet ordinateur.~n~nLiaison impossible !")
//	close(this)
//else


	
select patient.nom, isnull(patient.prenom,''), isnull(patient.sexe,''), patient.date_naissance, isnull(isnull(patient.email_patient, patient.email), ''),  isnull(isnull(patient.portable_patient, patient.portable),''),
prati.nom, isnull(prati.prenom,'') ,  isnull(prati.email, '')
into :v_nom_local, :v_prenom_local, :v_sexe_local, :v_date_naissance_local, :v_email_local, :v_portable_local, 
:v_nom_praticien_local, :v_prenom_praticien_local, :v_email_praticien_local
from patient, prati
where patient.code = :v_code_local and patient.code_praticien = prati.code ;

string lib_ne
if v_sexe_local = "F" then
	lib_ne = " née le "
else
	lib_ne = " né le "
end if

v_email_local = string_non_nulle(v_email_local)
v_portable_local = string_non_nulle(v_portable_local)

st_patient.text = v_nom_local + " "+ v_prenom_local +lib_ne + string(v_date_naissance_local)

// Documents du patients
dw_documents.settransobject(SQLCA)
dw_documents.retrieve(v_code_local, 'D')

// Module optionnel
cb_orthup.visible = ORTHUP

end event

type p_fond from w_fenetre_arakis`p_fond within w_import_myray_as
end type

type cb_1 from uo_picturebutton_390x120_fermer within w_import_myray_as
integer x = 2779
integer y = 684
integer width = 512
integer height = 152
integer taborder = 10
boolean bringtotop = true
end type

type st_patient from statictext within w_import_myray_as
integer x = 187
integer y = 32
integer width = 2729
integer height = 84
boolean bringtotop = true
integer textsize = -12
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 553648127
string text = "Patient : "
boolean focusrectangle = false
end type

type cb_2 from uo_picturebutton_390x120 within w_import_myray_as
integer x = 27
integer y = 684
integer width = 741
integer height = 152
integer taborder = 10
boolean bringtotop = true
string text = "Lancer AS Connect"
string iconname = "lc_icone_myray_as.png"
end type

event clicked;call super::clicked;

// Ecriture du fichier Json qui va bien et lancement ...


if not fileExists (s_path_connect + s_exe_connect) then

	Messagebox("ATTENTION", "Impossible de localiser le logiciel de AS Connect sur cet ordinateur.~n~nVeuillez corriger !")

else

		
	string s_nom_fichier_json, s_nom_fichier_bat
	
	integer i_fichier_json, i_fichier_bat
	
	
	s_nom_fichier_json = as_dossier_json + "myray_as.json"
	s_nom_fichier_bat = as_dossier_json + "myray_as.bat"
	
	if not FileDelete (s_nom_fichier_json) and FileExists(s_nom_fichier_json) then
		messagebox("ATTENTION", "Erreur dans la suppression du fichier : "+ s_nom_fichier_json + "~n~nVeuillez quitter Orthokis et renouvelez l'opération.~n~nSi le problème persiste, veuillez contacter notre Hotline.")
	end if
	
	
	if not FileDelete (s_nom_fichier_bat) and FileExists(s_nom_fichier_bat) then
		messagebox("ATTENTION", "Erreur dans la suppression du fichier : "+ s_nom_fichier_bat + "~n~nVeuillez quitter Orthokis et renouvelez l'opération.~n~nSi le problème persiste, veuillez contacter notre Hotline.")
	end if

	i_fichier_json = fileOpen(s_nom_fichier_json, LineMode! , write!, LockReadWrite! , Replace!, EncodingUtf8!)
	
	FileWrite(i_fichier_json, "{")
	FileWrite(i_fichier_json, '    "outputFolder": "output\\folder",')
	FileWrite(i_fichier_json, '    "outputFormat": "ply,stl", ')
	FileWrite(i_fichier_json, '    "patient": {')
	FileWrite(i_fichier_json, '        "birthDate": "' + string(v_date_naissance_local, "yyyy-mm-dd") +'",')
	FileWrite(i_fichier_json, '        "comment": "' + mle_commentaires.text + '",')
	FileWrite(i_fichier_json, '        "email":"' + v_email_local + '",')
	choose case v_sexe_local
		case "M"
			FileWrite(i_fichier_json, '        "gender":"male",')
		case "F"
			FileWrite(i_fichier_json, '        "gender":"female",')
		case else
			FileWrite(i_fichier_json, '        "gender":"",')
	end choose
	FileWrite(i_fichier_json, '        "id": "' + string(v_code_local) + '",')
	FileWrite(i_fichier_json, '        "name":"' + v_nom_local + ' ' + v_prenom_local + '",')
	
	
	FileWrite(i_fichier_json, '        "phoneNumber":"' + v_portable_local + '"')
	FileWrite(i_fichier_json, '    }')
	FileWrite(i_fichier_json, '}')

	
//	FileWrite(i_fichier_json, fic )
	
	fileClose(i_fichier_json)
	
	yield()
	
	
	// Lancement de la commande
	string s_commande
	
	s_commande = '"' + s_path_connect + s_exe_connect + '"' + ' --caller=DPMS --info=' + s_nom_fichier_json 
	
	trace("Appel MyRay AS Connect : " + s_commande)

	run ( s_commande )

	//i_fichier_bat = fileOpen(s_nom_fichier_bat, LineMode! , write!, LockReadWrite! , Replace!, EncodingAnsi!)
	//FileWrite(i_fichier_bat, s_commande )
	//fileClose(i_fichier_bat)
	//run ( s_nom_fichier_bat )
end if
end event

type st_1 from statictext within w_import_myray_as
integer x = 187
integer y = 172
integer width = 485
integer height = 76
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 553648127
string text = "Commentaires :"
boolean focusrectangle = false
end type

type mle_commentaires from multilineedit within w_import_myray_as
integer x = 686
integer y = 160
integer width = 2258
integer height = 304
integer taborder = 10
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
boolean hscrollbar = true
boolean vscrollbar = true
integer limit = 2000
borderstyle borderstyle = stylelowered!
end type

type cb_ajouter_moulage from uo_picturebutton_390x120 within w_import_myray_as
integer x = 773
integer y = 684
integer width = 741
integer height = 152
integer taborder = 160
boolean bringtotop = true
string text = "Importer Moulages"
string iconname = "lc_moulage_petit.png"
end type

event clicked;
string s_path_cas_patient

string s_fichier_haut, s_fichier_bas

s_path_cas_patient = s_path_cas



if GetFolder("Dossier du cas à importer",s_path_cas_patient ) = 1 then

	s_path_cas_patient = s_path_cas_patient + win_delimiter + "model" + win_delimiter
	
	// lecture du dossier pour récup les 1er fichiers qu'on trouve upper et lower
	lb_files.dirlist(s_path_cas_patient + "*upper.stl", 32)
	
	if lb_files.TotalItems() > 0 then
		s_fichier_haut = s_path_cas_patient + lb_files.text(1)
	else
		s_fichier_haut = ""
	end if
	
	lb_files.dirlist(s_path_cas_patient + "*lower.stl", 32)
	
	if lb_files.TotalItems() > 0 then
		s_fichier_bas = s_path_cas_patient + lb_files.text(1)
	else
		s_fichier_bas = ""
	end if
	
	
	// Y a t il les fichiers attendus dedans ? 2ème verif 
	
	//s_fichier_haut = s_path_cas_patient + "upper.stl"
	//s_fichier_bas = s_path_cas_patient + "lower.stl"
	
	if FileExists(s_fichier_haut) or FileExists(s_fichier_bas) then
		if FileExists(s_fichier_bas) then
			param_win[10] = s_fichier_bas
		else
			param_win[10] = ""
		end if
		
		if FileExists(s_fichier_haut) then
			param_win[11] = s_fichier_haut
		else
			param_win[11] = ""
		end if
		
		
		m_btdroit_historique		Menu

		Menu = CREATE m_btdroit_historique
		Menu.var_type_histo = "D"
		menu.dw_locale = dw_documents
		menu.dw_locale_reference = dw_documents
		menu.var_code_local = v_code_local	
		menu.i_type_moulage = 2			// Moulages myRay
		menu.m_ajouterunmoulage.triggerevent(clicked!)
		DESTROY menu
		
	else

		Messagebox("ATTENTION", "Ce dossier ne contient pas les 2 fichiers attendus (lower.stl + upper.stl) dans un sous dossier 'model'  !")
		
	end if

end if


end event

type dw_documents from u_basedw within w_import_myray_as
event ue_leftbuttonup pbm_dwnlbuttonup
string tag = "brush"
boolean visible = false
integer x = 2290
integer y = 272
integer width = 1682
integer height = 776
integer taborder = 10
boolean bringtotop = true
string dataobject = "dw_patient_fiche5"
boolean border = false
borderstyle borderstyle = stylebox!
end type

type cb_orthup from uo_picturebutton_390x120 within w_import_myray_as
integer x = 1518
integer y = 684
integer width = 741
integer height = 152
integer taborder = 20
boolean bringtotop = true
string text = "Dental Design"
string iconname = "lc_icone_orthup.png"
end type

event clicked;call super::clicked;

// Lancement de Orthup avec les éléments du dossier qui vont bien


m_orthup newmenu_orthup

newmenu_orthup = create m_orthup
	
s_path_treatment = profilestring(dir_ini+inifile_orthokis,"ORTHUP", "path_treatment", "") 

s_exe_treatment = profilestring(dir_ini+inifile_orthokis,"ORTHUP", "exe_treatment", "") 

// si pas de traitement, on grie
if not FileExists(s_path_treatment + s_exe_treatment) then
	newmenu_orthup.m_reprendreuncasexistanttraitement.enabled = false
end if

newmenu_orthup.popmenu(parent.PointerX(), parent.PointerY())

end event

type lb_files from listbox within w_import_myray_as
boolean visible = false
integer x = 2336
integer y = 232
integer width = 480
integer height = 400
integer taborder = 20
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long backcolor = 16777215
borderstyle borderstyle = stylelowered!
end type

type cb_3 from uo_picturebutton_390x120 within w_import_myray_as
integer x = 2263
integer y = 684
integer width = 512
integer height = 152
integer taborder = 170
boolean bringtotop = true
string text = "Param."
string iconname = "preferences_16.png"
end type

event clicked;call super::clicked;open(w_import_myray_as_config)
end event

