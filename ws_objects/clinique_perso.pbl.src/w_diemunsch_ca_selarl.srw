$PBExportHeader$w_diemunsch_ca_selarl.srw
forward
global type w_diemunsch_ca_selarl from w_fenetre_arakis
end type
type st_5 from statictext within w_diemunsch_ca_selarl
end type
type dw_prati from datawindow within w_diemunsch_ca_selarl
end type
type dw_liste_invisible from datawindow within w_diemunsch_ca_selarl
end type
type cb_exporter from commandbutton within w_diemunsch_ca_selarl
end type
type dw_synthese from u_basedw within w_diemunsch_ca_selarl
end type
type rb_synthese from radiobutton within w_diemunsch_ca_selarl
end type
type rb_liste from radiobutton within w_diemunsch_ca_selarl
end type
type em_coeff from editmask within w_diemunsch_ca_selarl
end type
type st_4 from statictext within w_diemunsch_ca_selarl
end type
type st_1 from statictext within w_diemunsch_ca_selarl
end type
type em_date_max from editmask within w_diemunsch_ca_selarl
end type
type st_2 from statictext within w_diemunsch_ca_selarl
end type
type em_date_min from editmask within w_diemunsch_ca_selarl
end type
type st_3 from statictext within w_diemunsch_ca_selarl
end type
type st_11 from statictext within w_diemunsch_ca_selarl
end type
type dw_liste from u_basedw within w_diemunsch_ca_selarl
end type
type uo_size from resize_fenetre within w_diemunsch_ca_selarl
end type
type cb_ecran from commandbutton within w_diemunsch_ca_selarl
end type
type cb_autre from commandbutton within w_diemunsch_ca_selarl
end type
type em_nb from editmask within w_diemunsch_ca_selarl
end type
type cb_fermer from commandbutton within w_diemunsch_ca_selarl
end type
type cb_imprimer from commandbutton within w_diemunsch_ca_selarl
end type
type gb_1 from groupbox within w_diemunsch_ca_selarl
end type
end forward

global type w_diemunsch_ca_selarl from w_fenetre_arakis
integer x = 27
integer y = 200
integer width = 3657
integer height = 1952
string title = "Liste de Tous les Patients"
windowtype windowtype = child!
long backcolor = 15780518
st_5 st_5
dw_prati dw_prati
dw_liste_invisible dw_liste_invisible
cb_exporter cb_exporter
dw_synthese dw_synthese
rb_synthese rb_synthese
rb_liste rb_liste
em_coeff em_coeff
st_4 st_4
st_1 st_1
em_date_max em_date_max
st_2 st_2
em_date_min em_date_min
st_3 st_3
st_11 st_11
dw_liste dw_liste
uo_size uo_size
cb_ecran cb_ecran
cb_autre cb_autre
em_nb em_nb
cb_fermer cb_fermer
cb_imprimer cb_imprimer
gb_1 gb_1
end type
global w_diemunsch_ca_selarl w_diemunsch_ca_selarl

type variables
boolean prepa_faite
double increment	
double nb_dossier


string praticien_local
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


praticien_local = dw_prati.getitemstring(dw_prati.getrow(),"code")

  SELECT "prati"."pasfin"  
    INTO :pasfin  
    FROM "prati" WHERE CODE = :praticien_local ;

	open(w_mot_passe_financier)

	if ok_mdp then
		
		
		
		
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

end if
end subroutine

public subroutine remplir (datawindow dw);

dw.visible = true



date da1, da2
double coeff

coeff = double(em_coeff.text)

da1 = date(em_date_min.text)
da2 = date(em_date_max.text)

string nomprat
select nom into :nomprat from prati where code = :praticien_local ;

string st 
st = "Analyse entre le "+em_date_min.text+" et le "+em_date_max.text +" pour le Dr "+nomprat
dw.modify('sous_titre_t.text = " ' + st +' " ' )


dw_liste_invisible.retrieve(da1,da2,praticien_local)


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
	debut_traitement_fin = date(dw_liste_invisible.getitemdate(lig,"debut_traitement_finale"))
	date_demande_fin = date(dw_liste_invisible.getitemdate(lig,"date_demande_finale"))
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



