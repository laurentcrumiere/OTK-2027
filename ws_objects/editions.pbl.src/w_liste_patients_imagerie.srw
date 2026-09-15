$PBExportHeader$w_liste_patients_imagerie.srw
$PBExportComments$Héritée de liste_patients
forward
global type w_liste_patients_imagerie from w_liste_patients
end type
type rb_tous_temps from radiobutton within w_liste_patients_imagerie
end type
type rb_un_temps from radiobutton within w_liste_patients_imagerie
end type
type rb_tous_types from radiobutton within w_liste_patients_imagerie
end type
type rb_un_type from radiobutton within w_liste_patients_imagerie
end type
type dw_type from datawindow within w_liste_patients_imagerie
end type
type dw_temps from datawindow within w_liste_patients_imagerie
end type
type st_1 from statictext within w_liste_patients_imagerie
end type
type st_3 from statictext within w_liste_patients_imagerie
end type
type em_date_min from uo_date_calendrier within w_liste_patients_imagerie
end type
type em_date_max from uo_date_calendrier within w_liste_patients_imagerie
end type
type rb_presence from radiobutton within w_liste_patients_imagerie
end type
type rb_absence from radiobutton within w_liste_patients_imagerie
end type
type dw_dossier from datawindow within w_liste_patients_imagerie
end type
type rb_tous_dossiers from radiobutton within w_liste_patients_imagerie
end type
type rb_un_dossier from radiobutton within w_liste_patients_imagerie
end type
type st_2 from statictext within w_liste_patients_imagerie
end type
type st_gene1 from statictext within w_liste_patients_imagerie
end type
type st_clase from statictext within w_liste_patients_imagerie
end type
type st_4 from statictext within w_liste_patients_imagerie
end type
type st_5 from statictext within w_liste_patients_imagerie
end type
type dw_classe from datawindow within w_liste_patients_imagerie
end type
type dw_type_clinique from datawindow within w_liste_patients_imagerie
end type
type uo_filtre_email from uo_filtre_emails within w_liste_patients_imagerie
end type
type cb_exporter from uo_picturebutton_390x120 within w_liste_patients_imagerie
end type
type gb_2 from groupbox within w_liste_patients_imagerie
end type
type gb_3 from groupbox within w_liste_patients_imagerie
end type
type gb_4 from groupbox within w_liste_patients_imagerie
end type
type gb_5 from groupbox within w_liste_patients_imagerie
end type
type gb_7 from groupbox within w_liste_patients_imagerie
end type
end forward

global type w_liste_patients_imagerie from w_liste_patients
string title = "Liste des Patients selon Imagerie"
rb_tous_temps rb_tous_temps
rb_un_temps rb_un_temps
rb_tous_types rb_tous_types
rb_un_type rb_un_type
dw_type dw_type
dw_temps dw_temps
st_1 st_1
st_3 st_3
em_date_min em_date_min
em_date_max em_date_max
rb_presence rb_presence
rb_absence rb_absence
dw_dossier dw_dossier
rb_tous_dossiers rb_tous_dossiers
rb_un_dossier rb_un_dossier
st_2 st_2
st_gene1 st_gene1
st_clase st_clase
st_4 st_4
st_5 st_5
dw_classe dw_classe
dw_type_clinique dw_type_clinique
uo_filtre_email uo_filtre_email
cb_exporter cb_exporter
gb_2 gb_2
gb_3 gb_3
gb_4 gb_4
gb_5 gb_5
gb_7 gb_7
end type
global w_liste_patients_imagerie w_liste_patients_imagerie

forward prototypes
public subroutine prepa ()
end prototypes

public subroutine prepa ();string v_type_dossier_min, v_type_dossier_max
string pra_min,pra_max
double v_type_min, v_type_max
double v_temps_min, v_temps_max
date v_date_min, v_date_max

double code_min,code_max

string titre

