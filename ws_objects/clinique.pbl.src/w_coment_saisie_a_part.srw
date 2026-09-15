$PBExportHeader$w_coment_saisie_a_part.srw
forward
global type w_coment_saisie_a_part from w_fenetre_arakis
end type
type cb_1 from uo_picturebutton_390x120_fermer within w_coment_saisie_a_part
end type
type cb_enregistrer from uo_picturebutton_390x120 within w_coment_saisie_a_part
end type
type cb_annuler from uo_picturebutton_390x120 within w_coment_saisie_a_part
end type
type dw_fiche from datawindow within w_coment_saisie_a_part
end type
type uo_1 from resize_fenetre within w_coment_saisie_a_part
end type
type uo_color from u_color_bar within w_coment_saisie_a_part
end type
type dw_commentaires_predefinis from datawindow within w_coment_saisie_a_part
end type
type mle_commentaire from multilineedit within w_coment_saisie_a_part
end type
type cb_ajouter_predefini from uo_picturebutton_250x120 within w_coment_saisie_a_part
end type
type cb_ajouter_prevu from uo_picturebutton_250x120 within w_coment_saisie_a_part
end type
type uo_color2 from u_color_bar within w_coment_saisie_a_part
end type
type dw_coment_rft_saisie from datawindow within w_coment_saisie_a_part
end type
type cb_annuler_predefini from picturebutton within w_coment_saisie_a_part
end type
end forward

global type w_coment_saisie_a_part from w_fenetre_arakis
integer width = 4713
integer height = 2736
string title = "Saisie / Mise à jour de Commentaire Clinique"
boolean minbox = false
boolean maxbox = false
boolean resizable = false
windowtype windowtype = response!
cb_1 cb_1
cb_enregistrer cb_enregistrer
cb_annuler cb_annuler
dw_fiche dw_fiche
uo_1 uo_1
uo_color uo_color
dw_commentaires_predefinis dw_commentaires_predefinis
mle_commentaire mle_commentaire
cb_ajouter_predefini cb_ajouter_predefini
cb_ajouter_prevu cb_ajouter_prevu
uo_color2 uo_color2
dw_coment_rft_saisie dw_coment_rft_saisie
cb_annuler_predefini cb_annuler_predefini
end type
global w_coment_saisie_a_part w_coment_saisie_a_part

type variables


str_coment v_coment
boolean table_commentaires_predefinis_sans_rtf = false
end variables

forward prototypes
public subroutine liste_deroulante (string nom_colonne, datawindow dw)
public subroutine ajouter_commentaire_predefini (boolean b_avec_ajout)
public subroutine ajouter_acte_prevu (boolean b_avec_ajout)
end prototypes

public subroutine liste_deroulante (string nom_colonne, datawindow dw);

string rs, filtre
integer ri

// Installe une liste déroulante sur la colonne N° x

rs = dw.Modify( nom_colonne + ".dddw.Name='dw_clinique_listes_deroulantes_ddlb'" )
rs = dw.Modify( nom_colonne + ".dddw.DataColumn='libelle'")
rs = dw.Modify( nom_colonne + ".dddw.DisplayColumn='libelle' ")
rs = dw.Modify( nom_colonne + ".dddw.AllowEdit='yes' ")
rs = dw.Modify( nom_colonne + ".height.autosize = 'yes'")

// semble inefficace
//rs = dw.Modify( nom_colonne + ".dddw.UseAsBorder = 'yes'")


// Actualisation de la dddw
DataWindowChild dw_fille
ri = dw.GetChild(nom_colonne, dw_fille) 
dw_fille.settransobject(sqlca)
dw_fille.retrieve()

// Les colonnes sont sous la forme com3_html, les options dans la table sont com3
filtre =  left(nom_colonne, 4) + " = 'O'"

ri = dw_fille.Setfilter( filtre )
ri = dw_fille.filter()

end subroutine

public subroutine ajouter_commentaire_predefini (boolean b_avec_ajout);long l_text, l_back

