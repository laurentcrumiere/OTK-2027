$PBExportHeader$w_ia_vocale.srw
forward
global type w_ia_vocale from w_fenetre_arakis
end type
type cb_demarrer from uo_picturebutton_390x120 within w_ia_vocale
end type
type cb_arreter from uo_picturebutton_390x120 within w_ia_vocale
end type
type st_statut from statictext within w_ia_vocale
end type
type st_timer from statictext within w_ia_vocale
end type
type cb_traiter from uo_picturebutton_390x120 within w_ia_vocale
end type
type uo_1 from resize_fenetre within w_ia_vocale
end type
type rb_mp3 from radiobutton within w_ia_vocale
end type
type rb_wav from radiobutton within w_ia_vocale
end type
type cb_pause from uo_picturebutton_390x120 within w_ia_vocale
end type
type sle_fichier_a_importer from singlelineedit within w_ia_vocale
end type
type pb_fichier_a_importer from picturebutton within w_ia_vocale
end type
type cb_traiter_import from uo_picturebutton_390x120 within w_ia_vocale
end type
type st_status_magic_lemp from statictext within w_ia_vocale
end type
type st_nom from statictext within w_ia_vocale
end type
type pb_ecouter_existant from picturebutton within w_ia_vocale
end type
type cb_ecouter from uo_picturebutton_390x120 within w_ia_vocale
end type
type pb_stopper_existant from picturebutton within w_ia_vocale
end type
type cb_stopper from uo_picturebutton_390x120 within w_ia_vocale
end type
type gb_1 from groupbox within w_ia_vocale
end type
type gb_nouveau from groupbox within w_ia_vocale
end type
type gb_existant from groupbox within w_ia_vocale
end type
end forward

global type w_ia_vocale from w_fenetre_arakis
integer width = 4174
integer height = 2028
boolean titlebar = false
string title = ""
boolean controlmenu = false
boolean minbox = false
boolean maxbox = false
boolean resizable = false
windowtype windowtype = child!
boolean center = true
cb_demarrer cb_demarrer
cb_arreter cb_arreter
st_statut st_statut
st_timer st_timer
cb_traiter cb_traiter
uo_1 uo_1
rb_mp3 rb_mp3
rb_wav rb_wav
cb_pause cb_pause
sle_fichier_a_importer sle_fichier_a_importer
pb_fichier_a_importer pb_fichier_a_importer
cb_traiter_import cb_traiter_import
st_status_magic_lemp st_status_magic_lemp
st_nom st_nom
pb_ecouter_existant pb_ecouter_existant
cb_ecouter cb_ecouter
pb_stopper_existant pb_stopper_existant
cb_stopper cb_stopper
gb_1 gb_1
gb_nouveau gb_nouveau
gb_existant gb_existant
end type
global w_ia_vocale w_ia_vocale

type prototypes
// Déclaration de winmm.dll pour envoyer des commandes MCI à Windows
FUNCTION uLong mciSendString ( &
	String lpstrCommand, &
	Ref String lpstrReturnString, &
	uLong uReturnLength, &
	uLong hwndCallback &
) LIBRARY "winmm.dll" ALIAS FOR "mciSendStringW"

//Pour le Drag and drop externe
FUNCTION ulong DragQueryFile( &
   ulong hDrop, &
   ulong iFile, &
   REF string lpszFile, &
   ulong cch &
) LIBRARY "shell32.dll" ALIAS FOR "DragQueryFileW"

SUBROUTINE DragFinish(  ulong hDrop ) LIBRARY "shell32.dll"


SUBROUTINE DragAcceptFiles(   ulong hWnd,  boolean fAccept ) LIBRARY "shell32.dll"

FUNCTION long mciSendStringA (string lpstrCommand, ref string lpstrReturnString, long uReturnLength, long hwndCallback) LIBRARY "winmm.dll"

end prototypes

type variables
DateTime idtm_start
long il_total_seconds_complet


double var_code_locale


// pour le Drag and Drop avec l'OS 
nca_DragDrop	inca_DragDrop

// nouveaux fichiers  audios
string is_wav_path, is_mp3_path

end variables

forward prototypes
public subroutine traiter (string as_fichier_vocal)
public subroutine jouer_son (string as_fichier_son)
public subroutine stopper_son (string as_fichier_ecoute)
end prototypes

public subroutine traiter (string as_fichier_vocal);// Si renseigné, on mémorise le dossier de sortie pour la prochaine fois 


String ls_json_complet, ls_err
string ls_transcription

