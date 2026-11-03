$PBExportHeader$w_ia_rapport.srw
$PBExportComments$Affiche le compte rendu IA (fields + uncertainties) lu depuis un fichier JSON
forward
global type w_ia_rapport from window
end type
type tab_1 from tab within w_ia_rapport
end type
type tabpage_transcription from userobject within tab_1
end type
type dw_transcription from datawindow within tabpage_transcription
end type
type tabpage_transcription from userobject within tab_1
dw_transcription dw_transcription
end type
type tabpage_rapport from userobject within tab_1
end type
type dw_rapport from datawindow within tabpage_rapport
end type
type tabpage_rapport from userobject within tab_1
dw_rapport dw_rapport
end type
type tabpage_diag from userobject within tab_1
end type
type dw_diag from datawindow within tabpage_diag
end type
type tabpage_diag from userobject within tab_1
dw_diag dw_diag
end type
type tabpage_dep from userobject within tab_1
end type
type dw_dep from datawindow within tabpage_dep
end type
type tabpage_dep from userobject within tab_1
dw_dep dw_dep
end type
type tabpage_autres from userobject within tab_1
end type
type dw_autres from datawindow within tabpage_autres
end type
type tabpage_autres from userobject within tab_1
dw_autres dw_autres
end type
type tab_1 from tab within w_ia_rapport
tabpage_transcription tabpage_transcription
tabpage_rapport tabpage_rapport
tabpage_diag tabpage_diag
tabpage_dep tabpage_dep
tabpage_autres tabpage_autres
end type
type cbx_memo_fichier_vocal from checkbox within w_ia_rapport
end type
type uo_alerte from uo_alertes within w_ia_rapport
end type
type uo_confid from uo_confidentiel_contre_indication within w_ia_rapport
end type
type cb_3 from uo_picturebutton_390x120 within w_ia_rapport
end type
type cb_2 from uo_picturebutton_390x120 within w_ia_rapport
end type
type cb_1 from uo_picturebutton_390x120_fermer within w_ia_rapport
end type
type gb_1 from groupbox within w_ia_rapport
end type
end forward

global type w_ia_rapport from window
integer width = 4507
integer height = 2752
boolean titlebar = true
string title = "Compte rendu Transcription Vocale"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
string icon = "AppIcon!"
tab_1 tab_1
cbx_memo_fichier_vocal cbx_memo_fichier_vocal
uo_alerte uo_alerte
uo_confid uo_confid
cb_3 cb_3
cb_2 cb_2
cb_1 cb_1
gb_1 gb_1
end type
global w_ia_rapport w_ia_rapport

type variables
n_cst_rapport_ia	 inv_rapport

double var_code_local
string is_json_complet, is_fichier_audio
end variables

forward prototypes
public function integer wf_charger ()
end prototypes

public function integer wf_charger ();

SetPointer(HourGlass!)
if inv_rapport.of_charger( is_json_complet, tab_1.tabpage_rapport.dw_rapport) < 0 then
	MessageBox(this.title, inv_rapport.of_get_lasterror(), StopSign!)
	return -1
end if

tab_1.tabpage_rapport.dw_rapport.ScrollToRow(1)
tab_1.tabpage_rapport.dw_rapport.SetFocus()
return 1
end function

on w_ia_rapport.create
this.tab_1=create tab_1
this.cbx_memo_fichier_vocal=create cbx_memo_fichier_vocal
this.uo_alerte=create uo_alerte
this.uo_confid=create uo_confid
this.cb_3=create cb_3
this.cb_2=create cb_2
this.cb_1=create cb_1
this.gb_1=create gb_1
this.Control[]={this.tab_1,&
this.cbx_memo_fichier_vocal,&
this.uo_alerte,&
this.uo_confid,&
this.cb_3,&
this.cb_2,&
this.cb_1,&
this.gb_1}
end on

on w_ia_rapport.destroy
destroy(this.tab_1)
destroy(this.cbx_memo_fichier_vocal)
destroy(this.uo_alerte)
destroy(this.uo_confid)
destroy(this.cb_3)
destroy(this.cb_2)
destroy(this.cb_1)
destroy(this.gb_1)
end on

event open;

// Paramètre 
str_ia_rapport lstr_ia_rapport
string ls_transcription

lstr_ia_rapport = message.powerobjectparm

