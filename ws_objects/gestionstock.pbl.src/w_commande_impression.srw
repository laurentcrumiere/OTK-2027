$PBExportHeader$w_commande_impression.srw
forward
global type w_commande_impression from w_fenetre_arakis
end type
type gb_copie from groupbox within w_commande_impression
end type
type cb_imprimer from uo_picturebutton_390x120 within w_commande_impression
end type
type cb_annuler from uo_picturebutton_390x120 within w_commande_impression
end type
type em_exemplaire from editmask within w_commande_impression
end type
type st_1 from statictext within w_commande_impression
end type
type rte_1 from richtextedit within w_commande_impression
end type
type dw_edition from datawindow within w_commande_impression
end type
type rb_non_chiffre from radiobutton within w_commande_impression
end type
type rb_chiffre from radiobutton within w_commande_impression
end type
type pb_email from uo_picturebutton_390x120 within w_commande_impression
end type
type st_email_fournisseur from statictext within w_commande_impression
end type
type sle_objet from singlelineedit within w_commande_impression
end type
type cbx_cc from checkbox within w_commande_impression
end type
type cbx_cci from checkbox within w_commande_impression
end type
type cbx_memo_patient from checkbox within w_commande_impression
end type
type rte_texte from richtextedit within w_commande_impression
end type
type cb_liste from uo_picturebutton_390x120 within w_commande_impression
end type
type dw_liste_texte_email from datawindow within w_commande_impression
end type
type gb_1 from groupbox within w_commande_impression
end type
type gb_2 from groupbox within w_commande_impression
end type
type gb_3 from groupbox within w_commande_impression
end type
type gb_memo from groupbox within w_commande_impression
end type
end forward

global type w_commande_impression from w_fenetre_arakis
integer width = 4375
integer height = 2976
string title = "Impression de Commande Fournisseur"
boolean minbox = false
boolean maxbox = false
boolean resizable = false
windowtype windowtype = response!
gb_copie gb_copie
cb_imprimer cb_imprimer
cb_annuler cb_annuler
em_exemplaire em_exemplaire
st_1 st_1
rte_1 rte_1
dw_edition dw_edition
rb_non_chiffre rb_non_chiffre
rb_chiffre rb_chiffre
pb_email pb_email
st_email_fournisseur st_email_fournisseur
sle_objet sle_objet
cbx_cc cbx_cc
cbx_cci cbx_cci
cbx_memo_patient cbx_memo_patient
rte_texte rte_texte
cb_liste cb_liste
dw_liste_texte_email dw_liste_texte_email
gb_1 gb_1
gb_2 gb_2
gb_3 gb_3
gb_memo gb_memo
end type
global w_commande_impression w_commande_impression

type variables
double numero_commande


// Pour envoi email
uo_email_compte		cpt_email
uo_email_email 		email
str_email_frm_output frm_output


string v_email_fourni

// pour usage de fichiers temporaires
integer v_aleatoire

// pour mémo du texte par défaut
double v_id_texte_email_utilise
end variables

forward prototypes
public subroutine prepa_bc ()
public subroutine sauvegarder_patient (string fichier_depart)
public subroutine maj_texte_mail (long row)
end prototypes

public subroutine prepa_bc ();// Fonction qui initialise la DW en vue de 
// - print
// - email


string entete, baspage,cade,cadbp
double cpt,frais_port
string code_type_taxe


dw_edition.retrieve(numero_commande)


select frais_port, code_type_taxe
into :frais_port, :code_type_taxe  from commande 
where numero_commande  = :numero_commande 	 ;

//insertion des frais de port comme une ligne de commande
if isnull(frais_port) then
	frais_port = 0
end if

if frais_port > 0 then
	dw_edition.insertrow(0)
	dw_edition.insertrow(0)
	dw_edition.setitem(dw_edition.rowcount(),"produit_designation","Frais de Port")
	if code_type_taxe = 'HT' then
		frais_port = frais_port * 1.2
	end if
	dw_edition.setitem(dw_edition.rowcount(),"ligne_commande_prix",frais_port)
	dw_edition.setitem(dw_edition.rowcount(),"ligne_commande_qte_commandee",1)
end if

print_ok = false

