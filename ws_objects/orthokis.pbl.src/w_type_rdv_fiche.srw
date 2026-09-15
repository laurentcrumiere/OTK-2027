$PBExportHeader$w_type_rdv_fiche.srw
forward
global type w_type_rdv_fiche from w_param_fiche
end type
type tab_1 from tab within w_type_rdv_fiche
end type
type tabpage_1 from userobject within tab_1
end type
type lb_champs from listbox_champs_emails within tabpage_1
end type
type dw_1 from datawindow within tabpage_1
end type
type tabpage_1 from userobject within tab_1
lb_champs lb_champs
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
type cbx_16 from checkbox within tabpage_3
end type
type cbx_15 from checkbox within tabpage_3
end type
type cbx_14 from checkbox within tabpage_3
end type
type cbx_13 from checkbox within tabpage_3
end type
type cbx_12 from checkbox within tabpage_3
end type
type cbx_11 from checkbox within tabpage_3
end type
type cbx_10 from checkbox within tabpage_3
end type
type cbx_9 from checkbox within tabpage_3
end type
type cbx_8 from checkbox within tabpage_3
end type
type cbx_7 from checkbox within tabpage_3
end type
type cbx_6 from checkbox within tabpage_3
end type
type cbx_5 from checkbox within tabpage_3
end type
type cbx_4 from checkbox within tabpage_3
end type
type cbx_3 from checkbox within tabpage_3
end type
type cbx_2 from checkbox within tabpage_3
end type
type cbx_1 from checkbox within tabpage_3
end type
type dw_3 from datawindow within tabpage_3
end type
type gb_1 from groupbox within tabpage_3
end type
type tabpage_3 from userobject within tab_1
cbx_16 cbx_16
cbx_15 cbx_15
cbx_14 cbx_14
cbx_13 cbx_13
cbx_12 cbx_12
cbx_11 cbx_11
cbx_10 cbx_10
cbx_9 cbx_9
cbx_8 cbx_8
cbx_7 cbx_7
cbx_6 cbx_6
cbx_5 cbx_5
cbx_4 cbx_4
cbx_3 cbx_3
cbx_2 cbx_2
cbx_1 cbx_1
dw_3 dw_3
gb_1 gb_1
end type
type tabpage_4 from userobject within tab_1
end type
type dw_4 from u_basedw within tabpage_4
end type
type pb_4 from uo_picturebutton_250x120 within tabpage_4
end type
type pb_3 from uo_picturebutton_250x120 within tabpage_4
end type
type pb_2 from uo_picturebutton_250x120 within tabpage_4
end type
type pb_1 from uo_picturebutton_250x120 within tabpage_4
end type
type tabpage_4 from userobject within tab_1
dw_4 dw_4
pb_4 pb_4
pb_3 pb_3
pb_2 pb_2
pb_1 pb_1
end type
type tab_1 from tab within w_type_rdv_fiche
tabpage_1 tabpage_1
tabpage_2 tabpage_2
tabpage_3 tabpage_3
tabpage_4 tabpage_4
end type
type sle_copy from singlelineedit within w_type_rdv_fiche
end type
type dw_code_sms from datawindow within w_type_rdv_fiche
end type
type uo_poc from uo_pocket within w_type_rdv_fiche
end type
end forward

global type w_type_rdv_fiche from w_param_fiche
integer width = 4078
integer height = 2744
string title = "Fiche Type de Rendez-vous"
tab_1 tab_1
sle_copy sle_copy
dw_code_sms dw_code_sms
uo_poc uo_poc
end type
global w_type_rdv_fiche w_type_rdv_fiche

type variables


string var_code_type_rdv = ""

boolean dental_sms
boolean liste_code_sms_ok = false 

boolean ok_fermer = true

// pour repositionnement de la palette de couleur
integer  ii_palette_x = 0
integer ii_palette_y = 0

end variables

forward prototypes
public subroutine get_blocages ()
public subroutine set_blocages ()
end prototypes

public subroutine get_blocages ();
// Met à jour les cbx de l'onglet contraites à partir des data de dw_1

string v_blocage 

