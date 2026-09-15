$PBExportHeader$w_img_imprimer.srw
forward
global type w_img_imprimer from w_fenetre_arakis
end type
type pb_imprimer from uo_picturebutton_780x120 within w_img_imprimer
end type
type pb_previ_imp from uo_picturebutton_780x120 within w_img_imprimer
end type
type sle_paysage from singlelineedit within w_img_imprimer
end type
type sle_portrait from singlelineedit within w_img_imprimer
end type
type rb_paysage from radiobutton within w_img_imprimer
end type
type rb_portrait from radiobutton within w_img_imprimer
end type
type cb_annuler from uo_picturebutton_390x120 within w_img_imprimer
end type
type pb_previ_email from uo_picturebutton_780x120 within w_img_imprimer
end type
type pb_email from uo_picturebutton_780x120 within w_img_imprimer
end type
type sle_mep3 from singlelineedit within w_img_imprimer
end type
type sle_mep4 from singlelineedit within w_img_imprimer
end type
type rb_mep3 from radiobutton within w_img_imprimer
end type
type rb_mep4 from radiobutton within w_img_imprimer
end type
type pb_word_portrait from picturebutton within w_img_imprimer
end type
type pb_word_paysage from picturebutton within w_img_imprimer
end type
type pb_emp3 from picturebutton within w_img_imprimer
end type
type pb_mep4 from picturebutton within w_img_imprimer
end type
type rb_mep5 from radiobutton within w_img_imprimer
end type
type rb_mep6 from radiobutton within w_img_imprimer
end type
type rb_mep7 from radiobutton within w_img_imprimer
end type
type rb_mep8 from radiobutton within w_img_imprimer
end type
type pb_mep5 from picturebutton within w_img_imprimer
end type
type pb_mep6 from picturebutton within w_img_imprimer
end type
type pb_mep7 from picturebutton within w_img_imprimer
end type
type pb_mep8 from picturebutton within w_img_imprimer
end type
type sle_mep5 from singlelineedit within w_img_imprimer
end type
type sle_mep6 from singlelineedit within w_img_imprimer
end type
type sle_mep7 from singlelineedit within w_img_imprimer
end type
type sle_mep8 from singlelineedit within w_img_imprimer
end type
type pb_1 from picturebutton within w_img_imprimer
end type
type pb_2 from picturebutton within w_img_imprimer
end type
type pb_3 from picturebutton within w_img_imprimer
end type
type pb_8 from picturebutton within w_img_imprimer
end type
type pb_4 from picturebutton within w_img_imprimer
end type
type pb_5 from picturebutton within w_img_imprimer
end type
type pb_6 from picturebutton within w_img_imprimer
end type
type pb_7 from picturebutton within w_img_imprimer
end type
type cb_signature_en_ligne from uo_picturebutton_780x120 within w_img_imprimer
end type
type cb_signature_numerique from uo_picturebutton_780x120 within w_img_imprimer
end type
type gb_mise_en_page from groupbox within w_img_imprimer
end type
type gb_signature from groupbox within w_img_imprimer
end type
type gb_impression from groupbox within w_img_imprimer
end type
type gb_email from groupbox within w_img_imprimer
end type
end forward

global type w_img_imprimer from w_fenetre_arakis
integer width = 3067
integer height = 2688
string title = "Utilisation d~'images ou de courier avec Office"
windowtype windowtype = response!
long backcolor = 15780518
boolean center = true
pb_imprimer pb_imprimer
pb_previ_imp pb_previ_imp
sle_paysage sle_paysage
sle_portrait sle_portrait
rb_paysage rb_paysage
rb_portrait rb_portrait
cb_annuler cb_annuler
pb_previ_email pb_previ_email
pb_email pb_email
sle_mep3 sle_mep3
sle_mep4 sle_mep4
rb_mep3 rb_mep3
rb_mep4 rb_mep4
pb_word_portrait pb_word_portrait
pb_word_paysage pb_word_paysage
pb_emp3 pb_emp3
pb_mep4 pb_mep4
rb_mep5 rb_mep5
rb_mep6 rb_mep6
rb_mep7 rb_mep7
rb_mep8 rb_mep8
pb_mep5 pb_mep5
pb_mep6 pb_mep6
pb_mep7 pb_mep7
pb_mep8 pb_mep8
sle_mep5 sle_mep5
sle_mep6 sle_mep6
sle_mep7 sle_mep7
sle_mep8 sle_mep8
pb_1 pb_1
pb_2 pb_2
pb_3 pb_3
pb_8 pb_8
pb_4 pb_4
pb_5 pb_5
pb_6 pb_6
pb_7 pb_7
cb_signature_en_ligne cb_signature_en_ligne
cb_signature_numerique cb_signature_numerique
gb_mise_en_page gb_mise_en_page
gb_signature gb_signature
gb_impression gb_impression
gb_email gb_email
end type
global w_img_imprimer w_img_imprimer

type variables


string soft_office
string libelle_soft_office
end variables

forward prototypes
public function string imprimer ()
public subroutine get_file_office (ref singlelineedit single_ligne)
end prototypes

public function string imprimer ();


// Mémorisation des infos dans Orthokis.ini

string fichier_retourne

