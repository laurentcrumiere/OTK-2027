$PBExportHeader$w_synchronisation.srw
forward
global type w_synchronisation from w_fenetre_arakis
end type
type pb_1 from uo_picturebutton_390x120_fermer within w_synchronisation
end type
type pb_imprimer from uo_picturebutton_390x120 within w_synchronisation
end type
type dw_rapport from datawindow within w_synchronisation
end type
type pb_parametrage from uo_picturebutton_390x120 within w_synchronisation
end type
type st_2 from statictext within w_synchronisation
end type
type st_1 from statictext within w_synchronisation
end type
type st_3 from statictext within w_synchronisation
end type
type hpb_etat from hprogressbar within w_synchronisation
end type
type pb_2 from uo_picturebutton_390x120 within w_synchronisation
end type
type st_etape from statictext within w_synchronisation
end type
type st_etat from statictext within w_synchronisation
end type
type em_date_max from editmask within w_synchronisation
end type
type em_date_min from editmask within w_synchronisation
end type
type dw_prati from datawindow within w_synchronisation
end type
type pb_synchro from uo_picturebutton_390x120 within w_synchronisation
end type
type pb_fermer from uo_picturebutton_390x120_fermer within w_synchronisation
end type
type gb_avancement from groupbox within w_synchronisation
end type
end forward

global type w_synchronisation from w_fenetre_arakis
integer width = 2107
integer height = 1460
string title = "Synchronisation Agenda <-> Outlook"
boolean minbox = false
boolean maxbox = false
boolean resizable = false
windowtype windowtype = response!
long backcolor = 15780518
pb_1 pb_1
pb_imprimer pb_imprimer
dw_rapport dw_rapport
pb_parametrage pb_parametrage
st_2 st_2
st_1 st_1
st_3 st_3
hpb_etat hpb_etat
pb_2 pb_2
st_etape st_etape
st_etat st_etat
em_date_max em_date_max
em_date_min em_date_min
dw_prati dw_prati
pb_synchro pb_synchro
pb_fermer pb_fermer
gb_avancement gb_avancement
end type
global w_synchronisation w_synchronisation

type variables

// Elements outllok pour le parcours ...
oleobject objNamespace, ole_folder, ole_folder_filtre
oleobject tous_les_rdv, rdv_filtre, rdv_courant


int olFolderCalendar = 9
end variables

forward prototypes
public function string formatage_ligne_corps_rdv_groupe (datetime v_rdv, string v_nom, string v_prenom, integer v_fauteuil, string v_type_rdv, integer v_duree)
public subroutine supprimer_rdv (ref uo_ole_outlook uo)
public function boolean is_jour_travaille (date v_jour)
public function boolean is_chevauche_rdv (datetime v_rdv_analyse_debut, datetime v_rdv_analyse_fin)
public function boolean is_dans_periode_interdite (datetime v_rdv_analyse_debut, datetime v_rdv_analyse_fin)
public function boolean is_hors_agenda (datetime v_rdv_analyse_debut, datetime v_rdv_analyse_fin)
end prototypes

public function string formatage_ligne_corps_rdv_groupe (datetime v_rdv, string v_nom, string v_prenom, integer v_fauteuil, string v_type_rdv, integer v_duree);
string retour = ''

if profilestring(dir_ini+inifile_orthokis,"PDA","rdv_groupe_corps_heure", "O") = "O" then
	retour = retour + string(time(v_rdv),"hh:mm")+" "
end if

if profilestring(dir_ini+inifile_orthokis,"PDA","rdv_groupe_corps_nom_prenom", "O") = "O" then
	retour = retour + string_non_nulle(v_nom)+" "+string_non_nulle(v_prenom)+" "
end if

if profilestring(dir_ini+inifile_orthokis,"PDA","rdv_groupe_corps_fauteuil", "O") = "O" then
	retour = retour + "Faut. N°"+string(v_fauteuil)+" "
end if

if profilestring(dir_ini+inifile_orthokis,"PDA","rdv_groupe_corps_type_rdv", "O") = "O" then
	retour = retour + string_non_nulle(v_type_rdv) +" "
end if


if profilestring(dir_ini+inifile_orthokis,"PDA","rdv_groupe_corps_duree", "O") = "O" then
	retour = retour + string(v_duree)+"'"
end if


return retour
end function

