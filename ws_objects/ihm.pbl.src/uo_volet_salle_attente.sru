$PBExportHeader$uo_volet_salle_attente.sru
forward
global type uo_volet_salle_attente from userobject
end type
type dw_suivi_clinique from datawindow within uo_volet_salle_attente
end type
type cb_raffraichir from picturebutton within uo_volet_salle_attente
end type
type dw_surveillance from datawindow within uo_volet_salle_attente
end type
type st_horloge from statictext within uo_volet_salle_attente
end type
type dw_liste from u_basedw within uo_volet_salle_attente
end type
end forward

global type uo_volet_salle_attente from userobject
integer width = 2066
integer height = 3148
long backcolor = 16777215
string text = "none"
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
dw_suivi_clinique dw_suivi_clinique
cb_raffraichir cb_raffraichir
dw_surveillance dw_surveillance
st_horloge st_horloge
dw_liste dw_liste
end type
global uo_volet_salle_attente uo_volet_salle_attente

type variables
m_etat_rdv newmenu
boolean PatientsDevantArgent, AlerteProchainReglement
integer  alerte_dep
long alerte_retard
integer nb_jours_alerte_dep

string v_souligner_adulte

integer nb_jours_surveillance
boolean surveillance, suivi_clinique
end variables

forward prototypes
public subroutine prepa ()
public subroutine init ()
public subroutine resize ()
end prototypes

public subroutine prepa ();//string pra_min,pra_max
//date var_date,v_da
//integer cpt,f_min,f_max
//

long lig, tot, tot_avec_filtre_salle_attente
double v_code_patient
datetime v_rdv

string pra_min, pra_max, v_fichier_salle_attente
date var_date
integer f_min, f_max

string s_fauteuils_specifiques, s_filtre

pra_min="      "
pra_max="ZZZZZZ"

var_date = today()

f_min = 0
f_max = 99


// Depuis  V2026 on tient compte de la config de la salle d'attente

// praticiens
If profilestring(dir_ini+inifile_orthokis,"rendez-vous","salle_attente_auto_tous","true") = "false" then

	If profilestring(dir_ini+inifile_orthokis,"rendez-vous","salle_attente_auto_tous","true") = "defaut" then
		// Praticien par defaut de l'utilisateur
		pra_min = fxg_get_praticien_par_defaut()
	else
		// Praticien config dans les param du poste
		pra_min = profilestring(dir_ini+inifile_orthokis,"rendez-vous","salle_attente_auto_praticiens",fxg_get_praticien_par_defaut())
	end if
	pra_max = pra_min
end if

s_fauteuils_specifiques = trim(ProfileString(dir_ini+inifile_orthokis,"rendez-vous","sa_fauteuils_specifiques",""))

if s_fauteuils_specifiques <> "" then 

	s_filtre = get_filtre_fauteuils_specifiques(s_fauteuils_specifiques)

		f_min = 0
		f_max = 99
		
	dw_liste.setfilter(s_filtre)
	dw_liste.filter()
end if

	
	
	
// Mise à jour des éléments par défaut dans table_vide
update table_vide  set v1 = 'N', v2 = 'A'  ;
commit ;
	


dw_liste.retrieve(pra_min,pra_max,var_date,f_min,f_max, alerte_dep, relativedate(today() , - nb_jours_alerte_dep), relativedate(today() , + nb_jours_alerte_dep) , alerte_retard , v_souligner_adulte )

	
tot = dw_liste.rowcount()
for lig = 1 to tot
	dw_liste.SetItem(lig, "meme_famille", "N")
next 
		

	
if profilestring(dir_ini+inifile_orthokis,"rendez-vous","materialiser_meme_famille","false") = "true" then
	// Materialiser meme famille

	for lig = 1 to tot
		
		v_code_patient = dw_liste.getitemNumber(lig, "patient_code")
		v_rdv = dw_liste.getitemDateTime(lig, "rdv_rdv")

		if nombre_rdv_meme_famille_jour_meme(v_code_patient, v_rdv)  > 0 then
			dw_liste.SetItem(lig, "meme_famille", "O")
		end if
	next 
	
end if

if surveillance then
	dw_surveillance.retrieve(relativedate(today(), nb_jours_surveillance))
	if dw_surveillance.rowcount() = 0 then 
		dw_surveillance.visible = false
	else
		dw_surveillance.visible = true
	end if
end if

if suivi_clinique then
	dw_suivi_clinique.retrieve(pra_min,pra_max,var_date,f_min,f_max, v_souligner_adulte )
	if dw_suivi_clinique.rowcount() = 0 then 
		dw_suivi_clinique.visible = false
	else
		dw_suivi_clinique.visible = true
	end if
