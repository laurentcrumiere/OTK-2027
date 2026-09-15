$PBExportHeader$w_liste_patients_date_relance.srw
forward
global type w_liste_patients_date_relance from w_liste_patients
end type
type st_1 from statictext within w_liste_patients_date_relance
end type
type st_2 from statictext within w_liste_patients_date_relance
end type
type st_3 from statictext within w_liste_patients_date_relance
end type
type rb_un_dos from radiobutton within w_liste_patients_date_relance
end type
type rb_tous_dos from radiobutton within w_liste_patients_date_relance
end type
type gb_dos from groupbox within w_liste_patients_date_relance
end type
type dw_dossier from datawindow within w_liste_patients_date_relance
end type
type cb_lettres from uo_picturebutton_390x120 within w_liste_patients_date_relance
end type
type uo_edition from uo_edition_rtf within w_liste_patients_date_relance
end type
type em_date_min from uo_date_calendrier within w_liste_patients_date_relance
end type
type em_date_max from uo_date_calendrier within w_liste_patients_date_relance
end type
type uo_filtre_email from uo_filtre_emails within w_liste_patients_date_relance
end type
type cbx_next from checkbox within w_liste_patients_date_relance
end type
type cbx_next_2 from checkbox within w_liste_patients_date_relance
end type
type st_22 from statictext within w_liste_patients_date_relance
end type
type st_5 from statictext within w_liste_patients_date_relance
end type
type gb_3 from groupbox within w_liste_patients_date_relance
end type
type gb_2 from groupbox within w_liste_patients_date_relance
end type
end forward

global type w_liste_patients_date_relance from w_liste_patients
string title = "Liste des Patients à recontacter"
st_1 st_1
st_2 st_2
st_3 st_3
rb_un_dos rb_un_dos
rb_tous_dos rb_tous_dos
gb_dos gb_dos
dw_dossier dw_dossier
cb_lettres cb_lettres
uo_edition uo_edition
em_date_min em_date_min
em_date_max em_date_max
uo_filtre_email uo_filtre_email
cbx_next cbx_next
cbx_next_2 cbx_next_2
st_22 st_22
st_5 st_5
gb_3 gb_3
gb_2 gb_2
end type
global w_liste_patients_date_relance w_liste_patients_date_relance

forward prototypes
public subroutine prepa ()
end prototypes

public subroutine prepa ();string pra_min,pra_max,np,tit,dos_min,dos_max,p
double code_min,code_max,nblig,cpt
double code_courrant, nb_rdv
date date_min,date_max

if not prepa_faite then
	//prepa_faite = true
	if rb_tous.checked then
		pra_min="      "
		pra_max="ZZZZZZ"
		tit = "Pour tous les Praticiens"
	else
		pra_min=dw_prati.getitemstring(dw_prati.getrow(),"code")
		pra_max=dw_prati.getitemstring(dw_prati.getrow(),"code")
		SELECT nom INTO :np FROM prati WHERE code = :pra_min ;
		Tit = "Pour le Dr "+np
	end if

	if rb_tous_dos.checked then
		dos_min="      "
		dos_max="ZZZZZZ"
		tit = tit + " - Tous les Types de dossier"
	else
		dos_min=dw_dossier.getitemstring(dw_dossier.getrow(),"code")
		dos_max=dos_min
		SELECT nom INTO :p FROM dossier WHERE code = :dos_min ;
		tit = tit + " - Dossiers : "+p
	end if


	code_min = double(em_min.text)
	code_max = double(em_max.text)

	date_min = date(em_date_min.text)
	date_max = date(em_date_max.text)

	open(w_patience)
	
	string filtre = ""
	if cbx_next.checked then
		if cbx_next_2.checked then
			filtre = "next = 0 and next_2 = 0"
		else
			filtre = "next = 0"
		end if
	else
		if cbx_next_2.checked then
			filtre = "next_2 = 0"
		else
			filtre = ""
		end if
	end if
	
	dw_liste.setfilter(filtre)
	uo_filtre_email.filtre_initial = filtre
	dw_liste.filter()

	
	
	dw_liste.retrieve(code_min,code_max,pra_min,pra_max,date_min,date_max,dos_min,dos_max)

	tit = tit +" entre le "+em_date_min.text+" et le "+em_date_max.text
	dw_liste.Modify("sous_titre.text = '"+tit+"'")
	
