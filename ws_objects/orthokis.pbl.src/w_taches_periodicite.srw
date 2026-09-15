$PBExportHeader$w_taches_periodicite.srw
forward
global type w_taches_periodicite from w_fenetre_arakis
end type
type dp_date2 from datepicker within w_taches_periodicite
end type
type dp_date1 from datepicker within w_taches_periodicite
end type
type st_2 from statictext within w_taches_periodicite
end type
type st_1 from statictext within w_taches_periodicite
end type
type dw_fiche from datawindow within w_taches_periodicite
end type
type ddlb_annu_mois from dropdownlistbox within w_taches_periodicite
end type
type em_annu_jour from editmask within w_taches_periodicite
end type
type st_annu_1 from statictext within w_taches_periodicite
end type
type st_mensu_3 from statictext within w_taches_periodicite
end type
type em_mensu_mois from editmask within w_taches_periodicite
end type
type st_mensu_2 from statictext within w_taches_periodicite
end type
type em_mensu_jour from editmask within w_taches_periodicite
end type
type st_mensu_1 from statictext within w_taches_periodicite
end type
type cbx_samedi from checkbox within w_taches_periodicite
end type
type cbx_vendredi from checkbox within w_taches_periodicite
end type
type cbx_jeudi from checkbox within w_taches_periodicite
end type
type cbx_mercredi from checkbox within w_taches_periodicite
end type
type cbx_mardi from checkbox within w_taches_periodicite
end type
type cbx_lundi from checkbox within w_taches_periodicite
end type
type st_hebdo_2 from statictext within w_taches_periodicite
end type
type em_hebdo_jour from editmask within w_taches_periodicite
end type
type st_hebdo_1 from statictext within w_taches_periodicite
end type
type st_quoti_2 from statictext within w_taches_periodicite
end type
type em_quoti_jour from editmask within w_taches_periodicite
end type
type st_quoti_1 from statictext within w_taches_periodicite
end type
type cb_annuler from uo_picturebutton_390x120 within w_taches_periodicite
end type
type cb_ok from uo_picturebutton_390x120 within w_taches_periodicite
end type
type rb_annu from radiobutton within w_taches_periodicite
end type
type rb_hebdo from radiobutton within w_taches_periodicite
end type
type rb_mensu from radiobutton within w_taches_periodicite
end type
type rb_quoti from radiobutton within w_taches_periodicite
end type
type gb_periode from groupbox within w_taches_periodicite
end type
type gb_1 from groupbox within w_taches_periodicite
end type
end forward

global type w_taches_periodicite from w_fenetre_arakis
integer width = 3314
integer height = 2008
string title = "Tâches Périodiques"
windowtype windowtype = response!
dp_date2 dp_date2
dp_date1 dp_date1
st_2 st_2
st_1 st_1
dw_fiche dw_fiche
ddlb_annu_mois ddlb_annu_mois
em_annu_jour em_annu_jour
st_annu_1 st_annu_1
st_mensu_3 st_mensu_3
em_mensu_mois em_mensu_mois
st_mensu_2 st_mensu_2
em_mensu_jour em_mensu_jour
st_mensu_1 st_mensu_1
cbx_samedi cbx_samedi
cbx_vendredi cbx_vendredi
cbx_jeudi cbx_jeudi
cbx_mercredi cbx_mercredi
cbx_mardi cbx_mardi
cbx_lundi cbx_lundi
st_hebdo_2 st_hebdo_2
em_hebdo_jour em_hebdo_jour
st_hebdo_1 st_hebdo_1
st_quoti_2 st_quoti_2
em_quoti_jour em_quoti_jour
st_quoti_1 st_quoti_1
cb_annuler cb_annuler
cb_ok cb_ok
rb_annu rb_annu
rb_hebdo rb_hebdo
rb_mensu rb_mensu
rb_quoti rb_quoti
gb_periode gb_periode
gb_1 gb_1
end type
global w_taches_periodicite w_taches_periodicite

