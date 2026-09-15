$PBExportHeader$w_liste_patients_report_rdv.srw
forward
global type w_liste_patients_report_rdv from w_liste_patients
end type
type st_1 from statictext within w_liste_patients_report_rdv
end type
type st_2 from statictext within w_liste_patients_report_rdv
end type
type st_3 from statictext within w_liste_patients_report_rdv
end type
type uo_edition from uo_edition_rtf within w_liste_patients_report_rdv
end type
type cb_lettres from uo_picturebutton_390x120 within w_liste_patients_report_rdv
end type
type em_date_min from uo_date_calendrier within w_liste_patients_report_rdv
end type
type em_date_max from uo_date_calendrier within w_liste_patients_report_rdv
end type
type em_time_min from editmask within w_liste_patients_report_rdv
end type
type em_time_max from editmask within w_liste_patients_report_rdv
end type
type em_faut_max from editmask within w_liste_patients_report_rdv
end type
type st_4 from statictext within w_liste_patients_report_rdv
end type
type st_5 from statictext within w_liste_patients_report_rdv
end type
type em_faut_min from editmask within w_liste_patients_report_rdv
end type
type uo_filtre_email from uo_filtre_emails within w_liste_patients_report_rdv
end type
type cb_chgt_etat from uo_picturebutton_390x120 within w_liste_patients_report_rdv
end type
type st_6 from statictext within w_liste_patients_report_rdv
end type
type dw_etat from datawindow within w_liste_patients_report_rdv
end type
type gb_chgt_etat from groupbox within w_liste_patients_report_rdv
end type
end forward

global type w_liste_patients_report_rdv from w_liste_patients
string title = "Liste des Rendez-vous pour Report de Rendez-vous"
st_1 st_1
st_2 st_2
st_3 st_3
uo_edition uo_edition
cb_lettres cb_lettres
em_date_min em_date_min
em_date_max em_date_max
em_time_min em_time_min
em_time_max em_time_max
em_faut_max em_faut_max
st_4 st_4
st_5 st_5
em_faut_min em_faut_min
uo_filtre_email uo_filtre_email
cb_chgt_etat cb_chgt_etat
st_6 st_6
dw_etat dw_etat
gb_chgt_etat gb_chgt_etat
end type
global w_liste_patients_report_rdv w_liste_patients_report_rdv

type variables

string v_code_etat, v_nom_etat
end variables

forward prototypes
public subroutine prepa ()
end prototypes

public subroutine prepa ();string pra_min,pra_max,typ
double code_min,code_max
datetime date_min,date_max
integer faut_min, faut_max

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

	date_min = datetime(em_date_min.getTheDate(),time(em_time_min.text))
	date_max = datetime(em_date_max.getTheDate(),time(em_time_max.text))
	
	faut_min = integer(em_faut_min.text)
	faut_max = integer(em_faut_max.text)
	
	
	open(w_patience)
	dw_liste.retrieve(code_min,code_max,pra_min,pra_max,date_min,date_max, faut_min, faut_max)
	close(w_patience)

//	em_nb.text = string(dw_liste.rowcount())+" Rendez-vous"
//	em_nb.visible = true
	
	cb_chgt_etat.enabled(true)


end if

end subroutine

event open;call super::open;
em_date_min.setDate(today())
em_date_max.setDate(date(year(today()),12,31))

em_time_min.text = '00:00'
em_time_max.text = '23:59'

// on prend les négatifs éventuels
em_min.text = string(min)

uo_filtre_email.dw_liste = dw_liste
uo_filtre_email.em_statut_mere = em_nb

// Etat de rdv si changement .. report cabinet par défaut
select top 1 etat_report_cabinet into :v_code_etat from param ; 

dw_etat.settransobject(sqlca)
dw_etat.retrieve()

dw_etat.setitem(1, "code", v_code_etat)




end event

