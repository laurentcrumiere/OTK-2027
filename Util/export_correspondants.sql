
  SELECT (SELECT nom as Titre from titre_personnes where "titre_personnes"."code" =  "correspondants"."titre"),   
         "correspondants"."prenom",   
         "correspondants"."nom",   
         "correspondants"."adr1",   
         "correspondants"."adr2",   
         "correspondants"."codep",   
         "correspondants"."ville",   
         "correspondants"."sexe",   
         "correspondants"."tel",   
         "correspondants"."fax",   
         "correspondants"."email",   
         "correspondants"."relation"  
    FROM "correspondants"  
	ORDER BY "correspondants"."nom" ASC,   
         "correspondants"."prenom" ASC  ;


output to "c:\correspondants.xls" format LOTUS ; 