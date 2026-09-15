$PBExportHeader$w_liste_patients_visite_surveillance.srw
forward
global type w_liste_patients_visite_surveillance from w_liste_patients
end type
type st_1 from statictext within w_liste_patients_visite_surveillance
end type
type st_2 from statictext within w_liste_patients_visite_surveillance
end type
type st_3 from statictext within w_liste_patients_visite_surveillance
end type
type dw_dossier from datawindow within w_liste_patients_visite_surveillance
end type
type st_4 from statictext within w_liste_patients_visite_surveillance
end type
type uo_edition from uo_edition_rtf within w_liste_patients_visite_surveillance
end type
type cb_lettres from uo_picturebutton_390x120 within w_liste_patients_visite_surveillance
end type
type em_date_min from uo_date_calendrier within w_liste_patients_visite_surveillance
end type
type em_date_max from uo_date_calendrier within w_liste_patients_visite_surveillance
end type
type uo_filtre_email from uo_filtre_emails within w_liste_patients_visite_surveillance
end type
end forward

global type w_liste_patients_visite_surveillance from w_liste_patients
string title = "Visites de Surveillance"
st_1 st_1
st_2 st_2
st_3 st_3
dw_dossier dw_dossier
st_4 st_4
uo_edition uo_edition
cb_lettres cb_lettres
em_date_min em_date_min
em_date_max em_date_max
uo_filtre_email uo_filtre_email
end type
global w_liste_patients_visite_surveillance w_liste_patients_visite_surveillance

forward prototypes
public subroutine prepa ()
end prototypes

public subroutine prepa ();string pra_min,pra_max,dos
double code_min,code_max
date date_min,date_max

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

	date_min = date(em_date_min.text)
	date_max = date(em_date_max.text)

	dos = dw_dossier.getitemstring(dw_dossier.getrow(),"code")

	open(w_patience)
	dw_liste.retrieve(code_min,code_max,pra_min,pra_max,date_min,date_max,dos,dos)
	dw_liste.Modify("titre_dw.text = 'Liste des Patients pour une visite de surveillance'")
	close(w_patience)

//	em_nb.text = string(dw_liste.rowcount())+" Dossiers"
//	em_nb.visible = true


end if

end subroutine

event open;call super::open;em_date_min.setDate(today())
em_date_max.setDate(fin_mois_suivant(today()))


dw_dossier.settransobject(SQLCA)
dw_dossier.retrieve() 

uo_filtre_email.dw_liste = dw_liste

uo_filtre_email.em_statut_mere = em_nb

end event

on w_liste_patients_visite_surveillance.create
int iCurrent
call super::create
this.st_1=create st_1
this.st_2=create st_2
this.st_3=create st_3
this.dw_dossier=create dw_dossier
this.st_4=create st_4
this.uo_edition=create uo_edition
this.cb_lettres=create cb_lettres
this.em_date_min=create em_date_min
this.em_date_max=create em_date_max
this.uo_filtre_email=create uo_filtre_email
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.st_1
this.Control[iCurrent+2]=this.st_2
this.Control[iCurrent+3]=this.st_3
this.Control[iCurrent+4]=this.dw_dossier
this.Control[iCurrent+5]=this.st_4
this.Control[iCurrent+6]=this.uo_edition
this.Control[iCurrent+7]=this.cb_lettres
this.Control[iCurrent+8]=this.em_date_min
this.Control[iCurrent+9]=this.em_date_max
this.Control[iCurrent+10]=this.uo_filtre_email
end on

on w_liste_patients_visite_surveillance.destroy
call super::destroy
destroy(this.st_1)
destroy(this.st_2)
destroy(this.st_3)
destroy(this.dw_dossier)
destroy(this.st_4)
destroy(this.uo_edition)
destroy(this.cb_lettres)
destroy(this.em_date_min)
destroy(this.em_date_max)
destroy(this.uo_filtre_email)
end on

type p_fond from w_liste_patients`p_fond within w_liste_patients_visite_surveillance
end type

type cb_imprimer from w_liste_patients`cb_imprimer within w_liste_patients_visite_surveillance
integer x = 2071
integer width = 407
integer taborder = 130
string text = " Liste"
end type

type cb_autre from w_liste_patients`cb_autre within w_liste_patients_visite_surveillance
integer x = 1659
integer width = 407
end type

event cb_autre::clicked;call super::clicked;cb_lettres.enabled ( false)
cb_lien_word.enabled ( false)
end event

type cb_fermer from w_liste_patients`cb_fermer within w_liste_patients_visite_surveillance
integer x = 2894
integer width = 407
integer taborder = 140
end type

type cb_ecran from w_liste_patients`cb_ecran within w_liste_patients_visite_surveillance
integer x = 512
integer width = 407
integer taborder = 150
end type

event cb_ecran::clicked;call super::clicked;cb_lettres.enabled ( true)
cb_lien_word.enabled ( true)
end event

type cb_lien_word from w_liste_patients`cb_lien_word within w_liste_patients_visite_surveillance
boolean visible = true
integer x = 3301
end type

event cb_lien_word::clicked;call super::clicked;int	tab_type[1] = {lettre_surveillance}

traitement_word(tab_type, dw_liste)
end event

type uo_size from w_liste_patients`uo_size within w_liste_patients_visite_surveillance
end type

type rb_un from w_liste_patients`rb_un within w_liste_patients_visite_surveillance
end type

