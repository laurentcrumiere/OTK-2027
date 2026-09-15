$PBExportHeader$w_cc_vitale_assurance_obligatoire.srw
forward
global type w_cc_vitale_assurance_obligatoire from w_fenetre_arakis
end type
type rb_maladie from radiobutton within w_cc_vitale_assurance_obligatoire
end type
type rb_maternite from radiobutton within w_cc_vitale_assurance_obligatoire
end type
type rb_accident from radiobutton within w_cc_vitale_assurance_obligatoire
end type
type rb_smg from radiobutton within w_cc_vitale_assurance_obligatoire
end type
type cb_ok from uo_picturebutton_390x120 within w_cc_vitale_assurance_obligatoire
end type
type tab_1 from tab within w_cc_vitale_assurance_obligatoire
end type
type tabpage_maladie from userobject within tab_1
end type
type st_5 from statictext within tabpage_maladie
end type
type em_date_accident from editmask within tabpage_maladie
end type
type rb_accident_non from radiobutton within tabpage_maladie
end type
type rb_accident_oui from radiobutton within tabpage_maladie
end type
type st_4 from statictext within tabpage_maladie
end type
type tabpage_maladie from userobject within tab_1
st_5 st_5
em_date_accident em_date_accident
rb_accident_non rb_accident_non
rb_accident_oui rb_accident_oui
st_4 st_4
end type
type tabpage_maternite from userobject within tab_1
end type
type cbx_accouchement from checkbox within tabpage_maternite
end type
type em_date_maternite from editmask within tabpage_maternite
end type
type st_7 from statictext within tabpage_maternite
end type
type st_6 from statictext within tabpage_maternite
end type
type tabpage_maternite from userobject within tab_1
cbx_accouchement cbx_accouchement
em_date_maternite em_date_maternite
st_7 st_7
st_6 st_6
end type
type tabpage_accident_travail from userobject within tab_1
end type
type em_organisme_at from editmask within tabpage_accident_travail
end type
type st_9 from statictext within tabpage_accident_travail
end type
type em_feuillet_at from editmask within tabpage_accident_travail
end type
type st_3 from statictext within tabpage_accident_travail
end type
type em_date_at from editmask within tabpage_accident_travail
end type
type st_2 from statictext within tabpage_accident_travail
end type
type rb_feuillet_at_non from radiobutton within tabpage_accident_travail
end type
type rb_feuillet_at_oui from radiobutton within tabpage_accident_travail
end type
type st_1 from statictext within tabpage_accident_travail
end type
type tabpage_accident_travail from userobject within tab_1
em_organisme_at em_organisme_at
st_9 st_9
em_feuillet_at em_feuillet_at
st_3 st_3
em_date_at em_date_at
st_2 st_2
rb_feuillet_at_non rb_feuillet_at_non
rb_feuillet_at_oui rb_feuillet_at_oui
st_1 st_1
end type
type tabpage_smg from userobject within tab_1
end type
type em_montant from editmask within tabpage_smg
end type
type st_8 from statictext within tabpage_smg
end type
type cbx_accord from checkbox within tabpage_smg
end type
type tabpage_smg from userobject within tab_1
em_montant em_montant
st_8 st_8
cbx_accord cbx_accord
end type
type tab_1 from tab within w_cc_vitale_assurance_obligatoire
tabpage_maladie tabpage_maladie
tabpage_maternite tabpage_maternite
tabpage_accident_travail tabpage_accident_travail
tabpage_smg tabpage_smg
end type
type st_attestation from statictext within w_cc_vitale_assurance_obligatoire
end type
type rb_attestation_non from radiobutton within w_cc_vitale_assurance_obligatoire
end type
type rb_attestation_oui from radiobutton within w_cc_vitale_assurance_obligatoire
end type
type cbx_attentat from checkbox within w_cc_vitale_assurance_obligatoire
end type
type cbx_facturation_amc from checkbox within w_cc_vitale_assurance_obligatoire
end type
type cbx_tp_amo from checkbox within w_cc_vitale_assurance_obligatoire
end type
type cbx_tp_amc from checkbox within w_cc_vitale_assurance_obligatoire
end type
type cbx_forcage_amo from checkbox within w_cc_vitale_assurance_obligatoire
end type
type st_10 from statictext within w_cc_vitale_assurance_obligatoire
end type
type em_forcage_amo_debut from editmask within w_cc_vitale_assurance_obligatoire
end type
type st_11 from statictext within w_cc_vitale_assurance_obligatoire
end type
type em_forcage_amo_fin from editmask within w_cc_vitale_assurance_obligatoire
end type
type cbx_forcage_ald from checkbox within w_cc_vitale_assurance_obligatoire
end type
type st_12 from statictext within w_cc_vitale_assurance_obligatoire
end type
type st_13 from statictext within w_cc_vitale_assurance_obligatoire
end type
type sle_code_amo_beneficiaire from singlelineedit within w_cc_vitale_assurance_obligatoire
end type
type sle_code_amo_famille from singlelineedit within w_cc_vitale_assurance_obligatoire
end type
type cb_options from uo_picturebutton_250x120 within w_cc_vitale_assurance_obligatoire
end type
type cbx_forcage_ccam from checkbox within w_cc_vitale_assurance_obligatoire
end type
type cb_1 from uo_picturebutton_390x120 within w_cc_vitale_assurance_obligatoire
end type
type gb_assu from groupbox within w_cc_vitale_assurance_obligatoire
end type
type gb_1 from groupbox within w_cc_vitale_assurance_obligatoire
end type
end forward

