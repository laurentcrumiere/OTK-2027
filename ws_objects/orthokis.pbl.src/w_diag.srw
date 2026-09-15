$PBExportHeader$w_diag.srw
forward
global type w_diag from w_fenetre_arakis
end type
type tab_1 from tab within w_diag
end type
type tabpage_traitement from userobject within tab_1
end type
type dw_traitement from datawindow within tabpage_traitement
end type
type dw_plan from datawindow within tabpage_traitement
end type
type dw_diag from datawindow within tabpage_traitement
end type
type tabpage_traitement from userobject within tab_1
dw_traitement dw_traitement
dw_plan dw_plan
dw_diag dw_diag
end type
type tabpage_dep from userobject within tab_1
end type
type dw_commentaire_dep from datawindow within tabpage_dep
end type
type dw_dep from datawindow within tabpage_dep
end type
type tabpage_dep from userobject within tab_1
dw_commentaire_dep dw_commentaire_dep
dw_dep dw_dep
end type
type tab_1 from tab within w_diag
tabpage_traitement tabpage_traitement
tabpage_dep tabpage_dep
end type
type cb_fermer from uo_picturebutton_390x120 within w_diag
end type
type cb_enregistrer from uo_picturebutton_390x120 within w_diag
end type
type cb_annuler from uo_picturebutton_390x120 within w_diag
end type
type cb_enregistrer_historique from uo_picturebutton_780x120 within w_diag
end type
type cb_historique from uo_picturebutton_390x120 within w_diag
end type
type p_histo from picture within w_diag
end type
type pb_effacer_plan from picturebutton within w_diag
end type
type uo_1 from resize_fenetre within w_diag
end type
end forward

global type w_diag from w_fenetre_arakis
integer width = 4507
integer height = 2300
string title = "Diagnostic Patient"
windowtype windowtype = response!
tab_1 tab_1
cb_fermer cb_fermer
cb_enregistrer cb_enregistrer
cb_annuler cb_annuler
cb_enregistrer_historique cb_enregistrer_historique
cb_historique cb_historique
p_histo p_histo
pb_effacer_plan pb_effacer_plan
uo_1 uo_1
end type
global w_diag w_diag

type variables
double var_code_local
end variables

forward prototypes
public function integer init_icone_histo ()
end prototypes

public function integer init_icone_histo ();//protected fx pour affichage icone historique des traitements si qqch en histo
//retourne tjrs 1

long nbr_histo	//pour totaliser le nbr de traitement en historique


select count(*) into :nbr_histo from historique_traitement where code = :var_code_local;
if nbr_histo > 0 then
	p_histo.visible = true
	cb_historique.enabled ( true )
else
	p_histo.visible = false
	cb_historique.enabled ( false )
end if

return 1
end function

on w_diag.create
int iCurrent
call super::create
this.tab_1=create tab_1
this.cb_fermer=create cb_fermer
this.cb_enregistrer=create cb_enregistrer
this.cb_annuler=create cb_annuler
this.cb_enregistrer_historique=create cb_enregistrer_historique
this.cb_historique=create cb_historique
this.p_histo=create p_histo
this.pb_effacer_plan=create pb_effacer_plan
this.uo_1=create uo_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.tab_1
this.Control[iCurrent+2]=this.cb_fermer
this.Control[iCurrent+3]=this.cb_enregistrer
this.Control[iCurrent+4]=this.cb_annuler
this.Control[iCurrent+5]=this.cb_enregistrer_historique
this.Control[iCurrent+6]=this.cb_historique
this.Control[iCurrent+7]=this.p_histo
this.Control[iCurrent+8]=this.pb_effacer_plan
this.Control[iCurrent+9]=this.uo_1
end on

on w_diag.destroy
call super::destroy
destroy(this.tab_1)
destroy(this.cb_fermer)
destroy(this.cb_enregistrer)
destroy(this.cb_annuler)
destroy(this.cb_enregistrer_historique)
destroy(this.cb_historique)
destroy(this.p_histo)
destroy(this.pb_effacer_plan)
destroy(this.uo_1)
end on

event open;call super::open;//récup du message d'ouverture
var_code_local = message.doubleparm



// Pour les plans de traitement multiples ou non
if profilestring(dir_ini+inifile_orthokis,"commentaires_cliniques","plans_mutiples","N") = "O" then
	tab_1.tabpage_traitement.dw_traitement.dataobject = "dw_patient_fiche4_bis"
	// on vire les infobulles
	if profilestring(dir_ini+inifile_orthokis,"commentaires_cliniques","multiligne_infobulle","O") = "N" then
		tab_1.tabpage_traitement.dw_traitement.object.patient_traitement_effectue_html.Tooltip.enabled = 0
		tab_1.tabpage_traitement.dw_traitement.object.patient_diag_alveolaire_html.Tooltip.enabled = 0
		tab_1.tabpage_traitement.dw_traitement.object.patient_diag_dentaire_html.Tooltip.enabled = 0
		tab_1.tabpage_traitement.dw_traitement.object.patient_plan_traitement_html.Tooltip.enabled = 0
		tab_1.tabpage_traitement.dw_traitement.object.patient_plan_complement_html.Tooltip.enabled = 0
		tab_1.tabpage_traitement.dw_traitement.object.patient_diag_fonctionnel_html.Tooltip.enabled = 0
	end if

