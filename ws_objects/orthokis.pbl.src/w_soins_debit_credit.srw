$PBExportHeader$w_soins_debit_credit.srw
forward
global type w_soins_debit_credit from w_fenetre_arakis
end type
type cb_imprimer from uo_picturebutton_390x120 within w_soins_debit_credit
end type
type uo_resize from resize_fenetre within w_soins_debit_credit
end type
type cb_fermer from uo_picturebutton_390x120_fermer within w_soins_debit_credit
end type
type dw_liste from datawindow within w_soins_debit_credit
end type
type rb_patient from radiobutton within w_soins_debit_credit
end type
type rb_caisse from radiobutton within w_soins_debit_credit
end type
type rb_mutuelle from radiobutton within w_soins_debit_credit
end type
type rb_tout from radiobutton within w_soins_debit_credit
end type
type rb_today from radiobutton within w_soins_debit_credit
end type
type rb_toutesdates from radiobutton within w_soins_debit_credit
end type
type dw_courriers from u_basedw within w_soins_debit_credit
end type
type rte_1 from richtextedit within w_soins_debit_credit
end type
type dw_liste_impression from datawindow within w_soins_debit_credit
end type
type gb_origine from groupbox within w_soins_debit_credit
end type
type gb_chrono from groupbox within w_soins_debit_credit
end type
end forward

global type w_soins_debit_credit from w_fenetre_arakis
integer width = 3749
integer height = 2560
string title = ""
boolean minbox = false
boolean maxbox = false
boolean resizable = false
windowtype windowtype = response!
integer animationtime = 50
cb_imprimer cb_imprimer
uo_resize uo_resize
cb_fermer cb_fermer
dw_liste dw_liste
rb_patient rb_patient
rb_caisse rb_caisse
rb_mutuelle rb_mutuelle
rb_tout rb_tout
rb_today rb_today
rb_toutesdates rb_toutesdates
dw_courriers dw_courriers
rte_1 rte_1
dw_liste_impression dw_liste_impression
gb_origine gb_origine
gb_chrono gb_chrono
end type
global w_soins_debit_credit w_soins_debit_credit

type variables



char filtre_origine
date filtre_date_limite

double v_code, v_num_dossier
string v_nom

end variables

forward prototypes
public subroutine filtrer (string v_origine, date date_limite)
end prototypes

public subroutine filtrer (string v_origine, date date_limite);
if v_origine = 'T' then
	// pour tout prendre
	dw_liste.setfilter("")
else
	dw_liste.setfilter("origine = '"+v_origine+ "' and date_operation <= date('"+string(date_limite)+"')")
end if

dw_liste.filter()
end subroutine

on w_soins_debit_credit.create
int iCurrent
call super::create
this.cb_imprimer=create cb_imprimer
this.uo_resize=create uo_resize
this.cb_fermer=create cb_fermer
this.dw_liste=create dw_liste
this.rb_patient=create rb_patient
this.rb_caisse=create rb_caisse
this.rb_mutuelle=create rb_mutuelle
this.rb_tout=create rb_tout
this.rb_today=create rb_today
this.rb_toutesdates=create rb_toutesdates
this.dw_courriers=create dw_courriers
this.rte_1=create rte_1
this.dw_liste_impression=create dw_liste_impression
this.gb_origine=create gb_origine
this.gb_chrono=create gb_chrono
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_imprimer
this.Control[iCurrent+2]=this.uo_resize
this.Control[iCurrent+3]=this.cb_fermer
this.Control[iCurrent+4]=this.dw_liste
this.Control[iCurrent+5]=this.rb_patient
this.Control[iCurrent+6]=this.rb_caisse
this.Control[iCurrent+7]=this.rb_mutuelle
this.Control[iCurrent+8]=this.rb_tout
this.Control[iCurrent+9]=this.rb_today
this.Control[iCurrent+10]=this.rb_toutesdates
this.Control[iCurrent+11]=this.dw_courriers
this.Control[iCurrent+12]=this.rte_1
this.Control[iCurrent+13]=this.dw_liste_impression
this.Control[iCurrent+14]=this.gb_origine
this.Control[iCurrent+15]=this.gb_chrono
end on