end if

// Comptage des patients en salle d'attente => mise à jour du menu patient
if profilestring(dir_ini+inifile_orthokis,"rendez-vous","compteur_menu_patient","false") = "true" and tot <> i_nombre_patients_en_salle_attente  then

	// Affichage du badge de comptage !
	if tot = 0 then
		v_fichier_salle_attente =  "lc_salle_attente.png"
	else
		if tot < 10 then
			v_fichier_salle_attente =  "lc_salle_attente_" + string(tot) + ".png"
		else
			v_fichier_salle_attente =  "lc_salle_attente_+.png"
		end if
	end if
	m_orthokis_2020.m_patients.m_salledattente0.ToolbarItemName = v_fichier_salle_attente
	w_mdi_2020.of_rebuildribbon (true)
	
	i_nombre_patients_en_salle_attente = tot
	
end if


end subroutine

public subroutine init ();integer cpt
string s_filtre

dw_liste.settransobject(sqlca)

// crétation du menu des états de rdv qui ouvre
newmenu = create m_etat_rdv

declare cur_etat cursor for select code, nom 
from etat_rdv
where ouverture_automatique = 'O' and actif = 1 ;

string v_code_etat, v_nom_etat ;
integer v_cpt

open cur_etat ;

fetch cur_etat into :v_code_etat, :v_nom_etat ;
v_cpt = 1
do while sqlca.sqlcode = 0 and cpt < 10

	choose case v_cpt
		case 1
			newmenu.m_etat1.visible = true
			newmenu.m_etat1.text = v_nom_etat
			newmenu.m_etat1.tag = v_code_etat
		case 2
			newmenu.m_etat2.visible = true
			newmenu.m_etat2.text = v_nom_etat
			newmenu.m_etat2.tag = v_code_etat
		case 3
			newmenu.m_etat3.visible = true
			newmenu.m_etat3.text = v_nom_etat
			newmenu.m_etat3.tag = v_code_etat
		case 4
			newmenu.m_etat4.visible = true
			newmenu.m_etat4.text = v_nom_etat
			newmenu.m_etat4.tag = v_code_etat
		case 5
			newmenu.m_etat5.visible = true
			newmenu.m_etat5.text = v_nom_etat
			newmenu.m_etat5.tag = v_code_etat
		case 6
			newmenu.m_etat6.visible = true
			newmenu.m_etat6.text = v_nom_etat
			newmenu.m_etat6.tag = v_code_etat
		case 7
			newmenu.m_etat7.visible = true
			newmenu.m_etat7.text = v_nom_etat
			newmenu.m_etat7.tag = v_code_etat
		case 8
			newmenu.m_etat8.visible = true
			newmenu.m_etat8.text = v_nom_etat
			newmenu.m_etat8.tag = v_code_etat
		case 9
			newmenu.m_etat9.visible = true
			newmenu.m_etat9.text = v_nom_etat
			newmenu.m_etat9.tag = v_code_etat
		case 10
			newmenu.m_etat10.visible = true
			newmenu.m_etat10.text = v_nom_etat
			newmenu.m_etat10.tag = v_code_etat
	end choose

	fetch cur_etat into :v_code_etat, :v_nom_etat ;
	v_cpt = v_cpt + 1
loop

close cur_etat ;

if newmenu.m_etat1.visible  then
	// il y a au moins 1 état d'ouverture configuré
	dw_liste.modify("b_etat.visible = 1")
end if



v_souligner_adulte = profilestring(dir_ini+inifile_orthokis,"admini","souligner_adultes","N")

// Alerte de retard
alerte_retard = long(profilestring(dir_ini+inifile_orthokis,"rendez-vous","minutes_retard_rdv_alerte","15"))

//indique-on les patients qui ont un prochain reglement ?
if profilestring(dir_ini+inifile_orthokis,"rendez-vous","alerte_prochain_reg","false") = "true" then
	AlerteProchainReglement = true
else
	AlerteProchainReglement = false
end if


// Alerte pour impression de DEP ?
if profilestring(dir_ini+inifile_orthokis,"rendez-vous","alerte_dep","false") = "true" then
	alerte_dep = 1
	nb_jours_alerte_dep = profileint(dir_ini+inifile_orthokis,"rendez-vous","nb_jours_alerte_dep",30)
else
	alerte_dep = 0
	nb_jours_alerte_dep = 0
end if

//indique-on les patients devant de l'argent ?
if profilestring(dir_ini+inifile_orthokis,"rendez-vous","patients_devant_argent","true") = "true" then
	PatientsDevantArgent = true
else
	PatientsDevantArgent = false
