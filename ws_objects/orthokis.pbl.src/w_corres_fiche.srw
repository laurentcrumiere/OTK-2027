$PBExportHeader$w_corres_fiche.srw
$PBExportComments$Héritée de param_fiche
forward
global type w_corres_fiche from w_param_fiche
end type
type lb_ville from listbox within w_corres_fiche
end type
type lb_codep from listbox within w_corres_fiche
end type
type uo_appel from uo_appeler within w_corres_fiche
end type
type dw_liste from datawindow within w_corres_fiche
end type
type rte_1 from richtextedit within w_corres_fiche
end type
end forward

global type w_corres_fiche from w_param_fiche
integer width = 2935
integer height = 2812
string title = "Fiche Correspondants & Dentistes Traitant"
lb_ville lb_ville
lb_codep lb_codep
uo_appel uo_appel
dw_liste dw_liste
rte_1 rte_1
end type
global w_corres_fiche w_corres_fiche

type variables
// Servent pour la MAJ des codes postaux
datawindow dw_maj
string ch_maj,ch_tel,ch_fax
string pref[100]

end variables

on w_corres_fiche.create
int iCurrent
call super::create
this.lb_ville=create lb_ville
this.lb_codep=create lb_codep
this.uo_appel=create uo_appel
this.dw_liste=create dw_liste
this.rte_1=create rte_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.lb_ville
this.Control[iCurrent+2]=this.lb_codep
this.Control[iCurrent+3]=this.uo_appel
this.Control[iCurrent+4]=this.dw_liste
this.Control[iCurrent+5]=this.rte_1
end on

on w_corres_fiche.destroy
call super::destroy
destroy(this.lb_ville)
destroy(this.lb_codep)
destroy(this.uo_appel)
destroy(this.dw_liste)
destroy(this.rte_1)
end on

event open;// Passage de paramètre entre fenêtre
// après un openwithparm(nom_fenêtre,paramètre(string,number...)
//

boolean suite  = true

code = message.stringparm
uo_1.taille(this)

dw_fiche.settransobject(SQLCA)
dw_liste.settransobject(SQLCA)

if trim(code) = "" then
	// Ajout
	dw_fiche.retrieve(" ")
	dw_fiche.insertrow(0)
	
	double max
	// recherche de la valeur maxi
	
	if isValid(w_corres) then
		// la fenêtre w_corresp est ouverte par ailleurs
		max = get_max_code_datawindow(w_corres.dw_liste, "code") + 1
	else
		// on utilise la liste masquée de la fenêtre
		dw_liste.retrieve('%')
		max = get_max_code_datawindow(dw_liste, "code") + 1
	end if
		
	dw_fiche.SetItem(dw_fiche.RowCount(),"code",string(max))

	string min
	
	// Categorie par défaut 
	integer v_ordre
	SELECT min(ordre_trie) INTO :v_ordre FROM categories where actif = 1 ;
	SELECT min(code)  INTO :min FROM categories where ordre_trie = :v_ordre ;


	
	dw_fiche.SetItem(dw_fiche.RowCount(),"categorie",min)
	dw_fiche.ScrollToRow(dw_fiche.rowcount())
	dw_fiche.SetFocus()

else
	
	// Modif
	dw_fiche.Modify("Code.Edit.DisplayOnly = Yes")
	dw_fiche.retrieve(code)

	// Avant d'autoriser, on vérifie qu'on est pas sur la fiche par défaut ...
	long v_ordre_min 
	select isnull(min(ordre_trie), 0) into :v_ordre_min from correspondants where actif = 1;
	
	if dw_fiche.rowcount() = 0 then
		suite = false
	else
		if dw_fiche.GetItemNumber(1, "ordre_trie") = v_ordre_min then
			suite = false
			Messagebox("ATTENTION","Vous n'avez pas le droit de modifier la Fiche du CORRESPONDANT par défaut.~n~n(Fiche qui a le plus petit nombre dans la colonne 'Ordre'. Si plusieurs / toutes les fiches ont la même valeur minimale, nous vous conseillons de les modifier (menu 'TABLES') pour en choisir une par défaut)")
		end if
	end if


end if