end subroutine

on w_diemunsch_ca_selarl.create
int iCurrent
call super::create
this.st_5=create st_5
this.dw_prati=create dw_prati
this.dw_liste_invisible=create dw_liste_invisible
this.cb_exporter=create cb_exporter
this.dw_synthese=create dw_synthese
this.rb_synthese=create rb_synthese
this.rb_liste=create rb_liste
this.em_coeff=create em_coeff
this.st_4=create st_4
this.st_1=create st_1
this.em_date_max=create em_date_max
this.st_2=create st_2
this.em_date_min=create em_date_min
this.st_3=create st_3
this.st_11=create st_11
this.dw_liste=create dw_liste
this.uo_size=create uo_size
this.cb_ecran=create cb_ecran
this.cb_autre=create cb_autre
this.em_nb=create em_nb
this.cb_fermer=create cb_fermer
this.cb_imprimer=create cb_imprimer
this.gb_1=create gb_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.st_5
this.Control[iCurrent+2]=this.dw_prati
this.Control[iCurrent+3]=this.dw_liste_invisible
this.Control[iCurrent+4]=this.cb_exporter
this.Control[iCurrent+5]=this.dw_synthese
this.Control[iCurrent+6]=this.rb_synthese
this.Control[iCurrent+7]=this.rb_liste
this.Control[iCurrent+8]=this.em_coeff
this.Control[iCurrent+9]=this.st_4
this.Control[iCurrent+10]=this.st_1
this.Control[iCurrent+11]=this.em_date_max
this.Control[iCurrent+12]=this.st_2
this.Control[iCurrent+13]=this.em_date_min
this.Control[iCurrent+14]=this.st_3
this.Control[iCurrent+15]=this.st_11
this.Control[iCurrent+16]=this.dw_liste
this.Control[iCurrent+17]=this.uo_size
this.Control[iCurrent+18]=this.cb_ecran
this.Control[iCurrent+19]=this.cb_autre
this.Control[iCurrent+20]=this.em_nb
this.Control[iCurrent+21]=this.cb_fermer
this.Control[iCurrent+22]=this.cb_imprimer
this.Control[iCurrent+23]=this.gb_1
end on

on w_diemunsch_ca_selarl.destroy
call super::destroy
destroy(this.st_5)
destroy(this.dw_prati)
destroy(this.dw_liste_invisible)
destroy(this.cb_exporter)
destroy(this.dw_synthese)
destroy(this.rb_synthese)
destroy(this.rb_liste)
destroy(this.em_coeff)
destroy(this.st_4)
destroy(this.st_1)
destroy(this.em_date_max)
destroy(this.st_2)
destroy(this.em_date_min)
destroy(this.st_3)
destroy(this.st_11)
destroy(this.dw_liste)
destroy(this.uo_size)
destroy(this.cb_ecran)
destroy(this.cb_autre)
destroy(this.em_nb)
destroy(this.cb_fermer)
destroy(this.cb_imprimer)
destroy(this.gb_1)
end on

event open;call super::open;double max,max_row
open(w_patience)

em_date_min.text = "01/10/"+string(year(today()) - 1)
em_date_max.text = "30/09/"+string(year(today()))

em_coeff.text = '1'

dw_liste_invisible.settransobject(sqlca)

dw_prati.settransobject(sqlca)
dw_prati.retrieve()




uo_size.taille(this)


prepa_faite = false
close(w_patience)

end event

event resize;uo_size.retaille(this)
end event

