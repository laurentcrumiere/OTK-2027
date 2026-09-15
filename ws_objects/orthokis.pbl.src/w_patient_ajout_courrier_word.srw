$PBExportHeader$w_patient_ajout_courrier_word.srw
forward
global type w_patient_ajout_courrier_word from w_fenetre_arakis
end type
type cb_fermer from uo_picturebutton_390x120 within w_patient_ajout_courrier_word
end type
type st_3 from statictext within w_patient_ajout_courrier_word
end type
type st_1 from statictext within w_patient_ajout_courrier_word
end type
type sle_libelle from singlelineedit within w_patient_ajout_courrier_word
end type
type em_date from editmask within w_patient_ajout_courrier_word
end type
type st_2 from statictext within w_patient_ajout_courrier_word
end type
type sle_fichier from singlelineedit within w_patient_ajout_courrier_word
end type
type dw_codes_editions from datawindow within w_patient_ajout_courrier_word
end type
type gb from gearbox within w_patient_ajout_courrier_word
end type
type pb_scanner from picturebutton within w_patient_ajout_courrier_word
end type
type pb_acquis_fichier from picturebutton within w_patient_ajout_courrier_word
end type
type pb_param_twain from picturebutton within w_patient_ajout_courrier_word
end type
type pb_scanner_multiples from picturebutton within w_patient_ajout_courrier_word
end type
type lb_fichiers from listbox within w_patient_ajout_courrier_word
end type
type pb_aide from uo_bouton_aide within w_patient_ajout_courrier_word
end type
type cbx_effacer from checkbox within w_patient_ajout_courrier_word
end type
type sle_fichier2 from singlelineedit within w_patient_ajout_courrier_word
end type
type pb_fichier2 from picturebutton within w_patient_ajout_courrier_word
end type
type gb_twain from groupbox within w_patient_ajout_courrier_word
end type
type gb_fichier from groupbox within w_patient_ajout_courrier_word
end type
type pb_fichier from picturebutton within w_patient_ajout_courrier_word
end type
type st_4 from statictext within w_patient_ajout_courrier_word
end type
type dw_categorie from datawindow within w_patient_ajout_courrier_word
end type
type st_drag1 from statictext within w_patient_ajout_courrier_word
end type
type st_drag2 from statictext within w_patient_ajout_courrier_word
end type
type dw_liste_acquisitions from datawindow within w_patient_ajout_courrier_word
end type
type st_drag3 from statictext within w_patient_ajout_courrier_word
end type
type cbx_fusion_pdf from checkbox within w_patient_ajout_courrier_word
end type
type pb_fichier3 from picturebutton within w_patient_ajout_courrier_word
end type
type cbx_garder_nom_fichier from checkbox within w_patient_ajout_courrier_word
end type
type st_clic_droit from statictext within w_patient_ajout_courrier_word
end type
type st_mandibule from statictext within w_patient_ajout_courrier_word
end type
type st_maxillaire from statictext within w_patient_ajout_courrier_word
end type
type dw_liste_libelles from datawindow within w_patient_ajout_courrier_word
end type
end forward

global type w_patient_ajout_courrier_word from w_fenetre_arakis
integer x = 480
integer y = 764
integer width = 3470
integer height = 1884
string title = "Ajout d~'un document"
windowtype windowtype = response!
boolean center = true
event drop_files pbm_dropfiles
cb_fermer cb_fermer
st_3 st_3
st_1 st_1
sle_libelle sle_libelle
em_date em_date
st_2 st_2
sle_fichier sle_fichier
dw_codes_editions dw_codes_editions
gb gb
pb_scanner pb_scanner
pb_acquis_fichier pb_acquis_fichier
pb_param_twain pb_param_twain
pb_scanner_multiples pb_scanner_multiples
lb_fichiers lb_fichiers
pb_aide pb_aide
cbx_effacer cbx_effacer
sle_fichier2 sle_fichier2
pb_fichier2 pb_fichier2
gb_twain gb_twain
gb_fichier gb_fichier
pb_fichier pb_fichier
st_4 st_4
dw_categorie dw_categorie
st_drag1 st_drag1
st_drag2 st_drag2
dw_liste_acquisitions dw_liste_acquisitions
st_drag3 st_drag3
cbx_fusion_pdf cbx_fusion_pdf
pb_fichier3 pb_fichier3
cbx_garder_nom_fichier cbx_garder_nom_fichier
st_clic_droit st_clic_droit
st_mandibule st_mandibule
st_maxillaire st_maxillaire
dw_liste_libelles dw_liste_libelles
end type
global w_patient_ajout_courrier_word w_patient_ajout_courrier_word

type prototypes

end prototypes

type variables


// pour le Drag and Drop avec l'OS 
nca_DragDrop	inca_DragDrop


double v_type_ajout
string last_dossier_acquisition = "" // contiendra le dossier d'acquisition


// pour fusion de document PDF

PDFDocument lpdf_doc


end variables

forward prototypes
public subroutine maj_type_document ()
public function boolean fusion_possible ()
end prototypes

event drop_files;

// 1er fichier Drad and Dropé
inca_DragDrop.Populate( message.wordparm, sle_fichier )


maj_type_document()
end event

public subroutine maj_type_document ();
// Changement du type de document par défaut
string v_extension
v_extension =  lower( gfx_extraire_extension_fichier(sle_fichier.text)  )

