$PBExportHeader$w_liste_patients_feuille_soins.srw
forward
global type w_liste_patients_feuille_soins from w_liste_patients
end type
type st_1 from statictext within w_liste_patients_feuille_soins
end type
type st_2 from statictext within w_liste_patients_feuille_soins
end type
type st_3 from statictext within w_liste_patients_feuille_soins
end type
type dw_recto from datawindow within w_liste_patients_feuille_soins
end type
type dw_verso from datawindow within w_liste_patients_feuille_soins
end type
type uo_edition from uo_edition_rtf within w_liste_patients_feuille_soins
end type
type rte_1 from richtextedit within w_liste_patients_feuille_soins
end type
type rb_enf from radiobutton within w_liste_patients_feuille_soins
end type
type rb_adu from radiobutton within w_liste_patients_feuille_soins
end type
type rb_enf_adu from radiobutton within w_liste_patients_feuille_soins
end type
type cbx_deja_imprime from checkbox within w_liste_patients_feuille_soins
end type
type dw_paye from datawindow within w_liste_patients_feuille_soins
end type
type cb_recto from uo_picturebutton_250x120 within w_liste_patients_feuille_soins
end type
type cb_verso from uo_picturebutton_250x120 within w_liste_patients_feuille_soins
end type
type cb_recto_verso from uo_picturebutton_250x120 within w_liste_patients_feuille_soins
end type
type cb_lettres from uo_picturebutton_390x120 within w_liste_patients_feuille_soins
end type
type em_date_max from uo_date_calendrier within w_liste_patients_feuille_soins
end type
type em_date_min from uo_date_calendrier within w_liste_patients_feuille_soins
end type
type dw_recto_fs_integre from datawindow within w_liste_patients_feuille_soins
end type
type dw_verso_fs_integre from datawindow within w_liste_patients_feuille_soins
end type
type rb_pat from radiobutton within w_liste_patients_feuille_soins
end type
type rb_tp from radiobutton within w_liste_patients_feuille_soins
end type
type cbx_que_paye from checkbox within w_liste_patients_feuille_soins
end type
type uo_filtre_email from uo_filtre_emails within w_liste_patients_feuille_soins
end type
type rb_tous_reg from radiobutton within w_liste_patients_feuille_soins
end type
type rb_que_prelevement from radiobutton within w_liste_patients_feuille_soins
end type
type rb_sans_prelevement from radiobutton within w_liste_patients_feuille_soins
end type
type gb_3 from groupbox within w_liste_patients_feuille_soins
end type
type gb_5 from groupbox within w_liste_patients_feuille_soins
end type
type gb_2 from groupbox within w_liste_patients_feuille_soins
end type
type gb_4 from groupbox within w_liste_patients_feuille_soins
end type
end forward

global type w_liste_patients_feuille_soins from w_liste_patients
integer height = 2096
string title = "Feuilles de soins à réaliser pour une période"
st_1 st_1
st_2 st_2
st_3 st_3
dw_recto dw_recto
dw_verso dw_verso
uo_edition uo_edition
rte_1 rte_1
rb_enf rb_enf
rb_adu rb_adu
rb_enf_adu rb_enf_adu
cbx_deja_imprime cbx_deja_imprime
dw_paye dw_paye
cb_recto cb_recto
cb_verso cb_verso
cb_recto_verso cb_recto_verso
cb_lettres cb_lettres
em_date_max em_date_max
em_date_min em_date_min
dw_recto_fs_integre dw_recto_fs_integre
dw_verso_fs_integre dw_verso_fs_integre
rb_pat rb_pat
rb_tp rb_tp
cbx_que_paye cbx_que_paye
uo_filtre_email uo_filtre_email
rb_tous_reg rb_tous_reg
rb_que_prelevement rb_que_prelevement
rb_sans_prelevement rb_sans_prelevement
gb_3 gb_3
gb_5 gb_5
gb_2 gb_2
gb_4 gb_4
end type
global w_liste_patients_feuille_soins w_liste_patients_feuille_soins

type variables
string assure,inverse,plan

m_orthosoins newmenu

boolean impression_integre


end variables

forward prototypes
public subroutine prepa ()
end prototypes

public subroutine prepa ();string pra_min,pra_max,np,tit
double code_min,code_max
date date_min,date_max
string v_filtre, v_tp

