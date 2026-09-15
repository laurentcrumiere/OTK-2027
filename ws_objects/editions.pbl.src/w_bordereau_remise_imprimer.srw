$PBExportHeader$w_bordereau_remise_imprimer.srw
forward
global type w_bordereau_remise_imprimer from w_fenetre_arakis
end type
type cb_ecran from uo_picturebutton_390x120 within w_bordereau_remise_imprimer
end type
type cb_imprimer from uo_picturebutton_390x120 within w_bordereau_remise_imprimer
end type
type cb_fermer from uo_picturebutton_390x120_fermer within w_bordereau_remise_imprimer
end type
type uo_size from resize_fenetre within w_bordereau_remise_imprimer
end type
type rb_sans_patient from radiobutton within w_bordereau_remise_imprimer
end type
type rb_avec_patient from radiobutton within w_bordereau_remise_imprimer
end type
type rb_avec from radiobutton within w_bordereau_remise_imprimer
end type
type rb_normal from radiobutton within w_bordereau_remise_imprimer
end type
type dw_liste from datawindow within w_bordereau_remise_imprimer
end type
type rb_tri_date_payeur from radiobutton within w_bordereau_remise_imprimer
end type
type rb_tri_date_saisie from radiobutton within w_bordereau_remise_imprimer
end type
type rb_tri_payeur_date from radiobutton within w_bordereau_remise_imprimer
end type
type rb_sans_numero_dossier from radiobutton within w_bordereau_remise_imprimer
end type
type rb_avec_numero_dossier from radiobutton within w_bordereau_remise_imprimer
end type
type cb_supprimer from uo_picturebutton_390x120 within w_bordereau_remise_imprimer
end type
type dw_remises_cherche from datawindow within w_bordereau_remise_imprimer
end type
type cb_autre from uo_picturebutton_390x120 within w_bordereau_remise_imprimer
end type
type pb_1 from uo_picturebutton_390x120 within w_bordereau_remise_imprimer
end type
type pb_2 from uo_picturebutton_390x120 within w_bordereau_remise_imprimer
end type
type cbx_filtre from u_cst_togglebutton within w_bordereau_remise_imprimer
end type
type cb_exporter from uo_picturebutton_390x120 within w_bordereau_remise_imprimer
end type
type uo_filtre_email from uo_filtre_emails within w_bordereau_remise_imprimer
end type
type gb_patient from groupbox within w_bordereau_remise_imprimer
end type
type gb_banque from groupbox within w_bordereau_remise_imprimer
end type
type gb_1 from groupbox within w_bordereau_remise_imprimer
end type
type gb_dossier from groupbox within w_bordereau_remise_imprimer
end type
type gb_3 from groupbox within w_bordereau_remise_imprimer
end type
type gb_2 from groupbox within w_bordereau_remise_imprimer
end type
end forward

global type w_bordereau_remise_imprimer from w_fenetre_arakis
integer x = 27
integer y = 200
integer width = 5070
integer height = 2720
string title = "Remises en Banque Existantes"
windowtype windowtype = child!
cb_ecran cb_ecran
cb_imprimer cb_imprimer
cb_fermer cb_fermer
uo_size uo_size
rb_sans_patient rb_sans_patient
rb_avec_patient rb_avec_patient
rb_avec rb_avec
rb_normal rb_normal
dw_liste dw_liste
rb_tri_date_payeur rb_tri_date_payeur
rb_tri_date_saisie rb_tri_date_saisie
rb_tri_payeur_date rb_tri_payeur_date
rb_sans_numero_dossier rb_sans_numero_dossier
rb_avec_numero_dossier rb_avec_numero_dossier
cb_supprimer cb_supprimer
dw_remises_cherche dw_remises_cherche
cb_autre cb_autre
pb_1 pb_1
pb_2 pb_2
cbx_filtre cbx_filtre
cb_exporter cb_exporter
uo_filtre_email uo_filtre_email
gb_patient gb_patient
gb_banque gb_banque
gb_1 gb_1
gb_dossier gb_dossier
gb_3 gb_3
gb_2 gb_2
end type
global w_bordereau_remise_imprimer w_bordereau_remise_imprimer

