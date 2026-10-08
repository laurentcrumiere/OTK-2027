$PBExportHeader$w_rdv_en_attente.srw
forward
global type w_rdv_en_attente from w_fenetre_arakis
end type
type cb_1 from uo_picturebutton_390x120_fermer within w_rdv_en_attente
end type
type cb_ajouter from uo_picturebutton_390x120 within w_rdv_en_attente
end type
type cb_supprimer from uo_picturebutton_390x120 within w_rdv_en_attente
end type
type cb_annuler from uo_picturebutton_390x120 within w_rdv_en_attente
end type
type cb_enregistrer from uo_picturebutton_390x120 within w_rdv_en_attente
end type
type rb_un from radiobutton within w_rdv_en_attente
end type
type rb_tous from radiobutton within w_rdv_en_attente
end type
type dw_prati from datawindow within w_rdv_en_attente
end type
type dw_liste from u_basedw within w_rdv_en_attente
end type
type cb_autre from uo_picturebutton_390x120 within w_rdv_en_attente
end type
type cb_ecran from uo_picturebutton_390x120 within w_rdv_en_attente
end type
type rb_chrono from radiobutton within w_rdv_en_attente
end type
type rb_nom_patient from radiobutton within w_rdv_en_attente
end type
type rb_type_rdv from radiobutton within w_rdv_en_attente
end type
type uo_1 from resize_fenetre within w_rdv_en_attente
end type
type gb_1 from groupbox within w_rdv_en_attente
end type
type gb_tri from groupbox within w_rdv_en_attente
end type
end forward

global type w_rdv_en_attente from w_fenetre_arakis
integer width = 3127
integer height = 2328
string title = "Sélectionnez le rendez-vous à prendre par double clic"
boolean minbox = false
boolean maxbox = false
boolean resizable = false
windowtype windowtype = response!
boolean center = true
cb_1 cb_1
cb_ajouter cb_ajouter
cb_supprimer cb_supprimer
cb_annuler cb_annuler
cb_enregistrer cb_enregistrer
rb_un rb_un
rb_tous rb_tous
dw_prati dw_prati
dw_liste dw_liste
cb_autre cb_autre
cb_ecran cb_ecran
rb_chrono rb_chrono
rb_nom_patient rb_nom_patient
rb_type_rdv rb_type_rdv
uo_1 uo_1
gb_1 gb_1
gb_tri gb_tri
end type
global w_rdv_en_attente w_rdv_en_attente

type variables


// mode d'ouverture : cela influe sur le double clic de la liste
string v_mode_ouverture

string v_prat_min, v_prat_max


end variables

forward prototypes
public subroutine tri_liste (character v_ordre)
end prototypes

public subroutine tri_liste (character v_ordre);// Tri de la liste en dynamique 

choose case v_ordre
	case "C"
		// Chrono
		dw_liste.setsort("a_partir")
		
	case "P"
		// Patient
			dw_liste.setsort("code")
	
	case "T"
		// Type de rendez-vous
				dw_liste.setsort("type_rdv")

end choose


dw_liste.sort()



end subroutine

