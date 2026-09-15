$PBExportHeader$w_liste_patients_absents_rdv.srw
forward
global type w_liste_patients_absents_rdv from w_liste_patients
end type
type st_1 from statictext within w_liste_patients_absents_rdv
end type
type st_2 from statictext within w_liste_patients_absents_rdv
end type
type st_3 from statictext within w_liste_patients_absents_rdv
end type
type cbx_next from checkbox within w_liste_patients_absents_rdv
end type
type st_4 from statictext within w_liste_patients_absents_rdv
end type
type dw_etat from datawindow within w_liste_patients_absents_rdv
end type
type uo_edition from uo_edition_rtf within w_liste_patients_absents_rdv
end type
type cbx_next_2 from checkbox within w_liste_patients_absents_rdv
end type
type cb_lettres from uo_picturebutton_390x120 within w_liste_patients_absents_rdv
end type
type em_date_min from uo_date_calendrier within w_liste_patients_absents_rdv
end type
type em_date_max from uo_date_calendrier within w_liste_patients_absents_rdv
end type
type uo_filtre_email from uo_filtre_emails within w_liste_patients_absents_rdv
end type
type st_6 from statictext within w_liste_patients_absents_rdv
end type
type st_7 from statictext within w_liste_patients_absents_rdv
end type
type cbx_praticien_différent from checkbox within w_liste_patients_absents_rdv
end type
type gb_2 from groupbox within w_liste_patients_absents_rdv
end type
type gb_3 from groupbox within w_liste_patients_absents_rdv
end type
type gb_praticien_différent from groupbox within w_liste_patients_absents_rdv
end type
end forward

global type w_liste_patients_absents_rdv from w_liste_patients
integer width = 4197
string title = "Liste des Patients suivant l~'état de leurs Rendez-vous"
st_1 st_1
st_2 st_2
st_3 st_3
cbx_next cbx_next
st_4 st_4
dw_etat dw_etat
uo_edition uo_edition
cbx_next_2 cbx_next_2
cb_lettres cb_lettres
em_date_min em_date_min
em_date_max em_date_max
uo_filtre_email uo_filtre_email
st_6 st_6
st_7 st_7
cbx_praticien_différent cbx_praticien_différent
gb_2 gb_2
gb_3 gb_3
gb_praticien_différent gb_praticien_différent
end type
global w_liste_patients_absents_rdv w_liste_patients_absents_rdv

forward prototypes
public subroutine prepa ()
end prototypes

public subroutine prepa ();string pra_min,pra_max,dos,tit,p, etat, nom_rdv
double code_min,code_max
date date_min,date_max
string filtre

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

	etat = dw_etat.GetText()
	
  SELECT "etat_rdv"."nom"  
    INTO :nom_rdv  
    FROM "etat_rdv"  
   WHERE "etat_rdv"."code" = :etat   ;

	tit = tit + " - Etat du Rendez-vous : " + string(nom_rdv) + " -"
	
	date_min = date(em_date_min.text)
	date_max = date(em_date_max.text)

	tit = tit + " Entre le "+em_date_min.text+" et le "+em_date_max.text
	dw_liste.Object.titre.Text = tit
	
	filtre = ""
	if cbx_next.checked then
		if cbx_next_2.checked then
			filtre = "cnext = 0 and next_2 = 0"
		else
			filtre = "cnext = 0"
		end if
	else
		if cbx_next_2.checked then
			filtre = "next_2 = 0"
		else
			filtre = ""
		end if
	end if
	
	if cbx_praticien_différent.checked then
		// rendez-vous aves praticien différents
		if trim(filtre) <> "" then
			filtre = filtre + " and " 
		end if
		filtre = filtre + " code_praticien <> rdv_code_praticien "
	end if

	
	dw_liste.setfilter(filtre)
	uo_filtre_email.filtre_initial = filtre
	dw_liste.filter()
	
	
	open(w_patience)
	dw_liste.retrieve(code_min,code_max,pra_min,pra_max,date_min,date_max,etat)
	
	// pour éviter bug vu chez Riviere
	long lig, tot
	tot = dw_liste.rowcount()
	for lig = 1 to tot
		dw_liste.setItem(lig, "selection", "O")
	next 
	
	close(w_patience)

	//em_nb.text = string(dw_liste.rowcount())+" Rendez-vous"
	//em_nb.visible = true

end if

end subroutine

event open;call super::open;//em_date_min.text = string(date(year(today()),1,1))
//em_date_max.text = string(today())

em_date_min.setDate ( date(year(today()),1,1))
em_date_max.setDate ( today())

// on prend les négatifs éventuels
em_min.text = string(min)

dw_etat.SetTransObject(SQLCA)
dw_etat.Retrieve()

uo_filtre_email.dw_liste = dw_liste
uo_filtre_email.em_statut_mere = em_nb

