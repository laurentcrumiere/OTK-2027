$PBExportHeader$uo_confidentiel_contre_indication.sru
forward
global type uo_confidentiel_contre_indication from userobject
end type
type p_indic_plein from picture within uo_confidentiel_contre_indication
end type
type p_indic_vide from picture within uo_confidentiel_contre_indication
end type
type p_vide from picture within uo_confidentiel_contre_indication
end type
type p_plein from picture within uo_confidentiel_contre_indication
end type
end forward

global type uo_confidentiel_contre_indication from userobject
integer width = 329
integer height = 132
long backcolor = 65280
string text = "none"
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
p_indic_plein p_indic_plein
p_indic_vide p_indic_vide
p_vide p_vide
p_plein p_plein
end type
global uo_confidentiel_contre_indication uo_confidentiel_contre_indication

type variables


double var_code_local

window fenetre_mere_local
end variables

forward prototypes
public subroutine maj (double num)
public subroutine init_fenetre_mere (window v_fenetre_mere)
public subroutine verif_alertes (double num_patient, string fenetre)
end prototypes

public subroutine maj (double num);// Permet d'afficher un icode plein ou vide en fonction d'une zone de la base

string v_confidentiel, v_contre_indic
decimal l


var_code_local = num

SELECT confidentiel, contre_indic INTO :v_confidentiel, :v_contre_indic FROM patient WHERE code = :var_code_local ;

// Confidentiel
l = len(trim(v_confidentiel))
zero(l)

p_vide.visible = false
p_plein.visible = false

if l = 0 then
	p_vide.visible = true
else
	p_plein.visible = true
end if


// Contre indication
l = len(trim(v_contre_indic))
zero(l)

p_indic_vide.visible = false
p_indic_plein.visible = false

if l = 0 then
	p_indic_vide.visible = true
else
	p_indic_plein.visible = true
end if


end subroutine

public subroutine init_fenetre_mere (window v_fenetre_mere);fenetre_mere_local = v_fenetre_mere
end subroutine

public subroutine verif_alertes (double num_patient, string fenetre);// Permet d'afficher un icode plein ou vide en fonction d'une zone de la base

string v_confidentiel, v_contre_indic

// Fenetre indique de quelle fenetre est lancée la verif .... utile pour savoir l'alerte ou pas de la zone confidentiel
// CC : commentaires cliniques
// CA : commentaires admini
// AD : fiche administrative
// SR : Soins et reglement
// RD : Rdv
// SY : Synthèse
// IM : Imagerie


string v_alerte_confidentiel, v_alerte_contre_indic
string  v_alerte_confidentiel_adm , v_alerte_confidentiel_rdv , v_alerte_confidentiel_soins, v_alerte_confidentiel_com_adm, v_alerte_confidentiel_synthese , v_alerte_confidentiel_imagerie
decimal l


var_code_local = num_patient

SELECT confidentiel, contre_indic, alerte_confidentiel, alerte_contre_indic , alerte_confidentiel_adm , alerte_confidentiel_rdv , alerte_confidentiel_soins, alerte_confidentiel_com_adm, alerte_confidentiel_synthese  , alerte_confidentiel_img
INTO :v_confidentiel, :v_contre_indic, :v_alerte_confidentiel, :v_alerte_contre_indic ,  :v_alerte_confidentiel_adm , :v_alerte_confidentiel_rdv , :v_alerte_confidentiel_soins, :v_alerte_confidentiel_com_adm, :v_alerte_confidentiel_synthese , :v_alerte_confidentiel_imagerie
FROM patient WHERE code = :var_code_local ;

// Confidentiel
l = len(trim(v_confidentiel))
zero(l)

if l > 0 then
	if (fenetre = "CC" and v_alerte_confidentiel = 'O') or (fenetre = "AD" and v_alerte_confidentiel_adm = 'O') or (fenetre = "RD" and v_alerte_confidentiel_rdv = 'O') or &
	  (fenetre = "SR" and v_alerte_confidentiel_soins = 'O') or (fenetre = "CA" and v_alerte_confidentiel_com_adm = 'O') or (fenetre = "SY" and v_alerte_confidentiel_synthese = 'O')  &
	   or (fenetre = "IM" and v_alerte_confidentiel_imagerie = 'O') then
		p_plein.triggerevent(clicked!)
	end if
end if

// Contre indication
l = len(trim(v_contre_indic))
zero(l)

if l > 0 and v_alerte_contre_indic = 'O' and fenetre = "CC"  then
	p_indic_plein.triggerevent(clicked!)
end if

end subroutine

on uo_confidentiel_contre_indication.create
this.p_indic_plein=create p_indic_plein
this.p_indic_vide=create p_indic_vide
this.p_vide=create p_vide
this.p_plein=create p_plein
this.Control[]={this.p_indic_plein,&
this.p_indic_vide,&
this.p_vide,&
this.p_plein}
end on

on uo_confidentiel_contre_indication.destroy
destroy(this.p_indic_plein)
destroy(this.p_indic_vide)
destroy(this.p_vide)
destroy(this.p_plein)
end on

event constructor;

// init avec le patient courant
maj(var_code)


this.backcolor = couleur_fond_fenetre


p_indic_plein.height = this.height

p_indic_vide.height = this.height

p_plein.height = this.height

p_vide.height = this.height




end event

type p_indic_plein from picture within uo_confidentiel_contre_indication
boolean visible = false
integer x = 165
integer width = 146
integer height = 128
string picturename = "contre_indic.png"
boolean focusrectangle = false
string powertiptext = "Information de contre-indication"
end type

event clicked;if not SALLE_ATTENTE_INDEPENDANTE then

guo_fenetre_modale.wf_ouvrir_param_nombre(w_contre_indic, var_code_local )
//openwithparm(w_contre_indic,var_code_local)
parent.maj(var_code_local)
//fenetre_mere_local.triggerevent(resize!)

end if
end event

type p_indic_vide from picture within uo_confidentiel_contre_indication
integer x = 165
integer width = 146
integer height = 128
string picturename = "contre_indicvide.png"
boolean focusrectangle = false
string powertiptext = "Pas d~'information de contre-indication"
end type

event clicked;if not SALLE_ATTENTE_INDEPENDANTE then

	guo_fenetre_modale.wf_ouvrir_param_nombre(w_contre_indic, var_code_local )
//	openwithparm(w_contre_indic,var_code_local)
	parent.maj(var_code_local)
	//fenetre_mere_local.triggerevent(resize!)

end if
end event

type p_vide from picture within uo_confidentiel_contre_indication
boolean visible = false
integer width = 146
integer height = 128
string picturename = "memovide.png"
boolean focusrectangle = false
string powertiptext = "Pas d~'information confidentielle"
end type

event clicked;if not SALLE_ATTENTE_INDEPENDANTE then
	
	guo_fenetre_modale.wf_ouvrir_param_nombre(w_confidentiel, var_code_local )

	//openwithparm(w_confidentiel,var_code_local)
	
	parent.maj(var_code_local)
	
	//fenetre_mere_local.triggerevent(resize!)
end if
end event

type p_plein from picture within uo_confidentiel_contre_indication
boolean visible = false
integer width = 146
integer height = 128
string picturename = "MEMO.png"
boolean focusrectangle = false
string powertiptext = "Information confidentielle"
end type

event clicked;if not SALLE_ATTENTE_INDEPENDANTE then
	guo_fenetre_modale.wf_ouvrir_param_nombre(w_confidentiel, var_code_local )
//	openwithparm(w_confidentiel,var_code_local)
	parent.maj(var_code_local)
	//fenetre_mere_local.triggerevent(resize!)
end if
end event

