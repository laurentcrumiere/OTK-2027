$PBExportHeader$w_liste_patients_caisse.srw
$PBExportComments$Héritée de liste_patients
forward
global type w_liste_patients_caisse from w_liste_patients
end type
type dw_caisse from datawindow within w_liste_patients_caisse
end type
type st_1 from statictext within w_liste_patients_caisse
end type
type uo_filtre_email from uo_filtre_emails within w_liste_patients_caisse
end type
end forward

global type w_liste_patients_caisse from w_liste_patients
string title = "Liste des Patients d~'une Caisse de Sécurité Sociale"
dw_caisse dw_caisse
st_1 st_1
uo_filtre_email uo_filtre_email
end type
global w_liste_patients_caisse w_liste_patients_caisse

forward prototypes
public subroutine prepa ()
end prototypes

public subroutine prepa ();string pra_min,pra_max,cai
double code_min,code_max

if not prepa_faite then
	//prepa_faite = true
	if rb_tous.checked then
		pra_min="      "
		pra_max="ZZZZZZ"
	else
		pra_min=dw_prati.getitemstring(dw_prati.getrow(),"code")
		pra_max=dw_prati.getitemstring(dw_prati.getrow(),"code")
	end if

	code_min = double(em_min.text)
	code_max = double(em_max.text)

	cai = dw_caisse.getitemstring(dw_caisse.getrow(),"code")
	open(w_patience)
	dw_liste.retrieve(code_min,code_max,pra_min,pra_max,cai)
	close(w_patience)

	//em_nb.text = string(dw_liste.rowcount())+" Dossiers"
	//em_nb.visible = true

end if

end subroutine

event open;call super::open;dw_caisse.settransobject(SQLCA)
dw_caisse.retrieve() 
uo_filtre_email.dw_liste = dw_liste
uo_filtre_email.em_statut_mere = em_nb
end event

on w_liste_patients_caisse.create
int iCurrent
call super::create
this.dw_caisse=create dw_caisse
this.st_1=create st_1
this.uo_filtre_email=create uo_filtre_email
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_caisse
this.Control[iCurrent+2]=this.st_1
this.Control[iCurrent+3]=this.uo_filtre_email
end on

on w_liste_patients_caisse.destroy
call super::destroy
destroy(this.dw_caisse)
destroy(this.st_1)
destroy(this.uo_filtre_email)
end on

type p_fond from w_liste_patients`p_fond within w_liste_patients_caisse
end type

type cb_imprimer from w_liste_patients`cb_imprimer within w_liste_patients_caisse
integer x = 2208
end type

type cb_autre from w_liste_patients`cb_autre within w_liste_patients_caisse
integer x = 1733
integer taborder = 140
end type

type cb_fermer from w_liste_patients`cb_fermer within w_liste_patients_caisse
integer x = 2683
integer taborder = 120
end type

type cb_ecran from w_liste_patients`cb_ecran within w_liste_patients_caisse
integer x = 512
integer taborder = 130
end type

type cb_lien_word from w_liste_patients`cb_lien_word within w_liste_patients_caisse
end type

type uo_size from w_liste_patients`uo_size within w_liste_patients_caisse
integer taborder = 40
end type

type rb_un from w_liste_patients`rb_un within w_liste_patients_caisse
end type

type rb_tous from w_liste_patients`rb_tous within w_liste_patients_caisse
end type

type em_nb from w_liste_patients`em_nb within w_liste_patients_caisse
integer taborder = 50
end type

type em_max from w_liste_patients`em_max within w_liste_patients_caisse
end type

type em_min from w_liste_patients`em_min within w_liste_patients_caisse
end type

type dw_1 from w_liste_patients`dw_1 within w_liste_patients_caisse
integer taborder = 70
end type

type gb_1 from w_liste_patients`gb_1 within w_liste_patients_caisse
integer taborder = 80
end type

type dw_prati from w_liste_patients`dw_prati within w_liste_patients_caisse
integer taborder = 90
end type

type cbx_filtre from w_liste_patients`cbx_filtre within w_liste_patients_caisse
end type

type st_min from w_liste_patients`st_min within w_liste_patients_caisse
end type

type st_max from w_liste_patients`st_max within w_liste_patients_caisse
end type

type dw_liste from w_liste_patients`dw_liste within w_liste_patients_caisse
integer taborder = 60
string dataobject = "dw_liste_patients_caisse_edition"
end type

type dw_caisse from datawindow within w_liste_patients_caisse
string tag = "position brush"
integer x = 1006
integer y = 868
integer width = 1097
integer height = 72
integer taborder = 100
string dataobject = "dw_cherche_caisse"
boolean border = false
end type

type st_1 from statictext within w_liste_patients_caisse
integer x = 654
integer y = 868
integer width = 325
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
string facename = "Arial"
long backcolor = 553648127
string text = "Caisse :"
alignment alignment = center!
end type

type uo_filtre_email from uo_filtre_emails within w_liste_patients_caisse
string tag = "no resize all"
integer x = 987
integer y = 1852
integer taborder = 180
boolean bringtotop = true
end type

on uo_filtre_email.destroy
call uo_filtre_emails::destroy
end on