if soft_office = "W" or soft_office = "C"  then 
	
	SetProfileString( dir_ini + inifile_orthokis, "Photos","courrier_word_portrait" , sle_portrait.text )
	SetProfileString( dir_ini + inifile_orthokis, "Photos","courrier_word_paysage" , sle_paysage.text )
	SetProfileString( dir_ini + inifile_orthokis, "Photos","courrier_word_mep3" , sle_mep3.text )
	SetProfileString( dir_ini + inifile_orthokis, "Photos","courrier_word_mep4" , sle_mep4.text )
	SetProfileString( dir_ini + inifile_orthokis, "Photos","courrier_word_mep5" , sle_mep5.text )
	SetProfileString( dir_ini + inifile_orthokis, "Photos","courrier_word_mep6" , sle_mep6.text )
	SetProfileString( dir_ini + inifile_orthokis, "Photos","courrier_word_mep7" , sle_mep7.text )
	SetProfileString( dir_ini + inifile_orthokis, "Photos","courrier_word_mep8" , sle_mep8.text )

else
	if soft_office = "S" then 
		
		SetProfileString( dir_ini + inifile_orthokis, "Admini","courrier_word_mep1" , sle_portrait.text )
		SetProfileString( dir_ini + inifile_orthokis, "Admini","courrier_word_mep2" , sle_paysage.text )
		SetProfileString( dir_ini + inifile_orthokis, "Admini","courrier_word_mep3" , sle_mep3.text )
		SetProfileString( dir_ini + inifile_orthokis, "Admini","courrier_word_mep4" , sle_mep4.text )
		SetProfileString( dir_ini + inifile_orthokis, "Admini","courrier_word_mep5" , sle_mep5.text )
		SetProfileString( dir_ini + inifile_orthokis, "Admini","courrier_word_mep6" , sle_mep6.text )
		SetProfileString( dir_ini + inifile_orthokis, "Admini","courrier_word_mep7" , sle_mep7.text )
		SetProfileString( dir_ini + inifile_orthokis, "Admini","courrier_word_mep8" , sle_mep8.text )
		
	else
	
		SetProfileString( dir_ini + inifile_orthokis, "Photos","presentation_powerpoint_mep1" , sle_portrait.text )
		SetProfileString( dir_ini + inifile_orthokis, "Photos","presentation_powerpoint_mep2" , sle_paysage.text )
		SetProfileString( dir_ini + inifile_orthokis, "Photos","presentation_powerpoint_mep3" , sle_mep3.text )
		SetProfileString( dir_ini + inifile_orthokis, "Photos","presentation_powerpoint_mep4" , sle_mep4.text )
		SetProfileString( dir_ini + inifile_orthokis, "Photos","presentation_powerpoint_mep5" , sle_mep5.text )
		SetProfileString( dir_ini + inifile_orthokis, "Photos","presentation_powerpoint_mep6" , sle_mep6.text )
		SetProfileString( dir_ini + inifile_orthokis, "Photos","presentation_powerpoint_mep7" , sle_mep7.text )
		SetProfileString( dir_ini + inifile_orthokis, "Photos","presentation_powerpoint_mep8" , sle_mep8.text )

	end if
end if


if rb_portrait.checked then
	// impression portrait
	if fileExists(sle_portrait.text) then 
		fichier_retourne = sle_portrait.text
	else
		fichier_retourne = ""
		Messagebox("ATTENTION !","Le fichier "+ libelle_soft_office+" indiqué pour réaliser cette impression (Mise en page n°1) n'existe pas (ou plus). L'impression ne peut avoir lieu !")
	end if
else
	if rb_paysage.checked then
		// impression paysage
		if fileExists(sle_paysage.text) then 
			fichier_retourne = sle_paysage.text
		else
			fichier_retourne = ""
			Messagebox("ATTENTION !","Le fichier "+ libelle_soft_office+" indiqué pour réaliser cette impression (Mise en page n°2) n'existe pas (ou plus). L'impression ne peut avoir lieu !")
		end if
	else
		if rb_mep3.checked then
			// impression mep3
			if fileExists(sle_mep3.text) then 
				fichier_retourne = sle_mep3.text
			else
				fichier_retourne = ""
				Messagebox("ATTENTION !","Le fichier "+ libelle_soft_office+" indiqué pour réaliser cette impression (Mise en page n°3) n'existe pas (ou plus). L'impression ne peut avoir lieu !")
			end if
		else
			if rb_mep4.checked then
				// impression mep4
				if fileExists(sle_mep4.text) then 
					fichier_retourne = sle_mep4.text
				else
					fichier_retourne = ""
					Messagebox("ATTENTION !","Le fichier "+ libelle_soft_office+" indiqué pour réaliser cette impression (Mise en page n°4) n'existe pas (ou plus). L'impression ne peut avoir lieu !")
				end if
			else
				
				if rb_mep5.checked then
					// impression mep5
					if fileExists(sle_mep5.text) then 
						fichier_retourne = sle_mep5.text
					else
						fichier_retourne = ""
						Messagebox("ATTENTION !","Le fichier "+ libelle_soft_office+" indiqué pour réaliser cette impression (Mise en page n°5) n'existe pas (ou plus). L'impression ne peut avoir lieu !")
					end if
				else
					if rb_mep6.checked then
						// impression mep6
						if fileExists(sle_mep6.text) then 
							fichier_retourne = sle_mep6.text
						else
							fichier_retourne = ""
							Messagebox("ATTENTION !","Le fichier "+ libelle_soft_office+" indiqué pour réaliser cette impression (Mise en page n°6) n'existe pas (ou plus). L'impression ne peut avoir lieu !")
						end if
					else
						if rb_mep7.checked then
							// impression mep7
							if fileExists(sle_mep7.text) then 
								fichier_retourne = sle_mep7.text
							else
								fichier_retourne = ""
								Messagebox("ATTENTION !","Le fichier "+ libelle_soft_office+" indiqué pour réaliser cette impression (Mise en page n°7) n'existe pas (ou plus). L'impression ne peut avoir lieu !")
							end if
						else
		
							if rb_mep8.checked then
								// impression mep8
								if fileExists(sle_mep8.text) then 
									fichier_retourne = sle_mep8.text
								else
									fichier_retourne = ""
									Messagebox("ATTENTION !","Le fichier "+ libelle_soft_office+" indiqué pour réaliser cette impression (Mise en page n°8) n'existe pas (ou plus). L'impression ne peut avoir lieu !")
								end if
							else
			
								
								
								
							end if
						end if
					end if
				end if
			end if
		end if
	end if
		
