$PBExportHeader$w_coment_maj_malins.srw
forward
global type w_coment_maj_malins from w_coment_maj_2010
end type
end forward

global type w_coment_maj_malins from w_coment_maj_2010
end type
global w_coment_maj_malins w_coment_maj_malins

forward prototypes
public subroutine ajapdef (integer num)
public subroutine save ()
public subroutine ajdef (integer num)
end prototypes

public subroutine ajapdef (integer num);// Ajout col 3 prédèf si l'acte prédéfini existe et si la ligne est sélectionnée,
// sinon on a des messages pour avertir l'utilisateur

string acte

if tabap[num] <> "" then
	IF dw_coment.getRow() <>  0 THEN
		acte = dw_coment.getitemstring( dw_coment.getrow(), "acte_prevu_html") 
		//rempli la col3 de la ligne sélect
		dw_coment.setitem(dw_coment.getrow(),"acte_prevu_html",tabap[num])
		dw_coment.SetFocus()
	ELSE			
		MessageBox("ATTENTION !","Vous n'avez pas sélectionné la ligne pour insérer votre commentaire Mandibule prévu ou il n'existe pas de commentaire associé ! " )	
	END IF	
else
	MessageBox("ATTENTION !","L'acte prévu N°"+string(num)+" pour Mandibule est vierge !")
end if

end subroutine

public subroutine save ();dw_coment.accepttext()
dw_patient.accepttext()

if dw_coment.update() = 1 and dw_patient.update() = 1 then
	commit ;
else
	Rollback ;
end if
end subroutine

public subroutine ajdef (integer num);// Ajout col 2 prédèf si l'acte prédéfini existe et si la ligne est sélectionnée,
// sinon on a des messages pour avertir l'utilisateur

string acte

if tab[num] <> "" then
	IF dw_coment.getRow() <>  0 THEN
		acte = dw_coment.getitemstring( dw_coment.getrow(), "com_html") 
		//rempli la col2 de la ligne sélect
		dw_coment.setitem(dw_coment.getrow(),"com_html",tab[num])
		dw_coment.SetFocus()
	ELSE			
		MessageBox("ATTENTION !","Vous n'avez pas sélectionné la ligne pour insérer votre commentaire maxilaire prévu ou il n'existe pas de commentaire associé ! " )	
	END IF	
else
	MessageBox("ATTENTION !","Le commentaire N°"+string(num)+" pour Maxilaire est vierge !")
end if

//if tab[num] <> "" then
//	dw_coment.InsertRow(0)
//	dw_coment.ScrollToRow(dw_coment.rowcount())
//	dw_coment.setitem(dw_coment.rowcount(),"code",var_code_local)
//	dw_coment.setitem(dw_coment.rowcount(),"dat",today())
//	dw_coment.setitem(dw_coment.rowcount(),"com",tab[num])
//	dw_coment.setitem(dw_coment.rowcount(),"coul_texte",tabct[num])
//	dw_coment.setitem(dw_coment.rowcount(),"coul_fond",tabcf[num])
//	dw_coment.setitem(dw_coment.rowcount(),"ordre",dw_coment.rowcount())
//	dw_coment.SetFocus()
//else
//	MessageBox("ATTENTION !","Le commentaire N°"+string(num)+" pour Maxilaire est vierge !")
//end if
end subroutine

on w_coment_maj_malins.create
int iCurrent
call super::create
end on

on w_coment_maj_malins.destroy
call super::destroy
end on

event resize;call super::resize;////uo_1.retaille(this)

// repositionnement des photos ... uniquement en horizontale

//ole_photo.x = max(this.width - ole_photo.width - 800,ole_photo.x)
//ole_photo_arakis002.x = max(this.width - ole_photo_arakis002.width - 800,ole_photo.x)


end event

event open;call super::open;if nom_datawindow = "dw_coment_maj_malins" then
	
	// Initialisation des tailles pour redimmensionnement des colonnes 
	largeur_col_coment	= long(dw_coment.Object.Com_html.Width)
	largeur_col_acte	 	= long(dw_coment.Object.Acte_Prevu_html.Width)

	dw_coment.object.com_html.width = valeur_ini_valide(profileString(dir_ini+"orthokis.ini","Commentaires Cliniques","commentaire_largeur",dw_coment.object.com_html.width))
	dw_coment.object.acte_prevu_html.width = valeur_ini_valide(profilestring(dir_ini+"orthokis.ini","Commentaires Cliniques","acte_prevu_largeur",dw_coment.object.acte_prevu_html.width))

