$PBExportHeader$w_liste_patients_soins_date_accord.srw
$PBExportComments$Héritée de liste_patients
forward
global type w_liste_patients_soins_date_accord from w_liste_patients
end type
type st_2 from statictext within w_liste_patients_soins_date_accord
end type
type st_3 from statictext within w_liste_patients_soins_date_accord
end type
type st_4 from statictext within w_liste_patients_soins_date_accord
end type
type em_date_min from uo_date_calendrier within w_liste_patients_soins_date_accord
end type
type em_date_max from uo_date_calendrier within w_liste_patients_soins_date_accord
end type
end forward

global type w_liste_patients_soins_date_accord from w_liste_patients
string title = "Liste des Patients selon la date d~'accord"
st_2 st_2
st_3 st_3
st_4 st_4
em_date_min em_date_min
em_date_max em_date_max
end type
global w_liste_patients_soins_date_accord w_liste_patients_soins_date_accord

forward prototypes
public subroutine prepa ()
end prototypes

public subroutine prepa ();string pra_min,pra_max,soin
double code_min,code_max
date date_min, date_max


// pour la mises à jour du soin suivant
double tot_lignes,cpt_lignes
double v_code
date v_date_soin_suivant
string v_soin_suivant


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


	date_min = date(em_date_min.text)
	date_max = date(em_date_max.text)	



	open(w_patience)
	dw_liste.retrieve(code_min,code_max,pra_min,pra_max,date_min,date_max)
	
	
	// Mise à jour des types de soins suivants
	tot_lignes = dw_liste.rowcount()
	
	for cpt_lignes = 1 to tot_lignes
		
		v_code = dw_liste.getitemnumber(cpt_lignes,"code")
		v_date_soin_suivant = dw_liste.getitemdate(cpt_lignes,"date_soin_suivant")

		SELECT code_soins.nom +' '+ string(soins.numero) INTO :v_soin_suivant 
		FROM soins,code_soins 
		WHERE soins.code = :v_code and soins.date_demande = :v_date_soin_suivant 
		and soins."type" = code_soins."code" ;
		
		dw_liste.setitem(cpt_lignes,"soin_suivant",v_soin_suivant)
		
		

		
		
		
	next
	
	
	close(w_patience)

//	em_nb.text = string(dw_liste.rowcount())+" Dossiers"
//	em_nb.visible = true

end if

end subroutine

event open;call super::open;
em_date_max.setDate(Today())
em_date_min.setDate(RelativeDate(Today(),-365))
end event

on w_liste_patients_soins_date_accord.create
int iCurrent
call super::create
this.st_2=create st_2
this.st_3=create st_3
this.st_4=create st_4
this.em_date_min=create em_date_min
this.em_date_max=create em_date_max
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.st_2
this.Control[iCurrent+2]=this.st_3
this.Control[iCurrent+3]=this.st_4
this.Control[iCurrent+4]=this.em_date_min
this.Control[iCurrent+5]=this.em_date_max
end on

on w_liste_patients_soins_date_accord.destroy
call super::destroy
destroy(this.st_2)
destroy(this.st_3)
destroy(this.st_4)
destroy(this.em_date_min)
destroy(this.em_date_max)
end on

type p_fond from w_liste_patients`p_fond within w_liste_patients_soins_date_accord
end type

type cb_imprimer from w_liste_patients`cb_imprimer within w_liste_patients_soins_date_accord
end type

type cb_autre from w_liste_patients`cb_autre within w_liste_patients_soins_date_accord
integer taborder = 130
end type

type cb_fermer from w_liste_patients`cb_fermer within w_liste_patients_soins_date_accord
integer taborder = 120
end type

type cb_ecran from w_liste_patients`cb_ecran within w_liste_patients_soins_date_accord
integer taborder = 140
end type

type cb_lien_word from w_liste_patients`cb_lien_word within w_liste_patients_soins_date_accord
end type

type uo_size from w_liste_patients`uo_size within w_liste_patients_soins_date_accord
end type

type rb_un from w_liste_patients`rb_un within w_liste_patients_soins_date_accord
end type

type rb_tous from w_liste_patients`rb_tous within w_liste_patients_soins_date_accord
end type

type em_nb from w_liste_patients`em_nb within w_liste_patients_soins_date_accord
integer taborder = 60
end type

type em_max from w_liste_patients`em_max within w_liste_patients_soins_date_accord
integer y = 528
integer taborder = 30
end type

type em_min from w_liste_patients`em_min within w_liste_patients_soins_date_accord
integer y = 528
integer taborder = 20
end type

type dw_1 from w_liste_patients`dw_1 within w_liste_patients_soins_date_accord
end type

type gb_1 from w_liste_patients`gb_1 within w_liste_patients_soins_date_accord
integer taborder = 10
end type

type dw_prati from w_liste_patients`dw_prati within w_liste_patients_soins_date_accord
integer taborder = 100
end type

type cbx_filtre from w_liste_patients`cbx_filtre within w_liste_patients_soins_date_accord
end type

type st_min from w_liste_patients`st_min within w_liste_patients_soins_date_accord
integer y = 540
end type

type st_max from w_liste_patients`st_max within w_liste_patients_soins_date_accord
integer y = 540
end type

type dw_liste from w_liste_patients`dw_liste within w_liste_patients_soins_date_accord
integer taborder = 90
string dataobject = "dw_liste_patients_soins_accord_edition"
end type

type st_2 from statictext within w_liste_patients_soins_date_accord
integer x = 603
integer y = 792
integer width = 256
integer height = 76
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
string facename = "Arial"
long backcolor = 553648127
boolean enabled = false
string text = "Entre le "
alignment alignment = center!
boolean focusrectangle = false
end type

type st_3 from statictext within w_liste_patients_soins_date_accord
integer x = 1463
integer y = 792
integer width = 247
integer height = 76
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
string facename = "Arial"
long backcolor = 553648127
boolean enabled = false
string text = "Et le "
alignment alignment = center!
boolean focusrectangle = false
end type

type st_4 from statictext within w_liste_patients_soins_date_accord
integer x = 393
integer y = 700
integer width = 453
integer height = 76
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
string facename = "Arial"
boolean underline = true
long backcolor = 553648127
boolean enabled = false
string text = "Date d~'Accord :"
alignment alignment = center!
boolean focusrectangle = false
end type

type em_date_min from uo_date_calendrier within w_liste_patients_soins_date_accord
integer x = 942
integer y = 776
integer taborder = 210
boolean bringtotop = true
end type

on em_date_min.destroy
call uo_date_calendrier::destroy
end on

type em_date_max from uo_date_calendrier within w_liste_patients_soins_date_accord
integer x = 1746
integer y = 776
integer taborder = 220
boolean bringtotop = true
end type

on em_date_max.destroy
call uo_date_calendrier::destroy
end on

