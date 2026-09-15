$PBExportHeader$w_utilisateur_fiche_odrade.srw
forward
global type w_utilisateur_fiche_odrade from w_fenetre_arakis
end type
type pb_1 from uo_picturebutton_390x120_fermer within w_utilisateur_fiche_odrade
end type
type pb_enregistrer from uo_picturebutton_390x120 within w_utilisateur_fiche_odrade
end type
type pb_annuler from uo_picturebutton_390x120 within w_utilisateur_fiche_odrade
end type
type st_1 from statictext within w_utilisateur_fiche_odrade
end type
type sle_user_odrade from singlelineedit within w_utilisateur_fiche_odrade
end type
type pb_modifier_user from uo_picturebutton_250x120 within w_utilisateur_fiche_odrade
end type
type st_2 from statictext within w_utilisateur_fiche_odrade
end type
type pb_verifier_mdp from uo_picturebutton_250x120 within w_utilisateur_fiche_odrade
end type
type sle_mdp_odrade from singlelineedit within w_utilisateur_fiche_odrade
end type
type rb_analyse_1 from radiobutton within w_utilisateur_fiche_odrade
end type
type rb_analyse_2 from radiobutton within w_utilisateur_fiche_odrade
end type
type rb_analyse_libre from radiobutton within w_utilisateur_fiche_odrade
end type
type rb_autre_analyse from radiobutton within w_utilisateur_fiche_odrade
end type
type ddlb_analyses from dropdownlistbox within w_utilisateur_fiche_odrade
end type
type sle_analyse_1 from singlelineedit within w_utilisateur_fiche_odrade
end type
type sle_analyse_2 from singlelineedit within w_utilisateur_fiche_odrade
end type
type rb_selon_sexe from radiobutton within w_utilisateur_fiche_odrade
end type
type gb_1 from groupbox within w_utilisateur_fiche_odrade
end type
end forward

global type w_utilisateur_fiche_odrade from w_fenetre_arakis
integer width = 3141
integer height = 1688
string title = "Paramétrage Odrade pour l~'Utilisateur "
boolean minbox = false
boolean maxbox = false
boolean resizable = false
windowtype windowtype = response!
pb_1 pb_1
pb_enregistrer pb_enregistrer
pb_annuler pb_annuler
st_1 st_1
sle_user_odrade sle_user_odrade
pb_modifier_user pb_modifier_user
st_2 st_2
pb_verifier_mdp pb_verifier_mdp
sle_mdp_odrade sle_mdp_odrade
rb_analyse_1 rb_analyse_1
rb_analyse_2 rb_analyse_2
rb_analyse_libre rb_analyse_libre
rb_autre_analyse rb_autre_analyse
ddlb_analyses ddlb_analyses
sle_analyse_1 sle_analyse_1
sle_analyse_2 sle_analyse_2
rb_selon_sexe rb_selon_sexe
gb_1 gb_1
end type
global w_utilisateur_fiche_odrade w_utilisateur_fiche_odrade

type variables


string v_code	// code de l'utlisateur mis à jour


long tab_analyses[]
long nb_analyses


long v_code_utilisateur_odrade 
string v_mdp_odrade, v_nom_utilisateur_odrade
long v_analyse_odrade

long v_analyse_defaut_1, v_analyse_defaut_2
end variables

forward prototypes
public subroutine get_infos ()
public subroutine maj_infos_utilisateur_odrade ()
public function string get_libelle_analyse (long v_code_analyse)
end prototypes

public subroutine get_infos ();
// pour gérer le titre et les éléments déjà saisis

// dans Orthokis 
select isnull(user_odrade,-1), mdp_odrade, isnull(analyse_odrade,-1)  
into :v_code_utilisateur_odrade, :v_mdp_odrade, :v_analyse_odrade 
from utilisateurs where code = :v_code ;



// Constitution de la liste des analyses
long v_code_analyse
string v_intitule

DECLARE cur_analyse CURSOR FOR SELECT code_analyse, intitule 
FROM liste_analyses WHERE actif = 'oui' ORDER BY code_analyse  using t_odrade ;

nb_analyses = 0

open cur_analyse ;

Fetch cur_analyse into :v_code_analyse, :v_intitule ;

do while t_odrade.sqlcode = 0 

	nb_analyses = nb_analyses + 1
	
	
	tab_analyses[nb_analyses] = v_code_analyse 
	ddlb_analyses.additem(v_intitule+" ("+string(v_code_analyse)+")")
	
	
	Fetch cur_analyse into :v_code_analyse, :v_intitule ;