choose case v_extension
	case "doc", "docx"
		dw_codes_editions.setItem(1, "code", "DOCWRD")
	case "xls", "xlsx"
		dw_codes_editions.setItem(1, "code", "DOCXLS")
	case "bmp", "jpg", "jpeg"
		dw_codes_editions.setItem(1, "code", "DOCIMG")
	case "ppt", "pptx"
		dw_codes_editions.setItem(1, "code", "DOCPPT")
	case "mp4", "avi"
		dw_codes_editions.setItem(1, "code", "DOCVID")
	case "eml"
		dw_codes_editions.setItem(1, "code", "DOCEML")
	case "pdf"
		dw_codes_editions.setItem(1, "code", "DOCPDF")
	case "stl"
		dw_codes_editions.setItem(1, "code", "DOCMOU")
end choose
end subroutine

public function boolean fusion_possible ();

// si tous les fichiers de la dw sont PDF : ok

long lig, tot

boolean trouve

lig = 1 
trouve = false

tot = dw_liste_acquisitions.rowcount()

if tot > 1 then 
	
	
	do while lig <= tot
		
	//	messagebox("trace", upper(right(dw_liste_acquisitions.getitemstring(lig, "nom_fichier"), 3)) )
	//	messagebox("trace", dw_liste_acquisitions.getitemstring(lig, "nom_fichier") )
		if upper(right(dw_liste_acquisitions.getitemstring(lig, "nom_fichier"), 3)) <> "PDF" then
			trouve = true
		end if
	//		messagebox("trace", string(trouve) )
	
		lig = lig + 1 
	loop

else
	
	trouve = true
	
	
end if

if trouve then
	dw_codes_editions.setItem(1, "code", "DOCAUT")
else
	dw_codes_editions.setItem(1, "code", "DOCPDF")
end if

return not trouve

end function

event open;call super::open;// En paramètre ... 
// 0 : Ajout normal
// 1 : ajout de moulages numérique
// 2 : ajout de moulage myray_as
// 3 : ajout multiples

// On se sert de param_win[1] à param_win[8] pour renvoyer des valeurs (voir bouton pb_acquis_fichier)
v_type_ajout = message.doubleParm


// Pour myray_as, on se sert de param_win[10] et param_win[11] pour initialiser les nom des fichiers

var_suite = false
sle_libelle.text = ""
em_date.text = string(today())


// Liste des documents
dw_codes_editions.settransobject(sqlca)
dw_codes_editions.retrieve()


// Catégorie
dw_categorie.settransobject(sqlca)
dw_categorie.retrieve()
if dw_categorie.rowcount() = 0 then	
	// ajout uniquement pour pas que ça soit vide
	dw_categorie.insertrow(1)
end if

// Liste des libellés GED
dw_liste_libelles.settransobject(sqlca)
dw_liste_libelles.retrieve()
dw_liste_libelles.Modify("Libelle.TabSequence = 0")
dw_liste_libelles.Modify("Libelle.Edit.DisplayOnly = Yes")


// on doit mettre un filtre pour ne lister que les documents
DataWindowChild dw_fille
dw_codes_editions.GetChild("code", dw_fille) 


gb_fichier.backcolor = couleur_fond_fenetre
gb_twain.backcolor = couleur_fond_fenetre
cbx_effacer.backcolor = couleur_fond_fenetre


dw_fille.setFilter("nature = 'D'")
dw_fille.Filter()


// 1 fichier à acquérir par défaut
param_win[6] = '1' 

if v_type_ajout <> 3 then
	
	// recup paramètre de la dernière fois
	if v_type_ajout = 0 then
		if profilestring(dir_ini+inifile_orthokis,"admini","effacer_acquistion_documents","N") = "O" then 
			cbx_effacer.checked = true
		else
			cbx_effacer.checked = false
		end if	
	else
		if profilestring(dir_ini+inifile_orthokis,"admini","effacer_acquistion_moulages","N") = "O" then 
			cbx_effacer.checked = true
		else
			cbx_effacer.checked = false
		end if	
	end if
	
	// Spécificité pour moulages numériques
	if v_type_ajout = 1 or v_type_ajout = 2 then 
		this.title = "Ajout d'un moulage numérique"
		gb_fichier.text = "Acquistion d'un (ou 2) fichier(s) moulage(s)"
		gb_twain.visible = false
		pb_param_twain.visible = false
		pb_scanner.visible = false
		pb_scanner_multiples.visible = false
		gb_fichier.height = gb_fichier.height + 200
		cbx_effacer.y = cbx_effacer.y + 200
		pb_acquis_fichier.y = pb_acquis_fichier.y + 200
		sle_fichier2.visible = true
		st_drag2.visible = true
		pb_fichier2.visible = true
		sle_libelle.text = "Moulage Numérique"
		dw_codes_editions.setItem(1, "code", "DOCMOU")
		cbx_effacer.text = "Effacer le(s) fichier(s) en fin d'acquisition"
		
		// Catégorie moulage par défaut ?
		integer i_id_moulage
		select first id into :i_id_moulage from categorie_courrier_word_favoris where categorie like '%Moulage%' ;
		if not (isnull(i_id_moulage)) then
			dw_categorie.setitem(1, "id" , i_id_moulage)
		end if
		
		// Lien MyRays
		if v_type_ajout = 2 then 
			sle_fichier.text =  param_win[10]
			sle_fichier2.text = param_win[11]
			if  param_win[10] <> "" or  param_win[11] <> "" then
				param_win[6] = "2"		// Nombre de fichiers à acquérir ... 
			else
				param_win[6] = "1"		// Nombre de fichiers à acquérir
			end if
			cbx_effacer.visible = false
		end if
		
		st_mandibule.backcolor = couleur_fond_fenetre
		st_maxillaire.backcolor = couleur_fond_fenetre
		st_maxillaire.visible = true
		st_mandibule.visible = true
	
		sle_fichier.x = 421
		st_drag1.x = sle_fichier.x
		pb_fichier.x = 2903
		
		sle_fichier2.x = sle_fichier.x
		st_drag2.x = sle_fichier.x
		pb_fichier2.x = pb_fichier.x 
		
		
	end if
	
	inca_DragDrop.BeginDragDrop( sle_fichier )
	inca_DragDrop.BeginDragDrop( sle_fichier2 )
	//inca_DragDrop.begindragdropwindow( this )
