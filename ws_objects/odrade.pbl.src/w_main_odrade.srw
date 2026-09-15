$PBExportHeader$w_main_odrade.srw
forward
global type w_main_odrade from w_fenetre_arakis
end type
type tableau from olecustomcontrol within w_main_odrade
end type
type cb_moulage from uo_picturebutton_780x120 within w_main_odrade
end type
type cb_maj_commentaire_odrade from uo_picturebutton_250x120 within w_main_odrade
end type
type cb_exporter from uo_picturebutton_250x120 within w_main_odrade
end type
type cb_user from uo_picturebutton_250x120 within w_main_odrade
end type
type cb_trace from uo_picturebutton_250x120 within w_main_odrade
end type
type cb_lire_plan_traitement_orthokis from uo_picturebutton_250x120 within w_main_odrade
end type
type cb_maj_plan_traitement_orthokis from uo_picturebutton_250x120 within w_main_odrade
end type
type cb_lire_commentaire_odrade from uo_picturebutton_250x120 within w_main_odrade
end type
type cb_fermer from uo_picturebutton_250x120 within w_main_odrade
end type
type em_4 from editmask within w_main_odrade
end type
type em_3 from editmask within w_main_odrade
end type
type em_2 from editmask within w_main_odrade
end type
type em_1 from editmask within w_main_odrade
end type
type ole_image from gearbox within w_main_odrade
end type
type st_info_trace from statictext within w_main_odrade
end type
type st_info_radio from statictext within w_main_odrade
end type
type cbx_points from checkbox within w_main_odrade
end type
type cbx_droites from checkbox within w_main_odrade
end type
type cbx_pochoirs from checkbox within w_main_odrade
end type
type cbx_courbes from checkbox within w_main_odrade
end type
type cbx_radio from checkbox within w_main_odrade
end type
type ole_gear from olecustomcontrol within w_main_odrade
end type
type p_1 from picture within w_main_odrade
end type
type cb_imprimer from uo_picturebutton_250x120 within w_main_odrade
end type
type dw_diag from datawindow within w_main_odrade
end type
type gb_trace from groupbox within w_main_odrade
end type
end forward

global type w_main_odrade from w_fenetre_arakis
integer width = 4613
integer height = 3056
windowstate windowstate = maximized!
event tracer ( )
tableau tableau
cb_moulage cb_moulage
cb_maj_commentaire_odrade cb_maj_commentaire_odrade
cb_exporter cb_exporter
cb_user cb_user
cb_trace cb_trace
cb_lire_plan_traitement_orthokis cb_lire_plan_traitement_orthokis
cb_maj_plan_traitement_orthokis cb_maj_plan_traitement_orthokis
cb_lire_commentaire_odrade cb_lire_commentaire_odrade
cb_fermer cb_fermer
em_4 em_4
em_3 em_3
em_2 em_2
em_1 em_1
ole_image ole_image
st_info_trace st_info_trace
st_info_radio st_info_radio
cbx_points cbx_points
cbx_droites cbx_droites
cbx_pochoirs cbx_pochoirs
cbx_courbes cbx_courbes
cbx_radio cbx_radio
ole_gear ole_gear
p_1 p_1
cb_imprimer cb_imprimer
dw_diag dw_diag
gb_trace gb_trace
end type
global w_main_odrade w_main_odrade

type prototypes

end prototypes

type variables


// Fichier Odrade.ini
string Odrade_ini

// Dossiers qui contient les fichiers Radios
string dossier_radio

// Echelle de l'image
real resolution_x, resolution_y, pourcentage

// Code du patient traité 
double  var_code_local   // code identique à ODRADE deouis V2009
double var_numero_dossier_local 
string var_nom_local 

long utilisateur_odrade
string nom_utilisateur_odrade

// tracé en cour
long var_code_radio, var_code_trace
string fichier_radio

// informations tracé / radio
date date_trace, date_radio
string intitule_trace, intitule_radio, nom_analyse

// premier chargement de la radio
boolean premiere_radio


// pour trasmission de param aux fenetres filles
param_lien_odrade p


double v_largeur_tableau_souhaitee // utilisée au resiaze pour voir si on peut l'agradire ou pas


end variables

forward prototypes
public subroutine recherche_libelle ()
public subroutine infos_trace ()
public subroutine dessiner_tableau ()
public subroutine tracer_radio ()
public subroutine charger_radio ()
public subroutine lire_commentaires_odrade (integer remplace)
public subroutine exporter (integer numero_trace, integer numero_tableau, double v_temps_traitement)
end prototypes

event tracer();tracer_radio()


if p.mode = 1 then
	// si on est en exec auto
	double v_temps_traitenemt
	setnull(v_temps_traitenemt)
	exporter(p.numero_cadre_trace, p.numero_cadre_tableau, v_temps_traitenemt)
	
	int	numfile	// numéro du fichier donné par fileopen()
	numfile = fileopen( dir_ini + "temp_ernoult.txt", StreamMode!, Write!, LockReadWrite!, Replace!)
	
	if dw_diag.rowcount() > 0 then
		FileWrite( numfile, dw_diag.getItemString(1, "texte_brut_traitement_effectue" ))
	end if
	//FileWrite( numfile, mle_commentaires.text )
	FileClose( numfile )
	close( this )
end if

end event

public subroutine recherche_libelle ();
string lib1,lib2

// recherche les libelles des radios / tracé et les mets en haut de l'acran
select date_trace, intitule  into :date_trace, :lib1 from traces where code_trace = :var_code_trace and 
code_patient = :var_code_local  and  code_radio = :var_code_radio using T_Odrade ;

intitule_trace  = conversion_char(lib1,'O')


select date_radio,intitule, nom_fichier into :date_radio, :lib1, :lib2  from radios 
where code_patient = :var_code_local and code_radio = :var_code_radio using T_Odrade  ;

intitule_radio  = conversion_char(lib1,'O')
fichier_radio  = conversion_char(lib2,'O')
fichier_radio= dossier_radio +"\"+string(var_code_local)+"\radios\"+fichier_radio

select liste_analyses.intitule into :lib1 from liste_analyses,traces where liste_analyses.code_analyse = traces.code_analyse
and  code_trace = :var_code_trace and code_patient = :var_code_local  and  code_radio = :var_code_radio using T_Odrade ;
nom_analyse =  conversion_char(lib1,'O')

select nom into :lib1 from utilisateurs 
where code_utilisateur = :utilisateur_odrade using t_odrade ;
nom_utilisateur_odrade =  conversion_char(lib1,'O')



end subroutine

public subroutine infos_trace ();MessageBox("Informations sur le tracé et la radio","Radio :~n~tDate :"+string(date_radio,"dd/mm/yyyy")+&
"~n~tIntitulé : "+Intitule_radio+"~n~nTracé : ~n~tAnalyse :"+nom_analyse+"~n~tDate : "+&
string(date_trace,"dd/mm/yyyy")+"~n~tIntitulé : "+Intitule_trace+"~n~nUtilisateur : "+nom_utilisateur_odrade)
end subroutine

public subroutine dessiner_tableau ();

long nb_mesures,i

// pour lire les mesures
string lib,unite,type_titre
real valeur, norme, deviation, variance,delta
long var_code_theme, var_code_style
date date_naissance
string v_visible
string v_mesure_affichee

long couleur_texte, couleur_fond, typo


nb_mesures = 0 

// On compte le nombre de mesures pour déterminer le nombre de lignes VISIBLES
SELECT isnull(count(*),0) into :nb_mesures FROM mesures where code_patient = :var_code_local and 
code_radio = :var_code_radio and code_trace = :var_code_trace  using t_odrade ;



// Recherche de la date de naissance du patient
SELECT date_naissance into :date_naissance from patients
where code_patient = :var_code_local  using t_odrade ; 


//Bloquage de l'affichage pendant les calculs
//----------------------------------------------

tableau.object.redraw=FALSE
tableau.object.clear
tableau.object.cols=4

//Definit les proprietes non accessible en developpement
//-----------------------------------------------------------------
tableau.object.FillStyle=1					//Remplit la selection	
tableau.object.FixedRows=1				// 2 Colonnes fixes
//tableau.object.scrollbars=0				//Uniquement les ascenseurs verticaux
tableau.object.allowselection=false		//Permet de ne pas etendre la selection


