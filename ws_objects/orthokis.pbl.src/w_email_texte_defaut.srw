$PBExportHeader$w_email_texte_defaut.srw
forward
global type w_email_texte_defaut from w_param2
end type
type cbx_1 from checkbox within w_email_texte_defaut
end type
type gb_1 from groupbox within w_email_texte_defaut
end type
end forward

global type w_email_texte_defaut from w_param2
string title = "Table des Textes d~'Emails"
cbx_1 cbx_1
gb_1 gb_1
end type
global w_email_texte_defaut w_email_texte_defaut

on w_email_texte_defaut.create
int iCurrent
call super::create
this.cbx_1=create cbx_1
this.gb_1=create gb_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cbx_1
this.Control[iCurrent+2]=this.gb_1
end on

on w_email_texte_defaut.destroy
call super::destroy
destroy(this.cbx_1)
destroy(this.gb_1)
end on

event open;call super::open;var_fille = "w_email_texte_fiche"

// Verrouillage selon les droits d'accès
//-------------------------------------------

choose case droits_acces[31]
	Case 'C'
		// Consultation 
		cb_ajouter.enabled = false
		cb_supprimer.enabled = false
		cb_enregistrer.enabled = false
	Case 'M'
		// Modification 
//		cb_ajouter.enabled = false
		cb_supprimer.enabled = false
end choose

end event

event resize;uo_1.retaille(this)


// repositionnement 
cbx_1.x = gb_1.x + 45
cbx_1.y = gb_1.y + 72




end event

type p_fond from w_param2`p_fond within w_email_texte_defaut
end type

type pb_raz_ordre_trie from w_param2`pb_raz_ordre_trie within w_email_texte_defaut
integer x = 1746
integer y = 2016
end type

type cb_annuler from w_param2`cb_annuler within w_email_texte_defaut
integer y = 2016
end type

type cb_enregistrer from w_param2`cb_enregistrer within w_email_texte_defaut
integer y = 2016
end type

type cb_ajouter from w_param2`cb_ajouter within w_email_texte_defaut
integer y = 2016
end type

type cb_modifier from w_param2`cb_modifier within w_email_texte_defaut
integer y = 2016
end type

event cb_modifier::clicked;if dw_liste.rowcount() > 0 then
//	OpenSheetWithParm(W_fille,dw_liste.getitemstring(dw_liste.getrow(),"code"),var_fille,w_mdi,0,layered!)
	
	integer v_code 
	v_code = dw_liste.getitemNumber(dw_liste.getrow(),"id")
	
	OpenWithParm(W_fille, v_code, var_fille)
	
	dw_liste.retrieve()
	long lig 
	lig = dw_liste.Find("id = "+string(v_code) , 0, dw_liste.rowcount())
	
	if lig > 0 then 
		dw_liste.Scrolltorow(lig)
		dw_liste.Setrow(lig)
		dw_liste.SelectRow(0,False)
		dw_liste.SelectRow(lig,True)
	end if
end if



end event

type cb_supprimer from w_param2`cb_supprimer within w_email_texte_defaut
integer x = 942
end type

type cb_1 from w_param2`cb_1 within w_email_texte_defaut
boolean visible = false
integer x = 357
integer y = 1328
end type

type cb_chercher from w_param2`cb_chercher within w_email_texte_defaut
boolean visible = false
integer x = 946
integer y = 1308
end type

type cb_exporter from w_param2`cb_exporter within w_email_texte_defaut
end type

type cb_fermer from w_param2`cb_fermer within w_email_texte_defaut
integer y = 2016
end type

type dw_liste from w_param2`dw_liste within w_email_texte_defaut
string tag = "no resize centrer brush"
integer x = 677
integer y = 36
integer width = 3154
integer height = 1892
string dataobject = "dw_email_texte_liste"
end type

type uo_1 from w_param2`uo_1 within w_email_texte_defaut
end type

type dw_liste_edition from w_param2`dw_liste_edition within w_email_texte_defaut
string dataobject = "dw_diagnostic_liste_edition"
end type

type cbx_avec_les_inactifs from w_param2`cbx_avec_les_inactifs within w_email_texte_defaut
boolean visible = false
end type

type gb_filtre from w_param2`gb_filtre within w_email_texte_defaut
end type

type cbx_1 from checkbox within w_email_texte_defaut
string tag = "no resize all"
integer x = 2002
integer y = 2052
integer width = 558
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Avec les inactifs"
borderstyle borderstyle = styleraised!
end type

event clicked;
// sélection ou pas des inactifs ..
if this.checked then
	dw_liste.setfilter("")
else
	dw_liste.setfilter("actif = 1")
end if

dw_liste.filter()

end event

type gb_1 from groupbox within w_email_texte_defaut
string tag = "no resize"
integer x = 1957
integer y = 1980
integer width = 622
integer height = 192
integer taborder = 80
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Filtre"
borderstyle borderstyle = styleraised!
end type

