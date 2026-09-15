$PBExportHeader$w_dental_monitoring_association_patients.srw
forward
global type w_dental_monitoring_association_patients from w_fenetre_arakis
end type
type pb_fermer from uo_picturebutton_390x120 within w_dental_monitoring_association_patients
end type
type cb_associer from uo_picturebutton_390x120 within w_dental_monitoring_association_patients
end type
type uo_dm from lien_dental_monitoring within w_dental_monitoring_association_patients
end type
type uo_1 from resize_fenetre within w_dental_monitoring_association_patients
end type
type st_1 from statictext within w_dental_monitoring_association_patients
end type
type dw_prati from datawindow within w_dental_monitoring_association_patients
end type
type cb_lister from uo_picturebutton_390x120 within w_dental_monitoring_association_patients
end type
type dw_liste from datawindow within w_dental_monitoring_association_patients
end type
type cb_imprimer from uo_picturebutton_390x120 within w_dental_monitoring_association_patients
end type
type cb_exporter from uo_picturebutton_390x120 within w_dental_monitoring_association_patients
end type
type st_compte from statictext within w_dental_monitoring_association_patients
end type
end forward

global type w_dental_monitoring_association_patients from w_fenetre_arakis
integer width = 4210
integer height = 2216
string title = "Association Patients Dental Monitoring"
boolean minbox = false
boolean maxbox = false
boolean resizable = false
windowtype windowtype = response!
boolean center = true
pb_fermer pb_fermer
cb_associer cb_associer
uo_dm uo_dm
uo_1 uo_1
st_1 st_1
dw_prati dw_prati
cb_lister cb_lister
dw_liste dw_liste
cb_imprimer cb_imprimer
cb_exporter cb_exporter
st_compte st_compte
end type
global w_dental_monitoring_association_patients w_dental_monitoring_association_patients

type variables

string is_cle_api 
integer Fichier_Trace_association
integer numero_compte
end variables

on w_dental_monitoring_association_patients.create
int iCurrent
call super::create
this.pb_fermer=create pb_fermer
this.cb_associer=create cb_associer
this.uo_dm=create uo_dm
this.uo_1=create uo_1
this.st_1=create st_1
this.dw_prati=create dw_prati
this.cb_lister=create cb_lister
this.dw_liste=create dw_liste
this.cb_imprimer=create cb_imprimer
this.cb_exporter=create cb_exporter
this.st_compte=create st_compte
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.pb_fermer
this.Control[iCurrent+2]=this.cb_associer
this.Control[iCurrent+3]=this.uo_dm
this.Control[iCurrent+4]=this.uo_1
this.Control[iCurrent+5]=this.st_1
this.Control[iCurrent+6]=this.dw_prati
this.Control[iCurrent+7]=this.cb_lister
this.Control[iCurrent+8]=this.dw_liste
this.Control[iCurrent+9]=this.cb_imprimer
this.Control[iCurrent+10]=this.cb_exporter
this.Control[iCurrent+11]=this.st_compte
end on

on w_dental_monitoring_association_patients.destroy
call super::destroy
destroy(this.pb_fermer)
destroy(this.cb_associer)
destroy(this.uo_dm)
destroy(this.uo_1)
destroy(this.st_1)
destroy(this.dw_prati)
destroy(this.cb_lister)
destroy(this.dw_liste)
destroy(this.cb_imprimer)
destroy(this.cb_exporter)
destroy(this.st_compte)
end on

event open;call super::open;uo_1.taille(this)
dw_prati.settransobject(sqlca)
dw_prati.retrieve()

cb_associer.enabled(false)
end event

