$PBExportHeader$w_tableau_bord_recettes_depassement.srw
forward
global type w_tableau_bord_recettes_depassement from w_liste_patients
end type
type st_1 from statictext within w_tableau_bord_recettes_depassement
end type
type st_2 from statictext within w_tableau_bord_recettes_depassement
end type
type st_3 from statictext within w_tableau_bord_recettes_depassement
end type
type dw_dossier from datawindow within w_tableau_bord_recettes_depassement
end type
type cb_exporter from uo_picturebutton_390x120 within w_tableau_bord_recettes_depassement
end type
type em_date_min from uo_date_calendrier within w_tableau_bord_recettes_depassement
end type
type em_date_max from uo_date_calendrier within w_tableau_bord_recettes_depassement
end type
type cbx_patient from checkbox within w_tableau_bord_recettes_depassement
end type
type gb_2 from groupbox within w_tableau_bord_recettes_depassement
end type
end forward

global type w_tableau_bord_recettes_depassement from w_liste_patients
integer width = 3817
integer height = 2144
string title = "Tableau de Bord : Analyse des Recettes - Dépassements / Acte"
st_1 st_1
st_2 st_2
st_3 st_3
dw_dossier dw_dossier
cb_exporter cb_exporter
em_date_min em_date_min
em_date_max em_date_max
cbx_patient cbx_patient
gb_2 gb_2
end type
global w_tableau_bord_recettes_depassement w_tableau_bord_recettes_depassement

forward prototypes
public subroutine prepa ()
end prototypes

public subroutine prepa ();string pra_min,pra_max,tit,p,dos_min,dos_max
double code_min,code_max
date date_min,date_max

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

//	if rb_tous_dos.checked then
//		dos_min="      "
//		dos_max="ZZZZZZ"
//		tit = tit + " - Tous les Types de dossier"
//	else
//		dos_min=dw_dossier.getitemstring(dw_dossier.getrow(),"code")
//		dos_max=dos_min
//		SELECT nom INTO :p FROM dossier WHERE code = :dos_min ;
//		tit = tit + " - Dossiers : "+p
//	end if
//
	code_min = double(em_min.text)
	code_max = double(em_max.text)

	date_min = date(em_date_min.text)
	date_max = date(em_date_max.text)


	// Avec ou sans le détail par patient
	if cbx_patient.checked then
		dw_liste.Object.Datawindow.detail.height = 78
	else
		dw_liste.Object.Datawindow.detail.height = 0
	end if
	
	
	tit = tit + " - Entre le "+em_date_min.text+" et le "+em_date_max.text
	open(w_patience)
	dw_liste.Modify("titre.text = '"+tit+"'")
	dw_liste.retrieve(code_min,code_max,pra_min,pra_max,date_min,date_max)
	close(w_patience)



end if

end subroutine

event open;call super::open;em_min.text = "-99999999"
em_max.text = "999999999"

em_date_min.setDate(date(year(today()),1,1))
em_date_max.setDate(today())

dw_dossier.settransobject(SQLCA)
dw_dossier.retrieve() 

if multi and not verif_meme_mot_de_passe_praticien() then 
	// Pas le même mot de passe => pas pour tous
	rb_tous.checked = false
	rb_tous.enabled = false
	rb_un.checked = true
	dw_prati.visible = true
end if
end event

on w_tableau_bord_recettes_depassement.create
int iCurrent
call super::create
this.st_1=create st_1
this.st_2=create st_2
this.st_3=create st_3
this.dw_dossier=create dw_dossier
this.cb_exporter=create cb_exporter
this.em_date_min=create em_date_min
this.em_date_max=create em_date_max
this.cbx_patient=create cbx_patient
this.gb_2=create gb_2
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.st_1
this.Control[iCurrent+2]=this.st_2
this.Control[iCurrent+3]=this.st_3
this.Control[iCurrent+4]=this.dw_dossier
this.Control[iCurrent+5]=this.cb_exporter
this.Control[iCurrent+6]=this.em_date_min
this.Control[iCurrent+7]=this.em_date_max
this.Control[iCurrent+8]=this.cbx_patient
this.Control[iCurrent+9]=this.gb_2
end on

on w_tableau_bord_recettes_depassement.destroy
call super::destroy
destroy(this.st_1)
destroy(this.st_2)
destroy(this.st_3)
destroy(this.dw_dossier)
destroy(this.cb_exporter)
destroy(this.em_date_min)
destroy(this.em_date_max)
destroy(this.cbx_patient)
destroy(this.gb_2)
end on

type p_fond from w_liste_patients`p_fond within w_tableau_bord_recettes_depassement
end type

type cb_imprimer from w_liste_patients`cb_imprimer within w_tableau_bord_recettes_depassement
integer taborder = 100
end type

type cb_autre from w_liste_patients`cb_autre within w_tableau_bord_recettes_depassement
end type

event cb_autre::clicked;call super::clicked;cb_exporter.enabled ( false)
end event

type cb_fermer from w_liste_patients`cb_fermer within w_tableau_bord_recettes_depassement
integer x = 2665
integer taborder = 110
end type

