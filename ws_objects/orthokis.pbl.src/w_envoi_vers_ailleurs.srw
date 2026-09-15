$PBExportHeader$w_envoi_vers_ailleurs.srw
forward
global type w_envoi_vers_ailleurs from window
end type
type uo_1 from resize_fenetre within w_envoi_vers_ailleurs
end type
type cb_critere from commandbutton within w_envoi_vers_ailleurs
end type
type cb_liste from commandbutton within w_envoi_vers_ailleurs
end type
type cbx_proc_rdv from checkbox within w_envoi_vers_ailleurs
end type
type cbx_proc_reglt from checkbox within w_envoi_vers_ailleurs
end type
type cbx_due from checkbox within w_envoi_vers_ailleurs
end type
type rb_un_cor from radiobutton within w_envoi_vers_ailleurs
end type
type rb_tous_cor from radiobutton within w_envoi_vers_ailleurs
end type
type dw_cores from datawindow within w_envoi_vers_ailleurs
end type
type st_max_cp from statictext within w_envoi_vers_ailleurs
end type
type st_min_cp from statictext within w_envoi_vers_ailleurs
end type
type em_max_cp from editmask within w_envoi_vers_ailleurs
end type
type em_min_cp from editmask within w_envoi_vers_ailleurs
end type
type em_min from editmask within w_envoi_vers_ailleurs
end type
type em_max from editmask within w_envoi_vers_ailleurs
end type
type st_min from statictext within w_envoi_vers_ailleurs
end type
type st_max from statictext within w_envoi_vers_ailleurs
end type
type em_nb from editmask within w_envoi_vers_ailleurs
end type
type dw_prati from datawindow within w_envoi_vers_ailleurs
end type
type rb_tous from radiobutton within w_envoi_vers_ailleurs
end type
type rb_un from radiobutton within w_envoi_vers_ailleurs
end type
type cb_rechercher from commandbutton within w_envoi_vers_ailleurs
end type
type cb_imprimer from commandbutton within w_envoi_vers_ailleurs
end type
type cb_fermer from commandbutton within w_envoi_vers_ailleurs
end type
type cb_exporter from commandbutton within w_envoi_vers_ailleurs
end type
type gb_3 from groupbox within w_envoi_vers_ailleurs
end type
type gb_cor from groupbox within w_envoi_vers_ailleurs
end type
type gb_cp from groupbox within w_envoi_vers_ailleurs
end type
type gb_2 from groupbox within w_envoi_vers_ailleurs
end type
type gb_1 from groupbox within w_envoi_vers_ailleurs
end type
type dw_liste_export from datawindow within w_envoi_vers_ailleurs
end type
type dw_liste from datawindow within w_envoi_vers_ailleurs
end type
end forward

global type w_envoi_vers_ailleurs from window
integer x = 27
integer y = 140
integer width = 2857
integer height = 1540
boolean titlebar = true
string title = "Exportation de Patients"
windowtype windowtype = response!
long backcolor = 15780518
uo_1 uo_1
cb_critere cb_critere
cb_liste cb_liste
cbx_proc_rdv cbx_proc_rdv
cbx_proc_reglt cbx_proc_reglt
cbx_due cbx_due
rb_un_cor rb_un_cor
rb_tous_cor rb_tous_cor
dw_cores dw_cores
st_max_cp st_max_cp
st_min_cp st_min_cp
em_max_cp em_max_cp
em_min_cp em_min_cp
em_min em_min
em_max em_max
st_min st_min
st_max st_max
em_nb em_nb
dw_prati dw_prati
rb_tous rb_tous
rb_un rb_un
cb_rechercher cb_rechercher
cb_imprimer cb_imprimer
cb_fermer cb_fermer
cb_exporter cb_exporter
gb_3 gb_3
gb_cor gb_cor
gb_cp gb_cp
gb_2 gb_2
gb_1 gb_1
dw_liste_export dw_liste_export
dw_liste dw_liste
end type
global w_envoi_vers_ailleurs w_envoi_vers_ailleurs

type variables
boolean prepa_faite
string sel,clauseo,clausew
double nbsel,increment
end variables

forward prototypes
public subroutine maj_boutons (character code)
end prototypes

