$PBExportHeader$w_envoi_soins_erasme.srw
forward
global type w_envoi_soins_erasme from window
end type
type dw_export from datawindow within w_envoi_soins_erasme
end type
type pb_transferer from commandbutton within w_envoi_soins_erasme
end type
type cb_ecran from commandbutton within w_envoi_soins_erasme
end type
type dw_liste from datawindow within w_envoi_soins_erasme
end type
type cb_fermer from commandbutton within w_envoi_soins_erasme
end type
end forward

global type w_envoi_soins_erasme from window
integer width = 3598
integer height = 2268
boolean titlebar = true
string title = "Envoi des soins"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
dw_export dw_export
pb_transferer pb_transferer
cb_ecran cb_ecran
dw_liste dw_liste
cb_fermer cb_fermer
end type
global w_envoi_soins_erasme w_envoi_soins_erasme

type variables
boolean prepa_faite
double increment	
double nb_dossier

double min, max,max_row


string mode_fonctionnement 	// Vaudra M pour Manuel, A pour Automatique
string fichier_log


long lig_export, lig_liste

decimal{2} v_total, v_hn

end variables

forward prototypes
public subroutine prepa ()
public subroutine ajout_ligne ()
end prototypes

public subroutine prepa ();string pra_min,pra_max,tit, p
double code_min,code_max, v_montant
date date_min,date_max

dw_liste.retrieve(code_min,code_max,pra_min,pra_max,date_min,date_max)

prepa_faite = true



end subroutine

public subroutine ajout_ligne ();long tot
double v_code
string v_inami

boolean v_suite

string v_id_erasme_patient, v_code_praticien , v_commentaire_rdv , v_id_erasme_praticien
string v_mise_en_evidence



// Ajout de la ligne ... sans les montants des soins


dw_export.insertrow(0)

lig_export = dw_export.rowcount()

// Praticien
v_code_praticien = dw_liste.GetItemString(lig_liste, "code_praticien")

// Patient 
v_code = dw_liste.GetItemNumber(lig_liste, "code")
select isnull(identifiant_erasme, '') into :v_id_erasme_patient from erasme_patient where code_patient = :v_code ;

// Unieknr : id du patient à Erasme
dw_export.SetItem(lig_export, "Unieknr", left(v_id_erasme_patient + space(12), 12))

// Patnr : N° de visite ... on le stock dans la zone commentaire du RDV ... mis à jour par outils HL7
// on va prendre le N° le plus récent, au cas ou pas de visite au jour même !!
//select first commentaire into :v_commentaire_rdv from rdv where rdv.code = :v_code and date(rdv) <= today(*) order by rdv desc ;
//dw_export.SetItem(lig_export, "patnr", left(trim(v_commentaire_rdv) + space(20), 20))

// compteur
dw_export.SetItem(lig_export, "volgnr", string(lig_export, "00000"))


// dates
dw_export.SetItem(lig_export, "vandat", string( dw_liste.GetItemDate(lig_liste, "soins_date_exe"), "yyyymmdd"))
dw_export.SetItem(lig_export, "totdat", string( dw_liste.GetItemDate(lig_liste, "soins_date_exe"), "yyyymmdd"))


// praticien
//select isnull(identifiant_erasme, '') into :v_id_erasme_praticien from erasme_praticien where code_praticien = :v_code_praticien ;
//dw_export.SetItem(lig_export, "dokt", right("000000" + trim(v_id_erasme_praticien), 6))
//dw_export.SetItem(lig_export, "med_sign", right("000000" + trim(v_id_erasme_praticien), 6))

// Finalement, le code Inami du praticien est le code praticien chez nous !!
dw_export.SetItem(lig_export, "dokt", right("000000" + trim(v_code_praticien), 6))
dw_export.SetItem(lig_export, "med_sign", right("000000" + trim(v_code_praticien), 6))

// Inami
v_inami =  dw_liste.GetItemString(lig_liste, "soins_type")
v_inami =  left(v_inami, 6)
dw_export.SetItem(lig_export, "rizivnr",v_inami)

// ambulant
dw_export.SetItem(lig_export, "ag", '2')

// nombre de prestation
dw_export.SetItem(lig_export, "aant", '0001')


// pourcentage honoraires
dw_export.SetItem(lig_export, "prohon", '100')

// statut montant
dw_export.SetItem(lig_export, "bedrstat", '1')


// indication de remise
dw_export.SetItem(lig_export, "kode_korting", '0')


// imputation comptable
dw_export.SetItem(lig_export, "verd", '8478 ')


// reference
dw_export.SetItem(lig_export, "referentie", string( dw_liste.GetItemDate(lig_liste, "soins_date_exe"), "yyyymmdd")+ string(lig_export, "0000"))

// Med_sign est mis à jour plus haut

// campus
dw_export.SetItem(lig_export, "campus_id","ERA")


