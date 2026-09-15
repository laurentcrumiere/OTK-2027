$PBExportHeader$uo_alertes.sru
forward
global type uo_alertes from userobject
end type
type p_grise from picture within uo_alertes
end type
type p_orange from picture within uo_alertes
end type
type p_verte from picture within uo_alertes
end type
type p_rouge from picture within uo_alertes
end type
end forward

global type uo_alertes from userobject
integer width = 187
integer height = 160
long backcolor = 553648127
string text = "none"
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
p_grise p_grise
p_orange p_orange
p_verte p_verte
p_rouge p_rouge
end type
global uo_alertes uo_alertes

type variables


double var_code_local

window fenetre_mere_local
end variables

forward prototypes
public subroutine init ()
public subroutine maj_alerte ()
public subroutine maj (double v_code)
public subroutine init_fenetre_mere (window v_fenetre_mere)
public subroutine ouvrir_historique ()
end prototypes

public subroutine init ();

// recherche si Alerte ou pas pour mettre fond rouge ou fond vert ou orange

long tot_futures, tot_passees

// Alertes non realisées dans le passée
select isnull(count(*),0) into :tot_passees from patient_alertes 
where "date" <= cast(getdate() as date) and realisee <> 'O' and code_patient = :var_code_local ;

if tot_passees > 0 then
	p_rouge.visible = true
	p_orange.visible = false
	p_verte.visible = false
	p_grise.visible = false
else
	// recherche nombre jours pamétrables 
	long nb_jours_ecarts
	select min(delai_alerte_patient) into :nb_jours_ecarts from param ;
	
	// Alerte non realisées dans le futur => orange ...  dans les 30 prochains jours
	select isnull(count(*),0) into :tot_futures from patient_alertes 
	where "date" <= dateadd(day,:nb_jours_ecarts,cast(getdate() as date)) and realisee <> 'O'  and code_patient = :var_code_local ;
	if tot_futures > 0 then
		p_rouge.visible = false
		p_orange.visible = true
		p_verte.visible = false
		p_grise.visible = false
	else
		// Alerte non realisées dans le futur => orange ...  après 30 prohains jours
		select isnull(count(*),0) into :tot_futures from patient_alertes 
		where "date" > dateadd(day,:nb_jours_ecarts, cast(getdate() as date)) and realisee <> 'O'  and code_patient = :var_code_local ;
		if tot_futures > 0 then
			// vert
			p_rouge.visible = false
			p_orange.visible = false
			p_verte.visible = true
			p_grise.visible = false
		else
			// gris
			p_rouge.visible = false
			p_orange.visible = false
			p_verte.visible = false
			p_grise.visible = true
		end if
	end if
end if
	
end subroutine

public subroutine maj_alerte ();if not SALLE_ATTENTE_INDEPENDANTE then

	guo_fenetre_modale.wf_ouvrir_param_nombre(w_patient_alertes, var_code_local )

	//OpenWithParm(w_patient_alertes,var_code_local)
	
	// raffaichissement de l'icone
	init()
	
	// raffraissiement
	//fenetre_mere_local.triggerevent(resize!)
	
end if
end subroutine

public subroutine maj (double v_code);

var_code_local = v_code
init()
end subroutine

public subroutine init_fenetre_mere (window v_fenetre_mere);fenetre_mere_local = v_fenetre_mere
end subroutine

public subroutine ouvrir_historique ();if not SALLE_ATTENTE_INDEPENDANTE then

	// menu clic droit 
	m_btdroit_alertes newmenu
	
	newmenu = create m_btdroit_alertes
	
	newmenu.var_code_local = var_code_local
	newmenu.popmenu(w_mdi_2020.PointerX(), w_mdi_2020.PointerY())

end if
end subroutine

on uo_alertes.create
this.p_grise=create p_grise
this.p_orange=create p_orange
this.p_verte=create p_verte
this.p_rouge=create p_rouge
this.Control[]={this.p_grise,&
this.p_orange,&
this.p_verte,&
this.p_rouge}
end on

on uo_alertes.destroy
destroy(this.p_grise)
destroy(this.p_orange)
destroy(this.p_verte)
destroy(this.p_rouge)
end on

event constructor;

var_code_local = var_code 

this.backcolor = couleur_fond_fenetre
init()

end event

type p_grise from picture within uo_alertes
boolean visible = false
integer width = 174
integer height = 156
string picturename = "lc_alerte_grise.png"
boolean focusrectangle = false
string powertiptext = "Aucune alerte future programmée"
end type

event clicked;maj_alerte()
end event

event rbuttondown;
ouvrir_historique()
end event

type p_orange from picture within uo_alertes
integer width = 174
integer height = 156
string picturename = "lc_alerte_orange.png"
boolean focusrectangle = false
string powertiptext = "Alerte(s) future(s) et proche(s) programmée(s)"
end type

event clicked;maj_alerte()
end event

event rbuttondown;
ouvrir_historique()
end event

type p_verte from picture within uo_alertes
integer width = 174
integer height = 156
string picturename = "lc_alerte_verte.png"
boolean focusrectangle = false
string powertiptext = "Alerte(s) future(s) non proche(s) programmée(s)"
end type

event clicked;

maj_alerte()
end event

event rbuttondown;


ouvrir_historique()
end event

type p_rouge from picture within uo_alertes
integer width = 174
integer height = 156
string picturename = "lc_alerte_rouge.png"
boolean focusrectangle = false
string powertiptext = "Alerte(s) non réalisées"
end type

event clicked;

maj_alerte()
end event

event rbuttondown;

ouvrir_historique()
end event

