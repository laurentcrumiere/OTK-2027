$PBExportHeader$w_liste_patients_sans_rendez_vous.srw
forward
global type w_liste_patients_sans_rendez_vous from w_liste_patients
end type
type dw_dossier from datawindow within w_liste_patients_sans_rendez_vous
end type
type rb_tous_dossier from radiobutton within w_liste_patients_sans_rendez_vous
end type
type rb_un_dossier from radiobutton within w_liste_patients_sans_rendez_vous
end type
type gb_2 from gb_1 within w_liste_patients_sans_rendez_vous
end type
type uo_edition from uo_edition_rtf within w_liste_patients_sans_rendez_vous
end type
type cb_lettres from uo_picturebutton_390x120 within w_liste_patients_sans_rendez_vous
end type
type st_1 from statictext within w_liste_patients_sans_rendez_vous
end type
type em_date from uo_date_calendrier within w_liste_patients_sans_rendez_vous
end type
type cbx_relance from checkbox within w_liste_patients_sans_rendez_vous
end type
type uo_filtre_email from uo_filtre_emails within w_liste_patients_sans_rendez_vous
end type
type gb_3 from groupbox within w_liste_patients_sans_rendez_vous
end type
end forward

global type w_liste_patients_sans_rendez_vous from w_liste_patients
string title = "Liste des Patients sans prochain Rendez-vous"
dw_dossier dw_dossier
rb_tous_dossier rb_tous_dossier
rb_un_dossier rb_un_dossier
gb_2 gb_2
uo_edition uo_edition
cb_lettres cb_lettres
st_1 st_1
em_date em_date
cbx_relance cbx_relance
uo_filtre_email uo_filtre_email
gb_3 gb_3
end type
global w_liste_patients_sans_rendez_vous w_liste_patients_sans_rendez_vous

type variables
string sel
end variables

forward prototypes
public subroutine prepa ()
end prototypes

public subroutine prepa ();string pra_min,pra_max,dos
double code_min,code_max
string clausew,rc,titre

date date_reference

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

	dos = dw_dossier.getitemstring(dw_dossier.getrow(),"code")

	dw_liste.setfilter("")
	dw_liste.filter()
	
	open(w_patience)
	
	titre = "Patients qui n~~'ont pas de rendez-vous prévu après le "+em_date.text
	dw_liste.Modify("titre.text = '"+titre+"'")
//	clausew = " WHERE code not in (SELECT code FROM rdv WHERE date(rdv) >= cast(getdate() as date))"
	clausew = " WHERE code not in (SELECT rdv.code FROM rdv, etat_rdv WHERE cast(rdv as date) >= cast('"+string(date(em_date.text),"YYYY-MM-DD" )+"' as date)    and rdv.absent = etat_rdv.code and etat_rdv.elimine_agenda <> 'O' )"
	clausew = clausew + " and patient.numero_dossier >= '"+string(code_min)+"'"
	clausew = clausew + " and patient.numero_dossier <= '"+string(code_max)+"'"
	clausew = clausew + " and patient.code_praticien >= '"+pra_min+"'"
	clausew = clausew + " and patient.code_praticien  <= '"+pra_max+"'"
	
	if rb_un_dossier.checked then
		clausew = clausew + " and patient.type_dossier = '"+dw_dossier.gettext()+"'"
	end if
	
	rc = dw_liste.modify('datawindow.table.select ="'+ sel + clausew +'"')	
	
	if rc <> "" then
		messagebox("ERREUR",rc)
	end if
	dw_liste.retrieve()

	if cbx_relance.checked then
		
		//dw_liste.setfilter("not patient_relance > today()")
		//dw_liste.filter("")
		
		// depuis 2021 on ne touche plus au filtre pour le powerfilter
		long lig, tot
		tot = dw_liste.rowcount()
		for lig = tot to 1 step -1
			if dw_liste.getItemDate(lig,"patient_relance" ) > today() then
				dw_liste.deleterow(lig)
			end if
		next
		
	else
		//dw_liste.setfilter("")
		//dw_liste.filter("")
	end if
	
	close(w_patience)

//	em_nb.text = string(dw_liste.rowcount())+" Dossiers"
//	em_nb.visible = true

end if


end subroutine

