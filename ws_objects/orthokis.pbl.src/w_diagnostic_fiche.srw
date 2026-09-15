$PBExportHeader$w_diagnostic_fiche.srw
forward
global type w_diagnostic_fiche from w_param_fiche
end type
type tab_1 from tab within w_diagnostic_fiche
end type
type tabpage_1 from userobject within tab_1
end type
type dw_fiche1 from datawindow within tabpage_1
end type
type tabpage_1 from userobject within tab_1
dw_fiche1 dw_fiche1
end type
type tabpage_2 from userobject within tab_1
end type
type dw_fiche2 from datawindow within tabpage_2
end type
type tabpage_2 from userobject within tab_1
dw_fiche2 dw_fiche2
end type
type tab_1 from tab within w_diagnostic_fiche
tabpage_1 tabpage_1
tabpage_2 tabpage_2
end type
type gb_1 from groupbox within w_diagnostic_fiche
end type
end forward

global type w_diagnostic_fiche from w_param_fiche
integer width = 3543
integer height = 2260
string title = "Fiche Diagnostic"
tab_1 tab_1
gb_1 gb_1
end type
global w_diagnostic_fiche w_diagnostic_fiche

type variables


boolean texte_brut
end variables

on w_diagnostic_fiche.create
int iCurrent
call super::create
this.tab_1=create tab_1
this.gb_1=create gb_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.tab_1
this.Control[iCurrent+2]=this.gb_1
end on

on w_diagnostic_fiche.destroy
call super::destroy
destroy(this.tab_1)
destroy(this.gb_1)
end on

event open;

uo_1.taille(this)

// Travail ou pas en texte brut
if profilestring(dir_ini+inifile_orthokis,"Clinique","diagnostic_texte_brut", "N") = "O" then
	texte_brut = true
	tab_1.tabpage_1.dw_fiche1.dataobject = "dw_diagnostic_fiche_brut"
	if profilestring(dir_ini+inifile_orthokis,"commentaires_cliniques","multiligne_infobulle","O") = "N" then
		tab_1.tabpage_1.dw_fiche1.object.texte_html.Tooltip.enabled = 0
	end if
else
	texte_brut = false
end if

if profilestring(dir_ini+inifile_orthokis,"commentaires_cliniques","multiligne_infobulle","O") = "N" then
	tab_1.tabpage_2.dw_fiche2.object.commentaire_html.Tooltip.enabled = 0
end if



// Passage de paramètre entre fenêtre
// après un openwithparm(nom_fenêtre,paramètre(string,number...)
//
code = message.stringparm

tab_1.tabpage_1.dw_fiche1.settransobject(SQLCA)
tab_1.tabpage_2.dw_fiche2.settransobject(SQLCA)

tab_1.tabpage_1.dw_fiche1.Modify("Code.Edit.DisplayOnly = Yes")
tab_1.tabpage_1.dw_fiche1.retrieve(code)
tab_1.tabpage_2.dw_fiche2.retrieve(code)

colore_datawindow(tab_1.tabpage_1.dw_fiche1)
colore_datawindow(tab_1.tabpage_2.dw_fiche2)

tab_1.backcolor = couleur_fond_datawindow
tab_1.tabpage_1.backcolor = couleur_fond_datawindow
tab_1.tabpage_2.backcolor = couleur_fond_datawindow


if not France then
	tab_1.tabpage_2.visible = false
end if

// Verrouillage selon les droits d'accès
//-------------------------------------------

choose case droits_acces[31]
	Case 'C'
		// Consultation 
		cb_enregistrer.enabled = false
end choose



this.backcolor = couleur_fond_fenetre

if enregistrement_automatique then
	cb_annuler.visible = false
	cb_enregistrer.visible = false
end if

// Activation ou non du menu pour les zones RTF
if Profilestring(dir_ini+inifile_orthokis,"commentaires_cliniques","menu_rtf","A") = "A" then
	tab_1.tabpage_1.dw_fiche1.richtexttoolbaractivation = RichTextToolbarActivationOnEdit!
else
	tab_1.tabpage_1.dw_fiche1.richtexttoolbaractivation = richtexttoolbaractivationnever!
end if


end event

type p_fond from w_param_fiche`p_fond within w_diagnostic_fiche
end type

type cb_fermer from w_param_fiche`cb_fermer within w_diagnostic_fiche
integer x = 2674
integer y = 1956
integer width = 521
end type

event cb_fermer::clicked;tab_1.tabpage_1.dw_fiche1.accepttext()
tab_1.tabpage_2.dw_fiche2.accepttext()

// Depuis la version 15.10 on revoir le code qui vient d'être ajouter
string code_retour = ""

if tab_1.tabpage_1.dw_fiche1.rowcount() > 0 then
	code_retour = tab_1.tabpage_1.dw_fiche1.getItemString( 1, "code")
end if


if enregistrement_automatique then
	CloseWithReturn(parent, code_retour)
else
	if tab_1.tabpage_1.dw_fiche1.modifiedcount() > 0 or tab_1.tabpage_1.dw_fiche1.deletedcount()>0 or tab_1.tabpage_2.dw_fiche2.modifiedcount() > 0 or tab_1.tabpage_2.dw_fiche2.deletedcount()>0 Then
		If MessageBox("ATTENTION","Vous avez fait des modifications sur le fichier !~n~nVoulez-vous vraiment fermer cette fenêtre sans enregistrer (et ainsi perdre les modifications) ?",Question!,YesNo!, 2) = 1 Then
			CloseWithReturn(parent, code_retour)
		end if
	else
		CloseWithReturn(parent, code_retour)
	end if
	