type variables

n_cst_PowerFilter iu_PowerFilter


end variables

forward prototypes
public subroutine tri_datawindows ()
end prototypes

public subroutine tri_datawindows ();// Gestion du tri
string ordre_tri
if rb_tri_date_payeur.checked then 
	// Date + payeur
	ordre_tri = "paye_dateremise asc, paye_date asc,  paye_payeur asc,  patient_nom asc, patient_prenom asc,  paye_mode asc, paye_commentaire asc, paye_code_pratricien asc"
else
	if rb_tri_date_saisie.checked then 
		// Date + saisie
		ordre_tri = "paye_dateremise asc, paye_heure_saisie asc, paye_payeur asc,  patient_nom asc, patient_prenom asc,  paye_mode asc, paye_commentaire asc,  paye_date asc, paye_code_pratricien asc"
	else
		//  Payeur + Date
		ordre_tri = " paye_payeur asc, paye_dateremise asc, paye_date asc,  patient_nom asc, patient_prenom asc,  paye_mode asc, paye_commentaire asc, paye_dateremise asc,paye_code_pratricien asc"
	end if
end if



dw_liste.setSort(ordre_tri)
dw_liste.sort()


dw_liste.groupcalc()

end subroutine

event open;call super::open;uo_size.taille(this)

dw_remises_cherche.setTransObject(sqlca)
dw_remises_cherche.retrieve()

dw_liste.setTransObject(sqlca)
uo_filtre_email.dw_liste = dw_liste



// Mise en place des choix par défaut mémorisés à la sortie de la fenêtre

if profilestring(dir_ini+inifile_orthokis,"REMISE_EXISTANTE","Commentaires","N") = "N" then
	rb_normal.checked = true
	rb_avec.checked = false
else
	rb_avec.checked = true
	rb_normal.checked = false
end if

if profilestring(dir_ini+inifile_orthokis,"REMISE_EXISTANTE","Patient","N") = "N" then
	rb_sans_patient.checked = true
	rb_avec_patient.checked = false
else
	rb_avec_patient.checked = true
	rb_sans_patient.checked = false
end if

if profilestring(dir_ini+inifile_orthokis,"REMISE_EXISTANTE","Dossier","N") = "N" then
	rb_sans_numero_dossier.checked = true
	rb_avec_numero_dossier.checked = false
else
	rb_avec_numero_dossier.checked = true
	rb_sans_numero_dossier.checked = false
end if

rb_tri_date_payeur.checked = false
rb_tri_date_saisie.checked = false
rb_tri_payeur_date.checked = false

if profilestring(dir_ini+inifile_orthokis,"REMISE_EXISTANTE","Tri","2") = "1" then
	rb_tri_date_payeur.checked = true
else
	if profilestring(dir_ini+inifile_orthokis,"REMISE_EXISTANTE","Tri","2") = "2" then
		rb_tri_date_saisie.checked = true
	else
		rb_tri_payeur_date.checked = true
	end if
end if

uo_filtre_email.visible = true

cbx_filtre.backcolor = backcolor

tri_datawindows()




end event

