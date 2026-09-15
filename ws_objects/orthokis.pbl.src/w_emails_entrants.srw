$PBExportHeader$w_emails_entrants.srw
forward
global type w_emails_entrants from w_fenetre_arakis
end type
type pb_fermer from uo_picturebutton_390x120_fermer within w_emails_entrants
end type
type dw_comptes_email from datawindow within w_emails_entrants
end type
type st_1 from statictext within w_emails_entrants
end type
type pb_lire from uo_picturebutton_390x120 within w_emails_entrants
end type
type dw_liste from u_basedw within w_emails_entrants
end type
type uo_1 from resize_fenetre within w_emails_entrants
end type
type mle_copie from multilineedit within w_emails_entrants
end type
type pb_copie_email from uo_picturebutton_780x120 within w_emails_entrants
end type
type pb_copie_pj from uo_picturebutton_780x120 within w_emails_entrants
end type
type dw_liste_pj from datawindow within w_emails_entrants
end type
type pb_copie_imagerie from uo_picturebutton_780x120 within w_emails_entrants
end type
type pb_copie_pj_et_email from uo_picturebutton_780x120 within w_emails_entrants
end type
type cb_1 from commandbutton within w_emails_entrants
end type
end forward

global type w_emails_entrants from w_fenetre_arakis
integer width = 4279
integer height = 2244
string title = "Gestion des emails reçus"
boolean controlmenu = false
boolean minbox = false
boolean maxbox = false
boolean resizable = false
windowtype windowtype = child!
pb_fermer pb_fermer
dw_comptes_email dw_comptes_email
st_1 st_1
pb_lire pb_lire
dw_liste dw_liste
uo_1 uo_1
mle_copie mle_copie
pb_copie_email pb_copie_email
pb_copie_pj pb_copie_pj
dw_liste_pj dw_liste_pj
pb_copie_imagerie pb_copie_imagerie
pb_copie_pj_et_email pb_copie_pj_et_email
cb_1 cb_1
end type
global w_emails_entrants w_emails_entrants

on w_emails_entrants.create
int iCurrent
call super::create
this.pb_fermer=create pb_fermer
this.dw_comptes_email=create dw_comptes_email
this.st_1=create st_1
this.pb_lire=create pb_lire
this.dw_liste=create dw_liste
this.uo_1=create uo_1
this.mle_copie=create mle_copie
this.pb_copie_email=create pb_copie_email
this.pb_copie_pj=create pb_copie_pj
this.dw_liste_pj=create dw_liste_pj
this.pb_copie_imagerie=create pb_copie_imagerie
this.pb_copie_pj_et_email=create pb_copie_pj_et_email
this.cb_1=create cb_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.pb_fermer
this.Control[iCurrent+2]=this.dw_comptes_email
this.Control[iCurrent+3]=this.st_1
this.Control[iCurrent+4]=this.pb_lire
this.Control[iCurrent+5]=this.dw_liste
this.Control[iCurrent+6]=this.uo_1
this.Control[iCurrent+7]=this.mle_copie
this.Control[iCurrent+8]=this.pb_copie_email
this.Control[iCurrent+9]=this.pb_copie_pj
this.Control[iCurrent+10]=this.dw_liste_pj
this.Control[iCurrent+11]=this.pb_copie_imagerie
this.Control[iCurrent+12]=this.pb_copie_pj_et_email
this.Control[iCurrent+13]=this.cb_1
end on

on w_emails_entrants.destroy
call super::destroy
destroy(this.pb_fermer)
destroy(this.dw_comptes_email)
destroy(this.st_1)
destroy(this.pb_lire)
destroy(this.dw_liste)
destroy(this.uo_1)
destroy(this.mle_copie)
destroy(this.pb_copie_email)
destroy(this.pb_copie_pj)
destroy(this.dw_liste_pj)
destroy(this.pb_copie_imagerie)
destroy(this.pb_copie_pj_et_email)
destroy(this.cb_1)
end on

event open;call super::open;dw_comptes_email.settransobject(sqlca)

uo_1.taille(this)


