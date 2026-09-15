$PBExportHeader$lien_planmeca.sru
forward
global type lien_planmeca from userobject
end type
type cb_supprimer from commandbutton within lien_planmeca
end type
type cb_utiliser from commandbutton within lien_planmeca
end type
type p_1 from picture within lien_planmeca
end type
end forward

global type lien_planmeca from userobject
integer width = 937
integer height = 200
long backcolor = 16777215
string text = "none"
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
cb_supprimer cb_supprimer
cb_utiliser cb_utiliser
p_1 p_1
end type
global lien_planmeca lien_planmeca

type prototypes

end prototypes

type variables

// Contient les infos du patient
datawindow dw_patient

string erreur_dimaxis[]



end variables

forward prototypes
public function string message_erreur_dimaxis (integer code_erreur)
public subroutine gestion_planmeca (integer action)
end prototypes

public function string message_erreur_dimaxis (integer code_erreur);if 1 <= code_erreur and code_erreur <= 17 then
	return erreur_dimaxis[code_erreur]
else
	return "Erreur inconnue."
end if
end function

public subroutine gestion_planmeca (integer action);// Paramètre :
//-------------------
//    1 = Ajout d'un patient
//    2 = Modification d'un patient
//    3 = Suppression d'un patient

integer noi

if dw_patient.rowcount() > 0 then


	open(w_patience)
	
	uo_lien_planmeca uo_planmeca

	// instanciation obj planmeca (var d'instance)
	uo_planmeca = create uo_lien_planmeca

	ulong err  = 0
	
	err = uo_planmeca.connexion_dimaxis()
	
	// C'est la connexion_dimaxis qui met à jour la variable "logiciel_planmeca"
	string libelle_logiciel 

	if logiciel_planmeca = "R" then
		libelle_logiciel = "Romexis"
	else
		libelle_logiciel = "Dimaxis"
	end if
	
	erreur_dimaxis[1] = libelle_logiciel + " n'a pas pu se lancer correctement."
	erreur_dimaxis[2] = libelle_logiciel + " n'a pas pu se connecter à sa base de données."
	erreur_dimaxis[3] = "Ce patient n'existe pas dans la base de "+ libelle_logiciel + "."
	erreur_dimaxis[4] = "Ce patient n'a pas pu être ajouté dans la base de données. Peut être existe-t-il déjà."
	erreur_dimaxis[5] = "Ce patient n'a pas pu êre mis à jour."
	erreur_dimaxis[6] = "Ce patient n'a pas pu être supprimé."
	erreur_dimaxis[7] = "Ce patient n'a pas pu être supprimé car il a une image dans la base "+ libelle_logiciel + "."
	erreur_dimaxis[8] =  libelle_logiciel + " n'a pas encore pu se connecter à sa base de données (problème de lenteur de réseau)."
	erreur_dimaxis[9] =  libelle_logiciel + " est occupé ; une fenêtre modale est ouverte."
	erreur_dimaxis[10] = "Problème de répérage d'image."
	erreur_dimaxis[11] = "Aucun patient n'est sélectionné dans "+ libelle_logiciel + "."
	erreur_dimaxis[12] = "Le patient sélectionné n'a pas d'image."
	erreur_dimaxis[13] = "Problème pour récupérer l'image de la base de données."
	erreur_dimaxis[14] = "Problème pour écrire l'image à l'endroit voulu ."
	erreur_dimaxis[15] = "Vous devez renseigner le code (N° de dossier),  le nom et le prénom du patient."
	erreur_dimaxis[16] = "Ce patient existe déjà dans "+ libelle_logiciel + " (même nom et même N° de dossier)."
	erreur_dimaxis[17] = "Un patient portant ce numéro de dossier existe déjà dans "+ libelle_logiciel + "."
	
			
			
	if err = 0 then
		
		// Récupération des infos du patient 
		
		string id,family,firstname,birth,doctor, code_prati
		char sex
		double v_code_interne
		
		IF HOPITAL_ERASME then
			// Lien spécifique sur le code de l'hopital
			v_code_interne = dw_patient.getitemnumber (dw_patient.getrow() ,"code")
			select isnull(identifiant_erasme,'') into :id from erasme_patient where code_patient = :v_code_interne ;
			// on ne prend que les 10 premiers caractères
			id = left(id, 10)
			
		else
			if uo_planmeca.v_code_lien_radio = "I" then
				// lien sur code interne
				id = string(dw_patient.getitemnumber (dw_patient.getrow() ,"code"))
			else
				// lien sur le numéro de dossier
				id = string(dw_patient.getitemnumber (dw_patient.getrow() ,"numero_dossier"))
			end if
		end if

		
		
