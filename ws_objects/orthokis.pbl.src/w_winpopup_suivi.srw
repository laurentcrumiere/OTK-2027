$PBExportHeader$w_winpopup_suivi.srw
forward
global type w_winpopup_suivi from w_fenetre_arakis
end type
type gb_8 from groupbox within w_winpopup_suivi
end type
type cb_imprimer from uo_picturebutton_390x120 within w_winpopup_suivi
end type
type cb_autre from uo_picturebutton_390x120 within w_winpopup_suivi
end type
type cb_fermer from uo_picturebutton_390x120_fermer within w_winpopup_suivi
end type
type cb_ecran from uo_picturebutton_390x120 within w_winpopup_suivi
end type
type cb_lien_word from uo_picturebutton_780x120 within w_winpopup_suivi
end type
type uo_size from resize_fenetre within w_winpopup_suivi
end type
type em_nb from editmask within w_winpopup_suivi
end type
type dw_1 from datawindow within w_winpopup_suivi
end type
type dw_prati from datawindow within w_winpopup_suivi
end type
type rb_emission_ce_poste from radiobutton within w_winpopup_suivi
end type
type rb_emission_un_autre_poste from radiobutton within w_winpopup_suivi
end type
type rb_emission_tous_les_postes from radiobutton within w_winpopup_suivi
end type
type ddlb_emission_liste_postes from dropdownlistbox within w_winpopup_suivi
end type
type rb_emission_cet_utilisateur from radiobutton within w_winpopup_suivi
end type
type rb_emission_un_autre_utilisateur from radiobutton within w_winpopup_suivi
end type
type dw_emission_utilisateurs from datawindow within w_winpopup_suivi
end type
type rb_emission_tous_les_utilisateurs from radiobutton within w_winpopup_suivi
end type
type st_3 from statictext within w_winpopup_suivi
end type
type em_emission_date_min from uo_date_calendrier within w_winpopup_suivi
end type
type em_emission_time_min from editmask within w_winpopup_suivi
end type
type st_2 from statictext within w_winpopup_suivi
end type
type em_emission_date_max from uo_date_calendrier within w_winpopup_suivi
end type
type em_emission_time_max from editmask within w_winpopup_suivi
end type
type rb_reception_ce_poste from radiobutton within w_winpopup_suivi
end type
type rb_reception_un_autre_poste from radiobutton within w_winpopup_suivi
end type
type rb_reception_tous_les_postes from radiobutton within w_winpopup_suivi
end type
type ddlb_reception_liste_postes from dropdownlistbox within w_winpopup_suivi
end type
type rb_reception_cet_utilisateur from radiobutton within w_winpopup_suivi
end type
type rb_reception_un_autre_utilisateur from radiobutton within w_winpopup_suivi
end type
type rb_reception_tous_les_utilisateur from radiobutton within w_winpopup_suivi
end type
type dw_reception_utilisateurs from datawindow within w_winpopup_suivi
end type
type sle_texte_message from singlelineedit within w_winpopup_suivi
end type
type cbx_filtre from u_cst_togglebutton within w_winpopup_suivi
end type
type gb_2 from groupbox within w_winpopup_suivi
end type
type gb_3 from groupbox within w_winpopup_suivi
end type
type gb_1 from groupbox within w_winpopup_suivi
end type
type gb_5 from groupbox within w_winpopup_suivi
end type
type gb_6 from groupbox within w_winpopup_suivi
end type
type gb_4 from groupbox within w_winpopup_suivi
end type
type gb_7 from groupbox within w_winpopup_suivi
end type
type dw_liste from u_basedw within w_winpopup_suivi
end type
end forward

