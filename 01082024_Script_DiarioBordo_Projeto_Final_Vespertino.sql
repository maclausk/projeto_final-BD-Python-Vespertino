-- Criação da database anteriormente utilizada em sala de aula, caso ela já não esteja presente no computador em sala de aula
CREATE DATABASE schooltracker;
USE schooltracker;

-- Criação da tabela Aluno com auto incremento no ID
CREATE TABLE Aluno (
    id INT PRIMARY KEY AUTO_INCREMENT,
    ra CHAR(8) NOT NULL
);

-- Adicionar uma constraint UNIQUE na coluna 'ra'
ALTER TABLE Aluno ADD CONSTRAINT constraint_name UNIQUE (ra);

-- Pesquisa todos os campos (*) da tabela aluno
SELECT * FROM aluno;

/*
Deletar registros da tabela aluno quando id = 4
-- DELETE FROM aluno where id = 4;
*/

-- Mostra toda a estrutura da tabela
DESCRIBE aluno;

-- Seleção do banco de dados
USE schooltracker;

-- Inserindo valores na tabela aluno
INSERT INTO Aluno (ra) VALUES ('00169506');
INSERT INTO Aluno (ra) VALUES ('00034548');
INSERT INTO Aluno (ra) VALUES ('00034549');
INSERT INTO Aluno (ra) VALUES ('00034550');
INSERT INTO Aluno (ra) VALUES ('00034551');
INSERT INTO Aluno (ra) VALUES ('00034552');
INSERT INTO Aluno (ra) VALUES ('00034553');
INSERT INTO Aluno (ra) VALUES ('00034554');
INSERT INTO Aluno (ra) VALUES ('00034555');
INSERT INTO Aluno (ra) VALUES ('00034556');

-- Criação da tabela diariobordo com auto incremento no ID
CREATE TABLE diariobordo (
    id INT PRIMARY KEY AUTO_INCREMENT,
    texto TEXT NOT NULL,
    datahora DATETIME,
    fk_Aluno_id INT
);

-- Adicionar a constraint de chave estrangeira na tabela diariobordo
ALTER TABLE diariobordo ADD CONSTRAINT FK_diariobordo_2
    FOREIGN KEY (fk_Aluno_id)
    REFERENCES Aluno (id)
    ON DELETE CASCADE;

-- Visualizar os dados na tabela diariobordo
SELECT * FROM diariobordo;

-- Visualizar as tabelas disponíveis no banco de dados schooltracker
SHOW TABLES;

-- Inserindo registros na tabela diariobordo
INSERT INTO diariobordo (texto, datahora, fk_Aluno_id) VALUES ('Introdução ao Python', '2024-07-31 09:00:00', 1);
INSERT INTO diariobordo (texto, datahora, fk_Aluno_id) VALUES ('Variáveis e Tipos de Dados', '2024-08-01 10:00:00', 2);
INSERT INTO diariobordo (texto, datahora, fk_Aluno_id) VALUES ('Estruturas de Controle', '2024-08-02 11:00:00', 3);
INSERT INTO diariobordo (texto, datahora, fk_Aluno_id) VALUES ('Funções e Módulos', '2024-08-03 12:00:00', 4);
INSERT INTO diariobordo (texto, datahora, fk_Aluno_id) VALUES ('Introdução ao NumPy', '2024-08-04 13:00:00', 5);
INSERT INTO diariobordo (texto, datahora, fk_Aluno_id) VALUES ('Manipulação de Dados com Pandas', '2024-08-05 14:00:00', 6);
INSERT INTO diariobordo (texto, datahora, fk_Aluno_id) VALUES ('Visualização de Dados com Matplotlib', '2024-08-06 15:00:00', 7);
INSERT INTO diariobordo (texto, datahora, fk_Aluno_id) VALUES ('Introdução ao Machine Learning', '2024-08-07 16:00:00', 8);
INSERT INTO diariobordo (texto, datahora, fk_Aluno_id) VALUES ('Redes Neurais com TensorFlow', '2024-08-08 17:00:00', 9);
INSERT INTO diariobordo (texto, datahora, fk_Aluno_id) VALUES ('Projeto Final de IA', '2024-08-09 18:00:00', 10);

