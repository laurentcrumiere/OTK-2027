$PBExportHeader$w_liste_patients_langue.srw
forward
global type w_liste_patients_langue from w_liste_patients
end type
type uo_filtre_email from uo_filtre_emails within w_liste_patients_langue
end type
type st_2 from statictext within w_liste_patients_langue
end type
type st_3 from statictext within w_liste_patients_langue
end type
type rb_p1 from radiobutton within w_liste_patients_langue
end type
type rb_p2 from radiobutton within w_liste_patients_langue
end type
type rb_2 from radiobutton within w_liste_patients_langue
end type
type rb_autre from radiobutton within w_liste_patients_langue
end type
type rb_sans1 from radiobutton within w_liste_patients_langue
end type
type rb_sans2 from radiobutton within w_liste_patients_langue
end type
type dw_langue1 from datawindow within w_liste_patients_langue
end type
type dw_langue2 from datawindow within w_liste_patients_langue
end type
type gb_recherche from groupbox within w_liste_patients_langue
end type
end forward

global type w_liste_patients_langue from w_liste_patients
integer width = 3648
string title = "Liste des Patients selon Langue Parlée"
uo_filtre_email uo_filtre_email
st_2 st_2
st_3 st_3
rb_p1 rb_p1
rb_p2 rb_p2
rb_2 rb_2
rb_autre rb_autre
rb_sans1 rb_sans1
rb_sans2 rb_sans2
dw_langue1 dw_langue1
dw_langue2 dw_langue2
gb_recherche gb_recherche
end type
global w_liste_patients_langue w_liste_patients_langue

type variables
string sel
end variables

forward prototypes
public subroutine prepa ()
end prototypes

public subroutine prepa ();string pra_min,pra_max, titre
double code_min,code_max
integer  v_langue1, v_langue2
string clausew

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
	
	
	v_langue1 = dw_langue1.getitemnumber(1, "code")
	v_langue2 = dw_langue2.getitemnumber(1, "code")



	clausew = "  and  (patient.numero_dossier between " + string(code_min, "0" ) + " and " + string(code_max)  + " and patient.code_praticien between '" + pra_min + "' and '" + pra_max + "')"
	
	// clause where selon les langues 
	if rb_p1.checked then 
		clausew = clausew + " and patient.langue1 = " + string(v_langue1)
		Titre = titre + " - Patient ayant la Langue 1"
	else
		if rb_p2.checked then 
			clausew = clausew + " and patient.langue2 = " + string(v_langue2)
			Titre = titre + " - Patient ayant la langue 2"
		else
			if rb_2.checked then 
				clausew = clausew + " and patient.langue1 = " + string(v_langue1) + " and patient.langue2 = " + string(v_langue2)
				Titre = titre + " - Patient ayant la langue 1 et la langue 2"
			else
				if rb_sans1.checked then
					clausew = clausew + " and patient.langue1 is null "
					Titre = titre + " - Patient sans langue 1"
				else
					if rb_sans2.checked then
						clausew = clausew + " and patient.langue2 is null "
						Titre = titre + " - Patient sans langue 2"
					else
						clausew = clausew + " and (patient.langue1 = " + string(v_langue1) + " or patient.langue2 = " + string(v_langue2) + ")"
						Titre = titre + " - Patient ayant la langue 1 ou et la langue 2"
					end if
				end if
			end if
		end if
	end if
	
	
	// titre et clause
	dw_liste.Modify('datawindow.table.select ="' + sel + clausew + '"')
	dw_liste.object.sous_titre.text  = titre

	open(w_patience)
	dw_liste.retrieve(v_langue1, v_langue2)
	close(w_patience)
	
	//em_nb.text = string(dw_liste.rowcount())+" Dossiers"
	//em_nb.visible = true
end if

end subroutine

on w_liste_patients_langue.create
int iCurrent
call super::create
this.uo_filtre_email=create uo_filtre_email
this.st_2=create st_2
this.st_3=create st_3
this.rb_p1=create rb_p1
this.rb_p2=create rb_p2
this.rb_2=create rb_2
this.rb_autre=create rb_autre
this.rb_sans1=create rb_sans1
this.rb_sans2=create rb_sans2
this.dw_langue1=create dw_langue1
this.dw_langue2=create dw_langue2
this.gb_recherche=create gb_recherche
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.uo_filtre_email
this.Control[iCurrent+2]=this.st_2
this.Control[iCurrent+3]=this.st_3
this.Control[iCurrent+4]=this.rb_p1
this.Control[iCurrent+5]=this.rb_p2
this.Control[iCurrent+6]=this.rb_2
this.Control[iCurrent+7]=this.rb_autre
this.Control[iCurrent+8]=this.rb_sans1
this.Control[iCurrent+9]=this.rb_sans2
this.Control[iCurrent+10]=this.dw_langue1
this.Control[iCurrent+11]=this.dw_langue2
this.Control[iCurrent+12]=this.gb_recherche
end on

on w_liste_patients_langue.destroy
call super::destroy
destroy(this.uo_filtre_email)
destroy(this.st_2)
destroy(this.st_3)
destroy(this.rb_p1)
destroy(this.rb_p2)
destroy(this.rb_2)
destroy(this.rb_autre)
destroy(this.rb_sans1)
destroy(this.rb_sans2)
destroy(this.dw_langue1)
destroy(this.dw_langue2)
destroy(this.gb_recherche)
end on

