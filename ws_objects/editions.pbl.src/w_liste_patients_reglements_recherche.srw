$PBExportHeader$w_liste_patients_reglements_recherche.srw
$PBExportComments$Héritée de liste_patients
forward
global type w_liste_patients_reglements_recherche from w_liste_patients
end type
type st_1 from statictext within w_liste_patients_reglements_recherche
end type
type st_2 from statictext within w_liste_patients_reglements_recherche
end type
type st_3 from statictext within w_liste_patients_reglements_recherche
end type
type st_4 from statictext within w_liste_patients_reglements_recherche
end type
type st_5 from statictext within w_liste_patients_reglements_recherche
end type
type sle_payeur from singlelineedit within w_liste_patients_reglements_recherche
end type
type sle_commentaire from singlelineedit within w_liste_patients_reglements_recherche
end type
type st_6 from statictext within w_liste_patients_reglements_recherche
end type
type st_7 from statictext within w_liste_patients_reglements_recherche
end type
type em_date_min from uo_date_calendrier within w_liste_patients_reglements_recherche
end type
type em_date_max from uo_date_calendrier within w_liste_patients_reglements_recherche
end type
end forward

global type w_liste_patients_reglements_recherche from w_liste_patients
string title = "Liste des Règlements par payeur et/ou commentaire"
st_1 st_1
st_2 st_2
st_3 st_3
st_4 st_4
st_5 st_5
sle_payeur sle_payeur
sle_commentaire sle_commentaire
st_6 st_6
st_7 st_7
em_date_min em_date_min
em_date_max em_date_max
end type
global w_liste_patients_reglements_recherche w_liste_patients_reglements_recherche

forward prototypes
public subroutine prepa ()
end prototypes

public subroutine prepa ();string var_reg,tit
string pra_min, pra_max
double code_min,code_max
date date_min,date_max
string var_payeur,var_commentaire


if not prepa_faite then
	
		date_min = date(em_date_min.text)
		date_max = date(em_date_max.text)


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

		ok_mdp = true

	if date_min <= relativedate(today(), - fxg_get_delai_mdp_financier(pra_min)) then
	
	
	var_payeur = sle_payeur.text
	var_commentaire = sle_commentaire.text
	
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

		var_payeur = sle_payeur.text
		var_commentaire = sle_commentaire.text

		open(w_patience)
		tit = "Entre le "+em_date_min.text+" et le "+em_date_max.text+" - Payeur : "+var_payeur + " - Commentaire : "+var_commentaire 
		dw_liste.Modify("titre.text = '"+tit+"'")
		dw_liste.retrieve(code_min,code_max,pra_min, pra_max,date_min,date_max,var_payeur,var_commentaire)
		close(w_patience)
		//em_nb.text = string(dw_liste.rowcount())+" Règlements"
		//em_nb.visible = true
	end if
end if

end subroutine

event open;call super::open;em_date_min.setDate(date(year(today()), 1, 1 ))
em_date_max.setDate(today())

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
end event

on w_liste_patients_reglements_recherche.create
int iCurrent
call super::create
this.st_1=create st_1
this.st_2=create st_2
this.st_3=create st_3
this.st_4=create st_4
this.st_5=create st_5
this.sle_payeur=create sle_payeur
this.sle_commentaire=create sle_commentaire
this.st_6=create st_6
this.st_7=create st_7
this.em_date_min=create em_date_min
this.em_date_max=create em_date_max
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.st_1
this.Control[iCurrent+2]=this.st_2
this.Control[iCurrent+3]=this.st_3
this.Control[iCurrent+4]=this.st_4
this.Control[iCurrent+5]=this.st_5
this.Control[iCurrent+6]=this.sle_payeur
this.Control[iCurrent+7]=this.sle_commentaire
this.Control[iCurrent+8]=this.st_6
this.Control[iCurrent+9]=this.st_7
this.Control[iCurrent+10]=this.em_date_min
this.Control[iCurrent+11]=this.em_date_max
end on

on w_liste_patients_reglements_recherche.destroy
call super::destroy
destroy(this.st_1)
destroy(this.st_2)
destroy(this.st_3)
destroy(this.st_4)
destroy(this.st_5)
destroy(this.sle_payeur)
destroy(this.sle_commentaire)
destroy(this.st_6)
destroy(this.st_7)
destroy(this.em_date_min)
destroy(this.em_date_max)
end on

type p_fond from w_liste_patients`p_fond within w_liste_patients_reglements_recherche
end type

type cb_imprimer from w_liste_patients`cb_imprimer within w_liste_patients_reglements_recherche
integer taborder = 130
end type

event cb_imprimer::clicked;// On enlève le bouton à l'impression
dw_liste.modify("b_detail.visible = 0")
dw_liste.print()
dw_liste.modify("b_detail.visible = 1")

end event

type cb_autre from w_liste_patients`cb_autre within w_liste_patients_reglements_recherche
integer taborder = 120
end type

event cb_autre::clicked;call super::clicked;

st_min.visible = false
st_max.visible = false
em_min.visible = false
em_max.visible = false

end event

type cb_fermer from w_liste_patients`cb_fermer within w_liste_patients_reglements_recherche
integer taborder = 140
end type

