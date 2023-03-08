create database testando_mover_Dados;

create table os(
	id int primary key auto_increment,
    marca varchar(50),
    modelo varchar(50),
    defeito text,
    solucao text,
    preco float
);

drop table os_finalizada;

select * from os;
select * from os_finalizada;

truncate os_finalizada;

create table os_finalizada(
	id int primary key,
    marca varchar(50),
    modelo varchar(50),
    defeito text,
    solucao text,
    preco float
);

INSERT INTO os_finalizada (id, marca, modelo,defeito,solucao,preco)
SELECT id, marca, modelo,defeito,solucao,preco 
FROM os
WHERE id = 1;

START TRANSACTION;

-- Inserir o registro na tabela de destino
INSERT INTO os_finalizada (id, marca, modelo,defeito,solucao,preco)
SELECT id, marca, modelo,defeito,solucao,preco 
FROM os
WHERE id = 1;

-- Excluir o registro da tabela de origem
DELETE FROM os
WHERE id = 1;

-- Confirmar a transação
COMMIT;