global type w_winpopup_suivi from w_fenetre_arakis
integer x = 27
integer y = 200
integer width = 4503
integer height = 2868
string title = "Suivi de l~'envoi des Messages Internes"
windowtype windowtype = child!
gb_8 gb_8
cb_imprimer cb_imprimer
cb_autre cb_autre
cb_fermer cb_fermer
cb_ecran cb_ecran
cb_lien_word cb_lien_word
uo_size uo_size
em_nb em_nb
dw_1 dw_1
dw_prati dw_prati
rb_emission_ce_poste rb_emission_ce_poste
rb_emission_un_autre_poste rb_emission_un_autre_poste
rb_emission_tous_les_postes rb_emission_tous_les_postes
ddlb_emission_liste_postes ddlb_emission_liste_postes
rb_emission_cet_utilisateur rb_emission_cet_utilisateur
rb_emission_un_autre_utilisateur rb_emission_un_autre_utilisateur
dw_emission_utilisateurs dw_emission_utilisateurs
rb_emission_tous_les_utilisateurs rb_emission_tous_les_utilisateurs
st_3 st_3
em_emission_date_min em_emission_date_min
em_emission_time_min em_emission_time_min
st_2 st_2
em_emission_date_max em_emission_date_max
em_emission_time_max em_emission_time_max
rb_reception_ce_poste rb_reception_ce_poste
rb_reception_un_autre_poste rb_reception_un_autre_poste
rb_reception_tous_les_postes rb_reception_tous_les_postes
ddlb_reception_liste_postes ddlb_reception_liste_postes
rb_reception_cet_utilisateur rb_reception_cet_utilisateur
rb_reception_un_autre_utilisateur rb_reception_un_autre_utilisateur
rb_reception_tous_les_utilisateur rb_reception_tous_les_utilisateur
dw_reception_utilisateurs dw_reception_utilisateurs
sle_texte_message sle_texte_message
cbx_filtre cbx_filtre
gb_2 gb_2
gb_3 gb_3
gb_1 gb_1
gb_5 gb_5
gb_6 gb_6
gb_4 gb_4
gb_7 gb_7
dw_liste dw_liste
end type
global w_winpopup_suivi w_winpopup_suivi

type variables
boolean prepa_faite
double increment	
double nb_dossier

double min, max,max_row


// pour savoir si on est livre ou pas
boolean v_deverrouille = false

string v_ce_poste

n_cst_PowerFilter iu_PowerFilter


end variables

forward prototypes
public subroutine prepa ()
public subroutine traitement_word (integer tab_type[], ref datawindow ldatawin)
public function boolean is_deverrouille ()
public subroutine remplir_liste_postes (dropdownlistbox liste_postes, date date_limite)
end prototypes

public subroutine prepa ();string v_emission_poste_min, v_emission_poste_max
string v_emission_user_min, v_emission_user_max
datetime v_emission_date_heure_min, v_emission_date_heure_max

string v_reception_poste_min, v_reception_poste_max
string v_reception_user_min, v_reception_user_max

if not prepa_faite then
	
	open(w_patience)
	
	
	if rb_emission_ce_poste.checked  then
		v_emission_poste_min = v_ce_poste
		v_emission_poste_max = v_ce_poste
	else
		if rb_emission_un_autre_poste.checked then
			v_emission_poste_min = ddlb_emission_liste_postes.text
			v_emission_poste_max = v_emission_poste_min
		else
			v_emission_poste_min = ""
			v_emission_poste_max = "ZZZZZZZZZZZZZZZ"
		end if
	end if
	
	if rb_emission_cet_utilisateur.checked then
		v_emission_user_min = utilisateur_code
		v_emission_user_max = utilisateur_code
	else
		if rb_emission_un_autre_utilisateur.checked then
			v_emission_user_min = dw_emission_utilisateurs.gettext()
			v_emission_user_max = v_emission_user_min
		else
			v_emission_user_min = ""
			v_emission_user_max = "ZZZZZZZZZZZZZZ"
		end if
	end if
	
	
	// La réception doit être gérée avec des filtres car on sait pas si on reçoit ou pas !!!!
	
	string v_filtre = ""
	
	 v_filtre = ""
	

	if rb_reception_ce_poste.checked  then
		v_filtre = "poste_recepteur = '" + v_ce_poste + "'"
	else
		if rb_reception_ce_poste.checked then
			v_filtre = "poste_recepteur = '" + ddlb_reception_liste_postes.text + "'"
		end if
	end if

	if rb_reception_cet_utilisateur.checked then
		if len(v_filtre) > 0 then
			v_filtre = v_filtre + " and "
		end if
		v_filtre = v_filtre + "user_recepteur = '" + utilisateur_code + "'"
	else
		if rb_reception_un_autre_utilisateur.checked then
			if len(v_filtre) > 0 then
				v_filtre = v_filtre + " and "
			end if
			v_filtre = v_filtre + "user_recepteur = '" + dw_reception_utilisateurs.gettext() + "'"
		end if
	end if
	
	v_emission_date_heure_min = datetime(em_emission_date_min.GetTheDate(), time(em_emission_time_min.text))
	v_emission_date_heure_max = datetime(em_emission_date_max.GetTheDate(), time(em_emission_time_max.text))
	
	dw_liste.setfilter(v_filtre)
	dw_liste.filter()
	
	dw_liste.retrieve(v_emission_poste_min,v_emission_poste_max,v_emission_user_min,v_emission_user_max, v_emission_date_heure_min, v_emission_date_heure_max, sle_texte_message.text)
	close(w_patience)

