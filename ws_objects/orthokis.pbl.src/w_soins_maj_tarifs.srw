$PBExportHeader$w_soins_maj_tarifs.srw
forward
global type w_soins_maj_tarifs from w_fenetre_arakis
end type
type pb_maj from uo_picturebutton_390x120 within w_soins_maj_tarifs
end type
type pb_annuler from uo_picturebutton_390x120 within w_soins_maj_tarifs
end type
type st_1 from statictext within w_soins_maj_tarifs
end type
type st_2 from statictext within w_soins_maj_tarifs
end type
type st_3 from statictext within w_soins_maj_tarifs
end type
type em_date from editmask within w_soins_maj_tarifs
end type
type em_ancien_montant from editmask within w_soins_maj_tarifs
end type
type em_nouveau_montant from editmask within w_soins_maj_tarifs
end type
type st_6 from statictext within w_soins_maj_tarifs
end type
type st_4 from statictext within w_soins_maj_tarifs
end type
end forward

global type w_soins_maj_tarifs from w_fenetre_arakis
integer width = 2857
integer height = 1232
string title = "Mise à jour des Tarifs"
boolean minbox = false
boolean maxbox = false
boolean resizable = false
windowtype windowtype = response!
boolean center = true
pb_maj pb_maj
pb_annuler pb_annuler
st_1 st_1
st_2 st_2
st_3 st_3
em_date em_date
em_ancien_montant em_ancien_montant
em_nouveau_montant em_nouveau_montant
st_6 st_6
st_4 st_4
end type
global w_soins_maj_tarifs w_soins_maj_tarifs

type variables

string var_code_soin
double total_a_l_ouverture

double v_depasse, v_total, v_ancien_total, v_nouveau_total, v_nouveau_depasse
end variables

on w_soins_maj_tarifs.create
int iCurrent
call super::create
this.pb_maj=create pb_maj
this.pb_annuler=create pb_annuler
this.st_1=create st_1
this.st_2=create st_2
this.st_3=create st_3
this.em_date=create em_date
this.em_ancien_montant=create em_ancien_montant
this.em_nouveau_montant=create em_nouveau_montant
this.st_6=create st_6
this.st_4=create st_4
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.pb_maj
this.Control[iCurrent+2]=this.pb_annuler
this.Control[iCurrent+3]=this.st_1
this.Control[iCurrent+4]=this.st_2
this.Control[iCurrent+5]=this.st_3
this.Control[iCurrent+6]=this.em_date
this.Control[iCurrent+7]=this.em_ancien_montant
this.Control[iCurrent+8]=this.em_nouveau_montant
this.Control[iCurrent+9]=this.st_6
this.Control[iCurrent+10]=this.st_4
end on

on w_soins_maj_tarifs.destroy
call super::destroy
destroy(this.pb_maj)
destroy(this.pb_annuler)
destroy(this.st_1)
destroy(this.st_2)
destroy(this.st_3)
destroy(this.em_date)
destroy(this.em_ancien_montant)
destroy(this.em_nouveau_montant)
destroy(this.st_6)
destroy(this.st_4)
end on

event open;call super::open;var_code_soin = message.StringParm


em_date.text = string(today())
// Recup de l'ancien total

select  depasse, total into  :v_depasse, :v_total from code_soins where code = :var_code_soin ;


em_ancien_montant.text = string(v_total)
em_nouveau_montant.text = string(v_total)

end event