// On doit mettre un filtre sur la datawindow des comptes selon les autorisations
DataWindowChild dw_fille
string v_filtre = ""
dw_comptes_email.GetChild("nom", dw_fille) 

 string v_lecture_son_email , v_lecture_autre_email
 integer v_lecture_autre_compte_email, v_cpt_mail
select "lecture_son_email" , "lecture_autre_email" ,  "lecture_autre_compte_email" , "cpt_mail" 
into :v_lecture_son_email , :v_lecture_autre_email, :v_lecture_autre_compte_email, :v_cpt_mail
from utilisateurs 
where code = :utilisateur_code ;

if v_lecture_autre_email = "T" then
	// tous les comptes .. pas de filtre
	v_filtre = "id <> -1"
else
	if v_lecture_autre_email = "A" then
		// Aucun compte
		v_filtre = "id = -1"
	else
		if v_lecture_autre_email = "U" then
			// un seul compte
			v_filtre = "id = " + string(v_lecture_autre_compte_email)
		end if
	end if
end if

if v_lecture_son_email = "O" then
	// accès à son propre compte
	if v_filtre <> "" then
		v_filtre = v_filtre + " or "
	end if
	v_filtre = v_filtre + " id = "+string(v_cpt_mail)
	
end if

if v_filtre <> "" then
	dw_fille.setfilter(v_filtre)
	dw_fille.filter()
	dw_comptes_email.setfilter(v_filtre)
	dw_comptes_email.filter()
end if
dw_comptes_email.retrieve()

end event

event resize;call super::resize;uo_1.retaille(this)
end event

