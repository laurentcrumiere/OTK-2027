$PBExportHeader$uo_edition_rtf.sru
$PBExportComments$Edition de RTF
forward
global type uo_edition_rtf from userobject
end type
type dw_courriers from u_basedw within uo_edition_rtf
end type
type dw_imprime_ticket from datawindow within uo_edition_rtf
end type
type rte_bas_page from richtextedit within uo_edition_rtf
end type
type rte_entete from richtextedit within uo_edition_rtf
end type
type rte_principal from richtextedit within uo_edition_rtf
end type
type st_1 from statictext within uo_edition_rtf
end type
end forward

global type uo_edition_rtf from userobject
integer width = 1641
integer height = 592
boolean border = true
long tabtextcolor = 33554432
long tabbackcolor = 16777215
long picturemaskcolor = 536870912
dw_courriers dw_courriers
dw_imprime_ticket dw_imprime_ticket
rte_bas_page rte_bas_page
rte_entete rte_entete
rte_principal rte_principal
st_1 st_1
end type
global uo_edition_rtf uo_edition_rtf

forward prototypes
public subroutine change_valeurs_champs (datastore dw_donnees, string nom_courrier)
public subroutine edition (datastore dw_donnees, string nom_courrier, boolean envoi_email, string fichier_destination_complet)
end prototypes

public subroutine change_valeurs_champs (datastore dw_donnees, string nom_courrier);// En entrée :
// 	Dw_donnees 	: 	DataStore PLEIN des doonnées à fusionner
//	Nom_courrier 	:	Nom de la lettre à fusionner

string nom
decimal{2} total

// Met la date du jour dans le champ cdate_jour
rte_principal.InputFieldChangeData("cdate_jour",string(today(),"dd/mm/yyyy"))

// Si la lettre à imprimer est le reçu, 
// Comme la dw : dw_lettre_recu contient des compute fields,
// Il faut changer leurs valeurs avec la fonction Inputfieldchangedata

	IF nom_courrier = "lettre_recu" THEN
		
		// Vérification ... au cas ou ...
		
		if dw_donnees.rowcount() > 0 then
			// Assuré
			nom = dw_donnees.Getitemstring(dw_donnees.GetRow(),"assure")
				rte_principal.InputFieldChangeData("assure",nom)
				
			// N° de sécu
			nom = dw_donnees.Getitemstring(dw_donnees.GetRow(),"secu")
				rte_principal.InputFieldChangeData("secu",nom)
			
			// Soins (concaténation de lettre et de nombre : TO 90)
			nom = dw_donnees.Getitemstring(dw_donnees.GetRow(),"soins")
				rte_principal.InputFieldChangeData("soins",nom)	
			
			// Valorisation du soin en Franc et Euro
			nom = dw_donnees.Getitemstring(dw_donnees.GetRow(),"soins_total_francs")
				rte_principal.InputFieldChangeData("soins_total_francs",nom)	
			nom = dw_donnees.Getitemstring(dw_donnees.GetRow(),"soins_total_euros")
				rte_principal.InputFieldChangeData("soins_total_euros",nom)	
	
			// Remboursement en Franc et Euro
			nom = dw_donnees.Getitemstring(dw_donnees.GetRow(),"remboursement_francs")
				rte_principal.InputFieldChangeData("remboursement_francs",nom)	
			nom = dw_donnees.Getitemstring(dw_donnees.GetRow(),"remboursement_euros")
				rte_principal.InputFieldChangeData("remboursement_euros",nom)	
	
			// Montant du règlement en Franc et Euro
			nom = dw_donnees.Getitemstring(dw_donnees.GetRow(),"reglement_francs")
				rte_principal.InputFieldChangeData("reglement_francs",nom)	
			nom = dw_donnees.Getitemstring(dw_donnees.GetRow(),"reglement_euros")
				rte_principal.InputFieldChangeData("reglement_euros",nom)	
		
			// Montant du règlement total en Franc et Euro
			nom = dw_donnees.Getitemstring(dw_donnees.GetRow(),"reglement_total_francs")
				rte_principal.InputFieldChangeData("reglement_total_francs",nom)	
			nom = dw_donnees.Getitemstring(dw_donnees.GetRow(),"reglement_total_euros")
				rte_principal.InputFieldChangeData("reglement_total_euros",nom)	
			
			// Mode de règlement	
			nom = dw_donnees.Getitemstring(dw_donnees.GetRow(),"mode")
				rte_principal.InputFieldChangeData("mode",nom)	
				
			// Valeur de l'€
			nom = dw_donnees.Getitemstring(dw_donnees.GetRow(),"valeur_euro")
			rte_principal.InputFieldChangeData("valeur_euro",nom)				
	END IF