if v_coment.avec_rtf   then
	
	string v_com
	
	if not table_commentaires_predefinis_sans_rtf then 
		dw_coment_rft_saisie.accepttext()
		
		v_com = trim (dw_coment_rft_saisie.getItemString(1, "com"))
		
		
		// Ajout du commentaire qui est dans le RTF
		
		if len( v_com ) > 0 then
			
			if b_avec_ajout then
				// C'est une nouvelle ligne
				dw_fiche.setitem(1,"com", v_com)
			else
				// C'est une ligne existante .. on ajoute le texte - mais en brut .. pas le choix
				dw_fiche.setitem(1,"com", string_to_rtf(dw_fiche.GetitemString (1,"com_texte_brut") + dw_coment_rft_saisie.getItemString(1, "com_texte_brut") ,couleur_noire, couleur_blanche ) )			
			end if
			cb_annuler_predefini.triggerEvent(clicked!)
			dw_fiche.setColumn("com")
			
			// pour mettre le point d'insertion à la fin
			dw_fiche.SelectText(len(dw_fiche.GetText()) + 1, 0)
		
		end if
	else
		// Prédéfinis pas en rtf
		if len(trim(mle_commentaire.text)) > 0 then
			
			// recopie des infos du mle
			
			l_text = long(mle_commentaire.TextColor)
			l_back = long (mle_commentaire.BackColor)
			 
			dw_fiche.setitem(1,"coul_texte",l_text)
			dw_fiche.setitem(1,"coul_fond",l_back)
			
			if b_avec_ajout then
				// C'est une nouvelle ligne
				dw_fiche.setitem(1,"com",  string_to_rtf(mle_commentaire.text ,couleur_noire, couleur_blanche) )
			else
				// C'est une ligne existante
				dw_fiche.setitem(1,"com",  dw_fiche.GetitemString (1,"com") +  string_to_rtf(mle_commentaire.text ,couleur_noire, couleur_blanche) )
			end if
	
			dw_fiche.setColumn("com")
			
			// pour mettre le point d'insertion à la fin
			dw_fiche.SelectText(len(dw_fiche.GetText()) + 1, 0)
		end if
	end if
	
else
	// Pas rtf
	if len(trim(mle_commentaire.text)) > 0 then
		
		// recopie des infos du mle

		
		l_text = long(mle_commentaire.TextColor)
		l_back = long (mle_commentaire.BackColor)
		 
		dw_fiche.setitem(1,"coul_texte",l_text)
		dw_fiche.setitem(1,"coul_fond",l_back)
		
		if b_avec_ajout then
			// C'est une nouvelle ligne
			dw_fiche.setitem(1,"com_html",mle_commentaire.text)
		else
			// C'est une ligne existante
			dw_fiche.setitem(1,"com_html",  dw_fiche.GetitemString (1,"com_html") +  mle_commentaire.text)
		end if

		dw_fiche.setColumn("com_html")
		
		// pour mettre le point d'insertion à la fin
		dw_fiche.SelectText(len(dw_fiche.GetText()) + 1, 0)
	end if
end if
end subroutine

public subroutine ajouter_acte_prevu (boolean b_avec_ajout);

// Mise en place de l'acte prévu

if v_coment.avec_rtf  then
	string v_com
	
	if not table_commentaires_predefinis_sans_rtf then
	
		dw_coment_rft_saisie.accepttext()
		
		v_com = trim (dw_coment_rft_saisie.getItemString(1, "com"))
		
		// Mise en place de l'acte prévue sur le commentaire de la date du jour s'il existe !!
			
		if len( v_com ) > 0 then
			long cptlig, nblig ,lig
			
			// recopie des infos du mle
			if b_avec_ajout then
				dw_fiche.setitem(1,"acte_prevu", v_com )
			else
				dw_fiche.accepttext()
				// C'est une ligne existante .. on ajoute le texte - mais en brut .. pas le choix
				dw_fiche.setitem(1,"acte_prevu", string_to_rtf(dw_fiche.GetitemString (1,"acte_prevu_texte_brut") + dw_coment_rft_saisie.getItemString(1, "com_texte_brut") ,couleur_noire, couleur_blanche ) )			
			end if
	
			cb_annuler_predefini.triggerEvent(clicked!)
			
			dw_fiche.setColumn("acte_prevu")
		
			// pour mettre le point d'insertion à la fin
			dw_fiche.SelectText(len(dw_fiche.GetText()) + 1, 0)
		end if
	else
		// table prédéfinie pas en RTF
		if len(trim(mle_commentaire.text)) > 0 then
			
			dw_fiche.setitem(1,"coul_texte",double(mle_commentaire.TextColor))
			dw_fiche.setitem(1,"coul_fond",double(mle_commentaire.BackColor))
			
			if b_avec_ajout then
				dw_fiche.setitem(1,"acte_prevu", string_to_rtf(mle_commentaire.text ,couleur_noire, couleur_blanche))
			else
				dw_fiche.setitem(1,"acte_prevu",  dw_fiche.GetitemString (1,"acte_prevu") +  string_to_rtf(mle_commentaire.text ,couleur_noire, couleur_blanche))
			end if
			dw_fiche.setColumn("acte_prevu")
		
			// pour mettre le point d'insertion à la fin
			dw_fiche.SelectText(len(dw_fiche.GetText()) + 1, 0)
		
		end if
			
		
	end if
	