if fxg_transcription_envoyer(as_fichier_vocal, ls_json_complet, ls_err, st_status_magic_lemp, ls_transcription) = 1 then
	st_status_magic_lemp.visible = false
	str_ia_rapport lstr_ia_rapport
	lstr_ia_rapport.code_patient = var_code_locale
	lstr_ia_rapport.json_ia_complet = ls_json_complet
	lstr_ia_rapport.fichier_audio = as_fichier_vocal
	lstr_ia_rapport.transcription = ls_transcription
	

	// pour les tests
	lstr_ia_rapport.json_ia_complet =  '{"job_id":"66501acfc5a743d5913064c3ad55810b","step":"report","input":"reformulation","transcript_text":"Praticien : Bonjour, Monsieur Lefort et Manon, c est ça ? Je suis le docteur Lefebvre. Entrez, je vous en prie.\nAccompagnant : Bonjour, docteur. Oui, c est nous.\nPraticien : Enchanté, et vous, Monsieur Lissy ? Manon, tu peux t asseoir sur le fauteuil. On va d abord parler un peu, je ne fais rien tout de suite. Alors, Manon, tu as quel âge ? Et tu es en quelle classe ? Très bien. Alors, monsieur, qu est-ce qui vous amène ?\nAccompagnant : Eh bien, c est assez simple. Les dents de Manon poussent un peu dans tous les sens, surtout en haut. Il y a une dent, là, sur le côté gauche, qui sort tout en haut, parce que dans la gencive. On dirait une dent de vampire. Sa mère et moi, on s est dit qu il était temps de voir quelqu un. Arrête avec le vampire. Pardon ma chérie, mais c est ce que disent tes copines, non ?\nPraticien : Bon, ça, on va pouvoir s en occuper, Manon. Ce que tu décris est très fréquent à ton âge. Est-ce que c est votre dentiste qui vous a envoyés ?\nAccompagnant : Non, on est venus de nous-mêmes. Notre dentiste nous en avait parlé il y a deux ans et nous avait dit d attendre que les dents sortent. Et puis on a un peu oublié avec le travail cet été. La dent est sortie, et là, on s est dit que ça ne pouvait pas rester comme ça.\nPraticien : Vous avez bien fait de venir maintenant. Ce n est pas trop tard du tout. Manon, à part l aspect esthétique, est-ce que ça te gêne pour manger ? Est-ce que tu te mords les joues ou la lèvre ?\nPatient : Ah, ça se passe, mais j ai du mal à me brosser les dents. Il y a des endroits où la brosse ne passe pas. Et il y a souvent des trucs coincés entre les dents en bas.\nPraticien : D accord. C est logique, quand les dents se chevauchent, le nettoyage est plus difficile. Est-ce que tes gencives saignent quand tu te brosses ? On va regarder ça. Avant, quelques questions sur ta santé. Monsieur, est-ce que Manon a des problèmes de santé ? Un traitement ? Des allergies ?\nAccompagnant : Non, rien. Elle est en très bonne santé. Juste une allergie à la pénicilline, on l a découverte quand elle était petite. Elle avait fait des plaques rouges.\nPraticien : Allergie à la pénicilline, d accord, c est important. Je le note en rouge dans le dossier. Pas d autres allergies ? Au nickel ? Aux bijoux fantaisie ?\nAccompagnant : Ah si, maintenant que vous le dites, elle a eu une réaction avec des boucles dorées pas chères. Ça l avait démangée.\nPatient : Maintenant, je ne mets que des boucles en argent.\nPraticien : D accord, c est intéressant pour moi parce que certains appareils contiennent du nickel. On en tiendra compte si on fait un appareil. Il existe des alternatives. Est-ce qu elle a déjà été opérée ? Une dent arrachée ?\nAccompagnant : Non, rien. Pas d opération. Les dents de lait sont toutes tombées toutes seules, je crois.\nPraticien : Est-ce qu elle suçait son pouce petite ? Une tétine ?\nAccompagnant : Une tétine jusqu à deux ans et demi. Pas longtemps.\nPraticien : Très bien. Et dans la famille, est-ce que quelqu un a eu des dents qui se chevauchaient ? Un appareil ?\nAccompagnant : Oui. Oui, j avais exactement la même chose, la canine qui sortait en haut. On m avait enlevé des dents, quatre, je crois, et j avais eu des bagues pendant deux ans. Sa mère, non, elle a des dents parfaites.\nPraticien : D accord, il y a souvent une part d hérédité dans ces histoires de place. Bon, on va regarder. Manon, tu t allonges, je baisse le fauteuil. Je te regarde d abord de face et de profil. Détends-toi. Le visage est équilibré. Les lèvres se ferment bien naturellement. De profil, c est harmonieux, rien de particulier. Ouvre grand, maintenant. Alors, en haut, effectivement, la canine gauche, la 23, est sortie très haut, au-dessus des autres dents et un peu en avant. Elle n a pas trouvé sa place dans la rangée, alors elle est sortie là où il reste de l espace, c est-à-dire plus haut, dans la gencive. Toutes les autres dents définitives du haut sont sorties. La canine droite, la 13, est à sa place, mais elle est un peu serrée. Et l incisive latérale gauche, la 22, est un peu en arrière, derrière les autres.\nAccompagnant : C est celle qui est cachée là.\nPraticien : Exactement. Monsieur, si vous voulez voir, approchez-vous. Vous voyez, elle est en retrait, côté palais. En bas, maintenant. Les incisives se chevauchent nettement, surtout la 32 et la 42 qui sont tournées. Et derrière les incisives du bas, il y a du tartre. Les gencives sont un peu gonflées et rouges à cet endroit. C est pour ça que ça saigne quand tu te brosses, Manon. Ce n est pas grave. C est une petite inflammation de la gencive, une gingivite. Mais il faut s en occuper. Un détartrage chez votre dentiste et un brossage plus soigneux, surtout si on met un appareil ensuite. Mords maintenant sur tes dents du fond. Sur les côtés, l emboîtement des molaires est correct, des deux côtés. C est ce qu on appelle une classe. La mâchoire du haut et la mâchoire du bas sont bien placées l une par rapport à l autre. Les dents du haut recouvrent les dents du bas d environ 3 mm. C est un peu plus que la normale, mais ça reste raisonnable. Et le milieu des dents du haut est un peu dévié vers la gauche parce que la canine n a pas trouvé sa place.\nAccompagnant : Donc le problème, ce n est pas les mâchoires, c est la place.\nPraticien : Vous avez très bien résumé. Chez Manon, les mâchoires sont bien placées. Le problème, c est un manque de place pour aligner toutes les dents. On appelle ça un encombrement dentaire. Les dents sont trop grandes par rapport à la taille de la mâchoire ou la mâchoire est un peu trop petite pour les dents. Comme quand on veut ranger 12 livres sur une étagère qui n en contient que 10.\nPatient : Et du coup, il va se... On voit qu il n y a pas...\nPraticien : Voilà. Ta canine, c est le livre qui dépasse. C est souvent la canine du haut qui se retrouve dans cette situation, parce que c est la dernière dent de devant à sortir, vers 11-12 ans. Quand elle arrive, toutes les autres sont déjà installées et il ne reste plus de place pour elle.\nAccompagnant : Et vous diriez qu il manque combien de place ?\nPraticien : À l œil, j estime l encombrement à environ 7 mm en haut et 5 mm en bas. C est un encombrement important, mais je vais le mesurer précisément sur l empreinte numérique. Je vérifie aussi les articulations. Ouvre. Ferme. Très bien, pas de bruit, pas de douleur. Tu peux te relever. Alors, je vous résume. Manon a un encombrement dentaire important en haut et en bas, avec la canine gauche du haut qui est sortie en dehors de la rangée, l incisive latérale gauche en retrait, et les incisives du bas qui se chevauchent. Par contre, les mâchoires sont bien placées l une par rapport à l autre en classe. Et il y a une gingivite en bas devant, liée au tartre.\nAccompagnant : D accord. Et qu est-ce qu on peut faire ? On va devoir lui enlever des dents, comme moi ?\nPraticien : C est la grande question, et c est une question que je ne peux pas trancher aujourd hui. Il y a deux grandes façons de régler un problème de place. Soit on crée de la place en élargissant un peu les arcades, ou en limant très légèrement les côtés de certaines dents. Soit, quand le manque de place est trop important, on retire des dents, en général des prémolaires, pour laisser la place aux autres. Je comprends Manon, c est normal que ça fasse peur. Mais je te rassure, on ne le fait que si c est vraiment nécessaire. Et c est le dentiste ou le chirurgien qui le fait, avec une petite anesthésie comme pour une carie. Les prémolaires, ce sont des petites dents entre la canine et les grosses molaires. On en a 4 en haut et 4 en bas. En retirer une de chaque côté, ça ne se voit pas. Et ça permet souvent d avoir un sourire bien aligné et stable.\nAccompagnant : Et de quoi ça dépend, de les enlever ou pas ?\nPraticien : De plusieurs choses. D abord, la quantité de place qui manque exactement en millimètres. Ensuite, la position des incisives. Si elles sont déjà penchées vers l avant, on ne peut pas les avancer davantage pour gagner de la place, sinon les lèvres seraient poussées en avant. Ça, je le verrai sur la radio de profil. Et puis, le profil du visage, la gencive, l épaisseur de l os autour des dents du bas. Il faut tout mettre ensemble pour décider.\nAccompagnant : Je comprends. C est pour ça qu il faut des examens.\nPraticien : Exactement. Pour décider, j ai besoin d un bilan complet. On fera une radio panoramique pour voir toutes les dents et les racines, y compris les dents de sagesse qui sont en formation. Une radio de profil, une téléradiographie pour mesurer la position des incisives et des mâchoires. Des photos du visage et des dents. Et une empreinte numérique des dents avec une caméra. Sur l empreinte, je pourrai mesurer la place disponible et la place nécessaire, dent par dent, et même simuler le résultat sur l ordinateur.\nPatient : Je pourrais voir à quoi ressembleront les dents après ?\nPraticien : Oui, on pourra faire une simulation. C est une estimation, ce n est pas une promesse exacte, mais ça donne une bonne idée. Hein ?\nPatient : Mais il y a un seul sens.\nAccompagnant : Et pour l appareil, ce sera quoi ? Des bagues, comme moi ?\nPraticien : Avec un encombrement comme celui-là et une canine aussi haute, le traitement le plus fiable, c est un appareil fixe avec des brackets collés sur toutes les dents, ce qu on appelle un appareil multi-attaches. C est le plus efficace pour faire descendre une canine et tourner les dents. Il existe des brackets en métal et des brackets en céramique de la couleur des dents qui se voient moins. C est une bonne question. Les gouttières transparentes, les aligneurs, marchent très bien pour des cas simples ou modérés. Pour ta canine aussi haute, c est plus difficile. Et s il faut retirer des dents, c est encore plus compliqué avec des gouttières. Je ne dis pas non, mais je te dirai honnêtement au bilan si c est possible ou pas dans ton cas. Pour l allergie au nickel, si on fait un appareil fixe, on choisira des brackets et des fils sans nickel ou en céramique. Ça existe, ce n est pas un problème.\nAccompagnant : Très bien. Et ça durerait combien de temps, à peu près ?\nPraticien : Pour un encombrement de ce type, comptez entre 18 mois et 2 ans d appareil. S il y a des extractions, plutôt vers 2 ans. Ensuite, il y a toujours une contention pour garder le résultat. Un petit fil collé derrière les dents de devant et une gouttière à porter la nuit.\nAccompagnant : D accord, et pour le prix et la sécurité sociale ?\nPraticien : Manon a 12 ans, donc elle peut bénéficier de la prise en charge de l assurance maladie à condition de commencer le traitement avant ses 16 ans. On fait une demande d entente préalable. Le traitement est découpé en semestres. Au bilan, je vous remettrai un devis détaillé avec le nombre de semestres prévus et le prix par semestre et le supplément éventuel pour la céramique. Vous pourrez l envoyer à votre mutuelle.\nAccompagnant : Parfait. Je vais m en occuper.\nPraticien : C est normal. Pour la gencive, Manon, en attendant le bilan, je te donne une mission. Je voudrais que tu te brosses les dents matin et soir, deux minutes, en insistant sur le bas, derrière les dents de devant, et que tu prennes rendez-vous chez votre dentiste pour un détartrage. Il faut que les gencives soient en bonne santé avant de poser un appareil.\nPatient : Sur les dents du bas, d accord.\nPraticien : Tu peux utiliser des petites brossettes entre les dents, aussi. Tu verras, si tu le fais bien, dans deux semaines, ça ne saignera plus. Tu me montreras au bilan.\nPatient : Merci, je vais le faire.\nAccompagnant : Et pour la canine, il n y a rien d urgent ? Elle ne risque pas d abîmer quelque chose ?\nPraticien : Non, rien d urgent. Elle est sortie, elle est visible. Elle ne pousse pas sur les racines des autres dents. Elle va rester là en attendant le traitement. Par contre, il ne faut pas attendre des années, parce que plus elle reste tôt, plus la gencive autour risque d être fine. Mais quelques semaines, ce n est pas un problème.\nAccompagnant : D accord, ça me rassure.\nPraticien : Bon, pour la suite, on fait les radios maintenant, si vous avez le temps. La panoramique et la radio de profil, ça prend 10 minutes. Ensuite, la secrétaire vous donne le rendez-vous de bilan d ici trois semaines. Ce jour-là, on commencera par les photos et l empreinte, puis on regardera tout ensemble : les mesures, la simulation, la décision pour les extractions, le type d appareil et le devis.\nAccompagnant : Très bien. Sa mère voudra sûrement venir pour le bilan.\nPraticien : Avec plaisir, c est même mieux que les deux parents soient là, puisqu il y aura des décisions à prendre. Manon, tu as des questions ?\nPatient : Est-ce que ça fait mal, les bagues ?\nPraticien : La pose, non. On colle les brackets. C est un peu long, mais ça ne fait pas mal. Après, les deux ou trois premiers jours, tu sentiras que les dents serrent et elles seront sensibles quand tu mâches. Après, ça passe. Et à chaque rendez-vous de réglage, ça peut serrer à nouveau un jour ou deux. Mais ce n est jamais une vraie douleur, plutôt une gêne.\nPatient : Et je pourrais choisir les couleurs des élastiques ?\nPraticien : Si tu prends des brackets métalliques, oui, il y a toutes les couleurs. Avec la céramique, on prend plutôt des élastiques transparents ou blancs pour que ça se voit moins. Tu réfléchis d ici le bilan.\nPatient : Je vais réfléchir.\nAccompagnant : Merci beaucoup, docteur. On est rassurés.\nPraticien : Je vous en prie. Manon, tu suis l assistante pour la radio. À dans trois semaines pour le bilan.\nPatient : D accord, on y va.\nPraticien : Antécédents paternels d encombrement traité avec extraction de 4 prémolaires. Examen du visage : profil harmonieux, lèvres jointes au repos. Examen en bouche : dentures permanentes, 23 en position haute et vestibulaire hors de l arcade, 22 en retrait côté palais, rotation de 32 et 42. Tartre et gingivite derrière les incisives du bas. Classe molaire des deux côtés, recouvrement d environ 3 mm, milieu supérieur dévié à gauche. Encombrement estimé à environ 7 mm en haut et 5 mm en bas. Articulation de la mâchoire normale. Diagnostic : encombrement dentaire important en classe I avec 23 hors de l arcade. Indication probable d un appareil multi-attaches avec ou sans extraction de prémolaires. Décision au bilan. Prévoir un matériel sans nickel. Conseil d hygiène, détartrage à faire chez le dentiste. Examens à réaliser ce jour : radio panoramique et téléradiographie de profil. Prochain rendez-vous : bilan orthodontique dans 3 semaines, avec photos, empreinte numérique, simulation, présentation du plan de traitement et du devis, en présence des deux parents si possible.","context":null,"form_id":"consultation_orthodontie","summary":"Consultation pour Manon, 12 ans, présentant un encombrement dentaire important. L examen clinique révèle une canine supérieure gauche (23) sortie en position haute et vestibulaire, une incisive latérale gauche (22) en retrait et un chevauchement des incisives inférieures (32, 42). L occlusion est en classe I avec un recouvrement de 3 mm. Une gingivite liée au tartre est notée sur le secteur inférieur. Des radiographies (panoramique et profil) sont réalisées ce jour. Un bilan complet est prévu dans trois semaines pour définir le plan de traitement (appareil multi-attaches, avec ou sans extractions de prémolaires) et le choix du matériau en raison d allergies à la pénicilline et au nickel.","fields":{"motifConsultation":"Encombrement dentaire, notamment une canine supérieure gauche sortie très haut.","allergies":"Pénicilline, nickel","commentaireClinique":"Visage équilibré, profil harmonieux, lèvres jointes au repos. Denture permanente. Canine 23 en position haute et vestibulaire hors de l arcade. Incisive 22 en retrait côté palais. Rotation des 32 et 42. Présence de tartre et gingivite derrière les incisives inférieures. Occlusion en classe I bilatérale. Recouvrement incisif d environ 3 mm. Milieu supérieur dévié à gauche. Encombrement estimé à 7 mm en haut et 5 mm en bas. ATM sans bruit ni douleur. Radiographies panoramique et de profil réalisées ce jour.","prochainCommentaireClinique":"Prévoir bilan avec photos, empreinte numérique, simulation, mesures précises de l encombrement et analyse de la position des incisives sur radio de profil pour décider d éventuelles extractions.","diagnosticSquelettique":"Mâchoires bien placées l une par rapport à l autre","diagnosticDentaire":"Encombrement dentaire important en haut et en bas, classe I","diagnosticFonctionnel":"ATM normale, antécédent de tétine jusqu à 2 ans et demi","diagnosticAlveolaire":"Encombrement incisif supérieur et inférieur, canine 23 hors arcade, incisive 22 en retrait","planTraitement":"Appareil fixe multi-attaches (brackets métal ou céramique sans nickel), durée estimée entre 18 mois et 2 ans. Discussion sur l extraction de prémolaires à venir. Contention finale par fil collé et gouttière nocturne.","objectifTraitement":"Alignement dentaire, repositionnement de la canine 23, correction des rotations et stabilisation de l occlusion.","remarques":"Hérédité paternelle (encombrement traité par extractions). Patient doit effectuer un détartrage chez son dentiste et améliorer son hygiène buccale. Matériel sans nickel impératif.","prochainRendezVous":[{"code":"BIL","libelle":"bilan","delai":"dans 3 semaines"}],"actes":[{"code":"CD / CSD","libelle":"consultation"},{"code":"Z15 / PANO / HBQK002","libelle":"radio panoramique"},{"code":"TO5","libelle":"radio de profil (téléradiographie)"}],"dep":{"anomaliesBasales":{"maxillaire":{"sensSagittal":"","sensTransversal":""},"mandibulaire":{"sensSagittal":"","sensTransversal":""},"sensVertical":""},"anomaliesAlveolaires":{"maxillaire":{"sensSagittal":"retro","sensTransversal":""},"mandibulaire":{"sensSagittal":"retro","sensTransversal":""},"sensVertical":""},"classeDentaireMolaire":{"classe":"Cl. I","precision":""},"classeDentaireCanine":{"classe":"Cl. I","precision":""},"dysharmonieDentoMaxillaire":false,"dysharmonieDentoDentaire":false,"occlusionInversee":{"droite":false,"gauche":false,"anterieure":false},"dentsInclusesOuSurnumeraires":"","malpositions":"","agenesie":"","facteurFonctionnel":"ATM - Chemin de fermeture normal; ATM - Amplitude normale"}},"diagnostics":[{"field":"diagnosticSquelettique","axe":"S","code":"ara138","libelle":"Classe I Squelettique"},{"field":"diagnosticDentaire","axe":"D","code":"ara069","libelle":"Classe dentaire molaires : classe I"},{"field":"diagnosticFonctionnel","axe":"F","code":"ara125","libelle":"ATM - Chemin de fermeture normal"},{"field":"diagnosticFonctionnel","axe":"F","code":"ara128","libelle":"ATM - Amplitude normale"},{"field":"diagnosticAlveolaire","axe":"A","code":"ara019","libelle":"Encombrement incisif inférieur"},{"field":"diagnosticAlveolaire","axe":"A","code":"ara020","libelle":"Encombrtement incisif supérieur"}],"speakers":[{"label":"Praticien","role":"Praticien (orthodontiste)"},{"label":"Accompagnant","role":"Père du patient"},{"label":"Patient","role":"Patient (Manon)"}],"uncertainties":["Âge de la patiente (mentionné 12 ans dans le résumé final du praticien)","Mesures d encombrement estimées : 7 mm haut, 5 mm bas","Recouvrement incisif : 3 mm","Délai du prochain rendez-vous : 3 semaines","Durée du traitement : 18 mois à 2 ans","Noms propres : Monsieur Lefort, Manon, Docteur Lefebvre, Monsieur Lissy"],"provider":"blackfuel","model":"google/gemma-4-31B-it:eu","meta":{"provider":"blackfuel","model":"google/gemma-4-31B-it:eu","input_tokens":9474,"output_tokens":1185,"time_s":9.6,"calls":1,"notes":[]}}'

	


	openWithParm(w_ia_rapport, lstr_ia_rapport)
