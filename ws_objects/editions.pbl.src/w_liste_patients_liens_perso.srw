$PBExportHeader$w_liste_patients_liens_perso.srw
$PBExportComments$Héritée de liste_patients
forward
global type w_liste_patients_liens_perso from w_liste_patients
end type
type uo_filtre_email from uo_filtre_emails within w_liste_patients_liens_perso
end type
type sle_lien from singlelineedit within w_liste_patients_liens_perso
end type
type st_gene1 from statictext within w_liste_patients_liens_perso
end type
type cbx_1 from checkbox within w_liste_patients_liens_perso
end type
type cbx_2 from checkbox within w_liste_patients_liens_perso
end type
type st_clase from statictext within w_liste_patients_liens_perso
end type
type rb_un_dossier from radiobutton within w_liste_patients_liens_perso
end type
type rb_tous_dossier from radiobutton within w_liste_patients_liens_perso
end type
type dw_dossier from datawindow within w_liste_patients_liens_perso
end type
type gb_2 from gb_1 within w_liste_patients_liens_perso
end type
type gb_rechercher from groupbox within w_liste_patients_liens_perso
end type
end forward

global type w_liste_patients_liens_perso from w_liste_patients
string title = ""
uo_filtre_email uo_filtre_email
sle_lien sle_lien
st_gene1 st_gene1
cbx_1 cbx_1
cbx_2 cbx_2
st_clase st_clase
rb_un_dossier rb_un_dossier
rb_tous_dossier rb_tous_dossier
dw_dossier dw_dossier
gb_2 gb_2
gb_rechercher gb_rechercher
end type
global w_liste_patients_liens_perso w_liste_patients_liens_perso

type variables


string clause_select, clause_where
end variables

forward prototypes
public subroutine prepa ()
end prototypes

public subroutine prepa ();string pra_min,pra_max
string v_type_dossier_min, v_type_dossier_max
double code_min,code_max
string v_dir_photos
string new_clause_where
string s_rc, s_lien_cherche


if not cbx_1.checked and not cbx_2.checked then
	Messagebox("ATTENTION","Vous devez indiquer au moins un lien pour la recherche !!")
else
	
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
	
		if rb_un_dossier.checked then
			v_type_dossier_min = dw_dossier.gettext()
			v_type_dossier_max = v_type_dossier_min
		else
			v_type_dossier_min = ""
			v_type_dossier_max = "ZZZZZZZZZZZ"
		end if



//Clause_where =    ' WHERE ( dossier.code = patient.type_dossier ) '
//and  ( correspondants.code = patient.code_correspondant )  ' 

