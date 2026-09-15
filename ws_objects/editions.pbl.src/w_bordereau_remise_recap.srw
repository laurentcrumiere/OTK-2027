$PBExportHeader$w_bordereau_remise_recap.srw
forward
global type w_bordereau_remise_recap from w_fenetre_arakis
end type
type cb_ecran from uo_picturebutton_390x120 within w_bordereau_remise_recap
end type
type cb_imprimer from uo_picturebutton_390x120 within w_bordereau_remise_recap
end type
type cb_fermer from uo_picturebutton_390x120_fermer within w_bordereau_remise_recap
end type
type rb_tous from radiobutton within w_bordereau_remise_recap
end type
type rb_un from radiobutton within w_bordereau_remise_recap
end type
type uo_size from resize_fenetre within w_bordereau_remise_recap
end type
type dw_liste from datawindow within w_bordereau_remise_recap
end type
type dw_prati from datawindow within w_bordereau_remise_recap
end type
type st_max from statictext within w_bordereau_remise_recap
end type
type st_min from statictext within w_bordereau_remise_recap
end type
type em_min from uo_date_calendrier within w_bordereau_remise_recap
end type
type em_max from uo_date_calendrier within w_bordereau_remise_recap
end type
type dw_type_regl from datawindow within w_bordereau_remise_recap
end type
type rb_un_regl from radiobutton within w_bordereau_remise_recap
end type
type rb_tous_regl from radiobutton within w_bordereau_remise_recap
end type
type rb_avec from radiobutton within w_bordereau_remise_recap
end type
type rb_normal from radiobutton within w_bordereau_remise_recap
end type
type rb_avec_patient from radiobutton within w_bordereau_remise_recap
end type
type rb_sans_patient from radiobutton within w_bordereau_remise_recap
end type
type rb_avec_numero_dossier from radiobutton within w_bordereau_remise_recap
end type
type rb_sans_numero_dossier from radiobutton within w_bordereau_remise_recap
end type
type cb_autre from uo_picturebutton_390x120 within w_bordereau_remise_recap
end type
type cbx_recap from checkbox within w_bordereau_remise_recap
end type
type cb_exporter from uo_picturebutton_390x120 within w_bordereau_remise_recap
end type
type gb_mode from groupbox within w_bordereau_remise_recap
end type
type gb_1 from groupbox within w_bordereau_remise_recap
end type
type gb_3 from groupbox within w_bordereau_remise_recap
end type
type gb_banque from groupbox within w_bordereau_remise_recap
end type
type gb_patient from groupbox within w_bordereau_remise_recap
end type
type gb_dossier from groupbox within w_bordereau_remise_recap
end type
type gb_contenu from groupbox within w_bordereau_remise_recap
end type
end forward

global type w_bordereau_remise_recap from w_fenetre_arakis
integer x = 27
integer y = 200
integer width = 4699
integer height = 2756
string title = "Récapitulatif des Remises en Banque"
windowtype windowtype = child!
long backcolor = 15780518
cb_ecran cb_ecran
cb_imprimer cb_imprimer
cb_fermer cb_fermer
rb_tous rb_tous
rb_un rb_un
uo_size uo_size
dw_liste dw_liste
dw_prati dw_prati
st_max st_max
st_min st_min
em_min em_min
em_max em_max
dw_type_regl dw_type_regl
rb_un_regl rb_un_regl
rb_tous_regl rb_tous_regl
rb_avec rb_avec
rb_normal rb_normal
rb_avec_patient rb_avec_patient
rb_sans_patient rb_sans_patient
rb_avec_numero_dossier rb_avec_numero_dossier
rb_sans_numero_dossier rb_sans_numero_dossier
cb_autre cb_autre
cbx_recap cbx_recap
cb_exporter cb_exporter
gb_mode gb_mode
gb_1 gb_1
gb_3 gb_3
gb_banque gb_banque
gb_patient gb_patient
gb_dossier gb_dossier
gb_contenu gb_contenu
end type
global w_bordereau_remise_recap w_bordereau_remise_recap