global type w_cc_vitale_assurance_obligatoire from w_fenetre_arakis
integer width = 2226
integer height = 1716
string title = "ASSURANCE OBLIGATOIRE"
boolean controlmenu = false
boolean minbox = false
boolean maxbox = false
boolean resizable = false
windowtype windowtype = response!
long backcolor = 15780518
boolean center = true
rb_maladie rb_maladie
rb_maternite rb_maternite
rb_accident rb_accident
rb_smg rb_smg
cb_ok cb_ok
tab_1 tab_1
st_attestation st_attestation
rb_attestation_non rb_attestation_non
rb_attestation_oui rb_attestation_oui
cbx_attentat cbx_attentat
cbx_facturation_amc cbx_facturation_amc
cbx_tp_amo cbx_tp_amo
cbx_tp_amc cbx_tp_amc
cbx_forcage_amo cbx_forcage_amo
st_10 st_10
em_forcage_amo_debut em_forcage_amo_debut
st_11 st_11
em_forcage_amo_fin em_forcage_amo_fin
cbx_forcage_ald cbx_forcage_ald
st_12 st_12
st_13 st_13
sle_code_amo_beneficiaire sle_code_amo_beneficiaire
sle_code_amo_famille sle_code_amo_famille
cb_options cb_options
cbx_forcage_ccam cbx_forcage_ccam
cb_1 cb_1
gb_assu gb_assu
gb_1 gb_1
end type
global w_cc_vitale_assurance_obligatoire w_cc_vitale_assurance_obligatoire

type variables

integer v_numero_fichier

long v_largeur_fenetre_initiale, v_largeur_fenetre_forcage

boolean 	cbx_tp_amo_checked_defaut  
boolean 	cbx_tp_amc_checked_defaut , cbx_facturation_amc_checked_defaut
end variables

forward prototypes
public subroutine maj_tab ()
end prototypes

public subroutine maj_tab ();
// maj du tab

tab_1.tabpage_maladie.visible = false
tab_1.tabpage_maternite.visible = false
tab_1.tabpage_accident_travail.visible = false
tab_1.tabpage_smg.visible = false

if rb_maladie.checked then
	tab_1.tabpage_maladie.visible = true
	tab_1.selectedtab = 1
	cbx_tp_amo.checked = cbx_tp_amo_checked_defaut
else
	if rb_maternite.checked then
		tab_1.tabpage_maternite.visible = true
		tab_1.selectedtab = 2
		cbx_tp_amo.checked = true
	else
		if rb_accident.checked then
			tab_1.tabpage_accident_travail.visible = true
			tab_1.selectedtab = 3
		else
			if rb_smg.checked then
				tab_1.tabpage_smg.visible = true
				tab_1.selectedtab = 4
			end if
		end if
	end if
end if

end subroutine

on w_cc_vitale_assurance_obligatoire.create
int iCurrent
call super::create
this.rb_maladie=create rb_maladie
this.rb_maternite=create rb_maternite
this.rb_accident=create rb_accident
this.rb_smg=create rb_smg
this.cb_ok=create cb_ok
this.tab_1=create tab_1
this.st_attestation=create st_attestation
this.rb_attestation_non=create rb_attestation_non
this.rb_attestation_oui=create rb_attestation_oui
this.cbx_attentat=create cbx_attentat
this.cbx_facturation_amc=create cbx_facturation_amc
this.cbx_tp_amo=create cbx_tp_amo
this.cbx_tp_amc=create cbx_tp_amc
this.cbx_forcage_amo=create cbx_forcage_amo
this.st_10=create st_10
this.em_forcage_amo_debut=create em_forcage_amo_debut
this.st_11=create st_11
this.em_forcage_amo_fin=create em_forcage_amo_fin
this.cbx_forcage_ald=create cbx_forcage_ald
this.st_12=create st_12
this.st_13=create st_13
this.sle_code_amo_beneficiaire=create sle_code_amo_beneficiaire
this.sle_code_amo_famille=create sle_code_amo_famille
this.cb_options=create cb_options
this.cbx_forcage_ccam=create cbx_forcage_ccam
this.cb_1=create cb_1
this.gb_assu=create gb_assu
this.gb_1=create gb_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.rb_maladie
this.Control[iCurrent+2]=this.rb_maternite
this.Control[iCurrent+3]=this.rb_accident
this.Control[iCurrent+4]=this.rb_smg
this.Control[iCurrent+5]=this.cb_ok
this.Control[iCurrent+6]=this.tab_1
this.Control[iCurrent+7]=this.st_attestation
this.Control[iCurrent+8]=this.rb_attestation_non
this.Control[iCurrent+9]=this.rb_attestation_oui
this.Control[iCurrent+10]=this.cbx_attentat
this.Control[iCurrent+11]=this.cbx_facturation_amc
this.Control[iCurrent+12]=this.cbx_tp_amo
this.Control[iCurrent+13]=this.cbx_tp_amc
this.Control[iCurrent+14]=this.cbx_forcage_amo
this.Control[iCurrent+15]=this.st_10
this.Control[iCurrent+16]=this.em_forcage_amo_debut
this.Control[iCurrent+17]=this.st_11
this.Control[iCurrent+18]=this.em_forcage_amo_fin
this.Control[iCurrent+19]=this.cbx_forcage_ald
this.Control[iCurrent+20]=this.st_12
this.Control[iCurrent+21]=this.st_13
this.Control[iCurrent+22]=this.sle_code_amo_beneficiaire
this.Control[iCurrent+23]=this.sle_code_amo_famille
this.Control[iCurrent+24]=this.cb_options
this.Control[iCurrent+25]=this.cbx_forcage_ccam
this.Control[iCurrent+26]=this.cb_1
this.Control[iCurrent+27]=this.gb_assu
this.Control[iCurrent+28]=this.gb_1
end on

