

// Suppression des clefs

alter table param_stock_fournisseur drop primary key ;
alter table stock_produit drop foreign key "param_stock" ;

// Suppression des produits de l ancien praticien
delete from historique_es where code_barre in (select code_barre from stock_produit where code_praticien ='JML') ;
delete from param_stock_produit where code_praticien = 'JML' ;
delete from param_stock_fournisseur where code_praticien = 'JML' ;
delete from stock_produit where code_praticien = 'JML' ;

// Changement de praticien
update param_stock_produit set code_praticien = 'JML' where code_praticien = 'MM';
update param_stock_fournisseur set code_praticien = 'JML' where code_praticien = 'MM';
update stock_produit set code_praticien = 'JML' where code_praticien = 'MM';

// Remise en place des clefs

alter table param_stock_fournisseur add PRIMARY KEY ("code_produit", "code_fournisseur", "code_praticien") ;
alter table stock_produit add FOREIGN KEY "param_stock" ("code_produit", "code_fournisseur", "code_praticien" ) REFERENCES "dba"."param_stock_fournisseur" ON DELETE RESTRICT ;