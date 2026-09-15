$PBExportHeader$w_liste_patients_alertes.srw
forward
global type w_liste_patients_alertes from w_liste_patients
end type
type st_1 from statictext within w_liste_patients_alertes
end type
type st_2 from statictext within w_liste_patients_alertes
end type
type st_3 from statictext within w_liste_patients_alertes
end type
type rb_un_dos from radiobutton within w_liste_patients_alertes
end type
type rb_tous_dos from radiobutton within w_liste_patients_alertes
end type
type dw_dossier from datawindow within w_liste_patients_alertes
end type
type em_date_min from uo_date_calendrier within w_liste_patients_alertes
end type
type em_date_max from uo_date_calendrier within w_liste_patients_alertes
end type
type rb_a_realiser from radiobutton within w_liste_patients_alertes
end type
type rb_toutes_statut from radiobutton within w_liste_patients_alertes
end type
type rb_realisees from radiobutton within w_liste_patients_alertes
end type
type rb_toutes_alertes from radiobutton within w_liste_patients_alertes
end type
type rb_une_alerte from radiobutton within w_liste_patients_alertes
end type
type dw_alerte from datawindow within w_liste_patients_alertes
end type
type uo_filtre_email from uo_filtre_emails within w_liste_patients_alertes
end type
type cbx_afficher_plus from checkbox within w_liste_patients_alertes
end type
type gb_2 from groupbox within w_liste_patients_alertes
end type
type gb_3 from groupbox within w_liste_patients_alertes
end type
type gb_dos from groupbox within w_liste_patients_alertes
end type
end forward

global type w_liste_patients_alertes from w_liste_patients
string title = "Liste des Patients - Alertes"
st_1 st_1
st_2 st_2
st_3 st_3
rb_un_dos rb_un_dos
rb_tous_dos rb_tous_dos
dw_dossier dw_dossier
em_date_min em_date_min
em_date_max em_date_max
rb_a_realiser rb_a_realiser
rb_toutes_statut rb_toutes_statut
rb_realisees rb_realisees
rb_toutes_alertes rb_toutes_alertes
rb_une_alerte rb_une_alerte
dw_alerte dw_alerte
uo_filtre_email uo_filtre_email
cbx_afficher_plus cbx_afficher_plus
gb_2 gb_2
gb_3 gb_3
gb_dos gb_dos
end type
global w_liste_patients_alertes w_liste_patients_alertes

forward prototypes
public subroutine prepa ()
public subroutine filtrer (datawindow dw)
end prototypes

public subroutine prepa ();string pra_min,pra_max,tit,p,dos_min,dos_max
double code_min,code_max, v_code_cour, v_due
date date_min,date_max
long lig, tot
datetime v_proc_rdv, v_dernier_rdv


if not prepa_faite then
	//prepa_faite = true
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
	
	double alerte_min, alerte_max
	if rb_toutes_alertes.checked then
		alerte_min = 0
		alerte_max= 99999999999
	else
		alerte_min = dw_alerte.getitemnumber(dw_alerte.getrow(),"code")
		alerte_max = alerte_min
	end if
	
	code_min = double(em_min.text)
	code_max = double(em_max.text)

	date_min = date(em_date_min.text)
	date_max = date(em_date_max.text)

	// Application du filtre de base
	filtrer(dw_liste)

	tit = tit + " - Entre le "+em_date_min.text+" et le "+em_date_max.text
	open(w_patience)
	dw_liste.Modify("sous_titre.text = '"+tit+"'")
	dw_liste.retrieve(code_min,code_max,pra_min,pra_max,date_min,date_max,dos_min,dos_max,alerte_min, alerte_max)
	
	if cbx_afficher_plus.checked then
		// Mise à jour des infos supplémentaires
		dw_liste.Modify("Datawindow.detail.height = 252")
		tot = dw_liste.rowcount()
		for lig = 1 to tot
			v_code_cour = dw_liste.getitemNumber(lig, "code")
			v_due = due(v_code_cour, today())
			v_proc_rdv = proc_rdv(v_code_cour)
			
			setnull(v_dernier_rdv)

		  SELECT max("rdv"."rdv")
			 INTO :v_dernier_rdv
			 FROM "rdv"  , "etat_rdv"
			WHERE ( "rdv"."code" = :v_code_cour ) AND  ( "rdv"."rdv" < getdate() ) and rdv.absent = etat_rdv.code and etat_rdv.elimine_agenda <> 'O' ;

			
			zerodb(v_due)
			
			dw_liste.setitem(lig, "somme_due", v_due)
			dw_liste.setitem(lig, "proc_rdv", v_proc_rdv)
			dw_liste.setitem(lig, "dernier_rdv", string(v_dernier_rdv, "dd/mm/yyyy à hh:mm"))
		next
	else
		dw_liste.Modify("Datawindow.detail.height = 164")
	end if
	
	
	close(w_patience)

	//em_nb.text = string(dw_liste.rowcount())+" Dossiers"
	//em_nb.visible = true


end if

end subroutine

public subroutine filtrer (datawindow dw);

