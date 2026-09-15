$PBExportHeader$w_liste_soins_coefficient_ponderation.srw
$PBExportComments$Héritée de liste_patients
forward
global type w_liste_soins_coefficient_ponderation from w_liste_patients
end type
type rb_tous_soins from radiobutton within w_liste_soins_coefficient_ponderation
end type
type rb_uniquement_soins_atteste from radiobutton within w_liste_soins_coefficient_ponderation
end type
type rb_liste from radiobutton within w_liste_soins_coefficient_ponderation
end type
type rb_synthese from radiobutton within w_liste_soins_coefficient_ponderation
end type
type dw_synthese from datawindow within w_liste_soins_coefficient_ponderation
end type
type st_1 from statictext within w_liste_soins_coefficient_ponderation
end type
type st_annee from statictext within w_liste_soins_coefficient_ponderation
end type
type em_annee from editmask within w_liste_soins_coefficient_ponderation
end type
type em_mois from editmask within w_liste_soins_coefficient_ponderation
end type
type st_mois from statictext within w_liste_soins_coefficient_ponderation
end type
type gb_2 from groupbox within w_liste_soins_coefficient_ponderation
end type
type gb_3 from groupbox within w_liste_soins_coefficient_ponderation
end type
end forward

global type w_liste_soins_coefficient_ponderation from w_liste_patients
string title = "Calcul du Coefficient de Pondération"
rb_tous_soins rb_tous_soins
rb_uniquement_soins_atteste rb_uniquement_soins_atteste
rb_liste rb_liste
rb_synthese rb_synthese
dw_synthese dw_synthese
st_1 st_1
st_annee st_annee
em_annee em_annee
em_mois em_mois
st_mois st_mois
gb_2 gb_2
gb_3 gb_3
end type
global w_liste_soins_coefficient_ponderation w_liste_soins_coefficient_ponderation

type variables
//
end variables

forward prototypes
public subroutine prepa ()
end prototypes

public subroutine prepa ();string pra_min,pra_max,tit, p
double code_min,code_max, v_montant
date date_min,date_max
string v_mois

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
	
		
	 SELECT "prati"."pasfin"   INTO :pasfin  		 FROM "prati"  
		WHERE ( "prati"."code" = :pra_min ) ;

		guo_fenetre_modale.wf_ouvrir(w_mot_passe_financier)

	if ok_mdp then
	
		code_min = double(em_min.text)
		code_max = double(em_max.text)
	
		if rb_synthese.checked then
			// on travaille sur une année
			date_min = date(integer(em_annee.text), 1, 1)
			date_max = date(integer(em_annee.text), 12, 31)
		else
			// on travaille sur un mois
			date_min = date(integer(em_annee.text), integer(em_mois.text), 1)
			// fin du mois !!
			date_max = fin_mois(date_min)
		end if
		
		tit = tit + " - Entre le "+string(date_min)+" et le "+string(date_max)
		
		// pour annuler un filtre précédent
		dw_liste.SetFilter("")
		dw_liste.Filter()
	
		
		open(w_patience)
		dw_liste.Modify("titre.text = '"+tit+"'")
		
		w_patience.avancement("Chargement en cours")
		dw_liste.retrieve(pra_min,pra_max,date_min,date_max)
		
		// Calcul de la synthèse à partir de la liste précéndente
		dw_synthese.reset()
		dw_synthese.insertrow(1)
		
		long lig, tot, lig_jour
		long cptsyn = 0
		long v_nb_soins_du_jour, v_nb_soins_du_jour_attestes
		date date_prec, date_jour
		date_prec = date(1789, 7, 14)
		date_jour = date(1789, 7, 14)
		
		dw_synthese.object.t_titre.text = "Coefficient de Pondération année " + em_annee.text
		
		// 1er passage pour mettre à jour le nb de soins par jout car cas peu planter avec le SQL
		tot = dw_liste.rowcount()
		v_nb_soins_du_jour = 0
		v_nb_soins_du_jour_attestes = 0
		
		lig_jour = 0
		for lig = 1 to tot
			w_patience.avancement("Calcul 1 : " + string(lig/tot * 100, "0.00") + " %")
			if date_jour <> dw_liste.getitemdate(lig, "date_reference") then
				date_jour = dw_liste.getitemdate(lig, "date_reference")
				select isnull(count(*),0) into :v_nb_soins_du_jour from soins 
				where isnull("soins"."date_fs", "soins"."date_exe") = :date_jour ; 
				
				select isnull(count(*),0) into :v_nb_soins_du_jour_attestes from soins 
				where isnull("soins"."date_fs", "soins"."date_exe") = :date_jour and (numero_facture > 0 or isnull(soins.ar_eattest, '') <> '') ;
			end if
			
			dw_liste.setitem(lig, "nb_soins_du_jour", string(v_nb_soins_du_jour))
			dw_liste.setitem(lig, "nb_soins_du_jour_attestes", string(v_nb_soins_du_jour_attestes))
			
		next
			


		if rb_uniquement_soins_atteste.checked then 
			dw_liste.SetFilter(" (numero_facture > 0 or ar_eattest <> ''  ) and long(nb_soins_du_jour_attestes) > 6" )
		else
			dw_liste.SetFilter("long(nb_soins_du_jour) > 6")
		end if
		
		dw_liste.Filter()
		
		
		
		// 2eme passage pour calculer pour chaque date
		tot = dw_liste.rowcount()
		for lig = 1 to tot

			w_patience.avancement("Calcul 2 : " + string(lig/tot * 100, "0.00")  + " %")

			v_mois = "m" + string(month(dw_liste.getItemDate(lig, "soins_date_exe")))
			
