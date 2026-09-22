// Sauvegarde de la zone
//update patient set lolo = remarques ;


update patient,secu set remarques = lolo +char(13)+ char(10)+'Caisse : '+secu.sec1+' / Mutuelle : '+secu.sec2+ ' / Fin traitement : '+DATEFORMAT(fintrai,'dd/mm/yyyy') 
where patient.code = secu.code;