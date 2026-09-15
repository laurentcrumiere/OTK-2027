$PBExportHeader$w_liste_patients_rdv_user.srw
forward
global type w_liste_patients_rdv_user from w_liste_patients
end type
type st_23 from statictext within w_liste_patients_rdv_user
end type
type st_33 from statictext within w_liste_patients_rdv_user
end type
type st_22 from statictext within w_liste_patients_rdv_user
end type
type em_modif_min from uo_date_calendrier within w_liste_patients_rdv_user
end type
type em_modif_max from uo_date_calendrier within w_liste_patients_rdv_user
end type
type em_heure_modif_min from editmask within w_liste_patients_rdv_user
end type
type em_heure_modif_max from editmask within w_liste_patients_rdv_user
end type
type rb_tous_users from radiobutton within w_liste_patients_rdv_user
end type
type rb_un_user from radiobutton within w_liste_patients_rdv_user
end type
type dw_user from datawindow within w_liste_patients_rdv_user
end type
type uo_filtre_email from uo_filtre_emails within w_liste_patients_rdv_user
end type
type gb_5 from groupbox within w_liste_patients_rdv_user
end type
end forward

global type w_liste_patients_rdv_user from w_liste_patients
string title = "Liste des Rendez-Vous pris par un Utilisateur entre 2 dates"
st_23 st_23
st_33 st_33
st_22 st_22
em_modif_min em_modif_min
em_modif_max em_modif_max
em_heure_modif_min em_heure_modif_min
em_heure_modif_max em_heure_modif_max
rb_tous_users rb_tous_users
rb_un_user rb_un_user
dw_user dw_user
uo_filtre_email uo_filtre_email
gb_5 gb_5
end type
global w_liste_patients_rdv_user w_liste_patients_rdv_user

forward prototypes
public subroutine prepa ()
end prototypes

public subroutine prepa ();string pra_min,pra_max,typ,tit,p
double code_min,code_max
date date_min,date_max
datetime modif_min, modif_max
string user_min, user_max, n

if not prepa_faite then
	//prepa_faite = true
	if rb_tous.checked then
		pra_min="      "
		pra_max="ZZZZZZ"
		tit = "Pour tous les praticiens"
	else
		pra_min=dw_prati.getitemstring(dw_prati.getrow(),"code")
		pra_max=dw_prati.getitemstring(dw_prati.getrow(),"code")
		SELECT nom INTO :p FROM prati WHERE code = :pra_min ;
		tit = "Pour le Dr "+p
	end if

	if rb_tous_users.checked then
		user_min="      "
		user_max="ZZZZZZ"
		tit = tit  + " - Pour tous utilisateurs - "
	else
		user_min=dw_user.getitemstring(dw_user.getrow(),"code")
		user_max= user_min
	  SELECT "nom"  INTO :n FROM "utilisateurs"      	WHERE ( "code" = :user_min ) ;

		tit = tit +  " - Pour : "+n+" - "
	end if

	modif_min = DateTime (em_modif_min.getTheDate(), time(em_heure_modif_min.text))
	modif_max = DateTime (em_modif_max.getTheDate(), time(em_heure_modif_max.text))
	
	tit = tit + "RDV Saisis / Mis à jour entre le "+em_modif_min.text+" " +em_heure_modif_min.text+ " et le "+em_modif_max.text+" " + em_heure_modif_max.text

	open(w_patience)
	dw_liste.Modify("titre.text = '"+tit+"'")
	dw_liste.retrieve(pra_min,pra_max,modif_min,modif_max, user_min, user_max)
	close(w_patience)

	//em_nb.text = string(dw_liste.rowcount())+" Rendez-vous"
	//em_nb.visible = true


end if

end subroutine

event open;call super::open;
em_modif_min.SetDate( relativedate( today() , -1) )
em_modif_max.SetDate( today())


em_heure_modif_min.text = "00:00"
em_heure_modif_max.text = "23.59"

// on prend les négatifs éventuels
em_min.text = string(min)


dw_user.Settransobject(sqlca)
dw_user.retrieve()

// On propose par défaut le user qui est défini pour le portail patient
if webcommunication and not planification then 
	string v_user
	select top 1 code_user_portail_patient into :v_user from param ;
	dw_user.SetItem(1, "code", v_user)
end if

uo_filtre_email.dw_liste = dw_liste
uo_filtre_email.em_statut_mere = em_nb





end event

on w_liste_patients_rdv_user.create
int iCurrent
call super::create
this.st_23=create st_23
this.st_33=create st_33
this.st_22=create st_22
this.em_modif_min=create em_modif_min
this.em_modif_max=create em_modif_max
this.em_heure_modif_min=create em_heure_modif_min
this.em_heure_modif_max=create em_heure_modif_max
this.rb_tous_users=create rb_tous_users
this.rb_un_user=create rb_un_user
this.dw_user=create dw_user
this.uo_filtre_email=create uo_filtre_email
this.gb_5=create gb_5
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.st_23
this.Control[iCurrent+2]=this.st_33
this.Control[iCurrent+3]=this.st_22
this.Control[iCurrent+4]=this.em_modif_min
this.Control[iCurrent+5]=this.em_modif_max
this.Control[iCurrent+6]=this.em_heure_modif_min
this.Control[iCurrent+7]=this.em_heure_modif_max
this.Control[iCurrent+8]=this.rb_tous_users
this.Control[iCurrent+9]=this.rb_un_user
this.Control[iCurrent+10]=this.dw_user
this.Control[iCurrent+11]=this.uo_filtre_email
this.Control[iCurrent+12]=this.gb_5
end on