end if

// Filtre ou pas sur les praticiens 
// praticines
If profilestring(dir_ini+inifile_orthokis,"rendez-vous","salle_attente_auto_tous","true") = "true" then
	s_filtre = ""
else
	If profilestring(dir_ini+inifile_orthokis,"rendez-vous","salle_attente_auto_tous","true") = "defaut" then
		// Praticien par defaut de l'utilisateur
		s_filtre =  "rdv_code_praticien = '"+ fxg_get_praticien_par_defaut() + "'"
	else
		// Praticien config dans les param du poste
		s_filtre =  "rdv_code_praticien = '"+	profilestring(dir_ini+inifile_orthokis,"rendez-vous","salle_attente_auto_praticiens","")+"'"
	end if
	dw_liste.setFilter(s_filtre)
end if



// Le tri mini salle d'attente  

if profilestring(dir_ini+inifile_orthokis,"rendez-vous","mini_salle_attente_tri","R") = "A" then
	// Tri par heure d'arrivée
	dw_liste.setsort("rdv_arrivee, patient_nom_cherche, rdv_code, rdv_fauteuil")
	dw_liste.sort()
end if


// Surveillance dans le volet salle d'attente
if profilestring(dir_ini+inifile_orthokis,"rendez-vous","volet_salle_attente_surveillance","false") = "true" then
	surveillance = true
	nb_jours_surveillance = integer( profileString(dir_ini+inifile_orthokis,"rendez-vous","volet_salle_attente_surveillance_jours","30"))
	dw_surveillance.settransobject(sqlca)
end if

// Suivi clinique
if profilestring(dir_ini+inifile_orthokis,"rendez-vous","volet_salle_attente_suivi_clinique","false") ="true" then
	suivi_clinique = true
	dw_suivi_clinique.settransobject(sqlca)
end if


// Application des couleurs 
colore_datawindow (dw_surveillance)
colore_datawindow (dw_suivi_clinique)
colore_datawindow (dw_liste)


end subroutine

public subroutine resize ();if surveillance and not suivi_clinique then
	// Volet surveillance uniquement 
	dw_liste.height =  (this.height - 200) / 2
	dw_surveillance.y = dw_liste.y + dw_liste.height  + 20
	dw_surveillance.height = this.height - dw_surveillance.y - 200
	if dw_surveillance.rowcount() > 0 then
		dw_surveillance.visible = true
	end if
else
	if not surveillance and suivi_clinique then
		// Volet suivi clinique uniquement 
		dw_liste.height =  (this.height - 200) / 2
		dw_suivi_clinique.y = dw_liste.y + dw_liste.height  + 20
		dw_suivi_clinique.height = this.height - dw_surveillance.y - 200
		if dw_suivi_clinique.rowcount() > 0 then
			dw_suivi_clinique.visible = true
		end if
	else
		if surveillance and  suivi_clinique then
			// Volet surveillance ET suivi clinique 
			dw_liste.height =  (this.height - 200) / 3
			dw_surveillance.height =  (this.height - 200) / 3
			dw_suivi_clinique.height =  (this.height - 200) / 3
			
			
			dw_surveillance.y = dw_liste.y + dw_liste.height  + 5
			dw_suivi_clinique.y = dw_surveillance.y + dw_surveillance.height  + 5
			
			if dw_surveillance.rowcount() > 0 then
				dw_surveillance.visible = true
			end if
			if dw_suivi_clinique.rowcount() > 0 then
				dw_suivi_clinique.visible = true
			end if
			
			
		else
			// Aucun suivi .. que la salle d'attente ... 
			dw_liste.height = this.height - 200
		end if
	end if
end if

st_horloge.y = this.height - 150
cb_raffraichir.y = st_horloge.y - 30
end subroutine

on uo_volet_salle_attente.create
this.dw_suivi_clinique=create dw_suivi_clinique
this.cb_raffraichir=create cb_raffraichir
this.dw_surveillance=create dw_surveillance
this.st_horloge=create st_horloge
this.dw_liste=create dw_liste
this.Control[]={this.dw_suivi_clinique,&
this.cb_raffraichir,&
this.dw_surveillance,&
this.st_horloge,&
this.dw_liste}
end on

on uo_volet_salle_attente.destroy
destroy(this.dw_suivi_clinique)
destroy(this.cb_raffraichir)
destroy(this.dw_surveillance)
destroy(this.st_horloge)
destroy(this.dw_liste)
end on

type dw_suivi_clinique from datawindow within uo_volet_salle_attente
string tag = "brush"
boolean visible = false
integer y = 2356
integer width = 2025
integer height = 400
integer taborder = 30
boolean titlebar = true
string title = "Suivi clinique"
string dataobject = "dw_rdv_salle_attente_en_soins"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = styleraised!
end type