public subroutine supprimer_rdv (ref uo_ole_outlook uo);		string filtre

		filtre = "[Start] >= '"+em_date_min.text+" 00:00 AM' and [Start] <= '"+em_date_max.text+" 08:00 AM'"

		
		integer cpt_a_supprimer, cpt_supprime, li_loop
		
		objNamespace = uo.GetNamespace("MAPI")
		ole_folder = objNamespace.GetDefaultFolder(olFolderCalendar)
	
		tous_les_rdv = ole_folder.Items
			
		rdv_filtre = tous_les_rdv.Restrict(filtre)
	
		cpt_a_supprimer = rdv_filtre.count
		cpt_supprime = 0
		
		if rdv_filtre.count > 0 then 
			
			for li_loop =  rdv_filtre.count to 1 step -1 
				
				// Est-ce bien un rdv Orthokis 
				if rdv_filtre.Item(li_loop).UserProperties.find("Orthokis") then

					cpt_supprime = cpt_supprime + 1
					st_etat.text = string(cpt_supprime)+"/"+string(cpt_a_supprimer)+" rdv supprimés"
					hpb_etat.position = (cpt_supprime / cpt_a_supprimer) * 100
					yield()
			
					//MessageBox("Subject : "+String(rdv_filtre.Item(li_loop).Subject),"Début :"+String(rdv_filtre.Item(li_loop).Start)+ " ~n~nDurée :"+String(rdv_filtre.Item(li_loop).Duration) )
					rdv_filtre.Item(li_loop).delete()
				end if
			next
	
//			Messagebox("trace",string(cpt_a_supprimer) + " rdv à supprimer~n~n"+string(cpt_supprime) + " rdv supprimés")


		end if
	

end subroutine

public function boolean is_jour_travaille (date v_jour);

// Renvoie vrai si le cabinet est ouvert ce jour là (lecture de a table agenda

boolean travaille

string v_lundi, v_mardi, v_mercredi, v_jeudi, v_vendredi, v_samedi, v_dimanche

select lundi, mardi, mercredi, jeudi, vendredi, samedi, dimanche 
into :v_lundi, :v_mardi, :v_mercredi, :v_jeudi, :v_vendredi, :v_samedi, :v_dimanche
from agenda 
where clef = 1 ;

travaille = false

if daynumber(v_jour) = 1 and v_dimanche = 'O' then
	travaille = true
end if

if daynumber(v_jour) = 2 and v_lundi = 'O' then
	travaille = true
end if

if daynumber(v_jour) = 3 and v_mardi = 'O' then
	travaille = true
end if

if daynumber(v_jour) = 4 and v_mercredi = 'O' then
	travaille = true
end if

if daynumber(v_jour) = 5 and v_jeudi = 'O' then
	travaille = true
end if

if daynumber(v_jour) = 6 and v_vendredi = 'O' then
	travaille = true
end if

if daynumber(v_jour) = 7 and v_samedi = 'O' then
	travaille = true
end if

return travaille



end function

public function boolean is_chevauche_rdv (datetime v_rdv_analyse_debut, datetime v_rdv_analyse_fin);
string v_code_praticien
long cpt_chev
boolean chevauchement

v_code_praticien = dw_prati.gettext()
chevauchement = false

// 1er cas : rdv analysé débute dans un rdv
cpt_chev = 0
select count(*) into :cpt_chev from rdv, etat_rdv 
where :v_rdv_analyse_debut between rdv.rdv and dateadd (minute, rdv.duree, rdv.rdv )  and
rdv.code_praticien = :v_code_praticien and	 etat_rdv.code = rdv.absent and etat_rdv.elimine_agenda <> 'O' ;

if cpt_chev > 0 then
	chevauchement = true