if tab_1.tabpage_1.dw_1.rowcount() > 0 then
	
	v_blocage = tab_1.tabpage_1.dw_1.GetItemString( 1, "blocages") 
	
	if mid(v_blocage,1, 1) = "O" then
		tab_1.tabpage_3.cbx_1.checked = true
	else
		tab_1.tabpage_3.cbx_1.checked = false
	end if
	
	if mid(v_blocage,2, 1) = "O" then
		tab_1.tabpage_3.cbx_2.checked = true
	else
		tab_1.tabpage_3.cbx_2.checked = false
	end if

	if mid(v_blocage,3, 1) = "O" then
		tab_1.tabpage_3.cbx_3.checked = true
	else
		tab_1.tabpage_3.cbx_3.checked = false
	end if

	if mid(v_blocage,4, 1) = "O" then
		tab_1.tabpage_3.cbx_4.checked = true
	else
		tab_1.tabpage_3.cbx_4.checked = false
	end if

	if mid(v_blocage,5, 1) = "O" then
		tab_1.tabpage_3.cbx_5.checked = true
	else
		tab_1.tabpage_3.cbx_5.checked = false
	end if

	if mid(v_blocage,6, 1) = "O" then
		tab_1.tabpage_3.cbx_6.checked = true
	else
		tab_1.tabpage_3.cbx_6.checked = false
	end if

	if mid(v_blocage,7, 1) = "O" then
		tab_1.tabpage_3.cbx_7.checked = true
	else
		tab_1.tabpage_3.cbx_7.checked = false
	end if

	if mid(v_blocage,8, 1) = "O" then
		tab_1.tabpage_3.cbx_8.checked = true
	else
		tab_1.tabpage_3.cbx_8.checked = false
	end if

	if mid(v_blocage,9, 1) = "O" then
		tab_1.tabpage_3.cbx_9.checked = true
	else
		tab_1.tabpage_3.cbx_9.checked = false
	end if

	if mid(v_blocage,10, 1) = "O" then
		tab_1.tabpage_3.cbx_10.checked = true
	else
		tab_1.tabpage_3.cbx_10.checked = false
	end if

	if mid(v_blocage,11, 1) = "O" then
		tab_1.tabpage_3.cbx_11.checked = true
	else
		tab_1.tabpage_3.cbx_11.checked = false
	end if

	if mid(v_blocage,12, 1) = "O" then
		tab_1.tabpage_3.cbx_12.checked = true
	else
		tab_1.tabpage_3.cbx_12.checked = false
	end if

	if mid(v_blocage,13, 1) = "O" then
		tab_1.tabpage_3.cbx_13.checked = true
	else
		tab_1.tabpage_3.cbx_13.checked = false
	end if

	if mid(v_blocage,14, 1) = "O" then
		tab_1.tabpage_3.cbx_14.checked = true
	else
		tab_1.tabpage_3.cbx_14.checked = false
	end if

	if mid(v_blocage,15, 1) = "O" then
		tab_1.tabpage_3.cbx_15.checked = true
	else
		tab_1.tabpage_3.cbx_15.checked = false
	end if

	if mid(v_blocage,16, 1) = "O" then
		tab_1.tabpage_3.cbx_16.checked = true
	else
		tab_1.tabpage_3.cbx_16.checked = false
	end if

	
end if



end subroutine

public subroutine set_blocages ();
// Met à jour la zone blocages de dw_1 à partir des cbx

char tab[16]
string v_blocage



if tab_1.tabpage_3.cbx_1.checked then
	tab[1] = "O"
else
	tab[1] = "N"
end if

if tab_1.tabpage_3.cbx_2.checked then
	tab[2] = "O"
else
	tab[2] = "N"
end if

if tab_1.tabpage_3.cbx_3.checked then
	tab[3] = "O"
else
	tab[3] = "N"
end if

if tab_1.tabpage_3.cbx_4.checked then
	tab[4] = "O"
else
	tab[4] = "N"
end if

if tab_1.tabpage_3.cbx_5.checked then
	tab[5] = "O"
else
	tab[5] = "N"
end if

if tab_1.tabpage_3.cbx_6.checked then
	tab[6] = "O"
else
	tab[6] = "N"
end if

if tab_1.tabpage_3.cbx_7.checked then
	tab[7] = "O"
else
	tab[7] = "N"
end if

if tab_1.tabpage_3.cbx_8.checked then
	tab[8] = "O"
else
	tab[8] = "N"
end if

if tab_1.tabpage_3.cbx_9.checked then
	tab[9] = "O"
else
	tab[9] = "N"
end if

if tab_1.tabpage_3.cbx_10.checked then
	tab[10] = "O"
else
	tab[10] = "N"
end if

if tab_1.tabpage_3.cbx_11.checked then
	tab[11] = "O"
else
	tab[11] = "N"
end if

if tab_1.tabpage_3.cbx_12.checked then
	tab[12] = "O"
else
	tab[12] = "N"
end if

if tab_1.tabpage_3.cbx_13.checked then
	tab[13] = "O"
else
	tab[13] = "N"
end if

if tab_1.tabpage_3.cbx_14.checked then
	tab[14] = "O"
else
	tab[14] = "N"
end if

if tab_1.tabpage_3.cbx_15.checked then
	tab[15] = "O"
else
	tab[15] = "N"
end if

if tab_1.tabpage_3.cbx_16.checked then
	tab[16] = "O"
else
	tab[16] = "N"
end if


if tab_1.tabpage_1.dw_1.rowcount() > 0 then
	
	// mise à jour de la datawindow
	v_blocage = tab[1]+tab[2]+tab[3]+tab[4]+tab[5]+tab[6]+tab[7]+tab[8]+tab[9]+tab[10]+tab[11]+tab[12]+tab[13]+tab[14]+tab[15]+tab[16]+"NNNNNNNNNNNNNN"
	
	tab_1.tabpage_1.dw_1.SetItem( 1, "blocages", v_blocage) 

end if



end subroutine

on w_type_rdv_fiche.create
int iCurrent
call super::create
this.tab_1=create tab_1
this.sle_copy=create sle_copy
this.dw_code_sms=create dw_code_sms
this.uo_poc=create uo_poc
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.tab_1
this.Control[iCurrent+2]=this.sle_copy
this.Control[iCurrent+3]=this.dw_code_sms
this.Control[iCurrent+4]=this.uo_poc
end on

on w_type_rdv_fiche.destroy
call super::destroy
destroy(this.tab_1)
destroy(this.sle_copy)
destroy(this.dw_code_sms)
destroy(this.uo_poc)
end on

