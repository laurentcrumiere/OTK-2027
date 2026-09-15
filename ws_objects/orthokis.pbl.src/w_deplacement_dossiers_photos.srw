$PBExportHeader$w_deplacement_dossiers_photos.srw
forward
global type w_deplacement_dossiers_photos from w_fenetre_arakis
end type
type cb_fermer from uo_picturebutton_390x120_fermer within w_deplacement_dossiers_photos
end type
type cb_lancer from uo_picturebutton_390x120 within w_deplacement_dossiers_photos
end type
type uo_size from resize_fenetre within w_deplacement_dossiers_photos
end type
type rb_un from radiobutton within w_deplacement_dossiers_photos
end type
type rb_tous from radiobutton within w_deplacement_dossiers_photos
end type
type gb_1 from groupbox within w_deplacement_dossiers_photos
end type
type dw_prati from datawindow within w_deplacement_dossiers_photos
end type
type dw_fiche from datawindow within w_deplacement_dossiers_photos
end type
type st_min from statictext within w_deplacement_dossiers_photos
end type
type em_min from editmask within w_deplacement_dossiers_photos
end type
type st_max from statictext within w_deplacement_dossiers_photos
end type
type em_max from editmask within w_deplacement_dossiers_photos
end type
type lb_files from listbox within w_deplacement_dossiers_photos
end type
type rb_1 from radiobutton within w_deplacement_dossiers_photos
end type
type rb_2 from radiobutton within w_deplacement_dossiers_photos
end type
type gb_2 from groupbox within w_deplacement_dossiers_photos
end type
type gb_3 from groupbox within w_deplacement_dossiers_photos
end type
end forward

global type w_deplacement_dossiers_photos from w_fenetre_arakis
integer x = 27
integer y = 200
integer width = 3406
integer height = 1720
string title = "Déplacement Dossiers Photos de Patients Archivés"
windowtype windowtype = child!
long backcolor = 15780518
boolean center = true
cb_fermer cb_fermer
cb_lancer cb_lancer
uo_size uo_size
rb_un rb_un
rb_tous rb_tous
gb_1 gb_1
dw_prati dw_prati
dw_fiche dw_fiche
st_min st_min
em_min em_min
st_max st_max
em_max em_max
lb_files lb_files
rb_1 rb_1
rb_2 rb_2
gb_2 gb_2
gb_3 gb_3
end type
global w_deplacement_dossiers_photos w_deplacement_dossiers_photos

type variables
boolean prepa_faite
double increment	
double nb_dossier

double min, max,max_row

integer v_delai_archivage_rdv, v_delai_archivage_soins



string var_chemin_dossier_photos_archives
end variables

forward prototypes
public subroutine prepa ()
public subroutine verif_repertoire ()
end prototypes

public subroutine prepa ();
end subroutine

public subroutine verif_repertoire ();string repertoire_central 

dw_fiche.accepttext()
repertoire_central = dw_fiche.getitemString(1,"chemin_dossier_photos_archives")

// on teste d'abord si OK pour le répertoire
boolean v_suite = false

if left(repertoire_central, 2) <> "\\" then
	Messagebox("ATTENTION","Le répertoire des Dossiers Photos des Patients Archivés doit être sous la forme '\\Serveur\nom1\'.~n~nVeuillez corriger avant d'enregistrer.")
else
	if Not DirectoryExists(repertoire_central) then
		if MessageBox("ATTENTION","Le répertoire '"+repertoire_central+"' n'existe pas.~n~nVoulez-vous le créer ?",Question!,YesNo!,2) = 1 then
			if  CreateDirectory(repertoire_central) = -1 then
				MessageBox("ATTENTION","Le répertoire '"+repertoire_central+"' n'a pas pu être créé.~n~nVous devez en spécifier un autre.") 
			else
				v_suite = true
			end if
		end if
	else
		v_suite = true
	end if
end if


if v_suite then
	if dw_fiche.update() = 1 then
		commit ;
		cb_lancer.enabled(true)
	else
		Rollback ;
		cb_lancer.enabled(false)
	end if
else
	cb_lancer.enabled(false)
end if


end subroutine