// doit on mettre l'entête et le bas de page
string v_entete
select entete_commande into :v_entete from param ;

if v_entete = 'O' then
	entete = dw_edition.GetItemString(dw_edition.GetRow(),"prati_entete")
	baspage = dw_edition.GetItemString(dw_edition.GetRow(),"prati_bas_page")
	rte_1.insertdocument(entete, False, FileTypeRichText!)
	rte_1.SelectTextAll ()
	entete = rte_1.CopyRtf()
	
	rte_1.insertdocument(baspage, False, FileTypeRichText!)
	rte_1.SelectTextAll ()
	baspage = rte_1.CopyRtf( )
	
	for cpt = 1 to dw_edition.rowcount()
		dw_edition.SetItem(cpt,"prati_entete",entete)
		dw_edition.SetItem(cpt,"prati_bas_page",baspage)
	next
	
	// Cadrage de l'entête et du bas de page
	// (Le visible ou non visible est fait automatiquement dans la Dw)
	
	SELECT "edition_entete_cadrage", "edition_baspage_cadrage" INTO :cade, :cadbp 
	FROM "param" ;
		
	dw_edition.Modify("prati_entete.alignment = '"+cade+"'")
	dw_edition.Modify("prati_bas_page.alignment = '"+cadbp+"'")
else
	dw_edition.Modify("prati_entete.visible = false")
	dw_edition.Modify("prati_bas_page.visible = false")
end if


if rb_non_chiffre.checked then
	dw_edition.object.pu_ttc_t.visible = 0
	dw_edition.object.reference_produit_prix.visible = 0
	dw_edition.object.remise_t.visible = 0
	dw_edition.object.remise.visible = 0
	dw_edition.object.prix_net_t.visible = 0
	dw_edition.object.ligne_commande_prix.visible = 0
	dw_edition.object.total_ligne_t.visible = 0
	dw_edition.object.total_ligne.visible = 0
	dw_edition.object.total_t.visible = 0
	dw_edition.object.total.visible = 0
	
end if

dw_edition.Modify("datawindow.Print.copies="+em_exemplaire.text)


end subroutine

public subroutine sauvegarder_patient (string fichier_depart);

// Sauvegarde le BC dans la GED du patient
// Il a été généné en PDF avant

if FileExists(fichier_depart) and dw_edition.rowcount() > 0 then
	
		Messagebox("MEMORISATION DE LA COMMANDE","Veuiller indiquer le patient dans le dossier duquel vous souhaitez mémoriser cette commande !")
		
		
		open(w_cherche)
		
		if var_suite then
		
				string dossier_arrivee, fichier_arrivee
				string aleatoire
				integer resultat_copy
				string v_libelle
				
				v_libelle = "Commande " + dw_edition.GetItemString(1,"fournisseur_nom")
				
				dossier_arrivee = fxg_get_rep_photos( ) + string(var_code)
				// on rajoute un élément alétoire pour rendre unique le nom
				aleatoire = string(rand(65000))
				fichier_arrivee =  dossier_arrivee + win_delimiter +aleatoire+ gfx_extraire_nom_fichier(fichier_depart)

				// Test de l'existence du dossier de destination
				if not DirectoryExists( dossier_arrivee ) then
					// faut le créér
					if gfx_creer_rep( dossier_arrivee ) <> 1 then 
						MessageBox("ERREUR DANS LA CREATION DU DOSSIER DE DESTINATION","Impossible de créer le dossier : "+dossier_arrivee)
						var_suite = false
					end if
				end if
			
				if var_suite then
					var_suite = false
					resultat_copy = FileCopy (fichier_depart,fichier_arrivee, false ) 
					
					choose case resultat_copy
						case 1 
							// La copie a marché
							var_suite = true
							if utilisation_distante then
								// Mémo du fichier en vue du retour au cabinet
								fxg_ajout_acquis_distante ( var_code , fichier_arrivee ) 
							end if
							
						case -1
							MessageBox("ERREUR DANS LA COPIE DU FICHIER","Impossible de trouver le fichier : "+fichier_depart)
						case -2
							MessageBox("ERREUR DANS LA COPIE DU FICHIER","Impossible d'écrire le fichier : " + fichier_arrivee + "~n~nIl est possible que vous n'ayez pas les droits nécessaires ou que le fichier existe déjà")
					end choose
				end if
				
				if var_suite then
					integer categorie_nulle
					setnull(categorie_nulle)
					fxg_enregcourrierhisto(var_code, "DOCPDF", today(), v_libelle,  aleatoire + gfx_extraire_nom_fichier(fichier_depart) , 'D', "N", "N", "", categorie_nulle)
					
					Messagebox("INTFORMATION","La commande a été mémorisé dans la Gestion des Documents du patient !")
				end if
						
					
	
		end if

	
