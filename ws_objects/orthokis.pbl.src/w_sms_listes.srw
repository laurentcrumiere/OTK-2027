$PBExportHeader$w_sms_listes.srw
forward
global type w_sms_listes from window
end type
type st_1 from statictext within w_sms_listes
end type
type sle_code_sms from singlelineedit within w_sms_listes
end type
type dw_code_sms from datawindow within w_sms_listes
end type
type dw_maj_histo from datawindow within w_sms_listes
end type
type dw_liste from datawindow within w_sms_listes
end type
type cb_envoyer from uo_picturebutton_390x120 within w_sms_listes
end type
type st_8 from statictext within w_sms_listes
end type
type rb_auto from radiobutton within w_sms_listes
end type
type rb_parents from radiobutton within w_sms_listes
end type
type rb_patient from radiobutton within w_sms_listes
end type
type cb_dental_config from uo_picturebutton_390x120 within w_sms_listes
end type
type cb_ferme from uo_picturebutton_390x120_fermer within w_sms_listes
end type
type gb_destinataires from groupbox within w_sms_listes
end type
end forward

global type w_sms_listes from window
integer width = 2057
integer height = 1272
boolean titlebar = true
string title = "Envoi de SMS à une liste de patients"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
st_1 st_1
sle_code_sms sle_code_sms
dw_code_sms dw_code_sms
dw_maj_histo dw_maj_histo
dw_liste dw_liste
cb_envoyer cb_envoyer
st_8 st_8
rb_auto rb_auto
rb_parents rb_parents
rb_patient rb_patient
cb_dental_config cb_dental_config
cb_ferme cb_ferme
gb_destinataires gb_destinataires
end type
global w_sms_listes w_sms_listes

type variables
// pour les fonctions d'envois
uo_pocket uo_poc
end variables

on w_sms_listes.create
this.st_1=create st_1
this.sle_code_sms=create sle_code_sms
this.dw_code_sms=create dw_code_sms
this.dw_maj_histo=create dw_maj_histo
this.dw_liste=create dw_liste
this.cb_envoyer=create cb_envoyer
this.st_8=create st_8
this.rb_auto=create rb_auto
this.rb_parents=create rb_parents
this.rb_patient=create rb_patient
this.cb_dental_config=create cb_dental_config
this.cb_ferme=create cb_ferme
this.gb_destinataires=create gb_destinataires
this.Control[]={this.st_1,&
this.sle_code_sms,&
this.dw_code_sms,&
this.dw_maj_histo,&
this.dw_liste,&
this.cb_envoyer,&
this.st_8,&
this.rb_auto,&
this.rb_parents,&
this.rb_patient,&
this.cb_dental_config,&
this.cb_ferme,&
this.gb_destinataires}
end on

on w_sms_listes.destroy
destroy(this.st_1)
destroy(this.sle_code_sms)
destroy(this.dw_code_sms)
destroy(this.dw_maj_histo)
destroy(this.dw_liste)
destroy(this.cb_envoyer)
destroy(this.st_8)
destroy(this.rb_auto)
destroy(this.rb_parents)
destroy(this.rb_patient)
destroy(this.cb_dental_config)
destroy(this.cb_ferme)
destroy(this.gb_destinataires)
end on

event open;
dw_maj_histo.settransobject(sqlca)
dw_liste.settransobject(sqlca)

this.backcolor = couleur_fond_fenetre
gb_destinataires.backcolor = couleur_fond_datawindow

// pour les fonctions d'envois ... 
uo_poc = create uo_pocket
uo_poc.triggerevent(constructor!)

// listes des codes SMS
uo_poc.get_liste_codes(dw_code_sms)

if dw_code_sms.rowcount() = 0 then
	
	MessageBox("ATTENTION", "Il n'y a aucun texte de SMS configuré !")
	close(this)
	
end if
end event

type st_1 from statictext within w_sms_listes
integer x = 498
integer y = 780
integer width = 672
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean italic = true
long textcolor = 134217856
long backcolor = 553648127
string text = "Clic droit pour afficher la liste"
boolean focusrectangle = false
end type

type sle_code_sms from singlelineedit within w_sms_listes
integer x = 658
integer y = 640
integer width = 343
integer height = 104
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
end type