loop

close cur_analyse ;


// La liste est constituée ... 
ddlb_analyses.selectItem(1)

// Maj des infos du user depuis Odrade
maj_infos_utilisateur_odrade()


// -------
if v_analyse_odrade = -1 then
	rb_analyse_1.checked = true
else
	if v_analyse_odrade = -2 then
		rb_analyse_2.checked = true
	else
		if v_analyse_odrade = 0 then
			rb_analyse_libre.checked = true
		else
			if v_analyse_odrade > 0 then
				rb_autre_analyse.checked = true
				ddlb_analyses.visible = true
				// recherche du code dans le tableau
				long cpt, index_analyse
				boolean trouve = false
				
				cpt = 1
				
				do while cpt <= nb_analyses and not trouve
					if tab_analyses[cpt] = v_analyse_odrade then
						index_analyse = cpt
						trouve = true
					end if
					cpt = cpt + 1
				loop 
				
				// on va se positionner dans liste
				if trouve then
					ddlb_analyses.selectItem(index_analyse)
				end if
				
			end if
		end if
	end if
end if


sle_mdp_odrade.text = v_mdp_odrade


end subroutine

public subroutine maj_infos_utilisateur_odrade ();

// recherche des analyses par défaut du User dans Odrade

select nom, analyse_1, analyse_2 into :v_nom_utilisateur_odrade, :v_analyse_defaut_1, :v_analyse_defaut_2 
from utilisateurs where code_utilisateur = :v_code_utilisateur_odrade  using t_odrade ;

sle_user_odrade.text = v_nom_utilisateur_odrade

string a 
a = get_libelle_analyse(v_analyse_defaut_1)

if v_analyse_defaut_1 > 0 then
	sle_analyse_1.text = get_libelle_analyse(v_analyse_defaut_1) + " ("+string(v_analyse_defaut_1)+")"
else
	sle_analyse_1.text = ''
end if
if v_analyse_defaut_2 > 0 then
	sle_analyse_2.text = get_libelle_analyse(v_analyse_defaut_2) + " ("+string(v_analyse_defaut_2)+")"
else
	sle_analyse_2.text = ''
end if

end subroutine

public function string get_libelle_analyse (long v_code_analyse);

// Renvoie le libelle d'une analyse de Odrade selon son code
string v_libelle

select intitule into :v_libelle from liste_analyses where code_analyse = :v_code_analyse using t_odrade ;

return v_libelle
end function

on w_utilisateur_fiche_odrade.create
int iCurrent
call super::create
this.pb_1=create pb_1
this.pb_enregistrer=create pb_enregistrer
this.pb_annuler=create pb_annuler
this.st_1=create st_1
this.sle_user_odrade=create sle_user_odrade
this.pb_modifier_user=create pb_modifier_user
this.st_2=create st_2
this.pb_verifier_mdp=create pb_verifier_mdp
this.sle_mdp_odrade=create sle_mdp_odrade
this.rb_analyse_1=create rb_analyse_1
this.rb_analyse_2=create rb_analyse_2
this.rb_analyse_libre=create rb_analyse_libre
this.rb_autre_analyse=create rb_autre_analyse
this.ddlb_analyses=create ddlb_analyses
this.sle_analyse_1=create sle_analyse_1
this.sle_analyse_2=create sle_analyse_2
this.rb_selon_sexe=create rb_selon_sexe
this.gb_1=create gb_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.pb_1
this.Control[iCurrent+2]=this.pb_enregistrer
this.Control[iCurrent+3]=this.pb_annuler
this.Control[iCurrent+4]=this.st_1
this.Control[iCurrent+5]=this.sle_user_odrade
this.Control[iCurrent+6]=this.pb_modifier_user
this.Control[iCurrent+7]=this.st_2
this.Control[iCurrent+8]=this.pb_verifier_mdp
this.Control[iCurrent+9]=this.sle_mdp_odrade
this.Control[iCurrent+10]=this.rb_analyse_1
this.Control[iCurrent+11]=this.rb_analyse_2
this.Control[iCurrent+12]=this.rb_analyse_libre
this.Control[iCurrent+13]=this.rb_autre_analyse
this.Control[iCurrent+14]=this.ddlb_analyses
this.Control[iCurrent+15]=this.sle_analyse_1
this.Control[iCurrent+16]=this.sle_analyse_2
this.Control[iCurrent+17]=this.rb_selon_sexe
this.Control[iCurrent+18]=this.gb_1
end on