on w_liste_patients_report_rdv.create
int iCurrent
call super::create
this.st_1=create st_1
this.st_2=create st_2
this.st_3=create st_3
this.uo_edition=create uo_edition
this.cb_lettres=create cb_lettres
this.em_date_min=create em_date_min
this.em_date_max=create em_date_max
this.em_time_min=create em_time_min
this.em_time_max=create em_time_max
this.em_faut_max=create em_faut_max
this.st_4=create st_4
this.st_5=create st_5
this.em_faut_min=create em_faut_min
this.uo_filtre_email=create uo_filtre_email
this.cb_chgt_etat=create cb_chgt_etat
this.st_6=create st_6
this.dw_etat=create dw_etat
this.gb_chgt_etat=create gb_chgt_etat
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.st_1
this.Control[iCurrent+2]=this.st_2
this.Control[iCurrent+3]=this.st_3
this.Control[iCurrent+4]=this.uo_edition
this.Control[iCurrent+5]=this.cb_lettres
this.Control[iCurrent+6]=this.em_date_min
this.Control[iCurrent+7]=this.em_date_max
this.Control[iCurrent+8]=this.em_time_min
this.Control[iCurrent+9]=this.em_time_max
this.Control[iCurrent+10]=this.em_faut_max
this.Control[iCurrent+11]=this.st_4
this.Control[iCurrent+12]=this.st_5
this.Control[iCurrent+13]=this.em_faut_min
this.Control[iCurrent+14]=this.uo_filtre_email
this.Control[iCurrent+15]=this.cb_chgt_etat
this.Control[iCurrent+16]=this.st_6
this.Control[iCurrent+17]=this.dw_etat
this.Control[iCurrent+18]=this.gb_chgt_etat
end on

on w_liste_patients_report_rdv.destroy
call super::destroy
destroy(this.st_1)
destroy(this.st_2)
destroy(this.st_3)
destroy(this.uo_edition)
destroy(this.cb_lettres)
destroy(this.em_date_min)
destroy(this.em_date_max)
destroy(this.em_time_min)
destroy(this.em_time_max)
destroy(this.em_faut_max)
destroy(this.st_4)
destroy(this.st_5)
destroy(this.em_faut_min)
destroy(this.uo_filtre_email)
destroy(this.cb_chgt_etat)
destroy(this.st_6)
destroy(this.dw_etat)
destroy(this.gb_chgt_etat)
end on

type p_fond from w_liste_patients`p_fond within w_liste_patients_report_rdv
end type

type cb_imprimer from w_liste_patients`cb_imprimer within w_liste_patients_report_rdv
integer x = 1669
integer width = 411
integer taborder = 160
string text = "Liste"
end type

type cb_autre from w_liste_patients`cb_autre within w_liste_patients_report_rdv
integer x = 2491
integer y = 1920
integer width = 411
integer height = 104
integer taborder = 130
end type

event cb_autre::clicked;call super::clicked;cb_lettres.enabled ( false)
cb_lien_word.enabled ( false)
cb_chgt_etat.enabled(false)

end event

type cb_fermer from w_liste_patients`cb_fermer within w_liste_patients_report_rdv
integer x = 2903
integer width = 411
integer taborder = 170
end type

type cb_ecran from w_liste_patients`cb_ecran within w_liste_patients_report_rdv
integer x = 530
integer width = 411
integer taborder = 180
end type

event cb_ecran::clicked;call super::clicked;cb_lettres.enabled ( true)
cb_lien_word.enabled ( true)
end event

type cb_lien_word from w_liste_patients`cb_lien_word within w_liste_patients_report_rdv
boolean visible = true
integer x = 3314
integer width = 411
integer taborder = 70
end type

event cb_lien_word::clicked;int	tab_type[1] = {lettre_report_rdv}


traitement_word(tab_type, dw_liste)

end event

type uo_size from w_liste_patients`uo_size within w_liste_patients_report_rdv
integer taborder = 80
end type

type rb_un from w_liste_patients`rb_un within w_liste_patients_report_rdv
end type

type rb_tous from w_liste_patients`rb_tous within w_liste_patients_report_rdv
end type

type em_nb from w_liste_patients`em_nb within w_liste_patients_report_rdv
integer taborder = 120
end type

type em_max from w_liste_patients`em_max within w_liste_patients_report_rdv
end type

type em_min from w_liste_patients`em_min within w_liste_patients_report_rdv
end type

type dw_1 from w_liste_patients`dw_1 within w_liste_patients_report_rdv
integer taborder = 90
end type

type gb_1 from w_liste_patients`gb_1 within w_liste_patients_report_rdv
integer taborder = 100
end type