//Calcul du nombre de lignes necessaires
//---------------------------------------
tableau.object.rows= nb_mesures + 1


//Calcul du nombre de lignes necessaires
//---------------------------------------
tableau.height=  tableau.object.rows * tableau.object.rowheight[0] * 0.28

// pour les grands tableaux mesure ...
tableau.height = min (tableau.height , dw_diag.y - 10 - tableau.y )

// Largeur normale
tableau.width = 2144
v_largeur_tableau_souhaitee = 2144

//tableau.height=  tableau.object.rows * tableau.object.rowheight[0] * 0.275
//em_1.text = string(tableau.object.rows)
//em_2.text = string(tableau.object.rowheight[0] )
//em_2.text = string(tableau.width)

if nb_mesures > 0 then
	//Remplissage des libelles des colonnes des numeros de fauteuil
	//--------------------------------------------------
	tableau.object.row=1	
	
	
	//Redimensionnement de la police
	//--------------------------------------
	tableau.object.select(0,0,tableau.object.rows - 1,tableau.object.cols - 1)
	tableau.object.cellfontsize=8
	tableau.object.cellfontName='Arial'
	
	// Centrage des 3 dernières colonnes
	//--------------------------------------------------------
	tableau.object.select(0,1,tableau.object.rows - 1,tableau.object.cols - 1)
	tableau.object.cellAlignment=4
	
	tableau.object.colwidth[0]=2000
	tableau.object.colwidth[1]=2000
	tableau.object.colwidth[2]=1000
	tableau.object.colwidth[3]=1900
//	tableau.object.colwidth[3]=2000
	
	
	tableau.object.row = 0
	tableau.object.col = 0
	tableau.object.text = "Mesure"
	tableau.object.col = 1
	tableau.object.text = "Evolution"
	tableau.object.col = 2
	tableau.object.text = "Norme"
	tableau.object.col = 3
	//tableau.object.text = string(date_trace,"dd/mm/yyyy")+" "+calcul_age_selon_date(date_naissance,date_radio)
	tableau.object.text = calcul_age_selon_date(date_naissance,date_radio)
	
	
	// Recherche du thème de l'utilisateur pour cet analyse :
	SELECT code_theme into :var_code_theme from user_ana_theme , traces
	where code_utilisateur = :utilisateur_odrade  and user_ana_theme.code_analyse = traces.code_analyse 
	and code_radio = :var_code_radio and code_patient = :var_code_local and code_trace = :var_code_trace using t_odrade ;
	
	if isnull(var_code_theme) or var_code_theme=0 then
		var_code_theme = 1
	end if
	
	// pour toutes les mesures
	DECLARE cur_mesures CURSOR FOR 
	SELECT valeur,intitule, unite, norme, deviation,variance,type_titre, type_style  
	FROM mesures where code_patient = :var_code_local and 
	code_radio = :var_code_radio and code_trace = :var_code_trace order  by code_mesure using t_odrade ;
	
	// pour toutes les mesures depuis la version 4.2
	DECLARE cur_mesures_42 CURSOR FOR 
	SELECT valeur,intitule, unite, norme, deviation,variance,type_titre, type_style, mesure_affichee  
	FROM mesures where code_patient = :var_code_local and 
	code_radio = :var_code_radio and code_trace = :var_code_trace order  by code_mesure using t_odrade ;
	
	
	// depuis la version 4.2 d'Odrade .. nouvelle colonne dans les mesures ...
	string version_odrade
	double version_odrade_numerique
	
	boolean texte_mesure_affichee = false
	
	v_mesure_affichee = ""
	
	select min(texte) into :version_odrade from messages where code_message = 8000 and langue = 1 using t_odrade ;
	
	version_odrade_numerique = double(version_odrade)
	
	if version_odrade_numerique < 4.2 then
		open cur_mesures ;
		fetch cur_mesures into :valeur, :lib, :unite, :norme, :deviation, :variance,:type_titre, :var_code_style ;
	else
		open cur_mesures_42 ;
		fetch cur_mesures_42 into :valeur, :lib, :unite, :norme, :deviation, :variance,:type_titre, :var_code_style, :v_mesure_affichee ;
	end if
	
	i = 1
	integer largeur_maxi_mesure_affichee = 0
	
	do while t_odrade.sqlcode = 0 
		
		lib = conversion_char(lib,"O")
		unite = conversion_char(unite,"O")
		
	
		// Recherche des attributs graphiques
		select couleur_fond, couleur_texte, types,visible into :couleur_fond, :couleur_texte, :typo , :v_visible from styles 
		where code_style = :var_code_style and code_theme = :var_code_theme using t_odrade;
		
		if v_visible = 'oui' then
			tableau.object.select( i,0,i,tableau.object.cols - 1)
			tableau.object.BackColorBkg = rgb(255,255,255)
			tableau.object.CellBackColor = couleur_fond
			tableau.object.CellForeColor = couleur_texte
			
			integer soul,gras,ital
			soul = int (typo / 4) 
			gras =int (typo - soul * 4 ) / 2
			ital = typo - soul * 4 -  gras * 2
			
			tableau.object.CellFontUnderline = soul
			tableau.object.CellFontBold = gras
			tableau.object.CellFontItalic = ital
	
			tableau.object.row = i
			tableau.object.col = 0
			tableau.object.text = lib
	
			if upper(type_titre) <> 'TIT' then
				tableau.object.col = 1
				tableau.object.text = string(deviation,"0.00")+unite+"/an +/-"+string(variance,"0.00")
				tableau.object.col = 2
				tableau.object.text = string(norme,"0.00")+unite
				tableau.object.col = 3
				
				
				delta = valeur - norme
				// Couleur d'écriture en fonction de l'écart 
				if abs(delta) <= variance then
					// Valeur dans la norme
					tableau.object.CellForeColor = 0
				else
					if delta > 0 then
						// Valeur plus grande => Rouge
						tableau.object.CellForeColor = rgb(255,0,0)
				else
						// Valeur plus petite => bleu
						tableau.object.CellForeColor = rgb(0,0,255)
					end if
				end if

				
				if len(trim(v_mesure_affichee)) > 0 then
					// Y a un truc specif à afficher => on l'affiche en priorité
					tableau.object.text = v_mesure_affichee
					largeur_maxi_mesure_affichee = max(largeur_maxi_mesure_affichee, len(trim(v_mesure_affichee)))
					texte_mesure_affichee = true 	// nous permettra à la fin de redimensionner last colonne
				else
					tableau.object.text = string(valeur,"0.00")+unite+space(10)+"("+string(delta, "0.00")+")"
				end if
			else
				// c'est un titre : on met la même chose pour pouvoir fusionner les cellules
				
				tableau.object.select(i,0,i,tableau.object.cols - 1)
				tableau.object.mergecells = 2
				tableau.object.cellAlignment=4
				tableau.object.text = lib
				tableau.object.mergerow[i]=true
			end if
			i++
		else
			// La ligne est invisible
			// on ne change pas i
			tableau.object.rows = tableau.object.rows - 1
		end if
	
	
		if version_odrade_numerique < 4.2 then
			fetch cur_mesures into :valeur, :lib, :unite, :norme, :deviation, :variance,:type_titre, :var_code_style ;
		else
			fetch cur_mesures_42 into :valeur, :lib, :unite, :norme, :deviation, :variance,:type_titre, :var_code_style, :v_mesure_affichee ;
		end if
	loop
	
	if version_odrade_numerique < 4.2 then
		close cur_mesures ;
	else
		close cur_mesures_42 ;
	end if
	
	
	// en cas de mesures spéciales, en texte, affichées, utilisation autre police et alignement
	if texte_mesure_affichee then
		// Centrage des 3 dernières colonnes
		//--------------------------------------------------------
		tableau.object.select(1,tableau.object.cols - 1,tableau.object.rows - 1,tableau.object.cols - 1)
		tableau.object.cellFontSize=8
		tableau.object.cellFontName="Courier"
		tableau.object.cellAlignment=1
		
		// il ne faut pas faire du fixe !!
		//tableau.object.colwidth[3] =3750
		//tableau.object.colwidth[3] = largeur_maxi_mesure_affichee * 100
		tableau.object.AutoSizeMode = 0
		tableau.object.AutoSize(3)
	end if

		
	// La colonne evolution doit être visible ?
	select evolution_visible into :v_visible from utilisateurs where code_utilisateur = :utilisateur_odrade
	using t_odrade ;
	
	if isnull(v_visible) then
		v_visible = 'non'
	end if
	
	if v_visible = 'oui' then 
		tableau.object.ColHidden[1] = false
		// Si larger de la fentre le permet, on pourra élargir le tableau 
		v_largeur_tableau_souhaitee = v_largeur_tableau_souhaitee + 150
			
	else
			tableau.object.ColHidden[1] = true
			// Si colonne spéciale pour les mesures, on ne reduit pas car la dernière colonne est plus large
			if not texte_mesure_affichee then
				// On peut réduire la largeur du tableau
				tableau.width = tableau.width - 574
				v_largeur_tableau_souhaitee = tableau.width
			end if
	end if
	tableau.object.select(0,0)
	tableau.object.redraw=true