type p_fond from w_fenetre_arakis`p_fond within w_emails_entrants
end type

type pb_fermer from uo_picturebutton_390x120_fermer within w_emails_entrants
integer x = 3547
integer y = 1964
integer width = 590
integer height = 152
integer taborder = 10
boolean bringtotop = true
end type

event clicked;fermer_fenetre(parent)
end event

type dw_comptes_email from datawindow within w_emails_entrants
string tag = "no resizeall"
integer x = 526
integer y = 56
integer width = 1248
integer height = 84
integer taborder = 10
boolean bringtotop = true
string dataobject = "dw_cherche_cpt_mail"
boolean border = false
boolean livescroll = true
end type

type st_1 from statictext within w_emails_entrants
integer x = 32
integer y = 56
integer width = 480
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 553648127
string text = "Compte Email :"
end type

type pb_lire from uo_picturebutton_390x120 within w_emails_entrants
integer x = 1829
integer y = 20
integer width = 535
integer height = 152
integer taborder = 20
boolean bringtotop = true
string text = "&Lire"
string iconname = "ACTIONS_valider.png"
end type

event clicked;call super::clicked;uo_email_compte		cpt_email

// init cpt mail et affection au mail manager
cpt_email = create uo_email_compte

// récup compte du mail choisi ...

long v_code_compte_email

v_code_compte_email = long(dw_comptes_email.gettext())


cpt_email.charger(v_code_compte_email)
email_manager.set_compte(cpt_email)

email_manager.lire_emails(dw_liste, dw_liste_pj)

if dw_liste.rowcount() > 0 then 
	pb_copie_email.visible = true
	pb_copie_pj.visible = true
	pb_copie_imagerie.visible = true
	pb_copie_pj_et_email.visible = true
else
	pb_copie_email.visible = false
	pb_copie_pj.visible = false
	pb_copie_imagerie.visible = false
	pb_copie_pj_et_email.visible = false
end if

end event

type dw_liste from u_basedw within w_emails_entrants
boolean visible = false
integer x = 37
integer y = 232
integer width = 4151
integer height = 1684
integer taborder = 11
boolean bringtotop = true
boolean titlebar = true
string dataobject = "dw_emails_entrants"
end type

event doubleclicked;call super::doubleclicked;
// Visualisation de l'email ... il est en fichier temporaire 

string fichier_a_ouvrir 

if row > 0 then 
	fichier_a_ouvrir = dir_ini + "eml_"+ string(row)+".mht"
	//fxg_ouvrir_fichier_shell(fichier_a_ouvrir)
	lance_url_avec_ie(fichier_a_ouvrir)
end if
end event

event clicked;call super::clicked;If row > 0 Then
	// On envoie cette fonction pour les libellés de colonne qui ne sonts pas mis en entête
	This.uf_ColSort()
	
	This.SelectRow(0,False)
	This.SelectRow(row,True)
	This.setrow(row)
//else
//	This.uf_ColSort()
End If

end event

type uo_1 from resize_fenetre within w_emails_entrants
boolean visible = false
integer x = 1970
integer y = 1200
integer taborder = 21
boolean bringtotop = true
end type

on uo_1.destroy
call resize_fenetre::destroy
end on

type mle_copie from multilineedit within w_emails_entrants
boolean visible = false
integer x = 709
integer y = 1092
integer width = 1472
integer height = 400
integer taborder = 21
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Eras Demi ITC"
string text = "none"
borderstyle borderstyle = styleraised!
end type

type pb_copie_email from uo_picturebutton_780x120 within w_emails_entrants
boolean visible = false
integer x = 41
integer y = 1964
integer width = 809
integer height = 152
integer taborder = 20
boolean bringtotop = true
string text = "Copie Email -> GED"
string iconname = "lc_copy.png"
end type

event clicked;call super::clicked;

double var_code_local
long lig 
integer resultat_copy

string fichier_depart, fichier_arrivee, dossier_arrivee

if dw_liste.rowcount() > 0 then
	
	var_suite = false
	
	guo_fenetre_modale.wf_ouvrir(w_cherche)
	
	if var_suite then
		var_code_local = var_code
		
		
		if Messagebox("CONFIRMATION","Confirmez-vous la copie de ce mail dans le dossier de " + var_nom +".~n~nL'email sera conservé dans la boite de réception.", Question!, YesNo!, 2) = 1 then
			
			// copie du mail ...
			
			lig = dw_liste.getrow()
			
			fichier_depart = dir_ini + "eml_"+string(lig)+".mht"
			dossier_arrivee = fxg_get_rep_photos( ) + string(var_code_local)
			
			var_suite = true
			// Test de l'existence du dossier de destination
			if not DirectoryExists( dossier_arrivee ) then
				// faut le créér
				if gfx_creer_rep( dossier_arrivee ) <> 1 then 
						MessageBox("ERREUR DANS LA CREATION DU DOSSIER DE DESTINATION","Impossible de créer le dossier : "+dossier_arrivee)
						var_suite = false
				end if
			end if
			
			if var_suite then 
				// Copie effective du fichier
				// on rajoute un élément alétoire pour rendre unique le nom
				string aleatoire, libelle_document
				aleatoire = string(rand(65000))
				fichier_arrivee =  dossier_arrivee + win_delimiter +aleatoire+ gfx_extraire_nom_fichier(fichier_depart)
				
				libelle_document = inputboxwithpropo("Libellé en Historique", "Veuillez indiquer le libellé à noter dans l'historique", dw_liste.Getitemstring(lig, "objet"), false)
				
				var_suite = false
				resultat_copy = FileCopy (fichier_depart,fichier_arrivee, false ) 
					
					choose case resultat_copy
					case 1 
						// La copie a marché
						var_suite = true
						if utilisation_distante then
							// Mémo du fichier en vue du retour au cabinet
							fxg_ajout_acquis_distante ( var_code_local , fichier_arrivee ) 
						end if
						Messagebox("INFORMATION","L'email a été correctement copié !")
	
					case -1
						MessageBox("ERREUR DANS LA COPIE DU FICHIER","Impossible de trouver le fichier : "+fichier_depart)
					case -2
						MessageBox("ERREUR DANS LA COPIE DU FICHIER","Impossible d'écrire le fichier : " + fichier_arrivee + "~n~nIl est possible que vous n'ayez pas les droits nécessaires ou que le fichier existe déjà")
				end choose
			end if
				
			if var_suite then
				datetime dt
				dt = dw_liste.GetItemDateTime(lig, "date_reception")
				integer categorie_nulle
				setnull(categorie_nulle)
				fxg_enregcourrierhisto(var_code_local, "DOCEML",date(dt), libelle_document,  aleatoire+ gfx_extraire_nom_fichier(fichier_depart) , 'D', "N", "N", "", categorie_nulle)
			end if
		end if
	end if
end if
end event

type pb_copie_pj from uo_picturebutton_780x120 within w_emails_entrants
boolean visible = false
integer x = 869
integer y = 1964
integer width = 809
integer height = 152
integer taborder = 30
boolean bringtotop = true
string text = "Copie PJ -> GED"
string iconname = "lc_copy.png"
end type

event clicked;call super::clicked;

double var_code_local
long lig 
integer resultat_copy
double numero_pj

string fichier_depart, fichier_arrivee, dossier_arrivee, fichier_eml

if dw_liste.rowcount() > 0 then
	
	lig = dw_liste.Getrow()
	
	if dw_liste.GetItemNumber(lig, "nb_pj") = 0 then
		
		Messagebox("ATTENTION" , "Cet email ne contient pas de pièce jointe !")
	
	else
		
		var_suite = false
		if dw_liste.GetItemNumber(lig, "nb_pj") > 1 then
			
			// Choix de la PJ
			
			OpenWithParm (w_email_choix_pj, lig)
			
			// On récupère le numéro de la PJ ... 
			numero_pj = Message.DoubleParm
			
			if numero_pj = 0 then 
				var_suite = false
			else
				// on va travailler ensuite sur les indexs 
				numero_pj = numero_pj - 1
				var_suite = true
			end if
		else
			var_suite = true
			
		end if

		
		if var_suite then
			var_suite = false
			
			guo_fenetre_modale.wf_ouvrir(w_cherche)
			
			if var_suite then
				
				var_code_local = var_code
				
				
				if Messagebox("CONFIRMATION","Confirmez-vous la copie de la Pièce Jointe de ce mail dans le dossier de " + var_nom +".~n~nL'emall (et sa Pièce Jointe) sera conservé dans la boite de réception.", Question!, YesNo!, 2) = 1 then
					
					// copie du mail ...
					
					lig = dw_liste.getrow()
					
					// Sauvegarde de la PJ ... 
					uo_email_email	v_email
					fichier_eml = dir_ini + "eml_"+string(lig)+".mht"
	
					v_email = create uo_email_email
					v_email.loademl(fichier_eml)
					
					v_email.Save_AttachedFile(numero_pj)
					
				
					fichier_depart = dir_ini + "temp" + win_delimiter + v_email.Get_AttachmentFilename(numero_pj)
				//	if FileExists()
					dossier_arrivee = fxg_get_rep_photos( ) + string(var_code_local)
					
					var_suite = true
					// Test de l'existence du dossier de destination
					if not DirectoryExists( dossier_arrivee ) then
						// faut le créér
						if gfx_creer_rep( dossier_arrivee ) <> 1 then 
								MessageBox("ERREUR DANS LA CREATION DU DOSSIER DE DESTINATION","Impossible de créer le dossier : "+dossier_arrivee)
								var_suite = false
						end if
					end if
					
					if var_suite then 
						// Copie effective du fichier
						// on rajoute un élément alétoire pour rendre unique le nom
						string aleatoire, libelle_document
						aleatoire = string(rand(65000))
						fichier_arrivee =  dossier_arrivee + win_delimiter +aleatoire+ gfx_extraire_nom_fichier(fichier_depart)
						
						libelle_document = inputboxwithpropo("Libellé en Historique", "Veuillez indiquer le libellé à noter dans l'historique", dw_liste.Getitemstring(lig, "objet"), false)
						
						var_suite = false
						resultat_copy = FileCopy (fichier_depart,fichier_arrivee, false ) 
							
							choose case resultat_copy
							case 1 
								// La copie a marché
								var_suite = true
								if utilisation_distante then
									// Mémo du fichier en vue du retour au cabinet
									fxg_ajout_acquis_distante ( var_code_local , fichier_arrivee ) 
								end if
								Messagebox("INFORMATION","La Pièce Jointe de l'email a été correctement copiée !")
			
							case -1
								MessageBox("ERREUR DANS LA COPIE DU FICHIER","Impossible de trouver le fichier : "+fichier_depart)
							case -2
								MessageBox("ERREUR DANS LA COPIE DU FICHIER","Impossible d'écrire le fichier : " + fichier_arrivee + "~n~nIl est possible que vous n'ayez pas les droits nécessaires ou que le fichier existe déjà")
						end choose
					end if
						
					if var_suite then
						datetime dt
						dt = dw_liste.GetItemDateTime(lig, "date_reception")
						// On met le type du document selon l'extension
						string v_extension, v_type_docu
						v_extension = lower(  gfx_extraire_extension_fichier(fichier_depart) )
						
						choose case v_extension
							case "doc", "docx"
								v_type_docu =  "DOCWRD"
							case "xls", "xlsx"
								v_type_docu =  "DOCXLS"
							case "bmp", "jpg", "jpeg"
								v_type_docu =  "DOCIMG"
							case "ppt", "pptx"
								v_type_docu = "DOCPPT"
							case "mp4", "avi"
								v_type_docu = "DOCVID"
							case "eml", "mht"
								v_type_docu = "DOCEML"
							case "pdf"
								v_type_docu = "DOCPDF"
							case "stl"
								v_type_docu = "DOCMOU"
							case else
								v_type_docu = "DOCAUT"
						end choose
						integer categorie_nulle
						setnull(categorie_nulle)
						fxg_enregcourrierhisto(var_code_local, v_type_docu,date(dt), libelle_document,  aleatoire+ gfx_extraire_nom_fichier(fichier_depart) , 'D', "N", "N", "", categorie_nulle)
					end if
				end if
			end if
		end if
	end if
end if
end event

type dw_liste_pj from datawindow within w_emails_entrants
boolean visible = false
integer x = 2848
integer y = 1080
integer width = 1157
integer height = 460
integer taborder = 20
boolean bringtotop = true
string title = "none"
string dataobject = "dw_emails_pj"
boolean livescroll = true
borderstyle borderstyle = styleraised!
end type

type pb_copie_imagerie from uo_picturebutton_780x120 within w_emails_entrants
boolean visible = false
integer x = 2523
integer y = 1964
integer width = 809
integer height = 152
integer taborder = 40
boolean bringtotop = true
string text = "Copie PJ -> Imagerie"
string iconname = "lc_images_16.png"
end type

event clicked;call super::clicked;

double var_code_local
long lig , v_lig_pj
integer resultat_copy
double numero_pj


string fichier_depart, fichier_arrivee, dossier_arrivee, fichier_eml

if dw_liste.rowcount() > 0 then
	
	lig = dw_liste.Getrow()
	
	if dw_liste.GetItemNumber(lig, "nb_pj") = 0 then
		
		Messagebox("ATTENTION" , "Cet email ne contient pas de pièce jointe !")
	
	else
		
		var_suite = false
		if dw_liste.GetItemNumber(lig, "nb_pj") > 1 then
			
			// Choix de la PJ
			
			OpenWithParm (w_email_choix_pj, lig)
			
			// On récupère le numéro de la PJ ... 
			numero_pj = Message.DoubleParm
			
			if numero_pj = 0 then 
				var_suite = false
			else
				// on va travailler ensuite sur les indexs 
				numero_pj = numero_pj - 1
				var_suite = true
			end if
		else
			var_suite = true
			
		end if
		
		if var_suite then
			// Vérfication de l'extension ... obligatoirement Jpeg ou jpg
			var_suite = false
			
			v_lig_pj  = dw_liste_pj.find( "ligne = " + string(lig) + " and index = " + string(numero_pj + 1), 0, 99999)
			fichier_depart = dw_liste_pj.getItemString(v_lig_pj, "pj")
			string v_extension
			v_extension = lower(  gfx_extraire_extension_fichier(fichier_depart)  )
			
			if v_extension <> "jpg" and v_extension <> "jpeg" then
				Messagebox("ATTENTION","La pièce jointe doit être obligatoirement une image au format JPG pour être placée dans l'imagerie.")
				var_suite = false
			else
				var_suite = true
			end if

		end if
		
		
		if var_suite then
			var_suite = false
			
			guo_fenetre_modale.wf_ouvrir(w_cherche)
			
			if var_suite then
				
				var_code_local = var_code
				
				
				if Messagebox("CONFIRMATION","Confirmez-vous la copie de la Pièce Jointe de ce mail dans l'imagerie de " + var_nom +".~n~nL'emall (et sa Pièce Jointe) sera conservé dans la boite de réception.", Question!, YesNo!, 2) = 1 then
					
					// copie du mail ...
									
					// Sauvegarde de la PJ ... 
					uo_email_email	v_email
					fichier_eml = dir_ini + "eml_"+string(lig)+".mht"
	
					v_email = create uo_email_email
					v_email.loademl(fichier_eml)
					
					v_email.Save_AttachedFile(numero_pj)
					
				
					fichier_depart = dir_ini + "temp" + win_delimiter + v_email.Get_AttachmentFilename(numero_pj)
					dossier_arrivee = fxg_get_rep_photos( ) + string(var_code_local)
					
					var_suite = true
					// Test de l'existence du dossier de destination
					if not DirectoryExists( dossier_arrivee ) then
						// faut le créér
						if gfx_creer_rep( dossier_arrivee ) <> 1 then 
								MessageBox("ERREUR DANS LA CREATION DU DOSSIER DE DESTINATION","Impossible de créer le dossier : "+dossier_arrivee)
								var_suite = false
						end if
					end if
					
					if var_suite then 
						// Copie effective du fichier
						// on rajoute un élément alétoire pour rendre unique le nom
						
						param_win[1]	= fichier_depart	 // utilisé pour dire si acquisition radio (vide) ou si acquisition d'une image venant d'un email 
			
						openWithParm(w_acquisition_radios_2013, var_code_local)
					end if
					
				end if
			end if
		end if
	end if
end if
end event

type pb_copie_pj_et_email from uo_picturebutton_780x120 within w_emails_entrants
boolean visible = false
integer x = 1696
integer y = 1964
integer width = 809
integer height = 152
integer taborder = 40
boolean bringtotop = true
string text = "Copie Email + PJ -> GED"
string iconname = "lc_copy.png"
end type

event clicked;call super::clicked;double var_code_local
long lig 
integer resultat_copy

string fichier_depart, fichier_arrivee, dossier_arrivee
integer categorie_nulle
setnull(categorie_nulle)

if dw_liste.rowcount() > 0 then
	
	lig = dw_liste.Getrow()

	if dw_liste.GetItemNumber(lig, "nb_pj") = 0 then
		Messagebox("ATTENTION" , "Cet email ne contient pas de pièce jointe !")
	else

		var_suite = false
		if dw_liste.GetItemNumber(lig, "nb_pj") > 1 then
			Messagebox("ATTENTION" , "Cet email contient plus d'une pièce jointe !~n~nVous devez utiliser les boutons de copies individuelles !")
		else

			var_suite = false
			
			guo_fenetre_modale.wf_ouvrir(w_cherche)
			
			if var_suite then
				var_code_local = var_code
				
				
				if Messagebox("CONFIRMATION","Confirmez-vous la copie de ce mail et de la pièce jointe dans le dossier de " + var_nom +".~n~nL'email sera conservé dans la boite de réception.", Question!, YesNo!, 2) = 1 then
					
					// copie du mail ...
					
					lig = dw_liste.getrow()
					
					fichier_depart = dir_ini + "eml_"+string(lig)+".mht"
					dossier_arrivee = fxg_get_rep_photos( ) + string(var_code_local)
					
					var_suite = true
					// Test de l'existence du dossier de destination
					if not DirectoryExists( dossier_arrivee ) then
						// faut le créér
						if gfx_creer_rep( dossier_arrivee ) <> 1 then 
								MessageBox("ERREUR DANS LA CREATION DU DOSSIER DE DESTINATION","Impossible de créer le dossier : "+dossier_arrivee)
								var_suite = false
						end if
					end if
					
					if var_suite then 
						// Copie effective du fichier
						// on rajoute un élément alétoire pour rendre unique le nom
						string aleatoire, libelle_document
						aleatoire = string(rand(65000))
						fichier_arrivee =  dossier_arrivee + win_delimiter +aleatoire+ gfx_extraire_nom_fichier(fichier_depart)
						
						libelle_document = inputboxwithpropo("Libellé en Historique", "Veuillez indiquer le libellé du mail à noter dans l'historique", dw_liste.Getitemstring(lig, "objet"), false)
						
						var_suite = false
						resultat_copy = FileCopy (fichier_depart,fichier_arrivee, false ) 
							
							choose case resultat_copy
							case 1 
								// La copie a marchée
								var_suite = true
								if utilisation_distante then
									// Mémo du fichier en vue du retour au cabinet
									fxg_ajout_acquis_distante ( var_code_local , fichier_arrivee ) 
								end if
								Messagebox("INFORMATION","L'email a été correctement copié !")
			
							case -1
								MessageBox("ERREUR DANS LA COPIE DU FICHIER","Impossible de trouver le fichier : "+fichier_depart)
							case -2
								MessageBox("ERREUR DANS LA COPIE DU FICHIER","Impossible d'écrire le fichier : " + fichier_arrivee + "~n~nIl est possible que vous n'ayez pas les droits nécessaires ou que le fichier existe déjà")
						end choose
						
						if var_suite then
							datetime dt
							dt = dw_liste.GetItemDateTime(lig, "date_reception")
							fxg_enregcourrierhisto(var_code_local, "DOCEML",date(dt), libelle_document,  aleatoire + gfx_extraire_nom_fichier(fichier_depart) , 'D', "N", "N", "", categorie_nulle)
						end if
					
						
						// Copie de la pièce jointe ...			
						// on rajoute un élément alétoire pour rendre unique le nom
						
						uo_email_email	v_email
						string fichier_eml
						fichier_eml = dir_ini + "eml_"+string(lig)+".mht"
		
						v_email = create uo_email_email
						v_email.loademl(fichier_eml)
						
						// PJ N° 1 => 0
						v_email.Save_AttachedFile(0)
						fichier_depart = dir_ini + "temp" + win_delimiter + v_email.Get_AttachmentFilename(0)
						aleatoire = string(rand(65000))
						fichier_arrivee =  dossier_arrivee + win_delimiter +aleatoire + gfx_extraire_nom_fichier(fichier_depart)
						
						libelle_document = inputboxwithpropo("Libellé en Historique", "Veuillez indiquer le libellé de la pièce jointe à noter dans l'historique", dw_liste.Getitemstring(lig, "objet"), false)
						
						var_suite = false
						resultat_copy = FileCopy (fichier_depart,fichier_arrivee, false ) 
							
							choose case resultat_copy
							case 1 
								// La copie a marché
								var_suite = true
								if utilisation_distante then
									// Mémo du fichier en vue du retour au cabinet
									fxg_ajout_acquis_distante ( var_code_local , fichier_arrivee ) 
								end if
								Messagebox("INFORMATION","La Pièce Jointe de l'email a été correctement copiée !")
			
							case -1
								MessageBox("ERREUR DANS LA COPIE DU FICHIER","Impossible de trouver le fichier : "+fichier_depart)
							case -2
								MessageBox("ERREUR DANS LA COPIE DU FICHIER","Impossible d'écrire le fichier : " + fichier_arrivee + "~n~nIl est possible que vous n'ayez pas les droits nécessaires ou que le fichier existe déjà")
						end choose
					end if
						
					if var_suite then
						dt = dw_liste.GetItemDateTime(lig, "date_reception")
						// On met le type du document selon l'extension
						string v_extension, v_type_docu
						v_extension = lower(  gfx_extraire_extension_fichier(fichier_depart) )
						
						choose case v_extension
							case "doc", "docx"
								v_type_docu =  "DOCWRD"
							case "xls", "xlsx"
								v_type_docu =  "DOCXLS"
							case "bmp", "jpg", "jpeg"
								v_type_docu =  "DOCIMG"
							case "ppt", "pptx"
								v_type_docu = "DOCPPT"
							case "mp4", "avi"
								v_type_docu = "DOCVID"
							case "eml", "mht"
								v_type_docu = "DOCEML"
							case "pdf"
								v_type_docu = "DOCPDF"
							case "stl"
								v_type_docu = "DOCMOU"
							case else
								v_type_docu = "DOCAUT"
						end choose
						fxg_enregcourrierhisto(var_code_local, v_type_docu,date(dt), libelle_document,  aleatoire+ gfx_extraire_nom_fichier(fichier_depart) , 'D', "N", "N", "", categorie_nulle)
					end if
				end if
			end if
		end if
	end if
end if
end event

type cb_1 from commandbutton within w_emails_entrants
boolean visible = false
integer x = 2473
integer y = 68
integer width = 402
integer height = 112
integer taborder = 20
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "none"
end type

event clicked;integer li_rc
integer li_Success
integer li_FetchUids
integer i
integer j
string ls_Name
string ls_Addr
integer li_NumAttach
integer li_AttachSize


oleobject loo_Imap
oleobject loo_MessageSet
oleobject loo_Bundle
oleobject loo_Email


// This example requires the Chilkat API to have been previously unlocked.
// See Global Unlock Sample for sample code.

loo_Imap = create oleobject
li_rc = loo_Imap.ConnectToNewObject("ChilkatMail2.Imap")
if li_rc < 0 then
    destroy loo_Imap
    MessageBox("Error","Connecting to COM object failed")
    return
end if

// Connect to an IMAP server.
// Use TLS
loo_Imap.Ssl = 1
loo_Imap.Port = 993
li_Success = loo_Imap.Connect("imap.someMailServer.com")
if li_Success <> 1 then
    //Write-Debug loo_Imap.LastErrorText
    destroy loo_Imap
    return
end if

// Login
li_Success = loo_Imap.Login("****","****")
if li_Success <> 1 then
   // Write-Debug loo_Imap.LastErrorText
    destroy loo_Imap
    return
end if

// Select an IMAP mailbox
li_Success = loo_Imap.SelectMailbox("Inbox")
if li_Success <> 1 then
//    Write-Debug loo_Imap.LastErrorText
    destroy loo_Imap
    return
end if

// We can choose to fetch UIDs or sequence numbers.
li_FetchUids = 1
// Get the message IDs of all the emails in the mailbox
loo_MessageSet = loo_Imap.Search("ALL",li_FetchUids)
if loo_Imap.LastMethodSuccess <> 1 then
//    Write-Debug loo_Imap.LastErrorText
    destroy loo_Imap
    return
end if

// When downloading headers, each email object contains
// (obviously) the headers, but the body will be missing.
// Also, attachments will not be included.  However, it is
// possible to get information about the attachments
// as well as the complete size of the email.

loo_Bundle = loo_Imap.FetchHeaders(loo_MessageSet)
if loo_Imap.LastMethodSuccess <> 1 then
    destroy loo_MessageSet
//    Write-Debug loo_Imap.LastErrorText
    destroy loo_Imap
    return
end if

// Loop over the email objects and display information
// about each:

for i = 0 to loo_Bundle.MessageCount - 1

    loo_Email = loo_Bundle.GetEmail(i)

    // Display the From and Subject
 //   Write-Debug loo_Email.From
 //   Write-Debug loo_Email.Subject

    // Display the recipients:

    for j = 0 to loo_Email.NumTo - 1
        ls_Name = loo_Email.GetToName(j)
        ls_Addr = loo_Email.GetToAddr(j)
    //    Write-Debug ls_Name + ", " + ls_Addr
    next
    for j = 0 to loo_Email.NumCC - 1
        ls_Name = loo_Email.GetCcName(j)
        ls_Addr = loo_Email.GetCcAddr(j)
       // Write-Debug ls_Name + ", " + ls_Addr
    next

    // Show the total size of the email, including body and attachments:
//    Write-Debug string(loo_Email.Size)

    // When a full email is downloaded, we would use the
    // email.NumAttachments property in conjunction with the
    // email.GetMailAttach* methods.
    // However, when an email object contains only the header,
    // we need to access the attachment info differently:
    li_NumAttach = loo_Imap.GetMailNumAttach(loo_Email)
    for j = 0 to li_NumAttach - 1
      //  Write-Debug loo_Imap.GetMailAttachFilename(loo_Email,j)
        li_AttachSize = loo_Imap.GetMailAttachSize(loo_Email,j)
//        Write-Debug "    size = " + string(li_AttachSize) + " bytes"
    next

 //   Write-Debug "--"
    destroy loo_Email
next

// Disconnect from the IMAP server.
li_Success = loo_Imap.Disconnect()

destroy loo_MessageSet
destroy loo_Bundle


destroy loo_Imap
end event

