$PBExportHeader$w_replication_photo.srw
forward
global type w_replication_photo from w_fenetre_arakis
end type
type cb_lancer from uo_picturebutton_390x120 within w_replication_photo
end type
type cb_vider from uo_picturebutton_390x120 within w_replication_photo
end type
type pb_1 from uo_picturebutton_390x120_fermer within w_replication_photo
end type
type uo_sup_rep from uo_suppression_repertoire within w_replication_photo
end type
type rb_untype from radiobutton within w_replication_photo
end type
type rb_toustype from radiobutton within w_replication_photo
end type
type dw_dossier from datawindow within w_replication_photo
end type
type dw_prati from datawindow within w_replication_photo
end type
type rb_un from radiobutton within w_replication_photo
end type
type rb_tous from radiobutton within w_replication_photo
end type
type st_max from statictext within w_replication_photo
end type
type st_min from statictext within w_replication_photo
end type
type em_max from editmask within w_replication_photo
end type
type em_min from editmask within w_replication_photo
end type
type rb_tousrdv from radiobutton within w_replication_photo
end type
type rb_1 from radiobutton within w_replication_photo
end type
type em_date1 from editmask within w_replication_photo
end type
type st_et from statictext within w_replication_photo
end type
type em_date2 from editmask within w_replication_photo
end type
type gb_2 from groupbox within w_replication_photo
end type
type gb_11 from groupbox within w_replication_photo
end type
type gb_1 from groupbox within w_replication_photo
end type
end forward

global type w_replication_photo from w_fenetre_arakis
integer x = 27
integer y = 200
integer width = 2848
integer height = 1952
string title = "Réplication des Photos (Courriers / Documents)"
windowtype windowtype = response!
cb_lancer cb_lancer
cb_vider cb_vider
pb_1 pb_1
uo_sup_rep uo_sup_rep
rb_untype rb_untype
rb_toustype rb_toustype
dw_dossier dw_dossier
dw_prati dw_prati
rb_un rb_un
rb_tous rb_tous
st_max st_max
st_min st_min
em_max em_max
em_min em_min
rb_tousrdv rb_tousrdv
rb_1 rb_1
em_date1 em_date1
st_et st_et
em_date2 em_date2
gb_2 gb_2
gb_11 gb_11
gb_1 gb_1
end type
global w_replication_photo w_replication_photo

type variables
string dossier_source, dossier_destination
end variables

on w_replication_photo.create
int iCurrent
call super::create
this.cb_lancer=create cb_lancer
this.cb_vider=create cb_vider
this.pb_1=create pb_1
this.uo_sup_rep=create uo_sup_rep
this.rb_untype=create rb_untype
this.rb_toustype=create rb_toustype
this.dw_dossier=create dw_dossier
this.dw_prati=create dw_prati
this.rb_un=create rb_un
this.rb_tous=create rb_tous
this.st_max=create st_max
this.st_min=create st_min
this.em_max=create em_max
this.em_min=create em_min
this.rb_tousrdv=create rb_tousrdv
this.rb_1=create rb_1
this.em_date1=create em_date1
this.st_et=create st_et
this.em_date2=create em_date2
this.gb_2=create gb_2
this.gb_11=create gb_11
this.gb_1=create gb_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_lancer
this.Control[iCurrent+2]=this.cb_vider
this.Control[iCurrent+3]=this.pb_1
this.Control[iCurrent+4]=this.uo_sup_rep
this.Control[iCurrent+5]=this.rb_untype
this.Control[iCurrent+6]=this.rb_toustype
this.Control[iCurrent+7]=this.dw_dossier
this.Control[iCurrent+8]=this.dw_prati
this.Control[iCurrent+9]=this.rb_un
this.Control[iCurrent+10]=this.rb_tous
this.Control[iCurrent+11]=this.st_max
this.Control[iCurrent+12]=this.st_min
this.Control[iCurrent+13]=this.em_max
this.Control[iCurrent+14]=this.em_min
this.Control[iCurrent+15]=this.rb_tousrdv
this.Control[iCurrent+16]=this.rb_1
this.Control[iCurrent+17]=this.em_date1
this.Control[iCurrent+18]=this.st_et
this.Control[iCurrent+19]=this.em_date2
this.Control[iCurrent+20]=this.gb_2
this.Control[iCurrent+21]=this.gb_11
this.Control[iCurrent+22]=this.gb_1
end on

