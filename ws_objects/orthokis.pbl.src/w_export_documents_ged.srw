$PBExportHeader$w_export_documents_ged.srw
forward
global type w_export_documents_ged from w_fenetre_arakis
end type
type pb_1 from uo_picturebutton_390x120_fermer within w_export_documents_ged
end type
type pb_exporter from uo_picturebutton_390x120 within w_export_documents_ged
end type
type rb_tous from radiobutton within w_export_documents_ged
end type
type rb_aucun from radiobutton within w_export_documents_ged
end type
type sle_emplacement from singlelineedit within w_export_documents_ged
end type
type st_2 from statictext within w_export_documents_ged
end type
type pb_15 from picturebutton within w_export_documents_ged
end type
type st_3 from statictext within w_export_documents_ged
end type
type sle_desti from singlelineedit within w_export_documents_ged
end type
type dw_liste from datawindow within w_export_documents_ged
end type
type rb_deja from radiobutton within w_export_documents_ged
end type
type gb_selection from groupbox within w_export_documents_ged
end type
type gb_1 from groupbox within w_export_documents_ged
end type
end forward

global type w_export_documents_ged from w_fenetre_arakis
integer width = 5102
integer height = 2244
string title = "Exportation de Documents"
boolean controlmenu = false
boolean minbox = false
boolean maxbox = false
boolean resizable = false
windowtype windowtype = response!
boolean center = true
pb_1 pb_1
pb_exporter pb_exporter
rb_tous rb_tous
rb_aucun rb_aucun
sle_emplacement sle_emplacement
st_2 st_2
pb_15 pb_15
st_3 st_3
sle_desti sle_desti
dw_liste dw_liste
rb_deja rb_deja
gb_selection gb_selection
gb_1 gb_1
end type
global w_export_documents_ged w_export_documents_ged

type variables

// Patient courant
double var_code_local
string v_nom, v_prenom
double v_numero_dossier


string type_histo
end variables

on w_export_documents_ged.create
int iCurrent
call super::create
this.pb_1=create pb_1
this.pb_exporter=create pb_exporter
this.rb_tous=create rb_tous
this.rb_aucun=create rb_aucun
this.sle_emplacement=create sle_emplacement
this.st_2=create st_2
this.pb_15=create pb_15
this.st_3=create st_3
this.sle_desti=create sle_desti
this.dw_liste=create dw_liste
this.rb_deja=create rb_deja
this.gb_selection=create gb_selection
this.gb_1=create gb_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.pb_1
this.Control[iCurrent+2]=this.pb_exporter
this.Control[iCurrent+3]=this.rb_tous
this.Control[iCurrent+4]=this.rb_aucun
this.Control[iCurrent+5]=this.sle_emplacement
this.Control[iCurrent+6]=this.st_2
this.Control[iCurrent+7]=this.pb_15
this.Control[iCurrent+8]=this.st_3
this.Control[iCurrent+9]=this.sle_desti
this.Control[iCurrent+10]=this.dw_liste
this.Control[iCurrent+11]=this.rb_deja
this.Control[iCurrent+12]=this.gb_selection
this.Control[iCurrent+13]=this.gb_1
end on

on w_export_documents_ged.destroy
call super::destroy
destroy(this.pb_1)
destroy(this.pb_exporter)
destroy(this.rb_tous)
destroy(this.rb_aucun)
destroy(this.sle_emplacement)
destroy(this.st_2)
destroy(this.pb_15)
destroy(this.st_3)
destroy(this.sle_desti)
destroy(this.dw_liste)
destroy(this.rb_deja)
destroy(this.gb_selection)
destroy(this.gb_1)
end on

event open;call super::open;
long lig, tot

// Récupération du patient dans w_click_patient (w_patient_maj)
var_code_local = w_click_patient_ged.var_code_local

if w_click_patient_ged.type_gestion = "E" then
	type_histo = 'E'
	dw_liste.title = "Liste des Editions"