event rbuttondown;colore_datawindow(dw_code_sms)

if dw_code_sms.visible then
	dw_code_sms.visible = false
else
	parent.width = 3762
	parent.height = 1358
	dw_code_sms.visible = true
end if

return 1
end event

type dw_code_sms from datawindow within w_sms_listes
string tag = "no resize all brush"
boolean visible = false
integer x = 1253
integer y = 52
integer width = 2450
integer height = 1144
integer taborder = 30
boolean titlebar = true
string title = "Liste des Messages Dental SMS"
string dataobject = "dw_code_sms_ddlb"
boolean vscrollbar = true
borderstyle borderstyle = styleraised!
end type

event rbuttondown;if dw_code_sms.visible then
	dw_code_sms.visible = false
	parent.width = 2048
	parent.height = 1292
else
	dw_code_sms.visible = true
end if

end event

event clicked;If row > 0 Then
	This.SelectRow(0,False)
	This.SelectRow(row,True)
	This.setrow(row)
End If

end event

event doubleclicked;

sle_code_sms.text = string(dw_code_sms.getitemnumber(dw_code_sms.getrow(), "code"))
dw_code_sms.visible = false
parent.width = 2048
parent.height = 1292

end event

type dw_maj_histo from datawindow within w_sms_listes
boolean visible = false
integer x = 1513
integer y = 292
integer width = 4338
integer height = 764
integer taborder = 20
boolean bringtotop = true
string title = "none"
string dataobject = "dw_sms_maj_histo"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type dw_liste from datawindow within w_sms_listes
boolean visible = false
integer x = 1449
integer y = 96
integer width = 4338
integer height = 764
integer taborder = 20
boolean bringtotop = true
string title = "none"
string dataobject = "dw_sms"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type cb_envoyer from uo_picturebutton_390x120 within w_sms_listes
integer x = 713
integer y = 976
integer width = 594
integer taborder = 20
string text = "Envoyer"
string iconname = "ACTIONS_executer.png"
end type

event clicked;call super::clicked;// dw_click contient la liste de départ

long lig, tot
string v_nom, v_prenom,v_parent, v_portable, v_type_code, v_type_nom, v_prati_code, v_prati_nom, v_cmu
date v_date_naissance
string v_adulte

datetime v_rdv, v_proc_rdv
long v_message
double v_code, v_code_interne_rdv
string v_type_sms

string str_message, v_id_pocket
string v_email_patient, v_email_parent1
string v_fichier_texte


boolean v_suite
long nb_rdv

string v_mode_sms

if rb_auto.checked then
	// mode auto ... selon les case cochées dans la fiche patient
	v_mode_sms = 'A'
else
	if rb_patient.checked then
		// Patient
		v_mode_sms = 'P'
	else
		// Parent 1
		v_mode_sms = 'R'
	end if
end if

str_message = sle_code_sms.text

if trim(str_message) = "" then
	str_message = "0"
end if


if dw_code_sms.find("code = " + str_message, 0, 9999) <= 0 then

	MessageBox("ATTENTION", "Le code de message que vous avez indiqué est inconnu dans Dental SMS !")