if suite then 
	// Verrouillage selon les droits d'accès
	//-------------------------------------------
	
	choose case droits_acces[32]
		Case 'C'
			// Consultation 
			cb_enregistrer.enabled = false
	end choose
	
	// Initialisation du lien CTI
	uo_appel.dw = dw_fiche
	uo_appel.nb_zone = 2
	uo_appel.zone[1] = "tel"
	uo_appel.zone[2] = "tel2"
	
	
	
	this.backcolor = couleur_fond_fenetre
	
	if enregistrement_automatique then
		cb_annuler.visible = false
		cb_enregistrer.visible = false
	end if
	
	if webcommunication then 
		dw_fiche.object.mdp_correspondant_t.visible = true
		dw_fiche.object.mdp_correspondant.visible = true
		dw_fiche.object.derniere_connexion_web_t.visible = true
		dw_fiche.object.derniere_connexion_web.visible = true
		dw_fiche.object.b_mdp_email.visible = true
		dw_fiche.object.zone_portail_t.visible = true
		dw_fiche.object.zone_portail.visible = true
	end if
	
	if belgique then
		dw_fiche.object.numero_id_t.visible = true
		dw_fiche.object.numero_id.visible = true
		dw_fiche.object.numero_inami_t.visible = true
		dw_fiche.object.numero_inami.visible = true
	else
		if FRANCE then
			dw_fiche.object.email_secu.visible = true
			dw_fiche.object.t_email_secu.visible = true
		else
			// plus d'espace => On écarte
			dw_fiche.object.sexe_t.y = 980
			dw_fiche.object.sexe.y = 980
			dw_fiche.object.relation_t.y = 980
			dw_fiche.object.relation.y = 980
		end if
		
	end if
else
	close(this)
end if

end event

type p_fond from w_param_fiche`p_fond within w_corres_fiche
end type

type cb_fermer from w_param_fiche`cb_fermer within w_corres_fiche
integer x = 2263
integer y = 2468
integer width = 507
end type

type cb_enregistrer from w_param_fiche`cb_enregistrer within w_corres_fiche
integer x = 1728
integer y = 2468
integer width = 507
integer taborder = 40
end type

type cb_annuler from w_param_fiche`cb_annuler within w_corres_fiche
integer y = 2468
integer width = 507
integer taborder = 30
end type

type cb_imprimer from w_param_fiche`cb_imprimer within w_corres_fiche
integer x = 658
integer y = 2468
integer width = 507
end type

type uo_1 from w_param_fiche`uo_1 within w_corres_fiche
end type