else
	
	// Ajout mulltiples
	pb_fichier.visible = false
	pb_fichier2.visible = false
	sle_fichier.visible = false
	sle_fichier2.visible = false
	st_drag1.visible = false
	st_drag2.visible = false
	gb_twain.visible = false
	pb_scanner.visible = false
	pb_param_twain.visible = false
	pb_scanner_multiples.visible = false
	
	this.title = "Ajout multiple de documents"
	gb_fichier.text = "Acquistion de plusieurs fichiers"
	
	dw_liste_acquisitions.reset()
	dw_liste_acquisitions.visible = true
	dw_liste_acquisitions.object.type_image.visible = false
	dw_liste_acquisitions.object.nom_fichier.width = 1536
	
	inca_DragDrop.BeginDragDrop( dw_liste_acquisitions )
	
	st_drag3.visible = true
	st_clic_droit.visible = true
	
	gb_fichier.width = 1819
	gb_fichier.height = 1192
	
	
	pb_acquis_fichier.width = pb_fichier3.width
	pb_acquis_fichier.height = pb_fichier3.height
	pb_acquis_fichier.y = pb_aide.y
	
	cbx_garder_nom_fichier.backcolor = couleur_fond_fenetre
	cbx_garder_nom_fichier.visible = true
	
	cbx_fusion_pdf.backcolor = couleur_fond_fenetre
	
	pb_fichier3.visible = true
	
	cbx_effacer.text = "Effacer les fichiers en fin d'acquisition"
	cbx_effacer.x = 2007
	cbx_effacer.y = 1320
	cbx_effacer.weight = 400
	cbx_effacer.backcolor = couleur_fond_fenetre
	
end if
end event

on w_patient_ajout_courrier_word.create
int iCurrent
call super::create
this.cb_fermer=create cb_fermer
this.st_3=create st_3
this.st_1=create st_1
this.sle_libelle=create sle_libelle
this.em_date=create em_date
this.st_2=create st_2
this.sle_fichier=create sle_fichier
this.dw_codes_editions=create dw_codes_editions
this.gb=create gb
this.pb_scanner=create pb_scanner
this.pb_acquis_fichier=create pb_acquis_fichier
this.pb_param_twain=create pb_param_twain
this.pb_scanner_multiples=create pb_scanner_multiples
this.lb_fichiers=create lb_fichiers
this.pb_aide=create pb_aide
this.cbx_effacer=create cbx_effacer
this.sle_fichier2=create sle_fichier2
this.pb_fichier2=create pb_fichier2
this.gb_twain=create gb_twain
this.gb_fichier=create gb_fichier
this.pb_fichier=create pb_fichier
this.st_4=create st_4
this.dw_categorie=create dw_categorie
this.st_drag1=create st_drag1
this.st_drag2=create st_drag2
this.dw_liste_acquisitions=create dw_liste_acquisitions
this.st_drag3=create st_drag3
this.cbx_fusion_pdf=create cbx_fusion_pdf
this.pb_fichier3=create pb_fichier3
this.cbx_garder_nom_fichier=create cbx_garder_nom_fichier
this.st_clic_droit=create st_clic_droit
this.st_mandibule=create st_mandibule
this.st_maxillaire=create st_maxillaire
this.dw_liste_libelles=create dw_liste_libelles
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_fermer
this.Control[iCurrent+2]=this.st_3
this.Control[iCurrent+3]=this.st_1
this.Control[iCurrent+4]=this.sle_libelle
this.Control[iCurrent+5]=this.em_date
this.Control[iCurrent+6]=this.st_2
this.Control[iCurrent+7]=this.sle_fichier
this.Control[iCurrent+8]=this.dw_codes_editions
this.Control[iCurrent+9]=this.gb
this.Control[iCurrent+10]=this.pb_scanner
this.Control[iCurrent+11]=this.pb_acquis_fichier
this.Control[iCurrent+12]=this.pb_param_twain
this.Control[iCurrent+13]=this.pb_scanner_multiples
this.Control[iCurrent+14]=this.lb_fichiers
this.Control[iCurrent+15]=this.pb_aide
this.Control[iCurrent+16]=this.cbx_effacer
this.Control[iCurrent+17]=this.sle_fichier2
this.Control[iCurrent+18]=this.pb_fichier2
this.Control[iCurrent+19]=this.gb_twain
this.Control[iCurrent+20]=this.gb_fichier
this.Control[iCurrent+21]=this.pb_fichier
this.Control[iCurrent+22]=this.st_4
this.Control[iCurrent+23]=this.dw_categorie
this.Control[iCurrent+24]=this.st_drag1
this.Control[iCurrent+25]=this.st_drag2
this.Control[iCurrent+26]=this.dw_liste_acquisitions
this.Control[iCurrent+27]=this.st_drag3
this.Control[iCurrent+28]=this.cbx_fusion_pdf
this.Control[iCurrent+29]=this.pb_fichier3
this.Control[iCurrent+30]=this.cbx_garder_nom_fichier
this.Control[iCurrent+31]=this.st_clic_droit
this.Control[iCurrent+32]=this.st_mandibule
this.Control[iCurrent+33]=this.st_maxillaire
this.Control[iCurrent+34]=this.dw_liste_libelles
end on

