$PBExportHeader$w_soins_maj_augmentation.srw
forward
global type w_soins_maj_augmentation from w_fenetre_arakis
end type
type pb_maj from uo_picturebutton_390x120 within w_soins_maj_augmentation
end type
type pb_annuler from uo_picturebutton_390x120 within w_soins_maj_augmentation
end type
type st_1 from statictext within w_soins_maj_augmentation
end type
type st_2 from statictext within w_soins_maj_augmentation
end type
type st_3 from statictext within w_soins_maj_augmentation
end type
type em_date from editmask within w_soins_maj_augmentation
end type
type em_pourcentage from editmask within w_soins_maj_augmentation
end type
type st_4 from statictext within w_soins_maj_augmentation
end type
end forward

global type w_soins_maj_augmentation from w_fenetre_arakis
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
em_pourcentage em_pourcentage
st_4 st_4
end type
global w_soins_maj_augmentation w_soins_maj_augmentation

type variables

string var_code_soin
double total_a_l_ouverture

double v_depasse, v_total, v_ancien_total, v_nouveau_total, v_nouveau_depasse
double v_pourcentage
end variables

on w_soins_maj_augmentation.create
int iCurrent
call super::create
this.pb_maj=create pb_maj
this.pb_annuler=create pb_annuler
this.st_1=create st_1
this.st_2=create st_2
this.st_3=create st_3
this.em_date=create em_date
this.em_pourcentage=create em_pourcentage
this.st_4=create st_4
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.pb_maj
this.Control[iCurrent+2]=this.pb_annuler
this.Control[iCurrent+3]=this.st_1
this.Control[iCurrent+4]=this.st_2
this.Control[iCurrent+5]=this.st_3
this.Control[iCurrent+6]=this.em_date
this.Control[iCurrent+7]=this.em_pourcentage
this.Control[iCurrent+8]=this.st_4
end on

on w_soins_maj_augmentation.destroy
call super::destroy
destroy(this.pb_maj)
destroy(this.pb_annuler)
destroy(this.st_1)
destroy(this.st_2)
destroy(this.st_3)
destroy(this.em_date)
destroy(this.em_pourcentage)
destroy(this.st_4)
end on

event open;call super::open;var_code_soin = message.StringParm


em_date.text = string(today())


end event