if not prepa_faite then
	//prepa_faite = true
	if rb_tous.checked then
		pra_min="      "
		pra_max="ZZZZZZ"
		tit = "Pour tous les Praticiens"
	else
		pra_min=dw_prati.getitemstring(dw_prati.getrow(),"code")
		pra_max=dw_prati.getitemstring(dw_prati.getrow(),"code")
		SELECT nom INTO :np FROM prati WHERE code = :pra_min ;
		Tit = "Pour le Dr "+np
	end if

	code_min = double(em_min.text)
	code_max = double(em_max.text)

	date_min = date(em_date_min.text)
	date_max = date(em_date_max.text)

	string adu_min, adu_max
	adu_min = "N"
	adu_max = "O"
	
	if rb_enf.checked then
		adu_min = 'N'
		adu_max = "N"
	else
		if rb_adu.checked then
			adu_min = 'O'
			adu_max = "O"
		end if
	end if
	
	tit = tit +" - Entre le "+em_date_min.text+" et le "+em_date_max.text

	if rb_pat.checked then
		v_tp = "N"
		tit = tit + " - Partie Patient"
	else
		v_tp = "O"
		tit = tit + " - Partie Tiers Payant"
	end if
	
	
	dw_liste.Modify("titre.text = '"+tit+"'")

	open(w_patience)
	
	// Déjà FS ?
	if cbx_deja_imprime.checked then
		v_filtre = "isnull ( soins_fse_edite  )"
		dw_liste.modify("t_deja.visible = 1")
	else
		v_filtre = ""
		dw_liste.modify("t_deja.visible = 0")
	end if
	
	// Déjà Payé ?
	if cbx_que_paye.checked then
		if v_filtre <> "" then
			v_filtre = v_filtre + " and " 
		end if
			
		v_filtre = v_filtre + " montant_soin = montant_paye" 
		tit = tit + " - Soins déjà payés"
	end if 
	
	// Que avec si soin valo pour le patient ou le tp
	if v_filtre <> "" then
		v_filtre = v_filtre + " and " 
	end if

	v_filtre = v_filtre + " montant_soin > 0 " 
	
	if rb_que_prelevement.checked then
		v_filtre = v_filtre + " and mode_reglement_habituel = 'R' "
		tit = tit + " - Que Prélèvements"
	else
		if rb_sans_prelevement.checked then
			v_filtre = v_filtre + " and mode_reglement_habituel <> 'R' "
		tit = tit + " - Sans Prélèvements"
		end if
	end if
	

	dw_liste.retrieve(code_min, code_max, pra_min, pra_max, date_min, date_max, adu_min, adu_max, v_tp)
	
	// isnull ( soins_fse_edite  ) and  montant_soin > 0 
	
	dw_liste.setfilter(v_filtre)
	dw_liste.filter()
	
	uo_filtre_email.filtre_initial = v_filtre

	close(w_patience)

	//em_nb.text = string(dw_liste.rowcount())+" Dossiers"
	//em_nb.visible = true
end if

end subroutine

event open;call super::open;double dx,dy

em_date_min.setDate(debut_mois_suivant(today()))
em_date_max.setDate(fin_mois_suivant(today()))

SELECT renouv_inverse,payassu,plan_traitement_renouv
INTO :inverse,:assure,:plan FROM param ;
 
// FS Intégrée ou non ?
if profilestring(dir_ini+inifile_orthokis,"DEP-FSE","fs_integre", "N") = "O" then
	impression_integre = true
end if

if impression_integre then
	// mise en place des intégrées
	dw_recto.dataobject = dw_recto_fs_integre.dataobject 
	dw_verso.dataobject = dw_verso_fs_integre.dataobject 
	
	// Le changement de l'image de fond en fonction du type de praticien se fera (pour les deux) dans le retrieve end 
	// de dw_recto
end if


dw_recto.settransobject(SQLCA)
dw_verso.settransobject(SQLCA)


dw_paye.settransobject(sqlca)

// on crée un menu pour le bouton droit 
newmenu = CREATE m_orthosoins


// recherche de l'imprimante spécifique pour les Feuilles de Soins
if profileString(dir_ini+inifile_orthokis,"IMPRIMANTES","feuilles_soins_active","N") = "O" then 
	dw_recto.Modify ('DataWindow.Printer="'+  profileString(dir_ini+inifile_orthokis,"IMPRIMANTES","feuilles_soins","")  +'" ')
	dw_verso.Modify ('DataWindow.Printer="'+  profileString(dir_ini+inifile_orthokis,"IMPRIMANTES","feuilles_soins","")  +'" ')
end if

uo_filtre_email.dw_liste = dw_liste
uo_filtre_email.em_statut_mere = em_nb

