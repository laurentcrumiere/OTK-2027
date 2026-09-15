$PBExportHeader$w_liste_patients_rdv_sans_commentaire.srw
$PBExportComments$Héritée de liste_patients
forward
global type w_liste_patients_rdv_sans_commentaire from w_liste_patients
end type
type st_1 from statictext within w_liste_patients_rdv_sans_commentaire
end type
type st_2 from statictext within w_liste_patients_rdv_sans_commentaire
end type
type st_3 from statictext within w_liste_patients_rdv_sans_commentaire
end type
type em_date_min from uo_date_calendrier within w_liste_patients_rdv_sans_commentaire
end type
type em_date_max from uo_date_calendrier within w_liste_patients_rdv_sans_commentaire
end type
type dw_liste_prepa from datawindow within w_liste_patients_rdv_sans_commentaire
end type
end forward

global type w_liste_patients_rdv_sans_commentaire from w_liste_patients
string title = "Liste des Rendez-vous sans Commentaire Clinique"
st_1 st_1
st_2 st_2
st_3 st_3
em_date_min em_date_min
em_date_max em_date_max
dw_liste_prepa dw_liste_prepa
end type
global w_liste_patients_rdv_sans_commentaire w_liste_patients_rdv_sans_commentaire

type variables

string v_titre_general
string v_filtre
string v_type_liste 
end variables

forward prototypes
public subroutine prepa ()
end prototypes

public subroutine prepa ();string pra_min,pra_max,typ,tit,p
double code_min,code_max
date date_min,date_max

if not prepa_faite then
	//prepa_faite = true
	if rb_tous.checked then
		pra_min="      "
		pra_max="ZZZZZZ"
		tit = "Pour tous les praticiens"
	else
		pra_min=dw_prati.getitemstring(dw_prati.getrow(),"code")
		pra_max=dw_prati.getitemstring(dw_prati.getrow(),"code")
		SELECT nom INTO :p FROM prati WHERE code = :pra_min ;
		tit = "Pour le Dr "+p
	end if

	code_min = double(em_min.text)
	code_max = double(em_max.text)

	date_min = date(em_date_min.text)
	date_max = date(em_date_max.text)


	
	tit = tit + " Entre le "+em_date_min.text+" et le "+em_date_max.text
	
	// Liste préparatoire 
	dw_liste_prepa.retrieve(code_min,code_max,pra_min,pra_max,date_min,date_max)
	dw_liste_prepa.SetFilter(v_filtre)
	dw_liste_prepa.filter()

	open(w_patience)
	dw_liste.reset()
	dw_liste_prepa.RowsCopy(1, dw_liste_prepa.rowcount() , Primary! , dw_liste , 999999, Primary! )

	dw_liste.Modify("titre.text = '"+tit+"'")
	dw_liste.Modify("titre_general.text = '"+v_titre_general+"'")
	close(w_patience)

	//em_nb.text = string(dw_liste.rowcount())+" Rendez-vous"
	//em_nb.visible = true


end if

end subroutine

event open;//  ATTENTION 
// A cause du passage de paramètre on est obligé de surcharge de scripti ancètre !!!
// --------------------------------------------------------------------------------------------------


// En paramètres :
// C : sans commentaires cliniques
// T : sans Traçabilité
// S : sans Stérilisation

if UI_V2020 then
	str_param_string param
	param = message.PowerObjectParm
	v_type_liste =  param.param
else
	v_type_liste = message.StringParm
end if




choose case v_type_liste
	case "C" 
		v_titre_general = "Rendez-vous sans Commentaire Clinique"
		v_filtre = "nb_commentaire = 0"
	case "S"
		v_titre_general = "Rendez-vous sans saisie de Stérilisation"
		v_filtre = "nb_sterilisation = 0"
	case "T"
		v_titre_general = "Rendez-vous sans saisie de Traçabilité"
		v_filtre = "nb_tracabilite = 0"
	case "A"
		v_titre_general = "Rendez-vous sans Acte Prévu"
		v_filtre = "nb_acte_prevu = 0"
end choose
		


open(w_patience)

SELECT min(numero_dossier), max(numero_dossier),count(*) INTO :min, :max,:max_row 
FROM patient WHERE numero_dossier < 100000000 ;

em_max.text = string(max)

increment = integer(max_row / 10)

dw_liste.settransobject(SQLCA)

// on fera la préparation de la liste dans cette dw et on copiera ensuite dans dw_liste pour faite des power filter si besoin
dw_liste_prepa.settransobject(SQLCA)

dw_prati.settransobject(SQLCA)
dw_prati.retrieve()

if not multi then
	rb_tous.checked = false
	rb_tous.enabled = false
	rb_un.checked = true
	dw_prati.visible = true
end if

uo_size.taille(this)
prepa_faite = false


em_date_min.setDate(today())
em_date_max.setDate(today())

em_min.text = string(min)

cbx_filtre.backcolor = couleur_fond_fenetre



