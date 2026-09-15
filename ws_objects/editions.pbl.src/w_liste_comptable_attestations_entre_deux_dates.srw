$PBExportHeader$w_liste_comptable_attestations_entre_deux_dates.srw
$PBExportComments$Héritée de liste_patients
forward
global type w_liste_comptable_attestations_entre_deux_dates from w_liste_patients
end type
type st_factures from statictext within w_liste_comptable_attestations_entre_deux_dates
end type
type st_2 from statictext within w_liste_comptable_attestations_entre_deux_dates
end type
type st_3 from statictext within w_liste_comptable_attestations_entre_deux_dates
end type
type em_date_min from uo_date_calendrier within w_liste_comptable_attestations_entre_deux_dates
end type
type em_date_max from uo_date_calendrier within w_liste_comptable_attestations_entre_deux_dates
end type
type cbx_masquer_noms from checkbox within w_liste_comptable_attestations_entre_deux_dates
end type
type st_numeros from statictext within w_liste_comptable_attestations_entre_deux_dates
end type
type st_du from statictext within w_liste_comptable_attestations_entre_deux_dates
end type
type st_au from statictext within w_liste_comptable_attestations_entre_deux_dates
end type
type em_numero_min from editmask within w_liste_comptable_attestations_entre_deux_dates
end type
type em_numero_max from editmask within w_liste_comptable_attestations_entre_deux_dates
end type
type cbx_masquer_dossier from checkbox within w_liste_comptable_attestations_entre_deux_dates
end type
type dw_liste2 from datawindow within w_liste_comptable_attestations_entre_deux_dates
end type
type rb_eattest from radiobutton within w_liste_comptable_attestations_entre_deux_dates
end type
type rb_attestations_papier from radiobutton within w_liste_comptable_attestations_entre_deux_dates
end type
type gb_5 from groupbox within w_liste_comptable_attestations_entre_deux_dates
end type
type gb_type_attestation from groupbox within w_liste_comptable_attestations_entre_deux_dates
end type
end forward

global type w_liste_comptable_attestations_entre_deux_dates from w_liste_patients
string title = "Liste comptable des Attestations entre Deux Dates"
st_factures st_factures
st_2 st_2
st_3 st_3
em_date_min em_date_min
em_date_max em_date_max
cbx_masquer_noms cbx_masquer_noms
st_numeros st_numeros
st_du st_du
st_au st_au
em_numero_min em_numero_min
em_numero_max em_numero_max
cbx_masquer_dossier cbx_masquer_dossier
dw_liste2 dw_liste2
rb_eattest rb_eattest
rb_attestations_papier rb_attestations_papier
gb_5 gb_5
gb_type_attestation gb_type_attestation
end type
global w_liste_comptable_attestations_entre_deux_dates w_liste_comptable_attestations_entre_deux_dates

forward prototypes
public subroutine prepa ()
end prototypes

public subroutine prepa ();string pra_min,pra_max,tit, p
double code_min,code_max, v_montant
date date_min,date_max

if not prepa_faite then
	
	
	

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
	
	ok_mdp = false
	string v_pasfin
	
		
	 SELECT "prati"."pasfin"   INTO :v_pasfin  		 FROM "prati"  
		WHERE ( "prati"."code" = :pra_min ) ;

		guo_fenetre_modale.wf_ouvrir(w_mot_passe_financier)

	if ok_mdp then
	
		code_min = double(em_min.text)
		code_max = double(em_max.text)
	
		date_min = date(em_date_min.text)
		date_max = date(em_date_max.text)
		
		tit = tit + " - Entre le "+em_date_min.text+" et le "+em_date_max.text
		
		if rb_attestations_papier.checked then 	
			if cbx_masquer_noms.checked then
				dw_liste.Modify("nom_t.visible = 0")
				dw_liste.Modify("nom_patient.visible = 0")
			else
				dw_liste.Modify("nom_t.visible = 1")
				dw_liste.Modify("nom_patient.visible = 1")
			end if
			
			if cbx_masquer_dossier.checked then
				dw_liste.Modify("dossier_patient.visible = 0")
			else
				dw_liste.Modify("dossier_patient.visible = 1")
			end if
		else
			if cbx_masquer_noms.checked then
				dw_liste2.Modify("nom_t.visible = 0")
				dw_liste2.Modify("nom_patient.visible = 0")
			else
				dw_liste2.Modify("nom_t.visible = 1")
				dw_liste2.Modify("nom_patient.visible = 1")
			end if
			
			if cbx_masquer_dossier.checked then
				dw_liste2.Modify("dossier_patient.visible = 0")
			else
				dw_liste2.Modify("dossier_patient.visible = 1")
			end if

		end if
		double v_numero_min, 	v_numero_max
		
		v_numero_min = double(em_numero_min.text)
		v_numero_max = double(em_numero_max.text)
		
		if rb_attestations_papier.checked then 	
			tit = tit + " - Du N° "+ string(v_numero_min) + " au "+ String(v_numero_max)
		end if
		
		open(w_patience)
		
		if rb_attestations_papier.checked then
			dw_liste.Modify("titre.text = '"+tit+"'")
			dw_liste.retrieve(date_min,date_max, v_numero_min, v_numero_max)
			if rb_un.checked then
				dw_liste.SetFilter("code_praticien_reel = '"+pra_min+"'") 
			else
				// Aucun filtre
				dw_liste.SetFilter("") 
			end if
			dw_liste.Filter() 
		else
			dw_liste2.Modify("titre.text = '"+tit+"'")
			dw_liste2.retrieve(date_min,date_max)
			if rb_un.checked then
				dw_liste2.SetFilter("code_praticien_reel = '"+pra_min+"'") 
			else
				// Aucun filtre
				dw_liste2.SetFilter("") 
			end if
			dw_liste2.Filter() 
		end if
		
		
	
		close(w_patience)
	
		//prepa_faite = true

	end if
