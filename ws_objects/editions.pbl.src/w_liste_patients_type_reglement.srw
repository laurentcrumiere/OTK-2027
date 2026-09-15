$PBExportHeader$w_liste_patients_type_reglement.srw
$PBExportComments$Héritée de liste_patients
forward
global type w_liste_patients_type_reglement from w_liste_patients
end type
type st_1 from statictext within w_liste_patients_type_reglement
end type
type st_2 from statictext within w_liste_patients_type_reglement
end type
type st_3 from statictext within w_liste_patients_type_reglement
end type
type dw_type_regl from datawindow within w_liste_patients_type_reglement
end type
type st_4 from statictext within w_liste_patients_type_reglement
end type
type rb_franc from radiobutton within w_liste_patients_type_reglement
end type
type rb_euro from radiobutton within w_liste_patients_type_reglement
end type
type em_date_min from uo_date_calendrier within w_liste_patients_type_reglement
end type
type em_date_max from uo_date_calendrier within w_liste_patients_type_reglement
end type
type st_5 from statictext within w_liste_patients_type_reglement
end type
type st_6 from statictext within w_liste_patients_type_reglement
end type
type st_7 from statictext within w_liste_patients_type_reglement
end type
type em_montant_min from editmask within w_liste_patients_type_reglement
end type
type em_montant_max from editmask within w_liste_patients_type_reglement
end type
type st_9 from statictext within w_liste_patients_type_reglement
end type
type sle_payeur from singlelineedit within w_liste_patients_type_reglement
end type
type st_10 from statictext within w_liste_patients_type_reglement
end type
type cb_exporter from uo_picturebutton_390x120 within w_liste_patients_type_reglement
end type
type gb_monnaie from groupbox within w_liste_patients_type_reglement
end type
end forward

global type w_liste_patients_type_reglement from w_liste_patients
string title = "Liste des Règlements d~'un Mode de Règlement"
st_1 st_1
st_2 st_2
st_3 st_3
dw_type_regl dw_type_regl
st_4 st_4
rb_franc rb_franc
rb_euro rb_euro
em_date_min em_date_min
em_date_max em_date_max
st_5 st_5
st_6 st_6
st_7 st_7
em_montant_min em_montant_min
em_montant_max em_montant_max
st_9 st_9
sle_payeur sle_payeur
st_10 st_10
cb_exporter cb_exporter
gb_monnaie gb_monnaie
end type
global w_liste_patients_type_reglement w_liste_patients_type_reglement

forward prototypes
public subroutine prepa ()
end prototypes

public subroutine prepa ();string var_reg,tit, pra_min, pra_max
char var_monnaie
double code_min,code_max
long montant_min, montant_max
date date_min,date_max
string v_payeur


pra_min = dw_prati.getitemstring(dw_prati.getrow(),"code")

if not prepa_faite then
	

		date_min = date(em_date_min.text)
		date_max = date(em_date_max.text)

		ok_mdp = true
		
	if not PLANIFICATION_EN_COURS then
		// On est en mode manuel

		if date_min <= relativedate(today(),- fxg_get_delai_mdp_financier(pra_min)) then
			ok_mdp = false
		  SELECT "prati"."pasfin"  
			 INTO :pasfin  
			 FROM "prati"  
			WHERE ( "prati"."code" = :pra_min ) ;
	
			guo_fenetre_modale.wf_ouvrir(w_mot_passe_financier)
		end if
	end if

	if ok_mdp then
	
		//prepa_faite = true
		
		montant_min = long(em_montant_min.text)
		montant_max = long(em_montant_max.text)

		v_payeur = sle_payeur.text 
		
		// Praticiens
		if rb_un.checked then
			// Pour un praticien
			pra_min=dw_prati.getitemstring(dw_prati.getrow(),"code")
			pra_max=dw_prati.getitemstring(dw_prati.getrow(),"code")
		else
			 // Tous les praticiens
			 SELECT min(code),max(code) INTO :pra_min,:pra_max
			  FROM "prati" ;	
		end if
	
		// pour être sur de lister tous les reglements ...
		update paye set payeur = '' where payeur is null ;
		commit ;
		
		v_payeur = sle_payeur.text

		code_min = -99999999
		code_max = 999999999

		var_reg = dw_type_regl.getitemstring(1,"code")

		if rb_franc.checked then
			var_monnaie = 'F'
		else
			var_monnaie = 'E'
		end if
		
		open(w_patience)
		tit = "Entre le "+em_date_min.text+" et le "+em_date_max.text
		dw_liste.Modify("titre.text = '"+tit+"'")
		dw_liste.retrieve(code_min,code_max,pra_min, pra_max,date_min,date_max,var_reg,var_monnaie,montant_min, montant_max, v_payeur)
		close(w_patience)
		