end event

on w_liste_patients_feuille_soins.create
int iCurrent
call super::create
this.st_1=create st_1
this.st_2=create st_2
this.st_3=create st_3
this.dw_recto=create dw_recto
this.dw_verso=create dw_verso
this.uo_edition=create uo_edition
this.rte_1=create rte_1
this.rb_enf=create rb_enf
this.rb_adu=create rb_adu
this.rb_enf_adu=create rb_enf_adu
this.cbx_deja_imprime=create cbx_deja_imprime
this.dw_paye=create dw_paye
this.cb_recto=create cb_recto
this.cb_verso=create cb_verso
this.cb_recto_verso=create cb_recto_verso
this.cb_lettres=create cb_lettres
this.em_date_max=create em_date_max
this.em_date_min=create em_date_min
this.dw_recto_fs_integre=create dw_recto_fs_integre
this.dw_verso_fs_integre=create dw_verso_fs_integre
this.rb_pat=create rb_pat
this.rb_tp=create rb_tp
this.cbx_que_paye=create cbx_que_paye
this.uo_filtre_email=create uo_filtre_email
this.rb_tous_reg=create rb_tous_reg
this.rb_que_prelevement=create rb_que_prelevement
this.rb_sans_prelevement=create rb_sans_prelevement
this.gb_3=create gb_3
this.gb_5=create gb_5
this.gb_2=create gb_2
this.gb_4=create gb_4
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.st_1
this.Control[iCurrent+2]=this.st_2
this.Control[iCurrent+3]=this.st_3
this.Control[iCurrent+4]=this.dw_recto
this.Control[iCurrent+5]=this.dw_verso
this.Control[iCurrent+6]=this.uo_edition
this.Control[iCurrent+7]=this.rte_1
this.Control[iCurrent+8]=this.rb_enf
this.Control[iCurrent+9]=this.rb_adu
this.Control[iCurrent+10]=this.rb_enf_adu
this.Control[iCurrent+11]=this.cbx_deja_imprime
this.Control[iCurrent+12]=this.dw_paye
this.Control[iCurrent+13]=this.cb_recto
this.Control[iCurrent+14]=this.cb_verso
this.Control[iCurrent+15]=this.cb_recto_verso
this.Control[iCurrent+16]=this.cb_lettres
this.Control[iCurrent+17]=this.em_date_max
this.Control[iCurrent+18]=this.em_date_min
this.Control[iCurrent+19]=this.dw_recto_fs_integre
this.Control[iCurrent+20]=this.dw_verso_fs_integre
this.Control[iCurrent+21]=this.rb_pat
this.Control[iCurrent+22]=this.rb_tp
this.Control[iCurrent+23]=this.cbx_que_paye
this.Control[iCurrent+24]=this.uo_filtre_email
this.Control[iCurrent+25]=this.rb_tous_reg
this.Control[iCurrent+26]=this.rb_que_prelevement
this.Control[iCurrent+27]=this.rb_sans_prelevement
this.Control[iCurrent+28]=this.gb_3
this.Control[iCurrent+29]=this.gb_5
this.Control[iCurrent+30]=this.gb_2
this.Control[iCurrent+31]=this.gb_4
end on

on w_liste_patients_feuille_soins.destroy
call super::destroy
destroy(this.st_1)
destroy(this.st_2)
destroy(this.st_3)
destroy(this.dw_recto)
destroy(this.dw_verso)
destroy(this.uo_edition)
destroy(this.rte_1)
destroy(this.rb_enf)
destroy(this.rb_adu)
destroy(this.rb_enf_adu)
destroy(this.cbx_deja_imprime)
destroy(this.dw_paye)
destroy(this.cb_recto)
destroy(this.cb_verso)
destroy(this.cb_recto_verso)
destroy(this.cb_lettres)
destroy(this.em_date_max)
destroy(this.em_date_min)
destroy(this.dw_recto_fs_integre)
destroy(this.dw_verso_fs_integre)
destroy(this.rb_pat)
destroy(this.rb_tp)
destroy(this.cbx_que_paye)
destroy(this.uo_filtre_email)
destroy(this.rb_tous_reg)
destroy(this.rb_que_prelevement)
destroy(this.rb_sans_prelevement)
destroy(this.gb_3)
destroy(this.gb_5)
destroy(this.gb_2)
destroy(this.gb_4)
end on

