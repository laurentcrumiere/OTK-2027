$PBExportHeader$w_importer_doctolib.srw
forward
global type w_importer_doctolib from w_fenetre_arakis
end type
type cb_1 from uo_picturebutton_390x120_fermer within w_importer_doctolib
end type
type st_1 from statictext within w_importer_doctolib
end type
type sle_fichier_import from singlelineedit within w_importer_doctolib
end type
type pb_3 from picturebutton within w_importer_doctolib
end type
type dw_liste_import from datawindow within w_importer_doctolib
end type
type cb_importer from uo_picturebutton_390x120 within w_importer_doctolib
end type
type dw_liste from datawindow within w_importer_doctolib
end type
type uo_1 from resize_fenetre within w_importer_doctolib
end type
type cb_motifs from uo_picturebutton_390x120 within w_importer_doctolib
end type
type cb_agendas from uo_picturebutton_390x120 within w_importer_doctolib
end type
type cb_statuts from uo_picturebutton_390x120 within w_importer_doctolib
end type
type cb_charger from uo_picturebutton_390x120 within w_importer_doctolib
end type
type cb_exporter_liste from uo_picturebutton_390x120 within w_importer_doctolib
end type
type cb_3 from uo_picturebutton_390x120 within w_importer_doctolib
end type
type gb_correspondances from groupbox within w_importer_doctolib
end type
end forward

global type w_importer_doctolib from w_fenetre_arakis
integer width = 4741
integer height = 2888
boolean titlebar = false
string title = ""
boolean controlmenu = false
boolean minbox = false
boolean maxbox = false
boolean resizable = false
windowtype windowtype = child!
cb_1 cb_1
st_1 st_1
sle_fichier_import sle_fichier_import
pb_3 pb_3
dw_liste_import dw_liste_import
cb_importer cb_importer
dw_liste dw_liste
uo_1 uo_1
cb_motifs cb_motifs
cb_agendas cb_agendas
cb_statuts cb_statuts
cb_charger cb_charger
cb_exporter_liste cb_exporter_liste
cb_3 cb_3
gb_correspondances gb_correspondances
end type
global w_importer_doctolib w_importer_doctolib

on w_importer_doctolib.create
int iCurrent
call super::create
this.cb_1=create cb_1
this.st_1=create st_1
this.sle_fichier_import=create sle_fichier_import
this.pb_3=create pb_3
this.dw_liste_import=create dw_liste_import
this.cb_importer=create cb_importer
this.dw_liste=create dw_liste
this.uo_1=create uo_1
this.cb_motifs=create cb_motifs
this.cb_agendas=create cb_agendas
this.cb_statuts=create cb_statuts
this.cb_charger=create cb_charger
this.cb_exporter_liste=create cb_exporter_liste
this.cb_3=create cb_3
this.gb_correspondances=create gb_correspondances
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_1
this.Control[iCurrent+2]=this.st_1
this.Control[iCurrent+3]=this.sle_fichier_import
this.Control[iCurrent+4]=this.pb_3
this.Control[iCurrent+5]=this.dw_liste_import
this.Control[iCurrent+6]=this.cb_importer
this.Control[iCurrent+7]=this.dw_liste
this.Control[iCurrent+8]=this.uo_1
this.Control[iCurrent+9]=this.cb_motifs
this.Control[iCurrent+10]=this.cb_agendas
this.Control[iCurrent+11]=this.cb_statuts
this.Control[iCurrent+12]=this.cb_charger
this.Control[iCurrent+13]=this.cb_exporter_liste
this.Control[iCurrent+14]=this.cb_3
this.Control[iCurrent+15]=this.gb_correspondances
end on

on w_importer_doctolib.destroy
call super::destroy
destroy(this.cb_1)
destroy(this.st_1)
destroy(this.sle_fichier_import)
destroy(this.pb_3)
destroy(this.dw_liste_import)
destroy(this.cb_importer)
destroy(this.dw_liste)
destroy(this.uo_1)
destroy(this.cb_motifs)
destroy(this.cb_agendas)
destroy(this.cb_statuts)
destroy(this.cb_charger)
destroy(this.cb_exporter_liste)
destroy(this.cb_3)
destroy(this.gb_correspondances)
end on

event open;call super::open;

// recupération des fichiers précédents dans Orthokis.ini