on w_utilisateur_fiche_odrade.destroy
call super::destroy
destroy(this.pb_1)
destroy(this.pb_enregistrer)
destroy(this.pb_annuler)
destroy(this.st_1)
destroy(this.sle_user_odrade)
destroy(this.pb_modifier_user)
destroy(this.st_2)
destroy(this.pb_verifier_mdp)
destroy(this.sle_mdp_odrade)
destroy(this.rb_analyse_1)
destroy(this.rb_analyse_2)
destroy(this.rb_analyse_libre)
destroy(this.rb_autre_analyse)
destroy(this.ddlb_analyses)
destroy(this.sle_analyse_1)
destroy(this.sle_analyse_2)
destroy(this.rb_selon_sexe)
destroy(this.gb_1)
end on

event open;call super::open;

v_code = message.StringParm 

// pour gérer le titre et les éléments déjà saisis
string v_nom_utilisateur

select nom into :v_nom_utilisateur 
from utilisateurs where code = :v_code ;


this.title = this.title + v_nom_utilisateur
gb_1.backcolor =  couleur_fond_datawindow


centrer(this)


if connexion_base_odrade() = 1 then
	// chargement des infos
	get_infos()
else
	close(this)
end if 
end event

event close;call super::close;


deconnexion_base_odrade()




end event

