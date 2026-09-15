$PBExportHeader$w_alexandre_ca_selarl.srw
forward
global type w_alexandre_ca_selarl from window
end type
type dw_prati from datawindow within w_alexandre_ca_selarl
end type
type st_4 from statictext within w_alexandre_ca_selarl
end type
type st_3 from statictext within w_alexandre_ca_selarl
end type
type st_2 from statictext within w_alexandre_ca_selarl
end type
type st_6 from statictext within w_alexandre_ca_selarl
end type
type st_1 from statictext within w_alexandre_ca_selarl
end type
type st_5 from statictext within w_alexandre_ca_selarl
end type
type dw_liste_invisible from datawindow within w_alexandre_ca_selarl
end type
type cb_exporter from commandbutton within w_alexandre_ca_selarl
end type
type dw_synthese from u_basedw within w_alexandre_ca_selarl
end type
type rb_synthese from radiobutton within w_alexandre_ca_selarl
end type
type rb_liste from radiobutton within w_alexandre_ca_selarl
end type
type em_coeff from editmask within w_alexandre_ca_selarl
end type
type em_date_max from editmask within w_alexandre_ca_selarl
end type
type em_date_min from editmask within w_alexandre_ca_selarl
end type
type dw_liste from u_basedw within w_alexandre_ca_selarl
end type
type uo_size from resize_fenetre within w_alexandre_ca_selarl
end type
type cb_ecran from commandbutton within w_alexandre_ca_selarl
end type
type cb_autre from commandbutton within w_alexandre_ca_selarl
end type
type em_nb from editmask within w_alexandre_ca_selarl
end type
type cb_fermer from commandbutton within w_alexandre_ca_selarl
end type
type cb_imprimer from commandbutton within w_alexandre_ca_selarl
end type
type gb_1 from groupbox within w_alexandre_ca_selarl
end type
end forward

global type w_alexandre_ca_selarl from window
integer x = 27
integer y = 200
integer width = 3657
integer height = 1952
boolean titlebar = true
string title = "Liste de Tous les Patients"
boolean controlmenu = true
boolean resizable = true
windowtype windowtype = child!
long backcolor = 15780518
dw_prati dw_prati
st_4 st_4
st_3 st_3
st_2 st_2
st_6 st_6
st_1 st_1
st_5 st_5
dw_liste_invisible dw_liste_invisible
cb_exporter cb_exporter
dw_synthese dw_synthese
rb_synthese rb_synthese
rb_liste rb_liste
em_coeff em_coeff
em_date_max em_date_max
em_date_min em_date_min
dw_liste dw_liste
uo_size uo_size
cb_ecran cb_ecran
cb_autre cb_autre
em_nb em_nb
cb_fermer cb_fermer
cb_imprimer cb_imprimer
gb_1 gb_1
end type
global w_alexandre_ca_selarl w_alexandre_ca_selarl

type variables
boolean prepa_faite
double increment	
double nb_dossier
end variables

forward prototypes
public subroutine traitement_word (integer tab_type[], ref datawindow ldatawin)
public subroutine prepa ()
public subroutine remplir (datawindow dw)
end prototypes

public subroutine traitement_word (integer tab_type[], ref datawindow ldatawin);uo_lien_word	luo
string			lcourrier[]
string			lchemin[]
int				i = 0
boolean			un_pb = false
string			rep_courrier


if ldatawin.AcceptText() = 1 then
// si pas de pb pour valider la dernière modif
// éventuelle de l'utilisateur -> on poursuit

	// on alloue la mémoire
	luo = create uo_lien_word
	
	// recup du chemin courrier
	rep_courrier = fxg_get_rep_courriers()
	
	do 
		// maj var de boucle
		i++
		// on retrouve le nom du fichier de ce type de courrier (cf var globales)
		lcourrier[i] = luo.get_courrier(tab_type[i])
		// récup du chemin du courrier
		// -> pour l'instant obligation d'être ds racine rep courrier
		lchemin[i] = rep_courrier
		// si l'un des nom est vide -> on l'indique
		if lcourrier[i] = "" then un_pb = true
		
	// on boucle tant qu'il y a des types de courrier différents
	// ET que pas d'erreur rencotrée
	loop while i < upperbound(tab_type) AND not un_pb
	
	if not un_pb then
	// si on a bien retrouvé tous les courriers pour ce type de lettre
		// on lance le traitement par word