else
	
	
	Messagebox("ATTENTION","Mémorisation impossible.~n~nLe fichier	" + fichier_depart + " n'existe pas !")
end if

return

end subroutine

public subroutine maj_texte_mail (long row);double v_id
string texte , v_objet
integer v_categorie
DataWindowChild dw_fille
string v_fichier_pj
boolean v_suite 

texte = dw_liste_texte_email.GetItemString(row,"texte")
v_objet = dw_liste_texte_email.GetItemString(row,"objet")
v_categorie =  dw_liste_texte_email.GetItemNumber(row, "id_categorie")
v_id_texte_email_utilise =  dw_liste_texte_email.GetItemNumber(row, "id")


if len(trim(v_objet)) > 0 then
	sle_objet.text = v_objet
end if

// on va passer par un fichier RTF
integer  num_fichier_texte_rtf
string v_fichier_temporaire_rtf

v_aleatoire =  rand(65000)
v_fichier_temporaire_rtf = dir_ini + "texte_email_" + string(v_aleatoire) + "_tmp.rtf"
num_fichier_texte_rtf = FileOpen( v_fichier_temporaire_rtf, StreamMode! , Write! , LockWrite! , replace!)
FileWrite(num_fichier_texte_rtf, texte)
FileClose(num_fichier_texte_rtf)


// Insertion du nouveau
rte_texte.selecttextall()
rte_texte.clear()
rte_texte.insertdocument(v_fichier_temporaire_rtf, True, FileTypeRichText!)
rte_texte.modified = False
end subroutine

on w_commande_impression.create
int iCurrent
call super::create
this.gb_copie=create gb_copie
this.cb_imprimer=create cb_imprimer
this.cb_annuler=create cb_annuler
this.em_exemplaire=create em_exemplaire
this.st_1=create st_1
this.rte_1=create rte_1
this.dw_edition=create dw_edition
this.rb_non_chiffre=create rb_non_chiffre
this.rb_chiffre=create rb_chiffre
this.pb_email=create pb_email
this.st_email_fournisseur=create st_email_fournisseur
this.sle_objet=create sle_objet
this.cbx_cc=create cbx_cc
this.cbx_cci=create cbx_cci
this.cbx_memo_patient=create cbx_memo_patient
this.rte_texte=create rte_texte
this.cb_liste=create cb_liste
this.dw_liste_texte_email=create dw_liste_texte_email
this.gb_1=create gb_1
this.gb_2=create gb_2
this.gb_3=create gb_3
this.gb_memo=create gb_memo
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.gb_copie
this.Control[iCurrent+2]=this.cb_imprimer
this.Control[iCurrent+3]=this.cb_annuler
this.Control[iCurrent+4]=this.em_exemplaire
this.Control[iCurrent+5]=this.st_1
this.Control[iCurrent+6]=this.rte_1
this.Control[iCurrent+7]=this.dw_edition
this.Control[iCurrent+8]=this.rb_non_chiffre
this.Control[iCurrent+9]=this.rb_chiffre
this.Control[iCurrent+10]=this.pb_email
this.Control[iCurrent+11]=this.st_email_fournisseur
this.Control[iCurrent+12]=this.sle_objet
this.Control[iCurrent+13]=this.cbx_cc
this.Control[iCurrent+14]=this.cbx_cci
this.Control[iCurrent+15]=this.cbx_memo_patient
this.Control[iCurrent+16]=this.rte_texte
this.Control[iCurrent+17]=this.cb_liste
this.Control[iCurrent+18]=this.dw_liste_texte_email
this.Control[iCurrent+19]=this.gb_1
this.Control[iCurrent+20]=this.gb_2
this.Control[iCurrent+21]=this.gb_3
this.Control[iCurrent+22]=this.gb_memo
end on