on w_liste_patients_sans_rendez_vous.create
int iCurrent
call super::create
this.dw_dossier=create dw_dossier
this.rb_tous_dossier=create rb_tous_dossier
this.rb_un_dossier=create rb_un_dossier
this.gb_2=create gb_2
this.uo_edition=create uo_edition
this.cb_lettres=create cb_lettres
this.st_1=create st_1
this.em_date=create em_date
this.cbx_relance=create cbx_relance
this.uo_filtre_email=create uo_filtre_email
this.gb_3=create gb_3
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_dossier
this.Control[iCurrent+2]=this.rb_tous_dossier
this.Control[iCurrent+3]=this.rb_un_dossier
this.Control[iCurrent+4]=this.gb_2
this.Control[iCurrent+5]=this.uo_edition
this.Control[iCurrent+6]=this.cb_lettres
this.Control[iCurrent+7]=this.st_1
this.Control[iCurrent+8]=this.em_date
this.Control[iCurrent+9]=this.cbx_relance
this.Control[iCurrent+10]=this.uo_filtre_email
this.Control[iCurrent+11]=this.gb_3
end on

on w_liste_patients_sans_rendez_vous.destroy
call super::destroy
destroy(this.dw_dossier)
destroy(this.rb_tous_dossier)
destroy(this.rb_un_dossier)
destroy(this.gb_2)
destroy(this.uo_edition)
destroy(this.cb_lettres)
destroy(this.st_1)
destroy(this.em_date)
destroy(this.cbx_relance)
destroy(this.uo_filtre_email)
destroy(this.gb_3)
end on

event open;call super::open;dw_dossier.settransobject(sqlca)
dw_dossier.retrieve()

dw_liste.settransobject(SQLCA)
// Récupération du select de la DataWindow  

sel = dw_liste.describe("datawindow.table.select")
uo_filtre_email.dw_liste = dw_liste
uo_filtre_email.em_statut_mere = em_nb

em_date.setdate(today())


end event

type p_fond from w_liste_patients`p_fond within w_liste_patients_sans_rendez_vous
end type

type cb_imprimer from w_liste_patients`cb_imprimer within w_liste_patients_sans_rendez_vous
integer x = 2085
integer width = 407
string text = "Liste"
end type

type cb_autre from w_liste_patients`cb_autre within w_liste_patients_sans_rendez_vous
integer x = 1678
integer width = 407
end type

event cb_autre::clicked;call super::clicked;cb_lettres.enabled ( false)
cb_lien_word.enabled ( false )

end event

type cb_fermer from w_liste_patients`cb_fermer within w_liste_patients_sans_rendez_vous
integer x = 2898
integer width = 407
end type

type cb_ecran from w_liste_patients`cb_ecran within w_liste_patients_sans_rendez_vous
integer x = 526
integer width = 407
end type

event cb_ecran::clicked;call super::clicked;cb_lettres.enabled ( true)
cb_lien_word.enabled ( true)


end event

type cb_lien_word from w_liste_patients`cb_lien_word within w_liste_patients_sans_rendez_vous
boolean visible = true
integer x = 3305
integer width = 407
end type

event cb_lien_word::clicked;int tab_type[1] = {lettre_patients_sans_rdv}

traitement_word(tab_type, dw_liste)
end event

type uo_size from w_liste_patients`uo_size within w_liste_patients_sans_rendez_vous
end type

type rb_un from w_liste_patients`rb_un within w_liste_patients_sans_rendez_vous
integer x = 439
end type

type rb_tous from w_liste_patients`rb_tous within w_liste_patients_sans_rendez_vous
integer x = 439
end type

type em_nb from w_liste_patients`em_nb within w_liste_patients_sans_rendez_vous
end type

type em_max from w_liste_patients`em_max within w_liste_patients_sans_rendez_vous
end type

type em_min from w_liste_patients`em_min within w_liste_patients_sans_rendez_vous
end type

type dw_1 from w_liste_patients`dw_1 within w_liste_patients_sans_rendez_vous
end type

type gb_1 from w_liste_patients`gb_1 within w_liste_patients_sans_rendez_vous
integer x = 274
integer width = 2272
end type

type dw_prati from w_liste_patients`dw_prati within w_liste_patients_sans_rendez_vous
end type

type cbx_filtre from w_liste_patients`cbx_filtre within w_liste_patients_sans_rendez_vous
end type

type st_min from w_liste_patients`st_min within w_liste_patients_sans_rendez_vous
end type

type st_max from w_liste_patients`st_max within w_liste_patients_sans_rendez_vous
end type