//		em_nb.text = string(dw_liste.rowcount())+" Règlements"
//		em_nb.visible = true
	end if
end if

end subroutine

event open;call super::open;em_date_min.setDate(today())
em_date_max.setDate(today())

dw_type_regl.settransobject(SQLCA)
dw_type_regl.retrieve()
//dw_type_regl.setitem(1,"type_regl","C")
 
gb_monnaie.backcolor = couleur_fond_fenetre	
if monnaie_base = 'F' then
	rb_franc.checked = true
else
	rb_euro.checked =  true
end if

em_montant_max.text = string(99999.99)

// Comme dans le livre de recettes .... si le MDP est identiques en Multi praticien, on donne la possibilité de regrouper ...

if not multi then
	rb_tous.checked = false
	rb_tous.enabled = false
	rb_un.checked = true
	dw_prati.visible = true
else
	if not verif_meme_mot_de_passe_praticien() then 
		// Pas le même mot de passe => pas pour tous
		rb_tous.checked = false
		rb_tous.enabled = false
		rb_un.checked = true
		dw_prati.visible = true
	end if
end if

end event

on w_liste_patients_type_reglement.create
int iCurrent
call super::create
this.st_1=create st_1
this.st_2=create st_2
this.st_3=create st_3
this.dw_type_regl=create dw_type_regl
this.st_4=create st_4
this.rb_franc=create rb_franc
this.rb_euro=create rb_euro
this.em_date_min=create em_date_min
this.em_date_max=create em_date_max
this.st_5=create st_5
this.st_6=create st_6
this.st_7=create st_7
this.em_montant_min=create em_montant_min
this.em_montant_max=create em_montant_max
this.st_9=create st_9
this.sle_payeur=create sle_payeur
this.st_10=create st_10
this.cb_exporter=create cb_exporter
this.gb_monnaie=create gb_monnaie
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.st_1
this.Control[iCurrent+2]=this.st_2
this.Control[iCurrent+3]=this.st_3
this.Control[iCurrent+4]=this.dw_type_regl
this.Control[iCurrent+5]=this.st_4
this.Control[iCurrent+6]=this.rb_franc
this.Control[iCurrent+7]=this.rb_euro
this.Control[iCurrent+8]=this.em_date_min
this.Control[iCurrent+9]=this.em_date_max
this.Control[iCurrent+10]=this.st_5
this.Control[iCurrent+11]=this.st_6
this.Control[iCurrent+12]=this.st_7
this.Control[iCurrent+13]=this.em_montant_min
this.Control[iCurrent+14]=this.em_montant_max
this.Control[iCurrent+15]=this.st_9
this.Control[iCurrent+16]=this.sle_payeur
this.Control[iCurrent+17]=this.st_10
this.Control[iCurrent+18]=this.cb_exporter
this.Control[iCurrent+19]=this.gb_monnaie
end on

on w_liste_patients_type_reglement.destroy
call super::destroy
destroy(this.st_1)
destroy(this.st_2)
destroy(this.st_3)
destroy(this.dw_type_regl)
destroy(this.st_4)
destroy(this.rb_franc)
destroy(this.rb_euro)
destroy(this.em_date_min)
destroy(this.em_date_max)
destroy(this.st_5)
destroy(this.st_6)
destroy(this.st_7)
destroy(this.em_montant_min)
destroy(this.em_montant_max)
destroy(this.st_9)
destroy(this.sle_payeur)
destroy(this.st_10)
destroy(this.cb_exporter)
destroy(this.gb_monnaie)
end on

type p_fond from w_liste_patients`p_fond within w_liste_patients_type_reglement
integer x = 887
integer y = 1024
end type

type cb_imprimer from w_liste_patients`cb_imprimer within w_liste_patients_type_reglement
integer taborder = 100
end type

event cb_imprimer::clicked;// On enlève le bouton à l'impression
dw_liste.modify("b_detail.visible = 0")
dw_liste.print()
dw_liste.modify("b_detail.visible = 1")