else
	if len(trim(mle_commentaire.text)) > 0 then
		
		dw_fiche.setitem(1,"coul_texte",double(mle_commentaire.TextColor))
		dw_fiche.setitem(1,"coul_fond",double(mle_commentaire.BackColor))
		
		if b_avec_ajout then
			dw_fiche.setitem(1,"acte_prevu_html",mle_commentaire.text)
		else
			dw_fiche.setitem(1,"acte_prevu_html",  dw_fiche.GetitemString (1,"acte_prevu_html") +  mle_commentaire.text)
		end if
		dw_fiche.setColumn("acte_prevu_html")
	
		// pour mettre le point d'insertion à la fin
		dw_fiche.SelectText(len(dw_fiche.GetText()) + 1, 0)
	
	end if
end if
end subroutine

on w_coment_saisie_a_part.create
int iCurrent
call super::create
this.cb_1=create cb_1
this.cb_enregistrer=create cb_enregistrer
this.cb_annuler=create cb_annuler
this.dw_fiche=create dw_fiche
this.uo_1=create uo_1
this.uo_color=create uo_color
this.dw_commentaires_predefinis=create dw_commentaires_predefinis
this.mle_commentaire=create mle_commentaire
this.cb_ajouter_predefini=create cb_ajouter_predefini
this.cb_ajouter_prevu=create cb_ajouter_prevu
this.uo_color2=create uo_color2
this.dw_coment_rft_saisie=create dw_coment_rft_saisie
this.cb_annuler_predefini=create cb_annuler_predefini
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_1
this.Control[iCurrent+2]=this.cb_enregistrer
this.Control[iCurrent+3]=this.cb_annuler
this.Control[iCurrent+4]=this.dw_fiche
this.Control[iCurrent+5]=this.uo_1
this.Control[iCurrent+6]=this.uo_color
this.Control[iCurrent+7]=this.dw_commentaires_predefinis
this.Control[iCurrent+8]=this.mle_commentaire
this.Control[iCurrent+9]=this.cb_ajouter_predefini
this.Control[iCurrent+10]=this.cb_ajouter_prevu
this.Control[iCurrent+11]=this.uo_color2
this.Control[iCurrent+12]=this.dw_coment_rft_saisie
this.Control[iCurrent+13]=this.cb_annuler_predefini
end on

on w_coment_saisie_a_part.destroy
call super::destroy
destroy(this.cb_1)
destroy(this.cb_enregistrer)
destroy(this.cb_annuler)
destroy(this.dw_fiche)
destroy(this.uo_1)
destroy(this.uo_color)
destroy(this.dw_commentaires_predefinis)
destroy(this.mle_commentaire)
destroy(this.cb_ajouter_predefini)
destroy(this.cb_ajouter_prevu)
destroy(this.uo_color2)
destroy(this.dw_coment_rft_saisie)
destroy(this.cb_annuler_predefini)
end on

event open;call super::open;// Commentaire passé en paramètre

v_coment = message.powerObjectParm


string v_nom_colonne

uo_1.taille(this)

if enregistrement_automatique then
	cb_annuler.visible = false
	cb_enregistrer.visible = false
end if

if profilestring(dir_ini+inifile_orthokis,"commentaires_cliniques","table_predefinis_sans_rtf","N") = "O" then
	table_commentaires_predefinis_sans_rtf = true
else
	table_commentaires_predefinis_sans_rtf = false
end if


if v_coment.avec_rtf  then
	dw_fiche.modify("com_html.visible = 0")
	dw_fiche.modify("acte_prevu_html.visible = 0")
	if table_commentaires_predefinis_sans_rtf then 
		mle_commentaire.visible = true
		dw_commentaires_predefinis.dataobject = "dw_commentaires_predefinis_2010"
	else
		dw_coment_rft_saisie.visible = true
		dw_commentaires_predefinis.dataobject = "dw_commentaires_predefinis"
	end if
else
	dw_fiche.modify("com.visible = 0")
	dw_fiche.modify("acte_prevu.visible = 0")
	mle_commentaire.visible = true
	dw_commentaires_predefinis.dataobject = "dw_commentaires_predefinis_2010"
end if

// Commentaires prédéfinis
dw_commentaires_predefinis.settransobject(sqlca)
dw_commentaires_predefinis.retrieve("C")
if dw_commentaires_predefinis.rowcount() > 0 then
	if profilestring(dir_ini+inifile_orthokis,"commentaires_cliniques","table_predefinis_memo_arbo","N") = "O" then
		if table_commentaires_predefinis_sans_rtf  then
			fxg_dwtree_applique_state(dw_commentaires_predefinis, "coment_maj_2010_dw_commentaires_predefinis")
		else
			fxg_dwtree_applique_state(dw_commentaires_predefinis, "coment_maj_dw_commentaires_predefinis")
		end if
	end if