uo_filtre_email.set_filtre_supplementaire(" (selection = 'O' ) ")


end event

on w_liste_patients_absents_rdv.create
int iCurrent
call super::create
this.st_1=create st_1
this.st_2=create st_2
this.st_3=create st_3
this.cbx_next=create cbx_next
this.st_4=create st_4
this.dw_etat=create dw_etat
this.uo_edition=create uo_edition
this.cbx_next_2=create cbx_next_2
this.cb_lettres=create cb_lettres
this.em_date_min=create em_date_min
this.em_date_max=create em_date_max
this.uo_filtre_email=create uo_filtre_email
this.st_6=create st_6
this.st_7=create st_7
this.cbx_praticien_différent=create cbx_praticien_différent
this.gb_2=create gb_2
this.gb_3=create gb_3
this.gb_praticien_différent=create gb_praticien_différent
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.st_1
this.Control[iCurrent+2]=this.st_2
this.Control[iCurrent+3]=this.st_3
this.Control[iCurrent+4]=this.cbx_next
this.Control[iCurrent+5]=this.st_4
this.Control[iCurrent+6]=this.dw_etat
this.Control[iCurrent+7]=this.uo_edition
this.Control[iCurrent+8]=this.cbx_next_2
this.Control[iCurrent+9]=this.cb_lettres
this.Control[iCurrent+10]=this.em_date_min
this.Control[iCurrent+11]=this.em_date_max
this.Control[iCurrent+12]=this.uo_filtre_email
this.Control[iCurrent+13]=this.st_6
this.Control[iCurrent+14]=this.st_7
this.Control[iCurrent+15]=this.cbx_praticien_différent
this.Control[iCurrent+16]=this.gb_2
this.Control[iCurrent+17]=this.gb_3
this.Control[iCurrent+18]=this.gb_praticien_différent
end on

on w_liste_patients_absents_rdv.destroy
call super::destroy
destroy(this.st_1)
destroy(this.st_2)
destroy(this.st_3)
destroy(this.cbx_next)
destroy(this.st_4)
destroy(this.dw_etat)
destroy(this.uo_edition)
destroy(this.cbx_next_2)
destroy(this.cb_lettres)
destroy(this.em_date_min)
destroy(this.em_date_max)
destroy(this.uo_filtre_email)
destroy(this.st_6)
destroy(this.st_7)
destroy(this.cbx_praticien_différent)
destroy(this.gb_2)
destroy(this.gb_3)
destroy(this.gb_praticien_différent)
end on

event close;call super::close;//remet à NULL la comlumn "v1" de la table "table_vide"
UPDATE table_vide SET v1 = NULL;
commit;
end event

type p_fond from w_liste_patients`p_fond within w_liste_patients_absents_rdv
end type

type cb_imprimer from w_liste_patients`cb_imprimer within w_liste_patients_absents_rdv
integer x = 2226
integer y = 1872
integer taborder = 180
string text = "Liste"
end type

type cb_autre from w_liste_patients`cb_autre within w_liste_patients_absents_rdv
integer x = 1751
integer y = 1872
integer taborder = 160
end type

event cb_autre::clicked;call super::clicked;cb_lettres.enabled ( false)
cb_lien_word.enabled ( false)
end event

type cb_fermer from w_liste_patients`cb_fermer within w_liste_patients_absents_rdv
integer x = 3177
integer y = 1872
integer taborder = 190
end type

type cb_ecran from w_liste_patients`cb_ecran within w_liste_patients_absents_rdv
integer x = 530
integer y = 1872
integer taborder = 200
string iconname = "ACTIONS_autre.png"
end type

event cb_ecran::clicked;call super::clicked;cb_lettres.enabled ( true)
cb_lien_word.enabled ( true)
end event

type cb_lien_word from w_liste_patients`cb_lien_word within w_liste_patients_absents_rdv
boolean visible = true
integer x = 3653
end type

event cb_lien_word::clicked;call super::clicked;int	tab_type[1] = {lettre_rdv_manque}

string v_filtre_email , v_filtre_email_avant

v_filtre_email = uo_filtre_email.filtre

if len(trim(v_filtre_email)) > 0 then
	v_filtre_email_avant = v_filtre_email + " and "
else
	v_filtre_email_avant = ""
end if

// Avant de lancer la liste on applique un filtre pour éliminer ceux qu'on ne veut pas
if cbx_next.checked then
	if cbx_next_2.checked then
		dw_liste.setfilter( v_filtre_email_avant + "(cnext = 0 and next_2 = 0 and selection  = 'O')")
	else
		dw_liste.setfilter(v_filtre_email_avant +"(cnext = 0 and selection = 'O')")
	end if