on w_cc_vitale_assurance_obligatoire.destroy
call super::destroy
destroy(this.rb_maladie)
destroy(this.rb_maternite)
destroy(this.rb_accident)
destroy(this.rb_smg)
destroy(this.cb_ok)
destroy(this.tab_1)
destroy(this.st_attestation)
destroy(this.rb_attestation_non)
destroy(this.rb_attestation_oui)
destroy(this.cbx_attentat)
destroy(this.cbx_facturation_amc)
destroy(this.cbx_tp_amo)
destroy(this.cbx_tp_amc)
destroy(this.cbx_forcage_amo)
destroy(this.st_10)
destroy(this.em_forcage_amo_debut)
destroy(this.st_11)
destroy(this.em_forcage_amo_fin)
destroy(this.cbx_forcage_ald)
destroy(this.st_12)
destroy(this.st_13)
destroy(this.sle_code_amo_beneficiaire)
destroy(this.sle_code_amo_famille)
destroy(this.cb_options)
destroy(this.cbx_forcage_ccam)
destroy(this.cb_1)
destroy(this.gb_assu)
destroy(this.gb_1)
end on

event open;call super::open;// On passe en paramètre le N° du fichier xml (déjà ouvert) 
v_numero_fichier = integer(message.doubleParm)

v_largeur_fenetre_initiale = width
v_largeur_fenetre_forcage = 3703


// Couleurs de fons
//rb_attestation_oui.backcolor = couleur_fond_fenetre
//rb_attestation_non.backcolor = couleur_fond_fenetre
//cbx_attentat.backcolor = couleur_fond_fenetre
//cbx_tp_amo.backcolor = couleur_fond_fenetre
//cbx_tp_amc.backcolor = couleur_fond_fenetre
//cbx_facturation_amc.backcolor = couleur_fond_fenetre
//cbx_forcage_amo.backcolor = couleur_fond_fenetre
//cbx_forcage_ccam.backcolor = couleur_fond_fenetre
//
if param_win[6] = '0' then
	cbx_forcage_ccam.visible = false
else
	cbx_forcage_ccam.visible = true
end if


// pour masquer les onglets inutiles
maj_tab()


// On ne demande l'attestation que si TP sur part complémentaire ou TP sur la part Obligatoire
// l'info est dans param_win[3] qui est passée à la fenetre w_cc_vitale

//if param_win[3] = '1' or param_win[2] = '1'  then
//	st_attestation.visible = true
//	rb_attestation_oui.visible = true
//	rb_attestation_non.visible = true
//end if

// Coches par défaut

if param_win[2] = '1' then
	cbx_tp_amo.checked = true
end if

if param_win[3] = '1' then
	cbx_tp_amc.checked = true
	cbx_facturation_amc.checked = true
end if


cbx_tp_amo_checked_defaut  = cbx_tp_amo.checked
cbx_tp_amc_checked_defaut = cbx_tp_amc.checked
cbx_facturation_amc_checked_defaut = cbx_facturation_amc.checked

end event