type dw_prati from w_liste_patients`dw_prati within w_liste_patients_report_rdv
integer taborder = 150
end type

type cbx_filtre from w_liste_patients`cbx_filtre within w_liste_patients_report_rdv
end type

type st_min from w_liste_patients`st_min within w_liste_patients_report_rdv
end type

type st_max from w_liste_patients`st_max within w_liste_patients_report_rdv
end type

type dw_liste from w_liste_patients`dw_liste within w_liste_patients_report_rdv
integer y = 0
integer height = 1796
integer taborder = 140
string dataobject = "dw_liste_patients_report_rdv_edition"
end type

type st_1 from statictext within w_liste_patients_report_rdv
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
boolean enabled = false
string text = "Rendez-vous à reporter :"
boolean focusrectangle = false
end type

type st_2 from statictext within w_liste_patients_report_rdv
integer x = 1486
integer y = 908
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

type st_3 from statictext within w_liste_patients_report_rdv
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
boolean enabled = false
string text = "Entre le "
boolean focusrectangle = false
end type

type uo_edition from uo_edition_rtf within w_liste_patients_report_rdv
event destroy ( )
boolean visible = false
integer x = 1367
integer y = 280
integer taborder = 110
boolean border = false
long backcolor = 1090519039
end type

on uo_edition.destroy
call uo_edition_rtf::destroy
end on

type cb_lettres from uo_picturebutton_390x120 within w_liste_patients_report_rdv
integer x = 2080
integer y = 1868
integer width = 411
integer taborder = 190
boolean bringtotop = true
boolean enabled = false
string text = "Lettres"
string iconname = "ACTIONS_imprimer.png"
end type

event clicked;call super::clicked;Datastore dw_donnees

string pra_min,pra_max,tit,np
double code_min,code_max,tot,cpt
datetime date_min,date_max,date_min2
long nb, i, j, nblig
string code[10]

double nbrdv,patcour, code_courant
datetime report

dw_donnees = CREATE DataStore
dw_donnees.DataObject = "dw_lettre_report"
dw_donnees.SetTransObject(SQLCA)

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

date_min = datetime(date(left(em_date_min.text,10)),time(em_time_min.text))
date_max = datetime(date(left(em_date_max.text,10)),time(em_time_max.text))




// Pour contourner le bug version 2007 ... impression lettre que pour le 1er patient ....
// On parcourt la liste est imprimon lettre par lettre !!!

nblig = dw_liste.rowcount()

for cpt = 1 to nblig
	
	code_courant = dw_liste.getitemnumber(cpt,"code") 
	report = dw_liste.getitemdatetime(cpt,"rdv_rdv")

	dw_donnees.retrieve(code_courant,code_courant,pra_min,pra_max,date_min,date_max)

	uo_edition.edition(dw_donnees,"lettre_report_rendez_vous", false, "" )
	
	ajout_histo_editions(code_courant,"REPRDV",today(),"Rdv du "+string(report,"dd/mm/yyyy à hh:mm"))
NEXT	
 




DESTROY dw_donnees
end event

type em_date_min from uo_date_calendrier within w_liste_patients_report_rdv
integer x = 782
integer y = 888
integer width = 439
integer taborder = 30
boolean bringtotop = true
end type

on em_date_min.destroy
call uo_date_calendrier::destroy
end on

type em_date_max from uo_date_calendrier within w_liste_patients_report_rdv
integer x = 1719
integer y = 888
integer width = 439
integer taborder = 50
boolean bringtotop = true
end type

on em_date_max.destroy
call uo_date_calendrier::destroy
end on

type em_time_min from editmask within w_liste_patients_report_rdv
integer x = 1230
integer y = 888
integer width = 261
integer height = 92
integer taborder = 40
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
string text = "none"
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = timemask!
string mask = "hh:mm"
boolean spin = true
end type

type em_time_max from editmask within w_liste_patients_report_rdv
integer x = 2167
integer y = 888
integer width = 261
integer height = 92
integer taborder = 60
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
string text = "none"
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = timemask!
string mask = "hh:mm"
boolean spin = true
end type

type em_faut_max from editmask within w_liste_patients_report_rdv
integer x = 1307
integer y = 1132
integer width = 247
integer height = 88
integer taborder = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
string text = "99"
alignment alignment = center!
borderstyle borderstyle = stylelowered!
string mask = "##"
boolean spin = true
double increment = 1
string minmax = "0~~99"
end type

type st_4 from statictext within w_liste_patients_report_rdv
integer x = 1170
integer y = 1140
integer width = 119
integer height = 72
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
string facename = "Arial"
long backcolor = 553648127
boolean enabled = false
string text = "A"
alignment alignment = center!
boolean focusrectangle = false
end type

type st_5 from statictext within w_liste_patients_report_rdv
integer x = 471
integer y = 1140
integer width = 375
integer height = 72
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
string facename = "Arial"
long backcolor = 553648127
boolean enabled = false
string text = "Fauteuil N°"
alignment alignment = center!
boolean focusrectangle = false
end type

type em_faut_min from editmask within w_liste_patients_report_rdv
integer x = 850
integer y = 1132
integer width = 247
integer height = 88
integer taborder = 70
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
string text = "0"
alignment alignment = center!
borderstyle borderstyle = stylelowered!
string mask = "##"
boolean spin = true
double increment = 1
string minmax = "0~~99"
end type

type uo_filtre_email from uo_filtre_emails within w_liste_patients_report_rdv
string tag = "no resize all"
integer x = 942
integer y = 1856
integer taborder = 140
boolean bringtotop = true
end type

on uo_filtre_email.destroy
call uo_filtre_emails::destroy
end on

type cb_chgt_etat from uo_picturebutton_390x120 within w_liste_patients_report_rdv
integer x = 2491
integer y = 1816
integer width = 411
integer height = 104
integer taborder = 90
boolean bringtotop = true
boolean enabled = false
string text = "Chgt Etat"
string iconname = "ACTIONS_executer.png"
end type

event clicked;call super::clicked;double v_code_interne, v_code_patient

	v_code_etat = dw_etat.gettext()

  SELECT "etat_rdv"."nom"  
    INTO :v_nom_etat  
    FROM "etat_rdv"  
   WHERE "etat_rdv"."code" = :v_code_etat   ;

if messagebox("ATTENTION","Vous allez modifier l'état de tous les rendez-vous listés en '" + v_nom_etat + "' ?", Question!, YesNo!, 2 ) = 1 then
	
	ok_mdp = false

	guo_fenetre_modale.wf_ouvrir(w_mot_passe_administrateur)
	
	if ok_mdp then
	
		open(w_patience)
		long lig, tot
		
		tot = dw_liste.rowcount() 
		
		for lig = 1 to tot
			v_code_interne = round(dw_liste.getitemNumber(lig, "rdv_code_interne"),0)
			v_code_patient = dw_liste.getitemNumber(lig, "code")
			
			update rdv set absent = :v_code_etat where round(code_interne,0) = :v_code_interne ;
			
			// Vérification si saisie d'un commentaire clinique pour absence ....
			// Un commit est fait dans la fonction !!
			commentaire_clinique_absence (v_code_patient, date(dw_liste.getitemdatetime(lig,"rdv_rdv")), v_code_etat, v_code_interne)

		next
		
		if sqlca.sqlcode = 0 then
			commit ; 
			messagebox("INFORMATION", "Mise à jour terminée !")
		else
			rollback ;
			messagebox("ATTENTION","Erreur dans la mise à jour des rendez-vous !~n~n"+sqlca.sqlerrtext)
		end if
		
		close(w_patience)
	
	end if
end if

end event

type st_6 from statictext within w_liste_patients_report_rdv
integer x = 352
integer y = 1448
integer width = 736
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 15780518
string text = "Etat après changement"
boolean focusrectangle = false
end type

type dw_etat from datawindow within w_liste_patients_report_rdv
string tag = "position brush"
integer x = 1106
integer y = 1448
integer width = 992
integer height = 72
integer taborder = 110
boolean bringtotop = true
string dataobject = "dw_cherche_etat_rdv"
boolean border = false
boolean livescroll = true
end type

type gb_chgt_etat from groupbox within w_liste_patients_report_rdv
integer x = 288
integer y = 1320
integer width = 2126
integer height = 272
integer taborder = 90
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean italic = true
long textcolor = 33554432
long backcolor = 15780518
string text = "Si changement d~'état"
end type