else
	if cbx_next_2.checked then
		dw_liste.setfilter(v_filtre_email_avant +"(next_2 = 0 and selection = 'O')")
	else
		dw_liste.setfilter(v_filtre_email_avant +"(selection = 'O')")
	end if
end if

dw_liste.filter()
	




//
//dw_liste.SetFilter("table_vide_v1 = 'O'")
//dw_liste.filter()
//
traitement_word(tab_type, dw_liste)

//dw_liste.SetFilter("")
//dw_liste.filter()
//

// On remet la liste comme avant
if cbx_next.checked then
	if cbx_next_2.checked then
		dw_liste.setfilter(v_filtre_email + "(cnext = 0 and next_2 = 0 )")
	else
		dw_liste.setfilter(v_filtre_email + "(cnext = 0 )")
	end if
else
	if cbx_next_2.checked then
		dw_liste.setfilter(v_filtre_email + "(next_2 = 0 )")
	else
		dw_liste.setfilter(v_filtre_email)
	end if
end if

dw_liste.filter()


end event

type uo_size from w_liste_patients`uo_size within w_liste_patients_absents_rdv
integer taborder = 50
end type

type rb_un from w_liste_patients`rb_un within w_liste_patients_absents_rdv
end type

type rb_tous from w_liste_patients`rb_tous within w_liste_patients_absents_rdv
end type

type em_nb from w_liste_patients`em_nb within w_liste_patients_absents_rdv
integer taborder = 120
end type

type em_max from w_liste_patients`em_max within w_liste_patients_absents_rdv
integer y = 488
integer taborder = 40
end type

type em_min from w_liste_patients`em_min within w_liste_patients_absents_rdv
integer y = 488
integer taborder = 20
end type

type dw_1 from w_liste_patients`dw_1 within w_liste_patients_absents_rdv
integer taborder = 60
end type

type gb_1 from w_liste_patients`gb_1 within w_liste_patients_absents_rdv
integer taborder = 70
end type

type dw_prati from w_liste_patients`dw_prati within w_liste_patients_absents_rdv
integer taborder = 170
end type

type cbx_filtre from w_liste_patients`cbx_filtre within w_liste_patients_absents_rdv
end type

type st_min from w_liste_patients`st_min within w_liste_patients_absents_rdv
integer y = 500
end type

type st_max from w_liste_patients`st_max within w_liste_patients_absents_rdv
integer y = 500
end type

