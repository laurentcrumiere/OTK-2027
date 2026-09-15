$PBExportHeader$w_migration_imagerie_2013.srw
forward
global type w_migration_imagerie_2013 from w_fenetre_arakis
end type
type pb_fermer from uo_picturebutton_390x120_fermer within w_migration_imagerie_2013
end type
type pb_1 from uo_picturebutton_780x120 within w_migration_imagerie_2013
end type
type pb_2 from uo_picturebutton_780x120 within w_migration_imagerie_2013
end type
type pb_3 from uo_picturebutton_780x120 within w_migration_imagerie_2013
end type
end forward

global type w_migration_imagerie_2013 from w_fenetre_arakis
integer width = 1687
integer height = 1132
string title = "Migration imagerie 2013"
pb_fermer pb_fermer
pb_1 pb_1
pb_2 pb_2
pb_3 pb_3
end type
global w_migration_imagerie_2013 w_migration_imagerie_2013

on w_migration_imagerie_2013.create
int iCurrent
call super::create
this.pb_fermer=create pb_fermer
this.pb_1=create pb_1
this.pb_2=create pb_2
this.pb_3=create pb_3
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.pb_fermer
this.Control[iCurrent+2]=this.pb_1
this.Control[iCurrent+3]=this.pb_2
this.Control[iCurrent+4]=this.pb_3
end on

on w_migration_imagerie_2013.destroy
call super::destroy
destroy(this.pb_fermer)
destroy(this.pb_1)
destroy(this.pb_2)
destroy(this.pb_3)
end on

event open;call super::open;

centrer(this)

// On ne peut faire l'étape 1
end event