if not prepa_faite then
	//prepa_faite = true
	
	// Praticien
	if rb_tous.checked then
		pra_min="      "
		pra_max="ZZZZZZ"
		Titre = "Tous praticiens"
	else
		pra_min=dw_prati.getitemstring(dw_prati.getrow(),"code")
		pra_max=dw_prati.getitemstring(dw_prati.getrow(),"code")
		Titre = "Un praticien"
	end if

	// Type de dossier
	if rb_tous_dossiers.checked then
		v_type_dossier_min=""
		v_type_dossier_max ="ZZ"
		Titre = "Tous Dossiers"
	else
		v_type_dossier_min = dw_dossier.getitemstring(dw_dossier.getrow(),"code")
		v_type_dossier_max = v_type_dossier_min
		Titre = "Un type Dossier"
	end if

	// Temps de traitement
	if rb_tous_temps.checked then
		v_temps_min = 0
		v_temps_max = max_double
		Titre = Titre + " - Tous temps"
	else
		v_temps_min = dw_temps.getitemNumber(dw_temps.getrow(),"id")
		v_temps_max = v_temps_min
		Titre = Titre + " - Un temps"
	end if

	// Types d'images
	if rb_tous_types.checked then
		v_type_min = 0
		v_type_max = max_double
		Titre = Titre + " - Tous types"
	else
		v_type_min = dw_type.getitemNumber(dw_type.getrow(),"id")
		v_type_max = v_type_min
		Titre = Titre + " - Un type Image"
		cb_exporter.enabled ( true)
	end if


	code_min = double(em_min.text)
	code_max = double(em_max.text)

	Titre = Titre + " - Du dossier "+string(code_min)+" au "+string(code_max)
	
	v_date_min = em_date_min.gettheDate()
	v_date_max = em_date_max.gettheDate()

	Titre = Titre + " - Du "+string(v_date_min)+" au "+string(v_date_max)


	string filtre
	
	// Absence ou présence ?
	if rb_presence.checked then
		filtre = "nb_images > 0"
		Titre = Titre + " - Présence"
	else
		filtre = "nb_images = 0"
		Titre = Titre + " - Absence"
	end if

	dw_liste.setfilter(filtre)
	dw_liste.filter()
	uo_filtre_email.filtre_initial = filtre
	
	string v_type, v_classe
	v_type = dw_type_clinique.gettext()
	v_classe = dw_classe.gettext()
	
	titre = titre +"~nClasse : "+v_classe+" - Type : "+v_type
	
	open(w_patience)
	
	dw_liste.object.titre.text = titre

	dw_liste.retrieve(code_min,code_max,pra_min,pra_max,v_type_dossier_min, v_type_dossier_max, v_temps_min , v_temps_max, v_type_min, v_type_max, v_date_min, v_date_max, v_classe, v_type)
	close(w_patience)

	//em_nb.text = string(dw_liste.rowcount())+" Dossiers"
	//em_nb.visible = true
end if

end subroutine

on w_liste_patients_imagerie.create
int iCurrent
call super::create
this.rb_tous_temps=create rb_tous_temps
this.rb_un_temps=create rb_un_temps
this.rb_tous_types=create rb_tous_types
this.rb_un_type=create rb_un_type
this.dw_type=create dw_type
this.dw_temps=create dw_temps
this.st_1=create st_1
this.st_3=create st_3
this.em_date_min=create em_date_min
this.em_date_max=create em_date_max
this.rb_presence=create rb_presence
this.rb_absence=create rb_absence
this.dw_dossier=create dw_dossier
this.rb_tous_dossiers=create rb_tous_dossiers
this.rb_un_dossier=create rb_un_dossier
this.st_2=create st_2
this.st_gene1=create st_gene1
this.st_clase=create st_clase
this.st_4=create st_4
this.st_5=create st_5
this.dw_classe=create dw_classe
this.dw_type_clinique=create dw_type_clinique
this.uo_filtre_email=create uo_filtre_email
this.cb_exporter=create cb_exporter
this.gb_2=create gb_2
this.gb_3=create gb_3
this.gb_4=create gb_4
this.gb_5=create gb_5
this.gb_7=create gb_7
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.rb_tous_temps
this.Control[iCurrent+2]=this.rb_un_temps
this.Control[iCurrent+3]=this.rb_tous_types
this.Control[iCurrent+4]=this.rb_un_type
this.Control[iCurrent+5]=this.dw_type
this.Control[iCurrent+6]=this.dw_temps
this.Control[iCurrent+7]=this.st_1
this.Control[iCurrent+8]=this.st_3
this.Control[iCurrent+9]=this.em_date_min
this.Control[iCurrent+10]=this.em_date_max
this.Control[iCurrent+11]=this.rb_presence
this.Control[iCurrent+12]=this.rb_absence
this.Control[iCurrent+13]=this.dw_dossier
this.Control[iCurrent+14]=this.rb_tous_dossiers
this.Control[iCurrent+15]=this.rb_un_dossier
this.Control[iCurrent+16]=this.st_2
this.Control[iCurrent+17]=this.st_gene1
this.Control[iCurrent+18]=this.st_clase
this.Control[iCurrent+19]=this.st_4
this.Control[iCurrent+20]=this.st_5
this.Control[iCurrent+21]=this.dw_classe
this.Control[iCurrent+22]=this.dw_type_clinique
this.Control[iCurrent+23]=this.uo_filtre_email
this.Control[iCurrent+24]=this.cb_exporter
this.Control[iCurrent+25]=this.gb_2
this.Control[iCurrent+26]=this.gb_3
this.Control[iCurrent+27]=this.gb_4
this.Control[iCurrent+28]=this.gb_5
this.Control[iCurrent+29]=this.gb_7
end on

