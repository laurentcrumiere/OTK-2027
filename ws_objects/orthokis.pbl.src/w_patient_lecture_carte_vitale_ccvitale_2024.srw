$PBExportHeader$w_patient_lecture_carte_vitale_ccvitale_2024.srw
forward
global type w_patient_lecture_carte_vitale_ccvitale_2024 from w_fenetre_arakis
end type
type pb_fermer from uo_picturebutton_390x120 within w_patient_lecture_carte_vitale_ccvitale_2024
end type
type pb_maj_prenom from uo_picturebutton_390x120 within w_patient_lecture_carte_vitale_ccvitale_2024
end type
type dw_liste from datawindow within w_patient_lecture_carte_vitale_ccvitale_2024
end type
type pb_maj_nom from uo_picturebutton_390x120 within w_patient_lecture_carte_vitale_ccvitale_2024
end type
type pb_maj_date from uo_picturebutton_390x120 within w_patient_lecture_carte_vitale_ccvitale_2024
end type
type pb_tous from uo_picturebutton_390x120 within w_patient_lecture_carte_vitale_ccvitale_2024
end type
type pb_maj_par1 from uo_picturebutton_390x120 within w_patient_lecture_carte_vitale_ccvitale_2024
end type
type pb_maj_par2 from uo_picturebutton_390x120 within w_patient_lecture_carte_vitale_ccvitale_2024
end type
type pb_maj_payeur from uo_picturebutton_390x120 within w_patient_lecture_carte_vitale_ccvitale_2024
end type
type pb_maj_secu_assure from uo_picturebutton_390x120 within w_patient_lecture_carte_vitale_ccvitale_2024
end type
type cb_autre from uo_picturebutton_390x120 within w_patient_lecture_carte_vitale_ccvitale_2024
end type
type gb_patient from groupbox within w_patient_lecture_carte_vitale_ccvitale_2024
end type
type gb_1 from groupbox within w_patient_lecture_carte_vitale_ccvitale_2024
end type
end forward

global type w_patient_lecture_carte_vitale_ccvitale_2024 from w_fenetre_arakis
integer width = 3767
integer height = 1324
string title = "Lecture Carte Vitale"
boolean minbox = false
boolean maxbox = false
boolean resizable = false
windowtype windowtype = response!
pb_fermer pb_fermer
pb_maj_prenom pb_maj_prenom
dw_liste dw_liste
pb_maj_nom pb_maj_nom
pb_maj_date pb_maj_date
pb_tous pb_tous
pb_maj_par1 pb_maj_par1
pb_maj_par2 pb_maj_par2
pb_maj_payeur pb_maj_payeur
pb_maj_secu_assure pb_maj_secu_assure
cb_autre cb_autre
gb_patient gb_patient
gb_1 gb_1
end type
global w_patient_lecture_carte_vitale_ccvitale_2024 w_patient_lecture_carte_vitale_ccvitale_2024

type variables


double var_code_local


string numero_secu_lu


// recherche des éléments pour titre de la fenêtre
string v_nom, v_prenom, v_numero_dossier, v_num_secu
date v_date_naissance

// pour les couleurs de fond
string nom_lu, prenom_lu, patro_lu, date_lu, nir_lu, cle_nir_lu
long couleur_fond 
end variables

forward prototypes
public function date date_vitale_date (string date_vitale)
public subroutine verif_couleur (integer lig)
public subroutine maj_titre_fenetre ()
public function string date_vitale_string (string date_vitale)
end prototypes

public function date date_vitale_date (string date_vitale);

// transforme une date lue en string AAAA-MM-JJ en date


return date(integer(left(date_vitale,4)), integer(mid(date_vitale,6,2)),integer(mid(date_vitale,9,2)))
end function

public subroutine verif_couleur (integer lig);


// verif couleur 



if upper(dw_liste.getitemstring(lig,"nom")) = upper(v_nom) then
	dw_liste.setitem(lig, "couleur_nom",couleur_verte)
else
	dw_liste.setitem(lig, "couleur_nom",couleur_fond_datawindow)
end if
if upper(dw_liste.getitemstring(lig,"patronyme")) = upper(v_nom) then
	dw_liste.setitem(lig, "couleur_patro",couleur_verte)
else
	dw_liste.setitem(lig, "couleur_patro",couleur_fond_datawindow)
end if
if upper(dw_liste.getitemstring(lig,"prenom")) = upper(v_prenom) then
	dw_liste.setitem(lig, "couleur_prenom",couleur_verte)
else
	dw_liste.setitem(lig, "couleur_prenom",couleur_fond_datawindow)
end if

if dw_liste.getitemdate(lig,"date_naissance") = v_date_naissance then
	dw_liste.setitem(lig, "couleur_date",couleur_verte)