on w_commande_impression.destroy
call super::destroy
destroy(this.gb_copie)
destroy(this.cb_imprimer)
destroy(this.cb_annuler)
destroy(this.em_exemplaire)
destroy(this.st_1)
destroy(this.rte_1)
destroy(this.dw_edition)
destroy(this.rb_non_chiffre)
destroy(this.rb_chiffre)
destroy(this.pb_email)
destroy(this.st_email_fournisseur)
destroy(this.sle_objet)
destroy(this.cbx_cc)
destroy(this.cbx_cci)
destroy(this.cbx_memo_patient)
destroy(this.rte_texte)
destroy(this.cb_liste)
destroy(this.dw_liste_texte_email)
destroy(this.gb_1)
destroy(this.gb_2)
destroy(this.gb_3)
destroy(this.gb_memo)
end on

event open;call super::open;
numero_commande = message.doubleparm

dw_edition.settransobject(sqlca)

dw_liste_texte_email.settransobject(sqlca)
dw_liste_texte_email.modify("actif.visible = 0")

// Suppression des possibilité d'étidion dans la DW qui sert aussi à la mise à jour
dw_liste_texte_email.modify("ordre_trie.visible = 0")
dw_liste_texte_email.modify("id_categorie.visible = 0")
dw_liste_texte_email.Modify("Nom.Edit.DisplayOnly = Yes")
dw_liste_texte_email.Modify("Nom.tabsequence=0")
dw_liste_texte_email.retrieve()

colore_tous_objets_window(this, couleur_fond_fenetre)
gb_copie.backcolor = couleur_fond_fenetre
cbx_cc.backcolor = couleur_fond_fenetre
cbx_cci.backcolor = couleur_fond_fenetre
cbx_memo_patient.backcolor = couleur_fond_fenetre
gb_memo.backcolor = couleur_fond_fenetre


centrer(this)

// Le fournisseur a t il une adresse email ?

select isnull(fournisseur.email,'') into :v_email_fourni from fournisseur, commande 
where commande.numero_commande = :numero_commande and commande.code_fournisseur = fournisseur.code ;

v_email_fourni = trim(v_email_fourni)

if len(v_email_fourni) > 0 then
	
	st_email_fournisseur.text = "Email du fournisseur : "+v_email_fourni

	// Nom du praticien 
	string v_nom_praticien
	SELECT prati.nom into :v_nom_praticien FROM prati, commande WHERE commande.code_praticien = prati.code AND commande.numero_commande  = :numero_commande ;
	
	sle_objet.text = "Commande du Dr "+v_nom_praticien
	
	v_id_texte_email_utilise = double (profilestring(dir_ini+inifile_orthokis,"Stock_Tracabilité","id_texte_email_utilise","0"))

	if v_id_texte_email_utilise = 0 then
		rte_texte.PasteRTF(string_to_rtf("Veuillez trouver ci-joint notre commande." + char(13) + char(10) +  char(13) + char(10) + "Le secrétariat.", couleur_noire, couleur_blanche) )
	else
		// Mise en place du texte par défaut 
		long lig
		lig = dw_liste_texte_email.find ("id = " + string(v_id_texte_email_utilise), 1, 99999)
		
		if lig > 0 then 
			
				maj_texte_mail(lig)
			
		else
			rte_texte.PasteRTF(string_to_rtf("Veuillez trouver ci-joint notre commande." + char(13) + char(10) +  char(13) + char(10) + "Le secrétariat.", couleur_noire, couleur_blanche) )
		end if
	end if
	
	
	// Pour les envoi en copie ... selon la dernière fois ...
	if profilestring(dir_ini+inifile_orthokis,"Stock_Tracabilité","envoyer_commande_en_copie_visible","N") = "O" then
		cbx_cc.checked = true
	else
		cbx_cc.checked = false
	end if
	
	if profilestring(dir_ini+inifile_orthokis,"Stock_Tracabilité","envoyer_commande_en_copie_invisible","N") = "O" then
		cbx_cci.checked = true
	else
		cbx_cci.checked = false
	end if


	