type p_fond from w_fenetre_arakis`p_fond within w_migration_imagerie_2013
end type

type pb_fermer from uo_picturebutton_390x120_fermer within w_migration_imagerie_2013
integer x = 603
integer y = 832
integer width = 411
integer height = 152
integer taborder = 10
boolean bringtotop = true
end type

type pb_1 from uo_picturebutton_780x120 within w_migration_imagerie_2013
integer y = 316
integer width = 1637
integer height = 152
integer taborder = 10
boolean bringtotop = true
string text = "Etape 1 : Mise en place des Elements 2013"
boolean originalsize = false
end type

event clicked;call super::clicked;If MessageBox("ATTENTION","Vous allez mettre en place l'imagerie 2013 d'Orthokis.~n~nCeci va effacer certains paramétrages et en mettre en place de nouveaux.~n~nAvez vous bien lu les explications (bouton ci-dessus) ?",Question!,YesNo!,2) = 1 then


	If MessageBox("ATTENTION","Cette action est irrémédiable (aucun retour possible).~n~nSi besoin, vous devrez faire l'étape N°2 (bouton ci-dessous) dans la foulée (il sera inaccessible sinon).~n~nConfirmez-vous ?",Question!,YesNo!,2) = 1 then


		open(w_patience)
		// Effaccement des anciennes datas
		
		delete from expl_media_mots_clefs_cadres_images ;
		delete from expl_media_mots_clefs_filtres ;
		
		delete from type_image_mots_clefs ;
		delete from expl_media_mots_clefs ;
		delete from expl_media_groupes ;
		delete from acquis_scripts ;
		delete from acquis_scripts_cadres_imgs  ;
		update images_infos set type_image = null, temps_traitement = null ;
		
		delete from temps_traitement ;
		delete from type_image ;
		
		commit ;
	
		// Ajout des groupes de mots clefs 
		INSERT INTO expl_media_groupes VALUES (	1,	'Source',	'groupe.bmp',	1,	1);
		INSERT INTO expl_media_groupes VALUES (	2,	'Sujet',	'groupe.bmp',	2,	1);
		INSERT INTO expl_media_groupes VALUES (	3,	'Position',	'groupe.bmp',	3,	1);
		INSERT INTO expl_media_groupes VALUES (	4,	'Odrade',	'groupe.bmp',	4,	1);
		
		// Ajout des mots clefs 
		INSERT INTO expl_media_mots_clefs VALUES (	10,	'Ecran',	'CreateIndex_2!',	1,	1);
		INSERT INTO expl_media_mots_clefs VALUES (	11,	'Photo',	'CreateIndex_2!', 1,	1);
		INSERT INTO expl_media_mots_clefs VALUES (	12,	'Radio Numérique',	'CreateIndex_2!',	1,	1);
		INSERT INTO expl_media_mots_clefs VALUES (	13,	'Scanner',	'CreateIndex_2!',	1,	1);
		
		INSERT INTO expl_media_mots_clefs VALUES (	20,	'Bouche',	'CreateIndex_2!',	1,	2);
		INSERT INTO expl_media_mots_clefs VALUES (	21,	'Moulage Mandibule',	'CreateIndex_2!',	1,	2);
		INSERT INTO expl_media_mots_clefs VALUES (	22,	'Moulage Maxilaire',	'CreateIndex_2!',	1,	2);
		INSERT INTO expl_media_mots_clefs VALUES (	23,	'Moulage Occclusion',	'CreateIndex_2!',	1,	2);
		INSERT INTO expl_media_mots_clefs VALUES (	24,	'Orthopantomogramme',	'CreateIndex_2!',	1,	2);
		INSERT INTO expl_media_mots_clefs VALUES (	25,	'Poignet',	'CreateIndex_2!',	1,	2);
		INSERT INTO expl_media_mots_clefs VALUES (	26,	'Téléradiographie',	'CreateIndex_2!',	1,	2);
		INSERT INTO expl_media_mots_clefs VALUES (	27,	'Visage',	'CreateIndex_2!',	1,	2);
		
		INSERT INTO expl_media_mots_clefs VALUES (	30,	'3/4 droit',	'CreateIndex_2!',	1,	3);
		INSERT INTO expl_media_mots_clefs VALUES (	31,	'3/4 gauche',	'CreateIndex_2!',	1,	3);
		INSERT INTO expl_media_mots_clefs VALUES (	32,	'Arrière',	'CreateIndex_2!',	1,	3);
		INSERT INTO expl_media_mots_clefs VALUES (	33,	'Bas',	'CreateIndex_2!',	1,	3);
		INSERT INTO expl_media_mots_clefs VALUES (	34,	'Face',	'CreateIndex_2!',	1,	3);
		INSERT INTO expl_media_mots_clefs VALUES (	35,	'Haut',	'CreateIndex_2!',	1,	3);
		INSERT INTO expl_media_mots_clefs VALUES (	36,	'Profil droit',	'CreateIndex_2!',	1,	3);
		INSERT INTO expl_media_mots_clefs VALUES (	37,	'Profil gauche',	'CreateIndex_2!',	1,	3);
		
		INSERT INTO expl_media_mots_clefs VALUES (	40,	'Mesures',	'CreateIndex_2!',	1,	4);
		INSERT INTO expl_media_mots_clefs VALUES (	41,	'Mise en page',	'CreateIndex_2!',	1,	4);
		INSERT INTO expl_media_mots_clefs VALUES (	42,	'Superpositions',	'CreateIndex_2!',	1,	4);
		INSERT INTO expl_media_mots_clefs VALUES (	43,	'Tracé',	'CreateIndex_2!',	1,	4);
	
	
	INSERT INTO type_image VALUES (	10,	'Exobuccale face',	100,	'EF',	1,	0);
	INSERT INTO type_image VALUES (	11,	'Exobuccale 3/4 droit',	110,	'E34D',	1,	0);
	INSERT INTO type_image VALUES (	12,	'Exobuccale 3/4 gauche',	120,	'E34G',	1,	0);
	INSERT INTO type_image VALUES (	13,	'Exobuccale face sourire',	130,	'EFS',	1,	1);
	INSERT INTO type_image VALUES (	14,	'Exobuccale profil gauche',	140,	'EPG',	1,	0);
	INSERT INTO type_image VALUES (	15,	'Exobuccale profil droit',	150,	'EPD',	1,	2);
	
	INSERT INTO type_image VALUES (	20,	'Intrabuccale haut',	200,	'IH',	1,	6);
	INSERT INTO type_image VALUES (	21,	'Intrabuccale bas',	210,	'IB',	1,	7);
	INSERT INTO type_image VALUES (	22,	'Intrabuccale gauche',	230,	'IG',	1,	5);
	INSERT INTO type_image VALUES (	23,	'Intrabuccale droite',	220,	'ID',	1,	3);
	INSERT INTO type_image VALUES (	24,	'Intrabuccale 3/4 gauche',	260,	'I34G',	1,	0);
	INSERT INTO type_image VALUES (	25,	'Intrabuccale 3/4 droite',	250,	'I34D',	1,	0);
	INSERT INTO type_image VALUES (	26,	'Intrabuccale face',	240,	'IF',	1,	4);
	
	INSERT INTO type_image VALUES (	30,	'Radio panoramique',	300,	'RPA',	1,	8);
	INSERT INTO type_image VALUES (	31,	'Radio profil droit',	310,	'RPD',	1,	9);
	INSERT INTO type_image VALUES (	32,	'Radio profil gauche',	320,	'RPG',	1,	0);
	INSERT INTO type_image VALUES (	33,	'Radio du poignet',	330,	'RPO',	1,	0);
	INSERT INTO type_image VALUES (	34,	'Radio face',	340,	'RF',	1,	0);
	INSERT INTO type_image VALUES (	35,	'Radio axiale',	350,	'RA',	1,	0);
	
	INSERT INTO type_image VALUES (	40,	'Moulage haut',	400,	'MH',	1,	0);
	INSERT INTO type_image VALUES (	41,	'Moulage bas',	410,	'MB',	1,	0);
	INSERT INTO type_image VALUES (	42,	'Moulage occlusion face',	430,	'MOF',	1,	0);
	INSERT INTO type_image VALUES (	43,	'Moulage occlusion gauche',	440,	'MOG',	1,	0);
	INSERT INTO type_image VALUES (	44,	'Moulage occlusion droite',	420,	'MOD',	1,	0);
	INSERT INTO type_image VALUES (	45,	'Moulage occlusion arrière',	450,	'MOA',	1,	0);
	
	INSERT INTO type_image VALUES (	50,	'Tableau de mesures',	500,	'OTM',	1,	0);
	INSERT INTO type_image VALUES (	51,	'Tracé céphalométrique',	510,	'OTC',	1,	0);
	INSERT INTO type_image VALUES (	52,	'Mise en page',	520,	'OMP',	1,	0);
	INSERT INTO type_image VALUES (	53,	'Superposition tracés avant/après',	530,	'OSTAA',	1,	0);
	INSERT INTO type_image VALUES (	54,	'Superposition tracé/radio/photo',	540,	'OSRTP',	1,	0);
	INSERT INTO type_image VALUES (	55,	'Superposition mesures avant/après',	550,	'OSMAA',	1,	0);

	// Ajouts 2013.01
	insert into type_image values (46, 'Moulages haut et bas', 460, 'MHB', 1, 0);
	insert into type_image values (49, 'Tableau de mesures (graphique)', 505, 'OTMG', 1, 0);
	
	
		INSERT INTO type_image_mots_clefs VALUES (	10,	11);
		INSERT INTO type_image_mots_clefs VALUES (	10,	27);
		INSERT INTO type_image_mots_clefs VALUES (	10,	34);
		INSERT INTO type_image_mots_clefs VALUES (	13,	11);
		INSERT INTO type_image_mots_clefs VALUES (	13,	27);
		INSERT INTO type_image_mots_clefs VALUES (	13,	34);
		INSERT INTO type_image_mots_clefs VALUES (	15,	11);
		INSERT INTO type_image_mots_clefs VALUES (	15,	27);
		INSERT INTO type_image_mots_clefs VALUES (	15,	36);
		INSERT INTO type_image_mots_clefs VALUES (	14,	11);
		INSERT INTO type_image_mots_clefs VALUES (	14,	27);
		INSERT INTO type_image_mots_clefs VALUES (	14,	37);
		INSERT INTO type_image_mots_clefs VALUES (	11,	11);
		INSERT INTO type_image_mots_clefs VALUES (	11,	27);
		INSERT INTO type_image_mots_clefs VALUES (	11,	30);
		INSERT INTO type_image_mots_clefs VALUES (	12,	11);
		INSERT INTO type_image_mots_clefs VALUES (	12,	27);
		INSERT INTO type_image_mots_clefs VALUES (	12,	31);
		INSERT INTO type_image_mots_clefs VALUES (	21,	11);
		INSERT INTO type_image_mots_clefs VALUES (	21,	20);
		INSERT INTO type_image_mots_clefs VALUES (	21,	33);
		INSERT INTO type_image_mots_clefs VALUES (	23,	11);
		INSERT INTO type_image_mots_clefs VALUES (	23,	20);
		INSERT INTO type_image_mots_clefs VALUES (	23,	36);
		INSERT INTO type_image_mots_clefs VALUES (	26,	11);
		INSERT INTO type_image_mots_clefs VALUES (	26,	34);
		INSERT INTO type_image_mots_clefs VALUES (	22,	11);
		INSERT INTO type_image_mots_clefs VALUES (	22,	20);
		INSERT INTO type_image_mots_clefs VALUES (	22,	37);
		INSERT INTO type_image_mots_clefs VALUES (	20,	11);
		INSERT INTO type_image_mots_clefs VALUES (	20,	20);
		INSERT INTO type_image_mots_clefs VALUES (	20,	35);
		INSERT INTO type_image_mots_clefs VALUES (	25,	11);
		INSERT INTO type_image_mots_clefs VALUES (	25,	20);
		INSERT INTO type_image_mots_clefs VALUES (	25,	30);
		INSERT INTO type_image_mots_clefs VALUES (	24,	11);
		INSERT INTO type_image_mots_clefs VALUES (	24,	20);
		INSERT INTO type_image_mots_clefs VALUES (	24,	31);
		INSERT INTO type_image_mots_clefs VALUES (	30,	12);
		INSERT INTO type_image_mots_clefs VALUES (	30,	24);
		INSERT INTO type_image_mots_clefs VALUES (	30,	34);
		INSERT INTO type_image_mots_clefs VALUES (	31,	12);
		INSERT INTO type_image_mots_clefs VALUES (	31,	26);
		INSERT INTO type_image_mots_clefs VALUES (	31,	36);
		INSERT INTO type_image_mots_clefs VALUES (	35,	12);
		INSERT INTO type_image_mots_clefs VALUES (	35,	35);
		INSERT INTO type_image_mots_clefs VALUES (	35,	27);
		INSERT INTO type_image_mots_clefs VALUES (	33,	12);
		INSERT INTO type_image_mots_clefs VALUES (	33,	25);
		INSERT INTO type_image_mots_clefs VALUES (	33,	35);
		INSERT INTO type_image_mots_clefs VALUES (	34,	12);
		INSERT INTO type_image_mots_clefs VALUES (	34,	27);
		INSERT INTO type_image_mots_clefs VALUES (	34,	34);
		INSERT INTO type_image_mots_clefs VALUES (	32,	12);
		INSERT INTO type_image_mots_clefs VALUES (	32,	26);
		INSERT INTO type_image_mots_clefs VALUES (	32,	37);
		INSERT INTO type_image_mots_clefs VALUES (	41,	11);
		INSERT INTO type_image_mots_clefs VALUES (	41,	22);
		INSERT INTO type_image_mots_clefs VALUES (	41,	35);
		INSERT INTO type_image_mots_clefs VALUES (	40,	11);
		INSERT INTO type_image_mots_clefs VALUES (	40,	21);
		INSERT INTO type_image_mots_clefs VALUES (	40,	35);
		INSERT INTO type_image_mots_clefs VALUES (	45,	11);
		INSERT INTO type_image_mots_clefs VALUES (	45,	23);
		INSERT INTO type_image_mots_clefs VALUES (	45,	32);
		INSERT INTO type_image_mots_clefs VALUES (	44,	11);
		INSERT INTO type_image_mots_clefs VALUES (	44,	23);
		INSERT INTO type_image_mots_clefs VALUES (	44,	36);
		INSERT INTO type_image_mots_clefs VALUES (	42,	23);
		INSERT INTO type_image_mots_clefs VALUES (	42,	11);
		INSERT INTO type_image_mots_clefs VALUES (	42,	34);
		INSERT INTO type_image_mots_clefs VALUES (	43,	11);
		INSERT INTO type_image_mots_clefs VALUES (	43,	23);
		INSERT INTO type_image_mots_clefs VALUES (	43,	37);
		INSERT INTO type_image_mots_clefs VALUES (	50,	10);
		INSERT INTO type_image_mots_clefs VALUES (	50,	40);
		INSERT INTO type_image_mots_clefs VALUES (	51,	10);
		INSERT INTO type_image_mots_clefs VALUES (	51,	36);
		INSERT INTO type_image_mots_clefs VALUES (	51,	43);
		INSERT INTO type_image_mots_clefs VALUES (	52,	41);
		INSERT INTO type_image_mots_clefs VALUES (	52,	10);
		INSERT INTO type_image_mots_clefs VALUES (	55,	10);
		INSERT INTO type_image_mots_clefs VALUES (	55,	42);
		INSERT INTO type_image_mots_clefs VALUES (	54,	10);
		INSERT INTO type_image_mots_clefs VALUES (	54,	42);
		INSERT INTO type_image_mots_clefs VALUES (	53,	42);
		INSERT INTO type_image_mots_clefs VALUES (	53,	10);
	
	
	
		INSERT INTO temps_traitement VALUES (	1,	'Avant traitement 1',	10,	'AT1', 1);
		INSERT INTO temps_traitement VALUES (	2,	'Avant traitement 2',	20,	'AT2', 1);
		INSERT INTO temps_traitement VALUES (	3,	'Pose appareil',	30,	'PAP' , 1);
		INSERT INTO temps_traitement VALUES (	4,	'Début de traitement',	40,		'DT', 1);
		INSERT INTO temps_traitement VALUES (	5,	'Etape 1',	50,		'E1', 1);
		INSERT INTO temps_traitement VALUES (	6,	'Etape 2',	60,		'E2', 1);
		INSERT INTO temps_traitement VALUES (	7,	'Etape 3',	70,		'E3', 1);
		INSERT INTO temps_traitement VALUES (	8,	'Etape 4',	80,		'E4', 1);
		INSERT INTO temps_traitement VALUES (	9,	'Etape 5',	90,		'E5', 1);
		INSERT INTO temps_traitement VALUES (	10,	'Etape 6',	100,		'E6', 1);
		INSERT INTO temps_traitement VALUES (	11,	'Etape 7',	110,		'E7', 1);
		INSERT INTO temps_traitement VALUES (	12,	'Etape 8',	120,		'E8', 1);
		INSERT INTO temps_traitement VALUES (	13,	'Etape 9',	130,		'E9', 1);
		INSERT INTO temps_traitement VALUES (	14,	'Etape 10',	140,		'E10', 1);
		INSERT INTO temps_traitement VALUES (	15,	'Fin de traitement',	150,		'FT', 1);
		INSERT INTO temps_traitement VALUES (	16,	'Contention 1',	160,		'C1', 1);
		INSERT INTO temps_traitement VALUES (	17,	'Contention 2',	170,		'C2', 1);
		INSERT INTO temps_traitement VALUES (	18,	'Fin contention ',	180,		'FC', 1);

		
		update param set imagerie_2013 = 'O' , date_imagerie_2013 = getdate() ;
		
		imagerie_2013 = true ;
		
		commit ;
		
		close(w_patience)
		Messagebox("INFORMATION","Etape 1 terminée")
	end if
end if
end event

type pb_2 from uo_picturebutton_780x120 within w_migration_imagerie_2013
integer y = 568
integer width = 1637
integer height = 152
integer taborder = 20
boolean bringtotop = true
string text = "Etape 2 : Affection des Types d~'images aux Cadres"
boolean originalsize = false
end type

event clicked;call super::clicked;

open(w_migration_imagerie_2013_cadres)
end event

type pb_3 from uo_picturebutton_780x120 within w_migration_imagerie_2013
integer y = 52
integer width = 1637
integer height = 152
integer taborder = 20
boolean bringtotop = true
string text = "Lire les explications de migration"
boolean originalsize = false
end type

event clicked;call super::clicked;
ShowHelp ( fichier_aide_orthokis, Keyword!, "Imagerie, Migration Imagerie 2013" )
end event

