$PBExportHeader$w_fenetre_arakis.srw
$PBExportComments$FENETRE MERE POUR TOUT CE QUI CONCERNE LES COULEURS
forward
global type w_fenetre_arakis from window
end type
type p_fond from picture within w_fenetre_arakis
end type
end forward

global type w_fenetre_arakis from window
integer width = 3168
integer height = 1876
boolean titlebar = true
string title = "Untitled"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 16777215
string icon = "AppIcon!"
event ue_move pbm_move
event scroll_molette pbm_other
p_fond p_fond
end type
global w_fenetre_arakis w_fenetre_arakis

event scroll_molette;
// utilisationdu scroll de la molette
IF message.number = 522  then
	
	long ph
	ph = handle(this)

 	if wparam < 999999999 then
		// vers le haut
		Send( ph ,277, 1 * 65536 + 2 ,0)
	else
		// vers le bas !!
		Send( ph ,277, 1 * 65536 + 3 ,0)
	end if
	
	RETURN 1
END IF

end event

event open;

this.backcolor = couleur_fond_fenetre


end event

on w_fenetre_arakis.create
this.p_fond=create p_fond
this.Control[]={this.p_fond}
end on

on w_fenetre_arakis.destroy
destroy(this.p_fond)
end on

type p_fond from picture within w_fenetre_arakis
string tag = "fond"
boolean visible = false
integer x = 823
integer y = 760
integer width = 293
integer height = 152
boolean focusrectangle = false
end type

