$PBExportHeader$w_liste_patients_relance_administrative.srw
$PBExportComments$Héritée de liste_patients
forward
global type w_liste_patients_relance_administrative from w_liste_patients
end type
type st_22 from statictext within w_liste_patients_relance_administrative
end type
type st_3 from statictext within w_liste_patients_relance_administrative
end type
type st_2 from statictext within w_liste_patients_relance_administrative
end type
type em_date_min from uo_date_calendrier within w_liste_patients_relance_administrative
end type
type em_date_max from uo_date_calendrier within w_liste_patients_relance_administrative
end type
type uo_filtre_email from uo_filtre_emails within w_liste_patients_relance_administrative
end type
end forward

global type w_liste_patients_relance_administrative from w_liste_patients
string title = "Liste des Patients en Relance Administrative"
st_22 st_22
st_3 st_3
st_2 st_2
em_date_min em_date_min
em_date_max em_date_max
uo_filtre_email uo_filtre_email
end type
global w_liste_patients_relance_administrative w_liste_patients_relance_administrative

forward prototypes
public subroutine prepa ()
end prototypes

public subroutine prepa ();string pra_min,pra_max
double code_min,code_max
date da1,da2

if not prepa_faite then
	//prepa_faite = true
	if rb_tous.checked then
		pra_min="      "
		pra_max="ZZZZZZ"
	else
		pra_min=dw_prati.getitemstring(dw_prati.getrow(),"code")
		pra_max=dw_prati.getitemstring(dw_prati.getrow(),"code")
	end if

	code_min = double(em_min.text)
	code_max = double(em_max.text)
	
	da1 = date(em_date_min.text)
	da2 = date(em_date_max.text)
	
	open(w_patience)
	dw_liste.retrieve(code_min,code_max,pra_min,pra_max,da1,da2)
	close(w_patience)

//	em_nb.text = string(dw_liste.rowcount())+" Dossiers"
//	em_nb.visible = true
end if

end subroutine

on w_liste_patients_relance_administrative.create
int iCurrent
call super::create
this.st_22=create st_22
this.st_3=create st_3
this.st_2=create st_2
this.em_date_min=create em_date_min
this.em_date_max=create em_date_max
this.uo_filtre_email=create uo_filtre_email
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.st_22
this.Control[iCurrent+2]=this.st_3
this.Control[iCurrent+3]=this.st_2
this.Control[iCurrent+4]=this.em_date_min
this.Control[iCurrent+5]=this.em_date_max
this.Control[iCurrent+6]=this.uo_filtre_email
end on

on w_liste_patients_relance_administrative.destroy
call super::destroy
destroy(this.st_22)
destroy(this.st_3)
destroy(this.st_2)
destroy(this.em_date_min)
destroy(this.em_date_max)
destroy(this.uo_filtre_email)
end on

event open;call super::open;em_date_min.setdate(date(1900,1,1))
em_date_max.setdate(today())
uo_filtre_email.dw_liste = dw_liste
uo_filtre_email.em_statut_mere = em_nb




end event

type p_fond from w_liste_patients`p_fond within w_liste_patients_relance_administrative
end type

type cb_imprimer from w_liste_patients`cb_imprimer within w_liste_patients_relance_administrative
integer x = 2249
end type

type cb_autre from w_liste_patients`cb_autre within w_liste_patients_relance_administrative
integer x = 1774
end type

type cb_fermer from w_liste_patients`cb_fermer within w_liste_patients_relance_administrative
integer x = 2725
end type

type cb_ecran from w_liste_patients`cb_ecran within w_liste_patients_relance_administrative
integer x = 553
end type

type cb_lien_word from w_liste_patients`cb_lien_word within w_liste_patients_relance_administrative
end type

type uo_size from w_liste_patients`uo_size within w_liste_patients_relance_administrative
end type

type rb_un from w_liste_patients`rb_un within w_liste_patients_relance_administrative
end type

type rb_tous from w_liste_patients`rb_tous within w_liste_patients_relance_administrative
end type

type em_nb from w_liste_patients`em_nb within w_liste_patients_relance_administrative
end type

type em_max from w_liste_patients`em_max within w_liste_patients_relance_administrative
end type

type em_min from w_liste_patients`em_min within w_liste_patients_relance_administrative
end type

type dw_1 from w_liste_patients`dw_1 within w_liste_patients_relance_administrative
end type

type gb_1 from w_liste_patients`gb_1 within w_liste_patients_relance_administrative
end type

type dw_prati from w_liste_patients`dw_prati within w_liste_patients_relance_administrative
end type

type cbx_filtre from w_liste_patients`cbx_filtre within w_liste_patients_relance_administrative
end type

type st_min from w_liste_patients`st_min within w_liste_patients_relance_administrative
end type

type st_max from w_liste_patients`st_max within w_liste_patients_relance_administrative
end type

type dw_liste from w_liste_patients`dw_liste within w_liste_patients_relance_administrative
string dataobject = "dw_liste_patients_relance_admini_edition"
end type

type st_22 from statictext within w_liste_patients_relance_administrative
integer x = 347
integer y = 844
integer width = 965
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
string facename = "Arial"
boolean underline = true
long backcolor = 553648127
string text = "Date de Relance Administrative :"
end type

type st_3 from statictext within w_liste_patients_relance_administrative
integer x = 475
integer y = 968
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

type st_2 from statictext within w_liste_patients_relance_administrative
integer x = 1317
integer y = 968
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

type em_date_min from uo_date_calendrier within w_liste_patients_relance_administrative
integer x = 814
integer y = 956
integer taborder = 280
boolean bringtotop = true
end type

on em_date_min.destroy
call uo_date_calendrier::destroy
end on

type em_date_max from uo_date_calendrier within w_liste_patients_relance_administrative
integer x = 1618
integer y = 956
integer taborder = 290
boolean bringtotop = true
end type

on em_date_max.destroy
call uo_date_calendrier::destroy
end on

type uo_filtre_email from uo_filtre_emails within w_liste_patients_relance_administrative
string tag = "no resize all"
integer x = 1029
integer y = 1852
integer taborder = 190
boolean bringtotop = true
end type

on uo_filtre_email.destroy
call uo_filtre_emails::destroy
end on