this.backcolor = couleur_fond_fenetre
centrer(this)

var_code_local = lstr_ia_rapport.code_patient  
is_json_complet = lstr_ia_rapport.json_ia_complet
is_fichier_audio = lstr_ia_rapport.fichier_audio
ls_transcription = lstr_ia_rapport.transcription


uo_alerte.maj(var_code_local)
uo_confid.maj(var_code_local)

gb_1.backcolor = couleur_fond_fenetre

if profilestring(dir_ini+inifile_orthokis,"IA","sauvegarder_fichier_vocal","O") = "O" then
	cbx_memo_fichier_vocal.checked = true 
else
	cbx_memo_fichier_vocal.checked = false
end if

open(w_patience)

// transcription
tab_1.tabpage_transcription.dw_transcription.insertrow(1)

//ls_transcription = gfx_tout_remplacer(ls_transcription, char(13) + char(10) , "\n")

tab_1.tabpage_transcription.dw_transcription.setitem(1, "texte",  ls_transcription)

// Chargement de la Dw_rapport
wf_charger()

// Lecture des données du rapport pour aliment les autres dw

tab_1.tabpage_diag.dw_diag.insertrow(1)

// Diag
tab_1.tabpage_diag.dw_diag.SetItem(1, "traitement_effectue_html",tab_1.tabpage_rapport.dw_rapport.getitemstring(1, "diagsquelettique"))
tab_1.tabpage_diag.dw_diag.SetItem(1, "diag_dentaire_html",tab_1.tabpage_rapport.dw_rapport.getitemstring(1, "diagdentaire"))
tab_1.tabpage_diag.dw_diag.SetItem(1, "diag_fonctionnel_html",tab_1.tabpage_rapport.dw_rapport.getitemstring(1, "diagfonctionnel"))
tab_1.tabpage_diag.dw_diag.SetItem(1, "diag_alveolaire_html",tab_1.tabpage_rapport.dw_rapport.getitemstring(1, "diagalveolaire"))

tab_1.tabpage_diag.dw_diag.SetItem(1, "plan_traitement_html",tab_1.tabpage_rapport.dw_rapport.getitemstring(1, "plantraitement"))
tab_1.tabpage_diag.dw_diag.SetItem(1, "plan_complement_html",tab_1.tabpage_rapport.dw_rapport.getitemstring(1, "objectiftraitement"))

// DEP 
tab_1.tabpage_dep.dw_dep.insertrow(1)

// BASALE MAXILLAIRE
if tab_1.tabpage_rapport.dw_rapport.getitemstring(1, "dep_ab_max_sagittal") = "pro" then
	tab_1.tabpage_dep.dw_dep.SetItem(1, "basal_max_pro", "X")
end if
if tab_1.tabpage_rapport.dw_rapport.getitemstring(1, "dep_ab_max_sagittal") = "retro" then
	tab_1.tabpage_dep.dw_dep.SetItem(1, "basal_max_retro", "X")
end if

if tab_1.tabpage_rapport.dw_rapport.getitemstring(1, "dep_ab_max_transversal") = "endo" then
	tab_1.tabpage_dep.dw_dep.SetItem(1, "basal_max_endo", "X")
end if
if tab_1.tabpage_rapport.dw_rapport.getitemstring(1, "dep_ab_max_transversal") = "exo" then
	tab_1.tabpage_dep.dw_dep.SetItem(1, "basal_max_exo", "X")
end if



// BASALE MANDIBULE
if tab_1.tabpage_rapport.dw_rapport.getitemstring(1, "dep_ab_man_sagittal") = "pro" then
	tab_1.tabpage_dep.dw_dep.SetItem(1, "basal_mand_pro", "X")
end if
if tab_1.tabpage_rapport.dw_rapport.getitemstring(1, "dep_ab_man_sagittal") = "retro" then
	tab_1.tabpage_dep.dw_dep.SetItem(1, "basal_mand_retro", "X")
end if

if tab_1.tabpage_rapport.dw_rapport.getitemstring(1, "dep_ab_man_transversal") = "endo" then
	tab_1.tabpage_dep.dw_dep.SetItem(1, "basal_mand_endo", "X")
end if
if tab_1.tabpage_rapport.dw_rapport.getitemstring(1, "dep_ab_man_transversal") = "exo" then
	tab_1.tabpage_dep.dw_dep.SetItem(1, "basal_mand_exo", "X")
