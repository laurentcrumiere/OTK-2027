$PBExportHeader$w_patient_modification_numero.srw
forward
global type w_patient_modification_numero from w_fenetre_arakis
end type
type cb_modifier from uo_picturebutton_390x120 within w_patient_modification_numero
end type
type cd_annuler from uo_picturebutton_390x120 within w_patient_modification_numero
end type
type em_maxi from editmask within w_patient_modification_numero
end type
type em_mini from editmask within w_patient_modification_numero
end type
type em_num from editmask within w_patient_modification_numero
end type
type st_2 from statictext within w_patient_modification_numero
end type
type st_1 from statictext within w_patient_modification_numero
end type
type st_mini from statictext within w_patient_modification_numero
end type
end forward

global type w_patient_modification_numero from w_fenetre_arakis
integer x = 663
integer y = 428
integer width = 1600
integer height = 1144
string title = "Modification du Numéro de Dossier"
windowtype windowtype = response!
long backcolor = 15780518
cb_modifier cb_modifier
cd_annuler cd_annuler
em_maxi em_maxi
em_mini em_mini
em_num em_num
st_2 st_2
st_1 st_1
st_mini st_mini
end type
global w_patient_modification_numero w_patient_modification_numero

type variables


double var_numero_dossier_local

double var_code_local
end variables

forward prototypes
public subroutine change_numero (double ancien, double nouveau, ref datawindow dw1, ref datawindow dw2)
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

event open;centrer(this)

double min,max

// recup du N° de dossier passé en paramèetre

var_numero_dossier_local = message.DoubleParm 
backcolor = couleur_fond_fenetre	

// Mise en mémoire du code internet du patient
select min(code) into :var_code_local from patient where numero_dossier = :var_numero_dossier_local ;

var_suite = false

// Recherche des numéros que sur les dossiers en cours (pas les archivés)
SELECT min(numero_dossier),max(numero_dossier) INTO :min,:max 
FROM patient WHERE numero_dossier < 100000000;

em_maxi.text = string(max)
em_mini.text = string(min)
em_num.text = string(var_numero_dossier_local)

end event

on w_patient_modification_numero.create
int iCurrent
call super::create
this.cb_modifier=create cb_modifier
this.cd_annuler=create cd_annuler
this.em_maxi=create em_maxi
this.em_mini=create em_mini
this.em_num=create em_num
this.st_2=create st_2
this.st_1=create st_1
this.st_mini=create st_mini
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_modifier
this.Control[iCurrent+2]=this.cd_annuler
this.Control[iCurrent+3]=this.em_maxi
this.Control[iCurrent+4]=this.em_mini
this.Control[iCurrent+5]=this.em_num
this.Control[iCurrent+6]=this.st_2
this.Control[iCurrent+7]=this.st_1
this.Control[iCurrent+8]=this.st_mini
end on

on w_patient_modification_numero.destroy
call super::destroy
destroy(this.cb_modifier)
destroy(this.cd_annuler)
destroy(this.em_maxi)
destroy(this.em_mini)
destroy(this.em_num)
destroy(this.st_2)
destroy(this.st_1)
destroy(this.st_mini)
end on

type p_fond from w_fenetre_arakis`p_fond within w_patient_modification_numero
end type

type cb_modifier from uo_picturebutton_390x120 within w_patient_modification_numero
integer x = 183
integer y = 768
integer width = 558
integer height = 152
integer taborder = 210
string text = "&Modifier"
string iconname = "ACTIONS_executer.png"
end type

event clicked;call super::clicked;double 				num, deja_utilise
string 				var_cp


NUM = double(em_num.text)

if num = var_numero_dossier_local then
	son(5)
	MessageBox("ATTENTION !","Vous avez indiqué le même numéro !~n~nAucune modification réalisée !")
else
	if num = 0 or isnull(num) then
		son(5)
		MessageBox("ATTENTION !","Le numéro de dossier peut être positif,~nnégatif, mais pas nul !")
	else
		if not (-99999999<=num and num<=99999999) then
			son(5)
			MessageBox("ATTENTION !","Le numéro de dossier doit être compris entre -99999999 et 999999999 !")
		else
		
		select count(*) into :deja_utilise from patient where numero_dossier = :NUM ;
			if deja_utilise > 0 then
			// si le nume existe déjà -> msg utilisateur
				MessageBox("ATTENTION !","Le numéro de dossier indiqué existe déjà, ~n~nveuillez le changer avant de poursuivre !")
				
				// on met le focus sur le nouveau num de dossier
				em_num.setfocus()
				
			else
			// le numéro n'existe pas encore ... GO !
				if Messagebox("ATTENTION","Vous allez changer le dossier N°"+string(var_numero_dossier_local)+" en N°"+string(num)+" !~n~nConfirmez-vous ?",question!,YesNo!,2) = 1 then

						// Modif du numéro de dossier
						update patient set numero_dossier = :num	where code = :var_code_local ;
						
						if sqlca.sqlcode = 0 then
							//commit ;	
							ajout_histo_actions(var_code_local, "NUMPAT", today(),"Ancien N° : "+string(var_numero_dossier_local)+" -> Nouveau N° "+string(num))
							//MessageBox("INFORMATION","Le dossier a été renuméroté avec succès !")
							var_suite = true
							closeWithReturn(parent, num)
						else
							rollback ;
							MessageBox("ERREUR DANS LA RENUMEROTATION DU DOSSIER !",sqlca.sqlerrtext)
						end if
					
				end if
			end if
		end if
	end if
end if

end event

type cd_annuler from uo_picturebutton_390x120 within w_patient_modification_numero
integer x = 768
integer y = 768
integer width = 558
integer height = 152
integer taborder = 200
string text = "&Annuler"
string iconname = "ACTIONS_abandonner.png"
end type

event clicked;call super::clicked;close(parent)
end event

type em_maxi from editmask within w_patient_modification_numero
integer x = 823
integer y = 160
integer width = 361
integer height = 96
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 134217731
alignment alignment = right!
string mask = "#######0"
string displaydata = "~b"
end type

type em_mini from editmask within w_patient_modification_numero
integer x = 823
integer y = 48
integer width = 361
integer height = 96
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 134217731
alignment alignment = right!
string mask = "#######0"
string displaydata = "L"
end type

type em_num from editmask within w_patient_modification_numero
integer x = 846
integer y = 484
integer width = 485
integer height = 96
integer taborder = 160
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 16777215
alignment alignment = right!
borderstyle borderstyle = stylelowered!
string mask = "########"
boolean spin = true
string displaydata = ""
double increment = 1
string minmax = "-9999999~~99999999"
end type

event getfocus;// Surlignage en bleu du n° de dossier à modifier

this.selecttext(1,len(this.text))
end event

type st_2 from statictext within w_patient_modification_numero
integer x = 137
integer y = 496
integer width = 649
integer height = 72
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
string facename = "Arial"
long backcolor = 553648127
string text = "Nouveau N° Dossier :"
end type

type st_1 from statictext within w_patient_modification_numero
integer x = 201
integer y = 176
integer width = 549
integer height = 80
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
string facename = "Arial"
long backcolor = 553648127
string text = "N° Dossier Maxi :"
alignment alignment = center!
end type

type st_mini from statictext within w_patient_modification_numero
integer x = 201
integer y = 64
integer width = 549
integer height = 64
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
string facename = "Arial"
long backcolor = 553648127
string text = "N° Dossier Mini :"
alignment alignment = center!
end type

