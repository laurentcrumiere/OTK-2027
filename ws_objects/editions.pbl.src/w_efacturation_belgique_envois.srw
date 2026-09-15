$PBExportHeader$w_efacturation_belgique_envois.srw
forward
global type w_efacturation_belgique_envois from w_fenetre_arakis
end type
type cb_imprimer from uo_picturebutton_390x120 within w_efacturation_belgique_envois
end type
type cb_autre from uo_picturebutton_390x120 within w_efacturation_belgique_envois
end type
type cb_fermer from uo_picturebutton_390x120_fermer within w_efacturation_belgique_envois
end type
type cb_ecran from uo_picturebutton_390x120 within w_efacturation_belgique_envois
end type
type uo_size from resize_fenetre within w_efacturation_belgique_envois
end type
type rb_un from radiobutton within w_efacturation_belgique_envois
end type
type rb_tous_statuts from radiobutton within w_efacturation_belgique_envois
end type
type em_nb from editmask within w_efacturation_belgique_envois
end type
type gb_1 from groupbox within w_efacturation_belgique_envois
end type
type cbx_filtre from u_cst_togglebutton within w_efacturation_belgique_envois
end type
type st_1 from statictext within w_efacturation_belgique_envois
end type
type st_3 from statictext within w_efacturation_belgique_envois
end type
type em_date_min from uo_date_calendrier within w_efacturation_belgique_envois
end type
type st_2 from statictext within w_efacturation_belgique_envois
end type
type em_date_max from uo_date_calendrier within w_efacturation_belgique_envois
end type
type rb_tous_oa from radiobutton within w_efacturation_belgique_envois
end type
type rb_un_oa from radiobutton within w_efacturation_belgique_envois
end type
type dw_oa from datawindow within w_efacturation_belgique_envois
end type
type ddlb_statuts from dropdownlistbox within w_efacturation_belgique_envois
end type
type gb_2 from groupbox within w_efacturation_belgique_envois
end type
type rb_1 from radiobutton within w_efacturation_belgique_envois
end type
type rb_tous from radiobutton within w_efacturation_belgique_envois
end type
type dw_prati from datawindow within w_efacturation_belgique_envois
end type
type gb_3 from groupbox within w_efacturation_belgique_envois
end type
type dw_liste from u_basedw within w_efacturation_belgique_envois
end type
type cbx_detail_facture from checkbox within w_efacturation_belgique_envois
end type
type gb_4 from groupbox within w_efacturation_belgique_envois
end type
end forward

global type w_efacturation_belgique_envois from w_fenetre_arakis
integer x = 27
integer y = 200
integer width = 3781
integer height = 2132
string title = "Historique des envois"
windowtype windowtype = child!
cb_imprimer cb_imprimer
cb_autre cb_autre
cb_fermer cb_fermer
cb_ecran cb_ecran
uo_size uo_size
rb_un rb_un
rb_tous_statuts rb_tous_statuts
em_nb em_nb
gb_1 gb_1
cbx_filtre cbx_filtre
st_1 st_1
st_3 st_3
em_date_min em_date_min
st_2 st_2
em_date_max em_date_max
rb_tous_oa rb_tous_oa
rb_un_oa rb_un_oa
dw_oa dw_oa
ddlb_statuts ddlb_statuts
gb_2 gb_2
rb_1 rb_1
rb_tous rb_tous
dw_prati dw_prati
gb_3 gb_3
dw_liste dw_liste
cbx_detail_facture cbx_detail_facture
gb_4 gb_4
end type
global w_efacturation_belgique_envois w_efacturation_belgique_envois

type variables
boolean prepa_faite
double increment	
double nb_dossier

double min, max,max_row

n_cst_PowerFilter iu_PowerFilter

// pour les liste avec possibilité de sélectionner les patients ...
boolean tout_selectionne  = true



string oa_min, oa_max, statut_min, statut_max, v_nom_praticien, pra_min, pra_max

