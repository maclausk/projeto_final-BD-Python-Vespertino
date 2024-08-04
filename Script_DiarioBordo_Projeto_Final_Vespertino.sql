-- Criação da database anteriormente utilizada em sala de aula, se não existir.
CREATE DATABASE IF NOT EXISTS schooltracker;
USE schooltracker;

-- Criação da tabela Aluno com auto incremento no ID
CREATE TABLE Aluno (
    id INT(6) PRIMARY KEY AUTO_INCREMENT, -- Coluna 'id' como chave primária auto incrementada
    ra CHAR(8) NOT NULL, -- Coluna 'ra' do tipo caractere com 8 posições, não nula
    CONSTRAINT unique_ra UNIQUE (ra) -- Restrição para garantir que o valor de 'ra' seja único
);

-- Adicionar uma constraint UNIQUE na coluna 'ra', caso não tivesse sido adicionada no momento da criação da tabela.
-- ALTER TABLE Aluno ADD CONSTRAINT constraint_name UNIQUE (ra); -- Esta linha está comentada porque a restrição UNIQUE já foi adicionada

-- Pesquisa todos os campos (*) da tabela aluno
SELECT * FROM aluno;
-- Mostra toda a estrutura da tabela
DESCRIBE aluno;

-- Inserção de registros na tabela Aluno (registrados em 29/07/2024)
INSERT INTO Aluno (ra) VALUES ('00169506'); -- RA de Marcelo Avelino
INSERT INTO Aluno (ra) VALUES ('00034548');
INSERT INTO Aluno (ra) VALUES ('00034549');
INSERT INTO Aluno (ra) VALUES ('00034550');
INSERT INTO Aluno (ra) VALUES ('00034551');
INSERT INTO Aluno (ra) VALUES ('00034552');
INSERT INTO Aluno (ra) VALUES ('00034553');
INSERT INTO Aluno (ra) VALUES ('00034554');
INSERT INTO Aluno (ra) VALUES ('00034555');
INSERT INTO Aluno (ra) VALUES ('00034556');

-- Criação da tabela diariobordo com auto incremento no ID (criada em 30/07/2024)
CREATE TABLE diariobordo (
    id INT(6) PRIMARY KEY AUTO_INCREMENT, -- Coluna 'id' como chave primária auto incrementada
    texto TEXT NOT NULL, -- Coluna 'texto' do tipo texto, não nula
    datahora DATETIME, -- Coluna 'datahora' do tipo datetime
    fk_Aluno_id INT, -- Coluna 'fk_Aluno_id' do tipo inteiro, chave estrangeira
    FOREIGN KEY (fk_aluno_id) REFERENCES Aluno(id) ON DELETE CASCADE -- Chave estrangeira referenciando 'id' da tabela 'Aluno', com deleção em cascata
);

-- Visualizar os dados na tabela diariobordo
SELECT * FROM diariobordo;

-- Visualizar as tabelas disponíveis no banco de dados schooltracker
SHOW TABLES;

-- Inserindo registros na tabela diariobordo
-- Inserção de registros na tabela diariobordo (registrados em 30/07/2024)
INSERT INTO diariobordo (texto, datahora, fk_aluno_id) VALUES 
('Introdução ao Python', '2024-07-31 09:00:00', (SELECT id FROM Aluno WHERE ra = '00169506')),
('Variáveis e Tipos de Dados', '2024-08-01 10:00:00', (SELECT id FROM Aluno WHERE ra = '00169506')),
('Estruturas de Controle', '2024-08-02 11:00:00', (SELECT id FROM Aluno WHERE ra = '00169506')),
('Funções e Módulos', '2024-08-03 12:00:00', (SELECT id FROM Aluno WHERE ra = '00169506')),
('Introdução ao NumPy', '2024-08-04 13:00:00', (SELECT id FROM Aluno WHERE ra = '00169506')),
('Manipulação de Dados com Pandas', '2024-08-05 14:00:00', (SELECT id FROM Aluno WHERE ra = '00169506')),
('Visualização de Dados com Matplotlib', '2024-08-06 15:00:00', (SELECT id FROM Aluno WHERE ra = '00169506')),
('Introdução ao Machine Learning', '2024-08-07 16:00:00', (SELECT id FROM Aluno WHERE ra = '00169506')),
('Redes Neurais com TensorFlow', '2024-08-08 17:00:00', (SELECT id FROM Aluno WHERE ra = '00169506')),
('Projeto Final de IA', '2024-08-09 18:00:00', (SELECT id FROM Aluno WHERE ra = '00169506'));