event open;
// Passage de paramètre entre fenêtre
// après un openwithparm(nom_fenêtre,paramètre(string,number...)
//


// La mise à jour des Blocages de fait dans le retievend () et updatestart() de la dw_1

code = message.stringparm

if version_ce_logiciel < "36.90" then
	tab_1.tabpage_1.dw_1.dataobject = "dw_type_rdv_fiche_param_2025" 
	tab_1.tabpage_2.dw_2.dataobject = "dw_type_rdv_fiche_auto_2025" 
	tab_1.tabpage_3.dw_3.dataobject = "dw_type_rdv_fiche_contraintes_2025" 
end if

tab_1.tabpage_1.dw_1.settransobject(SQLCA)
tab_1.tabpage_2.dw_2.settransobject(SQLCA)
tab_1.tabpage_3.dw_3.settransobject(SQLCA)
tab_1.tabpage_4.dw_4.settransobject(SQLCA)


// Couleur de fond du tab Object 
tab_1.backcolor = couleur_fond_datawindow
tab_1.tabpage_1.backcolor = couleur_fond_datawindow
tab_1.tabpage_2.backcolor = couleur_fond_datawindow
tab_1.tabpage_3.backcolor = couleur_fond_datawindow
tab_1.tabpage_4.backcolor = couleur_fond_datawindow


// et des datawindows
colore_datawindow(tab_1.tabpage_1.dw_1)
colore_datawindow(tab_1.tabpage_2.dw_2)
colore_datawindow(tab_1.tabpage_3.dw_3)
colore_datawindow(tab_1.tabpage_4.dw_4)

tab_1.tabpage_1.dw_1.ShareData(tab_1.tabpage_2.dw_2)
tab_1.tabpage_1.dw_1.ShareData(tab_1.tabpage_3.dw_3)



if trim(code) = "" then
	// Ajout
	tab_1.tabpage_1.dw_1.retrieve(" ")
	tab_1.tabpage_1.dw_1.insertrow(0)
	tab_1.tabpage_1.dw_1.ScrollToRow(dw_fiche.rowcount())
	tab_1.tabpage_1.dw_1.SetFocus()
	tab_1.tabpage_4.dw_4.retrieve("")
else
	// Modif
	string clause
//	clause = "SELECT * FROM CORRESPONDANTS WHERE CORRESPONDANTS.CODE = '"+ CODE+"'"
//	dw_fiche.dwmodify('datawindow.table.select = "'+clause+'"')
	var_code_type_rdv = code
	tab_1.tabpage_1.dw_1.Modify("Code.Edit.DisplayOnly = Yes")
	tab_1.tabpage_1.dw_1.retrieve(var_code_type_rdv)
	tab_1.tabpage_4.dw_4.retrieve(var_code_type_rdv)
	
	this.title = title + " : "+ tab_1.tabpage_1.dw_1.getItemString(1, "nom")
end if

// Mon Orthodontiste ou Téa

if MON_ORTHODONTISTE or TEA or DENTAPOCHE then
	tab_1.tabpage_1.dw_1.OBJECT.t_mon_orthodontiste.visible = true
	tab_1.tabpage_1.dw_1.OBJECT.nom_mon_orthodontiste.visible = true
	if TEA then
		tab_1.tabpage_1.dw_1.OBJECT.t_mon_orthodontiste.text = "Libellé Téa :"
		tab_1.tabpage_1.dw_1.OBJECT.nom_mon_orthodontiste.x = 512
		
		tab_1.tabpage_2.dw_2.object.gb_ticket.width = 1883
		tab_1.tabpage_2.dw_2.object.gb_tea.visible = true
		tab_1.tabpage_2.dw_2.object.envoi_questionnaire_tea.visible = true
	else
		if DENTAPOCHE then
			tab_1.tabpage_1.dw_1.OBJECT.t_mon_orthodontiste.text = "Libellé Dentapoche :"
		end if
	end if
else
	tab_1.tabpage_1.dw_1.OBJECT.t_mon_orthodontiste.visible = false
	tab_1.tabpage_1.dw_1.OBJECT.nom_mon_orthodontiste.visible = false
end if



centrer(this)

uo_1.taille(this)


if enregistrement_automatique then
	cb_annuler.visible = false
	cb_enregistrer.visible = false
end if


// Libellés des dates
//dw_fiche.object.modif_date_premiere_demande.checkbox.text = libelle_date_prem_demande
tab_1.tabpage_2.dw_2.object.modif_date_premiere_demande.visible = 0
tab_1.tabpage_2.dw_2.object.modif_date_debut_traitement.checkbox.text = libelle_debut_traitement
tab_1.tabpage_2.dw_2.object.modif_date_interruption.checkbox.text = libelle_date_interruption

tab_1.tabpage_2.dw_2.object.modif_date_reprise.checkbox.text = libelle_date_reprise
tab_1.tabpage_2.dw_2.object.modif_date_fin_traitement.checkbox.text = libelle_fin_traitement

//if Belgique then
//	dw_fiche.object.modif_date_accord_toc.visible = 1
//else
//	dw_fiche.object.modif_date_accord_toc.visible = 0
//end if


// Dental SMS ?

if OPERATEUR_SMS = 2 then 
	dental_sms = true