//+ &
//        '  ( patient.numero_dossier between ' + string(code_min) + ' and ' +string(code_max)+' ) AND  ' +&
//        '  ( patient.code_praticien between ' + "'" + pra_min  + "'"+' and '+ "'" + pra_min  + "'" +' ) AND  ' +&
//        '  ( patient.type_dossier between' + "'" + v_type_dossier_min  + "'" + ' and ' +  "'" + v_type_dossier_min  + "'" +'  ) '
//	
		// Pour le dessin des boutons
		v_dir_photos = gfx_tout_remplacer(dir_photos, "/", "\")
		
		s_lien_cherche = trim(sle_lien.text) + '%'
		
		if cbx_1.checked and not cbx_2.checked then
			new_clause_where = clause_where + " and  patient.url1 like '" + s_lien_cherche +"'" 
		else
			if not cbx_1.checked and cbx_2.checked then
				new_clause_where = clause_where + " and  patient.url2 like '" + s_lien_cherche +"'" 
			else
				if cbx_1.checked and cbx_2.checked then
					new_clause_where = clause_where + " and  (  patient.url1 like '" + s_lien_cherche +"' or patient.url2 like '" + s_lien_cherche +"') " 
				end if
			end if
			
		end if
		
		s_rc = dw_liste.Modify('datawindow.table.select = " '+ clause_select  + new_clause_where + '"')

	
		open(w_patience)
		
		dw_liste.retrieve(code_min,code_max,pra_min,pra_max,v_type_dossier_min, v_type_dossier_max, v_dir_photos)
		
		// 
		
		
		close(w_patience)
	
	
	end if
end if
end subroutine

on w_liste_patients_liens_perso.create
int iCurrent
call super::create
this.uo_filtre_email=create uo_filtre_email
this.sle_lien=create sle_lien
this.st_gene1=create st_gene1
this.cbx_1=create cbx_1
this.cbx_2=create cbx_2
this.st_clase=create st_clase
this.rb_un_dossier=create rb_un_dossier
this.rb_tous_dossier=create rb_tous_dossier
this.dw_dossier=create dw_dossier
this.gb_2=create gb_2
this.gb_rechercher=create gb_rechercher
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.uo_filtre_email
this.Control[iCurrent+2]=this.sle_lien
this.Control[iCurrent+3]=this.st_gene1
this.Control[iCurrent+4]=this.cbx_1
this.Control[iCurrent+5]=this.cbx_2
this.Control[iCurrent+6]=this.st_clase
this.Control[iCurrent+7]=this.rb_un_dossier
this.Control[iCurrent+8]=this.rb_tous_dossier
this.Control[iCurrent+9]=this.dw_dossier
this.Control[iCurrent+10]=this.gb_2
this.Control[iCurrent+11]=this.gb_rechercher
end on

on w_liste_patients_liens_perso.destroy
call super::destroy
destroy(this.uo_filtre_email)
destroy(this.sle_lien)
destroy(this.st_gene1)
destroy(this.cbx_1)
destroy(this.cbx_2)
destroy(this.st_clase)
destroy(this.rb_un_dossier)
destroy(this.rb_tous_dossier)
destroy(this.dw_dossier)
destroy(this.gb_2)
destroy(this.gb_rechercher)
end on

event open;call super::open;



uo_filtre_email.dw_liste = dw_liste
uo_filtre_email.em_statut_mere = em_nb

dw_dossier.settransobject(sqlca)
dw_dossier.retrieve()


// La clause Where sera gérée en dinamique

//rc = dw_liste.Modify('datawindow.table.select ="'+ sel + clausew + clauseo  +'"')

Clause_select = dw_liste.describe("datawindow.table.select")

Clause_where =    ' WHERE ( dossier.code = patient.type_dossier ) and  ( correspondants.code = patient.code_correspondant ) AND  ' + &
        '  ( ( patient.numero_dossier between :code_min and :code_max ) AND  ' +&
        '  ( patient.code_praticien between :prat_min and :prat_max ) AND  ' +&
        '  ( patient.type_dossier between :doss_min and :doss_max ) )  ' 
end event

type p_fond from w_liste_patients`p_fond within w_liste_patients_liens_perso
integer x = 2674
integer y = 272
end type

type cb_imprimer from w_liste_patients`cb_imprimer within w_liste_patients_liens_perso
integer x = 2199
integer taborder = 180
end type

type cb_autre from w_liste_patients`cb_autre within w_liste_patients_liens_perso
integer x = 1728
integer taborder = 190
end type

type cb_fermer from w_liste_patients`cb_fermer within w_liste_patients_liens_perso
integer x = 2670
integer taborder = 200
end type

type cb_ecran from w_liste_patients`cb_ecran within w_liste_patients_liens_perso
integer x = 517
integer taborder = 210
end type

type cb_lien_word from w_liste_patients`cb_lien_word within w_liste_patients_liens_perso
integer taborder = 90
end type

type uo_size from w_liste_patients`uo_size within w_liste_patients_liens_perso
integer taborder = 100
end type

type rb_un from w_liste_patients`rb_un within w_liste_patients_liens_perso
end type

type rb_tous from w_liste_patients`rb_tous within w_liste_patients_liens_perso
end type

type em_nb from w_liste_patients`em_nb within w_liste_patients_liens_perso
integer taborder = 110
end type

type em_max from w_liste_patients`em_max within w_liste_patients_liens_perso
end type

type em_min from w_liste_patients`em_min within w_liste_patients_liens_perso
end type

type dw_1 from w_liste_patients`dw_1 within w_liste_patients_liens_perso
integer taborder = 130
end type

type gb_1 from w_liste_patients`gb_1 within w_liste_patients_liens_perso
integer taborder = 140
end type

type dw_prati from w_liste_patients`dw_prati within w_liste_patients_liens_perso
integer taborder = 160
end type

type cbx_filtre from w_liste_patients`cbx_filtre within w_liste_patients_liens_perso
integer taborder = 150
end type

type st_min from w_liste_patients`st_min within w_liste_patients_liens_perso
end type

type st_max from w_liste_patients`st_max within w_liste_patients_liens_perso
end type

type dw_liste from w_liste_patients`dw_liste within w_liste_patients_liens_perso
integer x = 9
integer taborder = 120
string dataobject = "dw_liste_patients_liens_persos_edition"
end type

event dw_liste::clicked;call super::clicked;string	ls_Object
string	ls_win
string s_url

//Declaration des variables locales
//--------------------------

double v_code
long couleur_choisie

ls_Object = String(dwo.name)

if row > 0 then 
	if GetItemNumber(row, "code") > 0 then 		// pas pour les Non Validés !!!
	
		Choose case ls_Object
			case "lien_perso1"
				s_url = GetItemString(row, "patient_url1")
				//run('cmd /C start "Lien Personnalisé" "' + s_url +'"')
				openurl ( s_url )	
				
			case "lien_perso2"
			
				s_url = GetItemString(row, "patient_url2")
				//run('cmd /C start "Lien Personnalisé" "' + s_url +'"')
				openurl ( s_url )	
			
		end choose
	end if
end if
	
	

end event

type uo_filtre_email from uo_filtre_emails within w_liste_patients_liens_perso
string tag = "no resize all"
integer x = 987
integer y = 1852
integer taborder = 220
boolean bringtotop = true
end type

on uo_filtre_email.destroy
call uo_filtre_emails::destroy
end on

type sle_lien from singlelineedit within w_liste_patients_liens_perso
integer x = 677
integer y = 1260
integer width = 2834
integer height = 92
integer taborder = 60
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
end type

type st_gene1 from statictext within w_liste_patients_liens_perso
integer x = 681
integer y = 1372
integer width = 2130
integer height = 68
integer textsize = -8
fontcharset fontcharset = ansi!
string facename = "Arial"
boolean italic = true
long textcolor = 16711680
long backcolor = 553648127
string text = "Vous pouvez utiliser le caractère % comme générique (il sera automatiquement ajouté à la fin)"
end type

type cbx_1 from checkbox within w_liste_patients_liens_perso
integer x = 782
integer y = 1596
integer width = 526
integer height = 80
integer taborder = 70
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 553648127
string text = "Dans le lien N°1"
boolean checked = true
end type

type cbx_2 from checkbox within w_liste_patients_liens_perso
integer x = 1536
integer y = 1596
integer width = 539
integer height = 80
integer taborder = 80
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 553648127
string text = "Dans le lien N°2"
boolean checked = true
end type

type st_clase from statictext within w_liste_patients_liens_perso
integer x = 466
integer y = 1280
integer width = 206
integer height = 72
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
string facename = "Arial"
long backcolor = 553648127
string text = "Lien :"
end type

type rb_un_dossier from radiobutton within w_liste_patients_liens_perso
integer x = 439
integer y = 1000
integer width = 677
integer height = 80
integer taborder = 40
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 15780518
string text = "Un Type de Dossier  "
boolean checked = true
end type

event rb_un_dossier::clicked;call super::clicked;dw_dossier.visible = true
end event

type rb_tous_dossier from radiobutton within w_liste_patients_liens_perso
integer x = 439
integer y = 892
integer width = 891
integer height = 80
integer taborder = 30
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 15780518
string text = "Tous les Types de Dossiers  "
end type

event clicked;dw_dossier.visible = false
end event

type dw_dossier from datawindow within w_liste_patients_liens_perso
string tag = "position"
integer x = 1211
integer y = 1000
integer width = 937
integer height = 76
integer taborder = 50
string dataobject = "dw_cherche_dossier"
boolean border = false
end type

type gb_2 from gb_1 within w_liste_patients_liens_perso
integer x = 274
integer y = 804
integer width = 2272
integer height = 328
integer taborder = 170
string text = "Choix du Dossier"
end type

type gb_rechercher from groupbox within w_liste_patients_liens_perso
integer x = 690
integer y = 1480
integer width = 1559
integer height = 260
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean italic = true
long backcolor = 553648127
string text = "Recherche"
end type

