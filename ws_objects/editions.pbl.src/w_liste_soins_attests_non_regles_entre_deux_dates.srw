$PBExportHeader$w_liste_soins_attests_non_regles_entre_deux_dates.srw
$PBExportComments$Héritée de liste_patients
forward
global type w_liste_soins_attests_non_regles_entre_deux_dates from w_liste_patients
end type
type st_factures from statictext within w_liste_soins_attests_non_regles_entre_deux_dates
end type
type st_2 from statictext within w_liste_soins_attests_non_regles_entre_deux_dates
end type
type st_3 from statictext within w_liste_soins_attests_non_regles_entre_deux_dates
end type
type em_date_min from uo_date_calendrier within w_liste_soins_attests_non_regles_entre_deux_dates
end type
type em_date_max from uo_date_calendrier within w_liste_soins_attests_non_regles_entre_deux_dates
end type
end forward

global type w_liste_soins_attests_non_regles_entre_deux_dates from w_liste_patients
string title = "Liste des Sons non Facturés entre 2 Dates"
st_factures st_factures
st_2 st_2
st_3 st_3
em_date_min em_date_min
em_date_max em_date_max
end type
global w_liste_soins_attests_non_regles_entre_deux_dates w_liste_soins_attests_non_regles_entre_deux_dates

forward prototypes
public subroutine prepa ()
end prototypes

public subroutine prepa ();string pra_min,pra_max,tit, p
double code_min,code_max, v_montant
date date_min,date_max

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
		
		tit = tit + " - Entre le "+em_date_min.text+" et le "+em_date_max.text
		
		
		
		open(w_patience)
		
		dw_liste.Modify("titre.text = '"+tit+"'")
		dw_liste.retrieve(date_min,date_max)
		
		if rb_un.checked then
			dw_liste.SetFilter(" soins_total >  montant_paye  and code_praticien_reel = '"+pra_min+"'") 
		else
			// Aucun filtre
			dw_liste.SetFilter(" soins_total >  montant_paye ") 
		end if
		dw_liste.Filter() 
	
		close(w_patience)
	
		//prepa_faite = true

	end if
end if

end subroutine

event open;call super::open;em_date_min.setDate(date(year(today()),1,1))
em_date_max.setDate(today())


end event

on w_liste_soins_attests_non_regles_entre_deux_dates.create
int iCurrent
call super::create
this.st_factures=create st_factures
this.st_2=create st_2
this.st_3=create st_3
this.em_date_min=create em_date_min
this.em_date_max=create em_date_max
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.st_factures
this.Control[iCurrent+2]=this.st_2
this.Control[iCurrent+3]=this.st_3
this.Control[iCurrent+4]=this.em_date_min
this.Control[iCurrent+5]=this.em_date_max
end on

on w_liste_soins_attests_non_regles_entre_deux_dates.destroy
call super::destroy
destroy(this.st_factures)
destroy(this.st_2)
destroy(this.st_3)
destroy(this.em_date_min)
destroy(this.em_date_max)
end on

type p_fond from w_liste_patients`p_fond within w_liste_soins_attests_non_regles_entre_deux_dates
end type

type cb_imprimer from w_liste_patients`cb_imprimer within w_liste_soins_attests_non_regles_entre_deux_dates
integer taborder = 100
end type

type cb_autre from w_liste_patients`cb_autre within w_liste_soins_attests_non_regles_entre_deux_dates
end type

event cb_autre::clicked;call super::clicked;


st_min.visible = false
st_max.visible = false


end event

type cb_fermer from w_liste_patients`cb_fermer within w_liste_soins_attests_non_regles_entre_deux_dates
integer taborder = 110
end type

type cb_ecran from w_liste_patients`cb_ecran within w_liste_soins_attests_non_regles_entre_deux_dates
end type

type cb_lien_word from w_liste_patients`cb_lien_word within w_liste_soins_attests_non_regles_entre_deux_dates
end type

type uo_size from w_liste_patients`uo_size within w_liste_soins_attests_non_regles_entre_deux_dates
end type

type rb_un from w_liste_patients`rb_un within w_liste_soins_attests_non_regles_entre_deux_dates
integer x = 485
integer y = 216
boolean checked = true
end type

type rb_tous from w_liste_patients`rb_tous within w_liste_soins_attests_non_regles_entre_deux_dates
integer x = 485
integer y = 120
boolean enabled = false
boolean checked = false
end type

type em_nb from w_liste_patients`em_nb within w_liste_soins_attests_non_regles_entre_deux_dates
integer taborder = 60
end type

type em_max from w_liste_patients`em_max within w_liste_soins_attests_non_regles_entre_deux_dates
boolean visible = false
integer y = 412
end type

type em_min from w_liste_patients`em_min within w_liste_soins_attests_non_regles_entre_deux_dates
boolean visible = false
integer y = 412
end type

type dw_1 from w_liste_patients`dw_1 within w_liste_soins_attests_non_regles_entre_deux_dates
end type

type gb_1 from w_liste_patients`gb_1 within w_liste_soins_attests_non_regles_entre_deux_dates
integer x = 320
integer y = 40
integer taborder = 0
end type

type dw_prati from w_liste_patients`dw_prati within w_liste_soins_attests_non_regles_entre_deux_dates
boolean visible = true
integer x = 1243
integer y = 216
integer taborder = 80
end type

type cbx_filtre from w_liste_patients`cbx_filtre within w_liste_soins_attests_non_regles_entre_deux_dates
end type

type st_min from w_liste_patients`st_min within w_liste_soins_attests_non_regles_entre_deux_dates
boolean visible = false
integer y = 424
end type

type st_max from w_liste_patients`st_max within w_liste_soins_attests_non_regles_entre_deux_dates
boolean visible = false
integer y = 424
end type

type dw_liste from w_liste_patients`dw_liste within w_liste_soins_attests_non_regles_entre_deux_dates
integer y = 4
integer taborder = 70
string dataobject = "dw_liste_soins_attestes_non_regles_entre_deux_dates"
end type

type st_factures from statictext within w_liste_soins_attests_non_regles_entre_deux_dates
integer x = 347
integer y = 632
integer width = 1280
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
string facename = "Arial"
long backcolor = 553648127
boolean enabled = false
string text = "Date des soins  :"
boolean focusrectangle = false
end type

type st_2 from statictext within w_liste_soins_attests_non_regles_entre_deux_dates
integer x = 1435
integer y = 756
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

type st_3 from statictext within w_liste_soins_attests_non_regles_entre_deux_dates
integer x = 475
integer y = 756
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

type em_date_min from uo_date_calendrier within w_liste_soins_attests_non_regles_entre_deux_dates
integer x = 905
integer y = 748
integer taborder = 240
boolean bringtotop = true
end type

on em_date_min.destroy
call uo_date_calendrier::destroy
end on

type em_date_max from uo_date_calendrier within w_liste_soins_attests_non_regles_entre_deux_dates
integer x = 1719
integer y = 748
integer taborder = 250
boolean bringtotop = true
end type

on em_date_max.destroy
call uo_date_calendrier::destroy
end on