close(w_patience)



end event

on w_liste_patients_rdv_sans_commentaire.create
int iCurrent
call super::create
this.st_1=create st_1
this.st_2=create st_2
this.st_3=create st_3
this.em_date_min=create em_date_min
this.em_date_max=create em_date_max
this.dw_liste_prepa=create dw_liste_prepa
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.st_1
this.Control[iCurrent+2]=this.st_2
this.Control[iCurrent+3]=this.st_3
this.Control[iCurrent+4]=this.em_date_min
this.Control[iCurrent+5]=this.em_date_max
this.Control[iCurrent+6]=this.dw_liste_prepa
end on

on w_liste_patients_rdv_sans_commentaire.destroy
call super::destroy
destroy(this.st_1)
destroy(this.st_2)
destroy(this.st_3)
destroy(this.em_date_min)
destroy(this.em_date_max)
destroy(this.dw_liste_prepa)
end on

type p_fond from w_liste_patients`p_fond within w_liste_patients_rdv_sans_commentaire
end type

type cb_imprimer from w_liste_patients`cb_imprimer within w_liste_patients_rdv_sans_commentaire
end type

type cb_autre from w_liste_patients`cb_autre within w_liste_patients_rdv_sans_commentaire
end type

type cb_fermer from w_liste_patients`cb_fermer within w_liste_patients_rdv_sans_commentaire
integer taborder = 120
end type

type cb_ecran from w_liste_patients`cb_ecran within w_liste_patients_rdv_sans_commentaire
integer taborder = 130
end type

type cb_lien_word from w_liste_patients`cb_lien_word within w_liste_patients_rdv_sans_commentaire
end type

type uo_size from w_liste_patients`uo_size within w_liste_patients_rdv_sans_commentaire
end type

type rb_un from w_liste_patients`rb_un within w_liste_patients_rdv_sans_commentaire
end type

type rb_tous from w_liste_patients`rb_tous within w_liste_patients_rdv_sans_commentaire
end type

type em_nb from w_liste_patients`em_nb within w_liste_patients_rdv_sans_commentaire
integer taborder = 70
end type

type em_max from w_liste_patients`em_max within w_liste_patients_rdv_sans_commentaire
integer taborder = 30
end type

type em_min from w_liste_patients`em_min within w_liste_patients_rdv_sans_commentaire
integer taborder = 20
end type

type dw_1 from w_liste_patients`dw_1 within w_liste_patients_rdv_sans_commentaire
end type

type gb_1 from w_liste_patients`gb_1 within w_liste_patients_rdv_sans_commentaire
integer taborder = 10
end type

type dw_prati from w_liste_patients`dw_prati within w_liste_patients_rdv_sans_commentaire
integer taborder = 90
end type

type cbx_filtre from w_liste_patients`cbx_filtre within w_liste_patients_rdv_sans_commentaire
integer width = 521
end type

type st_min from w_liste_patients`st_min within w_liste_patients_rdv_sans_commentaire
end type

type st_max from w_liste_patients`st_max within w_liste_patients_rdv_sans_commentaire
end type

type dw_liste from w_liste_patients`dw_liste within w_liste_patients_rdv_sans_commentaire
integer y = 0
integer taborder = 80
string dataobject = "dw_liste_patients_rdv_sans_commentaire_edition"
end type

type st_1 from statictext within w_liste_patients_rdv_sans_commentaire
integer x = 347
integer y = 800
integer width = 901
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
string facename = "Arial"
boolean underline = true
long backcolor = 553648127
string text = "Date de rendez-vous :"
end type

type st_2 from statictext within w_liste_patients_rdv_sans_commentaire
integer x = 1413
integer y = 908
integer width = 247
integer height = 72
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
string facename = "Arial"
long backcolor = 553648127
string text = "Et le"
alignment alignment = center!
end type

type st_3 from statictext within w_liste_patients_rdv_sans_commentaire
integer x = 475
integer y = 908
integer width = 256
integer height = 72
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
string facename = "Arial"
long backcolor = 553648127
string text = "Entre le "
end type

type em_date_min from uo_date_calendrier within w_liste_patients_rdv_sans_commentaire
integer x = 905
integer y = 892
integer taborder = 220
boolean bringtotop = true
end type

on em_date_min.destroy
call uo_date_calendrier::destroy
end on

type em_date_max from uo_date_calendrier within w_liste_patients_rdv_sans_commentaire
integer x = 1719
integer y = 892
integer taborder = 230
boolean bringtotop = true
end type

on em_date_max.destroy
call uo_date_calendrier::destroy
end on

type dw_liste_prepa from datawindow within w_liste_patients_rdv_sans_commentaire
boolean visible = false
integer x = 1669
integer y = 1260
integer width = 686
integer height = 400
integer taborder = 240
boolean bringtotop = true
string title = "none"
string dataobject = "dw_liste_patients_rdv_sans_commentaire_edition"
boolean livescroll = true
end type

