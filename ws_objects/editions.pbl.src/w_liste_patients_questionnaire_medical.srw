$PBExportHeader$w_liste_patients_questionnaire_medical.srw
$PBExportComments$Héritée de liste_patients
forward
global type w_liste_patients_questionnaire_medical from w_liste_patients
end type
type st_1 from statictext within w_liste_patients_questionnaire_medical
end type
type st_3 from statictext within w_liste_patients_questionnaire_medical
end type
type em_date_min from uo_date_calendrier within w_liste_patients_questionnaire_medical
end type
type em_date_max from uo_date_calendrier within w_liste_patients_questionnaire_medical
end type
type st_2 from statictext within w_liste_patients_questionnaire_medical
end type
type rb_encours from radiobutton within w_liste_patients_questionnaire_medical
end type
type rb_archives from radiobutton within w_liste_patients_questionnaire_medical
end type
type rb_tous_qm from radiobutton within w_liste_patients_questionnaire_medical
end type
type rb_valides from radiobutton within w_liste_patients_questionnaire_medical
end type
type rb_non_valides from radiobutton within w_liste_patients_questionnaire_medical
end type
type rb_tous_valide from radiobutton within w_liste_patients_questionnaire_medical
end type
type pb_archive from uo_picturebutton_390x120 within w_liste_patients_questionnaire_medical
end type
type uo_filtre_email from uo_filtre_emails within w_liste_patients_questionnaire_medical
end type
type gb_2 from groupbox within w_liste_patients_questionnaire_medical
end type
type gb_3 from groupbox within w_liste_patients_questionnaire_medical
end type
end forward

global type w_liste_patients_questionnaire_medical from w_liste_patients
integer width = 4699
integer height = 2756
string title = "Questionnaires Médicaux (suivi)"
st_1 st_1
st_3 st_3
em_date_min em_date_min
em_date_max em_date_max
st_2 st_2
rb_encours rb_encours
rb_archives rb_archives
rb_tous_qm rb_tous_qm
rb_valides rb_valides
rb_non_valides rb_non_valides
rb_tous_valide rb_tous_valide
pb_archive pb_archive
uo_filtre_email uo_filtre_email
gb_2 gb_2
gb_3 gb_3
end type
global w_liste_patients_questionnaire_medical w_liste_patients_questionnaire_medical

forward prototypes
public subroutine prepa ()
end prototypes

public subroutine prepa ();string v_type_dossier_min, v_type_dossier_max
string pra_min,pra_max
double v_type_min, v_type_max
double v_temps_min, v_temps_max
date v_date_min, v_date_max
string filtre

double code_min,code_max

string titre

if not prepa_faite then
	//prepa_faite = true
	
	// Praticien
	if rb_tous.checked then
		pra_min="      "
		pra_max="ZZZZZZ"
		Titre = "Tous praticiens"
	else
		pra_min=dw_prati.getitemstring(dw_prati.getrow(),"code")
		pra_max=dw_prati.getitemstring(dw_prati.getrow(),"code")
		Titre = "Un praticien"
	end if



	code_min = double(em_min.text)
	code_max = double(em_max.text)

	Titre = Titre + " - Du dossier "+string(code_min)+" au "+string(code_max)
	
	v_date_min = em_date_min.gettheDate()
	v_date_max = em_date_max.gettheDate()

	Titre = Titre + " - Envoyés du "+string(v_date_min)+" au "+string(v_date_max)


	// En cours ?
	filtre = ""
	if rb_encours.checked then
		filtre = " (archive <> 'O' or isnull(archive)) "
		Titre = Titre + " -  En cours"
	else
		if rb_archives.checked then
			filtre = "archive = 'O'"
			Titre = Titre + " -  Archivés"
		else
			filtre = ""
		end if
	end if
	
	
	// validés ?
	if rb_valides.checked then
		if len(trim(filtre)) > 0 then
			filtre = filtre + " and " 
		end if
		filtre =  filtre + "not isnull(validation)"
		Titre = Titre + " -  Validés"
	else
		if rb_non_valides.checked then
			if len(trim(filtre)) > 0 then
				filtre = filtre + " and " 
			end if
			filtre =  filtre + "isnull(validation)"
			Titre = Titre + " -  Non encore validés"
		end if
	end if
	
	

	dw_liste.SetFilter(filtre)
	dw_liste.filter()
	uo_filtre_email.filtre_initial = filtre

	

	open(w_patience)
	
	dw_liste.object.titre.text = titre

	dw_liste.retrieve(code_min,code_max,pra_min,pra_max, v_date_min, v_date_max)
	close(w_patience)

	//em_nb.text = string(dw_liste.rowcount())+" Questionnaires"
	//em_nb.visible = true
end if

end subroutine

