$PBExportHeader$w_corres_fusionner.srw
forward
global type w_corres_fusionner from w_fenetre_arakis
end type
type cb_annuler from uo_picturebutton_390x120 within w_corres_fusionner
end type
type cb_fusionner from uo_picturebutton_390x120 within w_corres_fusionner
end type
type dw_corres1 from datawindow within w_corres_fusionner
end type
type st_1 from statictext within w_corres_fusionner
end type
type st_2 from statictext within w_corres_fusionner
end type
type dw_corres2 from datawindow within w_corres_fusionner
end type
end forward

global type w_corres_fusionner from w_fenetre_arakis
integer x = 663
integer y = 428
integer width = 2962
integer height = 968
string title = "Fusion de 2 correspondants"
windowtype windowtype = response!
long backcolor = 15780518
boolean center = true
cb_annuler cb_annuler
cb_fusionner cb_fusionner
dw_corres1 dw_corres1
st_1 st_1
st_2 st_2
dw_corres2 dw_corres2
end type
global w_corres_fusionner w_corres_fusionner

type variables
double var_code_local1 = 0
double var_code_local2 = 0
double var_numero_dossier_local
end variables

forward prototypes
public subroutine change_numero (double ancien, double nouveau, ref datawindow dw1, ref datawindow dw2)
public subroutine change_type (double ancien, double nouveau, string code, string zone, ref datawindow dw1, ref datawindow dw2)
end prototypes

public subroutine change_numero (double ancien, double nouveau, ref datawindow dw1, ref datawindow dw2);
// Change le numero d'un dossier

double nbl,lig

dw1.retrieve(ancien)

nbl = dw1.rowcount()

dw2.reset()
if nbl > 0 then
 	dw1.RowsCopy(1,nbl,primary!,dw2,1,primary!)
	for lig = 1 to nbl
		dw2.setitem(lig,"code",nouveau)
	next
end if


end subroutine

public subroutine change_type (double ancien, double nouveau, string code, string zone, ref datawindow dw1, ref datawindow dw2);
// Change le numero d'un dossier

double nbl,lig

dw1.retrieve(ancien)

nbl = dw1.rowcount()

dw2.reset()
if nbl > 0 then
 	dw1.RowsCopy(1,nbl,primary!,dw2,1,primary!)
	for lig = 1 to nbl
		dw2.setitem(lig,"code",nouveau)
		dw2.setitem(lig,"type_dossier",code)
		dw2.setitem(lig,"archivage",zone)
	next
end if

end subroutine

on w_corres_fusionner.create
int iCurrent
call super::create
this.cb_annuler=create cb_annuler
this.cb_fusionner=create cb_fusionner
this.dw_corres1=create dw_corres1
this.st_1=create st_1
this.st_2=create st_2
this.dw_corres2=create dw_corres2
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_annuler
this.Control[iCurrent+2]=this.cb_fusionner
this.Control[iCurrent+3]=this.dw_corres1
this.Control[iCurrent+4]=this.st_1
this.Control[iCurrent+5]=this.st_2
this.Control[iCurrent+6]=this.dw_corres2
end on

on w_corres_fusionner.destroy
call super::destroy
destroy(this.cb_annuler)
destroy(this.cb_fusionner)
destroy(this.dw_corres1)
destroy(this.st_1)
destroy(this.st_2)
destroy(this.dw_corres2)
end on

event open;call super::open;
dw_corres1.settransobject(sqlca)
dw_corres1.retrieve()


dw_corres2.settransobject(sqlca)
dw_corres2.retrieve()

end event