sle_fichier_import.text = Profilestring(dir_ini+inifile_orthokis,"Doctolib","Fichier_import","")

gb_correspondances.backcolor = couleur_fond_fenetre

uo_1.taille(this)


end event

event close;call super::close;

// Mémorisation des fichiers pour la prochaine fois

Setprofilestring(dir_ini+inifile_orthokis,"Doctolib","Fichier_import",sle_fichier_import.text)

end event

event resize;call super::resize;uo_1.retaille(this)
end event

type p_fond from w_fenetre_arakis`p_fond within w_importer_doctolib
end type

type cb_1 from uo_picturebutton_390x120_fermer within w_importer_doctolib
integer x = 4151
integer y = 2564
integer width = 471
integer taborder = 10
boolean bringtotop = true
end type

event clicked;
Fermer_fenetre (parent)
end event

type st_1 from statictext within w_importer_doctolib
integer x = 64
integer y = 68
integer width = 576
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 553648127
string text = "Fichier  à importer :"
boolean focusrectangle = false
end type

type sle_fichier_import from singlelineedit within w_importer_doctolib
integer x = 663
integer y = 52
integer width = 1774
integer height = 112
integer taborder = 10
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
end type

type pb_3 from picturebutton within w_importer_doctolib
string tag = "no resizeall"
integer x = 2450
integer y = 44
integer width = 155
integer height = 136
integer taborder = 40
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "lc_explorer.png"
alignment htextalign = left!
end type

event clicked;string file_name,file_path
string init_dir

init_dir = gfx_extraire_path_fichier(sle_fichier_import.text)

if init_dir = "" then 
	init_dir = dir_ini
end if

//ouverture de la dialogbox
if GetFileOpenName("Fichier import Doctolib",file_path, file_name, "CSV" , "Fichiers CSV (*.csv),*.csv", init_dir) = 1 then
	sle_fichier_import.text = file_path 
end if
end event

type dw_liste_import from datawindow within w_importer_doctolib
boolean visible = false
integer x = 1449
integer y = 184
integer width = 4256
integer height = 624
integer taborder = 20
boolean bringtotop = true
string title = "none"
string dataobject = "dw_import_doctolib"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type cb_importer from uo_picturebutton_390x120 within w_importer_doctolib
integer x = 2994
integer y = 2564
integer width = 558
integer taborder = 30
boolean bringtotop = true
boolean enabled = false
string text = "&Importer RDV"
string iconname = "lc_stepin.png"
end type

event clicked;call super::clicked;if messagebox("ATTENTION", "Vous allez importer les rendez-vous et créer les patient si nécessaire.~n~nCette action est irrémédiable !~n~nConfirmez-vous ?", question!, yesNo!, 2) = 1 then
	
	long lig, tot
	integer ajout_patient, ajout_rdv, modif_rdv
	double var_code_patient_courant
	boolean lb_ok_patient, lb_is_creation_rdv
	double ldb_code_interne_rdv, ldb_code_patient
	datetime ldt_rdv
	date ld_date_naissance

	string ls_nom, ls_prenom, ls_adresse, ls_code_postal, ls_ville, ls_portable, ls_telephone, ls_email
	integer li_titre
	
	string ls_type_rdv, ls_etat_rdv, ls_code_praticien
	integer li_duree, li_fauteuil

	
	ajout_patient = 0
	ajout_rdv = 0
	modif_rdv = 0
	
	// Mémorisation du patient courant pour le remettre en place à la fin car on se sert de var_code dans l'ajout de patient
	var_code_patient_courant = var_code
	
	tot = dw_liste.rowcount()
	
	for lig = 1 to tot
		
		if dw_liste.getitemString(lig , "selection") = "O" then
		
			ls_nom = dw_liste.getitemString(lig, "nom")
			ls_prenom = dw_liste.getitemString(lig, "prenom")
			
			if dw_liste.getitemnumber(lig, "couleur_fond_patient") = couleur_jaune then
				// il faut crééer le patient
				
				openwithparm(w_nouveau_numero,3)
				
				// Mise jour de la fiche avec valeurs 

				

				ls_adresse = dw_liste.getitemString(lig, "adresse")
				ls_code_postal = dw_liste.getitemString(lig, "code_postal")
				ls_ville = dw_liste.getitemString(lig, "ville")
				ls_portable = dw_liste.getitemString(lig, "portable")
				ls_telephone = dw_liste.getitemString(lig, "telephone")
				ls_email = dw_liste.getitemString(lig, "email")
				ld_date_naissance = dw_liste.getitemDate(lig, "date_naissance")
				li_titre = dw_liste.getitemNumber(lig, "titre")
				
				update patient set nom = :ls_nom, prenom = :ls_prenom, nom_parent1 = trim(:ls_nom) + ' ' + trim(:ls_prenom), 
				adr1_parent1 = left(:ls_adresse, 35), adr2_parent1 = SUBSTRING (:ls_adresse, 36), codep_parent1 = :ls_code_postal, ville_parent1 = :ls_ville , 
				portable = :ls_portable , email = :ls_email , titre_patient = :li_titre, titre_parent1 = :li_titre , date_naissance = :ld_date_naissance , code_praticien = :ls_code_praticien 
				where code = :var_code ;
				
				if sqlca.sqlcode = 0 then 
					commit ;
					// on met à jour le code de la liste pour la saisie du rdv ensuite
					dw_liste.setitem(lig, "code_patient", var_code)
					ajout_patient = ajout_patient  + 1
					lb_ok_patient = true
				else
					messagebox("ATTENTION", "Erreur dans l'ajout du patient : " + ls_nom + " " + ls_prenom + "~n~nErreur N°" + string(sqlca.sqlcode) + "~n" + sqlca.sqlerrtext)
					rollback ;				
					lb_ok_patient = false
				end if
			else
				// le patient existe déjà 
				lb_ok_patient = true
			end if
			
			if lb_ok_patient then 
				// c'est bon pour le patient : on peut créer le rdv
				
				ldt_rdv = dw_liste.getitemDateTime(lig, "rdv")
				ldb_code_patient = dw_liste.getitemNumber(lig, "code_patient")
				ls_code_praticien = dw_liste.getitemString(lig, "code_praticien")
				li_duree = dw_liste.getitemNumber(lig, "duree")
				li_fauteuil = dw_liste.getitemNumber(lig, "fauteuil")
				ls_type_rdv = dw_liste.getitemString(lig, "type_rdv")
				ls_etat_rdv = dw_liste.getitemString(lig, "etat_rdv")
				
				ldb_code_interne_rdv = dw_liste.getitemNumber(lig, "code_interne_rdv")
				// recherche si le rdv n'existe pas déjà ... si c'est le cas, on fera une une modification de l'état

				if ldb_code_interne_rdv = 0 then 
					// le rdv n'existe pas ... on l'ajoute
					lb_is_creation_rdv = true
		
					ldb_code_interne_rdv = code_interne_rdv()
					insert into rdv ("rdv", "code_interne", "code_praticien", "duree", "user_modif", "date_modif", "type", "absent", "fauteuil", "code")
					values (:ldt_rdv, :ldb_code_interne_rdv, :ls_code_praticien, :li_duree, :utilisateur_code, now(*), :ls_type_rdv, :ls_etat_rdv , :li_fauteuil, :ldb_code_patient ) ;
					
				else
					// le rendez-vous existe : on met jsute à jour l'état
					update rdv set absent = :ls_etat_rdv where code = :ldb_code_patient and code_praticien = :ls_code_praticien and "type" = :ls_type_rdv  and rdv = :ldt_rdv ;
					lb_is_creation_rdv = false
				end if
					
				if sqlca.sqlcode = 0 then 
					commit ;
					if lb_is_creation_rdv then
						ajout_rdv = ajout_rdv + 1
					else
						modif_rdv = modif_rdv + 1
					end if
				else
					messagebox("ATTENTION", "Erreur dans l'ajout du rendez-vous du " + string(ldt_rdv, "dd/mm/yyyy à hh:mm") + " pour "  + ls_nom + " " + ls_prenom +"~n~nErreur N°" + string(sqlca.sqlcode) + "~n" + sqlca.sqlerrtext)
					rollback ;
				end if 
				
			end if
			
			
		end if
		
	next
	
	Messagebox("INFORMATION", "L'importation est terminée !~n~n" + string(ajout_patient) + " patient(s) ajouté(s)~n~n" + string(ajout_rdv) + " rendez-vous ajouté(s)~n~n" + string(modif_rdv) + " rendez-vous modifié(s)"   )
	
	// remise en place du patient courant
	var_code = 	var_code_patient_courant
	
end if
end event

type dw_liste from datawindow within w_importer_doctolib
integer x = 55
integer y = 184
integer width = 4631
integer height = 2200
integer taborder = 30
boolean bringtotop = true
string title = "none"
string dataobject = "dw_import_liste_doctolib"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;string	ls_Object
string	ls_sel
long lig, tot

ls_Object = String(dwo.name)


choose case ls_object
	case "b_selection" 
	// Selection tous / aucun

		tot = rowcount()
		
		if  tot > 0 then 
			// On prend la valeur inverse de la 1ère ligne est on l'applique à toutes les lignes
			
			ls_sel = getitemstring(1, "selection")
			
			if ls_sel = "O" then 
				ls_sel = "N"
			else
				ls_sel = "O"
			end if
			
			for lig = 1 to tot
				setitem(lig, "selection", ls_sel)
			next
			
		end if

end choose
end event

type uo_1 from resize_fenetre within w_importer_doctolib
boolean visible = false
integer x = 3479
integer y = 140
integer taborder = 20
boolean bringtotop = true
end type

on uo_1.destroy
call resize_fenetre::destroy
end on

type cb_motifs from uo_picturebutton_390x120 within w_importer_doctolib
integer x = 695
integer y = 2564
integer width = 521
integer taborder = 40
boolean bringtotop = true
string text = "&Motifs RDV"
string iconname = "ACTIONS_modifier.png"
end type

event clicked;call super::clicked;

open(w_doctolib_motif_rdv)
end event

type cb_agendas from uo_picturebutton_390x120 within w_importer_doctolib
integer x = 1248
integer y = 2564
integer width = 521
integer taborder = 50
boolean bringtotop = true
string text = "&Agendas"
string iconname = "ACTIONS_modifier.png"
end type

event clicked;call super::clicked;

open(w_doctolib_agenda)
end event

type cb_statuts from uo_picturebutton_390x120 within w_importer_doctolib
integer x = 1801
integer y = 2564
integer width = 521
integer taborder = 60
boolean bringtotop = true
string text = "&Statuts"
string iconname = "ACTIONS_modifier.png"
end type

event clicked;call super::clicked;
open(w_doctolib_statut)
end event

type cb_charger from uo_picturebutton_390x120 within w_importer_doctolib
integer x = 64
integer y = 2544
integer width = 521
integer taborder = 40
boolean bringtotop = true
fontcharset fontcharset = ansi!
string text = "Charger "
string iconname = "ACTIONS_stock_generer_selon_index.png"
end type

event clicked;call super::clicked;
string ls_path_csv, ls_path_txt, ls_file_content
blob lblb_data
integer li_file_csv, li_file_txt
long lig_import, tot_import, lig_liste
string ls_type_rdv, ls_motif_rdv, ls_code_praticien, ls_agenda, ls_etat_rdv, ls_statut
string ls_civilite
integer cpt_motif, li_fauteuil
double ldb_id_motif, ldb_id_agenda
boolean lb_motifs_ok, lb_agendas_ok, lb_statuts_ok , lb_rdv_pas_saisi, lb_civilite_ok
datetime ldt_rdv
integer li_duree, li_titre
string ls_elimine_agenda, ls_nom, ls_prenom
date ld_date_naissance
integer nb1, nb2, nb_deja
double var_code_local, ldb_code_interne_rdv


ls_path_csv = sle_fichier_import.text // Chemin de votre fichier

uo_lire_eid_belgique uo_pour_conversion						// conversion ut8 -> Ansi
uo_pour_conversion = create uo_lire_eid_belgique

// 1. Lire le fichier en BLOB (pour supporter les gros fichiers et l'accentuation)
li_file_csv = FileOpen(ls_path_csv, LineMode!, read!, shared!, replace!)
if li_file_csv < 0 then
    MessageBox("Erreur", "Impossible d'ouvrir le fichier")
    return
end if

dw_liste.reset()
dw_liste_import.reset()
cb_importer.enabled(false)

open(w_patience)
ls_path_txt = "c:\trace.txt"
li_file_txt = FileOpen(ls_path_txt, Linemode!, write!, LockReadWrite!,  replace!)

do while FileRead(li_file_csv, ls_file_content) > 0 

ls_file_content = 	 uo_pour_conversion.convert_utf8_to_ansi(ls_file_content)

 // on vire les ' pour l'instant
//ls_file_content = gfx_tout_remplacer (ls_file_content, "'", "")

// 3. Remplacer les ";" par des tabulations "~t" 
// PowerBuilder importe nativement le format Text! (tab-separated)
ls_file_content = gfx_tout_remplacer (ls_file_content, ";", "~t")

 FileWriteEx(li_file_txt, ls_file_content)

loop

	
FileClose(li_file_csv)
FileClose(li_file_txt)




// 4. Importer dans la DataWindow
// On commence à la ligne 2 pour ignorer l'entête (Header) du CSV
tot_import = dw_liste_import.ImportFile(Text!, ls_path_txt, 2)

if tot_import > 0 then
   // Trace(string(ll_import_count) + " lignes importées.")

	// Parcours de la liste Doctolib pour constituer notre liste en associant
	lig_liste = 0
	
	lb_motifs_ok = true
	lb_agendas_ok = true
	lb_statuts_ok  = true
	lb_civilite_ok = true
	
	for lig_import = 1 to tot_import
		
		// on ne prend que les ajouts des patients
		if lower(dw_liste_import.getitemstring(lig_import, "rdv_internet")) = "oui" then
			dw_liste.insertrow(0)
			lig_liste = dw_liste.rowcount()
			dw_liste.setitem(lig_liste, "rdv", DateTime ( dw_liste_import.getitemdate(lig_import, "date_debut") , time ( left( dw_liste_import.getitemstring(lig_import, "heure_debut"),2) +":" +  right( dw_liste_import.getitemstring(lig_import, "heure_debut"),2)  ) ))
			
			dw_liste.setitem(lig_liste, "nom", dw_liste_import.getitemstring(lig_import, "nom") )
			dw_liste.setitem(lig_liste, "prenom", dw_liste_import.getitemstring(lig_import, "prenom") )
			dw_liste.setitem(lig_liste, "date_naissance", dw_liste_import.getitemdate(lig_import, "date_naissance") )
			dw_liste.setitem(lig_liste, "motif_rdv", dw_liste_import.getitemstring(lig_import, "motif_rdv") )
			dw_liste.setitem(lig_liste, "agenda", dw_liste_import.getitemstring(lig_import, "agenda") )
			dw_liste.setitem(lig_liste, "duree", dw_liste_import.getitemnumber(lig_import, "duree") )
			dw_liste.setitem(lig_liste, "statut", dw_liste_import.getitemstring(lig_import, "statut") )

			dw_liste.setitem(lig_liste, "portable", dw_liste_import.getitemstring(lig_import, "telephone_portable") )
			dw_liste.setitem(lig_liste, "telephone", dw_liste_import.getitemstring(lig_import, "telephone_secondaire") )
			dw_liste.setitem(lig_liste, "email", dw_liste_import.getitemstring(lig_import, "email_patient") )
			dw_liste.setitem(lig_liste, "adresse", dw_liste_import.getitemstring(lig_import, "adresse") )
			dw_liste.setitem(lig_liste, "code_postal", dw_liste_import.getitemstring(lig_import, "code_postal") )
			dw_liste.setitem(lig_liste, "ville", dw_liste_import.getitemstring(lig_import, "ville") )
			dw_liste.setitem(lig_liste, "civilite", dw_liste_import.getitemstring(lig_import, "civilite") )


			dw_liste.setitem(lig_liste, "selection", "O" )
			
			
			// Analyse correspondances OK 

			// Motif de rendez-vous 
			ldb_id_motif = dw_liste_import.getitemNumber(lig_import, "id_synchro_motif")
			select isnull(type_rdv, '') into :ls_type_rdv from doctolib_motif where id_motif = :ldb_id_motif ;
			
			if ls_type_rdv = '' or sqlca.sqlcode <> 0 then  
				// fond rouge
				dw_liste.setitem(lig_liste, "couleur_fond_motif", couleur_rouge) 
				// on ajoute dans la table sans message d'erreur ... si existe déjà c'est que valeur null 

				ls_motif_rdv = dw_liste_import.getitemString(lig_import, "motif_rdv")
				
				insert into doctolib_motif ("id_motif", "motif") values(:ldb_id_motif, :ls_motif_rdv) ;
				
				lb_motifs_ok = false
			else
				// fond transparent
				dw_liste.setitem(lig_liste, "couleur_fond_motif", couleur_transparente) 
				dw_liste.setitem(lig_liste, "type_rdv", ls_type_rdv) 
			end if
				
			
			// Agenda
			ldb_id_agenda = dw_liste_import.getitemNumber(lig_import, "id_synchro_agenda")
			select isnull(code_praticien, ''), isnull(fauteuil, 0) into :ls_code_praticien, :li_fauteuil from doctolib_agenda where id_agenda = :ldb_id_agenda ;
			
			if ls_code_praticien = '' or li_fauteuil = 0 or sqlca.sqlcode <> 0 then  
				// fond rouge
				dw_liste.setitem(lig_liste, "couleur_fond_agenda", couleur_rouge) 
				// on ajoute dans la table sans message d'erreur ... si existe déjà c'est que valeur null 

				ls_agenda = dw_liste_import.getitemString(lig_import, "agenda")
				
				insert into doctolib_agenda ("id_agenda", "agenda") values(:ldb_id_agenda, :ls_agenda) ;
				lb_agendas_ok = false
				
			else
				// fond transparent
				dw_liste.setitem(lig_liste, "couleur_fond_agenda", couleur_transparente) 
				dw_liste.setitem(lig_liste, "fauteuil", li_fauteuil) 
				dw_liste.setitem(lig_liste, "code_praticien", ls_code_praticien) 
			end if
				
			// Statut
			ls_statut = dw_liste_import.getitemString(lig_import, "statut")
			select isnull(etat_rdv, '') into :ls_etat_rdv  from doctolib_statut where statut = :ls_statut ;
			
			if ls_etat_rdv = ''  or sqlca.sqlcode <> 0 then  
				// fond rouge
				dw_liste.setitem(lig_liste, "couleur_fond_statut", couleur_rouge) 
				// on ajoute dans la table sans message d'erreur ... si existe déjà c'est que valeur null 

				insert into doctolib_statut ("statut") values( :ls_statut) ;
				
				lb_statuts_ok = false
				
			else
				// fond transparent
				dw_liste.setitem(lig_liste, "couleur_fond_statut", couleur_transparente) 
				dw_liste.setitem(lig_liste, "etat_rdv", ls_etat_rdv) 
			end if
			
			// Civilité
			ls_civilite = dw_liste_import.getitemString(lig_import, "civilite")
			select isnull(titre, 0) into :li_titre  from doctolib_civilite where civilite = :ls_civilite ;
			
			if li_titre = 0  or sqlca.sqlcode <> 0 then 
				// fond rouge
				dw_liste.setitem(lig_liste, "couleur_fond_civilite", couleur_rouge) 
				// on ajoute dans la table sans message d'erreur ... si existe déjà c'est que valeur null 

				insert into doctolib_civilite ("civilite") values( :ls_civilite) ;
				
				lb_civilite_ok = false
				
			else
				// fond transparent
				dw_liste.setitem(lig_liste, "titre", li_titre )
				dw_liste.setitem(lig_liste, "couleur_fond_civilite", couleur_transparente) 
			end if
			
			
			// Patient
			// Vérification de l'existance du patient ... fond jaune si nouveau
			ls_nom = dw_liste.getitemString(lig_liste, "nom")
			ls_prenom = dw_liste.getitemString(lig_liste, "prenom")
			ld_date_naissance = dw_liste.getitemDate(lig_liste, "date_naissance")
			ldt_rdv = dw_liste.getitemDateTime(lig_liste, "rdv")
			
			
			var_code_local = 0
			select isnull(code,0) into :var_code_local from patient where nom = :ls_nom and prenom = :ls_prenom and date_naissance = :ld_date_naissance ;
			
			lb_rdv_pas_saisi = true
			
			if var_code_local = 0 then 
				// nouveau patient sur fond jaune
				dw_liste.setitem(lig_liste, "couleur_fond_patient", couleur_jaune) 
			else
				// patient existant
				dw_liste.setitem(lig_liste, "couleur_fond_patient", couleur_transparente) 
				dw_liste.setitem(lig_liste, "code_patient", var_code_local) 
				
				// recherche si le rdv n'existe pas déjà ... si c'est le cas, on fera une une modification de l'état
				select isnull(code_interne, 0) into :ldb_code_interne_rdv from rdv where code = :var_code_local and code_praticien = :ls_code_praticien and "type" = :ls_type_rdv  and rdv = :ldt_rdv ;

				if ldb_code_interne_rdv > 0 then 
					dw_liste.setitem(lig_liste, "couleur_fond_rdv", couleur_verte)
					dw_liste.setitem(lig_liste, "code_interne_rdv", ldb_code_interne_rdv)
					
					lb_rdv_pas_saisi = false
				else
					// Le rdv n'existe pas
					dw_liste.setitem(lig_liste, "couleur_fond_rdv", couleur_jaune)
				end if
			end if
			
			if lb_rdv_pas_saisi  then
			
				
				// Vérification de la présence du rdv
				
				// Est ce que le rendez-vous existe déjà ?
				
				ldt_rdv = dw_liste.getitemDateTime(lig_liste, "rdv")
				li_duree = dw_liste.getitemNumber(lig_liste, "duree")
				
				
				// Vérification d'autres rendez-vous à la même heure !!
				
				// Sur le même fauteuil
				nb1 = verif_presence_rendez_vous(var_code_local, ldt_rdv, li_duree, ls_code_praticien, li_fauteuil, true)
		
				// Sur d'autres fauteuils pour le même praticien
				nb2 = verif_presence_rendez_vous(var_code_local, ldt_rdv, li_duree, ls_code_praticien, li_fauteuil, false)
				
				if nb1 + nb2 > 0 then 
					dw_liste.setitem(lig_liste, "couleur_fond_rdv", couleur_orange)
				else
					// Pas de conflit .. ajout normal
					dw_liste.setitem(lig_liste, "couleur_fond_rdv", couleur_jaune)
				end if
			end if

		end if
	next
	
	commit ;

	close(w_patience)
	if not lb_agendas_ok or not lb_motifs_ok or not lb_statuts_ok or not lb_civilite_ok then 
		if not lb_agendas_ok then 
			Messagebox("ATTENTION", "Au moins un agenda n'a pas été configuré en terme de correspondance Doctolib <-> Orthokis.~n~nVeuillez y remédier puis refaites le chargement pour vérifier !")
		end if
		if not lb_motifs_ok then 
			Messagebox("ATTENTION", "Au moins un motif n'a pas été configuré en terme de correspondance Doctolib <-> Orthokis.~n~nVeuillez y remédier puis refaites le chargement pour vérifier !")
		end if
		if not lb_statuts_ok then 
			Messagebox("ATTENTION", "Au moins un statut de rendez-vous n'a pas été configuré en terme de correspondance Doctolib <-> Orthokis.~n~nVeuillez y remédier puis refaites le chargement pour vérifier !")
		end if
		if not lb_civilite_ok then 
			Messagebox("ATTENTION", "Au moins une civilité n'a pas été configurée en terme de correspondance Doctolib <-> Orthokis.~n~nVeuillez y remédier puis refaites le chargement pour vérifier !")
		end if
	else
		MessageBox("INFORMATION", string(dw_liste.rowcount()) + " rendez-vous ont été chargés et sont prêts à être importés !")
		cb_importer.enabled(true)
	end if

 	cb_exporter_liste.enabled(true)

else
   MessageBox("ATTENTION", "Aucune ligne n'a été importée.")
	cb_exporter_liste.enabled(false)
end if

end event

type cb_exporter_liste from uo_picturebutton_390x120 within w_importer_doctolib
integer x = 3575
integer y = 2564
integer width = 558
integer taborder = 40
boolean bringtotop = true
boolean enabled = false
string text = "Exporter Liste"
string iconname = "ACTIONS_exporter.png"
end type

event clicked;call super::clicked;

dw_liste.saveAs()
end event

type cb_3 from uo_picturebutton_390x120 within w_importer_doctolib
integer x = 2354
integer y = 2564
integer width = 521
integer taborder = 70
boolean bringtotop = true
string text = "Civilités"
string iconname = "ACTIONS_modifier.png"
end type

event clicked;call super::clicked;
open(w_doctolib_civilite)
end event

type gb_correspondances from groupbox within w_importer_doctolib
integer x = 631
integer y = 2488
integer width = 2295
integer height = 252
integer taborder = 50
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean italic = true
long textcolor = 33554432
long backcolor = 67108864
string text = "Configuration correspondances"
end type