else
	// on vire la partie de droite
	 this.width = 2650
end if


// visibilité ou non des colonnes
if not v_coment.intervenant_visible then
	dw_fiche.modify("intervenant_t.visible = 0")
	dw_fiche.modify("intervenant.visible = 0")
end if
if not v_coment.hygiene_visible then
	dw_fiche.modify("hygiene_v10_t.visible = 0")
	dw_fiche.modify("hygiene_v10.visible = 0")
end if
if not v_coment.elastique_visible then
	dw_fiche.modify("elastique_v10_t.visible = 0")
	dw_fiche.modify("elastique_v10.visible = 0")
end if

// Visibilité et RTF
if  v_coment.com3_visible then
	if v_coment.avec_rtf then
		dw_fiche.modify("com3.visible = 1")
	else
		dw_fiche.modify("com3_html.visible = 1")
		if profilestring(dir_ini+inifile_orthokis,"commentaires_cliniques","colonne3_deroulante","N") = "O"  then
			liste_deroulante("com3_html", dw_fiche)
		end if
	end if
	dw_fiche.modify("com3_html_t.visible = 1")
	// recherche du libellé 
	select top 1 nom_colonne_com3 into :v_nom_colonne from param ;
	dw_fiche.modify("com3_html_t.text = '" + v_nom_colonne + " :'" )
end if

if  v_coment.com4_visible then
	if v_coment.avec_rtf then
		dw_fiche.modify("com4.visible = 1")
	else
		dw_fiche.modify("com4_html.visible = 1")
		if profilestring(dir_ini+inifile_orthokis,"commentaires_cliniques","colonne4_deroulante","N") = "O"  then
			liste_deroulante("com4_html", dw_fiche)
		end if
	end if
	dw_fiche.modify("com4_html_t.visible = 1")
	// recherche du libellé 
	select top 1 nom_colonne_com4 into :v_nom_colonne from param ;
	dw_fiche.modify("com4_html_t.text = '" + v_nom_colonne + " :'" )
end if

if  v_coment.com5_visible then
	if v_coment.avec_rtf then
		dw_fiche.modify("com5.visible = 1")
	else
		dw_fiche.modify("com5_html.visible = 1")
		if profilestring(dir_ini+inifile_orthokis,"commentaires_cliniques","colonne5_deroulante","N") = "O"  then
			liste_deroulante("com5_html", dw_fiche)
		end if
	end if
	dw_fiche.modify("com5_html_t.visible = 1")
	// recherche du libellé 
	select top 1 nom_colonne_com5 into :v_nom_colonne from param ;
	dw_fiche.modify("com5_html_t.text = '" + v_nom_colonne + " :'" )
end if

if  v_coment.com6_visible then
	if v_coment.avec_rtf then
		dw_fiche.modify("com6.visible = 1")
	else
		dw_fiche.modify("com6_html.visible = 1")
		if profilestring(dir_ini+inifile_orthokis,"commentaires_cliniques","colonne6_deroulante","N") = "O"  then
			liste_deroulante("com6_html", dw_fiche)
		end if
	end if
	dw_fiche.modify("com6_html_t.visible = 1")
	// recherche du libellé 
	select top 1 nom_colonne_com6 into :v_nom_colonne from param ;
	dw_fiche.modify("com6_html_t.text = '" + v_nom_colonne + " :'" )
end if


dw_fiche.settransobject(sqlca)
dw_fiche.retrieve(v_coment.code, v_coment.ordre, v_coment.date_modif)

dw_coment_rft_saisie.settransobject(sqlca)
dw_coment_rft_saisie.InsertRow(0)


