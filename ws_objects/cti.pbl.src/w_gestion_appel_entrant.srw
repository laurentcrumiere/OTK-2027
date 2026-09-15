$PBExportHeader$w_gestion_appel_entrant.srw
forward
global type w_gestion_appel_entrant from w_fenetre_arakis
end type
type pb_1 from uo_picturebutton_390x120_fermer within w_gestion_appel_entrant
end type
type pb_clinique from picturebutton within w_gestion_appel_entrant
end type
type pb_commentaires_cliniques from picturebutton within w_gestion_appel_entrant
end type
type pb_rdv from picturebutton within w_gestion_appel_entrant
end type
type pb_reglements from picturebutton within w_gestion_appel_entrant
end type
type pb_soins from picturebutton within w_gestion_appel_entrant
end type
type pb_soins_prevus from picturebutton within w_gestion_appel_entrant
end type
type pb_commentaires_administratifs from picturebutton within w_gestion_appel_entrant
end type
type pb_admini from picturebutton within w_gestion_appel_entrant
end type
type dw_liste from datawindow within w_gestion_appel_entrant
end type
type st_libelle from statictext within w_gestion_appel_entrant
end type
end forward

global type w_gestion_appel_entrant from w_fenetre_arakis
integer width = 4114
integer height = 1764
string title = "Gestion d~'un appel entrant"
windowtype windowtype = response!
long backcolor = 15780518
pb_1 pb_1
pb_clinique pb_clinique
pb_commentaires_cliniques pb_commentaires_cliniques
pb_rdv pb_rdv
pb_reglements pb_reglements
pb_soins pb_soins
pb_soins_prevus pb_soins_prevus
pb_commentaires_administratifs pb_commentaires_administratifs
pb_admini pb_admini
dw_liste dw_liste
st_libelle st_libelle
end type
global w_gestion_appel_entrant w_gestion_appel_entrant

forward prototypes
public subroutine maj_bouton (string v_type)
end prototypes

public subroutine maj_bouton (string v_type);	if v_type = 'P' then
		// patient
		pb_admini.visible = true
		pb_commentaires_administratifs.visible = true
		pb_soins_prevus.visible = true
		pb_soins.visible = true
		pb_reglements.visible = true
		pb_rdv.visible = true
		pb_commentaires_cliniques.visible = true
		pb_clinique.visible = true
	
	else
		// autre numero
		pb_admini.visible = false
		pb_commentaires_administratifs.visible = false
		pb_soins_prevus.visible = false
		pb_soins.visible = false
		pb_reglements.visible = false
		pb_rdv.visible = false
		pb_commentaires_cliniques.visible = false
		pb_clinique.visible = false
		
end if
end subroutine

on w_gestion_appel_entrant.create
int iCurrent
call super::create
this.pb_1=create pb_1
this.pb_clinique=create pb_clinique
this.pb_commentaires_cliniques=create pb_commentaires_cliniques
this.pb_rdv=create pb_rdv
this.pb_reglements=create pb_reglements
this.pb_soins=create pb_soins
this.pb_soins_prevus=create pb_soins_prevus
this.pb_commentaires_administratifs=create pb_commentaires_administratifs
this.pb_admini=create pb_admini
this.dw_liste=create dw_liste
this.st_libelle=create st_libelle
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.pb_1
this.Control[iCurrent+2]=this.pb_clinique
this.Control[iCurrent+3]=this.pb_commentaires_cliniques
this.Control[iCurrent+4]=this.pb_rdv
this.Control[iCurrent+5]=this.pb_reglements
this.Control[iCurrent+6]=this.pb_soins
this.Control[iCurrent+7]=this.pb_soins_prevus
this.Control[iCurrent+8]=this.pb_commentaires_administratifs
this.Control[iCurrent+9]=this.pb_admini
this.Control[iCurrent+10]=this.dw_liste
this.Control[iCurrent+11]=this.st_libelle
end on