else
	dw_liste.setitem(lig, "couleur_date",couleur_fond_datawindow)
end if
end subroutine

public subroutine maj_titre_fenetre ();


this.title = "Lecture Carte Vitale pour le patient "+v_nom+" "+v_prenom+" ("+string(v_numero_dossier)+")"



end subroutine

public function string date_vitale_string (string date_vitale);

// transforme une date lue en string AAAA-MM-JJ en string sous la forme jj/mm/aaaa



return mid(date_vitale,9,2) + "/" + mid(date_vitale,6,2) + "/" + left(date_vitale,4)
end function

on w_patient_lecture_carte_vitale_ccvitale_2024.create
int iCurrent
call super::create
this.pb_fermer=create pb_fermer
this.pb_maj_prenom=create pb_maj_prenom
this.dw_liste=create dw_liste
this.pb_maj_nom=create pb_maj_nom
this.pb_maj_date=create pb_maj_date
this.pb_tous=create pb_tous
this.pb_maj_par1=create pb_maj_par1
this.pb_maj_par2=create pb_maj_par2
this.pb_maj_payeur=create pb_maj_payeur
this.pb_maj_secu_assure=create pb_maj_secu_assure
this.cb_autre=create cb_autre
this.gb_patient=create gb_patient
this.gb_1=create gb_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.pb_fermer
this.Control[iCurrent+2]=this.pb_maj_prenom
this.Control[iCurrent+3]=this.dw_liste
this.Control[iCurrent+4]=this.pb_maj_nom
this.Control[iCurrent+5]=this.pb_maj_date
this.Control[iCurrent+6]=this.pb_tous
this.Control[iCurrent+7]=this.pb_maj_par1
this.Control[iCurrent+8]=this.pb_maj_par2
this.Control[iCurrent+9]=this.pb_maj_payeur
this.Control[iCurrent+10]=this.pb_maj_secu_assure
this.Control[iCurrent+11]=this.cb_autre
this.Control[iCurrent+12]=this.gb_patient
this.Control[iCurrent+13]=this.gb_1
end on

on w_patient_lecture_carte_vitale_ccvitale_2024.destroy
call super::destroy
destroy(this.pb_fermer)
destroy(this.pb_maj_prenom)
destroy(this.dw_liste)
destroy(this.pb_maj_nom)
destroy(this.pb_maj_date)
destroy(this.pb_tous)
destroy(this.pb_maj_par1)
destroy(this.pb_maj_par2)
destroy(this.pb_maj_payeur)
destroy(this.pb_maj_secu_assure)
destroy(this.cb_autre)
destroy(this.gb_patient)
destroy(this.gb_1)
end on

event open;call super::open;

centrer(this)


// recup du code patient passé en param

var_code_local = message.DoubleParm


select trim(nom), trim(prenom), numero_dossier, date_naissance into :v_nom, :v_prenom, :v_numero_dossier, :v_date_naissance from patient 
where code = :var_code_local ;


maj_titre_fenetre()


// Lecture infos

dw_liste.insertrow(0)

nom_lu = w_cc_vitale.wf_findtvitem("m_cNomBenef")
prenom_lu = w_cc_vitale.wf_findtvitem("m_cPrenomBenef")
date_lu = w_cc_vitale.wf_findtvitem("m_cDateNaissance")
nir_lu = w_cc_vitale.wf_findtvitem("m_cNIR")
cle_nir_lu = w_cc_vitale.wf_findtvitem("m_cCleNIR")

numero_secu_lu = nir_lu + cle_nir_lu

dw_liste.setitem(1, "nom", nom_lu)
dw_liste.setitem(1, "prenom", prenom_lu)
dw_liste.setitem(1, "date_naissance", date_vitale_date(date_lu))
dw_liste.setitem(1, "num_secu", nir_lu + "/" + cle_nir_lu )

gb_patient.backcolor = this.backcolor
gb_1.backcolor = this.backcolor
colore_datawindow(dw_liste)

// mise en place des couleurs de fond dans la dw
verif_couleur(1)



end event