//pour test : à remettre !!!!!						if luo.traiter_avec_word(Service_MajEtImprime, lcourrier, ldatawin, lchemin) = -1 then
		if luo.traiter_avec_word( courriers_word_type_impr( ), lcourrier, ldatawin, lchemin) = -1 then
			
		// un pb est rencontré
			messagebox("Erreur","Un problème est survenu durant l'opération,~n impossible de poursuivre !", StopSign!)
		end if
	else
	// pas de courrier trouvé -> msg d'erreur
		messagebox("ATTENTION", "Il faut avant tout indiquer un/des fichier(s) au format ~nMicrosoft WORD pour ce(s) courrier(s). ~n~nImpossible de poursuivre !", Exclamation!)
	end if
	
	// libération mémoire
	destroy luo

else
// si un pb sur le accepttext -> msg d'erreur
	messagebox("Erreur","Impossible de poursuivre ! ~n~nUne des valeurs que vous venez de rentrer ~nest incorrect !", StopSign!)
end if
end subroutine

public subroutine prepa ();//string pra_min,pra_max
//double code_min,code_max
//
//if not prepa_faite then
//	prepa_faite = true
//	if rb_tous.checked then
//		pra_min="      "
//		pra_max="ZZZZZZ"
//	else
//		pra_min=dw_prati.getitemstring(dw_prati.getrow(),"code")
//		pra_max=dw_prati.getitemstring(dw_prati.getrow(),"code")
//	end if
//
//	code_min = double(em_min.text)
//	code_max = double(em_max.text)
//	
//	open(w_patience)
//	dw_liste.retrieve(code_min,code_max,pra_min,pra_max)
//	close(w_patience)
//
//	em_nb.text = string(dw_liste.rowcount())+" Dossiers"
//	em_nb.visible = true
//end if
//


date da1,da2

if not prepa_faite then
	prepa_faite = true

	
	open(w_patience)
	
	// Remplissage de la DW à la mimine ... histoire d'avoir de bien belles colonnes à exporter ...
	
	remplir(dw_liste)

	close(w_patience)

	em_nb.text = string(dw_liste.rowcount())+" Actes"
	em_nb.visible = true
end if

end subroutine

public subroutine remplir (datawindow dw);

dw.visible = true



date da1, da2
double coeff
string v_code_praticien, v_nom_praticien

coeff = double(em_coeff.text)

da1 = date(em_date_min.text)
da2 = date(em_date_max.text)

v_code_praticien = dw_prati.gettext()

select nom into :v_nom_praticien from prati where code = :v_code_praticien ;

string st 
st = "Analyse entre le "+em_date_min.text+" et le "+em_date_max.text + " pour " + v_nom_praticien
dw.modify('sous_titre_t.text = " ' + st +' " ' )


dw_liste_invisible.retrieve(da1,da2, v_code_praticien)


string nom, nom_acte, lettre_acte
double code, numero_acte, cotation_acte
date date_debut, date_fin, debut_traitement, date_demande, debut_traitement_fin, date_demande_fin
double montant_total, montant_periode, montant_periode_suivante
boolean premier_semestre

long lig
long jours_periode, jours_periode_suivante, jours_totaux


dw.reset()
dw_synthese.reset()




long nb_lig

nb_lig = dw_liste_invisible.rowcount()