// divers
dw_export.SetItem(lig_export, "nomax","0")
dw_export.SetItem(lig_export, "att_print","0")
dw_export.SetItem(lig_export, "notar","0")

dw_export.SetItem(lig_export, "euro","2")

// TXT : information de provenance
//dw_export.SetItem(lig_export, "txt", 'ORT')

// imputation comptable
dw_export.SetItem(lig_export, "dataware", '8478 ')
end subroutine

on w_envoi_soins_erasme.create
this.dw_export=create dw_export
this.pb_transferer=create pb_transferer
this.cb_ecran=create cb_ecran
this.dw_liste=create dw_liste
this.cb_fermer=create cb_fermer
this.Control[]={this.dw_export,&
this.pb_transferer,&
this.cb_ecran,&
this.dw_liste,&
this.cb_fermer}
end on

on w_envoi_soins_erasme.destroy
destroy(this.dw_export)
destroy(this.pb_transferer)
destroy(this.cb_ecran)
destroy(this.dw_liste)
destroy(this.cb_fermer)
end on

event open;
// récupération du mode de fonctionnement : A Automatique ou M Manuel
mode_fonctionnement = message.StringParm

dw_liste.settransobject(sqlca)

// Fichier Log pour consigner les actions
fichier_log = dir_courriers + "Envoi_soins_erasme.log"


if mode_fonctionnement = "A" then
	
	cb_ecran.triggerevent(clicked!)
	pb_transferer.triggerevent(clicked!)
	cb_fermer.triggerevent(clicked!)
	
end if




	
end event

type dw_export from datawindow within w_envoi_soins_erasme
boolean visible = false
integer x = 745
integer y = 1400
integer width = 686
integer height = 400
integer taborder = 20
string title = "none"
string dataobject = "dw_erasme_liste_soins_export"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type pb_transferer from commandbutton within w_envoi_soins_erasme
integer x = 1294
integer y = 2008
integer width = 402
integer height = 112
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Transférer"
end type

event clicked;
long tot
string v_inami
double v_code

boolean v_suite

//string v_id_erasme_patient, v_code_praticien , v_commentaire_rdv , v_id_erasme_praticien
string v_mise_en_evidence

integer num_fichier_log

decimal{2} v_montant_inami, v_remb_inami_avec, v_remb_inami_sans

boolean ajout_ligne_divers
string code_soins_divers

num_fichier_log = fileopen(fichier_log ,linemode!,write!,LockReadWrite!,Append!)


if mode_fonctionnement = "A" then 
	v_suite = true
else
	
	if MessageBox("ATTENTION","Vous allez générer le fichier de transfert.~n~nConfirmez-vous ?", Question!, YesNo!, 2) = 1 then 
		v_suite = true
	else
		v_suite = false
	end if
end if
	