end if

return


end subroutine

public subroutine edition (datastore dw_donnees, string nom_courrier, boolean envoi_email, string fichier_destination_complet);




// En entrée :
// 	Dw_donnees : 	DataStore PLEIN des doonnées à fusionner
//	Nom_courrier 	:	Nom de la lettre à fusionner
// envoi_email : si envoi par email et nom impression
// fichier_destination_complet : pour le reçu en PDF ... si vide, c'est un impression
//----------------------------------------------------------------------------------------------

string entete 			// Nom du fichier .RTF ENTETE du praticien
string baspage			// Nom du fichier .RTF du BAS DE PAGE du praticien

String fichier_lettre 	// Nom du fichier .RTF de la lettre à fussionner

String Cde_Sql			// Commande SQL lancée en EXECUTE IMMEDIATE

String Contenu			// Contenu BRUT du RTF, pour rechercher les ENTETE et BAS DE PAGE

double bottom, left, right, top	// Marges (Paramètres Généraux)

long code_erreur_rtf 

double var_code_local
string s_fichier_signature, s_fichier_signature_reduit

boolean b_y_a_entete, b_y_a_baspage

integer categorie_nulle
setnull(categorie_nulle)

if dw_donnees.rowcount() > 0 then
	var_code_local = dw_donnees.GetItemNumber(1, "patient_code")

  // Recherche des marges des paramètres généraux :
  SELECT "param"."bottommargin",  "param"."rightmargin", "param"."leftmargin","param"."topmargin"  
    INTO :bottom, :right, :left, :top  
    FROM "param"  ;



	// Recherche du fichier .RTF correspondant à la lettre à imprimer ...
	Cde_Sql = 'SELECT "param"."'+nom_courrier+'"  FROM "param"'  

	DECLARE cur_courrier DYNAMIC CURSOR FOR sqlsa ;
	PREPARE sqlsa FROM :cde_sql ;
	OPEN DYNAMIC cur_courrier ;
	FETCH cur_courrier INTO :fichier_lettre ;
	CLOSE cur_courrier ;

	if sqlca.sqlcode <> 0 then
		MessageBox("Erreur dans la recherche du courrier",Sqlca.SqlErrText)
	end if
	
	
	// On met le chemin complet du fichier
	fichier_lettre = dir_courriers + fichier_lettre
	
	
	// Remplissage de la lettre
	rte_principal.insertdocument(fichier_lettre, True, FileTypeRichText!)


	// Application des marges
	rte_principal.BottomMargin = bottom / 100
	rte_principal.LeftMargin = left / 100
	rte_principal.RightMargin = right / 100
	rte_principal.TopMargin = top / 100

	rte_principal.InputFieldsVisible = TRUE
	rte_principal.InputFieldNamesVisible = FALSE

	// On doit détecter DE SUITE s'il y a entete et/ou bas de page
	
	// Y a t il l'ENTETE dans la zone ENTETE ?
	//-----------------------------------------------
	code_erreur_rtf = rte_principal.SelectTextAll (Header!)
	contenu = rte_principal.CopyRTF()
	if pos(upper(contenu),"PRATI_ENTETE") > 0 then
		b_y_a_entete = true
	else
		b_y_a_entete = false
	end if
	
	
	// Y a t il le BAS_PAGE dans la zone BAS_PAGE ?
	//----------------------------------------------------
	rte_principal.SelectTextAll (Footer!)
	contenu = rte_principal.CopyRTF()
	if pos(upper(contenu),"PRATI_BAS_PAGE") > 0 then
		b_y_a_baspage = true
	else
		b_y_a_baspage = false
	end if

	if rte_principal.DataSource(dw_donnees) <> 1 then
		Messagebox("ATTENTION !","Erreur dans la fusion du document !")
		return
	end if


	// Si la lettre est le reçu , on change les valeurs des champs calculés
	change_valeurs_champs(dw_donnees,nom_courrier)


	// Y a t il l'ENTETE dans la zone ENTETE ?
	//-----------------------------------------------

	if b_y_a_entete then
		// Y a l'entête
		// Nom du fichier
		entete = rte_principal.InputFieldGetData("prati_entete")
		// Mise en RTF
		code_erreur_rtf = rte_entete.insertdocument(entete, true, FileTypeRichText!)
		// Copie
		code_erreur_rtf = rte_entete.SelectTextAll ()
		entete = rte_entete.CopyRTF()
		// Coller
		code_erreur_rtf = rte_principal.SelectTextAll (Header!)
		code_erreur_rtf = rte_principal.Clear()
		code_erreur_rtf = rte_principal.PasteRTF(entete, Header!)
	end if
		
	
	// Y a t il le BAS_PAGE dans la zone BAS_PAGE ?
	//----------------------------------------------------
	if b_y_a_baspage then
		// Y a le Bas de Page
		// Nom du fichier
		baspage = rte_principal.InputFieldGetData("prati_bas_page")
		// Mise en RTF
		code_erreur_rtf = rte_bas_page.insertdocument(baspage, true, FileTypeRichText!)
		// Copie
		code_erreur_rtf = rte_bas_page.SelectTextAll ()
		baspage = rte_bas_page.CopyRTF()
		// Coller
		code_erreur_rtf = rte_principal.SelectTextAll (Footer!)
		code_erreur_rtf = rte_principal.Clear()
		code_erreur_rtf = rte_principal.PasteRTF(baspage,Footer!)
	end if


	rte_principal.SelectTextAll (Detail!)
	contenu = rte_principal.CopyRTF()
	if pos(upper(contenu),"PRATICIEN_SIGNATURE") > 0 then

		// Y a la signature du paticien
		
		// Recherche du fichier signature
		select prati.chemin_complet_signature into :s_fichier_signature from prati , patient 
		where patient.code = :var_code_local and patient.code_praticien = prati.code ;  
		
		if fileExists(s_fichier_signature) then
			
			s_fichier_signature_reduit = fxg_reduire_signature_praticien (s_fichier_signature)
			
						
		
			//---------------------------------------------------
			rte_principal.SelectText(1,1, 0,0)
			code_erreur_rtf = rte_principal.Find("{Praticien_Signature}" , True, true , FALSE, True)
			code_erreur_rtf = rte_principal.ReplaceText("" )
			code_erreur_rtf = rte_principal.insertPicture(s_fichier_signature_reduit)
		else
			// Pas de fichier signature - on supprime l'indication du champ
			rte_principal.SelectText(1,1, 0,0)
			code_erreur_rtf = rte_principal.Find("{Praticien_Signature}" , True, true , FALSE, True)
			code_erreur_rtf = rte_principal.ReplaceText("" )			
		end if
	end if
	
	
	

	
	// On étudie les imprimantes spécifiques 
	// Uniquement pour le ticket de RDV en V12
	
	// Mémo de l'imprimante par défaut
	string v_imprim_defaut, v_imprim_specif
	
	
	if nom_courrier = "lettre_ticket" then
		
		dw_imprime_ticket.reset()
		
		// On vérifie si imprimante spécif pour le ticket de rdv
		if profileString(dir_ini+inifile_orthokis,"IMPRIMANTES","rdv_active","N")  = 'O' then

			// recherche de l'imprimante spécifique pour le ticket de rdv
			v_imprim_specif = profileString(dir_ini+inifile_orthokis,"IMPRIMANTES","ticket_rdv","") 
			dw_imprime_ticket.Object.DataWindow.Print.PrinterName = v_imprim_specif
			
			// redimensionnement du ticket
			long largeur, hauteur
			largeur = profileInt(dir_ini+inifile_orthokis,"rendez-vous","ticket_largeur",3269)
			hauteur = profileInt(dir_ini+inifile_orthokis,"rendez-vous","ticket_hauteur",2908)
			
			dw_imprime_ticket.object.texte.width = largeur
			dw_imprime_ticket.object.texte.height = hauteur
			
		end if
	

		// Impression du ticket de rendez-vous dans la datawindow spéciale !!!
		//---------------------------------------------------------------------------------
		string texte_du_ticket, texte_entete
