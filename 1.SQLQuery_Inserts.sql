GO
	CREATE DATABASE SQLServer_Tests;
GO
USE SQLServer_Tests;

create table Cliente (cod_cliente int IDENTITY (1,1) PRIMARY KEY, 
					nome varchar(255), 
					cidade varchar(255), 			
					);

create table Conta (cod_conta int IDENTITY (1,1) PRIMARY KEY, 
					agencia int , 
					numero int , 
					saldo float, 
					cod_cliente int FOREIGN KEY	REFERENCES Cliente(cod_cliente), 
					);

create table Emprestimo (cod_emprestimo int IDENTITY (1,1) PRIMARY KEY, 
						cod_conta int FOREIGN KEY REFERENCES Conta(cod_conta), 
						valor_emprestimo float, 
						quantidade_parcelas int, 
						taxa_juros float, 
						data_emprestimo date, 
						);

create table EmprestimoParcela (cod_parcela int IDENTITY (1,1) PRIMARY KEY, 
								cod_emprestimo int FOREIGN KEY REFERENCES Emprestimo(cod_emprestimo), 
								valor_parcela float, 
								valor_pago float, 
								data_vencimento date, 
								data_pagamento date, 
								); 

---------------------------------------------------------------------------------------------------------------------------

alter table Cliente add Telefone varchar(255)

---------------------------------------------------------------------------------------------------------------------------

set identity_insert Cliente on

insert into Cliente (cod_cliente,nome,cidade) values (1,'Augusto Martins','Palmas');
insert into Cliente (cod_cliente,nome,cidade) values (2,'Betania Ana','Aracaju');
insert into Cliente (cod_cliente,nome,cidade) values (3,'Carlos Cavalcanti','Maringa');
insert into Cliente (cod_cliente,nome,cidade) values (4,'Danila Dante','Belo Horizonte');
insert into Cliente (cod_cliente,nome,cidade) values (5,'Estiven Cigau','São Paulo');
insert into Cliente (cod_cliente,nome,cidade) values (6,'Fernando Faltre','Rio de Janeiro');
insert into Cliente (cod_cliente,nome,cidade) values (7,'Guga Gago','Goiás');
insert into Cliente (cod_cliente,nome,cidade) values (8,'Helivelton','Distrito Federal');
insert into Cliente (cod_cliente,nome,cidade) values (9,'Italo Xico','Recife');
insert into Cliente (cod_cliente,nome,cidade) values (10,'Joama da Silva','Maceió');

set identity_insert Cliente off

---------------------------------------------------------------------------------------------------------------------------

set identity_insert Conta on

insert into Conta (cod_conta,agencia,numero,saldo,cod_cliente) values(1,5,1,7767,1);
insert into Conta (cod_conta,agencia,numero,saldo,cod_cliente) values(2,10,1,6657,2);
insert into Conta (cod_conta,agencia,numero,saldo,cod_cliente) values(3,15,1,9921,3);
insert into Conta (cod_conta,agencia,numero,saldo,cod_cliente) values(4,20,1,1486,4);
insert into Conta (cod_conta,agencia,numero,saldo,cod_cliente) values(5,25,1,138,5);
insert into Conta (cod_conta,agencia,numero,saldo,cod_cliente) values(6,30,1,6695,6);
insert into Conta (cod_conta,agencia,numero,saldo,cod_cliente) values(7,35,1,1093,7);
insert into Conta (cod_conta,agencia,numero,saldo,cod_cliente) values(8,40,1,2915,8);
insert into Conta (cod_conta,agencia,numero,saldo,cod_cliente) values(9,45,1,8833,9);
insert into Conta (cod_conta,agencia,numero,saldo,cod_cliente) values(10,50,1,7026,10);

set identity_insert Conta off

---------------------------------------------------------------------------------------------------------------------------

set identity_insert Emprestimo on