//			if v_mois = "m11" then
//				string a
//				date d
//				double c
//				c = dw_liste.getItemNumber(lig, "code")
//				d = dw_liste.getItemDate(lig, "soins_date_demande")
//				a = "r"
//			end if
			dw_synthese.SetItem(1, v_mois,  dw_synthese.GetItemNumber(1, v_mois) +  dw_liste.getItemNumber(lig, "coefficient_p") )
				
		next
		
		// Deuxiemme passage pour la calcul sur 30 jours
		long tot30j
		
		tot = dw_synthese.rowcount()
		for lig = 30 to tot
			tot30j = 0
			for cptsyn = lig -29 to lig
				tot30j = tot30j + dw_synthese.getItemNumber(cptsyn, "coefficient_p")
			next 
			dw_synthese.SetItem(lig, "moyenne_30_jours", tot30j / 30)
		next
		
		
		
		
		close(w_patience)
	
		//prepa_faite = true

	end if
end if

end subroutine

event open;call super::open;
// On ne fait les calculs que pour 1 praticien !
rb_tous.checked = false
rb_tous.enabled = false
rb_un.checked = true
dw_prati.visible = true


em_annee.text = string(year(today()))
em_mois.text = string(month(today()))




end event

on w_liste_soins_coefficient_ponderation.create
int iCurrent
call super::create
this.rb_tous_soins=create rb_tous_soins
this.rb_uniquement_soins_atteste=create rb_uniquement_soins_atteste
this.rb_liste=create rb_liste
this.rb_synthese=create rb_synthese
this.dw_synthese=create dw_synthese
this.st_1=create st_1
this.st_annee=create st_annee
this.em_annee=create em_annee
this.em_mois=create em_mois
this.st_mois=create st_mois
this.gb_2=create gb_2
this.gb_3=create gb_3
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.rb_tous_soins
this.Control[iCurrent+2]=this.rb_uniquement_soins_atteste
this.Control[iCurrent+3]=this.rb_liste
this.Control[iCurrent+4]=this.rb_synthese
this.Control[iCurrent+5]=this.dw_synthese
this.Control[iCurrent+6]=this.st_1
this.Control[iCurrent+7]=this.st_annee
this.Control[iCurrent+8]=this.em_annee
this.Control[iCurrent+9]=this.em_mois
this.Control[iCurrent+10]=this.st_mois
this.Control[iCurrent+11]=this.gb_2
this.Control[iCurrent+12]=this.gb_3
end on

on w_liste_soins_coefficient_ponderation.destroy
call super::destroy
destroy(this.rb_tous_soins)
destroy(this.rb_uniquement_soins_atteste)
destroy(this.rb_liste)
destroy(this.rb_synthese)
destroy(this.dw_synthese)
destroy(this.st_1)
destroy(this.st_annee)
destroy(this.em_annee)
destroy(this.em_mois)
destroy(this.st_mois)
destroy(this.gb_2)
destroy(this.gb_3)
end on

type p_fond from w_liste_patients`p_fond within w_liste_soins_coefficient_ponderation
integer y = 796
end type

type cb_imprimer from w_liste_patients`cb_imprimer within w_liste_soins_coefficient_ponderation
integer taborder = 100
end type

event cb_imprimer::clicked;call super::clicked;

if dw_liste.visible then 
	dw_liste.print()
else
	dw_synthese.print()
end if
end event

type cb_autre from w_liste_patients`cb_autre within w_liste_soins_coefficient_ponderation
end type

event cb_autre::clicked;call super::clicked;


st_min.visible = false
st_max.visible = false
dw_synthese.visible = false

end event

type cb_fermer from w_liste_patients`cb_fermer within w_liste_soins_coefficient_ponderation
integer taborder = 110
end type

type cb_ecran from w_liste_patients`cb_ecran within w_liste_soins_coefficient_ponderation
integer x = 805
end type

event cb_ecran::clicked;call super::clicked;
if rb_liste.checked then 
	dw_synthese.visible = false
	dw_liste.visible = true
	cbx_filtre.visible = true
else
	dw_synthese.visible = true
	dw_liste.visible = false
	cbx_filtre.visible = false
end if
	
end event

type cb_lien_word from w_liste_patients`cb_lien_word within w_liste_soins_coefficient_ponderation
end type

type uo_size from w_liste_patients`uo_size within w_liste_soins_coefficient_ponderation
end type

type rb_un from w_liste_patients`rb_un within w_liste_soins_coefficient_ponderation
integer x = 485
integer y = 216
boolean checked = true
end type

