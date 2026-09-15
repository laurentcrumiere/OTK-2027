$PBExportHeader$w_liste_post_it.srw
forward
global type w_liste_post_it from w_liste_patients
end type
type st_23 from statictext within w_liste_post_it
end type
type st_33 from statictext within w_liste_post_it
end type
type st_22 from statictext within w_liste_post_it
end type
type em_modif_min from uo_date_calendrier within w_liste_post_it
end type
type em_modif_max from uo_date_calendrier within w_liste_post_it
end type
type uo_filtre_email from uo_filtre_emails within w_liste_post_it
end type
type cb_exporter from uo_picturebutton_390x120 within w_liste_post_it
end type
end forward

global type w_liste_post_it from w_liste_patients
string title = "Liste des Post-it entre 2 dates"
st_23 st_23
st_33 st_33
st_22 st_22
em_modif_min em_modif_min
em_modif_max em_modif_max
uo_filtre_email uo_filtre_email
cb_exporter cb_exporter
end type
global w_liste_post_it w_liste_post_it

forward prototypes
public subroutine prepa ()
end prototypes

public subroutine prepa ();string pra_min,pra_max,typ,tit,p
double code_min,code_max
date date_min,date_max
datetime modif_min, modif_max
string user_min, user_max, n

if not prepa_faite then
	//prepa_faite = true
	if rb_tous.checked then
		pra_min="      "
		pra_max="ZZZZZZ"
		tit = "Pour tous les praticiens"
	else
		pra_min=dw_prati.getitemstring(dw_prati.getrow(),"code")
		pra_max=dw_prati.getitemstring(dw_prati.getrow(),"code")
		SELECT nom INTO :p FROM prati WHERE code = :pra_min ;
		tit = "Pour le Dr "+p
	end if

	date_min = em_modif_min.getTheDate()
	date_max = em_modif_max.getTheDate()

	
	tit = tit + "- Entre le "+em_modif_min.text + " et le " + em_modif_max.text 

	open(w_patience)
	dw_liste.Modify("titre.text = '"+tit+"'")
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

on w_liste_post_it.create
int iCurrent
call super::create
this.st_23=create st_23
this.st_33=create st_33
this.st_22=create st_22
this.em_modif_min=create em_modif_min
this.em_modif_max=create em_modif_max
this.uo_filtre_email=create uo_filtre_email
this.cb_exporter=create cb_exporter
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.st_23
this.Control[iCurrent+2]=this.st_33
this.Control[iCurrent+3]=this.st_22
this.Control[iCurrent+4]=this.em_modif_min
this.Control[iCurrent+5]=this.em_modif_max
this.Control[iCurrent+6]=this.uo_filtre_email
this.Control[iCurrent+7]=this.cb_exporter
end on

on w_liste_post_it.destroy
call super::destroy
destroy(this.st_23)
destroy(this.st_33)
destroy(this.st_22)
destroy(this.em_modif_min)
destroy(this.em_modif_max)
destroy(this.uo_filtre_email)
destroy(this.cb_exporter)
end on

type p_fond from w_liste_patients`p_fond within w_liste_post_it
end type

type cb_imprimer from w_liste_patients`cb_imprimer within w_liste_post_it
integer x = 2085
end type

type cb_autre from w_liste_patients`cb_autre within w_liste_post_it
integer x = 1609
integer taborder = 120
end type

event cb_autre::clicked;call super::clicked;cb_exporter.enabled(false)
end event

type cb_fermer from w_liste_patients`cb_fermer within w_liste_post_it
integer x = 3035
integer taborder = 130
end type

type cb_ecran from w_liste_patients`cb_ecran within w_liste_post_it
integer x = 553
integer taborder = 140
end type

event cb_ecran::clicked;call super::clicked;
cb_exporter.enabled(true)
end event

type cb_lien_word from w_liste_patients`cb_lien_word within w_liste_post_it
end type

type uo_size from w_liste_patients`uo_size within w_liste_post_it
integer taborder = 40
end type

type rb_un from w_liste_patients`rb_un within w_liste_post_it
integer x = 375
end type

type rb_tous from w_liste_patients`rb_tous within w_liste_post_it
integer x = 375
end type

type em_nb from w_liste_patients`em_nb within w_liste_post_it
integer taborder = 70
end type

type em_max from w_liste_patients`em_max within w_liste_post_it
string tag = ""
boolean visible = false
integer taborder = 50
end type

type em_min from w_liste_patients`em_min within w_liste_post_it
string tag = ""
boolean visible = false
integer taborder = 20
end type

type dw_1 from w_liste_patients`dw_1 within w_liste_post_it
integer taborder = 60
end type

type gb_1 from w_liste_patients`gb_1 within w_liste_post_it
integer taborder = 10
end type

type dw_prati from w_liste_patients`dw_prati within w_liste_post_it
integer taborder = 100
end type

type cbx_filtre from w_liste_patients`cbx_filtre within w_liste_post_it
end type

type st_min from w_liste_patients`st_min within w_liste_post_it
boolean visible = false
end type

type st_max from w_liste_patients`st_max within w_liste_post_it
boolean visible = false
end type

type dw_liste from w_liste_patients`dw_liste within w_liste_post_it
integer y = 0
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

type st_23 from statictext within w_liste_post_it
integer x = 347
integer y = 968
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

type st_33 from statictext within w_liste_post_it
integer x = 475
integer y = 1152
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

type st_22 from statictext within w_liste_post_it
integer x = 1559
integer y = 1152
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

type em_modif_min from uo_date_calendrier within w_liste_post_it
event destroy ( )
integer x = 759
integer y = 1144
integer taborder = 180
boolean bringtotop = true
end type

on em_modif_min.destroy
call uo_date_calendrier::destroy
end on

type em_modif_max from uo_date_calendrier within w_liste_post_it
event destroy ( )
integer x = 1742
integer y = 1144
integer taborder = 190
boolean bringtotop = true
end type

on em_modif_max.destroy
call uo_date_calendrier::destroy
end on

type uo_filtre_email from uo_filtre_emails within w_liste_post_it
string tag = "no resize all"
boolean visible = false
integer x = 1029
integer y = 1860
integer taborder = 200
boolean bringtotop = true
end type

on uo_filtre_email.destroy
call uo_filtre_emails::destroy
end on

type cb_exporter from uo_picturebutton_390x120 within w_liste_post_it
integer x = 2560
integer y = 1868
integer width = 457
integer taborder = 80
boolean bringtotop = true
boolean enabled = false
string text = "Exporter"
string iconname = "ACTIONS_Exporter.png"
end type

event clicked;call super::clicked;dw_liste.saveAs()


end event

event rbuttondown;call super::rbuttondown;

	param_win[1] = "P"
	openWithParm(w_exporter_datawindow_excel, dw_liste)
	
	
end event

