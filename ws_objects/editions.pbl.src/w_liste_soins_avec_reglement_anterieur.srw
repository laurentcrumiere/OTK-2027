$PBExportHeader$w_liste_soins_avec_reglement_anterieur.srw
$PBExportComments$Héritée de liste_patients
forward
global type w_liste_soins_avec_reglement_anterieur from w_liste_patients
end type
type st_1 from statictext within w_liste_soins_avec_reglement_anterieur
end type
type st_2 from statictext within w_liste_soins_avec_reglement_anterieur
end type
type st_3 from statictext within w_liste_soins_avec_reglement_anterieur
end type
type em_date_min from uo_date_calendrier within w_liste_soins_avec_reglement_anterieur
end type
type em_date_max from uo_date_calendrier within w_liste_soins_avec_reglement_anterieur
end type
type st_4 from statictext within w_liste_soins_avec_reglement_anterieur
end type
type em_jours from editmask within w_liste_soins_avec_reglement_anterieur
end type
end forward

global type w_liste_soins_avec_reglement_anterieur from w_liste_patients
string title = "Liste des Soins avec un règlement antérieur"
st_1 st_1
st_2 st_2
st_3 st_3
em_date_min em_date_min
em_date_max em_date_max
st_4 st_4
em_jours em_jours
end type
global w_liste_soins_avec_reglement_anterieur w_liste_soins_avec_reglement_anterieur

forward prototypes
public subroutine prepa ()
end prototypes

public subroutine prepa ();string pra_min,pra_max,tit, p
double code_min,code_max, v_montant
date date_min,date_max
double v_jours_ecart

if not prepa_faite then
	
	
	

	if rb_tous.checked then
		pra_min="      "
		pra_max="ZZZZZZ"
		tit = "Pour tous les praticiens"
	else
		pra_min=dw_prati.getitemstring(dw_prati.getrow(),"code")
		pra_max=pra_min
		SELECT nom INTO :p FROM prati WHERE code = :pra_min ;
		tit = "Pour le Dr "+p
	end if
	
	ok_mdp = false
	
		
	 SELECT "prati"."pasfin"   INTO :pasfin  		 FROM "prati"  
		WHERE ( "prati"."code" = :pra_min ) ;

		guo_fenetre_modale.wf_ouvrir(w_mot_passe_financier)

	if ok_mdp then
	
		code_min = double(em_min.text)
		code_max = double(em_max.text)
	
		date_min = date(em_date_min.text)
		date_max = date(em_date_max.text)
		
		v_jours_ecart = double(em_jours.text)

		tit = tit + " - Entre le "+em_date_min.text+" et le "+em_date_max.text
		
		open(w_patience)
		dw_liste.Modify("titre.text = '"+tit+"'")
		dw_liste.retrieve(code_min,code_max,date_min,date_max, v_jours_ecart)

		if rb_un.checked then
			dw_liste.SetFilter("code_praticien_reel = '"+pra_min+"'") 
		else
			// Aucun filtre
			dw_liste.SetFilter("") 
		end if
		dw_liste.Filter() 
		
		close(w_patience)
	
//		em_nb.text = string(dw_liste.rowcount())+" Soins"
//		em_nb.visible = true
	
		//prepa_faite = true

	end if
end if

end subroutine

event open;call super::open;em_date_min.setDate(date(year(today()),1,1))
em_date_max.setdate(today())
em_min.text = string(min)


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

on w_liste_soins_avec_reglement_anterieur.create
int iCurrent
call super::create
this.st_1=create st_1
this.st_2=create st_2
this.st_3=create st_3
this.em_date_min=create em_date_min
this.em_date_max=create em_date_max
this.st_4=create st_4
this.em_jours=create em_jours
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.st_1
this.Control[iCurrent+2]=this.st_2
this.Control[iCurrent+3]=this.st_3
this.Control[iCurrent+4]=this.em_date_min
this.Control[iCurrent+5]=this.em_date_max
this.Control[iCurrent+6]=this.st_4
this.Control[iCurrent+7]=this.em_jours
end on

on w_liste_soins_avec_reglement_anterieur.destroy
call super::destroy
destroy(this.st_1)
destroy(this.st_2)
destroy(this.st_3)
destroy(this.em_date_min)
destroy(this.em_date_max)
destroy(this.st_4)
destroy(this.em_jours)
end on

type p_fond from w_liste_patients`p_fond within w_liste_soins_avec_reglement_anterieur
end type

type cb_imprimer from w_liste_patients`cb_imprimer within w_liste_soins_avec_reglement_anterieur
integer taborder = 100
end type