//	// Elimination les patients qui ont un prochain RDV (à partir d'aujour'hui)
//	if cbx_next.checked then
//		nblig = dw_liste.rowcount()
//		for cpt = nblig to 1 step -1
//			code_courrant = dw_liste.getitemnumber(cpt,"code")
//			nb_rdv = 0 
//			SELECT count(*) into :nb_rdv FROM rdv, etat_rdv  WHERE date(rdv) >= cast(getdate() as date) and rdv.code = :code_courrant 
//			and rdv.absent = etat_rdv.code and etat_rdv.elimine_agenda <> 'O'  ;
//			if nb_rdv > 0 then
//				dw_liste.deleterow(cpt)
//			end if
//		next
//	end if
	
	close(w_patience)

	//em_nb.text = string(dw_liste.rowcount())+" Dossiers"
	//em_nb.visible = true


end if

end subroutine

event open;call super::open;em_date_min.setDate(today())
em_date_max.SetDate(date(year(today()),12,31))


dw_dossier.settransobject(SQLCA)
dw_dossier.retrieve()  

em_min.text = string(min)
uo_filtre_email.dw_liste = dw_liste
uo_filtre_email.em_statut_mere = em_nb


end event

on w_liste_patients_date_relance.create
int iCurrent
call super::create
this.st_1=create st_1
this.st_2=create st_2
this.st_3=create st_3
this.rb_un_dos=create rb_un_dos
this.rb_tous_dos=create rb_tous_dos
this.gb_dos=create gb_dos
this.dw_dossier=create dw_dossier
this.cb_lettres=create cb_lettres
this.uo_edition=create uo_edition
this.em_date_min=create em_date_min
this.em_date_max=create em_date_max
this.uo_filtre_email=create uo_filtre_email
this.cbx_next=create cbx_next
this.cbx_next_2=create cbx_next_2
this.st_22=create st_22
this.st_5=create st_5
this.gb_3=create gb_3
this.gb_2=create gb_2
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.st_1
this.Control[iCurrent+2]=this.st_2
this.Control[iCurrent+3]=this.st_3
this.Control[iCurrent+4]=this.rb_un_dos
this.Control[iCurrent+5]=this.rb_tous_dos
this.Control[iCurrent+6]=this.gb_dos
this.Control[iCurrent+7]=this.dw_dossier
this.Control[iCurrent+8]=this.cb_lettres
this.Control[iCurrent+9]=this.uo_edition
this.Control[iCurrent+10]=this.em_date_min
this.Control[iCurrent+11]=this.em_date_max
this.Control[iCurrent+12]=this.uo_filtre_email
this.Control[iCurrent+13]=this.cbx_next
this.Control[iCurrent+14]=this.cbx_next_2
this.Control[iCurrent+15]=this.st_22
this.Control[iCurrent+16]=this.st_5
this.Control[iCurrent+17]=this.gb_3
this.Control[iCurrent+18]=this.gb_2
end on

on w_liste_patients_date_relance.destroy
call super::destroy
destroy(this.st_1)
destroy(this.st_2)
destroy(this.st_3)
destroy(this.rb_un_dos)
destroy(this.rb_tous_dos)
destroy(this.gb_dos)
destroy(this.dw_dossier)
destroy(this.cb_lettres)
destroy(this.uo_edition)
destroy(this.em_date_min)
destroy(this.em_date_max)
destroy(this.uo_filtre_email)
destroy(this.cbx_next)
destroy(this.cbx_next_2)
destroy(this.st_22)
destroy(this.st_5)
destroy(this.gb_3)
destroy(this.gb_2)
end on

type p_fond from w_liste_patients`p_fond within w_liste_patients_date_relance
end type

type cb_imprimer from w_liste_patients`cb_imprimer within w_liste_patients_date_relance
integer x = 2080
integer width = 416
integer taborder = 140
string text = "Liste"
end type

type cb_autre from w_liste_patients`cb_autre within w_liste_patients_date_relance
integer x = 1664
integer width = 416
integer taborder = 120
string text = "Autre"
end type

event cb_autre::clicked;call super::clicked;cb_lettres.enabled ( false)
end event

type cb_fermer from w_liste_patients`cb_fermer within w_liste_patients_date_relance
integer x = 2912
integer width = 416
integer taborder = 150
string text = "Fermer"
end type