type p_fond from w_fenetre_arakis`p_fond within w_corres_fusionner
integer y = 588
end type

type cb_annuler from uo_picturebutton_390x120 within w_corres_fusionner
integer x = 1678
integer y = 576
integer width = 553
integer taborder = 80
string text = "&Fermer"
string iconname = "ACTIONS_fermer.png"
end type

event clicked;call super::clicked;close(parent)
end event

type cb_fusionner from uo_picturebutton_390x120 within w_corres_fusionner
integer x = 928
integer y = 576
integer width = 553
integer taborder = 70
string text = "Fusionner"
boolean default = true
string iconname = "ACTIONS_executer.png"
end type

event clicked;call super::clicked;//
//// Fusion de 2 Correspondants
//// Par sécurité, le dossier PHOTOS du patient fusionné est RECOPIE et non SUPPRIME !!!
//
//

string v_cor1, v_cor2

v_cor1 = dw_corres1.getitemstring(dw_corres1.getrow(),"code")
v_cor2 = dw_corres2.getitemstring(dw_corres2.getrow(),"code")



if  v_cor1 = v_cor2  then

	MessageBox("ATTENTION !","Vous avez indiqué 2 fois le même correspondant !~n~nLa fusion ne peut être réalisée !")

else
	
	integer v_actif = 0
	select actif into :v_actif from correspondants where code = :v_cor1 ;
	
	if v_actif = 0 then 
		Messagebox("ATTENTION", "Le correspondant principal est inactif !~n~nOn ne peut pas faire une fusion sur un Correspondant non actif !")
	else
	
		if Messagebox("QUESTION", "La fusion des 2 correspondans est irrémédiable.~n~n- Tous les dossiers référéncés avec le second correspondant seront référencés avec le premier~n~n- Le second correspondant sera ensuite supprimé~n~nConfirmez-vous la fusion ?", Question!, YesNo!, 2) = 1 then
			
			
			// fusion effective
			
			Update patient set code_correspondant = :v_cor1 where code_correspondant = :v_cor2 ; 
			if sqlca.sqlcode = 0 then
				Update patient set code_dentiste = :v_cor1 where code_dentiste = :v_cor2 ; 
				if sqlca.sqlcode = 0 then
					Update patient set code_medecin = :v_cor1 where code_medecin = :v_cor2 ; 
					if sqlca.sqlcode = 0 then
						Update patient set code_medecin2 = :v_cor1 where code_medecin2 = :v_cor2 ; 
						if sqlca.sqlcode = 0 then
							Update patient set code_medecin3 = :v_cor1 where code_medecin3 = :v_cor2 ; 
							if sqlca.sqlcode = 0 then
								Update patient set code_medecin4 = :v_cor1 where code_medecin4 = :v_cor2 ; 
								if sqlca.sqlcode = 0 then
									Update myo_histo_connect set code_correspondant = :v_cor1 where code_correspondant = :v_cor2 ; 
									if sqlca.sqlcode = 0 then
										DELETE from correspondants where code = :v_cor2 ;
										if sqlca.sqlcode = 0 then
											commit ;
											Messagebox("INFORMATION","Les 2 correspondants ont bien été fusionnés !")
											dw_corres1.retrieve()
											dw_corres2.retrieve()
										else
											rollback ;
											Messagebox("ERREUR DANS LA FUSION","Erreur N°8 - La fusion n'a pas été effectuée !")
										end if 
									else
										rollback ;
										Messagebox("ERREUR DANS LA FUSION","Erreur N°7 - La fusion n'a pas été effectuée !")
									end if 
								else
									rollback ;
									Messagebox("ERREUR DANS LA FUSION","Erreur N°6 - La fusion n'a pas été effectuée !")
								end if 
							else
								rollback ;
								Messagebox("ERREUR DANS LA FUSION","Erreur N°5 - La fusion n'a pas été effectuée !")
							end if 
						else
							rollback ;
							Messagebox("ERREUR DANS LA FUSION","Erreur N°4 - La fusion n'a pas été effectuée !")
						end if 
					else
						rollback ;
						Messagebox("ERREUR DANS LA FUSION","Erreur N°3 - La fusion n'a pas été effectuée !")
					end if 
				else
					rollback ;
					Messagebox("ERREUR DANS LA FUSION","Erreur N°2 - La fusion n'a pas été effectuée !")
				end if 
			else
				rollback ;
				Messagebox("ERREUR DANS LA FUSION","Erreur N°1 - La fusion n'a pas été effectuée !")
			end if 
		end if
	end if
end if


end event

type dw_corres1 from datawindow within w_corres_fusionner
integer x = 1481
integer y = 96
integer width = 1093
integer height = 72
integer taborder = 80
boolean bringtotop = true
string title = "none"
string dataobject = "dw_cherche_corresp"
boolean border = false
boolean livescroll = true
end type

type st_1 from statictext within w_corres_fusionner
integer x = 274
integer y = 96
integer width = 1175
integer height = 68
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
string facename = "Arial"
long backcolor = 553648127
string text = "Correspondant qui va être conservé :"
alignment alignment = right!
end type

type st_2 from statictext within w_corres_fusionner
integer x = 274
integer y = 284
integer width = 1175
integer height = 68
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
string facename = "Arial"
long backcolor = 553648127
string text = "Correspondant qui va être supprimé :"
alignment alignment = right!
end type

type dw_corres2 from datawindow within w_corres_fusionner
integer x = 1481
integer y = 276
integer width = 1093
integer height = 72
integer taborder = 90
boolean bringtotop = true
string title = "none"
string dataobject = "dw_cherche_corresp"
boolean border = false
boolean livescroll = true
end type

