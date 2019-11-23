#SCRIPT PARA LISTAR TODOS OS FILMES E SEUS GENEROS
SELECT *
FROM   filmes F
       INNER JOIN filmes_has_generos FG
               ON F.idfilmes = FG.filmes_idfilmes
       INNER JOIN generos G
               ON FG.generos_idgeneros = G.idgeneros;  
               
			
#SCRIPT PARA LISTAR TODOS OS FILMES E SEUS ATORES
SELECT *
FROM   filmes F
       INNER JOIN elenco_filme EF
               ON F.idfilmes = EF.filmes_idfilmes
       INNER JOIN atores A
               ON A.idatores = EF.atores_idatores;  
               
#SCRIPT PARA LISTAR ATORES QUE NÃO TEM FILMES
SELECT *
FROM   atores A
       LEFT JOIN series_elenco ES
              ON A.idatores = ES.atores_idatores
       LEFT JOIN series F
              ON F.idseries = ES.series_idseries
WHERE  ES.atores_idatores = NULL  