end if


if tab_1.tabpage_rapport.dw_rapport.getitemstring(1, "dep_ab_max_vertical") = "hypodivergence" then
	tab_1.tabpage_dep.dw_dep.SetItem(1, "hypodivergence", "X")
end if
if tab_1.tabpage_rapport.dw_rapport.getitemstring(1, "dep_ab_man_vertical") = "hyperdivergence" then
	tab_1.tabpage_dep.dw_dep.SetItem(1, "hyperdivergence", "X")
end if




// ALVEOLAIRE MAXILLAIRE
if tab_1.tabpage_rapport.dw_rapport.getitemstring(1, "dep_aa_max_sagittal") = "pro" then
	tab_1.tabpage_dep.dw_dep.SetItem(1, "alveo_max_pro", "X")
end if
if tab_1.tabpage_rapport.dw_rapport.getitemstring(1, "dep_aa_max_sagittal") = "retro" then
	tab_1.tabpage_dep.dw_dep.SetItem(1, "alveo_max_retro", "X")
end if

if tab_1.tabpage_rapport.dw_rapport.getitemstring(1, "dep_aa_max_transversal") = "endo" then
	tab_1.tabpage_dep.dw_dep.SetItem(1, "alveo_max_endo", "X")
end if
if tab_1.tabpage_rapport.dw_rapport.getitemstring(1, "dep_aa_max_transversal") = "exo" then
	tab_1.tabpage_dep.dw_dep.SetItem(1, "alveo_max_exo", "X")
end if

// ALVEOLAIRE MANDIBULE
if tab_1.tabpage_rapport.dw_rapport.getitemstring(1, "dep_aa_man_sagittal") = "pro" then
	tab_1.tabpage_dep.dw_dep.SetItem(1, "alveo_mand_pro", "X")
end if
if tab_1.tabpage_rapport.dw_rapport.getitemstring(1, "dep_aa_man_sagittal") = "retro" then
	tab_1.tabpage_dep.dw_dep.SetItem(1, "alveo_mand_retro", "X")
end if

if tab_1.tabpage_rapport.dw_rapport.getitemstring(1, "dep_aa_man_transversal") = "endo" then
	tab_1.tabpage_dep.dw_dep.SetItem(1, "alveo_mand_endo", "X")
end if
if tab_1.tabpage_rapport.dw_rapport.getitemstring(1, "dep_aa_man_transversal") = "exo" then
	tab_1.tabpage_dep.dw_dep.SetItem(1, "alveo_mand_exo", "X")
end if


if tab_1.tabpage_rapport.dw_rapport.getitemstring(1, "dep_aa_man_vertical") = "supraclusion" then
	tab_1.tabpage_dep.dw_dep.SetItem(1, "supraclusion", "X")
end if
if tab_1.tabpage_rapport.dw_rapport.getitemstring(1, "dep_aa_man_vertical") = "infraclusion" then
	tab_1.tabpage_dep.dw_dep.SetItem(1, "infraclusion", "X")
end if

tab_1.tabpage_rapport.dw_rapport.getitemstring(1, "dep_cl_molaire") 

// CLASSES DENTAIRES
 choose case tab_1.tabpage_rapport.dw_rapport.getitemstring(1, "dep_cl_molaire") 
	 case "Cl. I"
		 tab_1.tabpage_dep.dw_dep.SetItem(1, "mol_cl1", "X") 
	 case "Cl. II"
		 tab_1.tabpage_dep.dw_dep.SetItem(1, "mol_cl2", "X") 
	 case "Cl. III"
		 tab_1.tabpage_dep.dw_dep.SetItem(1, "mol_cl3", "X") 	 
	end choose
tab_1.tabpage_diag.dw_diag.SetItem(1, "molaire",tab_1.tabpage_rapport.dw_rapport.getitemstring(1, "dep_cl_molaire_prec"))

 choose case tab_1.tabpage_rapport.dw_rapport.getitemstring(1, "dep_cl_canine") 
	 case "Cl. I"
		 tab_1.tabpage_dep.dw_dep.SetItem(1, "can_cl1", "X") 
	 case "Cl. II"
		 tab_1.tabpage_dep.dw_dep.SetItem(1, "can_cl2", "X") 
	 case "Cl. III"
		 tab_1.tabpage_dep.dw_dep.SetItem(1, "can_cl3", "X") 	 
	end choose