type dw_liste from w_liste_patients`dw_liste within w_liste_patients_sans_rendez_vous
integer x = 9
integer y = 20
string dataobject = "dw_liste_patients_sans_rdv_edition"
end type

type dw_dossier from datawindow within w_liste_patients_sans_rendez_vous
string tag = "position"
boolean visible = false
integer x = 1211
integer y = 1000
integer width = 937
integer height = 80
integer taborder = 80
boolean bringtotop = true
string dataobject = "dw_cherche_dossier"
boolean border = false
end type

type rb_tous_dossier from radiobutton within w_liste_patients_sans_rendez_vous
integer x = 439
integer y = 892
integer width = 891
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 15780518
string text = "Tous les Types de Dossiers  "
boolean checked = true
end type

event clicked;dw_dossier.visible = false
end event

type rb_un_dossier from radiobutton within w_liste_patients_sans_rendez_vous
integer x = 439
integer y = 1000
integer width = 677
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 15780518
string text = "Un Type de Dossier  "
end type

event rb_un_dossier::clicked;call super::clicked;dw_dossier.visible = true
end event

type gb_2 from gb_1 within w_liste_patients_sans_rendez_vous
integer y = 804
integer height = 328
integer taborder = 60
string text = "Choix du Dossier"
end type

type uo_edition from uo_edition_rtf within w_liste_patients_sans_rendez_vous
boolean visible = false
integer x = 1458
integer y = 72
integer taborder = 50
boolean bringtotop = true
end type

on uo_edition.destroy
call uo_edition_rtf::destroy
end on

type cb_lettres from uo_picturebutton_390x120 within w_liste_patients_sans_rendez_vous
integer x = 2491
integer y = 1868
integer width = 407
integer taborder = 120
boolean bringtotop = true
boolean enabled = false
string text = "Lettres"
string iconname = "ACTIONS_imprimer.png"
end type

event clicked;call super::clicked;double	code_min,code_max, code_courant
string	pra_min,pra_max
string	type_dossier_min, type_dossier_max
string	np,select_clause, ajout_clause
long		nb,cpt, nblig
Datastore dw_donnees


//preparation du datastore
dw_donnees = CREATE DataStore
dw_donnees.DataObject = "dw_lettre_sans_proc_rdv"
dw_donnees.SetTransObject(SQLCA)

//récupération des params à transmettre au datastore
//prepa_faite = true
if rb_tous.checked then
	pra_min="      "
	pra_max="ZZZZZZ"
else
	pra_min=dw_prati.getitemstring(dw_prati.getrow(),"code")
	pra_max=pra_min
end if
if rb_tous_dossier.checked then
	type_dossier_min="  "
	type_dossier_max="ZZ"
else
	type_dossier_min=dw_dossier.getitemstring(dw_dossier.getrow(),"code")
	type_dossier_max=type_dossier_min
end if
code_min = double(em_min.text)
code_max = double(em_max.text)





// Pour contourner le bug version 2007 ... impression lettre que pour le 1er patient ....
// On parcourt la liste est imprimon lettre par lettre !!!

nblig = dw_liste.rowcount()

for cpt = 1 to nblig
	code_courant = dw_liste.getitemnumber(cpt,"code") 
	dw_donnees.retrieve(code_courant,code_courant,pra_min,pra_max,type_dossier_min,type_dossier_max)

	uo_edition.edition(dw_donnees,"lettre_sans_proc_rdv", false, "" )
		
	ajout_histo_editions(code_courant,"PASRDV",today(),"Demande de prise de RDV")
NEXT	
 

Destroy dw_donnees

end event

type st_1 from statictext within w_liste_patients_sans_rendez_vous
integer x = 302
integer y = 1328
integer width = 617
integer height = 72
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
string facename = "Arial"
long backcolor = 553648127
boolean enabled = false
string text = "Date de référence : "
boolean focusrectangle = false
end type

type em_date from uo_date_calendrier within w_liste_patients_sans_rendez_vous
integer x = 923
integer y = 1316
integer taborder = 200
boolean bringtotop = true
end type

on em_date.destroy
call uo_date_calendrier::destroy
end on

type cbx_relance from checkbox within w_liste_patients_sans_rendez_vous
string tag = "a masquer no resize all"
integer x = 421
integer y = 1592
integer width = 1984
integer height = 72
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 15780518
string text = "Eliminer les patients ayant une date de recontact (dans le futur)"
boolean checked = true
boolean lefttext = true
end type

type uo_filtre_email from uo_filtre_emails within w_liste_patients_sans_rendez_vous
string tag = "no resize all"
integer x = 946
integer y = 1860
integer taborder = 200
boolean bringtotop = true
end type

on uo_filtre_email.destroy
call uo_filtre_emails::destroy
end on

type gb_3 from groupbox within w_liste_patients_sans_rendez_vous
integer x = 274
integer y = 1520
integer width = 2272
integer height = 176
integer taborder = 210
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 15780518
end type