end event

type cb_autre from w_liste_patients`cb_autre within w_liste_patients_type_reglement
end type

event cb_autre::clicked;call super::clicked;st_min.visible = false
st_max.visible = false
em_min.visible = false
em_max.visible = false
cb_exporter.enabled ( false )
end event

type cb_fermer from w_liste_patients`cb_fermer within w_liste_patients_type_reglement
integer x = 2665
integer taborder = 110
end type

type cb_ecran from w_liste_patients`cb_ecran within w_liste_patients_type_reglement
integer taborder = 120
string tiptext = "Clic droit pour afficher la sélection Euro / Franc"
end type

event cb_ecran::clicked;call super::clicked;cb_exporter.enabled ( true)
end event

event cb_ecran::rbuttondown;call super::rbuttondown;// pour afficher la sélection Franc / euro
gb_monnaie.visible = true
rb_franc.visible = true
rb_euro.visible = true
end event

type cb_lien_word from w_liste_patients`cb_lien_word within w_liste_patients_type_reglement
end type

type uo_size from w_liste_patients`uo_size within w_liste_patients_type_reglement
end type

type rb_un from w_liste_patients`rb_un within w_liste_patients_type_reglement
end type

type rb_tous from w_liste_patients`rb_tous within w_liste_patients_type_reglement
end type

type em_nb from w_liste_patients`em_nb within w_liste_patients_type_reglement
integer taborder = 70
end type

type em_max from w_liste_patients`em_max within w_liste_patients_type_reglement
boolean visible = false
integer y = 616
end type

type em_min from w_liste_patients`em_min within w_liste_patients_type_reglement
boolean visible = false
end type

type dw_1 from w_liste_patients`dw_1 within w_liste_patients_type_reglement
end type

type gb_1 from w_liste_patients`gb_1 within w_liste_patients_type_reglement
end type

type dw_prati from w_liste_patients`dw_prati within w_liste_patients_type_reglement
integer taborder = 90
end type

type cbx_filtre from w_liste_patients`cbx_filtre within w_liste_patients_type_reglement
end type

type st_min from w_liste_patients`st_min within w_liste_patients_type_reglement
boolean visible = false
end type

type st_max from w_liste_patients`st_max within w_liste_patients_type_reglement
boolean visible = false
end type