public subroutine maj_boutons (character code);CHOOSE CASE code	
	CASE 'l'
	// Affichage de la liste
		if nbsel > 0 then
			cb_critere.enabled = true
			cb_liste.enabled = false
			cb_imprimer.enabled = true
			dw_liste.visible = true
			cb_exporter.enabled = true
		else
			son(5)
			Messagebox("ATTENTION","Aucun patient trouvé !")
			cb_liste.enabled = false
		end if
		
	CASE 'c'
	// affichage des critères
			cb_critere.enabled = false
			cb_liste.enabled = true
			cb_imprimer.enabled = false
			dw_liste.visible = false
			cb_exporter.enabled = false
END CHOOSE

end subroutine

event open;nbsel = 0

em_min.text = "-99999999"
em_max.text = "999999999"
em_max_cp.text = "99999"

dw_prati.settransobject(SQLCA)
dw_prati.retrieve()

dw_cores.settransobject(SQLCA)
dw_cores.retrieve()

dw_liste.settransobject(SQLCA)
dw_liste_export.settransobject(SQLCA)

if not multi then
	rb_tous.checked = false
	rb_tous.enabled = false
	rb_un.checked = true
	dw_prati.visible = true
end if

uo_1.taille(this)

end event

on w_envoi_vers_ailleurs.create
this.uo_1=create uo_1
this.cb_critere=create cb_critere
this.cb_liste=create cb_liste
this.cbx_proc_rdv=create cbx_proc_rdv
this.cbx_proc_reglt=create cbx_proc_reglt
this.cbx_due=create cbx_due
this.rb_un_cor=create rb_un_cor
this.rb_tous_cor=create rb_tous_cor
this.dw_cores=create dw_cores
this.st_max_cp=create st_max_cp
this.st_min_cp=create st_min_cp
this.em_max_cp=create em_max_cp
this.em_min_cp=create em_min_cp
this.em_min=create em_min
this.em_max=create em_max
this.st_min=create st_min
this.st_max=create st_max
this.em_nb=create em_nb
this.dw_prati=create dw_prati
this.rb_tous=create rb_tous
this.rb_un=create rb_un
this.cb_rechercher=create cb_rechercher
this.cb_imprimer=create cb_imprimer
this.cb_fermer=create cb_fermer
this.cb_exporter=create cb_exporter
this.gb_3=create gb_3
this.gb_cor=create gb_cor
this.gb_cp=create gb_cp
this.gb_2=create gb_2
this.gb_1=create gb_1
this.dw_liste_export=create dw_liste_export
this.dw_liste=create dw_liste
this.Control[]={this.uo_1,&
this.cb_critere,&
this.cb_liste,&
this.cbx_proc_rdv,&
this.cbx_proc_reglt,&
this.cbx_due,&
this.rb_un_cor,&
this.rb_tous_cor,&
this.dw_cores,&
this.st_max_cp,&
this.st_min_cp,&
this.em_max_cp,&
this.em_min_cp,&
this.em_min,&
this.em_max,&
this.st_min,&
this.st_max,&
this.em_nb,&
this.dw_prati,&
this.rb_tous,&
this.rb_un,&
this.cb_rechercher,&
this.cb_imprimer,&
this.cb_fermer,&
this.cb_exporter,&
this.gb_3,&
this.gb_cor,&
this.gb_cp,&
this.gb_2,&
this.gb_1,&
this.dw_liste_export,&
this.dw_liste}
end on

on w_envoi_vers_ailleurs.destroy
destroy(this.uo_1)
destroy(this.cb_critere)
destroy(this.cb_liste)
destroy(this.cbx_proc_rdv)
destroy(this.cbx_proc_reglt)
destroy(this.cbx_due)
destroy(this.rb_un_cor)
destroy(this.rb_tous_cor)
destroy(this.dw_cores)
destroy(this.st_max_cp)
destroy(this.st_min_cp)
destroy(this.em_max_cp)
destroy(this.em_min_cp)
destroy(this.em_min)
destroy(this.em_max)
destroy(this.st_min)
destroy(this.st_max)
destroy(this.em_nb)
destroy(this.dw_prati)
destroy(this.rb_tous)
destroy(this.rb_un)
destroy(this.cb_rechercher)
destroy(this.cb_imprimer)
destroy(this.cb_fermer)
destroy(this.cb_exporter)
destroy(this.gb_3)
destroy(this.gb_cor)
destroy(this.gb_cp)
destroy(this.gb_2)
destroy(this.gb_1)
destroy(this.dw_liste_export)
destroy(this.dw_liste)
end on

event resize;uo_1.retaille(this)
end event