end if

end event

event close;call super::close;
// Mémorisation des infos dans Orthokis.ini

trace ("w_coment_maj_2010 - Close 1") 

if nom_datawindow = "dw_coment_maj_malins" then
	Setprofilestring(dir_ini+"orthokis.ini","Commentaires Cliniques","commentaire_visible",dw_coment.object.com_html.visible)
	Setprofilestring(dir_ini+"orthokis.ini","Commentaires Cliniques","commentaire_largeur",valeur_ini_valide(dw_coment.object.com_html.width))

	Setprofilestring(dir_ini+"orthokis.ini","Commentaires Cliniques","acte_prevu_visible",dw_coment.object.acte_prevu_html.visible)
	Setprofilestring(dir_ini+"orthokis.ini","Commentaires Cliniques","acte_prevu_largeur",valeur_ini_valide(dw_coment.object.acte_prevu_html.width))
	
end if

trace ("w_coment_maj_2010 - Close 2")

// Verif enregisrement auto ???
if enregistrement_automatique then
	cb_enregistrer.triggerevent(clicked!)
end if

trace ("w_coment_maj_2010 - Close 3")


end event

type p_fond from w_coment_maj_2010`p_fond within w_coment_maj_malins
end type

type cb_qualite from w_coment_maj_2010`cb_qualite within w_coment_maj_malins
integer x = 2505
integer y = 2504
end type

type cb_predef from w_coment_maj_2010`cb_predef within w_coment_maj_malins
integer x = 23
integer y = 2316
integer width = 238
integer height = 92
integer textsize = -9
string text = "Max."
end type

event cb_predef::clicked;open(w_com_maxilaire_malins)
comdef()

end event

type cb_acte_predef from w_coment_maj_2010`cb_acte_predef within w_coment_maj_malins
integer x = 23
integer y = 2404
integer width = 238
integer height = 92
integer textsize = -9
string text = "Mand."
end type

event cb_acte_predef::clicked;open(w_com_mandibule_malins)
apdef()
end event

type cb_annuler from w_coment_maj_2010`cb_annuler within w_coment_maj_malins
integer x = 3365
integer y = 2504
integer width = 384
end type

type cb_diag from w_coment_maj_2010`cb_diag within w_coment_maj_malins
integer x = 2267
integer y = 2504
end type

type cb_dates from w_coment_maj_2010`cb_dates within w_coment_maj_malins
integer x = 2030
integer y = 2504
end type

type cb_ajouter from w_coment_maj_2010`cb_ajouter within w_coment_maj_malins
integer x = 18
integer y = 2504
end type

event cb_ajouter::clicked;string ls_f_color, ls_b_color

// Récupère les couleurs de fond et de texte de la palette
uo_color.uf_get_colors(ls_f_color, ls_b_color)


dw_coment.InsertRow(0)
dw_coment.ScrollToRow(dw_coment.rowcount())
dw_coment.setitem(dw_coment.rowcount(),"code",var_code_local)
dw_coment.setitem(dw_coment.rowcount(),"dat",today())
dw_coment.setitem(dw_coment.rowcount(),"ordre",dw_coment.rowcount())
dw_coment.setitem(dw_coment.Rowcount(),"coul_texte",double(ls_f_color))
dw_coment.setitem(dw_coment.Rowcount(),"coul_fond",double(ls_b_color))
dw_coment.setitem(dw_coment.rowcount(),"com_html",' ')
dw_coment.SetFocus()


end event

type cb_supprimer from w_coment_maj_2010`cb_supprimer within w_coment_maj_malins
integer x = 402
integer y = 2504
integer width = 384
end type

type cb_tracabilite from w_coment_maj_2010`cb_tracabilite within w_coment_maj_malins
integer x = 1170
integer y = 2504
integer width = 384
end type

type cb_imprimer from w_coment_maj_2010`cb_imprimer within w_coment_maj_malins
integer x = 786
integer y = 2504
integer width = 384
end type

type cb_autre from w_coment_maj_2010`cb_autre within w_coment_maj_malins
integer x = 2981
integer y = 2504
integer width = 384
end type

event cb_autre::clicked;date date_anni
string nom_parent


//sauvegarde les données des datawindows
save()

//cherche autre patient
var_suite = false
open(w_cherche)
if var_suite then
	commentaires_cliniques()
	close(parent)
end if


end event

type cb_rdv from w_coment_maj_2010`cb_rdv within w_coment_maj_malins
integer x = 1554
integer y = 2504
end type

type cb_photos from w_coment_maj_2010`cb_photos within w_coment_maj_malins
integer x = 1792
integer y = 2504
end type

