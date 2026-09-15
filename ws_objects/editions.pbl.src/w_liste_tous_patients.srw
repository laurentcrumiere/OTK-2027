$PBExportHeader$w_liste_tous_patients.srw
forward
global type w_liste_tous_patients from w_liste_patients
end type
type rb_patient from radiobutton within w_liste_tous_patients
end type
type rb_enfant from radiobutton within w_liste_tous_patients
end type
type rb_adulte from radiobutton within w_liste_tous_patients
end type
type rb_cmu_tous from radiobutton within w_liste_tous_patients
end type
type rb_cmu_que from radiobutton within w_liste_tous_patients
end type
type rb_cmu_sauf from radiobutton within w_liste_tous_patients
end type
type dw_mise_en_evidence from datawindow within w_liste_tous_patients
end type
type dw_liste_emails from datawindow within w_liste_tous_patients
end type
type pb_email from uo_picturebutton_390x120 within w_liste_tous_patients
end type
type uo_filtre_email from uo_filtre_emails within w_liste_tous_patients
end type
type gb_2 from gb_1 within w_liste_tous_patients
end type
type gb_cmu from gb_1 within w_liste_tous_patients
end type
end forward

global type w_liste_tous_patients from w_liste_patients
integer width = 3648
rb_patient rb_patient
rb_enfant rb_enfant
rb_adulte rb_adulte
rb_cmu_tous rb_cmu_tous
rb_cmu_que rb_cmu_que
rb_cmu_sauf rb_cmu_sauf
dw_mise_en_evidence dw_mise_en_evidence
dw_liste_emails dw_liste_emails
pb_email pb_email
uo_filtre_email uo_filtre_email
gb_2 gb_2
gb_cmu gb_cmu
end type
global w_liste_tous_patients w_liste_tous_patients

type variables
string sel
end variables

forward prototypes
public subroutine prepa ()
public subroutine ajouter_email (string v_email)
end prototypes

public subroutine prepa ();string pra_min,pra_max, titre
string clausew,clauseo
double code_min,code_max

if not prepa_faite then
	//prepa_faite = true
	if rb_tous.checked then
		pra_min="      "
		pra_max="ZZZZZZ"
		titre = "Pour tous les praticiens"
	else
		pra_min=dw_prati.getitemstring(dw_prati.getrow(),"code")
		pra_max=dw_prati.getitemstring(dw_prati.getrow(),"code")
		titre = "Pour le Dr "+dw_prati.getitemstring(dw_prati.getrow(),"nom")
	end if

	code_min = double(em_min.text)
	code_max = double(em_max.text)
	
	// Affichage de la liste suivant si on veut tous les patients, que les adultes ou que les enfants
	// Clause Where paramétrée et titre de la datawindow paramétré
	// Tous cochés
	IF rb_patient.checked THEN
		clausew = ""
		titre= 'Liste de tous les Patients'
	ELSE
		// adultes cochés
		IF rb_adulte.checked THEN
			clausew = " AND patient.adulte = 'O' " 
		 	titre = 'Liste des Patients Adultes'
		ELSE
			// enfants cochés
			clausew = " AND (patient.adulte = 'N' or patient.adulte is null)  " 
			titre = 'Liste des Patients Enfants'
		END IF
	END IF	
	
	
	if not rb_cmu_tous.checked then
		string v_code_mise_en_evidence, v_nom_mise_en_evidence
		v_code_mise_en_evidence = dw_mise_en_evidence.gettext()
		
		select isnull(nom,'') into :v_nom_mise_en_evidence from mise_en_evidence where code = :v_code_mise_en_evidence ;
		
		IF rb_cmu_que.checked THEN
			clausew = clausew + " AND patient.mise_en_evidence = '" + dw_mise_en_evidence.gettext()+  "' " 
			titre = titre + ' - ' + v_nom_mise_en_evidence
		ELSE
			IF rb_cmu_sauf.checked THEN
				clausew = clausew + " AND (patient.mise_en_evidence <> '" + dw_mise_en_evidence.gettext()+  "'  or mise_en_evidence is null)  " 
				titre = titre + ' - Sauf : ' + v_nom_mise_en_evidence
			end if
		END IF
	end if
		
	
	
	// Clause ORDER BY toujours la même
	clauseo = " ORDER BY Patient.nom DESC, patient.prenom DESC"

	dw_liste.Modify('sous_titre.text = "'+ titre +'"')
	dw_liste.Modify('datawindow.table.select ="'+ sel + clausew + clauseo  +'"')

