$PBExportHeader$w_adresse_fiche.srw
$PBExportComments$Héritée de param_fiche
forward
global type w_adresse_fiche from w_param_fiche
end type
type lb_codep from listbox within w_adresse_fiche
end type
type lb_ville from listbox within w_adresse_fiche
end type
type uo_appel from uo_appeler within w_adresse_fiche
end type
end forward

global type w_adresse_fiche from w_param_fiche
integer width = 3360
integer height = 2176
string title = "Fiche Adresse"
lb_codep lb_codep
lb_ville lb_ville
uo_appel uo_appel
end type
global w_adresse_fiche w_adresse_fiche

type variables
// Servent pour la MAJ des codes postaux
datawindow dw_maj
string ch_maj,ch_tel,ch_fax
string pref[100]

end variables

on w_adresse_fiche.create
int iCurrent
call super::create
this.lb_codep=create lb_codep
this.lb_ville=create lb_ville
this.uo_appel=create uo_appel
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.lb_codep
this.Control[iCurrent+2]=this.lb_ville
this.Control[iCurrent+3]=this.uo_appel
end on

on w_adresse_fiche.destroy
call super::destroy
destroy(this.lb_codep)
destroy(this.lb_ville)
destroy(this.uo_appel)
end on

event open;// Passage de paramètre entre fenêtre
// après un openwithparm(nom_fenêtre,paramètre(string,number...)
//
code = message.stringparm

uo_1.taille(this)


dw_fiche.settransobject(SQLCA)

if trim(code) = "" then
	// Ajout
	dw_fiche.retrieve(" ")
	dw_fiche.insertrow(0)
	
	
	double max
	// recherche de la valeur maxi
	max = get_max_code_datawindow(w_adresse.dw_liste, "code") + 1

	
	dw_fiche.SetItem(dw_fiche.RowCount(),"code",string(max))
		
	
	
	dw_fiche.ScrollToRow(dw_fiche.rowcount())
	dw_fiche.SetFocus()
else
	// Modif
	string clause
	dw_fiche.Modify("Code.Edit.DisplayOnly = Yes")
	dw_fiche.retrieve(code)
end if

// Verrouillage selon les droits d'accès
//-------------------------------------------

choose case droits_acces[30]
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

end event

type p_fond from w_param_fiche`p_fond within w_adresse_fiche
end type

type cb_fermer from w_param_fiche`cb_fermer within w_adresse_fiche
integer x = 2235
integer y = 1852
end type

type cb_enregistrer from w_param_fiche`cb_enregistrer within w_adresse_fiche
integer x = 1801
integer y = 1852
integer taborder = 40
end type

type cb_annuler from w_param_fiche`cb_annuler within w_adresse_fiche
integer x = 1367
integer y = 1852
integer taborder = 30
end type

type cb_imprimer from w_param_fiche`cb_imprimer within w_adresse_fiche
integer x = 933
integer y = 1852
end type

type uo_1 from w_param_fiche`uo_1 within w_adresse_fiche
integer x = 279
integer y = 804
end type

type dw_fiche from w_param_fiche`dw_fiche within w_adresse_fiche
integer y = 16
integer width = 3072
integer height = 1800
string dataobject = "dw_adresse_fiche"
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
formater_zone_pays(v_pays, 'P', this, "tel1")
formater_zone_pays(v_pays, 'P', this, "tel2")
end event

event dw_fiche::buttonclicked;call super::buttonclicked;string	ls_Object
string	ls_win

ls_Object = String(dwo.name)


string v_email

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
		Messagebox("ATTENTION", "La mise à jour des données est tout de même effectuée !~n~nLa valeur saisie est dans le presse papier : CTRL + V pour la coller si besoin")
		return 0
	end if
end if
end event

type lb_codep from listbox within w_adresse_fiche
boolean visible = false
integer x = 1623
integer y = 404
integer width = 530
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

event rbuttondown;lb_codep.visible = FALSE
end event

type lb_ville from listbox within w_adresse_fiche
boolean visible = false
integer x = 1664
integer y = 416
integer width = 1157
integer height = 528
integer taborder = 21
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

type uo_appel from uo_appeler within w_adresse_fiche
integer x = 347
integer y = 1852
integer taborder = 31
boolean bringtotop = true
end type

on uo_appel.destroy
call uo_appeler::destroy
end on