type cb_enregistrer from w_coment_maj_2010`cb_enregistrer within w_coment_maj_malins
integer x = 3749
integer y = 2504
end type

type dw_histo_dossier from w_coment_maj_2010`dw_histo_dossier within w_coment_maj_malins
end type

type lb_liste_acte from w_coment_maj_2010`lb_liste_acte within w_coment_maj_malins
integer x = 137
integer y = 24
end type

type cb_42 from w_coment_maj_2010`cb_42 within w_coment_maj_malins
boolean visible = false
integer x = 1906
integer y = 2412
integer width = 78
end type

type cb_41 from w_coment_maj_2010`cb_41 within w_coment_maj_malins
integer x = 1819
integer y = 2412
integer width = 78
end type

type cb_40 from w_coment_maj_2010`cb_40 within w_coment_maj_malins
integer x = 1737
integer y = 2412
integer width = 78
end type

type cb_39 from w_coment_maj_2010`cb_39 within w_coment_maj_malins
integer x = 1655
integer y = 2412
integer width = 78
end type

type cb_38 from w_coment_maj_2010`cb_38 within w_coment_maj_malins
integer x = 1573
integer y = 2412
integer width = 78
end type

type cb_37 from w_coment_maj_2010`cb_37 within w_coment_maj_malins
integer x = 1490
integer y = 2412
integer width = 78
end type

type cb_36 from w_coment_maj_2010`cb_36 within w_coment_maj_malins
integer x = 1408
integer y = 2412
integer width = 78
end type

type cb_35 from w_coment_maj_2010`cb_35 within w_coment_maj_malins
integer x = 1326
integer y = 2412
integer width = 78
end type

type cb_34 from w_coment_maj_2010`cb_34 within w_coment_maj_malins
integer x = 1243
integer y = 2412
integer width = 78
end type

type cb_33 from w_coment_maj_2010`cb_33 within w_coment_maj_malins
integer x = 1161
integer y = 2412
integer width = 78
end type

type cb_32 from w_coment_maj_2010`cb_32 within w_coment_maj_malins
integer x = 1079
integer y = 2412
integer width = 78
end type

type cb_31 from w_coment_maj_2010`cb_31 within w_coment_maj_malins
integer x = 997
integer y = 2412
integer width = 78
end type

type cb_30 from w_coment_maj_2010`cb_30 within w_coment_maj_malins
integer x = 914
integer y = 2412
integer width = 78
end type

type cb_29 from w_coment_maj_2010`cb_29 within w_coment_maj_malins
integer x = 832
integer y = 2412
integer width = 78
end type

type cb_28 from w_coment_maj_2010`cb_28 within w_coment_maj_malins
integer x = 750
integer y = 2412
integer width = 78
end type

type cb_27 from w_coment_maj_2010`cb_27 within w_coment_maj_malins
integer x = 667
integer y = 2412
integer width = 78
end type

type cb_26 from w_coment_maj_2010`cb_26 within w_coment_maj_malins
integer x = 585
integer y = 2412
integer width = 78
end type

type cb_25 from w_coment_maj_2010`cb_25 within w_coment_maj_malins
integer x = 503
integer y = 2412
integer width = 78
end type

type cb_24 from w_coment_maj_2010`cb_24 within w_coment_maj_malins
integer x = 421
integer y = 2412
integer width = 78
end type

type cb_23 from w_coment_maj_2010`cb_23 within w_coment_maj_malins
integer x = 338
integer y = 2412
integer width = 78
end type

type cb_22 from w_coment_maj_2010`cb_22 within w_coment_maj_malins
integer x = 256
integer y = 2412
integer width = 78
end type

type uo_1 from w_coment_maj_2010`uo_1 within w_coment_maj_malins
integer x = 1499
end type

type lb_liste from w_coment_maj_2010`lb_liste within w_coment_maj_malins
end type

type cb_21 from w_coment_maj_2010`cb_21 within w_coment_maj_malins
boolean visible = false
integer x = 1911
integer width = 78
end type

type cb_20 from w_coment_maj_2010`cb_20 within w_coment_maj_malins
integer x = 1824
integer width = 78
end type

type cb_19 from w_coment_maj_2010`cb_19 within w_coment_maj_malins
integer x = 1742
integer width = 78
end type

type cb_18 from w_coment_maj_2010`cb_18 within w_coment_maj_malins
integer x = 1659
integer width = 78
end type