on w_deplacement_dossiers_photos.create
int iCurrent
call super::create
this.cb_fermer=create cb_fermer
this.cb_lancer=create cb_lancer
this.uo_size=create uo_size
this.rb_un=create rb_un
this.rb_tous=create rb_tous
this.gb_1=create gb_1
this.dw_prati=create dw_prati
this.dw_fiche=create dw_fiche
this.st_min=create st_min
this.em_min=create em_min
this.st_max=create st_max
this.em_max=create em_max
this.lb_files=create lb_files
this.rb_1=create rb_1
this.rb_2=create rb_2
this.gb_2=create gb_2
this.gb_3=create gb_3
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_fermer
this.Control[iCurrent+2]=this.cb_lancer
this.Control[iCurrent+3]=this.uo_size
this.Control[iCurrent+4]=this.rb_un
this.Control[iCurrent+5]=this.rb_tous
this.Control[iCurrent+6]=this.gb_1
this.Control[iCurrent+7]=this.dw_prati
this.Control[iCurrent+8]=this.dw_fiche
this.Control[iCurrent+9]=this.st_min
this.Control[iCurrent+10]=this.em_min
this.Control[iCurrent+11]=this.st_max
this.Control[iCurrent+12]=this.em_max
this.Control[iCurrent+13]=this.lb_files
this.Control[iCurrent+14]=this.rb_1
this.Control[iCurrent+15]=this.rb_2
this.Control[iCurrent+16]=this.gb_2
this.Control[iCurrent+17]=this.gb_3
end on

on w_deplacement_dossiers_photos.destroy
call super::destroy
destroy(this.cb_fermer)
destroy(this.cb_lancer)
destroy(this.uo_size)
destroy(this.rb_un)
destroy(this.rb_tous)
destroy(this.gb_1)
destroy(this.dw_prati)
destroy(this.dw_fiche)
destroy(this.st_min)
destroy(this.em_min)
destroy(this.st_max)
destroy(this.em_max)
destroy(this.lb_files)
destroy(this.rb_1)
destroy(this.rb_2)
destroy(this.gb_2)
destroy(this.gb_3)
end on

event open;call super::open;
string v_chemin_maj_centralisee

dw_fiche.settransobject(sqlca)
dw_fiche.retrieve()

dw_prati.settransobject(sqlca)
dw_prati.retrieve()

// chemin_dossier_photos_archives
select top 1 chemin_dossier_photos_archives, trim(chemin_maj_orthokis_centralisee) into :var_chemin_dossier_photos_archives, :v_chemin_maj_centralisee
from param ;