on w_patient_ajout_courrier_word.destroy
call super::destroy
destroy(this.cb_fermer)
destroy(this.st_3)
destroy(this.st_1)
destroy(this.sle_libelle)
destroy(this.em_date)
destroy(this.st_2)
destroy(this.sle_fichier)
destroy(this.dw_codes_editions)
destroy(this.gb)
destroy(this.pb_scanner)
destroy(this.pb_acquis_fichier)
destroy(this.pb_param_twain)
destroy(this.pb_scanner_multiples)
destroy(this.lb_fichiers)
destroy(this.pb_aide)
destroy(this.cbx_effacer)
destroy(this.sle_fichier2)
destroy(this.pb_fichier2)
destroy(this.gb_twain)
destroy(this.gb_fichier)
destroy(this.pb_fichier)
destroy(this.st_4)
destroy(this.dw_categorie)
destroy(this.st_drag1)
destroy(this.st_drag2)
destroy(this.dw_liste_acquisitions)
destroy(this.st_drag3)
destroy(this.cbx_fusion_pdf)
destroy(this.pb_fichier3)
destroy(this.cbx_garder_nom_fichier)
destroy(this.st_clic_droit)
destroy(this.st_mandibule)
destroy(this.st_maxillaire)
destroy(this.dw_liste_libelles)
end on