else
	if profilestring(dir_ini+inifile_orthokis,"commentaires_cliniques","diag_non_rtf","N") = "O" then
		tab_1.tabpage_traitement.dw_traitement.dataobject = "dw_patient_fiche4_html"
	end if	
end if

colore_tous_objets_tab(tab_1, couleur_fond_datawindow)


//retrieve de la datawindow
tab_1.tabpage_dep.dw_dep.settransobject(SQLCA)
tab_1.tabpage_traitement.dw_traitement.settransobject(SQLCA)

tab_1.tabpage_dep.dw_dep.retrieve(var_code_local)
tab_1.tabpage_traitement.dw_traitement.retrieve(var_code_local)

if Belgique or Luxembourg then
	tab_1.tabpage_dep.visible = false
end if

// pour l'historique
init_icone_histo()


// Belgique ou Luxembourg
if Belgique or Luxembourg then
	tab_1.tabpage_dep.visible = false
	// pas d'info sur la DEP
//	tab_1.tabpage_traitement.dw_traitement.object.t_1.visible = false
//	tab_1.tabpage_traitement.dw_traitement.object.patient_duree_traitement.visible = false
	tab_1.tabpage_traitement.dw_traitement.object.plan_imprime.visible = false
end if

if enregistrement_automatique then
	cb_annuler.visible = false
	cb_enregistrer.visible = false
end if


// SPECIAL CHU DE LIEGE
if serial = '87500' and gfx_chu_signature_plan(var_code_local) then
	tab_1.tabpage_traitement.dw_traitement.enabled = false
	cb_enregistrer_historique.enabled = false
	cb_historique.enabled = false
end if

uo_1.taille(this)

// pour agrandir la fenêtre au max
//this.x = w_mdi_2020.WorkspaceX () + w_mdi_2020.WorkspaceWidth() * 0.05
// On prend le X au cas ou on n'utilise pas l'écran principal
this.x = w_mdi_2020.x + w_mdi_2020.WorkspaceWidth() * 0.05
this.y = w_mdi_2020.WorkspaceY ()+ w_mdi_2020.WorkspaceHeight() * 0.05
this.width =  w_mdi_2020.WorkspaceWidth() * 0.9
this.height =  w_mdi_2020.WorkspaceHeight() * 0.9
	


end event

event close;call super::close;


if enregistrement_automatique then
	cb_enregistrer.triggerevent(clicked!)
end if


end event

event resize;call super::resize;
setredraw(false)


uo_1.retaille(this)
tab_1.tabpage_traitement.dw_traitement.width = tab_1.tabpage_traitement.width
tab_1.tabpage_traitement.dw_traitement.height = tab_1.tabpage_traitement.height
tab_1.tabpage_traitement.dw_traitement.x = 0
tab_1.tabpage_traitement.dw_traitement.y = 0

tab_1.tabpage_dep.dw_dep.width = tab_1.tabpage_dep.width
tab_1.tabpage_dep.dw_dep.height = tab_1.tabpage_dep.height
tab_1.tabpage_dep.dw_dep.x = 0
tab_1.tabpage_dep.dw_dep.y = 0

double ratio

ratio =  uo_1.ratio

//ratio = max( 0.98 , uo_1.ratio * 0.925)
ratio = max(1 , uo_1.ratio * 0.925)


tab_1.tabpage_traitement.dw_traitement.Object.DataWindow.zoom = string(int(ratio*100))
//tab_1.tabpage_traitement.dw_traitement.width = tab_1.tabpage_traitement.dw_traitement.width * ratio 
////tab_1.tabpage_traitement.dw_traitement.height = tab_1.tabpage_traitement.dw_traitement.height  * ratio
//tab_1.tabpage_traitement.dw_traitement.height = tab_1.tabpage_traitement.height - 30
//tab_1.tabpage_traitement.dw_traitement.x = (tab_1.tabpage_traitement.width - tab_1.tabpage_traitement.dw_traitement.width) / 2
////tab_1.tabpage_traitement.dw_traitement.y = (tab_1.tabpage_traitement.height - tab_1.tabpage_traitement.dw_traitement.height) / 2


tab_1.tabpage_dep.dw_dep.Object.DataWindow.zoom = string(int(ratio*100))
//tab_1.tabpage_dep.dw_dep.width = tab_1.tabpage_dep.dw_dep.width * ratio
////tab_1.tabpage_dep.dw_dep.height = tab_1.tabpage_dep.dw_dep.height  * ratio
//tab_1.tabpage_dep.dw_dep.height = tab_1.tabpage_dep.height - 30
//tab_1.tabpage_dep.dw_dep.x = (tab_1.tabpage_dep.width - tab_1.tabpage_dep.dw_dep.width) / 2
////tab_1.tabpage_dep.dw_dep.y = (tab_1.tabpage_dep.height - tab_1.tabpage_dep.dw_dep.height) / 2
setredraw(true)


