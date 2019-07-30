# banco_de_dados_I
Repositório para matéria de Banco de Dados I

# Comandos Git

Comandos que iremos utilizar
```git

//Para baixar o projetos em maquinas distintas usamos o comando: "git clone <link do repositorio>"
//Ficando algo asimm

git clone https://github.com/brunoqualhato/banco_de_dados_I

// Com o repositório baixado, acesse a pasta do mesmo
// antes de qualquer alteração, utilize o comando "git pull"
// Para que possa pegar todas as modificações feitas por outros integrantes do grupo

git pull

// Quando vocês terminarem de editar seus arquivos adicione os seguites comandos

git add -A // para adicionar tudo que vocêss modificaram
//ou
git add . //vai dar na mesma do comando acima 

//Depois de adicionado seus arquivos, você pode quais arquivos foram editado com o comando

git status

//os nome dos arquivos da cor verdes são os que foram adicionado

// Agora antes de enviar suas modificações você antes precisa falar o que vc modificou
// então utilizamos o comando "git commit" ficando dessa forma:

git commit -m "sua mensagem aqui"

// e para finalizar, utilize o comando git push

git push

//isso enviará todas suas modificações para essse repositório
:)


```
# Comandos SQL

```sql
#A instrução INSERT INTO é usada para inserir novos registros em uma tabela.
#É possível escrever a instrução INSERT INTO de duas maneiras.
#A primeira maneira especifica os nomes das colunas e os valores a serem inseridos:

INSERT INTO nome_da_tabela (coluna1, coluna2, coluna3, ...)
VALUES (valor1, valor2, valor3, ...);

#Se você estiver adicionando valores para todas as colunas da tabela, não será necessário especificar os nomes das colunas na #consulta SQL. No entanto, verifique se a ordem dos valores está na mesma ordem das colunas na tabela. A sintaxe INSERT INTO #seria a seguinte:

INSERT INTO nome_da_tabela
VALUES (valor1, valor2, valor3, ...);


#A instrução SELECT é usada para selecionar dados de um banco de dados.
#Os dados retornados são armazenados em uma tabela de resultados, chamada de conjunto de resultados.

SELECT coluna1, coluna2, ...
FROM nome_da_tabela;

#coluna1, coluna2, ... são os nomes dos campos da tabela da qual você deseja selecionar os dados. Se você quiser selecionar #todos os campos disponíveis na tabela, use a seguinte sintaxe:

SELECT * FROM nome_da_tabela; 


#A instrução UPDATE é usada para modificar os registros existentes em uma tabela.

UPDATE nome_da_tabela
SET coluna1 = valor1, coluna2 = valor2, ...
WHERE condicao;


#A instrução DELETE é usada para excluir registros existentes em uma tabela.

DELETE FROM nome_da_tabela WHERE condicao;

```