else
	MessageBox("Erreur dans la Transcription", ls_err, StopSign!)
end if

end subroutine

public subroutine jouer_son (string as_fichier_son);string ls_string  
ls_string=space(500)  

 if fileExists(as_fichier_son) then
	 
	// Function API Windows
	mcisendstringW('Play "' + as_fichier_son +'"',ls_string,len(ls_string),0)
	
 else
	 
	 Messagebox("ATTENTION", "Impossible de localiser le fichier : " + as_fichier_son)
	 
 end if
end subroutine

public subroutine stopper_son (string as_fichier_ecoute);string ls_ret

ls_ret = space(255)

mciSendString('stop "' + as_fichier_ecoute + '"', ls_ret, 255, 0)
mciSendString('close "' + as_fichier_ecoute + '"', ls_ret, 255, 0)   // libère le fichier
end subroutine

on w_ia_vocale.create
int iCurrent
call super::create
this.cb_demarrer=create cb_demarrer
this.cb_arreter=create cb_arreter
this.st_statut=create st_statut
this.st_timer=create st_timer
this.cb_traiter=create cb_traiter
this.uo_1=create uo_1
this.rb_mp3=create rb_mp3
this.rb_wav=create rb_wav
this.cb_pause=create cb_pause
this.sle_fichier_a_importer=create sle_fichier_a_importer
this.pb_fichier_a_importer=create pb_fichier_a_importer
this.cb_traiter_import=create cb_traiter_import
this.st_status_magic_lemp=create st_status_magic_lemp
this.st_nom=create st_nom
this.pb_ecouter_existant=create pb_ecouter_existant
this.cb_ecouter=create cb_ecouter
this.pb_stopper_existant=create pb_stopper_existant
this.cb_stopper=create cb_stopper
this.gb_1=create gb_1
this.gb_nouveau=create gb_nouveau
this.gb_existant=create gb_existant
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_demarrer
this.Control[iCurrent+2]=this.cb_arreter
this.Control[iCurrent+3]=this.st_statut
this.Control[iCurrent+4]=this.st_timer
this.Control[iCurrent+5]=this.cb_traiter
this.Control[iCurrent+6]=this.uo_1
this.Control[iCurrent+7]=this.rb_mp3
this.Control[iCurrent+8]=this.rb_wav
this.Control[iCurrent+9]=this.cb_pause
this.Control[iCurrent+10]=this.sle_fichier_a_importer
this.Control[iCurrent+11]=this.pb_fichier_a_importer
this.Control[iCurrent+12]=this.cb_traiter_import
this.Control[iCurrent+13]=this.st_status_magic_lemp
this.Control[iCurrent+14]=this.st_nom
this.Control[iCurrent+15]=this.pb_ecouter_existant
this.Control[iCurrent+16]=this.cb_ecouter
this.Control[iCurrent+17]=this.pb_stopper_existant
this.Control[iCurrent+18]=this.cb_stopper
this.Control[iCurrent+19]=this.gb_1
this.Control[iCurrent+20]=this.gb_nouveau
this.Control[iCurrent+21]=this.gb_existant
end on

