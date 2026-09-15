$PBExportHeader$w_taches.srw
forward
global type w_taches from w_fenetre_arakis
end type
type dw_liste from u_basedw within w_taches
end type
type uo_resize from resize_fenetre within w_taches
end type
type cb_enregistrer from uo_picturebutton_390x120 within w_taches
end type
type rb_administrateur from radiobutton within w_taches
end type
type rb_toutes_destinataires from radiobutton within w_taches
end type
type rb_personnelles from radiobutton within w_taches
end type
type rb_realisees from radiobutton within w_taches
end type
type rb_toutes_statut from radiobutton within w_taches
end type
type rb_a_realiser from radiobutton within w_taches
end type
type rb_toutes_echeances from radiobutton within w_taches
end type
type rb_echeances from radiobutton within w_taches
end type
type cb_imprimer from uo_picturebutton_390x120 within w_taches
end type
type cb_supprimer from uo_picturebutton_390x120 within w_taches
end type
type cb_repeter from uo_picturebutton_390x120 within w_taches
end type
type cb_ajouter from uo_picturebutton_390x120 within w_taches
end type
type pb_1 from uo_picturebutton_390x120_fermer within w_taches
end type
type pb_modifier from uo_picturebutton_390x120 within w_taches
end type
type pb_annuler from uo_picturebutton_390x120 within w_taches
end type
type rb_toutes_provenances from radiobutton within w_taches
end type
type rb_que_provenance from radiobutton within w_taches
end type
type dw_utilisateurs from datawindow within w_taches
end type
type rb_tous_patients from radiobutton within w_taches
end type
type rb_que_patient from radiobutton within w_taches
end type
type st_patient from statictext within w_taches
end type
type cb_purger from uo_picturebutton_390x120 within w_taches
end type
type gb_echeance from groupbox within w_taches
end type
type gb_2 from groupbox within w_taches
end type
type gb_1 from groupbox within w_taches
end type
type gb_3 from groupbox within w_taches
end type
type gb_4 from groupbox within w_taches
end type
end forward

global type w_taches from w_fenetre_arakis
integer width = 4325
integer height = 2296
string title = "Gestion des Tâches"
boolean controlmenu = false
boolean minbox = false
boolean maxbox = false
boolean clientedge = true
dw_liste dw_liste
uo_resize uo_resize
cb_enregistrer cb_enregistrer
rb_administrateur rb_administrateur
rb_toutes_destinataires rb_toutes_destinataires
rb_personnelles rb_personnelles
rb_realisees rb_realisees
rb_toutes_statut rb_toutes_statut
rb_a_realiser rb_a_realiser
rb_toutes_echeances rb_toutes_echeances
rb_echeances rb_echeances
cb_imprimer cb_imprimer
cb_supprimer cb_supprimer
cb_repeter cb_repeter
cb_ajouter cb_ajouter
pb_1 pb_1
pb_modifier pb_modifier
pb_annuler pb_annuler
rb_toutes_provenances rb_toutes_provenances
rb_que_provenance rb_que_provenance
dw_utilisateurs dw_utilisateurs
rb_tous_patients rb_tous_patients
rb_que_patient rb_que_patient
st_patient st_patient
cb_purger cb_purger
gb_echeance gb_echeance
gb_2 gb_2
gb_1 gb_1
gb_3 gb_3
gb_4 gb_4
end type
global w_taches w_taches

type variables



double var_code_local
end variables

forward prototypes
public subroutine filtre_taches (integer type_filtre, datawindow dw)
end prototypes

public subroutine filtre_taches (integer type_filtre, datawindow dw);

// Filtre la datawindow en fonction des choix :

string filtre, filtre1, filtre2

// Type filtre indique quel élément à changé

if type_filtre = 1 then
	// clic sur les échéances => retrieve
	if rb_echeances.checked then
		// taches à échéance
		dw.retrieve(today())
	else
		dw.retrieve(relativedate(today(),73000))
	end if

end if


long tot
tot = dw_liste.rowcount()

// clic sur autre chose => on joue sur le filtre
if rb_a_realiser.checked then
	// Taches non encore réalisées
	filtre1 = "statut = 'N'" 