end if

end subroutine

event open;call super::open;
em_date_min.setDate(date(year(today()),1,1))
em_date_max.setDate(today())


if not multi then
	rb_tous.checked = false
	rb_tous.enabled = false
	rb_un.checked = true
	dw_prati.visible = true
else
	if verif_meme_mot_de_passe_praticien() then 
		// il n'y a qu'un MDP
		//=> RAS
		rb_tous.checked = true
		rb_tous.enabled = true
		rb_un.checked = false
		dw_prati.visible = false
	else
		rb_tous.checked = false
		rb_tous.enabled = false
		rb_un.checked = true
		dw_prati.visible = true
	end if
	
	
end if

dw_liste2.settransobject(sqlca)

end event

on w_liste_comptable_attestations_entre_deux_dates.create
int iCurrent
call super::create
this.st_factures=create st_factures
this.st_2=create st_2
this.st_3=create st_3
this.em_date_min=create em_date_min
this.em_date_max=create em_date_max
this.cbx_masquer_noms=create cbx_masquer_noms
this.st_numeros=create st_numeros
this.st_du=create st_du
this.st_au=create st_au
this.em_numero_min=create em_numero_min
this.em_numero_max=create em_numero_max
this.cbx_masquer_dossier=create cbx_masquer_dossier
this.dw_liste2=create dw_liste2
this.rb_eattest=create rb_eattest
this.rb_attestations_papier=create rb_attestations_papier
this.gb_5=create gb_5
this.gb_type_attestation=create gb_type_attestation
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.st_factures
this.Control[iCurrent+2]=this.st_2
this.Control[iCurrent+3]=this.st_3
this.Control[iCurrent+4]=this.em_date_min
this.Control[iCurrent+5]=this.em_date_max
this.Control[iCurrent+6]=this.cbx_masquer_noms
this.Control[iCurrent+7]=this.st_numeros
this.Control[iCurrent+8]=this.st_du
this.Control[iCurrent+9]=this.st_au
this.Control[iCurrent+10]=this.em_numero_min
this.Control[iCurrent+11]=this.em_numero_max
this.Control[iCurrent+12]=this.cbx_masquer_dossier
this.Control[iCurrent+13]=this.dw_liste2
this.Control[iCurrent+14]=this.rb_eattest
this.Control[iCurrent+15]=this.rb_attestations_papier
this.Control[iCurrent+16]=this.gb_5
this.Control[iCurrent+17]=this.gb_type_attestation
end on

on w_liste_comptable_attestations_entre_deux_dates.destroy
call super::destroy
destroy(this.st_factures)
destroy(this.st_2)
destroy(this.st_3)
destroy(this.em_date_min)
destroy(this.em_date_max)
destroy(this.cbx_masquer_noms)
destroy(this.st_numeros)
destroy(this.st_du)
destroy(this.st_au)
destroy(this.em_numero_min)
destroy(this.em_numero_max)
destroy(this.cbx_masquer_dossier)
destroy(this.dw_liste2)
destroy(this.rb_eattest)
destroy(this.rb_attestations_papier)
destroy(this.gb_5)
destroy(this.gb_type_attestation)
end on