on w_gestion_appel_entrant.destroy
call super::destroy
destroy(this.pb_1)
destroy(this.pb_clinique)
destroy(this.pb_commentaires_cliniques)
destroy(this.pb_rdv)
destroy(this.pb_reglements)
destroy(this.pb_soins)
destroy(this.pb_soins_prevus)
destroy(this.pb_commentaires_administratifs)
destroy(this.pb_admini)
destroy(this.dw_liste)
destroy(this.st_libelle)
end on

event open;call super::open;centrer(this)

string numero_entrant


string v_nom, v_prenom, v_code_postal, v_ville, v_type, v_contact
string v_code, v_type_contact
long lig

// pour consignation
string libelle, libelle_complet

// on enleve tout ce qui n'est pas alphanumérique
numero_entrant = espace(trim(Message.StringParm))

if len(numero_entrant) < 5 then
	// on ne gère pas les appels interne (<5)
	close(this)
	
else
	
	st_libelle.text = "Vous avez un appel téléphonique du numéro : "+string(numero_entrant , "@@ @@ @@ @@ @@ @@ @@ @@")
	
	libelle_complet = ""
	
	// Consitution de la liste des gens qui ont ce N° de téléphone : 
	
	// Recherche dans les patients
	declare cur1 cursor for select string(code), nom, prenom, codep_parent1, ville_parent1, nom_parent1, '1', 'P' 
			from patient where trim(teldom_parent1) = trim(:numero_entrant) or trim(teldom2_parent1) = trim(:numero_entrant) ;
	declare cur2 cursor for select string(code), nom, prenom, codep_parent1, ville_parent1, nom_parent1, '1', 'P' 
			from patient where trim(teltra_parent1) = trim(:numero_entrant) or  trim(teltra2_parent1) = trim(:numero_entrant) or trim(portable) = trim(:numero_entrant) or trim(portable2_parent1) = trim(:numero_entrant) ;

	
	declare cur3 cursor for select string(code), nom, prenom, codep_parent1, ville_parent1, nom +' '+ isnull(prenom,''), 'T', 'P' 
			from patient where trim(portable_patient) = trim(:numero_entrant)  ;
	
	declare cur4 cursor for select string(code), nom, prenom, codep_parent2, ville_parent2, nom_parent2, '2', 'P' 
			from patient where trim(teldom_parent2) = trim(:numero_entrant) or trim(teltra_parent2) = trim(:numero_entrant) or trim(portable1_parent2) = trim(:numero_entrant) ;
	declare cur5 cursor for select string(code), nom, prenom, codep_parent2, ville_parent2, nom_parent2, '2', 'P' 
			from patient where trim(teldom2_parent2) = trim(:numero_entrant) or trim(teltra2_parent2) = trim(:numero_entrant) or trim(portable2_parent2) = trim(:numero_entrant) ;

	declare cur6 cursor for select string(code), nom, prenom, codep_payeur, ville_payeur, nom_payeur, 'P', 'P' 
			from patient where trim(teldom_payeur) = trim(:numero_entrant) or trim(teltra_payeur) = trim(:numero_entrant) or trim(portable1_payeur) = trim(:numero_entrant);
	declare cur7 cursor for select string(code), nom, prenom, codep_payeur, ville_payeur, nom_payeur, 'P', 'P' 
			from patient where trim(teldom2_payeur) = trim(:numero_entrant) or trim(teltra2_payeur) = trim(:numero_entrant) or trim(portable2_payeur) = trim(:numero_entrant);

	
	
	// recherche dans les correspondants
	
	declare cur8 cursor for select code, nom, prenom, codep, ville, '', '', 'C' 
			from correspondants where trim(tel) = trim(:numero_entrant) ;
	declare cur9 cursor for select code, nom, prenom, codep, ville, '', '', 'C' 
			from correspondants where trim(tel2) = trim(:numero_entrant) ;

	
		// recherche dans les Adresses
	
	declare cur10 cursor for select code, nom, '', codep, ville, '', '', 'A' 
			from adresses where trim(tel) = trim(:numero_entrant) or  trim(tel1) = trim(:numero_entrant) or  trim(tel2) = trim(:numero_entrant)  ;

	
	// recherche dans les Caisse

	declare cur11 cursor for select code, nom, '', codep, ville, '', '', 'I' 
			from caisse where trim(tel) = trim(:numero_entrant) ;
			
			
	// recherche dans les Mutuelle
	
	declare cur12 cursor for select code, nom, '', codep, ville, '', '', 'M' 
			from mutuelle where trim(tel) = trim(:numero_entrant) ;
	
	// Plusieurs recherches différentes => on boucle ...
	
	integer nb_passe , cpt
	
	
	nb_passe = 12
	
	cpt = 1
	do while cpt <= nb_passe
	
	choose case cpt
		case 1
			open cur1 ;
			fetch cur1 into :v_code, :v_nom, :v_prenom, :v_code_postal, :v_ville, :v_contact, :v_type_contact, :v_type ;
			libelle = "(Parent 1)"
		case 2
			open cur2 ;
			fetch cur2 into :v_code, :v_nom, :v_prenom, :v_code_postal, :v_ville, :v_contact, :v_type_contact, :v_type ;
			libelle = "(Parent 1)"
		case 3
			open cur3 ;
			fetch cur3 into :v_code, :v_nom, :v_prenom, :v_code_postal, :v_ville, :v_contact, :v_type_contact, :v_type ;
			libelle = "(Patient)"
		case 4
			open cur4 ;
			fetch cur4 into :v_code, :v_nom, :v_prenom, :v_code_postal, :v_ville, :v_contact, :v_type_contact, :v_type ;
			libelle = "(Parent 2)"
		case 5
			open cur5 ;
			fetch cur5 into :v_code, :v_nom, :v_prenom, :v_code_postal, :v_ville, :v_contact, :v_type_contact, :v_type ;
			libelle = "(Parent 2)"
		case 6
			open cur6 ;
			fetch cur6 into :v_code, :v_nom, :v_prenom, :v_code_postal, :v_ville, :v_contact, :v_type_contact, :v_type ;
			libelle = "(Payeur)"
		case 7
			open cur7 ;
			fetch cur7 into :v_code, :v_nom, :v_prenom, :v_code_postal, :v_ville, :v_contact, :v_type_contact, :v_type ;
			libelle = "(Payeur)"
		case 8
			open cur8 ;
			fetch cur8 into :v_code, :v_nom, :v_prenom, :v_code_postal, :v_ville, :v_contact, :v_type_contact, :v_type ;
			libelle = "(Correspondant)"
		case 9
			open cur9 ;
			fetch cur9 into :v_code, :v_nom, :v_prenom, :v_code_postal, :v_ville, :v_contact, :v_type_contact, :v_type ;
			libelle = "(Correspondant)"
		case 10
			open cur10 ;
			fetch cur10 into :v_code, :v_nom, :v_prenom, :v_code_postal, :v_ville, :v_contact, :v_type_contact, :v_type ;
			libelle = "(Adresse)"
		case 11
			open cur11 ;
			fetch cur11 into :v_code, :v_nom, :v_prenom, :v_code_postal, :v_ville, :v_contact, :v_type_contact, :v_type ;
			libelle = "(Caisse)"
		case 12
			open cur12 ;
			fetch cur12 into :v_code, :v_nom, :v_prenom, :v_code_postal, :v_ville, :v_contact, :v_type_contact, :v_type ;
			libelle = "(Mutuelle)"
	end choose
	
		do while sqlca.sqlcode = 0
			
			dw_liste.insertrow(0)
			lig = dw_liste.rowcount()
			dw_liste.setitem(lig,"code",v_code)
			dw_liste.setitem(lig,"nom",v_nom)
			dw_liste.setitem(lig,"prenom",v_prenom)
			dw_liste.setitem(lig,"code_postal",v_code_postal)
			dw_liste.setitem(lig,"ville",v_ville)
			dw_liste.setitem(lig,"contact",v_contact)
			dw_liste.setitem(lig,"type",v_type)
			dw_liste.setitem(lig,"type_contact",v_type_contact)
			
			if trim(libelle_complet) <> "" then
				libelle_complet = libelle_complet + " / "
			end if 
			
			libelle_complet = libelle_complet + v_code + " - " + v_contact + " - " + libelle
			
			choose case cpt
				case 1
					fetch cur1 into :v_code, :v_nom, :v_prenom, :v_code_postal, :v_ville, :v_contact, :v_type_contact, :v_type ;
				case 2
					fetch cur2 into :v_code, :v_nom, :v_prenom, :v_code_postal, :v_ville, :v_contact, :v_type_contact, :v_type ;
				case 3
					fetch cur3 into :v_code, :v_nom, :v_prenom, :v_code_postal, :v_ville, :v_contact, :v_type_contact, :v_type ;
				case 4
					fetch cur4 into :v_code, :v_nom, :v_prenom, :v_code_postal, :v_ville, :v_contact, :v_type_contact, :v_type ;
				case 5
					fetch cur5 into :v_code, :v_nom, :v_prenom, :v_code_postal, :v_ville, :v_contact, :v_type_contact, :v_type ;
				case 6
					fetch cur6 into :v_code, :v_nom, :v_prenom, :v_code_postal, :v_ville, :v_contact, :v_type_contact, :v_type ;
				case 7
					fetch cur7 into :v_code, :v_nom, :v_prenom, :v_code_postal, :v_ville, :v_contact, :v_type_contact, :v_type ;
				case 8
					fetch cur8 into :v_code, :v_nom, :v_prenom, :v_code_postal, :v_ville, :v_contact, :v_type_contact, :v_type ;
				case 9
					fetch cur9 into :v_code, :v_nom, :v_prenom, :v_code_postal, :v_ville, :v_contact, :v_type_contact, :v_type ;
				case 10
					fetch cur10 into :v_code, :v_nom, :v_prenom, :v_code_postal, :v_ville, :v_contact, :v_type_contact, :v_type ;
				case 11
					fetch cur11 into :v_code, :v_nom, :v_prenom, :v_code_postal, :v_ville, :v_contact, :v_type_contact, :v_type ;
				case 12
					fetch cur12 into :v_code, :v_nom, :v_prenom, :v_code_postal, :v_ville, :v_contact, :v_type_contact, :v_type ;
			end choose
		
		loop
		
		choose case cpt
			case 1
				close cur1 ;	
			case 2
				close cur2 ;
			case 3
				close cur3 ;	
			case 4
				close cur4 ;
			case 5
				close cur5 ;	
			case 6
				close cur6 ;	
			case 7
				close cur7 ;
			case 8
				close cur8 ;
			case 9
				close cur9 ;
			case 10
				close cur10 ;
			case 11
				close cur11 ;
			case 12
				close cur12 ;
		end choose
		
		cpt = cpt + 1
	
	loop 
	
	
	if dw_liste.rowcount() = 0 then
		//MessageBox("ATTENTION", "Vous avez un appel téléphonique du numéro : "+numero_entrant +"~n~nCelui-ci ne figure pas dans votre base de données !")
		Clipboard (string(numero_entrant , "@@ @@ @@ @@ @@ @@ @@ @@"))
		//Clipboard ( left(numero_entrant,2)+" "+mid(numero_entrant, 3,2)+" "+mid(numero_entrant, 5,2)+" "+mid(numero_entrant, 7,2)+" "+mid(numero_entrant, 9,2) )
		close(this)
	else
		// pour activer le tri de la dw
		dw_liste.sort()
		dw_liste.groupcalc()
	
		// Pour forcer la mise à jour des boutons
		if dw_liste.rowcount() > 0 then
				dw_liste.SelectRow(0,False)
				dw_liste.scrolltorow(1)
				dw_liste.SelectRow(1,True)
				dw_liste.SeTRow(1)
				
				maj_bouton(dw_liste.getitemstring(1,"type"))
		end if
		
		
		// Consignation dans l'historique
		insert into historique_appels ("date_heure_appel" , "numero" , "libelle" )
		values (getdate(), :numero_entrant, :libelle_complet) ;
		
		if sqlca.sqlcode <> 0 then 
			Messagebox("ATTENTION","Erreur N° "+ string(sqlca.sqlcode)+" dans la consignation de l'appel.~n~n" + sqlca.sqlerrtext)
		end if
	end if
	