on w_soins_debit_credit.destroy
call super::destroy
destroy(this.cb_imprimer)
destroy(this.uo_resize)
destroy(this.cb_fermer)
destroy(this.dw_liste)
destroy(this.rb_patient)
destroy(this.rb_caisse)
destroy(this.rb_mutuelle)
destroy(this.rb_tout)
destroy(this.rb_today)
destroy(this.rb_toutesdates)
destroy(this.dw_courriers)
destroy(this.rte_1)
destroy(this.dw_liste_impression)
destroy(this.gb_origine)
destroy(this.gb_chrono)
end on

event open;call super::open;
// passage du code du dossier en paramètre


v_code = message.DoubleParm


string v_entete

colore_tous_objets_window(this, couleur_fond_datawindow)

centrer(this)

//dw_soins.settransobject(sqlca)
//dw_soins.retrieve(v_code,date('1900-01-01'),"E")


dw_courriers.settransobject(sqlca)
select patient.nom+' '+isnull( patient.prenom,''),  patient.numero_dossier, prati.entete into :v_nom, :v_num_dossier , :v_entete
from patient , prati
where patient.code = :v_code and patient.code_praticien = prati.code;


dw_liste.object.t_titre.text = v_nom
dw_liste.object.t_sous_titre.text = "Dossier N°"+string(v_num_dossier)
dw_liste_impression.object.t_titre.text = v_nom
dw_liste_impression.object.t_sous_titre.text = "Dossier N°"+string(v_num_dossier)


this.title = "Dossier comptable de "+v_nom + " - Dossier N°"+string(v_num_dossier)

// On remplit le tableau avec toutes les échéances 

declare cur_soins Cursor for 
select code_soins.nom, soins.numero, soins.date_demande, ligne_soins."date", ligne_soins.montant , ligne_soins.origine_tp 
from soins, code_soins, ligne_soins 
where code_soins.code = soins."type" and soins.code = ligne_soins.code 
and soins.cle = ligne_soins.cle and soins.code = :v_code ;


string v_nom_soin, v_origine, v_libelle
long v_numero_soin, v_cle_soin, nb_regl
date v_date_demande, v_date_echeance
double v_montant
string v_mode_reglement

integer lig 

open cur_soins ;
fetch cur_soins into :v_nom_soin, :v_numero_soin, :v_date_demande, :v_date_echeance, :v_montant, :v_origine ;

do while sqlca.sqlcode = 0
	
	dw_liste.insertrow(99999)
	lig = dw_liste.rowcount()
	
	dw_liste.setitem(lig,"date_operation",v_date_echeance)
	if v_numero_soin > 0 then
		v_libelle = v_nom_soin + " N°"+string(v_numero_soin)+" du "+string(v_date_demande)
	else
		v_libelle = v_nom_soin + " du "+string(v_date_demande)
	end if
	dw_liste.setitem(lig,"libelle",v_libelle)
	dw_liste.setitem(lig,"debit",v_montant)
	
	if v_origine = 'M' or v_origine = 'C' then
		dw_liste.setitem(lig,"origine",v_origine)
	else
		dw_liste.setitem(lig,"origine",' ')
	end if
	

	fetch cur_soins into :v_nom_soin, :v_numero_soin, :v_date_demande, :v_date_echeance, :v_montant, :v_origine ;

	
	
	
loop
close cur_soins ;


// On remplit le tableau avec les règlemens 

//declare cur_regl Cursor for 
//select code_soins.nom, soins.numero, soins.date_demande, paye."date", paye.montant , paye.origine_tp , mode_reglement.nom 
//from soins, code_soins, paye , mode_reglement 
//where code_soins.code = soins."type" and soins.code = paye.code 
//and soins.cle = paye.cle and soins.code = :v_code and paye."mode" = mode_reglement.code ;
//

