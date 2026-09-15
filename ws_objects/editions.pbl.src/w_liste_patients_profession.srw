$PBExportHeader$w_liste_patients_profession.srw
$PBExportComments$Héritée de liste_patients
forward
global type w_liste_patients_profession from w_liste_patients
end type
type st_1 from statictext within w_liste_patients_profession
end type
type em_prof from editmask within w_liste_patients_profession
end type
type st_6 from statictext within w_liste_patients_profession
end type
type uo_filtre_email from uo_filtre_emails within w_liste_patients_profession
end type
end forward

global type w_liste_patients_profession from w_liste_patients
string title = "Liste des Patients d~'une Profession"
st_1 st_1
em_prof em_prof
st_6 st_6
uo_filtre_email uo_filtre_email
end type
global w_liste_patients_profession w_liste_patients_profession

forward prototypes
public subroutine prepa ()
end prototypes

public subroutine prepa ();string pra_min,pra_max,prof
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

	prof = trim(upper(em_prof.text))+"%"
	open(w_patience)
	dw_liste.retrieve(code_min,code_max,pra_min,pra_max,prof)
	close(w_patience)

	//em_nb.text = string(dw_liste.rowcount())+" Dossiers"
	//em_nb.visible = true

end if

end subroutine

on w_liste_patients_profession.create
int iCurrent
call super::create
this.st_1=create st_1
this.em_prof=create em_prof
this.st_6=create st_6
this.uo_filtre_email=create uo_filtre_email
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.st_1
this.Control[iCurrent+2]=this.em_prof
this.Control[iCurrent+3]=this.st_6
this.Control[iCurrent+4]=this.uo_filtre_email
end on

on w_liste_patients_profession.destroy
call super::destroy
destroy(this.st_1)
destroy(this.em_prof)
destroy(this.st_6)
destroy(this.uo_filtre_email)
end on

event open;call super::open;uo_filtre_email.dw_liste = dw_liste
uo_filtre_email.em_statut_mere = em_nb

end event

type p_fond from w_liste_patients`p_fond within w_liste_patients_profession
end type

type cb_imprimer from w_liste_patients`cb_imprimer within w_liste_patients_profession
integer x = 2263
integer taborder = 80
end type

type cb_autre from w_liste_patients`cb_autre within w_liste_patients_profession
integer x = 1783
end type

type cb_fermer from w_liste_patients`cb_fermer within w_liste_patients_profession
integer x = 2743
integer taborder = 90
end type

type cb_ecran from w_liste_patients`cb_ecran within w_liste_patients_profession
integer x = 553
integer taborder = 100
end type

type cb_lien_word from w_liste_patients`cb_lien_word within w_liste_patients_profession
end type

type uo_size from w_liste_patients`uo_size within w_liste_patients_profession
end type

type rb_un from w_liste_patients`rb_un within w_liste_patients_profession
end type

type rb_tous from w_liste_patients`rb_tous within w_liste_patients_profession
end type

type em_nb from w_liste_patients`em_nb within w_liste_patients_profession
end type

type em_max from w_liste_patients`em_max within w_liste_patients_profession
end type

type em_min from w_liste_patients`em_min within w_liste_patients_profession
end type

type dw_1 from w_liste_patients`dw_1 within w_liste_patients_profession
end type

type gb_1 from w_liste_patients`gb_1 within w_liste_patients_profession
end type

type dw_prati from w_liste_patients`dw_prati within w_liste_patients_profession
end type

type cbx_filtre from w_liste_patients`cbx_filtre within w_liste_patients_profession
end type

type st_min from w_liste_patients`st_min within w_liste_patients_profession
end type

type st_max from w_liste_patients`st_max within w_liste_patients_profession
end type

type dw_liste from w_liste_patients`dw_liste within w_liste_patients_profession
string dataobject = "dw_liste_patients_profession_edition"
end type

type st_1 from statictext within w_liste_patients_profession
integer x = 421
integer y = 868
integer width = 530
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
string facename = "Arial"
long backcolor = 553648127
string text = "Profession :"
alignment alignment = center!
end type

type em_prof from editmask within w_liste_patients_profession
integer x = 960
integer y = 856
integer width = 1097
integer height = 100
integer taborder = 70
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 16777215
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = stringmask!
string displaydata = ""
end type

type st_6 from statictext within w_liste_patients_profession
string tag = "a masquer"
integer x = 960
integer y = 964
integer width = 1659
integer height = 64
boolean bringtotop = true
integer textsize = -8
fontcharset fontcharset = ansi!
string facename = "Arial"
boolean italic = true
long textcolor = 16711680
long backcolor = 15780518
string text = "Vous pouvez utiliser le caractère % comme générique (y compris à la fin)"
end type

type uo_filtre_email from uo_filtre_emails within w_liste_patients_profession
string tag = "no resize all"
integer x = 1033
integer y = 1852
integer taborder = 180
boolean bringtotop = true
end type

on uo_filtre_email.destroy
call uo_filtre_emails::destroy
end on