end variables

forward prototypes
public subroutine prepa ()
end prototypes

public subroutine prepa ();
date date_min, date_max
integer index_statut
string tit, texte_statut

if not prepa_faite then
	
	if rb_tous.checked then
		pra_min="      "
		pra_max="ZZZZZZ"
		tit = "Pour tous les praticiens"
	else
		pra_min=dw_prati.getitemstring(dw_prati.getrow(),"code")
		pra_max=pra_min
		SELECT nom INTO :v_nom_praticien FROM prati WHERE code = :pra_min ;
		tit = "Pour le Dr "+v_nom_praticien
	end if

	if rb_tous_oa.checked then
		oa_min="   "
		oa_max="ZZZ"
		tit = tit +  " - Pour tous les OA"
	else
		oa_min=dw_oa.gettext()
		oa_max=oa_min
		tit = tit +  " - Pour l'OA : " + oa_min
	end if



	if rb_tous_statuts.checked then
		statut_min=" "
		statut_max="Z"
		tit = tit +  " - Pour tous les Statuts"
	else
		texte_statut = ddlb_statuts.text
		index_statut = ddlb_statuts.finditem(texte_statut, 0)
		
		choose case index_statut
			case 1
				// Non envoyées
				statut_min = " "
				statut_max = " "
			case 2
				// Envoyées
				statut_min = "E"
				statut_max = "E"
			case 3
				//Reçus par l'OA
				statut_min = "U"
				statut_max = "U"
			case 4
				// Accpeté par l'OA
				statut_min = "A"
				statut_max = "A"
			case 5
				// refusés
				statut_min = "R"
				statut_max = "R"

			case 6
				// Rjet à titre informatif
				statut_min = "I"
				statut_max = "I"
	

				
		end choose

		tit = tit +  " - Pour le statut : " + texte_statut 
	end if

	date_min = date(em_date_min.text)
	date_max = date(em_date_max.text)

	tit = tit + " - Entre le "+em_date_min.text+" et le "+em_date_max.text
	open(w_patience)
	
	dw_liste.object.sous_titre.text = tit
	dw_liste.retrieve(oa_min, oa_max, statut_min, statut_max,date_min, date_max, pra_min, pra_max )
	
	
	close(w_patience)


end if

end subroutine

on w_efacturation_belgique_envois.create
int iCurrent
call super::create
this.cb_imprimer=create cb_imprimer
this.cb_autre=create cb_autre
this.cb_fermer=create cb_fermer
this.cb_ecran=create cb_ecran
this.uo_size=create uo_size
this.rb_un=create rb_un
this.rb_tous_statuts=create rb_tous_statuts
this.em_nb=create em_nb
this.gb_1=create gb_1
this.cbx_filtre=create cbx_filtre
this.st_1=create st_1
this.st_3=create st_3
this.em_date_min=create em_date_min
this.st_2=create st_2
this.em_date_max=create em_date_max
this.rb_tous_oa=create rb_tous_oa
this.rb_un_oa=create rb_un_oa
this.dw_oa=create dw_oa
this.ddlb_statuts=create ddlb_statuts
this.gb_2=create gb_2
this.rb_1=create rb_1
this.rb_tous=create rb_tous
this.dw_prati=create dw_prati
this.gb_3=create gb_3
this.dw_liste=create dw_liste
this.cbx_detail_facture=create cbx_detail_facture
this.gb_4=create gb_4
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_imprimer
this.Control[iCurrent+2]=this.cb_autre
this.Control[iCurrent+3]=this.cb_fermer
this.Control[iCurrent+4]=this.cb_ecran
this.Control[iCurrent+5]=this.uo_size
this.Control[iCurrent+6]=this.rb_un
this.Control[iCurrent+7]=this.rb_tous_statuts
this.Control[iCurrent+8]=this.em_nb
this.Control[iCurrent+9]=this.gb_1
this.Control[iCurrent+10]=this.cbx_filtre
this.Control[iCurrent+11]=this.st_1
this.Control[iCurrent+12]=this.st_3
this.Control[iCurrent+13]=this.em_date_min
this.Control[iCurrent+14]=this.st_2
this.Control[iCurrent+15]=this.em_date_max
this.Control[iCurrent+16]=this.rb_tous_oa
this.Control[iCurrent+17]=this.rb_un_oa
this.Control[iCurrent+18]=this.dw_oa
this.Control[iCurrent+19]=this.ddlb_statuts
this.Control[iCurrent+20]=this.gb_2
this.Control[iCurrent+21]=this.rb_1
this.Control[iCurrent+22]=this.rb_tous
this.Control[iCurrent+23]=this.dw_prati
this.Control[iCurrent+24]=this.gb_3
this.Control[iCurrent+25]=this.dw_liste
this.Control[iCurrent+26]=this.cbx_detail_facture
this.Control[iCurrent+27]=this.gb_4
end on