on w_ia_vocale.destroy
call super::destroy
destroy(this.cb_demarrer)
destroy(this.cb_arreter)
destroy(this.st_statut)
destroy(this.st_timer)
destroy(this.cb_traiter)
destroy(this.uo_1)
destroy(this.rb_mp3)
destroy(this.rb_wav)
destroy(this.cb_pause)
destroy(this.sle_fichier_a_importer)
destroy(this.pb_fichier_a_importer)
destroy(this.cb_traiter_import)
destroy(this.st_status_magic_lemp)
destroy(this.st_nom)
destroy(this.pb_ecouter_existant)
destroy(this.cb_ecouter)
destroy(this.pb_stopper_existant)
destroy(this.cb_stopper)
destroy(this.gb_1)
destroy(this.gb_nouveau)
destroy(this.gb_existant)
end on

event timer;call super::timer;DateTime ldtm_end
Time lt_elapsed
Long ll_total_seconds, ll_hours, ll_minutes, ll_seconds
String ls_formatted_time

// 1. Capture l'heure de fin
ldtm_end = DateTime(Today(), Now())

// 2. Calcule le total de secondes écoulées
ll_total_seconds = SecondsAfter(Time(idtm_start), Time(ldtm_end))

// Prise en compte du passage à minuit si le chrono dépasse minuit le même jour ou sur plusieurs jours
IF Date(ldtm_end) > Date(idtm_start) THEN
	ll_total_seconds = ll_total_seconds + DaysAfter(Date(idtm_start), Date(ldtm_end)) * 86400
