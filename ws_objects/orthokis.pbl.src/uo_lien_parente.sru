$PBExportHeader$uo_lien_parente.sru
forward
global type uo_lien_parente from userobject
end type
type p_du from picture within uo_lien_parente
end type
type p_sans from picture within uo_lien_parente
end type
type p_avec from picture within uo_lien_parente
end type
end forward

global type uo_lien_parente from userobject
integer width = 178
integer height = 164
long backcolor = 553648127
string text = "none"
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
event init_fenetre_mere ( window v_fenetre_mere )
p_du p_du
p_sans p_sans
p_avec p_avec
end type
global uo_lien_parente uo_lien_parente

type variables


double var_code_local

window fenetre_mere_local

boolean dans_agenda_graphique = false
end variables

forward prototypes
public function boolean is_lien_parente (double v_code)
public subroutine maj_lien_parente ()
public subroutine maj (double v_code)
public subroutine init_fenetre_mere (window v_fenetre_mere)
public subroutine dans_agenda_graphique ()
end prototypes

event init_fenetre_mere(window v_fenetre_mere);fenetre_mere_local = v_fenetre_mere
end event

public function boolean is_lien_parente (double v_code);
// Le patient a t il un lien de parenté avec un autre
integer cpt
select count(*) into :cpt from patient_lien_parente where 
code_patient1 = :v_code or code_patient2 = :v_code ;

if cpt > 0 then
	return true
else
	return false
end if
end function

public subroutine maj_lien_parente ();if not SALLE_ATTENTE_INDEPENDANTE then
	
	
	if not dans_agenda_graphique then
		
		guo_fenetre_modale.wf_ouvrir_param_nombre(w_patient_lien_parente, var_code_local )

		//OpenWithParm(w_patient_lien_parente, var_code_local)
	
		// pour mise à jour des icones
		maj(var_code_local)
		
		 if left(fenetre_mere_local.classname() , 15 ) = "w_soins_reg_maj" then
			w_soins_reg_maj w1
			w1 = fenetre_mere_local 
			
			// Appel depuis soins règlements ... on raffraichit la liste des soins au cas ou on aurait saisi des reglements (globaux)
			w1.dw_soins.retrieve(w1.var_code_local)
			//		w1.dw_soins_prevus.retrieve(w1.var_code_local)
			w1.tab_1.tabpage_soins_prevus.dw_devis.retrieve(w1.var_code_local)
			// Mise à jour des icones
			param_win[3] = 'M'
			w1.uo_icones.maj(w1.var_code_local, w1, w1.parentwindow())
	
		 end if
		
	//	if = "" then
	//	end if
		
		
	else
		guo_fenetre_modale.wf_ouvrir_param_nombre(w_patient_lien_parente, var_code_local )
//		OpenWithParm(w_patient_lien_parente, var_code_local)
	end if
	
	// Faut resize pour raffraichir la fenetre mère
	//fenetre_mere_local.triggerevent(resize!)
end if
end subroutine

public subroutine maj (double v_code);
// Réinitialisation
//this.backcolor = 12057238
this.backcolor = couleur_fond_fenetre
p_sans.visible = false
p_avec.visible = false
p_du.visible = false

if is_lien_parente(v_code) then
	
	if profilestring(dir_ini+inifile_orthokis,"admini","somme_due_famille","O") = "O" then 
		// On doit chercher une somme due pour la famille pour savoir si on signale ou pas (sans tenir compte du patient lui même
		if due_parente(v_code, today()) > 0 then
			//this.backcolor = couleur_rouge_clair
			//this.backcolor = couleur_rouge
			p_du.visible = true
			//p_avec.visible = true
		else
			p_avec.visible = true
		end if
	else
		p_avec.visible = true
	end if
	
else
	p_sans.visible = true
end if

var_code_local = v_code



end subroutine

public subroutine init_fenetre_mere (window v_fenetre_mere);// plus utile
fenetre_mere_local = v_fenetre_mere

end subroutine

public subroutine dans_agenda_graphique ();
// pour indiquer qu'on est sur l'icone de l'agenda
// => pas de raffarissimenet APRES mise à jour car la fenetre est fermée => ça planterait
dans_agenda_graphique = true
end subroutine

on uo_lien_parente.create
this.p_du=create p_du
this.p_sans=create p_sans
this.p_avec=create p_avec
this.Control[]={this.p_du,&
this.p_sans,&
this.p_avec}
end on

on uo_lien_parente.destroy
destroy(this.p_du)
destroy(this.p_sans)
destroy(this.p_avec)
end on

event constructor;// Récupération du patient courant

var_code_local = var_code 
//maj(var_code_local)
this.backcolor = couleur_fond_fenetre
end event

type p_du from picture within uo_lien_parente
boolean visible = false
integer width = 174
integer height = 156
string picturename = "lc_parente_du.png"
boolean focusrectangle = false
boolean map3dcolors = true
string powertiptext = "Au moins un lien de parenté a été établi avec un autre patient"
end type

event clicked;maj_lien_parente()
end event

event rbuttondown;
if not SALLE_ATTENTE_INDEPENDANTE then

	// Pour obtenir la liste des rendez-vous de fratie
	//openWithParm(w_rdv_futurs_famille, var_code_local )

	guo_fenetre_modale.wf_ouvrir_param_nombre(w_rdv_futurs_famille, var_code_local)
	
end if
end event

type p_sans from picture within uo_lien_parente
boolean visible = false
integer width = 174
integer height = 156
string picturename = "lc_parente_sans.png"
boolean focusrectangle = false
string powertiptext = "Aucun lien de parenté n~'a été établi avec un autre patient"
end type

event clicked;

maj_lien_parente()
end event

event rbuttondown;if not SALLE_ATTENTE_INDEPENDANTE then

	// Pour obtenir la liste des rendez-vous de fratie
	openWithParm(w_rdv_futurs_famille, var_code_local )
	
end if
end event

type p_avec from picture within uo_lien_parente
boolean visible = false
integer width = 174
integer height = 156
string picturename = "lc_parente_avec.png"
boolean focusrectangle = false
boolean map3dcolors = true
string powertiptext = "Au moins un lien de parenté a été établi avec un autre patient"
end type

event clicked;maj_lien_parente()
end event

event rbuttondown;
// Pour obtenir la liste des rendez-vous de fratie
openWithParm(w_rdv_futurs_famille, var_code_local )
end event

