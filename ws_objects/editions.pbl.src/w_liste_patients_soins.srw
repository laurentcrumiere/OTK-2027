$PBExportHeader$w_liste_patients_soins.srw
$PBExportComments$Héritée de liste_patients
forward
global type w_liste_patients_soins from w_liste_patients
end type
type dw_soins from datawindow within w_liste_patients_soins
end type
type st_1 from statictext within w_liste_patients_soins
end type
type st_2 from statictext within w_liste_patients_soins
end type
type st_3 from statictext within w_liste_patients_soins
end type
type st_4 from statictext within w_liste_patients_soins
end type
type st_5 from statictext within w_liste_patients_soins
end type
type st_6 from statictext within w_liste_patients_soins
end type
type em_num1 from editmask within w_liste_patients_soins
end type
type em_num2 from editmask within w_liste_patients_soins
end type
type dw_caisse from datawindow within w_liste_patients_soins
end type
type rb_une_caisse from radiobutton within w_liste_patients_soins
end type
type rb_toutes_caisses from radiobutton within w_liste_patients_soins
end type
type rb_une_mutuelle from radiobutton within w_liste_patients_soins
end type
type rb_toutes_mutuelles from radiobutton within w_liste_patients_soins
end type
type dw_mutuelle from datawindow within w_liste_patients_soins
end type
type rb_tous_corresp from radiobutton within w_liste_patients_soins
end type
type rb_un_corresp from radiobutton within w_liste_patients_soins
end type
type dw_corresp from datawindow within w_liste_patients_soins
end type
type em_date_min from uo_date_calendrier within w_liste_patients_soins
end type
type em_date_max from uo_date_calendrier within w_liste_patients_soins
end type
type uo_filtre_email from uo_filtre_emails within w_liste_patients_soins
end type
type gb_caisse from groupbox within w_liste_patients_soins
end type
type gb_mutuelle from groupbox within w_liste_patients_soins
end type
type gb_corresp from groupbox within w_liste_patients_soins
end type
end forward

global type w_liste_patients_soins from w_liste_patients
string title = "Liste des Patients d~'un Type de Soin"
dw_soins dw_soins
st_1 st_1
st_2 st_2
st_3 st_3
st_4 st_4
st_5 st_5
st_6 st_6
em_num1 em_num1
em_num2 em_num2
dw_caisse dw_caisse
rb_une_caisse rb_une_caisse
rb_toutes_caisses rb_toutes_caisses
rb_une_mutuelle rb_une_mutuelle
rb_toutes_mutuelles rb_toutes_mutuelles
dw_mutuelle dw_mutuelle
rb_tous_corresp rb_tous_corresp
rb_un_corresp rb_un_corresp
dw_corresp dw_corresp
em_date_min em_date_min
em_date_max em_date_max
uo_filtre_email uo_filtre_email
gb_caisse gb_caisse
gb_mutuelle gb_mutuelle
gb_corresp gb_corresp
end type
global w_liste_patients_soins w_liste_patients_soins

forward prototypes
public subroutine prepa ()
end prototypes

public subroutine prepa ();string pra_min,pra_max,soin
double code_min,code_max
decimal{1} n1,n2
date date_min, date_max
integer avec_nul


string cai_min, cai_max, mut_min, mut_max, cor_min, cor_max

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

	soin = dw_soins.getitemstring(dw_soins.getrow(),"code")
	
	date_min = date(em_date_min.text)
	date_max = date(em_date_max.text)	


	if integer(em_num1.text) = 0 then
		avec_nul = 1
	else
		avec_nul = 0
	end if

		
	
	n1 = dec(em_num1.text)
	n2 = dec(em_num2.text)
	
	
	
	if rb_toutes_caisses.checked then
		cai_min = " "
		cai_max = "ZZZZZZ"
	else
		cai_min = dw_caisse.gettext()
		cai_max = cai_min
	end if
	if rb_toutes_mutuelles.checked then
		mut_min = " "
		mut_max = "ZZZZZZ"
	else
		mut_min = dw_mutuelle.gettext()
		mut_max = mut_min
	end if
	if rb_tous_corresp.checked then
		cor_min = " "
		cor_max = "ZZZZZZ"
	else
		cor_min = dw_corresp.gettext()
		cor_max = cor_min
	end if
		
	
	
	open(w_patience)
	dw_liste.retrieve(code_min,code_max,pra_min,pra_max,soin,date_min,date_max,n1,n2,avec_nul,cai_min, cai_max, mut_min, mut_max, cor_min, cor_max)
	close(w_patience)