on w_bordereau_remise_imprimer.create
int iCurrent
call super::create
this.cb_ecran=create cb_ecran
this.cb_imprimer=create cb_imprimer
this.cb_fermer=create cb_fermer
this.uo_size=create uo_size
this.rb_sans_patient=create rb_sans_patient
this.rb_avec_patient=create rb_avec_patient
this.rb_avec=create rb_avec
this.rb_normal=create rb_normal
this.dw_liste=create dw_liste
this.rb_tri_date_payeur=create rb_tri_date_payeur
this.rb_tri_date_saisie=create rb_tri_date_saisie
this.rb_tri_payeur_date=create rb_tri_payeur_date
this.rb_sans_numero_dossier=create rb_sans_numero_dossier
this.rb_avec_numero_dossier=create rb_avec_numero_dossier
this.cb_supprimer=create cb_supprimer
this.dw_remises_cherche=create dw_remises_cherche
this.cb_autre=create cb_autre
this.pb_1=create pb_1
this.pb_2=create pb_2
this.cbx_filtre=create cbx_filtre
this.cb_exporter=create cb_exporter
this.uo_filtre_email=create uo_filtre_email
this.gb_patient=create gb_patient
this.gb_banque=create gb_banque
this.gb_1=create gb_1
this.gb_dossier=create gb_dossier
this.gb_3=create gb_3
this.gb_2=create gb_2
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_ecran
this.Control[iCurrent+2]=this.cb_imprimer
this.Control[iCurrent+3]=this.cb_fermer
this.Control[iCurrent+4]=this.uo_size
this.Control[iCurrent+5]=this.rb_sans_patient
this.Control[iCurrent+6]=this.rb_avec_patient
this.Control[iCurrent+7]=this.rb_avec
this.Control[iCurrent+8]=this.rb_normal
this.Control[iCurrent+9]=this.dw_liste
this.Control[iCurrent+10]=this.rb_tri_date_payeur
this.Control[iCurrent+11]=this.rb_tri_date_saisie
this.Control[iCurrent+12]=this.rb_tri_payeur_date
this.Control[iCurrent+13]=this.rb_sans_numero_dossier
this.Control[iCurrent+14]=this.rb_avec_numero_dossier
this.Control[iCurrent+15]=this.cb_supprimer
this.Control[iCurrent+16]=this.dw_remises_cherche
this.Control[iCurrent+17]=this.cb_autre
this.Control[iCurrent+18]=this.pb_1
this.Control[iCurrent+19]=this.pb_2
this.Control[iCurrent+20]=this.cbx_filtre
this.Control[iCurrent+21]=this.cb_exporter
this.Control[iCurrent+22]=this.uo_filtre_email
this.Control[iCurrent+23]=this.gb_patient
this.Control[iCurrent+24]=this.gb_banque
this.Control[iCurrent+25]=this.gb_1
this.Control[iCurrent+26]=this.gb_dossier
this.Control[iCurrent+27]=this.gb_3
this.Control[iCurrent+28]=this.gb_2
end on

on w_bordereau_remise_imprimer.destroy
call super::destroy
destroy(this.cb_ecran)
destroy(this.cb_imprimer)
destroy(this.cb_fermer)
destroy(this.uo_size)
destroy(this.rb_sans_patient)
destroy(this.rb_avec_patient)
destroy(this.rb_avec)
destroy(this.rb_normal)
destroy(this.dw_liste)
destroy(this.rb_tri_date_payeur)
destroy(this.rb_tri_date_saisie)
destroy(this.rb_tri_payeur_date)
destroy(this.rb_sans_numero_dossier)
destroy(this.rb_avec_numero_dossier)
destroy(this.cb_supprimer)
destroy(this.dw_remises_cherche)
destroy(this.cb_autre)
destroy(this.pb_1)
destroy(this.pb_2)
destroy(this.cbx_filtre)
destroy(this.cb_exporter)
destroy(this.uo_filtre_email)
destroy(this.gb_patient)
destroy(this.gb_banque)
destroy(this.gb_1)
destroy(this.gb_dossier)
destroy(this.gb_3)
destroy(this.gb_2)
end on

event resize;uo_size.retaille(this)
end event