on w_efacturation_belgique_envois.destroy
call super::destroy
destroy(this.cb_imprimer)
destroy(this.cb_autre)
destroy(this.cb_fermer)
destroy(this.cb_ecran)
destroy(this.uo_size)
destroy(this.rb_un)
destroy(this.rb_tous_statuts)
destroy(this.em_nb)
destroy(this.gb_1)
destroy(this.cbx_filtre)
destroy(this.st_1)
destroy(this.st_3)
destroy(this.em_date_min)
destroy(this.st_2)
destroy(this.em_date_max)
destroy(this.rb_tous_oa)
destroy(this.rb_un_oa)
destroy(this.dw_oa)
destroy(this.ddlb_statuts)
destroy(this.gb_2)
destroy(this.rb_1)
destroy(this.rb_tous)
destroy(this.dw_prati)
destroy(this.gb_3)
destroy(this.dw_liste)
destroy(this.cbx_detail_facture)
destroy(this.gb_4)
end on

event open;call super::open;
open(w_patience)

uo_size.taille(this)

em_date_min.setDate(date(year(today()),1,1))
em_date_max.setDate(today())

dw_prati.settransobject(SQLCA)
dw_prati.retrieve()

dw_liste.settransobject(sqlca)

dw_oa.settransobject(sqlca)
dw_oa.retrieve()

ddlb_statuts.selectitem(1)

prepa_faite = false

cbx_filtre.backcolor = this.backcolor



close(w_patience)




end event

event resize;

uo_size.retaille(this)

// repositionnement 
//cbx_filtre.x = gb_filtre.x + 19
//cbx_filtre.y = gb_filtre.y + 55
//

// pour qu'il se resize mais ... pas trop 
cbx_filtre.y = cb_ecran.y
cbx_filtre.height = min(cbx_filtre.height, cb_ecran.height)
cbx_filtre.width  =  min(800, cb_ecran.x - cbx_filtre.x - 30)
end event

