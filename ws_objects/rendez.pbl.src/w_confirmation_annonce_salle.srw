$PBExportHeader$w_confirmation_annonce_salle.srw
$PBExportComments$Héritée de rdv_planning
forward
global type w_confirmation_annonce_salle from w_fenetre_arakis
end type
type pb_1 from uo_picturebutton_390x120 within w_confirmation_annonce_salle
end type
type dw_file from datawindow within w_confirmation_annonce_salle
end type
type mle_texte from multilineedit within w_confirmation_annonce_salle
end type
type st_3 from statictext within w_confirmation_annonce_salle
end type
type em_numero from editmask within w_confirmation_annonce_salle
end type
type ddlb_message from dropdownlistbox within w_confirmation_annonce_salle
end type
type st_1 from statictext within w_confirmation_annonce_salle
end type
type cb_confirmer from uo_picturebutton_390x120 within w_confirmation_annonce_salle
end type
type cb_annuler from uo_picturebutton_390x120 within w_confirmation_annonce_salle
end type
type st_2 from statictext within w_confirmation_annonce_salle
end type
type em_nombre from editmask within w_confirmation_annonce_salle
end type
type cbx_toutes_salles from checkbox within w_confirmation_annonce_salle
end type
type gb_1 from groupbox within w_confirmation_annonce_salle
end type
end forward

global type w_confirmation_annonce_salle from w_fenetre_arakis
integer width = 3058
integer height = 1080
string title = "Confirmation d~'Annonce en Salle d~'Attente"
windowtype windowtype = response!
boolean center = true
pb_1 pb_1
dw_file dw_file
mle_texte mle_texte
st_3 st_3
em_numero em_numero
ddlb_message ddlb_message
st_1 st_1
cb_confirmer cb_confirmer
cb_annuler cb_annuler
st_2 st_2
em_nombre em_nombre
cbx_toutes_salles cbx_toutes_salles
gb_1 gb_1
end type
global w_confirmation_annonce_salle w_confirmation_annonce_salle

type variables

// patient courant
double var_code_local


end variables

forward prototypes
public subroutine remplace_champs (ref string texte, string nom_champ, string valeur_champ)
end prototypes

public subroutine remplace_champs (ref string texte, string nom_champ, string valeur_champ);

// remplace le nom d'un champ par sa valeur dans une string

integer pos


	// On remplace les champs successifs
	pos =  pos (texte, nom_champ) 
	do while pos > 0 
		texte  = replace ( texte , pos , len (nom_champ) , valeur_champ)
		pos =  pos (texte , nom_champ) 
	loop

end subroutine

on w_confirmation_annonce_salle.create
int iCurrent
call super::create
this.pb_1=create pb_1
this.dw_file=create dw_file
this.mle_texte=create mle_texte
this.st_3=create st_3
this.em_numero=create em_numero
this.ddlb_message=create ddlb_message
this.st_1=create st_1
this.cb_confirmer=create cb_confirmer
this.cb_annuler=create cb_annuler
this.st_2=create st_2
this.em_nombre=create em_nombre
this.cbx_toutes_salles=create cbx_toutes_salles
this.gb_1=create gb_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.pb_1
this.Control[iCurrent+2]=this.dw_file
this.Control[iCurrent+3]=this.mle_texte
this.Control[iCurrent+4]=this.st_3
this.Control[iCurrent+5]=this.em_numero
this.Control[iCurrent+6]=this.ddlb_message
this.Control[iCurrent+7]=this.st_1
this.Control[iCurrent+8]=this.cb_confirmer
this.Control[iCurrent+9]=this.cb_annuler
this.Control[iCurrent+10]=this.st_2
this.Control[iCurrent+11]=this.em_nombre
this.Control[iCurrent+12]=this.cbx_toutes_salles
this.Control[iCurrent+13]=this.gb_1
end on

on w_confirmation_annonce_salle.destroy
call super::destroy
destroy(this.pb_1)
destroy(this.dw_file)
destroy(this.mle_texte)
destroy(this.st_3)
destroy(this.em_numero)
destroy(this.ddlb_message)
destroy(this.st_1)
destroy(this.cb_confirmer)
destroy(this.cb_annuler)
destroy(this.st_2)
destroy(this.em_nombre)
destroy(this.cbx_toutes_salles)
destroy(this.gb_1)
end on