type variables


double var_id_local
double var_code_patient_null

end variables

forward prototypes
public subroutine affiche (integer periode)
public function boolean ok_jour (date date_du_jour)
public function boolean ajouter_tache (datetime v_date_echeance, string v_texte, string v_confidentiel, string v_statut, string v_emetteur, string v_destinataire, double v_patient, string v_notification, integer v_minutes_notification, string v_type_destinataire, double v_groupe_destinataire)
end prototypes

public subroutine affiche (integer periode);

// On efface tout
st_quoti_1.visible = false
st_quoti_2.visible = false
em_quoti_jour.visible = false

st_hebdo_1.visible = false
st_hebdo_2.visible = false
em_hebdo_jour.visible = false
cbx_lundi.visible = false
cbx_mardi.visible = false
cbx_mercredi.visible = false
cbx_jeudi.visible = false
cbx_vendredi.visible = false
cbx_samedi.visible = false

st_mensu_1.visible = false
st_mensu_2.visible = false
st_mensu_3.visible = false
em_mensu_jour.visible = false
em_mensu_mois.visible = false


st_annu_1.visible = false
em_annu_jour.visible = false
ddlb_annu_mois.visible = false

cbx_lundi.checked = false
cbx_mardi.checked = false
cbx_mercredi.checked = false
cbx_jeudi.checked = false
cbx_vendredi.checked = false
cbx_samedi.checked = false


// On n'affiche que ce qui doit l'être
choose case periode
	case 1
		// Quotidienne
		st_quoti_1.visible = true
		st_quoti_2.visible = true
		em_quoti_jour.visible = true
		em_quoti_jour.text  = "1"
		cbx_lundi.visible = true
		cbx_mardi.visible = true
		cbx_mercredi.visible = true
		cbx_jeudi.visible = true
		cbx_vendredi.visible = true
		cbx_samedi.visible = true
		cbx_lundi.checked = true
		cbx_mardi.checked = true
		cbx_mercredi.checked = true
		cbx_jeudi.checked = true
		cbx_vendredi.checked = true
		cbx_samedi.checked = true
	case 2 
		// Hebdo
		st_hebdo_1.visible = true
		st_hebdo_2.visible = true
		em_hebdo_jour.visible = true
		em_hebdo_jour.text  = "1"
		cbx_lundi.visible = true
		cbx_mardi.visible = true
		cbx_mercredi.visible = true
		cbx_jeudi.visible = true
		cbx_vendredi.visible = true
		cbx_samedi.visible = true
		
		choose case  daynumber(today())
			case 2
				cbx_lundi.checked = true
			case 3
				cbx_mardi.checked = true
			case 4
				cbx_mercredi.checked = true
			case 5
				cbx_jeudi.checked = true
			case 6
				cbx_vendredi.checked = true
			case 7
				cbx_samedi.checked = true
		end choose
			
	case 3 
		// mensuelle
		st_mensu_1.visible = true
		st_mensu_2.visible = true
		st_mensu_3.visible = true
		em_mensu_jour.visible = true
		em_mensu_mois.visible = true
		em_mensu_jour.text = string(day(today()))
		em_mensu_mois.text = "1"
	case 4 
		// Annuelle
		st_annu_1.visible = true
		em_annu_jour.visible = true
		ddlb_annu_mois.visible = true
		em_annu_jour.text = string(day(today()))
		ddlb_annu_mois.selectitem (month(today()))
		
		
end choose
	
		
	
end subroutine

public function boolean ok_jour (date date_du_jour);

// Fonction qui renvoie si oui ou non la date passée en paramètre correspond à un jour coché dans les check box



boolean retour

retour = false

if daynumber(date_du_jour) = 2 and cbx_lundi.checked then
	retour = true
