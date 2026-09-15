$PBExportHeader$w_creation_patient_rapide.srw
forward
global type w_creation_patient_rapide from w_fenetre_arakis
end type
type cb_annuler from uo_picturebutton_390x120 within w_creation_patient_rapide
end type
type cb_enregistrer from uo_picturebutton_390x120 within w_creation_patient_rapide
end type
type lb_codep from listbox within w_creation_patient_rapide
end type
type lb_ville from listbox within w_creation_patient_rapide
end type
type dw_informations from datawindow within w_creation_patient_rapide
end type
end forward

global type w_creation_patient_rapide from w_fenetre_arakis
integer width = 3904
integer height = 2068
string title = "Création rapide d~'un nouveau patient"
windowtype windowtype = response!
cb_annuler cb_annuler
cb_enregistrer cb_enregistrer
lb_codep lb_codep
lb_ville lb_ville
dw_informations dw_informations
end type
global w_creation_patient_rapide w_creation_patient_rapide

type variables
double var_code_local
//pour save l'ancien var_code si annulation de la création d'un nouveau patient
double ancien_var_code

// Servent pour la MAJ des codes postaux
//datawindow dw_maj
string ch_maj
//ch_tel,ch_fax
string pref[100]


// Histtorique du type de dossier
string ancien_type_dossier

rdv param_rdv
end variables

forward prototypes
public subroutine maj_dddw ()
public subroutine enregistrer_dw ()
end prototypes

public subroutine maj_dddw ();// Permet de mettre à jour toutes les DDDW 
// Utile si on a fait des modifs dans les tables secondaires

String v_dddw[10]
int nb_dddw, erreur, i
DataWindowChild fille

v_dddw[1] = "code_caisse"
v_dddw[2] = "code_correspondant"
v_dddw[3] = "code_dentiste"

nb_dddw = 8

for i = 1 to nb_dddw

	if dw_informations.GetChild(v_dddw[i], fille) <> -1 then
		fille.settransobject(sqlca)
		fille.Retrieve()
	end if
next

end subroutine

public subroutine enregistrer_dw ();//validation de la colone qui a le focus
dw_informations.accepttext()



IF dw_informations.Update() = 1 then
	// si update bien passé
	commit;
else
	rollback ;
end if

end subroutine

on w_creation_patient_rapide.create
int iCurrent
call super::create
this.cb_annuler=create cb_annuler
this.cb_enregistrer=create cb_enregistrer
this.lb_codep=create lb_codep
this.lb_ville=create lb_ville
this.dw_informations=create dw_informations
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_annuler
this.Control[iCurrent+2]=this.cb_enregistrer
this.Control[iCurrent+3]=this.lb_codep
this.Control[iCurrent+4]=this.lb_ville
this.Control[iCurrent+5]=this.dw_informations
end on

on w_creation_patient_rapide.destroy
call super::destroy
destroy(this.cb_annuler)
destroy(this.cb_enregistrer)
destroy(this.lb_codep)
destroy(this.lb_ville)
destroy(this.dw_informations)
end on

event open;call super::open;centrer(this)


date st_date

//récup du mesage d'ouverture

param_rdv = Message.PowerObjectParm

st_date = date(param_rdv.date_debut)


dw_informations.visible = false

//maj IU
//this.width = dw_informations.width + 20
//this.height = dw_informations.height + 50
//centrer(this)

//met de côté l'ancien var_code
ancien_var_code = var_code

//lance la fenètre de création d'un nouveau numéro de dossier
//le param 2, c pour dire lui indiquer qu'on est en création rapide et non normale
openwithparm(w_nouveau_numero,2)

