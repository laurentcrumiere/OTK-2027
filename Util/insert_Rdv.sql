
insert into rdv (code,rdv,type,code_praticien,duree,fauteuil,absent) 
(SELECT code, days(rdv,7 * 63   ),type,code_praticien,duree,fauteuil,absent from rdv where date(rdv) between date('2004-10-11') 
and date('2004-10-17')) ;
