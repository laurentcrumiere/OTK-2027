$PBExportHeader$w_liste_patients_sans_prochain_soin.srw
$PBExportComments$Héritée de liste_patients
forward
global type w_liste_patients_sans_prochain_soin from w_liste_patients
end type
type rb_un_dos from radiobutton within w_liste_patients_sans_prochain_soin
end type
type rb_tous_dos from radiobutton within w_liste_patients_sans_prochain_soin
end type
type dw_dossier from datawindow within w_liste_patients_sans_prochain_soin
end type
type dw_soins from datawindow within w_liste_patients_sans_prochain_soin
end type
type st_12 from statictext within w_liste_patients_sans_prochain_soin
end type
type st_2 from statictext within w_liste_patients_sans_prochain_soin
end type
type em_date from uo_date_calendrier within w_liste_patients_sans_prochain_soin
end type
type gb_dos from groupbox within w_liste_patients_sans_prochain_soin
end type
end forward

global type w_liste_patients_sans_prochain_soin from w_liste_patients
string title = "Liste des Patients sans prochain soin"
rb_un_dos rb_un_dos
rb_tous_dos rb_tous_dos
dw_dossier dw_dossier
dw_soins dw_soins
st_12 st_12
st_2 st_2
em_date em_date
gb_dos gb_dos
end type
global w_liste_patients_sans_prochain_soin w_liste_patients_sans_prochain_soin

forward prototypes
public subroutine prepa ()
end prototypes

public subroutine prepa ();string pra_min,pra_max		// Praticiens
string dos_min, dos_max	// Types de dossiers
date date_reference			// date de réference
string soin							// Type de soin cherché
double code_min,code_max	// N° Dossiers
string libelle_soin				// Libelle du soin

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

	if rb_tous_dos.checked then
		dos_min="  "
		dos_max="ZZ"
	else
		dos_min =dw_dossier.getitemstring(dw_dossier.getrow(),"code")
		dos_max = dos_min
	end if

	soin = dw_soins.getitemstring(dw_soins.getrow(),"code")
	
	
	SELECT "code_soins"."nom"      INTO :libelle_soin      FROM "code_soins"     
	WHERE "code_soins"."code" = :soin   ;

	date_reference = date(em_date.text)
	
	open(w_patience)
	dw_liste.retrieve(code_min,code_max,pra_min,pra_max,dos_min,dos_max,soin,date_reference,libelle_soin)
	close(w_patience)

//	em_nb.text = string(dw_liste.rowcount())+" Dossiers"
//	em_nb.visible = true

end if

end subroutine

event open;call super::open;dw_dossier.settransobject(SQLCA)
dw_dossier.retrieve()

dw_soins.settransobject(SQLCA)
dw_soins.retrieve()  

em_date.setDate(today())
end event

on w_liste_patients_sans_prochain_soin.create
int iCurrent
call super::create
this.rb_un_dos=create rb_un_dos
this.rb_tous_dos=create rb_tous_dos
this.dw_dossier=create dw_dossier
this.dw_soins=create dw_soins
this.st_12=create st_12
this.st_2=create st_2
this.em_date=create em_date
this.gb_dos=create gb_dos
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.rb_un_dos
this.Control[iCurrent+2]=this.rb_tous_dos
this.Control[iCurrent+3]=this.dw_dossier
this.Control[iCurrent+4]=this.dw_soins
this.Control[iCurrent+5]=this.st_12
this.Control[iCurrent+6]=this.st_2
this.Control[iCurrent+7]=this.em_date
this.Control[iCurrent+8]=this.gb_dos
end on

on w_liste_patients_sans_prochain_soin.destroy
call super::destroy
destroy(this.rb_un_dos)
destroy(this.rb_tous_dos)
destroy(this.dw_dossier)
destroy(this.dw_soins)
destroy(this.st_12)
destroy(this.st_2)
destroy(this.em_date)
destroy(this.gb_dos)
end on

