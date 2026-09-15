$PBExportHeader$uo_barre_titre_2022.sru
forward
global type uo_barre_titre_2022 from userobject
end type
type uo_titre from u_cst_xpheader within uo_barre_titre_2022
end type
type uo_titre_echeances_2022 from u_cst_xpheader within uo_barre_titre_2022
end type
end forward

global type uo_barre_titre_2022 from userobject
integer width = 594
integer height = 104
long backcolor = 67108864
string text = "none"
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
uo_titre uo_titre
uo_titre_echeances_2022 uo_titre_echeances_2022
end type
global uo_barre_titre_2022 uo_barre_titre_2022

type variables


string texte_titre
end variables

forward prototypes
public subroutine retaille (long couleur_barre1, long couleur_barre2, string fichier_image)
end prototypes

public subroutine retaille (long couleur_barre1, long couleur_barre2, string fichier_image);
// initialise la barre avec la couleut et l'image qui va bien
//uo_titre.of_SetColor (couleur_bleue, couleur_sky)


uo_titre.of_SetColor (couleur_barre1, couleur_barre2)
if fichier_image <> "" then 
	uo_titre.of_SetImage(fichier_image, uo_titre.RIGHT)
end if


uo_titre.of_SetText(texte_titre, uo_titre.left) 
uo_titre.of_SetTextColor(couleur_blanche, uo_titre.left)

uo_titre.width = this.width
uo_titre.height = this.height

end subroutine

on uo_barre_titre_2022.create
this.uo_titre=create uo_titre
this.uo_titre_echeances_2022=create uo_titre_echeances_2022
this.Control[]={this.uo_titre,&
this.uo_titre_echeances_2022}
end on

on uo_barre_titre_2022.destroy
destroy(this.uo_titre)
destroy(this.uo_titre_echeances_2022)
end on

type uo_titre from u_cst_xpheader within uo_barre_titre_2022
integer taborder = 470
boolean bringtotop = true
long il_gradient1 = 12689222
long il_gradient2 = 12689222
end type

on uo_titre.destroy
call u_cst_xpheader::destroy
end on

type uo_titre_echeances_2022 from u_cst_xpheader within uo_barre_titre_2022
integer x = 2441
integer y = 1108
integer taborder = 470
boolean bringtotop = true
end type

on uo_titre_echeances_2022.destroy
call u_cst_xpheader::destroy
end on