type cb_17 from w_coment_maj_2010`cb_17 within w_coment_maj_malins
integer x = 1577
integer width = 78
end type

type cb_16 from w_coment_maj_2010`cb_16 within w_coment_maj_malins
integer x = 1495
integer width = 78
end type

type cb_15 from w_coment_maj_2010`cb_15 within w_coment_maj_malins
integer x = 1413
integer width = 78
end type

type cb_14 from w_coment_maj_2010`cb_14 within w_coment_maj_malins
integer x = 1330
integer width = 78
end type

type cb_13 from w_coment_maj_2010`cb_13 within w_coment_maj_malins
integer x = 1248
integer width = 78
end type

type cb_12 from w_coment_maj_2010`cb_12 within w_coment_maj_malins
integer x = 1166
integer width = 78
end type

type cb_11 from w_coment_maj_2010`cb_11 within w_coment_maj_malins
integer x = 1083
integer width = 78
end type

type cb_10 from w_coment_maj_2010`cb_10 within w_coment_maj_malins
integer x = 1001
integer width = 78
end type

type cb_9 from w_coment_maj_2010`cb_9 within w_coment_maj_malins
integer x = 919
integer width = 78
end type

type cb_8 from w_coment_maj_2010`cb_8 within w_coment_maj_malins
integer x = 837
integer width = 78
end type

type cb_7 from w_coment_maj_2010`cb_7 within w_coment_maj_malins
integer x = 754
integer width = 78
end type

type cb_6 from w_coment_maj_2010`cb_6 within w_coment_maj_malins
integer x = 672
integer width = 78
end type

type cb_5 from w_coment_maj_2010`cb_5 within w_coment_maj_malins
integer x = 590
integer width = 78
end type

type cb_4 from w_coment_maj_2010`cb_4 within w_coment_maj_malins
integer x = 507
integer width = 78
end type

type cb_3 from w_coment_maj_2010`cb_3 within w_coment_maj_malins
integer x = 425
integer width = 78
end type

type cb_2 from w_coment_maj_2010`cb_2 within w_coment_maj_malins
integer x = 343
integer width = 78
end type

type cb_1 from w_coment_maj_2010`cb_1 within w_coment_maj_malins
integer x = 261
integer width = 78
end type

type dw_patient from w_coment_maj_2010`dw_patient within w_coment_maj_malins
end type

type uo_color from w_coment_maj_2010`uo_color within w_coment_maj_malins
integer x = 3259
integer y = 2276
end type

type ddlb_cadres from w_coment_maj_2010`ddlb_cadres within w_coment_maj_malins
end type

type uo_icones from w_coment_maj_2010`uo_icones within w_coment_maj_malins
integer x = 2048
integer y = 2244
end type

type dw_qualite from w_coment_maj_2010`dw_qualite within w_coment_maj_malins
end type

type dw_suivi from w_coment_maj_2010`dw_suivi within w_coment_maj_malins
end type

type dw_coment from w_coment_maj_2010`dw_coment within w_coment_maj_malins
integer height = 1548
string dataobject = "dw_coment_maj_malins"
end type

type pb_bis from w_coment_maj_2010`pb_bis within w_coment_maj_malins
integer x = 2743
end type

type dw_commentaires_predefinis from w_coment_maj_2010`dw_commentaires_predefinis within w_coment_maj_malins
end type

type mle_commentaire from w_coment_maj_2010`mle_commentaire within w_coment_maj_malins
end type

type cb_ajouter_predefini from w_coment_maj_2010`cb_ajouter_predefini within w_coment_maj_malins
end type

type uo_color2 from w_coment_maj_2010`uo_color2 within w_coment_maj_malins
end type

type cb_ajouter_prevu from w_coment_maj_2010`cb_ajouter_prevu within w_coment_maj_malins
end type

type dw_patient_prochain_rdv_message from w_coment_maj_2010`dw_patient_prochain_rdv_message within w_coment_maj_malins
end type

type st_couleur from w_coment_maj_2010`st_couleur within w_coment_maj_malins
end type

type cb_annuler_predefini from w_coment_maj_2010`cb_annuler_predefini within w_coment_maj_malins
end type

type st_nom from w_coment_maj_2010`st_nom within w_coment_maj_malins
end type

type st_code from w_coment_maj_2010`st_code within w_coment_maj_malins
end type

type st_cmu from w_coment_maj_2010`st_cmu within w_coment_maj_malins
end type

type dw_diagnostic from w_coment_maj_2010`dw_diagnostic within w_coment_maj_malins
end type