else
	if daynumber(date_du_jour) = 3 and cbx_mardi.checked then
		retour = true
	else
		if daynumber(date_du_jour) = 4 and cbx_mercredi.checked then
			retour = true
		else
			if daynumber(date_du_jour) = 5 and cbx_jeudi.checked then
				retour = true
			else
				if daynumber(date_du_jour) = 6 and cbx_vendredi.checked then
					retour = true
				else
					if daynumber(date_du_jour) = 7 and cbx_samedi.checked then
						retour = true
					end if
				end if
			end if
		end if
	end if
end if



return retour






end function

public function boolean ajouter_tache (datetime v_date_echeance, string v_texte, string v_confidentiel, string v_statut, string v_emetteur, string v_destinataire, double v_patient, string v_notification, integer v_minutes_notification, string v_type_destinataire, double v_groupe_destinataire);

  INSERT INTO "taches"  
         (  "date_echeance",   
           "texte",   
           "utilisateur_emetteur",   
           "utilisateur_destinataire",   
           "confidentiel",   
           "statut",
		  "code",
		  "notification",
		  "minutes_notification",
		  "type_destinataire",
		  "groupe_destinataire"
		  )  
		  
  VALUES (   :v_date_echeance,   
           :v_texte,   
           :v_emetteur,   
           :v_destinataire,   
           :v_confidentiel,   
           :v_statut,
		  :v_patient,
		  :v_notification,
		  :v_minutes_notification,
		  :v_type_destinataire,
		  :v_groupe_destinataire)  ;
			

if sqlca.sqlcode = 0 then
	commit ;
	return true
else
	rollback ;
	return false
end if
end function

on w_taches_periodicite.create
int iCurrent
call super::create
this.dp_date2=create dp_date2
this.dp_date1=create dp_date1
this.st_2=create st_2
this.st_1=create st_1
this.dw_fiche=create dw_fiche
this.ddlb_annu_mois=create ddlb_annu_mois
this.em_annu_jour=create em_annu_jour
this.st_annu_1=create st_annu_1
this.st_mensu_3=create st_mensu_3
this.em_mensu_mois=create em_mensu_mois
this.st_mensu_2=create st_mensu_2
this.em_mensu_jour=create em_mensu_jour
this.st_mensu_1=create st_mensu_1
this.cbx_samedi=create cbx_samedi
this.cbx_vendredi=create cbx_vendredi
this.cbx_jeudi=create cbx_jeudi
this.cbx_mercredi=create cbx_mercredi
this.cbx_mardi=create cbx_mardi
this.cbx_lundi=create cbx_lundi
this.st_hebdo_2=create st_hebdo_2
this.em_hebdo_jour=create em_hebdo_jour
this.st_hebdo_1=create st_hebdo_1
this.st_quoti_2=create st_quoti_2
this.em_quoti_jour=create em_quoti_jour
this.st_quoti_1=create st_quoti_1
this.cb_annuler=create cb_annuler
this.cb_ok=create cb_ok
this.rb_annu=create rb_annu
this.rb_hebdo=create rb_hebdo
this.rb_mensu=create rb_mensu
this.rb_quoti=create rb_quoti
this.gb_periode=create gb_periode
this.gb_1=create gb_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dp_date2
this.Control[iCurrent+2]=this.dp_date1
this.Control[iCurrent+3]=this.st_2
this.Control[iCurrent+4]=this.st_1
this.Control[iCurrent+5]=this.dw_fiche
this.Control[iCurrent+6]=this.ddlb_annu_mois
this.Control[iCurrent+7]=this.em_annu_jour
this.Control[iCurrent+8]=this.st_annu_1
this.Control[iCurrent+9]=this.st_mensu_3
this.Control[iCurrent+10]=this.em_mensu_mois
this.Control[iCurrent+11]=this.st_mensu_2
this.Control[iCurrent+12]=this.em_mensu_jour
this.Control[iCurrent+13]=this.st_mensu_1
this.Control[iCurrent+14]=this.cbx_samedi
this.Control[iCurrent+15]=this.cbx_vendredi
this.Control[iCurrent+16]=this.cbx_jeudi
this.Control[iCurrent+17]=this.cbx_mercredi
this.Control[iCurrent+18]=this.cbx_mardi
this.Control[iCurrent+19]=this.cbx_lundi
this.Control[iCurrent+20]=this.st_hebdo_2
this.Control[iCurrent+21]=this.em_hebdo_jour
this.Control[iCurrent+22]=this.st_hebdo_1
this.Control[iCurrent+23]=this.st_quoti_2
this.Control[iCurrent+24]=this.em_quoti_jour
this.Control[iCurrent+25]=this.st_quoti_1
this.Control[iCurrent+26]=this.cb_annuler
this.Control[iCurrent+27]=this.cb_ok
this.Control[iCurrent+28]=this.rb_annu
this.Control[iCurrent+29]=this.rb_hebdo
this.Control[iCurrent+30]=this.rb_mensu
this.Control[iCurrent+31]=this.rb_quoti
this.Control[iCurrent+32]=this.gb_periode
this.Control[iCurrent+33]=this.gb_1
end on