type rb_tous from w_liste_patients`rb_tous within w_liste_soins_coefficient_ponderation
integer x = 485
integer y = 120
boolean enabled = false
end type

type em_nb from w_liste_patients`em_nb within w_liste_soins_coefficient_ponderation
integer taborder = 60
end type

type em_max from w_liste_patients`em_max within w_liste_soins_coefficient_ponderation
boolean visible = false
integer y = 412
end type

type em_min from w_liste_patients`em_min within w_liste_soins_coefficient_ponderation
boolean visible = false
integer y = 412
end type

type dw_1 from w_liste_patients`dw_1 within w_liste_soins_coefficient_ponderation
end type

type gb_1 from w_liste_patients`gb_1 within w_liste_soins_coefficient_ponderation
integer x = 320
integer y = 40
integer taborder = 0
end type

type dw_prati from w_liste_patients`dw_prati within w_liste_soins_coefficient_ponderation
boolean visible = true
integer x = 1243
integer y = 216
integer taborder = 80
end type

type cbx_filtre from w_liste_patients`cbx_filtre within w_liste_soins_coefficient_ponderation
end type

type st_min from w_liste_patients`st_min within w_liste_soins_coefficient_ponderation
boolean visible = false
integer y = 424
end type

type st_max from w_liste_patients`st_max within w_liste_soins_coefficient_ponderation
boolean visible = false
integer y = 424
end type

type dw_liste from w_liste_patients`dw_liste within w_liste_soins_coefficient_ponderation
integer y = 4
integer taborder = 70
string dataobject = "dw_liste_soins_coefficient_ponderation"
end type

type rb_tous_soins from radiobutton within w_liste_soins_coefficient_ponderation
integer x = 485
integer y = 1184
integer width = 704
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
string text = "Tous les soins"
end type

type rb_uniquement_soins_atteste from radiobutton within w_liste_soins_coefficient_ponderation
integer x = 485
integer y = 1088
integer width = 1856
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
string text = "Uniquement les soins ayant fait l~'objet d~'une attestation"
boolean checked = true
end type

type rb_liste from radiobutton within w_liste_soins_coefficient_ponderation
integer x = 485
integer y = 700
integer width = 261
integer height = 84
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 15780518
string text = "Liste"
end type

event clicked;if prepa_faite then 
	dw_synthese.visible = false
	dw_liste.visible = true
end if


st_mois.visible = true
em_mois.visible = true



end event

type rb_synthese from radiobutton within w_liste_soins_coefficient_ponderation
integer x = 485
integer y = 576
integer width = 357
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
string text = "Synthèse"
boolean checked = true
end type

event clicked;if prepa_faite then 
	dw_synthese.visible = true
	dw_liste.visible = false

end if

st_mois.visible = false
em_mois.visible = false



	
end event

type dw_synthese from datawindow within w_liste_soins_coefficient_ponderation
boolean visible = false
integer x = 18
integer y = 4
integer width = 3707
integer height = 1824
integer taborder = 260
boolean bringtotop = true
string title = "none"
string dataobject = "dw_liste_soins_coefficient_ponderation_synthese"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type st_1 from statictext within w_liste_soins_coefficient_ponderation
integer x = 407
integer y = 1420
integer width = 1893
integer height = 184
boolean bringtotop = true
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
boolean italic = true
long backcolor = 553648127
boolean enabled = false
string text = "Remarque : Seuls les jours pendant lesquels plus de 6 prestations ont été attestées entrent en considération pour ce calcul. "
alignment alignment = center!
boolean focusrectangle = false
end type

type st_annee from statictext within w_liste_soins_coefficient_ponderation
integer x = 1193
integer y = 656
integer width = 206
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 553648127
boolean enabled = false
string text = "Année"
boolean focusrectangle = false
end type

type em_annee from editmask within w_liste_soins_coefficient_ponderation
integer x = 1422
integer y = 640
integer width = 325
integer height = 100
integer taborder = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
string mask = "####"
boolean spin = true
end type

type em_mois from editmask within w_liste_soins_coefficient_ponderation
boolean visible = false
integer x = 2016
integer y = 640
integer width = 261
integer height = 100
integer taborder = 90
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
string mask = "####"
boolean spin = true
end type

type st_mois from statictext within w_liste_soins_coefficient_ponderation
boolean visible = false
integer x = 1819
integer y = 656
integer width = 187
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 553648127
boolean enabled = false
string text = "Mois"
boolean focusrectangle = false
end type

type gb_2 from groupbox within w_liste_soins_coefficient_ponderation
integer x = 320
integer y = 992
integer width = 2121
integer height = 304
integer taborder = 250
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean italic = true
long textcolor = 33554432
long backcolor = 15780518
string text = "Sélection des soins"
end type

type gb_3 from groupbox within w_liste_soins_coefficient_ponderation
integer x = 320
integer y = 464
integer width = 2121
integer height = 412
integer taborder = 70
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean italic = true
long textcolor = 33554432
long backcolor = 15780518
string text = "Période à Etudier (date des soins)"
end type

