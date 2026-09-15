$PBExportHeader$w_liste_patients_reglement_enbanque.srw
forward
global type w_liste_patients_reglement_enbanque from w_liste_patients
end type
type cb_exporter from uo_picturebutton_390x120 within w_liste_patients_reglement_enbanque
end type
type st_2 from statictext within w_liste_patients_reglement_enbanque
end type
type st_3 from statictext within w_liste_patients_reglement_enbanque
end type
type st_5 from statictext within w_liste_patients_reglement_enbanque
end type
type st_6 from statictext within w_liste_patients_reglement_enbanque
end type
type st_7 from statictext within w_liste_patients_reglement_enbanque
end type
type em_date_min from uo_date_calendrier within w_liste_patients_reglement_enbanque
end type
type em_date_max from uo_date_calendrier within w_liste_patients_reglement_enbanque
end type
type em_date_debut from uo_date_calendrier within w_liste_patients_reglement_enbanque
end type
type em_date_fin from uo_date_calendrier within w_liste_patients_reglement_enbanque
end type
type st_1 from statictext within w_liste_patients_reglement_enbanque
end type
type cbx_detail from checkbox within w_liste_patients_reglement_enbanque
end type
type uo_filtre_email from uo_filtre_emails within w_liste_patients_reglement_enbanque
end type
end forward

global type w_liste_patients_reglement_enbanque from w_liste_patients
string title = "Règlements selon Date et Date de Remise en Banque"
cb_exporter cb_exporter
st_2 st_2
st_3 st_3
st_5 st_5
st_6 st_6
st_7 st_7
em_date_min em_date_min
em_date_max em_date_max
em_date_debut em_date_debut
em_date_fin em_date_fin
st_1 st_1
cbx_detail cbx_detail
uo_filtre_email uo_filtre_email
end type
global w_liste_patients_reglement_enbanque w_liste_patients_reglement_enbanque

forward prototypes
public subroutine prepa ()
end prototypes

public subroutine prepa ();string var_reg,tit
string pra_min, pra_max
double code_min,code_max
date date_min,date_max, date_debut, date_fin, date_recherche

if not prepa_faite then
	

		// Praticiens
		if rb_un.checked then
			// Pour un praticien
			pra_min=dw_prati.getitemstring(dw_prati.getrow(),"code")
			pra_max=dw_prati.getitemstring(dw_prati.getrow(),"code")
		else
			 // Tous les praticiens
			 SELECT min(code),max(code) INTO :pra_min,:pra_max
			  FROM "prati" ;	
		end if
	

		date_min = date(em_date_min.text)
		date_max = date(em_date_max.text)
		
		date_debut = date(em_date_debut.text)
		date_fin = date(em_date_fin.text)		

		ok_mdp = true

		IF date_min < date_debut THEN
			date_recherche = date_min
		ELSE
			date_recherche = date_debut
		END IF	
		
		
	if date_recherche <= relativedate(today(), - fxg_get_delai_mdp_financier(pra_min)) then
		ok_mdp = false
	  SELECT "prati"."pasfin"  
	    INTO :pasfin  
	    FROM "prati"  
	   WHERE ( "prati"."code" = :pra_min ) ;

		guo_fenetre_modale.wf_ouvrir(w_mot_passe_financier)
	end if

	if ok_mdp then
	
		//prepa_faite = true

		code_min = -99999999
		code_max = 999999999

//		var_reg = dw_type_regl.getitemstring(1,"type_regl")

		if cbx_detail.checked then
			dw_liste.object.DataWindow.detail.height = 84
		else
			dw_liste.object.DataWindow.detail.height = 0
		end if
	
		open(w_patience)
		tit = "Encaissés entre le "+em_date_min.text+" et le "+em_date_max.text + ", Mis en Banque entre le " + em_date_debut.text + " et le " + em_date_fin.text
		dw_liste.Modify("sous_titre.text = '"+tit+"'")
		dw_liste.retrieve(code_min,code_max,pra_min, pra_max,date_min,date_max,date_debut,date_fin)
		
		// Parcours pour mettre à jour la date de fin afin qu'elle puisse être exportée
		
		
		// Indispensable pour le calcul du nombre de pièces remises
		dw_liste.groupcalc()
		
		close(w_patience)
		
		