//
//setredraw(false)
//
//
//uo_1.retaille(this)
//
//
//double ratio
//
//ratio =  uo_1.ratio
//
//ratio = max( 0.98 , uo_1.ratio * 0.925)
//
//
//tab_1.tabpage_traitement.dw_traitement.Object.DataWindow.zoom = string(int(ratio*100))
//tab_1.tabpage_traitement.dw_traitement.width = tab_1.tabpage_traitement.dw_traitement.width * ratio 
////tab_1.tabpage_traitement.dw_traitement.height = tab_1.tabpage_traitement.dw_traitement.height  * ratio
//tab_1.tabpage_traitement.dw_traitement.height = tab_1.tabpage_traitement.height - 30
//tab_1.tabpage_traitement.dw_traitement.x = (tab_1.tabpage_traitement.width - tab_1.tabpage_traitement.dw_traitement.width) / 2
////tab_1.tabpage_traitement.dw_traitement.y = (tab_1.tabpage_traitement.height - tab_1.tabpage_traitement.dw_traitement.height) / 2
//
//
//tab_1.tabpage_dep.dw_dep.Object.DataWindow.zoom = string(int(ratio*100))
//tab_1.tabpage_dep.dw_dep.width = tab_1.tabpage_dep.dw_dep.width * ratio
////tab_1.tabpage_dep.dw_dep.height = tab_1.tabpage_dep.dw_dep.height  * ratio
//tab_1.tabpage_dep.dw_dep.height = tab_1.tabpage_dep.height - 30
//tab_1.tabpage_dep.dw_dep.x = (tab_1.tabpage_dep.width - tab_1.tabpage_dep.dw_dep.width) / 2
////tab_1.tabpage_dep.dw_dep.y = (tab_1.tabpage_dep.height - tab_1.tabpage_dep.dw_dep.height) / 2
//setredraw(true)
//
end event