on w_liste_patients_questionnaire_medical.create
int iCurrent
call super::create
this.st_1=create st_1
this.st_3=create st_3
this.em_date_min=create em_date_min
this.em_date_max=create em_date_max
this.st_2=create st_2
this.rb_encours=create rb_encours
this.rb_archives=create rb_archives
this.rb_tous_qm=create rb_tous_qm
this.rb_valides=create rb_valides
this.rb_non_valides=create rb_non_valides
this.rb_tous_valide=create rb_tous_valide
this.pb_archive=create pb_archive
this.uo_filtre_email=create uo_filtre_email
this.gb_2=create gb_2
this.gb_3=create gb_3
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.st_1
this.Control[iCurrent+2]=this.st_3
this.Control[iCurrent+3]=this.em_date_min
this.Control[iCurrent+4]=this.em_date_max
this.Control[iCurrent+5]=this.st_2
this.Control[iCurrent+6]=this.rb_encours
this.Control[iCurrent+7]=this.rb_archives
this.Control[iCurrent+8]=this.rb_tous_qm
this.Control[iCurrent+9]=this.rb_valides
this.Control[iCurrent+10]=this.rb_non_valides
this.Control[iCurrent+11]=this.rb_tous_valide
this.Control[iCurrent+12]=this.pb_archive
this.Control[iCurrent+13]=this.uo_filtre_email
this.Control[iCurrent+14]=this.gb_2
this.Control[iCurrent+15]=this.gb_3
end on

on w_liste_patients_questionnaire_medical.destroy
call super::destroy
destroy(this.st_1)
destroy(this.st_3)
destroy(this.em_date_min)
destroy(this.em_date_max)
destroy(this.st_2)
destroy(this.rb_encours)
destroy(this.rb_archives)
destroy(this.rb_tous_qm)
destroy(this.rb_valides)
destroy(this.rb_non_valides)
destroy(this.rb_tous_valide)
destroy(this.pb_archive)
destroy(this.uo_filtre_email)
destroy(this.gb_2)
destroy(this.gb_3)
end on

event open;call super::open;
em_date_min.SetDate(date(year(today()), 1, 1))
em_date_max.SetDate(today())
uo_filtre_email.dw_liste = dw_liste
uo_filtre_email.em_statut_mere = em_nb

em_min.text = string(min)


end event

type p_fond from w_liste_patients`p_fond within w_liste_patients_questionnaire_medical
integer x = 2674
integer y = 272
end type

type cb_imprimer from w_liste_patients`cb_imprimer within w_liste_patients_questionnaire_medical
integer x = 2702
integer y = 2452
integer width = 553
end type

event cb_imprimer::clicked;call super::clicked;	pb_archive.enabled ( false)
end event

type cb_autre from w_liste_patients`cb_autre within w_liste_patients_questionnaire_medical
integer x = 2094
integer y = 2452
integer width = 553
end type

event cb_autre::clicked;call super::clicked;

	pb_archive.enabled ( false)

end event

type cb_fermer from w_liste_patients`cb_fermer within w_liste_patients_questionnaire_medical
integer x = 3918
integer y = 2452
integer width = 553
integer taborder = 120
end type

type cb_ecran from w_liste_patients`cb_ecran within w_liste_patients_questionnaire_medical
integer x = 704
integer y = 2452
integer width = 553
integer taborder = 130
end type

event cb_ecran::clicked;call super::clicked;

if dw_liste.rowcount() > 0 then 
	
	pb_archive.enabled ( true)
	
end if
	
end event

type cb_lien_word from w_liste_patients`cb_lien_word within w_liste_patients_questionnaire_medical
integer x = 3246
integer y = 2280
end type

type uo_size from w_liste_patients`uo_size within w_liste_patients_questionnaire_medical
end type

type rb_un from w_liste_patients`rb_un within w_liste_patients_questionnaire_medical
integer x = 389
integer y = 212
end type

type rb_tous from w_liste_patients`rb_tous within w_liste_patients_questionnaire_medical
integer x = 389
integer y = 116
end type

type em_nb from w_liste_patients`em_nb within w_liste_patients_questionnaire_medical
end type

type em_max from w_liste_patients`em_max within w_liste_patients_questionnaire_medical
integer y = 420
end type

type em_min from w_liste_patients`em_min within w_liste_patients_questionnaire_medical
integer y = 420
end type

type dw_1 from w_liste_patients`dw_1 within w_liste_patients_questionnaire_medical
end type

type gb_1 from w_liste_patients`gb_1 within w_liste_patients_questionnaire_medical
integer y = 36
end type

type dw_prati from w_liste_patients`dw_prati within w_liste_patients_questionnaire_medical
boolean visible = true
integer y = 216
end type

type cbx_filtre from w_liste_patients`cbx_filtre within w_liste_patients_questionnaire_medical
integer x = 96
integer y = 2472
integer width = 553
end type

