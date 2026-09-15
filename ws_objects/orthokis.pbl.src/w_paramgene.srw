$PBExportHeader$w_paramgene.srw
forward
global type w_paramgene from w_fenetre_arakis
end type
type cb_factures from uo_picturebutton_780x120 within w_paramgene
end type
type cb_stock from uo_picturebutton_780x120 within w_paramgene
end type
type cb_enregistrer from uo_picturebutton_390x120 within w_paramgene
end type
type cb_annuler from uo_picturebutton_390x120 within w_paramgene
end type
type cb_fermer from uo_picturebutton_390x120 within w_paramgene
end type
type uo_1 from resize_fenetre within w_paramgene
end type
type tab_1 from tab within w_paramgene
end type
type tabpage_11 from userobject within tab_1
end type
type dw_11 from datawindow within tabpage_11
end type
type tabpage_11 from userobject within tab_1
dw_11 dw_11
end type
type tabpage_7 from userobject within tab_1
end type
type dw_7 from datawindow within tabpage_7
end type
type tabpage_7 from userobject within tab_1
dw_7 dw_7
end type
type tabpage_1 from userobject within tab_1
end type
type dw_1 from datawindow within tabpage_1
end type
type tabpage_1 from userobject within tab_1
dw_1 dw_1
end type
type tabpage_2 from userobject within tab_1
end type
type dw_2 from datawindow within tabpage_2
end type
type tabpage_2 from userobject within tab_1
dw_2 dw_2
end type
type tabpage_3 from userobject within tab_1
end type
type dw_3 from datawindow within tabpage_3
end type
type tabpage_3 from userobject within tab_1
dw_3 dw_3
end type
type tabpage_4 from userobject within tab_1
end type
type dw_4 from datawindow within tabpage_4
end type
type tabpage_4 from userobject within tab_1
dw_4 dw_4
end type
type tabpage_5 from userobject within tab_1
end type
type dw_5 from datawindow within tabpage_5
end type
type tabpage_5 from userobject within tab_1
dw_5 dw_5
end type
type tabpage_10 from userobject within tab_1
end type
type dw_code_sms from datawindow within tabpage_10
end type
type dw_10 from datawindow within tabpage_10
end type
type tabpage_10 from userobject within tab_1
dw_code_sms dw_code_sms
dw_10 dw_10
end type
type tabpage_8 from userobject within tab_1
end type
type dw_8 from datawindow within tabpage_8
end type
type tabpage_8 from userobject within tab_1
dw_8 dw_8
end type
type tabpage_6 from userobject within tab_1
end type
type dw_6 from datawindow within tabpage_6
end type
type tabpage_6 from userobject within tab_1
dw_6 dw_6
end type
type tabpage_9 from userobject within tab_1
end type
type dw_messages_borne from datawindow within tabpage_9
end type
type dw_9 from datawindow within tabpage_9
end type
type tabpage_9 from userobject within tab_1
dw_messages_borne dw_messages_borne
dw_9 dw_9
end type
type tab_1 from tab within w_paramgene
tabpage_11 tabpage_11
tabpage_7 tabpage_7
tabpage_1 tabpage_1
tabpage_2 tabpage_2
tabpage_3 tabpage_3
tabpage_4 tabpage_4
tabpage_5 tabpage_5
tabpage_10 tabpage_10
tabpage_8 tabpage_8
tabpage_6 tabpage_6
tabpage_9 tabpage_9
end type
type cb_odrade from uo_picturebutton_780x120 within w_paramgene
end type
type pb_1 from uo_picturebutton_780x120 within w_paramgene
end type
type pb_invisalign from uo_picturebutton_390x120 within w_paramgene
end type
type pb_insignia from uo_picturebutton_390x120 within w_paramgene
end type
type sle_copy from singlelineedit within w_paramgene
end type
type lb_champs from listbox_champs_emails within w_paramgene
end type
type pb_biver from uo_picturebutton_780x120 within w_paramgene
end type
type cb_wait_smile from uo_picturebutton_390x120 within w_paramgene
end type
type cb_dental_monitoring from uo_picturebutton_780x120 within w_paramgene
end type
type pb_aide from uo_bouton_aide within w_paramgene
end type
end forward

global type w_paramgene from w_fenetre_arakis
integer x = 18
integer y = 176
integer width = 5074
integer height = 2688
string title = "Paramètres Généraux"
cb_factures cb_factures
cb_stock cb_stock
cb_enregistrer cb_enregistrer
cb_annuler cb_annuler
cb_fermer cb_fermer
uo_1 uo_1
tab_1 tab_1
cb_odrade cb_odrade
pb_1 pb_1
pb_invisalign pb_invisalign
pb_insignia pb_insignia
sle_copy sle_copy
lb_champs lb_champs
pb_biver pb_biver
cb_wait_smile cb_wait_smile
cb_dental_monitoring cb_dental_monitoring
pb_aide pb_aide
end type
global w_paramgene w_paramgene

type variables


double fiche1x, fiche1y, fiche1w,fiche1h
double fiche2x, fiche2y, fiche2w,fiche2h
double fiche3x, fiche3y, fiche3w,fiche3h
double fiche4x, fiche4y, fiche4w,fiche4h
double fiche5x, fiche5y, fiche5w,fiche5h
double fiche6x, fiche6y, fiche6w,fiche6h
double fiche7x, fiche7y, fiche7w,fiche7h
double fiche8x, fiche8y, fiche8w,fiche8h
double fiche9x, fiche9y, fiche9w,fiche9h
double fiche10x, fiche10y, fiche10w, fiche10h
double fiche11x, fiche11y, fiche11w, fiche11h


uo_pocket uo_poc

end variables

event open;call super::open;if version_ce_logiciel < "36.90" then 
	tab_1.tabpage_10.dw_10.dataobject = "dw_paramgene_10_2026"
end if


tab_1.tabpage_1.dw_1.settransobject(SQLCA)
tab_1.tabpage_2.dw_2.settransobject(SQLCA)
tab_1.tabpage_3.dw_3.settransobject(SQLCA)
tab_1.tabpage_4.dw_4.settransobject(SQLCA)
tab_1.tabpage_5.dw_5.settransobject(SQLCA)
tab_1.tabpage_6.dw_6.settransobject(SQLCA)
tab_1.tabpage_7.dw_7.settransobject(SQLCA)
tab_1.tabpage_8.dw_8.settransobject(SQLCA)
tab_1.tabpage_9.dw_9.settransobject(SQLCA)
tab_1.tabpage_10.dw_10.settransobject(SQLCA)
tab_1.tabpage_11.dw_11.settransobject(SQLCA)

tab_1.tabpage_1.dw_1.retrieve()
tab_1.tabpage_2.dw_2.retrieve()
tab_1.tabpage_3.dw_3.retrieve()
tab_1.tabpage_4.dw_4.retrieve()
tab_1.tabpage_5.dw_5.retrieve()
tab_1.tabpage_6.dw_6.retrieve()
tab_1.tabpage_7.dw_7.retrieve()
tab_1.tabpage_8.dw_8.retrieve()
tab_1.tabpage_9.dw_9.retrieve()
tab_1.tabpage_10.dw_10.retrieve()
tab_1.tabpage_11.dw_11.retrieve()

// pour le resize ultérieur avec zoom

