$PBExportHeader$w_liste_patients_classe_type.srw
$PBExportComments$Héritée de liste_patients
forward
global type w_liste_patients_classe_type from w_liste_patients
end type
type st_gene1 from statictext within w_liste_patients_classe_type
end type
type st_clase from statictext within w_liste_patients_classe_type
end type
type st_1 from statictext within w_liste_patients_classe_type
end type
type st_2 from statictext within w_liste_patients_classe_type
end type
type dw_classe from datawindow within w_liste_patients_classe_type
end type
type dw_type from datawindow within w_liste_patients_classe_type
end type
type uo_filtre_email from uo_filtre_emails within w_liste_patients_classe_type
end type
end forward

global type w_liste_patients_classe_type from w_liste_patients
string title = "Liste des Patients d~'une Classe et/ou d~'un Type"
st_gene1 st_gene1
st_clase st_clase
st_1 st_1
st_2 st_2
dw_classe dw_classe
dw_type dw_type
uo_filtre_email uo_filtre_email
end type
global w_liste_patients_classe_type w_liste_patients_classe_type

forward prototypes
public subroutine prepa ()
end prototypes

public subroutine prepa ();string pra_min,pra_max
string v_type, v_classe
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

//	v_type = em_type.text
//	v_classe = em_classe.text
	v_type = dw_type.gettext()
	v_classe = dw_classe.gettext()

	open(w_patience)
	
	// pour éviter les zone à nulle 
	update patient set "type" = '' where "type" is null ;
	update patient set "classe" = '' where "classe" is null ;
	commit ;

	dw_liste.retrieve(code_min,code_max,pra_min,pra_max,v_type, v_classe)
	close(w_patience)

	//em_nb.text = string(dw_liste.rowcount())+" Dossiers"
	//em_nb.visible = true
end if

end subroutine

on w_liste_patients_classe_type.create
int iCurrent
call super::create
this.st_gene1=create st_gene1
this.st_clase=create st_clase
this.st_1=create st_1
this.st_2=create st_2
this.dw_classe=create dw_classe
this.dw_type=create dw_type
this.uo_filtre_email=create uo_filtre_email
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.st_gene1
this.Control[iCurrent+2]=this.st_clase
this.Control[iCurrent+3]=this.st_1
this.Control[iCurrent+4]=this.st_2
this.Control[iCurrent+5]=this.dw_classe
this.Control[iCurrent+6]=this.dw_type
this.Control[iCurrent+7]=this.uo_filtre_email
end on

on w_liste_patients_classe_type.destroy
call super::destroy
destroy(this.st_gene1)
destroy(this.st_clase)
destroy(this.st_1)
destroy(this.st_2)
destroy(this.dw_classe)
destroy(this.dw_type)
destroy(this.uo_filtre_email)
end on

event open;call super::open;

dw_classe.SetTransobject(sqlca)
dw_classe.retrieve()


dw_type.SetTransobject(sqlca)
dw_type.retrieve()


if dw_classe.rowcount() = 0 then
	dw_classe.Insertrow(0)
end if
if dw_type.rowcount() = 0 then
	dw_type.Insertrow(0)
end if


dw_classe.SetItem(1, "libelle", "%")
dw_type.SetItem(1, "libelle", "%")

uo_filtre_email.dw_liste = dw_liste
uo_filtre_email.em_statut_mere = em_nb

end event

type p_fond from w_liste_patients`p_fond within w_liste_patients_classe_type
integer x = 2674
integer y = 272
end type

type cb_imprimer from w_liste_patients`cb_imprimer within w_liste_patients_classe_type
integer x = 2199
end type

type cb_autre from w_liste_patients`cb_autre within w_liste_patients_classe_type
integer x = 1728
end type

type cb_fermer from w_liste_patients`cb_fermer within w_liste_patients_classe_type
integer x = 2670
integer taborder = 120
end type

type cb_ecran from w_liste_patients`cb_ecran within w_liste_patients_classe_type
integer x = 517
integer taborder = 130
end type

type cb_lien_word from w_liste_patients`cb_lien_word within w_liste_patients_classe_type
end type

type uo_size from w_liste_patients`uo_size within w_liste_patients_classe_type
end type

type rb_un from w_liste_patients`rb_un within w_liste_patients_classe_type
end type

type rb_tous from w_liste_patients`rb_tous within w_liste_patients_classe_type
end type

type em_nb from w_liste_patients`em_nb within w_liste_patients_classe_type
end type

type em_max from w_liste_patients`em_max within w_liste_patients_classe_type
end type

type em_min from w_liste_patients`em_min within w_liste_patients_classe_type
end type

type dw_1 from w_liste_patients`dw_1 within w_liste_patients_classe_type
end type

type gb_1 from w_liste_patients`gb_1 within w_liste_patients_classe_type
end type

type dw_prati from w_liste_patients`dw_prati within w_liste_patients_classe_type
end type

type cbx_filtre from w_liste_patients`cbx_filtre within w_liste_patients_classe_type
end type

type st_min from w_liste_patients`st_min within w_liste_patients_classe_type
end type

type st_max from w_liste_patients`st_max within w_liste_patients_classe_type
end type

type dw_liste from w_liste_patients`dw_liste within w_liste_patients_classe_type
integer x = 9
string dataobject = "dw_liste_patients_classe_type_edition"
end type

type st_gene1 from statictext within w_liste_patients_classe_type
integer x = 818
integer y = 1024
integer width = 1746
integer height = 68
boolean bringtotop = true
integer textsize = -8
fontcharset fontcharset = ansi!
string facename = "Arial"
boolean italic = true
long textcolor = 16711680
long backcolor = 553648127
string text = "Vous pouvez utiliser le caractère % comme générique (y compris à la fin)"
end type

type st_clase from statictext within w_liste_patients_classe_type
integer x = 466
integer y = 920
integer width = 288
integer height = 72
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
string facename = "Arial"
long backcolor = 553648127
string text = "Classe :"
end type

type st_1 from statictext within w_liste_patients_classe_type
integer x = 466
integer y = 1132
integer width = 288
integer height = 72
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
string facename = "Arial"
long backcolor = 553648127
string text = "Type :"
end type

type st_2 from statictext within w_liste_patients_classe_type
integer x = 818
integer y = 1232
integer width = 1746
integer height = 76
boolean bringtotop = true
integer textsize = -8
fontcharset fontcharset = ansi!
string facename = "Arial"
boolean italic = true
long textcolor = 16711680
long backcolor = 553648127
string text = "Vous pouvez utiliser le caractère % comme générique (y compris à la fin)"
end type

type dw_classe from datawindow within w_liste_patients_classe_type
string tag = "no resize all brush"
integer x = 827
integer y = 920
integer width = 855
integer height = 72
integer taborder = 90
boolean bringtotop = true
string title = "none"
string dataobject = "dw_cherche_clinique_classe"
boolean border = false
boolean livescroll = true
end type

type dw_type from datawindow within w_liste_patients_classe_type
string tag = "no resize all brush"
integer x = 827
integer y = 1132
integer width = 859
integer height = 72
integer taborder = 100
boolean bringtotop = true
string title = "none"
string dataobject = "dw_cherche_clinique_type"
boolean border = false
boolean livescroll = true
end type

type uo_filtre_email from uo_filtre_emails within w_liste_patients_classe_type
string tag = "no resize all"
integer x = 987
integer y = 1852
integer taborder = 200
boolean bringtotop = true
end type

on uo_filtre_email.destroy
call uo_filtre_emails::destroy
end on

