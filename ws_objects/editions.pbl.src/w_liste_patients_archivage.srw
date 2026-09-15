$PBExportHeader$w_liste_patients_archivage.srw
$PBExportComments$Héritée de liste_patients
forward
global type w_liste_patients_archivage from w_liste_patients
end type
type st_4 from statictext within w_liste_patients_archivage
end type
type sle_archivage from singlelineedit within w_liste_patients_archivage
end type
type st_nom from statictext within w_liste_patients_archivage
end type
end forward

global type w_liste_patients_archivage from w_liste_patients
string title = "Liste des Patients selon l~'Archivage"
st_4 st_4
sle_archivage sle_archivage
st_nom st_nom
end type
global w_liste_patients_archivage w_liste_patients_archivage

forward prototypes
public subroutine prepa ()
end prototypes

public subroutine prepa ();string pra_min,pra_max
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
	
	open(w_patience)
	dw_liste.retrieve(code_min,code_max,pra_min,pra_max,sle_archivage.text)
	close(w_patience)

	//em_nb.text = string(dw_liste.rowcount())+" Dossiers"
	//em_nb.visible = true

end if

end subroutine

on w_liste_patients_archivage.create
int iCurrent
call super::create
this.st_4=create st_4
this.sle_archivage=create sle_archivage
this.st_nom=create st_nom
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.st_4
this.Control[iCurrent+2]=this.sle_archivage
this.Control[iCurrent+3]=this.st_nom
end on

on w_liste_patients_archivage.destroy
call super::destroy
destroy(this.st_4)
destroy(this.sle_archivage)
destroy(this.st_nom)
end on

event open;call super::open;
em_max.text = '999999999' 


end event

type p_fond from w_liste_patients`p_fond within w_liste_patients_archivage
end type

type cb_imprimer from w_liste_patients`cb_imprimer within w_liste_patients_archivage
integer x = 2181
integer taborder = 80
end type

type cb_autre from w_liste_patients`cb_autre within w_liste_patients_archivage
integer x = 1746
end type

type cb_fermer from w_liste_patients`cb_fermer within w_liste_patients_archivage
integer x = 2615
integer taborder = 90
end type

type cb_ecran from w_liste_patients`cb_ecran within w_liste_patients_archivage
integer x = 553
integer taborder = 100
end type

type cb_lien_word from w_liste_patients`cb_lien_word within w_liste_patients_archivage
end type

type uo_size from w_liste_patients`uo_size within w_liste_patients_archivage
end type

type rb_un from w_liste_patients`rb_un within w_liste_patients_archivage
end type

type rb_tous from w_liste_patients`rb_tous within w_liste_patients_archivage
end type

type em_nb from w_liste_patients`em_nb within w_liste_patients_archivage
end type

type em_max from w_liste_patients`em_max within w_liste_patients_archivage
end type

type em_min from w_liste_patients`em_min within w_liste_patients_archivage
end type

type dw_1 from w_liste_patients`dw_1 within w_liste_patients_archivage
end type

type gb_1 from w_liste_patients`gb_1 within w_liste_patients_archivage
end type

type dw_prati from w_liste_patients`dw_prati within w_liste_patients_archivage
end type

type cbx_filtre from w_liste_patients`cbx_filtre within w_liste_patients_archivage
end type

type st_min from w_liste_patients`st_min within w_liste_patients_archivage
end type

type st_max from w_liste_patients`st_max within w_liste_patients_archivage
end type

type dw_liste from w_liste_patients`dw_liste within w_liste_patients_archivage
string dataobject = "dw_liste_patients_archivage"
end type

type st_4 from statictext within w_liste_patients_archivage
integer x = 343
integer y = 828
integer width = 370
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
string facename = "Arial"
long backcolor = 553648127
string text = "Archivage :"
end type

type sle_archivage from singlelineedit within w_liste_patients_archivage
integer x = 704
integer y = 820
integer width = 850
integer height = 96
integer taborder = 31
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
integer limit = 20
borderstyle borderstyle = stylelowered!
end type

type st_nom from statictext within w_liste_patients_archivage
integer x = 709
integer y = 936
integer width = 1975
integer height = 64
boolean bringtotop = true
integer textsize = -10
fontcharset fontcharset = ansi!
string facename = "Arial"
boolean italic = true
long textcolor = 16711680
long backcolor = 553648127
string text = "Vous pouvez utiliser le caractère % comme générique (y compris à la fin)"
end type