-- Visualizar os dados na tabela diariobordo
SELECT * FROM diariobordo;

-- Criação da tabela avaliacao (criada em 01/08/2024)
CREATE TABLE avaliacao (
    id INT PRIMARY KEY AUTO_INCREMENT, -- Coluna 'id' como chave primária auto incrementada
    nota1 INT, -- Coluna 'nota1' do tipo inteiro
    nota2 INT, -- Coluna 'nota2' do tipo inteiro
    nota3 INT, -- Coluna 'nota3' do tipo inteiro
    nota4 INT, -- Coluna 'nota4' do tipo inteiro
    fk_aluno_id INT, -- Coluna 'fk_aluno_id' do tipo inteiro, chave estrangeira
    FOREIGN KEY (fk_aluno_id) REFERENCES Aluno(id) ON DELETE CASCADE -- Chave estrangeira referenciando 'id' da tabela 'Aluno', com deleção em cascata
);

-- Inserção de registros na tabela avaliacao (registrados em 01/08/2024)
INSERT INTO avaliacao (nota1, nota2, nota3, nota4, fk_aluno_id) VALUES 
(85, 90, 78, 88, (SELECT id FROM Aluno WHERE ra = '00169506')),
(75, 80, 68, 78, (SELECT id FROM Aluno WHERE ra = '00034548')),
(95, 92, 88, 91, (SELECT id FROM Aluno WHERE ra = '00034549')),
(65, 70, 60, 72, (SELECT id FROM Aluno WHERE ra = '00034550')),
(85, 87, 85, 90, (SELECT id FROM Aluno WHERE ra = '00034551'));

-- Visualizar os dados na tabela avaliacao
SELECT * FROM avaliacao;

-- Consulta para combinar dados das tabelas 'diariobordo' e 'aluno' e obter o RA do aluno
SELECT
    d.id, -- Seleciona a coluna 'id' da tabela 'diariobordo'
    d.texto, -- Seleciona a coluna 'texto' da tabela 'diariobordo'
    d.datahora, -- Seleciona a coluna 'datahora' da tabela 'diariobordo'
    a.ra AS registro_academico -- Seleciona a coluna 'ra' da tabela 'aluno' e renomeia para 'registro_academico'
FROM
    diariobordo AS d -- Define 'd' como alias (apelido) para a tabela 'diariobordo'
JOIN 
    aluno AS a -- Define 'a' como alias (apelido) para a tabela 'aluno'
ON
    d.fk_aluno_id = a.id; -- Condição de junção: a coluna 'fk_aluno_id' da tabela 'diariobordo' deve ser igual à coluna 'id' da tabela 'aluno'

-- Consulta alternativa para combinar dados das tabelas 'diariobordo' e 'aluno'
SELECT * FROM diariobordo
JOIN aluno
ON diariobordo.fk_aluno_id = aluno.id;

-- Consulta para combinar dados das tabelas 'aluno' e 'avaliacao' e obter as notas dos alunos
SELECT a.id, a.ra, av.nota1, av.nota2, av.nota3, av.nota4
FROM Aluno a
JOIN avaliacao av ON a.id = av.fk_aluno_id;
-- Realiza um JOIN entre as tabelas 'aluno' e 'avaliacao' onde 'id' da tabela 'aluno' corresponde a 'fk_aluno_id' da tabela 'avaliacao'