fiche1x = tab_1.tabpage_1.dw_1.x
fiche1y = tab_1.tabpage_1.dw_1.y
fiche1w = tab_1.tabpage_1.dw_1.width
fiche1h = tab_1.tabpage_1.dw_1.height

fiche2x = tab_1.tabpage_2.dw_2.x
fiche2y = tab_1.tabpage_2.dw_2.y
fiche2w = tab_1.tabpage_2.dw_2.width
fiche2h = tab_1.tabpage_2.dw_2.height

fiche3x = tab_1.tabpage_3.dw_3.x
fiche3y = tab_1.tabpage_3.dw_3.y
fiche3w = tab_1.tabpage_3.dw_3.width
fiche3h = tab_1.tabpage_3.dw_3.height

fiche4x = tab_1.tabpage_4.dw_4.x
fiche4y = tab_1.tabpage_4.dw_4.y
fiche4w = tab_1.tabpage_4.dw_4.width
fiche4h = tab_1.tabpage_4.dw_4.height

fiche5x = tab_1.tabpage_5.dw_5.x
fiche5y = tab_1.tabpage_5.dw_5.y
fiche5w = tab_1.tabpage_5.dw_5.width
fiche5h = tab_1.tabpage_5.dw_5.height

fiche6x = tab_1.tabpage_6.dw_6.x
fiche6y = tab_1.tabpage_6.dw_6.y
fiche6w = tab_1.tabpage_6.dw_6.width
fiche6h = tab_1.tabpage_6.dw_6.height

fiche7x = tab_1.tabpage_7.dw_7.x
fiche7y = tab_1.tabpage_7.dw_7.y
fiche7w = tab_1.tabpage_7.dw_7.width
fiche7h = tab_1.tabpage_7.dw_7.height

fiche8x = tab_1.tabpage_8.dw_8.x
fiche8y = tab_1.tabpage_8.dw_8.y
fiche8w = tab_1.tabpage_8.dw_8.width
fiche8h = tab_1.tabpage_8.dw_8.height

fiche9x = tab_1.tabpage_9.dw_9.x
fiche9y = tab_1.tabpage_9.dw_9.y
fiche9w = tab_1.tabpage_9.dw_9.width
fiche9h = tab_1.tabpage_9.dw_9.height

fiche10x = tab_1.tabpage_10.dw_10.x
fiche10y = tab_1.tabpage_10.dw_10.y
fiche10w = tab_1.tabpage_10.dw_10.width
fiche10h = tab_1.tabpage_10.dw_10.height

fiche11x = tab_1.tabpage_11.dw_11.x
fiche11y = tab_1.tabpage_11.dw_11.y
fiche11w = tab_1.tabpage_11.dw_11.width
fiche11h = tab_1.tabpage_11.dw_11.height


tab_1.tabpage_9.dw_messages_borne.settransobject(sqlca)
tab_1.tabpage_9.dw_messages_borne.retrieve()

uo_1.taille(this)

//selon les modules
//agenda graph
tab_1.tabpage_6.dw_6.modify("t_8.visible = " + string(rdv_graph))
tab_1.tabpage_6.dw_6.modify("t_9.visible = " + string(rdv_graph))
tab_1.tabpage_6.dw_6.modify("num_patient_auto_rapide.visible = " + string(rdv_graph))

// Stock
cb_stock.visible = stock

// lien tracé Odrade
cb_odrade.visible = odr

// Dental Monitoring
cb_dental_monitoring.visible = DENTAL_MONITORING

// Lien Invisalign
pb_invisalign.visible = INVISALIGN

// Lien Insignia
pb_Insignia.visible = Insignia

if Suisse then
	tab_1.tabpage_6.dw_6.modify("euro.TabSequence = 85")
	tab_1.tabpage_6.dw_6.modify("euro.BackGround.Color = 65280")
else
	tab_1.tabpage_6.dw_6.modify("euro.TabSequence = 0")
end if


// Wait and smile
cb_wait_smile.visible = WAIT_AND_SMILE


// Portail patient
tab_1.tabpage_8.visible = webcommunication

if webcommunication then
	// Ajout des items spéciaux dans les champs
	
	lb_champs.additem("{site_portail}")
	lb_champs.additem("{email}")
	lb_champs.additem("{mot_de_passe}")
end if 

// Borne salle d'attente
tab_1.tabpage_9.visible = BORNE



if Belgique or Luxembourg then
	
	tab_1.tabpage_1.dw_1.object.t_renouvellement.visible = false
	tab_1.tabpage_1.dw_1.object.t_edition_inversee.visible = false
	tab_1.tabpage_1.dw_1.object.renouv_inverse.visible = false
	
	// Autres onglets
	tab_1.tabpage_2.visible = false
	tab_1.tabpage_3.visible = false
	tab_1.tabpage_4.visible = false
	

	
	if Belgique then

		tab_1.tabpage_5.dw_5.modify("t_8.visible = 0")
		tab_1.tabpage_5.dw_5.modify("t_9.visible = 0")
		tab_1.tabpage_5.dw_5.modify("t_11.visible = 0")
		tab_1.tabpage_5.dw_5.modify("t_12.visible = 0")
	
	
		tab_1.tabpage_5.dw_5.modify("t_retro.text = 'Titulaire'")
		tab_1.tabpage_5.dw_5.modify("t_pano.text = 'Bénéficiaire'")
		tab_1.tabpage_5.dw_5.modify("t_tele.text =  'Soins'")
		tab_1.tabpage_5.dw_5.modify("t_nom_patient.text =  'Dispensateur'")
		tab_1.tabpage_5.dw_5.modify("t_date.text =  'Date'")
		tab_1.tabpage_5.dw_5.modify("t_cadre_non_soumis.text =  'Institution Percep.'")
		
		tab_1.tabpage_5.dw_5.modify("t_cadre_soumis.text =  'N° BCE'")
		tab_1.tabpage_5.dw_5.modify("t_cadre_soumis.y = 1040")
		tab_1.tabpage_5.dw_5.modify("remb_cadre2_x.y = 1040")
		tab_1.tabpage_5.dw_5.modify("remb_cadre2_y.y = 1040")

		tab_1.tabpage_5.text = "Attestation de Soins"
		tab_1.tabpage_1.dw_1.modify("t_facture_word.text = 'Justificatif Soins :'")
		
		
		tab_1.tabpage_1.dw_1.modify("t_305675.visible = 1")
		tab_1.tabpage_1.dw_1.modify("dernier.visible = 1")
		
		tab_1.tabpage_1.dw_1.modify("attestation_remboursement.visible = 1")

		tab_1.tabpage_6.dw_6.modify("maj_adulte_automatique.visible = 1")
		// Url Hector
		tab_1.tabpage_6.dw_6.modify("t_hector.visible = 1")
		tab_1.tabpage_6.dw_6.modify("url_hector.visible = 1")
		
		tab_1.tabpage_7.dw_7.modify("t_alerte_16_ans.text = 'Alerte si premier rendez-vous x jours avant 15 ans (nb de jours)'")
		

		
		cb_factures.visible = false
		
	else
		// Luxembourg
		tab_1.tabpage_5.visible = false
		tab_1.tabpage_1.dw_1.modify("t_facture_word.visible = 0")
		tab_1.tabpage_1.dw_1.modify("id_facture_word.visible = 0")
	end if

end if