event open;backcolor = couleur_fond_fenetre


// récupération du code du patient courant


var_code_local = message.doubleparm


string nom_patient, prenom_patient, titre_patient, nom_praticien

// recherche des éléments dans les tables
select isnull(patient.nom,''), isnull(patient.prenom,''), isnull( (select nom from titre_personnes where patient.titre_patient = titre_personnes.code),'') , isnull(prati.nom ,'') 
into :nom_patient, :prenom_patient, :titre_patient, :nom_praticien 
from patient, prati 
where patient.code = :var_code_local and patient.code_praticien = prati.code ;


// Lecture de la table des messages pour construire la liste déroulante paramétrée


DECLARE cur CURSOR FOR SELECT texte from messages_annonces order by ordre_trie, texte ;


open cur ;

string texte_brut 
int pos

fetch cur into :texte_brut ;


do while sqlca.sqlcode = 0 


	// On remplace les champs successifs
	remplace_champs(texte_brut , "{prenom}", prenom_patient )
	remplace_champs(texte_brut , "{nom}", nom_patient )
	remplace_champs(texte_brut , "{nom_praticien}", nom_praticien )
	remplace_champs(texte_brut , "{titre}", titre_patient )
	

	// Ajout de l'élément à la ddlb
	
	texte_brut = trim(texte_brut)
	ddlb_message.additem(texte_brut)

	fetch cur into :texte_brut ;

loop


close cur ;


if ddlb_message.totalitems() = 0 then
	Messagebox("ATTENTION !","Vous n'avez paramétré aucun message !~n~nVous devez d'abord saisir des messages d'annonces (cf. Menu Tables) !")
else
	
	// reprise des valeurs par défaut du orthokis.ini
	integer num_message, nombre_message
	
	num_message = profileInt(dir_ini+inifile_orthokis,"ANNONCE_SALLE_ATTENTE","dernier_message",1)
	nombre_message = profileInt(dir_ini+inifile_orthokis,"ANNONCE_SALLE_ATTENTE","dernier_nombre",1)
	if num_message > ddlb_message.totalitems() then
		num_message = 1
	else
		ddlb_message.Selectitem(num_message)
	end if

	integer num_salle 
	
	num_salle = profileInt(dir_ini+inifile_orthokis,"ANNONCE_SALLE_ATTENTE","derniere_salle",1)
	em_numero.text = string(num_salle)
	em_nombre.text = string(nombre_message)

	if profilestring(dir_ini+inifile_orthokis,"ANNONCE_SALLE_ATTENTE","toutes_salles","N") = "O" then
		cbx_toutes_salles.checked = true
	end if

	
	mle_texte.text = ddlb_message.text 
end if


end event