//		code_erreur_rtf = rte_principal.SelectTextAll (Header!)
//		texte_entete = rte_principal.CopyRTF()
		
		code_erreur_rtf = rte_principal.SelectTextAll (Detail!)
		texte_du_ticket = rte_principal.CopyRTF()
		
		dw_imprime_ticket.insertrow(1)
		
		dw_imprime_ticket.setitem(1,"texte", texte_du_ticket)

		
//		// Si entête dans le ticket
//		if len(trim(texte_entete)) > 0 then
//			
//			/* TENTATIVE DE MISE A JOUR DES FONT ... CA MARCHE MAIS FAUDRAIT 
//			AUSSI DEPLACER DES BLOCS -> ON LAISSE TOMBER POUR L'INSTANT
//			*/
//			// Suppression de la dernière } de l'entête
//			long p1
//			boolean last_accolade = false
//			p1 = len(texte_entete)
//			do while not last_accolade and p1 >= 1
//				if mid(texte_entete,p1,1) = '}' then
//					last_accolade = true
//				else
//					p1 = p1 - 1
//				end if
//			loop 
//			
//			// on ne garde que le texte d'avant....
//			texte_entete = left(texte_entete, p1 - 1)
//			
//			// on enlève la première balise du texte ... entre les 2 premières {
//			
//			long premiere_accolade, deuxieme_accolade
//			
//			premiere_accolade = pos (texte_du_ticket , '{', 1 ) 
//			deuxieme_accolade = pos (texte_du_ticket , '{', premiere_accolade + 1 ) 
//			
//			texte_du_ticket = mid ( texte_du_ticket, deuxieme_accolade, len(texte_du_ticket) - deuxieme_accolade + 1)
//
//			
//			// on modifie, dans le texte du ticket, les tag correspondants aux polices de caractères afin de pouvoir
//			// ensuite concatener les 2 chaines
//		
//			//messagebox("texte ticket AVANT", texte_du_ticket )
//
//			// on par du principe qu'il n'y aura pas + de 20 polices de caractères
//			for p1 = 20 to 0 step -1
//				texte_du_ticket = gfx_tout_remplacer(texte_du_ticket , "\f"+string(p1,"0")+"\" ,  "\f"+string(p1 + 20)+"\") 
//			next
//			//messagebox("texte ticket APRES", texte_du_ticket )
//			
//			
//			
//			
//			// On concataine les 2
//			texte_du_ticket = texte_entete + texte_du_ticket 
//
//			// On déplace le bloc des FONTS du text pour les regrouper avec celles de l'entete
//			
//			// On recherche les blocs de font
//			long fin_premier_bloc, debut_deuxieme_bloc, fin_deuxieme_bloc
//			
//			fin_premier_bloc = pos (texte_du_ticket , '}}', 1 ) // Faudra éliminer 1 des 2 }
//			
//			debut_deuxieme_bloc = pos (texte_du_ticket , '{\fonttbl',  fin_premier_bloc)
//			
//			fin_deuxieme_bloc	 = pos (texte_du_ticket , '}}', debut_deuxieme_bloc + 1 ) 
//			
//			// On déplace le bloc en supprimant une }
//			
//			string bloc1 , bloc2, bloc3, bloc4
//			
//			// 1er bloc de font
//			bloc1 = left( texte_du_ticket , fin_premier_bloc)
//			// 2eme bloc de font
//			bloc2 = mid ( texte_du_ticket , debut_deuxieme_bloc + 9 , fin_deuxieme_bloc - (debut_deuxieme_bloc + 9) + 2)
//			// texte de l'entete
//			bloc3 = mid (texte_du_ticket , fin_premier_bloc + 2, debut_deuxieme_bloc - (fin_premier_bloc + 2) + 1)
//			// Reste du texte
//			bloc4 = mid (texte_du_ticket , fin_deuxieme_bloc + 2, len(texte_du_ticket) - (fin_deuxieme_bloc + 2) + 1)
//			
////			messagebox("bloc1",bloc1)
////			messagebox("bloc2",bloc2)
////			messagebox("bloc3",bloc3)
////			messagebox("bloc4",bloc4)
//			
//			texte_du_ticket =   bloc1 + bloc2 + bloc3 + bloc4
//
////			integer li_FileNum
////			li_FileNum = FileOpen("c:\test_ticket.rtf" , StreamMode!, Write!, LockWrite!, Replace!)
////			FileWrite( li_FileNum , texte_du_ticket )
////			FileClose( li_FileNum )
//
//		end if
		