//messagebox("trace", sel + clausew + clauseo)


	open(w_patience)
	dw_liste.retrieve(code_min,code_max,pra_min,pra_max)
	close(w_patience)
	
	//em_nb.text = string(dw_liste.rowcount())+" Dossiers"
	//em_nb.visible = true
end if

end subroutine

public subroutine ajouter_email (string v_email);// Ajouter une adresse email à la liste

if len(trim(v_email)) > 0 then
	dw_liste_emails.insertrow(0)
	dw_liste_emails.SetItem(dw_liste_emails.rowcount(), "email", v_email)
end if

return

end subroutine

on w_liste_tous_patients.create
int iCurrent
call super::create
this.rb_patient=create rb_patient
this.rb_enfant=create rb_enfant
this.rb_adulte=create rb_adulte
this.rb_cmu_tous=create rb_cmu_tous
this.rb_cmu_que=create rb_cmu_que
this.rb_cmu_sauf=create rb_cmu_sauf
this.dw_mise_en_evidence=create dw_mise_en_evidence
this.dw_liste_emails=create dw_liste_emails
this.pb_email=create pb_email
this.uo_filtre_email=create uo_filtre_email
this.gb_2=create gb_2
this.gb_cmu=create gb_cmu
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.rb_patient
this.Control[iCurrent+2]=this.rb_enfant
this.Control[iCurrent+3]=this.rb_adulte
this.Control[iCurrent+4]=this.rb_cmu_tous
this.Control[iCurrent+5]=this.rb_cmu_que
this.Control[iCurrent+6]=this.rb_cmu_sauf
this.Control[iCurrent+7]=this.dw_mise_en_evidence
this.Control[iCurrent+8]=this.dw_liste_emails
this.Control[iCurrent+9]=this.pb_email
this.Control[iCurrent+10]=this.uo_filtre_email
this.Control[iCurrent+11]=this.gb_2
this.Control[iCurrent+12]=this.gb_cmu
end on

on w_liste_tous_patients.destroy
call super::destroy
destroy(this.rb_patient)
destroy(this.rb_enfant)
destroy(this.rb_adulte)
destroy(this.rb_cmu_tous)
destroy(this.rb_cmu_que)
destroy(this.rb_cmu_sauf)
destroy(this.dw_mise_en_evidence)
destroy(this.dw_liste_emails)
destroy(this.pb_email)
destroy(this.uo_filtre_email)
destroy(this.gb_2)
destroy(this.gb_cmu)
end on

event open;call super::open;// Récupération du select de la DataWindow 
sel = dw_liste.Describe("datawindow.table.select") 


if not france  then
	gb_cmu.text = "Choix des patients"
end if



dw_mise_en_evidence.settransobject(sqlca)
dw_mise_en_evidence.retrieve()

uo_filtre_email.dw_liste = dw_liste
uo_filtre_email.em_statut_mere = em_nb
end event

type p_fond from w_liste_patients`p_fond within w_liste_tous_patients
end type

type cb_imprimer from w_liste_patients`cb_imprimer within w_liste_tous_patients
integer x = 2144
end type

type cb_autre from w_liste_patients`cb_autre within w_liste_tous_patients
integer x = 1682
end type

event cb_autre::clicked;call super::clicked;

pb_email.enabled ( false)
end event

type cb_fermer from w_liste_patients`cb_fermer within w_liste_tous_patients
integer x = 3067
end type

type cb_ecran from w_liste_patients`cb_ecran within w_liste_tous_patients
integer x = 489
end type

event cb_ecran::clicked;call super::clicked;

pb_email.enabled ( true)
end event

type cb_lien_word from w_liste_patients`cb_lien_word within w_liste_tous_patients
end type

type uo_size from w_liste_patients`uo_size within w_liste_tous_patients
end type

type rb_un from w_liste_patients`rb_un within w_liste_tous_patients
end type

type rb_tous from w_liste_patients`rb_tous within w_liste_tous_patients
end type

type em_nb from w_liste_patients`em_nb within w_liste_tous_patients
end type

type em_max from w_liste_patients`em_max within w_liste_tous_patients
end type

type em_min from w_liste_patients`em_min within w_liste_tous_patients
end type

type dw_1 from w_liste_patients`dw_1 within w_liste_tous_patients
end type

type gb_1 from w_liste_patients`gb_1 within w_liste_tous_patients
end type