//	em_nb.text = string(dw_liste.rowcount())+" Messages"
//	em_nb.visible = true
	
	
end if

end subroutine

public subroutine traitement_word (integer tab_type[], ref datawindow ldatawin);uo_lien_word	luo
string			lcourrier[]
string			lchemin[]
int				i = 0
boolean			un_pb = false
string			rep_courrier


if ldatawin.AcceptText() = 1 then
// si pas de pb pour valider la dernière modif
// éventuelle de l'utilisateur -> on poursuit

	open(w_patience)
	
	// on alloue la mémoire
	luo = create uo_lien_word
	
	// recup du chemin courrier
	rep_courrier = fxg_get_rep_courriers()
	
	do 
		// maj var de boucle
		i++
		// on retrouve le nom du fichier de ce type de courrier (cf var globales)
		lcourrier[i] = luo.get_courrier(tab_type[i])
		// récup du chemin du courrier
		// -> pour l'instant obligation d'être ds racine rep courrier
		lchemin[i] = rep_courrier
		// si l'un des nom est vide -> on l'indique
		if lcourrier[i] = "" then un_pb = true
		
	// on boucle tant qu'il y a des types de courrier différents
	// ET que pas d'erreur rencotrée
	loop while i < upperbound(tab_type) AND not un_pb
	
	if not un_pb then
	// si on a bien retrouvé tous les courriers pour ce type de lettre
		// on lance le traitement par word
		if not PLANIFICATION_EN_COURS then
			if luo.traiter_avec_word( courriers_word_type_impr( ), lcourrier, ldatawin, lchemin,false) = -1 then
			// un pb est rencontré
				messagebox("Erreur","Un problème est survenu durant l'opération,~n impossible de poursuivre !", StopSign!)
			end if
		else
			// on forme une impression directe
			if luo.traiter_avec_word( Service_MajEtImprime , lcourrier, ldatawin, lchemin,false) = -1 then
				// Pas de message d'erreur durant la planification des actions 
				fxg_ajout_journal_planification('DEP', "L'impression des Lettres Word n'a pas pu être effectuée. Une erreur est survenue durant l'opération.")
			end if
		end if
	else
	// pas de courrier trouvé -> msg d'erreur
		if not PLANIFICATION_EN_COURS then
			messagebox("ATTENTION", "Il faut avant tout indiquer un/des fichier(s) au format ~nMicrosoft WORD pour ce(s) courrier(s) (menu 'Impression', 'Courriers Word', 'Paramètres Publipostage').~n~nImpossible de poursuivre !", Exclamation!)
			fxg_ajout_journal_planification('DEP', "L'impression des Lettres Word n'a pas pu être effectuée. Courrier Word non spécifié.")
		end if
	end if
	
	// libération mémoire
	destroy luo
	
	close(w_patience)
	
else
// si un pb sur le accepttext -> msg d'erreur
	messagebox("Erreur","Impossible de poursuivre ! ~n~nUne des valeurs que vous venez de rentrer ~nest incorrect !", StopSign!)
end if
end subroutine

public function boolean is_deverrouille ();

if v_deverrouille then
	return true
else
	ok_mdp = false

	guo_fenetre_modale.wf_ouvrir(w_mot_passe_administrateur)

	if ok_mdp then 
		 v_deverrouille = true
		 return true
	else
		return false
	end if
end if
end function

public subroutine remplir_liste_postes (dropdownlistbox liste_postes, date date_limite);// Fonction qui alimente la liste des ordinateurs connectés à Orthokis
// On ne prend que les connestés depuis la date passée en paramètre

string v_mycomputer_name, v_nom_poste

DECLARE cur_postes CURSOR FOR SELECT DISTINCT nom_poste FROM connexions 
WHERE derniere_connexion >= :date_limite and nom_poste <> :v_mycomputer_name  
ORDER BY nom_poste ;

uo_infos_systeme  uo_infos
uo_infos = create uo_infos_systeme

v_mycomputer_name = uo_infos.of_get_my_computername()


liste_postes.reset()

open cur_postes ;

fetch cur_postes into :v_nom_poste ;

do while sqlca.sqlcode = 0
	
//	if upper(trim(v_nom_poste)) <>  upper(trim(v_mycomputer_name)) then
		liste_postes.additem(v_nom_poste)
//	end if
	
	fetch cur_postes into :v_nom_poste ;

loop


close cur_postes ;
end subroutine

