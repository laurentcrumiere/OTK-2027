$PBExportHeader$w_main.srw
forward
global type w_main from window
end type
type dw_1 from datawindow within w_main
end type
type gb_6 from groupbox within w_main
end type
type rb_supprime_photos from radiobutton within w_main
end type
type dw_historique_traitement from datawindow within w_main
end type
type rb_un_dossier from radiobutton within w_main
end type
type rb_tous_dossier from radiobutton within w_main
end type
type ole_image from olecustomcontrol within w_main
end type
type st_version from statictext within w_main
end type
type dw_reglements from datawindow within w_main
end type
type dw_rendez-vous from datawindow within w_main
end type
type dw_commentaires_administratifs from datawindow within w_main
end type
type dw_commentaires_cliniques from datawindow within w_main
end type
type dw_fiche_administrative from datawindow within w_main
end type
type lb_fichiers from listbox within w_main
end type
type dw_liste from datawindow within w_main
end type
type rb_conserve_photos from radiobutton within w_main
end type
type gb_3 from groupbox within w_main
end type
type cb_lancer from commandbutton within w_main
end type
type sle_nouveau_dossier from singlelineedit within w_main
end type
type rb_autre_dossier from radiobutton within w_main
end type
type rb_chemin_actuel from radiobutton within w_main
end type
type dw_prati from datawindow within w_main
end type
type rb_un from radiobutton within w_main
end type
type rb_tous from radiobutton within w_main
end type
type cb_fermer from commandbutton within w_main
end type
type gb_1 from groupbox within w_main
end type
type sle_dir_photos from singlelineedit within w_main
end type
type gb_2 from groupbox within w_main
end type
type dw_dossier from datawindow within w_main
end type
type gb_4 from gb_1 within w_main
end type
type gb_5 from groupbox within w_main
end type
type rb_conserve_dossier_patient from radiobutton within w_main
end type
type rb_supprime_dossier_patient from radiobutton within w_main
end type
end forward

global type w_main from window
integer width = 3438
integer height = 2220
boolean titlebar = true
string title = "Archivage Externe de Dossiers"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 12639424
string icon = "AppIcon!"
boolean center = true
dw_1 dw_1
gb_6 gb_6
rb_supprime_photos rb_supprime_photos
dw_historique_traitement dw_historique_traitement
rb_un_dossier rb_un_dossier
rb_tous_dossier rb_tous_dossier
ole_image ole_image
st_version st_version
dw_reglements dw_reglements
dw_rendez-vous dw_rendez-vous
dw_commentaires_administratifs dw_commentaires_administratifs
dw_commentaires_cliniques dw_commentaires_cliniques
dw_fiche_administrative dw_fiche_administrative
lb_fichiers lb_fichiers
dw_liste dw_liste
rb_conserve_photos rb_conserve_photos
gb_3 gb_3
cb_lancer cb_lancer
sle_nouveau_dossier sle_nouveau_dossier
rb_autre_dossier rb_autre_dossier
rb_chemin_actuel rb_chemin_actuel
dw_prati dw_prati
rb_un rb_un
rb_tous rb_tous
cb_fermer cb_fermer
gb_1 gb_1
sle_dir_photos sle_dir_photos
gb_2 gb_2
dw_dossier dw_dossier
gb_4 gb_4
gb_5 gb_5
rb_conserve_dossier_patient rb_conserve_dossier_patient
rb_supprime_dossier_patient rb_supprime_dossier_patient
end type
global w_main w_main

type variables




end variables

forward prototypes
public subroutine suppression_table (string nom_table, string nom_champ, double var_code_patient)
end prototypes

public subroutine suppression_table (string nom_table, string nom_champ, double var_code_patient);

string commande_sql

commande_sql = "DELETE FROM " + nom_table +" WHERE " + nom_champ +" = "+string(var_code_patient)


EXECUTE IMMEDIATE :commande_sql ;
if sqlca.sqlcode <> 0 then
	messagebox("Pb dans suppression du dossier "+string(var_code_patient)+" dans la table " +nom_table,sqlca.sqlerrtext)
end if

return
end subroutine