for lig = 1 to nb_lig
	
	dw.insertrow(0)
	dw.scrolltorow(lig)
	
	
	nom = dw_liste_invisible.getitemstring(lig,"nom_patient")
	code = dw_liste_invisible.getitemnumber(lig,"code")
	nom_acte = dw_liste_invisible.getitemstring(lig,"code_soins_nom")
	numero_acte = dw_liste_invisible.getitemnumber(lig,"soins_numero")
	lettre_acte = dw_liste_invisible.getitemstring(lig,"code_soins_lettre")
	cotation_acte = dw_liste_invisible.getitemnumber(lig,"soins_scp_demande")
	debut_traitement = dw_liste_invisible.getitemdate(lig,"patient_debut_traitement")
	date_demande = dw_liste_invisible.getitemdate(lig,"soins_date_demande")
	debut_traitement_fin = date(dw_liste_invisible.getitemdatetime(lig,"debut_traitement_finale"))
	date_demande_fin = date(dw_liste_invisible.getitemdatetime(lig,"date_demande_finale"))
	montant_total = dw_liste_invisible.getitemnumber(lig,"soins_total")
	
	dw.setitem(lig, "nom",nom)
	dw.setitem(lig, "numero_dossier",code)
	dw.setitem(lig, "nom_acte",nom_acte)
	dw.setitem(lig, "numero_acte",numero_acte)
	dw.setitem(lig, "lettre_acte",lettre_acte)
	dw.setitem(lig, "cotation_acte",cotation_acte)
	
	
	premier_semestre = false
	// Dates de l'acte
	if cotation_acte = 90 and numero_acte = 1 and ( lettre_acte ='TO' or lettre_acte = 'SCP') then
		// Cas du premier semestre
		premier_semestre = true
	end if
	
	if premier_semestre and not isnull(debut_traitement) then
		date_debut = debut_traitement
		date_fin = debut_traitement_fin
	else
		date_debut = date_demande
		date_fin = date_demande_fin		
	end if
	
	dw.setitem(lig, "debut_acte",date_debut)
	dw.setitem(lig, "fin_acte",date_fin)
	
	// Le soin se terme APRES la fin de la période
	if da2 <    date_fin then
		jours_periode = daysafter(  date_debut ,  da2 )
	else
		if date_debut = date_fin then
			jours_periode = 1
		else
			jours_periode = 	daysafter(  date_debut ,   date_fin ) 
		end if
	end if
	
	
	dw.setitem(lig, "jours_periode",jours_periode)
	
	jours_totaux  = 	daysafter(  date_debut ,   date_fin )
	
	
	if  da2 <    date_fin then
		jours_periode_suivante = jours_totaux - jours_periode
	else
		jours_periode_suivante = 0 
	end if

	
	dw.setitem(lig, "jours_periode_suivante",jours_periode_suivante)

	dw.setitem(lig, "total_acte",montant_total)
	
	if da1 <= date_debut and date_fin <=da2 then
		// le soin est entier dans la période
		montant_periode = montant_total
		dw.setitem(lig, "coefficient",0)
	else
		if premier_semestre then
			montant_periode = montant_total * coeff 	+ (1 - coeff) * montant_total * jours_periode / daysafter(  date_debut ,   date_fin )
			dw.setitem(lig, "coefficient",coeff)
		else
			dw.setitem(lig, "coefficient",0)
			if date_debut = date_fin then
				montant_periode = montant_total * jours_periode
			else
				montant_periode = montant_total * jours_periode / daysafter(  date_debut ,   date_fin )
			end if
		end if
	end if
	
	montant_periode_suivante = montant_total - montant_periode
	
	dw.setitem(lig, "montant_periode", montant_periode  )
	dw.setitem(lig, "montant_periode_suivante", montant_periode_suivante  )

	
	dw.setitem(lig, "mois",month(date_debut))
	dw.setitem(lig, "annee",year(date_debut))
	
	
NEXT


dw.sort()
dw.groupcalc()


dw.rowsCopy(dw.GetRow(),dw.RowCount(), Primary!, dw_synthese, 1, Primary!)
dw_synthese.sort()
dw_synthese.groupcalc()


//close cur ;
end subroutine

on w_alexandre_ca_selarl.create
this.dw_prati=create dw_prati
this.st_4=create st_4
this.st_3=create st_3
this.st_2=create st_2
this.st_6=create st_6
this.st_1=create st_1
this.st_5=create st_5
this.dw_liste_invisible=create dw_liste_invisible
this.cb_exporter=create cb_exporter
this.dw_synthese=create dw_synthese
this.rb_synthese=create rb_synthese
this.rb_liste=create rb_liste
this.em_coeff=create em_coeff
this.em_date_max=create em_date_max
this.em_date_min=create em_date_min
this.dw_liste=create dw_liste
this.uo_size=create uo_size
this.cb_ecran=create cb_ecran
this.cb_autre=create cb_autre
this.em_nb=create em_nb
this.cb_fermer=create cb_fermer
this.cb_imprimer=create cb_imprimer
this.gb_1=create gb_1
this.Control[]={this.dw_prati,&
this.st_4,&
this.st_3,&
this.st_2,&
this.st_6,&
this.st_1,&
this.st_5,&
this.dw_liste_invisible,&
this.cb_exporter,&
this.dw_synthese,&
this.rb_synthese,&
this.rb_liste,&
this.em_coeff,&
this.em_date_max,&
this.em_date_min,&
this.dw_liste,&
this.uo_size,&
this.cb_ecran,&
this.cb_autre,&
this.em_nb,&
this.cb_fermer,&
this.cb_imprimer,&
this.gb_1}
end on