type rb_tous from w_liste_patients`rb_tous within w_liste_patients_visite_surveillance
end type

type em_nb from w_liste_patients`em_nb within w_liste_patients_visite_surveillance
integer x = 5
integer taborder = 80
end type

type em_max from w_liste_patients`em_max within w_liste_patients_visite_surveillance
end type

type em_min from w_liste_patients`em_min within w_liste_patients_visite_surveillance
end type

type dw_1 from w_liste_patients`dw_1 within w_liste_patients_visite_surveillance
end type

type gb_1 from w_liste_patients`gb_1 within w_liste_patients_visite_surveillance
integer taborder = 40
end type

type dw_prati from w_liste_patients`dw_prati within w_liste_patients_visite_surveillance
integer taborder = 120
end type

type cbx_filtre from w_liste_patients`cbx_filtre within w_liste_patients_visite_surveillance
end type

type st_min from w_liste_patients`st_min within w_liste_patients_visite_surveillance
end type

type st_max from w_liste_patients`st_max within w_liste_patients_visite_surveillance
end type

type dw_liste from w_liste_patients`dw_liste within w_liste_patients_visite_surveillance
integer y = 0
integer height = 1848
integer taborder = 110
string dataobject = "dw_liste_patients_relance_edition"
end type

type st_1 from statictext within w_liste_patients_visite_surveillance
integer x = 347
integer y = 800
integer width = 581
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
string facename = "Arial"
boolean underline = true
long backcolor = 553648127
boolean enabled = false
string text = "Date de recontact :"
boolean focusrectangle = false
end type

type st_2 from statictext within w_liste_patients_visite_surveillance
integer x = 1317
integer y = 892
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

type st_3 from statictext within w_liste_patients_visite_surveillance
integer x = 475
integer y = 892
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

type dw_dossier from datawindow within w_liste_patients_visite_surveillance
string tag = "position"
integer x = 987
integer y = 1016
integer width = 942
integer height = 84
integer taborder = 60
boolean bringtotop = true
string dataobject = "dw_cherche_dossier"
boolean border = false
boolean livescroll = true
end type

type st_4 from statictext within w_liste_patients_visite_surveillance
integer x = 457
integer y = 1016
integer width = 517
integer height = 72
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
string facename = "Arial"
long backcolor = 553648127
boolean enabled = false
string text = "Type de Dossier :"
boolean focusrectangle = false
end type

type uo_edition from uo_edition_rtf within w_liste_patients_visite_surveillance
event destroy ( )
boolean visible = false
integer x = 951
integer y = 52
integer taborder = 90
boolean border = false
long backcolor = 1090519039
end type

on uo_edition.destroy
call uo_edition_rtf::destroy
end on

type cb_lettres from uo_picturebutton_390x120 within w_liste_patients_visite_surveillance
integer x = 2482
integer y = 1868
integer width = 407
integer taborder = 140
boolean bringtotop = true
boolean enabled = false
string text = "Lettres"
string iconname = "ACTIONS_imprimer.png"
end type

event clicked;call super::clicked;Datastore dw_donnees
string pra_min,pra_max,tit,np, dos_min, dos_max
double code_min,code_max,tot,cpt, code_courant
date date_min,date_max,date_min2
long nb, i, j, nblig
string code[10]

dw_donnees = CREATE DataStore
dw_donnees.DataObject = "dw_lettre_visite"
dw_donnees.SetTransObject(SQLCA)

//prepa_faite = true
if rb_tous.checked then
	pra_min="      "
	pra_max="ZZZZZZ"
else
	pra_min=dw_prati.getitemstring(dw_prati.getrow(),"code")
	pra_max=dw_prati.getitemstring(dw_prati.getrow(),"code")
end if

dos_min=dw_dossier.getitemstring(dw_dossier.getrow(),"code")
dos_max=dos_min


code_min = double(em_min.text)
code_max = double(em_max.text)

date_min = date(em_date_min.text)
date_max = date(em_date_max.text)
date_min2 = relativedate(date_min,-1)







// Pour contourner le bug version 2007 ... impression lettre que pour le 1er patient ....
// On parcourt la liste est imprimon lettre par lettre !!!

nblig = dw_liste.rowcount()

for cpt = 1 to nblig
	code_courant = dw_liste.getitemnumber(cpt,"code") 
	dw_donnees.retrieve(code_courant,code_courant,pra_min,pra_max,date_min,date_max,dos_min,dos_max)	

	uo_edition.edition(dw_donnees,"lettre_visite", false, "" )
		
	ajout_histo_editions(code_courant,"VISSUR",today(),"Visite Surveillance")
NEXT	
 

DESTROY dw_donnees
end event

type em_date_min from uo_date_calendrier within w_liste_patients_visite_surveillance
integer x = 855
integer y = 876
integer taborder = 240
boolean bringtotop = true
end type

on em_date_min.destroy
call uo_date_calendrier::destroy
end on

type em_date_max from uo_date_calendrier within w_liste_patients_visite_surveillance
integer x = 1632
integer y = 880
integer taborder = 250
boolean bringtotop = true
end type

on em_date_max.destroy
call uo_date_calendrier::destroy
end on

type uo_filtre_email from uo_filtre_emails within w_liste_patients_visite_surveillance
string tag = "no resize all"
integer x = 923
integer y = 1852
integer taborder = 210
boolean bringtotop = true
end type

on uo_filtre_email.destroy
call uo_filtre_emails::destroy
end on