//		if dw_liste.rowcount() > 0 then
//			em_nb.text = string(dw_liste.getitemnumber(dw_liste.rowcount(),"compte"))+" Règlements"
//			em_nb.visible = true
//		end if
	end if
end if

end subroutine

event open;call super::open;em_date_min.setDate(today())
em_date_max.setDate(today())
em_date_min.setDate(date(year(today()),1,1))
em_date_max.setDate(date(year(today()),12,31))

em_date_debut.setDate(date(year(today()) + 1,1,1))
em_date_fin.setDate(date(year(today()) + 1,12,31))


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
	end if
end if

uo_filtre_email.visible = true
uo_filtre_email.liste_avec_groupe = true
uo_filtre_email.dw_liste = dw_liste
uo_filtre_email.em_statut_mere = em_nb



 
end event

on w_liste_patients_reglement_enbanque.create
int iCurrent
call super::create
this.cb_exporter=create cb_exporter
this.st_2=create st_2
this.st_3=create st_3
this.st_5=create st_5
this.st_6=create st_6
this.st_7=create st_7
this.em_date_min=create em_date_min
this.em_date_max=create em_date_max
this.em_date_debut=create em_date_debut
this.em_date_fin=create em_date_fin
this.st_1=create st_1
this.cbx_detail=create cbx_detail
this.uo_filtre_email=create uo_filtre_email
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_exporter
this.Control[iCurrent+2]=this.st_2
this.Control[iCurrent+3]=this.st_3
this.Control[iCurrent+4]=this.st_5
this.Control[iCurrent+5]=this.st_6
this.Control[iCurrent+6]=this.st_7
this.Control[iCurrent+7]=this.em_date_min
this.Control[iCurrent+8]=this.em_date_max
this.Control[iCurrent+9]=this.em_date_debut
this.Control[iCurrent+10]=this.em_date_fin
this.Control[iCurrent+11]=this.st_1
this.Control[iCurrent+12]=this.cbx_detail
this.Control[iCurrent+13]=this.uo_filtre_email
end on

on w_liste_patients_reglement_enbanque.destroy
call super::destroy
destroy(this.cb_exporter)
destroy(this.st_2)
destroy(this.st_3)
destroy(this.st_5)
destroy(this.st_6)
destroy(this.st_7)
destroy(this.em_date_min)
destroy(this.em_date_max)
destroy(this.em_date_debut)
destroy(this.em_date_fin)
destroy(this.st_1)
destroy(this.cbx_detail)
destroy(this.uo_filtre_email)
end on

type p_fond from w_liste_patients`p_fond within w_liste_patients_reglement_enbanque
end type

type cb_imprimer from w_liste_patients`cb_imprimer within w_liste_patients_reglement_enbanque
integer x = 2254
integer taborder = 120
end type

event cb_imprimer::clicked;
// On enlève le bouton à l'impression
dw_liste.modify("b_detail.visible = 0")
dw_liste.print()
dw_liste.modify("b_detail.visible = 1")


end event

type cb_autre from w_liste_patients`cb_autre within w_liste_patients_reglement_enbanque
integer x = 1760
end type

event cb_autre::clicked;call super::clicked;

st_min.visible = false
st_max.visible = false
em_min.visible = false
em_max.visible = false

cb_exporter.enabled ( false)
end event

type cb_fermer from w_liste_patients`cb_fermer within w_liste_patients_reglement_enbanque
integer x = 3241
integer taborder = 130
end type

type cb_ecran from w_liste_patients`cb_ecran within w_liste_patients_reglement_enbanque
integer x = 503
integer taborder = 140
end type

event cb_ecran::clicked;call super::clicked;cb_exporter.enabled ( true)
end event

type cb_lien_word from w_liste_patients`cb_lien_word within w_liste_patients_reglement_enbanque
integer x = 3232
integer y = 1720
end type

type uo_size from w_liste_patients`uo_size within w_liste_patients_reglement_enbanque
end type

type rb_un from w_liste_patients`rb_un within w_liste_patients_reglement_enbanque
end type

type rb_tous from w_liste_patients`rb_tous within w_liste_patients_reglement_enbanque
end type

type em_nb from w_liste_patients`em_nb within w_liste_patients_reglement_enbanque
integer taborder = 80
end type

type em_max from w_liste_patients`em_max within w_liste_patients_reglement_enbanque
boolean visible = false
integer y = 616
end type

type em_min from w_liste_patients`em_min within w_liste_patients_reglement_enbanque
boolean visible = false
end type