type p_fond from w_fenetre_arakis`p_fond within w_soins_maj_augmentation
integer x = 635
integer height = 132
end type

type pb_maj from uo_picturebutton_390x120 within w_soins_maj_augmentation
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
		
		v_pourcentage = dec(em_pourcentage.text)
		
		double v_code, v_cle

		// Parcours des soins
		declare cur_soins cursor for select code, cle, total, hn from soins 
		where "type" = :var_code_soin and date_exe >= :v_date_soins and numero_facture is null 
		and (select count(*) from ligne_soins where ligne_soins.code=soins.code and ligne_soins.cle=soins.cle) = 1; 
		
		open cur_soins ;
		
		fetch cur_soins into :v_code, :v_cle, :v_total, :v_depasse ;
		
		do while sqlca.sqlcode = 0
			
			v_nouveau_total = v_total * (1 + v_pourcentage / 100) 
			v_nouveau_depasse = v_depasse + (v_nouveau_total - v_total )
			
			update soins set total = :v_nouveau_total , hn = :v_nouveau_depasse 
			where code = :v_code and cle = :v_cle ;
			
			update ligne_soins set montant = :v_nouveau_total 
			where code = :v_code and cle = :v_cle ;
			
			fetch cur_soins into :v_code, :v_cle, :v_total, :v_depasse ;
		loop
		
		close cur_soins ;
		
		
		// Parcours des soins prévus ... non transférés ... sans tenir compte de la date 
		declare cur_soins_prevus cursor for select code, cle, total, hn from soins_prevus 
		where "type" = :var_code_soin and transfert = 'N'  
		and (select count(*) from ligne_soins_prevus where ligne_soins_prevus.code = soins_prevus.code and ligne_soins_prevus.cle= soins_prevus.cle) = 1; 
		
		open cur_soins_prevus ;
		
		fetch cur_soins_prevus into :v_code, :v_cle, :v_total, :v_depasse ;
		
		do while sqlca.sqlcode = 0
			
			v_nouveau_total = v_total * (1 + v_pourcentage / 100) 
			v_nouveau_depasse = v_depasse + (v_nouveau_total - v_total )
			
			update soins_prevus set total = :v_nouveau_total , hn = :v_nouveau_depasse 
			where code = :v_code and cle = :v_cle ;
			
			update ligne_soins_prevus set montant = :v_nouveau_total 
			where code = :v_code and cle = :v_cle ;
			
			fetch cur_soins_prevus into :v_code, :v_cle, :v_total, :v_depasse ;
		loop
		
		close cur_soins_prevus ;
		
		
		// Parcours des soins auto ...
		
		declare cur_soins_auto cursor for select code, cle, total, hn from soins_auto 
		where "type" = :var_code_soin  
		and (select count(*) from ligne_soins_auto where ligne_soins_auto.code= soins_auto.code and ligne_soins_auto.cle= soins_auto.cle) = 1; 
		
		open cur_soins_auto ;
		
		fetch cur_soins_auto into :v_code, :v_cle, :v_total, :v_depasse ;
		
		do while sqlca.sqlcode = 0
			
			v_nouveau_total = v_total * (1 + v_pourcentage / 100) 
			v_nouveau_depasse = v_depasse + (v_nouveau_total - v_total )
			
			update soins_auto set total = :v_nouveau_total , hn = :v_nouveau_depasse 
			where code = :v_code and cle = :v_cle ;
			
			update ligne_soins_auto set montant = :v_nouveau_total 
			where code = :v_code and cle = :v_cle ;
			
			fetch cur_soins_auto into :v_code, :v_cle, :v_total, :v_depasse ;
		loop
		
		close cur_soins_auto ;
		
		
		
		
		
		// Depuis 2020 on utilise la date d'exécution ... 
		
			
//		// soins prévus ... non transférés ... sans tenir compte de la date 
//		update soins_prevus set total = :v_nouveau_total, hn = :v_nouveau_depasse where  total = :v_ancien_total and "type" = :var_code_soin and transfert = 'N'  
//		and (select count(*) from ligne_soins_prevus where ligne_soins_prevus.code = soins_prevus.code and ligne_soins_prevus.cle=soins_prevus.cle) = 1;
//		
//		// Ligne soins prevus
//		update ligne_soins_prevus, soins_prevus set ligne_soins_prevus.montant = :v_nouveau_total 
//		where  montant = :v_ancien_total and "type" = :var_code_soin and  transfert = 'N' and ligne_soins_prevus.code=soins_prevus.code and ligne_soins_prevus.cle=soins_prevus.cle 
//		and (select count(*) from ligne_soins_prevus where ligne_soins_prevus.code=soins_prevus.code and ligne_soins_prevus.cle=soins_prevus.cle) = 1;
//		
//		// soins automatiques
//		update soins_auto set total = :v_nouveau_total, hn = :v_nouveau_depasse where total = :v_ancien_total and "type" = :var_code_soin  
//		and (select count(*) from ligne_soins_auto where ligne_soins_auto.code=soins_auto.code and ligne_soins_auto.cle=soins_auto.cle) = 1;
//
//		// Ligne soins automatiques
//		update ligne_soins_auto, soins_auto set ligne_soins_auto.montant = :v_nouveau_total 
//		where  montant = :v_ancien_total and "type" = :var_code_soin and ligne_soins_auto.code=soins_auto.code and ligne_soins_auto.cle=soins_auto.cle 
//		and (select count(*) from ligne_soins_auto where ligne_soins_auto.code=soins_auto.code and ligne_soins_auto.cle=soins_auto.cle) = 1;
//
		
		commit ;
		
		
		close(w_patience)
		
		Messagebox("ATTENTION","Mise à jour effectuée !")
		close(parent)
end if




end event

type pb_annuler from uo_picturebutton_390x120 within w_soins_maj_augmentation
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

type st_1 from statictext within w_soins_maj_augmentation
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

type st_2 from statictext within w_soins_maj_augmentation
integer x = 96
integer y = 760
integer width = 1550
integer height = 80
boolean bringtotop = true
integer textsize = -10
long backcolor = 553648127
string text = "Date à partir de laquelle les soins doivent être mis à jour : "
end type

type st_3 from statictext within w_soins_maj_augmentation
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

type em_date from editmask within w_soins_maj_augmentation
integer x = 1669
integer y = 740
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

type em_pourcentage from editmask within w_soins_maj_augmentation
integer x = 1257
integer y = 500
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
string mask = "####.00"
end type

type st_4 from statictext within w_soins_maj_augmentation
integer x = 101
integer y = 516
integer width = 1111
integer height = 76
boolean bringtotop = true
integer textsize = -10
long backcolor = 553648127
string text = "Pourcentage d~'augmentation à appliquer :"
end type

