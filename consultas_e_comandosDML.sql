show databases;
use bibliografia;
#SCRIPT PARA LISTAR TODOS OS FILMES E SEUS GENEROS
SELECT *
FROM   filme F
       INNER JOIN filme_has_genero FG
               ON F.id = FG.idfilme
       INNER JOIN genero G
               ON FG.idgenero = G.id;  
               
			
#SCRIPT PARA LISTAR TODOS OS FILMES E SEUS ATORES
SELECT *
FROM   filme F
       INNER JOIN elenco_filme EF
               ON F.id = EF.idfilme
       INNER JOIN ator A
               ON A.id = EF.idator;  
               
#SCRIPT PARA LISTAR ATORES QUE NÃO TEM FILMES
SELECT *
FROM   ator A
       LEFT JOIN serie_elenco ES
              ON A.id = ES.idator
       LEFT JOIN serie F
              ON F.id = ES.idserie
WHERE  ES.idator = NULL;

select * from producao where id =1;
update producao set nome = 'Irineu', cargo = 'você não sabe e nem eu', foto = '/home/usuario/img/foto.png' where id = 1;
update producao set foto = '/home/usuario/img/foto2.png' where id = 1;

select * from epsodio where id = 1;
delete from epsodio where id = 1;

select * from epsodio where temporada = 1;
-- Desabilitando(0) e Habilitando(1) as constraints de chave estrangeira
-- SET foreign_key_checks = 0;
delete from temporada where id = 1;
delete from epsodio where temporada = 1;
-- update epsodio set temporada = 2 where temporada = 1;