else
	// 2eme cas : rdv analysé fini dans un rdv
	cpt_chev = 0
	select count(*) into :cpt_chev from rdv, etat_rdv 
	where :v_rdv_analyse_fin between rdv.rdv and dateadd (minute, rdv.duree, rdv.rdv )  and
	rdv.code_praticien = :v_code_praticien and	 etat_rdv.code = rdv.absent and etat_rdv.elimine_agenda <> 'O' ;
	if cpt_chev > 0 then
		chevauchement = true
	else	
		// 3eme cas : début du rdv  dans un rdv_analysé
		cpt_chev = 0
		select count(*) into :cpt_chev from rdv, etat_rdv 
		where rdv.rdv between :v_rdv_analyse_debut and :v_rdv_analyse_fin  and
		rdv.code_praticien = :v_code_praticien and	 etat_rdv.code = rdv.absent and etat_rdv.elimine_agenda <> 'O' ;
		if cpt_chev > 0 then
			chevauchement = true
		else
			// 4eme cas : fin du rdv  dans un rdv_analysé
			cpt_chev = 0
			select count(*) into :cpt_chev from rdv, etat_rdv 
			where dateadd (minute, duree, rdv.rdv) between :v_rdv_analyse_debut and :v_rdv_analyse_fin  and
			rdv.code_praticien = :v_code_praticien and	 etat_rdv.code = rdv.absent and etat_rdv.elimine_agenda <> 'O' ;
			if cpt_chev > 0 then
				chevauchement = true
			end if
		end if
	end if	
end if



return chevauchement
end function

public function boolean is_dans_periode_interdite (datetime v_rdv_analyse_debut, datetime v_rdv_analyse_fin);
string v_code_praticien, v_tous
long cpt_dans_periode
boolean dans_periode

v_code_praticien = dw_prati.gettext()
dans_periode = false


// On regare si l'agenda est commun à tous les praticiens 
// Si c'est la cas, les jours interdits sont à TOUS


select tous into :v_tous from agenda where clef = 1 ;

if v_tous = 'O' then
	v_code_praticien = "TOUS"
end if

cpt_dans_periode = 0

v_rdv_analyse_fin = datetime( date(v_rdv_analyse_fin), relativetime( time(v_rdv_analyse_fin) , - 60))

select count(*) into :cpt_dans_periode from jours_interdits  
where date_debut <= :v_rdv_analyse_debut and :v_rdv_analyse_fin <= date_fin and code_praticien = :v_code_praticien  ;

if cpt_dans_periode > 0 then
	dans_periode = true
end if

return dans_periode

end function

public function boolean is_hors_agenda (datetime v_rdv_analyse_debut, datetime v_rdv_analyse_fin);

// Renvoie vrai si le cabinet est ouvert ce jour là (lecture de a table agenda

boolean hors_agenda

time v_heure_debut, v_heure_fin
time v_pause_debut, v_pause_fin






string v_lundi, v_mardi, v_mercredi, v_jeudi, v_vendredi, v_samedi, v_dimanche

select heure_debut, heure_fin,  pause_debut, pause_fin 
into :v_heure_debut, :v_heure_fin,  :v_pause_debut, :v_pause_fin 
from agenda 
where clef = 1 ;

hors_agenda = false

if time(v_rdv_analyse_fin) <= v_heure_debut then
	// le rendez-vous est avant l'ouverture
	hors_agenda = true
else
	// le rdv est après la fermeture
	if v_heure_fin <= time(v_rdv_analyse_debut) then
		hors_agenda = true	
	else
		// le rdv est dans la pause de midi
		if v_pause_debut <= time(v_rdv_analyse_debut) and time(v_rdv_analyse_fin) <= v_pause_fin then
			hors_agenda = true
		end if
	end if
	
end if

return hors_agenda



end function

on w_synchronisation.create
int iCurrent
call super::create
this.pb_1=create pb_1
this.pb_imprimer=create pb_imprimer
this.dw_rapport=create dw_rapport
this.pb_parametrage=create pb_parametrage
this.st_2=create st_2
this.st_1=create st_1
this.st_3=create st_3
this.hpb_etat=create hpb_etat
this.pb_2=create pb_2
this.st_etape=create st_etape
this.st_etat=create st_etat
this.em_date_max=create em_date_max
this.em_date_min=create em_date_min
this.dw_prati=create dw_prati
this.pb_synchro=create pb_synchro
this.pb_fermer=create pb_fermer
this.gb_avancement=create gb_avancement
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.pb_1
this.Control[iCurrent+2]=this.pb_imprimer
this.Control[iCurrent+3]=this.dw_rapport
this.Control[iCurrent+4]=this.pb_parametrage
this.Control[iCurrent+5]=this.st_2
this.Control[iCurrent+6]=this.st_1
this.Control[iCurrent+7]=this.st_3
this.Control[iCurrent+8]=this.hpb_etat
this.Control[iCurrent+9]=this.pb_2
this.Control[iCurrent+10]=this.st_etape
this.Control[iCurrent+11]=this.st_etat
this.Control[iCurrent+12]=this.em_date_max
this.Control[iCurrent+13]=this.em_date_min
this.Control[iCurrent+14]=this.dw_prati
this.Control[iCurrent+15]=this.pb_synchro
this.Control[iCurrent+16]=this.pb_fermer
this.Control[iCurrent+17]=this.gb_avancement
end on