end if
	
	

end event

type p_fond from w_fenetre_arakis`p_fond within w_gestion_appel_entrant
end type

type pb_1 from uo_picturebutton_390x120_fermer within w_gestion_appel_entrant
integer x = 3013
integer y = 1460
integer width = 498
integer taborder = 90
end type

type pb_clinique from picturebutton within w_gestion_appel_entrant
event mouse_move pbm_mousemove
string tag = "Pages Cliniques"
integer x = 1317
integer y = 1456
integer width = 174
integer height = 152
integer taborder = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "lc_clinique.png"
end type

event clicked;var_code = double(dw_liste.getitemstring(dw_liste.getrow(),"code"))
//Mise à jour de la gestion des 10 patients en mémoire
//et de latoolbar principale de la w_mdi
MajTabPatientsCourants(var_code)
m_orthokis_2020.m_patients.m_patientcourant.m_imagerie0.triggerevent(clicked!)
close(parent)


end event

event rbuttondown;this.triggerevent(clicked!)
end event

type pb_commentaires_cliniques from picturebutton within w_gestion_appel_entrant
event mouse_move pbm_mousemove
string tag = "Commentaires Cliniques"
integer x = 1134
integer y = 1456
integer width = 174
integer height = 152
integer taborder = 70
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "lc_coment.png"
end type

event clicked;var_code = double(dw_liste.getitemstring(dw_liste.getrow(),"code"))
//Mise à jour de la gestion des 10 patients en mémoire
//et de latoolbar principale de la w_mdi
MajTabPatientsCourants(var_code)
m_orthokis_2020.m_patients.m_patientcourant.m_commentairescliniques0.triggerevent(clicked!)
close(parent)

end event

event rbuttondown;this.triggerevent(clicked!)

end event

type pb_rdv from picturebutton within w_gestion_appel_entrant
event mouse_move pbm_mousemove
string tag = "Gestion des Rendez-vous"
integer x = 951
integer y = 1456
integer width = 174
integer height = 152
integer taborder = 60
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "lc_rdv.png"
end type

event clicked;var_code = double(dw_liste.getitemstring(dw_liste.getrow(),"code"))
//Mise à jour de la gestion des 10 patients en mémoire
//et de latoolbar principale de la w_mdi
MajTabPatientsCourants(var_code)
m_orthokis_2020.m_patients.m_patientcourant.m_rendezvous.triggerevent(clicked!)
close(parent)


end event

event rbuttondown;this.triggerevent(clicked!)
end event

type pb_reglements from picturebutton within w_gestion_appel_entrant
event mouse_move pbm_mousemove
string tag = "Gestion des Règlements"
integer x = 768
integer y = 1456
integer width = 174
integer height = 152
integer taborder = 50
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "lc_regl.png"
end type

event clicked;var_code = double(dw_liste.getitemstring(dw_liste.getrow(),"code"))
//Mise à jour de la gestion des 10 patients en mémoire
//et de latoolbar principale de la w_mdi
MajTabPatientsCourants(var_code)
m_orthokis_2020.m_patients.m_patientcourant.m_soins0.triggerevent(clicked!)
close(parent)


end event

event rbuttondown;this.triggerevent(clicked!)

end event

type pb_soins from picturebutton within w_gestion_appel_entrant
event mouse_move pbm_mousemove
string tag = "Gestion des Soins"
integer x = 585
integer y = 1456
integer width = 174
integer height = 152
integer taborder = 40
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "lc_Soins.png"
end type

event clicked;var_code = double(dw_liste.getitemstring(dw_liste.getrow(),"code"))
//Mise à jour de la gestion des 10 patients en mémoire
//et de latoolbar principale de la w_mdi
MajTabPatientsCourants(var_code)
m_orthokis_2020.m_patients.m_patientcourant.m_soins22.triggerevent(clicked!)
close(parent)


end event

event rbuttondown;this.triggerevent(clicked!)
end event

type pb_soins_prevus from picturebutton within w_gestion_appel_entrant
event mouse_move pbm_mousemove
string tag = "Gestion des Soins Prévisionnels"
integer x = 402
integer y = 1456
integer width = 174
integer height = 152
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "lc_soins_prevus.png"
end type

event clicked;var_code = double(dw_liste.getitemstring(dw_liste.getrow(),"code"))
//Mise à jour de la gestion des 10 patients en mémoire
//et de latoolbar principale de la w_mdi
MajTabPatientsCourants(var_code)
m_orthokis_2020.m_patients.m_patientcourant.m_soinsprévisionnels.triggerevent(clicked!)
close(parent)



end event

event rbuttondown;this.triggerevent(clicked!)

end event

type pb_commentaires_administratifs from picturebutton within w_gestion_appel_entrant
event mouse_move pbm_mousemove
string tag = "Commentaires Administratifs"
integer x = 219
integer y = 1456
integer width = 174
integer height = 152
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "lc_coment_admini.png"
end type

event clicked;var_code = double(dw_liste.getitemstring(dw_liste.getrow(),"code"))
//Mise à jour de la gestion des 10 patients en mémoire
//et de latoolbar principale de la w_mdi
MajTabPatientsCourants(var_code)
m_orthokis_2020.m_patients.m_patientcourant.m_commentairesadministratifs.triggerevent(clicked!)
close(parent)



end event

event rbuttondown;this.triggerevent(clicked!)
end event

type pb_admini from picturebutton within w_gestion_appel_entrant
event mouve_move pbm_mousemove
string tag = "Fiche Administrative du Patient"
integer x = 37
integer y = 1456
integer width = 174
integer height = 152
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "lc_admini.png"
end type

event clicked;var_code = double(dw_liste.getitemstring(dw_liste.getrow(),"code"))
//Mise à jour de la gestion des 10 patients en mémoire
//et de latoolbar principale de la w_mdi
MajTabPatientsCourants(var_code)
	
m_orthokis_2020.m_patients.m_patientcourant.m_administratif.triggerevent(clicked!)
close(parent)


end event

event rbuttondown;
this.triggerevent(clicked!)
end event

type dw_liste from datawindow within w_gestion_appel_entrant
integer y = 244
integer width = 4055
integer height = 1188
integer taborder = 10
string title = "none"
string dataobject = "dw_liste_appels"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event rowfocuschanged;
If CurrentRow > 0 Then
	This.SelectRow(0,False)
	This.SelectRow(CurrentRow,True)
	This.SeTRow(CurrentRow)
	
	maj_bouton(this.getitemstring(CurrentRow,"type"))

End If

end event

type st_libelle from statictext within w_gestion_appel_entrant
integer x = 14
integer y = 60
integer width = 2528
integer height = 108
integer textsize = -12
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
alignment alignment = center!
boolean border = true
boolean focusrectangle = false
end type