else
	if rb_realisees.checked then 
		// Taches realisées
		filtre1 = "statut = 'O'"
	else
		// toutes
		filtre1 = ""
	end if
end if

if rb_personnelles.checked then
	
		
		filtre2 = fxg_filtre_taches_utilisateur(utilisateur_code)
		

	
else
	if rb_toutes_destinataires.checked then
	// Toutes les taches non confidentielles
		filtre2 = "confidentiel = 'N'"
	else
		// toutes les taches de tout le monde ... il faut le mot de passe Admin pour cliquer la dessus !!
		filtre2 = ""
	end if
end if

// Génération du filtre

if len(trim(filtre2 )) > 0 then
	if len(trim(filtre1 )) > 0 then
		filtre = filtre1 + " and "+ filtre2
	else
		filtre = filtre2
	end if
else
	if len(trim(filtre1 )) > 0 then
		filtre = filtre1
	else
		filtre = ""
	end if
end if	

if rb_que_provenance.checked then
	// filtre sur user
	if len(trim(filtre)) > 0 then
		filtre = filtre + " and " 
	end if
	filtre = filtre + "utilisateur_emetteur = '" + dw_utilisateurs.gettext() + "'"
end if

if rb_que_patient.checked then
	// filtre sur patient
	if len(trim(filtre)) > 0 then
		filtre = filtre + " and " 
	end if
	filtre = "code = " + string(var_code_local)
end if


// Application du filtre
dw.setfilter(filtre)
dw.filter()
dw.groupcalc()
end subroutine

on w_taches.create
int iCurrent
call super::create
this.dw_liste=create dw_liste
this.uo_resize=create uo_resize
this.cb_enregistrer=create cb_enregistrer
this.rb_administrateur=create rb_administrateur
this.rb_toutes_destinataires=create rb_toutes_destinataires
this.rb_personnelles=create rb_personnelles
this.rb_realisees=create rb_realisees
this.rb_toutes_statut=create rb_toutes_statut
this.rb_a_realiser=create rb_a_realiser
this.rb_toutes_echeances=create rb_toutes_echeances
this.rb_echeances=create rb_echeances
this.cb_imprimer=create cb_imprimer
this.cb_supprimer=create cb_supprimer
this.cb_repeter=create cb_repeter
this.cb_ajouter=create cb_ajouter
this.pb_1=create pb_1
this.pb_modifier=create pb_modifier
this.pb_annuler=create pb_annuler
this.rb_toutes_provenances=create rb_toutes_provenances
this.rb_que_provenance=create rb_que_provenance
this.dw_utilisateurs=create dw_utilisateurs
this.rb_tous_patients=create rb_tous_patients
this.rb_que_patient=create rb_que_patient
this.st_patient=create st_patient
this.cb_purger=create cb_purger
this.gb_echeance=create gb_echeance
this.gb_2=create gb_2
this.gb_1=create gb_1
this.gb_3=create gb_3
this.gb_4=create gb_4
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_liste
this.Control[iCurrent+2]=this.uo_resize
this.Control[iCurrent+3]=this.cb_enregistrer
this.Control[iCurrent+4]=this.rb_administrateur
this.Control[iCurrent+5]=this.rb_toutes_destinataires
this.Control[iCurrent+6]=this.rb_personnelles
this.Control[iCurrent+7]=this.rb_realisees
this.Control[iCurrent+8]=this.rb_toutes_statut
this.Control[iCurrent+9]=this.rb_a_realiser
this.Control[iCurrent+10]=this.rb_toutes_echeances
this.Control[iCurrent+11]=this.rb_echeances
this.Control[iCurrent+12]=this.cb_imprimer
this.Control[iCurrent+13]=this.cb_supprimer
this.Control[iCurrent+14]=this.cb_repeter
this.Control[iCurrent+15]=this.cb_ajouter
this.Control[iCurrent+16]=this.pb_1
this.Control[iCurrent+17]=this.pb_modifier
this.Control[iCurrent+18]=this.pb_annuler
this.Control[iCurrent+19]=this.rb_toutes_provenances
this.Control[iCurrent+20]=this.rb_que_provenance
this.Control[iCurrent+21]=this.dw_utilisateurs
this.Control[iCurrent+22]=this.rb_tous_patients
this.Control[iCurrent+23]=this.rb_que_patient
this.Control[iCurrent+24]=this.st_patient
this.Control[iCurrent+25]=this.cb_purger
this.Control[iCurrent+26]=this.gb_echeance
this.Control[iCurrent+27]=this.gb_2
this.Control[iCurrent+28]=this.gb_1
this.Control[iCurrent+29]=this.gb_3
this.Control[iCurrent+30]=this.gb_4
end on