on w_liste_patients_rdv_user.destroy
call super::destroy
destroy(this.st_23)
destroy(this.st_33)
destroy(this.st_22)
destroy(this.em_modif_min)
destroy(this.em_modif_max)
destroy(this.em_heure_modif_min)
destroy(this.em_heure_modif_max)
destroy(this.rb_tous_users)
destroy(this.rb_un_user)
destroy(this.dw_user)
destroy(this.uo_filtre_email)
destroy(this.gb_5)
end on

type p_fond from w_liste_patients`p_fond within w_liste_patients_rdv_user
end type

type cb_imprimer from w_liste_patients`cb_imprimer within w_liste_patients_rdv_user
integer x = 2249
end type

type cb_autre from w_liste_patients`cb_autre within w_liste_patients_rdv_user
integer x = 1774
integer taborder = 120
end type

type cb_fermer from w_liste_patients`cb_fermer within w_liste_patients_rdv_user
integer x = 2725
integer taborder = 130
end type

type cb_ecran from w_liste_patients`cb_ecran within w_liste_patients_rdv_user
integer x = 553
integer taborder = 140
end type

type cb_lien_word from w_liste_patients`cb_lien_word within w_liste_patients_rdv_user
end type

type uo_size from w_liste_patients`uo_size within w_liste_patients_rdv_user
integer taborder = 40
end type

type rb_un from w_liste_patients`rb_un within w_liste_patients_rdv_user
integer x = 375
end type

type rb_tous from w_liste_patients`rb_tous within w_liste_patients_rdv_user
integer x = 375
end type

type em_nb from w_liste_patients`em_nb within w_liste_patients_rdv_user
integer taborder = 70
end type

type em_max from w_liste_patients`em_max within w_liste_patients_rdv_user
string tag = ""
boolean visible = false
integer taborder = 50
end type

type em_min from w_liste_patients`em_min within w_liste_patients_rdv_user
string tag = ""
boolean visible = false
integer taborder = 20
end type

type dw_1 from w_liste_patients`dw_1 within w_liste_patients_rdv_user
integer taborder = 60
end type

type gb_1 from w_liste_patients`gb_1 within w_liste_patients_rdv_user
integer taborder = 10
end type

type dw_prati from w_liste_patients`dw_prati within w_liste_patients_rdv_user
integer taborder = 100
end type

type cbx_filtre from w_liste_patients`cbx_filtre within w_liste_patients_rdv_user
end type

type st_min from w_liste_patients`st_min within w_liste_patients_rdv_user
boolean visible = false
end type

type st_max from w_liste_patients`st_max within w_liste_patients_rdv_user
boolean visible = false
end type

type dw_liste from w_liste_patients`dw_liste within w_liste_patients_rdv_user
integer y = 0
integer taborder = 90
string dataobject = "dw_liste_patients_rdv_user"
end type

type st_23 from statictext within w_liste_patients_rdv_user
integer x = 347
integer y = 968
integer width = 969
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
string facename = "Arial"
boolean underline = true
long backcolor = 553648127
string text = "Période de saisie / modification :"
end type

type st_33 from statictext within w_liste_patients_rdv_user
integer x = 475
integer y = 1152
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

type st_22 from statictext within w_liste_patients_rdv_user
integer x = 1559
integer y = 1152
integer width = 155
integer height = 76
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
string facename = "Arial"
long backcolor = 553648127
string text = "Et le"
alignment alignment = center!
end type

type em_modif_min from uo_date_calendrier within w_liste_patients_rdv_user
event destroy ( )
integer x = 759
integer y = 1144
integer taborder = 180
boolean bringtotop = true
end type

on em_modif_min.destroy
call uo_date_calendrier::destroy
end on

type em_modif_max from uo_date_calendrier within w_liste_patients_rdv_user
event destroy ( )
integer x = 1742
integer y = 1144
integer taborder = 190
boolean bringtotop = true
end type

on em_modif_max.destroy
call uo_date_calendrier::destroy
end on

type em_heure_modif_min from editmask within w_liste_patients_rdv_user
integer x = 1216
integer y = 1144
integer width = 279
integer height = 92
integer taborder = 181
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
string text = "none"
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = timemask!
string mask = "hh:mm"
boolean spin = true
end type

type em_heure_modif_max from editmask within w_liste_patients_rdv_user
integer x = 2199
integer y = 1144
integer width = 279
integer height = 92
integer taborder = 191
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
string text = "none"
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = timemask!
string mask = "hh:mm"
boolean spin = true
end type

type rb_tous_users from radiobutton within w_liste_patients_rdv_user
integer x = 375
integer y = 600
integer width = 695
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 15780518
string text = "Tous les utilisateurs"
end type

event clicked;dw_user.visible = false
end event

type rb_un_user from radiobutton within w_liste_patients_rdv_user
integer x = 375
integer y = 696
integer width = 617
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 15780518
string text = "Un utilisateur"
boolean checked = true
end type

event clicked;dw_user.visible = true
end event

type dw_user from datawindow within w_liste_patients_rdv_user
string tag = "no resizeall"
integer x = 1111
integer y = 692
integer width = 1184
integer height = 68
integer taborder = 40
boolean bringtotop = true
string title = "none"
string dataobject = "dw_cherche_utilisateur"
boolean border = false
boolean livescroll = true
end type

type uo_filtre_email from uo_filtre_emails within w_liste_patients_rdv_user
string tag = "no resize all"
integer x = 1029
integer y = 1860
integer taborder = 200
boolean bringtotop = true
end type

on uo_filtre_email.destroy
call uo_filtre_emails::destroy
end on

type gb_5 from groupbox within w_liste_patients_rdv_user
integer x = 293
integer y = 516
integer width = 2121
integer height = 304
integer taborder = 40
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean italic = true
long textcolor = 33554432
long backcolor = 15780518
string text = "Choix de l~'utilisateur"
end type