type uo_1 from resize_fenetre within w_envoi_vers_ailleurs
boolean visible = false
integer x = 562
integer y = 872
integer taborder = 91
long backcolor = 1090519039
end type

on uo_1.destroy
call resize_fenetre::destroy
end on

type cb_critere from commandbutton within w_envoi_vers_ailleurs
integer x = 1221
integer y = 1288
integer width = 384
integer height = 128
integer taborder = 50
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean enabled = false
string text = "&Critères"
end type

on clicked;maj_boutons('c')
end on

type cb_liste from commandbutton within w_envoi_vers_ailleurs
integer x = 818
integer y = 1288
integer width = 384
integer height = 128
integer taborder = 60
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean enabled = false
string text = "&Liste"
end type

on clicked;maj_boutons('l')
end on

type cbx_proc_rdv from checkbox within w_envoi_vers_ailleurs
integer x = 2304
integer y = 832
integer width = 398
integer height = 72
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 15780518
string text = "Proc. Rdv"
boolean checked = true
end type

type cbx_proc_reglt from checkbox within w_envoi_vers_ailleurs
integer x = 2304
integer y = 720
integer width = 411
integer height = 72
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 15780518
string text = "Proc. Règlt."
boolean checked = true
end type

type cbx_due from checkbox within w_envoi_vers_ailleurs
integer x = 2304
integer y = 612
integer width = 411
integer height = 72
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 15780518
string text = "Somme Due"
boolean checked = true
end type

type rb_un_cor from radiobutton within w_envoi_vers_ailleurs
integer x = 137
integer y = 924
integer width = 622
integer height = 80
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 15780518
string text = "Un correspondant"
end type

on clicked;rb_tous_cor.checked = false
dw_cores.visible = true
end on

type rb_tous_cor from radiobutton within w_envoi_vers_ailleurs
integer x = 137
integer y = 836
integer width = 805
integer height = 80
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 15780518
string text = "Tous les correspondants"
boolean checked = true
end type

on clicked;rb_un_cor.checked = false
dw_cores.visible = false
end on

type dw_cores from datawindow within w_envoi_vers_ailleurs
boolean visible = false
integer x = 969
integer y = 920
integer width = 1111
integer height = 80
integer taborder = 90
string dataobject = "dw_cherche_corresp"
boolean border = false
end type

type st_max_cp from statictext within w_envoi_vers_ailleurs
integer x = 1353
integer y = 560
integer width = 219
integer height = 72
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 15780518
boolean enabled = false
string text = "Au N°"
boolean focusrectangle = false
end type

type st_min_cp from statictext within w_envoi_vers_ailleurs
integer x = 1353
integer y = 448
integer width = 251
integer height = 72
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 15780518
boolean enabled = false
string text = "Du N°"
boolean focusrectangle = false
end type

type em_max_cp from editmask within w_envoi_vers_ailleurs
integer x = 1605
integer y = 552
integer width = 393
integer height = 96
integer taborder = 160
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
alignment alignment = right!
borderstyle borderstyle = stylelowered!
string mask = "####0"
boolean spin = true
string displaydata = "˜"
double increment = 1
string minmax = "0~~99999"
end type

on losefocus;//if double(em_max.gettext()) < double(em_min.gettext()) then
//
//
//end if
end on

type em_min_cp from editmask within w_envoi_vers_ailleurs
integer x = 1605
integer y = 432
integer width = 393
integer height = 96
integer taborder = 130
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
alignment alignment = right!
borderstyle borderstyle = stylelowered!
string mask = "####0"
boolean spin = true
string displaydata = "˜"
double increment = 1
string minmax = "0~~99999"
end type

type em_min from editmask within w_envoi_vers_ailleurs
integer x = 375
integer y = 420
integer width = 507
integer height = 96
integer taborder = 140
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
alignment alignment = right!
borderstyle borderstyle = stylelowered!
string mask = "########0"
boolean spin = true
string displaydata = "Ä"
double increment = 1
string minmax = "-9999~~99999"
end type

type em_max from editmask within w_envoi_vers_ailleurs
integer x = 375
integer y = 540
integer width = 507
integer height = 96
integer taborder = 150
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
alignment alignment = right!
borderstyle borderstyle = stylelowered!
string mask = "########0"
boolean spin = true
string displaydata = "˜"
double increment = 1
string minmax = "-9999~~99999"
end type

on losefocus;//if double(em_max.gettext()) < double(em_min.gettext()) then
//
//
//end if
end on