else
	if w_click_patient_ged.type_gestion = "D" then
		type_histo = 'D'
		dw_liste.title = "Liste des Documents"
	else 
		// En principe pas possible mais ...
		Messagebox("ATTENTION !", "L'exportation n'est pas possible dans ce mode !")
	end if
end if
		
if type_histo = 'E' or type_histo = 'D' then
	
	dw_liste.settransobject(sqlca)
	
	dw_liste.retrieve(var_code_local,type_histo)

	// Titre de la fenêtre
	select isnull(nom,''), isnull(prenom,''), numero_dossier into :v_nom, :v_prenom, :v_numero_dossier
	from patient 
	where code = :var_code_local ;
	
	this.title = "Exportation de Documents pour "+v_nom+" "+v_prenom+" ("+string(v_numero_dossier)+")"
	
	sle_emplacement.text = profilestring(dir_ini+inifile_orthokis,"admini","dossier_export_documents","C:\")
	sle_desti.text =  v_nom + " " + v_prenom +" (" + string(v_numero_dossier) + ")"
	
	colore_tous_objets_window(this, couleur_fond_fenetre)

	// Mise à jour des sélections eventuelles en amont ... on le fait avant le filtres pour plus de simplicité car les listes sont identiques
	tot = dw_liste.rowcount()
	
	if type_histo = "E" then
		// Liste des courriers 
		for lig = 1 to tot
			if w_click_patient_ged.tab_1.tabpage_courriers.dw_courriers.GetItemString(lig, "selection") = "O" then
				dw_liste.SetItem(lig, "selection","O")
			end if
		next
	else
		// Liste des documents
		for lig = 1 to tot
			if w_click_patient_ged.tab_1.tabpage_documents.dw_documents.GetItemString(lig, "selection") = "O" then
				dw_liste.SetItem(lig, "selection","O")
			end if
		next
	end if
	
	// application du flltre pour ne garder que les lignes qui ont un document
	dw_liste.SetFilter("historique_editions_nom_courrier <> ''")
	dw_liste.filter()
	
	if dw_liste.rowcount() = 0 then
		// pas de documents exportables => on part
		Messagebox("ATTENTION !", "Il n'y a aucun document exportable !")
		Close(this)
	end if
	
else 
	close(this)

end if
end event

type p_fond from w_fenetre_arakis`p_fond within w_export_documents_ged
integer x = 1088
integer y = 1816
end type

type pb_1 from uo_picturebutton_390x120_fermer within w_export_documents_ged
integer x = 4320
integer y = 1968
integer width = 571
integer height = 152
integer taborder = 10
boolean bringtotop = true
end type

type pb_exporter from uo_picturebutton_390x120 within w_export_documents_ged
integer x = 3707
integer y = 1968
integer width = 571
integer height = 152
integer taborder = 30
boolean bringtotop = true
fontcharset fontcharset = ansi!
string text = "&Exporter"
string iconname = "ACTIONS_Exporter.png"
end type

event clicked;call super::clicked;// Copie de tous les éléments dans le dossiers d'export !!



string repertoire_destination, repertoire_depart
string fichier_destination, fichier_depart
integer  nb_copie
boolean ok_suite = true
String v_commande

boolean ok_export = false

long tot, lig

repertoire_destination = trim(sle_emplacement.text) +  trim(sle_desti.text)
repertoire_depart = fxg_get_rep_photos() + string(var_code_local) + win_delimiter 


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

	tot = dw_liste.rowcount()
	
	nb_copie = 0
	
	// Copie des images sélectionnées
	
	for lig = 1 to tot
		// parcours de la liste
		// Si sélectionné .. on copie
		
		if mod( integer(lig * 100 / tot ) , 10) = 0 then
			// pour avancer de 10% en 10%	
			w_patience.Wf_SetValue(10)
		end if
	
		
		if dw_liste.GetItemString(lig, "selection") = "O" then
			
			// Construction du nom du fichier de destination
			
			
			fichier_destination = repertoire_destination + win_delimiter + dw_liste.GetItemString(lig, "historique_editions_nom_courrier")
			fichier_depart = repertoire_depart + dw_liste.GetItemString(lig, "historique_editions_nom_courrier")
	
			
			// Copie du document !!!
			
			if FileCopy(fichier_depart , fichier_destination, true ) = 1 then
				nb_copie = nb_copie + 1
			else
				// on regarde pourquoi pas copié 
				if Not FileExists(fichier_depart) then 
					MessageBox("ATTENTION","Impossible de copier le fichier : " + fichier_depart + "~n~nCe fichier n'existe pas (ou plus) !")
				else
					MessageBox("ATTENTION","Impossible de copier le fichier : " + fichier_depart )
				end if
			end if
				
		end if
		
	next 
	
	close(w_patience)
	
	if nb_copie = 0 then
		Messagebox("Fin de l'exportation","Aucun fichier n'a été copié")
	else
		if nb_copie = 1 then
			if Messagebox("Fin de l'exportation","1 fichier a été copié.~n~nVoulez-vous ouvri l'explorateur Windows dans le dossier de destination de l'exportation ?", Question!, Yesno!, 2) = 1 then
				v_commande = "Explorer.exe /n," + repertoire_destination
				run(v_commande)
			end if
			ok_export = true
		else
			if Messagebox("Fin de l'exportation",string(nb_copie)+" fichiers ont été copiés.~n~nVoulez-vous ouvrir l'explorateur Windows dans le dossier de destination de l'exportation ?", Question!, Yesno!, 2) = 1 then
				v_commande = "Explorer.exe /n," + repertoire_destination
				run(v_commande)
			end if
			ok_export = true
		end if
	end if
	
	
	// Mémorisation des choix du user dans Orthokis for the next time
	
	setprofilestring(dir_ini+inifile_orthokis,"admini","dossier_export_documents",sle_emplacement.text)
	
end if

if ok_export then
	close(parent)
end if

end event

type rb_tous from radiobutton within w_export_documents_ged
integer x = 2770
integer y = 1732
integer width = 302
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
string text = "Tous"
end type

event clicked;long tot, lig

tot = dw_liste.rowcount()
	
for lig = 1 to tot
	dw_liste.SetItem(lig, "selection","O")
next


end event

type rb_aucun from radiobutton within w_export_documents_ged
integer x = 2770
integer y = 1844
integer width = 402
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
string text = "Aucun"
end type

event clicked;long tot, lig

tot = dw_liste.rowcount()
	
for lig = 1 to tot
	dw_liste.SetItem(lig, "selection","N")
next


end event

type sle_emplacement from singlelineedit within w_export_documents_ged
integer x = 73
integer y = 1776
integer width = 2277
integer height = 96
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 553648127
boolean displayonly = true
borderstyle borderstyle = stylelowered!
end type

type st_2 from statictext within w_export_documents_ged
integer x = 69
integer y = 1700
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

type pb_15 from picturebutton within w_export_documents_ged
integer x = 2386
integer y = 1764
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

type st_3 from statictext within w_export_documents_ged
integer x = 69
integer y = 1900
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

type sle_desti from singlelineedit within w_export_documents_ged
integer x = 69
integer y = 1980
integer width = 2277
integer height = 96
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 553648127
boolean displayonly = true
borderstyle borderstyle = stylelowered!
end type

type dw_liste from datawindow within w_export_documents_ged
string tag = "brush"
integer y = 12
integer width = 5047
integer height = 1568
integer taborder = 30
boolean bringtotop = true
string title = "Liste des documents"
string dataobject = "dw_patient_fiche5"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type rb_deja from radiobutton within w_export_documents_ged
integer x = 2770
integer y = 1956
integer width = 521
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
boolean enabled = false
string text = "Déjà sélectionés"
boolean checked = true
end type

type gb_selection from groupbox within w_export_documents_ged
integer x = 2693
integer y = 1620
integer width = 823
integer height = 500
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean italic = true
long textcolor = 33554432
long backcolor = 15780518
string text = "Sélection des documents"
end type

type gb_1 from groupbox within w_export_documents_ged
integer y = 1624
integer width = 2661
integer height = 496
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