on w_main.create
this.dw_1=create dw_1
this.gb_6=create gb_6
this.rb_supprime_photos=create rb_supprime_photos
this.dw_historique_traitement=create dw_historique_traitement
this.rb_un_dossier=create rb_un_dossier
this.rb_tous_dossier=create rb_tous_dossier
this.ole_image=create ole_image
this.st_version=create st_version
this.dw_reglements=create dw_reglements
this.dw_rendez-vous=create dw_rendez-vous
this.dw_commentaires_administratifs=create dw_commentaires_administratifs
this.dw_commentaires_cliniques=create dw_commentaires_cliniques
this.dw_fiche_administrative=create dw_fiche_administrative
this.lb_fichiers=create lb_fichiers
this.dw_liste=create dw_liste
this.rb_conserve_photos=create rb_conserve_photos
this.gb_3=create gb_3
this.cb_lancer=create cb_lancer
this.sle_nouveau_dossier=create sle_nouveau_dossier
this.rb_autre_dossier=create rb_autre_dossier
this.rb_chemin_actuel=create rb_chemin_actuel
this.dw_prati=create dw_prati
this.rb_un=create rb_un
this.rb_tous=create rb_tous
this.cb_fermer=create cb_fermer
this.gb_1=create gb_1
this.sle_dir_photos=create sle_dir_photos
this.gb_2=create gb_2
this.dw_dossier=create dw_dossier
this.gb_4=create gb_4
this.gb_5=create gb_5
this.rb_conserve_dossier_patient=create rb_conserve_dossier_patient
this.rb_supprime_dossier_patient=create rb_supprime_dossier_patient
this.Control[]={this.dw_1,&
this.gb_6,&
this.rb_supprime_photos,&
this.dw_historique_traitement,&
this.rb_un_dossier,&
this.rb_tous_dossier,&
this.ole_image,&
this.st_version,&
this.dw_reglements,&
this.dw_rendez-vous,&
this.dw_commentaires_administratifs,&
this.dw_commentaires_cliniques,&
this.dw_fiche_administrative,&
this.lb_fichiers,&
this.dw_liste,&
this.rb_conserve_photos,&
this.gb_3,&
this.cb_lancer,&
this.sle_nouveau_dossier,&
this.rb_autre_dossier,&
this.rb_chemin_actuel,&
this.dw_prati,&
this.rb_un,&
this.rb_tous,&
this.cb_fermer,&
this.gb_1,&
this.sle_dir_photos,&
this.gb_2,&
this.dw_dossier,&
this.gb_4,&
this.gb_5,&
this.rb_conserve_dossier_patient,&
this.rb_supprime_dossier_patient}
end on

on w_main.destroy
destroy(this.dw_1)
destroy(this.gb_6)
destroy(this.rb_supprime_photos)
destroy(this.dw_historique_traitement)
destroy(this.rb_un_dossier)
destroy(this.rb_tous_dossier)
destroy(this.ole_image)
destroy(this.st_version)
destroy(this.dw_reglements)
destroy(this.dw_rendez-vous)
destroy(this.dw_commentaires_administratifs)
destroy(this.dw_commentaires_cliniques)
destroy(this.dw_fiche_administrative)
destroy(this.lb_fichiers)
destroy(this.dw_liste)
destroy(this.rb_conserve_photos)
destroy(this.gb_3)
destroy(this.cb_lancer)
destroy(this.sle_nouveau_dossier)
destroy(this.rb_autre_dossier)
destroy(this.rb_chemin_actuel)
destroy(this.dw_prati)
destroy(this.rb_un)
destroy(this.rb_tous)
destroy(this.cb_fermer)
destroy(this.gb_1)
destroy(this.sle_dir_photos)
destroy(this.gb_2)
destroy(this.dw_dossier)
destroy(this.gb_4)
destroy(this.gb_5)
destroy(this.rb_conserve_dossier_patient)
destroy(this.rb_supprime_dossier_patient)
end on

event open;// N° de série ... pour les pages cliniques
SERIAL = string(h.rns())	//lecture num série (codé ds num authenticité)


centrer(this)

dw_prati.settransobject(sqlca)
dw_prati.retrieve()

dw_dossier.settransobject(sqlca)
dw_dossier.retrieve()

dw_liste.settransobject(sqlca)
dw_fiche_administrative.settransobject(sqlca)

// gestion des commentaires cliniques spécifiques
choose case serial
	case '87309'
		// Sébillotte
		dw_commentaires_cliniques.dataobject = "dw_coment_edition_sebillotte"
end choose
dw_commentaires_cliniques.settransobject(sqlca)