//si la var globale "var_suite" est à true alors on continue
//sinon on sort de la création rapide d'un patient
if var_suite then
	var_code_local = var_code
	dw_informations.settransobject(SQLCA)
	dw_informations.retrieve(var_code_local)
	
	dw_informations.visible = true
	
	//maj la date de première visite
	dw_informations.setitem(1,"premiere_visite",st_date)
	
	// Praticien par défaut = celui de l'agenda 
	if param_rdv.praticien_de = param_rdv.praticien_a then
		dw_informations.setitem(1,"code_praticien", param_rdv.praticien_de)
	end if
	
	
	// Zones de Saisie
	formater_zone_nom_prenom('P', dw_informations, "prenom", true)
	formater_zone_nom_prenom('N', dw_informations, "nom", true)

	colore_datawindow(dw_informations)
	

	if belgique then
		 dw_informations.object.secu_patient_t.text = 'NISS :'
		 dw_informations.object.secu_parent1_t.text = 'NISS :'
	end if


	
	dw_informations.setfocus()
else
	close(this)
end if

end event

type p_fond from w_fenetre_arakis`p_fond within w_creation_patient_rapide
end type

type cb_annuler from uo_picturebutton_390x120 within w_creation_patient_rapide
integer x = 2085
integer y = 1760
integer width = 613
integer height = 152
integer taborder = 30
string text = "&Annuler"
string iconname = "ACTIONS_abandonner.png"
end type

event clicked;call super::clicked;boolean continuer

If MessageBox("OPERATION ANNULEE","Aucun patient et aucun rendez-vous ne seront sauvegardés.~n~nConfirmez-vous ?",Question!,YesNo!) = 1 Then
	//on supprime de la table des patients, la ligne que la fenêtre
	//précédante d'ajout de num à inséré
	
	DELETE FROM patient WHERE code = :var_code_local ;
	COMMIT ;
	
	//on remet var_code à jour
	var_code = ancien_var_code
	
	//maj de la var globale pour la suite
	var_suite = false
	//puis de la var locale
	continuer = true
else
	//maj de la var locale
	continuer = false
end if

//fermeture de la window
if continuer then close(parent)
end event

type cb_enregistrer from uo_picturebutton_390x120 within w_creation_patient_rapide
integer x = 2747
integer y = 1764
integer width = 603
integer taborder = 60
string text = "&Enregistrer"
boolean default = true
string iconname = "ACTIONS_enregistrer.png"
end type

event clicked;call super::clicked;int	return_update


//// Mise à jour des noms / prénoms selon les masques si le patient n'est pas supprimé
//string v_masque_nom, v_masque_prenom, v_zone
//select top 1 masque_nom, masque_prenom into :v_masque_nom, :v_masque_prenom from param ;
//
//validation de la colone qui a le focus
dw_informations.accepttext()


//if dw_informations.rowcount() > 0 then
//	// Nom
//	v_zone = dw_informations.GetItemString(dw_informations.getrow(), "nom")
//	if v_masque_nom = "T" then 
//		v_zone = upper(v_zone)
//		dw_informations.SetItem(dw_informations.getrow(), "nom", v_zone )
//	else
//		if v_masque_nom = "P" then 
//			v_zone = upper(left(v_zone,1)) + mid(v_zone, 2, len(v_zone) - 1)
//			dw_informations.SetItem(dw_informations.getrow(), "nom", v_zone )
//		end if
//	end if
//	
//	// Prenom
//	v_zone = dw_informations.GetItemString(dw_informations.getrow(), "prenom")
//	if v_masque_prenom = "T" then 
//		v_zone = upper(v_zone)
//		dw_informations.SetItem(dw_informations.getrow(), "prenom", v_zone )
//	else
//		if v_masque_prenom = "P" then 
//			v_zone = upper(left(v_zone,1)) + mid(v_zone, 2, len(v_zone) - 1)
//			dw_informations.SetItem(dw_informations.getrow(), "prenom", v_zone )
//		end if
//	end if
//end if



//update les val de la datawin
return_update = dw_informations.Update()

IF return_update = 1 then
// si update bien passé
	commit;
	
	//maj de la var globale "var_nom" (inutile) pour "var_code car déjà à jour !
	var_nom = trim(dw_informations.getitemstring(1,"nom") + " " + dw_informations.getitemstring(1,"prenom"))
	
	// maj menu patient en mémoire
	majtabpatientscourants(var_code_local)
				
	//maj de la var globale pour la suite
	var_suite = true
	
	string nouveau_type_dossier 
	nouveau_type_dossier = dw_informations.getitemstring(1,"type_dossier")
	if ancien_type_dossier <> nouveau_type_dossier then
																
		// Mise à jour de l'historique des dossiers
		INSERT INTO histo_dossier (code, date_heure, type_dossier) 
		VALUES (:var_code_local, getdate(), :nouveau_type_dossier) ;
		COMMIT ;

	end if

	
	
else
	// pb ds le update
	rollback;
	
	messagebox("PROBLEME DANS LA MISE A JOUR ",sqlca.sqlerrtext)
	//maj de la var globale pour la suite
	var_suite = false
end if

close(parent)
end event

type lb_codep from listbox within w_creation_patient_rapide
boolean visible = false
integer x = 1280
integer y = 812
integer width = 1248
integer height = 528
integer taborder = 50
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 255
long backcolor = 15780518
boolean vscrollbar = true
borderstyle borderstyle = styleraised!
end type

event doubleclicked;string v_tel,v_fax
double v_row 

v_row = dw_informations.getrow()

dw_informations.setitem(v_row,"codep_parent1",left(this.selecteditem(),5))

// On bidouille ici pour aller mettre à jour le champ suivant
// le code postal, à savoir LA VILLE
dw_informations.setcolumn("codep_parent1")
dw_informations.setitem(v_row, (dw_informations.getcolumn() + 1), mid(this.selecteditem(),7,len(this.selecteditem()) - 6))


this.visible = false

// Si le téléphone et le fax n'ont pas été saisi
	v_tel = trim(dw_informations.getitemstring(v_row,"teldom_parent1"))
	v_fax = trim(dw_informations.getitemstring(v_row,"teltra_parent1"))
	if (v_tel = '' or isnull(v_tel)) and 	(v_fax = '' or isnull(v_fax)) then
		dw_informations.setitem(v_row,"teldom_parent1",pref[index])
		dw_informations.setitem(v_row,"teltra_parent1",pref[index])
	end if
	
// Met le focus à la colonne téléphone
dw_informations.SetFocus()
dw_informations.SetColumn("teldom_parent1")
end event

event rbuttondown;lb_codep.visible = FALSE
end event

type lb_ville from listbox within w_creation_patient_rapide
boolean visible = false
integer x = 1280
integer y = 192
integer width = 1248
integer height = 528
integer taborder = 40
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 255
long backcolor = 15780518
boolean vscrollbar = true
borderstyle borderstyle = styleraised!
end type

event doubleclicked;string v_tel,v_fax
double v_row 

v_row = dw_informations.getrow()

dw_informations.setitem(v_row,"ville_parent1",this.selecteditem())
this.visible = false

// Si le téléphone et le fax n'ont pas été saisi
v_tel = trim(dw_informations.getitemstring(v_row,"teldom_parent1"))
v_fax = trim(dw_informations.getitemstring(v_row,"teltra_parent1"))
if (v_tel = '' or isnull(v_tel)) and 	(v_fax = '' or isnull(v_fax)) then
	dw_informations.setitem(v_row,"teldom_parent1",pref[index])
	dw_informations.setitem(v_row,"teltra_parent1",pref[index])
end if

// Met le focus à la colonne téléphone
dw_informations.SetFocus()
dw_informations.SetColumn("teldom_parent1")

end event

event rbuttondown;lb_ville.visible = FALSE
end event

type dw_informations from datawindow within w_creation_patient_rapide
string tag = "brush"
integer x = 82
integer y = 20
integer width = 3630
integer height = 1692
integer taborder = 10
string title = "none"
string dataobject = "dw_creation_patient_rapide"
boolean livescroll = true
end type

event itemfocuschanged;//quand on arrive sur une nouvelle colonne

string	tmp_s1, tmp_s2

//si control pas une "column" on ne prend pas en compte
if dwo.type = "column"  and  GetItemString(getrow(), "nom") <> "A RENSEIGNER" then

	// Pour ne mettre les automatismes qu'une fois la saisie débutée

	
	if row > 0 then
		maj_code_postal(this,"codep_parent1","ville_parent1", "teldom_parent1","teltra_parent1",lb_ville,lb_codep,dw_informations,ch_maj,pref)
		
		
		// Conversion masque si besoin
		string v_masque_nom, v_masque_prenom, v_zone
		select top 1 masque_nom, masque_prenom into :v_masque_nom, :v_masque_prenom from param ;
		
	
		// Nom
		v_zone = GetItemString(getrow(), "nom")
		if v_masque_nom = "T" then 
			v_zone = upper(v_zone)
			SetItem(getrow(), "nom", v_zone )
		else
			if v_masque_nom = "P" then 
				v_zone = upper(left(v_zone,1)) + mid(v_zone, 2, len(v_zone) - 1)
				SetItem(getrow(), "nom", v_zone )
			end if
		end if
		
		
		// Prenom
		v_zone = GetItemString(getrow(), "prenom")
		if v_masque_prenom = "T" then 
			v_zone = upper(v_zone)
			SetItem(getrow(), "prenom", v_zone )
		else
			if v_masque_prenom = "P" then 
				v_zone = upper(left(v_zone,1)) + mid(v_zone, 2, len(v_zone) - 1)
				SetItem(getrow(), "prenom", v_zone )
			end if
		end if
		
		
		// Récupération du pays du parent1 et application 
		string v_pays
		
		v_pays = this.getitemstring(row, "pays_parent1")
		formater_zone_pays(v_pays, 'T', this, "teldom_parent1")
		formater_zone_pays(v_pays, 'T', this, "teltra_parent1")
		formater_zone_pays(v_pays, 'P', this, "portable")
	
		formater_zone_pays(v_pays, 'S', this, "secu_parent1")
		formater_zone_pays(v_pays, 'S', this, "secu_patient")

		
		//sélection suivant le nom de la "column" de la data window
		string champ
		champ = dwo.name
		
		choose case dwo.name
			case "nom_parent1"
				
					if  this.getitemstring(row,"adulte") = "N" then
						// c'est un enfant
						// On met le même nom que le patient
						// on place le curseur juste aprés l'espace qui succède le nom --> près à écrire le prénom donc !
						tmp_s1 = this.getitemstring(row,"nom")
						tmp_s2 = this.getitemstring(row,"nom_parent1")
						if (tmp_s2 = '' OR IsNull(tmp_s2)) then
							this.setitem(row,"nom_parent1",tmp_s1 + " ") //rajoute un espace
							this.SelectText(len(this.GetText())+1, 0) //place le curseur après l'espace
						end if
					else
						// C'est un adulte => on reprend nom + prénom
						tmp_s1 = this.getitemstring(row,"nom") + " " + this.getitemstring(row,"prenom")
						tmp_s2 = this.getitemstring(row,"nom_parent1")
						if (tmp_s2 = '' OR IsNull(tmp_s2)) then
							this.setitem(row,"nom_parent1",tmp_s1)  
							this.SelectText(len(this.GetText())+1, 0) //place le curseur après l'espace
						end if
					end if
				
				
	//			v_zone = GetItemString(getrow(), "nom")
	//			SetItem(getrow(), "nom_parent1", v_zone + " " )
	//			this.SelectText(len(this.GetText())+1, 0) //place le curseur après l'espace
				
			case "teldom_parent1"
				tmp_s1 = GetText()
				selecttext(analyse_num_tel(tmp_s1),0) //place le curseur à la suite du "04 75" par exemple
				
			case "portable"
				tmp_s1 = GetText()
				selecttext(analyse_num_tel(tmp_s1),0) //place le curseur à la suite du "04 75" par exemple
				
			case "teltra_parent1"
				tmp_s1 = GetText()
				selecttext(analyse_num_tel(tmp_s1),0) //place le curseur à la suite du "04 75" par exemple
				
			case "date_naissance"
				selecttext(1,10)
				
			case "date_contact"
				selecttext(1,10)
				
			case "premiere_visite"
				selecttext(1,10)
				
			case "code_dentiste"
			// On met le même que le correspondant si en création et dentiste = 'A RENSEIGNER'
			// var_message_creation = message.doubleparm 
				if  this.getitemstring(row,"code_dentiste") = 'AR' then
					this.setitem(row,"code_dentiste",this.getitemstring(row,"code_correspondant"))
				end if
		end choose
	
	end if
	
			
end if



end event

event itemchanged;//quand on part d'une colonne et que son contenue à changé

integer	nb_homonymes

//si control pas une "column" on ne prend pas en compte
if dwo.type = "column" then
	//sélection suivant le nom de la "column" de la data window
	choose case dwo.name
		
		case "date_naissance"	//date de naissance patient --> MAJ de zone adulte
			if age_calcul_des_annees(data) >= 18 then	//adulte
				this.setitem(row,"adulte","O")
				// Date de naissance de l'assuré
				this.setitem(row, "date_naissance_assure", data)
				// Enfant assu
				this.setitem(row, "assure", '4')
			else	//un enfant
				this.setitem(row,"adulte","N")
				this.setitem(row, "assure", '1')
			end if
		
		case "nom"
			// Depuis 2019 + on le fait dans itemfocuschanged
//			//nom patient --> MAJ de la zone text nom_parent1
//			string v_np
//			v_np = GetItemString(row, "nom_parent1")
//			zeros(v_np)
//			if len(trim(v_np)) = 0 then
//				// Conversion masque si besoin
//				string v_masque_nom, v_masque_prenom, v_zone
//				select top 1 masque_nom, masque_prenom into :v_masque_nom, :v_masque_prenom from param ;
//				// Nom
//				v_zone = data
//				if v_masque_nom = "T" then 
//					v_zone = upper(v_zone)
//					SetItem(row, "nom_parent1", v_zone+ " " )
//				else
//					if v_masque_nom = "P" then 
//						v_zone = upper(left(v_zone,1)) + mid(v_zone, 2, len(v_zone) - 1)
//						SetItem(row, "nom_parent1", v_zone+ " " )
//					end if
//				end if
//			end if
//			//this.setitem(row,"nom_parent1",data + " ")
//			
			
			
			//vérification des homonimes
			nb_homonymes = nombre_homonymes(dw_informations.getitemnumber(row,"code"),data,dw_informations.getitemstring(row,"prenom"))
			if nb_homonymes > 0 then MessageBox("ATTENTION",String(nb_homonymes)+" autre(s) patient(s) porte(nt) ce nom.")
			
		case "adulte"	
			if data = "O" then	//adulte
				// Date de naissance de l'assuré
				this.setitem(row, "date_naissance_assure",  this.getItemDate(row, "date_naissance"))
				// patient assu
				this.setitem(row, "assure", '4')
			else	//un enfant
				this.setitem(row, "assure", '1')
			end if

	case "prenom"
			//vérification des homonimes
			nb_homonymes = nombre_homonymes(dw_informations.getitemnumber(row,"code"),dw_informations.getitemstring(row,"nom"),data)
			if nb_homonymes > 0 then MessageBox("ATTENTION",String(nb_homonymes)+" autre(s) patient(s) porte(nt) ce nom.")

			if row > 0 then
				if isnull (this.getitemString(row,"sexe")) then
				
					string v_sexe, v_prenom
						
						v_prenom = data
						select min(sexe) into :v_sexe from saints where upper(trim(prenom)) = :v_prenom ;
						
						if not isnull(v_sexe) and v_sexe <> 'I' then
							this.setitem(row,"sexe",v_sexe)
						end if
					end if
				end if

		case "teldom_parent1" 
				enregistrer_dw()
				if verif_numero_existant(this.getitemstring(row, "teldom_parent1"), var_code_local) then 
					// Réactualisation de tous les éléments affichées
					dw_informations.retrieve(var_code_local)
				end if
		case  "teltra_parent1" 
				enregistrer_dw()
				if verif_numero_existant(this.getitemstring(row, "teltra_parent1"), var_code_local) then
					// Réactualisation de tous les éléments affichées
					dw_informations.retrieve(var_code_local)
				end if
		case "portable" 
				enregistrer_dw()
				if verif_numero_existant(this.getitemstring(row, "portable"), var_code_local) then
					// Réactualisation de tous les éléments affichées
					dw_informations.retrieve(var_code_local)
				end if
		case  "portable_patient" 
				enregistrer_dw()
				if verif_numero_existant(this.getitemstring(row, "portable_patient"), var_code_local) then
					// Réactualisation de tous les éléments affichées
					dw_informations.retrieve(var_code_local)
				end if

	end choose
end if



end event

event retrieveend;
if rowcount > 0 then
	ancien_type_dossier = this.getitemstring(1,"type_dossier")
end if
end event

event buttonclicked;
string ls_object
string code_retour

// Gestion des boutons d'ajout des tables annexes

// Uniquement si d'utilisateur à le droit

if droits_acces[32] = 'T' then
	
	
	// Ajout de correspondant :
	
	
	
	ls_Object = String(dwo.name)
	
	choose case ls_Object
		case  "b_ajout_corresp" 
			OpenWithParm(w_corres_fiche,"      ")
			// recup du code retour pour affectation
			code_retour = Message.StringParm
			this.setitem(1 , "code_correspondant" , code_retour)
		case  "b_ajout_dentiste" 
			OpenWithParm(w_corres_fiche,"      ")
			// recup du code retour pour affectation
			code_retour = Message.StringParm
			this.setitem(1 , "code_dentiste" , code_retour)
		case  "b_ajout_caisse" 
			OpenWithParm(w_caisse_fiche,"      ")
			// recup du code retour pour affectation
			code_retour = Message.StringParm
			this.setitem(1 , "code_caisse" , code_retour)
			
	end choose
	
//	// Remise à jour des drop down fille ...
	maj_dddw()
	
	// pour que l'affichage soit OK, on doit changer le focus de la colonne courante (car pose pb si on est sur une dw mise à jour)
	long col_courante
	
	col_courante = this.GetColumn()
	// Focus sur la colonne nom du patient
	this.SetColumn(2)
	// Focus sur la colonne Courante
	this.SetColumn(col_courante)

	
else
	
	Messagebox("ATTENTION !","Vous n'avez pas le droit d'ajouter des éléments dans les tables paramètres !")
end if


// pour accéder aux fiches 
ls_Object = String(dwo.name)

choose case ls_Object	
	case  "b_corresp" 
		OpenWithParm(w_corres_fiche,this.getitemstring(this.getrow(),"code_correspondant"))
	case  "b_dentiste" 
		OpenWithParm(w_corres_fiche,this.getitemstring(this.getrow(),"code_dentiste"))
	case  "b_caisse" 
		OpenWithParm(w_caisse_fiche,this.getitemstring(this.getrow(),"code_caisse"))
end choose


end event

event updatestart;// Verification des champs email


if rowcount() > 0 then
	string email_a_verifier 
	email_a_verifier = getitemstring(1, "email_patient")
	if fxg_isvalid_email(email_a_verifier)  then
		email_a_verifier = getitemstring(1, "email")
		if fxg_isvalid_email(email_a_verifier) then
			return 0 
		else
			w_mdi_2020.sle_clipboard.text = email_a_verifier
			w_mdi_2020.sle_clipboard.SelectText(1, Len(email_a_verifier))
			w_mdi_2020.sle_clipboard.copy()
			Messagebox("ATTENTION", "La mise à jour des données n'est pas effectuée !~n~nLa valeur saisie est dans le presse papier : CTRL + V pour la coller si besoin")
			return 1
		end if
	else
		w_mdi_2020.sle_clipboard.text = email_a_verifier
		w_mdi_2020.sle_clipboard.SelectText(1, Len(email_a_verifier))
		w_mdi_2020.sle_clipboard.copy()
		Messagebox("ATTENTION", "La mise à jour des données n'est pas effectuée !~n~nLa valeur saisie est dans le presse papier : CTRL + V pour la coller si besoin")
		return 1
	end if
end if
end event