on w_winpopup_suivi.create
int iCurrent
call super::create
this.gb_8=create gb_8
this.cb_imprimer=create cb_imprimer
this.cb_autre=create cb_autre
this.cb_fermer=create cb_fermer
this.cb_ecran=create cb_ecran
this.cb_lien_word=create cb_lien_word
this.uo_size=create uo_size
this.em_nb=create em_nb
this.dw_1=create dw_1
this.dw_prati=create dw_prati
this.rb_emission_ce_poste=create rb_emission_ce_poste
this.rb_emission_un_autre_poste=create rb_emission_un_autre_poste
this.rb_emission_tous_les_postes=create rb_emission_tous_les_postes
this.ddlb_emission_liste_postes=create ddlb_emission_liste_postes
this.rb_emission_cet_utilisateur=create rb_emission_cet_utilisateur
this.rb_emission_un_autre_utilisateur=create rb_emission_un_autre_utilisateur
this.dw_emission_utilisateurs=create dw_emission_utilisateurs
this.rb_emission_tous_les_utilisateurs=create rb_emission_tous_les_utilisateurs
this.st_3=create st_3
this.em_emission_date_min=create em_emission_date_min
this.em_emission_time_min=create em_emission_time_min
this.st_2=create st_2
this.em_emission_date_max=create em_emission_date_max
this.em_emission_time_max=create em_emission_time_max
this.rb_reception_ce_poste=create rb_reception_ce_poste
this.rb_reception_un_autre_poste=create rb_reception_un_autre_poste
this.rb_reception_tous_les_postes=create rb_reception_tous_les_postes
this.ddlb_reception_liste_postes=create ddlb_reception_liste_postes
this.rb_reception_cet_utilisateur=create rb_reception_cet_utilisateur
this.rb_reception_un_autre_utilisateur=create rb_reception_un_autre_utilisateur
this.rb_reception_tous_les_utilisateur=create rb_reception_tous_les_utilisateur
this.dw_reception_utilisateurs=create dw_reception_utilisateurs
this.sle_texte_message=create sle_texte_message
this.cbx_filtre=create cbx_filtre
this.gb_2=create gb_2
this.gb_3=create gb_3
this.gb_1=create gb_1
this.gb_5=create gb_5
this.gb_6=create gb_6
this.gb_4=create gb_4
this.gb_7=create gb_7
this.dw_liste=create dw_liste
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.gb_8
this.Control[iCurrent+2]=this.cb_imprimer
this.Control[iCurrent+3]=this.cb_autre
this.Control[iCurrent+4]=this.cb_fermer
this.Control[iCurrent+5]=this.cb_ecran
this.Control[iCurrent+6]=this.cb_lien_word
this.Control[iCurrent+7]=this.uo_size
this.Control[iCurrent+8]=this.em_nb
this.Control[iCurrent+9]=this.dw_1
this.Control[iCurrent+10]=this.dw_prati
this.Control[iCurrent+11]=this.rb_emission_ce_poste
this.Control[iCurrent+12]=this.rb_emission_un_autre_poste
this.Control[iCurrent+13]=this.rb_emission_tous_les_postes
this.Control[iCurrent+14]=this.ddlb_emission_liste_postes
this.Control[iCurrent+15]=this.rb_emission_cet_utilisateur
this.Control[iCurrent+16]=this.rb_emission_un_autre_utilisateur
this.Control[iCurrent+17]=this.dw_emission_utilisateurs
this.Control[iCurrent+18]=this.rb_emission_tous_les_utilisateurs
this.Control[iCurrent+19]=this.st_3
this.Control[iCurrent+20]=this.em_emission_date_min
this.Control[iCurrent+21]=this.em_emission_time_min
this.Control[iCurrent+22]=this.st_2
this.Control[iCurrent+23]=this.em_emission_date_max
this.Control[iCurrent+24]=this.em_emission_time_max
this.Control[iCurrent+25]=this.rb_reception_ce_poste
this.Control[iCurrent+26]=this.rb_reception_un_autre_poste
this.Control[iCurrent+27]=this.rb_reception_tous_les_postes
this.Control[iCurrent+28]=this.ddlb_reception_liste_postes
this.Control[iCurrent+29]=this.rb_reception_cet_utilisateur
this.Control[iCurrent+30]=this.rb_reception_un_autre_utilisateur
this.Control[iCurrent+31]=this.rb_reception_tous_les_utilisateur
this.Control[iCurrent+32]=this.dw_reception_utilisateurs
this.Control[iCurrent+33]=this.sle_texte_message
this.Control[iCurrent+34]=this.cbx_filtre
this.Control[iCurrent+35]=this.gb_2
this.Control[iCurrent+36]=this.gb_3
this.Control[iCurrent+37]=this.gb_1
this.Control[iCurrent+38]=this.gb_5
this.Control[iCurrent+39]=this.gb_6
this.Control[iCurrent+40]=this.gb_4
this.Control[iCurrent+41]=this.gb_7
this.Control[iCurrent+42]=this.dw_liste
end on