dw_commentaires_administratifs.settransobject(sqlca)
dw_rendez-vous.settransobject(sqlca)
dw_reglements.settransobject(sqlca)
dw_historique_traitement.settransobject(sqlca)

// Initialisation
sle_dir_photos.text = dir_photos 
sle_nouveau_dossier.text = "c:\power\Archives du "+string(today(),"dd-mm-yyyy")+"\"
st_version.text = version



end event

type dw_1 from datawindow within w_main
string tag = "QUE POUR LINK"
boolean visible = false
integer x = 3214
integer y = 540
integer width = 1481
integer height = 400
integer taborder = 40
string title = "none"
string dataobject = "dw_coment_edition_sebillotte"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type gb_6 from groupbox within w_main
integer x = 128
integer y = 1444
integer width = 2336
integer height = 308
integer taborder = 120
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean italic = true
long backcolor = 12639424
string text = "Si archivage dans autre dossier"
end type

type rb_supprime_photos from radiobutton within w_main
integer x = 206
integer y = 1296
integer width = 1783
integer height = 80
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 12639424
string text = "Le dossier Photos du patient sera effacé en fin d~'archivage"
end type

type dw_historique_traitement from datawindow within w_main
boolean visible = false
integer x = 1609
integer y = 680
integer width = 686
integer height = 728
integer taborder = 100
string title = "none"
string dataobject = "dw_historique_diagnostic"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type rb_un_dossier from radiobutton within w_main
integer x = 101
integer y = 588
integer width = 677
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 12639424
string text = "Un Type de Dossier  "
end type

event clicked;dw_dossier.visible = true
end event

type rb_tous_dossier from radiobutton within w_main
integer x = 101
integer y = 480
integer width = 891
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 12639424
string text = "Tous les Types de Dossiers  "
boolean checked = true
end type

event clicked;dw_dossier.visible = false
end event

type ole_image from olecustomcontrol within w_main
event paintevent ( )
event selectevent ( long lplleft,  long lpltop,  long lplright,  long lplbottom )
event statusevent ( long lppercent )
event click ( )
event dblclick ( )
event keydown ( integer keycode,  integer shift )
event keypress ( integer keyascii )
event keyup ( integer keycode,  integer shift )
event mousedown ( integer button,  integer shift,  long ocx_x,  long ocx_y )
event mousemove ( integer button,  integer shift,  long ocx_x,  long ocx_y )
event mouseup ( integer button,  integer shift,  long ocx_x,  long ocx_y )
event scroll ( long scrolltype )
event errorevent ( integer nerrcount )
event thumbnail ( string filename,  long page )
event tag ( long tagid,  long tagtype,  long tagsize,  integer wordval,  long longval,  string strval )
event thumbtitle ( string title,  integer page )
event scanbeforepage ( long pagenumber,  double left,  double top,  double right,  double bottom )
event scanafterpage ( long pagenumber,  long pendcount,  string filename )
event scanafterdoc ( long pagecount,  long adfloaded )
event tagex ( long ltagid,  any vdata )
event warningevent ( integer nwarningcount )
boolean visible = false
integer x = 110
integer y = 1344
integer width = 841
integer height = 608
integer taborder = 110
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
string binarykey = "w_main.win"
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
end type

type st_version from statictext within w_main
integer x = 96
integer y = 1984
integer width = 960
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 12639424
string text = "version"
boolean focusrectangle = false
end type

type dw_reglements from datawindow within w_main
boolean visible = false
integer x = 2071
integer y = 1580
integer width = 686
integer height = 400
integer taborder = 120
string title = "none"
string dataobject = "dw_reglements_edition"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type dw_rendez-vous from datawindow within w_main
boolean visible = false
integer x = 2071
integer y = 1164
integer width = 686
integer height = 400
integer taborder = 60
string title = "none"
string dataobject = "dw_rdv_edition"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type dw_commentaires_administratifs from datawindow within w_main
boolean visible = false
integer x = 2071
integer y = 748
integer width = 686
integer height = 400
integer taborder = 70
string title = "none"
string dataobject = "dw_comment_admini_edition"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type dw_commentaires_cliniques from datawindow within w_main
boolean visible = false
integer x = 1275
integer y = 332
integer width = 1481
integer height = 400
integer taborder = 30
string title = "none"
string dataobject = "dw_comment_edition"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type dw_fiche_administrative from datawindow within w_main
boolean visible = false
integer x = 2441
integer y = 112
integer width = 686
integer height = 400
integer taborder = 80
string title = "none"
string dataobject = "dw_patient_fiche_edition"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type lb_fichiers from listbox within w_main
string tag = "liste des fichiers du patient"
boolean visible = false
integer x = 480
integer y = 864
integer width = 631
integer height = 1068
integer taborder = 90
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 16777215
borderstyle borderstyle = stylelowered!
end type