type cb_autre from w_liste_patients`cb_autre within w_liste_soins_avec_reglement_anterieur
end type

type cb_fermer from w_liste_patients`cb_fermer within w_liste_soins_avec_reglement_anterieur
integer taborder = 110
end type

type cb_ecran from w_liste_patients`cb_ecran within w_liste_soins_avec_reglement_anterieur
end type

type cb_lien_word from w_liste_patients`cb_lien_word within w_liste_soins_avec_reglement_anterieur
end type

type uo_size from w_liste_patients`uo_size within w_liste_soins_avec_reglement_anterieur
end type

type rb_un from w_liste_patients`rb_un within w_liste_soins_avec_reglement_anterieur
integer x = 485
integer y = 216
boolean checked = true
end type

type rb_tous from w_liste_patients`rb_tous within w_liste_soins_avec_reglement_anterieur
integer x = 485
integer y = 120
boolean checked = false
end type

type em_nb from w_liste_patients`em_nb within w_liste_soins_avec_reglement_anterieur
integer taborder = 60
end type

type em_max from w_liste_patients`em_max within w_liste_soins_avec_reglement_anterieur
integer y = 492
end type

type em_min from w_liste_patients`em_min within w_liste_soins_avec_reglement_anterieur
integer y = 492
end type

type dw_1 from w_liste_patients`dw_1 within w_liste_soins_avec_reglement_anterieur
end type

type gb_1 from w_liste_patients`gb_1 within w_liste_soins_avec_reglement_anterieur
integer x = 320
integer y = 40
integer taborder = 0
end type

type dw_prati from w_liste_patients`dw_prati within w_liste_soins_avec_reglement_anterieur
boolean visible = true
integer x = 1243
integer y = 200
integer taborder = 80
end type

type cbx_filtre from w_liste_patients`cbx_filtre within w_liste_soins_avec_reglement_anterieur
end type

type st_min from w_liste_patients`st_min within w_liste_soins_avec_reglement_anterieur
integer y = 504
end type

type st_max from w_liste_patients`st_max within w_liste_soins_avec_reglement_anterieur
integer y = 504
end type

type dw_liste from w_liste_patients`dw_liste within w_liste_soins_avec_reglement_anterieur
integer y = 4
integer taborder = 70
string dataobject = "dw_liste_soins_avec_reglement_anterieur"
end type

type st_1 from statictext within w_liste_soins_avec_reglement_anterieur
integer x = 347
integer y = 764
integer width = 878
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
string facename = "Arial"
boolean underline = true
long backcolor = 553648127
boolean enabled = false
string text = "Date des soins (demande) :"
boolean focusrectangle = false
end type

type st_2 from statictext within w_liste_soins_avec_reglement_anterieur
integer x = 1317
integer y = 888
integer width = 247
integer height = 72
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
string facename = "Arial"
long backcolor = 553648127
boolean enabled = false
string text = "Et le"
alignment alignment = center!
boolean focusrectangle = false
end type

type st_3 from statictext within w_liste_soins_avec_reglement_anterieur
integer x = 475
integer y = 888
integer width = 256
integer height = 72
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
string facename = "Arial"
long backcolor = 553648127
boolean enabled = false
string text = "Entre le "
boolean focusrectangle = false
end type

type em_date_min from uo_date_calendrier within w_liste_soins_avec_reglement_anterieur
string tag = "a masquer no resizeall"
integer x = 850
integer y = 876
integer taborder = 260
boolean bringtotop = true
end type

on em_date_min.destroy
call uo_date_calendrier::destroy
end on

type em_date_max from uo_date_calendrier within w_liste_soins_avec_reglement_anterieur
string tag = "a masquer no resizeall"
integer x = 1664
integer y = 876
integer taborder = 270
boolean bringtotop = true
end type

on em_date_max.destroy
call uo_date_calendrier::destroy
end on

type st_4 from statictext within w_liste_soins_avec_reglement_anterieur
integer x = 475
integer y = 1136
integer width = 763
integer height = 72
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
string facename = "Arial"
long backcolor = 553648127
boolean enabled = false
string text = "Nombre de jours d~'écart : "
boolean focusrectangle = false
end type

type em_jours from editmask within w_liste_soins_avec_reglement_anterieur
integer x = 1253
integer y = 1112
integer width = 357
integer height = 112
integer taborder = 270
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
string text = "none"
alignment alignment = center!
borderstyle borderstyle = stylelowered!
string mask = "####0"
boolean spin = true
end type