on w_alexandre_ca_selarl.destroy
destroy(this.dw_prati)
destroy(this.st_4)
destroy(this.st_3)
destroy(this.st_2)
destroy(this.st_6)
destroy(this.st_1)
destroy(this.st_5)
destroy(this.dw_liste_invisible)
destroy(this.cb_exporter)
destroy(this.dw_synthese)
destroy(this.rb_synthese)
destroy(this.rb_liste)
destroy(this.em_coeff)
destroy(this.em_date_max)
destroy(this.em_date_min)
destroy(this.dw_liste)
destroy(this.uo_size)
destroy(this.cb_ecran)
destroy(this.cb_autre)
destroy(this.em_nb)
destroy(this.cb_fermer)
destroy(this.cb_imprimer)
destroy(this.gb_1)
end on

event open;double max,max_row
open(w_patience)

em_date_min.text = "01/10/"+string(year(today()) - 1)
em_date_max.text = "30/09/"+string(year(today()))

em_coeff.text = '0.6'

dw_liste_invisible.settransobject(sqlca)

dw_prati.settransobject(sqlca)
dw_prati.retrieve()

uo_size.taille(this)


prepa_faite = false
close(w_patience)

end event

event resize;uo_size.retaille(this)
end event

type dw_prati from datawindow within w_alexandre_ca_selarl
integer x = 553
integer y = 252
integer width = 855
integer height = 68
integer taborder = 20
string title = "position brush"
string dataobject = "dw_cherche_prati"
boolean border = false
boolean livescroll = true
end type

type st_4 from statictext within w_alexandre_ca_selarl
string tag = "a masquer"
integer x = 201
integer y = 248
integer width = 311
integer height = 72
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
string facename = "Arial"
long backcolor = 553648127
string text = "Patricien :"
end type

type st_3 from statictext within w_alexandre_ca_selarl
string tag = "a masquer"
integer x = 567
integer y = 1160
integer width = 1454
integer height = 80
integer textsize = -10
fontcharset fontcharset = ansi!
string facename = "Arial"
boolean italic = true
long textcolor = 16711680
long backcolor = 553648127
string text = "Pour les premiers semestres (TO 90) uniquement"
end type

type st_2 from statictext within w_alexandre_ca_selarl
string tag = "a masquer"
integer x = 352
integer y = 640
integer width = 558
integer height = 72
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
string facename = "Arial"
boolean underline = true
long backcolor = 553648127
string text = "Période à étudier :"
end type

type st_6 from statictext within w_alexandre_ca_selarl
string tag = "a masquer"
integer x = 1335
integer y = 756
integer width = 288
integer height = 72
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
string facename = "Arial"
long backcolor = 553648127
string text = "Et le "
end type

type st_1 from statictext within w_alexandre_ca_selarl
string tag = "a masquer"
integer x = 521
integer y = 764
integer width = 288
integer height = 72
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
string facename = "Arial"
long backcolor = 553648127
string text = "Entre le "
end type

type st_5 from statictext within w_alexandre_ca_selarl
string tag = "a masquer"
integer x = 553
integer y = 1036
integer width = 850
integer height = 72
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
string facename = "Arial"
long backcolor = 553648127
string text = "Coefficient de pondération : "
end type

type dw_liste_invisible from datawindow within w_alexandre_ca_selarl
boolean visible = false
integer x = 709
integer y = 932
integer width = 571
integer height = 600
integer taborder = 50
string title = "none"
string dataobject = "dw_alexandre_ca_selarl_invisible"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type cb_exporter from commandbutton within w_alexandre_ca_selarl
integer x = 1993
integer y = 1648
integer width = 329
integer height = 128
integer taborder = 110
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean enabled = false
string text = "&Exporter"
end type

event clicked;if dw_liste.visible then
	dw_liste.saveas()
else
	dw_synthese.saveas()
end if
end event