type p_fond from w_fenetre_arakis`p_fond within w_soins_maj_tarifs
integer x = 635
integer height = 132
end type

type pb_maj from uo_picturebutton_390x120 within w_soins_maj_tarifs
integer x = 1335
integer y = 976
integer width = 594
integer height = 152
integer taborder = 30
boolean bringtotop = true
fontcharset fontcharset = ansi!
string text = "Mettre à Jour"
string iconname = "ACTIONS_executer.png"
end type

event clicked;call super::clicked;if messagebox("ATTENTION", "Rappel : cette action est IRREMEDIABLE !~n~nConfirmez-vous ?" , Question!, YesNo!, 2) = 1 then

		open(w_patience)
		
		date v_date_soins

	
		v_date_soins = date(em_date.text)
		
		v_ancien_total = double(em_ancien_montant.text)
		v_nouveau_total = double(em_nouveau_montant.text)
		
		// Ajustement du dépassement 
		v_nouveau_depasse = v_depasse + (v_nouveau_total - v_ancien_total)
		
		// Depuis 2020 on utilise la date d'exécution ... 
		
		// soins= double(em_ancien_montant.text)
		//update soins set total = :v_nouveau_total, hn = :v_nouveau_depasse where total = :v_ancien_total and "type" = :var_code_soin and date_demande >= :v_date_soins and numero_facture is null 
		//and (select count(*) from ligne_soins where ligne_soins.code=soins.code and ligne_soins.cle=soins.cle) = 1;
		
		update soins set total = :v_nouveau_total, hn = :v_nouveau_depasse where total = :v_ancien_total and "type" = :var_code_soin and date_exe >= :v_date_soins and numero_facture is null 
		and (select count(*) from ligne_soins where ligne_soins.code=soins.code and ligne_soins.cle=soins.cle) = 1;
		
		// Ligne soins
		//update ligne_soins, soins set ligne_soins.montant = :v_nouveau_total 
		//where  montant = :v_ancien_total and "type" = :var_code_soin and date_demande >= :v_date_soins and numero_facture is null and ligne_soins.code=soins.code and ligne_soins.cle=soins.cle 
		//and (select count(*) from ligne_soins where ligne_soins.code=soins.code and ligne_soins.cle=soins.cle) = 1;
		update ligne_soins, soins set ligne_soins.montant = :v_nouveau_total 
		where  montant = :v_ancien_total and "type" = :var_code_soin and date_exe >= :v_date_soins and numero_facture is null and ligne_soins.code=soins.code and ligne_soins.cle=soins.cle 
		and (select count(*) from ligne_soins where ligne_soins.code=soins.code and ligne_soins.cle=soins.cle) = 1;
		
		// soins prévus ... non transférés ... sans tenir compte de la date 
		update soins_prevus set total = :v_nouveau_total, hn = :v_nouveau_depasse where  total = :v_ancien_total and "type" = :var_code_soin and transfert = 'N'  
		and (select count(*) from ligne_soins_prevus where ligne_soins_prevus.code = soins_prevus.code and ligne_soins_prevus.cle=soins_prevus.cle) = 1;
		
		// Ligne soins prevus
		update ligne_soins_prevus, soins_prevus set ligne_soins_prevus.montant = :v_nouveau_total 
		where  montant = :v_ancien_total and "type" = :var_code_soin and  transfert = 'N' and ligne_soins_prevus.code=soins_prevus.code and ligne_soins_prevus.cle=soins_prevus.cle 
		and (select count(*) from ligne_soins_prevus where ligne_soins_prevus.code=soins_prevus.code and ligne_soins_prevus.cle=soins_prevus.cle) = 1;
		
		// soins automatiques
		update soins_auto set total = :v_nouveau_total, hn = :v_nouveau_depasse where total = :v_ancien_total and "type" = :var_code_soin  
		and (select count(*) from ligne_soins_auto where ligne_soins_auto.code=soins_auto.code and ligne_soins_auto.cle=soins_auto.cle) = 1;

		// Ligne soins automatiques
		update ligne_soins_auto, soins_auto set ligne_soins_auto.montant = :v_nouveau_total 
		where  montant = :v_ancien_total and "type" = :var_code_soin and ligne_soins_auto.code=soins_auto.code and ligne_soins_auto.cle=soins_auto.cle 
		and (select count(*) from ligne_soins_auto where ligne_soins_auto.code=soins_auto.code and ligne_soins_auto.cle=soins_auto.cle) = 1;

		
		commit ;
		
		// mise à jour à jour de la fiche ...
		update code_soins set depasse = :v_nouveau_depasse , total = :v_nouveau_total where code = :var_code_soin ;
		commit ;
		
		
		close(w_patience)
		
		Messagebox("ATTENTION","Mise à jour effectuée !")
		close(parent)
end if




end event

type pb_annuler from uo_picturebutton_390x120 within w_soins_maj_tarifs
integer x = 672
integer y = 976
integer width = 594
integer height = 152
integer taborder = 40
boolean bringtotop = true
string text = "&Annuler"
string iconname = "ACTIONS_abandonner.png"
end type

event clicked;call super::clicked;close(parent)
end event

type st_1 from statictext within w_soins_maj_tarifs
integer x = 238
integer width = 2094
integer height = 260
boolean bringtotop = true
integer textsize = -12
integer weight = 700
fontcharset fontcharset = ansi!
long textcolor = 255
long backcolor = 553648127
string text = "Vous allez mettre à jour TOUS les soins, TOUS les soins prévisionnels et TOUS les soins automatiques avec le montant saisi."
alignment alignment = center!
end type

type st_2 from statictext within w_soins_maj_tarifs
integer x = 96
integer y = 760
integer width = 1701
integer height = 80
boolean bringtotop = true
integer textsize = -10
long backcolor = 553648127
string text = "Date à partir de laquelle les soins doivent être mis à jour : "
end type

type st_3 from statictext within w_soins_maj_tarifs
integer x = 238
integer y = 252
integer width = 2094
integer height = 172
boolean bringtotop = true
integer textsize = -20
integer weight = 700
fontcharset fontcharset = ansi!
long textcolor = 255
long backcolor = 553648127
string text = "Cette action est IRREMEDIABLE !"
end type

type em_date from editmask within w_soins_maj_tarifs
integer x = 1829
integer y = 760
integer width = 453
integer height = 108
integer taborder = 20
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "@Arial Unicode MS"
string text = "none"
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datetimemask!
string mask = "dd/mm/yyyy "
boolean spin = true
end type

type em_ancien_montant from editmask within w_soins_maj_tarifs
integer x = 773
integer y = 516
integer width = 402
integer height = 104
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "@Arial Unicode MS"
boolean enabled = false
string text = "none"
alignment alignment = right!
borderstyle borderstyle = stylelowered!
string mask = "######.00"
end type

type em_nouveau_montant from editmask within w_soins_maj_tarifs
integer x = 1856
integer y = 516
integer width = 402
integer height = 104
integer taborder = 10
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "@Arial Unicode MS"
long backcolor = 16777215
string text = "none"
alignment alignment = right!
borderstyle borderstyle = stylelowered!
string mask = "######.00"
end type

type st_6 from statictext within w_soins_maj_tarifs
integer x = 251
integer y = 532
integer width = 485
integer height = 76
boolean bringtotop = true
integer textsize = -10
long backcolor = 553648127
string text = "Ancien Montant : "
end type

type st_4 from statictext within w_soins_maj_tarifs
integer x = 1312
integer y = 532
integer width = 535
integer height = 76
boolean bringtotop = true
integer textsize = -10
long backcolor = 553648127
string text = "Nouveau Montant : "
end type