end if


end subroutine

public subroutine tracer_radio ();if cbx_radio.checked then
	charger_radio()
else
	p_1.PictureName = ''
end if

yield()

if cbx_courbes.checked then
	tracer_formes (var_code_local,var_code_radio,var_code_trace,p_1,resolution_x,resolution_y,pourcentage)
end if

yield()

if cbx_droites.checked then
	tracer_droites (var_code_local,var_code_radio,var_code_trace,p_1,resolution_x,resolution_y,pourcentage)
	tracer_cercles (var_code_local,var_code_radio,var_code_trace,p_1,resolution_x,resolution_y,pourcentage)
end if

yield()

if cbx_pochoirs.checked then
	tracer_pochoirs (var_code_local,var_code_radio,var_code_trace,p_1,resolution_x,resolution_y,pourcentage)
end if

yield()

if cbx_points.checked then
	tracer_points  (var_code_local,var_code_radio,var_code_trace,p_1,resolution_x,resolution_y,pourcentage)
end if

yield()

end subroutine

public subroutine charger_radio ();//load la photo si le fichier existe
If fileExists(fichier_radio) then
	
	p_1.PictureName = ''


// Depuis le version 15.00s .. on force car ça pine sinon
premiere_radio = true


	// Si c'est déjà la même image, on évite des étapes de redimensionnement  !!!
	if ole_gear.object.LoadImage <>  fichier_radio or premiere_radio then
		premiere_radio = false
		
		ole_gear.object.delimage	= true
		ole_gear.object.clearimage = true
		ole_gear.object.AutoRedraw = true
		ole_gear.object.LoadImage =  fichier_radio
		ole_gear.object.ImageIndex =  1
		ole_gear.object.dsplAlignmentSet(0);
	
	
		// Redimensionnement de l'imagegear
		ole_gear.width = this.width - ole_gear.x - 100
		ole_gear.height = this.height - ole_gear.y - 150 - 300
	
		// Taille de l'image ...
		double largeur_image,hauteur_image
		double largeur_affichee,hauteur_affichee
		real imageRatio,DeviceRatio
	
		largeur_image = ole_gear.object.ImageWidth
		hauteur_image = ole_gear.object.ImageHeight
	
		//MessageBox("Taille","Cadre : "+string(ole_gear.Width)+"x"+string(ole_gear.height)+"~n~n=>Pixel : "+string(UnitsToPixels ( ole_gear.Width, XUnitsToPixels! )) +"x"+string(UnitsToPixels ( ole_gear.Height, yUnitsToPixels! ))+	"~n~nImage : "+string(ole_gear.object.ImageWidth)+"x"+string(ole_gear.object.ImageHeight)+"~n~n=>Units : "+string(PixelsToUnits (ole_gear.object.ImageWidth,XPixelsToUnits!))+"x"+string(PixelsToUnits (ole_gear.object.ImageHeight,YPixelsToUnits!))             )
	
	
		 if ole_gear.object.dsplFitMethodGet() = 3 then
			// L'image est à sa taille normale
			  Hauteur_Affichee = ole_gear.object.ImageHeight
			  Largeur_Affichee = ole_gear.object.ImageWidth
		else

       		if ole_gear.object.ImageWidth > 0 then
				 ImageRatio = ole_gear.object.ImageHeight /  ole_gear.object.ImageWidth
			else
				ImageRatio = 1
			end if
			 
			 
			 if UnitsToPixels(ole_gear.Width,XUnitsToPixels!) > 0 then
				 DeviceRatio =  UnitsToPixels(ole_gear.Height, YUnitsToPixels!)  / UnitsToPixels(ole_gear.Width,XUnitsToPixels!)
			else
				DeviceRatio = 1
			end if
	
			  if ImageRatio > DeviceRatio then
					Hauteur_Affichee = UnitsToPixels(ole_gear.Height,yUnitsToPixels!)
					// On retaille l'image
					ole_gear.Width =  PixelsToUnits (  UnitsToPixels(ole_gear.height, yUnitsToPixels!)  / ImageRatio , XPixelsToUnits!)
			  else
					 Hauteur_Affichee = UnitsToPixels(ole_gear.Width, xUnitsToPixels!) * ImageRatio
					ole_gear.Height = PixelsToUnits(Hauteur_Affichee, yPixelsTOUnits!)
					//GearCtrl1->ResizeWidth = GearCtrl1->Width;
			end if
			  Largeur_Affichee = Hauteur_Affichee / ImageRatio
		end if
		
		
		// Recherche du ratio de la radio ...
		
		double ratio_radio, etalonnage_radio
		
		select ratio into :ratio_radio from radios 
		where code_patient = :var_code_local and code_radio = :var_code_radio using T_Odrade  ;

		// l'étalonnage peut ne pas exister (si version d'odrade < 1.9
		select etalonnage into :etalonnage_radio from radios 
		where code_patient = :var_code_local and code_radio = :var_code_radio using T_Odrade  ;

		 if isnull(etalonnage_radio) or etalonnage_radio = 0 then
			etalonnage_radio = 1
		end if
		
		
		 // On calcule le pourcentage qui servira à tout redimensionner
		 Pourcentage = Hauteur_Affichee / ole_gear.object.ImageHeight * 100.0   * ratio_radio * etalonnage_radio
		  
		 Resolution_X = ole_gear.object.ImageXdpi / 2.54;
		 Resolution_Y = ole_gear.object.ImageYdpi / 2.54;
	
		
		p_1.width = ole_gear.width
		p_1.height = ole_gear.height
		
		
	end if
	
//*********************************************************
 	string chemin_fichier_travail
	chemin_fichier_travail = dir_ini + "lien_odrade_tmp.bmp"
	ole_gear.object.SaveFormat = IG_SAVE_BMP
	ole_gear.object.SaveImage = chemin_fichier_travail
//************************************************************
	
	p_1.PictureName = chemin_fichier_travail



	lire_commentaires_odrade(0)

else
	if len(trim(fichier_radio)) > 0 then
		MessageBox("ERREUR","Le fichier de la radio est introuvable.~n~n("+fichier_radio+")")
	end if
end if


end subroutine

public subroutine lire_commentaires_odrade (integer remplace);// le param remplace sert à savoir si on doit remplacer ou pas l'infos déjà présente dans dw_diag
// par défaut on remplace pas sauf si on clique sur le bouton pour ...
// remplace vaut 1 ou 0
	
	
	
	string com
	// Recherche du commentaire saisi 
	select texte into :com from commentaires where code_patient = :var_code_local  
	and code_trace = :var_code_trace and code_radio = :var_code_radio using t_odrade ;


	// on en met le commentaire de Odrade que si y a rien dans la zone diag ... pour pas écraser
	if dw_diag.rowcount() > 0 then
		if len(trim(dw_diag.GetItemString(1, "traitement_effectue"))) = 0 or remplace = 1 then

			com = conversion_char(com,'O')
			com = String_To_Rtf(com, couleur_noire, couleur_blanche)
	
			dw_diag.SetItem(1, "traitement_effectue", com)

		end if
	end if
	
	st_info_radio.text = "Date radio : "+string(date_radio,"dd/mm/yyyy")+"~nIntitulé : "+Intitule_radio
	st_info_trace.text = "Date Tracé : "+string(date_trace,"dd/mm/yyyy")+"~nIntitulé : "+Intitule_trace+"~nAnalyse : "+nom_analyse
	
	//~n~nUtilisateur : "+nom_utilisateur_odrade
	
	