end if

		
return fichier_retourne




end function

public subroutine get_file_office (ref singlelineedit single_ligne);string ficname,ficpath
string dossier_origine
boolean v_suite = false


ficpath = dir_courriers
ficname = single_ligne.text

if soft_office = "W" or soft_office = "S"  or soft_office = "C" then 
	// .docx par défaut
	if GetFileOpenName("Courriers",ficname,ficpath,"docx","Fichiers Word (*.docx),*.docx,Fichiers Word 97 (*.doc),*.doc",dir_courriers ) = 1 then
		v_suite = true
	end if

else
	if GetFileOpenName("Présentations PowerPoint",ficname,ficpath,"ppt","Fichiers PowerPoint 97-2003 (*.ppt),*.ppt,Fichiers PowerPoint 2007-2013 (*.pptx),*.pptx",dir_courriers ) = 1 then
		v_suite = true
	end if
end if

if v_suite then
	dossier_origine = gfx_extraire_path_fichier(ficname) 
	dossier_origine = left(dossier_origine,len(dir_courriers))
	
	if upper(dossier_origine) = upper(dir_courriers) then
		single_ligne.text = ficname
	else
		Messagebox("ATTENTION","Vous devez choisir un document "  + libelle_soft_office + " dans votre dossier Courriers Types d'Orthokis ou dans un de ses sous-dossiers.")
	end if
end if
end subroutine

on w_img_imprimer.create
int iCurrent
call super::create
this.pb_imprimer=create pb_imprimer
this.pb_previ_imp=create pb_previ_imp
this.sle_paysage=create sle_paysage
this.sle_portrait=create sle_portrait
this.rb_paysage=create rb_paysage
this.rb_portrait=create rb_portrait
this.cb_annuler=create cb_annuler
this.pb_previ_email=create pb_previ_email
this.pb_email=create pb_email
this.sle_mep3=create sle_mep3
this.sle_mep4=create sle_mep4
this.rb_mep3=create rb_mep3
this.rb_mep4=create rb_mep4
this.pb_word_portrait=create pb_word_portrait
this.pb_word_paysage=create pb_word_paysage
this.pb_emp3=create pb_emp3
this.pb_mep4=create pb_mep4
this.rb_mep5=create rb_mep5
this.rb_mep6=create rb_mep6
this.rb_mep7=create rb_mep7
this.rb_mep8=create rb_mep8
this.pb_mep5=create pb_mep5
this.pb_mep6=create pb_mep6
this.pb_mep7=create pb_mep7
this.pb_mep8=create pb_mep8
this.sle_mep5=create sle_mep5
this.sle_mep6=create sle_mep6
this.sle_mep7=create sle_mep7
this.sle_mep8=create sle_mep8
this.pb_1=create pb_1
this.pb_2=create pb_2
this.pb_3=create pb_3
this.pb_8=create pb_8
this.pb_4=create pb_4
this.pb_5=create pb_5
this.pb_6=create pb_6
this.pb_7=create pb_7
this.cb_signature_en_ligne=create cb_signature_en_ligne
this.cb_signature_numerique=create cb_signature_numerique
this.gb_mise_en_page=create gb_mise_en_page
this.gb_signature=create gb_signature
this.gb_impression=create gb_impression
this.gb_email=create gb_email
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.pb_imprimer
this.Control[iCurrent+2]=this.pb_previ_imp
this.Control[iCurrent+3]=this.sle_paysage
this.Control[iCurrent+4]=this.sle_portrait
this.Control[iCurrent+5]=this.rb_paysage
this.Control[iCurrent+6]=this.rb_portrait
this.Control[iCurrent+7]=this.cb_annuler
this.Control[iCurrent+8]=this.pb_previ_email
this.Control[iCurrent+9]=this.pb_email
this.Control[iCurrent+10]=this.sle_mep3
this.Control[iCurrent+11]=this.sle_mep4
this.Control[iCurrent+12]=this.rb_mep3
this.Control[iCurrent+13]=this.rb_mep4
this.Control[iCurrent+14]=this.pb_word_portrait
this.Control[iCurrent+15]=this.pb_word_paysage
this.Control[iCurrent+16]=this.pb_emp3
this.Control[iCurrent+17]=this.pb_mep4
this.Control[iCurrent+18]=this.rb_mep5
this.Control[iCurrent+19]=this.rb_mep6
this.Control[iCurrent+20]=this.rb_mep7
this.Control[iCurrent+21]=this.rb_mep8
this.Control[iCurrent+22]=this.pb_mep5
this.Control[iCurrent+23]=this.pb_mep6
this.Control[iCurrent+24]=this.pb_mep7
this.Control[iCurrent+25]=this.pb_mep8
this.Control[iCurrent+26]=this.sle_mep5
this.Control[iCurrent+27]=this.sle_mep6
this.Control[iCurrent+28]=this.sle_mep7
this.Control[iCurrent+29]=this.sle_mep8
this.Control[iCurrent+30]=this.pb_1
this.Control[iCurrent+31]=this.pb_2
this.Control[iCurrent+32]=this.pb_3
this.Control[iCurrent+33]=this.pb_8
this.Control[iCurrent+34]=this.pb_4
this.Control[iCurrent+35]=this.pb_5
this.Control[iCurrent+36]=this.pb_6
this.Control[iCurrent+37]=this.pb_7
this.Control[iCurrent+38]=this.cb_signature_en_ligne
this.Control[iCurrent+39]=this.cb_signature_numerique
this.Control[iCurrent+40]=this.gb_mise_en_page
this.Control[iCurrent+41]=this.gb_signature
this.Control[iCurrent+42]=this.gb_impression
this.Control[iCurrent+43]=this.gb_email
end on