tab_1.tabpage_diag.dw_diag.SetItem(1, "canine",tab_1.tabpage_rapport.dw_rapport.getitemstring(1, "dep_cl_canine_prec"))


// DEP AUTRES
if tab_1.tabpage_rapport.dw_rapport.getitemstring(1, "dep_ddm") = "O" then 
	tab_1.tabpage_dep.dw_dep.SetItem(1, "dento_max", "X") 
end if
	if tab_1.tabpage_rapport.dw_rapport.getitemstring(1, "dep_ddd") = "O" then 
	tab_1.tabpage_dep.dw_dep.SetItem(1, "dento_dent", "X") 
end if
if tab_1.tabpage_rapport.dw_rapport.getitemstring(1, "dep_occl_inv_droite") = "O" then 
	tab_1.tabpage_dep.dw_dep.SetItem(1, "occl_dte", "X") 
end if
if tab_1.tabpage_rapport.dw_rapport.getitemstring(1, "dep_occl_inv_gauche") = "O" then 
	tab_1.tabpage_dep.dw_dep.SetItem(1, "occl_gche", "X") 
end if
if tab_1.tabpage_rapport.dw_rapport.getitemstring(1, "dep_occl_inv_anterieure") = "O" then 
	tab_1.tabpage_dep.dw_dep.SetItem(1, "occl_ant", "X") 
end if


tab_1.tabpage_dep.dw_dep.SetItem(1, "surnum",tab_1.tabpage_rapport.dw_rapport.getitemstring(1, "dep_dents_incluses"))
tab_1.tabpage_dep.dw_dep.SetItem(1, "malposition",tab_1.tabpage_rapport.dw_rapport.getitemstring(1, "dep_malpositions"))
tab_1.tabpage_dep.dw_dep.SetItem(1, "agenesie",tab_1.tabpage_rapport.dw_rapport.getitemstring(1, "dep_agenesie"))
tab_1.tabpage_dep.dw_dep.SetItem(1, "facteur",tab_1.tabpage_rapport.dw_rapport.getitemstring(1, "dep_facteur_fonct"))



// Autres
tab_1.tabpage_autres.dw_autres.insertrow(1)
tab_1.tabpage_autres.dw_autres.SetItem(1, "motifconsultation",tab_1.tabpage_rapport.dw_rapport.getitemstring(1, "motifconsultation"))
tab_1.tabpage_autres.dw_autres.SetItem(1, "allergies",tab_1.tabpage_rapport.dw_rapport.getitemstring(1, "allergies"))
tab_1.tabpage_autres.dw_autres.SetItem(1, "commentaireclinique",tab_1.tabpage_rapport.dw_rapport.getitemstring(1, "commentaireclinique"))
tab_1.tabpage_autres.dw_autres.SetItem(1, "prochaincomclinique",tab_1.tabpage_rapport.dw_rapport.getitemstring(1, "prochaincomclinique"))

tab_1.tabpage_autres.dw_autres.SetItem(1, "remarques",tab_1.tabpage_rapport.dw_rapport.getitemstring(1, "remarques"))
tab_1.tabpage_autres.dw_autres.SetItem(1, "prochainrdv",tab_1.tabpage_rapport.dw_rapport.getitemstring(1, "prochainrdv"))
tab_1.tabpage_autres.dw_autres.SetItem(1, "actes",tab_1.tabpage_rapport.dw_rapport.getitemstring(1, "actes"))

tab_1.tabpage_autres.dw_autres.SetItem(1, "incertitudes",tab_1.tabpage_rapport.dw_rapport.getitemstring(1, "incertitudes"))

close(w_patience)
end event

type tab_1 from tab within w_ia_rapport
event create ( )
event destroy ( )
integer y = 24
integer width = 4425
integer height = 2316
integer taborder = 60
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 67108864
boolean focusonbuttondown = true
boolean boldselectedtext = true
alignment alignment = center!
integer selectedtab = 1
tabpage_transcription tabpage_transcription
tabpage_rapport tabpage_rapport
tabpage_diag tabpage_diag
tabpage_dep tabpage_dep
tabpage_autres tabpage_autres
end type