type dw_liste from datawindow within w_main
boolean visible = false
integer x = 119
integer y = 832
integer width = 759
integer height = 936
integer taborder = 100
string title = "Liste des dossiers archivés"
string dataobject = "dw_liste_archive"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type rb_conserve_photos from radiobutton within w_main
integer x = 206
integer y = 1200
integer width = 1285
integer height = 80
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 12639424
string text = "Le dossier Photos du patient est conservé"
boolean checked = true
end type

type gb_3 from groupbox within w_main
integer x = 128
integer y = 1112
integer width = 2336
integer height = 308
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean italic = true
long backcolor = 12639424
string text = "Si archivage dans autre dossier"
end type

type cb_lancer from commandbutton within w_main
integer x = 2295
integer y = 1944
integer width = 402
integer height = 112
integer taborder = 40
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "&Lancer"
boolean cancel = true
end type

event clicked;

string prat_min, prat_max // Fourchette de praticiens
string typ_dos_min, typ_dos_max	// Fourchette de dossiers

long cpt_patient, nb_patient				// nombre de patients à archiver
string repertoire_destination				// repertoire genéral de destination

string origine_patient, destination_patient 	// répertoires du patient
long nb_fichiers_patient, cpt_fichiers_patient
string nom_fichier

string fic1, fic2



double patient_courant, numero_dossier_courant

// Pour la création de répertoire
Security_Attributes sa
string test_archive

// Pour quel praticien

if rb_tous.checked then
	prat_min = ''
	prat_max = 'ZZZZZZ'
else
	prat_min = dw_prati.gettext()
	prat_max = prat_min
end if

if rb_un_dossier.checked then
	typ_dos_min = dw_dossier.gettext()
	typ_dos_max = typ_dos_min
else
	typ_dos_min = ''
	typ_dos_max = 'ZZZZZZ'
end if


open(w_patience)
w_patience.maj_status("Recherche des patients à Archiver")
dw_liste.retrieve(prat_min, prat_max,typ_dos_min,typ_dos_max)
close(w_patience)

nb_patient = dw_liste.rowcount()
if  nb_patient = 0 then
	Messagebox("ATTENTION !","Aucun patient pour ces critères !~n~nArchivage interrompu.")