on w_img_imprimer.destroy
call super::destroy
destroy(this.pb_imprimer)
destroy(this.pb_previ_imp)
destroy(this.sle_paysage)
destroy(this.sle_portrait)
destroy(this.rb_paysage)
destroy(this.rb_portrait)
destroy(this.cb_annuler)
destroy(this.pb_previ_email)
destroy(this.pb_email)
destroy(this.sle_mep3)
destroy(this.sle_mep4)
destroy(this.rb_mep3)
destroy(this.rb_mep4)
destroy(this.pb_word_portrait)
destroy(this.pb_word_paysage)
destroy(this.pb_emp3)
destroy(this.pb_mep4)
destroy(this.rb_mep5)
destroy(this.rb_mep6)
destroy(this.rb_mep7)
destroy(this.rb_mep8)
destroy(this.pb_mep5)
destroy(this.pb_mep6)
destroy(this.pb_mep7)
destroy(this.pb_mep8)
destroy(this.sle_mep5)
destroy(this.sle_mep6)
destroy(this.sle_mep7)
destroy(this.sle_mep8)
destroy(this.pb_1)
destroy(this.pb_2)
destroy(this.pb_3)
destroy(this.pb_8)
destroy(this.pb_4)
destroy(this.pb_5)
destroy(this.pb_6)
destroy(this.pb_7)
destroy(this.cb_signature_en_ligne)
destroy(this.cb_signature_numerique)
destroy(this.gb_mise_en_page)
destroy(this.gb_signature)
destroy(this.gb_impression)
destroy(this.gb_email)
end on

event open;call super::open;
// En paramètre on reçoit 
// - W ou P pour Word ou Powerpoint si ouverture depuis imagerie
// - S pour Word si ouverture depuis Soins/Règlements
// - F si appel depuis soins pour Feuille de Soins 2014 (EN PRINCIPE NON CAR ON APPELLE PAS LA FENETRE)
// - C si appel depuis la comparaison intelligente

soft_office = Message.StringParm

gb_signature.backcolor = couleur_fond_fenetre	
gb_impression.backcolor = couleur_fond_fenetre	
gb_email.backcolor = couleur_fond_fenetre	

if soft_office = "W" OR soft_office = "C" then 
	
	sle_portrait.text 	= 	ProfileString( dir_ini + inifile_orthokis, "Photos","courrier_word_portrait" ,"" )
	sle_paysage.text 	=	ProfileString( dir_ini + inifile_orthokis, "Photos","courrier_word_paysage" , "" )
	sle_mep3.text 	=		ProfileString( dir_ini + inifile_orthokis, "Photos","courrier_word_mep3" , "" )
	sle_mep4.text 	=		ProfileString( dir_ini + inifile_orthokis, "Photos","courrier_word_mep4" , "" )
	sle_mep5.text 	=		ProfileString( dir_ini + inifile_orthokis, "Photos","courrier_word_mep5" , "" )
	sle_mep6.text 	=		ProfileString( dir_ini + inifile_orthokis, "Photos","courrier_word_mep6" , "" )
	sle_mep7.text 	=		ProfileString( dir_ini + inifile_orthokis, "Photos","courrier_word_mep7" , "" )
	sle_mep8.text 	=		ProfileString( dir_ini + inifile_orthokis, "Photos","courrier_word_mep8" , "" )
	libelle_soft_office = "Microsoft Word"
	this.title = "Utilisation d'Images avec " + libelle_soft_office
	
	if MON_ORTHODONTISTE or SIGNATURE_NUMERIQUE or SIGNATURE_DENTALSIGN or TEA then 
		gb_signature.visible = true
		if SIGNATURE_NUMERIQUE or SIGNATURE_DENTALSIGN then
			cb_signature_numerique.visible = true
		end if
		if MON_ORTHODONTISTE or TEA then
			cb_signature_en_ligne.visible = true
		end if
	end if
	