type p_fond from w_fenetre_arakis`p_fond within w_bordereau_remise_imprimer
integer y = 1004
end type

type cb_ecran from uo_picturebutton_390x120 within w_bordereau_remise_imprimer
integer x = 503
integer y = 2420
integer width = 475
integer height = 152
integer taborder = 90
string text = "&Ecran"
boolean default = true
string iconname = "ACTIONS_ecran.png"
end type

event clicked;call super::clicked;	double v_code_remise
	date v_date_remise
	string pra_min, v_commentaire
	datetime v_date_impression
	
	ok_mdp = true
	
	v_code_remise = double(dw_remises_cherche.gettext())
	ok_mdp = true

	select date(date_generation) , isnull(commentaire,''), date_derniere_impression into :v_date_remise , :v_commentaire, :v_date_impression from remises where code =  :v_code_remise ;


	dw_liste.title = v_commentaire + " - Imprimée le " + string(v_date_impression)
	
	// soit ils ont tous le meme mot de passe => remise autorisée pour TOUS , soit pas
	// => on peut prendre n'importer quel praticien de la remise pour la demande du mot de passe
	select top 1 code_praticien into :pra_min from paye where code_remise = :v_code_remise order by heure_saisie ;
	
	if v_date_remise <= relativedate(today(), - fxg_get_delai_mdp_financier(pra_min)) then
		ok_mdp = false
		// Si tous les praticiens,ils ont tous le même MDP

		// Saisie du mot de passe financier ....
		  SELECT "prati"."pasfin"  
		    INTO :pasfin  FROM "prati"  
		   WHERE ( "prati"."code" = :pra_min) ;

			guo_fenetre_modale.wf_ouvrir(w_mot_passe_financier)

	end if

	if ok_mdp then

//		// Mode de règlement
//		if rb_chq.checked then
//			mode_reglement = 'C'
//			dw_ecran.setfilter("paye_mode in ('C','P')")
//			dw_ecran.Modify("mode.text = 'Chèques'")
//		else
//			if rb_esp.checked then
//				mode_reglement = 'E'
//				dw_ecran.setfilter("paye_mode = 'E'")
//				dw_ecran.Modify("mode.text = 'Espèces'")
//			else
//				// Carte bancaire
//				mode_reglement = 'B'
//				dw_ecran.setfilter("paye_mode = 'B'")
//				dw_ecran.Modify("mode.text = 'Carte Bancaire'")
//			end if
//		end if	
//		
//		// Monnaie demandée
//		monnaie = 'E'
		
	
		// Avec ou ans commentaires
		if rb_normal.checked then
		// Sans commentaires
			dw_liste.Modify("DataWindow.Header.1.Height=80")
		else
			dw_liste.Modify("DataWindow.Header.1.Height=152")
		end if
	
		// Avec le patient visible ou pas
		if rb_avec_patient.checked then
			dw_liste.Modify("patient_nom_complet.visible = 1")
			dw_liste.Modify("patient_nom_complet_t.visible = 1")
		else
			dw_liste.Modify("patient_nom_complet.visible = 0")
			dw_liste.Modify("patient_nom_complet_t.visible = 0")
		end if
		
			
		// Avec le N° de dossier
		if rb_avec_numero_dossier.checked then
			dw_liste.Modify("numero_dossier.visible = 1")
			dw_liste.Modify("numero_dossier_t.visible = 1")
		else
			dw_liste.Modify("numero_dossier.visible = 0")
			dw_liste.Modify("numero_dossier_t.visible = 0")
		end if
		
		
		
		

		open(w_patience)
		
		
		dw_liste.retrieve(v_code_remise)
		
		cbx_filtre.visible = true
		// pour tri du bordereau
		//tri_datawindows()
		
		// Indispensable pour le calcul du nombre de pièces remises
		//dw_ecran.groupcalc()
		
		
		
		close(w_patience)
		
	end if
end event

type cb_imprimer from uo_picturebutton_390x120 within w_bordereau_remise_imprimer
integer x = 978
integer y = 2420
integer width = 466
integer height = 152
integer taborder = 80
boolean enabled = false
string text = "&Imprimer"
string iconname = "ACTIONS_imprimer.png"
end type

event clicked;call super::clicked;

// On enlève le bouton à l'impression
dw_liste.modify("b_detail.visible = 0")
dw_liste.print()
dw_liste.modify("b_detail.visible = 1")



double v_code_remise
v_code_remise = double(dw_remises_cherche.gettext())

// mise à jour de la date de denière impression
update remises set date_derniere_impression = today(*) where code = :v_code_remise ;

if sqlca.sqlcode = 0 then
	commit ;
else
	rollback ;
end if

end event

type cb_fermer from uo_picturebutton_390x120_fermer within w_bordereau_remise_imprimer
integer x = 4539
integer y = 2420
integer width = 466
integer height = 152
integer taborder = 80
end type

event clicked;


// Mémorisation des derniers choix pour pouvoir les proposer par défaut à l'ouverture ...

if rb_normal.checked then
	setprofilestring(dir_ini+inifile_orthokis,"REMISE_EXISTANTE","Commentaires","N")
else
	setprofilestring(dir_ini+inifile_orthokis,"REMISE_EXISTANTE","Commentaires","O")
end if

if rb_sans_patient.checked then
	setprofilestring(dir_ini+inifile_orthokis,"REMISE_EXISTANTE","Patient","N")
else
	setprofilestring(dir_ini+inifile_orthokis,"REMISE_EXISTANTE","Patient","O")
end if

if rb_sans_numero_dossier.checked then
	setprofilestring(dir_ini+inifile_orthokis,"REMISE_EXISTANTE","Dossier","N")
else
	setprofilestring(dir_ini+inifile_orthokis,"REMISE_EXISTANTE","Dossier","O")
end if

if rb_tri_date_payeur.checked then
	setprofilestring(dir_ini+inifile_orthokis,"REMISE_EXISTANTE","Tri","1")
else
	if rb_tri_date_saisie.checked then
		setprofilestring(dir_ini+inifile_orthokis,"REMISE_EXISTANTE","Tri","2")
	else
		setprofilestring(dir_ini+inifile_orthokis,"REMISE_EXISTANTE","Tri","3")
	end if
end if



fermer_fenetre(parent)

end event

type uo_size from resize_fenetre within w_bordereau_remise_imprimer
boolean visible = false
integer x = 1463
integer y = 568
integer taborder = 20
long backcolor = 1090519039
end type

on uo_size.destroy
call resize_fenetre::destroy
end on

type rb_sans_patient from radiobutton within w_bordereau_remise_imprimer
integer x = 955
integer y = 1124
integer width = 242
integer height = 72
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 15780518
string text = "Sans"
boolean checked = true
end type

type rb_avec_patient from radiobutton within w_bordereau_remise_imprimer
integer x = 955
integer y = 1216
integer width = 224
integer height = 72
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 15780518
string text = "Avec"
end type

type rb_avec from radiobutton within w_bordereau_remise_imprimer
integer x = 334
integer y = 1216
integer width = 270
integer height = 72
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 15780518
string text = "Avec"
end type

type rb_normal from radiobutton within w_bordereau_remise_imprimer
integer x = 334
integer y = 1124
integer width = 334
integer height = 72
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 15780518
string text = "Sans"
boolean checked = true
end type

type dw_liste from datawindow within w_bordereau_remise_imprimer
event ue_leftbuttonup pbm_dwnlbuttonup
boolean visible = false
integer x = 50
integer y = 36
integer width = 4960
integer height = 2356
string dataobject = "dw_bordereau_remise"
boolean vscrollbar = true
borderstyle borderstyle = styleraised!
end type

event ue_leftbuttonup;iu_PowerFilter.event post ue_buttonclicked(dwo.type,dwo.name)

// pour être sûr que les affichages ne sont pas doublés
dw_liste.groupcalc()
end event

event retrieveend;

if this.rowcount() = 0 then
		Messagebox("ATTENTION","Cette remise est vide. Vous pouvez la supprimer.")
end if

cb_imprimer.enabled ( true)
cb_supprimer.enabled ( true)
cb_exporter.enabled ( true)
this.visible = true


	
end event

event constructor;iu_PowerFilter = create n_cst_PowerFilter
iu_PowerFilter.of_setdw(this)
iu_PowerFilter.of_SetLanguage( 1 )
end event

event buttonclicked;


// Détail du règlement

if row > 0 then
	string ls_Object
	ls_Object = String(dwo.name)
	
	
	choose case ls_object
		case "b_detail" 
	
	
			str_reglement reglement_groupe
			
			reglement_groupe.date 		= this.GetitemDate(row,"paye_date")
			reglement_groupe.payeur 	= this.GetitemString(row,"paye_payeur")
			reglement_groupe.mode 	= this.GetitemString(row,"paye_mode")
			reglement_groupe.dateremise 	=	this.GetitemDate(row,"paye_dateremise")
			reglement_groupe.commentaire = 	this.GetitemString(row,"paye_commentaire")
					
			OpenWithParm(w_reglements_regroupes, reglement_groupe)
	end choose

end if
end event

type rb_tri_date_payeur from radiobutton within w_bordereau_remise_imprimer
integer x = 2592
integer y = 1032
integer width = 466
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 15780518
string text = "Date + Payeur"
end type

event clicked;tri_datawindows()
end event

type rb_tri_date_saisie from radiobutton within w_bordereau_remise_imprimer
integer x = 2592
integer y = 1164
integer width = 443
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 15780518
string text = "Date + Saisie"
boolean checked = true
end type

event clicked;tri_datawindows()
end event

type rb_tri_payeur_date from radiobutton within w_bordereau_remise_imprimer
integer x = 2592
integer y = 1296
integer width = 466
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 15780518
string text = "Payeur + Date"
end type

event clicked;tri_datawindows()
end event

type rb_sans_numero_dossier from radiobutton within w_bordereau_remise_imprimer
integer x = 1614
integer y = 1124
integer width = 242
integer height = 72
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 15780518
string text = "Sans"
boolean checked = true
end type

type rb_avec_numero_dossier from radiobutton within w_bordereau_remise_imprimer
integer x = 1614
integer y = 1216
integer width = 224
integer height = 72
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 15780518
string text = "Avec"
end type

type cb_supprimer from uo_picturebutton_390x120 within w_bordereau_remise_imprimer
integer x = 1911
integer y = 2420
integer width = 475
integer height = 152
integer taborder = 90
boolean bringtotop = true
fontcharset fontcharset = ansi!
boolean enabled = false
string text = "&Supprimer"
string iconname = "ACTIONS_supprimer.png"
end type

event clicked;call super::clicked;

// Suppression effective de la remise !!

If Messagebox("ATTENTION","Vous allez SUPPRIMER définitivement cette Remise en Banque !~n~nVous devrez la générer à nouveau.~n~n(vos règlements ne sont pas modifiés.)", Question!, YesNo!, 2) = 1 then

	double v_code_remise
	datetime dt_date_generation
	v_code_remise = double(dw_remises_cherche.gettext())
	
	
	// Recherche de l'info de gérénration pour traçabilité
	select date_generation into :dt_date_generation from remises where code = :v_code_remise ;
	
	delete from remises where code = :v_code_remise ;
	
	if sqlca.sqlcode = 0 then 
		commit ;
		
		// Mise à jour des lignes de reglement
		update paye set code_remise = null where code_remise = :v_code_remise ; 
		commit ;
		
		Messagebox("ATTENTION","Remise supprimée avec succés !")
		
		// On trace l'action)
		ajout_log_special (0, "Suppression de la remise en banque du " + string(dt_date_generation, "dd/mm/yyyy à hh:mm"))

	else
		rollback ;
		Messagebox("ATTENTION","Un problème est survenu durant la suppression de la remise.~n~n"+sqlca.sqlerrtext)
		ajout_log_special (0, "Tentative de suppression de la remise en banque du " + string(dt_date_generation, "dd/mm/yyyy à hh:mm"))
	end if

	// Remise à jour de de la liste et de la dddw
	DataWindowChild fille
	if dw_remises_cherche.GetChild("code", fille) <> -1 then
		fille.settransobject(sqlca)
		fille.Reset()
		fille.Retrieve()
	end if
	
	dw_remises_cherche.retrieve()
	
	cb_autre.triggerevent(clicked!)	

end if




end event

type dw_remises_cherche from datawindow within w_bordereau_remise_imprimer
string tag = "no resize all"
integer x = 256
integer y = 440
integer width = 987
integer height = 72
integer taborder = 10
boolean bringtotop = true
string title = "none"
string dataobject = "dw_remises_cherche"
boolean border = false
boolean livescroll = true
end type

type cb_autre from uo_picturebutton_390x120 within w_bordereau_remise_imprimer
integer x = 4064
integer y = 2420
integer width = 475
integer height = 152
integer taborder = 100
boolean bringtotop = true
string text = "&Autre"
string iconname = "ACTIONS_autre.png"
end type

event clicked;call super::clicked;

dw_liste.visible = false
cb_imprimer.enabled ( false)
cb_supprimer.enabled ( false)
cb_exporter.enabled ( false)
cb_ecran.enabled ( true)
cbx_filtre.visible = false
end event

type pb_1 from uo_picturebutton_390x120 within w_bordereau_remise_imprimer
integer x = 3589
integer y = 2420
integer width = 475
integer height = 152
integer taborder = 100
boolean bringtotop = true
string text = "Nouv. Remise"
end type

event clicked;call super::clicked;
w_mdi_2020.uo_powerdock.of_openDocument(w_bordereau_remise, "Remise en Banque", image_menu_listes_admini )


fermer_fenetre(parent)
end event

type pb_2 from uo_picturebutton_390x120 within w_bordereau_remise_imprimer
integer x = 3113
integer y = 2420
integer width = 475
integer height = 152
integer taborder = 110
boolean bringtotop = true
string text = "&Récap"
end type

event clicked;call super::clicked;
w_mdi_2020.uo_powerdock.of_openDocument(w_bordereau_remise_recap, "Remise en Banque - Récapitulatif", image_menu_listes_admini )

end event

type cbx_filtre from u_cst_togglebutton within w_bordereau_remise_imprimer
event destroy ( )
boolean visible = false
integer x = 9
integer y = 2448
integer width = 489
integer height = 96
integer taborder = 60
boolean bringtotop = true
string #ontext = "Filtres / Tris activés"
string #offtext = "Filtres / Tris inactivés"
string #tiptext = "Filtres / Tris"
end type

on cbx_filtre.destroy
call u_cst_togglebutton::destroy
end on

event constructor;call super::constructor;cbx_filtre.backcolor = parent.backcolor	

end event

event clicked;call super::clicked;
iu_PowerFilter.checked = NOT iu_PowerFilter.checked
iu_PowerFilter.event ue_clicked()


end event

type cb_exporter from uo_picturebutton_390x120 within w_bordereau_remise_imprimer
integer x = 1445
integer y = 2420
integer width = 466
integer height = 152
integer taborder = 100
boolean bringtotop = true
boolean enabled = false
string text = "&Exporter"
string tiptext = "Export tous types / Export PDF"
string iconname = "ACTIONS_Exporter.png"
end type

event clicked;call super::clicked;


dw_liste.saveAs()

end event

event rbuttondown;call super::rbuttondown;//dw_liste.saveAs()
param_win[1] = "P"
openWithParm(w_exporter_datawindow_excel, dw_liste)

end event

type uo_filtre_email from uo_filtre_emails within w_bordereau_remise_imprimer
string tag = "no resize all"
boolean visible = false
integer x = 2386
integer y = 2416
integer taborder = 100
boolean bringtotop = true
end type

on uo_filtre_email.destroy
call uo_filtre_emails::destroy
end on

type gb_patient from groupbox within w_bordereau_remise_imprimer
integer x = 919
integer y = 1048
integer width = 594
integer height = 296
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean italic = true
long backcolor = 15780518
string text = "Patient"
borderstyle borderstyle = styleraised!
end type

type gb_banque from groupbox within w_bordereau_remise_imprimer
integer x = 283
integer y = 1048
integer width = 594
integer height = 296
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean italic = true
long backcolor = 15780518
string text = "Commentaires"
borderstyle borderstyle = styleraised!
end type

type gb_1 from groupbox within w_bordereau_remise_imprimer
integer x = 174
integer y = 300
integer width = 1152
integer height = 320
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean italic = true
long textcolor = 33554432
long backcolor = 15780518
string text = "Choix de la Remise"
end type

type gb_dossier from groupbox within w_bordereau_remise_imprimer
integer x = 1554
integer y = 1048
integer width = 594
integer height = 296
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean italic = true
long backcolor = 15780518
string text = "N° Dossier"
end type

type gb_3 from groupbox within w_bordereau_remise_imprimer
integer x = 2423
integer y = 928
integer width = 1047
integer height = 524
integer taborder = 90
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean italic = true
long backcolor = 15780518
string text = "Tri"
end type

type gb_2 from groupbox within w_bordereau_remise_imprimer
integer x = 178
integer y = 928
integer width = 2158
integer height = 524
integer taborder = 100
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean italic = true
long backcolor = 15780518
string text = "Contenu de l~'impression"
end type