type st_min from statictext within w_envoi_vers_ailleurs
integer x = 169
integer y = 436
integer width = 251
integer height = 72
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 15780518
boolean enabled = false
string text = "Du N°"
boolean focusrectangle = false
end type

type st_max from statictext within w_envoi_vers_ailleurs
integer x = 169
integer y = 548
integer width = 219
integer height = 72
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 15780518
boolean enabled = false
string text = "Au N°"
boolean focusrectangle = false
end type

type em_nb from editmask within w_envoi_vers_ailleurs
boolean visible = false
integer x = 59
integer y = 1304
integer width = 722
integer height = 100
integer taborder = 40
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
string mask = "XXXXXXXXXXXXXXXXXXXXXXXX"
end type

type dw_prati from datawindow within w_envoi_vers_ailleurs
boolean visible = false
integer x = 983
integer y = 196
integer width = 1042
integer height = 80
integer taborder = 100
string dataobject = "dw_cherche_prati"
boolean border = false
end type

type rb_tous from radiobutton within w_envoi_vers_ailleurs
integer x = 151
integer y = 108
integer width = 695
integer height = 80
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

on clicked;rb_un.checked = false
dw_prati.visible = false
end on

type rb_un from radiobutton within w_envoi_vers_ailleurs
integer x = 151
integer y = 192
integer width = 622
integer height = 80
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 15780518
string text = "Un praticien"
end type

on clicked;rb_tous.checked = false
dw_prati.visible = true
end on

type cb_rechercher from commandbutton within w_envoi_vers_ailleurs
integer x = 2327
integer y = 208
integer width = 398
integer height = 128
integer taborder = 200
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Rechercher"
boolean cancel = true
boolean default = true
end type

event clicked;string rc,cor,pra
double code_min,code_max

if not prepa_faite then

	code_min = double(em_min.text)
	code_max = double(em_max.text)

	cor = dw_cores.gettext()
	pra = dw_prati.gettext()

	sel =   'SELECT code,nom,prenom,nom_parent1,ville_parent1,teldom_parent1,teltra_parent1,date_naissance,debut_traitement,code_praticien,type_dossier,code_correspondant,premiere_visite,moulage,relance FROM patient '


	// N° de dossier
		clausew = " WHERE patient.code between "+string(code_min)+" and "+string(code_max)+" "

	// Code Postal
		clausew = clausew + " and patient.codep_parent1 between '"+em_min_cp.text+"' and '"+em_max_cp.text+"' "

	if rb_un_cor.checked then
	// CoRrespondant
		clausew = clausew + " and patient.code_correspondant = '" + cor+ "' "
	end if

	if rb_un.checked then
	// Praticien
		clausew = clausew + " and patient.code_praticien = '" + pra+ "' "
	end if


	// Clause ORDER BY toujours la même
	clauseo = " ORDER BY Patient.nom ASC, patient.ville_parent1 ASC"

//messagebox('trace',sel+clausew+clauseo)
//
	// Attention à la syntaxe !!
	rc = dw_liste.Modify('datawindow.table.select ="'+ sel + clausew + clauseo  +'"')

	// Rc renvoi un message d'erreur si problème
	if rc = "" then

		double max_row
		SELECT count(*) INTO :max_row FROM patient ;

		increment = integer(max_row / 10)

		open(w_patience)
		dw_liste.retrieve()	
		close(w_patience)

		nbsel = dw_liste.rowcount()

		if nbsel > 0 then
			em_nb.text = string(dw_liste.rowcount())+" Dossiers"
		else	
			son(4)
			em_nb.text = "Aucun Dossier"
		end if
		maj_boutons('l')
		em_nb.visible = true
	else
		son(4)
		messageBox("erreur",rc)
	end if
end if

end event

type cb_imprimer from commandbutton within w_envoi_vers_ailleurs
integer x = 1623
integer y = 1288
integer width = 384
integer height = 128
integer taborder = 190
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean enabled = false
string text = "&Imprimer"
end type

on clicked;dw_liste.print()
end on

type cb_fermer from commandbutton within w_envoi_vers_ailleurs
integer x = 2427
integer y = 1288
integer width = 384
integer height = 128
integer taborder = 180
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Fermer"
end type

event clicked;fermer_fenetre(parent)

end event

type cb_exporter from commandbutton within w_envoi_vers_ailleurs
integer x = 2025
integer y = 1288
integer width = 384
integer height = 128
integer taborder = 170
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean enabled = false
string text = "&Exporter"
end type