else
	
	
	if soft_office = "S" then 
		
		if france then 
			sle_portrait.text 	= 	ProfileString( dir_ini + inifile_orthokis, "Admini","courrier_word_mep1" , dir_courriers + "Devis Conventionnel.doc" )
		else
			sle_portrait.text 	= 	ProfileString( dir_ini + inifile_orthokis, "Admini","courrier_word_mep1" , "" )
		end if
		sle_paysage.text 	=	ProfileString( dir_ini + inifile_orthokis, "Admini","courrier_word_mep2" , "" )
		sle_mep3.text 	=		ProfileString( dir_ini + inifile_orthokis, "Admini","courrier_word_mep3" , "" )
		sle_mep4.text 	=		ProfileString( dir_ini + inifile_orthokis, "Admini","courrier_word_mep4" , "" )
		sle_mep5.text 	=		ProfileString( dir_ini + inifile_orthokis, "Admini","courrier_word_mep5" , "" )
		sle_mep6.text 	=		ProfileString( dir_ini + inifile_orthokis, "Admini","courrier_word_mep6" , "" )
		sle_mep7.text 	=		ProfileString( dir_ini + inifile_orthokis, "Admini","courrier_word_mep7" , "" )
		sle_mep8.text 	=		ProfileString( dir_ini + inifile_orthokis, "Admini","courrier_word_mep8" , "" )
		libelle_soft_office = "Microsoft Word"
		this.title = "Utilisation de soins avec " + libelle_soft_office
		
		if MON_ORTHODONTISTE or SIGNATURE_NUMERIQUE or SIGNATURE_DENTALSIGN or TEA then 
			gb_signature.visible = true
			if SIGNATURE_NUMERIQUE or SIGNATURE_DENTALSIGN then
				cb_signature_numerique.visible = true
			end if
			if MON_ORTHODONTISTE or TEA then
				cb_signature_en_ligne.visible = true
			end if
		end if	
	else
		sle_portrait.text 	= 	ProfileString( dir_ini + inifile_orthokis, "Photos","presentation_powerpoint_mep1" ,"" )
		sle_paysage.text 	=	ProfileString( dir_ini + inifile_orthokis, "Photos","presentation_powerpoint_mep2" , "" )
		sle_mep3.text 	=		ProfileString( dir_ini + inifile_orthokis, "Photos","presentation_powerpoint_mep3" , "" )
		sle_mep4.text 	=		ProfileString( dir_ini + inifile_orthokis, "Photos","presentation_powerpoint_mep4" , "" )
		sle_mep5.text 	=		ProfileString( dir_ini + inifile_orthokis, "Photos","presentation_powerpoint_mep5" , "" )
		sle_mep6.text 	=		ProfileString( dir_ini + inifile_orthokis, "Photos","presentation_powerpoint_mep6" , "" )
		sle_mep7.text 	=		ProfileString( dir_ini + inifile_orthokis, "Photos","presentation_powerpoint_mep7" , "" )
		sle_mep8.text 	=		ProfileString( dir_ini + inifile_orthokis, "Photos","presentation_powerpoint_mep8" , "" )
		gb_mise_en_page.text = "Choix du document PowerPoint utilisé (Mise en page)"
		pb_previ_email.visible = false
		pb_imprimer.text = "Diaporama"
		pb_email.visible = false
		gb_email.visible = false
		libelle_soft_office = "Microsoft PowerPoint"
		this.title = "Utilisation d'Images avec " + libelle_soft_office
		
		// Pas de signature pour PowerPoint
		
		gb_signature.visible  = false		
		cb_signature_numerique.visible  = false		
		cb_signature_en_ligne.visible  = false		
	end if
		
	end if

colore_tous_objets_window(this, couleur_fond_fenetre)

//centrer(this)

end event