on w_liste_patients_imagerie.destroy
call super::destroy
destroy(this.rb_tous_temps)
destroy(this.rb_un_temps)
destroy(this.rb_tous_types)
destroy(this.rb_un_type)
destroy(this.dw_type)
destroy(this.dw_temps)
destroy(this.st_1)
destroy(this.st_3)
destroy(this.em_date_min)
destroy(this.em_date_max)
destroy(this.rb_presence)
destroy(this.rb_absence)
destroy(this.dw_dossier)
destroy(this.rb_tous_dossiers)
destroy(this.rb_un_dossier)
destroy(this.st_2)
destroy(this.st_gene1)
destroy(this.st_clase)
destroy(this.st_4)
destroy(this.st_5)
destroy(this.dw_classe)
destroy(this.dw_type_clinique)
destroy(this.uo_filtre_email)
destroy(this.cb_exporter)
destroy(this.gb_2)
destroy(this.gb_3)
destroy(this.gb_4)
destroy(this.gb_5)
destroy(this.gb_7)
end on

event open;call super::open;

dw_temps.settransobject(sqlca)
dw_temps.retrieve()

dw_type.settransobject(sqlca)
dw_type.retrieve()

dw_dossier.settransobject(sqlca)
dw_dossier.retrieve()

dw_classe.settransobject(sqlca)
dw_classe.retrieve()

dw_type_clinique.settransobject(sqlca)
dw_type_clinique.retrieve()

em_date_min.SetDate(date(year(today()), 1, 1))
em_date_max.SetDate(today())

if dw_classe.rowcount() = 0 then
	dw_classe.Insertrow(0)
end if
if dw_type_clinique.rowcount() = 0 then
	dw_type_clinique.Insertrow(0)
end if


dw_classe.SetItem(1, "libelle", "%")
dw_type_clinique.SetItem(1, "libelle", "%")

uo_filtre_email.dw_liste = dw_liste
uo_filtre_email.em_statut_mere = em_nb

// Spécial 
if SERIAL = "87994" then
	cb_exporter.visible = true
end if

end event

type p_fond from w_liste_patients`p_fond within w_liste_patients_imagerie
integer x = 2674
integer y = 272
end type

type cb_imprimer from w_liste_patients`cb_imprimer within w_liste_patients_imagerie
integer x = 2743
end type

type cb_autre from w_liste_patients`cb_autre within w_liste_patients_imagerie
integer x = 2263
end type

event cb_autre::clicked;call super::clicked;cb_exporter.enabled ( false)
end event

type cb_fermer from w_liste_patients`cb_fermer within w_liste_patients_imagerie
integer x = 3223
integer taborder = 120
end type

type cb_ecran from w_liste_patients`cb_ecran within w_liste_patients_imagerie
integer x = 553
integer taborder = 130
end type

type cb_lien_word from w_liste_patients`cb_lien_word within w_liste_patients_imagerie
end type

