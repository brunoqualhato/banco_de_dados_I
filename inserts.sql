use bibliografia;
/*inserindo em temporadas*/
INSERT INTO temporadas (nome, numero_epsodios, series_idseries, data_lancamento, descricao) values
('Primeira',15,1,'2014/10/15','very nice bro'),
('Segunda',8,2,'2017/08/11','Todo Edson é frufru'),
('Terceira',10,3,'2016/07/16)','Adeus gugu'),
('Quarta',14,4,'2011/09/17)','É isso aí'),
('Quinta',20,5,'2012/08/10','Minhas condolências'),
('Sexta',16,6,'2013/07/8','GLÓRIA'),
('Sétima',18,7,'2019/05/15','AMÉM'),
('Oitava',19,8,'2018/04/13','IHULL'),
('Nona',20,9,'2010/02/10','KKKK'),
('Décima',10,10,'2010/10/10','AOSKAOS'),
('DÉCIMA PRIMEIRA',8,11,'2014/02/28','cá estamos nós'),
('Décima segunda',9,12,'2015/05/15','Saravá Arrancalhe'),
('Décima terceira',10,13,'2018/04/10','Carapicuiba'),
('Décima quarta',14,14,'2014/04/14','YODLAY'),
('Décima quinta',15,15,'2015/05/15','ACABOUUU, É TETRAAAA');

/*inserindo em servico_streaming*/
INSERT INTO servico_streaming(`nome`,`site`) values
('Cracle','https://www.crackle.com.br'),
('Netflix','https://www.netflix.com/br/'),
('Telecine','https://telecineplay.com.br'),
('HBO GO','https://telecineplay.com.br'),
('iTunes Store','https://www.apple.com/br/itunes/'),
('El Plus','https://www.eiplus.com.br');

/*inserindo em producao*/
INSERT INTO producao(nome,cargo,foto) values
('Vera Fisher','continuísta','C:/FOTOS/FUNCIONARIOS'),
('Amado Batista','Diretor de fotografia','C:/FOTOS/FUNCIONARIOS'),
('Ivete Sangalo','Fotógrafa de Cena','C:/FOTOS/FUNCIONARIOS'),
('Maria do bairro','Diretora de produção','C:/FOTOS/FUNCIONARIOS'),
('Dinei','Assistente de câmera','C:/FOTOS/FUNCIONARIOS'),
('Buzz Lighyear','Carregador de Chassis','C:/FOTOS/FUNCIONARIOS'),
('Penny Matsom','Figurinista','C:/FOTOS/FUNCIONARIOS'),
('Cleide Cunha','Guarda-roupeira','C:/FOTOS/FUNCIONARIOS'),
('Waldisom Caprini','Técnico de Som','C:/FOTOS/FUNCIONARIOS'),
('Rangel Incle','Microfonista','C:/FOTOS/FUNCIONARIOS'),
('Luccy Quincle','Cenógrafa','C:/FOTOS/FUNCIONARIOS'),
('Elia Pereira','Cenotécnica','C:/FOTOS/FUNCIONARIOS'),
('Wendell Bezerra','Roteirista','C:/FOTOS/FUNCIONARIOS'),
('Charges Cunha','Argumentista','C:/FOTOS/FUNCIONARIOS'),
('Roberto Justos','Dialoguista','C:/FOTOS/FUNCIONARIOS');

/*inserindo em generos*/
INSERT INTO generos(nome) values
('Ação'),
('Aventura'),
('Animação'),
('Comédia'),
('Criminal'),
('Documentário'),
('Drama'),
('Família'),
('Fantasia'),
('História'),
('Terror'),
('Musical'),
('Mistério'),
('Romance'),
('Ficção científica'),
('Cinema TV'),
('Thriller'),
('Guerra'),
('Faroeste');

/*inserindo em epsodio*/
INSERT INTO epsodio(temporadas,nome,descricao,popularidade) values
(1,'É ISSO AE','MUITO BOA',7.9),
(2,'BACALHAU','BEM LONGA',9.8),
(7,'CABRAL QUINTO','DOM PEDRO TERCEIRO',9.9),
(4,'NÁRNIA','BEM-VINDO',7.9),
(5,'EMPREGUETES','ESTRESSE',8.8),
(3,'NO MAR NÃO TEM PEIXE','PIRATARIA',10.0),
(9,'O MAU PREVALECE','IRMÃOS',10.0),
(2,'JOSH ENLOUQUECEU','DRAKE',10.0),
(1,'GOKU RENASCE','VEGETTA INVEJOSO',9.9),
(2,'LUFFY CHUTA TUDO','SEM NOÇÃO',10.0),
(9,'ARQUIPÉLAGO','QUE ISSO MEN',7.9),
(8,'O QUE TÁ CONTECENDO','AOKSOA',8.8),
(7, 'O IF SUGOU A','SANIDADE MENTAL',9.9),
(5,'DE TODOS NÓS','E OS QUE VIRÃO',7.2),
(6,'É ISSO AÍ AMIGOS','ATÉ A PRÓXIMA',10.0);