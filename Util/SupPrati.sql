// Effacement d'un praticien
// Séparation de DONNEES

DELETE FROM affectation_semaine_type 
WHERE praticien = 'ARAKIS' ;

DELETE FROM jours_interdits 
WHERE code_praticien = 'ARAKIS' ;

DELETE FROM diagnos FROM diagnos,patient 
WHERE diagnos.code = patient.code and code_praticien = 'ARAKIS' ;

DELETE FROM coment FROM coment,patient 
WHERE coment.code = patient.code and code_praticien = 'ARAKIS' ;

DELETE FROM paye FROM paye,patient 
WHERE paye.code = patient.code and (patient.code_praticien = 'ARAKIS' or
paye.code_praticien = 'ARAKIS' ) ;

DELETE FROM ligne_soins FROM ligne_soins,patient 
WHERE ligne_soins.code = patient.code and code_praticien = 'ARAKIS' ;

DELETE FROM soins FROM soins,patient 
WHERE soins.code = patient.code and code_praticien = 'ARAKIS' ;

DELETE FROM ligne_soins_prevus FROM ligne_soins_prevus , patient 
WHERE ligne_soins_prevus.code = patient.code and code_praticien = 'ARAKIS' ;

DELETE FROM soins_prevus FROM soins_prevus,patient 
WHERE soins_prevus.code = patient.code and code_praticien = 'ARAKIS' ;

DELETE FROM rdv FROM rdv,patient 
WHERE rdv.code = patient.code and (rdv.code_praticien = 'ARAKIS' or 
patient.code_praticien = 'ARAKIS' ) ;

DELETE FROM historique_editions FROM historique_editions,patient 
WHERE historique_editions.code = patient.code and code_praticien = 'ARAKIS' ;

DELETE FROM semaine_patient FROM semaine_patient , patient 
WHERE semaine_patient.code_patient = patient.code and code_praticien = 'ARAKIS' ;

DELETE FROM historique_traitement FROM historique_traitement , patient 
WHERE historique_traitement.code = patient.code and code_praticien = 'ARAKIS' ;


DELETE FROM histo_dossier FROM histo_dossier , patient 
WHERE histo_dossier.code = patient.code and code_praticien = 'ARAKIS' ;

DELETE FROM patient 
WHERE code_praticien = 'ARAKIS' ;

DELETE FROM prati 
WHERE code = 'ARAKIS' ;