type p_fond from w_liste_patients`p_fond within w_liste_comptable_attestations_entre_deux_dates
integer y = 696
end type

type cb_imprimer from w_liste_patients`cb_imprimer within w_liste_comptable_attestations_entre_deux_dates
integer taborder = 100
end type

event cb_imprimer::clicked;
if dw_liste.visible then 
	dw_liste.print()
else
	dw_liste2.print()
end if
end event

type cb_autre from w_liste_patients`cb_autre within w_liste_comptable_attestations_entre_deux_dates
end type

event cb_autre::clicked;call super::clicked;

st_min.visible = false
st_max.visible = false

dw_liste2.visible = false
end event

type cb_fermer from w_liste_patients`cb_fermer within w_liste_comptable_attestations_entre_deux_dates
integer taborder = 110
end type

type cb_ecran from w_liste_patients`cb_ecran within w_liste_comptable_attestations_entre_deux_dates
end type

event cb_ecran::clicked;
prepa()


this.enabled ( false)
cb_imprimer.enabled ( true)
cb_autre.enabled ( true )
cb_lien_word.enabled ( true )
cb_imprimer.default ( true )

if rb_attestations_papier.checked then
	dw_liste.visible = true
else
	dw_liste2.visible = true
end if

//gb_filtre.visible = true

if cbx_filtre.tag <> "no visible" then
	cbx_filtre.visible = true
end if


composant_visible_selon_tag(parent , "a masquer", false)
end event

type cb_lien_word from w_liste_patients`cb_lien_word within w_liste_comptable_attestations_entre_deux_dates
end type

type uo_size from w_liste_patients`uo_size within w_liste_comptable_attestations_entre_deux_dates
end type

type rb_un from w_liste_patients`rb_un within w_liste_comptable_attestations_entre_deux_dates
integer x = 485
integer y = 216
end type

type rb_tous from w_liste_patients`rb_tous within w_liste_comptable_attestations_entre_deux_dates
integer x = 485
integer y = 120
end type

type em_nb from w_liste_patients`em_nb within w_liste_comptable_attestations_entre_deux_dates
integer taborder = 60
end type

type em_max from w_liste_patients`em_max within w_liste_comptable_attestations_entre_deux_dates
boolean visible = false
integer y = 412
end type

type em_min from w_liste_patients`em_min within w_liste_comptable_attestations_entre_deux_dates
boolean visible = false
integer y = 412
end type

type dw_1 from w_liste_patients`dw_1 within w_liste_comptable_attestations_entre_deux_dates
end type

type gb_1 from w_liste_patients`gb_1 within w_liste_comptable_attestations_entre_deux_dates
integer x = 320
integer y = 40
integer taborder = 0
end type

type dw_prati from w_liste_patients`dw_prati within w_liste_comptable_attestations_entre_deux_dates
integer x = 1243
integer y = 216
integer taborder = 80
end type

type cbx_filtre from w_liste_patients`cbx_filtre within w_liste_comptable_attestations_entre_deux_dates
end type

type st_min from w_liste_patients`st_min within w_liste_comptable_attestations_entre_deux_dates
boolean visible = false
integer y = 424
end type

type st_max from w_liste_patients`st_max within w_liste_comptable_attestations_entre_deux_dates
boolean visible = false
integer y = 424
end type