// depuis 2016 les règlements sont regroupés 
declare cur_regl Cursor for 
select count(*), max(paye.cle) , paye."date", sum(paye.montant) , paye.origine_tp , mode_reglement.nom 
from soins, code_soins, paye , mode_reglement 
where code_soins.code = soins."type" and soins.code = paye.code 
and soins.cle = paye.cle and soins.code = :v_code and paye."mode" = mode_reglement.code 
group by "paye"."mode", "paye"."date", paye."dateremise", "paye"."payeur", "paye"."commentaire" , "paye"."origine_tp", "mode_reglement"."nom" ;


open cur_regl ;
//fetch cur_regl into :v_nom_soin, :v_numero_soin, :v_date_demande, :v_date_echeance, :v_montant, :v_origine, :v_mode_reglement ;
fetch cur_regl into :nb_regl, :v_cle_soin, :v_date_echeance, :v_montant, :v_origine, :v_mode_reglement ;

do while sqlca.sqlcode = 0
	
	dw_liste.insertrow(99999)
	lig = dw_liste.rowcount()
	
	select code_soins.nom, soins.numero, soins.date_demande 
	into  :v_nom_soin, :v_numero_soin, :v_date_demande 
	from soins, code_soins 
	where code_soins.code = soins."type" and soins.cle = :v_cle_soin and soins.code = :v_code ;
	
	
	dw_liste.setitem(lig,"date_operation",v_date_echeance)
	if nb_regl > 1 then 
		v_libelle = string(nb_regl) + " lignes dont "
	else
		v_libelle = ""
	end if 
	if v_numero_soin > 0 then
		v_libelle = v_libelle + trim(v_nom_soin) + " N°"+string(v_numero_soin)+" du "+string(v_date_demande)
	else
		v_libelle = v_libelle + trim(v_nom_soin) + " du "+string(v_date_demande)
	end if
	
	
	if reg_avec_mode then
		v_libelle = trim(v_mode_reglement) + " / "+ v_libelle
	end if
	
	dw_liste.setitem(lig,"libelle",v_libelle)
	dw_liste.setitem(lig,"credit",v_montant)
	
	if v_origine = 'M' or v_origine = 'C' then
		dw_liste.setitem(lig,"origine",v_origine)
	else
		dw_liste.setitem(lig,"origine",' ')
	end if
	

	//fetch cur_regl into :v_nom_soin, :v_numero_soin, :v_date_demande, :v_date_echeance, :v_montant, :v_origine, :v_mode_reglement ;

	fetch cur_regl into  :nb_regl, :v_cle_soin, :v_date_echeance, :v_montant, :v_origine, :v_mode_reglement ;

	
	
	
loop
close cur_regl ;


if dw_liste.rowcount() > 0 then
	// Entête, bas de page et signature
	long cpt
	
//	entete = dw_soins.GetItemString(dw_soins.GetRow(),"prati_entete")
//	baspage = dw_soins.GetItemString(dw_soins.GetRow(),"prati_bas_page")
	rte_1.insertdocument(v_entete, False, FileTypeRichText!)
	rte_1.SelectTextAll ()
	v_entete = rte_1.CopyRtf( )
	
//	rte_1.insertdocument(baspage, False, FileTypeRichText!)
//	rte_1.SelectTextAll ()
//	baspage = rte_1.CopyRtf( )

	for cpt = 1 to dw_liste.rowcount()
		dw_liste.SetItem(cpt,"entete",v_entete)
//		dw_liste.SetItem(cpt,"bas_page",baspage)
	next
end if

dw_liste.setSort("date_operation, credit")
dw_liste.sort()


filtre_origine = " "
filtre_date_limite = today()

filtrer( filtre_origine, filtre_date_limite )

dw_liste.visible = true





end event

event resize;call super::resize;

// Recalcul des boutons 


// les groupes
gb_origine.y = this.height - 400
gb_chrono.y = gb_origine.y

// les boutons de commandes
cb_fermer.y =  gb_origine.y + 50
cb_imprimer.y =  cb_fermer.y


// Les boutons radios
rb_patient.y =  this.height - 320
rb_caisse.y = rb_patient.y
rb_mutuelle.y = rb_patient.y
rb_tout.y = rb_patient.y
rb_today.y = rb_patient.y
rb_toutesdates.y = rb_patient.y


