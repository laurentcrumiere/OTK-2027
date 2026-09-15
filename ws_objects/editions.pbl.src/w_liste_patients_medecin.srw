$PBExportHeader$w_liste_patients_medecin.srw
$PBExportComments$Héritée de liste_patients
forward
global type w_liste_patients_medecin from w_liste_patients
end type
type dw_corresp from datawindow within w_liste_patients_medecin
end type
type st_1 from statictext within w_liste_patients_medecin
end type
type uo_filtre_email from uo_filtre_emails within w_liste_patients_medecin
end type
end forward

global type w_liste_patients_medecin from w_liste_patients
string title = "Liste des Patients d~'un Autre Correspondant"
dw_corresp dw_corresp
st_1 st_1
uo_filtre_email uo_filtre_email
end type
global w_liste_patients_medecin w_liste_patients_medecin

forward prototypes
public subroutine prepa ()
end prototypes

public subroutine prepa ();string pra_min,pra_max,cor
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

	cor = dw_corresp.getitemstring(dw_corresp.getrow(),"code")
	open(w_patience)
	dw_liste.retrieve(code_min,code_max,pra_min,pra_max,cor)
	close(w_patience)

	//em_nb.text = string(dw_liste.rowcount())+" Dossiers"
	//em_nb.visible = true

end if

end subroutine

event open;call super::open;dw_corresp.settransobject(SQLCA)
dw_corresp.retrieve() 
uo_filtre_email.dw_liste = dw_liste
uo_filtre_email.em_statut_mere = em_nb



end event

on w_liste_patients_medecin.create
int iCurrent
call super::create
this.dw_corresp=create dw_corresp
this.st_1=create st_1
this.uo_filtre_email=create uo_filtre_email
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_corresp
this.Control[iCurrent+2]=this.st_1
this.Control[iCurrent+3]=this.uo_filtre_email
end on

on w_liste_patients_medecin.destroy
call super::destroy
destroy(this.dw_corresp)
destroy(this.st_1)
destroy(this.uo_filtre_email)
end on

type p_fond from w_liste_patients`p_fond within w_liste_patients_medecin
end type

type cb_imprimer from w_liste_patients`cb_imprimer within w_liste_patients_medecin
integer x = 2217
end type

type cb_autre from w_liste_patients`cb_autre within w_liste_patients_medecin
integer x = 1774
end type

type cb_fermer from w_liste_patients`cb_fermer within w_liste_patients_medecin
integer x = 2661
end type

type cb_ecran from w_liste_patients`cb_ecran within w_liste_patients_medecin
integer x = 562
end type

type cb_lien_word from w_liste_patients`cb_lien_word within w_liste_patients_medecin
end type

type uo_size from w_liste_patients`uo_size within w_liste_patients_medecin
end type

type rb_un from w_liste_patients`rb_un within w_liste_patients_medecin
end type

type rb_tous from w_liste_patients`rb_tous within w_liste_patients_medecin
end type

type em_nb from w_liste_patients`em_nb within w_liste_patients_medecin
end type

type em_max from w_liste_patients`em_max within w_liste_patients_medecin
end type

type em_min from w_liste_patients`em_min within w_liste_patients_medecin
end type

type dw_1 from w_liste_patients`dw_1 within w_liste_patients_medecin
end type

type gb_1 from w_liste_patients`gb_1 within w_liste_patients_medecin
end type

type dw_prati from w_liste_patients`dw_prati within w_liste_patients_medecin
end type

type cbx_filtre from w_liste_patients`cbx_filtre within w_liste_patients_medecin
end type

type st_min from w_liste_patients`st_min within w_liste_patients_medecin
end type

type st_max from w_liste_patients`st_max within w_liste_patients_medecin
end type

type dw_liste from w_liste_patients`dw_liste within w_liste_patients_medecin
string dataobject = "dw_liste_patients_medecin_edition"
end type

type dw_corresp from datawindow within w_liste_patients_medecin
string tag = "position brush"
integer x = 1138
integer y = 864
integer width = 1097
integer height = 80
integer taborder = 60
string dataobject = "dw_cherche_corresp"
boolean border = false
end type

type st_1 from statictext within w_liste_patients_medecin
integer x = 402
integer y = 872
integer width = 713
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
string facename = "Arial"
long backcolor = 553648127
string text = "Autre Correspondant :"
alignment alignment = center!
end type

type uo_filtre_email from uo_filtre_emails within w_liste_patients_medecin
string tag = "no resize all"
integer x = 1006
integer y = 1856
integer taborder = 150
boolean bringtotop = true
end type

on uo_filtre_email.destroy
call uo_filtre_emails::destroy
end on