//	em_nb.text = string(dw_liste.rowcount())+" Dossiers"
//	em_nb.visible = true

end if

end subroutine

event open;call super::open;dw_soins.settransobject(SQLCA)
dw_soins.retrieve()
em_num2.text = "99"
em_num1.text = "0" 
em_date_max.setDate(Today())
em_date_min.setDate(RelativeDate(Today(),-365))

dw_caisse.settransobject(sqlca)
dw_corresp.settransobject(sqlca)
dw_mutuelle.settransobject(sqlca)



dw_caisse.retrieve()
dw_corresp.retrieve()
dw_mutuelle.retrieve()


if serial = "87247" then

	gb_caisse.visible = true
	rb_une_caisse.visible = true
	rb_toutes_caisses.visible = true
	
	gb_mutuelle.visible = true
	rb_une_mutuelle.visible = true
	rb_toutes_mutuelles.visible = true
	
	gb_corresp.visible = true
	rb_un_corresp.visible = true
	rb_tous_corresp.visible = true
	
end if

uo_filtre_email.dw_liste = dw_liste
uo_filtre_email.em_statut_mere = em_nb


end event

on w_liste_patients_soins.create
int iCurrent
call super::create
this.dw_soins=create dw_soins
this.st_1=create st_1
this.st_2=create st_2
this.st_3=create st_3
this.st_4=create st_4
this.st_5=create st_5
this.st_6=create st_6
this.em_num1=create em_num1
this.em_num2=create em_num2
this.dw_caisse=create dw_caisse
this.rb_une_caisse=create rb_une_caisse
this.rb_toutes_caisses=create rb_toutes_caisses
this.rb_une_mutuelle=create rb_une_mutuelle
this.rb_toutes_mutuelles=create rb_toutes_mutuelles
this.dw_mutuelle=create dw_mutuelle
this.rb_tous_corresp=create rb_tous_corresp
this.rb_un_corresp=create rb_un_corresp
this.dw_corresp=create dw_corresp
this.em_date_min=create em_date_min
this.em_date_max=create em_date_max
this.uo_filtre_email=create uo_filtre_email
this.gb_caisse=create gb_caisse
this.gb_mutuelle=create gb_mutuelle
this.gb_corresp=create gb_corresp
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_soins
this.Control[iCurrent+2]=this.st_1
this.Control[iCurrent+3]=this.st_2
this.Control[iCurrent+4]=this.st_3
this.Control[iCurrent+5]=this.st_4
this.Control[iCurrent+6]=this.st_5
this.Control[iCurrent+7]=this.st_6
this.Control[iCurrent+8]=this.em_num1
this.Control[iCurrent+9]=this.em_num2
this.Control[iCurrent+10]=this.dw_caisse
this.Control[iCurrent+11]=this.rb_une_caisse
this.Control[iCurrent+12]=this.rb_toutes_caisses
this.Control[iCurrent+13]=this.rb_une_mutuelle
this.Control[iCurrent+14]=this.rb_toutes_mutuelles
this.Control[iCurrent+15]=this.dw_mutuelle
this.Control[iCurrent+16]=this.rb_tous_corresp
this.Control[iCurrent+17]=this.rb_un_corresp
this.Control[iCurrent+18]=this.dw_corresp
this.Control[iCurrent+19]=this.em_date_min
this.Control[iCurrent+20]=this.em_date_max
this.Control[iCurrent+21]=this.uo_filtre_email
this.Control[iCurrent+22]=this.gb_caisse
this.Control[iCurrent+23]=this.gb_mutuelle
this.Control[iCurrent+24]=this.gb_corresp
end on

on w_liste_patients_soins.destroy
call super::destroy
destroy(this.dw_soins)
destroy(this.st_1)
destroy(this.st_2)
destroy(this.st_3)
destroy(this.st_4)
destroy(this.st_5)
destroy(this.st_6)
destroy(this.em_num1)
destroy(this.em_num2)
destroy(this.dw_caisse)
destroy(this.rb_une_caisse)
destroy(this.rb_toutes_caisses)
destroy(this.rb_une_mutuelle)
destroy(this.rb_toutes_mutuelles)
destroy(this.dw_mutuelle)
destroy(this.rb_tous_corresp)
destroy(this.rb_un_corresp)
destroy(this.dw_corresp)
destroy(this.em_date_min)
destroy(this.em_date_max)
destroy(this.uo_filtre_email)
destroy(this.gb_caisse)
destroy(this.gb_mutuelle)
destroy(this.gb_corresp)
end on