type p_fond from w_fenetre_arakis`p_fond within w_patient_ajout_courrier_word
integer x = 503
integer y = 1508
end type

type cb_fermer from uo_picturebutton_390x120 within w_patient_ajout_courrier_word
integer x = 2789
integer y = 1456
integer width = 485
integer height = 152
integer taborder = 90
string text = "&Fermer"
string iconname = "ACTIONS_fermer.png"
end type

event clicked;call super::clicked;

var_suite = false
close(parent)
end event

type st_3 from statictext within w_patient_ajout_courrier_word
integer x = 55
integer y = 192
integer width = 247
integer height = 72
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
string facename = "Arial"
long backcolor = 553648127
string text = "Date :"
end type

type st_1 from statictext within w_patient_ajout_courrier_word
integer x = 55
integer y = 64
integer width = 247
integer height = 72
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
string facename = "Arial"
long backcolor = 553648127
string text = "Libellé :"
end type

type sle_libelle from singlelineedit within w_patient_ajout_courrier_word
integer x = 320
integer y = 56
integer width = 2889
integer height = 88
integer taborder = 10
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
integer limit = 500
borderstyle borderstyle = stylelowered!
end type

event rbuttondown;

dw_liste_libelles.visible = true
return 1
end event

type em_date from editmask within w_patient_ajout_courrier_word
integer x = 320
integer y = 180
integer width = 439
integer height = 96
integer taborder = 20
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 16777215
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "dd/mm/yyyy"
boolean spin = true
string displaydata = "8"
double increment = 1
string minmax = "-9999~~99999"
end type

type st_2 from statictext within w_patient_ajout_courrier_word
integer x = 55
integer y = 320
integer width = 608
integer height = 72
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
string facename = "Arial"
long backcolor = 553648127
string text = "Type de document : "
end type

type sle_fichier from singlelineedit within w_patient_ajout_courrier_word
event drop_files pbm_dropfiles
integer x = 128
integer y = 668
integer width = 2377
integer height = 88
integer taborder = 30
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
integer limit = 400
boolean displayonly = true
borderstyle borderstyle = stylelowered!
end type

event drop_files;
// 1er fichier Drad and Dropé
inca_DragDrop.Populate( message.wordparm, sle_fichier )

maj_type_document()

last_dossier_acquisition = gfx_extraire_path_fichier(sle_fichier.text)

end event

type dw_codes_editions from datawindow within w_patient_ajout_courrier_word
string tag = "no resizeall"
integer x = 645
integer y = 320
integer width = 1042
integer height = 72
integer taborder = 40
boolean bringtotop = true
string title = "none"
string dataobject = "dw_cherche_type_edition"
boolean border = false
boolean livescroll = true
end type

type gb from gearbox within w_patient_ajout_courrier_word
integer x = 2414
integer y = 32
integer taborder = 50
boolean bringtotop = true
end type

on gb.destroy
call gearbox::destroy
end on

type pb_scanner from picturebutton within w_patient_ajout_courrier_word
integer x = 1266
integer y = 1404
integer width = 238
integer height = 200
integer taborder = 100
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "lc_scanner.png"
alignment htextalign = left!
string powertiptext = "Acquisition TWAIN d~'un seul document"
long backcolor = 553648127
end type

event clicked;string		chemindossier
security_attributes		sa


// init spécif
gb.ole_image.object.ScanShowUI = true

// lance l'IU TWAIN de l'appareil
gb.ole_image.object.ScanAcquire = True

// si bien récup un flux de données
if gb.ole_image.object.ErrCount <> 0 Then goto Erreur

// Construction d'un nom de fichier temporaire qu'on effacera en sortant d'orthokis
// sous la forme scan_AAAAMMJJHHMMSS.jpg
string fichier_scan

fichier_scan = dir_ini + "scan_"+string(year(today()))+string(month(today()))+string(day(today()))+string(hour(now()))+string(minute(now()))+string(second(now()))+".jpg"

sle_fichier.text = fichier_scan

// config du format de destination
if gb.config_format_de_save(fichier_scan) <> 1 then goto Erreur

// sauvegarde du fichier
gb.ole_image.object.SaveImage = fichier_scan

// charge le fichier pour s'assurer que tout est ok
if not FileExists(fichier_scan ) then goto erreur

// 1 fichier à acquérir
param_win[6] = '1' 

// on fait l'acquisition dans la foulée
pb_acquis_fichier.triggerevent(clicked!)

goto Fin
Erreur:
	messagebox("Attention !","Une erreur est survenue dans l'acquisition de votre Image")
Fin:
end event

type pb_acquis_fichier from picturebutton within w_patient_ajout_courrier_word
integer x = 2194
integer y = 944
integer width = 238
integer height = 200
integer taborder = 130
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "lc_acquisition_fichier.png"
alignment htextalign = left!
string powertiptext = "Acquisition du/des Fichier(s)"
long backcolor = 553648127
end type

event clicked;var_suite = true

param_win[1] = em_date.text
param_win[2] = sle_libelle.text
param_win[3] = dw_codes_editions.getitemString(dw_codes_editions.getrow(),"code")
param_win[4] = sle_fichier.text
if cbx_effacer.checked then 
	param_win[5] = "O"
else
	param_win[5] = "N"
end if

// param_win[6] : contient le nombre de fichier à acquérir !! .. mis à jour par les différents Boutons

param_win[7] = sle_fichier2.text

param_win[8] =  string( dw_categorie.getitemnumber(dw_categorie.getrow(), "id"))

// Mémorisation du dossier utilisé en acquisition fichier ...
string dossier_acquis

dossier_acquis = gfx_extraire_path_fichier(trim(sle_fichier.text))

if len(trim(dossier_acquis)) > 0 and dossier_acquis <> dir_ini then
	if v_type_ajout = 0 then
		Setprofilestring(dir_ini+inifile_orthokis,"admini","dir_acquis_courant_documents",dossier_acquis)
	else
		Setprofilestring(dir_ini+inifile_orthokis,"admini","dir_acquis_courant_moulages",dossier_acquis)
	end if
end if

if cbx_effacer.checked then 
	Setprofilestring(dir_ini+inifile_orthokis,"admini","effacer_acquistion_documents","O")
else
	Setprofilestring(dir_ini+inifile_orthokis,"admini","effacer_acquistion_moulages","N")
end if

if v_type_ajout = 3 then
	// on renvoie le contenu de la dw qui contient la liste des fichiers à récup dans la variable globale
	long lig, tot
	tot = dw_liste_acquisitions.rowcount()
	
	
	
	if tot > 20 then 
	
		Messagebox("ATTENTION","Vous ne pouvez pas acquérir plus de 20 fichiers à la fois !")
	else
		
		if tot = 0 then 

			Messagebox("ATTENTION","Il n'y a pas de fichier à acquérir !")
			
		else
			string ls_file1, ls_file2, ls_file_local
			integer ret_copy
			
			
			if cbx_fusion_pdf.checked and cbx_fusion_pdf.visible then
				
				open(w_patience)
				
				// fusion des fichiers PDF .. on fusionne en local et on effacera le fichier ensuite
				ls_file_local = dir_ini + dw_liste_acquisitions.GetItemString(1, "nom_fichier")
				cbx_effacer.checked = true
				
				lpdf_doc = CREATE PDFDocument
				
				
				// Copie du 1er fichier de la liste en local pour fusionner ce fichier
				ls_file1 = dw_liste_acquisitions.GetItemString(1, "chemin") + dw_liste_acquisitions.GetItemString(1, "nom_fichier")
				//ret_copy = FileCopy(ls_file1, ls_file_local, true)

				ret_copy = lpdf_doc.ImportPdf(ls_file1)
				
				if ret_copy = 1  then
				
					// On met le fichier temporaire dans le tableau
					dw_liste_acquisitions.SetItem(1, "chemin", dir_ini) 
					
					
					for lig = tot to 2 step -1
						ls_file2 = dw_liste_acquisitions.GetItemString(2, "chemin") + dw_liste_acquisitions.GetItemString(2, "nom_fichier")
						// on fusionne toujours avec la ligne 2 ... qu'on détruit ensuite
						if lpdf_doc.ImportPdf(ls_file2) = 1 then
							dw_liste_acquisitions.deleterow(2)
						end if
					next 
					
					// Sauvegarde du fichier de fusion
					ret_copy = lpdf_doc.Save(ls_file_local)
					
				else
					Messagebox("ATTENTION", "Erreur N°" + string(ret_copy) + " dans la copie du 1er fichier.~n~nFusion abandonée !")
				end if
				
				close(w_patience)

			end if

			tot = dw_liste_acquisitions.rowcount()
			param_win[6] = string(tot)
			
			if cbx_garder_nom_fichier.checked then
				param_win[9] = "O"
			else
				param_win[9] = "N"
			end if
			
			for lig = 1 to tot
				fichiers_a_acquerir[lig] = dw_liste_acquisitions.GetItemString(lig, "chemin") + dw_liste_acquisitions.GetItemString(lig, "nom_fichier")
			next
			
			close(parent)
		end if
	end if
else
	
	close(parent)
	
end if



end event

type pb_param_twain from picturebutton within w_patient_ajout_courrier_word
integer x = 864
integer y = 1404
integer width = 238
integer height = 200
integer taborder = 140
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "lc_scanner_source.png"
alignment htextalign = left!
string powertiptext = "Paramétrage de la source TWAIN"
long backcolor = 553648127
end type

event clicked;gb.selec_source_twain( )

end event

type pb_scanner_multiples from picturebutton within w_patient_ajout_courrier_word
integer x = 1669
integer y = 1404
integer width = 238
integer height = 200
integer taborder = 150
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "lc_scanner_multiples.png"
alignment htextalign = left!
string powertiptext = "Acquisition TWAIN de plusieurs documents"
long backcolor = 553648127
end type

event clicked;//string		chemindossier
security_attributes		sa

string str_chemin_import
// init spécif
gb.ole_image.object.ScanShowUI = true

// Pour scan multiple
gb.ole_image.object.ScanEventActivate (IG_SCANCB_AFTER_PAGE, 0)	//active l'évènement "after_page"

str_chemin_import = dir_ini + "temp\"

// création du rep temp si pas déjà présent
if not fxg_FileExists(str_chemin_import) then CreateDirectoryA(str_chemin_import,sa)

// lance l'IU TWAIN de l'appareil en mode multiple ... 
gb.ole_image.object.ScanPages = str_chemin_import



// on liste les fichiers acquis par TWAIN ds listbox
lb_fichiers.reset()
lb_fichiers.DirList(str_chemin_import + "*.*", 32)	// uniquement les fichiers avec aucun attribut et/ou attribut archive seulement


// Construction d'un nom de fichier temporaire qu'on effacera en sortant d'orthokis
// sous la forme scan_AAAAMMJJHHMMSS.jpg
string fichier_scan, fichier_destination, nom_fichiers_destinations
long nbr_tot, cpt
nbr_tot = lb_fichiers.TotalItems()

// 1 fichier à acquérir
param_win[6] = string(nbr_tot) 
nom_fichiers_destinations = dir_ini + "scan_"+string(year(today()))+string(month(today()))+string(day(today()))+string(hour(now()))+string(minute(now()))+string(second(now()))

for cpt = 1 to nbr_tot 
	
	fichier_scan = str_chemin_import +  lb_fichiers.text(cpt)
	fichier_destination = nom_fichiers_destinations + "-" + string(cpt)+".jpg"
	
	FileCopy(fichier_scan, fichier_destination)
	FileDelete(fichier_scan)
	
next 

sle_fichier.text = nom_fichiers_destinations

// on fait l'acquisition dans la foulée
pb_acquis_fichier.triggerevent(clicked!)



//goto Fin
//
//
//Erreur:
//	messagebox("Attention !","Une erreur est survenue dans l'acquisition de votre Image")
//Fin:
end event

type lb_fichiers from listbox within w_patient_ajout_courrier_word
event drop_files pbm_dropfiles
boolean visible = false
integer x = 1422
integer y = 172
integer width = 722
integer height = 408
integer taborder = 110
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
borderstyle borderstyle = stylelowered!
end type

event drop_files;// Fichier Drad and Dropé
inca_DragDrop.Populate( message.wordparm, this )

// 2 fichiers à acquérir
param_win[6] = string(TotalItems())

if v_type_ajout = 0 then
	maj_type_document()
end if

end event

type pb_aide from uo_bouton_aide within w_patient_ajout_courrier_word
string tag = "GED"
integer x = 2496
integer y = 1444
integer taborder = 190
boolean bringtotop = true
end type

on pb_aide.destroy
call uo_bouton_aide::destroy
end on

type cbx_effacer from checkbox within w_patient_ajout_courrier_word
integer x = 128
integer y = 1056
integer width = 1253
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Effacer le fichier en fin d~'acquisition"
end type

type sle_fichier2 from singlelineedit within w_patient_ajout_courrier_word
event drop_files pbm_dropfiles
event end_drag pbm_endragdrop
boolean visible = false
integer x = 128
integer y = 836
integer width = 2377
integer height = 88
integer taborder = 70
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
integer limit = 400
boolean displayonly = true
borderstyle borderstyle = stylelowered!
end type

event drop_files;// 2ème fichier Drad and Dropé
inca_DragDrop.Populate( message.wordparm, sle_fichier2 )

last_dossier_acquisition = gfx_extraire_path_fichier(sle_fichier2.text)

// 2 fichiers à acquérir
param_win[6] = '2' 

if v_type_ajout = 0 then
	maj_type_document()
end if

end event

type pb_fichier2 from picturebutton within w_patient_ajout_courrier_word
boolean visible = false
integer x = 2551
integer y = 816
integer width = 146
integer height = 132
integer taborder = 170
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "lc_explorer.png"
string disabledname = "lc_explorer.png"
alignment htextalign = left!
end type

event clicked;string ficname, ficpath
string dir_courant

if last_dossier_acquisition = "" then
	// récup du dernier répertoire utilisé pour une acquisition fichier
	if  v_type_ajout = 0 or v_type_ajout = 3 then
		last_dossier_acquisition = profilestring(dir_ini+inifile_orthokis,"admini","dir_acquis_courant_documents","")
	else
		last_dossier_acquisition = profilestring(dir_ini+inifile_orthokis,"admini","dir_acquis_courant_moulages","")
	end if
end if

dir_courant = GetCurrentDirectory ()

if len(trim(last_dossier_acquisition)) > 0 then
	SetCurrentDirectoryA (last_dossier_acquisition)
end if

if GetFileOpenName("Document à joindre", ficname, ficpath, "","Tous les Fichiers") = 1 then
	sle_fichier2.text = ficname
	last_dossier_acquisition = gfx_extraire_path_fichier(ficname)
end if

SetCurrentDirectoryA (dir_courant)

// 2 fichiers à acquérir
param_win[6] = '2' 

if v_type_ajout = 0 then
	maj_type_document()
end if

end event

type gb_twain from groupbox within w_patient_ajout_courrier_word
integer x = 613
integer y = 1288
integer width = 1536
integer height = 368
integer taborder = 200
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean italic = true
long textcolor = 33554432
long backcolor = 67108864
string text = "Acquisition Twain"
end type

type gb_fichier from groupbox within w_patient_ajout_courrier_word
integer x = 55
integer y = 568
integer width = 3259
integer height = 592
integer taborder = 210
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean italic = true
long textcolor = 33554432
long backcolor = 67108864
string text = "Acquistion d~'un fichier"
end type

type pb_fichier from picturebutton within w_patient_ajout_courrier_word
integer x = 2551
integer y = 640
integer width = 146
integer height = 132
integer taborder = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "lc_explorer.png"
string disabledname = "lc_explorer.png"
alignment htextalign = left!
long backcolor = 553648127
end type

event clicked;string ficname, ficpath
string dir_courant

if last_dossier_acquisition = "" then
	// récup du dernier répertoire utilisé pour une acquisition fichier
	if v_type_ajout = 0 or v_type_ajout = 3  then
		last_dossier_acquisition = profilestring(dir_ini+inifile_orthokis,"admini","dir_acquis_courant_documents","")
	else
		last_dossier_acquisition = profilestring(dir_ini+inifile_orthokis,"admini","dir_acquis_courant_moulages","")
	end if
end if

dir_courant = GetCurrentDirectory ()

if len(trim(last_dossier_acquisition)) > 0 then
	SetCurrentDirectoryA (last_dossier_acquisition)
end if

if GetFileOpenName("Document à joindre", ficname, ficpath,"","Tous les Fichiers") = 1 then
	sle_fichier.text = ficname
	last_dossier_acquisition = gfx_extraire_path_fichier(ficname)
end if

SetCurrentDirectoryA (dir_courant)

// 1 fichier à acquérir
param_win[6] = '1' 
pb_fichier2.enabled = true

if v_type_ajout = 0 then
	maj_type_document()
end if

end event

type st_4 from statictext within w_patient_ajout_courrier_word
integer x = 55
integer y = 448
integer width = 370
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
string text = "Catégorie :"
boolean focusrectangle = false
end type

type dw_categorie from datawindow within w_patient_ajout_courrier_word
integer x = 421
integer y = 436
integer width = 914
integer height = 88
integer taborder = 180
boolean bringtotop = true
string title = "none"
string dataobject = "dw_categorie_courrier_word_favoris_cherche"
boolean border = false
boolean livescroll = true
end type

type st_drag1 from statictext within w_patient_ajout_courrier_word
integer x = 128
integer y = 760
integer width = 1582
integer height = 80
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean italic = true
long textcolor = 16711680
long backcolor = 553648127
string text = "Vous pouvez glisser / déplacer un fichier (depuis Windows)"
boolean focusrectangle = false
end type

type st_drag2 from statictext within w_patient_ajout_courrier_word
boolean visible = false
integer x = 128
integer y = 924
integer width = 1582
integer height = 80
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean italic = true
long textcolor = 16711680
long backcolor = 553648127
string text = "Vous pouvez glisser / déplacer un fichier (depuis Windows)"
boolean focusrectangle = false
end type

type dw_liste_acquisitions from datawindow within w_patient_ajout_courrier_word
event drop_files pbm_dropfiles
string tag = "brush"
boolean visible = false
integer x = 87
integer y = 648
integer width = 1701
integer height = 920
integer taborder = 160
boolean bringtotop = true
string title = "Fichiers en cours d~'acquisition"
string dataobject = "dw_acquis_liste_fichiers"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event drop_files;

long ligapres , ligavant, lig


ligavant = rowcount()

// Ajout d'une ligne avec le(s) fichier(s) Drad and Dropé
inca_DragDrop.Populate( message.wordparm, this , "nom_fichier" )

string v_nom_seul, v_path_seul


ligapres = rowcount()

for lig  = ligavant + 1 to ligapres
	v_nom_seul = gfx_extraire_nom_fichier (GetItemString(lig, "nom_fichier"))
	v_path_seul = gfx_extraire_path_fichier (GetItemString(lig, "nom_fichier"))

	SetItem(lig, "nom_fichier", v_nom_seul )
	SetItem(lig, "chemin", v_path_seul )
next

// Si on modifie la dw on actualise la check box pour fusionner ou pas les pdf
cbx_fusion_pdf.visible = fusion_possible()



end event

event rbuttondown;

if row > 0 then
	
	// on efface la ligne
	this.deleterow(row)
	
	// Si on modifié la dw on actualise la check box pour fusionner ou pas les pdf
	cbx_fusion_pdf.visible = fusion_possible()
	
end if
end event

event clicked;If row > 0 Then
	// Sélection de la ligne
	This.SelectRow(0,False)
	This.SelectRow(row,True)
	This.setrow(row)
end if
end event

type st_drag3 from statictext within w_patient_ajout_courrier_word
boolean visible = false
integer x = 96
integer y = 1604
integer width = 1358
integer height = 68
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean italic = true
long textcolor = 16711680
long backcolor = 553648127
string text = "Vous pouvez glisser / déplacer un fichier (depuis Windows)"
boolean focusrectangle = false
end type

type cbx_fusion_pdf from checkbox within w_patient_ajout_courrier_word
boolean visible = false
integer x = 2007
integer y = 1048
integer width = 1211
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Fusionner les fichiers (uniquement PDF)"
end type

type pb_fichier3 from picturebutton within w_patient_ajout_courrier_word
boolean visible = false
integer x = 1929
integer y = 1444
integer width = 183
integer height = 160
integer taborder = 120
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "lc_explorer.png"
string disabledname = "lc_explorer.png"
alignment htextalign = left!
long backcolor = 553648127
end type

event clicked;string ficname, ficpath
string dir_courant
long lig
string v_nom_seul, v_path_seul

if last_dossier_acquisition = "" then
	// récup du dernier répertoire utilisé pour une acquisition fichier
	last_dossier_acquisition = profilestring(dir_ini+inifile_orthokis,"admini","dir_acquis_courant_documents","")
end if

dir_courant = GetCurrentDirectory ()

if len(trim(last_dossier_acquisition)) > 0 then
	SetCurrentDirectoryA (last_dossier_acquisition)
end if

if GetFileOpenName("Document à joindre", ficname, ficpath,"","Tous les Fichiers") = 1 then

	
	
	dw_liste_acquisitions.insertrow(9999)
	
	lig = dw_liste_acquisitions.rowcount()
	
	v_nom_seul = gfx_extraire_nom_fichier (ficname)
	v_path_seul = gfx_extraire_path_fichier (ficname)
	
	dw_liste_acquisitions.SetItem(lig, "nom_fichier", v_nom_seul )
	dw_liste_acquisitions.SetItem(lig, "chemin", v_path_seul )
	
	last_dossier_acquisition = gfx_extraire_path_fichier(ficname)
end if

SetCurrentDirectoryA (dir_courant)

// Si on modifié la dw on actualise la check box pour fusionner ou pas les pdf
cbx_fusion_pdf.visible = fusion_possible()

end event

type cbx_garder_nom_fichier from checkbox within w_patient_ajout_courrier_word
boolean visible = false
integer x = 2007
integer y = 1184
integer width = 1193
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Garder le nom des fichiers comme libellés"
end type

type st_clic_droit from statictext within w_patient_ajout_courrier_word
boolean visible = false
integer x = 96
integer y = 1676
integer width = 1358
integer height = 68
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean italic = true
long textcolor = 16711680
long backcolor = 553648127
string text = "Clic Droit pour supprimer un élément de la liste"
boolean focusrectangle = false
end type

type st_mandibule from statictext within w_patient_ajout_courrier_word
boolean visible = false
integer x = 87
integer y = 680
integer width = 343
integer height = 56
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 67108864
string text = "Mandibule : "
boolean focusrectangle = false
end type

type st_maxillaire from statictext within w_patient_ajout_courrier_word
boolean visible = false
integer x = 87
integer y = 852
integer width = 325
integer height = 56
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 67108864
string text = "Maxillaire :"
boolean focusrectangle = false
end type

type dw_liste_libelles from datawindow within w_patient_ajout_courrier_word
boolean visible = false
integer x = 1993
integer width = 1362
integer height = 1416
integer taborder = 60
boolean titlebar = true
string title = "Libellés GED"
string dataobject = "dw_ged_libelle_ddlb"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event rbuttondown;

this.visible = false
end event

event doubleclicked;
if row > 0 then
	sle_libelle.text = this.GetItemString(row, "libelle")
	this.visible = false
end if
end event

event clicked;If row > 0 Then
	This.SelectRow(0,False)
	This.SelectRow(row,True)
	This.setrow(row)
End If

end event

event buttonclicked;string	ls_Object
string	ls_win

ls_Object = String(dwo.name)


choose case ls_object
	case "b_ajouter" 
		InsertRow(0)
		ScrollToRow(rowcount())
		Setitem(rowcount(), "libelle", "?")
		dw_liste_libelles.Modify("Libelle.TabSequence = 10")
		dw_liste_libelles.Modify("Libelle.Edit.DisplayOnly = No")
		Setcolumn(1)
	case "b_supprimer" 
		deleterow(getrow())
	case "b_annuler" 
		retrieve()
	case "b_enregistrer" 
		if update() = 1 then 
			commit ;
		else
			messagebox("ERREUR",sqlca.sqlerrtext)
		end if
		
end choose




end event

