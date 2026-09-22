delete from code_postaux ;
input into code_postaux from 'c:\insee.csv' delimited by  ';' ;
update code_postaux set code = '0'+code where len(trim(code)) = 4 ;
update code_postaux set code = '39310' where ville = 'LAJOUX' ;
select * from code_postaux  order by code;