on w_rdv_en_attente.create
int iCurrent
call super::create
this.cb_1=create cb_1
this.cb_ajouter=create cb_ajouter
this.cb_supprimer=create cb_supprimer
this.cb_annuler=create cb_annuler
this.cb_enregistrer=create cb_enregistrer
this.rb_un=create rb_un
this.rb_tous=create rb_tous
this.dw_prati=create dw_prati
this.dw_liste=create dw_liste
this.cb_autre=create cb_autre
this.cb_ecran=create cb_ecran
this.rb_chrono=create rb_chrono
this.rb_nom_patient=create rb_nom_patient
this.rb_type_rdv=create rb_type_rdv
this.uo_1=create uo_1
this.gb_1=create gb_1
this.gb_tri=create gb_tri
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_1
this.Control[iCurrent+2]=this.cb_ajouter
this.Control[iCurrent+3]=this.cb_supprimer
this.Control[iCurrent+4]=this.cb_annuler
this.Control[iCurrent+5]=this.cb_enregistrer
this.Control[iCurrent+6]=this.rb_un
this.Control[iCurrent+7]=this.rb_tous
this.Control[iCurrent+8]=this.dw_prati
this.Control[iCurrent+9]=this.dw_liste
this.Control[iCurrent+10]=this.cb_autre
this.Control[iCurrent+11]=this.cb_ecran
this.Control[iCurrent+12]=this.rb_chrono
this.Control[iCurrent+13]=this.rb_nom_patient
this.Control[iCurrent+14]=this.rb_type_rdv
this.Control[iCurrent+15]=this.uo_1
this.Control[iCurrent+16]=this.gb_1
this.Control[iCurrent+17]=this.gb_tri
end on

on w_rdv_en_attente.destroy
call super::destroy
destroy(this.cb_1)
destroy(this.cb_ajouter)
destroy(this.cb_supprimer)
destroy(this.cb_annuler)
destroy(this.cb_enregistrer)
destroy(this.rb_un)
destroy(this.rb_tous)
destroy(this.dw_prati)
destroy(this.dw_liste)
destroy(this.cb_autre)
destroy(this.cb_ecran)
destroy(this.rb_chrono)
destroy(this.rb_nom_patient)
destroy(this.rb_type_rdv)
destroy(this.uo_1)
destroy(this.gb_1)
destroy(this.gb_tri)
end on

event open;call super::open;
// "M" pour mise à jour
// "S" pour selection

v_mode_ouverture = message.StringParm

uo_1.taille(this)		// pour les couleurs

dw_prati.settransobject(sqlca)
dw_prati.retrieve()


v_prat_min = profilestring(dir_ini+inifile_orthokis,"rendez-vous","liste_rdv_en_attente_prat_min", "")
v_prat_max = profilestring(dir_ini+inifile_orthokis,"rendez-vous","liste_rdv_en_attente_prat_max","")

if v_prat_min <> "" then 
	
	if v_prat_min = v_prat_max then 
		// 1 prat
		dw_liste.setitem(1, "code", v_prat_min)
		rb_tous.checked = false
		rb_un.checked = true
		dw_prati.visible = true
	else
		rb_tous.checked = true
		rb_un.checked = false
		dw_prati.visible = false
	end if
	
	
	
end if
dw_liste.settransobject(sqlca)

if v_mode_ouverture = "S" then
	// Sélection 
	title = "Sélectionnez le rendez-vous à prendre par double clic"
	cb_ecran.triggerevent(clicked!)
	cb_ecran.enabled(false)
	cb_annuler.enabled(false)
	cb_enregistrer.enabled(false)
	cb_ajouter.enabled(false)
	cb_supprimer.enabled(false)
	cb_autre.enabled(false)
	this.height = this.height - 320
	centrer(this)


end if


// Tri par défaut
string ls_tri
ls_tri = profilestring(dir_ini+inifile_orthokis,"rendez-vous","liste_rdv_en_attente_tri","C")

choose case ls_tri
	case "C"
		rb_chrono.checked = true
		tri_liste("C")
	case "N"
		rb_nom_patient.checked = true
		tri_liste("N")
	case "T"
		rb_type_rdv.checked = true
		tri_liste("T")
end choose


// Désactivation des saisies suggérées ?
if profilestring(dir_ini+inifile_orthokis,"recherche","desactiver_saisies_suggerees","N") = "O" then
	dw_liste.Object.type_rdv.dddw.AllowEdit = 'No'
end if

cb_ecran.triggerevent(clicked!)

end event

event resize;call super::resize;//uo_1.retaille(this)
end event