type cb_ecran from w_liste_patients`cb_ecran within w_liste_patients_reglements_recherche
integer taborder = 150
end type

type cb_lien_word from w_liste_patients`cb_lien_word within w_liste_patients_reglements_recherche
end type

type uo_size from w_liste_patients`uo_size within w_liste_patients_reglements_recherche
end type

type rb_un from w_liste_patients`rb_un within w_liste_patients_reglements_recherche
end type

type rb_tous from w_liste_patients`rb_tous within w_liste_patients_reglements_recherche
end type

type em_nb from w_liste_patients`em_nb within w_liste_patients_reglements_recherche
integer taborder = 90
end type

type em_max from w_liste_patients`em_max within w_liste_patients_reglements_recherche
boolean visible = false
integer y = 616
integer taborder = 40
end type

type em_min from w_liste_patients`em_min within w_liste_patients_reglements_recherche
boolean visible = false
end type

type dw_1 from w_liste_patients`dw_1 within w_liste_patients_reglements_recherche
end type

type gb_1 from w_liste_patients`gb_1 within w_liste_patients_reglements_recherche
integer taborder = 80
end type

type dw_prati from w_liste_patients`dw_prati within w_liste_patients_reglements_recherche
integer taborder = 110
end type

type cbx_filtre from w_liste_patients`cbx_filtre within w_liste_patients_reglements_recherche
end type

type st_min from w_liste_patients`st_min within w_liste_patients_reglements_recherche
boolean visible = false
end type

type st_max from w_liste_patients`st_max within w_liste_patients_reglements_recherche
boolean visible = false
end type

type dw_liste from w_liste_patients`dw_liste within w_liste_patients_reglements_recherche
integer y = 0
integer taborder = 100
string dataobject = "dw_liste_patients_reglements_recherche"
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

type st_1 from statictext within w_liste_patients_reglements_recherche
integer x = 347
integer y = 628
integer width = 704
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
string facename = "Arial"
boolean underline = true
long backcolor = 553648127
string text = "Règlements reçus :"
end type

type st_2 from statictext within w_liste_patients_reglements_recherche
integer x = 480
integer y = 748
integer width = 247
integer height = 72
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
string facename = "Arial"
long backcolor = 553648127
string text = "Entre le"
end type

type st_3 from statictext within w_liste_patients_reglements_recherche
integer x = 1458
integer y = 748
integer width = 247
integer height = 72
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
string facename = "Arial"
long backcolor = 553648127
string text = "Et le"
end type

type st_4 from statictext within w_liste_patients_reglements_recherche
integer x = 480
integer y = 956
integer width = 288
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
string facename = "Arial"
long backcolor = 553648127
string text = "Payeur :"
end type

type st_5 from statictext within w_liste_patients_reglements_recherche
integer x = 480
integer y = 1156
integer width = 453
integer height = 76
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
string facename = "Arial"
long backcolor = 553648127
string text = "Commentaire :"
end type

type sle_payeur from singlelineedit within w_liste_patients_reglements_recherche
integer x = 768
integer y = 944
integer width = 1403
integer height = 92
integer taborder = 60
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
string text = "%"
integer limit = 40
borderstyle borderstyle = stylelowered!
end type

type sle_commentaire from singlelineedit within w_liste_patients_reglements_recherche
integer x = 946
integer y = 1148
integer width = 1403
integer height = 92
integer taborder = 70
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
string text = "%"
integer limit = 40
borderstyle borderstyle = stylelowered!
end type

type st_6 from statictext within w_liste_patients_reglements_recherche
integer x = 768
integer y = 1040
integer width = 1659
integer height = 64
boolean bringtotop = true
integer textsize = -8
fontcharset fontcharset = ansi!
string facename = "Arial"
boolean italic = true
long textcolor = 16711680
long backcolor = 553648127
string text = "Vous pouvez utiliser le caractère % comme générique (y compris à la fin)"
end type

type st_7 from statictext within w_liste_patients_reglements_recherche
integer x = 951
integer y = 1240
integer width = 1659
integer height = 64
boolean bringtotop = true
integer textsize = -8
fontcharset fontcharset = ansi!
string facename = "Arial"
boolean italic = true
long textcolor = 16711680
long backcolor = 553648127
string text = "Vous pouvez utiliser le caractère % comme générique (y compris à la fin)"
end type

type em_date_min from uo_date_calendrier within w_liste_patients_reglements_recherche
integer x = 960
integer y = 732
integer taborder = 270
boolean bringtotop = true
end type

on em_date_min.destroy
call uo_date_calendrier::destroy
end on

type em_date_max from uo_date_calendrier within w_liste_patients_reglements_recherche
integer x = 1765
integer y = 732
integer taborder = 280
boolean bringtotop = true
end type

on em_date_max.destroy
call uo_date_calendrier::destroy
end on