type p_fond from w_liste_patients`p_fond within w_liste_patients_soins
end type

type cb_imprimer from w_liste_patients`cb_imprimer within w_liste_patients_soins
integer x = 2199
end type

type cb_autre from w_liste_patients`cb_autre within w_liste_patients_soins
integer x = 1728
integer taborder = 130
end type

type cb_fermer from w_liste_patients`cb_fermer within w_liste_patients_soins
integer x = 2670
integer taborder = 120
end type

type cb_ecran from w_liste_patients`cb_ecran within w_liste_patients_soins
integer x = 517
integer taborder = 140
end type

type cb_lien_word from w_liste_patients`cb_lien_word within w_liste_patients_soins
end type

type uo_size from w_liste_patients`uo_size within w_liste_patients_soins
end type

type rb_un from w_liste_patients`rb_un within w_liste_patients_soins
integer y = 220
end type

type rb_tous from w_liste_patients`rb_tous within w_liste_patients_soins
integer y = 124
end type

type em_nb from w_liste_patients`em_nb within w_liste_patients_soins
integer taborder = 60
end type

type em_max from w_liste_patients`em_max within w_liste_patients_soins
integer y = 424
integer taborder = 30
end type

type em_min from w_liste_patients`em_min within w_liste_patients_soins
integer y = 424
integer taborder = 20
end type

type dw_1 from w_liste_patients`dw_1 within w_liste_patients_soins
integer x = 3369
integer y = 1184
end type

type gb_1 from w_liste_patients`gb_1 within w_liste_patients_soins
integer y = 44
integer taborder = 10
end type

type dw_prati from w_liste_patients`dw_prati within w_liste_patients_soins
integer y = 220
integer taborder = 100
end type

type cbx_filtre from w_liste_patients`cbx_filtre within w_liste_patients_soins
end type

type st_min from w_liste_patients`st_min within w_liste_patients_soins
integer y = 436
end type

type st_max from w_liste_patients`st_max within w_liste_patients_soins
integer y = 436
end type