type p_fond from w_fenetre_arakis`p_fond within w_confirmation_annonce_salle
integer x = 2496
integer y = 796
end type

type pb_1 from uo_picturebutton_390x120 within w_confirmation_annonce_salle
integer x = 526
integer y = 796
integer width = 530
integer height = 152
integer taborder = 30
string text = "&Voir File"
string iconname = "ACTIONS_word_apercu.png"
end type

event clicked;call super::clicked;


this.enabled = false
parent.height = 2150

dw_file.settransobject(sqlca)
dw_file.retrieve()


centrer(parent)
end event

type dw_file from datawindow within w_confirmation_annonce_salle
integer x = 14
integer y = 988
integer width = 2985
integer height = 1052
integer taborder = 30
string title = "none"
string dataobject = "dw_file_attente_message"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
end type

type mle_texte from multilineedit within w_confirmation_annonce_salle
integer x = 87
integer y = 252
integer width = 2857
integer height = 316
integer taborder = 40
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

type st_3 from statictext within w_confirmation_annonce_salle
integer x = 73
integer y = 660
integer width = 649
integer height = 64
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
string facename = "Arial"
long backcolor = 553648127
string text = "N° de Salle d~'Attente :"
end type

type em_numero from editmask within w_confirmation_annonce_salle
integer x = 736
integer y = 644
integer width = 270
integer height = 96
integer taborder = 40
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
string mask = "##"
boolean spin = true
end type

type ddlb_message from dropdownlistbox within w_confirmation_annonce_salle
integer x = 87
integer y = 120
integer width = 2857
integer height = 776
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 134217731
boolean vscrollbar = true
string item[] = {""}
borderstyle borderstyle = stylelowered!
end type

event selectionchanged;

// mise à jour du mle

mle_texte.text = this.text
end event

type st_1 from statictext within w_confirmation_annonce_salle
integer x = 87
integer y = 28
integer width = 1755
integer height = 68
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
string facename = "Arial"
boolean underline = true
long backcolor = 553648127
string text = "Emission du message suivant en salle d~'attente : "
end type

type cb_confirmer from uo_picturebutton_390x120 within w_confirmation_annonce_salle
integer x = 1769
integer y = 796
integer width = 530
integer height = 152
integer taborder = 20
string text = "&Confirmer"
boolean default = true
string iconname = "ACTIONS_valider.png"
end type

event clicked;call super::clicked;


// Ajout du message sélectionné dans la liste des messages


integer num, nb, cpt
string texte

integer salle_debut, salle_fin, cpt_salle

num = integer ( em_numero.text)
nb = integer ( em_nombre.text)

if cbx_toutes_salles.checked then
	
	salle_debut = 1
	salle_fin = num
	
else
	
	salle_debut = num
	salle_fin = num
	
end if
	
texte = mle_texte.text

for cpt = 1 to nb 
	for cpt_salle = salle_debut to salle_fin 
		  INSERT INTO "file_attente_annonces"   (  "texte",     "numero_salle"  )    VALUES (  :texte ,             :cpt_salle )  ;
//		  if nb > 1 then
//			sleep(1000)	// pour espacer les envois si ordi trop rapide !
//		end if
	next
next
			  
if sqlca.sqlcode = 0 then
	commit ;
	
	// Memorisation du N° de salle d'attente et du N° de message pour la next time
	Setprofilestring(dir_ini+inifile_orthokis,"ANNONCE_SALLE_ATTENTE","dernier_message",string(ddlb_message.FindItem(ddlb_message.text,1)))
	Setprofilestring(dir_ini+inifile_orthokis,"ANNONCE_SALLE_ATTENTE","derniere_salle",em_numero.text)
	Setprofilestring(dir_ini+inifile_orthokis,"ANNONCE_SALLE_ATTENTE","dernier_nombre",em_nombre.text)
	if cbx_toutes_salles.checked then
		Setprofilestring(dir_ini+inifile_orthokis,"ANNONCE_SALLE_ATTENTE","toutes_salles","O")
	else
		Setprofilestring(dir_ini+inifile_orthokis,"ANNONCE_SALLE_ATTENTE","toutes_salles","N")
	end if

	
	

else
	rollback ;
	Messagebox("ERREUR", "Problème dans l'envoi de l'Annonce en Salle d'Attente !~n~nL'Annnonce n'a pas été faîte !")
end if

close(parent)
end event

type cb_annuler from uo_picturebutton_390x120 within w_confirmation_annonce_salle
integer x = 1152
integer y = 796
integer width = 530
integer height = 152
integer taborder = 10
string text = "&Annuler"
string iconname = "ACTIONS_abandonner"
end type

event clicked;call super::clicked;close(parent)
end event

type st_2 from statictext within w_confirmation_annonce_salle
integer x = 2149
integer y = 660
integer width = 517
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
string facename = "Arial"
long backcolor = 553648127
string text = "Nb de Messages :"
end type

type em_nombre from editmask within w_confirmation_annonce_salle
integer x = 2674
integer y = 644
integer width = 270
integer height = 96
integer taborder = 50
boolean bringtotop = true
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
string mask = "##"
boolean spin = true
end type

type cbx_toutes_salles from checkbox within w_confirmation_annonce_salle
integer x = 1079
integer y = 644
integer width = 974
integer height = 112
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 553648127
string text = "A toutes les salles précédentes"
end type

type gb_1 from groupbox within w_confirmation_annonce_salle
integer x = 1033
integer y = 580
integer width = 1074
integer height = 192
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 16777215
string text = "Envoi du message"
end type

