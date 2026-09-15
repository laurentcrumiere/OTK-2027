$PBExportHeader$uo_anniversaire.sru
forward
global type uo_anniversaire from userobject
end type
type p_anni from picture within uo_anniversaire
end type
end forward

global type uo_anniversaire from userobject
integer width = 165
integer height = 140
long backcolor = 16777215
string text = "none"
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
p_anni p_anni
end type
global uo_anniversaire uo_anniversaire

type variables


double var_code_local

date v_date_naissance
end variables

forward prototypes
public subroutine maj (double v_code)
public subroutine resize ()
end prototypes

public subroutine maj (double v_code);

// Mémo du code du patient

var_code_local = v_code

integer v_cpt_saint
string v_prenom

// reset si utilisé avant (salle d'attente)		
this.visible = false
p_anni.visible = false
this.backcolor = couleur_fond_fenetre

// mise à jour des infos 
select date_naissance, isnull(prenom, '') into :v_date_naissance, :v_prenom from patient where code = :var_code_local ;

// Affichage ou non de la bougie pour l'anniversaire

integer res
res =  calcul_anniversaire(string( v_date_naissance))
IF res <> 0 THEN
	p_anni.pictureName = "anniv.png"
	p_anni.visible = true
	this.visible = true
	
	p_anni.powertiptext = "Le patient est né le "+ string(v_date_naissance) + " - Son âge : " + calcul_age(string(v_date_naissance))
	
	if res = 1 then
		// Après => fond rouge
			this.backcolor = couleur_rouge
	else
		if res = 2 then
			// Le jour même .. fond vert
			this.backcolor = couleur_verte
		else
			// Avant .. pas de fond ...sky
			this.backcolor = couleur_fond_fenetre
		end if
	end if
ELSE
	
	// Pas d'anniv, la fête ?
	
	select isnull(count(*),0) into :v_cpt_saint from saints where prenom = :v_prenom and jour = day(today()) and mois = month(today()) ; 
	
	if v_cpt_saint > 0 then 
		p_anni.pictureName = "lc_fete.png"
		p_anni.visible = true
		this.visible = true
	else
		p_anni.visible = false
	end if
END IF

// pour actualiser la couleur
//p_anni.draw(0,0)
end subroutine

public subroutine resize ();
// finalement pas de resize
/*
// pour l'épaisseur du cadre, au cas ou anniversaire passé !!
p_anni.width = this.width - 5
p_anni.height = this.height - 5
*/
end subroutine

event constructor;

// Au début, init avec le patient courant de la fenêtre !!
maj(var_code)


p_anni.width = this.width
p_anni.height = this.width


this.backcolor = couleur_fond_fenetre

//p_anni.init("lc_anniv.png", var_code)

//colore_tous_objets(this)

end event

on uo_anniversaire.create
this.p_anni=create p_anni
this.Control[]={this.p_anni}
end on

on uo_anniversaire.destroy
destroy(this.p_anni)
end on

type p_anni from picture within uo_anniversaire
boolean visible = false
integer width = 146
integer height = 128
string picturename = "anniv.png"
boolean focusrectangle = false
string powertiptext = "Anniversaire / Fête du patient"
end type

event clicked;

if not SALLE_ATTENTE_INDEPENDANTE then

	// Affichage des infos 
	
	Messagebox("INFORMATIONS","Nous sommes le "+string(today())+"~n~nLe patient est né le "+string(v_date_naissance)+"~n~nAge : "+calcul_age(string(v_date_naissance)))
	

end if
end event