type dw_synthese from u_basedw within w_alexandre_ca_selarl
boolean visible = false
integer width = 3621
integer height = 1612
integer taborder = 10
string dataobject = "dw_alexandre_ca_selarl_synthese"
end type

event rbuttondown;if row > 0 then
	This.SelectRow(0,False)
	This.SelectRow(row,True)
	This.setrow(row)
	OpenMenuPatient_Listes(this)
end if
end event

type rb_synthese from radiobutton within w_alexandre_ca_selarl
integer x = 3141
integer y = 1688
integer width = 366
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 15780518
boolean enabled = false
string text = "Synthèse"
end type

event clicked;

dw_liste.visible = false
dw_synthese.visible = true

end event

type rb_liste from radiobutton within w_alexandre_ca_selarl
integer x = 2875
integer y = 1688
integer width = 247
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 15780518
boolean enabled = false
string text = "Liste"
boolean checked = true
end type

event clicked;dw_liste.visible = true
dw_synthese.visible = false


end event

type em_coeff from editmask within w_alexandre_ca_selarl
integer x = 1413
integer y = 1024
integer width = 325
integer height = 88
integer taborder = 40
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
alignment alignment = center!
borderstyle borderstyle = stylelowered!
string mask = "0.00"
end type

type em_date_max from editmask within w_alexandre_ca_selarl
integer x = 1664
integer y = 748
integer width = 421
integer height = 96
integer taborder = 40
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "dd/mm/yyyy"
boolean spin = true
double increment = 1
string minmax = "~~"
end type

type em_date_min from editmask within w_alexandre_ca_selarl
integer x = 859
integer y = 748
integer width = 421
integer height = 96
integer taborder = 30
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "dd/mm/yyyy"
boolean spin = true
double increment = 1
string minmax = "~~"
end type

type dw_liste from u_basedw within w_alexandre_ca_selarl
boolean visible = false
integer width = 3209
integer height = 1612
integer taborder = 30
string dataobject = "dw_alexandre_ca_selarl"
end type

type uo_size from resize_fenetre within w_alexandre_ca_selarl
boolean visible = false
integer x = 2235
integer y = 580
integer taborder = 30
end type

on uo_size.destroy
call resize_fenetre::destroy
end on

type cb_ecran from commandbutton within w_alexandre_ca_selarl
integer x = 923
integer y = 1648
integer width = 329
integer height = 128
integer taborder = 110
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Ecran"
boolean default = true
end type

event clicked;prepa()
this.enabled = false



cb_imprimer.enabled = true
cb_autre.enabled = true
rb_liste.enabled = true
rb_synthese.enabled = true



dw_liste.visible = true
this.default = false
cb_imprimer.default = true

end event

type cb_autre from commandbutton within w_alexandre_ca_selarl
event clicked pbm_bnclicked
integer x = 1280
integer y = 1648
integer width = 329
integer height = 128
integer taborder = 100
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean enabled = false
string text = "&Autre"
end type

event clicked;prepa_faite = false
this.enabled = false
cb_imprimer.enabled = false
cb_ecran.enabled = true
dw_liste.visible = false
em_nb.visible = false
dw_synthese.visible = false
rb_liste.enabled = false
rb_synthese.enabled = false

rb_liste.checked = true
rb_synthese.checked = false

end event

type em_nb from editmask within w_alexandre_ca_selarl
boolean visible = false
integer x = 55
integer y = 1648
integer width = 722
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

type cb_fermer from commandbutton within w_alexandre_ca_selarl
integer x = 2350
integer y = 1648
integer width = 329
integer height = 128
integer taborder = 80
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Fermer"
end type

event clicked;close(parent)
end event

type cb_imprimer from commandbutton within w_alexandre_ca_selarl
integer x = 1637
integer y = 1648
integer width = 329
integer height = 128
integer taborder = 70
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean enabled = false
string text = "&Imprimer"
end type

event clicked;if dw_liste.visible then
	dw_liste.print()
else
	dw_synthese.print()
end if
end event

type gb_1 from groupbox within w_alexandre_ca_selarl
integer x = 2811
integer y = 1616
integer width = 718
integer height = 172
integer taborder = 90
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean italic = true
long backcolor = 15780518
string text = "Affichage"
borderstyle borderstyle = styleraised!
end type