on w_replication_photo.destroy
call super::destroy
destroy(this.cb_lancer)
destroy(this.cb_vider)
destroy(this.pb_1)
destroy(this.uo_sup_rep)
destroy(this.rb_untype)
destroy(this.rb_toustype)
destroy(this.dw_dossier)
destroy(this.dw_prati)
destroy(this.rb_un)
destroy(this.rb_tous)
destroy(this.st_max)
destroy(this.st_min)
destroy(this.em_max)
destroy(this.em_min)
destroy(this.rb_tousrdv)
destroy(this.rb_1)
destroy(this.em_date1)
destroy(this.st_et)
destroy(this.em_date2)
destroy(this.gb_2)
destroy(this.gb_11)
destroy(this.gb_1)
end on

event open;call super::open;centrer(this)

dw_dossier.settransobject(SQLCA)
dw_prati.settransobject(SQLCA)
dw_dossier.retrieve()
dw_prati.retrieve()

if not multi then
	rb_tous.checked = false
	rb_tous.enabled = false
	rb_un.checked = true
	dw_prati.visible = true
end if


em_date1.text = string(relativedate(today(), -15))
em_date2.text = string(today())




string s

//initialisation des des répertoire sources et destinations ... 
//-------------------------------------------------------------------------------
//source = profilestring(dir_ini+"orthokis.ini","photos","dir","")

// rep photo en utilisation cabinet
s = profilestring(dir_ini + inifile_orthokis,"photos","local",par_défaut)
choose case s
	case par_défaut
		setprofilestring(dir_ini + inifile_orthokis,"photos","local",oui)
		dossier_source = profilestring(dir_ini + inifile_orthokis,"photos","dir","")
	case oui
		dossier_source = profilestring(dir_ini + inifile_orthokis,"photos","dir","")
	case non
		select rep_photos
		into :dossier_source
		from param ;
end choose


//destination = profilestring(dir_ini+"orthokis.ini","photos","dir_replic","")
// rep photo en utilisation distante --> Module Réplication
s = profilestring(dir_ini + inifile_orthokis,"photos","local_replic",par_défaut)
choose case s
	case par_défaut
		setprofilestring(dir_ini + inifile_orthokis,"photos","local_replic",oui)
		dossier_destination = profilestring(dir_ini + inifile_orthokis,"photos","dir_replic","")
	case oui
		dossier_destination = profilestring(dir_ini + inifile_orthokis,"photos","dir_replic","")
	case non
		select rep_photos_replic
		into :dossier_destination
		from param ;
end choose

//Commande = 'xcopy "' + trim(dossier_source) + '*.*"   "' + trim(dossier_destination) + '" /S /D'

//Messagebox("commande",commande)

////Execution de la commande
////-------------------------------
//if Commande <> '' then 
//	resultat = run(Commande)
//	if resultat=-1 then messagebox ("Attention", "Une erreur s'est produite durant la réplication")
//end if
//









close(w_patience)


if not FileExists(dossier_destination) then
	Messagebox("ATTENTION","Le répertoire des photos en local n'existe pas.~n~nLa réplication ne peut avoir lieu !")
	close(this)
else
	if not FileExists(dossier_source) then
		Messagebox("ATTENTION","Le répertoire des photos du cabinet est inaccessible.~n~nLa réplication ne peut avoir lieu !")
		close(this)
	end if
end if
	
	
end event

