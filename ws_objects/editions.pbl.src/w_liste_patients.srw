$PBExportHeader$w_liste_patients.srw
forward
global type w_liste_patients from w_fenetre_arakis
end type
type cb_imprimer from uo_picturebutton_390x120 within w_liste_patients
end type
type cb_autre from uo_picturebutton_390x120 within w_liste_patients
end type
type cb_fermer from uo_picturebutton_390x120_fermer within w_liste_patients
end type
type cb_ecran from uo_picturebutton_390x120 within w_liste_patients
end type
type cb_lien_word from uo_picturebutton_780x120 within w_liste_patients
end type
type uo_size from resize_fenetre within w_liste_patients
end type
type rb_un from radiobutton within w_liste_patients
end type
type rb_tous from radiobutton within w_liste_patients
end type
type em_nb from editmask within w_liste_patients
end type
type em_max from editmask within w_liste_patients
end type
type em_min from editmask within w_liste_patients
end type
type dw_1 from datawindow within w_liste_patients
end type
type gb_1 from groupbox within w_liste_patients
end type
type dw_prati from datawindow within w_liste_patients
end type
type cbx_filtre from u_cst_togglebutton within w_liste_patients
end type
type st_min from statictext within w_liste_patients
end type
type st_max from statictext within w_liste_patients
end type
type dw_liste from u_basedw within w_liste_patients
end type
end forward

global type w_liste_patients from w_fenetre_arakis
integer x = 27
integer y = 200
integer width = 3781
integer height = 2132
string title = "Liste de Tous les Patients"
windowtype windowtype = child!
cb_imprimer cb_imprimer
cb_autre cb_autre
cb_fermer cb_fermer
cb_ecran cb_ecran
cb_lien_word cb_lien_word
uo_size uo_size
rb_un rb_un
rb_tous rb_tous
em_nb em_nb
em_max em_max
em_min em_min
dw_1 dw_1
gb_1 gb_1
dw_prati dw_prati
cbx_filtre cbx_filtre
st_min st_min
st_max st_max
dw_liste dw_liste
end type
global w_liste_patients w_liste_patients

type variables
boolean prepa_faite
double increment	
double nb_dossier

double min, max,max_row

n_cst_PowerFilter iu_PowerFilter

// pour les liste avec possibilité de sélectionner les patients ...
boolean tout_selectionne  = true
end variables

forward prototypes
public subroutine prepa ()
public subroutine traitement_word (integer tab_type[], ref datawindow ldatawin)
end prototypes

public subroutine prepa ();string pra_min,pra_max
double code_min,code_max

if not prepa_faite then
	//prepa_faite = true
	if rb_tous.checked then
		pra_min="      "
		pra_max="ZZZZZZ"
	else
		pra_min=dw_prati.getitemstring(dw_prati.getrow(),"code")
		pra_max=dw_prati.getitemstring(dw_prati.getrow(),"code")
	end if

	code_min = double(em_min.text)
	code_max = double(em_max.text)
	
	open(w_patience)
	dw_liste.retrieve(code_min,code_max,pra_min,pra_max)
	close(w_patience)

//	em_nb.text = string(dw_liste.rowcount())+" Dossiers"
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
			messagebox("ATTENTION", "Il faut avant tout indiquer un/des fichier(s) au format ~nMicrosoft WORD pour ce(s) courrier(s) (Ruban 'Patient' ou 'Listes', 'Courriers Word', 'Paramètres Publipostage').~n~nImpossible de poursuivre !", Exclamation!)
		else
			fxg_ajout_journal_planification('DEP', "L'impression des Lettres Word n'a pas pu être effectuée. Courrier Word non spécifié.")
		end if
	end if
	
	// libération mémoire
	destroy luo
	
	close(w_patience)
	
else
// si un pb sur le accepttext -> msg d'erreur
	messagebox("Erreur","Impossible de poursuivre ! ~n~nUne des valeurs que vous venez de rentrer ~nest incorrecte !", StopSign!)
end if
end subroutine

on w_liste_patients.create
int iCurrent
call super::create
this.cb_imprimer=create cb_imprimer
this.cb_autre=create cb_autre
this.cb_fermer=create cb_fermer
this.cb_ecran=create cb_ecran
this.cb_lien_word=create cb_lien_word
this.uo_size=create uo_size
this.rb_un=create rb_un
this.rb_tous=create rb_tous
this.em_nb=create em_nb
this.em_max=create em_max
this.em_min=create em_min
this.dw_1=create dw_1
this.gb_1=create gb_1
this.dw_prati=create dw_prati
this.cbx_filtre=create cbx_filtre
this.st_min=create st_min
this.st_max=create st_max
this.dw_liste=create dw_liste
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_imprimer
this.Control[iCurrent+2]=this.cb_autre
this.Control[iCurrent+3]=this.cb_fermer
this.Control[iCurrent+4]=this.cb_ecran
this.Control[iCurrent+5]=this.cb_lien_word
this.Control[iCurrent+6]=this.uo_size
this.Control[iCurrent+7]=this.rb_un
this.Control[iCurrent+8]=this.rb_tous
this.Control[iCurrent+9]=this.em_nb
this.Control[iCurrent+10]=this.em_max
this.Control[iCurrent+11]=this.em_min
this.Control[iCurrent+12]=this.dw_1
this.Control[iCurrent+13]=this.gb_1
this.Control[iCurrent+14]=this.dw_prati
this.Control[iCurrent+15]=this.cbx_filtre
this.Control[iCurrent+16]=this.st_min
this.Control[iCurrent+17]=this.st_max
this.Control[iCurrent+18]=this.dw_liste
end on