type uo_size from w_liste_patients`uo_size within w_liste_patients_imagerie
end type

type rb_un from w_liste_patients`rb_un within w_liste_patients_imagerie
integer x = 389
integer y = 212
end type

type rb_tous from w_liste_patients`rb_tous within w_liste_patients_imagerie
integer x = 389
integer y = 116
end type

type em_nb from w_liste_patients`em_nb within w_liste_patients_imagerie
end type

type em_max from w_liste_patients`em_max within w_liste_patients_imagerie
integer y = 420
end type

type em_min from w_liste_patients`em_min within w_liste_patients_imagerie
integer y = 420
end type

type dw_1 from w_liste_patients`dw_1 within w_liste_patients_imagerie
end type

type gb_1 from w_liste_patients`gb_1 within w_liste_patients_imagerie
integer y = 36
end type

type dw_prati from w_liste_patients`dw_prati within w_liste_patients_imagerie
boolean visible = true
integer y = 216
end type

type cbx_filtre from w_liste_patients`cbx_filtre within w_liste_patients_imagerie
end type

type st_min from w_liste_patients`st_min within w_liste_patients_imagerie
integer y = 432
end type

type st_max from w_liste_patients`st_max within w_liste_patients_imagerie
integer y = 432
end type

type dw_liste from w_liste_patients`dw_liste within w_liste_patients_imagerie
integer x = 9
integer height = 1848
string dataobject = "dw_liste_patients_imagerie_edition"
end type

type rb_tous_temps from radiobutton within w_liste_patients_imagerie
integer x = 389
integer y = 1264
integer width = 402
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 15780518
string text = "Toutes"
boolean checked = true
end type

event clicked;dw_temps.visible = false
end event

type rb_un_temps from radiobutton within w_liste_patients_imagerie
integer x = 389
integer y = 1364
integer width = 402
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 15780518
string text = "Une"
end type

event clicked;dw_temps.visible = true
end event

type rb_tous_types from radiobutton within w_liste_patients_imagerie
integer x = 389
integer y = 1588
integer width = 402
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 15780518
string text = "Tous"
boolean checked = true
end type

event clicked;dw_type.visible = false
end event

type rb_un_type from radiobutton within w_liste_patients_imagerie
integer x = 389
integer y = 1688
integer width = 402
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 15780518
string text = "Un"
end type

event clicked;dw_type.visible = true
end event

type dw_type from datawindow within w_liste_patients_imagerie
string tag = "position brush"
boolean visible = false
integer x = 809
integer y = 1688
integer width = 1307
integer height = 80
integer taborder = 50
boolean bringtotop = true
string title = "none"
string dataobject = "dw_type_image_cherche"
boolean border = false
boolean livescroll = true
end type

type dw_temps from datawindow within w_liste_patients_imagerie
string tag = "position brush"
boolean visible = false
integer x = 809
integer y = 1364
integer width = 1120
integer height = 76
integer taborder = 60
boolean bringtotop = true
string title = "none"
string dataobject = "dw_temps_traitement_cherche"
boolean border = false
boolean livescroll = true
end type

type st_1 from statictext within w_liste_patients_imagerie
integer x = 343
integer y = 616
integer width = 878
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
string facename = "Arial"
boolean underline = true
long backcolor = 553648127
string text = "Date des images :"
end type

type st_3 from statictext within w_liste_patients_imagerie
integer x = 507
integer y = 724
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

type em_date_min from uo_date_calendrier within w_liste_patients_imagerie
integer x = 814
integer y = 716
integer taborder = 250
boolean bringtotop = true
end type

on em_date_min.destroy
call uo_date_calendrier::destroy
end on

type em_date_max from uo_date_calendrier within w_liste_patients_imagerie
integer x = 1563
integer y = 716
integer taborder = 260
boolean bringtotop = true
end type

on em_date_max.destroy
call uo_date_calendrier::destroy
end on

type rb_presence from radiobutton within w_liste_patients_imagerie
integer x = 2542
integer y = 1592
integer width = 667
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 15780518
string text = "Présence d~'Images"
boolean checked = true
end type

type rb_absence from radiobutton within w_liste_patients_imagerie
integer x = 2542
integer y = 1688
integer width = 667
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 15780518
string text = "Absence d~'Images"
end type

type dw_dossier from datawindow within w_liste_patients_imagerie
string tag = "position brush"
boolean visible = false
integer x = 809
integer y = 1036
integer width = 937
integer height = 76
integer taborder = 80
boolean bringtotop = true
string dataobject = "dw_cherche_dossier"
boolean border = false
end type

type rb_tous_dossiers from radiobutton within w_liste_patients_imagerie
integer x = 389
integer y = 936
integer width = 402
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 15780518
string text = "Toutes"
boolean checked = true
end type

event clicked;dw_dossier.visible = false
end event

type rb_un_dossier from radiobutton within w_liste_patients_imagerie
integer x = 389
integer y = 1036
integer width = 402
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 15780518
string text = "Un"
end type

event clicked;dw_dossier.visible = true
end event

type st_2 from statictext within w_liste_patients_imagerie
integer x = 1257
integer y = 724
integer width = 256
integer height = 72
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
string facename = "Arial"
long backcolor = 553648127
string text = "et le"
alignment alignment = center!
end type

type st_gene1 from statictext within w_liste_patients_imagerie
integer x = 2770
integer y = 1056
integer width = 855
integer height = 152
boolean bringtotop = true
integer textsize = -8
fontcharset fontcharset = ansi!
string facename = "Arial"
boolean italic = true
long textcolor = 16711680
long backcolor = 553648127
string text = "Vous pouvez utiliser le caractère % comme générique (y compris à la fin)"
end type

type st_clase from statictext within w_liste_patients_imagerie
integer x = 2491
integer y = 976
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

type st_4 from statictext within w_liste_patients_imagerie
integer x = 2491
integer y = 1168
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

type st_5 from statictext within w_liste_patients_imagerie
integer x = 2770
integer y = 1276
integer width = 855
integer height = 152
boolean bringtotop = true
integer textsize = -8
fontcharset fontcharset = ansi!
string facename = "Arial"
boolean italic = true
long textcolor = 16711680
long backcolor = 553648127
string text = "Vous pouvez utiliser le caractère % comme générique (y compris à la fin)"
end type

type dw_classe from datawindow within w_liste_patients_imagerie
string tag = "no resize all brush"
integer x = 2770
integer y = 976
integer width = 855
integer height = 72
integer taborder = 100
boolean bringtotop = true
string title = "none"
string dataobject = "dw_cherche_clinique_classe"
boolean border = false
boolean livescroll = true
end type

type dw_type_clinique from datawindow within w_liste_patients_imagerie
string tag = "no resize all brush"
integer x = 2770
integer y = 1176
integer width = 859
integer height = 72
integer taborder = 110
boolean bringtotop = true
string title = "none"
string dataobject = "dw_cherche_clinique_type"
boolean border = false
boolean livescroll = true
end type

type uo_filtre_email from uo_filtre_emails within w_liste_patients_imagerie
string tag = "no resize all"
integer x = 1033
integer y = 1856
integer taborder = 200
boolean bringtotop = true
end type

on uo_filtre_email.destroy
call uo_filtre_emails::destroy
end on

type cb_exporter from uo_picturebutton_390x120 within w_liste_patients_imagerie
boolean visible = false
integer x = 1783
integer y = 1868
integer width = 457
integer taborder = 210
boolean bringtotop = true
boolean enabled = false
string text = "Exporter"
string iconname = "ACTIONS_exporter.png"
end type

event clicked;call super::clicked;
// On est forcément dans le cas où 1 type d'image est sélection (et pas tous)

string v_rep_destination, v_nom_fichier, v_nom_fichier_destination, v_nom_fichier_depart
integer lig, tot
double v_code_patient, v_type_image
integer v_cpt = 0
integer v_nb_images
string v_nom_patient, v_prenom_patient, v_rep_destination_patient, v_date_naissance_string
date v_date_naissance_patient
security_attributes sa

tot = dw_liste.rowcount()
v_type_image = dw_type.getitemNumber(dw_type.getrow(),"id")

declare  cur_images cursor for select isnull(nom_fichier, '') from images_infos where type_image = :v_type_image and code = :v_code_patient order by date_acquis asc ;

if tot > 0 then 
	
	v_rep_destination = get_repertoire("Dossier de destination", "c:\")
	
	
	if messagebox("ATTENTION", "Confirmez-vous l'exportation des images de ces " + string(tot) + " patients ?", Question!, YesNo!, 2) = 1 then 
		
		open(w_patience)
		
		for lig = 1 to tot
			
			w_patience.avancement(string(lig) + " / " + string(tot))
			
			yield()
			
			v_code_patient = dw_liste.getitemnumber(lig, "code")
			
			 select isnull(count(*),0) into :v_nb_images  from images_infos where type_image = :v_type_image and code = :v_code_patient ;
			 
			// il peut y en avoir plusieurs pour le meme patient ... 
		
			
			if v_nb_images > 0  then 
				// Il y a au moins une image => on crée le dossier ?
				
				// On met les images dans un dossier par patient
				select isnull(nom,'X'), isnull(prenom,'X'), date_naissance 
				into : v_nom_patient, :v_prenom_patient, :v_date_naissance_patient 
				from patient where code = :v_code_patient ;
				
				if isnull(v_date_naissance_patient) then
					v_date_naissance_string = "X"
				else
					v_date_naissance_string = string(v_date_naissance_patient, "dd-mm-yyyy")
				end if

				if trim(v_nom_patient) = "" then 
					v_nom_patient = "X"
				end if
					if trim(v_prenom_patient) = "" then 
					v_prenom_patient = "X"
				end if
				v_rep_destination_patient = v_rep_destination + v_nom_patient + " - " + v_prenom_patient+ " - " + v_date_naissance_string 
				
				if not directoryexists(v_rep_destination_patient) then
					CreateDirectoryA(v_rep_destination_patient, sa)
				end if
				
				v_rep_destination_patient = v_rep_destination_patient + win_delimiter
		
			end if
			
			// On parcours les images
			open cur_images ;
			fetch cur_images into :v_nom_fichier ; 
			do while sqlca.sqlcode = 0 
				v_nom_fichier_depart = dir_photos + string(v_code_patient) + win_delimiter + v_nom_fichier
				v_nom_fichier_destination = v_rep_destination_patient + v_nom_fichier
				if filecopy(v_nom_fichier_depart, v_nom_fichier_destination ) = 1 then 
					v_cpt = v_cpt + 1
					
				end if
				
				fetch cur_images into :v_nom_fichier ; 
			loop
			close cur_images ;

			
		next
		
		close(w_patience)
		
		messagebox("INFORMATION", string(v_cpt) + " images ont été recopiées !")

	
	
	end if
else
	Messagebox("ATTENTION", "Auncun patient dans la liste !")
end if


end event

type gb_2 from groupbox within w_liste_patients_imagerie
integer x = 283
integer y = 1180
integer width = 2121
integer height = 304
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean italic = true
long textcolor = 33554432
long backcolor = 15780518
string text = "Etape de Traitement"
end type

type gb_3 from groupbox within w_liste_patients_imagerie
integer x = 283
integer y = 1504
integer width = 2121
integer height = 304
integer taborder = 40
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean italic = true
long textcolor = 33554432
long backcolor = 15780518
string text = "Type d~'Image"
end type

type gb_4 from groupbox within w_liste_patients_imagerie
integer x = 2437
integer y = 1504
integer width = 1266
integer height = 304
integer taborder = 60
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean italic = true
long textcolor = 33554432
long backcolor = 15780518
string text = "Type de Liste"
end type

type gb_5 from groupbox within w_liste_patients_imagerie
integer x = 283
integer y = 844
integer width = 2121
integer height = 304
integer taborder = 40
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean italic = true
long textcolor = 33554432
long backcolor = 15780518
string text = "Type de Dossier"
end type

type gb_7 from groupbox within w_liste_patients_imagerie
integer x = 2437
integer y = 876
integer width = 1266
integer height = 608
integer taborder = 50
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean italic = true
long textcolor = 33554432
long backcolor = 15780518
string text = "Classe / Type"
end type