else
	dental_sms = false
end if

tab_1.tabpage_2.dw_2.object.message_sms.Tooltip.enabled= Dental_SMS


// Notez Nous ?

tab_1.tabpage_2.dw_2.object.gb_noteznous.visible = NotezNous
tab_1.tabpage_2.dw_2.object.t_code_noteznous.visible = NotezNous
tab_1.tabpage_2.dw_2.object.t_email_noteznous.visible = NotezNous
tab_1.tabpage_2.dw_2.object.t_etat_noteznous.visible = NotezNous
tab_1.tabpage_2.dw_2.object.notez_nous_texte_email.visible = NotezNous
tab_1.tabpage_2.dw_2.object.notez_nous_id_formulaire.visible = NotezNous
tab_1.tabpage_2.dw_2.object.notez_nous_etat.visible = NotezNous
tab_1.tabpage_2.dw_2.object.b_efface_noteznous.visible = NotezNous
tab_1.tabpage_2.dw_2.object.notez_nous_actif.visible = NotezNous







end event

event timer;call super::timer;if version_ce_logiciel >= "36.90" then
	Timer(0)
	fxg_set_position_palette_windows(this, ii_palette_x, ii_palette_y)
end if

end event

type p_fond from w_param_fiche`p_fond within w_type_rdv_fiche
end type

type cb_fermer from w_param_fiche`cb_fermer within w_type_rdv_fiche
integer x = 2523
integer y = 2420
integer width = 562
end type

event cb_fermer::clicked;tab_1.tabpage_1.dw_1.accepttext()

// Depuis la version 15.10 on revoir le code qui vient d'être ajouter
string code_retour = ""

if tab_1.tabpage_1.dw_1.rowcount() > 0 then
	code_retour = tab_1.tabpage_1.dw_1.getItemString( 1, "code")
end if


if enregistrement_automatique then
	cb_enregistrer.triggerevent(clicked!)
	if ok_fermer then 
		CloseWithReturn(parent, code_retour)
	end if
else
	if tab_1.tabpage_1.dw_1.modifiedcount() > 0 or tab_1.tabpage_1.dw_1.deletedcount()>0 Then
		If MessageBox("ATTENTION","Vous avez fait des modifications sur le fichier !~n~nVoulez-vous vraiment fermer cette fenêtre sans enregistrer (et ainsi perdre les modifications) ?",Question!,YesNo!, 2) = 1 Then
			CloseWithReturn(parent, code_retour)
		end if
	else
		CloseWithReturn(parent, code_retour)
	end if
	
end if
end event

type cb_enregistrer from w_param_fiche`cb_enregistrer within w_type_rdv_fiche
integer x = 1920
integer y = 2420
integer width = 562
end type

event cb_enregistrer::clicked;integer v_fauteuil,  v_fauteuil_min, v_fauteuil_max


tab_1.tabpage_2.dw_2.accepttext()
tab_1.tabpage_3.dw_3.accepttext()
tab_1.tabpage_1.dw_1.accepttext()
tab_1.tabpage_4.dw_4.accepttext()

ok_fermer = true

// Vérification du code de SMS
if dental_sms then
	string str_message
	str_message = string(tab_1.tabpage_2.dw_2.getItemNumber( 1, "message_sms")) 
	

	if trim(str_message) <> "" and tab_1.tabpage_2.dw_2.getItemString( 1, "envoi_sms") = "O" then
		if not liste_code_sms_ok then
			// listes des codes SMS
			uo_poc.get_liste_codes(dw_code_sms)
			liste_code_sms_ok = true
		end if		
		if dw_code_sms.find("code = " + str_message, 0, 9999) <= 0 then
			MessageBox("ATTENTION", "Le N° de message que vous avez indiqué est inconnu dans Dental SMS !~n~nVeuillez corriger !")
			tab_1.selecttab(2)
			ok_fermer = false
		end if
	end if
end if
	
if version_ce_logiciel >= "36.90" then
	// Vérification de la cohérence des contraintes sur les N° de fauteuils 
	
	v_fauteuil = tab_1.tabpage_1.dw_1.getitemnumber(1,"fauteuil" )
	v_fauteuil_min = tab_1.tabpage_3.dw_3.getitemnumber(1,"fauteuil_min" )
	v_fauteuil_max = tab_1.tabpage_3.dw_3.getitemnumber(1,"fauteuil_max" )
	
	zeroi(v_fauteuil)
	zeroi(v_fauteuil_min)
	zeroi(v_fauteuil_max)
	
	if  v_fauteuil_max < v_fauteuil_min then 
		Messagebox("ERREUR DANS LES FAUTEUILS OBLIGATOIRES", "Vous devez indiqué des fauteuils obligatoires cohérents (minimun <= maximum) !~n~nVeuillez corriger !")
		tab_1.selecttab(3)
		ok_fermer = false
	else
		if v_fauteuil_max > 0 then 
			if v_fauteuil < v_fauteuil_min or v_fauteuil > v_fauteuil_max then 
				Messagebox("ERREUR DANS LES FAUTEUILS OBLIGATOIRES", "Vous avez indiqué des fauteuils obligatoires (entre " + string(v_fauteuil_min) + " et " + string(v_fauteuil_max )+ ") !~n~nOr vous avez indiqué un N° de fauteuil par défaut en dehors de ce créneau : " + string(v_fauteuil) + "~n~nVeuillez corriger !")
				tab_1.selecttab(1)
				ok_fermer = false
			end if
		end if
	end if
end if


if ok_fermer then

	if tab_1.tabpage_1.dw_1.update() = 1 and  tab_1.tabpage_4.dw_4.update() = 1 then
		commit ;
		
		if DOCTOLIB then
			// Mise à jour de la pile Doctolib
					
			insert into pile_doctolib ("type", "action", "origine") 
			values ('POST', 'config', 'Orthokis' ) ;
		
			if sqlca.sqlcode <> 0 then 
				messagebox("ATTENTION !", "Erreur dans la mise à jour de la Pile Doctolib !~n~n" + sqlca.sqlerrtext) 
				rollback ;
			else
				commit ;
			end if
		
		end if
		
		if TEA then
			
			// Si le type de rdv existait déjà .. on met à jour ...
			// Si c'est un ajout ... on ne fait rien car la mise à jour de Tea se fera à la sortie de w_type_rdv
			
			
			string v_code_modif
			long tot_pour_tea
			
			tot_pour_tea = w_type_rdv.dw_liste_pour_tea.rowcount()
			
			v_code_modif = trim(tab_1.tabpage_1.dw_1.getitemstring(tab_1.tabpage_1.dw_1.getrow(),"code"))
				
			if w_type_rdv.dw_liste_pour_tea.find('trim(code) = "' +  v_code_modif + '"' , 0 , tot_pour_tea) > 0 then 
				fxg_lancer_commande_dsapi("appointment-type/update/" + trim(v_code_modif), "",  "TR", "G", 0 )
			end if
		end if

	else
		Rollback ;
	end if
end if
end event

type cb_annuler from w_param_fiche`cb_annuler within w_type_rdv_fiche
integer x = 1317
integer y = 2420
integer width = 562
end type

