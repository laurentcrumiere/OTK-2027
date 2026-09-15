$PBExportHeader$w_liste_patients_pastille_couleur.srw
forward
global type w_liste_patients_pastille_couleur from w_liste_patients
end type
type uo_filtre_email from uo_filtre_emails within w_liste_patients_pastille_couleur
end type
type st_couleur4 from statictext within w_liste_patients_pastille_couleur
end type
type cbx_pastille4 from checkbox within w_liste_patients_pastille_couleur
end type
type cbx_pastille3 from checkbox within w_liste_patients_pastille_couleur
end type
type st_couleur3 from statictext within w_liste_patients_pastille_couleur
end type
type st_couleur2 from statictext within w_liste_patients_pastille_couleur
end type
type cbx_pastille2 from checkbox within w_liste_patients_pastille_couleur
end type
type cbx_pastille1 from checkbox within w_liste_patients_pastille_couleur
end type
type st_couleur1 from statictext within w_liste_patients_pastille_couleur
end type
type st_parents from statictext within w_liste_patients_pastille_couleur
end type
type gb_recherche from groupbox within w_liste_patients_pastille_couleur
end type
end forward

global type w_liste_patients_pastille_couleur from w_liste_patients
integer width = 3648
string title = "Liste des Patients selon Pastilles de Couleur"
uo_filtre_email uo_filtre_email
st_couleur4 st_couleur4
cbx_pastille4 cbx_pastille4
cbx_pastille3 cbx_pastille3
st_couleur3 st_couleur3
st_couleur2 st_couleur2
cbx_pastille2 cbx_pastille2
cbx_pastille1 cbx_pastille1
st_couleur1 st_couleur1
st_parents st_parents
gb_recherche gb_recherche
end type
global w_liste_patients_pastille_couleur w_liste_patients_pastille_couleur

type variables
string sel

// pour repositionnement de la palette de couleur
integer  ii_palette_x = 0
integer ii_palette_y = 0



end variables

forward prototypes
public subroutine prepa ()
end prototypes

public subroutine prepa ();string pra_min,pra_max, titre
double code_min,code_max
double v_couleur1, v_couleur2, v_couleur3, v_couleur4
string clausew

if not prepa_faite then
	//prepa_faite = true
	if rb_tous.checked then
		pra_min="      "
		pra_max="ZZZZZZ"
		titre = "Pour tous les praticiens"
	else
		pra_min=dw_prati.getitemstring(dw_prati.getrow(),"code")
		pra_max=dw_prati.getitemstring(dw_prati.getrow(),"code")
		titre = "Pour le Dr "+dw_prati.getitemstring(dw_prati.getrow(),"nom")
	end if

	code_min = double(em_min.text)
	code_max = double(em_max.text)
	
	
	v_couleur1 = st_couleur1.backcolor
	v_couleur2 = st_couleur2.backcolor
	v_couleur3 = st_couleur3.backcolor
	v_couleur4 = st_couleur4.backcolor



	clausew = "  and  (patient.numero_dossier between " + string(code_min, "0" ) + " and " + string(code_max)  + " and patient.code_praticien between '" + pra_min + "' and '" + pra_max + "')"
	
	// clause where selon les pastilles 
	if cbx_pastille1.thirdstate then 
		// rien ... on n'en tient pas compte
	else
		if cbx_pastille1.checked then 
			clausew = clausew + " and patient.couleur1 = " + string(v_couleur1)
			Titre = titre + " - Patient ayant la pastille 1"
		else
			clausew = clausew + " and patient.couleur1 is null "
			Titre = titre + " - Patient sans la pastille 1"
		end if
	end if
	
	if cbx_pastille2.thirdstate then 
		// rien ... on n'en tient pas compte
	else
		if cbx_pastille2.checked then 
			clausew = clausew + " and patient.couleur2 = " + string(v_couleur2)
			Titre = titre + " - Patient ayant la pastille 2"
		else
			clausew = clausew + " and patient.couleur2 is null "
			Titre = titre + " - Patient sans la pastille 2"
		end if
	end if
	
	if cbx_pastille3.thirdstate then 
		// rien ... on n'en tient pas compte
	else
		if cbx_pastille3.checked then 
			clausew = clausew + " and patient.couleur3 = " + string(v_couleur3)
			Titre = titre + " - Patient ayant la pastille 3"
		else
			clausew = clausew + " and patient.couleur3 is null "
			Titre = titre + " - Patient sans la pastille 3"
		end if
	end if
	
	
		if cbx_pastille4.thirdstate then 
		// rien ... on n'en tient pas compte
	else
		if cbx_pastille1.checked then 
			clausew = clausew + " and patient.couleur4 = " + string(v_couleur4)
			Titre = titre + " - Patient ayant la pastille 4"
		else
			clausew = clausew + " and patient.couleur4 is null "
			Titre = titre + " - Patient sans la pastille 4"
		end if
	end if
	
		
	// titre et clause
	dw_liste.Modify('datawindow.table.select ="' + sel + clausew + '"')
	dw_liste.object.sous_titre.text  = titre

	open(w_patience)
	dw_liste.retrieve(v_couleur1, v_couleur2, v_couleur3, v_couleur4)
	close(w_patience)
	
	//em_nb.text = string(dw_liste.rowcount())+" Dossiers"
	//em_nb.visible = true