type p_fond from w_liste_patients`p_fond within w_liste_patients_feuille_soins
end type

type cb_imprimer from w_liste_patients`cb_imprimer within w_liste_patients_feuille_soins
integer x = 2144
integer y = 1808
integer width = 384
integer taborder = 160
string text = "Liste"
end type

type cb_autre from w_liste_patients`cb_autre within w_liste_patients_feuille_soins
integer x = 1701
integer y = 1808
integer width = 439
integer taborder = 120
end type

event cb_autre::clicked;call super::clicked;cb_recto.enabled ( false)
cb_verso.enabled  ( false)
cb_recto_verso.enabled  ( false)
cb_lettres.enabled  ( false)
cb_lien_word.enabled  ( false)
end event

type cb_fermer from w_liste_patients`cb_fermer within w_liste_patients_feuille_soins
integer x = 3310
integer y = 1808
integer width = 439
integer taborder = 170
end type

type cb_ecran from w_liste_patients`cb_ecran within w_liste_patients_feuille_soins
integer x = 526
integer y = 1808
integer width = 439
integer taborder = 180
end type

event cb_ecran::clicked;call super::clicked;cb_recto.enabled ( true)
cb_verso.enabled ( true)
cb_recto_verso.enabled ( true)
cb_lettres.enabled ( true)
cb_lien_word.enabled  ( true)


end event

type cb_lien_word from w_liste_patients`cb_lien_word within w_liste_patients_feuille_soins
integer x = 3273
integer y = 1808
integer width = 311
string text = "Imp. Word"
end type

event cb_lien_word::clicked;//uo_lien_word	luo
//string			lcourrier
//
//
//// recup de la bonne lettre
//select lettre_feuille_renouvellement into :lcourrier from param ;
//if isnull(lcourrier) then lcourrier = ""
//
//// on lance l'impression
//luo = create uo_lien_word
//	if luo.traiter_avec_word(Service_MajEtVisualise, lcourrier, dw_liste, fxg_get_rep_courriers()) = -1 then
//	// un pb est rencontré
//		messagebox("Erreur","Un problème est survenu durant l'opération,~n impossible de poursuivre !", StopSign!)
//	end if
//destroy luo

int	tab_type[1] = {lettre_renouvellement}


traitement_word(tab_type, dw_liste)

end event

type uo_size from w_liste_patients`uo_size within w_liste_patients_feuille_soins
end type

type rb_un from w_liste_patients`rb_un within w_liste_patients_feuille_soins
end type

type rb_tous from w_liste_patients`rb_tous within w_liste_patients_feuille_soins
end type

type em_nb from w_liste_patients`em_nb within w_liste_patients_feuille_soins
integer x = 18
integer y = 1832
integer taborder = 100
end type

type em_max from w_liste_patients`em_max within w_liste_patients_feuille_soins
integer y = 592
integer width = 480
integer taborder = 40
string minmax = "-99999999~~999999999"
end type

type em_min from w_liste_patients`em_min within w_liste_patients_feuille_soins
integer y = 592
integer width = 480
integer taborder = 20
string minmax = "-99999999~~999999999"
end type

type dw_1 from w_liste_patients`dw_1 within w_liste_patients_feuille_soins
end type

type gb_1 from w_liste_patients`gb_1 within w_liste_patients_feuille_soins
integer taborder = 0
end type

type dw_prati from w_liste_patients`dw_prati within w_liste_patients_feuille_soins
integer taborder = 10
end type

type cbx_filtre from w_liste_patients`cbx_filtre within w_liste_patients_feuille_soins
end type

type st_min from w_liste_patients`st_min within w_liste_patients_feuille_soins
integer y = 604
end type

type st_max from w_liste_patients`st_max within w_liste_patients_feuille_soins
integer y = 604
end type