// Hauteur de la liste (on touche pas la largeur)
dw_liste.height = this.height - 500
end event

type p_fond from w_fenetre_arakis`p_fond within w_soins_debit_credit
integer x = 3095
integer y = 1472
end type

type cb_imprimer from uo_picturebutton_390x120 within w_soins_debit_credit
integer x = 2693
integer y = 2224
integer width = 489
integer height = 152
integer taborder = 30
string text = "&Imprimer"
string iconname = "ACTIONS_imprimer.png"
end type

event clicked;call super::clicked;dw_liste_impression.reset()
dw_liste.rowscopy(1, dw_liste.rowcount(), Primary!	, dw_liste_impression, 1, Primary!	)




// Entête apparent
dw_liste_impression. Object.entete.visible = 1
dw_liste_impression .Object.DataWindow.header.height = 952
dw_liste_impression .Object.t_patient.y = 628
dw_liste_impression .Object.t_titre.y = 628
dw_liste_impression .Object.t_sous_titre.y = 736
dw_liste_impression .Object.date_operation_t.y = 864
dw_liste_impression .Object.libelle_t.y = 864
dw_liste_impression .Object.debit_t.y = 864
dw_liste_impression .Object.credit_t.y = 864
dw_liste_impression .Object.solde_t.y = 864
dw_liste_impression .Object.l_7.y1 = 950
dw_liste_impression .Object.l_7.y2 = 950

if profilestring(dir_ini+inifile_orthokis,"admini","debit_credit_pdf","N") = "O" then 
	// impression en PDF
	string rep_phot_patient, v_fichier_destination,v_fichier_destination_complet
	rep_phot_patient = dir_photos + string( v_code )
	if not fileexists( rep_phot_patient ) then gfx_creer_rep( rep_phot_patient )

	v_fichier_destination =  string(today(), "yyyy-mm-dd")+" "+string(now(), "hh-mm-ss")+ " - Dossier Comptable.pdf"
	v_fichier_destination_complet = rep_phot_patient + win_delimiter + v_fichier_destination
//	if verif_bullzip_printer(v_fichier_destination_complet, true) then
//		dw_liste_impression.modify("Datawindow.printer = 'Bullzip PDF Printer'" ) 
//	end if
	dw_liste_impression.saveas(v_fichier_destination_complet, PDF!, false)
	
	if not fileExists(v_fichier_destination_complet) then
		Messagebox("ATTENTION", "Impossible de générer le fichier : " + v_fichier_destination_complet)
	else
		fxg_ouvrir_fichier_shell(v_fichier_destination_complet)
	end if
else

	dw_liste_impression.print()
		
end if




if profilestring(dir_ini+inifile_orthokis,"admini","debit_credit_pdf","N") = "O" and  fileExists(v_fichier_destination_complet) then 
	// Mémo du PDF

	integer categorie_nulle
	setnull(categorie_nulle)
	fxg_enregcourrierhisto ( v_code, "DOSCOM" , today() ,"Format Débit Crédit" , v_fichier_destination_complet , 'E', 'N' , 'N', "", categorie_nulle)
	
	if Messagebox("QUESTION","Souhaitez-vous envoyer ce document par email ?", Question!, YesNo!, 1) = 1 then
		// on enchaine par l'envoi de l'email
		
		// Par sécurité en reprend le code de la fênetre Administrative, clic droits dans les documents !
		long lig, ligtot
		
		dw_courriers.retrieve(v_code, "E")
		dw_courriers.setfilter("historique_editions_nom_courrier = '" + v_fichier_destination + "'" )
		dw_courriers.filter()
		ligtot = dw_courriers.rowcount()
		if  ligtot > 0 then
			dw_courriers.SetItem(1, "Selection", 'O')					
			m_btdroit_historique		Menu
			Menu = CREATE m_btdroit_historique
			Menu.dw_locale = dw_courriers
			Menu.var_code_local = v_code
			
			Menu.m_envoyerparemailpiècejointe.TriggerEvent(clicked!)
			
		end if


		
		
	end if
else
	
	// Pas en PDF
	ajout_histo_editions(v_code,"DOSCOM",today(),"Format Débit Crédit")
end if



end event

type uo_resize from resize_fenetre within w_soins_debit_credit
boolean visible = false
integer x = 3109
integer y = 1732
integer taborder = 40
end type

on uo_resize.destroy
call resize_fenetre::destroy
end on

type cb_fermer from uo_picturebutton_390x120_fermer within w_soins_debit_credit
integer x = 3200
integer y = 2224
integer width = 489
integer height = 152
integer taborder = 10
end type

type dw_liste from datawindow within w_soins_debit_credit
boolean visible = false
integer x = 32
integer y = 16
integer width = 3643
integer height = 2072
integer taborder = 10
boolean bringtotop = true
string title = "none"
string dataobject = "dw_soins_debit_credit"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type rb_patient from radiobutton within w_soins_debit_credit
integer x = 1170
integer y = 2276
integer width = 334
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 553648127
string text = "Patient"
boolean checked = true
end type

event clicked;filtre_origine = " "

filtrer( filtre_origine, filtre_date_limite )


end event

type rb_caisse from radiobutton within w_soins_debit_credit
integer x = 1527
integer y = 2276
integer width = 334
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 553648127
string text = "Caisse"
end type

event clicked;filtre_origine = "C"

filtrer( filtre_origine, filtre_date_limite )

end event

type rb_mutuelle from radiobutton within w_soins_debit_credit
integer x = 1883
integer y = 2276
integer width = 334
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 553648127
string text = "Mutuelle"
end type

event clicked;filtre_origine = "M"

filtrer( filtre_origine, filtre_date_limite )

end event

type rb_tout from radiobutton within w_soins_debit_credit
integer x = 2240
integer y = 2276
integer width = 334
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 553648127
string text = "Tout"
end type

event clicked;filtre_origine = "T"

filtrer( filtre_origine, filtre_date_limite )



end event

type rb_today from radiobutton within w_soins_debit_credit
integer x = 114
integer y = 2276
integer width = 425
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 553648127
string text = "Aujourd~'hui"
boolean checked = true
end type

event clicked;filtre_date_limite = today()

filtrer( filtre_origine, filtre_date_limite )


end event

type rb_toutesdates from radiobutton within w_soins_debit_credit
integer x = 571
integer y = 2276
integer width = 334
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 553648127
string text = "Toutes"
end type

event clicked;filtre_date_limite = date(2999,12,31)

filtrer( filtre_origine, filtre_date_limite )



end event

type dw_courriers from u_basedw within w_soins_debit_credit
string tag = "pour envoyer des factures par email"
boolean visible = false
integer x = 1614
integer y = 80
integer width = 837
integer height = 428
integer taborder = 20
boolean bringtotop = true
string dataobject = "dw_patient_fiche5"
end type

type rte_1 from richtextedit within w_soins_debit_credit
boolean visible = false
integer x = 1467
integer y = 2152
integer width = 402
integer height = 112
integer taborder = 60
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
borderstyle borderstyle = stylelowered!
end type

type dw_liste_impression from datawindow within w_soins_debit_credit
boolean visible = false
integer x = 334
integer y = 788
integer width = 1065
integer height = 1052
integer taborder = 20
boolean bringtotop = true
string title = "none"
string dataobject = "dw_soins_debit_credit"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type gb_origine from groupbox within w_soins_debit_credit
integer x = 1111
integer y = 2188
integer width = 1527
integer height = 208
integer taborder = 50
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Eras Demi ITC"
long textcolor = 33554432
long backcolor = 16777215
string text = "Filtre Origine"
end type

type gb_chrono from groupbox within w_soins_debit_credit
integer x = 41
integer y = 2188
integer width = 896
integer height = 208
integer taborder = 60
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Eras Demi ITC"
long textcolor = 33554432
long backcolor = 16777215
string text = "Filtre Chrono"
end type