on tab_1.create
this.tabpage_transcription=create tabpage_transcription
this.tabpage_rapport=create tabpage_rapport
this.tabpage_diag=create tabpage_diag
this.tabpage_dep=create tabpage_dep
this.tabpage_autres=create tabpage_autres
this.Control[]={this.tabpage_transcription,&
this.tabpage_rapport,&
this.tabpage_diag,&
this.tabpage_dep,&
this.tabpage_autres}
end on

on tab_1.destroy
destroy(this.tabpage_transcription)
destroy(this.tabpage_rapport)
destroy(this.tabpage_diag)
destroy(this.tabpage_dep)
destroy(this.tabpage_autres)
end on

type tabpage_transcription from userobject within tab_1
integer x = 18
integer y = 112
integer width = 4389
integer height = 2188
long backcolor = 67108864
string text = "Transcription"
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
dw_transcription dw_transcription
end type

on tabpage_transcription.create
this.dw_transcription=create dw_transcription
this.Control[]={this.dw_transcription}
end on

on tabpage_transcription.destroy
destroy(this.dw_transcription)
end on

type dw_transcription from datawindow within tabpage_transcription
integer x = 229
integer y = 4
integer width = 3895
integer height = 2164
integer taborder = 10
string title = "none"
string dataobject = "dw_ia_transcription"
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

type tabpage_rapport from userobject within tab_1
event create ( )
event destroy ( )
integer x = 18
integer y = 112
integer width = 4389
integer height = 2188
long backcolor = 67108864
string text = "Rapport"
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
dw_rapport dw_rapport
end type

on tabpage_rapport.create
this.dw_rapport=create dw_rapport
this.Control[]={this.dw_rapport}
end on

on tabpage_rapport.destroy
destroy(this.dw_rapport)
end on

type dw_rapport from datawindow within tabpage_rapport
integer x = 229
integer y = 4
integer width = 3895
integer height = 2164
integer taborder = 10
string title = "none"
string dataobject = "dw_ia_rapport"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type tabpage_diag from userobject within tab_1
event create ( )
event destroy ( )
integer x = 18
integer y = 112
integer width = 4389
integer height = 2188
long backcolor = 67108864
string text = "Diagnostic"
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
dw_diag dw_diag
end type

on tabpage_diag.create
this.dw_diag=create dw_diag
this.Control[]={this.dw_diag}
end on

on tabpage_diag.destroy
destroy(this.dw_diag)
end on

type dw_diag from datawindow within tabpage_diag
integer x = 187
integer y = 84
integer width = 4101
integer height = 1792
integer taborder = 20
string title = "none"
string dataobject = "dw_ia_diag"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type tabpage_dep from userobject within tab_1
event create ( )
event destroy ( )
integer x = 18
integer y = 112
integer width = 4389
integer height = 2188
long backcolor = 67108864
string text = "DEP"
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
dw_dep dw_dep
end type

on tabpage_dep.create
this.dw_dep=create dw_dep
this.Control[]={this.dw_dep}
end on

on tabpage_dep.destroy
destroy(this.dw_dep)
end on

type dw_dep from datawindow within tabpage_dep
integer x = 507
integer y = 204
integer width = 3474
integer height = 1864
integer taborder = 10
string title = "none"
string dataobject = "dw_ia_dep"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type tabpage_autres from userobject within tab_1
integer x = 18
integer y = 112
integer width = 4389
integer height = 2188
long backcolor = 67108864
string text = "Autres"
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
dw_autres dw_autres
end type

on tabpage_autres.create
this.dw_autres=create dw_autres
this.Control[]={this.dw_autres}
end on

on tabpage_autres.destroy
destroy(this.dw_autres)
end on

type dw_autres from datawindow within tabpage_autres
integer x = 229
integer y = 4
integer width = 3895
integer height = 2024
integer taborder = 10
string title = "none"
string dataobject = "dw_ia_autres"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type cbx_memo_fichier_vocal from checkbox within w_ia_rapport
integer x = 50
integer y = 2476
integer width = 795
integer height = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 553648127
string text = "Mémoriser le fichier vocal"
boolean checked = true
end type

type uo_alerte from uo_alertes within w_ia_rapport
event destroy ( )
string tag = "noresizeall"
integer x = 942
integer y = 2412
integer taborder = 80
end type

on uo_alerte.destroy
call uo_alertes::destroy
end on