else
	// on teste l'existence du répertoire de destination
	if rb_chemin_actuel.checked	then
		repertoire_destination = dir_photos
	else
		repertoire_destination = trim(sle_nouveau_dossier.text)
	end if
	
	var_suite = true
	
	if not FileExists(repertoire_destination) then
		if Messagebox("ATTENTION !","Le répertoire de destination indiqué ("+repertoire_destination+") n'existe pas. ~n~nVoulez-vous le créer ?",Question!,Yesno!,1) = 1 then
			// creation du répertoire
			CreateDirectoryA(repertoire_destination, sa )
			if not FileExists(repertoire_destination) then
				// soucis dans la copie
				Messagebox("ATTENTION !","Impossible de créer le répertoire de destination indiqué ("+repertoire_destination+"). ~n~nArchivage interrompu.")
				var_suite = false
			end if
		else 
			// pas de création du répertoire
			var_suite = false
		end if
	else
		// Le répertoire existe ... on essaie de voir si on peut écrire dedans !!
		test_archive = repertoire_destination+"test_archive"
		CreateDirectoryA(test_archive, sa)
		if not FileExists(test_archive) then
			// soucis dans la copie
			Messagebox("ATTENTION !","Impossible d'écrite dans le répertoire de destination indiqué ("+repertoire_destination+"). ~n~nArchivage interrompu.")
			var_suite = false
		else
			// Suppression du répertoire de test
			RemoveDirectoryA (test_archive) 
		end if
		
	end if
			
			
	if var_suite then
		// On teste si le chemin de destination est local
		var_suite = true
		if left( upper(repertoire_destination) , 3) <> "C:\" then
			if messagebox("ATTENTION !","Le répertoire de destination n'est pas indiqué localement (pas en C:\).~n~nCela risque de ralentir l'archivage.~n~nConfirmez-vous ?",Question!,Yesno!,2) = 2 then
				var_suite = false
			end if
		end if
		if var_suite then
		// On teste si on peut bien accéder au répertoire des photos
			if not FileExists(dir_photos +"pwophotos.ini") then
				Messagebox("ATTENTION !","Impossible d'accéder au répertoire des photos ("+dir_photos+").~n~nArchivage interrompu.")
			else
				if Messagebox("ATTENTION !","Vous allez archiver "+string(nb_patient)+" patients.~n~nCette opération peut être LONGUE et NE DOIT PAS ETRE INTERROMPUE.~nAucun utilisateur ne doit se connecter à Orthokis durant l'archivage.~n~nConfirmez-vous ?",Question!,Yesno!,2) = 1 then
					
					
					if rb_conserve_photos.checked then
						// on conserve les fichiers photos => no prob
						var_suite = true
					else
						// effacement des photos => confirmation
						if Messagebox("ATTENTION !","Vous avez demandé la SURPRESSION DEFINITIVE des dossiers photos des patients archivés.~n~nCette suppression est DEFINITIVE et IRREMEDIABLE. ~n~nConfirmez-vous ?",Question!,Yesno!,2) = 1 then
							var_suite = true
						else
							var_suite = false
						end if
					end if
					
					if var_suite then
						if rb_conserve_dossier_patient.checked then
							// on conserve les dossiers => no prob
							var_suite = true
						else
							// effacement des dossiers Orthokis => confirmation
							if rb_tous.checked then
								Messagebox("ATTENTION !","Vous avez demandé la SURPRESSION DEFINITIVE des dossiers d'ORTHOKIS en sélectionnant TOUS LES PRATICIENS.~n~nVous n'êtes pas autorisé à le faire.")
								var_suite = false
							else	
								if rb_conserve_photos.checked then
									Messagebox("ATTENTION !","Vous avez demandé la SURPRESSION DEFINITIVE des dossiers d'ORTHOKIS en conservant les dossier Photos.~n~nCeci n'est pas possible !")
									var_suite = false
								else
									Messagebox("ATTENTION !","Vous avez demandé la SURPRESSION DEFINITIVE des dossiers d'ORTHOKIS des patients archivés.~n~nPour confirmer, vous allez devoir indiquer votre Mot de Passe d'Annulation de règlements !")
									ok_mdp = false
	
								  SELECT "prati"."pasreg"   INTO :pasreg  FROM "prati"   WHERE "prati"."code" = :prat_min ;
							
									open(w_mot_passe_reglements)
								
									if not ok_mdp then
										var_suite = false
									end if
								end if
							end if
						end if
					end if
					
					if not var_suite then
						Messagebox("ATTENTION !","Archivage annulé !")
	
					else
						// Var_suite est good ... on va pouvoir y aller 
					
			
						// Archivage effectif 
						open(w_patience)
						
						// Liste des patients => PDF
						w_patience.maj_status("Exportation de la liste des patients")
						//dw_liste.retrieve(prat_min, prat_max)
						export_pdf(dw_liste,repertoire_destination+"Liste des patients archivés.pdf")
						
						// Pour tous les patients 
						
						var_suite = true
						cpt_patient = 1 
						do while cpt_patient <= nb_patient
							
							GarbageCollect ( )
							
							w_patience.maj_status("Exportation des patients "+string(cpt_patient)+"/"+string(nb_patient))
							
							patient_courant = dw_liste.getitemnumber(cpt_patient,"code")
							numero_dossier_courant = dw_liste.getitemnumber(cpt_patient,"numero_dossier")
							
							var_suite = true
	
							if rb_autre_dossier.checked then
								// Faut d'abord recopier tout le contenu du dossier patient dans le nouveu rep
								origine_patient = dir_photos + string(patient_courant) + "\"
								
								// Constitution du dossier de destination sous la forme "NOM PRENOM (NUMERO DOSSIER)"
								
								destination_patient = repertoire_destination + trim(dw_liste.getitemstring(cpt_patient,"nom"))+" "
								if not isnull(dw_liste.getitemstring(cpt_patient,"prenom")) then
									destination_patient = destination_patient + trim(dw_liste.getitemstring(cpt_patient,"prenom"))+" "
								end if
								destination_patient = destination_patient + 	" - " + trim(string(numero_dossier_courant))+"\"
						
						
								// Création du dossier destination
								CreateDirectoryA(destination_patient, sa)
								if not FileExists(destination_patient) then
									Messagebox("ATTENTION","Impossible de créer le dossier : "+destination_patient+".~n~nArchivage interrompu.")
									var_suite = false
								else
									// Recopie du contenu du fichier photos
									
									lb_fichiers.dirlist(origine_patient,0)
									nb_fichiers_patient = lb_fichiers.TotalItems()
									for cpt_fichiers_patient = 1 to nb_fichiers_patient
										nom_fichier = lb_fichiers.Text(cpt_fichiers_patient)
										CopyFileA(origine_patient +  nom_fichier, destination_patient + nom_fichier, long(false))
									next
								end if
							end if
							
							
							if var_suite then
								// Exportation des données de la base 
								
								// Fiche administrative
								dw_fiche_administrative.retrieve(patient_courant)
								export_pdf(dw_fiche_administrative,destination_patient+"Fiche Administrative.pdf")
	
								// Commentaire clinique ... 
								dw_commentaires_cliniques.retrieve(patient_courant)
								export_pdf(dw_commentaires_cliniques,destination_patient+"Commentaires Cliniques.pdf")
		
								// Commentaire ADMINISTRATIF ... 
								dw_commentaires_administratifs.retrieve(patient_courant)
								export_pdf(dw_commentaires_administratifs,destination_patient+"Commentaires Administratifs.pdf")
							
								// Rendez-vous
								dw_rendez-vous.retrieve(patient_courant)
								export_pdf(dw_rendez-vous,destination_patient+"Rendez-vous.pdf")
								
								// Reglements
								dw_reglements.retrieve(patient_courant,date('1900-01-01'))
								export_pdf(dw_reglements,destination_patient+"Soins & Règlements.pdf")
								
								// Historique Diagnostic
								dw_historique_traitement.retrieve(patient_courant)
								export_pdf(dw_historique_traitement,destination_patient+"Historique Traitement.pdf")
								
								
								// Pages cliniques
								
								// Pour compatibilité avec pages cliniques 
								var_code = patient_courant
								
							
							
								choose case serial
										
									// Pages d'origine avec : 
									// - gestion d'un timer
									// - gestion d'un event show
									
									// SI LES PAGES D	'ORIGINE SONT HERITE DE W_diagnos_maj_ ... à rien à faire, que les copier

									case '87153'
										// Kuntzel
							
										w_diagnos_maj_kuntzel1 w1_87153
										w_diagnos_maj_kuntzel2 w2_87153
										w_diagnos_maj_kuntzel3 w3_87153
			
										copie_ecran(w1_87153, patient_courant, destination_patient+"Page Clinique N°1.jpg")
										copie_ecran(w2_87153, patient_courant, destination_patient+"Page Clinique N°2.jpg")
										copie_ecran(w3_87153, patient_courant, destination_patient+"Page Clinique N°3.jpg")

									case '87309'
										// Sébillotte

										w_diagnos_maj_sebillotte1 w1_87309
										w_diagnos_maj_sebillotte2 w2_87309
										w_diagnos_maj_sebillotte3 w3_87309
			
										copie_ecran(w1_87309, patient_courant, destination_patient+"Page Clinique N°1.jpg")
										copie_ecran(w2_87309, patient_courant, destination_patient+"Page Clinique N°2.jpg")
										copie_ecran(w3_87309, patient_courant, destination_patient+"Page Clinique N°3.jpg")
									
									case else
							
										// Page d'origine avec : 
										// - clinique_affichee = true dans l''event SHOW 
										w_diagnos_maj_standard1 w1_std
										w_diagnos_maj_standard2 w2_std
										w_diagnos_maj_standard3 w3_std
			
										copie_ecran(w1_std, patient_courant, destination_patient+"Page Clinique N°1.jpg")
										copie_ecran(w2_std, patient_courant, destination_patient+"Page Clinique N°2.jpg")
										copie_ecran(w3_std, patient_courant, destination_patient+"Page Clinique N°3.jpg")
										
								end choose
	
							end if
							cpt_patient = cpt_patient + 1
							
						loop
						
						// Effacement des dossiers photos ....
						if rb_supprime_photos.checked then
							cpt_patient = 1 
							do while cpt_patient <= nb_patient
								w_patience.maj_status("Effacement des dossiers photos "+string(cpt_patient)+"/"+string(nb_patient))
								patient_courant = dw_liste.getitemnumber(cpt_patient,"code")
					
								// Dossier photo
								origine_patient = dir_photos + string(patient_courant) + "\"
								gfx_suppr_rep(lb_fichiers, origine_patient)

								cpt_patient = cpt_patient + 1
							loop
												
						end if


						if rb_supprime_dossier_patient.checked then
							if Messagebox("ULTIME CONFIRMATION !","Vous avez demandé la SURPRESSION DEFINITIVE des dossiers d'ORTHOKIS des patients archivés.~n~nCette suppression est DEFINITIVE et IRREMEDIABLE.~n~nConfirmez-vous ?",Question!,YesNo!,2) = 1 then

							// Effacement des dossiers orthokis ....
								cpt_patient = 1 
								do while cpt_patient <= nb_patient
									w_patience.maj_status("Effacement des dossiers Orthokis "+string(cpt_patient)+"/"+string(nb_patient))
									patient_courant = dw_liste.getitemnumber(cpt_patient,"code")
						
									// Dossier du patient à supprimer
									
									// tables secondaires
									suppression_table ("semaine_patient","code_patient", patient_courant )
									suppression_table ("historique_traitement","code", patient_courant )
									suppression_table ("histo_dossier","code", patient_courant )
									suppression_table ("historique_editions","code", patient_courant )
									suppression_table ("fiche_tracabilite","code_patient", patient_courant )
									suppression_table ("images_infos","code", patient_courant )
	
									
									// tables principales
									suppression_table ("coment","code", patient_courant )
									suppression_table ("coment_admini","code", patient_courant )
									suppression_table ("ligne_soins_prevus","code", patient_courant )
									suppression_table ("soins_prevus","code", patient_courant )
									suppression_table ("paye","code", patient_courant )
									suppression_table ("ligne_soins","code", patient_courant )
									suppression_table ("soins","code", patient_courant )
									suppression_table ("diagnos","code", patient_courant )
									suppression_table ("rdv","code", patient_courant )
	
									// Table patient
									suppression_table ("patient","code", patient_courant )
	
	
				
	
									cpt_patient = cpt_patient + 1
								loop
			
								w_patience.maj_status("Validation de la base de données")
								commit ;
							end if
						end if
						close(w_patience)
						
						
						Messagebox("FIN DE L'ARCHIVAGE DES DOSSIERS",string(cpt_patient -1)+" dossiers ont été archivés.")
						
					end if 
					
				end if
			end if
		end if
	end if