end subroutine

public subroutine exporter (integer numero_trace, integer numero_tableau, double v_temps_traitement);

open(w_patience)

w_patience.hide()
w_patience.x = dw_diag.x
w_patience.y = tableau.y + tableau.width + 50
w_patience.show()


n_bitmap in_bitmap
n_runandwait in_runandwait


//Principe : 
//On exporte un fichier .BMP dans un rep temporaire .. on l'acquiert ensuite

String is_tempdir
//is_tempdir = in_bitmap.of_GetTempPath()
is_tempdir = dir_ini

String ls_fname
Blob lblb_screen


// Fichier temporaire
ls_fname = is_tempdir + "control.bmp"


integer num_pour_save
string num_fichier, true_nom_fichier, vers_dossier_photo, chemindossier

// on fait 2 boucle pour tracé et mesures
integer cpt 
boolean ok_export, ok_suite
boolean ok_cpt1, ok_cpt2
string libelle_export

string v_prochain_cadre_libre



ok_cpt1 = false
ok_cpt2 = false

for cpt = 1 to 2
	
	ok_export = false
	
	if cpt = 1 then
		// tracé ?
		if numero_trace > 0 then
			this.x = 0
			lblb_screen = in_bitmap.of_ControlCapture(p_1, false)
			libelle_export = "tracé"
			ok_export = true
			num_pour_save = numero_trace
		end if
	else
		if numero_tableau > 0 then
			lblb_screen = in_bitmap.of_ControlCapture(tableau, false)
			libelle_export = "tableau de mesures"
			num_pour_save = numero_tableau
			ok_export = true
		end if
	end if
	
	if ok_export then

		// Construction du fichier de destination
		
		
		if imagerie_2013 then
			// On attribue l'image de destination automatiquement ....
			v_prochain_cadre_libre = get_nom_prochain_cadre_image( var_code_local)
			true_nom_fichier = profilestring(dir_photos + inifile_photo, section, v_prochain_cadre_libre,"")
		else
			// donne le "xxx" de depart des ole_photo"xxx"
			// on retrouve le futur nom qu'il va avoir ds notre rep photo(cf. pwophotos.ini)
			num_fichier = num_nom_photo(num_pour_save)
			true_nom_fichier = profilestring(dir_photos + inifile_photo, section, "ole_photo" + num_fichier,"")
		end if
			
		// path complet du fichier ds notre rep photo
		vers_dossier_photo = dir_photos + string(var_code_local)+ "\"+true_nom_fichier


		ok_suite = true
		
		if fxg_FileExists(vers_dossier_photo) then 
			if Messagebox("ATTENTION !","Il existe déjà une image dans le cadre de destination du "+libelle_export+".~n~nSouhaitez-vous remplacer cette image ?",Question!,Yesno!,2) = 2 then
				ok_suite = false
			end if
		end if
			
		
		if ok_suite then
	
			
			in_bitmap.of_WriteBlob(ls_fname, lblb_screen)
			
			ole_image.charger_image(ls_fname)
			
	
			if ole_image.acquis_fichier_photo(ls_fname,vers_dossier_photo ) <> 1 then 
				messagebox("Attention !","Une erreur est survenue dans votre exportation du "+libelle_export)
			else
				if imagerie_2013 then
					// Mise à jour de la table ...
					if cpt = 1 then 
						// tracé 
						update images_infos set type_image = 51, temps_traitement = :v_temps_traitement where code = :var_code_local and nom_fichier = :true_nom_fichier ;
					else
						// tableau de mesuers
						update images_infos set type_image = 50, temps_traitement = :v_temps_traitement where code = :var_code_local and nom_fichier = :true_nom_fichier ;
					end if
					commit ;
				end if
				
				if p.mode = 0 then // mode manuel
					if cpt= 1 then
						ok_cpt1 = true
					else
						ok_cpt2 = true
					end if
				end if
			end if
		end if
	end if
next 

FileDelete(ls_fname)


if ok_cpt1 or ok_cpt2 then
	if ok_cpt1 and ok_cpt2 then
		
		Messagebox("ATTENTION !","Les exportations du tableau de mesures et du tracé ont été réalisées avec succès !")
	else
		Messagebox("ATTENTION !","L'exportation du "+libelle_export+" a été réalisée avec succès !")
	end if
end if



close(w_patience)





end subroutine

on w_main_odrade.create
int iCurrent
call super::create
this.tableau=create tableau
this.cb_moulage=create cb_moulage
this.cb_maj_commentaire_odrade=create cb_maj_commentaire_odrade
this.cb_exporter=create cb_exporter
this.cb_user=create cb_user
this.cb_trace=create cb_trace
this.cb_lire_plan_traitement_orthokis=create cb_lire_plan_traitement_orthokis
this.cb_maj_plan_traitement_orthokis=create cb_maj_plan_traitement_orthokis
this.cb_lire_commentaire_odrade=create cb_lire_commentaire_odrade
this.cb_fermer=create cb_fermer
this.em_4=create em_4
this.em_3=create em_3
this.em_2=create em_2
this.em_1=create em_1
this.ole_image=create ole_image
this.st_info_trace=create st_info_trace
this.st_info_radio=create st_info_radio
this.cbx_points=create cbx_points
this.cbx_droites=create cbx_droites
this.cbx_pochoirs=create cbx_pochoirs
this.cbx_courbes=create cbx_courbes
this.cbx_radio=create cbx_radio
this.ole_gear=create ole_gear
this.p_1=create p_1
this.cb_imprimer=create cb_imprimer
this.dw_diag=create dw_diag
this.gb_trace=create gb_trace
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.tableau
this.Control[iCurrent+2]=this.cb_moulage
this.Control[iCurrent+3]=this.cb_maj_commentaire_odrade
this.Control[iCurrent+4]=this.cb_exporter
this.Control[iCurrent+5]=this.cb_user
this.Control[iCurrent+6]=this.cb_trace
this.Control[iCurrent+7]=this.cb_lire_plan_traitement_orthokis
this.Control[iCurrent+8]=this.cb_maj_plan_traitement_orthokis
this.Control[iCurrent+9]=this.cb_lire_commentaire_odrade
this.Control[iCurrent+10]=this.cb_fermer
this.Control[iCurrent+11]=this.em_4
this.Control[iCurrent+12]=this.em_3
this.Control[iCurrent+13]=this.em_2
this.Control[iCurrent+14]=this.em_1
this.Control[iCurrent+15]=this.ole_image
this.Control[iCurrent+16]=this.st_info_trace
this.Control[iCurrent+17]=this.st_info_radio
this.Control[iCurrent+18]=this.cbx_points
this.Control[iCurrent+19]=this.cbx_droites
this.Control[iCurrent+20]=this.cbx_pochoirs
this.Control[iCurrent+21]=this.cbx_courbes
this.Control[iCurrent+22]=this.cbx_radio
this.Control[iCurrent+23]=this.ole_gear
this.Control[iCurrent+24]=this.p_1
this.Control[iCurrent+25]=this.cb_imprimer
this.Control[iCurrent+26]=this.dw_diag
this.Control[iCurrent+27]=this.gb_trace
end on

on w_main_odrade.destroy
call super::destroy
destroy(this.tableau)
destroy(this.cb_moulage)
destroy(this.cb_maj_commentaire_odrade)
destroy(this.cb_exporter)
destroy(this.cb_user)
destroy(this.cb_trace)
destroy(this.cb_lire_plan_traitement_orthokis)
destroy(this.cb_maj_plan_traitement_orthokis)
destroy(this.cb_lire_commentaire_odrade)
destroy(this.cb_fermer)
destroy(this.em_4)
destroy(this.em_3)
destroy(this.em_2)
destroy(this.em_1)
destroy(this.ole_image)
destroy(this.st_info_trace)
destroy(this.st_info_radio)
destroy(this.cbx_points)
destroy(this.cbx_droites)
destroy(this.cbx_pochoirs)
destroy(this.cbx_courbes)
destroy(this.cbx_radio)
destroy(this.ole_gear)
destroy(this.p_1)
destroy(this.cb_imprimer)
destroy(this.dw_diag)
destroy(this.gb_trace)
end on

