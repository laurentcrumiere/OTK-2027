$PBExportHeader$w_liste_gestion_prelevements_existants.srw
forward
global type w_liste_gestion_prelevements_existants from w_fenetre_arakis
end type
type cb_ecran from uo_picturebutton_390x120 within w_liste_gestion_prelevements_existants
end type
type cb_imprimer from uo_picturebutton_390x120 within w_liste_gestion_prelevements_existants
end type
type cb_fermer from uo_picturebutton_390x120_fermer within w_liste_gestion_prelevements_existants
end type
type uo_size from resize_fenetre within w_liste_gestion_prelevements_existants
end type
type dw_liste2 from datawindow within w_liste_gestion_prelevements_existants
end type
type cb_supprimer from uo_picturebutton_390x120 within w_liste_gestion_prelevements_existants
end type
type dw_prelevements_cherche from datawindow within w_liste_gestion_prelevements_existants
end type
type cb_autre from uo_picturebutton_390x120 within w_liste_gestion_prelevements_existants
end type
type cbx_filtre from u_cst_togglebutton within w_liste_gestion_prelevements_existants
end type
type cb_exporter from uo_picturebutton_390x120 within w_liste_gestion_prelevements_existants
end type
type uo_filtre_email from uo_filtre_emails within w_liste_gestion_prelevements_existants
end type
type dw_liste from u_basedw within w_liste_gestion_prelevements_existants
end type
type gb_1 from groupbox within w_liste_gestion_prelevements_existants
end type
end forward

global type w_liste_gestion_prelevements_existants from w_fenetre_arakis
integer x = 27
integer y = 200
integer width = 5070
integer height = 2720
string title = "Prélèvements effecutés"
windowtype windowtype = child!
cb_ecran cb_ecran
cb_imprimer cb_imprimer
cb_fermer cb_fermer
uo_size uo_size
dw_liste2 dw_liste2
cb_supprimer cb_supprimer
dw_prelevements_cherche dw_prelevements_cherche
cb_autre cb_autre
cbx_filtre cbx_filtre
cb_exporter cb_exporter
uo_filtre_email uo_filtre_email
dw_liste dw_liste
gb_1 gb_1
end type
global w_liste_gestion_prelevements_existants w_liste_gestion_prelevements_existants

type variables

n_cst_PowerFilter iu_PowerFilter


end variables

event open;call super::open;uo_size.taille(this)



dw_prelevements_cherche.setTransObject(sqlca)
dw_prelevements_cherche.retrieve()

dw_liste.setTransObject(sqlca)
uo_filtre_email.dw_liste = dw_liste


uo_filtre_email.visible = true

cbx_filtre.backcolor = backcolor






end event

on w_liste_gestion_prelevements_existants.create
int iCurrent
call super::create
this.cb_ecran=create cb_ecran
this.cb_imprimer=create cb_imprimer
this.cb_fermer=create cb_fermer
this.uo_size=create uo_size
this.dw_liste2=create dw_liste2
this.cb_supprimer=create cb_supprimer
this.dw_prelevements_cherche=create dw_prelevements_cherche
this.cb_autre=create cb_autre
this.cbx_filtre=create cbx_filtre
this.cb_exporter=create cb_exporter
this.uo_filtre_email=create uo_filtre_email
this.dw_liste=create dw_liste
this.gb_1=create gb_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_ecran
this.Control[iCurrent+2]=this.cb_imprimer
this.Control[iCurrent+3]=this.cb_fermer
this.Control[iCurrent+4]=this.uo_size
this.Control[iCurrent+5]=this.dw_liste2
this.Control[iCurrent+6]=this.cb_supprimer
this.Control[iCurrent+7]=this.dw_prelevements_cherche
this.Control[iCurrent+8]=this.cb_autre
this.Control[iCurrent+9]=this.cbx_filtre
this.Control[iCurrent+10]=this.cb_exporter
this.Control[iCurrent+11]=this.uo_filtre_email
this.Control[iCurrent+12]=this.dw_liste
this.Control[iCurrent+13]=this.gb_1
end on

on w_liste_gestion_prelevements_existants.destroy
call super::destroy
destroy(this.cb_ecran)
destroy(this.cb_imprimer)
destroy(this.cb_fermer)
destroy(this.uo_size)
destroy(this.dw_liste2)
destroy(this.cb_supprimer)
destroy(this.dw_prelevements_cherche)
destroy(this.cb_autre)
destroy(this.cbx_filtre)
destroy(this.cb_exporter)
destroy(this.uo_filtre_email)
destroy(this.dw_liste)
destroy(this.gb_1)
end on

event resize;uo_size.retaille(this)
end event