type uo_confid from uo_confidentiel_contre_indication within w_ia_rapport
event destroy ( )
string tag = "noresizeall"
integer x = 1179
integer y = 2428
integer taborder = 100
end type

on uo_confid.destroy
call uo_confidentiel_contre_indication::destroy
end on

type cb_3 from uo_picturebutton_390x120 within w_ia_rapport
integer x = 2464
integer y = 2420
integer width = 640
integer taborder = 70
fontcharset fontcharset = ansi!
string facename = "Arial"
string text = "Mettre à Jour"
string iconname = "Actions_Enregistrer.png"
end type

event clicked;call super::clicked;if messagebox("ATTENTION", "Vous allez mettre à jour le dossier du patient avec les informations présentées.~n~nCette opération est irrémédiable.~n~nConfirmez-vous ?", Question!, yesNo!, 2) = 1 then
	
	
	string ls_dossier_patient, ls_nom_fichier_patient, ls_nom_fichier_patient_complet
	boolean lb_var_suite
	integer li_id_categorie
	
	// Diagnostiques 
	string 	ls_diagsquelettique
	
	//ls_diagsquelettique = dw_rapport.getitemstring(1, "diagsquelettique")
	
	
	
	
	
	// Mémorisation du fichier vocal
	
	if cbx_memo_fichier_vocal.checked then 
		
		ls_dossier_patient = dir_photos + string(var_code_local) + win_delimiter
		
		lb_var_suite = true
		
		if not DirectoryExists(ls_dossier_patient) then 
			// création (si nécessaire) du répertoire de destination
			if gfx_creer_rep(ls_dossier_patient) <> 1 then 
				lb_var_suite = false
			end if
		end if
		
		if lb_var_suite then 
//			is_fichier_audio
			ls_nom_fichier_patient = string(today(), "yyyy-mm-dd")+" "+string(now(),"hh-mm-ss") + " - Entretien vocal." + right(is_fichier_audio, 3)
			ls_nom_fichier_patient_complet = ls_dossier_patient + ls_nom_fichier_patient
			
			if FileCopy(is_fichier_audio, ls_nom_fichier_patient_complet ) = 1 then 
				if utilisation_distante then
					// Mémo du fichier en vue du retour au cabinet
					fxg_ajout_acquis_distante ( var_code_local , ls_nom_fichier_patient_complet ) 
				end if
				
				// Mise en historique 
				fxg_enregcourrierhisto(var_code_local, 'DOCSON', today(), "Entretien Vocal", ls_nom_fichier_patient_complet , 'D', "N", "N", "", li_id_categorie)


			else
				Messagebox("ATTENTION", "Impossible de copier le fichier vocal.~n~nFichier de départ : " + is_fichier_audio +  "~n~nFichier de destination : " + ls_nom_fichier_patient_complet )
			end if
			
		else
			
			Messagebox("ATTENTION", "Impossible de créer le dossier de destination du fichier : " + ls_dossier_patient )
			
		end if

		
	end if

	// Mémorisation de l'option pour la prochaine fois
		if cbx_memo_fichier_vocal.checked  then 
			Setprofilestring(dir_ini+inifile_orthokis,"IA","sauvegarder_fichier_vocal","O") 
		else
			Setprofilestring(dir_ini+inifile_orthokis,"IA","sauvegarder_fichier_vocal","N") 
		end if
else
	cbx_memo_fichier_vocal.checked = false
end if


		
	
end event

type cb_2 from uo_picturebutton_390x120 within w_ia_rapport
integer x = 1609
integer y = 2420
integer width = 411
integer taborder = 60
fontcharset fontcharset = ansi!
string facename = "Arial"
string text = "Diag"
string tiptext = "Affichage du diagnostic + DEP actuels"
string iconname = "lc_fiche_admini7.png"
end type

event clicked;call super::clicked;openwithparm(w_diag,var_code_local)
end event

type cb_1 from uo_picturebutton_390x120_fermer within w_ia_rapport
integer x = 3205
integer y = 2412
integer width = 640
integer taborder = 50
fontcharset fontcharset = ansi!
string facename = "Arial"
end type

type gb_1 from groupbox within w_ia_rapport
string tag = "noresizeall"
integer x = 891
integer y = 2344
integer width = 1239
integer height = 264
integer taborder = 110
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean italic = true
long textcolor = 33554432
long backcolor = 67108864
string text = "Dossier actuel"
end type