insert into Emprestimo (cod_emprestimo,cod_conta,valor_emprestimo,quantidade_parcelas,taxa_juros,data_emprestimo) values(1,1,7125,2,2,'01/06/2020');
insert into Emprestimo (cod_emprestimo,cod_conta,valor_emprestimo,quantidade_parcelas,taxa_juros,data_emprestimo) values(2,2,7392,1,1,'01/08/2020');
insert into Emprestimo (cod_emprestimo,cod_conta,valor_emprestimo,quantidade_parcelas,taxa_juros,data_emprestimo) values(3,3,423,9,1,'03/04/2020');
insert into Emprestimo (cod_emprestimo,cod_conta,valor_emprestimo,quantidade_parcelas,taxa_juros,data_emprestimo) values(4,4,5780,5,2,'05/05/2020');
insert into Emprestimo (cod_emprestimo,cod_conta,valor_emprestimo,quantidade_parcelas,taxa_juros,data_emprestimo) values(5,5,2637,8,3,'11/01/2020');
insert into Emprestimo (cod_emprestimo,cod_conta,valor_emprestimo,quantidade_parcelas,taxa_juros,data_emprestimo) values(6,6,371,9,1,'02/02/2020');
insert into Emprestimo (cod_emprestimo,cod_conta,valor_emprestimo,quantidade_parcelas,taxa_juros,data_emprestimo) values(7,7,1263,7,2,'04/06/2020');
insert into Emprestimo (cod_emprestimo,cod_conta,valor_emprestimo,quantidade_parcelas,taxa_juros,data_emprestimo) values(8,8,2271,7,2,'01/05/2020');
insert into Emprestimo (cod_emprestimo,cod_conta,valor_emprestimo,quantidade_parcelas,taxa_juros,data_emprestimo) values(9,9,9049,8,1,'03/07/2020');
insert into Emprestimo (cod_emprestimo,cod_conta,valor_emprestimo,quantidade_parcelas,taxa_juros,data_emprestimo) values(10,10,4454,7,3,'03/08/2020');

set identity_insert Emprestimo off

---------------------------------------------------------------------------------------------------------------------------

set identity_insert EmprestimoParcela on