if var_chemin_dossier_photos_archives = 'INITIALISATION' then 
	// Première fois ... => on propose un dossier
	long lp
	lp =  LastPos(v_chemin_maj_centralisee , "\" ,  len(v_chemin_maj_centralisee) - 1)
	var_chemin_dossier_photos_archives = left(v_chemin_maj_centralisee, lp - 1 ) + "\photos_archives\" 
	dw_fiche.setitem(1, "chemin_dossier_photos_archives", var_chemin_dossier_photos_archives)
end if


uo_size.taille(this)
gb_1.backcolor = this.backcolor

verif_repertoire()





end event

event resize;uo_size.retaille(this)
end event

type p_fond from w_fenetre_arakis`p_fond within w_deplacement_dossiers_photos
integer x = 1595
integer y = 924
end type

type cb_fermer from uo_picturebutton_390x120_fermer within w_deplacement_dossiers_photos
integer x = 1559
integer y = 1412
integer width = 480
integer height = 152
integer taborder = 30
boolean default = true
end type

event clicked;fermer_fenetre(parent)



end event

type cb_lancer from uo_picturebutton_390x120 within w_deplacement_dossiers_photos
integer x = 955
integer y = 1412
integer width = 480
integer height = 152
integer taborder = 40
fontcharset fontcharset = ansi!
string text = "Lancer"
string iconname = "ACTIONS_executer.png"
end type

event clicked;call super::clicked;string pra_min,pra_max
double code_min,code_max
string v_titre

if rb_tous.checked then
	pra_min="      "
	pra_max="ZZZZZZ"
else
	pra_min=dw_prati.getitemstring(dw_prati.getrow(),"code")
	pra_max=dw_prati.getitemstring(dw_prati.getrow(),"code")
end if
	
code_min = double(em_min.text)
code_max = double(em_max.text)
	
if code_min < 100000000 then 
	Messagebox("ATTENTION","Vous devez indiquer une fourchette portant sur numéros de dossiers Archivés (N° de dossiers > 100000000) !")
else
	if code_max < code_min then 
		messagebox("ATTENTION !", "Vous devez indiquer une fourchette de numéros de dossiers cohérente : minimum / maximum !")
	else
		
		DECLARE cur CURSOR FOR select code from patient where numero_dossier between :code_min and :code_max and code_praticien between :pra_min and :pra_max ;
		
		double v_code
		long cpt , tot, cpt_OK, cpt_KO
		long nbr_files, cpt_files
		boolean v_suite 
		
		cpt_OK = 0
		cpt_KO = 0
		
		string ancien_dossier, nouveau_dossier
		string ancien_fichier, nouveau_fichier
		
		select isnull(count(*), 0) into :tot from patient where numero_dossier between :code_min and :code_max and code_praticien between :pra_min and :pra_max ;
		
		if tot = 0 then
			MessageBox("ATTENTION !","Vous n'avez aucun dossier archivé !")
		else
			string libelle_message
			boolean ecrasement_copie
			if rb_1.checked then 
				libelle_message =  "Vous allez DEPLACER les dossiers Photos des patients archivés du dossier '" + dir_photos + "' vers le dossier '" + var_chemin_dossier_photos_archives + "'.~n~nNombre de dossiers concernés : " + string(tot)+ "~n~nCette action est IRREMEDIABLE et ne doit pas être interrompue.~n~nLe Serveur et ce Poste doivent être actifs durant toute l'opération.~n~nCette opération peut être TRES LONGUE.~n~nConfirmez-vous ?"
				ecrasement_copie = true
			else
				libelle_message =  "Vous allez COPIER les dossiers Photos Archivés des patients archivés du dossier '" + var_chemin_dossier_photos_archives  + "' vers le dossier '" + dir_photos + "'.~n~nNombre de dossiers concernés : " + string(tot)+ "~n~nCette action est IRREMEDIABLE et ne doit pas être interrompue.~n~nLe Serveur et ce Poste doivent être actifs durant toute l'opération.~n~nCette opération peut être TRES LONGUE.~n~nConfirmez-vous ?"
				ecrasement_copie = false
			end if
			if messageBox("ATTENTION",libelle_message , Question!, YesNo!, 2) = 1 then
				
				open(w_patience)
				
				open cur ;
				fetch cur into :v_code ; 
				cpt = 1 
				do while sqlca.sqlcode = 0 
					maj_patience(cpt, tot / 10)
				
					if rb_1.checked then 
						ancien_dossier = dir_photos + string(v_code) + "\"
						nouveau_dossier = var_chemin_dossier_photos_archives + string(v_code) + "\"
					else
						ancien_dossier = var_chemin_dossier_photos_archives + string(v_code) + "\"
						nouveau_dossier = dir_photos + string(v_code) + "\"
					end if
					if fileExists(	ancien_dossier) then
						if not fileExists(	nouveau_dossier) then
							// On le crée
							if CreateDirectory(nouveau_dossier)  = 1 then 
								v_suite = true
							else
								v_suite = false
							end if
						else
							v_suite = true
						end if
						if v_suite then 
							// Liste des fichiers à copier
							lb_files.reset()
							lb_files.DirList(ancien_dossier + win_AllFiles, 32)
							nbr_files = lb_files.TotalItems() 
							for cpt_files = 1 to nbr_files
								ancien_fichier = ancien_dossier + lb_files.text(cpt_files)
								nouveau_fichier = nouveau_dossier + lb_files.text(cpt_files)
								if FileCopy(ancien_fichier, nouveau_fichier, ecrasement_copie) = 1 then
									if rb_1.checked then 
										// on ne supprime que si on archive
										FileDelete(ancien_fichier)
									end if
									cpt_OK = cpt_OK + 1
								else
									cpt_KO = cpt_KO + 1
								end if
							next
						end if
					end if
			
					cpt = cpt + 1
					fetch cur into :v_code ; 
				loop
				close cur ;
				
				// Recopie de PwoPhontos.ini
				FileCopy ( dir_photos + "pwoPhotos.ini" , var_chemin_dossier_photos_archives + "pwoPhotos.ini"  ) 
				close(w_patience)
				Messagebox("FIN DE DE L'OPERATION !","Nombre de fichiers traités avec succès : "+ string(cpt_OK)+"~n~nFichiers non traités : " + string(cpt_KO))
				
			end if
		end if
	end if
end if

end event

type uo_size from resize_fenetre within w_deplacement_dossiers_photos
boolean visible = false
integer x = 2235
integer y = 580
integer taborder = 30
end type

on uo_size.destroy
call resize_fenetre::destroy
end on

type rb_un from radiobutton within w_deplacement_dossiers_photos
integer x = 608
integer y = 528
integer width = 622
integer height = 80
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 15780518
string text = "Un praticien"
end type

event clicked;rb_tous.checked = false
dw_prati.visible = true
end event

type rb_tous from radiobutton within w_deplacement_dossiers_photos
integer x = 608
integer y = 432
integer width = 695
integer height = 80
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 15780518
string text = "Tous les praticiens"
boolean checked = true
end type

event clicked;rb_un.checked = false
dw_prati.visible = false
end event

type gb_1 from groupbox within w_deplacement_dossiers_photos
integer x = 443
integer y = 352
integer width = 2121
integer height = 304
integer taborder = 50
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean italic = true
long textcolor = 33554432
long backcolor = 15780518
string text = "Choix du praticien"
end type

type dw_prati from datawindow within w_deplacement_dossiers_photos
string tag = "position brush"
boolean visible = false
integer x = 1376
integer y = 532
integer width = 859
integer height = 72
integer taborder = 60
boolean bringtotop = true
string dataobject = "dw_cherche_prati"
boolean border = false
end type

type dw_fiche from datawindow within w_deplacement_dossiers_photos
string tag = "brush no resize all centrer"
integer x = 96
integer y = 52
integer width = 3040
integer height = 244
integer taborder = 70
boolean bringtotop = true
string title = "none"
string dataobject = "dw_chemin_photos_achives"
boolean livescroll = true
end type

event buttonclicked;string ls_object

ls_Object = String(dwo.name)
string file_name,file_path,col_name

string repertoire_central
repertoire_central = this.getitemString(1,"chemin_dossier_photos_archives")

choose case ls_Object
	case  "b_dossier" 
		repertoire_central = get_repertoire("Sélectionnez le dossier pour le stockage des Dossiers Photos des Patients Archivés ...",repertoire_central)
		this.Setitem(1,"chemin_dossier_photos_archives", repertoire_central)
end choose


verif_repertoire()

//dw_fiche.accepttext()

//// on teste d'abord si OK pour le répertoire
//boolean v_suite = false
//repertoire_central = this.getitemString(1,"chemin_dossier_photos_archives")
//
//if left(repertoire_central, 2) <> "\\" then
//	Messagebox("ATTENTION","Le répertoire des Dossiers Photos des Patients Archivés doit être sous la forme '\\Serveur\nom1\'.~n~nVeuillez corriger avant d'enregistrer.")
//else
//	if Not DirectoryExists(repertoire_central) then
//		if MessageBox("ATTENTION","Le répertoire '"+repertoire_central+"' n'existe pas.~n~nVoulez-vous le créer ?",Question!,YesNo!,2) = 1 then
//			if  CreateDirectory(repertoire_central) = -1 then
//				MessageBox("ATTENTION","Le répertoire '"+repertoire_central+"' n'a pas pu être créé.~n~nVous devez en spécifier un autre.") 
//			else
//				v_suite = true
//			end if
//		end if
//	else
//		v_suite = true
//	end if
//end if
//
//
//if v_suite then
//	if dw_fiche.update() = 1 then
//		commit ;
//	else
//		Rollback ;
//	end if
//end if
//
//
end event

type st_min from statictext within w_deplacement_dossiers_photos
integer x = 517
integer y = 800
integer width = 389
integer height = 72
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
string facename = "Arial"
long backcolor = 553648127
string text = "Du Dossier N°"
alignment alignment = right!
end type

type em_min from editmask within w_deplacement_dossiers_photos
string tag = "a masquer"
integer x = 955
integer y = 788
integer width = 498
integer height = 96
integer taborder = 20
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
string text = "100000000"
alignment alignment = right!
borderstyle borderstyle = stylelowered!
string mask = "########0"
boolean spin = true
string displaydata = ""
double increment = 1
string minmax = "100000000~~999999999"
end type

type st_max from statictext within w_deplacement_dossiers_photos
integer x = 1504
integer y = 800
integer width = 402
integer height = 72
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
string facename = "Arial"
long backcolor = 553648127
string text = "Au Dossier N°"
alignment alignment = right!
end type

type em_max from editmask within w_deplacement_dossiers_photos
string tag = "a masquer"
integer x = 1943
integer y = 788
integer width = 498
integer height = 96
integer taborder = 30
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
string text = "999999999"
alignment alignment = right!
borderstyle borderstyle = stylelowered!
string mask = "########0"
boolean spin = true
string displaydata = ""
double increment = 1
string minmax = "100000000~~999999999"
end type

type lb_files from listbox within w_deplacement_dossiers_photos
boolean visible = false
integer x = 2789
integer y = 1356
integer width = 411
integer height = 120
integer taborder = 80
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

type rb_1 from radiobutton within w_deplacement_dossiers_photos
integer x = 608
integer y = 1116
integer width = 1147
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 15780518
string text = "Photos -> Archives (Déplacement)"
boolean checked = true
end type

type rb_2 from radiobutton within w_deplacement_dossiers_photos
integer x = 608
integer y = 1216
integer width = 1344
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 15780518
string text = "Archives -> Photos (Copie sans écrasement)"
end type

type gb_2 from groupbox within w_deplacement_dossiers_photos
integer x = 443
integer y = 676
integer width = 2121
integer height = 304
integer taborder = 60
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean italic = true
long textcolor = 33554432
long backcolor = 15780518
string text = "Fourchette de N° de dossiers"
end type

type gb_3 from groupbox within w_deplacement_dossiers_photos
integer x = 443
integer y = 1000
integer width = 2121
integer height = 356
integer taborder = 70
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean italic = true
long textcolor = 33554432
long backcolor = 15780518
string text = "Sens de déplacement"
end type