on w_taches.destroy
call super::destroy
destroy(this.dw_liste)
destroy(this.uo_resize)
destroy(this.cb_enregistrer)
destroy(this.rb_administrateur)
destroy(this.rb_toutes_destinataires)
destroy(this.rb_personnelles)
destroy(this.rb_realisees)
destroy(this.rb_toutes_statut)
destroy(this.rb_a_realiser)
destroy(this.rb_toutes_echeances)
destroy(this.rb_echeances)
destroy(this.cb_imprimer)
destroy(this.cb_supprimer)
destroy(this.cb_repeter)
destroy(this.cb_ajouter)
destroy(this.pb_1)
destroy(this.pb_modifier)
destroy(this.pb_annuler)
destroy(this.rb_toutes_provenances)
destroy(this.rb_que_provenance)
destroy(this.dw_utilisateurs)
destroy(this.rb_tous_patients)
destroy(this.rb_que_patient)
destroy(this.st_patient)
destroy(this.cb_purger)
destroy(this.gb_echeance)
destroy(this.gb_2)
destroy(this.gb_1)
destroy(this.gb_3)
destroy(this.gb_4)
end on

event open;call super::open;

uo_resize.taille(this)

dw_liste.settransobject(sqlca)


dw_utilisateurs.settransobject(sqlca)
dw_utilisateurs.retrieve()


// Par défaut, selon l'utilisateur
string v_tpd
select taches_par_defaut into :v_tpd from utilisateurs where code = :utilisateur_code ;

if v_tpd = 'P' then 
	rb_personnelles.checked = true
	rb_toutes_destinataires.checked = false
	rb_administrateur.checked = false
else
	rb_personnelles.checked = false
	rb_toutes_destinataires.checked = true
	rb_administrateur.checked = false
end if


// Echéances
if profilestring(dir_ini+inifile_orthokis,"TACHES","Echéances","E") = "E" then
	rb_echeances.checked = true
	rb_toutes_echeances.checked = false
else
	rb_echeances.checked = false
	rb_toutes_echeances.checked = true
end if

// Statut
if profilestring(dir_ini+inifile_orthokis,"TACHES","Statut","A") = "A" then
	rb_a_realiser.checked = true
	rb_toutes_statut.checked = false
	rb_realisees.checked = false
else
	if profilestring(dir_ini+inifile_orthokis,"TACHES","Statut","A") = "T" then
		rb_a_realiser.checked = false
		rb_toutes_statut.checked = true
		rb_realisees.checked = false
	else
		rb_a_realiser.checked = false
		rb_toutes_statut.checked = false
		rb_realisees.checked = true
	end if
end if

// provenance
if profilestring(dir_ini+inifile_orthokis,"TACHES","Provenance","T") = "T" then
	rb_toutes_provenances.checked = true
	rb_que_provenance.checked = false
	dw_utilisateurs.visible = false
else
	rb_toutes_provenances.checked = false
	rb_que_provenance.checked = true
	dw_utilisateurs.visible = true
	dw_utilisateurs.SetItem(1, "code", profilestring(dir_ini+inifile_orthokis,"TACHES","Provenance_user",""))
end if


// pour le retrieve initial
filtre_taches(1,dw_liste)



end event

event resize;
//width = 


uo_resize.retaille(this)

end event

event close;call super::close;
// Mémo de l'échéance
if rb_echeances.checked then
	Setprofilestring(dir_ini+inifile_orthokis,"TACHES","Echéances","E") 
else
	Setprofilestring(dir_ini+inifile_orthokis,"TACHES","Echéances","T") 
end if