insert into EmprestimoParcela (cod_parcela,cod_emprestimo,valor_parcela,valor_pago,data_vencimento,data_pagamento) values(1,1,'3562.5','3562.5','07/01/2020','07/05/2020');
insert into EmprestimoParcela (cod_parcela,cod_emprestimo,valor_parcela,valor_pago,data_vencimento,data_pagamento) values(2,1,'3562.5','3562.5','07/31/2020','08/01/2020');
insert into EmprestimoParcela (cod_parcela,cod_emprestimo,valor_parcela,valor_pago,data_vencimento) values(3,2,'7392','0','08/31/2020');
insert into EmprestimoParcela (cod_parcela,cod_emprestimo,valor_parcela,valor_pago,data_vencimento,data_pagamento) values(4,3,'47','47.00','11/03/2019','11/07/2019');
insert into EmprestimoParcela (cod_parcela,cod_emprestimo,valor_parcela,valor_pago,data_vencimento,data_pagamento) values(5,3,'47','47.00','12/02/2019','12/03/2019');
insert into EmprestimoParcela (cod_parcela,cod_emprestimo,valor_parcela,valor_pago,data_vencimento,data_pagamento) values(6,3,'47','47.00','01/02/2020','01/03/2020');
insert into EmprestimoParcela (cod_parcela,cod_emprestimo,valor_parcela,valor_pago,data_vencimento,data_pagamento) values(7,3,'47','47.00','02/01/2020','02/05/2020');
insert into EmprestimoParcela (cod_parcela,cod_emprestimo,valor_parcela,valor_pago,data_vencimento) values(8,3,'47','47.00','03/31/2020');
insert into EmprestimoParcela (cod_parcela,cod_emprestimo,valor_parcela,valor_pago,data_vencimento) values(9,3,'47','47.00','04/30/2020');
insert into EmprestimoParcela (cod_parcela,cod_emprestimo,valor_parcela,valor_pago,data_vencimento) values(10,3,'47','47.00','05/30/2020');
insert into EmprestimoParcela (cod_parcela,cod_emprestimo,valor_parcela,valor_pago,data_vencimento) values(11,3,'47','47.00','06/29/2020');
insert into EmprestimoParcela (cod_parcela,cod_emprestimo,valor_parcela,valor_pago,data_vencimento) values(12,3,'47','0','07/29/2020');
insert into EmprestimoParcela (cod_parcela,cod_emprestimo,valor_parcela,valor_pago,data_vencimento,data_pagamento) values(13,4,'1156','1156','06/04/2020','06/07/2020');
insert into EmprestimoParcela (cod_parcela,cod_emprestimo,valor_parcela,valor_pago,data_vencimento,data_pagamento) values(14,4,'1156','1156','07/04/2020','07/09/2020');
insert into EmprestimoParcela (cod_parcela,cod_emprestimo,valor_parcela,valor_pago,data_vencimento,data_pagamento) values(15,4,'1156','1156','08/03/2020','08/05/2020');
insert into EmprestimoParcela (cod_parcela,cod_emprestimo,valor_parcela,valor_pago,data_vencimento) values(16,4,'1156','0','09/02/2020');
insert into EmprestimoParcela (cod_parcela,cod_emprestimo,valor_parcela,valor_pago,data_vencimento) values(17,4,'1156','0','10/02/2020');
insert into EmprestimoParcela (cod_parcela,cod_emprestimo,valor_parcela,valor_pago,data_vencimento,data_pagamento) values(18,5,'329.625','329.625','02/10/2020','02/14/2020');
insert into EmprestimoParcela (cod_parcela,cod_emprestimo,valor_parcela,valor_pago,data_vencimento,data_pagamento) values(19,5,'329.625','329.625','03/11/2020','03/12/2020');
insert into EmprestimoParcela (cod_parcela,cod_emprestimo,valor_parcela,valor_pago,data_vencimento,data_pagamento) values(20,5,'329.625','329.625','04/10/2020','04/13/2020');
insert into EmprestimoParcela (cod_parcela,cod_emprestimo,valor_parcela,valor_pago,data_vencimento,data_pagamento) values(21,5,'329.625','329.625','05/10/2020','05/12/2020');
insert into EmprestimoParcela (cod_parcela,cod_emprestimo,valor_parcela,valor_pago,data_vencimento,data_pagamento) values(22,5,'329.625','329.625','06/09/2020','06/12/2020');
insert into EmprestimoParcela (cod_parcela,cod_emprestimo,valor_parcela,valor_pago,data_vencimento,data_pagamento) values(23,5,'329.625','329.625','07/09/2020','07/11/2020');
insert into EmprestimoParcela (cod_parcela,cod_emprestimo,valor_parcela,valor_pago,data_vencimento) values(24,5,'329.625','0','08/08/2020');
insert into EmprestimoParcela (cod_parcela,cod_emprestimo,valor_parcela,valor_pago,data_vencimento) values(25,5,'329.625','0','09/07/2020');
insert into EmprestimoParcela (cod_parcela,cod_emprestimo,valor_parcela,valor_pago,data_vencimento,data_pagamento) values(26,6,'41.22','41.22','03/03/2020','03/05/2020');
insert into EmprestimoParcela (cod_parcela,cod_emprestimo,valor_parcela,valor_pago,data_vencimento,data_pagamento) values(27,6,'41.22','41.22','04/02/2020','04/03/2020');
insert into EmprestimoParcela (cod_parcela,cod_emprestimo,valor_parcela,valor_pago,data_vencimento,data_pagamento) values(28,6,'41.22','41.22','05/02/2020','05/06/2020');
insert into EmprestimoParcela (cod_parcela,cod_emprestimo,valor_parcela,valor_pago,data_vencimento,data_pagamento) values(29,6,'41.22','41.22','06/01/2020','06/03/2020');
insert into EmprestimoParcela (cod_parcela,cod_emprestimo,valor_parcela,valor_pago,data_vencimento,data_pagamento) values(30,6,'41.22','41.22','07/01/2020','07/05/2020');
insert into EmprestimoParcela (cod_parcela,cod_emprestimo,valor_parcela,valor_pago,data_vencimento,data_pagamento) values(31,6,'41.22','41.22','07/31/2020','08/01/2020');
insert into EmprestimoParcela (cod_parcela,cod_emprestimo,valor_parcela,valor_pago,data_vencimento) values(32,6,'41.22','0','08/30/2020');
insert into EmprestimoParcela (cod_parcela,cod_emprestimo,valor_parcela,valor_pago,data_vencimento) values(33,6,'41.22','0','09/29/2020');
insert into EmprestimoParcela (cod_parcela,cod_emprestimo,valor_parcela,valor_pago,data_vencimento) values(34,6,'41.22','0','10/29/2020');
insert into EmprestimoParcela (cod_parcela,cod_emprestimo,valor_parcela,valor_pago,data_vencimento,data_pagamento) values(35,7,'180.42','180.43','07/04/2020','07/06/2020');
insert into EmprestimoParcela (cod_parcela,cod_emprestimo,valor_parcela,valor_pago,data_vencimento,data_pagamento) values(36,7,'180.43','180.43','08/03/2020','08/07/2020');
insert into EmprestimoParcela (cod_parcela,cod_emprestimo,valor_parcela,valor_pago,data_vencimento) values(37,7,'180.44','0','09/02/2020');
insert into EmprestimoParcela (cod_parcela,cod_emprestimo,valor_parcela,valor_pago,data_vencimento) values(38,8,'324.42','0','10/02/2020');
insert into EmprestimoParcela (cod_parcela,cod_emprestimo,valor_parcela,valor_pago,data_vencimento) values(39,8,'324.43','0','11/01/2020');
insert into EmprestimoParcela (cod_parcela,cod_emprestimo,valor_parcela,valor_pago,data_vencimento) values(40,8,'324.44','0','12/01/2020');
insert into EmprestimoParcela (cod_parcela,cod_emprestimo,valor_parcela,valor_pago,data_vencimento) values(41,8,'324.45','0','12/31/2020');
insert into EmprestimoParcela (cod_parcela,cod_emprestimo,valor_parcela,valor_pago,data_vencimento,data_pagamento) values(42,9,'1131.12','1131.12','08/02/2020','08/06/2020');
insert into EmprestimoParcela (cod_parcela,cod_emprestimo,valor_parcela,valor_pago,data_vencimento) values(43,9,'1131.12','0','09/01/2020');
insert into EmprestimoParcela (cod_parcela,cod_emprestimo,valor_parcela,valor_pago,data_vencimento) values(44,10,'636.28','0','09/02/2020');
insert into EmprestimoParcela (cod_parcela,cod_emprestimo,valor_parcela,valor_pago,data_vencimento) values(45,10,'636.28','0','10/02/2020');
insert into EmprestimoParcela (cod_parcela,cod_emprestimo,valor_parcela,valor_pago,data_vencimento) values(46,10,'636.28','0','11/01/2020');
insert into EmprestimoParcela (cod_parcela,cod_emprestimo,valor_parcela,valor_pago,data_vencimento) values(47,10,'636.28','0','12/01/2020');
insert into EmprestimoParcela (cod_parcela,cod_emprestimo,valor_parcela,valor_pago,data_vencimento) values(48,10,'636.28','0','12/31/2020');
insert into EmprestimoParcela (cod_parcela,cod_emprestimo,valor_parcela,valor_pago,data_vencimento) values(49,10,'636.28','0','01/30/2021');

set identity_insert EmprestimoParcela off