end if




end event

type sle_nouveau_dossier from singlelineedit within w_main
integer x = 631
integer y = 972
integer width = 2473
integer height = 84
integer taborder = 50
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 16777215
borderstyle borderstyle = stylelowered!
end type

type rb_autre_dossier from radiobutton within w_main
integer x = 114
integer y = 980
integer width = 462
integer height = 80
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 12639424
string text = "Autre dossier"
boolean checked = true
end type

type rb_chemin_actuel from radiobutton within w_main
integer x = 110
integer y = 856
integer width = 873
integer height = 80
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 12639424
boolean enabled = false
string text = "Chemin actuel des photos : "
end type

type dw_prati from datawindow within w_main
string tag = "no resizeall"
integer x = 809
integer y = 212
integer width = 869
integer height = 80
integer taborder = 10
string dataobject = "dw_cherche_prati"
boolean border = false
end type

type rb_un from radiobutton within w_main
integer x = 110
integer y = 212
integer width = 485
integer height = 80
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 12639424
string text = "Un praticien"
boolean checked = true
end type

on clicked;rb_tous.checked = false
dw_prati.visible = true
end on

type rb_tous from radiobutton within w_main
integer x = 110
integer y = 116
integer width = 695
integer height = 80
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 12639424
string text = "Tous les praticiens"
end type