type dw_liste from w_liste_patients`dw_liste within w_liste_patients_type_reglement
integer x = 14
integer y = 28
integer taborder = 80
string dataobject = "dw_liste_patients_type_reglement"
end type

event dw_liste::buttonclicked;call super::buttonclicked;// Détail du règlement

if row > 0 then
	string ls_Object
	ls_Object = String(dwo.name)
	
	
	choose case ls_object
		case "b_detail" 
	
	
			str_reglement reglement_groupe
			
			reglement_groupe.date 		= this.GetitemDate(row,"paye_date")
			reglement_groupe.payeur 	= this.GetitemString(row,"paye_payeur")
			reglement_groupe.mode 	= this.GetitemString(row,"paye_mode")
			reglement_groupe.dateremise 	=	this.GetitemDate(row,"paye_dateremise")
			reglement_groupe.commentaire = 	this.GetitemString(row,"paye_commentaire")
					
			OpenWithParm(w_reglements_regroupes, reglement_groupe)
	end choose

end if
end event

type st_1 from statictext within w_liste_patients_type_reglement
integer x = 347
integer y = 628
integer width = 704
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
string facename = "Arial"
boolean underline = true
long backcolor = 553648127
boolean enabled = false
string text = "Règlements reçus :"
boolean focusrectangle = false
end type

type st_2 from statictext within w_liste_patients_type_reglement
integer x = 480
integer y = 748
integer width = 247
integer height = 72
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
string facename = "Arial"
long backcolor = 553648127
boolean enabled = false
string text = "Entre le"
boolean focusrectangle = false
end type

type st_3 from statictext within w_liste_patients_type_reglement
integer x = 1458
integer y = 748
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
boolean focusrectangle = false
end type

type dw_type_regl from datawindow within w_liste_patients_type_reglement
string tag = "position brush"
integer x = 1010
integer y = 1008
integer width = 873
integer height = 72
integer taborder = 50
boolean bringtotop = true
string dataobject = "dw_type_regl_ddlb"
boolean border = false
boolean livescroll = true
end type

type st_4 from statictext within w_liste_patients_type_reglement
integer x = 347
integer y = 1012
integer width = 635
integer height = 72
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
string facename = "Arial"
long backcolor = 553648127
boolean enabled = false
string text = "Mode de Règlement :"
boolean focusrectangle = false
end type

type rb_franc from radiobutton within w_liste_patients_type_reglement
boolean visible = false
integer x = 2496
integer y = 1276
integer width = 270
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 15780518
string text = "Franc"
end type

type rb_euro from radiobutton within w_liste_patients_type_reglement
boolean visible = false
integer x = 2875
integer y = 1276
integer width = 270
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 15780518
string text = "Euro"
boolean checked = true
end type

type em_date_min from uo_date_calendrier within w_liste_patients_type_reglement
integer x = 933
integer y = 728
integer taborder = 230
boolean bringtotop = true
end type

on em_date_min.destroy
call uo_date_calendrier::destroy
end on

type em_date_max from uo_date_calendrier within w_liste_patients_type_reglement
integer x = 1710
integer y = 732
integer taborder = 240
boolean bringtotop = true
end type

on em_date_max.destroy
call uo_date_calendrier::destroy
end on

type st_5 from statictext within w_liste_patients_type_reglement
integer x = 347
integer y = 1184
integer width = 366
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
string facename = "Arial"
boolean underline = true
long backcolor = 553648127
boolean enabled = false
string text = "Montants :"
boolean focusrectangle = false
end type

type st_6 from statictext within w_liste_patients_type_reglement
integer x = 503
integer y = 1308
integer width = 247
integer height = 72
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
string facename = "Arial"
long backcolor = 553648127
boolean enabled = false
string text = "Entre "
boolean focusrectangle = false
end type

type st_7 from statictext within w_liste_patients_type_reglement
integer x = 1353
integer y = 1308
integer width = 183
integer height = 72
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
string facename = "Arial"
long backcolor = 553648127
boolean enabled = false
string text = "Et "
boolean focusrectangle = false
end type

type em_montant_min from editmask within w_liste_patients_type_reglement
integer x = 786
integer y = 1296
integer width = 421
integer height = 96
integer taborder = 130
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
alignment alignment = right!
borderstyle borderstyle = stylelowered!
string mask = "######0.00"
boolean spin = true
string displaydata = ""
end type

type em_montant_max from editmask within w_liste_patients_type_reglement
integer x = 1573
integer y = 1296
integer width = 421
integer height = 96
integer taborder = 140
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
alignment alignment = right!
borderstyle borderstyle = stylelowered!
string mask = "######0.00"
boolean spin = true
string displaydata = ""
end type

type st_9 from statictext within w_liste_patients_type_reglement
string tag = "a masquer"
integer x = 622
integer y = 1624
integer width = 1659
integer height = 64
boolean bringtotop = true
integer textsize = -8
fontcharset fontcharset = ansi!
string facename = "Arial"
boolean italic = true
long textcolor = 16711680
long backcolor = 553648127
boolean enabled = false
string text = "Vous pouvez utiliser le caractère % comme générique (y compris à la fin)"
boolean focusrectangle = false
end type

type sle_payeur from singlelineedit within w_liste_patients_type_reglement
integer x = 622
integer y = 1528
integer width = 1403
integer height = 92
integer taborder = 70
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
string text = "%"
integer limit = 40
borderstyle borderstyle = stylelowered!
end type

type st_10 from statictext within w_liste_patients_type_reglement
integer x = 347
integer y = 1540
integer width = 261
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
string facename = "Arial"
long backcolor = 553648127
boolean enabled = false
string text = "Payeur :"
boolean focusrectangle = false
end type

type cb_exporter from uo_picturebutton_390x120 within w_liste_patients_type_reglement
integer x = 2199
integer y = 1868
integer width = 457
integer taborder = 110
boolean bringtotop = true
boolean enabled = false
string text = "&Exporter"
string iconname = "ACTIONS_Exporter.png"
end type

event clicked;call super::clicked;
//Export libre
dw_liste.saveAs()

end event

type gb_monnaie from groupbox within w_liste_patients_type_reglement
boolean visible = false
integer x = 2382
integer y = 1168
integer width = 859
integer height = 272
integer taborder = 70
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean italic = true
long backcolor = 15780518
string text = "Réglements perçus"
end type