END IF

// 3. Convertit les secondes en heures, minutes et secondes
ll_hours   = (il_total_seconds_complet + ll_total_seconds) / 3600
ll_minutes = Mod(il_total_seconds_complet + ll_total_seconds, 3600) / 60
ll_seconds = Mod(il_total_seconds_complet + ll_total_seconds, 60)

// 4. Formate au format HH:MM:SS avec zéros d'appoint
ls_formatted_time = String(ll_hours, "00") + ":" + &
                    String(ll_minutes, "00") + ":" + &
                    String(ll_seconds, "00")

// 5. Affiche le résultat dans le StaticText
st_timer.Text = ls_formatted_time
end event

event open;call super::open;
// patient passé en paramètre
var_code_locale = message.doubleparm

// Jeton : c59be6ae162bbf30ae16c70e26676be37eb750b380865a36

uo_1.taille(this)

inca_DragDrop.BeginDragDrop( sle_fichier_a_importer )

inca_DragDrop.BeginDragDrop( gb_existant )

// nouveaux fichiers audio
is_wav_path = dir_ini + "OTK_mon_enregistrement.wav"
is_mp3_path = dir_ini + "OTK_mon_enregistrement.mp3"

FileDelete(is_wav_path)
FileDelete(is_mp3_path)

// format de fichier par defaut
if profilestring(dir_ini+inifile_orthokis,"IA","format_fichier_vocal","M") = "W" then
	rb_mp3.checked = true 