type p_fond from w_fenetre_arakis`p_fond within w_replication_photo
integer x = 2784
integer y = 1352
end type

type cb_lancer from uo_picturebutton_390x120 within w_replication_photo
integer x = 1097
integer y = 1616
integer width = 585
integer taborder = 60
string text = "&Lancer"
boolean default = true
string iconname = "ACTIONS_executer.png"
end type

event clicked;call super::clicked;

// principe : 
// - on prend la liste des dossiers sélectionnés et, pour chacun :
//    * on supprime le dossier actuel
//    * on recopie les fichiers images 


string pra_min, pra_max
double cod_min, cod_max
string  typ_min, typ_max

long nb


if rb_tous.checked then
	pra_min = ''
	pra_max = 'ZZZZZZ'
else
	pra_min = dw_prati.gettext()
	pra_max = pra_min
end if

cod_min = double(em_min.text)
cod_max = double(em_max.text)


if rb_toustype.checked then
	typ_min = ''
	typ_max = 'ZZZZZZ'
else
	typ_min = dw_dossier.gettext()
	typ_max = typ_min
end if


DECLARE cur CURSOR FOR SELECT code from patient where 
code_praticien between :pra_min and :pra_max and
numero_dossier between :cod_min and :cod_max and
type_dossier between :typ_min and :typ_max 
order by code ;

date v_date1, v_date2

v_date1 = date(em_date1.text)
v_date2 = date(em_date2.text)

DECLARE currdv CURSOR FOR SELECT code from patient where 
code_praticien between :pra_min and :pra_max and
numero_dossier between :cod_min and :cod_max and
type_dossier between :typ_min and :typ_max 
and patient.code in (select code from rdv where cast(rdv as date) between :v_date1 and :v_date2) 
order by code ;


if rb_tousrdv.checked then
	SELECT count(*) into :nb from patient where 
	code_praticien between :pra_min and :pra_max and
	numero_dossier between :cod_min and :cod_max and
	type_dossier between :typ_min and :typ_max  ;
else
	SELECT count(*) into :nb from patient where 
	code_praticien between :pra_min and :pra_max and
	numero_dossier between :cod_min and :cod_max and
	type_dossier between :typ_min and :typ_max  
	and patient.code in (select code from rdv where cast(rdv as date) between :v_date1 and :v_date2) ;
end if


if nb = 0 then
	Messagebox("ATTENTION !","Aucun patient pour ces critères !")
else
	
	if Messagebox("ATTENTION","Vous allez recopier les photos de "+string(nb)+" dossiers.~n~nDossier source : "+dossier_source+"~n~nDossier de destination : "+dossier_destination+"~n~nConfirmez-vous ?", Question!,Yesno!,2) = 1 then
		
		// C'est parti !!
		
		open(w_patience)
		
		double pat_cour 
		string destination_pat_cour, source_pat_cour
		string item, file_source,file_destination
		long nb_files,cpt, cpt_patient
		string tab_files[]
		
		
		
		// On reprend d'office le fichier PwoPhoto.ini du serveur
		string ini1, ini2
		ini1 = dossier_source+"\PwoPhotos.ini"
		ini2 = dossier_destination+"\PwoPhotos.ini"
		
		FileCopy ( ini1 ,  ini2 , true)
	
	
		if rb_tousrdv.checked then
			open cur ;
			fetch cur into :pat_cour ;
		else
			open currdv ;
			fetch currdv into :pat_cour ;
		end if
		
		
		cpt_patient = 0
		
		do while sqlca.sqlcode = 0
		
			// Traitement du dossier patcour ...
			cpt_patient = cpt_patient + 1
		
			if mod(cpt_patient, max(1,int(nb / 20))) = 0 then
				w_patience.Wf_SetValue(5)
			end if
		
		
			// Les dossier sources et destination ont déjà un \
			destination_pat_cour = dossier_destination +"\"+ string(pat_cour)
			source_pat_cour = dossier_source +"\" +string(pat_cour)
			
			// On liste des photos du rep initial avant de les copier
		    uo_sup_rep.lister_fichier(source_pat_cour, tab_files)
			nb_files = uo_sup_rep.lb_files.totalitems()
			
			// Uniquement s'il y a des photos à recopier (y a toujours un élément [..])
			if nb_files >= 1 then
				
				// on efface le dossier de destination s'il existe
//				uo_sup_rep.supprimer_repertoire(destination_pat_cour)
			
//					// On recrét le dossier de destination
//				CreateDirectory( destination_pat_cour)
				
	
				// Le premier répertoire listé est [..] => on le zap
				for cpt = 1 to nb_files
		
				//	lb_files.text(cpt)
					//item = uo_sup_rep.lb_files.text(cpt)
					item = tab_files[cpt]
					// Les répertoires dans la listes sont entre [] pas les fichiers
					if left(item,1) <> "[" and right(item,1) <> "]" then
						// c'est un fichier
						file_source = source_pat_cour + "\"+item
						file_destination = destination_pat_cour + "\"+item
						FileCopy ( file_source ,  file_destination , false)
					end if
				next
			end if
		
			if rb_tousrdv.checked then
				fetch cur into :pat_cour ;
			else
				fetch currdv into :pat_cour ;
			end if
		loop
		
		
		if rb_tousrdv.checked then
			close cur ;
		else
			close currdv ;
		end if

		close(w_patience)
		
		Messagebox("ATTENTION !","La recopie des photos a été effectuée !")
	end if


end if

end event

type cb_vider from uo_picturebutton_390x120 within w_replication_photo
integer x = 347
integer y = 1616
integer width = 585
integer taborder = 50
string text = "&Vider"
string iconname = "lc_poubelle.png"
end type

event clicked;call super::clicked;
boolean v_suite

v_suite = false

if upper(left(dossier_destination,2)) <> "C:" then
	if MESSAGEBOX("ATTENTION - IMPORTANT !","Votre dossier actuel pour les photos en réplication n'est pas paramétré sur votre disque local c: !~n~nEtes-vous sûr de vouloir poursuivre ?",Question!,YesNo!,2) = 1 then
		v_suite = true
	end if
else
	v_suite = true
end if
		
if v_suite then
	if MessageBox("ATTENTION !","Vous allez vider votre dossier local de réplication !~n~n("+dossier_destination+")~n~nConfirmez-vous ?",Question!,YesNo!,2) = 1 then
		
		open(w_patience)	
		
		// on enlève les \ finaux
		
		dossier_destination = left(dossier_destination,len(dossier_destination) - 1)
		dossier_source = left(dossier_source,len(dossier_source) - 1)
		
		// Principe : on renomme le dossier actuel ....
		// on en crée un nouveau
		// on recopie le PWOPHOTO.ini dans le nouveau
		// on supprime le dossier renommé
		
		
		string tempo, ini1,ini2
		
		tempo = dossier_destination+"_"+string(year(today()))+string(month(today()))+string(day(today()))
		
		
		// on renomme	
		// Fonction pour renomer un fichier ou un rep (si return 0 alors un pb !)
		 if MoveFileA (dossier_destination , tempo ) = 0 then
			Messagebox("ERREUR 1","Problème dans le vidage du répertoire !~n~nVeuillez supprimer le dossier temporaire  '"+tempo+"'")
		else
			
			// On crée un nouveau rép des photos
			Security_Attributes		IpSecurityAttributes
	
			if CreateDirectoryA( dossier_destination, IpSecurityAttributes) = 0 then
				Messagebox("ERREUR 2","Problème dans le vidage du répertoire !")
			else
				
				// on replace le fichier PWOPHOto
				ini1 = dossier_destination+"\PwoPhotos.ini"
				ini2 = tempo+"\PwoPhotos.ini"
				
				if MoveFileA (ini2 , ini1 ) = 0 then
					Messagebox("ERREUR 3","Problème dans le vidage du répertoire !~n~nImpossible de retrouver le fichier PwoPhotos.ini")
				else
					// on peut suprimer
					
					if uo_sup_rep.supprimer_repertoire(tempo) = 1 then
						MessageBox("ATTENTION !","Vidage effectué avec succès !")
					else
						Messagebox("ERREUR 4","Problème dans le vidage du répertoire !~n~nVotre répertoire Photos Réplication a été vidé mais vous devez supprimer manuellement le dossier temporaire '"+tempo+"'")
					end if
					
				end if
			end if
		end if	
	end if
end if

close(w_patience)
end event

type pb_1 from uo_picturebutton_390x120_fermer within w_replication_photo
integer x = 1847
integer y = 1616
integer width = 585
integer taborder = 40
end type

type uo_sup_rep from uo_suppression_repertoire within w_replication_photo
event destroy ( )
boolean visible = false
integer x = 2661
integer y = 616
integer taborder = 50
end type

on uo_sup_rep.destroy
call uo_suppression_repertoire::destroy
end on

type rb_untype from radiobutton within w_replication_photo
integer x = 402
integer y = 980
integer width = 622
integer height = 80
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 553648127
string text = "Un Type"
end type

event clicked;dw_dossier.visible = true

end event

type rb_toustype from radiobutton within w_replication_photo
integer x = 402
integer y = 876
integer width = 695
integer height = 80
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 553648127
string text = "Tous les types"
boolean checked = true
end type

event clicked;dw_dossier.visible = false
end event

type dw_dossier from datawindow within w_replication_photo
boolean visible = false
integer x = 1138
integer y = 980
integer width = 983
integer height = 84
integer taborder = 30
boolean bringtotop = true
string dataobject = "dw_cherche_dossier"
boolean border = false
boolean livescroll = true
end type

type dw_prati from datawindow within w_replication_photo
boolean visible = false
integer x = 1216
integer y = 328
integer width = 873
integer height = 80
integer taborder = 60
string dataobject = "dw_cherche_prati"
boolean border = false
end type

type rb_un from radiobutton within w_replication_photo
integer x = 402
integer y = 328
integer width = 622
integer height = 80
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 553648127
string text = "Un praticien"
end type

event clicked;rb_tous.checked = false
dw_prati.visible = true
end event

type rb_tous from radiobutton within w_replication_photo
integer x = 402
integer y = 232
integer width = 695
integer height = 80
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 553648127
string text = "Tous les praticiens"
boolean checked = true
end type

event clicked;rb_un.checked = false
dw_prati.visible = false
end event

type st_max from statictext within w_replication_photo
integer x = 1335
integer y = 624
integer width = 402
integer height = 72
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
string facename = "Arial"
long backcolor = 553648127
string text = "Au Dossier N°"
alignment alignment = right!
end type

type st_min from statictext within w_replication_photo
integer x = 347
integer y = 624
integer width = 389
integer height = 72
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
string facename = "Arial"
long backcolor = 553648127
string text = "Du Dossier N°"
alignment alignment = right!
end type

type em_max from editmask within w_replication_photo
integer x = 1774
integer y = 612
integer width = 457
integer height = 96
integer taborder = 20
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
string text = "999999999"
alignment alignment = right!
borderstyle borderstyle = stylelowered!
string mask = "########0"
boolean spin = true
string displaydata = ""
double increment = 1
end type

type em_min from editmask within w_replication_photo
integer x = 786
integer y = 612
integer width = 457
integer height = 96
integer taborder = 10
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
string text = "-99999999"
alignment alignment = right!
borderstyle borderstyle = stylelowered!
string mask = "########0"
boolean spin = true
string displaydata = ""
double increment = 1
end type

type rb_tousrdv from radiobutton within w_replication_photo
integer x = 402
integer y = 1224
integer width = 667
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 553648127
string text = "Aucune limitation"
boolean checked = true
end type

event clicked;em_date1.visible = false
em_date2.visible = false
st_et.visible = false
end event

type rb_1 from radiobutton within w_replication_photo
integer x = 402
integer y = 1344
integer width = 690
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 553648127
string text = "Patients vus entre le "
end type

event clicked;em_date1.visible = true
em_date2.visible = true
st_et.visible = true


end event

type em_date1 from editmask within w_replication_photo
integer x = 1138
integer y = 1328
integer width = 448
integer height = 112
integer taborder = 70
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
string text = "none"
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "dd/mm/yyyy"
boolean spin = true
end type

type st_et from statictext within w_replication_photo
integer x = 1632
integer y = 1352
integer width = 233
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 553648127
string text = "et le"
alignment alignment = center!
boolean focusrectangle = false
end type

type em_date2 from editmask within w_replication_photo
integer x = 1911
integer y = 1328
integer width = 448
integer height = 112
integer taborder = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "dd/mm/yyyy"
boolean spin = true
end type

type gb_2 from groupbox within w_replication_photo
integer x = 283
integer y = 792
integer width = 2121
integer height = 304
integer taborder = 50
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean italic = true
long textcolor = 33554432
long backcolor = 553648127
string text = "Choix du type de dossier"
end type

type gb_11 from groupbox within w_replication_photo
integer x = 283
integer y = 148
integer width = 2121
integer height = 304
integer taborder = 60
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean italic = true
long textcolor = 33554432
long backcolor = 553648127
string text = "Choix du praticien"
end type

type gb_1 from groupbox within w_replication_photo
integer x = 283
integer y = 1116
integer width = 2121
integer height = 412
integer taborder = 60
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean italic = true
long textcolor = 33554432
long backcolor = 553648127
string text = "Limitation selon les rendez-vous"
end type