type cb_raffraichir from picturebutton within uo_volet_salle_attente
integer x = 955
integer y = 2980
integer width = 174
integer height = 152
integer taborder = 20
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "lc_reload.png"
alignment htextalign = left!
string powertiptext = "Actualisation des données"
long backcolor = 553648127
end type

event clicked;prepa()
end event

type dw_surveillance from datawindow within uo_volet_salle_attente
string tag = "brush"
boolean visible = false
integer y = 1936
integer width = 2025
integer height = 400
integer taborder = 20
boolean titlebar = true
string title = "Surveillance de rendez-vous"
string dataobject = "dw_rdv_surveillance_salle_attente"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = styleraised!
end type

type st_horloge from statictext within uo_volet_salle_attente
integer y = 2984
integer width = 347
integer height = 128
boolean bringtotop = true
integer textsize = -20
integer weight = 700
fontcharset fontcharset = ansi!
string facename = "Arial"
long textcolor = 255
long backcolor = 553648127
boolean enabled = false
string text = "15:55"
alignment alignment = center!
boolean focusrectangle = false
end type

type dw_liste from u_basedw within uo_volet_salle_attente
string tag = "brush"
integer width = 2025
integer height = 2960
integer taborder = 10
string dataobject = "dw_rdv_salle_attente_mini"
end type

event buttonclicked;call super::buttonclicked;string ls_object
string code_retour
string v_nom_saisi
double var_code_local

ls_Object = String(dwo.name)

if row > 0  then
	
	if this.getItemNumber(row, "patient_code") > 0  then
	
		
		if ui_v2020 then
		
			// envoi d'email
			if  ls_Object = "b_etat" then
				
				dw_click = this
				
				if newmenu.m_etat2.visible then
					// y a au moins 2 éléments dans le devis 
					newmenu.popmenu(w_mdi_2020.PointerX(), w_mdi_2020.PointerY())
				else
					// 1 seul élément dans le menu ... on ouvre de suite
					newmenu.m_etat1.triggerevent(clicked!)
				end if
			end if
		
			
		end if
	end if
end if
end event

event doubleclicked;call super::doubleclicked;
if row > 0 then

	var_code 				= 	this.getitemnumber(row,"patient_code")
	var_numero_dossier 	= 	this.getitemnumber(row,"patient_numero_dossier")
	var_nom 				= this.getitemstring(row,"patient_nom_cherche")
	var_nomp 				= ""
	var_pay 					= ""
	var_moul 				= ""

	if var_code > 0  then
		ouverture_salle_attente()
	end if
end if




end event

event retrieveend;call super::retrieveend;
long v_cpt, nbtot

double v_code
date v_date_proc
decimal{2} v_montant

integer nb_jour 


if PatientsDevantArgent or AlerteProchainReglement then
	SetPointer(HourGlass!)

	nb_jour =  integer(profilestring(dir_ini+inifile_orthokis,"rendez-vous","nb_jours_alerte_prochain_reg","30"))
	
	this.SetRedraw(false)
	// On parcours la salle d'attente pour matérialiser les gens qui doivent de l'argent
	nbtot = dw_liste.rowcount()
	
	for v_cpt = 1 to nbtot
		
		v_code = dw_liste.getitemnumber(v_cpt,"patient_code")
		
		// On met le champ due qui entraine une mise en rouge ou bleu des éléments de la ligne
		// O : doit de l'argent => rouge
		// N : rien : noir
		// P : Alerte prochain reglement
		dw_liste.setitem(v_cpt,"due","N")
		
		if AlerteProchainReglement then
			proc_reglt ( v_code,v_date_proc, v_montant , 'D')	// Met à jour la date
			
			if daysAfter(today() , v_date_proc) <= nb_jour then
				dw_liste.setitem(v_cpt,"due","P")
			end if
		end if
		
		if PatientsDevantArgent then
			if due (v_code,today()) > 0 then
				dw_liste.setitem(v_cpt,"due","O")
			else
				// TP devant de l'argent
				if due_tp (v_code,today()) > 0 then
					dw_liste.setitem(v_cpt,"due","T")
				end if
			end if
		end if
		
			
		// On considère que la ligne n'est pas modifiée sinon ça merdera ensuite sur les heures d'arrivée
		dw_liste.SetItemStatus(v_cpt, "due", Primary!, NotModified!)
		
	next
	
	
	this.SetRedraw(true)
	

	
	SetPointer(Arrow!)
	
end if	

st_horloge.text = string(now(), "hh:mm")

end event

