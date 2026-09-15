$PBExportHeader$w_export_patient.srw
forward
global type w_export_patient from w_fenetre_arakis
end type
type pb_1 from uo_picturebutton_390x120_fermer within w_export_patient
end type
type pb_exporter from uo_picturebutton_390x120 within w_export_patient
end type
type uo_gb from gearbox within w_export_patient
end type
type rb_nom_du_cadre from radiobutton within w_export_patient
end type
type sle_emplacement from singlelineedit within w_export_patient
end type
type rb_nom_du_fichier from radiobutton within w_export_patient
end type
type st_2 from statictext within w_export_patient
end type
type pb_15 from picturebutton within w_export_patient
end type
type st_3 from statictext within w_export_patient
end type
type sle_desti from singlelineedit within w_export_patient
end type
type cbx_fiche_admini from checkbox within w_export_patient
end type
type cbx_coment_admini from checkbox within w_export_patient
end type
type cbx_coment_cli from checkbox within w_export_patient
end type
type cbx_soins from checkbox within w_export_patient
end type
type cbx_reglements from checkbox within w_export_patient
end type
type cbx_rdv from checkbox within w_export_patient
end type
type cbx_editions from checkbox within w_export_patient
end type
type cbx_documents from checkbox within w_export_patient
end type
type cbx_imagerie from checkbox within w_export_patient
end type
type dw_fiche_admini from datawindow within w_export_patient
end type
type cbx_soins_prevus from checkbox within w_export_patient
end type
type dw_coment_admini from datawindow within w_export_patient
end type
type dw_coment_cli from datawindow within w_export_patient
end type
type dw_coment_cli_2010 from datawindow within w_export_patient
end type
type dw_soins_prevus from datawindow within w_export_patient
end type
type dw_soins from datawindow within w_export_patient
end type
type dw_reglements from datawindow within w_export_patient
end type
type dw_rdv from datawindow within w_export_patient
end type
type dw_editions from datawindow within w_export_patient
end type
type dw_devis from datawindow within w_export_patient
end type
type gb_nom_export from groupbox within w_export_patient
end type
type gb_1 from groupbox within w_export_patient
end type
type gb_2 from groupbox within w_export_patient
end type
type gb_3 from groupbox within w_export_patient
end type
end forward

global type w_export_patient from w_fenetre_arakis
integer width = 4608
integer height = 2268
string title = "Exportation de photos :"
boolean center = true
pb_1 pb_1
pb_exporter pb_exporter
uo_gb uo_gb
rb_nom_du_cadre rb_nom_du_cadre
sle_emplacement sle_emplacement
rb_nom_du_fichier rb_nom_du_fichier
st_2 st_2
pb_15 pb_15
st_3 st_3
sle_desti sle_desti
cbx_fiche_admini cbx_fiche_admini
cbx_coment_admini cbx_coment_admini
cbx_coment_cli cbx_coment_cli
cbx_soins cbx_soins
cbx_reglements cbx_reglements
cbx_rdv cbx_rdv
cbx_editions cbx_editions
cbx_documents cbx_documents
cbx_imagerie cbx_imagerie
dw_fiche_admini dw_fiche_admini
cbx_soins_prevus cbx_soins_prevus
dw_coment_admini dw_coment_admini
dw_coment_cli dw_coment_cli
dw_coment_cli_2010 dw_coment_cli_2010
dw_soins_prevus dw_soins_prevus
dw_soins dw_soins
dw_reglements dw_reglements
dw_rdv dw_rdv
dw_editions dw_editions
dw_devis dw_devis
gb_nom_export gb_nom_export
gb_1 gb_1
gb_2 gb_2
gb_3 gb_3
end type
global w_export_patient w_export_patient

type variables

// Patient courant
double var_code_local
string v_nom, v_prenom
double v_numero_dossier


// passée en paramètre pour savoir de quel patient on vient
gearbox gb2


