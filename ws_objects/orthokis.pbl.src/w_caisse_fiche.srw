$PBExportHeader$w_caisse_fiche.srw
$PBExportComments$Héritée de param_fiche
forward
global type w_caisse_fiche from w_param_fiche
end type
type lb_ville from listbox within w_caisse_fiche
end type
type lb_codep from listbox within w_caisse_fiche
end type
type uo_appel from uo_appeler within w_caisse_fiche
end type
type dw_liste from datawindow within w_caisse_fiche
end type
end forward

global type w_caisse_fiche from w_param_fiche
integer width = 3095
integer height = 2264
string title = "Fiche Caisse de Sécurité Sociale"
lb_ville lb_ville
lb_codep lb_codep
uo_appel uo_appel
dw_liste dw_liste
end type
global w_caisse_fiche w_caisse_fiche

type variables
// Servent pour la MAJ des codes postaux
datawindow dw_maj
string ch_maj,ch_tel,ch_fax
string pref[100]

end variables

on w_caisse_fiche.create
int iCurrent
call super::create
this.lb_ville=create lb_ville
this.lb_codep=create lb_codep
this.uo_appel=create uo_appel
this.dw_liste=create dw_liste
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.lb_ville
this.Control[iCurrent+2]=this.lb_codep
this.Control[iCurrent+3]=this.uo_appel
this.Control[iCurrent+4]=this.dw_liste
end on

on w_caisse_fiche.destroy
call super::destroy
destroy(this.lb_ville)
destroy(this.lb_codep)
destroy(this.uo_appel)
destroy(this.dw_liste)
end on

event open;// Passage de paramètre entre fenêtre
// après un openwithparm(nom_fenêtre,paramètre(string,number...)
//
code = message.stringparm
uo_1.taille(this)

boolean suite  = true


dw_fiche.settransobject(SQLCA)
dw_liste.settransobject(SQLCA)

if trim(code) = "" then
	// Ajout
	dw_fiche.retrieve(" ")
	dw_fiche.insertrow(0)
	
	double max
	// recherche de la valeur maxi
	
	if isValid(w_caisse) then
		// la fenêtre w_corresp est ouverte par ailleurs
		max = get_max_code_datawindow(w_caisse.dw_liste, "code") + 1
	else
		// on utilise la liste masquée de la fenêtre
		dw_liste.retrieve('%')
		max = get_max_code_datawindow(dw_liste, "code") + 1
	end if



	dw_fiche.SetItem(dw_fiche.RowCount(),"code",string(max))
		
	dw_fiche.ScrollToRow(dw_fiche.rowcount())
	dw_fiche.SetFocus()
else
	// Modif

	dw_fiche.Modify("Code.Edit.DisplayOnly = Yes")
	dw_fiche.retrieve(code)

	// Avant d'autoriser, on vérifie qu'on est pas sur la fiche par défaut ...
	long v_ordre_min 
	select isnull(min(ordre_trie), 0) into :v_ordre_min from caisse where actif = 1;
	
	if dw_fiche.rowcount() = 0 then
		suite = false
	else
		if dw_fiche.GetItemNumber(1, "ordre_trie") = v_ordre_min then
			suite = false
			Messagebox("ATTENTION","Vous n'avez pas le droit de modifier la Fiche de la CAISSE par défaut.~n~n(Fiche qui a le plus petit nombre dans la colonne 'Ordre'. Si plusieurs / toutes les fiches ont la même valeur minimale, nous vous conseillons de les modifier (menu 'TABLES') pour en choisir une par défaut)")
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
	uo_appel.nb_zone = 1
	uo_appel.zone[1] = "tel"
	
	
	
	this.backcolor = couleur_fond_fenetre
	
	if enregistrement_automatique then
		cb_annuler.visible = false
		cb_enregistrer.visible = false
	end if
else
	close(this)
end if
	
	

end event

type p_fond from w_param_fiche`p_fond within w_caisse_fiche
end type

type cb_fermer from w_param_fiche`cb_fermer within w_caisse_fiche
integer x = 2149
integer y = 1968
end type

type cb_enregistrer from w_param_fiche`cb_enregistrer within w_caisse_fiche
integer x = 1714
integer y = 1968
integer taborder = 40
end type

type cb_annuler from w_param_fiche`cb_annuler within w_caisse_fiche
integer x = 1280
integer y = 1968
integer taborder = 30
end type

type cb_imprimer from w_param_fiche`cb_imprimer within w_caisse_fiche
integer x = 846
integer y = 1968
end type

type uo_1 from w_param_fiche`uo_1 within w_caisse_fiche
end type

type dw_fiche from w_param_fiche`dw_fiche within w_caisse_fiche
integer x = 59
integer width = 2953
integer height = 1892
string dataobject = "dw_caisse_fiche"
end type

event dw_fiche::itemfocuschanged;call super::itemfocuschanged;//maj_code_postal(this,5,6,7,8)
ch_tel = "tel"
ch_fax = "fax"
	
maj_code_postal(this,"codep","ville", &
ch_tel,ch_fax,lb_ville,lb_codep,dw_maj,ch_maj,pref)


// Récupération du pays   et application 
string v_pays
v_pays = this.getitemstring(row, "pays")

formater_zone_pays(v_pays, 'T', this, "tel")
formater_zone_pays(v_pays, 'T', this, "fax")

end event

event dw_fiche::buttonclicked;call super::buttonclicked;

string	ls_Object
string	ls_win

ls_Object = String(dwo.name)

string v_email 
	
this.accepttext()

choose case ls_Object 
		
	case "b_email1" 
		// Envoi d'un email avec l'outil configuré sur le PC
		if row > 0 then
		
			v_email = this.getItemString(row, "email1")
			send_email_autre(v_email)
	
		end if
	case "b_email2" 
		// Envoi d'un email avec l'outil configuré sur le PC
		if row > 0 then
		
			v_email = this.getItemString(row, "email2")
			send_email_autre(v_email)
		end if

	case "b_googlemaps"
		fxg_recherche_googlemaps (this.getitemstring(1, "adr1"), this.getitemstring(1, "codep"),this.getitemstring(1, "ville"), this.getitemstring(1, "pays") )

end choose	

end event

event dw_fiche::updatestart;call super::updatestart;// Verification des champs email


if rowcount() > 0 then
	string email_a_verifier 
	email_a_verifier = getitemstring(1, "email1")
	if fxg_isvalid_email(email_a_verifier)  then
		email_a_verifier = getitemstring(1, "email2")
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
		Messagebox("ATTENTION", "La mise à jour des données n'est pas effectuée !~n~nLa valeur saisie est dans le presse papier : CTRL + V pour la coller si besoin")
		return 0
	end if
end if
end event

type lb_ville from listbox within w_caisse_fiche
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

event rbuttondown;lb_ville.visible = FALSE
end event

type lb_codep from listbox within w_caisse_fiche
boolean visible = false
integer x = 1623
integer y = 420
integer width = 530
integer height = 528
integer taborder = 11
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

type uo_appel from uo_appeler within w_caisse_fiche
integer x = 261
integer y = 1968
integer taborder = 41
boolean bringtotop = true
end type

on uo_appel.destroy
call uo_appeler::destroy
end on

type dw_liste from datawindow within w_caisse_fiche
boolean visible = false
integer x = 23
integer y = 904
integer width = 686
integer height = 400
integer taborder = 60
boolean bringtotop = true
string title = "none"
string dataobject = "dw_caisse_liste"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