type p_fond from w_fenetre_arakis`p_fond within w_diemunsch_ca_selarl
end type

type st_5 from statictext within w_diemunsch_ca_selarl
integer x = 338
integer y = 116
integer width = 375
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 700
string facename = "Arial"
boolean underline = true
long backcolor = 553648127
string text = "Praticien :"
end type

type dw_prati from datawindow within w_diemunsch_ca_selarl
string tag = "position"
integer x = 741
integer y = 116
integer width = 873
integer height = 80
integer taborder = 10
string dataobject = "dw_cherche_prati"
boolean border = false
end type

type dw_liste_invisible from datawindow within w_diemunsch_ca_selarl
boolean visible = false
integer x = 709
integer y = 932
integer width = 571
integer height = 600
integer taborder = 50
string title = "none"
string dataobject = "dw_diemunsch_ca_selarl_invisible"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type cb_exporter from commandbutton within w_diemunsch_ca_selarl
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

type dw_synthese from u_basedw within w_diemunsch_ca_selarl
boolean visible = false
integer x = 9
integer y = 4
integer width = 3621
integer height = 1612
integer taborder = 10
string dataobject = "dw_diemunsch_ca_selarl_synthese"
end type

event rbuttondown;if row > 0 then
	This.SelectRow(0,False)
	This.SelectRow(row,True)
	This.setrow(row)
	OpenMenuPatient_Listes(this)
end if
end event

type rb_synthese from radiobutton within w_diemunsch_ca_selarl
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

type rb_liste from radiobutton within w_diemunsch_ca_selarl
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

type em_coeff from editmask within w_diemunsch_ca_selarl
integer x = 1385
integer y = 696
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

type st_4 from statictext within w_diemunsch_ca_selarl
integer x = 530
integer y = 808
integer width = 1490
integer height = 64
integer textsize = -10
fontcharset fontcharset = ansi!
string facename = "Arial"
boolean italic = true
long textcolor = 16711680
long backcolor = 553648127
string text = "Pour les premiers semestres (TO 90) uniquement"
end type

type st_1 from statictext within w_diemunsch_ca_selarl
integer x = 530
integer y = 712
integer width = 841
integer height = 64
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
string facename = "Arial"
long backcolor = 553648127
string text = "Coefficient de pondération : "
end type

type em_date_max from editmask within w_diemunsch_ca_selarl
integer x = 1637
integer y = 420
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

type st_2 from statictext within w_diemunsch_ca_selarl
integer x = 1303
integer y = 432
integer width = 247
integer height = 72
boolean bringtotop = true
integer textsize = -10
integer weight = 700
string facename = "Arial"
long backcolor = 553648127
string text = "Et le"
alignment alignment = center!
end type

type em_date_min from editmask within w_diemunsch_ca_selarl
integer x = 832
integer y = 420
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

type st_3 from statictext within w_diemunsch_ca_selarl
integer x = 503
integer y = 432
integer width = 256
integer height = 72
boolean bringtotop = true
integer textsize = -10
integer weight = 700
string facename = "Arial"
long backcolor = 553648127
string text = "Entre le "
end type

type st_11 from statictext within w_diemunsch_ca_selarl
integer x = 338
integer y = 284
integer width = 567
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 700
string facename = "Arial"
boolean underline = true
long backcolor = 553648127
string text = "Période à étudier :"
end type

type dw_liste from u_basedw within w_diemunsch_ca_selarl
boolean visible = false
integer x = 14
integer width = 3209
integer height = 1612
integer taborder = 30
string dataobject = "dw_diemunsch_ca_selarl"
end type

type uo_size from resize_fenetre within w_diemunsch_ca_selarl
boolean visible = false
integer x = 2235
integer y = 580
integer taborder = 30
end type

on uo_size.destroy
call resize_fenetre::destroy
end on

type cb_ecran from commandbutton within w_diemunsch_ca_selarl
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
cb_exporter.enabled = true
cb_autre.enabled = true
rb_liste.enabled = true
rb_synthese.enabled = true



dw_liste.visible = true
this.default = false
cb_imprimer.default = true

end event

type cb_autre from commandbutton within w_diemunsch_ca_selarl
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
cb_exporter.enabled = false
cb_ecran.enabled = true
dw_liste.visible = false
em_nb.visible = false
dw_synthese.visible = false
rb_liste.enabled = false
rb_synthese.enabled = false

rb_liste.checked = true
rb_synthese.checked = false

end event

type em_nb from editmask within w_diemunsch_ca_selarl
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

type cb_fermer from commandbutton within w_diemunsch_ca_selarl
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

type cb_imprimer from commandbutton within w_diemunsch_ca_selarl
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

type gb_1 from groupbox within w_diemunsch_ca_selarl
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

