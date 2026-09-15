$PBExportHeader$w_traitement_retours_noemie_cc_vitale.srw
forward
global type w_traitement_retours_noemie_cc_vitale from w_fenetre_arakis
end type
type pb_fermer from uo_picturebutton_390x120_fermer within w_traitement_retours_noemie_cc_vitale
end type
type pb_recherche from uo_picturebutton_390x120 within w_traitement_retours_noemie_cc_vitale
end type
type pb_traiter from uo_picturebutton_390x120 within w_traitement_retours_noemie_cc_vitale
end type
type dw_liste from datawindow within w_traitement_retours_noemie_cc_vitale
end type
type uo_1 from resize_fenetre within w_traitement_retours_noemie_cc_vitale
end type
type pb_imprimer from uo_picturebutton_390x120 within w_traitement_retours_noemie_cc_vitale
end type
type dw_prati from datawindow within w_traitement_retours_noemie_cc_vitale
end type
type st_1 from statictext within w_traitement_retours_noemie_cc_vitale
end type
type cb_historique from uo_picturebutton_390x120 within w_traitement_retours_noemie_cc_vitale
end type
type pb_exporter from uo_picturebutton_390x120 within w_traitement_retours_noemie_cc_vitale
end type
type pb_aide from uo_bouton_aide within w_traitement_retours_noemie_cc_vitale
end type
end forward

global type w_traitement_retours_noemie_cc_vitale from w_fenetre_arakis
string title = "Traitement des Retours Noémie"
pb_fermer pb_fermer
pb_recherche pb_recherche
pb_traiter pb_traiter
dw_liste dw_liste
uo_1 uo_1
pb_imprimer pb_imprimer
dw_prati dw_prati
st_1 st_1
cb_historique cb_historique
pb_exporter pb_exporter
pb_aide pb_aide
end type
global w_traitement_retours_noemie_cc_vitale w_traitement_retours_noemie_cc_vitale

type variables
// pour passage de paramètre avec CC
w_traitement_retours_noemie_cc_vitale cette_fenetre

end variables

forward prototypes
public function date convert_date_string_vers_date (string v_date_string)
end prototypes

public function date convert_date_string_vers_date (string v_date_string);

// renvoie une date à partir d'une chaine sous la forme "JJMMAA"
if integer(right(v_date_string,2)) < 90 then
	return date( 2000 + integer(right(v_date_string,2)), integer(mid(v_date_string, 3,2)), integer(left(v_date_string,2)))
else
	return date( 1900 + integer(right(v_date_string,2)), integer(mid(v_date_string, 3,2)), integer(left(v_date_string,2)))
end if

end function

on w_traitement_retours_noemie_cc_vitale.create
int iCurrent
call super::create
this.pb_fermer=create pb_fermer
this.pb_recherche=create pb_recherche
this.pb_traiter=create pb_traiter
this.dw_liste=create dw_liste
this.uo_1=create uo_1
this.pb_imprimer=create pb_imprimer
this.dw_prati=create dw_prati
this.st_1=create st_1
this.cb_historique=create cb_historique
this.pb_exporter=create pb_exporter
this.pb_aide=create pb_aide
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.pb_fermer
this.Control[iCurrent+2]=this.pb_recherche
this.Control[iCurrent+3]=this.pb_traiter
this.Control[iCurrent+4]=this.dw_liste
this.Control[iCurrent+5]=this.uo_1
this.Control[iCurrent+6]=this.pb_imprimer
this.Control[iCurrent+7]=this.dw_prati
this.Control[iCurrent+8]=this.st_1
this.Control[iCurrent+9]=this.cb_historique
this.Control[iCurrent+10]=this.pb_exporter
this.Control[iCurrent+11]=this.pb_aide
end on

on w_traitement_retours_noemie_cc_vitale.destroy
call super::destroy
destroy(this.pb_fermer)
destroy(this.pb_recherche)
destroy(this.pb_traiter)
destroy(this.dw_liste)
destroy(this.uo_1)
destroy(this.pb_imprimer)
destroy(this.dw_prati)
destroy(this.st_1)
destroy(this.cb_historique)
destroy(this.pb_exporter)
destroy(this.pb_aide)
end on

