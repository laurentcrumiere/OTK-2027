$PBExportHeader$lien_dolphin.sru
forward
global type lien_dolphin from userobject
end type
type cb_lancer from commandbutton within lien_dolphin
end type
type st_1 from statictext within lien_dolphin
end type
type cb_supprimer from commandbutton within lien_dolphin
end type
type cb_modifier from commandbutton within lien_dolphin
end type
type p_1 from picture within lien_dolphin
end type
type cb_ajouter from commandbutton within lien_dolphin
end type
end forward

global type lien_dolphin from userobject
integer width = 1207
integer height = 200
long backcolor = 16777215
string text = "none"
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
cb_lancer cb_lancer
st_1 st_1
cb_supprimer cb_supprimer
cb_modifier cb_modifier
p_1 p_1
cb_ajouter cb_ajouter
end type
global lien_dolphin lien_dolphin

type prototypes

end prototypes

type variables

// Contient les infos du patient
datawindow dw_patient

string rep_installation 


end variables

forward prototypes
public subroutine gestion_dolphin (integer action)
end prototypes

public subroutine gestion_dolphin (integer action);// Paramètre :
//-------------------
//    1 = Ajout d'un patient
//    2 = Modification d'un patient
//    3 = Suppression d'un patient
//    4 = Lancement de Dolphin avec le patientt


if dw_patient.rowcount() > 0 then

	integer err

	
	string rep 
	rep = profilestring(dir_ini+"orthokis.ini","dolphin","dir","c:\dolphin\")
	
	string doldb 
	string dolctrl 

	
	doldb = rep + "doldb.exe"
	dolctrl = rep + "dolctrl.exe"
	
	string commande 
	
	
	if fileexists(doldb) and fileexists(dolctrl) then
		
		// Récupération des infos du patient 
		// et ecriture dans le fichier dolphin.txt
		
		string fichier 
		fichier = dir_ini + "dolphin.txt"
		
		string code_prati, nom_prati, code_patient

		if not fileExists(fichier) then
			long numFile
			NumFile = FileOpen(fichier, LineMode!, Write!, LockWrite!, Replace!)
			FileWrite(NumFile, "Fichier de liaison Orthokis -> Dolphin")
			fileClose(NumFile)
		end if
		
		code_patient = string(dw_patient.getitemnumber (dw_patient.getrow() ,"numero_dossier"))
		setprofilestring(fichier,"PATIENT INFO","PatientID", code_patient)
		setprofilestring(fichier,"PATIENT INFO","LastName", dw_patient.getitemstring (dw_patient.getrow() ,"nom"))
		setprofilestring(fichier,"PATIENT INFO","FirstName",  dw_patient.getitemstring (dw_patient.getrow() ,"prenom"))
		setprofilestring(fichier,"PATIENT INFO","BirthDate", string(dw_patient.getitemdate (dw_patient.getrow() ,"date_naissance"), "mm-dd-yyyy"))
		if dw_patient.getitemstring (dw_patient.getrow() ,"sexe") = 'M' then
			setprofilestring(fichier,"PATIENT INFO","Gender", "0")
		else
			setprofilestring(fichier,"PATIENT INFO","Gender", "1")
		end if
		setprofilestring(fichier,"PATIENT INFO","NickName",  dw_patient.getitemstring (dw_patient.getrow() ,"prenom"))
	
	
		choose case action
			case 1
				// Ajout
				commande = doldb + " AddPatient -f"+fichier+ " -e"
				runwait(commande,1)
				Messagebox("ATTENTION !","Si vous n'avez pas eu d'autre message, c'est que l'ajout a été effectuée !")
			case 2
				// Modif
				commande = doldb + " UpdatePatient -i"+code_patient +" -f"+fichier+ " -e"
				runwait(commande,1)
				Messagebox("ATTENTION !","Si vous n'avez pas eu d'autre message, c'est que la modification a été effectuée !")
				
			case 3
				If Messagebox("DEMANDE DE CONFIRMATION","Souhaitez-vous réellement supprimer le dossier Dolphin de ce patient ?",Question!, YesNo!,2) = 1 then 
					// Suprresion
					commande = doldb + " DeletePatient -i"+code_patient+ " -e"
					runwait(commande,1)
					Messagebox("ATTENTION !","Si vous n'avez pas eu d'autre message, c'est que la suppression a été effectuée !")
				else
					Messagebox("INFORMATION","La suppression n'a pas été effectuée.")
				end if
			case 4
				// Lancement
				commande = dolctrl +" "+ code_patient
				runwait(commande,1)
		end choose
		
	else
		MessageBox("ATTENTION !","Impossible de localiser le fichier DOLDB.EXE et/ou DOLCTRL.EXE. ~n~nLiaison impossible !")
	
	end if
	// On revient dans le répertoire d'origine
//	uo_planmeca.SetCurrentDirectoryA(uo_planmeca.dir_origine)
//
//	destroy uo_planmeca
else
	MessageBox("ATTENTION !","Il n'y a pas de patient dans la fiche administrative !")
end if


end subroutine

on lien_dolphin.create
this.cb_lancer=create cb_lancer
this.st_1=create st_1
this.cb_supprimer=create cb_supprimer
this.cb_modifier=create cb_modifier
this.p_1=create p_1
this.cb_ajouter=create cb_ajouter
this.Control[]={this.cb_lancer,&
this.st_1,&
this.cb_supprimer,&
this.cb_modifier,&
this.p_1,&
this.cb_ajouter}
end on

on lien_dolphin.destroy
destroy(this.cb_lancer)
destroy(this.st_1)
destroy(this.cb_supprimer)
destroy(this.cb_modifier)
destroy(this.p_1)
destroy(this.cb_ajouter)
end on

event constructor;
rep_installation = dir_ini

end event

type cb_lancer from commandbutton within lien_dolphin
integer x = 896
integer y = 96
integer width = 279
integer height = 80
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Lancer"
end type

event clicked;gestion_dolphin(4)
end event

type st_1 from statictext within lien_dolphin
integer x = 315
integer width = 640
integer height = 76
integer textsize = -12
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 16711680
long backcolor = 16777215
string text = "Dolphin Imaging"
alignment alignment = center!
boolean focusrectangle = false
end type

type cb_supprimer from commandbutton within lien_dolphin
integer x = 608
integer y = 96
integer width = 279
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

event clicked;gestion_dolphin(3)
end event

type cb_modifier from commandbutton within lien_dolphin
integer x = 320
integer y = 96
integer width = 279
integer height = 80
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Modifier"
end type

event clicked;gestion_dolphin(2)
end event

type p_1 from picture within lien_dolphin
integer width = 165
integer height = 136
string picturename = "dolphin.bmp"
boolean focusrectangle = false
end type

type cb_ajouter from commandbutton within lien_dolphin
integer x = 32
integer y = 100
integer width = 279
integer height = 80
integer taborder = 10
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Ajouter"
end type

event clicked;	

gestion_dolphin(1)
end event