type cb_ecran from w_liste_patients`cb_ecran within w_liste_patients_date_relance
integer x = 512
integer width = 416
integer taborder = 160
string text = "Ecran"
end type

event cb_ecran::clicked;call super::clicked;cb_lettres.enabled ( true)
end event

type cb_lien_word from w_liste_patients`cb_lien_word within w_liste_patients_date_relance
boolean visible = true
integer x = 3328
integer width = 416
string text = "Word"
end type

event cb_lien_word::clicked;call super::clicked;int	tab_type[1] = {lettre_patient_recontacter}

traitement_word(tab_type, dw_liste)
end event

type uo_size from w_liste_patients`uo_size within w_liste_patients_date_relance
end type

type rb_un from w_liste_patients`rb_un within w_liste_patients_date_relance
end type

type rb_tous from w_liste_patients`rb_tous within w_liste_patients_date_relance
end type

type em_nb from w_liste_patients`em_nb within w_liste_patients_date_relance
integer x = 9
integer taborder = 90
end type

type em_max from w_liste_patients`em_max within w_liste_patients_date_relance
integer y = 504
end type

type em_min from w_liste_patients`em_min within w_liste_patients_date_relance
integer y = 504
end type

type dw_1 from w_liste_patients`dw_1 within w_liste_patients_date_relance
end type

type gb_1 from w_liste_patients`gb_1 within w_liste_patients_date_relance
integer taborder = 60
end type

type dw_prati from w_liste_patients`dw_prati within w_liste_patients_date_relance
integer taborder = 110
end type

type cbx_filtre from w_liste_patients`cbx_filtre within w_liste_patients_date_relance
end type

type st_min from w_liste_patients`st_min within w_liste_patients_date_relance
integer y = 516
end type

type st_max from w_liste_patients`st_max within w_liste_patients_date_relance
integer y = 516
end type