on w_liste_patients.destroy
call super::destroy
destroy(this.cb_imprimer)
destroy(this.cb_autre)
destroy(this.cb_fermer)
destroy(this.cb_ecran)
destroy(this.cb_lien_word)
destroy(this.uo_size)
destroy(this.rb_un)
destroy(this.rb_tous)
destroy(this.em_nb)
destroy(this.em_max)
destroy(this.em_min)
destroy(this.dw_1)
destroy(this.gb_1)
destroy(this.dw_prati)
destroy(this.cbx_filtre)
destroy(this.st_min)
destroy(this.st_max)
destroy(this.dw_liste)
end on

event open;call super::open;
trace("===== DEBUT OPEN LISTE PATIENT =======")
trace("Nom de la liste : " + title )


open(w_patience)

//insertion de "O" ds la table "table_vide"-->column "v1"
UPDATE table_vide SET v1='O' WHERE cle = 1;
commit;

SELECT min(numero_dossier), max(numero_dossier),count(*) INTO :min, :max,:max_row 
FROM patient WHERE -100000000 < numero_dossier and  numero_dossier < 100000000   ;

em_max.text = string(max)

increment = integer(max_row / 10)

dw_liste.settransobject(SQLCA)
dw_prati.settransobject(SQLCA)
dw_prati.retrieve()

if not multi then
	rb_tous.checked = false
	rb_tous.enabled = false
	rb_un.checked = true
	dw_prati.visible = true
end if


dw_prati.setitem(1, "code", fxg_get_praticien_par_defaut())


uo_size.taille(this)
prepa_faite = false

cbx_filtre.backcolor = this.backcolor



close(w_patience)


trace("===== FIN OPEN LISTE PATIENT =======")

end event

event resize;

uo_size.retaille(this)

// repositionnement 
//cbx_filtre.x = gb_filtre.x + 19
//cbx_filtre.y = gb_filtre.y + 55
//

// pour qu'il se resize mais ... pas trop 
cbx_filtre.y = cb_ecran.y
cbx_filtre.height = min(cbx_filtre.height, cb_ecran.height)
cbx_filtre.width  =  min(800, cb_ecran.x - cbx_filtre.x - 30)
end event