string filtre


// clic sur autre chose => on joue sur le filtre
if rb_a_realiser.checked then
	// Taches non encore réalisées
	filtre = "patient_alertes_realisee = 'N'" 
else
	if rb_realisees.checked then 
		// Taches realisées
		filtre = "patient_alertes_realisee = 'O'"
	else
		// toutes
		filtre = ""
	end if
end if


dw_liste.setfilter(filtre)
dw_liste.filter()

uo_filtre_email.filtre_initial = filtre

end subroutine

event open;call super::open;em_date_min.setDate(date(1900,1,1))
em_date_max.setDate(today())


dw_dossier.settransobject(SQLCA)
dw_dossier.retrieve() 
dw_alerte.settransobject(SQLCA)
dw_alerte.retrieve() 

uo_filtre_email.dw_liste = dw_liste
uo_filtre_email.em_statut_mere = em_nb
end event

on w_liste_patients_alertes.create
int iCurrent
call super::create
this.st_1=create st_1
this.st_2=create st_2
this.st_3=create st_3
this.rb_un_dos=create rb_un_dos
this.rb_tous_dos=create rb_tous_dos
this.dw_dossier=create dw_dossier
this.em_date_min=create em_date_min
this.em_date_max=create em_date_max
this.rb_a_realiser=create rb_a_realiser
this.rb_toutes_statut=create rb_toutes_statut
this.rb_realisees=create rb_realisees
this.rb_toutes_alertes=create rb_toutes_alertes
this.rb_une_alerte=create rb_une_alerte
this.dw_alerte=create dw_alerte
this.uo_filtre_email=create uo_filtre_email
this.cbx_afficher_plus=create cbx_afficher_plus
this.gb_2=create gb_2
this.gb_3=create gb_3
this.gb_dos=create gb_dos
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.st_1
this.Control[iCurrent+2]=this.st_2
this.Control[iCurrent+3]=this.st_3
this.Control[iCurrent+4]=this.rb_un_dos
this.Control[iCurrent+5]=this.rb_tous_dos
this.Control[iCurrent+6]=this.dw_dossier
this.Control[iCurrent+7]=this.em_date_min
this.Control[iCurrent+8]=this.em_date_max
this.Control[iCurrent+9]=this.rb_a_realiser
this.Control[iCurrent+10]=this.rb_toutes_statut
this.Control[iCurrent+11]=this.rb_realisees
this.Control[iCurrent+12]=this.rb_toutes_alertes
this.Control[iCurrent+13]=this.rb_une_alerte
this.Control[iCurrent+14]=this.dw_alerte
this.Control[iCurrent+15]=this.uo_filtre_email
this.Control[iCurrent+16]=this.cbx_afficher_plus
this.Control[iCurrent+17]=this.gb_2
this.Control[iCurrent+18]=this.gb_3
this.Control[iCurrent+19]=this.gb_dos
end on

on w_liste_patients_alertes.destroy
call super::destroy
destroy(this.st_1)
destroy(this.st_2)
destroy(this.st_3)
destroy(this.rb_un_dos)
destroy(this.rb_tous_dos)
destroy(this.dw_dossier)
destroy(this.em_date_min)
destroy(this.em_date_max)
destroy(this.rb_a_realiser)
destroy(this.rb_toutes_statut)
destroy(this.rb_realisees)
destroy(this.rb_toutes_alertes)
destroy(this.rb_une_alerte)
destroy(this.dw_alerte)
destroy(this.uo_filtre_email)
destroy(this.cbx_afficher_plus)
destroy(this.gb_2)
destroy(this.gb_3)
destroy(this.gb_dos)
end on

type p_fond from w_liste_patients`p_fond within w_liste_patients_alertes
integer x = 2601
integer y = 684
end type

type cb_imprimer from w_liste_patients`cb_imprimer within w_liste_patients_alertes
integer x = 2208
integer taborder = 100
end type

type cb_autre from w_liste_patients`cb_autre within w_liste_patients_alertes
integer x = 1733
end type

type cb_fermer from w_liste_patients`cb_fermer within w_liste_patients_alertes
integer x = 2683
integer taborder = 110
end type

type cb_ecran from w_liste_patients`cb_ecran within w_liste_patients_alertes
integer x = 512
end type

type cb_lien_word from w_liste_patients`cb_lien_word within w_liste_patients_alertes
end type

type uo_size from w_liste_patients`uo_size within w_liste_patients_alertes
end type

type rb_un from w_liste_patients`rb_un within w_liste_patients_alertes
integer x = 485
integer y = 216
end type

type rb_tous from w_liste_patients`rb_tous within w_liste_patients_alertes
integer x = 485
integer y = 120
end type

type em_nb from w_liste_patients`em_nb within w_liste_patients_alertes
integer taborder = 60
end type

type em_max from w_liste_patients`em_max within w_liste_patients_alertes
integer y = 412
end type

type em_min from w_liste_patients`em_min within w_liste_patients_alertes
integer y = 412
string text = "-99999999"
end type