if v_suite then
	
	open(w_patience)

	if mode_fonctionnement = "A" then 
		FileWrite( num_fichier_log , "------------------------------------------   MODE AUTOMATIQUE --------------------------------------------")
	else
		FileWrite( num_fichier_log , "----------------------------------------------   MODE MANUEL ------------------------------------------------")
	end if
	
	FileWrite( num_fichier_log , "*** Début du transfert : "+string(today())+ " à "+ string(now()) +" ***")
	
	tot = dw_liste.rowcount()

	
	for lig_liste = 1 to tot
		
		// Patient 
		v_code = dw_liste.GetItemNumber(lig_liste, "code")
		
		ajout_ligne()
		
		// Montants ....
		v_total = dw_liste.GetItemNumber(lig_liste, "soins_total")
		zero(v_total)

		if v_total < 0 then 
			// en principe pas possible mais .. sécurité ...
			v_total = 0 
		end if


		v_inami =  dw_liste.GetItemString(lig_liste, "soins_type") + space(6)
		v_inami =  left(v_inami, 6)

		// recherche du montant remboursé par INAMI
		select isnull(inter_inami_avec,0) , isnull(inter_inami_sans,0) into :v_remb_inami_avec, :v_remb_inami_sans 
		from code_soins where code = :v_inami ;
		
		select isnull(mise_en_evidence,'') into :v_mise_en_evidence from patient where code = :v_code ;
		
		// selon si VIPO ou BIM ou pas
		if v_mise_en_evidence = "V" or v_mise_en_evidence = "B" then 
			v_montant_inami = v_remb_inami_avec
		else
			v_montant_inami =  v_remb_inami_sans
		end if
		
		v_hn  = v_total - v_montant_inami
		
		if v_hn < 0 then
			v_hn = 0
			v_total = v_montant_inami
		end if
		
		// Montant de base
		dw_export.SetItem(lig_export, "bedrm", string( v_montant_inami , "00000000.00") ) 
				
		if v_inami = "305933" or v_inami = "305631" or v_inami = "305675" then
			// Appareils
			ajout_ligne_divers = true
			code_soins_divers = "020325"
		elseif v_inami = "305955" or v_inami = "305616" or v_inami = "305653" or v_inami = "305734" then
			// Consultations
			ajout_ligne_divers = true
			code_soins_divers = "020326"
		else
			ajout_ligne_divers = false
		end if
		
		if not ajout_ligne_divers or v_hn = 0 then
			// Dépassement 
			dw_export.SetItem(lig_export, "bedrp", string( v_hn , "00000000.00") ) 
			// Montant total
			dw_export.SetItem(lig_export, "imp_tot", string( v_total  , "00000000.00") ) 
		else
			// Dépassement à zéro
			dw_export.SetItem(lig_export, "bedrp", "00000000.00" ) 
			// Montant total
			dw_export.SetItem(lig_export, "imp_tot", string( v_montant_inami  , "00000000.00") ) 
			
			// Le dépassement est mis sur un soin divers, sur une autre ligne, pour les cas de const
			ajout_ligne()
			// code de transposition
			dw_export.SetItem(lig_export, "rizivnr",code_soins_divers)
			// Montant de 
			dw_export.SetItem(lig_export, "bedrm", string( v_hn , "00000000.00") ) 
			// Dépassement 
			dw_export.SetItem(lig_export, "bedrp", "00000000.00" ) 
			// Montant total
			dw_export.SetItem(lig_export, "imp_tot", string( v_hn  , "00000000.00") ) 
		end if
		
		// mise à jour flag comme quoi traitée
		dw_liste.setItem(lig_liste, "soins_date_cara", today())
		
	next

	// Mise à jour de la base de données
	dw_liste.accepttext()
	if dw_liste.update() = 1 then
		commit ;
	else
		rollback ;
		if mode_fonctionnement = "M" then
			messagebox("ATTENTION","Une erreur s'est produite pendant la mémorisation de l'envoi en base de données.~n~n"+sqlca.sqlerrtext)
		else
			FileWrite(num_fichier_log ,"XXXXX    ERREUR PENDANT LA MEMORISATION DE L'ENVOI EN BASE DE DONNEES  XXXXX")
		end if
	end if
		


	// faire le update de la liste 
	// lexport

	string fichier_export
	
	
	// sauvegarde dans un fichier temporaaire
	fichier_export = dir_ini + "export_soins_erasme.tmp"
	dw_export.SaveAsFormattedText(fichier_export, EncodingANSI!, '', '' )


	// Construction du fichier final
	string v_nom_fichier, v_nom_dossier
	integer v_num_fichier
	string v_ligne_lue
	long num_file_ecrit, num_file_lu
	
	select first isnull(numero_fichier_transf,0), isnull(dossier_fichier_transf,'') into :v_num_fichier, :v_nom_dossier from erasme_param ;
	
	zeroi(v_num_fichier)

	v_num_fichier = v_num_fichier + 1
	if v_num_fichier = 10000 then
		v_num_fichier = 1
	end if
	
	
	v_nom_fichier = v_nom_dossier + "ORTHOK" + string(v_num_fichier, "0000") + ".MTR"
	
	// On met le fichier à Blanc avant toute exécution !!
	
	num_file_ecrit = fileopen(v_nom_fichier ,linemode!,write!,LockReadWrite!,replace!)
	num_file_lu = fileopen(fichier_export ,linemode!,read!)
	
	filewrite(num_file_ecrit,"TTT" + string(today(), "yyyymmdd"))


	// recopie ensuite du fichier généré précédemment
	do while 	FileRead(num_file_lu, v_ligne_lue) > 0
	
		filewrite(num_file_ecrit, v_ligne_lue)
	
	loop
	
	// Enregistrement final
	filewrite(num_file_ecrit,"EEE" + string(dw_liste.rowcount(), "000000"))

	// Mémorisation du nuveau numéro de fichier
	update erasme_param set numero_fichier_transf = :v_num_fichier ;
	commit ;
	

	FileClose(num_file_lu)
	FileClose(num_file_ecrit)
	
	
	
	FileWrite(num_fichier_log ,"Fichier généré : " + v_nom_fichier+" - " + string(dw_liste.rowcount()) + " lignes de soins" )
	FileWrite(num_fichier_log , "*** Début du transfert : "+string(today())+ " à "+ string(now()) +" ***")
	FileClose(num_fichier_log)
	
	close(w_patience)

end if








end event

type cb_ecran from commandbutton within w_envoi_soins_erasme
integer x = 489
integer y = 2008
integer width = 402
integer height = 112
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Ecran"
end type

event clicked;


dw_liste.retrieve()

end event

type dw_liste from datawindow within w_envoi_soins_erasme
integer x = 9
integer y = 20
integer width = 3515
integer height = 1968
integer taborder = 10
string title = "none"
string dataobject = "dw_erasme_liste_soins"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type cb_fermer from commandbutton within w_envoi_soins_erasme
integer x = 1957
integer y = 2008
integer width = 402
integer height = 112
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Fermer"
end type

event clicked;Close(parent)
end event