//		messagebox ("entete",texte_entete)
//		messagebox ("texte",texte_du_ticket)
		
//		dw_imprime_ticket.setitem(1,"texte", texte_du_ticket)
		
		// sécurisation
		if dw_donnees.rowcount() > 0 then 
			
			if envoi_email then
				// on ne génère que le PDF, envoi de l'email sera fait dans la fonction imprimer_ticket_rdv
				String v_fichier_destination, v_fichier_destination_complet, rep_phot_patient
				rep_phot_patient = dir_photos + string( var_code_local )
				if not fileexists( rep_phot_patient ) then gfx_creer_rep( rep_phot_patient )
				v_fichier_destination =  string(today(), "yyyy-mm-dd")+" "+string(now(), "hh-mm-ss")+ " - Ticket RDV.pdf"
				v_fichier_destination_complet = rep_phot_patient + win_delimiter + v_fichier_destination
//				if verif_bullzip_printer(v_fichier_destination_complet, false) then
//					dw_imprime_ticket.modify("Datawindow.printer = 'Bullzip PDF Printer'" ) 
//				end if
				dw_imprime_ticket.saveas(v_fichier_destination_complet, pdf!, false)

			else
				// impression normale
				dw_imprime_ticket.print()
			end if
	
			datetime var_rdv
			var_rdv = dw_donnees.GetItemDateTime(1, "rdv_rdv")
	
			if envoi_email then
				
				fxg_enregcourrierhisto ( var_code_local, 'TICKET' , today() ,"Rendez-vous  : Le "+string(date(var_rdv),"dd/mm/yyyy") + " à " + string(time(var_rdv),"hh:mm") , v_fichier_destination_complet , 'E', 'N' , 'N', '', categorie_nulle)
	
				// pour laisser le temps de générer le fichier
				integer v_secondes_attente = 5
				long ligtot
				integer v_cpt_secondes_attente = 0
				do while not FileExists(v_fichier_destination_complet) and v_cpt_secondes_attente <= v_secondes_attente
					v_cpt_secondes_attente = 	v_cpt_secondes_attente + 1
					sleep(1000)
				loop
				
				dw_courriers.settransobject(sqlca)
				dw_courriers.retrieve(var_code_local, "E")
				dw_courriers.setfilter("historique_editions_nom_courrier = '" + v_fichier_destination + "'" )
				dw_courriers.filter()
				ligtot = dw_courriers.rowcount()
				if  ligtot > 0 then
					dw_courriers.SetItem(1, "Selection", 'O')					
					m_btdroit_historique		Menu
					Menu = CREATE m_btdroit_historique
					Menu.dw_locale = dw_courriers
					Menu.var_code_local = var_code_local
					
					Menu.m_envoyerparemailpiècejointe.TriggerEvent(clicked!)
					
				end if
				
			else
				// ticket imprimé ... normal
				ajout_histo_editions(var_code_local,"TICKET",Today(),"Rendez-vous  : Le "+string(date(var_rdv),"dd/mm/yyyy") + " à " + string(time(var_rdv),"hh:mm") )
			end if
		end if