type p_fond from w_fenetre_arakis`p_fond within w_liste_patients
end type

type cb_imprimer from uo_picturebutton_390x120 within w_liste_patients
integer x = 1733
integer y = 1868
integer width = 457
integer taborder = 110
boolean enabled = false
string text = "&Imprimer"
string iconname = "ACTIONS_imprimer.png"
end type

event clicked;call super::clicked;dw_liste.print()
end event

type cb_autre from uo_picturebutton_390x120 within w_liste_patients
integer x = 1266
integer y = 1868
integer width = 457
integer taborder = 110
boolean enabled = false
string text = "&Autre"
string iconname = "ACTIONS_autre.png"
end type

event clicked;call super::clicked;prepa_faite = false

this.enabled (false)
cb_imprimer.enabled( false )
cb_ecran.enabled ( true)
cb_lien_word.enabled ( false)
cb_ecran.default ( true)

dw_liste.visible = false

//em_nb.visible = false
//gb_filtre.visible = false


cbx_filtre.visible = false

composant_visible_selon_tag(parent , "a masquer", true)


end event

type cb_fermer from uo_picturebutton_390x120_fermer within w_liste_patients
integer x = 2533
integer y = 1868
integer width = 457
integer taborder = 30
end type

event clicked;fermer_fenetre(parent)
end event

type cb_ecran from uo_picturebutton_390x120 within w_liste_patients
integer x = 800
integer y = 1868
integer width = 457
integer taborder = 40
string text = "&Ecran"
boolean default = true
string iconname = "ACTIONS_ecran.png"
end type

event clicked;call super::clicked;
// On enlève la liste le temps du chargement - surtout pour une 2ème fois
dw_liste.visible = false

// pour les excités des clics
cb_fermer.enabled(false)
prepa()
// pour les excités des clics
cb_fermer.enabled(true)


if ui_v2020 then
	// pour qu'il redessinne correctement le bouton
	//cb_autre.default = true
	SetRedraw(true)
end if

cb_imprimer.enabled ( true)
cb_autre.enabled ( true )
cb_lien_word.enabled ( true )
cb_imprimer.default ( true )

dw_liste.visible = true

//gb_filtre.visible = true

if cbx_filtre.tag <> "no visible" then
	cbx_filtre.visible = true
end if


//composant_visible_selon_tag(parent , "a masquer", false)
end event

type cb_lien_word from uo_picturebutton_780x120 within w_liste_patients
boolean visible = false
integer x = 3136
integer y = 1868
integer width = 457
integer taborder = 30
boolean enabled = false
string text = " &Word"
string iconname = "lc_winword_16.png"
end type

type uo_size from resize_fenetre within w_liste_patients
boolean visible = false
integer x = 2235
integer y = 580
integer taborder = 30
end type

on uo_size.destroy
call resize_fenetre::destroy
end on

type rb_un from radiobutton within w_liste_patients
integer x = 448
integer y = 324
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

type rb_tous from radiobutton within w_liste_patients
integer x = 448
integer y = 228
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

type em_nb from editmask within w_liste_patients
boolean visible = false
integer x = 23
integer y = 1700
integer width = 498
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

type em_max from editmask within w_liste_patients
string tag = "a masquer"
integer x = 1774
integer y = 612
integer width = 498
integer height = 96
integer taborder = 20
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
alignment alignment = right!
borderstyle borderstyle = stylelowered!
string mask = "########0"
boolean spin = true
string displaydata = ""
double increment = 1
end type

type em_min from editmask within w_liste_patients
string tag = "a masquer"
integer x = 786
integer y = 612
integer width = 498
integer height = 96
integer taborder = 10
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
alignment alignment = right!
borderstyle borderstyle = stylelowered!
string mask = "########0"
boolean spin = true
string displaydata = ""
double increment = 1
end type

type dw_1 from datawindow within w_liste_patients
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

type gb_1 from groupbox within w_liste_patients
integer x = 283
integer y = 148
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

type dw_prati from datawindow within w_liste_patients
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

type cbx_filtre from u_cst_togglebutton within w_liste_patients
event destroy ( )
boolean visible = false
integer x = 18
integer y = 1888
integer width = 425
integer height = 92
integer taborder = 50
boolean bringtotop = true
string #ontext = "Filtres / Tris activés"
string #offtext = "Filtres / Tris inactivés"
string #tiptext = "Filtres / Tris"
end type

on cbx_filtre.destroy
call u_cst_togglebutton::destroy
end on

event clicked;call super::clicked;
iu_PowerFilter.checked = NOT iu_PowerFilter.checked
iu_PowerFilter.event ue_clicked()


end event

event constructor;call super::constructor;cbx_filtre.backcolor = couleur_fond_fenetre

end event

type st_min from statictext within w_liste_patients
integer x = 343
integer y = 628
integer width = 402
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 553648127
boolean enabled = false
string text = "Du Dossier N°"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_max from statictext within w_liste_patients
integer x = 1353
integer y = 628
integer width = 402
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 553648127
boolean enabled = false
string text = "Au Dossier N°"
alignment alignment = right!
boolean focusrectangle = false
end type

type dw_liste from u_basedw within w_liste_patients
event ue_leftbuttonup pbm_dwnlbuttonup
boolean visible = false
integer x = 18
integer y = 8
integer width = 3707
integer height = 1824
integer taborder = 30
boolean bringtotop = true
string dataobject = "dw_liste_tous_patients_edition"
borderstyle borderstyle = stylebox!
end type

event ue_leftbuttonup;iu_PowerFilter.event post ue_buttonclicked(dwo.type,dwo.name)
end event

event rbuttondown;if row > 0 then
	This.SelectRow(0,False)
	This.SelectRow(row,True)
	This.setrow(row)
	OpenMenuPatient_Listes(this)
end if
end event

event retrieverow;call super::retrieverow;
//if mod(row , 10) = 0 then 
//	// pour voir l'animation de patience !!!
//	yield()
//end if
end event

event doubleclicked;call super::doubleclicked;

// double clic, comme dans la salle d'attente !!

if row > 0 then

	var_code 				= 	this.getitemnumber(row,"code")
	var_numero_dossier 	= 	this.getitemnumber(row,"numero_dossier")
	var_nom 				= this.getitemstring(row,"nom")
	var_nomp 				= ""
	var_pay 					= ""
	var_moul 				= ""

	ouverture_salle_attente()
end if

end event

event constructor;call super::constructor;iu_PowerFilter = create n_cst_PowerFilter
iu_PowerFilter.of_setdw(this)
iu_PowerFilter.of_SetLanguage( 1 )
end event

event resize;call super::resize;if isvalid (iu_PowerFilter) then
	// Is valid car si on utilise les thèmes ... ça merde
	iu_PowerFilter.event ue_positionbuttons()
end if
end event