on w_synchronisation.destroy
call super::destroy
destroy(this.pb_1)
destroy(this.pb_imprimer)
destroy(this.dw_rapport)
destroy(this.pb_parametrage)
destroy(this.st_2)
destroy(this.st_1)
destroy(this.st_3)
destroy(this.hpb_etat)
destroy(this.pb_2)
destroy(this.st_etape)
destroy(this.st_etat)
destroy(this.em_date_max)
destroy(this.em_date_min)
destroy(this.dw_prati)
destroy(this.pb_synchro)
destroy(this.pb_fermer)
destroy(this.gb_avancement)
end on

event open;call super::open;	
dw_prati.settransobject(sqlca)

dw_prati.retrieve()
long lig
lig = dw_prati.find("code = '"+profilestring(dir_ini+inifile_orthokis,"PDA","praticien", dw_prati.gettext())+"'",0,9999)
dw_prati.scrollToRow(lig)

centrer(this)

integer nb_semaines = 8

nb_semaines = integer(profilestring(dir_ini+inifile_orthokis,"PDA","semaines_scrutation", "8"))

em_date_min.text = string(today())
em_date_max.text = string(relativedate(today(), nb_semaines * 7))

// couleurs
gb_avancement.backcolor = couleur_fond_fenetre
 

//Placer_image_fond(this, p_image, "fond_outlook.jpg")
end event