else
	rb_wav.checked = true
end if


end event

event resize;call super::resize;

uo_1.retaille(this)



pb_fichier_a_importer.x = sle_fichier_a_importer.x + sle_fichier_a_importer.width + 100
pb_ecouter_existant.x = pb_fichier_a_importer.x + pb_fichier_a_importer.width + 100
pb_stopper_existant.x =  pb_ecouter_existant.x + pb_ecouter_existant.width + 100


st_timer.x = st_statut.x +  st_timer.width / 2 



end event

event close;call super::close;
// format de fichier par defaut
if rb_mp3.checked then 
	Setprofilestring(dir_ini+inifile_orthokis,"IA","format_fichier_vocal","M") 
else
	Setprofilestring(dir_ini+inifile_orthokis,"IA","format_fichier_vocal","W") 
end if

// On stoppe les écoutes par priorité à a fermeture
stopper_son(is_wav_path)
stopper_son(sle_fichier_a_importer.text)
end event

type p_fond from w_fenetre_arakis`p_fond within w_ia_vocale
integer y = 652
end type

type cb_demarrer from uo_picturebutton_390x120 within w_ia_vocale
integer x = 480
integer y = 236
integer width = 539
integer taborder = 20
boolean bringtotop = true
string text = "Démarrer"
string tiptext = "Lance l~'enregistrement"
string iconname = "actions_executer.png"
end type

event clicked;call super::clicked;String ls_return, ls_command
uLong lul_rc

// 1. Ouvrir le périphérique d'capture audio WAVEAUDIO
ls_command = "open new type waveaudio alias voice_rec"
lul_rc = mciSendString(ls_command, ls_return, 0, 0)

IF lul_rc <> 0 THEN
	MessageBox("Erreur", "Impossible d'ouvrir le périphérique d'enregistrement audio.")
	RETURN
END IF

cb_traiter.enabled(false)
cb_pause.enabled(true)
cb_ecouter.enabled(false)

// Suppression des fichiers temporaires
FileDelete(is_wav_path)
FileDelete(is_mp3_path)

// 2. Configurer la qualité sonore (ex: 44.1 kHz, 16-bit, Stéréo)
//mciSendString("set voice_rec time format ms", ls_return, 0, 0)
//mciSendString("set voice_rec bitspersample 16", ls_return, 0, 0)
//mciSendString("set voice_rec samplespersec 44100", ls_return, 0, 0)
//mciSendString("set voice_rec channels 2", ls_return, 0, 0)


mciSendString("set voice_rec bitspersample 16", ls_return, 0, 0)
mciSendString("set voice_rec samplespersec 16000", ls_return, 0, 0)
mciSendString("set voice_rec channels 1", ls_return, 0, 0)
mciSendString("set voice_rec bytespersec 32000", ls_return, 0, 0)
mciSendString("set voice_rec alignment 2", ls_return, 0, 0)



// 3. Lancer l'enregistrement
ls_command = "record voice_rec"
lul_rc = mciSendString(ls_command, ls_return, 0, 0)

IF lul_rc = 0 THEN
	st_statut.visible = true
	st_statut.text = "Enregistrement en cours ..."
	st_timer.visible = true
	il_total_seconds_complet = 0
	// Enregistre la date et l'heure actuelles
	idtm_start = DateTime(Today(), Now())
	cb_arreter.enabled(true)
	this.enabled(false)
	timer(1)
ELSE
	MessageBox("Erreur", "Échec du démarrage de l'enregistrement.")
END IF



end event

type cb_arreter from uo_picturebutton_390x120 within w_ia_vocale
integer x = 1751
integer y = 236
integer width = 539
integer taborder = 30
boolean bringtotop = true
boolean enabled = false
string text = "Arrêter"
string tiptext = "Stoppe l~'enregistrement"
string iconname = "actions_abandonner.png"
end type

event clicked;call super::clicked;String ls_return, ls_command
uLong lul_rc
string ls_commande

//if ls_wav_path


// l'enregistrement se fait obligatoirement en Wav ... on convertit plus tard si besoin


// 1. Arrêter l'enregistrement
mciSendString("stop voice_rec", ls_return, 0, 0)

// 2. Sauvegarder le fichier audio sur le disque
ls_command = 'save voice_rec "' + is_wav_path + '"'
lul_rc = mciSendString(ls_command, ls_return, 0, 0)

// 3. Fermer le périphérique MCI
mciSendString("close voice_rec", ls_return, 0, 0)

cb_demarrer.enabled(true)
this.enabled(false)
cb_ecouter.enabled(true)

st_timer.visible = false
timer(0)

IF lul_rc = 0 THEN
	
	if rb_mp3.checked then 

		st_statut.text = "Conversion en mp3 ... Veuillez patienter ... "
		yield()
		ls_commande = 'lame.exe -b 32 --resample 16 -m m "' + is_wav_path + '" "' + is_mp3_path + '"'
		runwait (ls_commande, 1)

		MessageBox("INFORMATION", "Enregistrement sauvegardé : " + is_mp3_path)
	else
		MessageBox("INFORMATION", "Enregistrement sauvegardé : " + is_wav_path)
	end if

	
	cb_traiter.enabled(true)
	cb_ecouter.enabled(true)
ELSE
	MessageBox("ARRENTION", "Impossible de sauvegarder le fichier audio !")
END IF

st_statut.visible = false
end event

type st_statut from statictext within w_ia_vocale
boolean visible = false
integer x = 859
integer y = 520
integer width = 2441
integer height = 112
boolean bringtotop = true
integer textsize = -14
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 65535
alignment alignment = center!
boolean focusrectangle = false
end type

type st_timer from statictext within w_ia_vocale
boolean visible = false
integer x = 1691
integer y = 652
integer width = 782
integer height = 112
boolean bringtotop = true
integer textsize = -14
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 65535
alignment alignment = center!
boolean focusrectangle = false
end type

type cb_traiter from uo_picturebutton_390x120 within w_ia_vocale
integer x = 1490
integer y = 872
integer width = 539
integer taborder = 40
boolean bringtotop = true
boolean enabled = false
string text = "Traiter"
string tiptext = "Stoppe l~'enregistrement"
string iconname = "imageeditor_effects.png"
end type

event clicked;call super::clicked;traiter("c:\power\ortho\mon_enregistrement.wav")



end event

type uo_1 from resize_fenetre within w_ia_vocale
boolean visible = false
integer x = 2606
integer y = 1376
integer taborder = 10
boolean bringtotop = true
end type

on uo_1.destroy
call resize_fenetre::destroy
end on

type rb_mp3 from radiobutton within w_ia_vocale
integer x = 2693
integer y = 884
integer width = 325
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 553648127
string text = "Mp3"
end type

type rb_wav from radiobutton within w_ia_vocale
integer x = 2939
integer y = 884
integer width = 325
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 553648127
string text = "Wav"
end type

type cb_pause from uo_picturebutton_390x120 within w_ia_vocale
integer x = 1115
integer y = 236
integer width = 539
integer taborder = 40
boolean bringtotop = true
boolean enabled = false
string text = "Pause"
string tiptext = "Stoppe l~'enregistrement"
string iconname = "ACTIONS_pause.png"
end type

event clicked;call super::clicked;String ls_return
uLong lul_rc

ls_return = Space(255)

IF this.Text = "Pause" THEN
	// 1. Mettre en pause l'enregistrement
	lul_rc = mciSendString("pause voice_rec", ls_return, 255, 0)
	
	IF lul_rc = 0 THEN
		Timer(0) // Stopper le rafraîchissement du chrono
		st_statut.Text = "Enregistrement en pause ..."
		this.iconname("actions_executer.png")
		this.Text = "Reprendre"
	ELSE
		MessageBox("Erreur", "Impossible de mettre en pause.")
	END IF
	il_total_seconds_complet = il_total_seconds_complet + SecondsAfter(Time(idtm_start), Time(now()))
ELSE
	// 2. Reprendre l'enregistrement
	lul_rc = mciSendString("resume voice_rec", ls_return, 255, 0)
	
	IF lul_rc = 0 THEN
		// Nouveau départ
		idtm_start = DateTime(Today(), Now())
		Timer(1) // Relancer le timer
		st_statut.Text = "Enregistrement en cours ..."
		this.Text = "Pause"
		this.iconname("ACTIONS_pause.png")

	ELSE
		MessageBox("Erreur", "Impossible de reprendre l'enregistrement.")
	END IF
END IF
end event

type sle_fichier_a_importer from singlelineedit within w_ia_vocale
event ue_dropfiles pbm_dropfiles
integer x = 425
integer y = 1348
integer width = 2889
integer height = 104
integer taborder = 40
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
borderstyle borderstyle = stylelowered!
end type

event ue_dropfiles;string ls_file
ulong lu_len
ulong lul_hDrop

// Le handle du fichier déposé est passé via le paramètre wparam
lul_hDrop = handle

// 1. Obtenir la taille du chemin du fichier (iFile = 0, buffer = null)
lu_len = DragQueryFile(lul_hDrop, 0, ls_file, 0)

IF lu_len > 0 THEN
    // 2. Allouer un buffer suffisamment grand pour récupérer le chemin complet
    ls_file = Space(lu_len + 1)
    
    // 3. Récupérer le chemin du fichier
    DragQueryFile(lul_hDrop, 0, ls_file, lu_len + 1)
    
    // 4. Assigner le chemin au SingleLineEdit
    this.text = Trim(ls_file)
END IF

// 5. Libérer la mémoire
DragFinish(lul_hDrop)

// vérification du fichier ...
if this.text <> "" then 
	ls_file = Trim(ls_file) 
	if right(ls_file, 3) <> "mp3" and  right(ls_file, 3) <> "wav" then
		Messagebox("ATTENTION", "Vous devez glisser / déposer un fichier vocal au format mp3 ou un fichier wav !")
		this.text = ""
	end if
	
end if


if upper(right(this.text,3)) = "MP3" or upper(right(this.text,3)) = "WAV" then 
	cb_traiter_import.enabled(true)
else
	cb_traiter_import.enabled(false)
end if

RETURN 0
end event

event modified;

if upper(right(this.text,3)) = "MP3" or upper(right(this.text,3)) = "WAV" then 
	cb_traiter_import.enabled(true)
else
	cb_traiter_import.enabled(false)
end if
end event

event losefocus;

if upper(right(this.text,3)) = "MP3" or upper(right(this.text,3)) = "WAV" then 
	cb_traiter_import.enabled(true)
else
	cb_traiter_import.enabled(false)
end if

end event

type pb_fichier_a_importer from picturebutton within w_ia_vocale
integer x = 3342
integer y = 1348
integer width = 151
integer height = 128
integer taborder = 30
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "lc_explorer.png"
alignment htextalign = left!
string powertiptext = "Permet de sélectionner le fichier vocal à traiter"
long backcolor = 553648127
end type

event clicked;
string ficname,ficpath

if GetFileOpenName("Fichiers Son",ficname,ficpath,"WAV","Fichiers Sons (*.wav; *.mp3), *.wav ; *.mp3") = 1 then
	sle_fichier_a_importer.text = ficname
	cb_traiter_import.enabled(true)
end if
end event

type cb_traiter_import from uo_picturebutton_390x120 within w_ia_vocale
integer x = 1490
integer y = 1576
integer width = 539
integer taborder = 50
boolean bringtotop = true
boolean enabled = false
string text = "Traiter"
string tiptext = "Stoppe l~'enregistrement"
string iconname = "imageeditor_effects.png"
end type

event clicked;call super::clicked;traiter(sle_fichier_a_importer.text)
end event

type st_status_magic_lemp from statictext within w_ia_vocale
boolean visible = false
integer x = 69
integer y = 1848
integer width = 3909
integer height = 112
boolean bringtotop = true
integer textsize = -14
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 65535
alignment alignment = center!
boolean focusrectangle = false
end type

type st_nom from statictext within w_ia_vocale
integer x = 434
integer y = 1488
integer width = 2011
integer height = 64
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean italic = true
long textcolor = 16711680
long backcolor = 553648127
string text = "Vous pouvez utiliser le glisser / déposer pour choisir le fichier à traiter"
boolean focusrectangle = false
end type

type pb_ecouter_existant from picturebutton within w_ia_vocale
integer x = 3520
integer y = 1348
integer width = 151
integer height = 128
integer taborder = 40
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "lc_sons.png"
alignment htextalign = left!
long backcolor = 553648127
end type

event clicked;
jouer_son(sle_fichier_a_importer.text)

end event

type cb_ecouter from uo_picturebutton_390x120 within w_ia_vocale
integer x = 2386
integer y = 236
integer width = 539
integer taborder = 40
boolean bringtotop = true
boolean enabled = false
string text = "Ecouter"
string tiptext = "Stoppe l~'enregistrement"
string iconname = "lc_sons.png"
end type

event clicked;call super::clicked;jouer_son(is_wav_path)
cb_stopper.enabled(true)
end event

type pb_stopper_existant from picturebutton within w_ia_vocale
integer x = 3698
integer y = 1348
integer width = 151
integer height = 128
integer taborder = 50
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "lc_sons_barre.png"
alignment htextalign = left!
long backcolor = 553648127
end type

event clicked;

stopper_son(sle_fichier_a_importer.text)
end event

type cb_stopper from uo_picturebutton_390x120 within w_ia_vocale
integer x = 3022
integer y = 236
integer width = 539
integer taborder = 50
boolean bringtotop = true
boolean enabled = false
string text = "Stopper"
string tiptext = "Stoppe l~'enregistrement"
string iconname = "lc_sons_barre.png"
end type

event clicked;call super::clicked;
stopper_son(is_wav_path)
cb_stopper.enabled(false)
end event

type gb_1 from groupbox within w_ia_vocale
integer x = 2606
integer y = 768
integer width = 704
integer height = 260
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean italic = true
long textcolor = 33554432
long backcolor = 553648127
string text = "Format du fichier"
end type

type gb_nouveau from groupbox within w_ia_vocale
integer x = 357
integer y = 64
integer width = 3534
integer height = 1076
integer taborder = 30
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean italic = true
long textcolor = 33554432
long backcolor = 553648127
string text = "Nouvel enregistrement"
end type

type gb_existant from groupbox within w_ia_vocale
event uo_dropfiles pbm_dropfiles
integer x = 357
integer y = 1260
integer width = 3534
integer height = 528
integer taborder = 40
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean italic = true
long textcolor = 33554432
long backcolor = 553648127
string text = "Enregistrement existant"
end type

event uo_dropfiles;string ls_file
ulong lu_len
ulong lul_hDrop

// Le handle du fichier déposé est passé via le paramètre wparam
lul_hDrop = handle

// 1. Obtenir la taille du chemin du fichier (iFile = 0, buffer = null)
lu_len = DragQueryFile(lul_hDrop, 0, ls_file, 0)

IF lu_len > 0 THEN
    // 2. Allouer un buffer suffisamment grand pour récupérer le chemin complet
    ls_file = Space(lu_len + 1)
    
    // 3. Récupérer le chemin du fichier
    DragQueryFile(lul_hDrop, 0, ls_file, lu_len + 1)
    
    // 4. Assigner le chemin au SingleLineEdit
    sle_fichier_a_importer.text = Trim(ls_file)
END IF

// 5. Libérer la mémoire
DragFinish(lul_hDrop)

// vérification du fichier ...
if this.text <> "" then 
	ls_file = Trim(ls_file) 
	if right(ls_file, 3) <> "mp3" and  right(ls_file, 3) <> "wav" then
		Messagebox("ATTENTION", "Vous devez glisser / déposer un fichier vocal au format mp3 ou un fichier wav !")
		this.text = ""
	end if
	
end if


if upper(right(sle_fichier_a_importer.text,3)) = "MP3" or upper(right(sle_fichier_a_importer.text,3)) = "WAV" then 
	cb_traiter_import.enabled(true)
else
	cb_traiter_import.enabled(false)
end if

RETURN 0
end event