on clicked;rb_un.checked = false
dw_prati.visible = false
end on

type cb_fermer from commandbutton within w_main
integer x = 2779
integer y = 1940
integer width = 402
integer height = 112
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "&Fermer"
boolean cancel = true
boolean default = true
end type

event clicked;close(parent)
end event

type gb_1 from groupbox within w_main
integer x = 50
integer y = 36
integer width = 1746
integer height = 304
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean italic = true
long backcolor = 12639424
string text = "Choix du praticien"
end type

type sle_dir_photos from singlelineedit within w_main
integer x = 992
integer y = 864
integer width = 2290
integer height = 80
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 12639424
boolean border = false
end type

type gb_2 from groupbox within w_main
integer x = 55
integer y = 756
integer width = 3273
integer height = 1140
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean italic = true
long backcolor = 12639424
string text = "Destination"
end type

type dw_dossier from datawindow within w_main
string tag = "position"
boolean visible = false
integer x = 800
integer y = 588
integer width = 937
integer height = 80
integer taborder = 130
boolean bringtotop = true
string dataobject = "dw_cherche_dossier"
boolean border = false
end type

type gb_4 from gb_1 within w_main
integer y = 392
integer width = 2121
integer height = 328
long textcolor = 33554432
string text = "Choix des Types de Dossier"
end type