type p_fond from w_fenetre_arakis`p_fond within w_dental_monitoring_association_patients
integer x = 27
integer y = 1112
end type

type pb_fermer from uo_picturebutton_390x120 within w_dental_monitoring_association_patients
integer x = 2885
integer y = 1888
integer width = 503
integer taborder = 60
string text = "&Fermer"
string iconname = "ACTIONS_fermer.png"
end type

event clicked;call super::clicked;close(parent)

end event

type cb_associer from uo_picturebutton_390x120 within w_dental_monitoring_association_patients
integer x = 631
integer y = 1888
integer width = 795
integer taborder = 30
boolean bringtotop = true
boolean enabled = false
string text = "Associer les patients"
string iconname = "ACTIONS_executer.png"
end type

event clicked;call super::clicked;long tot, lig
string v_nom, v_prenom
date v_date_naissance
double v_code_interne
integer nb_maj, nb_erreur, nb_non_present

boolean v_suite , v_association_a_blanc
long v_patient_id


v_association_a_blanc = uo_dm.get_association_a_blanc()
if v_association_a_blanc then
	Messagebox("ATTENTION", "Association à blanc !~n~nAucun dossier ne sera mis à jour dans Dental Monitoring" )
end if

tot = dw_liste.rowcount()
if tot  > 0 then

	if messagebox("ATTENTION", "Cette opération peut être longue.~n~nConfirmez-vous ?", Question!, YesNo!, 2) = 1 then
	
		open(w_patience)
		
		
		
		
		nb_maj = 0
		nb_erreur = 0
		nb_non_present = 0
		
		// Ouverture d'un fichier TRACE
		Fichier_Trace_association = FileOpen(dir_ini + "\Trace_Association_DM" + string(now(), "-hh-mm-ss") + ".txt", LineMode! , Write!, LockWrite! , Replace!, EncodingANSI! )
		FileWriteex(Fichier_Trace_association, " **********************************************************" )
		FileWriteex(Fichier_Trace_association, "                     DEBUT DE D'ASSOCIATION DM")
		FileWriteex(Fichier_Trace_association, "**********************************************************" )
		
		FileWriteex(Fichier_Trace_association, string(now() , "hh:mm:ss:fff"))
		
		if v_association_a_blanc then
			FileWriteex(Fichier_Trace_association, "")
			FileWriteex(Fichier_Trace_association, "**************************** ASSOCIATION A BLANC ***********************")
			FileWriteex(Fichier_Trace_association, "")
		end if

		
		FileWriteex(Fichier_Trace_association, "")
		FileWriteex(Fichier_Trace_association, "Nombre de patients dans identifiant dans DM : " + string(tot))
		FileWriteex(Fichier_Trace_association, "")

		for lig = 1 to tot
			
			yield()
		
			v_nom = trim(dw_liste.getItemString(lig, "nom"))
			v_prenom = trim(dw_liste.getItemString(lig, "prenom"))
			v_date_naissance = dw_liste.getItemDate(lig, "date_naissance")
		
			select isnull(min(code),0) into :v_code_interne from patient 
			where trim(nom) = :v_nom and trim(prenom) = :v_prenom and date_naissance = :v_date_naissance ; 
			
			FileWriteex(Fichier_Trace_association, "------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------")
			if v_code_interne <> 0 then 
				// le patient est dans Orthokis .. mise à jour de la liste pour info
				FileWriteex(Fichier_Trace_association,  v_nom + " " + v_prenom + " " + string(v_date_naissance) + "     Présent dans Orthokis - Code interne : " + string(v_code_interne))
				
				uo_dm.init(v_code_interne)
				
				v_patient_id = dw_liste.getItemNumber(lig, "patient_id")
				
				if not v_association_a_blanc then
					v_suite = uo_dm.maj_patient (v_patient_id, numero_compte)
				else
					v_suite = true
				end if
				
				if v_suite then
					
					if not v_association_a_blanc then
						// Trace de la commande passée
						
						FileWriteex(Fichier_Trace_association, "Commande : " + uo_dm.v_commande)
						FileWriteex(Fichier_Trace_association, "Body : " + uo_dm.s_body )
						FileWriteex(Fichier_Trace_association, "Réponse : " +  string(uo_dm.l_statut_reponse)  + " - " + uo_dm.ls_ReturnJson )
					end if
					dw_liste.SetItem(lig, "identifiant", string(v_code_interne))
					nb_maj = nb_maj + 1
				else
					nb_erreur = nb_erreur + 1
				end if
			else
				nb_non_present = nb_non_present + 1 
				FileWriteex( Fichier_Trace_association, v_nom + " " + v_prenom + " " + string(v_date_naissance) + "     Non présent dans Orthokis")

			end if
		next
		close(w_patience)
		
		
		Messagebox("INFORMATION", "Nombre de patients mise à jour : " + string(nb_maj) + "~n~nNombre d'erreurs : " + string(nb_erreur) + "~n~nNombre patients non présents dans Orthokis : " + string(nb_non_present))

		FileWriteex(Fichier_Trace_association, "")
		FileWriteex(Fichier_Trace_association, "Nombre de patients mise à jour : " + string(nb_maj) + " - Nombre d'erreurs : " + string(nb_erreur) + " - Nombre patients non présents dans Orthokis : " + string(nb_non_present))
		FileWriteex(Fichier_Trace_association, "")

		FileWriteex(Fichier_Trace_association, string(now() , "hh:mm:ss:fff"))
		FileClose(Fichier_Trace_association)

		yield()
		this.show()
	end if
else
	messagebox("ATTENTION", "Il n'y a pas de patient à associer pour ce praticien !")
end if

end event

type uo_dm from lien_dental_monitoring within w_dental_monitoring_association_patients
event destroy ( )
boolean visible = false
integer x = 3840
integer y = 1388
integer taborder = 80
boolean bringtotop = true
end type

on uo_dm.destroy
call lien_dental_monitoring::destroy
end on

type uo_1 from resize_fenetre within w_dental_monitoring_association_patients
string tag = "uniquement pour les couleur"
boolean visible = false
integer x = 2766
integer y = 360
integer taborder = 50
boolean bringtotop = true
end type

on uo_1.destroy
call resize_fenetre::destroy
end on

type st_1 from statictext within w_dental_monitoring_association_patients
integer x = 114
integer y = 96
integer width = 539
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 553648127
string text = "Choix du praticien : "
boolean focusrectangle = false
end type

type dw_prati from datawindow within w_dental_monitoring_association_patients
string tag = "position brush"
integer x = 713
integer y = 92
integer width = 859
integer height = 72
integer taborder = 80
boolean bringtotop = true
string dataobject = "dw_cherche_prati"
boolean border = false
end type

event itemchanged;//sle_pages.text = ""
//pb_prec.enabled = false
//pb_suiv.enabled = false

end event

type cb_lister from uo_picturebutton_390x120 within w_dental_monitoring_association_patients
integer x = 2857
integer y = 56
integer width = 1225
integer taborder = 40
boolean bringtotop = true
string text = "Lister les patients DM sans Identifiant"
string iconname = "ACTIONS_chercher.png"
end type

event clicked;call super::clicked;// est ce que le praticien a un code 
string v_code_praticien, v_code_praticien_dm
string v_premier_patient, v_dernier_patient

v_code_praticien  = dw_prati.gettext()

numero_compte = 1

// Pour l'associaition on n'a pas besoin du cabinet
//st_compte.text = ""
//
//if uo_dm.get_nb_compte(v_code_praticien) > 1 then
//	
//	openwithparm(w_dental_monitoring_choix_du_compte, v_code_praticien)
//	
//	numero_compte = integer(message.doubleparm)
//
//	st_compte.text = uo_dm.get_libelle_praticien_dm(v_code_praticien, numero_compte)
//	
//end if
//
//Trace (" - N° de compte DM: " + string(numero_compte))
//
cb_associer.enabled ( false )

v_code_praticien_dm = uo_dm.get_code_praticien_dm(v_code_praticien, numero_compte)

if v_code_praticien_dm <> "" then

	if Messagebox("ATTTENTION !", "Cette opération peut être longue !~n~nConfirmez-vous ?", Question!, YesNo!, 2) = 1 then 
		open(w_patience)
		
		uo_dm.get_liste_des_patients_sans_identifiant(dw_liste, v_code_praticien, numero_compte)
	
		if dw_liste.rowcount() > 0 then
			cb_associer.enabled (true)
			dw_liste.sort()
		end if
		close(w_patience)
	else
		cb_associer.enabled (false)
	end if

else
	cb_associer.enabled (false)
	messagebox("ATTENTION", "Ce praticien n'a pas de code pour Dental Monitoring !")
end if

end event

type dw_liste from datawindow within w_dental_monitoring_association_patients
integer x = 123
integer y = 252
integer width = 3991
integer height = 1544
integer taborder = 30
boolean bringtotop = true
string dataobject = "dw_dental_monitoring_liste_patients"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type cb_imprimer from uo_picturebutton_390x120 within w_dental_monitoring_association_patients
integer x = 1577
integer y = 1888
integer width = 503
integer taborder = 70
boolean bringtotop = true
string text = "&Imprimer"
string iconname = "ACTIONS_imprimer.png"
end type

event clicked;call super::clicked;dw_liste.print()
end event

type cb_exporter from uo_picturebutton_390x120 within w_dental_monitoring_association_patients
integer x = 2231
integer y = 1888
integer width = 503
integer taborder = 80
boolean bringtotop = true
string text = "&Exporter"
string iconname = "ACTIONS_exporter.png"
end type

event clicked;call super::clicked;dw_liste.saveas()
end event

type st_compte from statictext within w_dental_monitoring_association_patients
integer x = 1733
integer y = 100
integer width = 1056
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 553648127
boolean focusrectangle = false
end type