event open;call super::open;string s_code_praticien

// pour passage de paramètre avec TV
cette_fenetre = this

dw_prati.settransobject(sqlca)
dw_prati.retrieve()

// Praticien par defaut
s_code_praticien = fxg_get_praticien_par_defaut()
dw_prati.setitem(1, "code",s_code_praticien )


uo_1.taille(this)







end event

event resize;call super::resize;
uo_1.retaille(this)

end event

type p_fond from w_fenetre_arakis`p_fond within w_traitement_retours_noemie_cc_vitale
end type

type pb_fermer from uo_picturebutton_390x120_fermer within w_traitement_retours_noemie_cc_vitale
integer x = 2647
integer y = 1580
integer width = 471
integer height = 152
integer taborder = 10
boolean bringtotop = true
end type

event clicked;

if dw_liste.rowcount() > 0 then
	
	If Messagebox("ATTENTION","Vous allez quitter cette fenêtre SANS avoir traité les Retours.~n~nConfirmez-vous ?",Question!,Yesno!, 2) = 1 then
		fermer_fenetre(parent)
	end if
	
else
	fermer_fenetre(parent)
end if
end event

type pb_recherche from uo_picturebutton_390x120 within w_traitement_retours_noemie_cc_vitale
integer x = 18
integer y = 1580
integer width = 471
integer height = 152
integer taborder = 20
boolean bringtotop = true
string text = "&Rechercher"
boolean default = true
string iconname = "ACTIONS_chercher.png"
end type

event clicked;call super::clicked;
string v_code_praticien , v_nom_praticien, v_prenom_praticien

v_code_praticien  = dw_prati.gettext()

// Lancement de CC Vitale avec les paramètres qui vont bien
param_win[1] = "6"
param_win[2] = v_code_praticien

select isnull(nom, ''), isnull(prenom, '') into :v_nom_praticien, :v_prenom_praticien 
from prati where code = :v_code_praticien ;

dw_liste.modify("t_nom_praticien.text = '" + v_nom_praticien + ' ' + v_prenom_praticien + "'")

Trace("ouverture de w_cc_vitale")


OpenWithParm (w_cc_vitale, cette_fenetre)

//Pour des tests
//dw_liste.insertrow(1)
//
//dw_liste.setitem(1,"nom_patient", "TEST LAURENT")
//dw_liste.setitem(1,"num_fse", 1966)
//dw_liste.visible = true
//
if dw_liste.rowcount() > 0 then
	this.enabled (false)
	pb_traiter.enabled ( true)
	pb_imprimer.enabled ( true )
	pb_exporter.enabled ( true )
end if


end event

type pb_traiter from uo_picturebutton_390x120 within w_traitement_retours_noemie_cc_vitale
integer x = 507
integer y = 1580
integer width = 471
integer height = 152
integer taborder = 10
boolean bringtotop = true
fontcharset fontcharset = ansi!
boolean enabled = false
string text = "Traiter"
boolean default = true
string tiptext = "Traites les retours Noemie / Purge les retours - Ne les traite pas"
string iconname = "ACTIONS_executer.png"
alignment htextalign = right!
end type

event clicked;call super::clicked;
long lig, tot, v_cle, cpt_boucle
boolean v_trouve
boolean v_suite = true
boolean b_ok_histo
 
tot = dw_liste.rowcount()

// On vérifie si toutes les lignes sont bien cochées

if dw_liste.Find("sel = 'N'", 1, 999999) > 0 then
	if Messagebox("ATTENTION", "Vous avez désélectionné 1 ou plusieurs lignes.~n~nConfirmez-vous ?", Question!, YesNo!, 2) = 1 then 
		v_suite = true
	else
		v_suite = false
	end if
else
	v_suite = true
end if

if v_suite then
	
	string v_lettre, v_origine_tp, v_commentaire, v_libelle_prestation, v_num_emetteur, v_code_praticien, v_code_banque, v_nom_patient, v_lib_origine
	long v_nb_lettre 
	double v_code_patient, v_numero_dossier
	double v_montant_soins, v_montant_paye, v_montant, v_montant_ajoute
	date v_date_prestation, v_date_paiement
	string v_commentaire_paye, v_numfac
	
	// Cursor pout parcourir les soins de la facture ... 
	DECLARE cur_soins CURSOR FOR select cle from soins, code_soins 
	where soins.code = :v_code_patient and trim(numero_fse) = :v_numfac ;

	
	open(w_patience)
	
	for lig = 1 to tot 
	
		w_patience.wf_setvalue( lig * 100 / tot)
		
		v_commentaire = dw_liste.getitemString(lig, "commentaire")

		v_numfac = dw_liste.getitemString(lig, "num_fse")

		// En version 4.10 de CC Vitale, il peut y avoir des RSP sans N° de Facture => il ne faut pas les traiter
		if isnull(v_commentaire) and dw_liste.GetItemString(lig,  "sel")  = "O" and long(v_numfac) > 0 then
			
			v_code_patient = dw_liste.getitemNumber(lig, "code_patient")
			v_numero_dossier = dw_liste.getitemNumber(lig, "numero_dossier")
			//v_numfac = dw_liste.getitemString(lig, "num_fse")
			v_num_emetteur = dw_liste.getitemString(lig, "num_emetteur")			
			v_code_praticien = dw_liste.getitemString(lig, "code_praticien")
			v_code_banque	 = dw_liste.getitemString(lig, "code_banque")
			v_date_paiement = dw_liste.getitemDate(lig, "date_paiement")
			v_nom_patient = dw_liste.getitemString(lig, "nom_patient")
			v_libelle_prestation =  dw_liste.getitemString(lig, "libelle_prestation")	
			
			// 2 traitement identiques pour caisse et mutuelle ...
		
			for cpt_boucle = 1 to 2
				
				v_trouve = false
		
				if cpt_boucle = 1 then 
					v_origine_tp = 'C' 
					v_montant = dw_liste.getitemNumber(lig, "montant_caisse")
					v_lib_origine = "Caisse"
				else
					v_origine_tp = 'M' 
					v_montant = dw_liste.getitemNumber(lig, "montant_mutuelle")
					v_lib_origine = "Mutuelle"
				end if
				
				v_trouve = false
				
				if v_montant > 0 then 
					
					// recherche des montants encore dûs sur cette FSE
					select isnull(sum(montant), 0) into :v_montant_soins 
					from ligne_soins , soins
					where soins.code = ligne_soins.code and soins.cle = ligne_soins.cle and 
					soins.numero_fse = :v_numfac and 
					soins.code = :v_code_patient and ligne_soins.origine_tp = :v_origine_tp ; 
					
					select isnull(sum(paye.montant), 0) into :v_montant_paye from paye, soins 
					where soins.code = :v_code_patient and soins.code = paye.code	
					and  soins.cle = paye.cle and paye.origine_tp = :v_origine_tp  and soins.numero_fse = :v_numfac ; 
				
					// on regarde si monte exact dû .. sinon faudrait examiner le détail du fichier XML pour chaque soin .. trop complexe
					if v_montant_paye + v_montant = v_montant_soins then
						
						// on va pouvoir ajouter le(s) règlement(s)
						v_trouve = true
						
						v_commentaire_paye = left(v_libelle_prestation + " N°"+string(v_numero_dossier), 40) 		// pour etre sûr de ne pas planter l'insert
						
						// parcours de tous les soins de la facture pour ajouter les règlements ... 
						
						open cur_soins ;
						fetch cur_soins into :v_cle ;
						
						do while sqlca.sqlcode = 0 
							// Calcul du montant restant dû sur le soin 
							select isnull(sum(montant), 0) into :v_montant_soins from ligne_soins 
							where ligne_soins.cle = :v_cle and ligne_soins.code = :v_code_patient and ligne_soins.origine_tp = :v_origine_tp ; 
							
							select isnull(sum(paye.montant), 0) into :v_montant_paye from paye 
							where paye.code = :v_code_patient	and  paye.cle = :v_cle and paye.origine_tp = :v_origine_tp  ; 
						
							v_montant = v_montant_soins - v_montant_paye
							
							if v_montant > 0 then
								
								if v_numero_dossier = 10001342 then
									string g
									g = "ff"
								end if
					
								insert into paye (code, cle, "date", montant, "mode", commentaire, payeur, dateremise, tp, origine_tp, code_praticien, sur_place, montant_monnaie,
								monnaie, banque, user_modif, date_modif, heure_saisie ) 
								values (:v_code_patient, :v_cle, :v_date_paiement, :v_montant, 'V', :v_commentaire_paye , :v_num_emetteur, :v_date_paiement, 'O', :v_origine_tp, :v_code_praticien , 'O', :v_montant,
								'E', :v_code_banque, :utilisateur_code, getdate() , getdate()) ;
								
								if sqlca.sqlcode <> 0 then
									Messagebox("ATTENTION","Erreur dans l'ajout d'un règlement pour " + v_nom_patient + " ("+ string(v_numero_dossier) + ")~nMontant : " + string(v_montant)+"~nOrigine : " + v_lib_origine+"~n~nMessage : " + sqlca.sqlerrtext)
								end if
							end if
							
							
							fetch cur_soins into :v_cle ;
						
						loop 
						
						close cur_soins ;
						
					end if
					
					dw_liste.setitem(lig, "couleur_commentaire", couleur_bleue)
					if v_trouve then 
						if cpt_boucle = 1 then
							v_commentaire = "OK Caisse"
						else
							if v_commentaire <> "" then
								v_commentaire = v_commentaire + " - "
							end if
							v_commentaire = v_commentaire + "OK Mutuelle"
						end if
					else
						if cpt_boucle = 1 then
							v_commentaire = "Caisse non dû"
							dw_liste.setitem(lig, "couleur_commentaire", couleur_rouge)
						else
							if v_commentaire <> "" then
								v_commentaire = v_commentaire + " - "
							end if
							v_commentaire = v_commentaire + "Mutuelle non dû"
							dw_liste.setitem(lig, "couleur_commentaire", couleur_rouge)
						end if
					end if					
				else
					// Montant vaut zéro : pas lieu de vérifier
					if cpt_boucle = 1 then
						v_commentaire = ""
					end if	
				end if
				
			next
		
			dw_liste.setitem(lig, "commentaire", v_commentaire)
		end if
		
	next
	
	commit ;
	
	
	

	// Validation des FSE traités
	// Lancement de CC Vitale avec les paramètres qui vont bien
	param_win[1] = "7"
	
	Trace("ouverture de w_cc_vitale")
	OpenWithParm (w_cc_vitale, cette_fenetre)
	
	// Historisation du document
	
	string s_dir_retours 
	
	s_dir_retours = dir_photos +  "Retours_Noemie\"
	
	if not DirectoryExists (s_dir_retours) then
		
		if CreateDirectory (s_dir_retours) = 1 then
			b_ok_histo = true
		else
			b_ok_histo = false
			Messagebox("ATTENTION","Impossible de créer de dossier d'historisation des retours (" + s_dir_retours + ").~n~nCette liste n'est pas historisée !")
		end if
	else
		b_ok_histo = true
	end if
	
	if b_ok_histo then
		
		string v_nom_fichier
		
		v_code_praticien  = dw_prati.gettext()
		
		v_nom_fichier = v_code_praticien+"-"+string(year(today()))+"-"+string(month(today()))+"-"+string(day(today()))+"-"+string(hour(now()))+"-"+string(minute(now()))+".pdf"
		
		if dw_liste.saveas(s_dir_retours + v_nom_fichier, PDF!, true) <> 1 then
			Messagebox("ATTENTION","Erreur dans l'historisation de la liste !~n~nFichier : " +s_dir_retours + v_nom_fichier )
		end if
		
	end if
		

	close(w_patience)
	
	If Messagebox("FIN DU TRAITEMENT","Tous les retours ont été traités.~n~Souhaitez-vous imprimer la liste compte-rendu ?",Question!,Yesno!,1) = 1 then
		dw_liste.print()
	end if


	fermer_fenetre(parent)
	

end if
end event

event rbuttondown;call super::rbuttondown;If Messagebox("ATTENTION - PURGE DES RETOURS NOEMIE","*** ATTENTION ***~n~nVous allez considérer les retours listés comme TRAITES dans CC-Vitale mais SANS LES TRAITER.~n~nConfirmez-vous ?",Question!,Yesno!,1) = 1 then
	// Validation des RSP
	// Lancement de CC Vitale avec les paramètres qui vont bien
	open(w_patience)
	
	param_win[1] = "7"
	
	OpenWithParm (w_cc_vitale, cette_fenetre)

	close(w_patience)
	
	fermer_fenetre(parent)
end if
end event

type dw_liste from datawindow within w_traitement_retours_noemie_cc_vitale
boolean visible = false
integer x = 23
integer y = 16
integer width = 2981
integer height = 1524
integer taborder = 10
boolean bringtotop = true
string title = "none"
string dataobject = "dw_liste_retours_noemie_cc_vitale"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event rbuttondown;

// Sur le clic droit on sélection ou désélectionne toutes les lignes, selon la première
long lig, tot
string val 

tot = rowcount()

if tot > 0 then
	val = getitemString(1, "Sel")
	if val = "O" then
		val = "N"
	else
		val = "O"
	end if
	
	for lig = 1 to tot 
		setitem(lig, "sel", val)
	next
end if
end event

type uo_1 from resize_fenetre within w_traitement_retours_noemie_cc_vitale
boolean visible = false
integer x = 1454
integer y = 956
integer taborder = 20
boolean bringtotop = true
end type

on uo_1.destroy
call resize_fenetre::destroy
end on

type pb_imprimer from uo_picturebutton_390x120 within w_traitement_retours_noemie_cc_vitale
integer x = 997
integer y = 1580
integer width = 471
integer height = 152
integer taborder = 20
boolean bringtotop = true
boolean enabled = false
string text = "Imprimer"
string iconname = "ACTIONS_imprimer.png"
end type

event clicked;call super::clicked;

dw_liste.print()
end event

type dw_prati from datawindow within w_traitement_retours_noemie_cc_vitale
string tag = "position brush"
integer x = 1216
integer y = 328
integer width = 859
integer height = 72
integer taborder = 70
boolean bringtotop = true
string dataobject = "dw_cherche_prati"
boolean border = false
end type

type st_1 from statictext within w_traitement_retours_noemie_cc_vitale
integer x = 617
integer y = 332
integer width = 539
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
string text = "Choix du praticien : "
boolean focusrectangle = false
end type

type cb_historique from uo_picturebutton_390x120 within w_traitement_retours_noemie_cc_vitale
string tag = ""
integer x = 1975
integer y = 1580
integer width = 471
integer height = 152
integer taborder = 20
boolean bringtotop = true
string text = "Historique"
string iconname = "ACTIONS_historique_noemie.png"
end type

event clicked;call super::clicked;

//open(w_historique_retours_noemie)

guo_fenetre_modale.wf_ouvrir(w_historique_retours_noemie)

end event

type pb_exporter from uo_picturebutton_390x120 within w_traitement_retours_noemie_cc_vitale
integer x = 1486
integer y = 1580
integer width = 471
integer height = 152
integer taborder = 30
boolean bringtotop = true
boolean enabled = false
string text = "Exporter"
string iconname = "ACTIONS_imprimer.png"
end type

event clicked;call super::clicked;dw_liste.saveas()
end event

type pb_aide from uo_bouton_aide within w_traitement_retours_noemie_cc_vitale
string tag = "Retours Noemie"
integer x = 2464
integer y = 1588
integer width = 165
integer height = 136
integer taborder = 140
boolean bringtotop = true
end type