type p_fond from w_fenetre_arakis`p_fond within w_utilisateur_fiche_odrade
integer height = 168
end type

type pb_1 from uo_picturebutton_390x120_fermer within w_utilisateur_fiche_odrade
integer x = 2418
integer y = 1356
integer width = 576
integer height = 152
integer taborder = 10
boolean bringtotop = true
end type

type pb_enregistrer from uo_picturebutton_390x120 within w_utilisateur_fiche_odrade
integer x = 1792
integer y = 1360
integer width = 576
integer height = 152
integer taborder = 30
boolean bringtotop = true
string text = "&Enregistrer"
boolean default = true
string iconname = "ACTIONS_enregistrer.png"
end type

event clicked;call super::clicked;// mot de passe
v_mdp_odrade = sle_mdp_odrade.text

// analyse
if rb_analyse_1.checked then
	v_analyse_odrade = -1
else
	if rb_analyse_2.checked then
		v_analyse_odrade = -2
	else
		if rb_analyse_libre.checked then
			v_analyse_odrade = 0
		else
			if rb_selon_sexe.checked then
				v_analyse_odrade = -3	
			else
				v_analyse_odrade = tab_analyses[ ddlb_analyses.FindItem(ddlb_analyses.text,0) ]
			end if
		end if
	end if
end if




// Mise à jour des information

// dans Orthokis 

Update utilisateurs set user_odrade = :v_code_utilisateur_odrade, 
mdp_odrade = :v_mdp_odrade, analyse_odrade  = :v_analyse_odrade 
where code = :v_code ;

if sqlca.sqlcode = 0 then
	commit ;
else
	rollback ;
	Messagebox("ERREUR DANS LA MISE A JOUR DE LA BASE DE DONNEES",sqlca.sqlerrtext)
end if

end event

type pb_annuler from uo_picturebutton_390x120 within w_utilisateur_fiche_odrade
integer x = 1166
integer y = 1360
integer width = 576
integer height = 152
integer taborder = 60
boolean bringtotop = true
string text = "&Annuler"
string iconname = "ACTIONS_annuler.png"
end type

event clicked;call super::clicked;
get_infos()
end event

type st_1 from statictext within w_utilisateur_fiche_odrade
integer x = 55
integer y = 64
integer width = 887
integer height = 88
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
string facename = "Arial"
long backcolor = 553648127
boolean enabled = false
string text = "Nom de l~'utilisateur Odrade : "
boolean focusrectangle = false
end type

type sle_user_odrade from singlelineedit within w_utilisateur_fiche_odrade
integer x = 983
integer y = 64
integer width = 1568
integer height = 88
integer taborder = 20
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean enabled = false
string text = "non défini"
boolean displayonly = true
borderstyle borderstyle = stylelowered!
end type

type pb_modifier_user from uo_picturebutton_250x120 within w_utilisateur_fiche_odrade
integer x = 2597
integer y = 52
integer width = 507
integer height = 112
integer taborder = 40
boolean bringtotop = true
string text = "&Modifier"
string iconname = "ACTIONS_modifier.png"
end type

event clicked;call super::clicked;
long ancien_code 

ancien_code = v_code_utilisateur_odrade

OpenWithParm(w_recherche_utilisateurs,2)

// w_recherche_utilisateurs met à jour v_code_utilisateur_odrade
if v_code_utilisateur_odrade <> ancien_code then
	
	// Mise à jour des analyses par défaut
	maj_infos_utilisateur_odrade()
	
end if
end event

type st_2 from statictext within w_utilisateur_fiche_odrade
integer x = 119
integer y = 296
integer width = 421
integer height = 88
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
string facename = "Arial"
long backcolor = 553648127
boolean enabled = false
string text = "Mot de Passe"
boolean focusrectangle = false
end type

type pb_verifier_mdp from uo_picturebutton_250x120 within w_utilisateur_fiche_odrade
integer x = 1038
integer y = 276
integer width = 507
integer height = 112
integer taborder = 70
boolean bringtotop = true
string text = "&Vérifier"
string iconname = "ACTIONS_chercher.png"
end type

event clicked;call super::clicked;

// Vérifie si le MDP saisi ici est identique à celui de Odrade
string v_mot_de_passe

select mot_de_passe into :v_mot_de_passe from utilisateurs 
where code_utilisateur = :v_code_utilisateur_odrade using t_odrade ;

if trim(upper(v_mot_de_passe)) = trim(upper(sle_mdp_odrade.text)) then 
	Messagebox("VERIFICATION","Le mot de passe saisi est correct pour Odrade !")
else
	Messagebox("VERIFICATION","Le mot de passe saisi n'est pas correct pour Odrade !")
end if
end event

type sle_mdp_odrade from singlelineedit within w_utilisateur_fiche_odrade
integer x = 553
integer y = 292
integer width = 462
integer height = 88
integer taborder = 50
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "non défini"
boolean password = true
integer limit = 8
borderstyle borderstyle = stylelowered!
end type

type rb_analyse_1 from radiobutton within w_utilisateur_fiche_odrade
integer x = 128
integer y = 564
integer width = 759
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 553648127
string text = "Analyse par défaut N°1"
end type

event clicked;

ddlb_analyses.visible = false


end event

type rb_analyse_2 from radiobutton within w_utilisateur_fiche_odrade
integer x = 128
integer y = 684
integer width = 759
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 553648127
string text = "Analyse par défaut N°2"
end type

event clicked;
ddlb_analyses.visible = false


end event

type rb_analyse_libre from radiobutton within w_utilisateur_fiche_odrade
integer x = 128
integer y = 800
integer width = 882
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 553648127
string text = "Analyse Libre (lorsque dispo)"
end type

event clicked;
ddlb_analyses.visible = false


end event

type rb_autre_analyse from radiobutton within w_utilisateur_fiche_odrade
integer x = 128
integer y = 916
integer width = 850
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 553648127
string text = "Autre analyse à définir : "
end type

event clicked;
ddlb_analyses.visible = true


end event

type ddlb_analyses from dropdownlistbox within w_utilisateur_fiche_odrade
boolean visible = false
integer x = 919
integer y = 916
integer width = 1353
integer height = 868
integer taborder = 90
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

type sle_analyse_1 from singlelineedit within w_utilisateur_fiche_odrade
integer x = 942
integer y = 564
integer width = 1568
integer height = 88
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean italic = true
long backcolor = 553648127
end type

type sle_analyse_2 from singlelineedit within w_utilisateur_fiche_odrade
integer x = 942
integer y = 680
integer width = 1568
integer height = 88
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean italic = true
long backcolor = 553648127
end type

type rb_selon_sexe from radiobutton within w_utilisateur_fiche_odrade
integer x = 128
integer y = 1032
integer width = 2409
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 553648127
string text = "Utiliser l~'analyse par défaut N°1 si patient de sexe Masculin, l~'analyse N° sinon"
end type

event clicked;ddlb_analyses.visible = false


end event

type gb_1 from groupbox within w_utilisateur_fiche_odrade
integer x = 50
integer y = 464
integer width = 2587
integer height = 700
integer taborder = 80
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 553648127
string text = "Analyse à réaliser"
end type

