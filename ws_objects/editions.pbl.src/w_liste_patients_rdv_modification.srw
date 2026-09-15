$PBExportHeader$w_liste_patients_rdv_modification.srw
$PBExportComments$Héritée de liste_patients
forward
global type w_liste_patients_rdv_modification from w_liste_patients
end type
type st_1 from statictext within w_liste_patients_rdv_modification
end type
type st_2 from statictext within w_liste_patients_rdv_modification
end type
type st_3 from statictext within w_liste_patients_rdv_modification
end type
type st_23 from statictext within w_liste_patients_rdv_modification
end type
type st_33 from statictext within w_liste_patients_rdv_modification
end type
type st_22 from statictext within w_liste_patients_rdv_modification
end type
type em_date_min from uo_date_calendrier within w_liste_patients_rdv_modification
end type
type em_date_max from uo_date_calendrier within w_liste_patients_rdv_modification
end type
type em_modif_min from uo_date_calendrier within w_liste_patients_rdv_modification
end type
type em_modif_max from uo_date_calendrier within w_liste_patients_rdv_modification
end type
type em_heure_modif_min from editmask within w_liste_patients_rdv_modification
end type
type em_heure_modif_max from editmask within w_liste_patients_rdv_modification
end type
type uo_filtre_email from uo_filtre_emails within w_liste_patients_rdv_modification
end type
end forward

global type w_liste_patients_rdv_modification from w_liste_patients
string title = "Liste des Rendez-Vous mis à jour entre 2 dates"
st_1 st_1
st_2 st_2
st_3 st_3
st_23 st_23
st_33 st_33
st_22 st_22
em_date_min em_date_min
em_date_max em_date_max
em_modif_min em_modif_min
em_modif_max em_modif_max
em_heure_modif_min em_heure_modif_min
em_heure_modif_max em_heure_modif_max
uo_filtre_email uo_filtre_email
end type
global w_liste_patients_rdv_modification w_liste_patients_rdv_modification

forward prototypes
public subroutine prepa ()
end prototypes

public subroutine prepa ();string pra_min,pra_max,typ,tit,p
double code_min,code_max
date date_min,date_max
datetime modif_min, modif_max

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

	code_min = double(em_min.text)
	code_max = double(em_max.text)

	date_min = date(em_date_min.text)
	date_max = date(em_date_max.text)

	modif_min = DateTime (em_modif_min.getTheDate(), time(em_heure_modif_min.text))
	modif_max = DateTime (em_modif_max.getTheDate(), time(em_heure_modif_max.text))
	
	tit = tit + " RDV entre le "+em_date_min.text+" et le "+em_date_max.text+" - Mis à jour entre le "+em_modif_min.text+" " +em_heure_modif_min.text+ " et le "+em_modif_max.text+" " + em_heure_modif_max.text

	open(w_patience)
	dw_liste.Modify("titre.text = '"+tit+"'")
	dw_liste.retrieve(code_min,code_max,pra_min,pra_max,date_min,date_max,modif_min,modif_max)
	close(w_patience)

	//em_nb.text = string(dw_liste.rowcount())+" Rendez-vous"
	//em_nb.visible = true


end if

end subroutine

event open;call super::open;em_date_min.setdate(relativedate(today(),1))
em_date_max.setDate(date(year(today()),12,31))

//em_modif_min.SetValue( today() , time('00:00' ))
//em_modif_max.setValue( today() , time('23:59' ))
em_modif_min.SetDate( today())
em_modif_max.SetDate( today())


em_heure_modif_min.text = "00:00"
em_heure_modif_max.text = "23.59"

// on prend les négatifs éventuels
em_min.text = string(min)

uo_filtre_email.dw_liste = dw_liste
uo_filtre_email.em_statut_mere = em_nb



end event

on w_liste_patients_rdv_modification.create
int iCurrent
call super::create
this.st_1=create st_1
this.st_2=create st_2
this.st_3=create st_3
this.st_23=create st_23
this.st_33=create st_33
this.st_22=create st_22
this.em_date_min=create em_date_min
this.em_date_max=create em_date_max
this.em_modif_min=create em_modif_min
this.em_modif_max=create em_modif_max
this.em_heure_modif_min=create em_heure_modif_min
this.em_heure_modif_max=create em_heure_modif_max
this.uo_filtre_email=create uo_filtre_email
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.st_1
this.Control[iCurrent+2]=this.st_2
this.Control[iCurrent+3]=this.st_3
this.Control[iCurrent+4]=this.st_23
this.Control[iCurrent+5]=this.st_33
this.Control[iCurrent+6]=this.st_22
this.Control[iCurrent+7]=this.em_date_min
this.Control[iCurrent+8]=this.em_date_max
this.Control[iCurrent+9]=this.em_modif_min
this.Control[iCurrent+10]=this.em_modif_max
this.Control[iCurrent+11]=this.em_heure_modif_min
this.Control[iCurrent+12]=this.em_heure_modif_max
this.Control[iCurrent+13]=this.uo_filtre_email
end on

on w_liste_patients_rdv_modification.destroy
call super::destroy
destroy(this.st_1)
destroy(this.st_2)
destroy(this.st_3)
destroy(this.st_23)
destroy(this.st_33)
destroy(this.st_22)
destroy(this.em_date_min)
destroy(this.em_date_max)
destroy(this.em_modif_min)
destroy(this.em_modif_max)
destroy(this.em_heure_modif_min)
destroy(this.em_heure_modif_max)
destroy(this.uo_filtre_email)
end on