event close;call super::close;//// Mémorisation des coordonnées de la fenêtre en sortant
//setprofilestring(dir_ini+inifile_orthokis,"rendez-vous","liste_rdv_en_attente_x",string(UnitsToPixels( this.x, XUnitsToPixels!)))
//setprofilestring(dir_ini+inifile_orthokis,"rendez-vous","liste_rdv_en_attente_y",string(UnitsToPixels( this.y, YUnitsToPixels!)))
//setprofilestring(dir_ini+inifile_orthokis,"rendez-vous","liste_rdv_en_attente_width", string(this.width))
//setprofilestring(dir_ini+inifile_orthokis,"rendez-vous","liste_rdv_en_attente_height", string(this.height))

// Mémo du/des praticien(s)
setprofilestring(dir_ini+inifile_orthokis,"rendez-vous","liste_rdv_en_attente_prat_min", v_prat_min)
setprofilestring(dir_ini+inifile_orthokis,"rendez-vous","liste_rdv_en_attente_prat_max",v_prat_max)

// Mémo du tri
if rb_chrono.checked then 
	setprofilestring(dir_ini+inifile_orthokis,"rendez-vous","liste_rdv_en_attente_tri","C")
else
	if rb_nom_patient.checked then 
		setprofilestring(dir_ini+inifile_orthokis,"rendez-vous","liste_rdv_en_attente_tri","N")
	else
		setprofilestring(dir_ini+inifile_orthokis,"rendez-vous","liste_rdv_en_attente_tri","T")
	end if
end if


if enregistrement_automatique and cb_enregistrer.enabled then
	cb_enregistrer.triggerevent(clicked!)
end if

end event