event clicked;String rc

sel = "SELECT code,nom,nom_parent1,adr1_parent1,adr2_parent1,codep_parent1,ville_parent1,teldom_parent1,teltra_parent1,com_parent1,secu_parent1,nom_parent2,adr1_parent2,adr2_parent2,codep_parent2,ville_parent2,teldom_parent2,teltra_parent2,com_parent2,secu_parent2,nom_payeur,adr1_payeur,adr2_payeur,codep_payeur,ville_payeur,teldom_payeur,teltra_payeur,com_payeur,secu_payeur,date_naissance,debut_traitement,date_prem_demande,classe,type,code_praticien,type_dossier,premiere_visite,moulage,relance,sexe,prof_parent1,prof_parent2,prof_payeur,somme_due,date_proc_reglt,mont_proc_reglt,proc_rdv,code_correspondant,code_dentiste,code_caisse,code_mutuelle  FROM patient "

// Attention à la syntaxe !!
	rc = dw_liste_export.Modify('datawindow.table.select ="'+ sel + clausew + clauseo  +'"')

	// Rc renvoi un message d'erreur si problème
	if rc = "" then
		open(w_patience)
		dw_liste_export.retrieve()

		if cbx_due.checked or cbx_proc_rdv.checked or cbx_proc_reglt.checked then
			double nb,cpt,patcour
			decimal {2} v_mon2
			date v_da
			nb = dw_liste_export.rowcount()

			for cpt = 1 to nb

				w_patience.wf_setvalue(cpt / nb * 100)

				patcour = dw_liste_export.getitemnumber(cpt,"code")

				if	cbx_due.checked then
					dw_liste_export.setitem(cpt,"somme_due",string(due(patcour,today()),"0.00"))
				end if

				if	cbx_proc_rdv.checked then
					dw_liste_export.setitem(cpt,"proc_rdv",proc_rdv(patcour))
				end if

				if	cbx_proc_reglt.checked then
					proc_reglt(patcour,v_da,v_mon2,'P')
					dw_liste_export.setitem(cpt,"date_proc_reglt",v_da)
					dw_liste_export.setitem(cpt,"mont_proc_reglt",string(v_mon2,"0.00"))
				end if
			next
		end if
		close(w_patience)
		dw_liste_export.SaveAs()
	else
		son(4)
		messageBox("erreur",rc)
	end if

end event

type gb_3 from groupbox within w_envoi_vers_ailleurs
integer x = 2226
integer y = 504
integer width = 571
integer height = 532
integer taborder = 30
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean italic = true
long textcolor = 33554432
long backcolor = 15780518
string text = "Calculer"
end type

type gb_cor from groupbox within w_envoi_vers_ailleurs
integer x = 41
integer y = 20
integer width = 2121
integer height = 288
integer taborder = 10
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

type gb_cp from groupbox within w_envoi_vers_ailleurs
integer x = 1230
integer y = 344
integer width = 933
integer height = 384
integer taborder = 120
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean italic = true
long textcolor = 33554432
long backcolor = 15780518
string text = "Code Postaux"
end type

type gb_2 from groupbox within w_envoi_vers_ailleurs
integer x = 46
integer y = 332
integer width = 933
integer height = 384
integer taborder = 110
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean italic = true
long textcolor = 33554432
long backcolor = 15780518
string text = "Dossiers"
end type

type gb_1 from groupbox within w_envoi_vers_ailleurs
integer x = 46
integer y = 752
integer width = 2121
integer height = 288
integer taborder = 70
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean italic = true
long textcolor = 33554432
long backcolor = 15780518
string text = "Choix du correspondant"
end type

type dw_liste_export from datawindow within w_envoi_vers_ailleurs
boolean visible = false
integer x = 142
integer y = 412
integer width = 2075
integer height = 720
integer taborder = 80
string dataobject = "dw_liste_envoi_ailleurs"
boolean vscrollbar = true
boolean livescroll = true
end type

event retrieverow;maj_patience(row,increment)

end event

type dw_liste from datawindow within w_envoi_vers_ailleurs
boolean visible = false
integer x = 23
integer y = 8
integer width = 2789
integer height = 1260
integer taborder = 20
string dataobject = "dw_liste_envoi_ailleurs_edition"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
end type

event retrieverow;maj_patience(row,increment)

end event