type dw_liste from w_liste_patients`dw_liste within w_liste_patients_feuille_soins
integer x = 5
integer y = 4
integer height = 1760
integer taborder = 150
string dataobject = "dw_liste_patients_feuille_soins"
end type

type st_1 from statictext within w_liste_patients_feuille_soins
integer x = 347
integer y = 764
integer width = 878
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
string facename = "Arial"
boolean underline = true
long backcolor = 553648127
string text = "Date d~'exécution :"
end type

type st_2 from statictext within w_liste_patients_feuille_soins
integer x = 1403
integer y = 888
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

type st_3 from statictext within w_liste_patients_feuille_soins
integer x = 475
integer y = 888
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

type dw_recto from datawindow within w_liste_patients_feuille_soins
boolean visible = false
integer x = 155
integer y = 192
integer width = 494
integer height = 360
boolean bringtotop = true
string dataobject = "dw_feuille_soins"
boolean livescroll = true
end type

event printend;print_ok = true
end event

type dw_verso from datawindow within w_liste_patients_feuille_soins
boolean visible = false
integer x = 87
integer y = 1032
integer width = 494
integer height = 360
integer taborder = 60
boolean bringtotop = true
string dataobject = "dw_feuille_soin_verso"
boolean livescroll = true
end type

type uo_edition from uo_edition_rtf within w_liste_patients_feuille_soins
event destroy ( )
boolean visible = false
integer x = 1481
integer y = 436
integer taborder = 90
boolean border = false
long backcolor = 1090519039
end type

on uo_edition.destroy
call uo_edition_rtf::destroy
end on

type rte_1 from richtextedit within w_liste_patients_feuille_soins
boolean visible = false
integer x = 87
integer y = 660
integer width = 494
integer height = 360
integer taborder = 51
boolean bringtotop = true
end type

type rb_enf from radiobutton within w_liste_patients_feuille_soins
integer x = 306
integer y = 1120
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
string text = "Enfants"
boolean checked = true
end type

type rb_adu from radiobutton within w_liste_patients_feuille_soins
integer x = 750
integer y = 1120
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
string text = "Adultes"
end type

type rb_enf_adu from radiobutton within w_liste_patients_feuille_soins
integer x = 1175
integer y = 1120
integer width = 571
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 15780518
string text = "Enfants et Adultes"
end type

type cbx_deja_imprime from checkbox within w_liste_patients_feuille_soins
integer x = 512
integer y = 1624
integer width = 1033
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 15780518
string text = "Eliminer les feuilles déjà réalisées"
boolean checked = true
end type

type dw_paye from datawindow within w_liste_patients_feuille_soins
boolean visible = false
integer x = 1696
integer y = 560
integer width = 686
integer height = 712
integer taborder = 61
boolean bringtotop = true
string title = "none"
string dataobject = "dw_soins"
boolean livescroll = true
end type

type cb_recto from uo_picturebutton_250x120 within w_liste_patients_feuille_soins
integer x = 2533
integer y = 1808
integer width = 384
integer height = 144
integer taborder = 110
boolean bringtotop = true
boolean enabled = false
string text = "&Recto"
string iconname = "ACTIONS_imprimer.png"
end type

event clicked;call super::clicked;string rc
double nblignes,cpt,cle,code,lig
string entete
boolean ok_suite

nblignes = dw_liste.rowcount()

If Messagebox("ATTENTION","Vous avez demandé l'édition des "+string(nblignes)+" feuilles de soins (Recto).~n~nConfirmez-vous ?",Question!,Yesno!,2) = 1 then


	open(w_patience)

	// pour les fonctions du menu orthosoins
	dw_click = dw_paye
	w_click_soins_reg = create w_soins_reg_maj
	w_click_soins_reg.impression_integre = impression_integre
	
	
	
	type_menu = 'R'
	//----------------------------
	
	// On réutilise la fonction d'impression du menu !!
	m_orthosoins m_tempo
	m_tempo  = CREATE m_orthosoins

	
	cpt = 1
	do while cpt <= nblignes 
		
		
		code = dw_liste.getitemnumber(cpt,"soins_code")
		dw_paye.retrieve(code)
		
		// On met les cases FSE à "N"
		//-----------------------------------------
		long  i 
		for i = 1 to dw_paye.rowcount()
			dw_paye.setitem(i,"fse","N")
		next
		
		ok_suite = true
		
		// pour un patient donné
		do while ok_suite and cpt <= nblignes 
			cle = dw_liste.getitemnumber(cpt,"soins_cle")
			
			// on marque tous les soins concernés comme si on les avait cliqué dans les règlements
			lig = dw_paye.find("cle = "+string(cle),1,dw_paye.rowcount())
			if lig > 0 and lig <= dw_paye.rowcount() then
				dw_paye.setitem(lig,"fse","O")
			end if
			
			cpt = cpt + 1
			if cpt <= nblignes then
				if code = dw_liste.getitemnumber(cpt,"soins_code") then
					ok_suite = true
				else
					ok_suite = false
				end if
			else
				ok_suite = false
			end if
		loop
		
		
		// traitement du patient : dw_soins est prêt !!
		w_click_soins_reg.var_code_local = code
		w_click_soins_reg.type_gestion = 'R'

		
		m_tempo.m_soins.m_feuilledesoins2014.triggerEvent(clicked!)

//		if m_tempo.prepa_recto_feuille_soin(dw_paye) then
//			// La dw_impression n'est pas utilisée lors de l'impression de ce recto
//			// On NE PASSE PAS LA meme DW 2eme paramètre : ne sera pas utilisée par la fonction mais sert à détecter si impression UNITAIRE
//			// ou dans le cadre de la fonction d'impression groupée
//			m_tempo.impression_recto (dw_recto,dw_paye)
//		end if
		
	loop
	
	close(w_patience)
	
else
	son(5)
end if
end event

type cb_verso from uo_picturebutton_250x120 within w_liste_patients_feuille_soins
boolean visible = false
integer x = 2043
integer y = 1944
integer taborder = 120
boolean bringtotop = true
boolean enabled = false
string text = "&Verso"
end type

event clicked;call super::clicked;	double nblignes,cpt,cle,code
	double debut,fin,inc

	string ordre

	nblignes = dw_liste.rowcount()

	if inverse = "O" then
		// On imprime dans l'ordre inverse Fin -> début
		ordre = "inverse"
		debut = nblignes
		fin = 1
		inc = -1
	else
		// On imprime dans l'ordre normal
		ordre = "normal"
		debut = 1
		fin = nblignes
		inc = +1
	end if
	
	If Messagebox("ATTENTION","Vous avez demandé l'édition des "+string(nblignes)+" feuilles de soins (verso) dans l'ordre "+ordre+".~n~nConfirmez-vous ?",Question!,Yesno!,2) = 1 then
	
	
	
	
		open(w_patience)
		
		cpt = debut
		
		
		// pour les fonctions du menu orthosoins
		dw_click = dw_paye
		w_click_soins_reg = create w_soins_reg_maj
		w_click_soins_reg.impression_integre = impression_integre
		type_menu = 'R'
		//----------------------------



	
		DO WHILE (cpt <= nblignes and inverse = "N") or (cpt >= 1 and inverse = "O")
	
			code = dw_liste.getitemnumber(cpt,"soins_code")
			cle = dw_liste.getitemnumber(cpt,"soins_cle")
	
			dw_paye.retrieve(code,cle)
			
			m_orthosoins.impression_verso (dw_verso,dw_paye)
			cpt = cpt + inc
	
		LOOP
		
		close(w_patience)
		
	end if
	
	
end event

type cb_recto_verso from uo_picturebutton_250x120 within w_liste_patients_feuille_soins
boolean visible = false
integer x = 2427
integer y = 1952
integer width = 407
integer taborder = 130
boolean bringtotop = true
boolean enabled = false
string text = "Recto/Verso"
end type

event clicked;call super::clicked;







string rc
double nblignes,cpt,cle,code,lig
string entete
boolean ok_suite

nblignes = dw_liste.rowcount()

//open(w_attention_recto_verso_dep)
//
//If message.DoubleParm = 1 then
//
		// pour les fonctions du menu orthosoins
		dw_click = dw_paye
		w_click_soins_reg = create w_soins_reg_maj
		w_click_soins_reg.impression_integre = impression_integre
		type_menu = 'R'
		//----------------------------
	
	open(w_patience)
	
	cpt = 1
	do while cpt <= nblignes 
		
		
		code = dw_liste.getitemnumber(cpt,"soins_code")
		dw_paye.retrieve(code)
		// On met les cases FSE à "N"
		//-----------------------------------------
		long  i 
		for i = 1 to dw_paye.rowcount()
			dw_paye.setitem(i,"fse","N")
		next
		
		ok_suite = true
		
		// pour un patient donné
		do while ok_suite and cpt <= nblignes 
			cle = dw_liste.getitemnumber(cpt,"soins_cle")
			
			// on marque tous les soins concernés comme si on les avait cliqué dans les règlements
			lig = dw_paye.find("cle = "+string(cle),1,dw_paye.rowcount())
			if lig > 0 and lig <= dw_paye.rowcount() then
				dw_paye.setitem(lig,"fse","O")
			end if
			
			cpt = cpt + 1
			if cpt <= nblignes then
				if code = dw_liste.getitemnumber(cpt,"soins_code") then
					ok_suite = true
				else
					ok_suite = false
				end if
			else
				ok_suite = false
			end if
		loop
		
		
		// traitement du patient : dw_soins est prêt !!
		
		if m_orthosoins.prepa_recto_feuille_soin(dw_paye) then
			// La dw_impression n'est pas utilisée lors de l'impression de ce recto
			// On NE PASSE PAS LA meme DW 2eme paramètre : ne sera pas utilisée par la fonction mais sert à détecter si impression UNITAIRE
			// ou dans le cadre de la fonction d'impression groupée
			m_orthosoins.impression_recto_verso (dw_recto,dw_verso,dw_paye)
		end if
		
	loop
	
	close(w_patience)
//else
//	son(5)
//end if
//



//string	rc
//double	nblignes,cpt,cle,code
//string	entete
//long		num_job
//
//
//nblignes = dw_liste.rowcount()
//
//open(w_attention_recto_verso_dep)
//
//If message.DoubleParm = 1 then
//
//	for cpt = 1 to nblignes
//		//retrouve le code et la cle pour le soins
//		code = dw_liste.getitemnumber(cpt,"soins_code")
//		cle = dw_liste.getitemnumber(cpt,"soins_cle")
//		//retrieve des datawin
//		dw_recto.retrieve(code,cle)
//		dw_verso.retrieve(code,cle)
//		//maj de la var globale
//		print_ok = false
//		//lance les impressions des 2 datawin ds un seul "job"
//		num_job = printopen("DEP recto/verso")
//			Printdatawindow(num_job,dw_recto)
//			Printdatawindow(num_job,dw_verso)
//		printclose(num_job)
//		//si impression OK alors on continue ...
//		if print_ok and (dw_recto.rowcount() > 0) and (dw_verso.rowcount() > 0) then	// Sécurité .. on sait jamais !!
//			//ajout à l'histo des éditions des patients
//			string lib_histo 		
//			
//			lib_histo = trim(left(dw_liste.getitemstring(cpt,"code_soins_nom"),14)) 
//			
//			if dw_liste.getitemnumber(cpt,"soins_numero") > 0 then
//				lib_histo = lib_histo + " N°"+string(dw_liste.getitemnumber(cpt,"soins_numero"))
//			end if
//	
//			lib_histo = lib_histo + " : "	+ dw_recto.getitemstring(1,"dem")+" au "+string(dw_recto.getitemdate(1,"dtedem"),"dd/mm/yyyy")
//	
//			
//			ajout_histo_editions(code,"RENSEC",today(),lib_histo  )
//			//ajout de la date d'impression de la DEP sur la ligne du soin
//			UPDATE "soins"   SET "date_impr" = cast(getdate() as date)  	
//			WHERE ( "soins"."cle" =  :cle ) AND  ( "soins"."code" = :code )   ;
//			COMMIT ;
//		end if
//	next
//end if
//
end event

type cb_lettres from uo_picturebutton_390x120 within w_liste_patients_feuille_soins
integer x = 2921
integer y = 1808
integer width = 384
integer taborder = 150
boolean bringtotop = true
boolean enabled = false
string text = "Lettres"
string iconname = "ACTIONS_imprimer.png"
end type

event clicked;call super::clicked;Datastore dw_donnees

dw_donnees = CREATE DataStore
dw_donnees.DataObject = "dw_lettre_renouv"
dw_donnees.SetTransObject(SQLCA)

string pra_min,pra_max,tit,np
double code_min,code_max,tot,cpt
date date_min,date_max,date_min2
long nb, i, j
string code[10]

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

date_min = date(em_date_min.text)
date_max = date(em_date_max.text)
date_min2 = relativedate(date_min,-1)

	string adu_min, adu_max
	adu_min = "N"
	adu_max = "O"
	if rb_enf.checked then
		adu_min = 'N'
		adu_max = "N"
	end if
	if rb_adu.checked then
		adu_min = 'O'
		adu_max = "O"
	end if

string v_filtre_email 

v_filtre_email = uo_filtre_email.filtre



if cbx_deja_imprime.checked then
	if len(trim(v_filtre_email)) > 0 then
		v_filtre_email = v_filtre_email + " and "
	end if
	dw_donnees.setfilter("isnull( soins_date_impr )")
	dw_donnees.modify("t_deja.visible = 1")
else
	dw_donnees.setfilter(v_filtre_email)
	dw_donnees.modify("t_deja.visible = 0")
end if
dw_donnees.filter()

dw_donnees.retrieve(code_min,code_max,pra_min,pra_max,date_min2,date_max,adu_min,adu_max)

j = 1
nb = dw_donnees.RowCount()

if dw_donnees.rowcount() = 0 then
	Messagebox("ATTENTION","Aucune lettre n'est à~n envoyer pour ces critères !")
else

	// On repère les praticiens
	pra_min = ""
	FOR i = 1 TO nb
		pra_max=dw_donnees.getitemstring(i,"patient_code_praticien")
		IF pra_min <> pra_max THEN
			pra_min = pra_max
			code[j] = pra_max
			j++
		END IF
	NEXT	
	
	// On boucle sur les praticiens
	j = j - 1
	FOR i = 1 TO j
		dw_donnees.retrieve(code_min,code_max,code[i],code[i],date_min2,date_max,adu_min,adu_max)	
	
		uo_edition.edition(dw_donnees,"lettre_feuille_renouvellement", false, "" )

		tot = dw_donnees.rowcount()
			
		FOR cpt = 1 TO tot
			ajout_histo_editions(dw_donnees.getitemnumber(cpt,"code"),"RENOUV",today(),"Lettre de Renouvellement")
		NEXT			
		
	NEXT	
end if
	 




Destroy dw_donnees




end event

type em_date_max from uo_date_calendrier within w_liste_patients_feuille_soins
integer x = 1687
integer y = 876
integer taborder = 130
boolean bringtotop = true
end type

on em_date_max.destroy
call uo_date_calendrier::destroy
end on

type em_date_min from uo_date_calendrier within w_liste_patients_feuille_soins
integer x = 882
integer y = 876
integer taborder = 140
boolean bringtotop = true
end type

on em_date_min.destroy
call uo_date_calendrier::destroy
end on

type dw_recto_fs_integre from datawindow within w_liste_patients_feuille_soins
boolean visible = false
integer x = 155
integer y = 568
integer width = 494
integer height = 360
integer taborder = 71
boolean bringtotop = true
string dataobject = "dw_feuille_soins_integree"
boolean livescroll = true
end type

type dw_verso_fs_integre from datawindow within w_liste_patients_feuille_soins
boolean visible = false
integer x = 87
integer y = 1408
integer width = 494
integer height = 360
integer taborder = 70
boolean bringtotop = true
string dataobject = "dw_feuille_soin_verso_integree"
boolean livescroll = true
end type

type rb_pat from radiobutton within w_liste_patients_feuille_soins
integer x = 1952
integer y = 1116
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
string text = "Patients"
boolean checked = true
end type

type rb_tp from radiobutton within w_liste_patients_feuille_soins
integer x = 2395
integer y = 1116
integer width = 448
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 15780518
string text = "Tiers Payants"
end type

type cbx_que_paye from checkbox within w_liste_patients_feuille_soins
integer x = 1650
integer y = 1624
integer width = 1184
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 15780518
string text = "Ne garder que les soins totalement payés"
end type

type uo_filtre_email from uo_filtre_emails within w_liste_patients_feuille_soins
string tag = "no resize all"
integer x = 969
integer y = 1792
integer taborder = 150
boolean bringtotop = true
end type

on uo_filtre_email.destroy
call uo_filtre_emails::destroy
end on

type rb_tous_reg from radiobutton within w_liste_patients_feuille_soins
integer x = 517
integer y = 1376
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
string text = "Tous"
boolean checked = true
end type

type rb_que_prelevement from radiobutton within w_liste_patients_feuille_soins
integer x = 1152
integer y = 1376
integer width = 535
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 15780518
string text = "Que Prélèvement"
end type

type rb_sans_prelevement from radiobutton within w_liste_patients_feuille_soins
integer x = 1920
integer y = 1376
integer width = 535
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 15780518
string text = "Pas Prélèvement"
end type

type gb_3 from groupbox within w_liste_patients_feuille_soins
integer x = 238
integer y = 1016
integer width = 1605
integer height = 236
integer taborder = 70
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean italic = true
long backcolor = 15780518
string text = "Sélection Type de Patients"
end type

type gb_5 from groupbox within w_liste_patients_feuille_soins
integer x = 242
integer y = 1280
integer width = 2757
integer height = 236
integer taborder = 70
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean italic = true
long backcolor = 15780518
string text = "Filtre selon Mode de Règlement Patient"
end type

type gb_2 from groupbox within w_liste_patients_feuille_soins
integer x = 1883
integer y = 1016
integer width = 1106
integer height = 236
integer taborder = 80
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean italic = true
long backcolor = 15780518
string text = "Sélection Patients / Tiers Payants"
end type

type gb_4 from groupbox within w_liste_patients_feuille_soins
integer x = 242
integer y = 1532
integer width = 2757
integer height = 236
integer taborder = 80
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean italic = true
long backcolor = 15780518
string text = "Autres Sélections"
end type

