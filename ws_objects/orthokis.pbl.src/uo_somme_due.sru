$PBExportHeader$uo_somme_due.sru
forward
global type uo_somme_due from userobject
end type
type p_due from picture within uo_somme_due
end type
type p_due_tp from picture within uo_somme_due
end type
end forward

global type uo_somme_due from userobject
integer width = 178
integer height = 160
long backcolor = 16777215
string text = "none"
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
p_due p_due
p_due_tp p_due_tp
end type
global uo_somme_due uo_somme_due

type variables


double var_code_local

date v_date_naissance

string  v_libelle1, v_libelle2, v_libelle3
end variables

forward prototypes
public subroutine maj (double v_code)
public subroutine resize ()
end prototypes

public subroutine maj (double v_code);p_due.visible = false
p_due_tp.visible = false


// Mémo du code du patient

var_code_local = v_code

// mise à jour des infos 
select date_naissance into :v_date_naissance from patient where code = :var_code_local ;

// Affichage ou non des icones pour sommes du patient ou somme due tp

if  due(var_code_local,today()) > 0 then
	// Le patient doit de l'argent
	p_due.visible = true
else
	if due_tp(var_code_local,today()) > 0 then
		// Le TP doit de l'argent
		p_due_tp.visible = true
	end if
end if


// pour initialiser les libéllés
affichage_somme_due(var_code_local,  false, v_libelle1, v_libelle2, v_libelle3)

p_due.PowerTipText =  v_libelle1 +"~n" + v_libelle2 + "~n"+ v_libelle3
p_due_tp.PowerTipText =  v_libelle1 +"~n" + v_libelle2 + "~n"+ v_libelle3

end subroutine

public subroutine resize ();

end subroutine

event constructor;

// Au début, init avec le patient courant de la fenêtre !!
maj(var_code)


//p_due.init("lc_money.png", var_code)
//p_due_tp.init("lc_money_tp.png", var_code)
//
this.backcolor = couleur_fond_fenetre
end event

on uo_somme_due.create
this.p_due=create p_due
this.p_due_tp=create p_due_tp
this.Control[]={this.p_due,&
this.p_due_tp}
end on

on uo_somme_due.destroy
destroy(this.p_due)
destroy(this.p_due_tp)
end on

type p_due from picture within uo_somme_due
integer width = 183
integer height = 156
string picturename = "lc_money.png"
boolean focusrectangle = false
string powertiptext = "Le patient doit de l~'argent"
end type

event clicked;if not SALLE_ATTENTE_INDEPENDANTE then

	affichage_somme_due(var_code_local,  true, v_libelle1, v_libelle2, v_libelle3)
	
end if


end event

type p_due_tp from picture within uo_somme_due
boolean visible = false
integer width = 183
integer height = 156
string picturename = "lc_money_verte.png"
boolean focusrectangle = false
string powertiptext = "Le tiers payant doit de l~'argent"
end type

event clicked;if not SALLE_ATTENTE_INDEPENDANTE then


	affichage_somme_due(var_code_local, true,  v_libelle1, v_libelle2, v_libelle3)

end if
end event