-- Visualizar os dados na tabela diariobordo
SELECT * FROM diariobordo;

-- Teoria dos Conjuntos: Consulta com JOIN para combinar dados das tabelas diariobordo e aluno
SELECT
    d.id,
    d.texto,
    d.datahora,
    a.ra AS registro_academico
FROM
    diariobordo AS d
JOIN 
    aluno AS a
ON
    d.fk_aluno_id = a.id;

-- Outra consulta com JOIN para combinar dados das tabelas diariobordo e aluno
SELECT * FROM diariobordo
JOIN aluno
ON diariobordo.fk_aluno_id = aluno.id;

-- Exercicio - 01/08/2024

-- Criar no BrModelo os modelos Conceitual, Lógico e Físico.

-- Modelo Conceitual: Criação da entidade avaliação com os atributos especificados

-- Criação da tabela avaliacao
CREATE TABLE avaliacao (
    id INT(6) AUTO_INCREMENT PRIMARY KEY, -- Cria a coluna 'id' do tipo inteiro com auto incremento e define como chave primária
    nota1 INT, -- Cria a coluna 'nota1' do tipo inteiro
    nota2 INT, -- Cria a coluna 'nota2' do tipo inteiro
    nota3 INT, -- Cria a coluna 'nota3' do tipo inteiro
    nota4 INT, -- Cria a coluna 'nota4' do tipo inteiro
    fk_aluno_id INT(6) -- Cria a coluna 'fk_aluno_id' do tipo inteiro, que servirá como chave estrangeira
);

-- Adicionar a constraint de chave estrangeira na tabela avaliacao
ALTER TABLE avaliacao ADD CONSTRAINT FK_avaliacao_2
    FOREIGN KEY (fk_aluno_id) -- Define a coluna 'fk_aluno_id' como chave estrangeira
    REFERENCES aluno (id) -- Referencia a coluna 'id' da tabela 'aluno'
    ON DELETE CASCADE; -- Define que, ao deletar um registro da tabela 'aluno', todos os registros correspondentes na tabela 'avaliacao' também serão deletados

-- Inserir 5 registros na tabela avaliacao
INSERT INTO avaliacao (nota1, nota2, nota3, nota4, fk_aluno_id) VALUES (85, 90, 78, 88, 1); -- Insere um registro na tabela 'avaliacao' com notas e fk_aluno_id
INSERT INTO avaliacao (nota1, nota2, nota3, nota4, fk_aluno_id) VALUES (75, 80, 68, 78, 2); -- Insere outro registro na tabela 'avaliacao'
INSERT INTO avaliacao (nota1, nota2, nota3, nota4, fk_aluno_id) VALUES (95, 92, 88, 91, 3); -- Insere outro registro na tabela 'avaliacao'
INSERT INTO avaliacao (nota1, nota2, nota3, nota4, fk_aluno_id) VALUES (65, 70, 60, 72, 4); -- Insere outro registro na tabela 'avaliacao'
INSERT INTO avaliacao (nota1, nota2, nota3, nota4, fk_aluno_id) VALUES (85, 87, 85, 90, 5); -- Insere outro registro na tabela 'avaliacao'

-- Visualizar os dados na tabela avaliacao
SELECT * FROM avaliacao; -- Seleciona todos os registros da tabela 'avaliacao'

-- Consulta com JOIN para combinar dados das tabelas aluno e avaliacao
SELECT a.id, a.ra, av.nota1, av.nota2, av.nota3, av.nota4
FROM aluno a
JOIN avaliacao av ON a.id = av.fk_aluno_id; -- Realiza um JOIN entre as tabelas 'aluno' e 'avaliacao' onde 'id' da tabela 'aluno' corresponde a 'fk_aluno_id' da tabela 'avaliacao'