type p_fond from w_fenetre_arakis`p_fond within w_patient_lecture_carte_vitale_ccvitale_2024
integer y = 772
end type

type pb_fermer from uo_picturebutton_390x120 within w_patient_lecture_carte_vitale_ccvitale_2024
integer x = 3177
integer y = 1008
integer width = 462
integer height = 152
integer taborder = 10
boolean bringtotop = true
string text = "&Fermer"
string iconname = "ACTIONS_fermer.png"
end type

event clicked;call super::clicked;
w_click_patient.b_autre_lecture_vitale = false

close(parent)
end event

type pb_maj_prenom from uo_picturebutton_390x120 within w_patient_lecture_carte_vitale_ccvitale_2024
integer x = 521
integer y = 836
integer width = 453
integer taborder = 20
boolean bringtotop = true
string text = "&Prénom"
string iconname = "ACTIONS_memoriser.png"
end type

event clicked;call super::clicked;

if dw_liste.rowcount() > 0 then
	v_nom = dw_liste.getitemString(dw_liste.getrow(),"nom")
	v_prenom = dw_liste.getitemString(dw_liste.getrow(),"prenom")
	fxg_conversion_masque(v_nom, v_prenom)
	w_click_patient.tab_1.tabpage_1.dw_fiche1.setItem(1,"prenom", v_prenom )
	if enregistrement_automatique then
		w_click_patient.cb_enregister.triggerevent(clicked!)
	end if
	verif_couleur(dw_liste.getrow())
	maj_titre_fenetre()
end if





end event

type dw_liste from datawindow within w_patient_lecture_carte_vitale_ccvitale_2024
string tag = "brush"
integer x = 14
integer y = 20
integer width = 3634
integer height = 616
integer taborder = 10
boolean bringtotop = true
boolean titlebar = true
string title = "Informations de la Carte Vitale"
string dataobject = "dw_patient_lecture_carte_vitale_ccvitale"
boolean livescroll = true
borderstyle borderstyle = styleraised!
end type

type pb_maj_nom from uo_picturebutton_390x120 within w_patient_lecture_carte_vitale_ccvitale_2024
integer x = 50
integer y = 836
integer width = 453
integer taborder = 30
boolean bringtotop = true
string text = "&Nom"
string iconname = "ACTIONS_memoriser.png"
end type

event clicked;call super::clicked;

if dw_liste.rowcount() > 0 then
	v_nom = dw_liste.getitemString(dw_liste.getrow(),"nom")
	v_prenom = dw_liste.getitemString(dw_liste.getrow(),"prenom")
	fxg_conversion_masque(v_nom, v_prenom)
	w_click_patient.tab_1.tabpage_1.dw_fiche1.setItem(1,"nom", v_nom )
	if enregistrement_automatique then
		w_click_patient.cb_enregister.triggerevent(clicked!)
	end if
	verif_couleur(dw_liste.getrow())
	maj_titre_fenetre()
end if
end event

type pb_maj_date from uo_picturebutton_390x120 within w_patient_lecture_carte_vitale_ccvitale_2024
integer x = 992
integer y = 836
integer width = 453
integer taborder = 30
boolean bringtotop = true
string text = "&Date Nais"
string iconname = "ACTIONS_memoriser.png"
end type

event clicked;call super::clicked;

if dw_liste.rowcount() > 0 then
	v_date_naissance = dw_liste.getitemDate(dw_liste.getrow(),"date_naissance")
	w_click_patient.tab_1.tabpage_1.dw_fiche1.setItem(1,"date_naissance", v_date_naissance )
	if enregistrement_automatique then
		w_click_patient.cb_enregister.triggerevent(clicked!)
	end if
	verif_couleur(dw_liste.getrow())
	maj_titre_fenetre()
end if


end event

type pb_tous from uo_picturebutton_390x120 within w_patient_lecture_carte_vitale_ccvitale_2024
integer x = 274
integer y = 1008
integer width = 919
integer taborder = 40
boolean bringtotop = true
string text = "Nom + Prénom + Date Nais"
string iconname = "ACTIONS_memoriser.png"
end type

event clicked;call super::clicked;

// On enchaine les 3 clics 
pb_maj_nom.triggerevent(clicked!)
pb_maj_prenom.triggerevent(clicked!)
pb_maj_date.triggerevent(clicked!)




end event

type pb_maj_par1 from uo_picturebutton_390x120 within w_patient_lecture_carte_vitale_ccvitale_2024
integer x = 1705
integer y = 1008
integer width = 453
integer taborder = 40
boolean bringtotop = true
string text = "Parent 1"
string iconname = "ACTIONS_memoriser.png"
end type

event clicked;call super::clicked;

if dw_liste.rowcount() > 0 then
	w_click_patient.tab_1.tabpage_1.dw_fiche1.setItem(1,"nom_parent1",  trim(dw_liste.getitemString(dw_liste.getrow(),"nom")) + " "+ trim(dw_liste.getitemString(dw_liste.getrow(),"prenom")) )
	w_click_patient.tab_1.tabpage_1.dw_fiche1.setItem(1,"secu_parent1", numero_secu_lu )
	if enregistrement_automatique then
		w_click_patient.cb_enregister.triggerevent(clicked!)
	end if
end if
end event

type pb_maj_par2 from uo_picturebutton_390x120 within w_patient_lecture_carte_vitale_ccvitale_2024
integer x = 2176
integer y = 1008
integer width = 453
integer taborder = 50
boolean bringtotop = true
string text = "Parent 2"
string iconname = "ACTIONS_memoriser.png"
end type

event clicked;call super::clicked;if dw_liste.rowcount() > 0 then
	w_click_patient.tab_1.tabpage_3.dw_parent2.setItem(1,"nom_parent2",  trim(dw_liste.getitemString(dw_liste.getrow(),"nom")) + " "+ trim(dw_liste.getitemString(dw_liste.getrow(),"prenom")) )
	w_click_patient.tab_1.tabpage_3.dw_parent2.setItem(1,"secu_parent2", numero_secu_lu )
	if enregistrement_automatique then
		w_click_patient.cb_enregister.triggerevent(clicked!)
	end if
end if
end event

type pb_maj_payeur from uo_picturebutton_390x120 within w_patient_lecture_carte_vitale_ccvitale_2024
integer x = 2647
integer y = 1008
integer width = 453
integer taborder = 50
boolean bringtotop = true
string text = "Payeur"
string iconname = "ACTIONS_memoriser.png"
end type

event clicked;call super::clicked;if dw_liste.rowcount() > 0 then
	w_click_patient.tab_1.tabpage_3.dw_parent2.setItem(1,"nom_payeur",  trim(dw_liste.getitemString(dw_liste.getrow(),"nom")) + " "+ trim(dw_liste.getitemString(dw_liste.getrow(),"prenom")) )
	w_click_patient.tab_1.tabpage_3.dw_parent2.setItem(1,"secu_payeur", numero_secu_lu )
	if enregistrement_automatique then
		w_click_patient.cb_enregister.triggerevent(clicked!)
	end if
end if
end event

type pb_maj_secu_assure from uo_picturebutton_390x120 within w_patient_lecture_carte_vitale_ccvitale_2024
integer x = 1915
integer y = 740
integer width = 919
integer taborder = 50
boolean bringtotop = true
string text = "MàJ N° Sécu Assuré"
string iconname = "ACTIONS_memoriser.png"
end type

event clicked;call super::clicked;

if dw_liste.rowcount() > 0 then
	
	// selon la case coché dans la partie 2
	choose case w_click_patient.tab_1.tabpage_2.dw_fiche2.GetItemString(1,"assure")
		case "1" 
			// Parent1
			w_click_patient.tab_1.tabpage_1.dw_fiche1.setItem(1,"secu_parent1", numero_secu_lu )
			if enregistrement_automatique then
				w_click_patient.cb_enregister.triggerevent(clicked!)
			end if
		case "2" 
			w_click_patient.tab_1.tabpage_3.dw_parent2.setItem(1,"secu_parent2", numero_secu_lu )
			if enregistrement_automatique then
				w_click_patient.cb_enregister.triggerevent(clicked!)
			end if
		Case "3"
			w_click_patient.tab_1.tabpage_3.dw_parent2.setItem(1,"secu_payeur", numero_secu_lu )
			if enregistrement_automatique then
				w_click_patient.cb_enregister.triggerevent(clicked!)
			end if
		Case "4"
			// patient
			w_click_patient.tab_1.tabpage_1.dw_fiche1.setItem(1,"secu_patient", numero_secu_lu )
			if enregistrement_automatique then
				w_click_patient.cb_enregister.triggerevent(clicked!)
			end if
	end choose
end if
end event

type cb_autre from uo_picturebutton_390x120 within w_patient_lecture_carte_vitale_ccvitale_2024
integer x = 3177
integer y = 812
integer width = 462
integer height = 152
integer taborder = 130
boolean bringtotop = true
string text = "&Autre"
string iconname = "ACTIONS_autre.png"
end type

event clicked;call super::clicked;
w_click_patient.b_autre_lecture_vitale = true

close(parent)

////
//// Script identique au bouton Carte Vitale de w_patient_maj
//param_win[1] = "4"
//param_win[2] = string(var_code_local)
//open(w_cc_vitale_patience)
//centrer_selon_fenetre(w_cc_vitale_patience, parent)
//open(w_cc_vitale)
//close(w_cc_vitale_patience)
//
end event

type gb_patient from groupbox within w_patient_lecture_carte_vitale_ccvitale_2024
integer x = 23
integer y = 752
integer width = 1518
integer height = 440
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean italic = true
long textcolor = 33554432
long backcolor = 16777215
string text = "Mises à jour Patient"
borderstyle borderstyle = styleraised!
end type

type gb_1 from groupbox within w_patient_lecture_carte_vitale_ccvitale_2024
integer x = 1678
integer y = 916
integer width = 1458
integer height = 276
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean italic = true
long textcolor = 33554432
long backcolor = 16777215
string text = "Mises à jour Noms + N° de Sécurité Sociale"
borderstyle borderstyle = styleraised!
end type