//		if rte_principal.print(1, "", True, True) = -1 then
//			MessageBox("ATTENTION","Erreur dans l'impression du document : "+nom_courrier)
//		end if

	
		// remise en place de l'imprimante par défaut
//		if nom_courrier = "lettre_ticket" and profileString(dir_ini+inifile_orthokis,"IMPRIMANTES","rdv_active","N")  = 'O'then
//			if profileString(dir_ini+inifile_orthokis,"IMPRIMANTES","rdv_active","N")  = 'O' then
//				imprim.setImprimanteDefaut(v_imprim_defaut)
//			end if
//		end if
//	
//		destroy imprim


	else
		// Documents autres que ticket !!!
		// On ne gère pas l'envoi par email pour l'instant
		
		
		if nom_courrier = "lettre_recu" and fichier_destination_complet <> "" then
			// On veut le reçu en PDF
			rte_principal.saveDocument(fichier_destination_complet, FileTypePDF!)
			fxg_ouvrir_fichier_shell(fichier_destination_complet)
			
		else
			
			// Edition du document
			// Paramètres : 1 copie, toutes les pages, groupées, avec dialogue
			if rte_principal.print(1, "", True, True) = -1 then
				MessageBox("ATTENTION","Erreur dans l'impression du document : "+nom_courrier)
			end if
		end if
	end if
	