end if

end subroutine

on w_liste_patients_pastille_couleur.create
int iCurrent
call super::create
this.uo_filtre_email=create uo_filtre_email
this.st_couleur4=create st_couleur4
this.cbx_pastille4=create cbx_pastille4
this.cbx_pastille3=create cbx_pastille3
this.st_couleur3=create st_couleur3
this.st_couleur2=create st_couleur2
this.cbx_pastille2=create cbx_pastille2
this.cbx_pastille1=create cbx_pastille1
this.st_couleur1=create st_couleur1
this.st_parents=create st_parents
this.gb_recherche=create gb_recherche
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.uo_filtre_email
this.Control[iCurrent+2]=this.st_couleur4
this.Control[iCurrent+3]=this.cbx_pastille4
this.Control[iCurrent+4]=this.cbx_pastille3
this.Control[iCurrent+5]=this.st_couleur3
this.Control[iCurrent+6]=this.st_couleur2
this.Control[iCurrent+7]=this.cbx_pastille2
this.Control[iCurrent+8]=this.cbx_pastille1
this.Control[iCurrent+9]=this.st_couleur1
this.Control[iCurrent+10]=this.st_parents
this.Control[iCurrent+11]=this.gb_recherche
end on

on w_liste_patients_pastille_couleur.destroy
call super::destroy
destroy(this.uo_filtre_email)
destroy(this.st_couleur4)
destroy(this.cbx_pastille4)
destroy(this.cbx_pastille3)
destroy(this.st_couleur3)
destroy(this.st_couleur2)
destroy(this.cbx_pastille2)
destroy(this.cbx_pastille1)
destroy(this.st_couleur1)
destroy(this.st_parents)
destroy(this.gb_recherche)
end on

event open;call super::open;
uo_filtre_email.dw_liste = dw_liste
uo_filtre_email.em_statut_mere = em_nb

gb_recherche.backcolor = couleur_fond_fenetre


// On va gérer la clause Where en dynamique !!!!
sel = dw_liste.Describe("datawindow.table.select")




end event

event timer;call super::timer;if version_ce_logiciel >= "36.90" then
	Timer(0)
	fxg_set_position_palette_windows(this, ii_palette_x, ii_palette_y)
end if

end event

type p_fond from w_liste_patients`p_fond within w_liste_patients_pastille_couleur
end type

type cb_imprimer from w_liste_patients`cb_imprimer within w_liste_patients_pastille_couleur
integer x = 2249
end type

type cb_autre from w_liste_patients`cb_autre within w_liste_patients_pastille_couleur
integer x = 1765
end type

type cb_fermer from w_liste_patients`cb_fermer within w_liste_patients_pastille_couleur
integer x = 2734
end type

type cb_ecran from w_liste_patients`cb_ecran within w_liste_patients_pastille_couleur
integer x = 526
end type

type cb_lien_word from w_liste_patients`cb_lien_word within w_liste_patients_pastille_couleur
end type