on w_taches_periodicite.destroy
call super::destroy
destroy(this.dp_date2)
destroy(this.dp_date1)
destroy(this.st_2)
destroy(this.st_1)
destroy(this.dw_fiche)
destroy(this.ddlb_annu_mois)
destroy(this.em_annu_jour)
destroy(this.st_annu_1)
destroy(this.st_mensu_3)
destroy(this.em_mensu_mois)
destroy(this.st_mensu_2)
destroy(this.em_mensu_jour)
destroy(this.st_mensu_1)
destroy(this.cbx_samedi)
destroy(this.cbx_vendredi)
destroy(this.cbx_jeudi)
destroy(this.cbx_mercredi)
destroy(this.cbx_mardi)
destroy(this.cbx_lundi)
destroy(this.st_hebdo_2)
destroy(this.em_hebdo_jour)
destroy(this.st_hebdo_1)
destroy(this.st_quoti_2)
destroy(this.em_quoti_jour)
destroy(this.st_quoti_1)
destroy(this.cb_annuler)
destroy(this.cb_ok)
destroy(this.rb_annu)
destroy(this.rb_hebdo)
destroy(this.rb_mensu)
destroy(this.rb_quoti)
destroy(this.gb_periode)
destroy(this.gb_1)
end on

event open;call super::open;

dw_fiche.dataobject = "dw_taches_fiche"


setnull(var_code_patient_null)

affiche(2)

centrer(this)


// En paramètre on reçoit d'id de la tâche à utiliser !!

var_id_local = message.doubleparm

double v_code_patient

dw_fiche.settransobject(sqlca)
dw_fiche.retrieve(var_id_local )


if dw_fiche.rowcount() > 0 then
	
	dp_date1.value =  datetime(relativedate( date(dw_fiche.getitemdatetime(dw_fiche.getrow(),"date_echeance")), 1) , now() )
	dp_date2.value =  datetime( date("31/12/"+string(year(today()))) , now() )
	
	
else
	Messagebox("ATTENTION !","Erreur à l'ouverture de la tâche. ~n~nElle a peut-être été supprimée !")
	close(this)
end if




end event

