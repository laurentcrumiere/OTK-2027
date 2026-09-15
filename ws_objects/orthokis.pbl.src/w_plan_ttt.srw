$PBExportHeader$w_plan_ttt.srw
$PBExportComments$Héritée de param2
forward
global type w_plan_ttt from w_param2
end type
type cbx_brut from checkbox within w_plan_ttt
end type
type gb_texte from groupbox within w_plan_ttt
end type
end forward

global type w_plan_ttt from w_param2
string title = "Table des Plans de Traitement"
cbx_brut cbx_brut
gb_texte gb_texte
end type
global w_plan_ttt w_plan_ttt

event open;call super::open;var_fille = "w_plan_ttt_fiche"


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


// Travail ou pas en texte brut
if profilestring(dir_ini+inifile_orthokis,"Clinique","plan_traitement_texte_brut", "N") = "O" then
	cbx_brut.checked = true
else
	cbx_brut.checked = false
end if

end event

on w_plan_ttt.create
int iCurrent
call super::create
this.cbx_brut=create cbx_brut
this.gb_texte=create gb_texte
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cbx_brut
this.Control[iCurrent+2]=this.gb_texte
end on

on w_plan_ttt.destroy
call super::destroy
destroy(this.cbx_brut)
destroy(this.gb_texte)
end on

event resize;call super::resize;cbx_brut.x = gb_texte.x + 105
cbx_brut.y = gb_texte.y + 84
end event

type p_fond from w_param2`p_fond within w_plan_ttt
end type

type pb_raz_ordre_trie from w_param2`pb_raz_ordre_trie within w_plan_ttt
end type

type cb_annuler from w_param2`cb_annuler within w_plan_ttt
integer x = 2834
end type

type cb_enregistrer from w_param2`cb_enregistrer within w_plan_ttt
integer x = 3291
end type

type cb_ajouter from w_param2`cb_ajouter within w_plan_ttt
end type

type cb_modifier from w_param2`cb_modifier within w_plan_ttt
end type

event cb_modifier::clicked;if dw_liste.rowcount() > 0 then

	if cbx_brut.checked then
		Setprofilestring(dir_ini+inifile_orthokis,"Clinique","plan_traitement_texte_brut", "O") 
	else
		Setprofilestring(dir_ini+inifile_orthokis,"Clinique","plan_traitement_texte_brut", "N") 
	end if

	
	string v_code 
	v_code = dw_liste.getitemstring(dw_liste.getrow(),"code")
	
	OpenWithParm(W_fille, v_code, var_fille)
	
	dw_liste.retrieve('%')
	long lig 
	lig = dw_liste.Find("Code = '"+v_code+"'" , 0, dw_liste.rowcount())
	
	if lig > 0 then 
		dw_liste.Scrolltorow(lig)
		dw_liste.Setrow(lig)
		dw_liste.SelectRow(0,False)
		dw_liste.SelectRow(lig,True)
	end if
end if



end event

type cb_supprimer from w_param2`cb_supprimer within w_plan_ttt
end type

type cb_1 from w_param2`cb_1 within w_plan_ttt
end type

type cb_chercher from w_param2`cb_chercher within w_plan_ttt
end type

type cb_exporter from w_param2`cb_exporter within w_plan_ttt
end type

type cb_fermer from w_param2`cb_fermer within w_plan_ttt
integer x = 3749
end type

type dw_liste from w_param2`dw_liste within w_plan_ttt
string tag = "no resize centrer brush"
integer x = 1303
integer y = 16
integer width = 1605
integer height = 1800
string dataobject = "dw_plan_ttt_liste"
end type

type uo_1 from w_param2`uo_1 within w_plan_ttt
end type

type dw_liste_edition from w_param2`dw_liste_edition within w_plan_ttt
integer taborder = 10
string dataobject = "dw_plan_ttt_liste_edition"
end type

type cbx_avec_les_inactifs from w_param2`cbx_avec_les_inactifs within w_plan_ttt
boolean visible = false
integer x = 443
integer y = 1448
end type

type gb_filtre from w_param2`gb_filtre within w_plan_ttt
integer x = 329
integer y = 1376
end type

type cbx_brut from checkbox within w_plan_ttt
string tag = "no resize all"
integer x = 1961
integer y = 2052
integer width = 750
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Eras Demi ITC"
long textcolor = 33554432
long backcolor = 67108864
string text = "Travailler en Texte Brut"
borderstyle borderstyle = styleraised!
end type

type gb_texte from groupbox within w_plan_ttt
string tag = "no resize all"
integer x = 1856
integer y = 1968
integer width = 965
integer height = 192
integer taborder = 41
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Eras Demi ITC"
long textcolor = 33554432
long backcolor = 67108864
string text = "Mode de saisie (RTF ou Texte Brut)"
borderstyle borderstyle = styleraised!
end type