end if

return






end subroutine

on uo_edition_rtf.create
this.dw_courriers=create dw_courriers
this.dw_imprime_ticket=create dw_imprime_ticket
this.rte_bas_page=create rte_bas_page
this.rte_entete=create rte_entete
this.rte_principal=create rte_principal
this.st_1=create st_1
this.Control[]={this.dw_courriers,&
this.dw_imprime_ticket,&
this.rte_bas_page,&
this.rte_entete,&
this.rte_principal,&
this.st_1}
end on

on uo_edition_rtf.destroy
destroy(this.dw_courriers)
destroy(this.dw_imprime_ticket)
destroy(this.rte_bas_page)
destroy(this.rte_entete)
destroy(this.rte_principal)
destroy(this.st_1)
end on

type dw_courriers from u_basedw within uo_edition_rtf
string tag = "pour envoyer des factures par email"
integer x = 795
integer y = 324
integer width = 503
integer height = 248
integer taborder = 10
boolean bringtotop = true
string dataobject = "dw_patient_fiche5"
end type

type dw_imprime_ticket from datawindow within uo_edition_rtf
integer x = 361
integer y = 376
integer width = 338
integer height = 192
integer taborder = 30
string title = "none"
string dataobject = "dw_imprime_ticket"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type rte_bas_page from richtextedit within uo_edition_rtf
integer x = 1088
integer y = 132
integer width = 494
integer height = 360
integer taborder = 3
long init_backcolor = 16777215
long init_inputfieldbackcolor = 16777215
boolean init_inputfieldsvisible = true
boolean init_inputfieldnamesvisible = true
boolean init_headerfooter = true
end type

on rte_bas_page.create
HeaderFooter=true
BackColor=16777215
InputFieldBackColor=16777215
end on

type rte_entete from richtextedit within uo_edition_rtf
integer x = 558
integer y = 152
integer width = 494
integer height = 360
integer taborder = 20
long init_backcolor = 16777215
long init_inputfieldbackcolor = 16777215
boolean init_inputfieldsvisible = true
boolean init_inputfieldnamesvisible = true
boolean init_headerfooter = true
end type

on rte_entete.create
HeaderFooter=true
BackColor=16777215
InputFieldBackColor=16777215
end on

type rte_principal from richtextedit within uo_edition_rtf
integer x = 41
integer y = 136
integer width = 503
integer height = 376
integer taborder = 10
long init_backcolor = 16777215
long init_inputfieldbackcolor = 16777215
boolean init_inputfieldsvisible = true
boolean init_headerfooter = true
string init_documentname = "Document Orthokis"
end type

on rte_principal.create
DocumentName="Document Orthokis"
HeaderFooter=true
BackColor=16777215
InputFieldBackColor=16777215
end on

type st_1 from statictext within uo_edition_rtf
integer x = 306
integer y = 36
integer width = 1198
integer height = 76
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long backcolor = 16777215
boolean enabled = false
string text = "USER OBJECT D~'EDITION DE RTF !!!"
alignment alignment = center!
boolean focusrectangle = false
end type