type p_fond from w_liste_patients`p_fond within w_liste_patients_sans_prochain_soin
end type

type cb_imprimer from w_liste_patients`cb_imprimer within w_liste_patients_sans_prochain_soin
integer taborder = 80
end type

type cb_autre from w_liste_patients`cb_autre within w_liste_patients_sans_prochain_soin
end type

type cb_fermer from w_liste_patients`cb_fermer within w_liste_patients_sans_prochain_soin
integer taborder = 90
end type

type cb_ecran from w_liste_patients`cb_ecran within w_liste_patients_sans_prochain_soin
integer taborder = 100
end type

type cb_lien_word from w_liste_patients`cb_lien_word within w_liste_patients_sans_prochain_soin
end type

type uo_size from w_liste_patients`uo_size within w_liste_patients_sans_prochain_soin
end type

type rb_un from w_liste_patients`rb_un within w_liste_patients_sans_prochain_soin
end type

type rb_tous from w_liste_patients`rb_tous within w_liste_patients_sans_prochain_soin
end type

type em_nb from w_liste_patients`em_nb within w_liste_patients_sans_prochain_soin
end type

type em_max from w_liste_patients`em_max within w_liste_patients_sans_prochain_soin
end type

type em_min from w_liste_patients`em_min within w_liste_patients_sans_prochain_soin
end type

type dw_1 from w_liste_patients`dw_1 within w_liste_patients_sans_prochain_soin
end type

type gb_1 from w_liste_patients`gb_1 within w_liste_patients_sans_prochain_soin
end type

type dw_prati from w_liste_patients`dw_prati within w_liste_patients_sans_prochain_soin
end type

type cbx_filtre from w_liste_patients`cbx_filtre within w_liste_patients_sans_prochain_soin
end type

type st_min from w_liste_patients`st_min within w_liste_patients_sans_prochain_soin
end type

type st_max from w_liste_patients`st_max within w_liste_patients_sans_prochain_soin
end type

type dw_liste from w_liste_patients`dw_liste within w_liste_patients_sans_prochain_soin
string dataobject = "dw_liste_patients_sans_soins"
end type

type rb_un_dos from radiobutton within w_liste_patients_sans_prochain_soin
integer x = 485
integer y = 1064
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
string text = "Un type de dossier "
boolean checked = true
end type

event clicked;dw_dossier.visible = true
end event

type rb_tous_dos from radiobutton within w_liste_patients_sans_prochain_soin
integer x = 485
integer y = 968
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
string text = "Tous les types de dossier "
end type

event clicked;dw_dossier.visible = false
end event

type dw_dossier from datawindow within w_liste_patients_sans_prochain_soin
string tag = "position"
integer x = 1243
integer y = 1064
integer width = 942
integer height = 80
integer taborder = 60
boolean bringtotop = true
string dataobject = "dw_cherche_dossier"
boolean border = false
end type

type dw_soins from datawindow within w_liste_patients_sans_prochain_soin
string tag = "position"
integer x = 937
integer y = 1428
integer width = 1714
integer height = 76
integer taborder = 80
boolean bringtotop = true
string dataobject = "dw_cherche_soins"
boolean border = false
end type

type st_12 from statictext within w_liste_patients_sans_prochain_soin
integer x = 430
integer y = 1436
integer width = 489
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
string facename = "Arial"
long backcolor = 553648127
boolean enabled = false
string text = "Type de Soin :"
boolean focusrectangle = false
end type

type st_2 from statictext within w_liste_patients_sans_prochain_soin
integer x = 430
integer y = 1260
integer width = 571
integer height = 76
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
string facename = "Arial"
long backcolor = 553648127
boolean enabled = false
string text = "Date de référence :"
boolean focusrectangle = false
end type

type em_date from uo_date_calendrier within w_liste_patients_sans_prochain_soin
integer x = 1038
integer y = 1252
integer taborder = 190
boolean bringtotop = true
end type

on em_date.destroy
call uo_date_calendrier::destroy
end on

type gb_dos from groupbox within w_liste_patients_sans_prochain_soin
integer x = 320
integer y = 876
integer width = 2121
integer height = 304
integer taborder = 31
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