type dw_liste from w_liste_patients`dw_liste within w_liste_patients_absents_rdv
integer x = 32
integer width = 4082
integer height = 1836
integer taborder = 10
string dataobject = "dw_liste_patients_etat_rdv_edition"
end type

event dw_liste::rbuttondown;

	
if row > 0 then
	This.SelectRow(0,False)
	This.SelectRow(row,True)
	This.setrow(row)
	OpenMenuPatient_Listes_Selection(this, parent, "selection" )
end if

	


end event

type st_1 from statictext within w_liste_patients_absents_rdv
integer x = 347
integer y = 644
integer width = 658
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

type st_2 from statictext within w_liste_patients_absents_rdv
integer x = 1317
integer y = 752
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

type st_3 from statictext within w_liste_patients_absents_rdv
integer x = 475
integer y = 752
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

type cbx_next from checkbox within w_liste_patients_absents_rdv
string tag = "a masquer"
integer x = 329
integer y = 1044
integer width = 2139
integer height = 72
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 553648127
string text = "Eliminer les patients ayant un prochain rendez-vous (dans le futur)"
boolean checked = true
boolean lefttext = true
end type

type st_4 from statictext within w_liste_patients_absents_rdv
integer x = 379
integer y = 888
integer width = 658
integer height = 72
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
string facename = "Arial"
long backcolor = 553648127
string text = "Etat du Rendez-vous : "
alignment alignment = right!
end type

type dw_etat from datawindow within w_liste_patients_absents_rdv
string tag = "position brush"
integer x = 1083
integer y = 888
integer width = 997
integer height = 76
integer taborder = 100
boolean bringtotop = true
string dataobject = "dw_cherche_etat_rdv"
boolean border = false
boolean livescroll = true
end type

type uo_edition from uo_edition_rtf within w_liste_patients_absents_rdv
event destroy ( )
boolean visible = false
integer x = 439
integer y = 544
integer taborder = 80
boolean border = false
long backcolor = 1090519039
end type

on uo_edition.destroy
call uo_edition_rtf::destroy
end on

type cbx_next_2 from checkbox within w_liste_patients_absents_rdv
string tag = "a masquer"
integer x = 329
integer y = 1360
integer width = 2139
integer height = 72
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 553648127
string text = "Eliminer les patients ayant eu un rendez-vous après (dans le passé)"
boolean checked = true
boolean lefttext = true
end type

type cb_lettres from uo_picturebutton_390x120 within w_liste_patients_absents_rdv
integer x = 2702
integer y = 1872
integer width = 457
integer taborder = 130
boolean bringtotop = true
boolean enabled = false
string text = "Lettres"
string iconname = "ACTIONS_imprimer.png"
end type

event clicked;call super::clicked;string 	pra_min,pra_max		// Praticiens
double 	code_min,code_max		// Dossiers
double 	tot,cpt,nb,i,j			// Compteurs de boucles
date 		date_min,date_max		// Date
string 	code[10]					// Contiendra la liste des praticiens concernés (pour une édition ordonnées)
datetime manque					// RDV manque
double 	patcour					// Patient courant
Datastore dw_donnees
long		nb_row_liste,tmp,row_find, nblig
double	nocode, code_courant
string	rdv_type,rdv_code_prati
string	param_recherche
datetime rdv_rdv

//prepa_faite = true

//préparation des var de recherche
if rb_tous.checked then
	pra_min="      "
	pra_max="ZZZZZZ"
else
	pra_min=dw_prati.getitemstring(dw_prati.getrow(),"code")
	pra_max=pra_min
end if
code_min = double(em_min.text)
code_max = double(em_max.text)
date_min = date(em_date_min.text)
date_max = date(em_date_max.text)

//création du datastore
dw_donnees = CREATE DataStore
dw_donnees.DataObject = "dw_lettre_absents"
dw_donnees.settransobject(sqlca)


// Pour contourner le bug version 2007 ... impression lettre que pour le 1er patient ....
// On parcourt la liste et imprime lettre par lettre !!!

nblig = dw_liste.rowcount()

for cpt = 1 to nblig
	if dw_liste.getitemstring(cpt,"selection") <> "N" then
		code_courant = dw_liste.getitemnumber(cpt,"code") 
		manque = dw_liste.getitemdatetime(cpt,"rdv_rdv")
		dw_donnees.retrieve(code_courant,code_courant,pra_min,pra_max,date_min,date_max,dw_etat.gettext())
	
		uo_edition.edition(dw_donnees,"lettre_rendez_vous_manque", false, "")
			
		ajout_histo_editions(code_courant,"ABSENT",today(),"Rdv du "+string(manque,"dd/mm/yyyy à hh:mm"))
	end if
NEXT	
 


//supression du datastore
DESTROY dw_donnees
end event

type em_date_min from uo_date_calendrier within w_liste_patients_absents_rdv
integer x = 754
integer y = 744
integer taborder = 90
boolean bringtotop = true
end type

on em_date_min.destroy
call uo_date_calendrier::destroy
end on

type em_date_max from uo_date_calendrier within w_liste_patients_absents_rdv
integer x = 1563
integer y = 744
integer taborder = 95
boolean bringtotop = true
end type

on em_date_max.destroy
call uo_date_calendrier::destroy
end on

type uo_filtre_email from uo_filtre_emails within w_liste_patients_absents_rdv
string tag = "no resize all"
integer x = 1006
integer y = 1848
integer taborder = 120
boolean bringtotop = true
end type

on uo_filtre_email.destroy
call uo_filtre_emails::destroy
end on

type st_6 from statictext within w_liste_patients_absents_rdv
integer x = 329
integer y = 1436
integer width = 1783
integer height = 144
boolean bringtotop = true
integer textsize = -10
fontcharset fontcharset = ansi!
string facename = "Arial"
boolean italic = true
long backcolor = 553648127
string text = "Exemple : Elimine les patients qui ont eu par la suite un rendez-vous (d~'un autre état) mais avant aujourd~'hui"
end type

type st_7 from statictext within w_liste_patients_absents_rdv
integer x = 329
integer y = 1120
integer width = 1893
integer height = 120
boolean bringtotop = true
integer textsize = -10
fontcharset fontcharset = ansi!
string facename = "Arial"
boolean italic = true
long backcolor = 553648127
string text = "Exemple : Elimine les patients qui ont été absents mais qui ont un rendez-vous programmé à partir d~'aujourd~'hui"
end type

type cbx_praticien_différent from checkbox within w_liste_patients_absents_rdv
string tag = "a masquer"
integer x = 329
integer y = 1684
integer width = 2139
integer height = 72
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 553648127
string text = "Ne lister que les rendez-vous avec un praticien différent"
boolean lefttext = true
end type

type gb_2 from groupbox within w_liste_patients_absents_rdv
integer x = 279
integer y = 976
integer width = 2304
integer height = 304
integer taborder = 140
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 15780518
end type

type gb_3 from groupbox within w_liste_patients_absents_rdv
integer x = 279
integer y = 1296
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

type gb_praticien_différent from groupbox within w_liste_patients_absents_rdv
integer x = 279
integer y = 1620
integer width = 2304
integer height = 208
integer taborder = 160
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 15780518
end type