type dw_liste from w_liste_patients`dw_liste within w_liste_patients_date_relance
integer y = 0
integer taborder = 100
string dataobject = "dw_liste_patients_relance_edition"
end type

type st_1 from statictext within w_liste_patients_date_relance
integer x = 338
integer y = 628
integer width = 567
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
string facename = "Arial"
boolean underline = true
long backcolor = 553648127
string text = "Date de recontact :"
end type

type st_2 from statictext within w_liste_patients_date_relance
integer x = 1303
integer y = 732
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

type st_3 from statictext within w_liste_patients_date_relance
integer x = 503
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

type rb_un_dos from radiobutton within w_liste_patients_date_relance
event clicked pbm_bnclicked
integer x = 453
integer y = 1020
integer width = 667
integer height = 80
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 15780518
string text = "Un type de dossier "
end type

event clicked;dw_dossier.visible = true
end event

type rb_tous_dos from radiobutton within w_liste_patients_date_relance
event clicked pbm_bnclicked
integer x = 453
integer y = 924
integer width = 850
integer height = 80
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 15780518
string text = "Tous les types de dossier "
boolean checked = true
end type

event clicked;dw_dossier.visible = false
end event

type gb_dos from groupbox within w_liste_patients_date_relance
integer x = 288
integer y = 844
integer width = 2121
integer height = 304
integer taborder = 40
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean italic = true
long textcolor = 33554432
long backcolor = 15780518
string text = "Choix du type de dossier "
end type

type dw_dossier from datawindow within w_liste_patients_date_relance
string tag = "position brush"
boolean visible = false
integer x = 1262
integer y = 1012
integer width = 951
integer height = 80
integer taborder = 70
string dataobject = "dw_cherche_dossier"
boolean border = false
end type

type cb_lettres from uo_picturebutton_390x120 within w_liste_patients_date_relance
integer x = 2496
integer y = 1868
integer width = 416
integer taborder = 150
boolean bringtotop = true
boolean enabled = false
string text = "Lettres"
string iconname = "ACTIONS_imprimer.png"
end type

event clicked;call super::clicked;string pra_min,pra_max,tit,np, dos_min, dos_max
double code_min,code_max,tot,cpt, code_courant
date date_min,date_max,date_min2
long nb, i, j, nblig
string code[10]



Datastore dw_donnees

dw_donnees = CREATE DataStore
dw_donnees.DataObject = "dw_lettre_recontacter"
dw_donnees.SetTransObject(SQLCA)

//prepa_faite = true

if rb_tous.checked then
	pra_min="      "
	pra_max="ZZZZZZ"
else
	pra_min=dw_prati.getitemstring(dw_prati.getrow(),"code")
	pra_max=dw_prati.getitemstring(dw_prati.getrow(),"code")
end if

if rb_tous_dos.checked then
	dos_min="      "
	dos_max="ZZZZZZ"
else
	dos_min=dw_dossier.getitemstring(dw_dossier.getrow(),"code")
	dos_max=dos_min
end if

code_min = double(em_min.text)
code_max = double(em_max.text)

date_min = date(em_date_min.text)
date_max = date(em_date_max.text)


// Pour contourner le bug version 2007 ... impression lettre que pour le 1er patient ....
// On parcourt la liste est imprimon lettre par lettre !!!

nblig = dw_liste.rowcount()

for cpt = 1 to nblig
	code_courant = dw_liste.getitemnumber(cpt,"code") 
	dw_donnees.retrieve(code_courant,code_courant,pra_min,pra_max,date_min,date_max,dos_min,dos_max)

	uo_edition.edition(dw_donnees,"lettre_recontacter", false, "" )
		
	ajout_histo_editions(code_courant,"ARECON",today(),"Patient à Recontacter")
NEXT	
 



Destroy dw_donnees


end event

type uo_edition from uo_edition_rtf within w_liste_patients_date_relance
event destroy ( )
boolean visible = false
integer x = 14
integer taborder = 41
boolean bringtotop = true
boolean border = false
long backcolor = 1090519039
end type

on uo_edition.destroy
call uo_edition_rtf::destroy
end on

type em_date_min from uo_date_calendrier within w_liste_patients_date_relance
integer x = 882
integer y = 724
integer taborder = 110
boolean bringtotop = true
end type

on em_date_min.destroy
call uo_date_calendrier::destroy
end on

type em_date_max from uo_date_calendrier within w_liste_patients_date_relance
integer x = 1687
integer y = 724
integer taborder = 120
boolean bringtotop = true
end type

on em_date_max.destroy
call uo_date_calendrier::destroy
end on

type uo_filtre_email from uo_filtre_emails within w_liste_patients_date_relance
string tag = "no resize all"
integer x = 933
integer y = 1852
integer taborder = 180
boolean bringtotop = true
end type

on uo_filtre_email.destroy
call uo_filtre_emails::destroy
end on

type cbx_next from checkbox within w_liste_patients_date_relance
string tag = "a masquer"
integer x = 329
integer y = 1256
integer width = 2139
integer height = 72
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 15780518
string text = "Eliminer les patients ayant un prochain rendez-vous (dans le futur)"
boolean checked = true
boolean lefttext = true
end type

type cbx_next_2 from checkbox within w_liste_patients_date_relance
string tag = "a masquer"
integer x = 329
integer y = 1572
integer width = 2139
integer height = 72
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 15780518
string text = "Eliminer les patients ayant eu un rendez-vous après (dans le passé)"
boolean checked = true
boolean lefttext = true
end type

type st_22 from statictext within w_liste_patients_date_relance
integer x = 329
integer y = 1332
integer width = 1897
integer height = 132
boolean bringtotop = true
integer textsize = -10
fontcharset fontcharset = ansi!
string facename = "Arial"
boolean italic = true
long backcolor = 553648127
string text = "Exemple : Elimine les patients qui ont un rendez-vous programmé à partir d~'aujourd~'hui"
end type

type st_5 from statictext within w_liste_patients_date_relance
integer x = 329
integer y = 1648
integer width = 1925
integer height = 136
boolean bringtotop = true
integer textsize = -10
fontcharset fontcharset = ansi!
string facename = "Arial"
boolean italic = true
long backcolor = 553648127
string text = "Exemple : Elimine les patients qui ont eu par un rendez-vous honoré après la date de recontact"
end type

type gb_3 from groupbox within w_liste_patients_date_relance
integer x = 279
integer y = 1508
integer width = 2304
integer height = 304
integer taborder = 160
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 15780518
end type

type gb_2 from groupbox within w_liste_patients_date_relance
integer x = 279
integer y = 1188
integer width = 2304
integer height = 304
integer taborder = 150
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 15780518
end type