type p_fond from w_fenetre_arakis`p_fond within w_efacturation_belgique_envois
end type

type cb_imprimer from uo_picturebutton_390x120 within w_efacturation_belgique_envois
integer x = 2263
integer y = 1868
integer width = 457
integer taborder = 130
boolean enabled = false
string text = "&Imprimer"
string iconname = "ACTIONS_imprimer.png"
end type

event clicked;call super::clicked;dw_liste.print()
end event

type cb_autre from uo_picturebutton_390x120 within w_efacturation_belgique_envois
integer x = 1774
integer y = 1868
integer width = 457
integer taborder = 140
boolean enabled = false
string text = "&Autre"
string iconname = "ACTIONS_autre.png"
end type

event clicked;call super::clicked;prepa_faite = false

this.enabled (false)
cb_imprimer.enabled( false )
cb_ecran.enabled ( true)
cb_ecran.default ( true)

dw_liste.visible = false

cbx_filtre.visible = false

end event

type cb_fermer from uo_picturebutton_390x120_fermer within w_efacturation_belgique_envois
integer x = 3246
integer y = 1868
integer width = 457
integer taborder = 10
end type

event clicked;fermer_fenetre(parent)
end event

type cb_ecran from uo_picturebutton_390x120 within w_efacturation_belgique_envois
integer x = 626
integer y = 1868
integer width = 457
integer taborder = 60
string text = "&Ecran"
boolean default = true
string iconname = "ACTIONS_ecran.png"
end type

event clicked;call super::clicked;
// On enlève la liste le temps du chargement - surtout pour une 2ème fois
dw_liste.visible = false

// pour les excités des clics
cb_fermer.enabled(false)
prepa()
// pour les excités des clics
cb_fermer.enabled(true)


if ui_v2020 then
	// pour qu'il redessinne correctement le bouton
	//cb_autre.default = true
	SetRedraw(true)
end if

cb_imprimer.enabled ( true)
cb_autre.enabled ( true )
cb_imprimer.default ( true )

dw_liste.visible = true


if cbx_filtre.tag <> "no visible" then
	cbx_filtre.visible = true
end if


end event

type uo_size from resize_fenetre within w_efacturation_belgique_envois
boolean visible = false
integer x = 2235
integer y = 580
integer taborder = 20
end type

on uo_size.destroy
call resize_fenetre::destroy
end on

type rb_un from radiobutton within w_efacturation_belgique_envois
integer x = 448
integer y = 940
integer width = 283
integer height = 80
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 15780518
string text = "Un"
end type

event clicked;ddlb_statuts.visible = true
end event

type rb_tous_statuts from radiobutton within w_efacturation_belgique_envois
integer x = 448
integer y = 844
integer width = 302
integer height = 80
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 15780518
string text = "Tous"
boolean checked = true
end type

event clicked;ddlb_statuts.visible = false
end event

type em_nb from editmask within w_efacturation_belgique_envois
boolean visible = false
integer x = 23
integer y = 1700
integer width = 498
integer height = 100
integer taborder = 30
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean italic = true
long backcolor = 12632256
boolean enabled = false
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = stringmask!
string mask = "XXXXXXXXXXXXXXXXXXXX"
end type

type gb_1 from groupbox within w_efacturation_belgique_envois
integer x = 283
integer y = 764
integer width = 2542
integer height = 304
integer taborder = 80
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean italic = true
long textcolor = 33554432
long backcolor = 15780518
string text = "Choix du Statut des Envois"
end type

type cbx_filtre from u_cst_togglebutton within w_efacturation_belgique_envois
event destroy ( )
boolean visible = false
integer x = 18
integer y = 1888
integer width = 425
integer height = 92
integer taborder = 90
boolean bringtotop = true
string #ontext = "Filtres / Tris activés"
string #offtext = "Filtres / Tris inactivés"
string #tiptext = "Filtres / Tris"
end type

on cbx_filtre.destroy
call u_cst_togglebutton::destroy
end on

event clicked;call super::clicked;
iu_PowerFilter.checked = NOT iu_PowerFilter.checked
iu_PowerFilter.event ue_clicked()


end event

event constructor;call super::constructor;cbx_filtre.backcolor = couleur_fond_fenetre

end event

type st_1 from statictext within w_efacturation_belgique_envois
integer x = 357
integer y = 1172
integer width = 544
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
string facename = "Arial"
boolean underline = true
long backcolor = 553648127
string text = "Date d~'envoi :"
end type

type st_3 from statictext within w_efacturation_belgique_envois
integer x = 485
integer y = 1296
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

type em_date_min from uo_date_calendrier within w_efacturation_belgique_envois
integer x = 891
integer y = 1276
integer taborder = 160
boolean bringtotop = true
end type

on em_date_min.destroy
call uo_date_calendrier::destroy
end on

type st_2 from statictext within w_efacturation_belgique_envois
integer x = 1417
integer y = 1296
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

type em_date_max from uo_date_calendrier within w_efacturation_belgique_envois
integer x = 1701
integer y = 1276
integer taborder = 170
boolean bringtotop = true
end type

on em_date_max.destroy
call uo_date_calendrier::destroy
end on

type rb_tous_oa from radiobutton within w_efacturation_belgique_envois
integer x = 453
integer y = 508
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

event clicked;dw_oa.visible = false
end event

type rb_un_oa from radiobutton within w_efacturation_belgique_envois
integer x = 453
integer y = 600
integer width = 261
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

event clicked;dw_oa.visible = true
end event

type dw_oa from datawindow within w_efacturation_belgique_envois
string tag = "position brush"
boolean visible = false
integer x = 809
integer y = 604
integer width = 1979
integer height = 76
integer taborder = 110
boolean bringtotop = true
string dataobject = "dw_cherche_organismes_assureurs_belgique_ddlb"
boolean border = false
end type

type ddlb_statuts from dropdownlistbox within w_efacturation_belgique_envois
boolean visible = false
integer x = 763
integer y = 928
integer width = 1198
integer height = 588
integer taborder = 70
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
boolean sorted = false
string item[] = {"à Envoyer","Envoyés","Reçus par l~'OA","Acceptés","Refusés","Rejet à titre informatif"}
borderstyle borderstyle = stylelowered!
end type

type gb_2 from groupbox within w_efacturation_belgique_envois
integer x = 283
integer y = 416
integer width = 2542
integer height = 304
integer taborder = 100
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean italic = true
long textcolor = 33554432
long backcolor = 15780518
string text = "Organisme Assureur de Destination"
end type

type rb_1 from radiobutton within w_efacturation_belgique_envois
integer x = 448
integer y = 244
integer width = 622
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 15780518
string text = "Un praticien"
end type

event clicked;rb_tous.checked = false
dw_prati.visible = true
end event

type rb_tous from radiobutton within w_efacturation_belgique_envois
integer x = 448
integer y = 148
integer width = 695
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 15780518
string text = "Tous les praticiens"
boolean checked = true
end type

event clicked;rb_un.checked = false
dw_prati.visible = false
end event

type dw_prati from datawindow within w_efacturation_belgique_envois
string tag = "position brush"
boolean visible = false
integer x = 1079
integer y = 252
integer width = 859
integer height = 72
integer taborder = 120
boolean bringtotop = true
string dataobject = "dw_cherche_prati"
boolean border = false
end type

type gb_3 from groupbox within w_efacturation_belgique_envois
integer x = 283
integer y = 68
integer width = 2542
integer height = 304
integer taborder = 50
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean italic = true
long textcolor = 33554432
long backcolor = 15780518
string text = "Choix du praticien"
end type

type dw_liste from u_basedw within w_efacturation_belgique_envois
event ue_leftbuttonup pbm_dwnlbuttonup
boolean visible = false
integer x = 18
integer y = 28
integer width = 3707
integer height = 1824
integer taborder = 40
boolean bringtotop = true
string dataobject = "dw_efacturation_belgique_envois"
borderstyle borderstyle = stylebox!
end type

event ue_leftbuttonup;iu_PowerFilter.event post ue_buttonclicked(dwo.type,dwo.name)
end event

event rbuttondown;if row > 0 then
	This.SelectRow(0,False)
	This.SelectRow(row,True)
	This.setrow(row)
	OpenMenuPatient_Listes(this)
end if
end event

event retrieverow;call super::retrieverow;
//if mod(row , 10) = 0 then 
//	// pour voir l'animation de patience !!!
//	yield()
//end if
end event

event constructor;call super::constructor;iu_PowerFilter = create n_cst_PowerFilter
iu_PowerFilter.of_setdw(this)
iu_PowerFilter.of_SetLanguage( 1 )
end event

event resize;call super::resize;if isvalid (iu_PowerFilter) then
	// Is valid car si on utilise les thèmes ... ça merde
	iu_PowerFilter.event ue_positionbuttons()
end if
end event

event buttonclicked;call super::buttonclicked;

// renvoi effectif de l'envoi

if row > 0 then 
	string ls_object 
	boolean lb_ok_suite = true
	ls_Object = String(dwo.name)
	
	string v_code_praticien, v_code_oa
	integer v_numero_envoi , v_cpt
	date v_date_envoi, v_date_envoi_nouvelle
	
	v_code_praticien = getitemString(row, "code_praticien")
	v_code_oa =  getitemString(row, "code_oa")
	v_numero_envoi =  getitemNumber(row, "numero_envoi")
	v_date_envoi =  getitemDate(row, "date_envoi")

	
	choose case ls_object
		case "b_renvoyer" 
			// Si déjà eu des messages, on ne renvoie pae
			select count(*) into :v_cpt from message_efacture_belgique 
			where code_praticien = :v_code_praticien and code_oa = :v_code_oa and numero_envoi = :v_numero_envoi and date_envoi = :v_date_envoi ;

			if v_cpt > 0 then
				messagebox("ATTENTION", "Vous avez des reçu des messages pour cet envoi !~n~nIl n'est pas nécessaire de le renvoyer !")
			else	
				if Messagebox("ATTENTION","Confirmez-vous le nouvel envoi de cet envoi ?", Question!, YesNo!, 2) = 1 then
				
// depuis 34.90f on ne modifie plus la date de l'envoi au 2ème envoi
// 				if v_date_envoi <> today() then 
//						// Il d'abord mettre à jour la date d'envoi
//						v_date_envoi_nouvelle = today()
//						update envoi_efacture_belgique 
//						set date_envoi = :v_date_envoi_nouvelle 
//						where code_praticien = :v_code_praticien and code_oa = :v_code_oa and numero_envoi = :v_numero_envoi and date_envoi = :v_date_envoi ;
						
//						if sqlca.sqlcode = 0 then 
//							update ligne_envoi_efacture_belgique 
//							set date_envoi = :v_date_envoi_nouvelle 
//							where code_praticien = :v_code_praticien and code_oa = :v_code_oa and numero_envoi = :v_numero_envoi and date_envoi = :v_date_envoi ;
						
//							if sqlca.sqlcode = 0 then 
//								commit ; 
//								// uniquement pour l'affichage 
//								Setitem(row, "date_envoi", v_date_envoi_nouvelle)
//							else
//								lb_ok_suite = false
//								Messagebox("ATTENTION", "Erreur dans le changement de la date des lignes de l'envoi !~n~n" + sqlca.sqlerrtext + "~n~nL'envoi n'a pas été renvoyé !")
//								rollback ;
//							end if
//						else
//							lb_ok_suite = false
//							Messagebox("ATTENTION", "Erreur dans le changement de la date de l'envoi !~n~n" + sqlca.sqlerrtext + "~n~nL'envoi n'a pas été renvoyé !")
//							rollback ;
//						end if	
//					end if
					
					if lb_ok_suite then 
						if  fxg_envoi_effectif_efacturation_belgique(v_code_praticien, v_code_oa, v_numero_envoi, v_date_envoi)  then
							// Mise à jour du statut de l'envoi 
							update envoi_efacture_belgique set statut_envoi = 'E' 
							where code_oa = :v_code_oa and code_praticien = :v_code_praticien and numero_envoi = :v_numero_envoi and date_envoi = :v_date_envoi ;
							
							if sqlca.sqlcode = 0 then 
								commit ;
							else
								messagebox("ATTENTION", "Erreur dans la mise à jour du statut de l'envoi.~n~n" + sqlca.sqlerrtext + "~n~nL'envoi a tout de même été réalisé !")
								rollback ;
							end if
							
							// mise à jour du statut de l'envoi et des factures 
							update efacture_belgique set statut_my_carenet = 'E' where numero_facture 
							in (select numero_facture from envoi_efacture_belgique where code_oa = :v_code_oa and code_praticien = :v_code_praticien and numero_envoi = :v_numero_envoi and date_envoi = :v_date_envoi  ); 
											
							if sqlca.sqlcode = 0 then 
								commit ;
							else
								messagebox("ATTENTION", "Erreur dans la mise à jour du statut de l'envoi dans les factures.~n~n" + sqlca.sqlerrtext + "~n~nL'envoi a tout de même été réalisé !")
								rollback ;
							end if
							
							if sqlca.sqlcode = 0 then 
								commit ;
							else
								messagebox("ATTENTION", "Erreur dans la mise à jour du statut de l'envoi dans les facture.~n~nL'envoi a tout de même été réalisé !")
								rollback ;
							end if
						end if
					end if
					
						
				end if 
			end if
			
		case "b_supprimer"
			if Messagebox("ATTENTION","Confirmez-vous la suppression de cet envoi ?", Question!, YesNo!, 2) = 1 then
				
				// Mise à jour des statuts des factures 
				
				update efacture_belgique set statut_my_carenet = ' ' 
				where type_facture + string(numero_facture) in (select type_facture + string(numero_facture) from ligne_envoi_efacture_belgique where code_praticien = :v_code_praticien and code_oa = :v_code_oa and numero_envoi = :v_numero_envoi and date_envoi = :v_date_envoi ) ;
				
				if sqlca.sqlcode = 0 then 
					// suppression des lignes de l'envoi 
					delete from ligne_envoi_efacture_belgique 
					where code_praticien = :v_code_praticien and code_oa = :v_code_oa and numero_envoi = :v_numero_envoi and date_envoi = :v_date_envoi ;
					
					if sqlca.sqlcode = 0 then 
					
						// suppression de l'envoi
						delete from envoi_efacture_belgique 
						where code_praticien = :v_code_praticien and code_oa = :v_code_oa and numero_envoi = :v_numero_envoi and date_envoi = :v_date_envoi ;
					
						if sqlca.sqlcode = 0 then 
							commit ; 
							Messagebox("INFORMATION", "L'envoi a été supprimé avec succès !")
							cb_ecran.triggerevent(clicked!)
						else
							Messagebox("ATTENTION", "Erreur dans la suppression de l'entête de l'envoi !~n~nLa suppression est anulée !~n~n" + sqlca.sqlerrtext)
							rollback ;
							
						end if
					else
						Messagebox("ATTENTION", "Erreur dans la suppression des lignes de l'envoi !~n~nLa suppression est anulée !~n~n" + sqlca.sqlerrtext)
						rollback ;
						
					end if 
				else
						Messagebox("ATTENTION", "Erreur dans la mise à jour des statuts des factures de l'envoi !~n~nLa suppression est anulée !~n~n" + sqlca.sqlerrtext)
						rollback ;
						
				end if
			end if
		
		case "b_detail"
			// Liste des factures de l'envoi
			param_win[1] = v_code_praticien
			param_win[2] = v_code_oa
			param_win[3] = string(v_date_envoi)
			
			open(w_efacturation_belgique_factures_un_envoi)
			
			
	end choose
end if
end event

type cbx_detail_facture from checkbox within w_efacturation_belgique_envois
string tag = "no resize"
integer x = 1198
integer y = 1916
integer width = 471
integer height = 80
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 15780518
string text = "Détail Patients"
borderstyle borderstyle = styleraised!
end type

event clicked;if checked then
	dw_liste.object.datawindow.detail.height = 84
else
	dw_liste.object.datawindow.detail.height = 0
end if

end event

type gb_4 from groupbox within w_efacturation_belgique_envois
string tag = "no resize"
integer x = 1166
integer y = 1856
integer width = 594
integer height = 168
integer taborder = 80
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean underline = true
long textcolor = 33554432
long backcolor = 15780518
borderstyle borderstyle = styleraised!
end type