type dw_fiche from w_param_fiche`dw_fiche within w_corres_fiche
integer x = 41
integer width = 2793
integer height = 2412
end type

event dw_fiche::itemfocuschanged;call super::itemfocuschanged;//maj_code_postal(this,5,6,8,9)

ch_tel = "tel"
ch_fax = "fax"
	
maj_code_postal(this,"codep","ville", &
ch_tel,ch_fax,lb_ville,lb_codep,dw_maj,ch_maj,pref)


// Récupération du pays   et application 
string v_pays
v_pays = this.getitemstring(row, "pays")

formater_zone_pays(v_pays, 'T', this, "tel")
formater_zone_pays(v_pays, 'T', this, "fax")
formater_zone_pays(v_pays, 'P', this, "tel2")

end event

event dw_fiche::buttonclicked;call super::buttonclicked;

string	ls_Object
string	ls_win

ls_Object = String(dwo.name)

this.accepttext()

if row > 0 then
	choose case ls_Object 
		case "b_email"
			// Envoi d'un email avec l'outil configuré sur le PC
			string v_email 
		
			v_email = this.getItemString(row, "email")
			send_email_autre(v_email)
	
		
		case "b_mdp_email" 
			// Envoi d'un email pour la connexion à l'espace patient
			fxg_envoi_email_mdp_portail_corresp (dw_fiche, cb_enregistrer, rte_1)
	
		case "b_googlemaps"
			
			fxg_recherche_googlemaps (this.getitemstring(1, "adr1"), this.getitemstring(1, "codep"),this.getitemstring(1, "ville"), this.getitemstring(1, "pays") )

	end choose
	
end if

end event

event dw_fiche::updatestart;call super::updatestart;// Verification des champs email


if rowcount() > 0 then
	string email_a_verifier 
	email_a_verifier = getitemstring(1, "email")
	if fxg_isvalid_email(email_a_verifier)  then
		email_a_verifier = getitemstring(1, "email_secu")
		if fxg_isvalid_email(email_a_verifier) then
			return 0 
		else
			w_mdi_2020.sle_clipboard.text = email_a_verifier
			w_mdi_2020.sle_clipboard.SelectText(1, Len(email_a_verifier))
			w_mdi_2020.sle_clipboard.copy()
			Messagebox("ATTENTION", "La mise à jour des données est tout de même effectuée !~n~nLa valeur saisie est dans le presse papier : CTRL + V pour la coller si besoin")
			return 0
		end if
	else
		w_mdi_2020.sle_clipboard.text = email_a_verifier
		w_mdi_2020.sle_clipboard.SelectText(1, Len(email_a_verifier))
		w_mdi_2020.sle_clipboard.copy()
		Messagebox("ATTENTION", "La mise à jour des données est tout de même effectuée !~n~nLa valeur saisie est dans le presse papier : CTRL + V pour la coller si besoin")
		return 0
	end if
end if
end event

type lb_ville from listbox within w_corres_fiche
boolean visible = false
integer x = 1659
integer y = 436
integer width = 1157
integer height = 528
integer taborder = 20
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 255
long backcolor = 15780518
boolean vscrollbar = true
borderstyle borderstyle = styleraised!
end type

event doubleclicked;string v_tel,v_fax
double v_row 

v_row = dw_maj.getrow()

dw_maj.setitem(v_row,ch_maj,this.selecteditem())
this.visible = false

// Si le téléphone et le fax n'ont pas été saisi
	v_tel = trim(dw_maj.getitemstring(v_row,ch_tel))
	v_fax = trim(dw_maj.getitemstring(v_row,ch_fax))
	if (v_tel = '' or isnull(v_tel)) and 	(v_fax = '' or isnull(v_fax)) then
		dw_maj.setitem(v_row,ch_tel,pref[index])
		dw_maj.setitem(v_row,ch_fax,pref[index])
	end if

end event

event rbuttondown;lb_ville.visible = FALSE
end event

type lb_codep from listbox within w_corres_fiche
boolean visible = false
integer x = 1623
integer y = 420
integer width = 530
integer height = 528
integer taborder = 12
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 255
long backcolor = 15780518
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

event doubleclicked;string v_tel,v_fax
double v_row 

v_row = dw_maj.getrow()

dw_maj.setitem(v_row,ch_maj,this.selecteditem())
this.visible = false

// Si le téléphone et le fax n'ont pas été saisi
	v_tel = trim(dw_maj.getitemstring(v_row,ch_tel))
	v_fax = trim(dw_maj.getitemstring(v_row,ch_fax))
	if (v_tel = '' or isnull(v_tel)) and 	(v_fax = '' or isnull(v_fax)) then
		dw_maj.setitem(v_row,ch_tel,pref[index])
		dw_maj.setitem(v_row,ch_fax,pref[index])
	end if

end event

event rbuttondown;lb_codep.visible = FALSE
end event

type uo_appel from uo_appeler within w_corres_fiche
integer x = 146
integer y = 2472
integer taborder = 41
boolean bringtotop = true
end type

on uo_appel.destroy
call uo_appeler::destroy
end on

type dw_liste from datawindow within w_corres_fiche
boolean visible = false
integer x = 219
integer y = 1008
integer width = 686
integer height = 400
integer taborder = 21
boolean bringtotop = true
string title = "none"
string dataobject = "dw_corresp_liste"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type rte_1 from richtextedit within w_corres_fiche
boolean visible = false
integer x = 613
integer y = 1360
integer width = 1280
integer height = 884
integer taborder = 30
boolean bringtotop = true
boolean init_hscrollbar = true
boolean init_vscrollbar = true
long init_backcolor = 16777215
boolean init_wordwrap = true
long init_inputfieldbackcolor = 16777215
boolean init_inputfieldsvisible = true
boolean init_inputfieldnamesvisible = true
boolean init_rulerbar = true
boolean init_tabbar = true
boolean init_toolbar = true
boolean init_popmenu = true
integer init_undodepth = 100
long init_leftmargin = 10
long init_topmargin = 10
long init_rightmargin = 10
long init_bottommargin = 20
borderstyle borderstyle = stylelowered!
end type

