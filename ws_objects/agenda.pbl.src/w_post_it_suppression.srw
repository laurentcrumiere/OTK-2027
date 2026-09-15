$PBExportHeader$w_post_it_suppression.srw
forward
global type w_post_it_suppression from w_liste_patients
end type
type st_23 from statictext within w_post_it_suppression
end type
type st_33 from statictext within w_post_it_suppression
end type
type st_22 from statictext within w_post_it_suppression
end type
type em_modif_min from uo_date_calendrier within w_post_it_suppression
end type
type em_modif_max from uo_date_calendrier within w_post_it_suppression
end type
type cb_annuler from uo_picturebutton_390x120 within w_post_it_suppression
end type
end forward

global type w_post_it_suppression from w_liste_patients
integer width = 2811
integer height = 1440
string title = "Suppression de Post-it entre 2 dates"
boolean minbox = false
boolean maxbox = false
boolean resizable = false
windowtype windowtype = response!
boolean center = true
st_23 st_23
st_33 st_33
st_22 st_22
em_modif_min em_modif_min
em_modif_max em_modif_max
cb_annuler cb_annuler
end type
global w_post_it_suppression w_post_it_suppression

type variables
string pra_min,pra_max

date date_min,date_max
end variables

forward prototypes
public subroutine prepa ()
end prototypes

public subroutine prepa ();


if not prepa_faite then
	//prepa_faite = true
	if rb_tous.checked then
		pra_min="      "
		pra_max="ZZZZZZ"

	else
		pra_min=dw_prati.getitemstring(dw_prati.getrow(),"code")
		pra_max=dw_prati.getitemstring(dw_prati.getrow(),"code")
	end if

	date_min = em_modif_min.getTheDate()
	date_max = em_modif_max.getTheDate()



	open(w_patience)

	dw_liste.retrieve(pra_min,pra_max,date_min,date_max)
	close(w_patience)

	//em_nb.text = string(dw_liste.rowcount())+" Rendez-vous"
	//em_nb.visible = true


end if

end subroutine

event open;call super::open;
em_modif_min.SetDate(  today() )
em_modif_max.SetDate( date(string(year(today())) + "-12-31" ))











end event

on w_post_it_suppression.create
int iCurrent
call super::create
this.st_23=create st_23
this.st_33=create st_33
this.st_22=create st_22
this.em_modif_min=create em_modif_min
this.em_modif_max=create em_modif_max
this.cb_annuler=create cb_annuler
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.st_23
this.Control[iCurrent+2]=this.st_33
this.Control[iCurrent+3]=this.st_22
this.Control[iCurrent+4]=this.em_modif_min
this.Control[iCurrent+5]=this.em_modif_max
this.Control[iCurrent+6]=this.cb_annuler
end on

on w_post_it_suppression.destroy
call super::destroy
destroy(this.st_23)
destroy(this.st_33)
destroy(this.st_22)
destroy(this.em_modif_min)
destroy(this.em_modif_max)
destroy(this.cb_annuler)
end on

type p_fond from w_liste_patients`p_fond within w_post_it_suppression
end type

type cb_imprimer from w_liste_patients`cb_imprimer within w_post_it_suppression
boolean visible = false
integer x = 2085
end type

type cb_autre from w_liste_patients`cb_autre within w_post_it_suppression
boolean visible = false
integer x = 1609
integer taborder = 120
end type

type cb_fermer from w_liste_patients`cb_fermer within w_post_it_suppression
boolean visible = false
integer x = 297
integer y = 1168
integer taborder = 130
end type

type cb_ecran from w_liste_patients`cb_ecran within w_post_it_suppression
integer x = 1467
integer y = 1000
integer width = 530
integer taborder = 140
string text = "&Rechercher"
end type

event cb_ecran::clicked;long tot, lig

prepa()

tot = dw_liste.rowcount() 

//composant_visible_selon_tag(parent , "a masquer", false)// le retrieve est fait par la fonction prépa() et le script ancetre

if tot > 0 then 
	
	if Messagebox("ATTENTION", string(tot) + " post-it trouvé(s) dans cette période.~n~nConfirmez-vous la suppression ?", Question!, YesNo!, 2) = 1  then 
		
		delete from rdv_post_it where code_praticien between :pra_min and :pra_max and "date" between :date_min and :date_max ;
		
		if sqlca.sqlcode = 0 then 
			commit ;
			Messagebox("INFORMATION", "Suppression effectuée avec succès !")
		else
			Messagebox("ATTENTION", "Erreur dans la suppresion du/des post-it :~n~n" + sqlca.sqlerrtext )
			rollback ;
		end if
		// pour fermer la fenêtre appelante
		closewithreturn(parent, 1)
	else
		// pour ne pas fermer la fenêtre appelante
		closewithreturn(parent, 0)
	end if

	
else
	
	Messagebox("ATTENTION", "Aucun post-it n'a été trouvé dans cette période !")
	// pour ne pas fermer la fenêtre appelante
	closewithreturn(parent , 0)
	
end if
end event

type cb_lien_word from w_liste_patients`cb_lien_word within w_post_it_suppression
end type