type dw_liste from w_liste_patients`dw_liste within w_liste_comptable_attestations_entre_deux_dates
integer y = 4
integer taborder = 70
string dataobject = "dw_liste_comptable_attestations_entre_deux_dates"
end type

event dw_liste::buttonclicked;call super::buttonclicked;//
//
//if row > 0 then
//	setrow(row)
//	This.SelectRow(0,False)
//	This.SelectRow(row,True)
//	OpenMenuPatient_Listes(this)
//end if
end event

type st_factures from statictext within w_liste_comptable_attestations_entre_deux_dates
integer x = 347
integer y = 428
integer width = 878
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
string facename = "Arial"
boolean underline = true
long backcolor = 553648127
string text = "Date des Factures :"
end type

type st_2 from statictext within w_liste_comptable_attestations_entre_deux_dates
integer x = 1317
integer y = 552
integer width = 247
integer height = 72
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
string facename = "Arial"
boolean underline = true
long backcolor = 553648127
string text = "Et le"
alignment alignment = center!
end type

type st_3 from statictext within w_liste_comptable_attestations_entre_deux_dates
integer x = 475
integer y = 552
integer width = 256
integer height = 72
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
string facename = "Arial"
boolean underline = true
long backcolor = 553648127
string text = "Entre le "
end type

type em_date_min from uo_date_calendrier within w_liste_comptable_attestations_entre_deux_dates
integer x = 905
integer y = 544
integer taborder = 230
boolean bringtotop = true
end type

on em_date_min.destroy
call uo_date_calendrier::destroy
end on

type em_date_max from uo_date_calendrier within w_liste_comptable_attestations_entre_deux_dates
integer x = 1719
integer y = 544
integer taborder = 240
boolean bringtotop = true
end type

on em_date_max.destroy
call uo_date_calendrier::destroy
end on

type cbx_masquer_noms from checkbox within w_liste_comptable_attestations_entre_deux_dates
integer x = 485
integer y = 1412
integer width = 1294
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 15780518
string text = "Masquer le nom des patients"
end type

type st_numeros from statictext within w_liste_comptable_attestations_entre_deux_dates
boolean visible = false
integer x = 347
integer y = 964
integer width = 878
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
string facename = "Arial"
boolean underline = true
long backcolor = 553648127
string text = "Numéros :"
end type

type st_du from statictext within w_liste_comptable_attestations_entre_deux_dates
boolean visible = false
integer x = 475
integer y = 1060
integer width = 155
integer height = 72
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
string facename = "Arial"
boolean underline = true
long backcolor = 553648127
string text = "Du"
end type

type st_au from statictext within w_liste_comptable_attestations_entre_deux_dates
boolean visible = false
integer x = 1326
integer y = 1060
integer width = 174
integer height = 72
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
string facename = "Arial"
boolean underline = true
long backcolor = 553648127
string text = "Au"
alignment alignment = center!
end type

type em_numero_min from editmask within w_liste_comptable_attestations_entre_deux_dates
boolean visible = false
integer x = 690
integer y = 1052
integer width = 539
integer height = 92
integer taborder = 240
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
string text = "0"
alignment alignment = right!
borderstyle borderstyle = stylelowered!
string mask = "############0"
boolean spin = true
end type

type em_numero_max from editmask within w_liste_comptable_attestations_entre_deux_dates
boolean visible = false
integer x = 1559
integer y = 1052
integer width = 539
integer height = 92
integer taborder = 250
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
string text = "9999999999"
alignment alignment = right!
borderstyle borderstyle = stylelowered!
string mask = "############0"
boolean spin = true
end type

type cbx_masquer_dossier from checkbox within w_liste_comptable_attestations_entre_deux_dates
integer x = 485
integer y = 1512
integer width = 1294
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 15780518
string text = "Masquer le N° de dosser des patients"
end type

type dw_liste2 from datawindow within w_liste_comptable_attestations_entre_deux_dates
boolean visible = false
integer x = 18
integer y = 4
integer width = 3707
integer height = 1824
integer taborder = 90
boolean bringtotop = true
string dataobject = "dw_liste_comptable_e-attestations_entre_de"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
end type

type rb_eattest from radiobutton within w_liste_comptable_attestations_entre_deux_dates
integer x = 585
integer y = 804
integer width = 402
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 15780518
string text = "e-Attest"
boolean checked = true
end type

event clicked;If checked then
	st_numeros.visible = false
	st_du.visible = false
	st_au.visible = false
	em_numero_min.visible = false
	em_numero_max.visible = false
end if
end event

type rb_attestations_papier from radiobutton within w_liste_comptable_attestations_entre_deux_dates
integer x = 1083
integer y = 804
integer width = 590
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 15780518
string text = "Attestations Papier"
end type

event clicked;If checked then
	st_numeros.visible = true
	st_du.visible = true
	st_au.visible = true
	em_numero_min.visible = true
	em_numero_max.visible = true
end if
end event

type gb_5 from groupbox within w_liste_comptable_attestations_entre_deux_dates
integer x = 384
integer y = 1296
integer width = 2075
integer height = 388
integer taborder = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean italic = true
long backcolor = 15780518
string text = "Options d~'impression"
end type

type gb_type_attestation from groupbox within w_liste_comptable_attestations_entre_deux_dates
integer x = 384
integer y = 724
integer width = 1856
integer height = 196
integer taborder = 270
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean italic = true
long backcolor = 15780518
string text = "Type d~'attestation"
end type