type dw_prati from w_liste_patients`dw_prati within w_liste_tous_patients
end type

type cbx_filtre from w_liste_patients`cbx_filtre within w_liste_tous_patients
integer x = 5
integer y = 1868
integer width = 480
integer height = 104
end type

type st_min from w_liste_patients`st_min within w_liste_tous_patients
end type

type st_max from w_liste_patients`st_max within w_liste_tous_patients
end type

type dw_liste from w_liste_patients`dw_liste within w_liste_tous_patients
integer x = 14
integer width = 3561
end type

type rb_patient from radiobutton within w_liste_tous_patients
integer x = 416
integer y = 1092
integer width = 402
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
string text = "Tous"
boolean checked = true
end type

type rb_enfant from radiobutton within w_liste_tous_patients
integer x = 416
integer y = 1216
integer width = 402
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
string text = "Enfants"
end type

type rb_adulte from radiobutton within w_liste_tous_patients
integer x = 416
integer y = 1340
integer width = 402
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
string text = "Adultes"
end type

type rb_cmu_tous from radiobutton within w_liste_tous_patients
integer x = 1467
integer y = 1092
integer width = 402
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
string text = "Tous"
boolean checked = true
end type

event clicked;dw_mise_en_evidence.visible = false

end event

type rb_cmu_que from radiobutton within w_liste_tous_patients
integer x = 1467
integer y = 1216
integer width = 274
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
string text = "Que"
end type

event clicked;
dw_mise_en_evidence.visible = true
dw_mise_en_evidence.y = this.y
end event

type rb_cmu_sauf from radiobutton within w_liste_tous_patients
integer x = 1467
integer y = 1340
integer width = 279
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
string text = "Sauf"
end type

event clicked;dw_mise_en_evidence.visible = true
dw_mise_en_evidence.y = this.y
end event

type dw_mise_en_evidence from datawindow within w_liste_tous_patients
string tag = "no resize all"
boolean visible = false
integer x = 1865
integer y = 1216
integer width = 928
integer height = 72
integer taborder = 80
boolean bringtotop = true
string title = "none"
string dataobject = "dw_cherche_mise_en_evidence"
boolean border = false
boolean livescroll = true
end type

type dw_liste_emails from datawindow within w_liste_tous_patients
boolean visible = false
integer x = 2496
integer y = 644
integer width = 686
integer height = 400
integer taborder = 30
boolean bringtotop = true
string title = "none"
string dataobject = "dw_liste_emails"
boolean livescroll = true
borderstyle borderstyle = styleraised!
end type

type pb_email from uo_picturebutton_390x120 within w_liste_tous_patients
integer x = 2606
integer y = 1864
integer width = 457
integer taborder = 120
boolean bringtotop = true
boolean enabled = false
string text = "Exp. Emails"
string iconname = "ACTIONS_Exporter.png"
end type

event clicked;call super::clicked;

if Messagebox("ATTENTION","Confirmez-vous l'exportation des adresses emails des patients listés ?", Question!, YesNo!, 2) = 1 then

	long lig, tot
	string v_email
	
	dw_liste_emails.reset()
	
	tot = dw_liste.rowcount()
	for lig = 1 to tot
		
		ajouter_email(dw_liste.getItemString(lig, "patient_email"))
		ajouter_email(dw_liste.getItemString(lig, "patient_email_patient"))
		ajouter_email(dw_liste.getItemString(lig, "patient_email_parent2"))
		ajouter_email(dw_liste.getItemString(lig, "patient_email_payeur"))

	next

	if dw_liste_emails.rowcount() > 0 then
		dw_liste_emails.saveas()
	else
		Messagebox("ATTENTION","Il n'y a aucune adresse email à exporter.")
	end if
end if
end event

type uo_filtre_email from uo_filtre_emails within w_liste_tous_patients
string tag = "no resize all"
integer x = 951
integer y = 1856
integer taborder = 160
boolean bringtotop = true
end type

on uo_filtre_email.destroy
call uo_filtre_emails::destroy
end on

type gb_2 from gb_1 within w_liste_tous_patients
integer y = 992
integer width = 850
integer height = 472
integer taborder = 60
string text = "Choix des patients"
end type

type gb_cmu from gb_1 within w_liste_tous_patients
integer x = 1385
integer y = 992
integer width = 1819
integer height = 472
integer taborder = 70
string text = "Choix des patients C2S ou autres"
end type