type p_fond from w_fenetre_arakis`p_fond within w_cc_vitale_assurance_obligatoire
integer y = 716
end type

type rb_maladie from radiobutton within w_cc_vitale_assurance_obligatoire
integer x = 165
integer y = 100
integer width = 402
integer height = 80
boolean bringtotop = true
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 15780518
string text = "Maladie"
boolean checked = true
end type

event clicked;maj_tab()
	
end event

type rb_maternite from radiobutton within w_cc_vitale_assurance_obligatoire
integer x = 165
integer y = 240
integer width = 402
integer height = 80
boolean bringtotop = true
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 15780518
string text = "Maternité"
end type

event clicked;maj_tab()
	
end event

type rb_accident from radiobutton within w_cc_vitale_assurance_obligatoire
integer x = 1088
integer y = 100
integer width = 741
integer height = 80
boolean bringtotop = true
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 15780518
string text = "Accident du Travail"
end type

event clicked;maj_tab()
	
end event

type rb_smg from radiobutton within w_cc_vitale_assurance_obligatoire
integer x = 1088
integer y = 240
integer width = 896
integer height = 80
boolean bringtotop = true
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 15780518
string text = "Soins Médicaux Gratuits"
end type

event clicked;maj_tab()
	
end event

type cb_ok from uo_picturebutton_390x120 within w_cc_vitale_assurance_obligatoire
integer x = 1029
integer y = 1456
integer width = 553
integer taborder = 40
boolean bringtotop = true
integer textsize = -12
fontcharset fontcharset = ansi!
string text = "Ok"
string iconname = "ACTIONS_executer.png"
end type

event clicked;call super::clicked;date v_date_temp
boolean v_saisie_ok = true

// Dans un premiere on vérifie les dates
if rb_maladie.checked then
	if not tab_1.tabpage_maladie.rb_accident_oui.checked and not tab_1.tabpage_maladie.rb_accident_non.checked  then
		Messagebox("ATTENTION !", 'Vous devez répondre à la question "Accident causé par un tiers ?"  !')
		v_saisie_ok = false
	end if
	if tab_1.tabpage_maladie.rb_accident_oui.checked then 
		if date(tab_1.tabpage_maladie.em_date_accident.text) > today() then
			Messagebox("ATTENTION !", "La date d'accident ne peut pas être postérieure à la date du jour !")
			v_saisie_ok = false
		end if
	end if
else
	if rb_maternite.checked then
		if tab_1.tabpage_maternite.em_date_maternite.text  = "00/00/0000" then
			Messagebox("ATTENTION !", "Vous devez indiquez une date de maternité ou d'accouchement !")
			v_saisie_ok = false
		end if
		if date(tab_1.tabpage_maternite.em_date_maternite.text)  > today() then
			Messagebox("ATTENTION !", "La date de maternité ou d'accouchement ne peut pas être postérieure à la date du jour !")
			v_saisie_ok = false
		end if
	else
		if rb_accident.checked then
			if tab_1.tabpage_accident_travail.rb_feuillet_at_oui.checked then
				if tab_1.tabpage_accident_travail.em_date_at.text  = "00/00/0000" then
					Messagebox("ATTENTION !", "Vous devez indiquez une date d'accident du travail !")
					v_saisie_ok = false
				end if
				if date(tab_1.tabpage_accident_travail.em_date_at.text) > today() then
					Messagebox("ATTENTION !", "La date d'accident du travail ne peut pas être postérieure à la date du jour !")
					v_saisie_ok = false
				end if
			end if
		end if
	end if
end if
		
		
if v_saisie_ok then
	// On écrit dans le fichier xml
	date(tab_1.tabpage_maternite.em_date_maternite.text)
	
	if rb_maladie.checked then
		FileWrite(v_numero_fichier, '<m_pstNatureMaladie>')
		if tab_1.tabpage_maladie.rb_accident_oui.checked then 
			w_cc_vitale.wf_ecrire_valeur_xml(v_numero_fichier, "cAccidentDroitCommun","1")
			v_date_temp = date(tab_1.tabpage_maladie.em_date_accident.text)
			w_cc_vitale.wf_ecrire_valeur_xml(v_numero_fichier, "dAccident",string(v_date_temp , "yyyy-mm-dd"))
		else
			w_cc_vitale.wf_ecrire_valeur_xml(v_numero_fichier, "cAccidentDroitCommun","0")
			w_cc_vitale.wf_ecrire_valeur_xml(v_numero_fichier, "dAccident","0000-00-00")
		end if
		FileWrite(v_numero_fichier, '</m_pstNatureMaladie>')
	else
		if rb_maternite.checked then
			FileWrite(v_numero_fichier, '<m_pstNatureMaternite>')
			v_date_temp = date(tab_1.tabpage_maternite.em_date_maternite.text)
			w_cc_vitale.wf_ecrire_valeur_xml(v_numero_fichier, "bAccidentDroitCommun","0")
			w_cc_vitale.wf_ecrire_valeur_xml(v_numero_fichier, "dMaternite",string(v_date_temp , "yyyy-mm-dd"))
			if tab_1.tabpage_maternite.cbx_accouchement.checked then
				w_cc_vitale.wf_ecrire_valeur_xml(v_numero_fichier, "bDateAccouchement","1")
			else
				w_cc_vitale.wf_ecrire_valeur_xml(v_numero_fichier, "bDateAccouchement","0")
			end if
			FileWrite(v_numero_fichier, '</m_pstNatureMaternite>')
		else
			if rb_accident.checked then
				FileWrite(v_numero_fichier, '<m_pstNatureAccidentTravail>')
				if tab_1.tabpage_accident_travail.rb_feuillet_at_oui.checked then 
					w_cc_vitale.wf_ecrire_valeur_xml(v_numero_fichier, "cFeuilletAt","1")
				else
					w_cc_vitale.wf_ecrire_valeur_xml(v_numero_fichier, "cFeuilletAt","0")
				end if
				v_date_temp = date(tab_1.tabpage_accident_travail.em_date_at.text)
				w_cc_vitale.wf_ecrire_valeur_xml(v_numero_fichier, "dAccident",string(v_date_temp , "yyyy-mm-dd"))
				w_cc_vitale.wf_ecrire_valeur_xml(v_numero_fichier, "cOrganisme",tab_1.tabpage_accident_travail.em_organisme_at.text)
				if tab_1.tabpage_accident_travail.em_feuillet_at.enabled then 
					w_cc_vitale.wf_ecrire_valeur_xml(v_numero_fichier, "cNumero",tab_1.tabpage_accident_travail.em_feuillet_at.text)
				else
					w_cc_vitale.wf_ecrire_valeur_xml(v_numero_fichier, "cNumero","")
				end if
	
				FileWrite(v_numero_fichier, '</m_pstNatureAccidentTravail>')
			else
				if rb_smg.checked then
					FileWrite(v_numero_fichier, '<m_pstNatureSmg>')
					if tab_1.tabpage_smg.cbx_accord.checked then 
						w_cc_vitale.wf_ecrire_valeur_xml(v_numero_fichier, "bAccordPriseEnCharge","1")
					else
						w_cc_vitale.wf_ecrire_valeur_xml(v_numero_fichier, "bAccordPriseEnCharge","0")
					end if
					w_cc_vitale.wf_ecrire_valeur_xml(v_numero_fichier, "mMontantPriseEnCharge", tab_1.tabpage_smg.em_montant.text)
					FileWrite(v_numero_fichier, '</m_pstNatureSmg>')
				end if
			end if
		end if
	end if

	// Gestion de l'attestation si besoin
	if rb_attestation_oui.checked then				
		w_cc_vitale.wf_ecrire_valeur_xml(v_numero_fichier, "m_cGestionAttestation","S")
	end if
	
	// Forcage des droits AMO
		if cbx_forcage_amo.checked then				
				// PS
			FileWrite(v_numero_fichier, '<m_pstForcageDroitsAmo>')
			w_cc_vitale.wf_ecrire_valeur_xml(v_numero_fichier, "dDebutValidite", w_cc_vitale.wf_date_cc_vitale(date(em_forcage_amo_debut.text)))
			w_cc_vitale.wf_ecrire_valeur_xml(v_numero_fichier, "dFinValidite", w_cc_vitale.wf_date_cc_vitale(date(em_forcage_amo_fin.text)))
			w_cc_vitale.wf_ecrire_valeur_xml(v_numero_fichier, "cCodeServiceAmoBeneficiaire", sle_code_amo_beneficiaire.text)
			w_cc_vitale.wf_ecrire_valeur_xml(v_numero_fichier, "cCodeServiceAmoFamille", sle_code_amo_famille.text)


			if cbx_forcage_ald.checked then
				w_cc_vitale.wf_ecrire_valeur_xml(v_numero_fichier, "bAttestationAld" , '1' )
			else
				w_cc_vitale.wf_ecrire_valeur_xml(v_numero_fichier, "bAttestationAld" , '0' )
			end if
	
			FileWrite(v_numero_fichier, '</m_pstForcageDroitsAmo>')
	end if
	
	// Victime attentat
	
	if cbx_attentat.checked then				
		param_win[5] =  '1' 
	else
		param_win[5] =  '0' 
	end if

	if cbx_tp_amo.checked then
		param_win[2] = '1' 
	else
		param_win[2] = '0' 
	end if
	
	if cbx_tp_amc.checked then
		param_win[3] = '1'
	else
		param_win[3] = '0'
	end if
	
	if cbx_facturation_amc.checked then
		param_win[4] = '1'
	else
		param_win[4] = '0'
	end if

	if cbx_forcage_ccam.checked then
		param_win[7] = '1'
	else
		param_win[7] = '0'
	end if

	CloseWithReturn(parent, 1)
end if



end event

type tab_1 from tab within w_cc_vitale_assurance_obligatoire
event create ( )
event destroy ( )
integer x = 91
integer y = 440
integer width = 2011
integer height = 812
integer taborder = 50
boolean bringtotop = true
integer textsize = -12
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 15780518
boolean fixedwidth = true
boolean raggedright = true
boolean focusonbuttondown = true
alignment alignment = center!
integer selectedtab = 1
tabpage_maladie tabpage_maladie
tabpage_maternite tabpage_maternite
tabpage_accident_travail tabpage_accident_travail
tabpage_smg tabpage_smg
end type

on tab_1.create
this.tabpage_maladie=create tabpage_maladie
this.tabpage_maternite=create tabpage_maternite
this.tabpage_accident_travail=create tabpage_accident_travail
this.tabpage_smg=create tabpage_smg
this.Control[]={this.tabpage_maladie,&
this.tabpage_maternite,&
this.tabpage_accident_travail,&
this.tabpage_smg}
end on

on tab_1.destroy
destroy(this.tabpage_maladie)
destroy(this.tabpage_maternite)
destroy(this.tabpage_accident_travail)
destroy(this.tabpage_smg)
end on

type tabpage_maladie from userobject within tab_1
event create ( )
event destroy ( )
integer x = 18
integer y = 124
integer width = 1975
integer height = 672
long backcolor = 15780518
string text = "Maladie"
long tabtextcolor = 33554432
long tabbackcolor = 16777215
long picturemaskcolor = 536870912
st_5 st_5
em_date_accident em_date_accident
rb_accident_non rb_accident_non
rb_accident_oui rb_accident_oui
st_4 st_4
end type

on tabpage_maladie.create
this.st_5=create st_5
this.em_date_accident=create em_date_accident
this.rb_accident_non=create rb_accident_non
this.rb_accident_oui=create rb_accident_oui
this.st_4=create st_4
this.Control[]={this.st_5,&
this.em_date_accident,&
this.rb_accident_non,&
this.rb_accident_oui,&
this.st_4}
end on

on tabpage_maladie.destroy
destroy(this.st_5)
destroy(this.em_date_accident)
destroy(this.rb_accident_non)
destroy(this.rb_accident_oui)
destroy(this.st_4)
end on

type st_5 from statictext within tabpage_maladie
integer x = 293
integer y = 352
integer width = 654
integer height = 80
boolean bringtotop = true
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 15780518
string text = "Date de l~'accident "
boolean focusrectangle = false
end type

type em_date_accident from editmask within tabpage_maladie
integer x = 955
integer y = 336
integer width = 457
integer height = 96
integer taborder = 30
boolean bringtotop = true
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 16777215
boolean enabled = false
string text = "00/00/0000"
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "dd/mm/yyyy"
end type

type rb_accident_non from radiobutton within tabpage_maladie
integer x = 1595
integer y = 176
integer width = 224
integer height = 80
boolean bringtotop = true
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 15780518
string text = "Non"
end type

event clicked;if this.checked then 
	em_date_accident.enabled = false
else
	em_date_accident.enabled = true
end if
end event

type rb_accident_oui from radiobutton within tabpage_maladie
integer x = 1600
integer y = 68
integer width = 256
integer height = 80
boolean bringtotop = true
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 15780518
string text = "Oui"
end type

event clicked;if this.checked then 
	em_date_accident.enabled = true
else
	em_date_accident.enabled = false
end if
end event

type st_4 from statictext within tabpage_maladie
integer x = 233
integer y = 96
integer width = 1349
integer height = 208
boolean bringtotop = true
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 15780518
string text = "Est-ce un accident causé par un tiers ? (accident de droit commun) "
alignment alignment = center!
boolean focusrectangle = false
end type

type tabpage_maternite from userobject within tab_1
event create ( )
event destroy ( )
boolean visible = false
integer x = 18
integer y = 124
integer width = 1975
integer height = 672
long backcolor = 15780518
string text = "Maternité"
long tabtextcolor = 33554432
long tabbackcolor = 16777215
long picturemaskcolor = 536870912
cbx_accouchement cbx_accouchement
em_date_maternite em_date_maternite
st_7 st_7
st_6 st_6
end type

on tabpage_maternite.create
this.cbx_accouchement=create cbx_accouchement
this.em_date_maternite=create em_date_maternite
this.st_7=create st_7
this.st_6=create st_6
this.Control[]={this.cbx_accouchement,&
this.em_date_maternite,&
this.st_7,&
this.st_6}
end on

on tabpage_maternite.destroy
destroy(this.cbx_accouchement)
destroy(this.em_date_maternite)
destroy(this.st_7)
destroy(this.st_6)
end on

type cbx_accouchement from checkbox within tabpage_maternite
integer x = 1143
integer y = 228
integer width = 827
integer height = 84
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 15780518
string text = "Date d~'accouchement"
end type

type em_date_maternite from editmask within tabpage_maternite
integer x = 640
integer y = 216
integer width = 453
integer height = 96
integer taborder = 40
boolean bringtotop = true
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 15793151
string text = "00/00/0000"
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "dd/mm/yyyy"
end type

type st_7 from statictext within tabpage_maternite
integer x = 32
integer y = 232
integer width = 594
integer height = 72
boolean bringtotop = true
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 15780518
string text = "Date de maternité"
boolean focusrectangle = false
end type

type st_6 from statictext within tabpage_maternite
integer x = 197
integer y = 1352
integer width = 521
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Date de maternité"
boolean focusrectangle = false
end type

type tabpage_accident_travail from userobject within tab_1
event create ( )
event destroy ( )
boolean visible = false
integer x = 18
integer y = 124
integer width = 1975
integer height = 672
long backcolor = 15780518
string text = "Accident du Travail"
long tabtextcolor = 33554432
long tabbackcolor = 15780518
long picturemaskcolor = 536870912
em_organisme_at em_organisme_at
st_9 st_9
em_feuillet_at em_feuillet_at
st_3 st_3
em_date_at em_date_at
st_2 st_2
rb_feuillet_at_non rb_feuillet_at_non
rb_feuillet_at_oui rb_feuillet_at_oui
st_1 st_1
end type

on tabpage_accident_travail.create
this.em_organisme_at=create em_organisme_at
this.st_9=create st_9
this.em_feuillet_at=create em_feuillet_at
this.st_3=create st_3
this.em_date_at=create em_date_at
this.st_2=create st_2
this.rb_feuillet_at_non=create rb_feuillet_at_non
this.rb_feuillet_at_oui=create rb_feuillet_at_oui
this.st_1=create st_1
this.Control[]={this.em_organisme_at,&
this.st_9,&
this.em_feuillet_at,&
this.st_3,&
this.em_date_at,&
this.st_2,&
this.rb_feuillet_at_non,&
this.rb_feuillet_at_oui,&
this.st_1}
end on

on tabpage_accident_travail.destroy
destroy(this.em_organisme_at)
destroy(this.st_9)
destroy(this.em_feuillet_at)
destroy(this.st_3)
destroy(this.em_date_at)
destroy(this.st_2)
destroy(this.rb_feuillet_at_non)
destroy(this.rb_feuillet_at_oui)
destroy(this.st_1)
end on

type em_organisme_at from editmask within tabpage_accident_travail
integer x = 585
integer y = 404
integer width = 462
integer height = 104
integer taborder = 40
boolean bringtotop = true
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 16777215
boolean enabled = false
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = stringmask!
string mask = "#########"
end type

event modified;if left(this.text, 2) = '01' then
	em_feuillet_at.enabled = true
else
	em_feuillet_at.enabled = false
end if
end event

type st_9 from statictext within tabpage_accident_travail
integer x = 69
integer y = 416
integer width = 430
integer height = 80
boolean bringtotop = true
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 15780518
string text = "Organismne"
boolean focusrectangle = false
end type

type em_feuillet_at from editmask within tabpage_accident_travail
integer x = 585
integer y = 532
integer width = 462
integer height = 104
integer taborder = 30
boolean bringtotop = true
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 16777215
boolean enabled = false
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = stringmask!
string mask = "#########"
end type

type st_3 from statictext within tabpage_accident_travail
integer x = 69
integer y = 544
integer width = 430
integer height = 80
boolean bringtotop = true
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 15780518
string text = "Feuillet"
boolean focusrectangle = false
end type

type em_date_at from editmask within tabpage_accident_travail
integer x = 585
integer y = 284
integer width = 462
integer height = 104
integer taborder = 20
boolean bringtotop = true
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 16777215
boolean enabled = false
string text = "00/00/0000"
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "dd/mm/yyyy"
end type

type st_2 from statictext within tabpage_accident_travail
integer x = 64
integer y = 300
integer width = 517
integer height = 80
boolean bringtotop = true
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 15780518
string text = "Date accident"
boolean focusrectangle = false
end type

type rb_feuillet_at_non from radiobutton within tabpage_accident_travail
integer x = 1403
integer y = 160
integer width = 256
integer height = 80
boolean bringtotop = true
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 15780518
string text = "Non"
end type

event clicked;if this.checked then 
	em_date_at.enabled = false
	em_organisme_at.enabled = false
	messagebox("ATTENTION", "Le feuillet A.T. est obligatoire en assurance Accident du Travail !~nSi aucun feuillet n'a été présenté, vous devez repasser en assurance Maladie.")
else
	em_date_at.enabled = true
	em_organisme_at.enabled = true
end if
end event

type rb_feuillet_at_oui from radiobutton within tabpage_accident_travail
integer x = 1403
integer y = 60
integer width = 256
integer height = 80
boolean bringtotop = true
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 15780518
string text = "Oui"
end type

event clicked;if this.checked then 
	em_date_at.enabled = true
	em_organisme_at.enabled = true
else
	em_date_at.enabled = false
	em_organisme_at.enabled = false
end if
end event

type st_1 from statictext within tabpage_accident_travail
integer x = 55
integer y = 136
integer width = 1298
integer height = 88
boolean bringtotop = true
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 15780518
string text = "Le patient a-t-il présenté un feuillet A.T. ?"
boolean focusrectangle = false
end type

type tabpage_smg from userobject within tab_1
boolean visible = false
integer x = 18
integer y = 124
integer width = 1975
integer height = 672
long backcolor = 15780518
string text = "Soins Médicaux Gratuits"
long tabtextcolor = 33554432
long tabbackcolor = 15780518
long picturemaskcolor = 536870912
em_montant em_montant
st_8 st_8
cbx_accord cbx_accord
end type

on tabpage_smg.create
this.em_montant=create em_montant
this.st_8=create st_8
this.cbx_accord=create cbx_accord
this.Control[]={this.em_montant,&
this.st_8,&
this.cbx_accord}
end on

on tabpage_smg.destroy
destroy(this.em_montant)
destroy(this.st_8)
destroy(this.cbx_accord)
end on

type em_montant from editmask within tabpage_smg
integer x = 878
integer y = 332
integer width = 457
integer height = 100
integer taborder = 40
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 16777215
string text = "0.00"
alignment alignment = right!
borderstyle borderstyle = stylelowered!
string mask = "######.00"
end type

type st_8 from statictext within tabpage_smg
integer x = 114
integer y = 344
integer width = 773
integer height = 80
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 15780518
string text = "Montant pris en charge "
boolean focusrectangle = false
end type

type cbx_accord from checkbox within tabpage_smg
integer x = 87
integer y = 144
integer width = 960
integer height = 80
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 15780518
string text = "Accord de prise en charge"
end type

type st_attestation from statictext within w_cc_vitale_assurance_obligatoire
boolean visible = false
integer x = 105
integer y = 1328
integer width = 1746
integer height = 88
boolean bringtotop = true
integer textsize = -12
fontcharset fontcharset = ansi!
string facename = "Arial"
long backcolor = 553648127
string text = "Souhaitez-vous saisir une attestation (AMC, C2S, ...) ?"
end type

type rb_attestation_non from radiobutton within w_cc_vitale_assurance_obligatoire
boolean visible = false
integer x = 1851
integer y = 1380
integer width = 256
integer height = 80
boolean bringtotop = true
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 553648127
string text = "Non"
boolean checked = true
end type

type rb_attestation_oui from radiobutton within w_cc_vitale_assurance_obligatoire
boolean visible = false
integer x = 1851
integer y = 1276
integer width = 256
integer height = 80
boolean bringtotop = true
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 553648127
string text = "Oui"
end type

type cbx_attentat from checkbox within w_cc_vitale_assurance_obligatoire
integer x = 105
integer y = 1788
integer width = 663
integer height = 92
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 553648127
string text = "Victimes d~'attentat"
end type

type cbx_facturation_amc from checkbox within w_cc_vitale_assurance_obligatoire
boolean visible = false
integer x = 105
integer y = 1488
integer width = 663
integer height = 92
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 553648127
string text = "Facturation AMC"
end type

type cbx_tp_amo from checkbox within w_cc_vitale_assurance_obligatoire
boolean visible = false
integer x = 951
integer y = 1488
integer width = 663
integer height = 92
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 553648127
string text = "Tiers Payant AMO"
end type

type cbx_tp_amc from checkbox within w_cc_vitale_assurance_obligatoire
boolean visible = false
integer x = 951
integer y = 1632
integer width = 663
integer height = 92
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 553648127
string text = "Tiers Payant AMC"
end type

type cbx_forcage_amo from checkbox within w_cc_vitale_assurance_obligatoire
integer x = 951
integer y = 1788
integer width = 731
integer height = 92
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 553648127
string text = "Forçage des droits AMO"
end type

event clicked;if checked then
	parent.width = v_largeur_fenetre_forcage
else
	parent.width = v_largeur_fenetre_initiale
end if 
end event

type st_10 from statictext within w_cc_vitale_assurance_obligatoire
integer x = 2368
integer y = 1416
integer width = 398
integer height = 72
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 15780518
string text = "Date de Début "
boolean focusrectangle = false
end type

type em_forcage_amo_debut from editmask within w_cc_vitale_assurance_obligatoire
integer x = 2834
integer y = 1392
integer width = 407
integer height = 96
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
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "dd/mm/yyyy"
end type

type st_11 from statictext within w_cc_vitale_assurance_obligatoire
integer x = 2368
integer y = 1524
integer width = 389
integer height = 72
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 15780518
string text = "Date de Fin"
boolean focusrectangle = false
end type

type em_forcage_amo_fin from editmask within w_cc_vitale_assurance_obligatoire
integer x = 2834
integer y = 1512
integer width = 407
integer height = 96
integer taborder = 60
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
string text = "none"
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "dd/mm/yyyy"
end type

type cbx_forcage_ald from checkbox within w_cc_vitale_assurance_obligatoire
integer x = 2382
integer y = 1624
integer width = 430
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
string text = "Forçage ALD"
end type

event clicked;if checked then
	cbx_tp_amo.checked = true
else
	cbx_tp_amo.checked = cbx_tp_amo_checked_defaut
end if

end event

type st_12 from statictext within w_cc_vitale_assurance_obligatoire
integer x = 2368
integer y = 1732
integer width = 850
integer height = 72
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 15780518
string text = "Code Service AMO bénéficiaire "
boolean focusrectangle = false
end type

type st_13 from statictext within w_cc_vitale_assurance_obligatoire
integer x = 2368
integer y = 1824
integer width = 850
integer height = 72
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 15780518
string text = "Code Service AMO famille"
boolean focusrectangle = false
end type

type sle_code_amo_beneficiaire from singlelineedit within w_cc_vitale_assurance_obligatoire
integer x = 3209
integer y = 1708
integer width = 178
integer height = 100
integer taborder = 70
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
integer limit = 2
borderstyle borderstyle = stylelowered!
end type

type sle_code_amo_famille from singlelineedit within w_cc_vitale_assurance_obligatoire
integer x = 3209
integer y = 1816
integer width = 178
integer height = 100
integer taborder = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
integer limit = 2
borderstyle borderstyle = stylelowered!
end type

type cb_options from uo_picturebutton_250x120 within w_cc_vitale_assurance_obligatoire
integer x = 448
integer y = 1320
integer width = 1134
integer taborder = 100
boolean bringtotop = true
string text = "Options Supplémentaires"
string iconname = "ACTIONS_dental_sms_config.png"
end type

event clicked;call super::clicked;
this.visible = false
st_attestation.visible = true
rb_attestation_non.visible = true
rb_attestation_oui.visible = true

parent.height = 2348
cb_ok.y = parent.height - 268

cbx_facturation_amc.visible = true
cbx_tp_amo.visible = true
cbx_tp_amc.visible = true
end event

type cbx_forcage_ccam from checkbox within w_cc_vitale_assurance_obligatoire
integer x = 951
integer y = 1920
integer width = 731
integer height = 92
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 553648127
string text = "Forçage CCAM"
end type

type cb_1 from uo_picturebutton_390x120 within w_cc_vitale_assurance_obligatoire
integer x = 448
integer y = 1456
integer width = 553
integer taborder = 50
boolean bringtotop = true
integer textsize = -12
fontcharset fontcharset = ansi!
string text = "Annuler"
string iconname = "ACTIONS_abandonner.png"
end type

event clicked;call super::clicked;	CloseWithReturn(parent, -1)

end event

type gb_assu from groupbox within w_cc_vitale_assurance_obligatoire
integer x = 91
integer y = 20
integer width = 2011
integer height = 388
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 15780518
long backcolor = 15780518
end type

type gb_1 from groupbox within w_cc_vitale_assurance_obligatoire
integer x = 2336
integer y = 1292
integer width = 1239
integer height = 688
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
string text = "Forçage des Droits AMO"
end type