// liste des fichiers photos correspondant à la List Box
string liste_fichiers[]


// nombre de fichiers trouvés
long nombre_fichiers_trouves



string rep_photos_patient
string repertoire_destination, repertoire_destination_editions, repertoire_destination_documents, repertoire_destination_imagerie
end variables

forward prototypes
public subroutine sauve_pdf (datawindow dw, string fichier_destination, integer nb_arg)
end prototypes

public subroutine sauve_pdf (datawindow dw, string fichier_destination, integer nb_arg);// Sauvegarde la dw au format pdf vers le fichier de destination
dw.settransobject(sqlca)
choose case nb_arg
	case 1
		dw.retrieve(var_code_local)
	case 3
		dw.retrieve(var_code_local,date('1900-01-01'), monnaie_base)
	case 4
		dw.retrieve(var_code_local,date('1900-01-01'),1, monnaie_base)
end choose
fichier_destination = repertoire_destination + win_delimiter + fichier_destination
dw.saveas(fichier_destination, PDF!, false)

end subroutine

on w_export_patient.create
int iCurrent
call super::create
this.pb_1=create pb_1
this.pb_exporter=create pb_exporter
this.uo_gb=create uo_gb
this.rb_nom_du_cadre=create rb_nom_du_cadre
this.sle_emplacement=create sle_emplacement
this.rb_nom_du_fichier=create rb_nom_du_fichier
this.st_2=create st_2
this.pb_15=create pb_15
this.st_3=create st_3
this.sle_desti=create sle_desti
this.cbx_fiche_admini=create cbx_fiche_admini
this.cbx_coment_admini=create cbx_coment_admini
this.cbx_coment_cli=create cbx_coment_cli
this.cbx_soins=create cbx_soins
this.cbx_reglements=create cbx_reglements
this.cbx_rdv=create cbx_rdv
this.cbx_editions=create cbx_editions
this.cbx_documents=create cbx_documents
this.cbx_imagerie=create cbx_imagerie
this.dw_fiche_admini=create dw_fiche_admini
this.cbx_soins_prevus=create cbx_soins_prevus
this.dw_coment_admini=create dw_coment_admini
this.dw_coment_cli=create dw_coment_cli
this.dw_coment_cli_2010=create dw_coment_cli_2010
this.dw_soins_prevus=create dw_soins_prevus
this.dw_soins=create dw_soins
this.dw_reglements=create dw_reglements
this.dw_rdv=create dw_rdv
this.dw_editions=create dw_editions
this.dw_devis=create dw_devis
this.gb_nom_export=create gb_nom_export
this.gb_1=create gb_1
this.gb_2=create gb_2
this.gb_3=create gb_3
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.pb_1
this.Control[iCurrent+2]=this.pb_exporter
this.Control[iCurrent+3]=this.uo_gb
this.Control[iCurrent+4]=this.rb_nom_du_cadre
this.Control[iCurrent+5]=this.sle_emplacement
this.Control[iCurrent+6]=this.rb_nom_du_fichier
this.Control[iCurrent+7]=this.st_2
this.Control[iCurrent+8]=this.pb_15
this.Control[iCurrent+9]=this.st_3
this.Control[iCurrent+10]=this.sle_desti
this.Control[iCurrent+11]=this.cbx_fiche_admini
this.Control[iCurrent+12]=this.cbx_coment_admini
this.Control[iCurrent+13]=this.cbx_coment_cli
this.Control[iCurrent+14]=this.cbx_soins
this.Control[iCurrent+15]=this.cbx_reglements
this.Control[iCurrent+16]=this.cbx_rdv
this.Control[iCurrent+17]=this.cbx_editions
this.Control[iCurrent+18]=this.cbx_documents
this.Control[iCurrent+19]=this.cbx_imagerie
this.Control[iCurrent+20]=this.dw_fiche_admini
this.Control[iCurrent+21]=this.cbx_soins_prevus
this.Control[iCurrent+22]=this.dw_coment_admini
this.Control[iCurrent+23]=this.dw_coment_cli
this.Control[iCurrent+24]=this.dw_coment_cli_2010
this.Control[iCurrent+25]=this.dw_soins_prevus
this.Control[iCurrent+26]=this.dw_soins
this.Control[iCurrent+27]=this.dw_reglements
this.Control[iCurrent+28]=this.dw_rdv
this.Control[iCurrent+29]=this.dw_editions
this.Control[iCurrent+30]=this.dw_devis
this.Control[iCurrent+31]=this.gb_nom_export
this.Control[iCurrent+32]=this.gb_1
this.Control[iCurrent+33]=this.gb_2
this.Control[iCurrent+34]=this.gb_3
end on