type p_fond from w_fenetre_arakis`p_fond within w_taches_periodicite
end type

type dp_date2 from datepicker within w_taches_periodicite
integer x = 1467
integer y = 1680
integer width = 411
integer height = 100
integer taborder = 50
boolean border = true
borderstyle borderstyle = stylelowered!
date maxdate = Date("2999-12-31")
date mindate = Date("1800-01-01")
datetime value = DateTime(Date("2025-07-18"), Time("08:42:30.000000"))
integer textsize = -10
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
integer calendarfontweight = 400
boolean todaysection = true
boolean todaycircle = true
end type

type dp_date1 from datepicker within w_taches_periodicite
integer x = 850
integer y = 1680
integer width = 411
integer height = 100
integer taborder = 50
boolean border = true
borderstyle borderstyle = stylelowered!
date maxdate = Date("2999-12-31")
date mindate = Date("1800-01-01")
datetime value = DateTime(Date("2025-07-18"), Time("08:42:30.000000"))
integer textsize = -10
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
integer calendarfontweight = 400
boolean todaysection = true
boolean todaycircle = true
end type

type st_2 from statictext within w_taches_periodicite
integer x = 1321
integer y = 1696
integer width = 133
integer height = 64
integer textsize = -10
fontcharset fontcharset = ansi!
string facename = "Arial"
long backcolor = 553648127
string text = "Au"
end type

type st_1 from statictext within w_taches_periodicite
integer x = 699
integer y = 1696
integer width = 114
integer height = 64
integer textsize = -10
fontcharset fontcharset = ansi!
string facename = "Arial"
long backcolor = 553648127
string text = "Du"
end type

type dw_fiche from datawindow within w_taches_periodicite
integer x = 23
integer y = 24
integer width = 3168
integer height = 1136
integer taborder = 10
string title = "none"
string dataobject = "dw_taches_fiche"
boolean livescroll = true
end type

event buttonclicked;


string ls_object
string code_retour
string v_nom_saisi


ls_Object = String(dwo.name)

// envoi d'email
choose case  ls_Object
	case "b_patient" 
		open(w_cherche)
		//guo_fenetre_modale.wf_ouvrir(w_cherche)
		if var_suite then
			SetItem(row, "code", var_code)
			SetItem(row, "nom_patient", var_nom+ "  (" + string(var_numero_dossier) + ")")
		end if
		
		
	case "b_raz_patient"
		long v_nul
		setnull(v_nul)
		setItem(row, "code", v_nul)
		SetItem(row, "nom_patient", "")

	case "b_ouvrir_patient"
		
		if  getitemnumber(row,"code") > 0 then
	
			var_code 				= 	getitemnumber(row,"code")
			var_numero_dossier 	= 	0
			var_nom 				= getitemstring(row,"nom_patient")
			var_nomp 				= ""
			var_pay 					= ""
			var_moul 				= ""
		
			ouverture_salle_attente()
			
			close(parent)
		end if

end choose
end event

type ddlb_annu_mois from dropdownlistbox within w_taches_periodicite
integer x = 1330
integer y = 1300
integer width = 736
integer height = 400
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
boolean sorted = false
boolean vscrollbar = true
string item[] = {"Janvier","Février","Mars","Avril","Mai","Juin","Juillet","Août","Septembre","Octobre","Novembre","Décembre"}
borderstyle borderstyle = stylelowered!
end type

type em_annu_jour from editmask within w_taches_periodicite
integer x = 1120
integer y = 1296
integer width = 187
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
borderstyle borderstyle = stylelowered!
string mask = "##"
boolean spin = true
double increment = 1
string minmax = "1~~31"
end type

type st_annu_1 from statictext within w_taches_periodicite
integer x = 855
integer y = 1308
integer width = 265
integer height = 64
integer textsize = -10
fontcharset fontcharset = ansi!
string facename = "Arial"
long backcolor = 553648127
string text = "Chaque"
end type

type st_mensu_3 from statictext within w_taches_periodicite
integer x = 1682
integer y = 1316
integer width = 210
integer height = 72
integer textsize = -10
fontcharset fontcharset = ansi!
string facename = "Arial"
long backcolor = 553648127
string text = "mois"
end type

type em_mensu_mois from editmask within w_taches_periodicite
integer x = 1472
integer y = 1304
integer width = 187
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
borderstyle borderstyle = stylelowered!
string mask = "##"
boolean spin = true
double increment = 1
string minmax = "1~~12"
end type

type st_mensu_2 from statictext within w_taches_periodicite
integer x = 1211
integer y = 1312
integer width = 251
integer height = 64
integer textsize = -10
fontcharset fontcharset = ansi!
string facename = "Arial"
long backcolor = 553648127
string text = "tous les "
end type

type em_mensu_jour from editmask within w_taches_periodicite
integer x = 978
integer y = 1296
integer width = 187
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
borderstyle borderstyle = stylelowered!
string mask = "##"
boolean spin = true
double increment = 1
string minmax = "1~~31"
end type

type st_mensu_1 from statictext within w_taches_periodicite
integer x = 850
integer y = 1308
integer width = 128
integer height = 64
integer textsize = -10
fontcharset fontcharset = ansi!
string facename = "Arial"
long backcolor = 553648127
string text = "Le"
end type

type cbx_samedi from checkbox within w_taches_periodicite
integer x = 2610
integer y = 1428
integer width = 311
integer height = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 553648127
string text = "Samedi"
end type

type cbx_vendredi from checkbox within w_taches_periodicite
integer x = 2226
integer y = 1428
integer width = 315
integer height = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 553648127
string text = "Vendredi"
end type

type cbx_jeudi from checkbox within w_taches_periodicite
integer x = 1915
integer y = 1428
integer width = 242
integer height = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 553648127
string text = "Jeudi"
end type

type cbx_mercredi from checkbox within w_taches_periodicite
integer x = 1536
integer y = 1428
integer width = 311
integer height = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 553648127
string text = "Mercredi"
end type

type cbx_mardi from checkbox within w_taches_periodicite
integer x = 1202
integer y = 1428
integer width = 265
integer height = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 553648127
string text = "Mardi"
end type

type cbx_lundi from checkbox within w_taches_periodicite
integer x = 869
integer y = 1428
integer width = 265
integer height = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 553648127
string text = "Lundi"
end type

type st_hebdo_2 from statictext within w_taches_periodicite
integer x = 1390
integer y = 1300
integer width = 270
integer height = 84
integer textsize = -10
fontcharset fontcharset = ansi!
string facename = "Arial"
long backcolor = 553648127
string text = "semaines"
end type

type em_hebdo_jour from editmask within w_taches_periodicite
integer x = 1157
integer y = 1276
integer width = 201
integer height = 96
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
string text = "1"
borderstyle borderstyle = stylelowered!
string mask = "##"
boolean spin = true
double increment = 1
string minmax = "1~~52"
end type

type st_hebdo_1 from statictext within w_taches_periodicite
integer x = 850
integer y = 1304
integer width = 306
integer height = 84
integer textsize = -10
fontcharset fontcharset = ansi!
string facename = "Arial"
long backcolor = 553648127
string text = "Toutes les "
end type

type st_quoti_2 from statictext within w_taches_periodicite
integer x = 1390
integer y = 1300
integer width = 261
integer height = 84
integer textsize = -10
fontcharset fontcharset = ansi!
string facename = "Arial"
long backcolor = 553648127
string text = "jours"
end type

type em_quoti_jour from editmask within w_taches_periodicite
integer x = 1138
integer y = 1276
integer width = 187
integer height = 96
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
string text = "1"
borderstyle borderstyle = stylelowered!
string mask = "#"
boolean spin = true
double increment = 1
string minmax = "1~~7"
end type

type st_quoti_1 from statictext within w_taches_periodicite
integer x = 850
integer y = 1304
integer width = 261
integer height = 84
integer textsize = -10
fontcharset fontcharset = ansi!
string facename = "Arial"
long backcolor = 553648127
string text = "Tous les "
end type

type cb_annuler from uo_picturebutton_390x120 within w_taches_periodicite
integer x = 2080
integer y = 1700
integer width = 539
integer height = 152
integer taborder = 40
string text = "&Annuler"
string iconname = "ACTIONS_abandonner.png"
end type

event clicked;call super::clicked;

close(parent)

end event

type cb_ok from uo_picturebutton_390x120 within w_taches_periodicite
integer x = 2642
integer y = 1700
integer width = 539
integer height = 152
integer taborder = 30
string text = "Répéter"
string iconname = "ACTIONS_valider.png"
end type

event clicked;call super::clicked;
open(w_patience)

// Génération des tâches, en fonction des critères

date v_date_courante
date date1,date2

date1 = date(dp_date1.value)
date2 = date(dp_date2.value)

string v_utilisateur_emetteur, v_utilisateur_destinataire
string v_statut, v_confidentiel
date v_date_echeance
string v_texte
string v_notification
integer v_minutes_notification
double v_code_patient
time v_heure_tache

string v_type_destinataire
double v_groupe_destinataire

integer num_du_jour , num_du_mois, nb_mois
boolean trouve

integer cpt_ajout

cpt_ajout = 0

// tâches à générer
v_texte = dw_fiche.getitemstring(1,"texte")
v_confidentiel = dw_fiche.getitemstring(1,"confidentiel")
v_statut = 'N'
v_utilisateur_emetteur = utilisateur_code
v_utilisateur_destinataire = dw_fiche.getitemstring(1,"utilisateur_destinataire")
v_code_patient = dw_fiche.getitemNumber(1,"code")
v_notification = dw_fiche.getitemstring(1,"notification")
v_minutes_notification = dw_fiche.getitemNumber(1,"minutes_notification")
v_heure_tache =  time(dw_fiche.getitemDateTime(1,"date_echeance"))

v_type_destinataire = dw_fiche.getitemstring(1,"type_destinataire")
v_groupe_destinataire = dw_fiche.getitemNumber(1,"groupe_destinataire")

if rb_quoti.checked then
	// Quotidienne
	integer nb_jour 
	nb_jour = integer(em_quoti_jour.text)
	v_date_courante = date1
	do while v_date_courante <= date2
		if ok_jour(v_date_courante) then
			if ajouter_tache(datetime(v_date_courante,v_heure_tache) , v_texte, v_confidentiel, v_statut, v_utilisateur_emetteur, v_utilisateur_destinataire, v_code_patient, v_notification, v_minutes_notification, v_type_destinataire, v_groupe_destinataire)  then
				cpt_ajout = cpt_ajout + 1
			end if

		end if
		v_date_courante = relativedate(v_date_courante,nb_jour)
	loop
	
end if

if rb_hebdo.checked then
	// Hebdomadaire
	integer nb_sem
	
	date lundi_semaine_courante
	
	
	
	nb_sem = integer(em_hebdo_jour.text)
	
	v_date_courante = date1
	do while v_date_courante <= date2
		
		
		
		if ok_jour(v_date_courante) then
			
			
			// On mémorise le lundi pour jumper ensuite
			lundi_semaine_courante = relativedate(v_date_courante, 2 - daynumber(v_date_courante))

			// on va de jour en jour jusqu'au samedi de la même semaine
			do while daynumber(v_date_courante) <= 6
						
				if ok_jour(v_date_courante) then
					if ajouter_tache(datetime(v_date_courante,v_heure_tache) , v_texte, v_confidentiel, v_statut, v_utilisateur_emetteur, v_utilisateur_destinataire, v_code_patient, v_notification, v_minutes_notification, v_type_destinataire, v_groupe_destinataire)  then
							cpt_ajout = cpt_ajout + 1
					end if
				end if
				
				// jour suivant
				v_date_courante = relativedate(v_date_courante,1)
			loop
			
			
			// x semaine suivante
			v_date_courante = relativedate(lundi_semaine_courante, nb_sem * 7)
			
		else
			// jour suivant
			v_date_courante = relativedate(v_date_courante,1)
		end if
	loop
end if


if rb_mensu.checked then
	// Mensuelle
	v_date_courante = date1

	num_du_jour = integer(em_mensu_jour.text)
	nb_mois = integer(em_mensu_mois.text)

	
	// On se postionne sur la première date qui peut convenir

	trouve = false
	do while v_date_courante <= date2 and not trouve
		if day(v_date_courante) = num_du_jour then
			trouve = true
		else
			v_date_courante = relativedate(v_date_courante,1)
		end if
	loop
	
	if trouve then
		// on est sur le bon jour du mois
		
		do while v_date_courante <= date2 
			
			if ajouter_tache(datetime(v_date_courante,v_heure_tache) , v_texte, v_confidentiel, v_statut, v_utilisateur_emetteur, v_utilisateur_destinataire, v_code_patient, v_notification, v_minutes_notification, v_type_destinataire, v_groupe_destinataire)  then
				cpt_ajout = cpt_ajout + 1
			end if
			
			// ajout des mois
			v_date_courante = ajout_x_mois(v_date_courante , nb_mois)
			
		loop
	end if

end if



if rb_annu.checked then
	// Annuelle
	v_date_courante = date1

	num_du_jour = integer(em_annu_jour.text)
	num_du_mois = ddlb_annu_mois.finditem(ddlb_annu_mois.text,0)

	
	// On se postionne sur la première date qui peut convenir

	trouve = false
	do while v_date_courante <= date2 and not trouve
		if day(v_date_courante) = num_du_jour and month(v_date_courante) = num_du_mois then
			trouve = true
		else
			v_date_courante = relativedate(v_date_courante,1)
		end if
	loop
	
	if trouve then
		// on est sur le bon jour du mois
		
		do while v_date_courante <= date2 
			
			if ajouter_tache(datetime(v_date_courante,v_heure_tache) , v_texte, v_confidentiel, v_statut, v_utilisateur_emetteur, v_utilisateur_destinataire, v_code_patient, v_notification, v_minutes_notification, v_type_destinataire, v_groupe_destinataire)  then
				cpt_ajout = cpt_ajout + 1
			end if
			
			
			// ajout de l'année
			v_date_courante = ajout_x_mois(v_date_courante , 12)
			
		loop
	end if

end if



commit ;



close(w_patience)

if cpt_ajout = 0 then 
	Messagebox("ATTENTION !","Aucune tâche n'a été ajoutée !",stopsign!)
else
	if cpt_ajout = 1 then
		Messagebox("ATTENTION !", string(cpt_ajout)+ " tâche a été ajoutée !")
	else
		Messagebox("ATTENTION !", string(cpt_ajout)+ " tâches ont été ajoutées !")
	end if
end if

// On raffraichit la liste des taches dans la fenêtre appelantes

w_taches.filtre_taches(1,w_taches.dw_liste)


close(parent)



end event

type rb_annu from radiobutton within w_taches_periodicite
integer x = 78
integer y = 1632
integer width = 402
integer height = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 553648127
string text = "Annuelle"
end type

event clicked;affiche(4)
end event

type rb_hebdo from radiobutton within w_taches_periodicite
integer x = 78
integer y = 1416
integer width = 462
integer height = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 553648127
string text = "Hebdomadaire"
boolean checked = true
end type

event clicked;affiche(2)
end event

type rb_mensu from radiobutton within w_taches_periodicite
integer x = 78
integer y = 1524
integer width = 402
integer height = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 553648127
string text = "Mensuelle"
end type

event clicked;affiche(3)
end event

type rb_quoti from radiobutton within w_taches_periodicite
integer x = 78
integer y = 1308
integer width = 402
integer height = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 553648127
string text = "Quotidienne"
end type

event clicked;affiche(1)
end event

type gb_periode from groupbox within w_taches_periodicite
integer x = 27
integer y = 1208
integer width = 599
integer height = 584
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean italic = true
long textcolor = 33554432
long backcolor = 553648127
string text = "Périodicité"
end type

type gb_1 from groupbox within w_taches_periodicite
integer x = 795
integer y = 1200
integer width = 2203
integer height = 360
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 553648127
end type