// Statut
if rb_a_realiser.checked then
	Setprofilestring(dir_ini+inifile_orthokis,"TACHES","Statut","A")
else
	if rb_toutes_statut.checked then
		Setprofilestring(dir_ini+inifile_orthokis,"TACHES","Statut","T")
	else
		Setprofilestring(dir_ini+inifile_orthokis,"TACHES","Statut","R")
	end if
end if


// provenance
if rb_toutes_provenances.checked then
	Setprofilestring(dir_ini+inifile_orthokis,"TACHES","Provenance","T") 
else
	Setprofilestring(dir_ini+inifile_orthokis,"TACHES","Provenance","Q") 
	Setprofilestring(dir_ini+inifile_orthokis,"TACHES","Provenance_user", dw_utilisateurs.GetItemString(1, "code") )
end if

end event

type p_fond from w_fenetre_arakis`p_fond within w_taches
integer x = 1710
integer y = 332
end type

type dw_liste from u_basedw within w_taches
string tag = "brush no resize centrer"
integer x = 27
integer y = 12
integer width = 3744
integer height = 1764
integer taborder = 10
string dataobject = "dw_taches_liste"
end type

event retrieveend;call super::retrieveend;filtre_taches(2,dw_liste)
end event

event doubleclicked;call super::doubleclicked;

// Mise à jour

pb_modifier.triggerevent(clicked!)
end event

event rbuttondown;call super::rbuttondown;


if row > 0 then
	if not isnull(GetItemNumber(row, "code") ) then
		This.SelectRow(0,False)
		This.SelectRow(row,True)
		This.setrow(row)
		OpenMenuPatient_Listes(this)
	end if
end if
end event

type uo_resize from resize_fenetre within w_taches
boolean visible = false
integer x = 1577
integer y = 736
integer taborder = 20
end type

on uo_resize.destroy
call resize_fenetre::destroy
end on

type cb_enregistrer from uo_picturebutton_390x120 within w_taches
integer x = 3808
integer y = 1804
integer width = 457
integer taborder = 40
integer textsize = -9
string text = "&Enregistrer"
boolean default = true
string iconname = "ACTIONS_enregistrer.png"
end type

event clicked;call super::clicked;
dw_liste.accepttext()

if dw_liste.update( ) = 1 then 
	commit ;
else
	rollback ;
end if

filtre_taches(1,dw_liste)
filtre_taches(2,dw_liste)

end event

type rb_administrateur from radiobutton within w_taches
integer x = 923
integer y = 2004
integer width = 562
integer height = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 15780518
string text = "Toutes (droit Admin.)"
end type

event clicked;
// on ne le peut qu'avec les droits admin
ok_mdp = false

guo_fenetre_modale.wf_ouvrir(w_mot_passe_administrateur)

if ok_mdp then

	filtre_taches(2,dw_liste)
else
	messagebox("ATTENTION","Vous ne pouvez réaliser ce filtre sans mot de passe administrateur !")
	this.checked = false
	rb_toutes_destinataires.checked = true
end if
end event

type rb_toutes_destinataires from radiobutton within w_taches
integer x = 923
integer y = 1932
integer width = 558
integer height = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 15780518
string text = "Toutes (non confid.)"
end type

event clicked;filtre_taches(2,dw_liste)

end event

type rb_personnelles from radiobutton within w_taches
integer x = 923
integer y = 1860
integer width = 558
integer height = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 15780518
string text = "Tâches personnelles"
boolean checked = true
end type

event clicked;filtre_taches(2,dw_liste)

end event

type rb_realisees from radiobutton within w_taches
integer x = 567
integer y = 2004
integer width = 297
integer height = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 15780518
string text = "Réalisées"
end type

event clicked;filtre_taches(2,dw_liste)

end event

type rb_toutes_statut from radiobutton within w_taches
integer x = 334
integer y = 2008
integer width = 224
integer height = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 15780518
string text = "Toutes"
end type

event clicked;

filtre_taches(2,dw_liste)

end event

type rb_a_realiser from radiobutton within w_taches
integer x = 37
integer y = 2008
integer width = 288
integer height = 80
integer textsize = -8
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

filtre_taches(2,dw_liste)

end event

type rb_toutes_echeances from radiobutton within w_taches
integer x = 475
integer y = 1848
integer width = 288
integer height = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 15780518
string text = "Toutes"
end type

event clicked;filtre_taches(1,dw_liste)

end event

type rb_echeances from radiobutton within w_taches
integer x = 69
integer y = 1848
integer width = 370
integer height = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 15780518
string text = "A échéance"
boolean checked = true
end type

event clicked;

filtre_taches(1,dw_liste)

end event

type cb_imprimer from uo_picturebutton_390x120 within w_taches
integer x = 2889
integer y = 1976
integer width = 457
integer taborder = 30
integer textsize = -9
string text = "&Imprimer"
string iconname = "ACTIONS_imprimer.png"
end type

event clicked;call super::clicked;



dw_liste.print()
end event

type cb_supprimer from uo_picturebutton_390x120 within w_taches
integer x = 3351
integer y = 1976
integer width = 457
integer taborder = 20
integer textsize = -9
string text = "&Supprimer"
string iconname = "ACTIONS_supprimer.png"
end type

event clicked;call super::clicked;

if dw_liste.rowcount() > 0 then
	dw_liste.deleterow(dw_liste.getrow())
end if
end event

type cb_repeter from uo_picturebutton_390x120 within w_taches
integer x = 3808
integer y = 1464
integer width = 457
integer taborder = 20
integer textsize = -9
string text = "&Répéter"
string iconname = "lc_copy.png"
end type

event clicked;call super::clicked;

if dw_liste.rowcount() >  0 then
	

	dw_liste.accepttext()
	
	//openwithparm(w_taches_periodicite,dw_liste.getitemnumber(dw_liste.getrow(),"id"))
	guo_fenetre_modale.wf_ouvrir_param_nombre(w_taches_periodicite, dw_liste.getitemnumber(dw_liste.getrow(),"id"))	
	
	
end if
end event

type cb_ajouter from uo_picturebutton_390x120 within w_taches
integer x = 2889
integer y = 1804
integer width = 457
integer taborder = 10
integer textsize = -9
string text = "&Ajouter"
string iconname = "ACTIONS_ajouter.png"
end type

event clicked;call super::clicked;
double v_id , lig
param_win[1] = ""

guo_fenetre_modale.wf_ouvrir_param_nombre(w_taches_fiche, 0)	
//openWithParm(w_taches_fiche, 0)

// La tache vient d'être ajoutée
select max(id) into :v_id from taches ;

date v_date_ech
select date_echeance into :v_date_ech from taches  where id = :v_id ;

if v_date_ech > today() then
	rb_toutes_echeances.checked = true
	rb_echeances.checked = false
end if

// pour le retrieve
filtre_taches(1, dw_liste)

if v_id <> 0 then
	lig = dw_liste.find ("id = " + string(v_id), 0, 99999)
	dw_liste.ScrollToRow(lig)
	dw_liste.SelectRow(0,False)
	dw_liste.SelectRow(lig,True)
	dw_liste.setrow(lig)
end if
end event

type pb_1 from uo_picturebutton_390x120_fermer within w_taches
integer x = 3808
integer y = 1976
integer width = 457
integer taborder = 10
integer textsize = -9
end type

event clicked;fermer_fenetre(parent)
end event

type pb_modifier from uo_picturebutton_390x120 within w_taches
integer x = 3351
integer y = 1804
integer width = 457
integer taborder = 20
boolean bringtotop = true
integer textsize = -9
string text = "&Modifier"
string iconname = "ACTIONS_modifier.png"
end type

event clicked;call super::clicked;



if dw_liste.rowcount() > 0 then
	long v_id, lig
	lig = dw_liste.GetRow()
	v_id = dw_liste.GetItemNumber(lig, "id")
	
	param_win[1] = ""
	guo_fenetre_modale.wf_ouvrir_param_nombre(w_taches_fiche, v_id)	
	//openWithParm(w_taches_fiche, v_id)
	
	
	// pour le retrieve
	filtre_taches(1, dw_liste)

	dw_liste.ScrollToRow(lig)
	dw_liste.SelectRow(0,False)
	dw_liste.SelectRow(lig,True)
	dw_liste.setrow(lig)
end if

end event

type pb_annuler from uo_picturebutton_390x120 within w_taches
integer x = 3808
integer y = 1640
integer width = 457
integer taborder = 30
boolean bringtotop = true
integer textsize = -9
string text = "A&nnuler"
string iconname = "ACTIONS_annuler.png"
end type

event clicked;call super::clicked;

filtre_taches(1,dw_liste)
end event

type rb_toutes_provenances from radiobutton within w_taches
integer x = 1554
integer y = 1848
integer width = 251
integer height = 72
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 15780518
string text = "Toutes"
boolean checked = true
end type

event clicked;dw_utilisateurs.visible = false

filtre_taches(2,dw_liste)
end event

type rb_que_provenance from radiobutton within w_taches
integer x = 1797
integer y = 1848
integer width = 155
integer height = 72
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 15780518
string text = "De"
end type

event clicked;
dw_utilisateurs.visible = true

filtre_taches(2,dw_liste)
end event

type dw_utilisateurs from datawindow within w_taches
string tag = "no resize all"
boolean visible = false
integer x = 1989
integer y = 1856
integer width = 855
integer height = 68
integer taborder = 60
boolean bringtotop = true
string title = "none"
string dataobject = "dw_cherche_utilisateur_petite"
boolean border = false
boolean livescroll = true
end type

event itemchanged;filtre_taches(2,dw_liste)
end event

type rb_tous_patients from radiobutton within w_taches
integer x = 1554
integer y = 2008
integer width = 206
integer height = 72
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 15780518
string text = "Tous"
boolean checked = true
end type

event clicked;
st_patient.visible = false


filtre_taches(2,dw_liste)
end event

type rb_que_patient from radiobutton within w_taches
integer x = 1797
integer y = 2008
integer width = 160
integer height = 72
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 15780518
string text = "Que"
end type

event clicked;
var_suite = false

//open(w_cherche)
guo_fenetre_modale.wf_ouvrir(w_cherche)

if var_suite then
	st_patient.text = var_nom
	var_code_local = var_code
	st_patient.visible = true
else
	st_patient.text = ""
	rb_tous_patients.checked = true
	st_patient.visible = false
end if


filtre_taches(2,dw_liste)
end event

type st_patient from statictext within w_taches
boolean visible = false
integer x = 1989
integer y = 2024
integer width = 823
integer height = 56
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 15780518
boolean focusrectangle = false
end type

type cb_purger from uo_picturebutton_390x120 within w_taches
integer x = 3808
integer y = 1288
integer width = 457
integer taborder = 30
boolean bringtotop = true
integer textsize = -9
string text = "Purger"
string iconname = "ACTIONS_supprimer.png"
end type

event clicked;call super::clicked;ok_mdp = false
guo_fenetre_modale.wf_ouvrir(w_mot_passe_administrateur)

if ok_mdp then
	
	guo_fenetre_modale.wf_ouvrir(w_taches_purge)	
	//open(w_taches_purge)
	
end if

end event

type gb_echeance from groupbox within w_taches
integer y = 1792
integer width = 882
integer height = 152
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean italic = true
long textcolor = 16711680
long backcolor = 15780518
string text = "Echéances"
end type

type gb_2 from groupbox within w_taches
integer x = 5
integer y = 1948
integer width = 882
integer height = 152
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean italic = true
long textcolor = 16711680
long backcolor = 15780518
string text = "Filtre Statut"
end type

type gb_1 from groupbox within w_taches
integer x = 891
integer y = 1792
integer width = 613
integer height = 312
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean italic = true
long textcolor = 16711680
long backcolor = 15780518
string text = "Destinataire"
end type

type gb_3 from groupbox within w_taches
integer x = 1527
integer y = 1796
integer width = 1339
integer height = 152
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean italic = true
long textcolor = 16711680
long backcolor = 15780518
string text = "Provenance"
end type

type gb_4 from groupbox within w_taches
integer x = 1527
integer y = 1948
integer width = 1339
integer height = 152
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean italic = true
long textcolor = 16711680
long backcolor = 15780518
string text = "Patient"
end type