type p_fond from w_liste_patients`p_fond within w_liste_patients_rdv_modification
end type

type cb_imprimer from w_liste_patients`cb_imprimer within w_liste_patients_rdv_modification
integer x = 2258
end type

type cb_autre from w_liste_patients`cb_autre within w_liste_patients_rdv_modification
integer x = 1760
integer taborder = 120
end type

type cb_fermer from w_liste_patients`cb_fermer within w_liste_patients_rdv_modification
integer x = 2757
integer taborder = 130
end type

type cb_ecran from w_liste_patients`cb_ecran within w_liste_patients_rdv_modification
integer x = 494
integer taborder = 140
end type

type cb_lien_word from w_liste_patients`cb_lien_word within w_liste_patients_rdv_modification
end type

type uo_size from w_liste_patients`uo_size within w_liste_patients_rdv_modification
integer taborder = 40
end type

type rb_un from w_liste_patients`rb_un within w_liste_patients_rdv_modification
end type

type rb_tous from w_liste_patients`rb_tous within w_liste_patients_rdv_modification
end type

type em_nb from w_liste_patients`em_nb within w_liste_patients_rdv_modification
integer x = 18
integer taborder = 70
end type

type em_max from w_liste_patients`em_max within w_liste_patients_rdv_modification
integer taborder = 50
end type

type em_min from w_liste_patients`em_min within w_liste_patients_rdv_modification
integer taborder = 20
end type

type dw_1 from w_liste_patients`dw_1 within w_liste_patients_rdv_modification
integer taborder = 60
end type

type gb_1 from w_liste_patients`gb_1 within w_liste_patients_rdv_modification
integer taborder = 10
end type

type dw_prati from w_liste_patients`dw_prati within w_liste_patients_rdv_modification
integer taborder = 100
end type

type cbx_filtre from w_liste_patients`cbx_filtre within w_liste_patients_rdv_modification
end type

type st_min from w_liste_patients`st_min within w_liste_patients_rdv_modification
end type

type st_max from w_liste_patients`st_max within w_liste_patients_rdv_modification
end type

type dw_liste from w_liste_patients`dw_liste within w_liste_patients_rdv_modification
integer y = 0
integer taborder = 90
string dataobject = "dw_liste_patients_rdv_modification"
end type

type st_1 from statictext within w_liste_patients_rdv_modification
integer x = 347
integer y = 800
integer width = 901
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
string facename = "Arial"
boolean underline = true
long backcolor = 553648127
string text = "Date de rendez-vous :"
end type

type st_2 from statictext within w_liste_patients_rdv_modification
integer x = 1317
integer y = 908
integer width = 247
integer height = 72
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
string facename = "Arial"
long backcolor = 553648127
string text = "Et le"
alignment alignment = center!
end type

type st_3 from statictext within w_liste_patients_rdv_modification
integer x = 475
integer y = 908
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

type st_23 from statictext within w_liste_patients_rdv_modification
integer x = 347
integer y = 1084
integer width = 901
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
string facename = "Arial"
boolean underline = true
long backcolor = 553648127
string text = "Période de modification :"
end type

type st_33 from statictext within w_liste_patients_rdv_modification
integer x = 475
integer y = 1268
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

type st_22 from statictext within w_liste_patients_rdv_modification
integer x = 1559
integer y = 1268
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

type em_date_min from uo_date_calendrier within w_liste_patients_rdv_modification
integer x = 859
integer y = 896
integer taborder = 150
boolean bringtotop = true
end type

on em_date_min.destroy
call uo_date_calendrier::destroy
end on

type em_date_max from uo_date_calendrier within w_liste_patients_rdv_modification
integer x = 1664
integer y = 896
integer taborder = 160
boolean bringtotop = true
end type

on em_date_max.destroy
call uo_date_calendrier::destroy
end on

type em_modif_min from uo_date_calendrier within w_liste_patients_rdv_modification
event destroy ( )
integer x = 759
integer y = 1260
integer taborder = 180
boolean bringtotop = true
end type

on em_modif_min.destroy
call uo_date_calendrier::destroy
end on

type em_modif_max from uo_date_calendrier within w_liste_patients_rdv_modification
event destroy ( )
integer x = 1742
integer y = 1260
integer taborder = 190
boolean bringtotop = true
end type

on em_modif_max.destroy
call uo_date_calendrier::destroy
end on

type em_heure_modif_min from editmask within w_liste_patients_rdv_modification
integer x = 1221
integer y = 1260
integer width = 293
integer height = 92
integer taborder = 181
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
string text = "none"
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = timemask!
string mask = "hh:mm"
boolean spin = true
end type

type em_heure_modif_max from editmask within w_liste_patients_rdv_modification
integer x = 2203
integer y = 1260
integer width = 293
integer height = 92
integer taborder = 191
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
string text = "none"
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = timemask!
string mask = "hh:mm"
boolean spin = true
end type

type uo_filtre_email from uo_filtre_emails within w_liste_patients_rdv_modification
string tag = "no resize all"
integer x = 992
integer y = 1860
integer taborder = 210
boolean bringtotop = true
end type

on uo_filtre_email.destroy
call uo_filtre_emails::destroy
end on