else
	
	if messagebox("ATTENTION", "Orthokis va analyser la liste pour déterminer le nombre de SMS à envoyer.~n~nConfirmez-vous ?~n~n(Il n'y aura pas d'envoi à cette étape)", Question!, YesNo!, 2) = 1 then
	
		open(w_patience)
		
		tot = dw_click.rowcount()
		
		for lig = 1 to tot
			
			v_code = dw_click.getItemNumber(lig, "code") 
			
			// Toutes les 10 lignes on mets à jour un pourcentage de progression
			if mod(lig, 10) = 0 then
				if isvalid(w_patience) then
					w_patience.wf_setvalue( integer( lig / tot * 100 )) 
				end if
			end if
			
			select	patient.code, patient.nom, 	patient.prenom , 	patient.date_naissance, 	patient.nom_parent1, 
			 isnull(patient.portable_patient, patient.portable, patient.portable2_parent1) , 	null, 
			 null, null, patient.code_praticien  , prati.nom , 	null  , mise_en_evidence 
			  into :v_code, :v_nom, :v_prenom, :v_date_naissance, :v_parent, :v_portable, :v_type_code, :v_type_nom,
			  :v_rdv, :v_prati_code, :v_prati_nom, :v_message , :v_cmu 
			from patient, prati 
			where patient.code = :v_code ;
		
			trace("Ajout du patient : " + v_nom + " "+ v_prenom + " - "+ string(v_code))
			
			// depuis 2024 evo on regarde si prochain rdv .. si oui .. on l'ajoute
			v_proc_rdv = proc_rdv(v_code)
			v_code_interne_rdv = 0
			
			if not isnull(v_proc_rdv) then
				v_rdv = v_proc_rdv
				select top 1 type_rdv.code, type_rdv.nom , rdv.code_interne
				into :v_type_code , :v_type_nom, :v_code_interne_rdv
				from rdv, type_rdv
				where rdv.code = :v_code and rdv = :v_rdv ;
				// on fait comme si rappel de SMS pour bien générer le texte
				v_type_sms = "R"
			else
				v_type_sms = "T"
			end if

			fxg_ajouter_patient_sms (v_code, v_type_code, v_type_nom, v_rdv,   str_message , v_prati_code, v_code_interne_rdv  , v_type_sms, dw_liste, dw_maj_histo, v_mode_sms )	
		next		
		
		close(w_patience)
	
		tot = dw_liste.rowcount()
		
		if tot > 0 then 
		
			If messagebox("ATTENTION", "Vous allez envoyer " + string(tot) + " SMS.~n~n~CET ENVOI NE POURRA PAS ETRE ANNULE.~n~nConfirmez-vous ?", Question!, YesNo!, 2) = 1 then 
			
				v_fichier_texte = profilestring(dir_ini+inifile_orthokis,"SMS","Fichier",dir_ini+"envoi_sms.txt")
				
				if dw_liste.saveas(v_fichier_texte,  text!  , true    ) = 1 then
					
						
					if uo_poc.update_planning(v_fichier_texte, true) = 1 then
						if dw_maj_histo.update() = 1 then
							commit ;
						else
							rollback ;
							Messagebox("ATTENTION","Une erreur s'est produite dans la mise à jour de l'historique de l'envoi des SMS.")
						end if	
					else
						Messagebox("ATTENTION","Une erreur s'est produite dans l'envoi des SMS.")
					end if
					
					destroy uo_poc
				end if
			end if
		else
			Messagebox("ATTENTION", "Il n'y a pas de SMS à envoyer !")
		end if
		close(parent)
	end if
end if


end event

type st_8 from statictext within w_sms_listes
integer x = 91
integer y = 656
integer width = 590
integer height = 72
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 553648127
string text = "Message à envoyer : "
end type

type rb_auto from radiobutton within w_sms_listes
integer x = 174
integer y = 356
integer width = 1106
integer height = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 553648127
string text = "Selon automatisme de la fiche"
end type

type rb_parents from radiobutton within w_sms_listes
integer x = 174
integer y = 256
integer width = 1106
integer height = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 553648127
string text = "Les parents 1 (1er numéro de portable)"
end type

type rb_patient from radiobutton within w_sms_listes
integer x = 174
integer y = 156
integer width = 407
integer height = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 553648127
string text = "Les patients"
boolean checked = true
end type

type cb_dental_config from uo_picturebutton_390x120 within w_sms_listes
integer x = 41
integer y = 976
integer width = 594
integer taborder = 20
boolean bringtotop = true
fontcharset fontcharset = ansi!
string text = "&Configuration"
string iconname = "ACTIONS_dental_sms_config.png"
end type

event clicked;call super::clicked;fxg_ouvrir_dentalsms("C", "")
end event

type cb_ferme from uo_picturebutton_390x120_fermer within w_sms_listes
integer x = 1385
integer y = 976
integer width = 594
integer taborder = 10
end type

type gb_destinataires from groupbox within w_sms_listes
integer x = 78
integer y = 48
integer width = 1376
integer height = 476
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean italic = true
long textcolor = 33554432
long backcolor = 67108864
string text = "Destinataires du SMS"
end type