on w_winpopup_suivi.destroy
call super::destroy
destroy(this.gb_8)
destroy(this.cb_imprimer)
destroy(this.cb_autre)
destroy(this.cb_fermer)
destroy(this.cb_ecran)
destroy(this.cb_lien_word)
destroy(this.uo_size)
destroy(this.em_nb)
destroy(this.dw_1)
destroy(this.dw_prati)
destroy(this.rb_emission_ce_poste)
destroy(this.rb_emission_un_autre_poste)
destroy(this.rb_emission_tous_les_postes)
destroy(this.ddlb_emission_liste_postes)
destroy(this.rb_emission_cet_utilisateur)
destroy(this.rb_emission_un_autre_utilisateur)
destroy(this.dw_emission_utilisateurs)
destroy(this.rb_emission_tous_les_utilisateurs)
destroy(this.st_3)
destroy(this.em_emission_date_min)
destroy(this.em_emission_time_min)
destroy(this.st_2)
destroy(this.em_emission_date_max)
destroy(this.em_emission_time_max)
destroy(this.rb_reception_ce_poste)
destroy(this.rb_reception_un_autre_poste)
destroy(this.rb_reception_tous_les_postes)
destroy(this.ddlb_reception_liste_postes)
destroy(this.rb_reception_cet_utilisateur)
destroy(this.rb_reception_un_autre_utilisateur)
destroy(this.rb_reception_tous_les_utilisateur)
destroy(this.dw_reception_utilisateurs)
destroy(this.sle_texte_message)
destroy(this.cbx_filtre)
destroy(this.gb_2)
destroy(this.gb_3)
destroy(this.gb_1)
destroy(this.gb_5)
destroy(this.gb_6)
destroy(this.gb_4)
destroy(this.gb_7)
destroy(this.dw_liste)
end on

event open;call super::open;
open(w_patience)


// utilisateurs
dw_emission_utilisateurs.settransobject(sqlca)
dw_emission_utilisateurs.retrieve()
dw_reception_utilisateurs.settransobject(sqlca)
dw_reception_utilisateurs.retrieve()

// Postes connectés
date v_date_limite 
v_date_limite = relativedate(today(),-365)

remplir_liste_postes ( ddlb_emission_liste_postes , v_date_limite )
remplir_liste_postes ( ddlb_reception_liste_postes , v_date_limite )

// Ce poste
v_ce_poste = trim(get_nom_ordinateur())
rb_emission_ce_poste.text = "Ce poste ("+v_ce_poste+")"
rb_reception_ce_poste.text = "Ce poste ("+v_ce_poste+")"

// Cet utilisateur
rb_reception_cet_utilisateur.text = "Cet utilisateur ("+ utilisateur_nom  +")"
rb_emission_cet_utilisateur.text = "Cet utilisateur ("+ utilisateur_nom  +")"


// dates
em_emission_date_min.SetDate(today())
em_emission_date_max.SetDate(today())


dw_emission_utilisateurs.settransobject(sqlca)
dw_emission_utilisateurs.retrieve()
dw_reception_utilisateurs.settransobject(sqlca)
dw_reception_utilisateurs.retrieve()

dw_liste.settransobject(sqlca)
cbx_filtre.backcolor = this.backcolor
uo_size.taille(this)
prepa_faite = false
close(w_patience)

end event

event resize;uo_size.retaille(this)
end event