on w_export_patient.destroy
call super::destroy
destroy(this.pb_1)
destroy(this.pb_exporter)
destroy(this.uo_gb)
destroy(this.rb_nom_du_cadre)
destroy(this.sle_emplacement)
destroy(this.rb_nom_du_fichier)
destroy(this.st_2)
destroy(this.pb_15)
destroy(this.st_3)
destroy(this.sle_desti)
destroy(this.cbx_fiche_admini)
destroy(this.cbx_coment_admini)
destroy(this.cbx_coment_cli)
destroy(this.cbx_soins)
destroy(this.cbx_reglements)
destroy(this.cbx_rdv)
destroy(this.cbx_editions)
destroy(this.cbx_documents)
destroy(this.cbx_imagerie)
destroy(this.dw_fiche_admini)
destroy(this.cbx_soins_prevus)
destroy(this.dw_coment_admini)
destroy(this.dw_coment_cli)
destroy(this.dw_coment_cli_2010)
destroy(this.dw_soins_prevus)
destroy(this.dw_soins)
destroy(this.dw_reglements)
destroy(this.dw_rdv)
destroy(this.dw_editions)
destroy(this.dw_devis)
destroy(this.gb_nom_export)
destroy(this.gb_1)
destroy(this.gb_2)
destroy(this.gb_3)
end on

event open;call super::open;


var_code_local = var_code

// Infos du patient
select isnull(nom,''), isnull(prenom,''), numero_dossier into :v_nom, :v_prenom, :v_numero_dossier
from patient 
where code = :var_code_local ;


colore_tous_objets_window(this, couleur_fond_fenetre)


// Récupération des images disponibles pour le patient ....

long nb_photos 
integer n
string description_a_charger, nbr_du_nom
string nom_cadre, v_nom_fichier, v_nom_fichier_complet
date v_date_acquis
string v_lib_date

nombre_fichiers_trouves = 0

integer cpt_a_copier = 0


rep_photos_patient =  fxg_get_rep_photos( ) + string(var_code_local) + win_delimiter


// Mise à jour du répertoire de destination ...

sle_emplacement.text = "c:\"
sle_desti.text =  v_nom + " " + v_prenom +" (" + string(v_numero_dossier) + ")"



end event