else
	
	st_email_fournisseur.text = "Aucun email n'est renseigné dans la fiche fournisseur"
	st_email_fournisseur.textColor = couleur_rouge	
	pb_email.enabled = false
	rte_texte.enabled = false
	sle_objet.enabled = false
	
end if
end event

type p_fond from w_fenetre_arakis`p_fond within w_commande_impression
integer y = 796
end type

type gb_copie from groupbox within w_commande_impression
integer x = 1440
integer y = 64
integer width = 1755
integer height = 208
integer taborder = 70
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean italic = true
long textcolor = 33554432
long backcolor = 16777215
string text = "S~'envoyer une copie du mail "
end type

type cb_imprimer from uo_picturebutton_390x120 within w_commande_impression
integer x = 1742
integer y = 2652
integer width = 521
integer height = 152
integer taborder = 50
string text = "&Imprimer"
boolean default = true
string iconname = "ACTIONS_imprimer.png"
end type

event clicked;call super::clicked;

// remplissage de la dw
prepa_bc()

dw_edition.print()

if messagebox("ATTENTION","Souhaitez vous mettre à jour la date/heure d'envoi ?", Question!, YesNo!, 2) = 1 then
		update commande set date_envoi = getdate() where numero_commande = :numero_commande ;
		commit ;
end if

if cbx_memo_patient.checked then

	string fichier_pdf, fichier_pdf_complet
	
	fichier_pdf = "bcf"+string(numero_commande)+".pdf"
	fichier_pdf_complet = dir_ini + fichier_pdf
	
	// sauvegarde du bon de commande en PDF
	dw_edition.saveAs(fichier_pdf_complet, pdf!, false)

	sauvegarder_patient(fichier_pdf_complet)
end if


close(parent)

end event

type cb_annuler from uo_picturebutton_390x120 within w_commande_impression
integer x = 1193
integer y = 2652
integer width = 521
integer height = 152
integer taborder = 40
string text = "&Annuler"
string iconname = "ACTIONS_annuler.png"
end type

event clicked;call super::clicked;close(parent)
end event

type em_exemplaire from editmask within w_commande_impression
integer x = 814
integer y = 364
integer width = 206
integer height = 92
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
string text = "1"
alignment alignment = center!
borderstyle borderstyle = stylelowered!
string mask = "#"
boolean spin = true
end type

type st_1 from statictext within w_commande_impression
integer x = 165
integer y = 372
integer width = 626
integer height = 64
integer textsize = -10
fontcharset fontcharset = ansi!
string facename = "Arial"
long backcolor = 553648127
boolean enabled = false
string text = "Nombre d~'exemplaires :"
boolean focusrectangle = false
end type

type rte_1 from richtextedit within w_commande_impression
boolean visible = false
integer x = 3520
integer y = 104
integer width = 411
integer height = 432
integer taborder = 20
long init_backcolor = 16777215
boolean border = false
end type

type dw_edition from datawindow within w_commande_impression
boolean visible = false
integer x = 2341
integer y = 176
integer width = 411
integer height = 432
integer taborder = 20
string title = "none"
string dataobject = "dw_edition_bon_commande"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type rb_non_chiffre from radiobutton within w_commande_impression
integer x = 105
integer y = 212
integer width = 919
integer height = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 553648127
string text = "Bon de commande non chiffré"
end type

type rb_chiffre from radiobutton within w_commande_impression
integer x = 101
integer y = 104
integer width = 754
integer height = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 553648127
string text = "Bon de commande chiffré"
boolean checked = true
end type

type pb_email from uo_picturebutton_390x120 within w_commande_impression
integer x = 2290
integer y = 2652
integer width = 521
integer height = 152
integer taborder = 60
boolean bringtotop = true
string text = "&Email"
string iconname = "lc_envoi_message.png"
end type

event clicked;call super::clicked;
open(w_patience)

// remplissage de la dw
prepa_bc()

string fichier_pdf, fichier_pdf_complet

fichier_pdf = "bcf"+string(numero_commande)+".pdf"
fichier_pdf_complet = dir_ini + fichier_pdf
// sauvegarde du bon de commande en PDF
dw_edition.saveAs(fichier_pdf_complet, pdf!, false)

// pour les tests
//verif_bullzip_printer(fichier_pdf_complet, true) 
//PrintSetPrinter('Bullzip PDF Printer')
//dw_edition.print()

// Constitution de l'email ...

// Recherche du compte email du praticien

// recherche de l'ID du cpt mail par def du prati du patient

integer id_cpt


string v_cpt_user

setnull(id_cpt)

// Compte spécial pour l'envoi de commande fournisseur ?
SELECT cpt_mail_commande_fournisseur into :id_cpt FROM prati, commande WHERE commande.code_praticien = prati.code AND commande.numero_commande  = :numero_commande ;

if isnull(id_cpt) then
	// Pas de compte spécifique 
	select isnull(utiliser_compte_mail_perso, 'N'), cpt_mail into :v_cpt_user, :id_cpt from utilisateurs where code = :utilisateur_code ;
	
	if v_cpt_user = 'N' then
		// compte du praticien 
		SELECT cpt_mail into :id_cpt FROM prati, commande WHERE commande.code_praticien = prati.code AND commande.numero_commande  = :numero_commande ;
	end if
	
	if isnull(id_cpt) then
		// pas de compte mail par defaut sur ce prati
		// --> on choisi le premier de la liste des cpt order by ordre_tri, nom
		select top 1 id into :id_cpt from email_comptes order by ordre_tri, nom ;
	end if
end if

if isnull(id_cpt) then
	
	MessageBox("ATTENTION","Vous devez définir des Comptes Emails pour chaque praticien avant d'envoyer des emails (menu 'Tables', 'Administratif').~n~nCeci ne semble pas être le cas.~n~nL'envoi de l'email ne peut avoir lieu.")
	
else
	// init cpt mail et affection au mail manager
	cpt_email = create uo_email_compte
	cpt_email.charger(id_cpt)
	email_manager.set_compte(cpt_email)
	
	email_manager.propos_objet = sle_objet.text
	// init pour mode unitaire
	email_manager.mode_choix_adr_courant = email_manager.mode_choix_adr_unitaire
	
	
	// creation et envoie email
	email = create uo_email_email
	email.add_destinataire_a(v_email_fourni, false) 
	email.set_from(cpt_email.my_alias,cpt_email.my_adr)
	email.set_sujet(email_manager.propos_objet)
									
												
	// On envoie le fichier PDF en tant que Pièce jointe !!!
	string fichier_texte_envoye
	fichier_texte_envoye = dir_ini + "texte_email_envoye_" + string(v_aleatoire)+ "_tmp.html"
	rte_texte.savedocument(fichier_texte_envoye, FileTypeHTML!, EncodingANSI!)
	email.set_body_html(fichier_texte_envoye)	
	email.add_fichier_joint(fichier_pdf_complet)
	
	// cc et cci
	if cbx_cc.checked then
		email.set_cc(cpt_email.my_alias, cpt_email.my_adr)
	end if
	if cbx_cci.checked then
		email.set_cci(cpt_email.my_alias, cpt_email.my_adr)
	end if
												
	if email_manager.envoyer_email(email.get_email()) then
		
		
		// Pour les CC ... selon la dernière fois ...
		if cbx_cc.checked then
			Setprofilestring(dir_ini+inifile_orthokis,"Stock_Tracabilité","envoyer_commande_en_copie_visible","O")
		else
			Setprofilestring(dir_ini+inifile_orthokis,"Stock_Tracabilité","envoyer_commande_en_copie_visible","N")
		end if
		
		// Pour les CCi ... selon la dernière fois ...
		if cbx_cci.checked then
			Setprofilestring(dir_ini+inifile_orthokis,"Stock_Tracabilité","envoyer_commande_en_copie_invisible","O")
		else
			Setprofilestring(dir_ini+inifile_orthokis,"Stock_Tracabilité","envoyer_commande_en_copie_invisible","N")
		end if
		
		Setprofilestring(dir_ini+inifile_orthokis,"Stock_Tracabilité","id_texte_email_utilise",string(v_id_texte_email_utilise))

		update commande set date_envoi = getdate() where numero_commande = :numero_commande ;
		commit ;
		if Messagebox("INFORMATION","L'email a été correctement envoyé.~nLa date/heure d'envoi a été mise à jour.~n~nSouhaitez-vous imprimer la commande ?",Question!,YesNo!,2) = 1 then
			dw_edition.print()
		end if
	
	else
		messagebox("ERREUR ...", "Impossible d'envoyer l'Email, opération annulée.~n~n(Rapport dans le fichier "+dir_ini + "email_last_error.xml", StopSign!)
	end if
end if

if cbx_memo_patient.checked then
	sauvegarder_patient(fichier_pdf_complet)
end if


close(w_patience)

close(parent)




end event

type st_email_fournisseur from statictext within w_commande_impression
integer x = 64
integer y = 544
integer width = 3113
integer height = 76
boolean bringtotop = true
integer textsize = -12
integer weight = 700
fontcharset fontcharset = ansi!
string facename = "Arial"
long backcolor = 553648127
boolean enabled = false
string text = "Email du fournisseur : "
alignment alignment = center!
boolean focusrectangle = false
end type

type sle_objet from singlelineedit within w_commande_impression
integer x = 142
integer y = 812
integer width = 3035
integer height = 96
integer taborder = 30
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
string text = "Commande du Dr x"
borderstyle borderstyle = stylelowered!
end type

type cbx_cc from checkbox within w_commande_impression
integer x = 1623
integer y = 152
integer width = 622
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
string text = "En copie visible"
end type

type cbx_cci from checkbox within w_commande_impression
integer x = 2377
integer y = 156
integer width = 622
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
string text = "En copie invisible"
end type

type cbx_memo_patient from checkbox within w_commande_impression
integer x = 1513
integer y = 396
integer width = 1541
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
string text = "Mémoriser la commande dans le dossier d~'un patient"
end type

type rte_texte from richtextedit within w_commande_impression
integer x = 78
integer y = 992
integer width = 4110
integer height = 1508
integer taborder = 30
boolean bringtotop = true
boolean init_hscrollbar = true
boolean init_vscrollbar = true
long init_backcolor = 16777215
boolean init_wordwrap = true
long init_inputfieldbackcolor = 16777215
boolean init_inputfieldsvisible = true
boolean init_inputfieldnamesvisible = true
boolean init_rulerbar = true
boolean init_tabbar = true
boolean init_toolbar = true
integer init_undodepth = 100
long init_leftmargin = 10
long init_topmargin = 10
long init_rightmargin = 10
long init_bottommargin = 20
borderstyle borderstyle = stylelowered!
end type

type cb_liste from uo_picturebutton_390x120 within w_commande_impression
integer x = 3401
integer y = 768
integer width = 654
integer height = 132
integer taborder = 50
boolean bringtotop = true
string text = "Liste Textes"
string tiptext = "Affiche la liste des textes emails pré-configurés"
string iconname = "lc_listes.png"
end type

event clicked;call super::clicked;dw_liste_texte_email.visible = true
end event

type dw_liste_texte_email from datawindow within w_commande_impression
boolean visible = false
integer x = 1349
integer width = 1536
integer height = 1356
integer taborder = 10
boolean bringtotop = true
string title = "none"
string dataobject = "dw_email_texte_liste"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;If row > 0 Then
	This.SelectRow(0,False)
	This.SelectRow(row,True)
End If

end event

event doubleclicked;


if this.rowcount() > 0 then

	maj_texte_mail(row)
	

end if
this.visible = FALSE



end event

event rbuttondown;

this.visible = false


end event

type gb_1 from groupbox within w_commande_impression
integer x = 37
integer y = 20
integer width = 1353
integer height = 496
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 16777215
end type

type gb_2 from groupbox within w_commande_impression
integer x = 73
integer y = 716
integer width = 3150
integer height = 256
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean italic = true
long textcolor = 33554432
long backcolor = 16777215
string text = "Objet"
end type

type gb_3 from groupbox within w_commande_impression
integer x = 18
integer y = 636
integer width = 4219
integer height = 1956
integer taborder = 30
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 16777215
string text = "Envoi par email"
end type

type gb_memo from groupbox within w_commande_impression
integer x = 1449
integer y = 312
integer width = 1755
integer height = 208
integer taborder = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean italic = true
long textcolor = 33554432
long backcolor = 16777215
string text = "Mémorisation de la commande dans la GED"
end type