if dw_fiche.rowcount() = 0 then
	// C'est un ajout de ligne
	dw_fiche.insertrow(0)
	dw_fiche.setitem(1, "code", v_coment.code)
	dw_fiche.setitem(1, "ordre", v_coment.ordre)
	dw_fiche.setitem(1, "date_modif", v_coment.date_modif)
	dw_fiche.setitem(1, "user_modif", utilisateur_code)
	dw_fiche.setitem(1, "dat", today())
	dw_fiche.setitem(1,"coul_texte",couleur_noire)
	dw_fiche.setitem(1,"coul_fond",couleur_blanche)
	dw_fiche.setitem(1,"intervenant",utilisateur_code)
	
	dw_fiche.setitem(1,"code_interne_rdv",v_coment.code_interne_rdv)
	
	// Commentaire par défaut ... l'acte prévu
	dw_fiche.setitem(1,"com", v_coment.com)
	dw_fiche.setitem(1,"com_html", v_coment.com_html)
	
	// Pour déclencher les listes déroulantes si besoin
	if not v_coment.avec_rtf then
		if  v_coment.com3_visible and profilestring(dir_ini+inifile_orthokis,"commentaires_cliniques","colonne3_deroulante","N") = "O" then
			dw_fiche.setItem(1, "com3_html", ".")
		end if
		if  v_coment.com4_visible and profilestring(dir_ini+inifile_orthokis,"commentaires_cliniques","colonne4_deroulante","N") = "O" then
			dw_fiche.setItem(1, "com4_html", ".")
		end if
		if  v_coment.com5_visible and profilestring(dir_ini+inifile_orthokis,"commentaires_cliniques","colonne5_deroulante","N") = "O" then
			dw_fiche.setItem(1, "com5_html", ".")
		end if
		if  v_coment.com6_visible and profilestring(dir_ini+inifile_orthokis,"commentaires_cliniques","colonne6_deroulante","N") = "O" then
			dw_fiche.setItem(1, "com6_html", ".")
		end if
	end if

end if

centrer(this)


if v_coment.avec_rtf and not table_commentaires_predefinis_sans_rtf   then
	dw_fiche.SetColumn("com")
else
	dw_fiche.SetColumn("com_html")
end if
dw_fiche.setFocus()




end event

event resize;

//uo_1.retaille(this)
end event

event close;call super::close;
// Mémo table des prédéfinis
if profilestring(dir_ini+inifile_orthokis,"commentaires_cliniques","commentaires_2010","N") = "O" then
	fxg_dwtree_memo_state(dw_commentaires_predefinis, "coment_maj_2010_dw_commentaires_predefinis")
else
	fxg_dwtree_memo_state(dw_commentaires_predefinis, "coment_maj_dw_commentaires_predefinis")
end if



if enregistrement_automatique then
	cb_enregistrer.triggerevent(clicked!)
end if
end event