type p_fond from w_fenetre_arakis`p_fond within w_liste_gestion_prelevements_existants
integer y = 1004
end type

type cb_ecran from uo_picturebutton_390x120 within w_liste_gestion_prelevements_existants
integer x = 631
integer y = 2420
integer width = 475
integer height = 152
integer taborder = 90
string text = "&Ecran"
boolean default = true
string iconname = "ACTIONS_ecran.png"
end type

event clicked;call super::clicked;	double v_code_prelevement
	string pra_min
	date v_date_prelevement
	
	ok_mdp = true
	
	v_code_prelevement = double(dw_prelevements_cherche.gettext())
	ok_mdp = true

	
	// soit ils ont tous le meme mot de passe => remise autorisée pour TOUS , soit pas
	// => on peut prendre n'importer quel praticien de la remise pour la demande du mot de passe
	select top 1 patient.code_praticien into :pra_min from ligne_soins, patient where ligne_soins.code = patient.code and ligne_soins.code_prelevement = :v_code_prelevement  ;
	
	select top 1 date("date_generation") into :v_date_prelevement from prelevements where code = :v_code_prelevement ; 
	
	if v_date_prelevement <= relativedate(today(), - fxg_get_delai_mdp_financier(pra_min)) then
		ok_mdp = false
		// Si tous les praticiens,ils ont tous le même MDP

		// Saisie du mot de passe financier ....
		  SELECT "prati"."pasfin"  
		    INTO :pasfin  FROM "prati"  
		   WHERE ( "prati"."code" = :pra_min) ;

			guo_fenetre_modale.wf_ouvrir(w_mot_passe_financier)

	end if

	if ok_mdp then


		open(w_patience)
		
		
		dw_liste.retrieve(v_code_prelevement)
		dw_liste.visible = true
		cbx_filtre.visible = true
		
		close(w_patience)
		
	end if
end event

type cb_imprimer from uo_picturebutton_390x120 within w_liste_gestion_prelevements_existants
integer x = 1138
integer y = 2420
integer width = 466
integer height = 152
integer taborder = 80
boolean enabled = false
string text = "&Imprimer"
string iconname = "ACTIONS_imprimer.png"
end type

event clicked;call super::clicked;dw_liste.print()
end event

type cb_fermer from uo_picturebutton_390x120_fermer within w_liste_gestion_prelevements_existants
integer x = 4539
integer y = 2420
integer width = 466
integer height = 152
integer taborder = 80
end type

event clicked;


fermer_fenetre(parent)

end event

type uo_size from resize_fenetre within w_liste_gestion_prelevements_existants
boolean visible = false
integer x = 1463
integer y = 568
integer taborder = 20
long backcolor = 1090519039
end type

on uo_size.destroy
call resize_fenetre::destroy
end on

type dw_liste2 from datawindow within w_liste_gestion_prelevements_existants
event ue_leftbuttonup pbm_dwnlbuttonup
boolean visible = false
integer x = 3118
integer y = 128
integer width = 4960
integer height = 2356
string dataobject = "dw_prelevements_liste2"
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

// Bouton prélèvement

string	ls_Object

ls_Object = String(dwo.name)


choose case ls_object
	case "b_prelevement" 
		// Passage de paramètres par variables globales
		param_win[1] = string (this.getitemnumber(this.getrow(), "ligne_prelevements_code"))
		param_win[2] = string (this.getitemnumber(this.getrow(), "ligne_prelevements_code_prelevement"))
		open(w_soins_reg_maj_prelevement)
end choose


end event

event clicked;//If row > 0 Then
//	// On envoie cette fonction pour les libellés de colonne qui ne sonts pas mis en entête
//	This.uf_ColSort()
//	
//	This.SelectRow(0,False)
//	This.SelectRow(row,True)
//	This.setrow(row)
//else
//	This.uf_ColSort()
//End If
//
end event

type cb_supprimer from uo_picturebutton_390x120 within w_liste_gestion_prelevements_existants
integer x = 2135
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

// Suppression effective du prélèvement

If Messagebox("ATTENTION","Vous allez SUPPRIMER définitivement les informations mémorisées de ces prélèvements !~n~nLES REGLEMENTS NE SERONT PAS MODIFIES.~n~nConfirmez-vous ?", Question!, YesNo!, 2) = 1 then

	double v_code_prelevement
	datetime dt_date_generation
	v_code_prelevement = double(dw_prelevements_cherche.gettext())

	// Recherche de l'info de génération pour traçabilité
	select date_generation into :dt_date_generation from prelevements where code = :v_code_prelevement ;
	
	delete from ligne_prelevements where code = :v_code_prelevement ;

	if sqlca.sqlcode = 0 then 
	
	
		delete from prelevements where code = :v_code_prelevement ;
	
		if sqlca.sqlcode = 0 then 
			
			update ligne_soins set code_prelevement = null where code_prelevement = :v_code_prelevement ;
			
			if sqlca.sqlcode = 0 then 
				commit ;
		
				Messagebox("ATTENTION","Informations de prélèvement supprimées avec succés !")
		
				// On trace l'action)
				ajout_log_special (0, "Suppression prélèvements du " + string(dt_date_generation, "dd/mm/yyyy à hh:mm"))

			else
				rollback ;
				Messagebox("ATTENTION","Erreur N°1 - Un problème est survenu durant la suppression des informations de prélèvement.~n~n"+sqlca.sqlerrtext)
				ajout_log_special (0, "Tentative de suppression prélèvements du " + string(dt_date_generation, "dd/mm/yyyy à hh:mm"))
			end if
		else
			rollback ;
			Messagebox("ATTENTION","Erreur N°2 - Un problème est survenu durant la suppression des informations de prélèvement.~n~n"+sqlca.sqlerrtext)
			ajout_log_special (0, "Tentative de suppression prélèvements du " + string(dt_date_generation, "dd/mm/yyyy à hh:mm"))
		end if

	else
		rollback ;
		Messagebox("ATTENTION","Erreur N°3 - Un problème est survenu durant la suppression des informations de prélèvement.~n~n"+sqlca.sqlerrtext)
		ajout_log_special (0, "Tentative de suppression prélèvements du " + string(dt_date_generation, "dd/mm/yyyy à hh:mm"))
	end if
	
	// Remise à jour de de la liste et de la dddw
	DataWindowChild fille
	if dw_prelevements_cherche.GetChild("code", fille) <> -1 then
		fille.settransobject(sqlca)
		fille.Reset()
		fille.Retrieve()
	end if
	
	dw_prelevements_cherche.retrieve()
	
	cb_autre.triggerevent(clicked!)	

end if




end event

type dw_prelevements_cherche from datawindow within w_liste_gestion_prelevements_existants
string tag = "no resize all"
integer x = 256
integer y = 440
integer width = 987
integer height = 72
integer taborder = 10
boolean bringtotop = true
string title = "none"
string dataobject = "dw_prelevements_cherche"
boolean border = false
boolean livescroll = true
end type

type cb_autre from uo_picturebutton_390x120 within w_liste_gestion_prelevements_existants
integer x = 4041
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

type cbx_filtre from u_cst_togglebutton within w_liste_gestion_prelevements_existants
event destroy ( )
boolean visible = false
integer x = 37
integer y = 2448
integer width = 539
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

type cb_exporter from uo_picturebutton_390x120 within w_liste_gestion_prelevements_existants
integer x = 1637
integer y = 2420
integer width = 466
integer height = 152
integer taborder = 100
boolean bringtotop = true
boolean enabled = false
string text = "&Exporter"
string iconname = "ACTIONS_Exporter.png"
end type

event clicked;call super::clicked;


dw_liste.saveAs()

end event

type uo_filtre_email from uo_filtre_emails within w_liste_gestion_prelevements_existants
string tag = "no resize all"
boolean visible = false
integer x = 2642
integer y = 2416
integer taborder = 100
boolean bringtotop = true
end type

on uo_filtre_email.destroy
call uo_filtre_emails::destroy
end on

type dw_liste from u_basedw within w_liste_gestion_prelevements_existants
event ue_leftbuttonup pbm_dwnlbuttonup
boolean visible = false
integer x = 23
integer y = 28
integer width = 4960
integer height = 2356
integer taborder = 40
boolean bringtotop = true
string dataobject = "dw_prelevements_liste2"
borderstyle borderstyle = stylebox!
end type

event ue_leftbuttonup;iu_PowerFilter.event post ue_buttonclicked(dwo.type,dwo.name)
end event

event constructor;call super::constructor;iu_PowerFilter = create n_cst_PowerFilter
iu_PowerFilter.of_setdw(this)
iu_PowerFilter.of_SetLanguage( 1 )
end event

event doubleclicked;call super::doubleclicked;

// double clic, comme dans la salle d'attente !!

if row > 0 then

	var_code 				= 	this.getitemnumber(row,"code")
	var_numero_dossier 	= 	this.getitemnumber(row,"numero_dossier")
	var_nom 				= this.getitemstring(row,"nom")
	var_nomp 				= ""
	var_pay 					= ""
	var_moul 				= ""

	ouverture_salle_attente()
end if

end event

event rbuttondown;if row > 0 then
	This.SelectRow(0,False)
	This.SelectRow(row,True)
	This.setrow(row)
	OpenMenuPatient_Listes(this)
end if
end event

event resize;call super::resize;iu_PowerFilter.event ue_positionbuttons()
end event

event retrieveend;call super::retrieveend;cb_imprimer.enabled ( true)
cb_supprimer.enabled ( true)
cb_exporter.enabled ( true)
this.visible = true
end event

event buttonclicked;call super::buttonclicked;

// Bouton prélèvement

string	ls_Object

ls_Object = String(dwo.name)


choose case ls_object
	case "b_prelevement" 
		// Passage de paramètres par variables globales
		param_win[1] = string (this.getitemnumber(this.getrow(), "ligne_prelevements_code"))
		param_win[2] = string (this.getitemnumber(this.getrow(), "ligne_prelevements_code_prelevement"))
		open(w_soins_reg_maj_prelevement)
end choose


end event

type gb_1 from groupbox within w_liste_gestion_prelevements_existants
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
string text = "Choix des prélèvements"
end type