type cb_ecran from w_liste_patients`cb_ecran within w_tableau_bord_recettes_depassement
end type

event cb_ecran::clicked;call super::clicked;cb_exporter.enabled ( true )
end event

type cb_lien_word from w_liste_patients`cb_lien_word within w_tableau_bord_recettes_depassement
end type

type uo_size from w_liste_patients`uo_size within w_tableau_bord_recettes_depassement
end type

type rb_un from w_liste_patients`rb_un within w_tableau_bord_recettes_depassement
integer x = 485
integer y = 216
end type

type rb_tous from w_liste_patients`rb_tous within w_tableau_bord_recettes_depassement
integer x = 485
integer y = 120
end type

type em_nb from w_liste_patients`em_nb within w_tableau_bord_recettes_depassement
integer taborder = 60
end type

type em_max from w_liste_patients`em_max within w_tableau_bord_recettes_depassement
integer y = 468
end type

type em_min from w_liste_patients`em_min within w_tableau_bord_recettes_depassement
integer y = 468
end type

type dw_1 from w_liste_patients`dw_1 within w_tableau_bord_recettes_depassement
end type

type gb_1 from w_liste_patients`gb_1 within w_tableau_bord_recettes_depassement
integer x = 320
integer y = 40
integer taborder = 0
end type

type dw_prati from w_liste_patients`dw_prati within w_tableau_bord_recettes_depassement
integer x = 1243
integer y = 200
integer taborder = 80
end type

type cbx_filtre from w_liste_patients`cbx_filtre within w_tableau_bord_recettes_depassement
end type

type st_min from w_liste_patients`st_min within w_tableau_bord_recettes_depassement
integer y = 480
end type

type st_max from w_liste_patients`st_max within w_tableau_bord_recettes_depassement
integer y = 480
end type

type dw_liste from w_liste_patients`dw_liste within w_tableau_bord_recettes_depassement
integer y = 4
integer taborder = 70
string dataobject = "dw_tableau_bord_recettes_depassement"
end type

event dw_liste::rbuttondown;//
end event

event dw_liste::clicked;//
end event

event dw_liste::doubleclicked;//

end event

type st_1 from statictext within w_tableau_bord_recettes_depassement
integer x = 347
integer y = 688
integer width = 686
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 700
string facename = "Arial"
boolean underline = true
long backcolor = 553648127
boolean enabled = false
string text = "Date de règlement  :"
boolean focusrectangle = false
end type

type st_2 from statictext within w_tableau_bord_recettes_depassement
integer x = 1317
integer y = 812
integer width = 247
integer height = 72
boolean bringtotop = true
integer textsize = -10
integer weight = 700
string facename = "Arial"
long backcolor = 553648127
boolean enabled = false
string text = "Et le"
alignment alignment = center!
boolean focusrectangle = false
end type

type st_3 from statictext within w_tableau_bord_recettes_depassement
integer x = 475
integer y = 812
integer width = 256
integer height = 72
boolean bringtotop = true
integer textsize = -10
integer weight = 700
string facename = "Arial"
long backcolor = 553648127
boolean enabled = false
string text = "Entre le "
boolean focusrectangle = false
end type

type dw_dossier from datawindow within w_tableau_bord_recettes_depassement
boolean visible = false
integer x = 1243
integer y = 1052
integer width = 951
integer height = 80
integer taborder = 50
string dataobject = "dw_cherche_dossier"
boolean border = false
end type

type cb_exporter from uo_picturebutton_390x120 within w_tableau_bord_recettes_depassement
integer x = 2199
integer y = 1868
integer width = 457
integer taborder = 50
boolean bringtotop = true
boolean enabled = false
string text = "E&xporter"
string iconname = "ACTIONS_Exporter.png"
end type

event clicked;call super::clicked;

dw_liste.saveas()


end event

type em_date_min from uo_date_calendrier within w_tableau_bord_recettes_depassement
string tag = "a masquer no resizeall"
integer x = 864
integer y = 796
integer taborder = 270
boolean bringtotop = true
end type

on em_date_min.destroy
call uo_date_calendrier::destroy
end on

type em_date_max from uo_date_calendrier within w_tableau_bord_recettes_depassement
string tag = "a masquer no resizeall"
integer x = 1678
integer y = 796
integer taborder = 280
boolean bringtotop = true
end type

on em_date_max.destroy
call uo_date_calendrier::destroy
end on

type cbx_patient from checkbox within w_tableau_bord_recettes_depassement
integer x = 402
integer y = 1112
integer width = 1024
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
string text = "Afficher le détail des règlements"
borderstyle borderstyle = styleraised!
end type

type gb_2 from groupbox within w_tableau_bord_recettes_depassement
integer x = 320
integer y = 1032
integer width = 2121
integer height = 216
integer taborder = 60
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 15780518
borderstyle borderstyle = styleraised!
end type