type p_fond from w_fenetre_arakis`p_fond within w_rdv_en_attente
end type

type cb_1 from uo_picturebutton_390x120_fermer within w_rdv_en_attente
integer x = 2578
integer y = 2048
integer width = 411
integer height = 120
integer taborder = 10
boolean bringtotop = true
integer textsize = -8
fontcharset fontcharset = ansi!
end type

event clicked;

if v_mode_ouverture = "S" then 
	var_suite = false
end if

close(parent)
end event

type cb_ajouter from uo_picturebutton_390x120 within w_rdv_en_attente
integer x = 453
integer y = 2048
integer width = 411
integer height = 120
integer taborder = 30
boolean bringtotop = true
integer textsize = -8
fontcharset fontcharset = ansi!
boolean enabled = false
string text = "&Ajouter"
string iconname = "ACTIONS_ajouter.png"
end type

event clicked;call super::clicked;
long tot

this.hide()
var_suite = false
//open(w_cherche)

guo_fenetre_modale.wf_ouvrir(w_cherche)

if var_suite then 
	dw_liste.InsertRow(0)
	tot = dw_liste.rowcount()
	dw_liste.ScrollToRow(tot)
	
	
	dw_liste.SetItem(tot, "code", var_code)
	dw_liste.SetItem(tot, "patient_nom", var_nom) 
	dw_liste.SetItem(tot, "a_partir", today())
	
	// Mise à jour du type de rendez-vous par défaut
	string vt,tps,delai,codpra
	double vf,vd,nb
	datetime rdv
	date date_rdv

  SELECT "patient"."prochain_rdv",
  			"patient"."prochain_rdv_nb",   
         "patient"."prochain_rdv_tps",
			"patient"."code_praticien" 
    INTO :vt,
	 		:nb,   
         :tps,
			:codpra
    FROM "patient"  
   WHERE "patient"."code" = :var_code   ;
	
	if isnull(vt) then
		// On recherche si type de rdv pour le type de dossier du patient
		select type_rdv.code  INTO :vt from type_rdv, dossier, patient 
		where type_rdv.code = dossier.type_rdv_defaut and patient.type_dossier = dossier.code and patient.code = :var_code ;
		
		if isnull(vt) then
			// on recherche le 1er type de rdv dans l'ordre de tri parmi les actifs
			SELECT min(code) INTO :vt FROM type_rdv where ordre_trie = (select min(ordre_trie) from type_rdv where actif = 1 and  (code_praticien = :codpra or code_praticien = 'COMMUN'))  AND (code_praticien = :codpra or code_praticien = 'COMMUN') ;
		end if
	end if

	dw_liste.SetItem(tot, "type_rdv", vt)
	dw_liste.SetItem(tot, "code_praticien", codpra)
	
	dw_liste.Setcolumn(1)
	dw_liste.SetFocus()
end if


this.show()
end event

type cb_supprimer from uo_picturebutton_390x120 within w_rdv_en_attente
integer x = 878
integer y = 2048
integer width = 411
integer height = 120
integer taborder = 40
boolean bringtotop = true
integer textsize = -8
fontcharset fontcharset = ansi!
boolean enabled = false
string text = "&Supprimer"
string iconname = "ACTIONS_supprimer.png"
end type

event clicked;call super::clicked;if dw_liste.rowcount() > 0 then
	son(7)
	dw_liste.deleterow(dw_liste.getrow())
end if
end event

type cb_annuler from uo_picturebutton_390x120 within w_rdv_en_attente
integer x = 1728
integer y = 2048
integer width = 411
integer height = 120
integer taborder = 60
boolean bringtotop = true
integer textsize = -8
fontcharset fontcharset = ansi!
string text = "A&nnuler"
string iconname = "ACTIONS_annuler.png"
end type

event clicked;call super::clicked;
	
dw_liste.retrieve(v_prat_min, v_prat_max)

end event

type cb_enregistrer from uo_picturebutton_390x120 within w_rdv_en_attente
integer x = 2153
integer y = 2048
integer width = 411
integer height = 120
integer taborder = 70
boolean bringtotop = true
integer textsize = -8
fontcharset fontcharset = ansi!
string text = "&Enregistrer"
boolean default = true
string iconname = "ACTIONS_enregistrer.png"
end type

event clicked;call super::clicked;dw_liste.accepttext()

if dw_liste.update() = 1 then
	commit ;
	if not enregistrement_automatique then
		// si tout va bien on retrieve pour remetre l'ordre entre autre
		cb_annuler.TriggerEvent(Clicked!)
	end if
else
//	MessageBox("ATTENTION !","La mise à jour de la base de données a échoué !~n"+&
//	"Aucune modification ne sera prise en compte !",Exclamation!)
	Rollback ;
end if


end event

type rb_un from radiobutton within w_rdv_en_attente
integer x = 302
integer y = 516
integer width = 622
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 15780518
string text = "Un praticien"
end type

on clicked;rb_tous.checked = false
dw_prati.visible = true
end on

type rb_tous from radiobutton within w_rdv_en_attente
integer x = 302
integer y = 420
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
string text = "Tous les praticiens"
boolean checked = true
end type

on clicked;rb_un.checked = false
dw_prati.visible = false
end on

type dw_prati from datawindow within w_rdv_en_attente
string tag = "no resizeall"
boolean visible = false
integer x = 1088
integer y = 516
integer width = 869
integer height = 80
integer taborder = 20
boolean bringtotop = true
string dataobject = "dw_cherche_prati"
boolean border = false
end type

type dw_liste from u_basedw within w_rdv_en_attente
event ue_leftbuttonup pbm_dwnlbuttonup
boolean visible = false
integer x = 41
integer y = 16
integer width = 3017
integer height = 1784
integer taborder = 90
boolean bringtotop = true
string dataobject = "dw_rdv_en_attente"
end type

event doubleclicked;call super::doubleclicked;
if rowcount() > 0 then 
		
	if v_mode_ouverture = "M" then 
		// double clic, comme dans la salle d'attente !!
		
		if row > 0 then
		
			var_code 				= 	this.getitemnumber(row,"code")
			var_numero_dossier 	= 	this.getitemnumber(row,"numero_dossier")
			var_nom 					= this.getitemstring(row,"patient_nom")
			var_nomp 				= ""
			var_pay 					= ""
			var_moul 					= ""
		
			ouverture_salle_attente()
		end if
		
	else
		// Selection => on mémorise les infos et on les renvoie à l'agenda
		st_rdv v_rdv_a_donner
		
		v_rdv_a_donner.code_patient_courant = this.getitemnumber(row,"code")
		v_rdv_a_donner.praticien_a = this.getitemString(row,"code_praticien")
		v_rdv_a_donner.type_rdv = this.getitemString(row,"type_rdv")
		
		var_suite = true
		CloseWithReturn(parent, v_rdv_a_donner)
		
		
		//close(parent)
	end if 
end if
end event

event rbuttondown;if row > 0 then
	This.SelectRow(0,False)
	This.SelectRow(row,True)
	This.setrow(row)
	OpenMenuPatient_Listes(this)
end if
end event

event itemchanged;call super::itemchanged;if enregistrement_automatique and cb_enregistrer.enabled then
	cb_enregistrer.triggerevent(clicked!)
end if
end event

type cb_autre from uo_picturebutton_390x120 within w_rdv_en_attente
integer x = 1303
integer y = 2048
integer width = 411
integer height = 120
integer taborder = 120
boolean bringtotop = true
integer textsize = -8
fontcharset fontcharset = ansi!
boolean enabled = false
string text = "&Autre"
string iconname = "ACTIONS_autre.png"
end type

event clicked;call super::clicked;cb_ajouter.enabled (false)
cb_supprimer.enabled (false)
cb_autre.enabled (false)

dw_liste.visible = false
cb_ecran.enabled(true)





end event

type cb_ecran from uo_picturebutton_390x120 within w_rdv_en_attente
integer x = 27
integer y = 2048
integer width = 411
integer height = 120
integer taborder = 130
boolean bringtotop = true
integer textsize = -8
fontcharset fontcharset = ansi!
string text = "&Ecran"
boolean default = true
string iconname = "ACTIONS_ecran.png"
end type

event clicked;call super::clicked;if rb_tous.checked then 
	v_prat_min = ""
	v_prat_max = "ZZZZZZ"
else
	v_prat_min = dw_prati.gettext()
	v_prat_max = v_prat_min
end if
	
dw_liste.retrieve(v_prat_min, v_prat_max)

dw_liste.visible = true

cb_ajouter.enabled (true)
cb_supprimer.enabled (true)
cb_autre.enabled (true)

this.enabled(false)
end event

type rb_chrono from radiobutton within w_rdv_en_attente
integer x = 69
integer y = 1904
integer width = 457
integer height = 88
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 553648127
string text = "Chronologique"
end type

event clicked;tri_liste("C")
end event

type rb_nom_patient from radiobutton within w_rdv_en_attente
integer x = 517
integer y = 1904
integer width = 539
integer height = 88
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 553648127
string text = "Nom du patient"
end type

event clicked;tri_liste("P")
end event

type rb_type_rdv from radiobutton within w_rdv_en_attente
integer x = 992
integer y = 1904
integer width = 626
integer height = 88
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 553648127
string text = "Type de rendez-vous"
end type

event clicked;tri_liste("T")
end event

type uo_1 from resize_fenetre within w_rdv_en_attente
boolean visible = false
integer x = 2432
integer y = 1332
integer taborder = 30
boolean bringtotop = true
end type

on uo_1.destroy
call resize_fenetre::destroy
end on

type gb_1 from groupbox within w_rdv_en_attente
integer x = 137
integer y = 340
integer width = 2121
integer height = 304
integer taborder = 10
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean italic = true
long textcolor = 33554432
long backcolor = 15780518
string text = "Choix du praticien"
end type

type gb_tri from groupbox within w_rdv_en_attente
integer x = 32
integer y = 1844
integer width = 1586
integer height = 164
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean italic = true
long textcolor = 33554432
long backcolor = 553648127
string text = "Tri"
end type