type variables
//boolean prepa_faite
//double nb_dossier


// Variables mémorisant les choix de l'utilisateur à l'écran
// Pour faire la même chose à l'imprimante

string pra_min,pra_max			// praticiens
date dmin,dmax					// Dates
char monnaie						// Monnaie demandée : 'F' ou 'E'
char mode_reglement				// Vaudra 'C' ou 'E' ou autres
string libelle_mode_reglement
end variables

event open;call super::open;

// Initialisation des listes ....
dw_liste.settransobject(SQLCA)
dw_prati.settransobject(SQLCA)
dw_prati.retrieve()

gb_contenu.backcolor = couleur_fond_fenetre
cbx_recap.backcolor = couleur_fond_fenetre

dw_type_regl.settransobject(SQLCA)
dw_type_regl.retrieve()

// Comme dans le livre de recettes .... si le MDP est identiques en Multi praticien, on donne la possibilité de regrouper ...

if not multi then
	rb_tous.checked = false
	rb_tous.enabled = false
	rb_un.checked = true
	dw_prati.visible = true
else
	if not verif_meme_mot_de_passe_praticien() then 
		// Pas le même mot de passe => pas pour tous
		rb_tous.checked = false
		rb_tous.enabled = false
		rb_un.checked = true
		dw_prati.visible = true
		rb_un.triggerevent(clicked!) 			
	end if
end if


// Dates par défaut

em_min.setDate(date(year(today()), 1, 1))
em_max.setDate(today())


uo_size.taille(this)


end event

on w_bordereau_remise_recap.create
int iCurrent
call super::create
this.cb_ecran=create cb_ecran
this.cb_imprimer=create cb_imprimer
this.cb_fermer=create cb_fermer
this.rb_tous=create rb_tous
this.rb_un=create rb_un
this.uo_size=create uo_size
this.dw_liste=create dw_liste
this.dw_prati=create dw_prati
this.st_max=create st_max
this.st_min=create st_min
this.em_min=create em_min
this.em_max=create em_max
this.dw_type_regl=create dw_type_regl
this.rb_un_regl=create rb_un_regl
this.rb_tous_regl=create rb_tous_regl
this.rb_avec=create rb_avec
this.rb_normal=create rb_normal
this.rb_avec_patient=create rb_avec_patient
this.rb_sans_patient=create rb_sans_patient
this.rb_avec_numero_dossier=create rb_avec_numero_dossier
this.rb_sans_numero_dossier=create rb_sans_numero_dossier
this.cb_autre=create cb_autre
this.cbx_recap=create cbx_recap
this.cb_exporter=create cb_exporter
this.gb_mode=create gb_mode
this.gb_1=create gb_1
this.gb_3=create gb_3
this.gb_banque=create gb_banque
this.gb_patient=create gb_patient
this.gb_dossier=create gb_dossier
this.gb_contenu=create gb_contenu
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_ecran
this.Control[iCurrent+2]=this.cb_imprimer
this.Control[iCurrent+3]=this.cb_fermer
this.Control[iCurrent+4]=this.rb_tous
this.Control[iCurrent+5]=this.rb_un
this.Control[iCurrent+6]=this.uo_size
this.Control[iCurrent+7]=this.dw_liste
this.Control[iCurrent+8]=this.dw_prati
this.Control[iCurrent+9]=this.st_max
this.Control[iCurrent+10]=this.st_min
this.Control[iCurrent+11]=this.em_min
this.Control[iCurrent+12]=this.em_max
this.Control[iCurrent+13]=this.dw_type_regl
this.Control[iCurrent+14]=this.rb_un_regl
this.Control[iCurrent+15]=this.rb_tous_regl
this.Control[iCurrent+16]=this.rb_avec
this.Control[iCurrent+17]=this.rb_normal
this.Control[iCurrent+18]=this.rb_avec_patient
this.Control[iCurrent+19]=this.rb_sans_patient
this.Control[iCurrent+20]=this.rb_avec_numero_dossier
this.Control[iCurrent+21]=this.rb_sans_numero_dossier
this.Control[iCurrent+22]=this.cb_autre
this.Control[iCurrent+23]=this.cbx_recap
this.Control[iCurrent+24]=this.cb_exporter
this.Control[iCurrent+25]=this.gb_mode
this.Control[iCurrent+26]=this.gb_1
this.Control[iCurrent+27]=this.gb_3
this.Control[iCurrent+28]=this.gb_banque
this.Control[iCurrent+29]=this.gb_patient
this.Control[iCurrent+30]=this.gb_dossier
this.Control[iCurrent+31]=this.gb_contenu
end on