type dw_1 from w_liste_patients`dw_1 within w_liste_patients_reglement_enbanque
end type

type gb_1 from w_liste_patients`gb_1 within w_liste_patients_reglement_enbanque
integer taborder = 40
end type

type dw_prati from w_liste_patients`dw_prati within w_liste_patients_reglement_enbanque
integer taborder = 100
end type

type cbx_filtre from w_liste_patients`cbx_filtre within w_liste_patients_reglement_enbanque
end type

type st_min from w_liste_patients`st_min within w_liste_patients_reglement_enbanque
boolean visible = false
end type

type st_max from w_liste_patients`st_max within w_liste_patients_reglement_enbanque
boolean visible = false
end type

type dw_liste from w_liste_patients`dw_liste within w_liste_patients_reglement_enbanque
integer y = 0
integer taborder = 90
string dataobject = "dw_liste_patients_reglement_enbanque"
end type

event dw_liste::buttonclicked;call super::buttonclicked;// Détail du règlement

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

type cb_exporter from uo_picturebutton_390x120 within w_liste_patients_reglement_enbanque
integer x = 2747
integer y = 1868
integer width = 457
integer taborder = 100
boolean bringtotop = true
boolean enabled = false
string text = "&Exporter"
string iconname = "ACTIONS_Exporter.png"
end type

event clicked;call super::clicked;
//Export libre
dw_liste.saveAs()

end event

type st_2 from statictext within w_liste_patients_reglement_enbanque
integer x = 480
integer y = 656
integer width = 247
integer height = 72
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
string facename = "Arial"
long backcolor = 553648127
string text = "Entre le"
end type

type st_3 from statictext within w_liste_patients_reglement_enbanque
integer x = 1326
integer y = 656
integer width = 247
integer height = 72
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
string facename = "Arial"
long backcolor = 553648127
string text = "Et le"
end type

type st_5 from statictext within w_liste_patients_reglement_enbanque
integer x = 485
integer y = 964
integer width = 247
integer height = 72
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
string facename = "Arial"
long backcolor = 553648127
string text = "Entre le"
end type

type st_6 from statictext within w_liste_patients_reglement_enbanque
integer x = 1330
integer y = 964
integer width = 247
integer height = 72
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
string facename = "Arial"
long backcolor = 553648127
string text = "Et le"
end type

type st_7 from statictext within w_liste_patients_reglement_enbanque
integer x = 352
integer y = 860
integer width = 846
integer height = 64
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
string facename = "Arial"
boolean underline = true
long backcolor = 553648127
string text = "Règlements mis en Banque :"
end type

type em_date_min from uo_date_calendrier within w_liste_patients_reglement_enbanque
integer x = 818
integer y = 636
integer taborder = 260
end type

on em_date_min.destroy
call uo_date_calendrier::destroy
end on

type em_date_max from uo_date_calendrier within w_liste_patients_reglement_enbanque
integer x = 1623
integer y = 636
integer taborder = 270
end type

on em_date_max.destroy
call uo_date_calendrier::destroy
end on

type em_date_debut from uo_date_calendrier within w_liste_patients_reglement_enbanque
integer x = 818
integer y = 960
integer taborder = 270
end type

on em_date_debut.destroy
call uo_date_calendrier::destroy
end on

type em_date_fin from uo_date_calendrier within w_liste_patients_reglement_enbanque
integer x = 1623
integer y = 960
integer taborder = 280
end type

on em_date_fin.destroy
call uo_date_calendrier::destroy
end on

type st_1 from statictext within w_liste_patients_reglement_enbanque
integer x = 347
integer y = 536
integer width = 704
integer height = 64
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
string facename = "Arial"
boolean underline = true
long backcolor = 553648127
string text = "Règlements reçus :"
end type

type cbx_detail from checkbox within w_liste_patients_reglement_enbanque
integer x = 425
integer y = 1180
integer width = 690
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 553648127
string text = "Avec détail des soins"
end type

type uo_filtre_email from uo_filtre_emails within w_liste_patients_reglement_enbanque
string tag = "no resize all"
boolean visible = false
integer x = 997
integer y = 1860
integer taborder = 190
boolean bringtotop = true
end type

on uo_filtre_email.destroy
call uo_filtre_emails::destroy
end on