type p_fond from w_fenetre_arakis`p_fond within w_winpopup_suivi
end type

type gb_8 from groupbox within w_winpopup_suivi
integer x = 933
integer y = 708
integer width = 2185
integer height = 244
integer taborder = 50
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean italic = true
long textcolor = 33554432
long backcolor = 15780518
end type

type cb_imprimer from uo_picturebutton_390x120 within w_winpopup_suivi
integer x = 2030
integer y = 2556
integer width = 471
integer taborder = 110
boolean enabled = false
string text = "&Imprimer"
string iconname = "ACTIONS_imprimer.png"
end type

event clicked;call super::clicked;dw_liste.print()
end event

type cb_autre from uo_picturebutton_390x120 within w_winpopup_suivi
integer x = 1545
integer y = 2556
integer width = 471
integer taborder = 110
boolean enabled = false
string text = "&Autre"
string iconname = "ACTIONS_autre.png"
end type

event clicked;call super::clicked;prepa_faite = false
this.enabled ( false)
cb_imprimer.enabled ( false)
cb_ecran.enabled ( true )
dw_liste.visible = false
em_nb.visible = false
cb_lien_word.enabled ( false )


cbx_filtre.visible = false

composant_visible_selon_tag(parent , "a masquer", true)


end event

type cb_fermer from uo_picturebutton_390x120_fermer within w_winpopup_suivi
integer x = 2949
integer y = 2556
integer width = 471
integer taborder = 30
end type

event clicked;fermer_fenetre(parent)
end event

type cb_ecran from uo_picturebutton_390x120 within w_winpopup_suivi
integer x = 1061
integer y = 2556
integer width = 471
integer taborder = 40
string text = "&Ecran"
boolean default = true
string iconname = "ACTIONS_ecran.png"
end type

event clicked;call super::clicked;prepa()
//this.enabled ( false)
cb_imprimer.enabled ( true)
cb_autre.enabled ( true)
dw_liste.visible = true
cb_lien_word.enabled ( true)
this.default (false)
cb_imprimer.default ( true)
cbx_filtre.visible = true

//composant_visible_selon_tag(parent , "a masquer", false)
end event

type cb_lien_word from uo_picturebutton_780x120 within w_winpopup_suivi
boolean visible = false
integer x = 3685
integer y = 2556
integer taborder = 30
boolean enabled = false
string text = "Traiter avec &Word"
end type

type uo_size from resize_fenetre within w_winpopup_suivi
boolean visible = false
integer x = 2235
integer y = 580
integer taborder = 30
end type

on uo_size.destroy
call resize_fenetre::destroy
end on

type em_nb from editmask within w_winpopup_suivi
boolean visible = false
integer x = 82
integer y = 2580
integer width = 722
integer height = 100
integer taborder = 30
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean italic = true
long backcolor = 12632256
boolean enabled = false
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = stringmask!
string mask = "XXXXXXXXXXXXXXXXXXXX"
end type

type dw_1 from datawindow within w_winpopup_suivi
boolean visible = false
integer y = 260
integer width = 325
integer height = 668
integer taborder = 40
string dataobject = "dw_liste_tous_patients_edition"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = styleraised!
end type

event retrieverow;maj_patience(row,increment)
end event

type dw_prati from datawindow within w_winpopup_suivi
string tag = "position brush"
boolean visible = false
integer x = 1216
integer y = 328
integer width = 859
integer height = 72
integer taborder = 60
boolean bringtotop = true
string dataobject = "dw_cherche_prati"
boolean border = false
end type

type rb_emission_ce_poste from radiobutton within w_winpopup_suivi
integer x = 210
integer y = 224
integer width = 1842
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
string text = "Ce poste"
boolean checked = true
end type

type rb_emission_un_autre_poste from radiobutton within w_winpopup_suivi
integer x = 219
integer y = 360
integer width = 471
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
string text = "Un autre poste"
end type

event clicked;

if not is_deverrouille() then
	rb_emission_ce_poste.checked = true
	this.checked = false
else
	ddlb_emission_liste_postes.visible = true
end if
end event

type rb_emission_tous_les_postes from radiobutton within w_winpopup_suivi
integer x = 219
integer y = 504
integer width = 553
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
string text = "Tous les postes"
end type

event clicked;

if not is_deverrouille() then
	rb_emission_ce_poste.checked = true
	this.checked = false
	ddlb_emission_liste_postes.visible = false
else
	ddlb_emission_liste_postes.visible = false
end if
end event

type ddlb_emission_liste_postes from dropdownlistbox within w_winpopup_suivi
boolean visible = false
integer x = 814
integer y = 360
integer width = 951
integer height = 1044
integer taborder = 20
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "@Arial Unicode MS"
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

type rb_emission_cet_utilisateur from radiobutton within w_winpopup_suivi
integer x = 2336
integer y = 224
integer width = 1806
integer height = 92
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "@Arial Unicode MS"
long textcolor = 33554432
long backcolor = 15780518
string text = "Cet utilisateur"
boolean checked = true
end type

event clicked;	dw_emission_utilisateurs.visible = false

end event

type rb_emission_un_autre_utilisateur from radiobutton within w_winpopup_suivi
integer x = 2336
integer y = 360
integer width = 581
integer height = 92
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "@Arial Unicode MS"
long textcolor = 33554432
long backcolor = 15780518
string text = "Un autre utilisateur"
end type

event clicked;

if not is_deverrouille() then
	rb_emission_cet_utilisateur.checked = true
	this.checked = false
else
	dw_emission_utilisateurs.visible = true
end if
end event

type dw_emission_utilisateurs from datawindow within w_winpopup_suivi
string tag = "no resize all"
boolean visible = false
integer x = 2944
integer y = 360
integer width = 1198
integer height = 80
integer taborder = 60
boolean bringtotop = true
string title = "none"
string dataobject = "dw_cherche_utilisateur"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type rb_emission_tous_les_utilisateurs from radiobutton within w_winpopup_suivi
integer x = 2336
integer y = 504
integer width = 617
integer height = 92
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "@Arial Unicode MS"
long textcolor = 33554432
long backcolor = 15780518
string text = "Tous les utilisateurs"
end type

event clicked;if not is_deverrouille() then
	rb_emission_cet_utilisateur.checked = true
	this.checked = false
	dw_emission_utilisateurs.visible = false
else
	dw_emission_utilisateurs.visible = false
end if
end event

type st_3 from statictext within w_winpopup_suivi
integer x = 1065
integer y = 820
integer width = 256
integer height = 72
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
string facename = "Arial"
long backcolor = 553648127
string text = "Entre le "
end type

type em_emission_date_min from uo_date_calendrier within w_winpopup_suivi
integer x = 1367
integer y = 800
integer taborder = 40
boolean bringtotop = true
end type

on em_emission_date_min.destroy
call uo_date_calendrier::destroy
end on

type em_emission_time_min from editmask within w_winpopup_suivi
integer x = 1819
integer y = 800
integer width = 261
integer height = 92
integer taborder = 50
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
string text = "none"
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = timemask!
string mask = "hh:mm"
boolean spin = true
end type

type st_2 from statictext within w_winpopup_suivi
integer x = 2080
integer y = 820
integer width = 215
integer height = 72
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
string facename = "Arial"
long backcolor = 553648127
string text = "Et le"
alignment alignment = center!
end type

type em_emission_date_max from uo_date_calendrier within w_winpopup_suivi
integer x = 2304
integer y = 800
integer taborder = 60
boolean bringtotop = true
end type

on em_emission_date_max.destroy
call uo_date_calendrier::destroy
end on

type em_emission_time_max from editmask within w_winpopup_suivi
integer x = 2757
integer y = 800
integer width = 261
integer height = 92
integer taborder = 70
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
string text = "23:59"
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = timemask!
string mask = "hh:mm"
boolean spin = true
end type

type rb_reception_ce_poste from radiobutton within w_winpopup_suivi
integer x = 219
integer y = 1368
integer width = 1806
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
string text = "Ce poste"
end type

event clicked;	ddlb_reception_liste_postes.visible = false

end event

type rb_reception_un_autre_poste from radiobutton within w_winpopup_suivi
integer x = 219
integer y = 1508
integer width = 471
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
string text = "Un autre poste"
end type

event clicked;

	ddlb_reception_liste_postes.visible = true

end event

type rb_reception_tous_les_postes from radiobutton within w_winpopup_suivi
integer x = 219
integer y = 1648
integer width = 553
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
string text = "Toutes les postes"
boolean checked = true
end type

event clicked;	ddlb_reception_liste_postes.visible = false

end event

type ddlb_reception_liste_postes from dropdownlistbox within w_winpopup_suivi
boolean visible = false
integer x = 814
integer y = 1508
integer width = 951
integer height = 1044
integer taborder = 30
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "@Arial Unicode MS"
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

type rb_reception_cet_utilisateur from radiobutton within w_winpopup_suivi
integer x = 2336
integer y = 1368
integer width = 1842
integer height = 92
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "@Arial Unicode MS"
long textcolor = 33554432
long backcolor = 15780518
string text = "Cet utilisateur"
end type

event clicked;dw_reception_utilisateurs.visible = false
end event

type rb_reception_un_autre_utilisateur from radiobutton within w_winpopup_suivi
integer x = 2336
integer y = 1508
integer width = 581
integer height = 92
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "@Arial Unicode MS"
long textcolor = 33554432
long backcolor = 15780518
string text = "Un autre utilisateur"
end type

event clicked;dw_reception_utilisateurs.visible = true
end event

type rb_reception_tous_les_utilisateur from radiobutton within w_winpopup_suivi
integer x = 2336
integer y = 1648
integer width = 617
integer height = 92
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "@Arial Unicode MS"
long textcolor = 33554432
long backcolor = 15780518
string text = "Tous les utilisateurs"
boolean checked = true
end type

event clicked;dw_reception_utilisateurs.visible = false
end event

type dw_reception_utilisateurs from datawindow within w_winpopup_suivi
string tag = "no resize all"
boolean visible = false
integer x = 2944
integer y = 1508
integer width = 1198
integer height = 80
integer taborder = 70
boolean bringtotop = true
string title = "none"
string dataobject = "dw_cherche_utilisateur"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type sle_texte_message from singlelineedit within w_winpopup_suivi
integer x = 210
integer y = 2172
integer width = 4032
integer height = 112
integer taborder = 70
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "%"
borderstyle borderstyle = stylelowered!
end type

type cbx_filtre from u_cst_togglebutton within w_winpopup_suivi
event destroy ( )
boolean visible = false
integer x = 233
integer y = 2556
integer width = 553
integer height = 92
integer taborder = 60
boolean bringtotop = true
string #ontext = "Filtres / Tris activés"
string #offtext = "Filtres / Tris inactivés"
string #tiptext = "Filtres / Tris"
end type

on cbx_filtre.destroy
call u_cst_togglebutton::destroy
end on

event constructor;call super::constructor;cbx_filtre.backcolor = parent.backcolor	

end event

event clicked;call super::clicked;
iu_PowerFilter.checked = NOT iu_PowerFilter.checked
iu_PowerFilter.event ue_clicked()


end event

type gb_2 from groupbox within w_winpopup_suivi
integer x = 2254
integer y = 116
integer width = 1966
integer height = 568
integer taborder = 50
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean italic = true
long textcolor = 33554432
long backcolor = 15780518
string text = "Utilisateur Emetteur"
end type

type gb_3 from groupbox within w_winpopup_suivi
integer x = 160
integer y = 116
integer width = 1966
integer height = 568
integer taborder = 40
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean italic = true
long textcolor = 33554432
long backcolor = 15780518
string text = "Poste émetteur"
end type

type gb_1 from groupbox within w_winpopup_suivi
integer x = 37
integer y = 20
integer width = 4352
integer height = 976
integer taborder = 50
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean italic = true
long textcolor = 33554432
long backcolor = 15780518
string text = "Sélection selon l~'émission"
end type

type gb_5 from groupbox within w_winpopup_suivi
integer x = 169
integer y = 1244
integer width = 1920
integer height = 568
integer taborder = 50
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean italic = true
long textcolor = 33554432
long backcolor = 15780518
string text = "Poste récepteur"
end type

type gb_6 from groupbox within w_winpopup_suivi
integer x = 2277
integer y = 1264
integer width = 1966
integer height = 568
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
string text = "Utilisateur Récepteur"
end type

type gb_4 from groupbox within w_winpopup_suivi
integer x = 50
integer y = 1100
integer width = 4352
integer height = 824
integer taborder = 60
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean italic = true
long textcolor = 33554432
long backcolor = 15780518
string text = "Sélection selon la réception"
end type

type gb_7 from groupbox within w_winpopup_suivi
integer x = 55
integer y = 2028
integer width = 4347
integer height = 372
integer taborder = 60
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 15780518
string text = "Texte du message"
end type

type dw_liste from u_basedw within w_winpopup_suivi
event ue_leftbuttonup pbm_dwnlbuttonup
boolean visible = false
integer x = 18
integer y = 8
integer width = 4398
integer height = 2500
integer taborder = 30
boolean bringtotop = true
string dataobject = "dw_winpopup_suivi"
end type

event ue_leftbuttonup;iu_PowerFilter.event post ue_buttonclicked(dwo.type,dwo.name)
end event

event rbuttondown;//if row > 0 then
//	This.SelectRow(0,False)
//	This.SelectRow(row,True)
//	This.setrow(row)
//	OpenMenuPatient_Listes(this)
//end if
end event

event retrieverow;call super::retrieverow;
if mod(row , 10) = 0 then 
	// pour voir l'animation de patience !!!
	yield()
end if
end event

event doubleclicked;call super::doubleclicked;
//
//// double clic, comme dans la salle d'attente !!
//
//if row > 0 then
//
//	var_code 				= 	this.getitemnumber(row,"code")
//	var_numero_dossier 	= 	this.getitemnumber(row,"numero_dossier")
//	var_nom 				= this.getitemstring(row,"nom")
//	var_nomp 				= ""
//	var_pay 					= ""
//	var_moul 				= ""
//
//	ouverture_salle_attente()
//end if
//
end event

event constructor;call super::constructor;iu_PowerFilter = create n_cst_PowerFilter
iu_PowerFilter.of_setdw(this)
iu_PowerFilter.of_SetLanguage( 1 )
end event

event resize;call super::resize;iu_PowerFilter.event ue_positionbuttons()
end event

