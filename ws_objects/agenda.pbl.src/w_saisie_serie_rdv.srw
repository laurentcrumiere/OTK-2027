$PBExportHeader$w_saisie_serie_rdv.srw
forward
global type w_saisie_serie_rdv from w_fenetre_arakis
end type
type pb_fermer from uo_picturebutton_390x120_fermer within w_saisie_serie_rdv
end type
type st_patient from statictext within w_saisie_serie_rdv
end type
type st_serie_rdv from statictext within w_saisie_serie_rdv
end type
type dw_liste from datawindow within w_saisie_serie_rdv
end type
type pb_precedent from uo_picturebutton_transparent within w_saisie_serie_rdv
end type
type pb_suivant from uo_picturebutton_transparent within w_saisie_serie_rdv
end type
type uo_1 from resize_fenetre within w_saisie_serie_rdv
end type
end forward

global type w_saisie_serie_rdv from w_fenetre_arakis
integer width = 1728
integer height = 1396
string title = "Saisie de rendez-vous pour une Série de Rendez-vous"
pb_fermer pb_fermer
st_patient st_patient
st_serie_rdv st_serie_rdv
dw_liste dw_liste
pb_precedent pb_precedent
pb_suivant pb_suivant
uo_1 uo_1
end type
global w_saisie_serie_rdv w_saisie_serie_rdv

type variables



double var_code_local
double var_serie_rdv
string var_nom_local
end variables

forward prototypes
public subroutine calcul_date_theorique ()
end prototypes

public subroutine calcul_date_theorique ();
//	Calcul du date selon règle de série de rdv .. pour les dates théoriques

date date_relative, date_finale
date v_date_debut_traitement
string v_type_delai, v_unite_delai
long v_nb
long lig, tot

date v_date_dernier_rdv_reel, v_date_dernier_theo

tot = dw_liste.rowcount()

Setnull(v_date_dernier_theo)

for lig = 1 to tot

	v_type_delai = dw_liste.getItemString(lig, "type_delai")
	v_unite_delai = dw_liste.getItemString(lig, "unite_delai")
	v_nb = dw_liste.getItemNumber(lig, "nb_delai")
	
	// On est en relatif mais selon quoi 
	
	choose case v_type_delai
			
		case 'J'
			// Date du jour
			date_relative = today()
			
		case 'D'
			// Debut de traitement
			select debut_traitement into :v_date_debut_traitement from patient where code = :var_code_local ;
			date_relative = v_date_debut_traitement
			
		case 'P'
			
				// 1er calcul, on prend le vrai dernier
				// Rendez-vous précédent (non absent)
				  SELECT max( cast("rdv"."rdv" as date))
					 INTO :v_date_dernier_rdv_reel 
					 FROM "rdv"  , "etat_rdv"
					WHERE ( "rdv"."code" = :var_code_local ) AND rdv.absent = etat_rdv.code and etat_rdv.elimine_agenda <> 'O' ;

			if isnull(v_date_dernier_theo) then
				// premiere ligne
				date_relative = v_date_dernier_rdv_reel
			else
				if isnull(v_date_dernier_rdv_reel) then
					// Pas de rééel
					date_relative = v_date_dernier_theo
				else
					// y a des réels !!
					if v_date_dernier_rdv_reel < v_date_dernier_theo then
						date_relative =  v_date_dernier_theo
					else
						date_relative =  v_date_dernier_rdv_reel
					end if
				end if
			end if
	end choose
	
	
	
	// Calcul de la nouvelle date
	
	choose case v_unite_delai
		case 'J' 
			// jours
			date_finale = relativedate(date_relative, v_nb)
		case 'E'
			// semaine
			date_finale = relativedate(date_relative, v_nb * 7)
		case 'M'
			// mois
			date_finale = relativedate(date_relative, v_nb * 30)
		case 'T'
			// trimestre
			date_finale = relativedate(date_relative, v_nb * 91)
		case 'S'
			// Semestre
			date_finale = relativedate(date_relative, v_nb * 182)
		case 'A'
			// année
			date_finale = relativedate(date_relative, v_nb * 365)
	end choose		

	// Mise à jour de la date
	dw_liste.SetItem(lig, "delai_absolu", date_finale)
	v_date_dernier_theo = date_finale
	
next

end subroutine