type uo_size from w_liste_patients`uo_size within w_liste_patients_pastille_couleur
end type

type rb_un from w_liste_patients`rb_un within w_liste_patients_pastille_couleur
end type

type rb_tous from w_liste_patients`rb_tous within w_liste_patients_pastille_couleur
end type

type em_nb from w_liste_patients`em_nb within w_liste_patients_pastille_couleur
end type

type em_max from w_liste_patients`em_max within w_liste_patients_pastille_couleur
end type

type em_min from w_liste_patients`em_min within w_liste_patients_pastille_couleur
end type

type dw_1 from w_liste_patients`dw_1 within w_liste_patients_pastille_couleur
end type

type gb_1 from w_liste_patients`gb_1 within w_liste_patients_pastille_couleur
end type

type dw_prati from w_liste_patients`dw_prati within w_liste_patients_pastille_couleur
end type

type cbx_filtre from w_liste_patients`cbx_filtre within w_liste_patients_pastille_couleur
end type

type st_min from w_liste_patients`st_min within w_liste_patients_pastille_couleur
end type

type st_max from w_liste_patients`st_max within w_liste_patients_pastille_couleur
end type

type dw_liste from w_liste_patients`dw_liste within w_liste_patients_pastille_couleur
integer x = 9
integer y = 16
integer width = 3561
string dataobject = "dw_liste_patients_une_couleur_edition"
end type

type uo_filtre_email from uo_filtre_emails within w_liste_patients_pastille_couleur
string tag = "no resize all"
integer x = 1010
integer y = 1856
integer taborder = 160
boolean bringtotop = true
end type

on uo_filtre_email.destroy
call uo_filtre_emails::destroy
end on

type st_couleur4 from statictext within w_liste_patients_pastille_couleur
boolean visible = false
integer x = 1449
integer y = 1568
integer width = 187
integer height = 112
integer textsize = -14
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "?"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = styleraised!
boolean focusrectangle = false
end type

event clicked;//Declaration des variables locales
//--------------------------
long couleur_choisie

couleur_choisie = this.backcolor

// Les positions seront utilisées dans le timer de la fenêtre	
ii_palette_x = unitstopixels( w_mdi_2020.pointerx() , XUnitsToPixels! ) 
ii_palette_y = unitstopixels( w_mdi_2020.pointery() , YUnitsToPixels! ) 
			
Timer(0.05)	// pour déclencher le repositionnement de la palette

//Appel de la fenetre couleur et au retour, met la couleur de fond
//--------------------------------------------------
if appel_palette(couleur_choisie) then
	boolean v_suite = false
	
		this.backcolor = couleur_choisie
		this.text = ""

end if
end event

event rbuttondown;	this.backcolor = couleur_jour_interdit
	this.text = '?'

end event

type cbx_pastille4 from checkbox within w_liste_patients_pastille_couleur
integer x = 955
integer y = 1576
integer width = 402
integer height = 80
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 553648127
string text = "Pastille 4"
boolean threestate = true
boolean thirdstate = true
end type

event clicked;if checked and not thirdstate then
	st_couleur4.visible = true 
else
	st_couleur4.visible = false 
end if
end event

type cbx_pastille3 from checkbox within w_liste_patients_pastille_couleur
integer x = 955
integer y = 1408
integer width = 402
integer height = 80
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 553648127
string text = "Pastille 3"
boolean threestate = true
boolean thirdstate = true
end type

event clicked;if checked and not thirdstate then
	st_couleur3.visible = true 
else
	st_couleur3.visible = false 
end if
end event

type st_couleur3 from statictext within w_liste_patients_pastille_couleur
boolean visible = false
integer x = 1449
integer y = 1400
integer width = 187
integer height = 112
integer textsize = -14
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "?"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = styleraised!
boolean focusrectangle = false
end type

event clicked;//Declaration des variables locales
//--------------------------
long couleur_choisie

couleur_choisie = this.backcolor

// Les positions seront utilisées dans le timer de la fenêtre	
ii_palette_x = unitstopixels( w_mdi_2020.pointerx() , XUnitsToPixels! ) 
ii_palette_y = unitstopixels( w_mdi_2020.pointery() , YUnitsToPixels! ) 
			
Timer(0.05)	// pour déclencher le repositionnement de la palette

//Appel de la fenetre couleur et au retour, met la couleur de fond
//--------------------------------------------------
if appel_palette(couleur_choisie) then
	boolean v_suite = false
	
		this.backcolor = couleur_choisie
		this.text = ""

end if
end event

event rbuttondown;	this.backcolor = couleur_jour_interdit
	this.text = '?'

end event

type st_couleur2 from statictext within w_liste_patients_pastille_couleur
boolean visible = false
integer x = 1449
integer y = 1232
integer width = 187
integer height = 112
integer textsize = -14
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "?"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = styleraised!
boolean focusrectangle = false
end type

event clicked;//Declaration des variables locales
//--------------------------
long couleur_choisie

couleur_choisie = this.backcolor

// Les positions seront utilisées dans le timer de la fenêtre	
ii_palette_x = unitstopixels( w_mdi_2020.pointerx() , XUnitsToPixels! ) 
ii_palette_y = unitstopixels( w_mdi_2020.pointery() , YUnitsToPixels! ) 
			
Timer(0.05)	// pour déclencher le repositionnement de la palette

//Appel de la fenetre couleur et au retour, met la couleur de fond
//--------------------------------------------------
if appel_palette(couleur_choisie) then
	boolean v_suite = false
	
		this.backcolor = couleur_choisie
		this.text = ""

end if
end event

event rbuttondown;	this.backcolor = couleur_jour_interdit
	this.text = '?'

end event

type cbx_pastille2 from checkbox within w_liste_patients_pastille_couleur
integer x = 955
integer y = 1240
integer width = 402
integer height = 80
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 553648127
string text = "Pastille 2"
boolean threestate = true
boolean thirdstate = true
end type

event clicked;if checked and not thirdstate then
	st_couleur2.visible = true 
else
	st_couleur2.visible = false 
end if
end event

type cbx_pastille1 from checkbox within w_liste_patients_pastille_couleur
integer x = 955
integer y = 1072
integer width = 402
integer height = 80
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 553648127
string text = "Pastille 1"
boolean threestate = true
boolean thirdstate = true
end type

event clicked;if checked and not thirdstate then
	st_couleur1.visible = true 
else
	st_couleur1.visible = false 
end if
end event

type st_couleur1 from statictext within w_liste_patients_pastille_couleur
boolean visible = false
integer x = 1449
integer y = 1064
integer width = 187
integer height = 112
integer textsize = -14
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "?"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = styleraised!
boolean focusrectangle = false
end type

event clicked;//Declaration des variables locales
//--------------------------
long couleur_choisie

couleur_choisie = this.backcolor

// Les positions seront utilisées dans le timer de la fenêtre	
ii_palette_x = unitstopixels( w_mdi_2020.pointerx() , XUnitsToPixels! ) 
ii_palette_y = unitstopixels( w_mdi_2020.pointery() , YUnitsToPixels! ) 
			
Timer(0.05)	// pour déclencher le repositionnement de la palette

//Appel de la fenetre couleur et au retour, met la couleur de fond
//--------------------------------------------------
if appel_palette(couleur_choisie) then
	boolean v_suite = false
	
		this.backcolor = couleur_choisie
		this.text = ""

end if
end event

event rbuttondown;	this.backcolor = couleur_jour_interdit
	this.text = '?'

end event

type st_parents from statictext within w_liste_patients_pastille_couleur
integer x = 942
integer y = 920
integer width = 1321
integer height = 132
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean italic = true
long textcolor = 16711680
long backcolor = 553648127
string text = "Case Cocheé : AVEC la couleur / Décochée : SANS la couleur / Pleine : non prise en compte "
boolean focusrectangle = false
end type

type gb_recherche from groupbox within w_liste_patients_pastille_couleur
integer x = 841
integer y = 832
integer width = 1486
integer height = 924
integer taborder = 40
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean italic = true
long textcolor = 33554432
long backcolor = 67108864
string text = "Critères de recherche "
end type