type st_min from w_liste_patients`st_min within w_liste_patients_questionnaire_medical
integer y = 432
end type

type st_max from w_liste_patients`st_max within w_liste_patients_questionnaire_medical
integer y = 432
end type

type dw_liste from w_liste_patients`dw_liste within w_liste_patients_questionnaire_medical
integer x = 9
integer width = 4599
integer height = 2388
string dataobject = "dw_liste_patients_questionnaires_medicaux"
end type

type st_1 from statictext within w_liste_patients_questionnaire_medical
integer x = 343
integer y = 616
integer width = 878
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
string facename = "Arial"
boolean underline = true
long backcolor = 553648127
string text = "Questionnaires envoyés :"
end type

type st_3 from statictext within w_liste_patients_questionnaire_medical
integer x = 507
integer y = 724
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

type em_date_min from uo_date_calendrier within w_liste_patients_questionnaire_medical
integer x = 814
integer y = 716
integer taborder = 250
boolean bringtotop = true
end type

on em_date_min.destroy
call uo_date_calendrier::destroy
end on

type em_date_max from uo_date_calendrier within w_liste_patients_questionnaire_medical
integer x = 1563
integer y = 716
integer taborder = 260
boolean bringtotop = true
end type

on em_date_max.destroy
call uo_date_calendrier::destroy
end on

type st_2 from statictext within w_liste_patients_questionnaire_medical
integer x = 1257
integer y = 724
integer width = 256
integer height = 72
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
string facename = "Arial"
long backcolor = 553648127
string text = "et le"
alignment alignment = center!
end type

type rb_encours from radiobutton within w_liste_patients_questionnaire_medical
integer x = 434
integer y = 1140
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
string text = "En cours"
boolean checked = true
end type

type rb_archives from radiobutton within w_liste_patients_questionnaire_medical
integer x = 439
integer y = 1260
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
string text = "Archivés"
end type

type rb_tous_qm from radiobutton within w_liste_patients_questionnaire_medical
integer x = 439
integer y = 1384
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
end type

type rb_valides from radiobutton within w_liste_patients_questionnaire_medical
integer x = 1874
integer y = 1140
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
string text = "Validés"
end type

type rb_non_valides from radiobutton within w_liste_patients_questionnaire_medical
integer x = 1874
integer y = 1260
integer width = 649
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
string text = "Non encore Validés"
boolean checked = true
end type

type rb_tous_valide from radiobutton within w_liste_patients_questionnaire_medical
integer x = 1874
integer y = 1384
integer width = 498
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
end type

type pb_archive from uo_picturebutton_390x120 within w_liste_patients_questionnaire_medical
integer x = 3310
integer y = 2452
integer width = 553
integer taborder = 40
boolean bringtotop = true
boolean enabled = false
string text = "Arch/Désar."
string iconname = "outputNext!.png"
end type

event clicked;call super::clicked;

long lig

if dw_liste.rowcount() > 0 then
	lig = dw_liste.getrow()

	if dw_liste.GetItemString(lig, "Archive") = "O" then
		if Messagebox("ATTENTION","Ce Questionnaire est actuellement Archivé.~n~nVous allez le réactiver.~n~nConfirmez-vous ?", Question!, YesNo!, 2) = 1 then
			dw_liste.SetItem(lig, "Archive", "N") 
			if dw_liste.update() = 1 then 
				commit ;
			else
				messagebox("ATTENTION","Erreur dans la mise à jour de la base de données : ~n~n"+Sqlca.Sqlerrtext)
				rollback ;
			end if
		end if
	else
		if Messagebox("ATTENTION","Ce Questionnaire est actuellement Actif.~n~nVous allez l'archiver.~n~nConfirmez-vous ?", Question!, YesNo!, 2) = 1 then
			dw_liste.SetItem(lig, "Archive", "O") 
			if dw_liste.update() = 1 then 
				commit ;
			else
				messagebox("ATTENTION","Erreur dans la mise à jour de la base de données : ~n~n"+Sqlca.Sqlerrtext)
				rollback ;
			end if
		end if
		
		
	end if
end if
end event

type uo_filtre_email from uo_filtre_emails within w_liste_patients_questionnaire_medical
string tag = "no resize all"
integer x = 1312
integer y = 2436
integer taborder = 200
boolean bringtotop = true
end type

on uo_filtre_email.destroy
call uo_filtre_emails::destroy
end on

type gb_2 from groupbox within w_liste_patients_questionnaire_medical
integer x = 288
integer y = 1012
integer width = 1221
integer height = 520
integer taborder = 260
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean italic = true
long textcolor = 33554432
long backcolor = 15780518
string text = "Statut des questionnaires"
end type

type gb_3 from groupbox within w_liste_patients_questionnaire_medical
integer x = 1701
integer y = 1012
integer width = 1221
integer height = 520
integer taborder = 270
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean italic = true
long textcolor = 33554432
long backcolor = 15780518
string text = "Validation par le patient"
end type