If France then 
	tab_1.tabpage_5.visible = false
	
	tab_1.tabpage_11.dw_11.object.verif_niss_patient.checkbox.text = "Alerte si absence du N° de Sécurité Sociale"
	tab_1.tabpage_11.dw_11.object.verif_niss_parent1.checkbox.text = "Alerte si absence du N° de Sécurité Sociale"
end if


choose case SERIAL 
	case  "87826" 
		pb_biver.visible = true
		pb_biver.text = "Textes Biver"
	case  "87994" , "87982"
		pb_biver.visible = true
		pb_biver.text = "Config Dumu"
	case else
		pb_biver.visible = false
end choose

tab_1.tabpage_6.dw_6.object.gb_planmeca.visible = PLANMECA
tab_1.tabpage_6.dw_6.object.code_lien_radio.visible = PLANMECA

tab_1.tabpage_6.dw_6.object.gb_noteznous.visible = NOTEZNOUS
tab_1.tabpage_6.dw_6.object.t_noteznous.visible = NOTEZNOUS
tab_1.tabpage_6.dw_6.object.notez_nous_id_cabinet.visible = NOTEZNOUS


colore_tous_objets_tab(tab_1,couleur_fond_datawindow)

//tab_1.tabpage_11.dw_11.object.gb_efacturation.Background.color = couleur_fond_fenetre
//tab_1.tabpage_11.dw_11.object.gb_administratif.Background.color = couleur_fond_fenetre
//
if OPERATEUR_SMS = 2 then
	// pour les fonctions d'envois de SMS avec Dental SMS
	uo_poc = create uo_pocket
	uo_poc.triggerevent(constructor!)
	
	// listes des codes SMS
	uo_poc.get_liste_codes(tab_1.tabpage_10.dw_code_sms)
end if

IF TEA then
		tab_1.tabpage_6.dw_6.modify("t_dsapi.visible = 1")
		tab_1.tabpage_6.dw_6.modify("url_application.visible = 1")
		
		tab_1.tabpage_6.dw_6.modify("gb_tea.visible = 1")
		tab_1.tabpage_6.dw_6.modify("t_validite_questionnaire_enfant.visible = 1")
		tab_1.tabpage_6.dw_6.modify("validite_questionnaire_enfant.visible = 1")
		tab_1.tabpage_6.dw_6.modify("t_validite_questionnaire_adulte.visible = 1")
		tab_1.tabpage_6.dw_6.modify("validite_questionnaire_adulte.visible = 1")

		
end if


end event

on w_paramgene.create
int iCurrent
call super::create
this.cb_factures=create cb_factures
this.cb_stock=create cb_stock
this.cb_enregistrer=create cb_enregistrer
this.cb_annuler=create cb_annuler
this.cb_fermer=create cb_fermer
this.uo_1=create uo_1
this.tab_1=create tab_1
this.cb_odrade=create cb_odrade
this.pb_1=create pb_1
this.pb_invisalign=create pb_invisalign
this.pb_insignia=create pb_insignia
this.sle_copy=create sle_copy
this.lb_champs=create lb_champs
this.pb_biver=create pb_biver
this.cb_wait_smile=create cb_wait_smile
this.cb_dental_monitoring=create cb_dental_monitoring
this.pb_aide=create pb_aide
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_factures
this.Control[iCurrent+2]=this.cb_stock
this.Control[iCurrent+3]=this.cb_enregistrer
this.Control[iCurrent+4]=this.cb_annuler
this.Control[iCurrent+5]=this.cb_fermer
this.Control[iCurrent+6]=this.uo_1
this.Control[iCurrent+7]=this.tab_1
this.Control[iCurrent+8]=this.cb_odrade
this.Control[iCurrent+9]=this.pb_1
this.Control[iCurrent+10]=this.pb_invisalign
this.Control[iCurrent+11]=this.pb_insignia
this.Control[iCurrent+12]=this.sle_copy
this.Control[iCurrent+13]=this.lb_champs
this.Control[iCurrent+14]=this.pb_biver
this.Control[iCurrent+15]=this.cb_wait_smile
this.Control[iCurrent+16]=this.cb_dental_monitoring
this.Control[iCurrent+17]=this.pb_aide
end on

on w_paramgene.destroy
call super::destroy
destroy(this.cb_factures)
destroy(this.cb_stock)
destroy(this.cb_enregistrer)
destroy(this.cb_annuler)
destroy(this.cb_fermer)
destroy(this.uo_1)
destroy(this.tab_1)
destroy(this.cb_odrade)
destroy(this.pb_1)
destroy(this.pb_invisalign)
destroy(this.pb_insignia)
destroy(this.sle_copy)
destroy(this.lb_champs)
destroy(this.pb_biver)
destroy(this.cb_wait_smile)
destroy(this.cb_dental_monitoring)
destroy(this.pb_aide)
end on

event resize;uo_1.retaille(this)

double ratio

ratio = uo_1.ratio

tab_1.tabpage_1.dw_1.width = fiche1w * ratio
tab_1.tabpage_1.dw_1.height = fiche1h * ratio
tab_1.tabpage_2.dw_2.width = fiche2w * ratio
tab_1.tabpage_2.dw_2.height = fiche2h * ratio
tab_1.tabpage_3.dw_3.width = fiche3w * ratio
tab_1.tabpage_3.dw_3.height = fiche3h * ratio
tab_1.tabpage_4.dw_4.width = fiche4w * ratio
tab_1.tabpage_4.dw_4.height = fiche4h * ratio
tab_1.tabpage_5.dw_5.width = fiche5w * ratio
tab_1.tabpage_5.dw_5.height = fiche5h * ratio
tab_1.tabpage_6.dw_6.width = fiche6w * ratio
tab_1.tabpage_6.dw_6.height = fiche6h * ratio
tab_1.tabpage_7.dw_7.width = fiche7w * ratio
tab_1.tabpage_7.dw_7.height = fiche7h * ratio
tab_1.tabpage_8.dw_8.width = fiche8w * ratio
tab_1.tabpage_8.dw_8.height = fiche8h * ratio
tab_1.tabpage_9.dw_9.width = fiche9w * ratio
tab_1.tabpage_9.dw_9.height = fiche9h * ratio
tab_1.tabpage_10.dw_10.width = fiche10w * ratio
tab_1.tabpage_10.dw_10.height = fiche10h * ratio

tab_1.tabpage_1.dw_1.Object.DataWindow.zoom = string(int(ratio*100 ))
tab_1.tabpage_2.dw_2.Object.DataWindow.zoom = string(int(ratio*100 ))
tab_1.tabpage_3.dw_3.Object.DataWindow.zoom = string(int(ratio*100 ))
tab_1.tabpage_4.dw_4.Object.DataWindow.zoom = string(int(ratio*100 ))
tab_1.tabpage_5.dw_5.Object.DataWindow.zoom = string(int(ratio*100 ))
tab_1.tabpage_6.dw_6.Object.DataWindow.zoom = string(int(ratio*100 ))
tab_1.tabpage_7.dw_7.Object.DataWindow.zoom = string(int(ratio*100 ))
tab_1.tabpage_8.dw_8.Object.DataWindow.zoom = string(int(ratio*100 ))
tab_1.tabpage_9.dw_9.Object.DataWindow.zoom = string(int(ratio*100 ))
tab_1.tabpage_10.dw_10.Object.DataWindow.zoom = string(int(ratio*100 ))

end event