//		if uo_planmeca.v_code_lien_radio = "I" then
//			// lien sur code interne
//			id = string(dw_patient.getitemnumber (dw_patient.getrow() ,"code"))
//		else
//			id = string(dw_patient.getitemnumber (dw_patient.getrow() ,"numero_dossier"))
//		end if

		family = dw_patient.getitemstring (dw_patient.getrow() ,"nom")
		firstname = dw_patient.getitemstring (dw_patient.getrow() ,"prenom")
		birth = string(dw_patient.getitemdate (dw_patient.getrow() ,"date_naissance"))
		code_prati = dw_patient.getitemstring (dw_patient.getrow() ,"code_praticien")
		sex = upper(dw_patient.getitemstring (dw_patient.getrow() ,"sexe"))
		
		if isnull(sex) then
			sex = "O" 
		else
			if sex <> "M" and sex <> "F" then
				sex = "O"
			end if
		end if
		
		select nom into :doctor from prati where code = :code_prati ;
		
		
		choose case action
			case 1
				// Ajout
				err = uo_planmeca.DxInsertPatient (id,family,firstname,birth,doctor)
				//err = uo_planmeca.DxInsertPatient_ex (id, family, firstname, birth, doctor, sex)
				if err <> 0 then
					MessageBox("ATTENTION !","Erreur N°"+string(err)+" en ajout de patient.~n~n"+message_erreur_dimaxis(err))
				else
					MessageBox("ATTENTION !","Le patient a été correctement ajouté dans la base "+ libelle_logiciel + ".")
					// fonction pour sélectionner le patient dans le soft
					uo_planmeca.DxSelectPatient (id,noi)
				end if
			case 2
				// Modif
				err = uo_planmeca.DxUpdatePatient (id,family,firstname,birth,doctor)
				//err = uo_planmeca.DxUpdatePatient_ex (id,family,firstname,birth,doctor, sex)
				
				if err <> 0 then
					// il n'est peut être pas encore dans PLANMECA => on l'ajoute
					gestion_planmeca (1)
				else
					//MessageBox("ATTENTION !","Le patient a été correctement modifié dans la base "+ libelle_logiciel + ".")
					// fonction pour sélectionner le patient dans le soft
					uo_planmeca.DxSelectPatient (id,noi)
					
					// Placement de Planmeca en avant plan
					uo_planmeca.DxSetWindowPlacement(1)
				end if
			case 3
				// Suprression
				err = uo_planmeca.DxDeletePatient (id)
				if err <> 0 then
					MessageBox("ATTENTION !","Erreur N°"+string(err)+" en suppression de patient.~n~n"+message_erreur_dimaxis(err))
				else
					MessageBox("ATTENTION !","Le patient a été correctement supprimé à la base "+ libelle_logiciel + ".")
				end if
		end choose
		
		
//		if messagebox("Question ...", "Voulez-vous fermer le logiciel "+ libelle_logiciel + " (R) ?", Question!, YesNo!) = 1 then
//		// si l'utilisateur souhaite refermer le logiciel planmeca par la même occas
//			uo_planmeca.fermer_dimaxis()
//		end if
		
	end if
	// On revient dans le répertoire d'origine
	uo_planmeca.SetCurrentDirectoryA(uo_planmeca.dir_origine)

	destroy uo_planmeca
	
	close(w_patience)
else
	MessageBox("ATTENTION !","Il n'y a pas de patient dans la fiche administrative !")
end if


end subroutine

on lien_planmeca.create
this.cb_supprimer=create cb_supprimer
this.cb_utiliser=create cb_utiliser
this.p_1=create p_1
this.Control[]={this.cb_supprimer,&
this.cb_utiliser,&
this.p_1}
end on

on lien_planmeca.destroy
destroy(this.cb_supprimer)
destroy(this.cb_utiliser)
destroy(this.p_1)
end on

type cb_supprimer from commandbutton within lien_planmeca
integer x = 585
integer y = 92
integer width = 293
integer height = 80
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Supprimer"
end type

event clicked;gestion_planmeca(3)
end event

type cb_utiliser from commandbutton within lien_planmeca
integer x = 46
integer y = 92
integer width = 475
integer height = 80
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Utiliser Patient"
end type

event clicked;
gestion_planmeca(2)


end event

type p_1 from picture within lien_planmeca
integer x = 27
integer width = 869
integer height = 80
string picturename = "Logo_dimaxis.bmp"
boolean focusrectangle = false
end type