type dw_1 from w_liste_patients`dw_1 within w_liste_patients_alertes
end type

type gb_1 from w_liste_patients`gb_1 within w_liste_patients_alertes
integer x = 320
integer y = 40
integer taborder = 0
end type

type dw_prati from w_liste_patients`dw_prati within w_liste_patients_alertes
integer x = 1243
integer y = 200
integer taborder = 80
end type

type cbx_filtre from w_liste_patients`cbx_filtre within w_liste_patients_alertes
end type

type st_min from w_liste_patients`st_min within w_liste_patients_alertes
integer y = 424
end type

type st_max from w_liste_patients`st_max within w_liste_patients_alertes
integer y = 424
end type

type dw_liste from w_liste_patients`dw_liste within w_liste_patients_alertes
integer x = 23
integer y = 28
integer taborder = 70
string dataobject = "dw_liste_patients_alertes"
end type

type st_1 from statictext within w_liste_patients_alertes
integer x = 347
integer y = 588
integer width = 878
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
string facename = "Arial"
boolean underline = true
long backcolor = 553648127
string text = "Date des Alertes :"
end type

type st_2 from statictext within w_liste_patients_alertes
integer x = 1856
integer y = 596
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

type st_3 from statictext within w_liste_patients_alertes
integer x = 933
integer y = 596
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

type rb_un_dos from radiobutton within w_liste_patients_alertes
integer x = 475
integer y = 916
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

type rb_tous_dos from radiobutton within w_liste_patients_alertes
integer x = 475
integer y = 820
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

type dw_dossier from datawindow within w_liste_patients_alertes
string tag = "position"
boolean visible = false
integer x = 1275
integer y = 916
integer width = 951
integer height = 80
integer taborder = 50
string dataobject = "dw_cherche_dossier"
boolean border = false
end type

type em_date_min from uo_date_calendrier within w_liste_patients_alertes
integer x = 1339
integer y = 580
integer taborder = 150
boolean bringtotop = true
end type

on em_date_min.destroy
call uo_date_calendrier::destroy
end on

type em_date_max from uo_date_calendrier within w_liste_patients_alertes
integer x = 2144
integer y = 580
integer taborder = 160
boolean bringtotop = true
end type

on em_date_max.destroy
call uo_date_calendrier::destroy
end on

type rb_a_realiser from radiobutton within w_liste_patients_alertes
integer x = 475
integer y = 1552
integer width = 517
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 15780518
string text = "A réaliser"
boolean checked = true
end type

event clicked;

filtrer(dw_liste)

end event

type rb_toutes_statut from radiobutton within w_liste_patients_alertes
integer x = 1019
integer y = 1552
integer width = 517
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 15780518
string text = "Toutes"
end type

event clicked;

filtrer(dw_liste)

end event

type rb_realisees from radiobutton within w_liste_patients_alertes
integer x = 1563
integer y = 1552
integer width = 517
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 15780518
string text = "Réalisées"
end type

event clicked;

filtrer(dw_liste)

end event

type rb_toutes_alertes from radiobutton within w_liste_patients_alertes
integer x = 475
integer y = 1192
integer width = 850
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 15780518
string text = "Tous les types d~'alerte"
boolean checked = true
end type

event clicked;dw_alerte.visible = false
end event

type rb_une_alerte from radiobutton within w_liste_patients_alertes
integer x = 475
integer y = 1288
integer width = 667
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 15780518
string text = "Un type d~'alerte"
end type

event clicked;dw_alerte.visible = true
end event

type dw_alerte from datawindow within w_liste_patients_alertes
string tag = "position"
boolean visible = false
integer x = 1198
integer y = 1284
integer width = 1175
integer height = 80
integer taborder = 70
boolean bringtotop = true
string title = "none"
string dataobject = "dw_cherche_alerte"
boolean border = false
boolean livescroll = true
end type

type uo_filtre_email from uo_filtre_emails within w_liste_patients_alertes
string tag = "no resize all"
integer x = 987
integer y = 1852
integer taborder = 200
boolean bringtotop = true
end type

on uo_filtre_email.destroy
call uo_filtre_emails::destroy
end on

type cbx_afficher_plus from checkbox within w_liste_patients_alertes
integer x = 347
integer y = 1732
integer width = 2071
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
string text = "Afficher les derniers et prochains rendez-vous et la somme due"
borderstyle borderstyle = styleraised!
end type

type gb_2 from groupbox within w_liste_patients_alertes
integer x = 311
integer y = 1452
integer width = 2112
integer height = 232
integer taborder = 50
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean italic = true
long backcolor = 15780518
string text = "Filtre Statut"
end type

type gb_3 from groupbox within w_liste_patients_alertes
integer x = 311
integer y = 1104
integer width = 2121
integer height = 304
integer taborder = 60
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean italic = true
long textcolor = 33554432
long backcolor = 15780518
string text = "Choix du type d~'alerte "
end type

type gb_dos from groupbox within w_liste_patients_alertes
integer x = 311
integer y = 740
integer width = 2121
integer height = 304
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