event open;call super::open;

p = Message.PowerObjectParm

// 2 modes d'ouverture

// 0 = mode normal , interactif
// 1 = mode automatique 


if p.mode = 0 then
	var_code_local = var_code
	var_nom_local = var_nom
	var_numero_dossier_local = var_numero_dossier
else
	var_code_local = p.code_patient
	select trim(nom)+' '+trim(prenom) , numero_dossier  into :var_nom_local, :var_numero_dossier_local 
	from patient where code =  :var_code_local ;
	//	w_main_odrade.windowtype = response!
end if

dw_diag.setTransObject(sqlca)

colore_tous_objets_window(this, couleur_fond_fenetre)
// on remet les commentaires en fond blanc
//mle_commentaires.backcolor = rgb(255, 255, 255)

// **********************************************************************
// connection à la base ODRADE
// déporté ds fenetre appelante car sinon plantage ... !!!!!
// **********************************************************************
//t_Odrade = Create transaction   
//t_Odrade.DBMS = "ODBC"
//t_Odrade.database = "Odrade"
//t_Odrade.userid = "dba"
//t_Odrade.dbpass = "SQL"
//t_Odrade.autocommit = false
//t_Odrade.dbparm="Block = 1,ConnectString='DSN=Odrade;UID=DBA;PWD=SQL'"
//CONNECT using t_Odrade ;
// **********************************************************************

// pour test seulement
ole_gear.object.debuglevel = 1

// Recherche des répertoires ....

// Odrade est installé sur la machine ?
RegistryGet("HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\App Paths\Odrade.exe","path",Odrade_ini)

if isnull(Odrade_ini ) or trim(Odrade_ini) = "" then
	// Odrade n'est pas sur la machine
	dossier_radio =profilestring(dir_ini+"orthokis.ini","odrade","dir_patient","")
	// Recherche du dernier code utilisateur_odrade dans Orthokis.ini
	utilisateur_odrade = integer(profilestring(dir_ini+"orthokis.ini","Odrade","code_utilisateur",""))
else
	Odrade_ini = Odrade_ini + "\Odrade.ini"
	// Est on en mode cabinet ou en mode réplication
	if not utilisation_distante or profilestring(dir_ini+inifile_orthokis,"odrade","base_replic","C") = "C" then 
		dossier_radio = ProfileStringOdrade(Odrade_ini,"CheminDossierPatient")
	else
		dossier_radio = ProfileStringOdrade(Odrade_ini,"CheminDossierPatientIti")
	end if
	
	// Recherche du dernier code utilisateur_odrade dans ODRADE.ini
	String v_nom_utilisateur_odrade
	v_nom_utilisateur_odrade = ProfileStringOdrade(Odrade_ini,"DernierUtilisateur")
	select max(code_utilisateur) into :utilisateur_odrade from utilisateurs where nom = :v_nom_utilisateur_odrade using t_odrade ;
end if


// On a pas de code utilisateur valide => on en prend un
if utilisateur_odrade = 0 or isnull(utilisateur_odrade) then
	select max(code_utilisateur) into :utilisateur_odrade from utilisateurs 
	where actif = 'oui' and "utilisateurs"."nom" not in ('Arakis','Power Orthokis', 'Administrateur')   
	using t_odrade ;
end if

// Mise en mémoire du code utilisateur utilisé
setprofilestring(dir_ini+"orthokis.ini","Odrade","code_utilisateur",string(utilisateur_odrade))




// Mise en place du patient


// Patient courant
date date_tt

// Recherche des éléments dans PWO
//select "patient"."identifiant_odrade", "patient"."debut_traitement" 
//into :identifiant_local, :date_tt  from patient  where code = :var_code_local ;

// Depuis V2009, identifiant Odrade = code !
select  "patient"."debut_traitement" into  :date_tt  from patient  where code = :var_code_local ;

// Ajout du nom du praticien dans le titre de la fenêtre
	string prati_nom
  SELECT "prati"."nom"  
    INTO :prati_nom  
    FROM "patient",   
         "prati"  
   WHERE ( "prati"."code" = "patient"."code_praticien" ) and  
         ( ( "patient"."code" = :var_code_local )     )   ;


this.title = "Lien Odrade pour le Dr " +prati_nom +" : "+var_nom_local+" ("+string(var_numero_dossier_local)+") - Date début de traitement : " + string(date_tt,'dd/mm/yyyy')


dw_diag.retrieve(var_code_local)

//if identifiant_local <> 0 and not isnull(identifiant_local) then


	// Vérification si le chemin des analyses du patient existe ou pas
	
	if DirectoryExists ( dossier_radio ) then

		// On vérifie quand même la présence du patient dans ODRADE
		
		integer nb_present
		
		select count(*) into :nb_present from patients where code_patient = :var_code_local using T_Odrade ;
		
		if nb_present = 1 then
	
			integer nb_trace
			
			nb_trace = 0
			select count(*) into :nb_trace from traces where code_trace <> -1 and code_patient = :var_code_local  and code_analyse > 0 using T_Odrade ;
				
			if nb_trace > 0 then
			
			
				if p.mode = 0 then
					// Recherche du dernier tracé de la derniere radio (par défaut)
					select code_trace,code_radio into :var_code_trace , :var_code_radio from traces where code_trace <> -1 and code_patient = :var_code_local and  code_analyse > 0 
					and date_trace = (select max(date_trace) from traces  where code_patient = :var_code_local ) using T_Odrade ;
		
					if T_Odrade.sqlnrows > 1 then
						// Sécurité compte tenu des pb vus chez Chabrand et Cuinet en 06/2004
						select code_trace,code_radio into :var_code_trace , :var_code_radio from traces where code_trace <> -1 and code_patient = :var_code_local and code_analyse > 0 
						and code_trace = (select max(code_trace) from traces  where code_patient = :var_code_local ) using T_Odrade ;
					end if
					
					Recherche_libelle()
					
					dessiner_tableau()
					
					premiere_radio = true
					
					// Le chargement et le tracé sont désormais fait dans le resize !!
					//charger_radio()
					//this.postevent("tracer")
				else
					open(w_recherche_trace)
					
					
					dessiner_tableau()
	
					premiere_radio = true
					
	//				p.plan = mle_commentaires.text
					// a suite se passe dans le resize ... sinon soucis pour tracer !!! .. puis ensuitre dans l'event tracer ...
					// C'est là qu'on enchaine !!
		
				end if
	
			else
				
				// Pas de tracé
				Messagebox("ATTENTION","Aucun tracé n'a été effectué pour ce patient dans Odrade !")
				// depuis version 14.03b .. on rentre quand meme dans la fenêtre pour accéder aux moulages !
				//disconnect using t_odrade ;
				//close(this)
				
				// depuis la 16.04, on ressort à nouveau sinon, messages zarbi ... et puis les moulages sont peut utilisés !!!!
				//disconnect using t_odrade ;
				//close(this)
				
		
				// depuis la 16.05f
				integer v_nb_moulages
				Select isnull(count(*),0) into :v_nb_moulages
				from moulages where moulages.groupe > 0 and moulages.sous_groupe > 0 and 
				(select count(*) from radios where moulages.code_patient = :var_code_local 
				and moulages.groupe = radios.groupe and moulages.sous_groupe = radios.sous_groupe ) > 0 
				and moulages.code_patient = :var_code_local 
				group by intitule ,  moulages.groupe ,  moulages.date_moulage 
				order by moulages.date_moulage 
				using t_odrade ;
				
				if v_nb_moulages = 0 then
					// On sort car pas utile de rentrer si pas de moulages
					disconnect using t_odrade ;
					close(this)
				else
					// On rentre car y a des moulages !
				end if
				
				
				
			end if
			
		else
			
			// Patient non trouvé par son identifiant
			Messagebox("ATTENTION","Ce patient n'est pas dans Odrade !")
			deconnexion_base_odrade()
			close(this)
		
		end if
		
	else
		
			// Pas de dossier patient accessible
			Messagebox("ATTENTION","Impossible d'accéder au répertoire contenant les dossiers de Odrade !~n~n("+dossier_radio+")~n~nVeuillez vérifier votre configuration et/ou votre réseau.")
			deconnexion_base_odrade()
			close(this)
	end if