type gb_5 from groupbox within w_main
integer x = 128
integer y = 1112
integer width = 2336
integer height = 308
integer taborder = 60
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean italic = true
long backcolor = 12639424
string text = "Si archivage dans autre dossier"
end type

type rb_conserve_dossier_patient from radiobutton within w_main
integer x = 206
integer y = 1532
integer width = 2185
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 12639424
string text = "Le dossier du patient est conservé dans Orthokis (soins, rdv, règlts, etc...)"
boolean checked = true
end type

type rb_supprime_dossier_patient from radiobutton within w_main
integer x = 206
integer y = 1620
integer width = 1783
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 12639424
string text = "Le dossier du patient sera effacé en fin d~'archivage"
end type


Start of PowerBuilder Binary Data Section : Do NOT Edit
02w_main.bin 
2300000c00e011cfd0e11ab1a1000000000000000000000000000000000003003e0009fffe000000060000000000000000000000010000000100000000000010000000000200000001fffffffe0000000000000000fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffd00000004fffffffefffffffefffffffeffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff006f00520074006f004500200074006e00790072000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000050016ffffffffffffffff0000000300000000000000000000000000000000000000000000000000000000bc81a7e001ce39e900000003000002000000000000500003004c004200430049004e0045004500530045004b000000590000000000000000000000000000000000000000000000000000000000000000000000000002001cffffffffffffffffffffffff00000000000000000000000000000000000000000000000000000000000000000000000000000000000000580000000000500003004f0042005800430054005300450052004d0041000000000000000000000000000000000000000000000000000000000000000000000000000000000002001affffffffffffffffffffffff000000000000000000000000000000000000000000000000000000000000000000000000000000020000013100000000004200500043004f00530058004f00540041005200450047000000000000000000000000000000000000000000000000000000000000000000000000000000000101001a000000020000000100000004b7679ea411d365705000d4803d17ad0400000000bc81a7e001ce39e9bc81a7e001ce39e900000000000000000000000000000001fffffffe00000003000000040000000500000006fffffffefffffffeffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
27ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff006d0049006700610047006500610065002000720043004f002d005800310038004300200070006f00720079006700690074006800280020002900630031002000390039002000390063004100750063006f005300740066000000000000000000000000000000000000000000000000000000000000000000000000000000000000fffe00020106b7679ea411d365705000d4803d17ad0400000001fb8f0821101b01640008ed8413c72e2b00000030000001010000000700000100000000400000010100000048000001020000005000000103000000580000010400000060000001050000006c000000000000008c000000030001000000000003000013040000000300000fb600000003000000a100000008000000010000000000000041000000180be3520411ce8f91aa00e39d51b84b000000746c000000000000000700000000000000010001030000000c0074735f00706b636f73706f720001050000000800636970006572757400010400000009006f6472006c6569660101006400090000655f00006e65747802007874090000015f000000657478650079746e00000100000000097265765f6e6f697300000000000000000000000000000000000100000000130400000fb6000000a100ffffff00000000520400008f910be3e39d11ce4b00aa00746c51b80000000000000000000000000000000000000000006f00430074006e006e00650073007400000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001020012ffffffffffffffffffffffff0000000000000000000000000000000000000000000000000000000000000000000000000000000700000032000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffff0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffff0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffff00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
12w_main.bin 
End of PowerBuilder Binary Data Section : No Source Expected After This Point