on w_bordereau_remise_recap.destroy
call super::destroy
destroy(this.cb_ecran)
destroy(this.cb_imprimer)
destroy(this.cb_fermer)
destroy(this.rb_tous)
destroy(this.rb_un)
destroy(this.uo_size)
destroy(this.dw_liste)
destroy(this.dw_prati)
destroy(this.st_max)
destroy(this.st_min)
destroy(this.em_min)
destroy(this.em_max)
destroy(this.dw_type_regl)
destroy(this.rb_un_regl)
destroy(this.rb_tous_regl)
destroy(this.rb_avec)
destroy(this.rb_normal)
destroy(this.rb_avec_patient)
destroy(this.rb_sans_patient)
destroy(this.rb_avec_numero_dossier)
destroy(this.rb_sans_numero_dossier)
destroy(this.cb_autre)
destroy(this.cbx_recap)
destroy(this.cb_exporter)
destroy(this.gb_mode)
destroy(this.gb_1)
destroy(this.gb_3)
destroy(this.gb_banque)
destroy(this.gb_patient)
destroy(this.gb_dossier)
destroy(this.gb_contenu)
end on

event resize;uo_size.retaille(this)
end event

type p_fond from w_fenetre_arakis`p_fond within w_bordereau_remise_recap
integer x = 1024
integer y = 892
end type

type cb_ecran from uo_picturebutton_390x120 within w_bordereau_remise_recap
integer x = 1198
integer y = 2396
integer width = 489
integer height = 148
integer taborder = 90
string text = "&Ecran"
boolean default = true
string iconname = "ACTIONS_ecran.png"
end type

event clicked;call super::clicked;// Praticiens
if rb_un.checked then
	// Pour un praticien
	pra_min = dw_prati.getitemstring(dw_prati.getrow(),"code")
	pra_max = pra_min
else
	 // Tous les praticiens
	 SELECT min(code),max(code) INTO :pra_min,:pra_max
	  FROM "prati" where actif = 1 ;	
end if
	

// Dates 
dmin = date(em_min.text)
dmax = date(em_max.text)


	ok_mdp = true

	if dmin <= relativedate(today(), - fxg_get_delai_mdp_financier(pra_min)) then
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
		

		if cbx_recap.checked then
			// Pas de détail
			dw_liste.Modify("DataWindow.Header.2.Height=0")
		else
			if rb_normal.checked then
			// Sans commentaires
				dw_liste.Modify("DataWindow.Header.2.Height=80")
			else
				dw_liste.Modify("DataWindow.Header.2.Height=152")
			end if
		
			// Avec le patient visible ou pas
			if rb_avec_patient.checked then
				dw_liste.Modify("patient_nom.visible = 1")
				dw_liste.Modify("patient_nom_t.visible = 1")
			else
				dw_liste.Modify("patient_nom.visible = 0")
				dw_liste.Modify("patient_nom_t.visible = 0")
			end if
			
				
			// Avec le N° de dossier
			if rb_avec_numero_dossier.checked then
				dw_liste.Modify("numero_dossier.visible = 1")
				dw_liste.Modify("numero_dossier_t.visible = 1")
			else
				dw_liste.Modify("numero_dossier.visible = 0")
				dw_liste.Modify("numero_dossier_t.visible = 0")
			end if
		end if
	
		string mode_min , mode_max, titre
		
		if rb_tous_regl.checked then
			mode_min = ""
			mode_max = "Z"
		else
			mode_min = dw_type_regl.gettext()
			mode_max = mode_min
		end if 

		titre = "Entre le " + string(dmin) + " et le " + string(dmax)
		dw_liste.Modify("t_titre.text = '"+titre+"'")		
		
		dw_liste.retrieve(dmin, dmax, mode_min,mode_max, pra_min,pra_max)
		
		
		// Indispensable pour le calcul du nombre de pièces remises
		dw_liste.groupcalc()

		if dw_liste.rowcount() > 0 then


			dw_liste.visible = true
			
			
			cb_imprimer.enabled ( true)
			cb_exporter.enabled ( true)
			cb_autre.enabled ( true	)
			
		else
			
			Messagebox("ATTENTION","Aucune remise pour ces critères.")
		
		end if

		close(w_patience)
	end if
end event

type cb_imprimer from uo_picturebutton_390x120 within w_bordereau_remise_recap
integer x = 1701
integer y = 2396
integer width = 489
integer height = 148
integer taborder = 80
boolean enabled = false
string text = "&Imprimer"
string iconname = "ACTIONS_imprimer.png"
end type

event clicked;call super::clicked;dw_liste.print()
end event

type cb_fermer from uo_picturebutton_390x120_fermer within w_bordereau_remise_recap
integer x = 3209
integer y = 2396
integer width = 489
integer height = 148
integer taborder = 80
end type

event clicked;fermer_fenetre(parent)
end event

type rb_tous from radiobutton within w_bordereau_remise_recap
integer x = 343
integer y = 232
integer width = 654
integer height = 80
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 15780518
string text = "Tous les praticiens"
end type

event clicked;dw_prati.visible = false




end event

type rb_un from radiobutton within w_bordereau_remise_recap
integer x = 343
integer y = 336
integer width = 567
integer height = 80
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 15780518
string text = "Un praticien"
boolean checked = true
end type

event clicked;dw_prati.visible = true



end event

type uo_size from resize_fenetre within w_bordereau_remise_recap
boolean visible = false
integer x = 1664
integer y = 700
integer taborder = 20
long backcolor = 1090519039
end type

on uo_size.destroy
call resize_fenetre::destroy
end on

type dw_liste from datawindow within w_bordereau_remise_recap
boolean visible = false
integer x = 55
integer y = 40
integer width = 4539
integer height = 2296
string dataobject = "dw_bordereau_remise_recap"
boolean hscrollbar = true
boolean vscrollbar = true
borderstyle borderstyle = styleraised!
end type

type dw_prati from datawindow within w_bordereau_remise_recap
string tag = "no resizeall"
integer x = 1074
integer y = 344
integer width = 869
integer height = 76
integer taborder = 10
string dataobject = "dw_cherche_prati"
boolean border = false
end type

type st_max from statictext within w_bordereau_remise_recap
integer x = 1079
integer y = 1144
integer width = 169
integer height = 64
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
string facename = "Arial"
long backcolor = 553648127
string text = "et le"
alignment alignment = center!
end type

type st_min from statictext within w_bordereau_remise_recap
integer x = 338
integer y = 1144
integer width = 238
integer height = 64
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
string facename = "Arial"
long backcolor = 553648127
string text = "Entre le"
end type

type em_min from uo_date_calendrier within w_bordereau_remise_recap
integer x = 622
integer y = 1132
integer taborder = 200
boolean bringtotop = true
end type

on em_min.destroy
call uo_date_calendrier::destroy
end on

type em_max from uo_date_calendrier within w_bordereau_remise_recap
integer x = 1262
integer y = 1132
integer taborder = 210
boolean bringtotop = true
end type

on em_max.destroy
call uo_date_calendrier::destroy
end on

type dw_type_regl from datawindow within w_bordereau_remise_recap
string tag = "position brush"
boolean visible = false
integer x = 562
integer y = 756
integer width = 873
integer height = 72
integer taborder = 60
boolean bringtotop = true
string dataobject = "dw_type_regl_ddlb"
boolean border = false
boolean livescroll = true
end type

type rb_un_regl from radiobutton within w_bordereau_remise_recap
integer x = 320
integer y = 748
integer width = 215
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 15780518
string text = "Un"
end type

event clicked;dw_type_regl.visible = true
end event

type rb_tous_regl from radiobutton within w_bordereau_remise_recap
integer x = 320
integer y = 644
integer width = 219
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 15780518
string text = "Tous"
boolean checked = true
end type

event clicked;dw_type_regl.visible = false
end event

type rb_avec from radiobutton within w_bordereau_remise_recap
integer x = 389
integer y = 1704
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

type rb_normal from radiobutton within w_bordereau_remise_recap
integer x = 389
integer y = 1612
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

type rb_avec_patient from radiobutton within w_bordereau_remise_recap
integer x = 1010
integer y = 1704
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

type rb_sans_patient from radiobutton within w_bordereau_remise_recap
integer x = 1010
integer y = 1612
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

type rb_avec_numero_dossier from radiobutton within w_bordereau_remise_recap
integer x = 1669
integer y = 1704
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

type rb_sans_numero_dossier from radiobutton within w_bordereau_remise_recap
integer x = 1669
integer y = 1612
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

type cb_autre from uo_picturebutton_390x120 within w_bordereau_remise_recap
integer x = 2706
integer y = 2396
integer width = 489
integer height = 148
integer taborder = 90
boolean bringtotop = true
boolean enabled = false
string text = "&Autre"
string iconname = "ACTIONS_autre.png"
end type

event clicked;call super::clicked;

dw_liste.visible = false


this.enabled ( false)
cb_imprimer.enabled ( false)
cb_ecran.enabled ( true)
cb_exporter.enabled ( false)

end event

type cbx_recap from checkbox within w_bordereau_remise_recap
integer x = 361
integer y = 1904
integer width = 891
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 15780518
string text = "Uniquement récapitulatif"
boolean checked = true
end type

type cb_exporter from uo_picturebutton_390x120 within w_bordereau_remise_recap
integer x = 2203
integer y = 2396
integer width = 489
integer height = 148
integer taborder = 90
boolean bringtotop = true
boolean enabled = false
string text = "E&xporter"
string tiptext = "Export tous types / Export PDF"
string iconname = "ACTIONS_Exporter.png"
end type

event clicked;call super::clicked;dw_liste.saveas()
end event

event rbuttondown;call super::rbuttondown;
//dw_liste.saveAs()
param_win[1] = "P"
openWithParm(w_exporter_datawindow_excel, dw_liste)

end event

type gb_mode from groupbox within w_bordereau_remise_recap
integer x = 233
integer y = 552
integer width = 1344
integer height = 344
integer taborder = 60
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean italic = true
long backcolor = 15780518
string text = "Mode de Règlement"
borderstyle borderstyle = styleraised!
end type

type gb_1 from groupbox within w_bordereau_remise_recap
integer x = 233
integer y = 148
integer width = 2203
integer height = 320
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean italic = true
long textcolor = 33554432
long backcolor = 15780518
string text = "Praticien"
end type

type gb_3 from groupbox within w_bordereau_remise_recap
integer x = 233
integer y = 1020
integer width = 1568
integer height = 284
integer taborder = 70
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean italic = true
long backcolor = 15780518
string text = "Date de remise"
borderstyle borderstyle = styleraised!
end type

type gb_banque from groupbox within w_bordereau_remise_recap
integer x = 338
integer y = 1536
integer width = 594
integer height = 296
integer taborder = 210
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

type gb_patient from groupbox within w_bordereau_remise_recap
integer x = 974
integer y = 1536
integer width = 594
integer height = 296
integer taborder = 220
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

type gb_dossier from groupbox within w_bordereau_remise_recap
integer x = 1609
integer y = 1536
integer width = 594
integer height = 296
integer taborder = 230
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

type gb_contenu from groupbox within w_bordereau_remise_recap
integer x = 233
integer y = 1416
integer width = 2158
integer height = 636
integer taborder = 110
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