//else
//	
//	// Pas d'identifiant Odrade dans Orthokis
//	
//	Messagebox("ATTENTION","Ce patient n'a pas d'identifiant Odrade !")
//	disconnect using t_odrade ;
//	close(this)
//end if






end event

event resize;call super::resize; 


double ligne1, ligne2, ligne3, ligne0

ligne0 = this.height - 630
ligne1 = ligne0 + 108
ligne2 = ligne1 + 108
ligne3 = ligne2 + 160


cb_lire_plan_traitement_orthokis.y = ligne0
cb_maj_plan_traitement_orthokis.y = ligne0
cb_lire_commentaire_odrade.y = ligne0
cb_maj_commentaire_odrade.y = ligne0

cb_trace.y = ligne1
cb_user.y = ligne1
cb_exporter.y = ligne1
cb_fermer.y = ligne1

cb_moulage.y = ligne2
cb_imprimer.y = ligne2

cbx_radio.y = ligne3
cbx_courbes.y = ligne3
cbx_pochoirs.y = ligne3
cbx_droites.y = ligne3
cbx_points.y = ligne3

gb_trace.y = ligne3 - 60

dw_diag.y = ligne0 - 30 - dw_diag.height

// faire un redraw du tableau
//tableau.height = mle_commentaires.y - tableau.y - 30

//tableau.height = tableau.object.rows * tableau.object.rowheight[0]
//em_1.text = string( tableau.object.rows)
//em_2.text = string (tableau.object.rowheight[0])

if width > 4654 then
	tableau.width = v_largeur_tableau_souhaitee
end if



st_info_radio.y = ligne2
st_info_trace.y = ligne2

st_info_radio.width = (this.width - st_info_radio.x) / 2 - 40

st_info_trace.x = st_info_radio.x + st_info_radio.width + 20
st_info_trace.width = st_info_radio.width

// tests
//ole_gear.x = st_info_radio.x + 1000
p_1.x = tableau.x + tableau.width + 25

// pour n'afficher le message que si fichier pas trouvé ... si pas de radio, pas de message
if len(trim(fichier_radio)) > 0 then

	charger_radio()
	this.postevent("tracer")
	
else
	
	// on met en invisible .. ce qui ne sert à rien
	tableau.visible = false
	p_1.visible = false
	ole_image.visible = false
	
	cbx_points.visible = false
	cbx_droites.visible = false
	cbx_pochoirs.visible = false
	cbx_courbes.visible = false
	cbx_radio.visible = false
	gb_trace.visible = false
	
	// disable ce qui concerne les tracé
	cb_exporter.enabled = false
	cb_user.enabled = false
	cb_trace.enabled = false
	
	
	// on lance les moulages ...
	cb_moulage.triggerevent(clicked!)
	
end if

//messagebox("width", string(this.width))

end event

event close;// fermeture de la connexcion à la base Odrade
deconnexion_base_odrade()

end event

event activate;

// pour rafraichissement si swap entre appli
tracer_radio()
end event