on w_saisie_serie_rdv.create
int iCurrent
call super::create
this.pb_fermer=create pb_fermer
this.st_patient=create st_patient
this.st_serie_rdv=create st_serie_rdv
this.dw_liste=create dw_liste
this.pb_precedent=create pb_precedent
this.pb_suivant=create pb_suivant
this.uo_1=create uo_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.pb_fermer
this.Control[iCurrent+2]=this.st_patient
this.Control[iCurrent+3]=this.st_serie_rdv
this.Control[iCurrent+4]=this.dw_liste
this.Control[iCurrent+5]=this.pb_precedent
this.Control[iCurrent+6]=this.pb_suivant
this.Control[iCurrent+7]=this.uo_1
end on

on w_saisie_serie_rdv.destroy
call super::destroy
destroy(this.pb_fermer)
destroy(this.st_patient)
destroy(this.st_serie_rdv)
destroy(this.dw_liste)
destroy(this.pb_precedent)
destroy(this.pb_suivant)
destroy(this.uo_1)
end on

event open;call super::open;

// Code du patient passé en paramètre de l'open de la fenetre

var_code_local = Message.DoubleParm

string var_nom_serie_rdv

select trim(nom)+isnull(' '+trim(prenom),'') into :var_nom_local from patient where patient.code = :var_code_local  ;
select patient.prochain_rdv_serie , libelle into :var_serie_rdv, :var_nom_serie_rdv from rdv_serie , patient where patient.code = :var_code_local and patient.prochain_rdv_serie = rdv_serie.code  ;

st_patient.text  = "Patient : " + var_nom_local
st_serie_rdv.text = "Série : " + var_nom_serie_rdv


dw_liste.settransobject(sqlca)
dw_liste.retrieve(var_code_local, var_serie_rdv)



// Taille par défaut
this.width = ProfileInt (dir_ini+inifile_orthokis,"agenda","fenetre_saisie_serie_width", 1874 ) 
this.height = ProfileInt (dir_ini+inifile_orthokis,"agenda","fenetre_saisie_serie_height", 1292 ) 

// repositionnement de la fenêtre en haut à droite !!!
environment env

GetEnvironment(env)
	
this.y = 0
this.x =  PixelsToUnits(env.ScreenWidth,XPixelsToUnits!) - this.width - 20



uo_1.taille(this)








end event

event resize;call super::resize;


// Uniquement en vertical

pb_suivant.y = this.height - 350
pb_precedent.y = pb_suivant.y 
pb_fermer.y = pb_suivant.y 

dw_liste.height = this.height - 560


end event

event close;call super::close;

// Mémorisation de la taille de la fenêtre et de son emplacement
SetProfileString (dir_ini+inifile_orthokis,"agenda","fenetre_saisie_serie_x", string(this.x) ) 
SetProfileString (dir_ini+inifile_orthokis,"agenda","fenetre_saisie_serie_y", string(this.y) ) 
// L'emplacement sera toujours en haut à droite
SetProfileString (dir_ini+inifile_orthokis,"agenda","fenetre_saisie_serie_width", string(this.width) ) 
SetProfileString (dir_ini+inifile_orthokis,"agenda","fenetre_saisie_serie_height", string(this.height) ) 

end event

