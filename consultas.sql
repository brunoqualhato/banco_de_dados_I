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