type p_fond from w_fenetre_arakis`p_fond within w_synchronisation
end type

type pb_1 from uo_picturebutton_390x120_fermer within w_synchronisation
integer x = 1582
integer y = 1192
integer width = 480
integer taborder = 40
end type

type pb_imprimer from uo_picturebutton_390x120 within w_synchronisation
integer x = 983
integer y = 2316
integer width = 475
integer taborder = 30
string text = "&Imprimer"
end type

event clicked;call super::clicked;

dw_rapport.print()
end event

type dw_rapport from datawindow within w_synchronisation
boolean visible = false
integer width = 2880
integer height = 2260
integer taborder = 50
string title = "none"
string dataobject = "dw_rapport"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type pb_parametrage from uo_picturebutton_390x120 within w_synchronisation
integer x = 32
integer y = 1192
integer width = 475
integer taborder = 20
string text = "Paramétrages"
end type

event clicked;call super::clicked;

open(w_parametrage_synchronisation)
end event

type st_2 from statictext within w_synchronisation
integer x = 891
integer y = 260
integer width = 133
integer height = 72
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
string facename = "Arial"
long backcolor = 553648127
string text = "au"
end type

type st_1 from statictext within w_synchronisation
integer x = 105
integer y = 260
integer width = 137
integer height = 72
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
string facename = "Arial"
long backcolor = 553648127
string text = "Du"
end type

type st_3 from statictext within w_synchronisation
integer x = 55
integer y = 80
integer width = 594
integer height = 72
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
string facename = "Arial"
long backcolor = 553648127
string text = "Pour le praticien :"
end type

type hpb_etat from hprogressbar within w_synchronisation
boolean visible = false
integer x = 366
integer y = 880
integer width = 1303
integer height = 68
unsignedinteger maxposition = 100
integer setstep = 1
boolean smoothscroll = true
end type

type pb_2 from uo_picturebutton_390x120 within w_synchronisation
integer x = 549
integer y = 1192
integer width = 475
integer taborder = 20
string text = "Effacer RDV"
end type

event clicked;call super::clicked;if Messagebox("ATTENTION !","Vous allez supprimer les rendez-vous Orthokis de l'agenda d'Outlook.~n~nConfirmez-vous ?",Question!,Yesno!,2) = 1 then

	// Objet Outlook
	uo_ole_outlook	uo
	uo = create uo_ole_outlook
	
	// On efface les rendez-vous de Outlook sur la période en question
	
	gb_avancement.visible = true
	st_etape.visible = true
	st_etat.visible = true
	hpb_etat.visible = true
	
	// Pour parcours des rdv
	integer  cpt_a_supprimer, cpt_supprime
	long li_loop
	
	string filtre

	if uo.connecter_ole_obj( uo.nom_obj_outlook ) = 1 then
		st_etape.text = "Effacement des Rendez-vous Outlook"
		supprimer_rdv(uo)


		Messagebox("MESSAGE","Fin de l'effacement des rendez-vous !")

	end if


	gb_avancement.visible = false
	st_etape.visible = false
	st_etat.visible = false
	hpb_etat.visible = false


end if


end event

type st_etape from statictext within w_synchronisation
boolean visible = false
integer x = 366
integer y = 680
integer width = 1303
integer height = 64
fontcharset fontcharset = ansi!
string facename = "Eras Demi ITC"
long backcolor = 134217730
alignment alignment = center!
end type

type st_etat from statictext within w_synchronisation
boolean visible = false
integer x = 366
integer y = 788
integer width = 1303
integer height = 64
fontcharset fontcharset = ansi!
string facename = "Eras Demi ITC"
long backcolor = 134217730
alignment alignment = center!
end type

type em_date_max from editmask within w_synchronisation
integer x = 1106
integer y = 240
integer width = 421
integer height = 96
integer taborder = 30
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "dd/mm/yyyy"
boolean spin = true
double increment = 1
string minmax = "~~"
end type

type em_date_min from editmask within w_synchronisation
integer x = 329
integer y = 240
integer width = 421
integer height = 96
integer taborder = 20
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "dd/mm/yyyy"
boolean spin = true
double increment = 1
string minmax = "~~"
end type

type dw_prati from datawindow within w_synchronisation
string tag = "position"
integer x = 672
integer y = 80
integer width = 873
integer height = 80
integer taborder = 10
string dataobject = "dw_cherche_prati"
boolean border = false
end type

type pb_synchro from uo_picturebutton_390x120 within w_synchronisation
integer x = 1065
integer y = 1192
integer width = 475
integer taborder = 10
string text = "Synchroniser"
end type

event clicked;call super::clicked;
// Période
date date_min, date_max

date_min = date(em_date_min.text)
date_max = date(em_date_max.text)


// Praticien 
string v_code_praticien
v_code_praticien = dw_prati.gettext()


// Objet Outlook
uo_ole_outlook	uo
uo = create uo_ole_outlook

// structure de stockage
rdv_outlook rdv




if Messagebox("ATTENTION !","Vous allez synchroniser l'agenda d'Orthokis avec celui d'Outlook.~n~nConfirmez-vous ?",Question!,Yesno!,2) = 1 then


	// On efface les rendez-vous de Outlook sur la période en question
	
	gb_avancement.visible = true
	st_etape.visible = true
	st_etat.visible = true
	hpb_etat.visible = true
	
	
	// Pour parcours des rdv
	integer cpt_ajoute, cpt_a_ajouter
	long li_loop
	integer cpt_a_etudier, cpt_etudie
	
	
	// pour l'analyse des rendez-vous persos
	
	datetime rdv_analyse_debut, rdv_analyse_fin
	string description_rdv
	string commentaire_periode_interdite
	

	//Messagebox("filtr",filtre)
	if uo.connecter_ole_obj( uo.nom_obj_outlook ) = 1 then
	
	
		// EFFACEMENT DES RENDEZ-VOUS 
		//---------------------------------------
	
		st_etape.text = "Etape N°1/3 - Effacement des anciens rendez-vous"
		st_etat.text = ""
		supprimer_rdv(uo)
		
	
	
		// AJOUT DES RENDEZ-VOUS 
		//---------------------------------------
		st_etape.text = "Etape N°2/3 - Ajout des nouveaux rendez-vous"
		st_etat.text = ""
	
		
		
		// Combien de rendez-vous à ajouter ?
		
		select count(*) into :cpt_a_ajouter from rdv, etat_rdv 
		where cast("rdv" as date) between :date_min and :date_max and 	rdv.code_praticien = :v_code_praticien and
		 etat_rdv.code = rdv.absent and etat_rdv.elimine_agenda <> 'O' ;

		// Curseur pour les rdv Orthokis à envoyer
		declare cur_rdv cursor for 
		select patient.nom, patient.prenom, rdv.rdv, rdv.duree, rdv.fauteuil , type_rdv.nom
		from rdv, patient , type_rdv , etat_rdv 
		where etat_rdv.code = rdv.absent and etat_rdv.elimine_agenda <> 'O' and rdv."type" = "type_rdv"."code" and rdv.code = patient.code 
		and cast("rdv" as date) between :date_min and :date_max and 
		rdv.code_praticien = :v_code_praticien order by rdv asc ;
		
		open cur_rdv ;
		
		
		string v_nom, v_prenom, v_type_rdv,v_corps_global
		datetime v_rdv , v_rdv_global
		long v_duree, v_fauteuil, v_duree_global
		date jour_courant
		boolean plage_libre 
		
		time heure_fin_global, heure_fin_rdv, heure_max
		
		boolean on_arrete = false
		
		plage_libre = false
		
		fetch cur_rdv into :v_nom, :v_prenom, :v_rdv , :v_duree, :v_fauteuil, :v_type_rdv ;
		
		cpt_ajoute = 0
		
		string v_corps, v_objet, v_emplacement
	
		do while sqlca.sqlcode = 0 and not on_arrete
		
			// On détaille le rdv ?
			if profilestring(dir_ini+inifile_orthokis,"PDA","rdv_detaille", "G") = "D" then
			
				// Qu'est ce qu'on met dans l'objet ????
				choose case profilestring(dir_ini+inifile_orthokis,"PDA","rdv_objet", "N")
				case "N"
					v_objet = string_non_nulle(v_nom)+" "+string_non_nulle(v_prenom)
				case "F"
					v_objet = "Faut N°"+string(v_fauteuil)
				Case "T"
					v_objet = string_non_nulle(v_type_rdv)
				Case "L"
					v_objet = profilestring(dir_ini+inifile_orthokis,"PDA","rdv_objet_libelle", "Cabinet")
				end choose
	
			
				// Qu'est ce qu'on met dans le corps ????
				v_corps = ""
				if profilestring(dir_ini+inifile_orthokis,"PDA","rdv_corps_nom_prenom", "O") = "O" then
					v_corps = v_corps + string_non_nulle(v_nom)+" "+string_non_nulle(v_prenom)+"~n"
				end if
				if profilestring(dir_ini+inifile_orthokis,"PDA","rdv_corps_fauteuil", "O") = "O" then
					v_corps = v_corps + "Faut N°"+string(v_fauteuil)+"~n"
				end if
				if profilestring(dir_ini+inifile_orthokis,"PDA","rdv_corps_type_rdv", "O") = "O" then
					v_corps = v_corps + string_non_nulle(v_type_rdv)
				end if
			
				// Qu'est ce qu'on met dans l'emplacement ????
				choose case profilestring(dir_ini+inifile_orthokis,"PDA","rdv_emplacement", "N")
				case "N"
					v_emplacement = string_non_nulle(v_nom)+" "+string_non_nulle(v_prenom)
				case "F"
					v_emplacement = "Faut N°"+string(v_fauteuil)
				Case "T"
					v_emplacement = string_non_nulle(v_type_rdv)
				Case "L"
					v_emplacement = profilestring(dir_ini+inifile_orthokis,"PDA","rdv_emplacement_libelle", "Cabinet")
				end choose
			
				rdv.corps = v_corps
				rdv.objet =  v_objet
				rdv.Location = v_emplacement
				rdv.rdv = v_rdv
				rdv.duree = v_duree
				
				cpt_ajoute = cpt_ajoute +1
	
				fetch cur_rdv into :v_nom, :v_prenom, :v_rdv , :v_duree, :v_fauteuil, :v_type_rdv ;
	
			else
				// On va grouper le rdv jusqu'à prochaine rupture .. un vide ou changement de jour !
				jour_courant = date(v_rdv)
				
				v_rdv_global = v_rdv 
				v_duree_global = v_duree 
				v_corps_global = formatage_ligne_corps_rdv_groupe(v_rdv, v_nom, v_prenom, v_fauteuil, v_type_rdv, v_duree)
//				string(+" "+v_nom+" "+v_prenom+" "+v_type_rdv+" "+string(v_duree)+"'"
				plage_libre  = false
				
				do while jour_courant = date(v_rdv) and sqlca.sqlcode = 0 and not plage_libre and not on_arrete
				
					cpt_ajoute = cpt_ajoute +1
					fetch cur_rdv into :v_nom, :v_prenom, :v_rdv , :v_duree, :v_fauteuil, :v_type_rdv ;
					
					if jour_courant = date(v_rdv) then
						// Le rdv suivant fait il une place libre ???
						if time(v_rdv) > RelativeTime( time(v_rdv_global) , v_duree_global * 60 ) then
							// c'est une plage libre
							plage_libre = true 
						else
							// Calcul de la durée global
							heure_fin_global = RelativeTime( time(v_rdv_global) , v_duree_global * 60 )
							heure_fin_rdv = RelativeTime( time(v_rdv) , v_duree * 60 )
							
							// On prend la plus grande des 2 pour calculer ensuite la duree
							if heure_fin_global > heure_fin_rdv then
								heure_max = heure_fin_global
							else
								heure_max = heure_fin_rdv
							end if
							
							v_duree_global = secondsAfter(time(v_rdv_global) , heure_max) / 60
							// Construction du corps global selon les desideratas du user !!!
							v_corps_global = v_corps_global + "~n"
							v_corps_global = v_corps_global +  formatage_ligne_corps_rdv_groupe(v_rdv, v_nom, v_prenom, v_fauteuil, v_type_rdv, v_duree)

						end if
					end if
				loop
				
				
				
				rdv.corps = v_corps_global
				rdv.objet =  profilestring(dir_ini+inifile_orthokis,"PDA","rdv_groupe_objet_libelle","RDV Patients")
				rdv.Location = profilestring(dir_ini+inifile_orthokis,"PDA","rdv_groupe_emplacement_libelle","Cabinet")
				rdv.rdv = v_rdv_global
				rdv.duree = v_duree_global
				
			end if
	
			if uo.nouveau_rdv(rdv) = -1 then
				if Messagebox("ERREUR INATTENDUE EN AJOUT","Souhaitez-vous interrompre la synchronisation ?",Question!, YesNo!, 1) = 1 then
					on_arrete = true
				end if
			end if
		
			st_etat.text = string(cpt_ajoute)+"/"+string(cpt_a_ajouter)+" rdv ajoutés"
			hpb_etat.position = (cpt_ajoute / cpt_a_ajouter) * 100
			yield()

		loop
		
		close cur_rdv ;
		
		
		// Analyse des rendez-vous persos 
		//---------------------------------------
		st_etape.text = "Etape N°3/3 - Analyse des rendez-vous personnels"
		st_etat.text = ""
	
		string filtre

		filtre = "[Start] >= '"+em_date_min.text+" 00:00 AM' and [Start] <= '"+em_date_max.text+" 08:00 AM'"

		// Elements outllok pour le parcours ...
		
		ole_folder = objNamespace.GetDefaultFolder(olFolderCalendar)
		tous_les_rdv = ole_folder.Items
			
		rdv_filtre = tous_les_rdv.Restrict(filtre)
	
		cpt_a_etudier = rdv_filtre.count
		cpt_etudie = 0
		dw_rapport.reset()
		
		if rdv_filtre.count > 0 and not on_arrete then 
			
			for li_loop = rdv_filtre.count to 1 step -1
				
				cpt_etudie = cpt_etudie + 1
				st_etat.text = string(cpt_etudie)+"/"+string(cpt_a_etudier)+" rdv étudiés"
				hpb_etat.position = (cpt_etudie / cpt_a_etudier) * 100
				yield()	
				
				// Est-ce bien un rdv PAS Orthokis 
				if rdv_filtre.Item(li_loop).UserProperties.find("Orthokis") then
					// on fait pas !
				else
					
					// Analyse du rdv perso
					
					rdv_analyse_debut = datetime(String(rdv_filtre.Item(li_loop).Start))
					rdv_analyse_fin = datetime(String(rdv_filtre.Item(li_loop).End))
					
					
					description_rdv = "Objet : "+String(rdv_filtre.Item(li_loop).Subject)+"~nEmplacement : "+String(rdv_filtre.Item(li_loop).Location)+"~nDébut : "+&
							String(rdv_filtre.Item(li_loop).Start)+ "~nDurée : "+String(rdv_filtre.Item(li_loop).Duration)  +"'"
							
					// Est ce un jour travaillé selon les param de l'agenda ?
					if is_jour_travaille(date(rdv_analyse_debut)) then
						
						// Est il dans l'agenda
						if not is_hors_agenda(rdv_analyse_debut, rdv_analyse_fin) then
						
							// Y a t il un chevauchement avec les rendez-vous existants de l'agenda
							if is_chevauche_rdv(rdv_analyse_debut, rdv_analyse_fin) then
	
								// pour la rapport
								rdv_filtre.Item(li_loop).delete()
								dw_rapport.insertrow(0)
								dw_rapport.setitem(dw_rapport.rowcount(),"rdv", rdv_analyse_debut)
								dw_rapport.setitem(dw_rapport.rowcount(),"description_rdv", description_rdv)
	
								
								// Pas bon !!
								if 	MessageBox("Conflit dans Agenda Outlook","Le rendez-vous suivant rentre en conflit avec votre agenda Orthokis :~n~n"+description_rdv+&
								"~n~nSouhaitez-vous supprimer ce rendez-vous ?",Question!,Yesno!,2) = 1 then
									// l'utilisateur le supprime
									rdv_filtre.Item(li_loop).delete()
									dw_rapport.setitem(dw_rapport.rowcount(),"erreur", "Ce rendez-vous rentrait en conflit avec votre agenda Orthokis. Vous l'avez supprimé !")
								else
									dw_rapport.setitem(dw_rapport.rowcount(),"erreur", "Ce rendez-vous rentre en conflit avec votre agenda Orthokis.")
								end if							
							else
								// Le rendez-vous est il dans un jour interdit de l'agenda ?
								if not is_dans_periode_interdite(rdv_analyse_debut, rdv_analyse_fin) then
									
									
										
									// pour la rapport
									dw_rapport.insertrow(0)
									dw_rapport.setitem(dw_rapport.rowcount(),"rdv", rdv_analyse_debut)
									dw_rapport.setitem(dw_rapport.rowcount(),"description_rdv", description_rdv)
	
									
								
									if 	MessageBox("Absence de Période Interdite dans Orthokis","Le rendez-vous suivant ne semble pas correspondre à une période interdite dans votre agenda Orthokis :~n~n"+&
										description_rdv+	"~n~nSouhaitez-vous générer une période interdite dans votre agenda Orthokis ?",Question!,Yesno!,1) = 1 then
										
										// génération d'une période interdite
										dw_rapport.setitem(dw_rapport.rowcount(),"erreur", "Une période interdite a été ajoutée à votre agenda Orthokis.")
										
										commentaire_periode_interdite = profilestring(dir_ini+inifile_orthokis,"PDA","periode_interdite_commentaire","RDV Personnel")
	
	
										insert into jours_interdits (date_debut, date_fin, fauteuil_debut, fauteuil_fin, code_praticien, commentaire)
										values (:rdv_analyse_debut, dateadd (minute, -1, :rdv_analyse_fin), 0, 99, :v_code_praticien, :commentaire_periode_interdite) ;
										
										if sqlca.sqlcode = 0  then
											commit ;
										else
											rollback ;
											Messagebox("ERREUR","Erreur dans l'ajout de la période interdite :~n~n"+sqlca.sqlerrtext)
										end if
									
									else
										dw_rapport.setitem(dw_rapport.rowcount(),"erreur", "Ce rendez-vous n'est pas dans une période interdite de votre agenda Orthokis.")
								end if
								
								end if
							end if
						end if
					end if
				end if
			next

		end if
	
		uo.deconnecter_ole_obj( )
		
		if dw_rapport.rowcount() > 0 then
			// y a des erreurs => Affichage du rapport
			dw_rapport.sort()
			dw_rapport.visible = true
			parent.width = 2926
			parent.height  = 2612
			centrer(parent)
		else
			Messagebox("MESSAGE","Fin de la synchronisation !")
			close(parent)
		end if
	else
		
		Messagebox("ERREUR","Erreur de connexion à Outlook")
	end if
end if





end event

type pb_fermer from uo_picturebutton_390x120_fermer within w_synchronisation
integer x = 1454
integer y = 2316
integer taborder = 10
end type

type gb_avancement from groupbox within w_synchronisation
boolean visible = false
integer x = 174
integer y = 572
integer width = 1682
integer height = 480
integer taborder = 40
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Eras Demi ITC"
long backcolor = 15780518
string text = "Avancement de la synchronisation"
end type