event cb_annuler::clicked;
rollback ;
tab_1.tabpage_1.dw_1.retrieve(code) ;
end event

type cb_imprimer from w_param_fiche`cb_imprimer within w_type_rdv_fiche
boolean visible = false
integer x = 677
integer y = 2428
integer width = 402
end type

type uo_1 from w_param_fiche`uo_1 within w_type_rdv_fiche
end type

type dw_fiche from w_param_fiche`dw_fiche within w_type_rdv_fiche
boolean visible = false
integer y = 4
integer width = 626
integer height = 416
string dataobject = "dw_type_rdv_fiche_param"
end type

event dw_fiche::rbuttondown;call super::rbuttondown;//Declaration des variables locales
//--------------------------
long couleur_choisie

// Les positions seront utilisées dans le timer de la fenêtre	
ii_palette_x = xpos
ii_palette_y = ypos

Timer(0.05)

//Appel de la fenetre couleur et au retour, met la couleur de fond
//--------------------------------------------------
if appel_palette(couleur_choisie) then
	if couleur_choisie=couleur_jour_interdit then
		messagebox("Attention", "Vous ne pouvez pas choisir cette couleur, car elle correspond à la couleur des jours interdits.")
	else
		this.setitem(row,"couleur_double",couleur_choisie)
		this.setitem(row,"couleur",string(couleur_choisie))
		// On bouge le focus pour appliquer la couleur dans la zone
		this.setcolumn(1)
		this.setcolumn(6)
		this.accepttext()
		if enregistrement_automatique and cb_enregistrer.enabled then
			cb_enregistrer.triggerevent(clicked!)
		end if
	end if
end if
end event

type tab_1 from tab within w_type_rdv_fiche
integer x = 78
integer y = 16
integer width = 3909
integer height = 2372
integer taborder = 31
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
boolean fixedwidth = true
boolean focusonbuttondown = true
alignment alignment = center!
integer selectedtab = 1
tabpage_1 tabpage_1
tabpage_2 tabpage_2
tabpage_3 tabpage_3
tabpage_4 tabpage_4
end type

on tab_1.create
this.tabpage_1=create tabpage_1
this.tabpage_2=create tabpage_2
this.tabpage_3=create tabpage_3
this.tabpage_4=create tabpage_4
this.Control[]={this.tabpage_1,&
this.tabpage_2,&
this.tabpage_3,&
this.tabpage_4}
end on

on tab_1.destroy
destroy(this.tabpage_1)
destroy(this.tabpage_2)
destroy(this.tabpage_3)
destroy(this.tabpage_4)
end on

event clicked;if tab_1.tabpage_1.dw_1.rowcount() > 0 then
	var_code_type_rdv = tab_1.tabpage_1.dw_1.GetItemString(1, "code")
end if
end event

type tabpage_1 from userobject within tab_1
integer x = 18
integer y = 112
integer width = 3872
integer height = 2244
long backcolor = 16777215
string text = "Paramètres"
long tabtextcolor = 33554432
long tabbackcolor = 15780518
long picturemaskcolor = 536870912
lb_champs lb_champs
dw_1 dw_1
end type

on tabpage_1.create
this.lb_champs=create lb_champs
this.dw_1=create dw_1
this.Control[]={this.lb_champs,&
this.dw_1}
end on

on tabpage_1.destroy
destroy(this.lb_champs)
destroy(this.dw_1)
end on

type lb_champs from listbox_champs_emails within tabpage_1
boolean visible = false
integer x = 2944
integer y = 176
integer height = 524
integer taborder = 40
boolean bringtotop = true
string item[] = {"{nom}","{prenom}","{titre}","{numero_dossier}","{numero_moulage}","{heure_rdv}","{retard}","","",""}
borderstyle borderstyle = styleraised!
end type

event doubleclicked;call super::doubleclicked;

dw_fiche.accepttext()

//string texte, texte_deja, texte_final, texte_selectionne

 sle_copy.text = tab_1.tabpage_1.lb_champs.item[index]
 sle_copy.selectText(1, len(sle_copy.text))
 sle_copy.copy()

tab_1.tabpage_1.dw_1.paste()



this.visible = false


	
//texte_selectionne = dw_fiche.SelectedText()
//
//if  IsNull(texte_deja) then
//	 texte_deja = ""
//end if
//
//IF texte_deja = texte_selectionne or len(trim(texte_deja)) = 0 THEN
//	texte_final =  texte
//ELSE	
//	texte_final = texte_deja  + texte
//END IF
//
//
//dw_fiche.SetItem(1,"texte",string_To_Rtf(texte_final, couleur_noire, couleur_blanche))		
end event

event rbuttondown;call super::rbuttondown;

visible = false
end event

type dw_1 from datawindow within tabpage_1
string tag = "brush"
integer x = 274
integer y = 84
integer width = 3355
integer height = 1968
integer taborder = 20
string title = "none"
string dataobject = "dw_type_rdv_fiche_param"
boolean border = false
boolean livescroll = true
end type

event retrieveend;

get_blocages()


end event

event updatestart;

set_blocages()

end event

event rbuttondown;//Declaration des variables locales
//--------------------------
long couleur_choisie

//Appel de la fenetre couleur et au retour, met la couleur de fond
//--------------------------------------------------

Choose case getcolumn()
	case 6
		// Symbole du rendez-vous => palette de couleur
		// Les positions seront utilisées dans le timer de la fenêtre	
		ii_palette_x = xpos
		ii_palette_y = ypos

Timer(0.05)

		if appel_palette(couleur_choisie) then
			if couleur_choisie=couleur_jour_interdit then
				messagebox("Attention", "Vous ne pouvez pas choisir cette couleur, car elle correspond à la couleur des jours interdits.")
			else
				this.setitem(row,"couleur_double",couleur_choisie)
				this.setitem(row,"couleur",string(couleur_choisie))
				// On bouge le focus pour appliquer la couleur dans la zone
				this.setcolumn(1)
				this.setcolumn(6)
				this.accepttext()
				if enregistrement_automatique and cb_enregistrer.enabled then
					cb_enregistrer.triggerevent(clicked!)
				end if
			end if
		end if
	case 36
		lb_champs.visible = true
		return 1
	case 37
		lb_champs.visible = true
		return 1
end choose
		

end event

event buttonclicked;
string	ls_Object

integer i_null


if row > 0 then 
	setnull(i_null)
	
	ls_Object = String(dwo.name)
	
	
	choose case ls_object
		case "b_efface_etat_borne" 
			
			this.setitem(1, "etat_borne", "")
	
			
			if enregistrement_automatique then
				cb_enregistrer.triggerevent(clicked!)
			end if
			
		case "b_choisir_son"
			string ficname,ficpath

			if GetFileOpenName("Fichiers Son",ficname,ficpath,"WAV","Fichiers Sons (*.wav;*.mp3),*.wav; *.mp3") = 1 then
				SetItem(1, "son_borne", ficname)
			end if
			
		case "b_jouer_son"
			jouer_son(getitemString(1, "son_borne"))
	
	end choose
end if
end event

type tabpage_2 from userobject within tab_1
integer x = 18
integer y = 112
integer width = 3872
integer height = 2244
long backcolor = 16777215
string text = "Automatismes"
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
string tag = "brush"
integer x = 151
integer y = 16
integer width = 3438
integer height = 2200
integer taborder = 30
string title = "none"
string dataobject = "dw_type_rdv_fiche_auto"
boolean border = false
boolean livescroll = true
end type

event rbuttondown;
string	ls_Object
ls_Object = String(dwo.name)

if dental_sms and ls_Object = "message_sms" then
	if not liste_code_sms_ok then
		// listes des codes SMS
		uo_poc.get_liste_codes(dw_code_sms)
		liste_code_sms_ok = true
	end if
	dw_code_sms.visible = true
end if

return 1
end event

event buttonclicked;
string	ls_Object

integer i_null
double db_null
long couleur_choisie

setnull(i_null)
setnull(db_null)

ls_Object = String(dwo.name)


choose case ls_object
	case "b_efface_noteznous" 
		
		this.setitem(1, "notez_nous_etat", "")
		this.setitem(1, "notez_nous_id_formulaire", "")
		this.setitem(1, "notez_nous_texte_email", i_null)
		
		if enregistrement_automatique then
			cb_enregistrer.triggerevent(clicked!)
		end if

	case "b_efface_message_ticket_email" 
		this.setitem(1, "message_ticket_email", db_null)
		
		if enregistrement_automatique then
			cb_enregistrer.triggerevent(clicked!)
		end if


		case "b_couleur_pastille"
			// changement de couleur de la pastille
			
			ii_palette_x = unitstopixels( w_mdi_2020.pointerx() , XUnitsToPixels! ) 
			ii_palette_y = unitstopixels( w_mdi_2020.pointery() , YUnitsToPixels! ) 
							
			Timer(0.05)	// pour déclencher le repositionnement de la palette

			//Appel de la fenetre couleur et au retour, met la couleur de fond
			//--------------------------------------------------
			if appel_palette(couleur_choisie) then
				this.setitem(1,"couleur_pastille",couleur_choisie)
				this.object.b_couleur_pastille.background.color =  string(couleur_choisie)
				this.object.b_couleur_pastille.color =  string(couleur_choisie)
				this.accepttext()
				
				if enregistrement_automatique then
					cb_enregistrer.triggerevent(clicked!)
				end if
			end if
end choose
end event

type tabpage_3 from userobject within tab_1
integer x = 18
integer y = 112
integer width = 3872
integer height = 2244
long backcolor = 16777215
string text = "Contraintes"
long tabtextcolor = 33554432
long tabbackcolor = 15780518
long picturemaskcolor = 536870912
cbx_16 cbx_16
cbx_15 cbx_15
cbx_14 cbx_14
cbx_13 cbx_13
cbx_12 cbx_12
cbx_11 cbx_11
cbx_10 cbx_10
cbx_9 cbx_9
cbx_8 cbx_8
cbx_7 cbx_7
cbx_6 cbx_6
cbx_5 cbx_5
cbx_4 cbx_4
cbx_3 cbx_3
cbx_2 cbx_2
cbx_1 cbx_1
dw_3 dw_3
gb_1 gb_1
end type

on tabpage_3.create
this.cbx_16=create cbx_16
this.cbx_15=create cbx_15
this.cbx_14=create cbx_14
this.cbx_13=create cbx_13
this.cbx_12=create cbx_12
this.cbx_11=create cbx_11
this.cbx_10=create cbx_10
this.cbx_9=create cbx_9
this.cbx_8=create cbx_8
this.cbx_7=create cbx_7
this.cbx_6=create cbx_6
this.cbx_5=create cbx_5
this.cbx_4=create cbx_4
this.cbx_3=create cbx_3
this.cbx_2=create cbx_2
this.cbx_1=create cbx_1
this.dw_3=create dw_3
this.gb_1=create gb_1
this.Control[]={this.cbx_16,&
this.cbx_15,&
this.cbx_14,&
this.cbx_13,&
this.cbx_12,&
this.cbx_11,&
this.cbx_10,&
this.cbx_9,&
this.cbx_8,&
this.cbx_7,&
this.cbx_6,&
this.cbx_5,&
this.cbx_4,&
this.cbx_3,&
this.cbx_2,&
this.cbx_1,&
this.dw_3,&
this.gb_1}
end on

on tabpage_3.destroy
destroy(this.cbx_16)
destroy(this.cbx_15)
destroy(this.cbx_14)
destroy(this.cbx_13)
destroy(this.cbx_12)
destroy(this.cbx_11)
destroy(this.cbx_10)
destroy(this.cbx_9)
destroy(this.cbx_8)
destroy(this.cbx_7)
destroy(this.cbx_6)
destroy(this.cbx_5)
destroy(this.cbx_4)
destroy(this.cbx_3)
destroy(this.cbx_2)
destroy(this.cbx_1)
destroy(this.dw_3)
destroy(this.gb_1)
end on

type cbx_16 from checkbox within tabpage_3
integer x = 2130
integer y = 1824
integer width = 439
integer height = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 553648127
string text = "Fauteuil N°16"
end type

type cbx_15 from checkbox within tabpage_3
integer x = 2130
integer y = 1740
integer width = 439
integer height = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 553648127
string text = "Fauteuil N°15"
end type

type cbx_14 from checkbox within tabpage_3
integer x = 2130
integer y = 1656
integer width = 439
integer height = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 553648127
string text = "Fauteuil N°14"
end type

type cbx_13 from checkbox within tabpage_3
integer x = 2130
integer y = 1572
integer width = 439
integer height = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 553648127
string text = "Fauteuil N°13"
end type

type cbx_12 from checkbox within tabpage_3
integer x = 1568
integer y = 1824
integer width = 439
integer height = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 553648127
string text = "Fauteuil N°12"
end type

type cbx_11 from checkbox within tabpage_3
integer x = 1568
integer y = 1740
integer width = 439
integer height = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 553648127
string text = "Fauteuil N°11"
end type

type cbx_10 from checkbox within tabpage_3
integer x = 1568
integer y = 1656
integer width = 439
integer height = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 553648127
string text = "Fauteuil N°10"
end type

type cbx_9 from checkbox within tabpage_3
integer x = 1568
integer y = 1572
integer width = 407
integer height = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 553648127
string text = "Fauteuil N°9"
end type

type cbx_8 from checkbox within tabpage_3
integer x = 1006
integer y = 1824
integer width = 407
integer height = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 553648127
string text = "Fauteuil N°8"
end type

type cbx_7 from checkbox within tabpage_3
integer x = 1006
integer y = 1740
integer width = 407
integer height = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 553648127
string text = "Fauteuil N°7"
end type

type cbx_6 from checkbox within tabpage_3
integer x = 1006
integer y = 1656
integer width = 407
integer height = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 553648127
string text = "Fauteuil N°6"
end type

type cbx_5 from checkbox within tabpage_3
integer x = 1006
integer y = 1572
integer width = 407
integer height = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 553648127
string text = "Fauteuil N°5"
end type

type cbx_4 from checkbox within tabpage_3
integer x = 443
integer y = 1824
integer width = 407
integer height = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 553648127
string text = "Fauteuil N°4"
end type

type cbx_3 from checkbox within tabpage_3
integer x = 443
integer y = 1740
integer width = 407
integer height = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 553648127
string text = "Fauteuil N°3"
end type

type cbx_2 from checkbox within tabpage_3
integer x = 443
integer y = 1656
integer width = 407
integer height = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 553648127
string text = "Fauteuil N°2"
end type

type cbx_1 from checkbox within tabpage_3
integer x = 443
integer y = 1572
integer width = 407
integer height = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 553648127
string text = "Fauteuil N°1"
end type

type dw_3 from datawindow within tabpage_3
string tag = "brush"
integer x = 261
integer y = 40
integer width = 3214
integer height = 1416
integer taborder = 40
string title = "none"
string dataobject = "dw_type_rdv_fiche_contraintes"
boolean border = false
boolean livescroll = true
end type

type gb_1 from groupbox within tabpage_3
integer x = 334
integer y = 1484
integer width = 2327
integer height = 456
integer taborder = 21
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean italic = true
long textcolor = 33554432
long backcolor = 553648127
string text = "Blocage de Fauteuils"
end type

type tabpage_4 from userobject within tab_1
integer x = 18
integer y = 112
integer width = 3872
integer height = 2244
long backcolor = 16777215
string text = "Familles de RDV"
long tabtextcolor = 33554432
long tabbackcolor = 15780518
long picturemaskcolor = 536870912
dw_4 dw_4
pb_4 pb_4
pb_3 pb_3
pb_2 pb_2
pb_1 pb_1
end type

on tabpage_4.create
this.dw_4=create dw_4
this.pb_4=create pb_4
this.pb_3=create pb_3
this.pb_2=create pb_2
this.pb_1=create pb_1
this.Control[]={this.dw_4,&
this.pb_4,&
this.pb_3,&
this.pb_2,&
this.pb_1}
end on

on tabpage_4.destroy
destroy(this.dw_4)
destroy(this.pb_4)
destroy(this.pb_3)
destroy(this.pb_2)
destroy(this.pb_1)
end on

type dw_4 from u_basedw within tabpage_4
string tag = "brush"
integer x = 1189
integer y = 108
integer width = 1595
integer height = 1352
integer taborder = 11
string dataobject = "dw_type_rdv_famille"
borderstyle borderstyle = stylebox!
end type

type pb_4 from uo_picturebutton_250x120 within tabpage_4
integer x = 2263
integer y = 1544
integer width = 544
integer height = 144
integer taborder = 41
string text = "Enregistrer"
string iconname = "ACTIONS_enregistrer.png"
end type

event clicked;call super::clicked;tab_1.tabpage_4.dw_4.accepttext()

if  tab_1.tabpage_4.dw_4.update() = 1 then
	commit ;
else
	Rollback ;
end if

end event

type pb_3 from uo_picturebutton_250x120 within tabpage_4
integer x = 1710
integer y = 1544
integer width = 544
integer height = 144
integer taborder = 31
string text = "Annuler"
string iconname = "ACTIONS_annuler.png"
end type

event clicked;call super::clicked;	tab_1.tabpage_4.dw_4.retrieve(var_code_type_rdv)

end event

type pb_2 from uo_picturebutton_250x120 within tabpage_4
integer x = 1445
integer y = 1544
integer width = 256
integer height = 144
integer taborder = 21
string text = "-"
end type

event clicked;call super::clicked;
if dw_4.rowcount() > 0 then 
	dw_4.deleterow(dw_4.getrow())
end if
end event

type pb_1 from uo_picturebutton_250x120 within tabpage_4
integer x = 1179
integer y = 1544
integer width = 256
integer height = 144
integer taborder = 21
string text = "+"
end type

event clicked;call super::clicked;
dw_4.insertrow(0)

dw_4.setItem(dw_4.rowcount(), "code_type_rdv", var_code_type_rdv)
end event

type sle_copy from singlelineedit within w_type_rdv_fiche
boolean visible = false
integer x = 187
integer y = 2228
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

type dw_code_sms from datawindow within w_type_rdv_fiche
string tag = "no resize all brush"
boolean visible = false
integer x = 681
integer y = 684
integer width = 2450
integer height = 1144
integer taborder = 50
boolean bringtotop = true
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

dw_code_sms.visible = false
tab_1.tabpage_2.dw_2.setItem(1, "message_sms", dw_code_sms.getitemnumber(dw_code_sms.getrow(), "code"))


end event

event rbuttondown;if dw_code_sms.visible then
	dw_code_sms.visible = false
else
	dw_code_sms.visible = true
end if

end event

type uo_poc from uo_pocket within w_type_rdv_fiche
boolean visible = false
integer x = 3365
integer y = 1752
integer taborder = 80
boolean bringtotop = true
end type

on uo_poc.destroy
call uo_pocket::destroy
end on