type p_fond from w_fenetre_arakis`p_fond within w_diag
end type

type tab_1 from tab within w_diag
event create ( )
event destroy ( )
integer x = 41
integer y = 24
integer width = 4361
integer height = 1932
integer taborder = 10
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
tabpage_traitement tabpage_traitement
tabpage_dep tabpage_dep
end type

on tab_1.create
this.tabpage_traitement=create tabpage_traitement
this.tabpage_dep=create tabpage_dep
this.Control[]={this.tabpage_traitement,&
this.tabpage_dep}
end on

on tab_1.destroy
destroy(this.tabpage_traitement)
destroy(this.tabpage_dep)
end on

type tabpage_traitement from userobject within tab_1
integer x = 18
integer y = 112
integer width = 4325
integer height = 1804
long backcolor = 16777215
string text = "Traitement"
long tabtextcolor = 33554432
long tabbackcolor = 15780518
long picturemaskcolor = 536870912
dw_traitement dw_traitement
dw_plan dw_plan
dw_diag dw_diag
end type

on tabpage_traitement.create
this.dw_traitement=create dw_traitement
this.dw_plan=create dw_plan
this.dw_diag=create dw_diag
this.Control[]={this.dw_traitement,&
this.dw_plan,&
this.dw_diag}
end on

on tabpage_traitement.destroy
destroy(this.dw_traitement)
destroy(this.dw_plan)
destroy(this.dw_diag)
end on

type dw_traitement from datawindow within tabpage_traitement
string tag = "brush"
integer x = 41
integer width = 3931
integer height = 1792
integer taborder = 30
boolean bringtotop = true
string title = "none"
string dataobject = "dw_patient_fiche4"
boolean border = false
boolean livescroll = true
end type

event rbuttondown;string nom
String nom_colonne

nom_colonne = this.getColumnName()

if this.dataobject = "dw_patient_fiche4" or this.dataobject = "dw_patient_fiche4_2024"  then

	
	// Si le curseur est dans le champ "Plan de traitement"
	// Alors on affiche la datawindow pour pouvoir choisir un nouveau plan de ttt
	// Sinon on affiche la datawindow pour pouvoir choisir un nouveau diagnostic
	//       si le curseur est dans le champ "Diagnostic"
	
	IF nom_colonne = "plan_traitement" THEN
		dw_plan.SetTransObject(SQLCA)
		dw_plan.Retrieve()
		dw_plan.visible = TRUE
		dw_diag.visible = FALSE
	ELSE
		IF nom_colonne = "traitement_effectue" THEN
			dw_diag.SetTransObject(SQLCA)
			dw_diag.Retrieve()
			dw_diag.visible = TRUE	
			dw_plan.visible = FALSE
		END IF
	END IF
else
	
	IF nom_colonne = "patient_plan_traitement_html" or nom_colonne = "patient_plan_complement_html"  THEN
		dw_plan.SetTransObject(SQLCA)
		dw_plan.Retrieve()
		dw_plan.visible = TRUE
		dw_diag.visible = FALSE
	ELSE
		IF nom_colonne = "patient_traitement_effectue_html" or nom_colonne = "patient_diag_dentaire_html"  or nom_colonne = "patient_diag_fonctionnel_html" or nom_colonne = "patient_diag_alveolaire_html"  THEN
			dw_diag.SetTransObject(SQLCA)
			dw_diag.SetFilter("")
			if profilestring(dir_ini+inifile_orthokis,"commentaires_cliniques","plans_mutiples","N") = "O" then
				// plan multiples, on va activer des filtres !
				if nom_colonne = "patient_traitement_effectue_html" then
					dw_diag.SetFilter("type_diag = 'S'")
				else
					if nom_colonne = "patient_diag_dentaire_html" then
						dw_diag.SetFilter("type_diag = 'D'")
					else
						if nom_colonne = "patient_diag_fonctionnel_html" then
							dw_diag.SetFilter("type_diag = 'F'")
						else
							dw_diag.SetFilter("type_diag = 'A'")
						end if
					end if
				end if
			end if
			dw_diag.filter()
			dw_diag.Retrieve()
			dw_diag.visible = TRUE	
			dw_plan.visible = FALSE
		END IF
	END IF
	
end if
end event

event itemfocuschanged;if this.dataobject = "dw_patient_fiche4" or dw_traitement.dataobject = "dw_patient_fiche4_2024" then

	if getcolumnName() = "plan_traitement" or getcolumnName() = "traitement_effectue"   then
		
		// on analyse les modifs .. si aucune, on fait un enregistrer pour éviter message "quitter sans enregistrer" en mode enregistrement non auto
		long modif
		modif = modifiedcount() 
		// Police des zones rtf
		police_rtf_par_defaut(this)
		
		if modif = 0 then
			// pas eu de modif avant
			cb_enregistrer.triggerevent(clicked!)
		end if
	end if
end if
end event

event buttonclicked;string	ls_Object
string	ls_win

ls_Object = String(dwo.name)




choose case ls_Object
		
	case "b_schema"
		if row > 0 then
			param_win[1] = "E"
			openWithParm(w_schema, GetItemString(1, "patient_extraction"))

			// recup de la valeur retournée
			string v_extraction 
			v_extraction = message.StringParm
			if v_extraction <> "-1" then
				SetItem(1, "patient_extraction", v_extraction)
			end if
		end if
		
	case "b_schema_dents_soins"
		if row > 0 then
			param_win[1] = "S"
			openWithParm(w_schema, GetItemString(1, "patient_dents_soins"))

			// recup de la valeur retournée
			string v_dents_soins 
			v_dents_soins = message.StringParm
			if v_dents_soins <> "-1" then
				SetItem(1, "patient_dents_soins", v_dents_soins)
			end if
		end if
		
		
		
end choose
end event

event dberror;db_erreur(dw_traitement,sqldbcode,sqlerrtext)
return 1
end event

type dw_plan from datawindow within tabpage_traitement
string tag = "brush"
boolean visible = false
integer x = 3049
integer y = 48
integer width = 1079
integer height = 1736
integer taborder = 50
boolean bringtotop = true
boolean titlebar = true
string title = "Plans de Traitement"
string dataobject = "dw_plan_ttt_affichage"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = styleraised!
end type

event clicked;If row > 0 Then
	This.SelectRow(0,False)
	This.SelectRow(row,True)
End If

end event

event doubleclicked;
//string texte
//
//texte = dw_plan.GetItemString(this.GetRow(),"texte")
//dw_traitement.SetItem(dw_traitement.GetRow(),"plan_traitement",texte)
//
//
//this.visible = FALSE


// Si tout le texte dans la zone "Plan de traitement" est sélectionné 
// Alors on remplace tout et on met le plan de traitement cliqué
// Sinon si rien sélectionné
//			alors rajouter à la suite le plan de traitement
//			sinon si début de texte sélectionné
//					alors on remet la fin du texte + le plan de traitement cliqué
//					sinon (fin de texte sélectionné) on remet le début du texte + le plan de traitement cliqué


string texte ,  texte_plan , texte_final
string texte_selectionne
char c = "~n"
char r = "~r"

dw_traitement.accepttext()

if this.rowcount() > 0 then
	
	if dw_traitement.dataobject = "dw_patient_fiche4" or dw_traitement.dataobject = "dw_patient_fiche4_2024" then
		// On travaille uniquement sur les textes bruts depuis 18.02a car ça pose trop de pb (orthosmile !!)
	
		texte = dw_plan.GetItemString(this.GetRow(),"texte_html")
		
		texte_plan = dw_traitement.GetItemString(dw_traitement.GetRow(),"texte_brut_plan_traitement")
		
		texte_selectionne = dw_traitement.SelectedText()
	
		if  IsNull(texte_plan) then
			 texte_plan = ""
		end if
		
		IF texte_plan = texte_selectionne or len(trim(texte_plan)) = 0 THEN
			texte_final =  dw_plan.GetItemString(this.GetRow(),"texte")
		ELSE	
			texte_final = texte_plan  + dw_plan.GetItemString(this.GetRow(),"texte_html")	
			texte_final = string_To_Rtf(texte_final, couleur_noire, couleur_blanche)
		END IF
		
	
		dw_traitement.SetItem(dw_traitement.GetRow(),"plan_traitement",texte_final)
		
	else
		
		long colonne_courante
		
		colonne_courante = dw_traitement.GetColumn()
		
		string texte_deja
	
		// On travaille uniquement sur les textes bruts depuis 18.02a car ça pose trop de pb (orthosmile !!)
	
		texte = this.GetItemString(this.GetRow(),"texte_html")
			
		texte_deja = dw_traitement.GetItemString(1, colonne_courante)
	
		texte_selectionne = dw_traitement.SelectedText()
		
		if  IsNull(texte_deja) then
			 texte_deja = ""
		end if
		
		IF texte_deja = texte_selectionne or len(trim(texte_deja)) = 0 THEN
			texte_final =  texte
		ELSE	
			texte_final = texte_deja  + texte
		END IF
		
		dw_traitement.SetItem(1,colonne_courante,texte_final)
	end if
	
end if
this.visible = FALSE
end event

event rbuttondown;this.visible = FALSE
end event

type dw_diag from datawindow within tabpage_traitement
string tag = "brush"
boolean visible = false
integer x = 2523
integer y = 12
integer width = 1600
integer height = 1772
integer taborder = 40
boolean bringtotop = true
boolean titlebar = true
string title = "Diagnostics"
string dataobject = "dw_diagnostic_affichage"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;If row > 0 Then
	This.SelectRow(0,False)
	This.SelectRow(row,True)
End If

end event

event doubleclicked;// Si tout le texte dans la zone "Diagnostic" est sélectionné 
// Alors on remplace tout et on met le diagnostic cliqué
// Sinon si rien sélectionné
//			alors rajouter à la suite le diagnostic
//			sinon si début de texte sélectionné
//					alors on remet la fin du texte + le diagnostic cliqué
//					sinon (fin de texte sélectionné) on remet le début du texte + le diagnostic cliqué

string texte ,  texte_diag , texte_final
string texte_selectionne
char c = "~n"
char r = "~r"

dw_traitement.accepttext()

if this.rowcount() > 0 then

	if dw_traitement.dataobject = "dw_patient_fiche4" or dw_traitement.dataobject = "dw_patient_fiche4_2024" then
		// On travaille uniquement sur les textes bruts depuis 18.02a car ça pose trop de pb (orthosmile !!)

		texte = dw_diag.GetItemString(this.GetRow(),"texte_html")
			
		texte_diag = dw_traitement.GetItemString(dw_traitement.GetRow(),"texte_brut_traitement_effectue")
	
		texte_selectionne = dw_traitement.SelectedText()
		
		if  IsNull(texte_diag) then
			 texte_diag = ""
		end if
		
		IF texte_diag = texte_selectionne or len(trim(texte_diag)) = 0 THEN
			texte_final =  dw_diag.GetItemString(this.GetRow(),"texte")
		ELSE	
			texte_final = texte_diag  + dw_diag.GetItemString(this.GetRow(),"texte_html")	
			texte_final = string_To_Rtf(texte_final, couleur_noire, couleur_blanche)
		END IF
		
		
		dw_traitement.SetItem(dw_traitement.GetRow(),"traitement_effectue",texte_final)
	else

		long colonne_courante
		
		colonne_courante = dw_traitement.GetColumn()
		
		string texte_deja
	
		// On travaille uniquement sur les textes bruts depuis 18.02a car ça pose trop de pb (orthosmile !!)
	
		texte = this.GetItemString(this.GetRow(),"texte_html")
			
		texte_deja = dw_traitement.GetItemString(1, colonne_courante)
	
		texte_selectionne = dw_traitement.SelectedText()
		
		if  IsNull(texte_deja) then
			 texte_deja = ""
		end if
		
		IF texte_deja = texte_selectionne or len(trim(texte_deja)) = 0 THEN
			texte_final =  texte
		ELSE	
			texte_final = texte_deja  + texte
		END IF
		
		
		dw_traitement.SetItem(1,colonne_courante,texte_final)
		
		
	end if

end if
this.visible = FALSE
end event

event rbuttondown;this.visible = FALSE
end event

type tabpage_dep from userobject within tab_1
event create ( )
event destroy ( )
integer x = 18
integer y = 112
integer width = 4325
integer height = 1804
long backcolor = 16777215
string text = "DEP"
long tabtextcolor = 33554432
long tabbackcolor = 15780518
long picturemaskcolor = 536870912
dw_commentaire_dep dw_commentaire_dep
dw_dep dw_dep
end type

on tabpage_dep.create
this.dw_commentaire_dep=create dw_commentaire_dep
this.dw_dep=create dw_dep
this.Control[]={this.dw_commentaire_dep,&
this.dw_dep}
end on

on tabpage_dep.destroy
destroy(this.dw_commentaire_dep)
destroy(this.dw_dep)
end on

type dw_commentaire_dep from datawindow within tabpage_dep
string tag = "brush no resize all"
boolean visible = false
integer x = 2679
integer y = 24
integer width = 1536
integer height = 1612
integer taborder = 90
boolean bringtotop = true
boolean titlebar = true
string title = "Commentaires pour Demande Entente Préalable"
string dataobject = "dw_commentaire_dep_affichage"
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


tab_1.tabpage_dep.dw_dep.accepttext()

if this.rowcount() > 0 and tab_1.tabpage_dep.dw_dep.rowcount() > 0 then
	tab_1.tabpage_dep.dw_dep.SetItem(1, "commentaire", this.GetItemString(row, "commentaire"))
end if

this.visible = FALSE


end event

event rbuttondown;this.visible = FALSE
end event

type dw_dep from datawindow within tabpage_dep
string tag = "brush"
integer x = 535
integer width = 3529
integer height = 1788
integer taborder = 30
string title = "none"
string dataobject = "dw_patient_fiche6"
boolean vscrollbar = true
boolean border = false
end type

event rbuttondown;
String nom_colonne;

nom_colonne = this.getColumnName();
	
if nom_colonne = "commentaire" THEN
	dw_commentaire_dep.SetTransObject(SQLCA)
	dw_commentaire_dep.Retrieve()
	dw_commentaire_dep.visible = TRUE
end if
end event

event dberror;db_erreur(dw_dep,sqldbcode,sqlerrtext)
return 1
end event

type cb_fermer from uo_picturebutton_390x120 within w_diag
integer x = 3886
integer y = 1988
integer width = 517
integer taborder = 50
string text = "&Fermer"
string iconname = "ACTIONS_fermer.png"
end type

event clicked;call super::clicked;tab_1.tabpage_dep.dw_dep.accepttext()
tab_1.tabpage_traitement.dw_traitement.accepttext()


if (tab_1.tabpage_dep.dw_dep.modifiedcount() > 0 or tab_1.tabpage_traitement.dw_traitement.modifiedcount() > 0) and not enregistrement_automatique   Then
	If MessageBox("ATTENTION","Vous avez fait des modifications !~n~nVoulez-vous vraiment fermer cette fenêtre sans enregistrer (et ainsi perdre les modifications) ?",Question!,YesNo!, 2) = 1 Then
		Close(parent)
	end if
else
	close(parent)
end if
end event

type cb_enregistrer from uo_picturebutton_390x120 within w_diag
integer x = 3355
integer y = 1988
integer width = 517
integer taborder = 30
string text = "&Enregistrer"
boolean default = true
string iconname = "ACTIONS_enregistrer.png"
end type

event clicked;call super::clicked;tab_1.tabpage_dep.dw_dep.accepttext()
tab_1.tabpage_traitement.dw_traitement.accepttext()


string texte_brut_plan_traitement


// Mise à jour de la zone pour comptatilité avec MyOrthokis

if profilestring(dir_ini+inifile_orthokis,"commentaires_cliniques","plans_mutiples","N") = "O" then
	// Saisie en texte => conversion en RTF
	tab_1.tabpage_traitement.dw_traitement.setItem(1, "traitement_effectue", string_To_Rtf(tab_1.tabpage_traitement.dw_traitement.getitemString(1, "patient_traitement_effectue_html"), couleur_noire, couleur_blanche))
	tab_1.tabpage_traitement.dw_traitement.setItem(1, "plan_traitement", string_To_Rtf(tab_1.tabpage_traitement.dw_traitement.getitemString(1, "patient_plan_traitement_html"), couleur_noire, couleur_blanche))
else

	if profilestring(dir_ini+inifile_orthokis,"commentaires_cliniques","diag_non_rtf","N") = "O" then
		// Saisie en texte en brut => conversion en RTF
		tab_1.tabpage_traitement.dw_traitement.setItem(1, "traitement_effectue", string_To_Rtf(tab_1.tabpage_traitement.dw_traitement.getitemString(1, "patient_traitement_effectue_html"), couleur_noire, couleur_blanche))
		tab_1.tabpage_traitement.dw_traitement.setItem(1, "plan_traitement", string_To_Rtf(tab_1.tabpage_traitement.dw_traitement.getitemString(1, "patient_plan_traitement_html"), couleur_noire, couleur_blanche))
	else
		// Saisie en RTF .. conversion en brut
		texte_brut_plan_traitement = tab_1.tabpage_traitement.dw_traitement.getitemString(1, "texte_brut_plan_traitement")
	
		tab_1.tabpage_traitement.dw_traitement.setItem(1, "patient_plan_traitement_html", tab_1.tabpage_traitement.dw_traitement.getitemString(1, "texte_brut_plan_traitement"))
		tab_1.tabpage_traitement.dw_traitement.setItem(1, "patient_traitement_effectue_html", tab_1.tabpage_traitement.dw_traitement.getitemString(1, "texte_brut_traitement_effectue"))
	end if
end if

tab_1.tabpage_traitement.dw_traitement.accepttext()


if tab_1.tabpage_dep.dw_dep.update() = 1 and tab_1.tabpage_traitement.dw_traitement.update() = 1 Then
	
//	if profilestring(dir_ini+inifile_orthokis,"commentaires_cliniques","plans_mutiples","N") = "N" and profilestring(dir_ini+inifile_orthokis,"commentaires_cliniques","diag_non_rtf","N") = "N" then
//		// pour une raison très mystérieuse, patient_plan_traitement_html se met mal à jour !!!
//		update patient set plan_traitement_html = :texte_brut_plan_traitement where code = :var_code_local ;
//	end if
	commit ;
else
	Rollback ;
end if









//tab_1.tabpage_dep.dw_1.accepttext()
//tab_1.tabpage_traitement.dw_traitement.accepttext()
//
//
//string texte_brut_plan_traitement
//
//
//// Mise à jour de la zone pour comptatilité avec MyOrthokis
//
//if profilestring(dir_ini+inifile_orthokis,"commentaires_cliniques","plans_mutiples","N") = "O" then
//	// Saisie en texte => conversion en RTF
//	tab_1.tabpage_traitement.dw_traitement.setItem(1, "traitement_effectue", string_To_Rtf(tab_1.tabpage_traitement.dw_traitement.getitemString(1, "patient_traitement_effectue_html"), couleur_noire, couleur_blanche))
//	tab_1.tabpage_traitement.dw_traitement.setItem(1, "plan_traitement", string_To_Rtf(tab_1.tabpage_traitement.dw_traitement.getitemString(1, "patient_plan_traitement_html"), couleur_noire, couleur_blanche))
//else
//
//	texte_brut_plan_traitement = tab_1.tabpage_traitement.dw_traitement.getitemString(1, "texte_brut_plan_traitement")
//
//	tab_1.tabpage_traitement.dw_traitement.setItem(1, "patient_plan_traitement_html", tab_1.tabpage_traitement.dw_traitement.getitemString(1, "texte_brut_plan_traitement"))
//	tab_1.tabpage_traitement.dw_traitement.setItem(1, "patient_traitement_effectue_html", tab_1.tabpage_traitement.dw_traitement.getitemString(1, "texte_brut_traitement_effectue"))
//end if
//
//tab_1.tabpage_traitement.dw_traitement.accepttext()
//
//
//if tab_1.tabpage_dep.dw_1.update() = 1 and tab_1.tabpage_traitement.dw_traitement.update() = 1 Then
//	
//	if profilestring(dir_ini+inifile_orthokis,"commentaires_cliniques","plans_mutiples","N") = "N" then
//		// pour une raison très mystérieuse, patient_plan_traitement_html se met mal à jour !!!
//		update patient set plan_traitement_html = :texte_brut_plan_traitement where code = :var_code_local ;
//	end if
//	commit ;
//else
//	Rollback ;
//end if
//
end event

type cb_annuler from uo_picturebutton_390x120 within w_diag
integer x = 2825
integer y = 1988
integer width = 517
integer taborder = 20
string text = "&Annuler"
string iconname = "ACTIONS_annuler.png"
end type

event clicked;call super::clicked;tab_1.tabpage_dep.dw_dep.retrieve(var_code_local)
tab_1.tabpage_traitement.dw_traitement.retrieve(var_code_local)

end event

type cb_enregistrer_historique from uo_picturebutton_780x120 within w_diag
integer x = 55
integer y = 1988
integer taborder = 50
boolean bringtotop = true
string text = "Enreg. Historique"
string iconname = "ACTIONS_enregistrer.png"
end type

event clicked;call super::clicked;

// Mémorisation des infos avant !
cb_enregistrer.triggerevent(clicked!)

datawindow dw_null 
setnull(dw_null)
fxg_enregistrement_historique_traitement(var_code_local, tab_1.tabpage_traitement.dw_traitement, tab_1.tabpage_dep.dw_dep , dw_null, dw_null, dw_null, dw_null)


// pour l'historique
init_icone_histo()
end event

type cb_historique from uo_picturebutton_390x120 within w_diag
integer x = 855
integer y = 1988
integer width = 768
integer taborder = 60
boolean bringtotop = true
string text = "Voir Historique"
string iconname = "ACTIONS_historique_noemie.png"
end type

event clicked;call super::clicked;openwithparm(w_historique_traitement_liste,var_code_local)

// pour effacer l'icone si on a supprimé des historique 
init_icone_histo()
end event

type p_histo from picture within w_diag
string tag = "no resizeall"
integer x = 1655
integer y = 1996
integer width = 146
integer height = 128
boolean bringtotop = true
string picturename = "lc_histo_dossier.png"
boolean focusrectangle = false
string powertiptext = "Il y a des valeurs en historique"
end type

type pb_effacer_plan from picturebutton within w_diag
integer x = 1833
integer y = 2000
integer width = 146
integer height = 128
integer taborder = 110
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "lc_poubelle.png"
alignment htextalign = left!
string powertiptext = "Effacement des informations de diagnostic et de plan de traitement"
end type

event clicked;

// Verfication si une sauvegarde a été faire avant ...
integer i_cpt
boolean b_suite = true

select count(*) into :i_cpt 
from historique_traitement where "code" = :var_code_local and "date_sauvegarde" = cast(getdate() as date) ;

if i_cpt = 0 then
	Messagebox("ATTENTION", "Vous devez avoir sauvegardé vos données cliniques (à la date du jour) avant d'effacer les informations de diagnostic et de plan de traitement.~n~nLa fenêtre suivante va vous permettre de le faire.")
	cb_enregistrer_historique.triggerevent(clicked!)
end if

// On revérifie ...
select count(*) into :i_cpt 
from historique_traitement where "code" = :var_code_local and "date_sauvegarde" = cast(getdate() as date) ;

if i_cpt > 0 then
	
	if messageBox("ATTENTION", "Confirmez-vous l'effacement des données cliniques ?", Question!, Yesno!, 2) = 1 then 
		// On efface ... 
		
		if profilestring(dir_ini+inifile_orthokis,"commentaires_cliniques","plans_mutiples","N") = "N" then
			tab_1.tabpage_traitement.dw_traitement.Setitem(1,"plan_traitement", "")
			tab_1.tabpage_traitement.dw_traitement.Setitem(1,"traitement_effectue", "")
			tab_1.tabpage_traitement.dw_traitement.Setitem(1,"patient_plan_traitement_html", "")
			tab_1.tabpage_traitement.dw_traitement.Setitem(1,"patient_traitement_effectue_html", "")
		else
			tab_1.tabpage_traitement.dw_traitement.Setitem(1,"plan_traitement", "")
			tab_1.tabpage_traitement.dw_traitement.Setitem(1,"patient_plan_traitement_html", "")
			tab_1.tabpage_traitement.dw_traitement.Setitem(1,"patient_extraction", "")
			tab_1.tabpage_traitement.dw_traitement.Setitem(1,"patient_plan_complement_html", "")
			tab_1.tabpage_traitement.dw_traitement.Setitem(1,"patient_diag_dentaire_html", "")
			tab_1.tabpage_traitement.dw_traitement.Setitem(1,"patient_diag_alveolaire_html", "")
			tab_1.tabpage_traitement.dw_traitement.Setitem(1,"traitement_effectue", "")
			tab_1.tabpage_traitement.dw_traitement.Setitem(1,"patient_traitement_effectue_html", "")
			tab_1.tabpage_traitement.dw_traitement.Setitem(1,"patient_diag_fonctionnel_html", "")
		end if
	
		tab_1.tabpage_dep.dw_dep.Setitem(1,"basal_max_pro" , "")
		tab_1.tabpage_dep.dw_dep.Setitem(1,"basal_max_retro" , "")
		tab_1.tabpage_dep.dw_dep.Setitem(1,"basal_mand_pro" , "")
		tab_1.tabpage_dep.dw_dep.Setitem(1,"basal_mand_retro" , "")
		tab_1.tabpage_dep.dw_dep.Setitem(1,"basal_max_endo" , "")
		tab_1.tabpage_dep.dw_dep.Setitem(1,"basal_max_exo" , "")
		tab_1.tabpage_dep.dw_dep.Setitem(1,"basal_mand_endo" , "")
		tab_1.tabpage_dep.dw_dep.Setitem(1,"basal_mand_exo" , "")
		tab_1.tabpage_dep.dw_dep.Setitem(1,"hypodivergence" , "")
		tab_1.tabpage_dep.dw_dep.Setitem(1,"hyperdivergence" , "")
		tab_1.tabpage_dep.dw_dep.Setitem(1,"alveo_max_pro" , "")
		tab_1.tabpage_dep.dw_dep.Setitem(1,"alveo_max_retro" , "")
		tab_1.tabpage_dep.dw_dep.Setitem(1,"alveo_mand_pro" , "")
		tab_1.tabpage_dep.dw_dep.Setitem(1,"alveo_mand_retro" , "")
		tab_1.tabpage_dep.dw_dep.Setitem(1,"alveo_max_endo" , "")
		tab_1.tabpage_dep.dw_dep.Setitem(1,"alveo_max_exo" , "")
		tab_1.tabpage_dep.dw_dep.Setitem(1,"alveo_mand_endo" , "")
		tab_1.tabpage_dep.dw_dep.Setitem(1,"alveo_mand_exo" , "")
		tab_1.tabpage_dep.dw_dep.Setitem(1,"supraclusion" , "")
		tab_1.tabpage_dep.dw_dep.Setitem(1,"infraclusion" , "")
		tab_1.tabpage_dep.dw_dep.Setitem(1,"mol_cl1" , "")
		tab_1.tabpage_dep.dw_dep.Setitem(1,"mol_cl2" , "")
		tab_1.tabpage_dep.dw_dep.Setitem(1,"mol_cl3" , "")
		tab_1.tabpage_dep.dw_dep.Setitem(1,"can_cl1" , "")
		tab_1.tabpage_dep.dw_dep.Setitem(1,"can_cl2" , "")
		tab_1.tabpage_dep.dw_dep.Setitem(1,"can_cl3" , "")
		tab_1.tabpage_dep.dw_dep.Setitem(1,"molaire" , "")
		tab_1.tabpage_dep.dw_dep.Setitem(1,"canine" , "")
		tab_1.tabpage_dep.dw_dep.Setitem(1,"dento_max" , "")
		tab_1.tabpage_dep.dw_dep.Setitem(1,"dento_dent" , "")
		tab_1.tabpage_dep.dw_dep.Setitem(1,"agenesie" , "")
		tab_1.tabpage_dep.dw_dep.Setitem(1,"surnum" , "")
		tab_1.tabpage_dep.dw_dep.Setitem(1,"malposition" , "")
		tab_1.tabpage_dep.dw_dep.Setitem(1,"occl_dte" , "")
		tab_1.tabpage_dep.dw_dep.Setitem(1,"occl_gche" , "")
		tab_1.tabpage_dep.dw_dep.Setitem(1,"occl_ant" , "")
		tab_1.tabpage_dep.dw_dep.Setitem(1,"facteur" , "")
		tab_1.tabpage_dep.dw_dep.Setitem(1,"commentaire" , "")
		tab_1.tabpage_dep.dw_dep.Setitem(1,"patient_commentaire_html" , "")
	end if 


end if

end event

type uo_1 from resize_fenetre within w_diag
boolean visible = false
integer x = 2130
integer y = 2064
integer taborder = 120
boolean bringtotop = true
end type

on uo_1.destroy
call resize_fenetre::destroy
end on