type p_fond from w_fenetre_arakis`p_fond within w_export_patient
integer x = 3287
integer y = 1936
end type

type pb_1 from uo_picturebutton_390x120_fermer within w_export_patient
integer x = 1902
integer y = 1976
integer width = 571
integer height = 152
integer taborder = 10
boolean bringtotop = true
end type

event clicked;fermer_fenetre(parent)
end event

type pb_exporter from uo_picturebutton_390x120 within w_export_patient
integer x = 850
integer y = 1980
integer width = 571
integer height = 152
integer taborder = 30
boolean bringtotop = true
fontcharset fontcharset = ansi!
string text = "&Exporter"
string iconname = "ACTIONS_Exporter.png"
end type

event clicked;call super::clicked;

string fichier_destination, fichier_depart
boolean ok_suite = true
String fichier_destination_complet
long lig, tot, v_code_devis, boucle


repertoire_destination = trim(sle_emplacement.text) +  trim(sle_desti.text)


if DirectoryExists(repertoire_destination) then 
	if Messagebox("ATTENTION", "Le répertoire de destination existe déjà.~n~nVous risquez d'écraser des fichiers.~n~nConfirmez-vous ?", Question!, YesNo!, 2) = 2 then
		ok_suite = false
	end if
else
	// création (si nécessaire) du répertoire de destination
	gfx_creer_rep(repertoire_destination)

end if


if ok_suite then 

	open(w_patience)
	
	
	if cbx_fiche_admini.checked then
		w_patience.avancement("Fiche Administrative")
		sauve_pdf(dw_fiche_admini, "Fiche Administrative.pdf", 1)
	end if
	if cbx_coment_admini.checked then
		w_patience.avancement("Commentaires Administratifs")
		sauve_pdf(dw_coment_admini, "Commentaires Administratifs.pdf", 1)
	end if
	if cbx_coment_cli.checked then
		w_patience.avancement("Commentaires Cliniques")
		if profilestring(dir_ini+inifile_orthokis,"commentaires_cliniques","commentaires_2010","O") = "O" then
			sauve_pdf(dw_coment_cli_2010, "Commentaires Cliniques.pdf", 1)
		else
			sauve_pdf(dw_coment_cli, "Commentaires Cliniques.pdf", 1)
		end if
	end if
	if cbx_soins_prevus.checked then
		w_patience.avancement("Soins Prévus")
		// il peux y a voir plusieurs devis ... boucle spéciale !
		dw_soins_prevus.settransobject(sqlca)
		dw_devis.settransobject(sqlca)
		dw_devis.retrieve(var_code_local)
		tot = dw_devis.rowcount()
		for lig = 1 to tot
			
			v_code_devis = dw_devis.getitemnumber(lig, "code_devis")
			dw_soins_prevus.retrieve(var_code_local, date('1900-01-01'), monnaie_base, v_code_devis)
			
			fichier_destination = repertoire_destination + win_delimiter + "Soins Prévisionnels - " + trim( dw_devis.getitemstring(lig, "libelle") ) + ".pdf"
			dw_soins_prevus.saveas(fichier_destination, PDF!, false)
		next
		

	end if
	if cbx_soins.checked then
		w_patience.avancement("Soins")
		sauve_pdf(dw_soins, "Soins.pdf",3)
	end if
	if cbx_reglements.checked then
		w_patience.avancement("Règlements")
		sauve_pdf(dw_reglements, "Règlements.pdf", 4)
	end if
	if cbx_rdv.checked then
		w_patience.avancement("Rendez-vouss")
		sauve_pdf(dw_rdv, "Rendez-Vous.pdf", 1)
	end if



	// Editions 
	// ----------------
	if cbx_editions.checked then
		w_patience.avancement("Editions")
		dw_editions.settransobject(sqlca)
		
		dw_editions.retrieve(var_code_local, 'E')
		repertoire_destination_editions = repertoire_destination + win_delimiter + "Editions"
		if not DirectoryExists(repertoire_destination_editions) then 
			// création (si nécessaire) du répertoire de destination
			gfx_creer_rep(repertoire_destination_editions)
		end if
		
		repertoire_destination_editions = repertoire_destination_editions + win_delimiter 
		tot = dw_editions.rowcount()
		
		for lig = 1 to tot 
			fichier_depart = rep_photos_patient + dw_editions.getitemstring(lig, "historique_editions_nom_courrier") 
			fichier_destination = repertoire_destination_editions + dw_editions.getitemstring(lig, "historique_editions_nom_courrier") 
			FileCopy(fichier_depart, fichier_destination, true)
		next
		

	end if


	// Documents 
	// ----------------
	
	if cbx_documents.checked then
		w_patience.avancement("Documents")
		dw_editions.settransobject(sqlca)
		
		dw_editions.retrieve(var_code_local, 'D')
		repertoire_destination_documents = repertoire_destination + win_delimiter + "Documents"
		if not DirectoryExists(repertoire_destination_documents) then 
			// création (si nécessaire) du répertoire de destination
			gfx_creer_rep(repertoire_destination_documents)
		end if
		
		repertoire_destination_documents = repertoire_destination_documents + win_delimiter 
		tot = dw_editions.rowcount()
		
		for lig = 1 to tot 
			fichier_depart = rep_photos_patient + dw_editions.getitemstring(lig, "historique_editions_nom_courrier") 
			fichier_destination = repertoire_destination_documents + dw_editions.getitemstring(lig, "historique_editions_nom_courrier") 
			FileCopy(fichier_depart, fichier_destination, true)
		next
	end if


	// Imagerie 
	
	if cbx_imagerie.checked then 
		
		w_patience.avancement("Imagerie")
		string v_lib_type, v_lib_temps, v_nom_fichier
		date v_date_acquis
		
		repertoire_destination_imagerie = repertoire_destination + win_delimiter + "Imagerie"
		if not DirectoryExists(repertoire_destination_imagerie) then 
			// création (si nécessaire) du répertoire de destination
			gfx_creer_rep(repertoire_destination_imagerie)
		end if
		
		repertoire_destination_imagerie = repertoire_destination_imagerie + win_delimiter 
		 DECLARE cur_images CURSOR FOR  
		  SELECT isnull("type_image"."libelle",''),   
				isnull("temps_traitement"."libelle",''),   
				"images_infos"."nom_fichier"  , "images_infos"."date_acquis" 
		 FROM {oj "temps_traitement" RIGHT OUTER JOIN "images_infos" ON "temps_traitement"."id" = "images_infos"."temps_traitement"}, 
		 {oj "type_image" RIGHT OUTER JOIN "images_infos" ON "type_image"."id" = "images_infos"."type_image"}  
		 where "images_infos"."code" = :var_code_local   
		 ORDER BY  "temps_traitement"."ordre_trie" , "type_image"."ordre_trie" ;
	
		open cur_images ;
		
		Fetch cur_images into :v_lib_type, :v_lib_temps, :v_nom_fichier, :v_date_acquis ;
		
		
		do while sqlca.sqlcode = 0
		
			fichier_depart = rep_photos_patient + v_nom_fichier	
			
			if rb_nom_du_cadre.checked then 
				fichier_destination = trim( v_lib_temps ) + " - " + trim( v_lib_type ) + " - " + v_nom_fichier
			else
				fichier_destination =  v_nom_fichier	
			end if

			fichier_destination = gfx_tout_remplacer(fichier_destination, "/", "-")
			fichier_destination = gfx_tout_remplacer(fichier_destination, "\", "-")
			fichier_destination = gfx_tout_remplacer(fichier_destination, ":", "-")
			fichier_destination = gfx_tout_remplacer(fichier_destination, "*", "-")
			fichier_destination = gfx_tout_remplacer(fichier_destination, "?", "-")
			fichier_destination = gfx_tout_remplacer(fichier_destination, "<", "-")
			fichier_destination = gfx_tout_remplacer(fichier_destination, ">", "-")
			fichier_destination = gfx_tout_remplacer(fichier_destination, '"', "-")
			fichier_destination = gfx_tout_remplacer(fichier_destination, "|", "-")


			fichier_destination_complet = repertoire_destination_imagerie + fichier_destination	
			FileCopy(fichier_depart, fichier_destination_complet, true)
			
			Fetch cur_images into :v_lib_type, :v_lib_temps, :v_nom_fichier, :v_date_acquis ;
		loop
	
	
		close cur_images ;
		
	end if
	

	close(w_patience)
	
	if Messagebox("INFORMATION","Exportation terminée !~n~nSouhaitez-vous accéder au dossier de destination de l'exportation ?", Question!, YesNo!, 2) = 1 then 
		
		String v_commande
		
		v_commande = "Explorer.exe /n," + repertoire_destination
		
		
		run(v_commande)
		
	end if
end if

fermer_fenetre(parent)


end event

type uo_gb from gearbox within w_export_patient
string tag = "uniquement pour accéder aux fonctions"
integer x = 3621
integer y = 172
integer taborder = 40
boolean bringtotop = true
end type

on uo_gb.destroy
call gearbox::destroy
end on

type rb_nom_du_cadre from radiobutton within w_export_patient
integer x = 1947
integer y = 1092
integer width = 1230
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 15780518
string text = "Nom du cadre photo (ex : ~"Face début.jpg~")"
boolean checked = true
end type

type sle_emplacement from singlelineedit within w_export_patient
integer x = 64
integer y = 1576
integer width = 2277
integer height = 96
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 15780518
boolean displayonly = true
borderstyle borderstyle = stylelowered!
end type

type rb_nom_du_fichier from radiobutton within w_export_patient
integer x = 1947
integer y = 1192
integer width = 1184
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 15780518
string text = "Nom du fichier photo (ex : ~"1.jpg~")"
end type

type st_2 from statictext within w_export_patient
integer x = 59
integer y = 1500
integer width = 480
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean underline = true
long textcolor = 33554432
long backcolor = 15780518
string text = "Emplacement :"
boolean focusrectangle = false
end type

type pb_15 from picturebutton within w_export_patient
integer x = 2066
integer y = 1420
integer width = 151
integer height = 128
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "lc_explorer.png"
alignment htextalign = left!
end type

event clicked;string repertoire
repertoire = sle_emplacement.text
sle_emplacement.text = get_repertoire("Sélectionnez le dossier pour l'exportation des photos ...",repertoire)

end event

type st_3 from statictext within w_export_patient
integer x = 59
integer y = 1700
integer width = 640
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean underline = true
long textcolor = 33554432
long backcolor = 15780518
string text = "Dossier de destination :"
boolean focusrectangle = false
end type

type sle_desti from singlelineedit within w_export_patient
integer x = 64
integer y = 1780
integer width = 2277
integer height = 96
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 15780518
boolean displayonly = true
borderstyle borderstyle = stylelowered!
end type

type cbx_fiche_admini from checkbox within w_export_patient
integer x = 101
integer y = 140
integer width = 667
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 15780518
string text = "Fiche Administrative"
boolean checked = true
end type

type cbx_coment_admini from checkbox within w_export_patient
integer x = 101
integer y = 240
integer width = 846
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 15780518
string text = "Commentaires Administratifs"
boolean checked = true
end type

type cbx_coment_cli from checkbox within w_export_patient
integer x = 101
integer y = 340
integer width = 846
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 15780518
string text = "Commentaires Cliniques"
boolean checked = true
end type

type cbx_soins from checkbox within w_export_patient
integer x = 101
integer y = 540
integer width = 846
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 15780518
string text = "Soins sans règlements"
boolean checked = true
end type

type cbx_reglements from checkbox within w_export_patient
integer x = 101
integer y = 640
integer width = 846
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 15780518
string text = "Soins avec règlements"
boolean checked = true
end type

type cbx_rdv from checkbox within w_export_patient
integer x = 101
integer y = 740
integer width = 846
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 15780518
string text = "Rendez-vous"
boolean checked = true
end type

type cbx_editions from checkbox within w_export_patient
integer x = 101
integer y = 1004
integer width = 846
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 15780518
string text = "Editions"
boolean checked = true
end type

type cbx_documents from checkbox within w_export_patient
integer x = 101
integer y = 1104
integer width = 846
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 15780518
string text = "Documents"
boolean checked = true
end type

type cbx_imagerie from checkbox within w_export_patient
integer x = 101
integer y = 1204
integer width = 544
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 15780518
string text = "Imagerie"
boolean checked = true
end type

type dw_fiche_admini from datawindow within w_export_patient
boolean visible = false
integer x = 3259
integer y = 1472
integer width = 686
integer height = 400
integer taborder = 20
boolean bringtotop = true
string title = "none"
string dataobject = "dw_patient_fiche_edition"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type cbx_soins_prevus from checkbox within w_export_patient
integer x = 101
integer y = 440
integer width = 846
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 15780518
string text = "Soins prévisionnels"
boolean checked = true
end type

type dw_coment_admini from datawindow within w_export_patient
boolean visible = false
integer x = 2830
integer y = 1400
integer width = 686
integer height = 400
integer taborder = 20
boolean bringtotop = true
string title = "none"
string dataobject = "dw_comment_admini_edition"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type dw_coment_cli from datawindow within w_export_patient
boolean visible = false
integer x = 2615
integer y = 1440
integer width = 686
integer height = 400
integer taborder = 30
boolean bringtotop = true
string title = "none"
string dataobject = "dw_comment_edition"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type dw_coment_cli_2010 from datawindow within w_export_patient
boolean visible = false
integer x = 2674
integer y = 1332
integer width = 686
integer height = 400
integer taborder = 90
boolean bringtotop = true
string title = "none"
string dataobject = "dw_comment_edition_2010"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type dw_soins_prevus from datawindow within w_export_patient
boolean visible = false
integer x = 4160
integer y = 1508
integer width = 686
integer height = 400
integer taborder = 30
boolean bringtotop = true
string title = "none"
string dataobject = "dw_soins_prevus_edition"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type dw_soins from datawindow within w_export_patient
boolean visible = false
integer x = 3323
integer y = 1484
integer width = 686
integer height = 400
integer taborder = 30
boolean bringtotop = true
string title = "none"
string dataobject = "dw_soins_edition"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type dw_reglements from datawindow within w_export_patient
boolean visible = false
integer x = 3945
integer y = 1040
integer width = 686
integer height = 400
integer taborder = 40
boolean bringtotop = true
string title = "none"
string dataobject = "dw_reglements_edition"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type dw_rdv from datawindow within w_export_patient
boolean visible = false
integer x = 3749
integer y = 1616
integer width = 686
integer height = 400
integer taborder = 40
boolean bringtotop = true
string title = "none"
string dataobject = "dw_rdv_edition"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type dw_editions from datawindow within w_export_patient
boolean visible = false
integer x = 4046
integer y = 1412
integer width = 686
integer height = 400
integer taborder = 50
boolean bringtotop = true
string title = "none"
string dataobject = "dw_patient_fiche5"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type dw_devis from datawindow within w_export_patient
boolean visible = false
integer x = 2496
integer y = 1360
integer width = 686
integer height = 400
integer taborder = 100
boolean bringtotop = true
string title = "none"
string dataobject = "dw_devis_liste"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type gb_nom_export from groupbox within w_export_patient
integer x = 1879
integer y = 1004
integer width = 1696
integer height = 328
integer taborder = 60
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean italic = true
long textcolor = 33554432
long backcolor = 15780518
string text = "Nom des images exportées"
end type

type gb_1 from groupbox within w_export_patient
integer x = 32
integer y = 916
integer width = 1792
integer height = 420
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean italic = true
long textcolor = 33554432
long backcolor = 15780518
string text = "Fichiers annexes"
end type

type gb_2 from groupbox within w_export_patient
integer x = 32
integer y = 1364
integer width = 2331
integer height = 552
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean italic = true
long textcolor = 33554432
long backcolor = 15780518
string text = "Destination"
end type

type gb_3 from groupbox within w_export_patient
integer x = 32
integer y = 28
integer width = 1792
integer height = 836
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean italic = true
long textcolor = 33554432
long backcolor = 15780518
string text = "Dossier Patient"
end type