type p_fond from w_fenetre_arakis`p_fond within w_saisie_serie_rdv
end type

type pb_fermer from uo_picturebutton_390x120_fermer within w_saisie_serie_rdv
integer x = 1079
integer y = 1112
integer width = 544
integer height = 152
integer taborder = 10
boolean bringtotop = true
end type

type st_patient from statictext within w_saisie_serie_rdv
integer x = 9
integer width = 1664
integer height = 88
boolean bringtotop = true
integer textsize = -11
integer weight = 700
fontcharset fontcharset = ansi!
long backcolor = 553648127
boolean enabled = false
string text = "Patient : "
alignment alignment = center!
boolean focusrectangle = false
end type

type st_serie_rdv from statictext within w_saisie_serie_rdv
integer x = 9
integer y = 92
integer width = 1664
integer height = 88
boolean bringtotop = true
integer textsize = -11
integer weight = 700
fontcharset fontcharset = ansi!
long backcolor = 553648127
boolean enabled = false
string text = "Série de Rendez-vous"
alignment alignment = center!
boolean focusrectangle = false
end type

type dw_liste from datawindow within w_saisie_serie_rdv
string tag = "brush"
integer x = 9
integer y = 200
integer width = 1664
integer height = 892
integer taborder = 10
boolean bringtotop = true
boolean enabled = false
string title = "none"
string dataobject = "dw_rdv_serie_detail_liste_patient"
boolean vscrollbar = true
boolean livescroll = true
end type

event retrieveend;
Calcul_date_theorique()


// Selection d'une ligne
if rowcount > 0 then
	dw_liste.SelectRow(0,False)
	dw_liste.SelectRow(1,True)
	dw_liste.setrow(1)
end if


end event

type pb_precedent from uo_picturebutton_transparent within w_saisie_serie_rdv
integer x = 119
integer y = 1120
integer taborder = 140
boolean bringtotop = true
boolean originalsize = false
string picturename = "Fleche-H.png"
string powertiptext = "Positionne l~'agenda pour saisir le rendez-vous précédent"
end type

event clicked;call super::clicked;long lig_courante

lig_courante = dw_liste.getrow()


if lig_courante > 1 then
	lig_courante = lig_courante - 1
	dw_liste.SelectRow(0,False)
	dw_liste.SelectRow(lig_courante,True)
	dw_liste.setrow(lig_courante)
end if


ouvrir_agenda_salle_attente (var_code_local , dw_liste.getitemnumber(lig_courante, "ordre"))
calcul_date_theorique()

// Mise à jour du prochain type de rdv pour récup ensuite par w_détail_rdv
w_agenda.v_proc_rdv_type = dw_liste.getitemString(lig_courante, "type_rdv")
end event

type pb_suivant from uo_picturebutton_transparent within w_saisie_serie_rdv
integer x = 338
integer y = 1120
integer taborder = 150
boolean bringtotop = true
boolean originalsize = false
string picturename = "Fleche-B.png"
string powertiptext = "Positionne l~'agenda pour saisir le rendez-vous suivant"
end type

event clicked;call super::clicked;


long lig_courante

lig_courante = dw_liste.getrow()


if lig_courante < dw_liste.rowcount()  then
	lig_courante = lig_courante + 1
	dw_liste.SelectRow(0,False)
	dw_liste.SelectRow(lig_courante,True)
	dw_liste.setrow(lig_courante)
end if

ouvrir_agenda_salle_attente (var_code_local , dw_liste.getitemnumber(lig_courante, "ordre"))

calcul_date_theorique()

// Mise à jour du prochain type de rdv pour récup ensuite par w_détail_rdv
w_agenda.v_proc_rdv_type = dw_liste.getitemString(lig_courante, "type_rdv")

// Pour effacer ou non les informations de prochain rendez-vous

if  dw_liste.getrow() = dw_liste.rowcount()  then
	
	string conf_sup
	
	// Verif alerte d'effacement ou non de prochain rendez-vous
	select param.confirmation_sup_proc_rdv
	into :conf_sup
	from param;

	If conf_sup = 'O' then
		if MessageBox("ATTENTION","Voulez-vous effacer les indications de Prochain Rendez-Vous de la fenêtre des Commentaires Cliniques ?~n~nCeci ne modifiera pas vos Rendez-vous !",Question!,Yesno!,2) = 1 then
			// Sinon, on efface d'office !!
			UPDATE patient SET	"patient"."prochain_rdv_nb" = Null ,
			"patient"."prochain_rdv" = Null ,"patient"."prochain_rdv_tps" = Null,  "patient"."prochain_rdv_serie" = Null  
			WHERE "patient"."code" = :var_code_local   ;
			commit ;
		end if
	else
		// Sinon, on efface d'office !!
		UPDATE patient SET	"patient"."prochain_rdv_nb" = Null ,
		"patient"."prochain_rdv" = Null ,"patient"."prochain_rdv_tps" = Null,  "patient"."prochain_rdv_serie" = Null  
		WHERE "patient"."code" = :var_code_local   ;
		commit ;
	end if
	
	close(parent)
	
end if
end event

type uo_1 from resize_fenetre within w_saisie_serie_rdv
boolean visible = false
integer x = 553
integer y = 488
integer taborder = 20
boolean bringtotop = true
end type

on uo_1.destroy
call resize_fenetre::destroy
end on