type p_fond from w_fenetre_arakis`p_fond within w_img_imprimer
end type

type pb_imprimer from uo_picturebutton_780x120 within w_img_imprimer
integer x = 722
integer y = 2376
integer width = 594
integer taborder = 70
string text = "Directe"
string iconname = "ACTIONS_imprimer.png"
end type

event clicked;call super::clicked;
str_image_impression img

img.fichier_word = imprimer()
img.service_word = Service_MajEtImprime


closeWithReturn(parent, img)
end event

type pb_previ_imp from uo_picturebutton_780x120 within w_img_imprimer
integer x = 722
integer y = 2212
integer width = 594
integer taborder = 60
string text = "Aperçu"
string iconname = "ACTIONS_word_apercu.png"
end type

event clicked;call super::clicked;str_image_impression img

img.fichier_word = imprimer()
img.service_word = Service_MajEtVisualise

closeWithReturn(parent, img)


end event

type sle_paysage from singlelineedit within w_img_imprimer
integer x = 82
integer y = 468
integer width = 2839
integer height = 112
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean enabled = false
borderstyle borderstyle = stylelowered!
end type

type sle_portrait from singlelineedit within w_img_imprimer
integer x = 82
integer y = 224
integer width = 2839
integer height = 112
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean enabled = false
borderstyle borderstyle = stylelowered!
end type

type rb_paysage from radiobutton within w_img_imprimer
integer x = 64
integer y = 372
integer width = 603
integer height = 80
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 15780518
string text = "Mise en page N°2"
end type

type rb_portrait from radiobutton within w_img_imprimer
integer x = 64
integer y = 128
integer width = 608
integer height = 80
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 15780518
string text = "Mise en page N°1"
boolean checked = true
end type

type cb_annuler from uo_picturebutton_390x120 within w_img_imprimer
integer x = 18
integer y = 2264
integer width = 594
integer taborder = 50
string text = "&Annuler"
string iconname = "ACTIONS_abandonner.png"
end type

event clicked;call super::clicked;
closewithreturn( parent, "" )

end event

type pb_previ_email from uo_picturebutton_780x120 within w_img_imprimer
integer x = 1518
integer y = 2212
integer width = 594
integer taborder = 10
boolean bringtotop = true
string text = "Aperçu"
string iconname = "ACTIONS_word_apercu.png"
end type

event clicked;call super::clicked;str_image_impression img

img.fichier_word = imprimer()
img.service_word = Service_MajVisualiseEtEmail


closeWithReturn(parent, img)

end event

type pb_email from uo_picturebutton_780x120 within w_img_imprimer
integer x = 1518
integer y = 2376
integer width = 594
integer taborder = 80
boolean bringtotop = true
string text = "Envoi Direct"
string iconname = "lc_envoi_message.png"
end type

event rbuttondown;call super::rbuttondown;//routine_word(Service_MajEtEmail, true)
//tv_courriers.SetFocus()
end event

event clicked;call super::clicked;//

str_image_impression img

img.fichier_word = imprimer()
img.service_word = Service_MajEtEmail

closeWithReturn(parent, img)

end event

type sle_mep3 from singlelineedit within w_img_imprimer
integer x = 82
integer y = 712
integer width = 2839
integer height = 112
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean enabled = false
borderstyle borderstyle = stylelowered!
end type

type sle_mep4 from singlelineedit within w_img_imprimer
integer x = 82
integer y = 956
integer width = 2839
integer height = 112
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean enabled = false
borderstyle borderstyle = stylelowered!
end type

type rb_mep3 from radiobutton within w_img_imprimer
integer x = 64
integer y = 616
integer width = 603
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 15780518
string text = "Mise en page N°3"
end type

type rb_mep4 from radiobutton within w_img_imprimer
integer x = 64
integer y = 860
integer width = 603
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 15780518
string text = "Mise en page N°4"
end type

type pb_word_portrait from picturebutton within w_img_imprimer
integer x = 2802
integer y = 116
integer width = 119
integer height = 104
integer taborder = 50
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Eras Demi ITC"
string picturename = "lc_explorer.png"
string disabledname = "lc_explorer.png"
end type

event clicked;

get_file_office(sle_portrait)


end event

type pb_word_paysage from picturebutton within w_img_imprimer
integer x = 2802
integer y = 360
integer width = 119
integer height = 104
integer taborder = 40
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Eras Demi ITC"
string picturename = "lc_explorer.png"
string disabledname = "lc_explorer.png"
end type

event clicked;
get_file_office(sle_paysage)
end event

type pb_emp3 from picturebutton within w_img_imprimer
integer x = 2802
integer y = 604
integer width = 119
integer height = 104
integer taborder = 50
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Eras Demi ITC"
string picturename = "lc_explorer.png"
string disabledname = "lc_explorer.png"
end type

event clicked;
get_file_office(sle_mep3)
end event

type pb_mep4 from picturebutton within w_img_imprimer
integer x = 2802
integer y = 848
integer width = 119
integer height = 104
integer taborder = 60
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Eras Demi ITC"
string picturename = "lc_explorer.png"
string disabledname = "lc_explorer.png"
end type

event clicked;
get_file_office(sle_mep4)
end event

type rb_mep5 from radiobutton within w_img_imprimer
integer x = 64
integer y = 1104
integer width = 603
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 15780518
string text = "Mise en page N°5"
end type

type rb_mep6 from radiobutton within w_img_imprimer
integer x = 64
integer y = 1348
integer width = 603
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 15780518
string text = "Mise en page N°6"
end type

type rb_mep7 from radiobutton within w_img_imprimer
integer x = 64
integer y = 1592
integer width = 603
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 15780518
string text = "Mise en page N°7"
end type

type rb_mep8 from radiobutton within w_img_imprimer
integer x = 64
integer y = 1836
integer width = 603
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 15780518
string text = "Mise en page N°8"
end type

type pb_mep5 from picturebutton within w_img_imprimer
integer x = 2802
integer y = 1092
integer width = 119
integer height = 104
integer taborder = 70
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Eras Demi ITC"
string picturename = "lc_explorer.png"
string disabledname = "lc_explorer.png"
end type

event clicked;get_file_office(sle_mep5)
end event

type pb_mep6 from picturebutton within w_img_imprimer
integer x = 2802
integer y = 1336
integer width = 119
integer height = 104
integer taborder = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Eras Demi ITC"
string picturename = "lc_explorer.png"
string disabledname = "lc_explorer.png"
end type

event clicked;get_file_office(sle_mep6)
end event

type pb_mep7 from picturebutton within w_img_imprimer
integer x = 2802
integer y = 1580
integer width = 119
integer height = 104
integer taborder = 90
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Eras Demi ITC"
string picturename = "lc_explorer.png"
string disabledname = "lc_explorer.png"
end type

event clicked;get_file_office(sle_mep7)
end event

type pb_mep8 from picturebutton within w_img_imprimer
integer x = 2802
integer y = 1824
integer width = 119
integer height = 104
integer taborder = 100
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Eras Demi ITC"
string picturename = "lc_explorer.png"
string disabledname = "lc_explorer.png"
end type

event clicked;get_file_office(sle_mep8)
end event

type sle_mep5 from singlelineedit within w_img_imprimer
integer x = 82
integer y = 1200
integer width = 2839
integer height = 112
integer taborder = 70
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean enabled = false
borderstyle borderstyle = stylelowered!
end type

type sle_mep6 from singlelineedit within w_img_imprimer
integer x = 82
integer y = 1444
integer width = 2839
integer height = 112
integer taborder = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean enabled = false
borderstyle borderstyle = stylelowered!
end type

type sle_mep7 from singlelineedit within w_img_imprimer
integer x = 82
integer y = 1688
integer width = 2839
integer height = 112
integer taborder = 90
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean enabled = false
borderstyle borderstyle = stylelowered!
end type

type sle_mep8 from singlelineedit within w_img_imprimer
integer x = 82
integer y = 1932
integer width = 2839
integer height = 112
integer taborder = 100
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean enabled = false
borderstyle borderstyle = stylelowered!
end type

type pb_1 from picturebutton within w_img_imprimer
integer x = 2679
integer y = 116
integer width = 119
integer height = 104
integer taborder = 30
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Eras Demi ITC"
string picturename = "lc_poubelle.png"
string disabledname = "lc_explorer.png"
end type

event clicked;

sle_portrait.text = ""


if soft_office = "W" OR soft_office = "C" then 
	SetProfileString( dir_ini + inifile_orthokis, "Photos","courrier_word_portrait" ,"" )
else
	if soft_office = "S" then 
		SetProfileString( dir_ini + inifile_orthokis, "Admini","courrier_word_mep1" , "" )
	else
		SetProfileString( dir_ini + inifile_orthokis, "Photos","presentation_powerpoint_mep1" ,"" )
	end if
end if


end event

type pb_2 from picturebutton within w_img_imprimer
integer x = 2679
integer y = 360
integer width = 119
integer height = 104
integer taborder = 50
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Eras Demi ITC"
string picturename = "lc_poubelle.png"
string disabledname = "lc_explorer.png"
end type

event clicked;

sle_paysage.text = ""

if soft_office = "W" OR soft_office = "C" then 
	SetProfileString( dir_ini + inifile_orthokis, "Photos","courrier_word_paysage" ,"" )
else
	if soft_office = "S" then 
		SetProfileString( dir_ini + inifile_orthokis, "Admini","courrier_word_mep2" , "" )
	else
		SetProfileString( dir_ini + inifile_orthokis, "Photos","presentation_powerpoint_mep2" ,"" )
	end if
end if

end event

type pb_3 from picturebutton within w_img_imprimer
integer x = 2679
integer y = 604
integer width = 119
integer height = 104
integer taborder = 60
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Eras Demi ITC"
string picturename = "lc_poubelle.png"
string disabledname = "lc_explorer.png"
end type

event clicked;

sle_mep3.text = ""

if soft_office = "W" OR soft_office = "C" then 
	SetProfileString( dir_ini + inifile_orthokis, "Photos","courrier_word_mep3" ,"" )
else
	if soft_office = "S" then 
		SetProfileString( dir_ini + inifile_orthokis, "Admini","courrier_word_mep3" , "" )
	else
		SetProfileString( dir_ini + inifile_orthokis, "Photos","presentation_powerpoint_mep3" ,"" )
	end if
end if


end event

type pb_8 from picturebutton within w_img_imprimer
integer x = 2679
integer y = 848
integer width = 119
integer height = 104
integer taborder = 70
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Eras Demi ITC"
string picturename = "lc_poubelle.png"
string disabledname = "lc_explorer.png"
end type

event clicked;
sle_mep4.text = ""
if soft_office = "W" OR soft_office = "C" then 
	SetProfileString( dir_ini + inifile_orthokis, "Photos","courrier_word_mep4" ,"" )
else
	if soft_office = "S" then 
		SetProfileString( dir_ini + inifile_orthokis, "Admini","courrier_word_mep4" , "" )
	else
		SetProfileString( dir_ini + inifile_orthokis, "Photos","presentation_powerpoint_mep4" ,"" )
	end if
end if

end event

type pb_4 from picturebutton within w_img_imprimer
integer x = 2679
integer y = 1092
integer width = 119
integer height = 104
integer taborder = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Eras Demi ITC"
string picturename = "lc_poubelle.png"
string disabledname = "lc_explorer.png"
end type

event clicked;
sle_mep5.text = ""
if soft_office = "W" OR soft_office = "C" then 
	SetProfileString( dir_ini + inifile_orthokis, "Photos","courrier_word_mep5" ,"" )
else
	if soft_office = "S" then 
		SetProfileString( dir_ini + inifile_orthokis, "Admini","courrier_word_mep5" , "" )
	else
		SetProfileString( dir_ini + inifile_orthokis, "Photos","presentation_powerpoint_mep5" ,"" )
	end if
end if

end event

type pb_5 from picturebutton within w_img_imprimer
integer x = 2679
integer y = 1336
integer width = 119
integer height = 104
integer taborder = 90
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Eras Demi ITC"
string picturename = "lc_poubelle.png"
string disabledname = "lc_explorer.png"
end type

event clicked;
sle_mep6.text = ""
if soft_office = "W" OR soft_office = "C" then 
	SetProfileString( dir_ini + inifile_orthokis, "Photos","courrier_word_mep6" ,"" )
else
	if soft_office = "S" then 
		SetProfileString( dir_ini + inifile_orthokis, "Admini","courrier_word_mep6" , "" )
	else
		SetProfileString( dir_ini + inifile_orthokis, "Photos","presentation_powerpoint_mep6" ,"" )
	end if
end if

end event

type pb_6 from picturebutton within w_img_imprimer
integer x = 2679
integer y = 1580
integer width = 119
integer height = 104
integer taborder = 100
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Eras Demi ITC"
string picturename = "lc_poubelle.png"
string disabledname = "lc_explorer.png"
end type

event clicked;
sle_mep7.text = ""
if soft_office = "W" OR soft_office = "C" then 
	SetProfileString( dir_ini + inifile_orthokis, "Photos","courrier_word_mep7" ,"" )
else
	if soft_office = "S" then 
		SetProfileString( dir_ini + inifile_orthokis, "Admini","courrier_word_mep7" , "" )
	else
		SetProfileString( dir_ini + inifile_orthokis, "Photos","presentation_powerpoint_mep7" ,"" )
	end if
end if

end event

type pb_7 from picturebutton within w_img_imprimer
integer x = 2679
integer y = 1824
integer width = 119
integer height = 104
integer taborder = 110
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Eras Demi ITC"
string picturename = "lc_poubelle.png"
string disabledname = "lc_explorer.png"
end type

event clicked;
sle_mep8.text = ""
if soft_office = "W" OR soft_office = "C" then 
	SetProfileString( dir_ini + inifile_orthokis, "Photos","courrier_word_mep8" ,"" )
else
	if soft_office = "S" then 
		SetProfileString( dir_ini + inifile_orthokis, "Admini","courrier_word_mep8" , "" )
	else
		SetProfileString( dir_ini + inifile_orthokis, "Photos","presentation_powerpoint_mep8" ,"" )
	end if
end if

end event

type cb_signature_en_ligne from uo_picturebutton_780x120 within w_img_imprimer
boolean visible = false
integer x = 2313
integer y = 2376
integer width = 594
integer taborder = 20
boolean bringtotop = true
fontcharset fontcharset = ansi!
string text = "En Ligne"
string iconname = "lc_signature_16.png"
end type

event clicked;call super::clicked;str_image_impression img

img.fichier_word = imprimer()
img.service_word = Service_SigneEnLigne


closeWithReturn(parent, img)

end event

type cb_signature_numerique from uo_picturebutton_780x120 within w_img_imprimer
boolean visible = false
integer x = 2313
integer y = 2212
integer width = 594
integer taborder = 30
boolean bringtotop = true
string text = "Numérique"
string iconname = "ACTIONS_word_signature_locale.png"
end type

event clicked;call super::clicked;str_image_impression img

img.fichier_word = imprimer()

if SIGNATURE_NUMERIQUE then 
	img.service_word = Service_MajEtSigne
else
	if SIGNATURE_DENTALSIGN then
		img.service_word = Service_SigneEnLigne
	end if
end if

closeWithReturn(parent, img)


end event

type gb_mise_en_page from groupbox within w_img_imprimer
integer x = 23
integer y = 36
integer width = 2949
integer height = 2056
integer taborder = 20
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean italic = true
long backcolor = 15780518
string text = "Choix du document Word utilisé (Mise en page)"
end type

type gb_signature from groupbox within w_img_imprimer
boolean visible = false
integer x = 2240
integer y = 2108
integer width = 745
integer height = 456
integer taborder = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean italic = true
long textcolor = 33554432
long backcolor = 67108864
string text = "Signature"
end type

type gb_impression from groupbox within w_img_imprimer
integer x = 649
integer y = 2108
integer width = 745
integer height = 456
integer taborder = 90
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean italic = true
long textcolor = 33554432
long backcolor = 67108864
string text = "Impression"
end type

type gb_email from groupbox within w_img_imprimer
integer x = 1445
integer y = 2108
integer width = 745
integer height = 456
integer taborder = 90
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean italic = true
long textcolor = 33554432
long backcolor = 67108864
string text = "Email"
end type