type p_fond from w_fenetre_arakis`p_fond within w_coment_saisie_a_part
end type

type cb_1 from uo_picturebutton_390x120_fermer within w_coment_saisie_a_part
integer x = 2030
integer y = 2432
integer width = 535
integer taborder = 10
boolean bringtotop = true
end type

event clicked;if enregistrement_automatique then
	Close(parent)
else
	if dw_fiche.modifiedcount() > 0 or dw_fiche.deletedcount()>0 Then
		If MessageBox("ATTENTION","Vous avez fait des modifications !~n~nVoulez-vous vraiment fermer cette fenêtre sans enregistrer (et ainsi perdre les modifications) ?",Question!,YesNo!, 2) = 1 Then
			Close(parent)
		end if
	else
		Close(parent)
	end if
	
end if
end event

type cb_enregistrer from uo_picturebutton_390x120 within w_coment_saisie_a_part
integer x = 1426
integer y = 2432
integer width = 535
integer taborder = 20
boolean bringtotop = true
string text = "Enregistrer"
string iconname = "ACTIONS_enregistrer.png"
end type

event clicked;call super::clicked;dw_fiche.accepttext()

long v_coul_texte , v_coul_fond

v_coul_texte = 	dw_fiche.GetitemNumber(1,"coul_texte")
v_coul_fond = 	dw_fiche.GetitemNumber(1,"coul_fond")

if not v_coment.avec_rtf then
	// Le champ a été a été ajoutée ou modifiée
	if dw_fiche.GetItemStatus (1, 'com_html', Primary!) <> NotModified! then
		dw_fiche.setItem(1, "com", String_To_RTF(dw_fiche.getitemString(1, "com_html"), v_coul_texte, v_coul_fond))
	end if
	if dw_fiche.GetItemStatus (1, 'acte_prevu_html', Primary!) <> NotModified! then
		dw_fiche.setItem(1, "acte_prevu", String_To_RTF(dw_fiche.getitemString(1, "acte_prevu_html"),  v_coul_texte, v_coul_fond))
	end if
	if dw_fiche.GetItemStatus (1, 'com3_html', Primary!) <> NotModified! then
		dw_fiche.setItem(1, "com3", String_To_RTF(dw_fiche.getitemString(1, "com3_html"),  v_coul_texte, v_coul_fond))
	end if
	if dw_fiche.GetItemStatus (1, 'com4_html', Primary!) <> NotModified! then
		dw_fiche.setItem(1, "com4", String_To_RTF(dw_fiche.getitemString(1, "com4_html"),  v_coul_texte, v_coul_fond))
	end if
	if dw_fiche.GetItemStatus (1, 'com5_html', Primary!) <> NotModified! then
		dw_fiche.setItem(1, "com5", String_To_RTF(dw_fiche.getitemString(1, "com5_html"),  v_coul_texte, v_coul_fond))
	end if
	if dw_fiche.GetItemStatus (1, 'com6_html', Primary!) <> NotModified! then
		dw_fiche.setItem(1, "com6", String_To_RTF(dw_fiche.getitemString(1, "com6_html"),  v_coul_texte, v_coul_fond))
	end if
else
	// Le champ a été a été ajoutée ou modifiée
	if dw_fiche.GetItemStatus (1, 'com', Primary!) <> NotModified! then
		dw_fiche.setItem(1, "com_html", dw_fiche.getitemString(1, "com_texte_brut"))
	end if
	if dw_fiche.GetItemStatus (1, 'acte_prevu', Primary!) <> NotModified! then
		dw_fiche.setItem(1, "acte_prevu_html", dw_fiche.getitemString(1, "acte_prevu_texte_brut"))
	end if
	if dw_fiche.GetItemStatus (1, 'com3', Primary!) <> NotModified! then
		dw_fiche.setItem(1, "com3_html", dw_fiche.getitemString(1, "com3_texte_brut"))
	end if
	if dw_fiche.GetItemStatus (1, 'com4', Primary!) <> NotModified! then
		dw_fiche.setItem(1, "com4_html", dw_fiche.getitemString(1, "com4_texte_brut"))
	end if
	if dw_fiche.GetItemStatus (1, 'com5', Primary!) <> NotModified! then
		dw_fiche.setItem(1, "com5_html", dw_fiche.getitemString(1, "com5_texte_brut"))
	end if
	if dw_fiche.GetItemStatus (1, 'com6', Primary!) <> NotModified! then
		dw_fiche.setItem(1, "com6_html", dw_fiche.getitemString(1, "com6_texte_brut"))
	end if
end if


if dw_fiche.update() = 1 then
	commit ;
else
	Rollback ;
end if

end event

type cb_annuler from uo_picturebutton_390x120 within w_coment_saisie_a_part
integer x = 859
integer y = 2432
integer width = 535
integer taborder = 30
boolean bringtotop = true
string text = "Annuler"
string iconname = "ACTIONS_annuler.png"
end type

event clicked;call super::clicked;dw_fiche.retrieve(v_coment.code, v_coment.ordre, v_coment.date_modif)
end event

type dw_fiche from datawindow within w_coment_saisie_a_part
string tag = "no resizeall brush"
integer x = 32
integer y = 20
integer width = 2555
integer height = 2364
integer taborder = 10
boolean bringtotop = true
string title = "none"
string dataobject = "dw_coment_a_part"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event dberror;db_erreur_commentaires(dw_fiche,sqldbcode,sqlerrtext)
return 1

end event

type uo_1 from resize_fenetre within w_coment_saisie_a_part
string tag = "uniquement pour les couleurs"
boolean visible = false
integer x = 2912
integer y = 1252
integer taborder = 20
boolean bringtotop = true
end type

on uo_1.destroy
call resize_fenetre::destroy
end on

type uo_color from u_color_bar within w_coment_saisie_a_part
event destroy ( )
string tag = "no resize"
integer x = 46
integer y = 2392
integer width = 709
integer height = 228
integer taborder = 20
boolean bringtotop = true
boolean border = true
long backcolor = 79741120
borderstyle borderstyle = styleraised!
end type

on uo_color.destroy
call u_color_bar::destroy
end on

event rbuttondown;call super::rbuttondown;this.setfocus()

//Right_button_click(user defined) script for uo_color
//inherited from u_color_bar

string	ls_rc 
long ll_color
int li_xloc,li_yloc
string ls_f_color, ls_b_color
li_xloc = PointerX( )
li_yloc = PointerY( )
ll_color = uo_color.uf_get_rgb(li_xloc, li_yloc)
uo_color.uf_set_background(ll_color)
uo_color.uf_get_colors(ls_f_color, ls_b_color)


dw_fiche.setitem(1,"coul_fond",double(ls_b_color))
dw_fiche.accepttext()




	



end event

event ue_lbuttondown;call super::ue_lbuttondown;this.setfocus()



// Couleur de texte
string	ls_rc 
long ll_color
int li_xloc, li_yloc
string ls_f_color, ls_b_color
li_xloc = PointerX( )
li_yloc = PointerY( )
ll_color = uo_color.uf_get_rgb(li_xloc, li_yloc)
uo_color.uf_set_foreground(ll_color)
uo_color.uf_get_colors(ls_f_color, ls_b_color)



// ATTENTION - TESTS DU RICHTEXT EDIT -----------

if v_coment.avec_rtf then
	dw_fiche.SetRichTextColor (  double(ls_f_color) )
else
	dw_fiche.setitem(1,"coul_texte",double(ls_f_color))
end if

dw_fiche.accepttext()
dw_fiche.setfocus()


end event

type dw_commentaires_predefinis from datawindow within w_coment_saisie_a_part
string tag = "no resizeall brush"
integer x = 2761
integer y = 28
integer width = 1856
integer height = 1756
integer taborder = 40
boolean bringtotop = true
string title = "none"
string dataobject = "dw_commentaires_predefinis_2010"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;



If row > 0 Then
	
	if v_coment.avec_rtf and not table_commentaires_predefinis_sans_rtf  then
		
		string v_com
		v_com = trim(dw_coment_rft_saisie.getitemString(1, "com" ))
		
		if len(v_com ) > 0 then
			v_com = v_com + " "+ this.getitemstring(row, "commentaires_predefinis_commentaire")
		else
			v_com = this.getitemstring(row, "commentaires_predefinis_commentaire")
		end if
		
		dw_coment_rft_saisie.SetItem(1, "com", v_com)
		dw_coment_rft_saisie.SetColumn(1)
		dw_coment_rft_saisie.Setfocus()
		
		// pour mettre le point d'insertion à la fin
		dw_coment_rft_saisie.SelectText(len(dw_coment_rft_saisie.GetText()) + 1, 0)
	
	else
		if len(trim(mle_commentaire.text )) = 0 then 
			// 1er texte de commentaire
			mle_commentaire.BackColor = this.getitemNumber(row, "commentaires_predefinis_coul_fond")
			mle_commentaire.TextColor = this.getitemNumber(row, "commentaires_predefinis_coul_texte")
		end if

		if len(trim(mle_commentaire.text)) > 0 then
			mle_commentaire.text = mle_commentaire.text + " "+ this.getitemstring(row, "commentaires_predefinis_commentaire_html")
		else
			mle_commentaire.text = this.getitemstring(row, "commentaires_predefinis_commentaire_html")
		end if
		
		mle_commentaire.setfocus()
		
		// pour mettre le point d'insertion à la fin
		mle_commentaire.SelectText(len(mle_commentaire.Text) + 1, 0)
	end if

End If

end event

type mle_commentaire from multilineedit within w_coment_saisie_a_part
string tag = "no resizeall"
boolean visible = false
integer x = 2766
integer y = 1848
integer width = 1815
integer height = 440
integer taborder = 50
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

type cb_ajouter_predefini from uo_picturebutton_250x120 within w_coment_saisie_a_part
integer x = 3026
integer y = 2380
integer width = 279
integer height = 112
integer taborder = 130
boolean bringtotop = true
string text = "+ Com"
string tiptext = "Remplace le texte du commentaire / Ajoute le texte au commentaire existant "
end type

event clicked;call super::clicked;ajouter_commentaire_predefini(true)

//
//
//if v_coment.avec_rtf then
//	
//	string v_com
//	
//	dw_coment_rft_saisie.accepttext()
//	
//	v_com = trim (dw_coment_rft_saisie.getItemString(1, "com"))
//	
//	
//	// Ajout du commentaire qui est dans le MLE
//	
//	if len( v_com ) > 0 then
//		
//		dw_fiche.setitem(1,"com", v_com)
//		cb_annuler_predefini.triggerEvent(clicked!)
//		dw_fiche.setColumn("com")
//		
//		// pour mettre le point d'insertion à la fin
//		dw_fiche.SelectText(len(dw_fiche.GetText()) + 1, 0)
//	
//	end if
//	
//else
//	// Pas rtf
//	if len(trim(mle_commentaire.text)) > 0 then
//		
//		// recopie des infos du mle
//		dw_fiche.setitem(1,"coul_texte",double(mle_commentaire.TextColor))
//		dw_fiche.setitem(1,"coul_fond",double(mle_commentaire.BackColor))
//		dw_fiche.setitem(1,"com_html",mle_commentaire.text)
//		
//		dw_fiche.setColumn("com_html")
//		
//		// pour mettre le point d'insertion à la fin
//		dw_fiche.SelectText(len(dw_fiche.GetText()) + 1, 0)
//	end if
//end if
end event

event rbuttondown;call super::rbuttondown;ajouter_commentaire_predefini(false)

end event

type cb_ajouter_prevu from uo_picturebutton_250x120 within w_coment_saisie_a_part
integer x = 3333
integer y = 2380
integer width = 279
integer height = 112
integer taborder = 140
boolean bringtotop = true
string text = "+ Prév"
string tiptext = "Remplace le texte de l~'acte prévu / Ajoute le texte à l~'acte prevu existant "
end type

event clicked;call super::clicked;ajouter_acte_prevu(true)

//
//
//// Mise en place de l'acte prévu
//
//if v_coment.avec_rtf then
//	string v_com
//	
//	dw_coment_rft_saisie.accepttext()
//	
//	v_com = trim (dw_coment_rft_saisie.getItemString(1, "com"))
//	
//	// Mise en place de l'acte prévue sur le commentaire de la date du jour s'il existe !!
//		
//	if len( v_com ) > 0 then
//		long cptlig, nblig ,lig
//		
//		// recopie des infos du mle
//		dw_fiche.setitem(1,"acte_prevu", v_com )
//		cb_annuler_predefini.triggerEvent(clicked!)
//		
//		dw_fiche.setColumn("acte_prevu")
//	
//		// pour mettre le point d'insertion à la fin
//		dw_fiche.SelectText(len(dw_fiche.GetText()) + 1, 0)
//	end if
//	
//else
//	if len(trim(mle_commentaire.text)) > 0 then
//		
//		dw_fiche.setitem(1,"coul_texte",double(mle_commentaire.TextColor))
//		dw_fiche.setitem(1,"coul_fond",double(mle_commentaire.BackColor))
//		dw_fiche.setitem(1,"acte_prevu_html",mle_commentaire.text)
//		
//		dw_fiche.setColumn("acte_prevu_html")
//	
//		// pour mettre le point d'insertion à la fin
//		dw_fiche.SelectText(len(dw_fiche.GetText()) + 1, 0)
//	
//	end if
//end if
end event

event rbuttondown;call super::rbuttondown;ajouter_acte_prevu(false)

end event

type uo_color2 from u_color_bar within w_coment_saisie_a_part
event destroy ( )
string tag = "no resize"
integer x = 3867
integer y = 2324
integer width = 709
integer height = 228
integer taborder = 70
boolean bringtotop = true
boolean border = true
long backcolor = 79741120
borderstyle borderstyle = styleraised!
end type

on uo_color2.destroy
call u_color_bar::destroy
end on

event rbuttondown;call super::rbuttondown;this.setfocus()

//Right_button_click(user defined) script for uo_color
//inherited from u_color_bar

string	ls_rc 
long ll_color
int li_xloc,li_yloc
string ls_f_color, ls_b_color
li_xloc = PointerX( )
li_yloc = PointerY( )
ll_color = uo_color2.uf_get_rgb(li_xloc, li_yloc)
uo_color2.uf_set_background(ll_color)
uo_color2.uf_get_colors(ls_f_color, ls_b_color)


// dans le Mle
mle_commentaire.BackColor = double(ls_b_color)




end event

event ue_lbuttondown;call super::ue_lbuttondown;this.setfocus()



// Couleur de texte
string	ls_rc 
long ll_color
int li_xloc, li_yloc
string ls_f_color, ls_b_color
li_xloc = PointerX( )
li_yloc = PointerY( )
ll_color = uo_color2.uf_get_rgb(li_xloc, li_yloc)
uo_color2.uf_set_foreground(ll_color)
uo_color2.uf_get_colors(ls_f_color, ls_b_color)


// dans le Mle
mle_commentaire.TextColor = double(ls_f_color)

	


// Couleur dans le richtext
dw_fiche.SetRichTextColor (  double(ls_f_color) )


end event

type dw_coment_rft_saisie from datawindow within w_coment_saisie_a_part
string tag = "no resizeall"
boolean visible = false
integer x = 2766
integer y = 1848
integer width = 1815
integer height = 440
integer taborder = 40
boolean bringtotop = true
string title = "none"
string dataobject = "dw_coment_rtf_saisie"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event itemfocuschanged;	if getcolumn() = 1   then
		// Police des zones rtf
		police_rtf_par_defaut(this)
	end if

end event

type cb_annuler_predefini from picturebutton within w_coment_saisie_a_part
integer x = 3639
integer y = 2380
integer width = 137
integer height = 116
integer taborder = 20
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "lc_poubelle.png"
alignment htextalign = left!
string powertiptext = "Efface la zone de pré-saisie"
end type

event clicked;if v_coment.avec_rtf and not table_commentaires_predefinis_sans_rtf then
	dw_coment_rft_saisie.Reset()
	dw_coment_rft_saisie.InsertRow(0)
else
	mle_commentaire.text = ""
	mle_commentaire.BackColor = rgb(255,255,255)		// Blanc
	mle_commentaire.TextColor = rgb(0,0,0) 				// Noir
end if
end event