type uo_size from w_liste_patients`uo_size within w_post_it_suppression
integer taborder = 40
end type

type rb_un from w_liste_patients`rb_un within w_post_it_suppression
integer x = 375
end type

type rb_tous from w_liste_patients`rb_tous within w_post_it_suppression
integer x = 375
end type

type em_nb from w_liste_patients`em_nb within w_post_it_suppression
integer taborder = 70
end type

type em_max from w_liste_patients`em_max within w_post_it_suppression
string tag = ""
boolean visible = false
integer taborder = 50
end type

type em_min from w_liste_patients`em_min within w_post_it_suppression
string tag = ""
boolean visible = false
integer taborder = 20
end type

type dw_1 from w_liste_patients`dw_1 within w_post_it_suppression
integer taborder = 60
end type

type gb_1 from w_liste_patients`gb_1 within w_post_it_suppression
integer taborder = 10
end type

type dw_prati from w_liste_patients`dw_prati within w_post_it_suppression
integer taborder = 100
end type

type cbx_filtre from w_liste_patients`cbx_filtre within w_post_it_suppression
boolean enabled = false
end type

type st_min from w_liste_patients`st_min within w_post_it_suppression
boolean visible = false
end type

type st_max from w_liste_patients`st_max within w_post_it_suppression
boolean visible = false
end type

type dw_liste from w_liste_patients`dw_liste within w_post_it_suppression
integer x = 315
integer y = 64
integer width = 2354
integer height = 1200
integer taborder = 90
string dataobject = "dw_liste_post_it"
end type

event dw_liste::rbuttondown;

//
end event

event dw_liste::doubleclicked;
if row > 0 then 
	// Ouverture de l'agenda à la semaine du post it
	
	boolean agenda_ok = true
	w_agenda w_agenda_ouvert
	
	ouvrir_agenda_normal()
	
	// positionnement sur la bonne date
	if isvalid(w_agenda) then
		w_agenda_ouvert = w_agenda
	else
		if  isvalid(w_agenda_a_part) then
			w_agenda_ouvert = w_agenda_a_part
		else
			agenda_ok = false
		end if
	end if
	
	if agenda_ok then 
		
		// date de l'agenda
		date date_actuel
		time time_actuel
		 
		w_agenda_ouvert.cal.getvalue(date_actuel, time_actuel)
	
		date date_post_it
		long ecart
		
		date_post_it = getitemdate(row, "rdv_post_it_date")
		
		ecart = daysafter(date_actuel, date_post_it )
		
		w_agenda_ouvert.changer_date(ecart)
		
	else
		
		Messagebox("ATTENTION", "Impossible d'ouvrir l'agenda !")
		
	end if
end if




end event

type st_23 from statictext within w_post_it_suppression
integer x = 334
integer y = 548
integer width = 969
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
string facename = "Arial"
boolean underline = true
long backcolor = 553648127
string text = "Période :"
end type

type st_33 from statictext within w_post_it_suppression
integer x = 462
integer y = 732
integer width = 256
integer height = 72
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
string facename = "Arial"
long backcolor = 553648127
string text = "Entre le "
end type

type st_22 from statictext within w_post_it_suppression
integer x = 1545
integer y = 732
integer width = 155
integer height = 76
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
string facename = "Arial"
long backcolor = 553648127
string text = "Et le"
alignment alignment = center!
end type

type em_modif_min from uo_date_calendrier within w_post_it_suppression
event destroy ( )
integer x = 745
integer y = 724
integer taborder = 180
boolean bringtotop = true
end type

on em_modif_min.destroy
call uo_date_calendrier::destroy
end on

type em_modif_max from uo_date_calendrier within w_post_it_suppression
event destroy ( )
integer x = 1728
integer y = 724
integer taborder = 190
boolean bringtotop = true
end type

on em_modif_max.destroy
call uo_date_calendrier::destroy
end on

type cb_annuler from uo_picturebutton_390x120 within w_post_it_suppression
integer x = 777
integer y = 996
integer width = 530
integer taborder = 30
boolean bringtotop = true
string text = "&Annuler"
string iconname = "ACTIONS_abandonner.png"
end type

event clicked;call super::clicked;closewithreturn(parent,0)

end event