event open;call super::open;
uo_filtre_email.dw_liste = dw_liste
uo_filtre_email.em_statut_mere = em_nb

gb_recherche.backcolor = couleur_fond_fenetre
//rb_p1.backcolor = couleur_fond_fenetre
//rb_p2.backcolor = couleur_fond_fenetre
//rb_2.backcolor = couleur_fond_fenetre
//rb_autre.backcolor = couleur_fond_fenetre
//

// On va gérer la clause Where en dynamique !!!!
sel = dw_liste.Describe("datawindow.table.select")

dw_langue1.settransobject(sqlca)
dw_langue2.settransobject(sqlca)

dw_langue1.retrieve()
dw_langue2.retrieve()

end event

type p_fond from w_liste_patients`p_fond within w_liste_patients_langue
end type

type cb_imprimer from w_liste_patients`cb_imprimer within w_liste_patients_langue
integer x = 2249
end type

type cb_autre from w_liste_patients`cb_autre within w_liste_patients_langue
integer x = 1765
end type

type cb_fermer from w_liste_patients`cb_fermer within w_liste_patients_langue
integer x = 2734
end type

type cb_ecran from w_liste_patients`cb_ecran within w_liste_patients_langue
integer x = 526
end type

type cb_lien_word from w_liste_patients`cb_lien_word within w_liste_patients_langue
end type

type uo_size from w_liste_patients`uo_size within w_liste_patients_langue
end type

type rb_un from w_liste_patients`rb_un within w_liste_patients_langue
end type

type rb_tous from w_liste_patients`rb_tous within w_liste_patients_langue
end type

type em_nb from w_liste_patients`em_nb within w_liste_patients_langue
end type

type em_max from w_liste_patients`em_max within w_liste_patients_langue
end type

type em_min from w_liste_patients`em_min within w_liste_patients_langue
end type

type dw_1 from w_liste_patients`dw_1 within w_liste_patients_langue
end type

type gb_1 from w_liste_patients`gb_1 within w_liste_patients_langue
end type

type dw_prati from w_liste_patients`dw_prati within w_liste_patients_langue
end type

type cbx_filtre from w_liste_patients`cbx_filtre within w_liste_patients_langue
end type

type st_min from w_liste_patients`st_min within w_liste_patients_langue
end type

type st_max from w_liste_patients`st_max within w_liste_patients_langue
end type

type dw_liste from w_liste_patients`dw_liste within w_liste_patients_langue
integer x = 14
integer width = 3561
string dataobject = "dw_liste_patients_langue_parlee_edition"
end type

type uo_filtre_email from uo_filtre_emails within w_liste_patients_langue
string tag = "no resize all"
integer x = 1010
integer y = 1856
integer taborder = 160
boolean bringtotop = true
end type

on uo_filtre_email.destroy
call uo_filtre_emails::destroy
end on

type st_2 from statictext within w_liste_patients_langue
integer x = 169
integer y = 1052
integer width = 407
integer height = 72
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
string facename = "Arial"
long backcolor = 553648127
string text = "Langue 1 : "
alignment alignment = right!
end type

type st_3 from statictext within w_liste_patients_langue
integer x = 1678
integer y = 1044
integer width = 375
integer height = 72
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
string facename = "Arial"
long backcolor = 553648127
string text = "Langue 2 :"
alignment alignment = right!
end type

type rb_p1 from radiobutton within w_liste_patients_langue
integer x = 736
integer y = 1352
integer width = 457
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 553648127
string text = "Que Langue 1"
boolean checked = true
end type

type rb_p2 from radiobutton within w_liste_patients_langue
integer x = 736
integer y = 1452
integer width = 457
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 553648127
string text = "Que Langue 2"
end type

type rb_2 from radiobutton within w_liste_patients_langue
integer x = 736
integer y = 1552
integer width = 457
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 553648127
string text = "Les 2"
end type

type rb_autre from radiobutton within w_liste_patients_langue
integer x = 736
integer y = 1652
integer width = 475
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 553648127
string text = "L~'une ou l~'autre"
end type

type rb_sans1 from radiobutton within w_liste_patients_langue
integer x = 1445
integer y = 1356
integer width = 485
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 553648127
string text = "Sans Langue 1"
end type

type rb_sans2 from radiobutton within w_liste_patients_langue
integer x = 1445
integer y = 1456
integer width = 485
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 553648127
string text = "Sans Langue 2"
end type

type dw_langue1 from datawindow within w_liste_patients_langue
string tag = "no resize all"
integer x = 626
integer y = 1036
integer width = 965
integer height = 88
integer taborder = 30
boolean bringtotop = true
string title = "none"
string dataobject = "dw_cherche_langue"
boolean border = false
boolean livescroll = true
end type

type dw_langue2 from datawindow within w_liste_patients_langue
string tag = "no resize all"
integer x = 2094
integer y = 1040
integer width = 965
integer height = 88
integer taborder = 40
boolean bringtotop = true
string title = "none"
string dataobject = "dw_cherche_langue"
boolean border = false
boolean livescroll = true
end type

type gb_recherche from groupbox within w_liste_patients_langue
integer x = 681
integer y = 1264
integer width = 1289
integer height = 532
integer taborder = 30
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean italic = true
long textcolor = 33554432
long backcolor = 67108864
string text = "Critères de recherche "
end type

