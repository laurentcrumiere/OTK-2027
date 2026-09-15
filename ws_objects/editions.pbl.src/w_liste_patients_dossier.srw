$PBExportHeader$w_liste_patients_dossier.srw
$PBExportComments$Héritée de liste_patients
forward
global type w_liste_patients_dossier from w_liste_patients
end type
type dw_dossier from datawindow within w_liste_patients_dossier
end type
type st_1 from statictext within w_liste_patients_dossier
end type
type uo_filtre_email from uo_filtre_emails within w_liste_patients_dossier
end type
type em_date1 from editmask within w_liste_patients_dossier
end type
type st_2 from statictext within w_liste_patients_dossier
end type
end forward

global type w_liste_patients_dossier from w_liste_patients
string title = "Liste des Patients d~'un Type de Dossier"
dw_dossier dw_dossier
st_1 st_1
uo_filtre_email uo_filtre_email
em_date1 em_date1
st_2 st_2
end type
global w_liste_patients_dossier w_liste_patients_dossier

forward prototypes
public subroutine prepa ()
end prototypes

public subroutine prepa ();string pra_min,pra_max,dos
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

	dos = dw_dossier.getitemstring(dw_dossier.getrow(),"code")


	dw_liste.object.t_date_reference.text = "Date de référence : " + em_date1.text
	
	open(w_patience)
	
	maj_type_dossier_temporaire(date(em_date1.text))
	dw_liste.retrieve(code_min,code_max,pra_min,pra_max,dos)
	
	close(w_patience)

	//em_nb.text = string(dw_liste.rowcount())+" Dossiers"
	//em_nb.visible = true

end if

end subroutine

event open;call super::open;dw_dossier.settransobject(SQLCA)
dw_dossier.retrieve() 
uo_filtre_email.dw_liste = dw_liste
uo_filtre_email.em_statut_mere = em_nb


em_date1.text = string(today())
end event

on w_liste_patients_dossier.create
int iCurrent
call super::create
this.dw_dossier=create dw_dossier
this.st_1=create st_1
this.uo_filtre_email=create uo_filtre_email
this.em_date1=create em_date1
this.st_2=create st_2
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_dossier
this.Control[iCurrent+2]=this.st_1
this.Control[iCurrent+3]=this.uo_filtre_email
this.Control[iCurrent+4]=this.em_date1
this.Control[iCurrent+5]=this.st_2
end on

on w_liste_patients_dossier.destroy
call super::destroy
destroy(this.dw_dossier)
destroy(this.st_1)
destroy(this.uo_filtre_email)
destroy(this.em_date1)
destroy(this.st_2)
end on

type p_fond from w_liste_patients`p_fond within w_liste_patients_dossier
end type

type cb_imprimer from w_liste_patients`cb_imprimer within w_liste_patients_dossier
integer x = 2199
integer taborder = 80
end type

type cb_autre from w_liste_patients`cb_autre within w_liste_patients_dossier
integer x = 1760
end type

type cb_fermer from w_liste_patients`cb_fermer within w_liste_patients_dossier
integer x = 2638
integer taborder = 90
end type

type cb_ecran from w_liste_patients`cb_ecran within w_liste_patients_dossier
integer x = 517
integer taborder = 100
end type

type cb_lien_word from w_liste_patients`cb_lien_word within w_liste_patients_dossier
end type

type uo_size from w_liste_patients`uo_size within w_liste_patients_dossier
end type

type rb_un from w_liste_patients`rb_un within w_liste_patients_dossier
end type

type rb_tous from w_liste_patients`rb_tous within w_liste_patients_dossier
end type

type em_nb from w_liste_patients`em_nb within w_liste_patients_dossier
end type

type em_max from w_liste_patients`em_max within w_liste_patients_dossier
end type

type em_min from w_liste_patients`em_min within w_liste_patients_dossier
end type

type dw_1 from w_liste_patients`dw_1 within w_liste_patients_dossier
end type

type gb_1 from w_liste_patients`gb_1 within w_liste_patients_dossier
end type

type dw_prati from w_liste_patients`dw_prati within w_liste_patients_dossier
end type

type cbx_filtre from w_liste_patients`cbx_filtre within w_liste_patients_dossier
end type

type st_min from w_liste_patients`st_min within w_liste_patients_dossier
end type

type st_max from w_liste_patients`st_max within w_liste_patients_dossier
end type

type dw_liste from w_liste_patients`dw_liste within w_liste_patients_dossier
string dataobject = "dw_liste_patients_dossier_edition"
end type

type dw_dossier from datawindow within w_liste_patients_dossier
string tag = "position brush"
integer x = 873
integer y = 864
integer width = 937
integer height = 76
integer taborder = 70
string dataobject = "dw_cherche_dossier"
boolean border = false
end type

type st_1 from statictext within w_liste_patients_dossier
integer x = 343
integer y = 872
integer width = 517
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 553648127
string text = "Type de Dossier :"
end type

type uo_filtre_email from uo_filtre_emails within w_liste_patients_dossier
string tag = "no resize all"
integer x = 997
integer y = 1856
integer taborder = 150
boolean bringtotop = true
end type

on uo_filtre_email.destroy
call uo_filtre_emails::destroy
end on

type em_date1 from editmask within w_liste_patients_dossier
integer x = 937
integer y = 1080
integer width = 416
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
string text = "none"
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "dd/mm/yyyy"
boolean spin = true
end type

type st_2 from statictext within w_liste_patients_dossier
integer x = 352
integer y = 1096
integer width = 590
integer height = 68
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
string facename = "Arial"
long backcolor = 553648127
string text = "Date de référence : "
end type