type dw_liste from w_liste_patients`dw_liste within w_liste_patients_soins
integer x = 9
integer taborder = 90
string dataobject = "dw_liste_patients_soins_edition"
end type

type dw_soins from datawindow within w_liste_patients_soins
string tag = "position brush"
integer x = 878
integer y = 800
integer width = 1719
integer height = 76
integer taborder = 70
string dataobject = "dw_cherche_soins"
boolean border = false
end type

type st_1 from statictext within w_liste_patients_soins
integer x = 293
integer y = 816
integer width = 530
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
string facename = "Arial"
long backcolor = 553648127
boolean enabled = false
string text = "Type de Soin :"
alignment alignment = center!
boolean focusrectangle = false
end type

type st_2 from statictext within w_liste_patients_soins
integer x = 603
integer y = 676
integer width = 256
integer height = 76
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
string facename = "Arial"
long backcolor = 553648127
boolean enabled = false
string text = "Entre le "
alignment alignment = center!
boolean focusrectangle = false
end type

type st_3 from statictext within w_liste_patients_soins
integer x = 1371
integer y = 676
integer width = 247
integer height = 76
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
string facename = "Arial"
long backcolor = 553648127
boolean enabled = false
string text = "Et le "
alignment alignment = center!
boolean focusrectangle = false
end type

type st_4 from statictext within w_liste_patients_soins
integer x = 393
integer y = 584
integer width = 453
integer height = 76
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
string facename = "Arial"
boolean underline = true
long backcolor = 553648127
boolean enabled = false
string text = "Date de Soins :"
alignment alignment = center!
boolean focusrectangle = false
end type

type st_5 from statictext within w_liste_patients_soins
integer x = 366
integer y = 1008
integer width = 279
integer height = 76
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
string facename = "Arial"
long backcolor = 553648127
boolean enabled = false
string text = "Numéro :"
alignment alignment = center!
boolean focusrectangle = false
end type

type st_6 from statictext within w_liste_patients_soins
integer x = 905
integer y = 1008
integer width = 155
integer height = 76
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
string facename = "Arial"
long backcolor = 553648127
boolean enabled = false
string text = "à"
alignment alignment = center!
boolean focusrectangle = false
end type

type em_num1 from editmask within w_liste_patients_soins
integer x = 677
integer y = 996
integer width = 265
integer height = 100
integer taborder = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 16777215
alignment alignment = center!
borderstyle borderstyle = stylelowered!
string mask = "#0.0"
boolean spin = true
string displaydata = "Ä"
end type

type em_num2 from editmask within w_liste_patients_soins
integer x = 1093
integer y = 996
integer width = 265
integer height = 100
integer taborder = 72
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 16777215
alignment alignment = center!
borderstyle borderstyle = stylelowered!
string mask = "##.0"
boolean spin = true
string displaydata = ""
end type

type dw_caisse from datawindow within w_liste_patients_soins
string tag = "position"
boolean visible = false
integer x = 613
integer y = 1100
integer width = 1088
integer height = 76
integer taborder = 100
boolean bringtotop = true
string dataobject = "dw_cherche_caisse"
boolean border = false
end type

type rb_une_caisse from radiobutton within w_liste_patients_soins
boolean visible = false
integer x = 101
integer y = 1116
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
string text = "Une"
end type

event clicked;dw_caisse.visible = true
end event

type rb_toutes_caisses from radiobutton within w_liste_patients_soins
boolean visible = false
integer x = 101
integer y = 1020
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
string text = "Toutes"
boolean checked = true
end type

event clicked;dw_caisse.visible = false

end event

type rb_une_mutuelle from radiobutton within w_liste_patients_soins
boolean visible = false
integer x = 87
integer y = 1436
integer width = 471
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
string text = "Une"
end type

event clicked;dw_mutuelle.visible = true
end event

type rb_toutes_mutuelles from radiobutton within w_liste_patients_soins
boolean visible = false
integer x = 87
integer y = 1344
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
string text = "Toutes"
boolean checked = true
end type

event clicked;dw_mutuelle.visible = false
end event

type dw_mutuelle from datawindow within w_liste_patients_soins
string tag = "position"
boolean visible = false
integer x = 613
integer y = 1428
integer width = 1093
integer height = 76
integer taborder = 110
boolean bringtotop = true
string dataobject = "dw_cherche_mutuelle"
boolean border = false
end type

type rb_tous_corresp from radiobutton within w_liste_patients_soins
boolean visible = false
integer x = 1870
integer y = 1352
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

event clicked;dw_corresp.visible = false
end event

type rb_un_corresp from radiobutton within w_liste_patients_soins
boolean visible = false
integer x = 1870
integer y = 1448
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
string text = "Un"
end type

event clicked;dw_corresp.visible = true
end event

type dw_corresp from datawindow within w_liste_patients_soins
string tag = "position"
boolean visible = false
integer x = 2395
integer y = 1440
integer width = 1093
integer height = 80
integer taborder = 110
boolean bringtotop = true
string dataobject = "dw_cherche_corresp"
boolean border = false
end type

type em_date_min from uo_date_calendrier within w_liste_patients_soins
integer x = 942
integer y = 660
integer taborder = 200
boolean bringtotop = true
end type

on em_date_min.destroy
call uo_date_calendrier::destroy
end on

type em_date_max from uo_date_calendrier within w_liste_patients_soins
integer x = 1746
integer y = 660
integer taborder = 210
boolean bringtotop = true
end type

on em_date_max.destroy
call uo_date_calendrier::destroy
end on

type uo_filtre_email from uo_filtre_emails within w_liste_patients_soins
string tag = "no resize all"
integer x = 987
integer y = 1852
integer taborder = 180
boolean bringtotop = true
end type

on uo_filtre_email.destroy
call uo_filtre_emails::destroy
end on

type gb_caisse from groupbox within w_liste_patients_soins
boolean visible = false
integer x = 23
integer y = 940
integer width = 1723
integer height = 304
integer taborder = 110
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean italic = true
long textcolor = 33554432
long backcolor = 15780518
string text = "Choix de la caisse"
end type

type gb_mutuelle from groupbox within w_liste_patients_soins
boolean visible = false
integer x = 23
integer y = 1268
integer width = 1723
integer height = 304
integer taborder = 120
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean italic = true
long textcolor = 33554432
long backcolor = 15780518
string text = "Choix de la mutuelle"
end type

type gb_corresp from groupbox within w_liste_patients_soins
boolean visible = false
integer x = 1806
integer y = 1268
integer width = 1723
integer height = 304
integer taborder = 130
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean italic = true
long textcolor = 33554432
long backcolor = 15780518
string text = "Choix du correspondant"
end type