type p_fond from w_fenetre_arakis`p_fond within w_paramgene
end type

type cb_factures from uo_picturebutton_780x120 within w_paramgene
integer x = 864
integer y = 2404
integer width = 430
integer taborder = 32
string text = "Fac&tures"
end type

event clicked;call super::clicked;guo_fenetre_modale.wf_ouvrir(w_paramgene_factures)
//open(w_paramgene_factures)

end event

type cb_stock from uo_picturebutton_780x120 within w_paramgene
integer x = 434
integer y = 2404
integer width = 430
integer taborder = 32
string text = "&Stock"
end type

event clicked;call super::clicked;guo_fenetre_modale.wf_ouvrir(w_paramgene_stock)

//open(w_paramgene_stock)

end event

type cb_enregistrer from uo_picturebutton_390x120 within w_paramgene
integer x = 3904
integer y = 2404
integer width = 498
integer taborder = 40
string text = "&Enregistrer"
string iconname = "ACTIONS_enregistrer.png"
end type

event clicked;call super::clicked;tab_1.tabpage_1.dw_1.accepttext()
tab_1.tabpage_2.dw_2.accepttext()
tab_1.tabpage_3.dw_3.accepttext()
tab_1.tabpage_4.dw_4.accepttext()
tab_1.tabpage_5.dw_5.accepttext()
tab_1.tabpage_6.dw_6.accepttext()
tab_1.tabpage_7.dw_7.accepttext()
tab_1.tabpage_8.dw_8.accepttext()
tab_1.tabpage_9.dw_9.accepttext()
tab_1.tabpage_10.dw_10.accepttext()
tab_1.tabpage_11.dw_11.accepttext()

if tab_1.tabpage_1.dw_1.update() = 1 and tab_1.tabpage_2.dw_2.update() = 1 and 	tab_1.tabpage_4.dw_4.update() = 1 and tab_1.tabpage_3.dw_3.update() = 1 and &
	tab_1.tabpage_5.dw_5.update() = 1 and tab_1.tabpage_6.dw_6.update() = 1  and  tab_1.tabpage_7.dw_7.update() = 1 &
	and  tab_1.tabpage_8.dw_8.update() = 1 and  tab_1.tabpage_9.dw_9.update() = 1 and  tab_1.tabpage_10.dw_10.update() = 1 and  tab_1.tabpage_11.dw_11.update() = 1 then
	commit ;
else
	Messagebox("ATTENTION", "Erreur dans l'enregistrement des paramètres !~n~n" + sqlca.sqlerrtext)
	Rollback ;
end if

end event

type cb_annuler from uo_picturebutton_390x120 within w_paramgene
integer x = 3406
integer y = 2404
integer width = 498
integer taborder = 30
string text = "&Annuler"
string iconname = "ACTIONS_annuler.png"
end type

event clicked;call super::clicked;tab_1.tabpage_1.dw_1.retrieve()
tab_1.tabpage_2.dw_2.retrieve()
tab_1.tabpage_3.dw_3.retrieve()
tab_1.tabpage_4.dw_4.retrieve()
tab_1.tabpage_5.dw_5.retrieve()
tab_1.tabpage_6.dw_6.retrieve()
tab_1.tabpage_7.dw_7.retrieve()
tab_1.tabpage_8.dw_8.retrieve()
tab_1.tabpage_9.dw_9.retrieve()
tab_1.tabpage_10.dw_10.retrieve()
tab_1.tabpage_11.dw_11.retrieve()

end event

type cb_fermer from uo_picturebutton_390x120 within w_paramgene
integer x = 4402
integer y = 2404
integer width = 498
integer taborder = 50
string text = "&Fermer"
boolean default = true
string iconname = "ACTIONS_fermer.png"
end type

event clicked;call super::clicked;tab_1.tabpage_1.dw_1.accepttext()
tab_1.tabpage_2.dw_2.accepttext()
tab_1.tabpage_3.dw_3.accepttext()
tab_1.tabpage_4.dw_4.accepttext()
tab_1.tabpage_5.dw_5.accepttext()
tab_1.tabpage_6.dw_6.accepttext()

if tab_1.tabpage_1.dw_1.modifiedcount() > 0 or tab_1.tabpage_2.dw_2.modifiedcount() > 0 or  &
tab_1.tabpage_4.dw_4.modifiedcount() > 0 or tab_1.tabpage_3.dw_3.modifiedcount() > 0   &
or tab_1.tabpage_5.dw_5.modifiedcount() > 0 or tab_1.tabpage_6.dw_6.modifiedcount() > 0 then
	If MessageBox("ATTENTION","Vous avez fait des modifications !~n~nVoulez-vous vraiment fermer cette fenêtre sans enregistrer (et ainsi perdre les modifications) ?",Question!,YesNo!, 2) = 1 Then
		fermer_fenetre(parent)
	end if
else
	fermer_fenetre(parent)
end if
end event

type uo_1 from resize_fenetre within w_paramgene
boolean visible = false
integer x = 3136
integer y = 632
integer taborder = 2
long backcolor = 1090519039
end type

on uo_1.destroy
call resize_fenetre::destroy
end on

type tab_1 from tab within w_paramgene
event create ( )
event destroy ( )
integer x = 18
integer width = 4969
integer height = 2384
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long backcolor = 16777215
boolean focusonbuttondown = true
boolean boldselectedtext = true
alignment alignment = center!
integer selectedtab = 1
tabpage_11 tabpage_11
tabpage_7 tabpage_7
tabpage_1 tabpage_1
tabpage_2 tabpage_2
tabpage_3 tabpage_3
tabpage_4 tabpage_4
tabpage_5 tabpage_5
tabpage_10 tabpage_10
tabpage_8 tabpage_8
tabpage_6 tabpage_6
tabpage_9 tabpage_9
end type

on tab_1.create
this.tabpage_11=create tabpage_11
this.tabpage_7=create tabpage_7
this.tabpage_1=create tabpage_1
this.tabpage_2=create tabpage_2
this.tabpage_3=create tabpage_3
this.tabpage_4=create tabpage_4
this.tabpage_5=create tabpage_5
this.tabpage_10=create tabpage_10
this.tabpage_8=create tabpage_8
this.tabpage_6=create tabpage_6
this.tabpage_9=create tabpage_9
this.Control[]={this.tabpage_11,&
this.tabpage_7,&
this.tabpage_1,&
this.tabpage_2,&
this.tabpage_3,&
this.tabpage_4,&
this.tabpage_5,&
this.tabpage_10,&
this.tabpage_8,&
this.tabpage_6,&
this.tabpage_9}
end on

on tab_1.destroy
destroy(this.tabpage_11)
destroy(this.tabpage_7)
destroy(this.tabpage_1)
destroy(this.tabpage_2)
destroy(this.tabpage_3)
destroy(this.tabpage_4)
destroy(this.tabpage_5)
destroy(this.tabpage_10)
destroy(this.tabpage_8)
destroy(this.tabpage_6)
destroy(this.tabpage_9)
end on

event selectionchanged;lb_champs.visible = false
end event

type tabpage_11 from userobject within tab_1
integer x = 18
integer y = 176
integer width = 4933
integer height = 2192
long backcolor = 16777215
string text = "Administratif"
long tabtextcolor = 33554432
long tabbackcolor = 15780518
string picturename = "lc_admini.png"
long picturemaskcolor = 536870912
dw_11 dw_11
end type

on tabpage_11.create
this.dw_11=create dw_11
this.Control[]={this.dw_11}
end on

on tabpage_11.destroy
destroy(this.dw_11)
end on

type dw_11 from datawindow within tabpage_11
string tag = "brush"
integer x = 27
integer y = 148
integer width = 4827
integer height = 1688
integer taborder = 12
string title = "none"
string dataobject = "dw_paramgene_11"
boolean border = false
boolean livescroll = true
end type

event buttonclicked;if row > 0 then
	String v_commande, v_rep_efacturation
	
	this.accepttext()
	// Propagation horizontale ou verticale ...
	
	String            ls_Object
	
	ls_Object = String(dwo.name)
	
	choose case ls_Object 
			
		case "b_cherche_rep_efacturation" 
			v_rep_efacturation = string_non_nulle(getItemString(1, "rep_courriers"))
			
			v_rep_efacturation = get_repertoire("Sélectionnez le dossier des photos ...", v_rep_efacturation)

			SetItem(1, "rep_courriers", v_rep_efacturation)
			
		case "b_go_rep_efacturation" 
			
			
			
			v_rep_efacturation = string_non_nulle(getItemString(1, "rep_courriers"))
			
			v_commande = "Explorer.exe /n," + v_rep_efacturation
			
			
			run(v_commande)
					
					
	end choose
	
end if
	
end event

type tabpage_7 from userobject within tab_1
integer x = 18
integer y = 176
integer width = 4933
integer height = 2192
long backcolor = 16777215
string text = "Clinique"
long tabtextcolor = 33554432
long tabbackcolor = 15780518
string picturename = "lc_clinique_24.png"
long picturemaskcolor = 536870912
dw_7 dw_7
end type

on tabpage_7.create
this.dw_7=create dw_7
this.Control[]={this.dw_7}
end on

on tabpage_7.destroy
destroy(this.dw_7)
end on

type dw_7 from datawindow within tabpage_7
string tag = "brush"
integer x = 69
integer y = 8
integer width = 4443
integer height = 1684
integer taborder = 11
string dataobject = "dw_paramgene_7"
boolean border = false
boolean livescroll = true
end type

event updatestart;

// pour obliger les noms des colonnes


if len(trim(getitemstring(1, "nom_colonne_com3"))) = 0 then
	SetItem(1,"nom_colonne_com3","3")
end if

if len(trim(getitemstring(1, "nom_colonne_com4"))) = 0 then
	SetItem(1,"nom_colonne_com4","4")
end if

if len(trim(getitemstring(1, "nom_colonne_com5"))) = 0 then
	SetItem(1,"nom_colonne_com5","5")
end if

if len(trim(getitemstring(1, "nom_colonne_com6"))) = 0 then
	SetItem(1,"nom_colonne_com6","6")
end if








end event

type tabpage_1 from userobject within tab_1
event create ( )
event destroy ( )
integer x = 18
integer y = 176
integer width = 4933
integer height = 2192
long backcolor = 16777215
string text = "Soins / Règlements"
long tabtextcolor = 33554432
long tabbackcolor = 15780518
string picturename = "lc_soins.png"
long picturemaskcolor = 536870912
dw_1 dw_1
end type

on tabpage_1.create
this.dw_1=create dw_1
this.Control[]={this.dw_1}
end on

on tabpage_1.destroy
destroy(this.dw_1)
end on

type dw_1 from datawindow within tabpage_1
string tag = "brush"
integer x = 695
integer y = 240
integer width = 3017
integer height = 1876
integer taborder = 11
string title = "none"
string dataobject = "dw_paramgene_1"
boolean border = false
boolean livescroll = true
end type

type tabpage_2 from userobject within tab_1
integer x = 18
integer y = 176
integer width = 4933
integer height = 2192
long backcolor = 16777215
string text = "Ent. Recto"
long tabtextcolor = 33554432
long tabbackcolor = 15780518
long picturemaskcolor = 536870912
dw_2 dw_2
end type

on tabpage_2.create
this.dw_2=create dw_2
this.Control[]={this.dw_2}
end on

on tabpage_2.destroy
destroy(this.dw_2)
end on

type dw_2 from datawindow within tabpage_2
string tag = "brush centrer"
integer x = 192
integer y = 348
integer width = 3854
integer height = 1380
integer taborder = 1
string dataobject = "dw_paramgene_2_nvlle"
boolean border = false
boolean livescroll = true
end type

event buttonclicked;
if row > 0 then
	
	this.accepttext()
	// Propagation horizontale ou verticale ...
	
	String            ls_Object
	long valeur_a_propager
	
	ls_Object = String(dwo.name)
	
	If ls_Object = "b_propager_h" Then
	
		valeur_a_propager = this.getitemnumber(row, "renouv_r_x")
		
		// propagation
		this.Setitem(row, "renouv_hr_x", valeur_a_propager)
		this.Setitem(row, "renouv_hr_x", valeur_a_propager)
		this.Setitem(row, "renouv_dtepropo_x", valeur_a_propager)
		this.Setitem(row, "renouv_debtrai_x", valeur_a_propager)
		this.Setitem(row, "renouv_oui_x", valeur_a_propager)
		this.Setitem(row, "renouv_non_x", valeur_a_propager)
		this.Setitem(row, "renouv_nom1_x", valeur_a_propager)
		this.Setitem(row, "renouv_dtenais_x", valeur_a_propager)
		this.Setitem(row, "renouv_secu_x", valeur_a_propager)
	
	elseif ls_Object = "b_propager_v" then
		
		valeur_a_propager = this.getitemnumber(row, "renouv_r_y")
		
		// propagation
		this.Setitem(row, "renouv_hr_y", valeur_a_propager)
		this.Setitem(row, "renouv_hr_y", valeur_a_propager)
		this.Setitem(row, "renouv_dtepropo_y", valeur_a_propager)
		this.Setitem(row, "renouv_debtrai_y", valeur_a_propager)
		this.Setitem(row, "renouv_oui_y", valeur_a_propager)
		this.Setitem(row, "renouv_non_y", valeur_a_propager)
		this.Setitem(row, "renouv_nom1_y", valeur_a_propager)
		this.Setitem(row, "renouv_dtenais_y", valeur_a_propager)
		this.Setitem(row, "renouv_secu_y", valeur_a_propager)
		
	end if
end if

end event

type tabpage_3 from userobject within tab_1
integer x = 18
integer y = 176
integer width = 4933
integer height = 2192
long backcolor = 16777215
string text = "Ent. Recto (Rens. Médicaux)"
long tabtextcolor = 33554432
long tabbackcolor = 15780518
long picturemaskcolor = 536870912
dw_3 dw_3
end type

on tabpage_3.create
this.dw_3=create dw_3
this.Control[]={this.dw_3}
end on

on tabpage_3.destroy
destroy(this.dw_3)
end on

type dw_3 from datawindow within tabpage_3
string tag = "brush"
integer x = 247
integer y = 504
integer width = 4041
integer height = 1400
integer taborder = 3
string dataobject = "dw_paramgene_3_nvlle"
boolean border = false
boolean livescroll = true
end type

event buttonclicked;


if row > 0 then
	
	this.accepttext()
	// Propagation horizontale ou verticale ...
	
	String            ls_Object
	long valeur_a_propager
	
	ls_Object = String(dwo.name)
	
	If ls_Object = "b_propager_h" Then
	
		valeur_a_propager = this.getitemnumber(row, "renouv_semestre_x")
		
		// propagation
		this.Setitem(row, "renouv_contention_x", valeur_a_propager)
		this.Setitem(row, "renouv_nosem_x", valeur_a_propager)
		this.Setitem(row, "renouv_autres_x", valeur_a_propager)
		this.Setitem(row, "renouv_lesquels_x", valeur_a_propager)
		this.Setitem(row, "renouv_basal_max_pro_x", valeur_a_propager)
		this.Setitem(row, "renouv_basal_max_retro_x", valeur_a_propager)
		this.Setitem(row, "renouv_basal_mand_pro_x", valeur_a_propager)
		this.Setitem(row, "renouv_basal_mand_retro_x", valeur_a_propager)
		this.Setitem(row, "renouv_alveo_max_pro_x", valeur_a_propager)
		this.Setitem(row, "renouv_alveo_max_retro_x", valeur_a_propager)
		this.Setitem(row, "renouv_alveo_mand_pro_x", valeur_a_propager)
		this.Setitem(row, "renouv_alveo_mand_retro_x", valeur_a_propager)
		this.Setitem(row, "renouv_mol_cl1_x", valeur_a_propager)
		this.Setitem(row, "renouv_mol_cl2_x", valeur_a_propager)
		this.Setitem(row, "renouv_mol_cl3_x", valeur_a_propager)
		this.Setitem(row, "renouv_mol_x", valeur_a_propager)
		this.Setitem(row, "renouv_can_cl1_x", valeur_a_propager)
		this.Setitem(row, "renouv_can_cl2_x", valeur_a_propager)
		this.Setitem(row, "renouv_can_cl3_x", valeur_a_propager)
		this.Setitem(row, "renouv_can_x", valeur_a_propager)
		this.Setitem(row, "renouv_dys_x", valeur_a_propager)
		this.Setitem(row, "renouv_agene_x", valeur_a_propager)
		this.Setitem(row, "renouv_surnum_x", valeur_a_propager)
		this.Setitem(row, "renouv_malpo_x", valeur_a_propager)
		this.Setitem(row, "renouv_occl_x", valeur_a_propager)
		this.Setitem(row, "renouv_facteur_x", valeur_a_propager)
		this.Setitem(row, "renouv_plan_trait_x", valeur_a_propager)
		this.Setitem(row, "renouv_comment_x", valeur_a_propager)
		this.Setitem(row, "renouv_date_x", valeur_a_propager)
	
	elseif ls_Object = "b_propager_v" then
		
		valeur_a_propager = this.getitemnumber(row, "renouv_semestre_y")
		
		// propagation
		this.Setitem(row, "renouv_contention_y", valeur_a_propager)
		this.Setitem(row, "renouv_nosem_y", valeur_a_propager)
		this.Setitem(row, "renouv_autres_y", valeur_a_propager)
		this.Setitem(row, "renouv_lesquels_y", valeur_a_propager)
		this.Setitem(row, "renouv_basal_max_pro_y", valeur_a_propager)
		this.Setitem(row, "renouv_basal_max_retro_y", valeur_a_propager)
		this.Setitem(row, "renouv_basal_mand_pro_y", valeur_a_propager)
		this.Setitem(row, "renouv_basal_mand_retro_y", valeur_a_propager)
		this.Setitem(row, "renouv_alveo_max_pro_y", valeur_a_propager)
		this.Setitem(row, "renouv_alveo_max_retro_y", valeur_a_propager)
		this.Setitem(row, "renouv_alveo_mand_pro_y", valeur_a_propager)
		this.Setitem(row, "renouv_alveo_mand_retro_y", valeur_a_propager)
		this.Setitem(row, "renouv_mol_cl1_y", valeur_a_propager)
		this.Setitem(row, "renouv_mol_cl2_y", valeur_a_propager)
		this.Setitem(row, "renouv_mol_cl3_y", valeur_a_propager)
		this.Setitem(row, "renouv_mol_y", valeur_a_propager)
		this.Setitem(row, "renouv_can_cl1_y", valeur_a_propager)
		this.Setitem(row, "renouv_can_cl2_y", valeur_a_propager)
		this.Setitem(row, "renouv_can_cl3_y", valeur_a_propager)
		this.Setitem(row, "renouv_can_y", valeur_a_propager)
		this.Setitem(row, "renouv_dys_y", valeur_a_propager)
		this.Setitem(row, "renouv_agene_y", valeur_a_propager)
		this.Setitem(row, "renouv_surnum_y", valeur_a_propager)
		this.Setitem(row, "renouv_malpo_y", valeur_a_propager)
		this.Setitem(row, "renouv_occl_y", valeur_a_propager)
		this.Setitem(row, "renouv_facteur_y", valeur_a_propager)
		this.Setitem(row, "renouv_plan_trait_y", valeur_a_propager)
		this.Setitem(row, "renouv_comment_y", valeur_a_propager)
		this.Setitem(row, "renouv_date_y", valeur_a_propager)		
		
	end if
end if

end event

type tabpage_4 from userobject within tab_1
integer x = 18
integer y = 176
integer width = 4933
integer height = 2192
long backcolor = 16777215
string text = "Ent. Verso "
long tabtextcolor = 33554432
long tabbackcolor = 15780518
long picturemaskcolor = 536870912
dw_4 dw_4
end type

on tabpage_4.create
this.dw_4=create dw_4
this.Control[]={this.dw_4}
end on

on tabpage_4.destroy
destroy(this.dw_4)
end on

type dw_4 from datawindow within tabpage_4
string tag = "brush"
integer x = 722
integer y = 584
integer width = 2921
integer height = 1112
integer taborder = 1
string dataobject = "dw_paramgene_4_nvlle"
boolean border = false
boolean livescroll = true
end type

event buttonclicked;


if row > 0 then
	
	this.accepttext()
	// Propagation horizontale ou verticale ...
	
	String            ls_Object
	long valeur_a_propager
	
	ls_Object = String(dwo.name)
	
	If ls_Object = "b_propager_h" Then
	
		valeur_a_propager = this.getitemnumber(row, "renouv_secu_ital_x")
		
		// propagation
		this.Setitem(row, "renouv_nom_ital_x", valeur_a_propager)
		this.Setitem(row, "renouv_adr1_ital_x", valeur_a_propager)
		this.Setitem(row, "renouv_adr2_ital_x", valeur_a_propager)
		this.Setitem(row, "renouv_codep_ital_x", valeur_a_propager)
		this.Setitem(row, "renouv_ville_ital_x", valeur_a_propager)
		this.Setitem(row, "renouv_nom2_x", valeur_a_propager)
		this.Setitem(row, "renouv_dtenais2_x", valeur_a_propager)

	
	elseif ls_Object = "b_propager_v" then
		
		valeur_a_propager = this.getitemnumber(row, "renouv_secu_ital_y")
		
		// propagation
		this.Setitem(row, "renouv_nom_ital_y", valeur_a_propager)
		this.Setitem(row, "renouv_adr1_ital_y", valeur_a_propager)
		this.Setitem(row, "renouv_adr2_ital_y", valeur_a_propager)
		this.Setitem(row, "renouv_codep_ital_y", valeur_a_propager)
		this.Setitem(row, "renouv_ville_ital_y", valeur_a_propager)
		this.Setitem(row, "renouv_nom2_y", valeur_a_propager)
		this.Setitem(row, "renouv_dtenais2_y", valeur_a_propager)
		
		
	elseif 	ls_Object = "b_propager_h2" Then
	
		valeur_a_propager = this.getitemnumber(row, "remb_secu_verso_x")
		
		// propagation
		this.Setitem(row, "remb_nom_verso_x", valeur_a_propager)
		this.Setitem(row, "remb_adr1_verso_x", valeur_a_propager)
		this.Setitem(row, "remb_adr2_verso_x", valeur_a_propager)
		this.Setitem(row, "remb_codep_verso_x", valeur_a_propager)
		this.Setitem(row, "remb_ville_verso_x", valeur_a_propager)
		this.Setitem(row, "remb_nom2_verso_x", valeur_a_propager)
		this.Setitem(row, "remb_dtenais2_verso_x", valeur_a_propager)

	
	elseif ls_Object = "b_propager_v2" then
		
		valeur_a_propager = this.getitemnumber(row, "remb_secu_verso_y")
		
		// propagation
		this.Setitem(row, "remb_nom_verso_y", valeur_a_propager)
		this.Setitem(row, "remb_adr1_verso_y", valeur_a_propager)
		this.Setitem(row, "remb_adr2_verso_y", valeur_a_propager)
		this.Setitem(row, "remb_codep_verso_y", valeur_a_propager)
		this.Setitem(row, "remb_ville_verso_y", valeur_a_propager)
		this.Setitem(row, "remb_nom2_verso_y", valeur_a_propager)
		this.Setitem(row, "remb_dtenais2_verso_y", valeur_a_propager)
		
	end if
end if

end event

type tabpage_5 from userobject within tab_1
integer x = 18
integer y = 176
integer width = 4933
integer height = 2192
long backcolor = 16777215
string text = "FS Recto"
long tabtextcolor = 33554432
long tabbackcolor = 15780518
long picturemaskcolor = 536870912
dw_5 dw_5
end type

on tabpage_5.create
this.dw_5=create dw_5
this.Control[]={this.dw_5}
end on

on tabpage_5.destroy
destroy(this.dw_5)
end on

type dw_5 from datawindow within tabpage_5
string tag = "brush"
integer x = 366
integer y = 500
integer width = 3506
integer height = 1256
integer taborder = 2
string dataobject = "dw_paramgene_6"
boolean border = false
boolean livescroll = true
end type

event buttonclicked;




if row > 0 then
	
	this.accepttext()
	// Propagation horizontale ou verticale ...
	
	String            ls_Object
	long valeur_a_propager
	
	ls_Object = String(dwo.name)
	
	if 	ls_Object = "b_propager_h" Then
	
		valeur_a_propager = this.getitemnumber(row, "remb_retro_x")
		
		// propagation
		this.Setitem(row, "remb_pano_x", valeur_a_propager)
		this.Setitem(row, "remb_tele_x", valeur_a_propager)
		this.Setitem(row, "remb_nom_x", valeur_a_propager)
		this.Setitem(row, "remb_cadre1_x", valeur_a_propager)
		this.Setitem(row, "remb_cadre2_x", valeur_a_propager)
		this.Setitem(row, "remb_date_x", valeur_a_propager)
	
	elseif ls_Object = "b_propager_v" then
		
		valeur_a_propager = this.getitemnumber(row, "remb_retro_y")
		
		// propagation
		this.Setitem(row, "remb_pano_y", valeur_a_propager)
		this.Setitem(row, "remb_tele_y", valeur_a_propager)
		this.Setitem(row, "remb_nom_y", valeur_a_propager)
		this.Setitem(row, "remb_cadre1_y", valeur_a_propager)
		this.Setitem(row, "remb_cadre2_y", valeur_a_propager)
		this.Setitem(row, "remb_date_y", valeur_a_propager)
		
	end if
end if

end event

type tabpage_10 from userobject within tab_1
integer x = 18
integer y = 176
integer width = 4933
integer height = 2192
long backcolor = 16777215
string text = "Rendez-vous"
long tabtextcolor = 33554432
long tabbackcolor = 15780518
string picturename = "lc_rdv.png"
long picturemaskcolor = 536870912
dw_code_sms dw_code_sms
dw_10 dw_10
end type

on tabpage_10.create
this.dw_code_sms=create dw_code_sms
this.dw_10=create dw_10
this.Control[]={this.dw_code_sms,&
this.dw_10}
end on

on tabpage_10.destroy
destroy(this.dw_code_sms)
destroy(this.dw_10)
end on

type dw_code_sms from datawindow within tabpage_10
string tag = "no resize all brush"
boolean visible = false
integer x = 2487
integer y = 1044
integer width = 2450
integer height = 1144
integer taborder = 40
boolean titlebar = true
string title = "Liste des Messages Dental SMS"
string dataobject = "dw_code_sms_ddlb"
boolean vscrollbar = true
borderstyle borderstyle = styleraised!
end type

event clicked;If row > 0 Then
	This.SelectRow(0,False)
	This.SelectRow(row,True)
	This.setrow(row)
End If

end event

event doubleclicked;

tab_1.tabpage_10.dw_10.setitem(1, tab_1.tabpage_10.dw_10.getcolumn(), this.getitemnumber(this.getrow(), "code"))

this.visible = false

end event

event rbuttondown;this.visible = false

end event

type dw_10 from datawindow within tabpage_10
string tag = "brush"
integer x = 50
integer y = 16
integer width = 4841
integer height = 2176
integer taborder = 20
string dataobject = "dw_paramgene_10"
boolean border = false
boolean livescroll = true
end type

event rbuttondown;

// Si on est dans une zone de rappel de text de SMS ... on déclenche la liste

string	ls_Object
string	ls_win
long couleur_choisie
string v_message

ls_Object = String(dwo.name)


choose case ls_object
	case "sms_message_arrivee_patient" 
		dw_code_sms.visible = true
	
	case "sms_message_depart_patient" 
		dw_code_sms.visible = true

end choose

return 1
end event

type tabpage_8 from userobject within tab_1
integer x = 18
integer y = 176
integer width = 4933
integer height = 2192
long backcolor = 16777215
string text = "Portail Patient"
long tabtextcolor = 33554432
long tabbackcolor = 15780518
long picturemaskcolor = 536870912
dw_8 dw_8
end type

on tabpage_8.create
this.dw_8=create dw_8
this.Control[]={this.dw_8}
end on

on tabpage_8.destroy
destroy(this.dw_8)
end on

type dw_8 from datawindow within tabpage_8
string tag = "brush centrer"
integer x = 160
integer y = 212
integer width = 4087
integer height = 1800
integer taborder = 12
string title = "none"
string dataobject = "dw_paramgene_8"
boolean border = false
boolean livescroll = true
end type

event rbuttondown;

lb_champs.visible = true
end event

type tabpage_6 from userobject within tab_1
integer x = 18
integer y = 176
integer width = 4933
integer height = 2192
long backcolor = 16777215
string text = "Autres"
long tabtextcolor = 33554432
long tabbackcolor = 15780518
long picturemaskcolor = 536870912
dw_6 dw_6
end type

on tabpage_6.create
this.dw_6=create dw_6
this.Control[]={this.dw_6}
end on

on tabpage_6.destroy
destroy(this.dw_6)
end on

type dw_6 from datawindow within tabpage_6
string tag = "brush"
integer x = 233
integer y = 40
integer width = 4082
integer height = 2112
integer taborder = 10
string dataobject = "dw_paramgene_5"
boolean border = false
boolean livescroll = true
end type

event itemchanged;

if dwo.type = "column" then
	
	//sélection suivant le nom de la "column" de la data window que l'on quitte
	choose case dwo.name
		
		case "mot_de_passe_acces_table_praticiens"
			this.accepttext()
			
			if this.getitemstring(row, "mot_de_passe_acces_table_praticiens") = "O" then		// Il faut tester la valeur AVANT la mise à jour
				
				Messagebox("ATTENTION", "Pour enlever cette restriction, vous devez indiquer le mot de passe administrateur à l'étape suivante.")
				
				ok_mdp = false
				guo_fenetre_modale.wf_ouvrir(w_mot_passe_administrateur)
				if ok_mdp then 
					Messagebox("INFORMATION", "La restriction a été enlevée.")
				else
					Messagebox("INFORMATION", "La restriction est maintenue.")
					// On ne valid pas d'itemchanged
					return 2
				end if

				
			end if
	end choose
end if

end event

type tabpage_9 from userobject within tab_1
integer x = 18
integer y = 176
integer width = 4933
integer height = 2192
long backcolor = 16777215
string text = "Borne"
long tabtextcolor = 33554432
long tabbackcolor = 15780518
string picturename = "borne.png"
long picturemaskcolor = 536870912
dw_messages_borne dw_messages_borne
dw_9 dw_9
end type

on tabpage_9.create
this.dw_messages_borne=create dw_messages_borne
this.dw_9=create dw_9
this.Control[]={this.dw_messages_borne,&
this.dw_9}
end on

on tabpage_9.destroy
destroy(this.dw_messages_borne)
destroy(this.dw_9)
end on

type dw_messages_borne from datawindow within tabpage_9
string tag = "brush no resize all"
boolean visible = false
integer x = 3035
integer y = 116
integer width = 1536
integer height = 1612
integer taborder = 20
boolean bringtotop = true
boolean titlebar = true
string title = "Messages Borne Salle d~'Attente"
string dataobject = "dw_messages_borne_affichage"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;If row > 0 Then
	This.SelectRow(0,False)
	This.SelectRow(row,True)
End If

end event

event doubleclicked;// On remplace le message complet



dw_9.accepttext()

if this.rowcount() > 0 and dw_9.rowcount() > 0 then

	dw_9.SetItem(1, "message_borne", this.GetItemString(row, "message"))

end if

this.visible = FALSE


end event

event rbuttondown;this.visible = FALSE
end event

type dw_9 from datawindow within tabpage_9
string tag = "brush"
integer x = 192
integer y = 540
integer width = 3634
integer height = 988
integer taborder = 20
string dataobject = "dw_paramgene_9"
boolean border = false
boolean livescroll = true
end type

event buttonclicked;string	ls_Object
string	ls_win

ls_Object = String(dwo.name)


choose case ls_object
	case "b_effacer" 
	// Historique des changements de type de dossier
	if row > 0 then
		this.setitem(1,"message_borne", "")
	end if

end choose
end event

event rbuttondown;

dw_messages_borne.visible = true

return 1
end event

type cb_odrade from uo_picturebutton_780x120 within w_paramgene
integer x = 1294
integer y = 2404
integer width = 430
integer taborder = 42
boolean bringtotop = true
string text = "&Odrade"
string iconname = "lc_odrade.png"
end type

event clicked;call super::clicked;guo_fenetre_modale.wf_ouvrir(w_paramgene_odrade)
//open(w_paramgene_odrade)

end event

type pb_1 from uo_picturebutton_780x120 within w_paramgene
integer x = 1723
integer y = 2404
integer width = 430
integer taborder = 52
boolean bringtotop = true
string text = "&MàJ Central."
end type

event clicked;call super::clicked;

//open(w_maj_centralisee_config)
guo_fenetre_modale.wf_ouvrir(w_maj_centralisee_config)
end event

type pb_invisalign from uo_picturebutton_390x120 within w_paramgene
boolean visible = false
integer x = 2583
integer y = 2404
integer width = 197
integer taborder = 62
boolean bringtotop = true
string text = "Inv."
string tiptext = "Invisalign"
end type

event clicked;call super::clicked;guo_fenetre_modale.wf_ouvrir(w_invisalign_config)
//open(w_invisalign_config)
end event

type pb_insignia from uo_picturebutton_390x120 within w_paramgene
boolean visible = false
integer x = 2779
integer y = 2404
integer width = 197
integer taborder = 72
boolean bringtotop = true
string text = "Ins."
string tiptext = "Insignia"
end type

event clicked;call super::clicked;guo_fenetre_modale.wf_ouvrir(w_insignia_config)
//open(w_insignia_config)
end event

type sle_copy from singlelineedit within w_paramgene
boolean visible = false
integer y = 2220
integer width = 745
integer height = 112
integer taborder = 70
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

type lb_champs from listbox_champs_emails within w_paramgene
boolean visible = false
integer x = 3227
integer y = 156
integer taborder = 21
boolean bringtotop = true
end type

event doubleclicked;call super::doubleclicked;

tab_1.tabpage_8.dw_8.accepttext()

// on peut pas utiliser ça car des items sont ajoutés au runtime 
// sle_copy.text = lb_champs.item[index]

if lb_champs.item[index] <> "-" then

	sle_copy.text = lb_champs.selectedItem()
	
	sle_copy.selectText(1, len(sle_copy.text))
	sle_copy.copy()
	
	tab_1.tabpage_8.dw_8.paste()
end if



	
end event

event rbuttondown;call super::rbuttondown;

visible = false
end event

type pb_biver from uo_picturebutton_780x120 within w_paramgene
boolean visible = false
integer x = 5
integer y = 2404
integer width = 430
integer taborder = 42
boolean bringtotop = true
string text = "Specif"
end type

event clicked;call super::clicked;
choose case SERIAL 
	case  "87826" 
		open(w_paramgene_biver)
	case  "87994" , "87982"
		open(w_dumu_config	)
end choose

end event

type cb_wait_smile from uo_picturebutton_390x120 within w_paramgene
boolean visible = false
integer x = 2976
integer y = 2404
integer width = 430
integer taborder = 82
boolean bringtotop = true
string text = "Wait && Smile"
end type

event clicked;call super::clicked;guo_fenetre_modale.wf_ouvrir(w_wait_and_smile_config_2024)

//open(w_wait_and_smile_config_2024)

end event

type cb_dental_monitoring from uo_picturebutton_780x120 within w_paramgene
boolean visible = false
integer x = 2153
integer y = 2404
integer width = 430
integer taborder = 52
boolean bringtotop = true
string text = "Dental Mon."
string tiptext = "Paramétrage de Dental Monitoring pour le cabinet"
string iconname = "lc_icone_dental_monitoring.png"
end type

event clicked;call super::clicked;

ok_mdp = false
guo_fenetre_modale.wf_ouvrir(w_mot_passe_administrateur)

if ok_mdp then
	guo_fenetre_modale.wf_ouvrir(w_dental_monitoring_config)
	//open(w_dental_monitoring_config)
end if

end event

type pb_aide from uo_bouton_aide within w_paramgene
string tag = "Paramètres Généraux"
integer x = 4896
integer y = 2416
integer width = 142
integer height = 124
integer taborder = 110
boolean bringtotop = true
end type