type p_fond from w_fenetre_arakis`p_fond within w_main_odrade
end type

type tableau from olecustomcontrol within w_main_odrade
event click ( )
event dblclick ( )
event keydown ( ref integer keycode,  integer shift )
event keypress ( ref integer keyascii )
event keyup ( ref integer keycode,  integer shift )
event mousedown ( integer button,  integer shift,  real ocx_x,  real ocx_y )
event mousemove ( integer button,  integer shift,  real ocx_x,  real ocx_y )
event mouseup ( integer button,  integer shift,  real ocx_x,  real ocx_y )
event selchange ( )
event rowcolchange ( )
event entercell ( )
event leavecell ( )
event beforemousedown ( integer button,  integer shift,  real ocx_x,  real ocx_y,  ref boolean cancel )
event beforerowcolchange ( long oldrow,  long oldcol,  long newrow,  long newcol,  ref boolean cancel )
event afterrowcolchange ( long oldrow,  long oldcol,  long newrow,  long newcol )
event beforeselchange ( long oldrowsel,  long oldcolsel,  long newrowsel,  long newcolsel,  ref boolean cancel )
event afterselchange ( long oldrowsel,  long oldcolsel,  long newrowsel,  long newcolsel )
event beforescroll ( long oldtoprow,  long oldleftcol,  long newtoprow,  long newleftcol,  ref boolean cancel )
event afterscroll ( long oldtoprow,  long oldleftcol,  long newtoprow,  long newleftcol )
event compare ( long row1,  long row2,  ref integer cmp )
event beforesort ( long col,  ref integer order )
event aftersort ( long col,  ref integer order )
event beforemovecolumn ( long col,  ref long position )
event aftermovecolumn ( long col,  ref long position )
event beforeuserresize ( long row,  long col,  ref boolean cancel )
event afteruserresize ( long row,  long col )
event beforecollapse ( long row,  integer state,  ref boolean cancel )
event aftercollapse ( long row,  integer state )
event beforeedit ( long row,  long col,  ref boolean cancel )
event startedit ( long row,  long col,  ref boolean cancel )
event validateedit ( long row,  long col,  ref boolean cancel )
event afteredit ( long row,  long col )
event keypressedit ( long row,  long col,  ref integer keyascii )
event keydownedit ( long row,  long col,  ref integer keycode,  integer shift )
event keyupedit ( long row,  long col,  ref integer keycode,  integer shift )
event changeedit ( )
event beforepagebreak ( long row,  ref boolean breakok )
event getheaderrow ( long row,  ref long headerrow )
event startpage ( long hdc,  long page,  ref boolean cancel )
event drawcell ( long hdc,  long row,  long col,  long left,  long top,  long right,  long bottom,  ref boolean done )
event ocx_error ( long errorcode,  ref boolean showmsgbox )
event cellbuttonclick ( long row,  long col )
event beforescrolltip ( long row )
event afteruserfreeze ( )
event olestartdrag ( oleobject data,  ref long allowedeffects )
event olegivefeedback ( long effect,  ref boolean defaultcursors )
event olesetdata ( oleobject data,  ref integer dataformat )
event olecompletedrag ( ref long effect )
event oledragover ( oleobject data,  ref long effect,  integer button,  integer shift,  real ocx_x,  real ocx_y,  ref integer state )
event oledragdrop ( oleobject data,  ref long effect,  integer button,  integer shift,  real ocx_x,  real ocx_y )
event olesetcustomdataobject ( ref any customdataobject )
event cellchanged ( long row,  long col )
event beforemoverow ( long row,  ref long position )
event aftermoverow ( long row,  ref long position )
event setupeditwindow ( long row,  long col,  long editwindow,  boolean iscombo )
event setupeditstyle ( long row,  long col,  boolean iscombo,  long ocx_style,  long styleex )
event combodropdown ( long row,  long col )
event combocloseup ( long row,  long col,  boolean finishedit )
event startautosearch ( )
event endautosearch ( )
integer x = 5
integer y = 8
integer width = 2144
integer height = 1892
integer taborder = 20
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
string binarykey = "w_main_odrade.win"
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
end type

type cb_moulage from uo_picturebutton_780x120 within w_main_odrade
integer x = 425
integer y = 2592
integer height = 104
integer taborder = 40
string text = "Travail sur &Moulages"
end type

event clicked;call super::clicked;
p.code_patient = var_code_local
p.identifiant_odrade = var_code_local
p.dossier_radio = dossier_radio

OpenWithParm ( w_moulages , p )
end event

type cb_maj_commentaire_odrade from uo_picturebutton_250x120 within w_main_odrade
integer x = 1216
integer y = 2380
integer taborder = 110
string text = "MàJ Odrade"
end type

event clicked;call super::clicked;if messagebox("ATTENTION !","Vous allez mettre à jour les commentaires de cette radio dans Odrade.~n~nConfirmez-vous ?",question!,yesno!,1) = 1 then
	
	string com
	
	if dw_diag.rowcount() > 0 then
		dw_diag.accepttext()
		com = conversion_char(dw_diag.GetItemString(1, "texte_brut_traitement_effectue"),'P')
	
		// mise à jour  du commentaire saisi 
		update commentaires set texte = :com  where code_patient = :var_code_local 
		and code_trace = :var_code_trace and code_radio = :var_code_radio using t_odrade ;
	
	
		if t_odrade.sqlcode <> 0 then
			messagebox("Erreur dans la mise à jour de Odrade",t_odrade.sqlerrtext)
			rollback using t_odrade ;
		else
			commit using t_odrade ;
		end if
	end if
	

end if
end event

type cb_exporter from uo_picturebutton_250x120 within w_main_odrade
integer x = 827
integer y = 2488
integer taborder = 100
string text = "&Exporter"
end type

event clicked;call super::clicked;
// p contient les param transmis en amont
// param sert à remonter les numéro des cadres de destinantion 
param_exporter p_export 


openwithparm(w_exporter_trace,p)



p_export = Message.PowerObjectparm

if p_export.num_pour_trace + p_export.num_pour_tableau > 0 then
	// s'ils sont à 0, pas d'export
	exporter(p_export.num_pour_trace, p_export.num_pour_tableau, p_export.temps_traitement)
end if







end event

type cb_user from uo_picturebutton_250x120 within w_main_odrade
integer x = 421
integer y = 2488
integer taborder = 100
string text = "&Util. Odr."
end type

event clicked;call super::clicked;openWithParm(w_recherche_utilisateurs,1)


// raffraichissement
tracer_radio()
end event

type cb_trace from uo_picturebutton_250x120 within w_main_odrade
integer x = 14
integer y = 2488
integer width = 411
integer taborder = 100
string text = "&Autre Tracé"
end type

event clicked;call super::clicked;open(w_recherche_trace)


charger_radio()

tracer_radio()

dessiner_tableau()

end event

type cb_lire_plan_traitement_orthokis from uo_picturebutton_250x120 within w_main_odrade
integer x = 14
integer y = 2380
integer taborder = 100
string text = "Lire Diag."
end type

event clicked;call super::clicked;//select plan_traitement into :mle_commentaires.text from patient where code = :var_code_local ;

//select traitement_effectue into :mle_commentaires.text from patient where code = :var_code_local ;

dw_diag.retrieve(var_code_local)
end event

type cb_maj_plan_traitement_orthokis from uo_picturebutton_250x120 within w_main_odrade
integer x = 421
integer y = 2380
integer taborder = 100
string text = "MàJ Diag"
end type

event clicked;if messagebox("ATTENTION !","Vous allez mettre à jour le diagnostic de ce patient dans Orthokis.~n~nConfirmez-vous ?",question!,yesno!,1) = 1 then
	
	dw_diag.accepttext()

	// Mise à jour de la zone pour comptatilité avec MyOrthokis
	dw_diag.setItem(1, "patient_traitement_effectue_html", dw_diag.getitemString(1, "texte_brut_traitement_effectue"))

	dw_diag.update() 
	
end if
end event

type cb_lire_commentaire_odrade from uo_picturebutton_250x120 within w_main_odrade
integer x = 827
integer y = 2380
integer taborder = 100
string text = "Lire Odrade"
end type

event clicked;call super::clicked;
// pour charger le commentaire Odrade
lire_commentaires_odrade(1)



end event

type cb_fermer from uo_picturebutton_250x120 within w_main_odrade
integer x = 1216
integer y = 2488
integer taborder = 90
string text = "&Fermer"
end type

event clicked;call super::clicked;close(parent)
end event

type em_4 from editmask within w_main_odrade
boolean visible = false
integer x = 1943
integer y = 2684
integer width = 402
integer height = 112
integer taborder = 120
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
string text = "none"
boolean border = false
string mask = "#####"
end type

event modified;tableau.width = double(this.text)
end event

type em_3 from editmask within w_main_odrade
boolean visible = false
integer x = 1938
integer y = 2548
integer width = 402
integer height = 112
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
string text = "none"
borderstyle borderstyle = stylelowered!
string mask = "#####.000"
end type

event modified;tableau.height = tableau.object.rows * tableau.object.rowheight[0] * double(this.text)
end event

type em_2 from editmask within w_main_odrade
boolean visible = false
integer x = 1929
integer y = 2408
integer width = 402
integer height = 112
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
string text = "none"
borderstyle borderstyle = stylelowered!
string mask = "#####.000"
end type

type em_1 from editmask within w_main_odrade
boolean visible = false
integer x = 1920
integer y = 2268
integer width = 402
integer height = 112
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
string text = "none"
borderstyle borderstyle = stylelowered!
string mask = "#####.000"
end type

type ole_image from gearbox within w_main_odrade
integer x = 2030
integer y = 2036
integer taborder = 90
end type

on ole_image.destroy
call gearbox::destroy
end on

type st_info_trace from statictext within w_main_odrade
integer x = 3355
integer y = 2648
integer width = 1184
integer height = 224
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
string facename = "Arial"
boolean border = true
borderstyle borderstyle = stylelowered!
end type

event clicked;tableau.height = tableau.object.rows * tableau.object.rowheight[0] * double(this)
end event

type st_info_radio from statictext within w_main_odrade
integer x = 2167
integer y = 2644
integer width = 1184
integer height = 224
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
string facename = "Arial"
boolean border = true
borderstyle borderstyle = stylelowered!
end type

type cbx_points from checkbox within w_main_odrade
integer x = 1326
integer y = 2772
integer width = 270
integer height = 72
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 553648127
string text = "Points"
boolean checked = true
end type

event clicked;tracer_radio()
end event

type cbx_droites from checkbox within w_main_odrade
integer x = 1006
integer y = 2772
integer width = 325
integer height = 72
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 553648127
string text = "Droites"
boolean checked = true
end type

event clicked;tracer_radio()
end event

type cbx_pochoirs from checkbox within w_main_odrade
integer x = 672
integer y = 2772
integer width = 325
integer height = 72
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 553648127
string text = "Pochoirs"
boolean checked = true
end type

event clicked;tracer_radio()
end event

type cbx_courbes from checkbox within w_main_odrade
integer x = 334
integer y = 2772
integer width = 325
integer height = 72
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 553648127
string text = "Courbes"
boolean checked = true
end type

event clicked;

tracer_radio()
end event

type cbx_radio from checkbox within w_main_odrade
integer x = 69
integer y = 2772
integer width = 261
integer height = 72
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 553648127
string text = "Radio"
boolean checked = true
end type

event clicked;tracer_radio()
end event

type ole_gear from olecustomcontrol within w_main_odrade
event paintevent ( )
event selectevent ( long lplleft,  long lpltop,  long lplright,  long lplbottom )
event statusevent ( long lppercent )
event click ( )
event dblclick ( )
event keydown ( integer keycode,  integer shift )
event keypress ( integer keyascii )
event keyup ( integer keycode,  integer shift )
event mousedown ( integer button,  integer shift,  long ocx_x,  long ocx_y )
event mousemove ( integer button,  integer shift,  long ocx_x,  long ocx_y )
event mouseup ( integer button,  integer shift,  long ocx_x,  long ocx_y )
event scroll ( long scrolltype )
event errorevent ( integer nerrcount )
event thumbnail ( string filename,  long page )
event tag ( long tagid,  long tagtype,  long tagsize,  integer wordval,  long longval,  string strval )
event thumbtitle ( string title,  integer page )
event scanbeforepage ( long pagenumber,  double left,  double top,  double right,  double bottom )
event scanafterpage ( long pagenumber,  long pendcount,  string filename )
event scanafterdoc ( long pagecount,  long adfloaded )
event tagex ( long ltagid,  any vdata )
event warningevent ( integer nwarningcount )
boolean visible = false
integer x = 2450
integer y = 768
integer width = 1175
integer height = 752
integer taborder = 10
boolean border = false
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
string binarykey = "w_main_odrade.win"
integer binaryindex = 1
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
end type

type p_1 from picture within w_main_odrade
integer x = 2167
integer y = 4
integer width = 1170
integer height = 852
boolean focusrectangle = false
end type

event rbuttondown;tracer_radio()
end event

type cb_imprimer from uo_picturebutton_250x120 within w_main_odrade
integer x = 14
integer y = 2592
integer width = 411
integer taborder = 110
boolean bringtotop = true
string text = "&Imprimer"
end type

event clicked;call super::clicked;long Job
PrintSetup ( )
Job = PrintOpen("Copie d'Ecran")
PrintScreen(Job, 0,0)
PrintClose(Job)
Messagebox("IMPRESSION D'ECRAN","L'impression d'écran a été réalisée !")
end event

type dw_diag from datawindow within w_main_odrade
integer y = 1912
integer width = 1833
integer height = 468
integer taborder = 30
boolean bringtotop = true
string title = "none"
string dataobject = "dw_diag_odrade"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type gb_trace from groupbox within w_main_odrade
integer x = 27
integer y = 2712
integer width = 1591
integer height = 152
integer taborder = 50
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean italic = true
long textcolor = 33554432
long backcolor = 16777215
string text = "Tracé"
end type


Start of PowerBuilder Binary Data Section : Do NOT Edit
00w_main_odrade.bin 
2500001400e011cfd0e11ab1a1000000000000000000000000000000000003003e0009fffe000000060000000000000000000000010000000100000000000010000000000200000001fffffffe0000000000000000fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffd00000006fffffffe000000040000000500000007fffffffe00000008fffffffeffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff006f00520074006f004500200074006e00790072000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000050016ffffffffffffffff0000000300000000000000000000000000000000000000000000000000000000e7a4104001d9c51e00000003000008400000000000500003004c004200430049004e0045004500530045004b000000590000000000000000000000000000000000000000000000000000000000000000000000000002001cffffffffffffffffffffffff00000000000000000000000000000000000000000000000000000000000000000000000000000000000000120000000000500003004f0042005800430054005300450052004d0041000000000000000000000000000000000000000000000000000000000000000000000000000000000002001affffffffffffffffffffffff00000000000000000000000000000000000000000000000000000000000000000000000000000001000003e800000000004200500043004f00530058004f00540041005200450047000000000000000000000000000000000000000000000000000000000000000000000000000000000101001a0000000200000001000000040f026c114c2b5a66dd88b587a172aeeb00000000e7a4104001d9c51ee7a4104001d9c51e000000000000000000000000fffffffe00000002000000030000000400000005000000060000000700000008000000090000000a0000000b0000000c0000000d0000000e0000000f00000010fffffffe00000012000000130000001400000015000000160000001700000018000000190000001a0000001b0000001c0000001d0000001e0000001f00000020fffffffeffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
2Affffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff0030004f004700300043004e003400370000003300000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000030000003079000030e3000100030003000000000001ffff000b520300098f910be3e39d11ce4b00aa00000151b8019000000001424420534d0d736e6153726553200003666900000000000000090000000000000000000000000003000000ffffff00080003000380008000000f00120003000380008000000d000e0003000380008000000cffff0003000300ff8000000f00100003000380008000001000c000030003000080000006000100030003000000000001ffff000bffff000b0000000300030000000000000001000300030000000000020001000200320003000300000000000a0001000300030000000000010000000300030000000000000000000300030000000000000000000b01a4000800280000006f0046006d007200740061000b0029003000310039000b0030003600390009003900090009000900090009000900300009003000300009000b00090036003900090030000900390009003900090009003000090030000900090009000900300039000b0030003600390009003900090009000900090009000900300009003000300009000b00090036003900090030000900390009003900090009003000090030000900090009000900300039000b0030003600390009003900090009000900090009000900300009003000300009000b00090036003900090030000900390009003900090009003000090030000900090009000900300039000b0030003600390009003900090009000900090009000900300009003000300009000b00090036003900090030000900390009003900090009003000090030000900090009000900300039000b0030003600390009003900090009000900090009000900300009003000300009000b00090036003900090030000900390009003900090009003000090030000900090009000900300028000b0065005400740078000b0029000b000000030000000000030000000b000000030003000000000000ffff000b00000003000300000000000000000004000b40000003ffff000000010000000300030000000000000000000300030000000000000000000b00000003000b000000030000000000000000000300030000000000000000000300030000000000010000000b000000030003000000000000000000030003000000000000000000090000000000000000000000000003000000000003ffff000b0000000300030000000000000000000300030000000000000000000300090000000000000000000000000000000000000000000900000000000000000000000000090000000000000000000000000000000000000009000300080000000000020008000000000002000800000000000200030000000000180000000000000000000000000000000000000000000000000000030000003079000030e3000100030003000000000001ffff000b520300098f910be3e39d11ce4b00aa00000151b8019000000001424420534d0d736e6153726553200003666900000000000000090000000000000000000000000003000000ffffff00080003000380008000000f00120003000380008000000d000e0003000380008000000cffff0003000300ff8000000f00100003000380008000001000c000030003000080000006000100030003000000000001ffff000bffff000b0000000300030000000000000001000300030000000000020001000200320003000300000000000a0001000300030000000000010000000300030000000000000000000300030000000000000000000b01a4000800280000006f0046006d007200740061000b0029003000310039000b0030003600390009003900090009000900090009000900300009003000300009000b00090036003900090030000900390009003900090009003000090030000900090009000900300039000b0030003600390009003900090009000900090009000900300009003000300009000b00090036003900090030000900390009003900090009003000090030000900090009006f00430074006e006e00650073007400000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001020012ffffffffffffffffffffffff00000000000000000000000000000000000000000000000000000000000000000000000000000011000003e8000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffff0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffff0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
2B000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffff000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000900300039000b0030003600390009003900090009000900090009000900300009003000300009000b00090036003900090030000900390009003900090009003000090030000900090009000900300039000b0030003600390009003900090009000900090009000900300009003000300009000b00090036003900090030000900390009003900090009003000090030000900090009000900300039000b0030003600390009003900090009000900090009000900300009003000300009000b00090036003900090030000900390009003900090009003000090030000900090009000900300028000b0065005400740078000b0029000b000000030000000000030000000b000000030003000000000000ffff000b00000003000300000000000000000004000b40000003ffff000000010000000300030000000000000000000300030000000000000000000b00000003000b000000030000000000000000000300030000000000000000000300030000000000010000000b000000030003000000000000000000030003000000000000000000090000000000000000000000000003000000000003ffff000b0000000300030000000000000000000300030000000000000000000300090000000000000000000000000000000000000000000900000000000000000000000000090000000000000000000000000000000000000009000300080000000000020008000000000002000800000000000200030000000000180000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000c00e011cfd0e11ab1a1000000000000000000000000000000000003003e0009fffe000000060000000000000000000000010000000100000000000010000000000200000001fffffffe0000000000000000fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffd00000004fffffffefffffffefffffffeffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
21ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff006f00520074006f004500200074006e00790072000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000050016ffffffffffffffff0000000300000000000000000000000000000000000000000000000000000000e7a4375001d9c51e00000003000001000000000000500003004c004200430049004e0045004500530045004b000000590000000000000000000000000000000000000000000000000000000000000000000000000002001cffffffffffffffffffffffff00000000000000000000000000000000000000000000000000000000000000000000000000000000000000580000000000500003004f0042005800430054005300450052004d0041000000000000000000000000000000000000000000000000000000000000000000000000000000000002001affffffffffffffffffffffff000000000000000000000000000000000000000000000000000000000000000000000000000000020000004d00000000004200500043004f00530058004f00540041005200450047000000000000000000000000000000000000000000000000000000000000000000000000000000000101001a000000020000000100000004b7679ea411d365705000d4803d17ad0400000000e7a4375001d9c51ee7a4375001d9c51e00000000000000000000000000000001fffffffe00000003fffffffeffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff006d0049006700610047006500610065002000720043004f002d005800310038004300200070006f00720079006700690074006800280020002900630031002000390039002000390063004100750063006f005300740066000000000000000000000000000000000000000000000000000000000000000000000000000000000000fffe00020206b7679ea411d365705000d4803d17ad0400000001fb8f0821101b01640008ed8413c72e2b000000300000001d0000000100000000000000100000000100000000000000010000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000006f00430074006e006e00650073007400000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001020012ffffffffffffffffffffffff000000000000000000000000000000000000000000000000000000000000000000000000fffffffe00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffff00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
2A00000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffff0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffff00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
10w_main_odrade.bin 
End of PowerBuilder Binary Data Section : No Source Expected After This Point
