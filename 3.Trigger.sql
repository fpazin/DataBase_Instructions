-- select * from cliente
Insert into Cliente values('Fabio', 'palmas', '999999999')

update Cliente
set nome = 'Marcos'
where codCliente = 6


/*
INSERTED
codCliente | nome	|	cidade		| telefone
5			'Marcos'	'palmas'	'999999999'

DELETED
codCliente | nome	|	cidade		| telefone
5			'fabio'		'palmas'	'999999999'


CREATE TRIGGER exemplo1
ON Cliente
FOR INSERT, DELETE, UPDATE 
AS
BEGIN
	IF (SELECT COUNT (*) FROM INSERTED) = 1 AND (SELECT COUNT (*) FROM DELETED) = 1
		 PRINT 'O registro foi atualizado!';
	ELSE 
		IF (SELECT COUNT (*) FROM DELETED) = 1
			PRINT 'O registro foi excluído!'; 
		ELSE
			PRINT 'O registro foi inserido'; 
END
*/

create TRIGGER exemplo3
ON Conta
FOR UPDATE, INSERT, DELETE 
AS
BEGIN
	IF (SELECT COUNT (*) FROM DELETED) <> 0
	BEGIN
		PRINT 'Conteúdo da DELETED';
		declare @cod int
		SET @cod = (SELECT codCliente FROM DELETED);
		delete from Cliente where codCliente = @cod;
	END
	IF (SELECT COUNT (*) FROM INSERTED) <> 0
	BEGIN
		PRINT 'Conteúdo da INSERTED';
		SELECT * FROM INSERTED; 
	END
END


select * from clienteUnificado

delete cliente where codCliente = 2