end if
end event

type cb_enregistrer from w_param_fiche`cb_enregistrer within w_diagnostic_fiche
integer x = 2139
integer y = 1956
integer width = 521
end type

event cb_enregistrer::clicked;
tab_1.tabpage_1.dw_fiche1.accepttext()
tab_1.tabpage_2.dw_fiche2.accepttext()

if texte_brut then
	// convertion en rtf
	tab_1.tabpage_1.dw_fiche1.setItem(1, "texte", string_to_rtf(tab_1.tabpage_1.dw_fiche1.getitemString(1, "texte_html"), couleur_noire, couleur_blanche))
else
	// Mise à jour des zones pour comptatilité avec MyOrthokis
	tab_1.tabpage_1.dw_fiche1.setItem(1, "texte_html", tab_1.tabpage_1.dw_fiche1.getitemString(1, "texte_brut"))
end if

if tab_1.tabpage_2.dw_fiche2.update() = 1 and tab_1.tabpage_1.dw_fiche1.update() = 1 then
	commit ;
else
	Rollback ;
end if

end event

type cb_annuler from w_param_fiche`cb_annuler within w_diagnostic_fiche
integer x = 1605
integer y = 1956
integer width = 521
end type

event cb_annuler::clicked;tab_1.tabpage_1.dw_fiche1.retrieve(code)
tab_1.tabpage_2.dw_fiche2.retrieve(code)

end event

type cb_imprimer from w_param_fiche`cb_imprimer within w_diagnostic_fiche
integer x = 1070
integer y = 1956
integer width = 521
end type

event cb_imprimer::clicked;tab_1.tabpage_1.dw_fiche1.print()
tab_1.tabpage_2.dw_fiche2.print()

end event

type uo_1 from w_param_fiche`uo_1 within w_diagnostic_fiche
end type

type dw_fiche from w_param_fiche`dw_fiche within w_diagnostic_fiche
boolean visible = false
integer x = 489
integer y = 1032
integer width = 3159
integer height = 1884
string dataobject = "dw_diagnostic_fiche_brut"
end type

event dw_fiche::itemfocuschanged;call super::itemfocuschanged;
if getcolumnName() = "texte"  then
	// Police des zones rtf
	police_rtf_par_defaut(this)
end if
end event

type tab_1 from tab within w_diagnostic_fiche
integer x = 27
integer y = 24
integer width = 3456
integer height = 1892
integer taborder = 21
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
boolean focusonbuttondown = true
boolean boldselectedtext = true
alignment alignment = center!
integer selectedtab = 1
tabpage_1 tabpage_1
tabpage_2 tabpage_2
end type

on tab_1.create
this.tabpage_1=create tabpage_1
this.tabpage_2=create tabpage_2
this.Control[]={this.tabpage_1,&
this.tabpage_2}
end on

on tab_1.destroy
destroy(this.tabpage_1)
destroy(this.tabpage_2)
end on

type tabpage_1 from userobject within tab_1
integer x = 18
integer y = 112
integer width = 3419
integer height = 1764
long backcolor = 16777215
string text = "Principale"
long tabtextcolor = 33554432
long tabbackcolor = 15780518
long picturemaskcolor = 536870912
dw_fiche1 dw_fiche1
end type

on tabpage_1.create
this.dw_fiche1=create dw_fiche1
this.Control[]={this.dw_fiche1}
end on

on tabpage_1.destroy
destroy(this.dw_fiche1)
end on

type dw_fiche1 from datawindow within tabpage_1
string tag = "brush"
integer x = 279
integer y = 184
integer width = 2779
integer height = 1200
integer taborder = 10
string dataobject = "dw_diagnostic_fiche"
boolean livescroll = true
borderstyle borderstyle = styleraised!
end type

event rbuttondown;string ls_object

ls_Object = String(dwo.name)

if Profilestring(dir_ini+inifile_orthokis,"commentaires_cliniques","menu_rtf","A") = "C" and  (ls_Object = "texte") then
	
	fxg_afficher_barre_rtf()
	
end if

end event

type tabpage_2 from userobject within tab_1
integer x = 18
integer y = 112
integer width = 3419
integer height = 1764
long backcolor = 16777215
string text = "DEP"
long tabtextcolor = 33554432
long tabbackcolor = 15780518
long picturemaskcolor = 536870912
dw_fiche2 dw_fiche2
end type

on tabpage_2.create
this.dw_fiche2=create dw_fiche2
this.Control[]={this.dw_fiche2}
end on

on tabpage_2.destroy
destroy(this.dw_fiche2)
end on

type dw_fiche2 from datawindow within tabpage_2
string tag = "brush"
integer x = 18
integer y = 28
integer width = 3374
integer height = 1704
integer taborder = 10
string title = "none"
string dataobject = "dw_diagnostic_fiche2"
boolean livescroll = true
borderstyle borderstyle = styleraised!
end type

type gb_1 from groupbox within w_diagnostic_fiche
integer x = 411
integer y = 496
integer width = 480
integer height = 400
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "none"
borderstyle borderstyle = styleraised!
end type

