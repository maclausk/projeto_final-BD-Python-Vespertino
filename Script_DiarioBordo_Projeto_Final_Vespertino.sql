-- Criação da database anteriormente utilizada em sala de aula, se não existir.
CREATE DATABASE IF NOT EXISTS projetodiario;
USE projetodiario;

-- CRIAÇÃO DA TABELA ALUNO COM AUTO-INCREMENTO NO ID
CREATE TABLE Aluno (
    id INT(6) PRIMARY KEY AUTO_INCREMENT, -- Coluna 'id' como chave primária auto incrementada
    ra CHAR(8) NOT NULL, -- Coluna 'ra' do tipo caractere com 8 posições, não nula
    CONSTRAINT unique_ra UNIQUE (ra) -- Restrição para garantir que o valor de 'ra' seja único
);

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
INSERT INTO Aluno (ra) VALUES ('00034557');
INSERT INTO Aluno (ra) VALUES ('00034558');
INSERT INTO Aluno (ra) VALUES ('00034559');
INSERT INTO Aluno (ra) VALUES ('00034560');
INSERT INTO Aluno (ra) VALUES ('00034561');
INSERT INTO Aluno (ra) VALUES ('00034562');
INSERT INTO Aluno (ra) VALUES ('00034563');
INSERT INTO Aluno (ra) VALUES ('00034564');
INSERT INTO Aluno (ra) VALUES ('00034565');
INSERT INTO Aluno (ra) VALUES ('00034566');

-- Consultar status da tabela Aluno
SELECT * FROM Aluno; -- Seleciona todos os registros da tabela Aluno
DESCRIBE Aluno; -- Mostra a estrutura da tabela Aluno

-- CRIAÇÃO DA TABELA DIÁRIOBORDO COM AUTO-INCREMENTO NO ID
CREATE TABLE diariobordo (
    id INT(6) PRIMARY KEY AUTO_INCREMENT, -- Coluna 'id' como chave primária auto incrementada
    texto TEXT NOT NULL, -- Coluna 'texto' do tipo texto, não nula
    datahora DATETIME NOT NULL, -- Coluna 'datahora' do tipo datetime, não nula
    fk_aluno_id INT NOT NULL -- Coluna 'fk_aluno_id' do tipo inteiro, chave estrangeira, não nula
);

-- Adiciona uma constraint de chave estrangeira na tabela diariobordo
-- Essa linha cria uma chave estrangeira 'fk_diariobordo' que referencia a coluna 'id' da tabela 'Aluno'.
-- ON DELETE CASCADE significa que, se um registro em 'Aluno' for deletado, todos os registros em 'diariobordo' relacionados também serão deletados.
ALTER TABLE diariobordo ADD CONSTRAINT fk_diariobordo
    FOREIGN KEY (fk_aluno_id) REFERENCES aluno(id) ON DELETE CASCADE;

-- Inserção de registros na tabela diariobordo
INSERT INTO diariobordo (texto, datahora, fk_aluno_id) VALUES 
('Introdução ao Python', '2024-07-31 09:00:00', (SELECT id FROM Aluno WHERE ra = '00169506')),
('Variáveis e Tipos de Dados', '2024-08-01 10:00:00', (SELECT id FROM Aluno WHERE ra = '00034548')),
('Estruturas de Controle', '2024-08-02 11:00:00', (SELECT id FROM Aluno WHERE ra = '00034549')),
('Funções e Módulos', '2024-08-03 12:00:00', (SELECT id FROM Aluno WHERE ra = '00034550')),
('Introdução ao NumPy', '2024-08-04 13:00:00', (SELECT id FROM Aluno WHERE ra = '00034551')),
('Manipulação de Dados com Pandas', '2024-08-05 14:00:00', (SELECT id FROM Aluno WHERE ra = '00034552')),
('Visualização de Dados com Matplotlib', '2024-08-06 15:00:00', (SELECT id FROM Aluno WHERE ra = '00034553')),
('Introdução ao Machine Learning', '2024-08-07 16:00:00', (SELECT id FROM Aluno WHERE ra = '00034554')),
('Redes Neurais com TensorFlow', '2024-08-08 17:00:00', (SELECT id FROM Aluno WHERE ra = '00034555')),
('Projeto Final de IA', '2024-08-09 18:00:00', (SELECT id FROM Aluno WHERE ra = '00034556')),
('Estudo de Algoritmos', '2024-08-10 09:00:00', (SELECT id FROM Aluno WHERE ra = '00034557')),
('Revisão de Matemática', '2024-08-11 10:00:00', (SELECT id FROM Aluno WHERE ra = '00034558')),
('Projeto de Física', '2024-08-12 11:00:00', (SELECT id FROM Aluno WHERE ra = '00034559')),
('Leitura de Literatura', '2024-08-13 12:00:00', (SELECT id FROM Aluno WHERE ra = '00034560')),
('Experimento de Química', '2024-08-14 13:00:00', (SELECT id FROM Aluno WHERE ra = '00034561')),
('Análise de Dados', '2024-08-15 14:00:00', (SELECT id FROM Aluno WHERE ra = '00034562')),
('Prática de Programação', '2024-08-16 15:00:00', (SELECT id FROM Aluno WHERE ra = '00034563')),
('Discussão em Grupo', '2024-08-17 16:00:00', (SELECT id FROM Aluno WHERE ra = '00034564')),
('Pesquisa de História', '2024-08-18 17:00:00', (SELECT id FROM Aluno WHERE ra = '00034565')),
('Exercício de Biologia', '2024-08-19 18:00:00', (SELECT id FROM Aluno WHERE ra = '00034566'));

-- Visualizar os dados na tabela diariobordo
SELECT * FROM diariobordo; -- Seleciona todos os registros da tabela diariobordo
-- Visualizar as tabelas disponíveis no banco de dados projetodiario
SHOW TABLES; -- Mostra todas as tabelas do banco de dados projetodiario

--- Criação da tabela avaliacao (criada em 01/08/2024)
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
(85, 87, 85, 90, (SELECT id FROM Aluno WHERE ra = '00034551')),
(80, 85, 70, 75, (SELECT id FROM Aluno WHERE ra = '00034552')),
(78, 82, 79, 84, (SELECT id FROM Aluno WHERE ra = '00034553')),
(88, 89, 85, 87, (SELECT id FROM Aluno WHERE ra = '00034554')),
(77, 74, 80, 82, (SELECT id FROM Aluno WHERE ra = '00034555')),
(90, 91, 86, 88, (SELECT id FROM Aluno WHERE ra = '00034556')),
(65, 70, 75, 80, (SELECT id FROM Aluno WHERE ra = '00034557')),
(85, 88, 82, 85, (SELECT id FROM Aluno WHERE ra = '00034558')),
(70, 72, 68, 75, (SELECT id FROM Aluno WHERE ra = '00034559')),
(92, 93, 89, 90, (SELECT id FROM Aluno WHERE ra = '00034560')),
(83, 85, 80, 82, (SELECT id FROM Aluno WHERE ra = '00034561')),
(79, 78, 74, 76, (SELECT id FROM Aluno WHERE ra = '00034562')),
(88, 90, 85, 87, (SELECT id FROM Aluno WHERE ra = '00034563')),
(74, 77, 70, 73, (SELECT id FROM Aluno WHERE ra = '00034564')),
(91, 89, 87, 88, (SELECT id FROM Aluno WHERE ra = '00034565')),
(85, 87, 82, 84, (SELECT id FROM Aluno WHERE ra = '00034566'));

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
SELECT 
    a.id, -- Seleciona a coluna 'id' da tabela 'Aluno'
    a.ra, -- Seleciona a coluna 'ra' da tabela 'Aluno'
    av.nota1, -- Seleciona a coluna 'nota1' da tabela 'avaliacao'
    av.nota2, -- Seleciona a coluna 'nota2' da tabela 'avaliacao'
    av.nota3, -- Seleciona a coluna 'nota3' da tabela 'avaliacao'
    av.nota4 -- Seleciona a coluna 'nota4' da tabela 'avaliacao'
FROM 
    Aluno a -- Define 'a' como alias (apelido) para a tabela 'Aluno'
JOIN 
    avaliacao av -- Define 'av' como alias (apelido) para a tabela 'avaliacao'
ON 
    a.id = av.fk_aluno_id; -- Condição de junção: a coluna 'fk_aluno_id' da tabela 'avaliacao' deve ser igual à coluna 'id' da tabela 'Aluno'
-- Realiza um JOIN entre as tabelas 'Aluno' e 'avaliacao' onde 'id' da tabela 'Aluno' corresponde a 'fk_aluno_id' da tabela 'avaliacao'

-- 05/08/2024
-- Adicionar colunas 'nome', 'tempoestudo' e 'rendafamiliar' na tabela Aluno
ALTER TABLE aluno ADD COLUMN nome VARCHAR(80);
ALTER TABLE aluno ADD COLUMN tempoestudo INT;
ALTER TABLE aluno ADD COLUMN rendafamiliar DECIMAL(10, 2);

DESCRIBE Aluno; -- Mostra a estrutura da tabela Aluno após adicionar as novas colunas

/*
-- Inserção de registros na tabela Aluno com as novas colunas (registrados em 05/08/2024)
Como já existem registros na tabela com os mesmos ra, você pode usar o comando INSERT IGNORE ou INSERT ... ON DUPLICATE KEY UPDATE.
No entanto, para evitar o uso de UPDATE, você pode inserir apenas os novos registros:

INSERT INTO aluno (ra, nome, tempoestudo, rendafamiliar) VALUES ('00169506', 'Marcelo Avelino', 6, 2500.50);
INSERT INTO aluno (ra, nome, tempoestudo, rendafamiliar) VALUES ('00034548', 'Ana Silva', 5, 3000.75);
INSERT INTO aluno (ra, nome, tempoestudo, rendafamiliar) VALUES ('00034549', 'Bruno Costa', 4, 2000.00);
INSERT INTO aluno (ra, nome, tempoestudo, rendafamiliar) VALUES ('00034550', 'Carlos Pereira', 7, 3500.20);
INSERT INTO aluno (ra, nome, tempoestudo, rendafamiliar) VALUES ('00034551', 'Daniela Souza', 3, 1500.40);
INSERT INTO aluno (ra, nome, tempoestudo, rendafamiliar) VALUES ('00034552', 'Eduardo Lima', 8, 4000.60);
INSERT INTO aluno (ra, nome, tempoestudo, rendafamiliar) VALUES ('00034553', 'Fernanda Oliveira', 6, 2700.30);
INSERT INTO aluno (ra, nome, tempoestudo, rendafamiliar) VALUES ('00034554', 'Gustavo Santos', 5, 2900.90);
INSERT INTO aluno (ra, nome, tempoestudo, rendafamiliar) VALUES ('00034555', 'Helena Rocha', 4, 2300.00);
INSERT INTO aluno (ra, nome, tempoestudo, rendafamiliar) VALUES ('00034556', 'Igor Martins', 7, 3100.10);
INSERT INTO aluno (ra, nome, tempoestudo, rendafamiliar) VALUES ('00034557', 'Julia Mendes', 6, 2800.80);
INSERT INTO aluno (ra, nome, tempoestudo, rendafamiliar) VALUES ('00034558', 'Lucas Almeida', 5, 2600.50);
INSERT INTO aluno (ra, nome, tempoestudo, rendafamiliar) VALUES ('00034559', 'Mariana Barbosa', 8, 4200.40);
INSERT INTO aluno (ra, nome, tempoestudo, rendafamiliar) VALUES ('00034560', 'Nicolas Ferreira', 3, 1700.20);
INSERT INTO aluno (ra, nome, tempoestudo, rendafamiliar) VALUES ('00034561', 'Olivia Cardoso', 5, 2500.00);
INSERT INTO aluno (ra, nome, tempoestudo, rendafamiliar) VALUES ('00034562', 'Pedro Azevedo', 4, 2200.70);
INSERT INTO aluno (ra, nome, tempoestudo, rendafamiliar) VALUES ('00034563', 'Quezia Farias', 7, 3400.90);
INSERT INTO aluno (ra, nome, tempoestudo, rendafamiliar) VALUES ('00034564', 'Ricardo Ribeiro', 6, 2900.50);
INSERT INTO aluno (ra, nome, tempoestudo, rendafamiliar) VALUES ('00034565', 'Sofia Vasconcelos', 5, 2400.30);
INSERT INTO aluno (ra, nome, tempoestudo, rendafamiliar) VALUES ('00034566', 'Tiago Macedo', 4, 2100.10);
*/

-- Inserção de dados nas novas colunas para registros existentes (realizado em 05/08/2024)
UPDATE aluno SET nome = 'Marcelo Avelino', tempoestudo = 6, rendafamiliar = 2500.50 WHERE ra = '00169506';
UPDATE aluno SET nome = 'Ana Silva', tempoestudo = 5, rendafamiliar = 3000.75 WHERE ra = '00034548';
UPDATE aluno SET nome = 'Bruno Costa', tempoestudo = 4, rendafamiliar = 2000.00 WHERE ra = '00034549';
UPDATE aluno SET nome = 'Carlos Pereira', tempoestudo = 7, rendafamiliar = 3500.20 WHERE ra = '00034550';
UPDATE aluno SET nome = 'Daniela Souza', tempoestudo = 3, rendafamiliar = 1500.40 WHERE ra = '00034551';
UPDATE aluno SET nome = 'Eduardo Lima', tempoestudo = 8, rendafamiliar = 4000.60 WHERE ra = '00034552';
UPDATE aluno SET nome = 'Fernanda Oliveira', tempoestudo = 6, rendafamiliar = 2700.30 WHERE ra = '00034553';
UPDATE aluno SET nome = 'Gustavo Santos', tempoestudo = 5, rendafamiliar = 2900.90 WHERE ra = '00034554';
UPDATE aluno SET nome = 'Helena Rocha', tempoestudo = 4, rendafamiliar = 2300.00 WHERE ra = '00034555';
UPDATE aluno SET nome = 'Igor Martins', tempoestudo = 7, rendafamiliar = 3100.10 WHERE ra = '00034556';
UPDATE aluno SET nome = 'Julia Mendes', tempoestudo = 6, rendafamiliar = 2800.80 WHERE ra = '00034557';
UPDATE aluno SET nome = 'Lucas Almeida', tempoestudo = 5, rendafamiliar = 2600.50 WHERE ra = '00034558';
UPDATE aluno SET nome = 'Mariana Barbosa', tempoestudo = 8, rendafamiliar = 4200.40 WHERE ra = '00034559';
UPDATE aluno SET nome = 'Nicolas Ferreira', tempoestudo = 3, rendafamiliar = 1700.20 WHERE ra = '00034560';
UPDATE aluno SET nome = 'Olivia Cardoso', tempoestudo = 5, rendafamiliar = 2500.00 WHERE ra = '00034561';
UPDATE aluno SET nome = 'Pedro Azevedo', tempoestudo = 4, rendafamiliar = 2200.70 WHERE ra = '00034562';
UPDATE aluno SET nome = 'Quezia Farias', tempoestudo = 7, rendafamiliar = 3400.90 WHERE ra = '00034563';
UPDATE aluno SET nome = 'Ricardo Ribeiro', tempoestudo = 6, rendafamiliar = 2900.50 WHERE ra = '00034564';
UPDATE aluno SET nome = 'Sofia Vasconcelos', tempoestudo = 5, rendafamiliar = 2400.30 WHERE ra = '00034565';
UPDATE aluno SET nome = 'Tiago Macedo', tempoestudo = 4, rendafamiliar = 2100.10 WHERE ra = '00034566';

-- Visualizar os dados na tabela Aluno após os updates
SELECT * FROM Aluno;

/*
Explicação
Criação da Database e Tabelas: Mantivemos a estrutura inicial do código, criando a database projetodiario e as tabelas Aluno, diariobordo, e avaliacao com as colunas apropriadas.

Inserção de Dados: Inserimos dados nas tabelas Aluno, diariobordo, e avaliacao conforme especificado.

Alteração da Tabela Aluno (05/08/2024):

Adicionamos três novas colunas: nome, tempoestudo, e rendafamiliar.
Comentário sobre a Inserção:

Explicamos por que o INSERT INTO não funciona para adicionar dados nas novas colunas para registros existentes, pois resultaria em duplicação de chaves primárias (ra).
Atualização de Dados (UPDATE):

Utilizamos o UPDATE para adicionar valores nas novas colunas para os registros existentes, mantendo a consistência dos dados sem duplicar registros.
Motivo do Uso de UPDATE em vez de INSERT INTO
Inserção de Dados em Registros Existentes: O INSERT INTO não pode ser utilizado para atualizar registros existentes, pois tentaria criar novas linhas com chaves primárias duplicadas, resultando em erro de duplicação.
O UPDATE permite modificar registros existentes adicionando os novos valores às colunas recém-criadas, mantendo a integridade dos dados e evitando duplicações.
*/

-- Consulta para combinar dados das tabelas 'Aluno', 'diariobordo' e 'avaliacao'
SELECT 
    a.id AS aluno_id, -- ID do aluno
    a.ra AS registro_academico, -- RA do aluno
    a.nome, -- Nome do aluno
    a.tempoestudo, -- Tempo de estudo do aluno
    a.rendafamiliar, -- Renda familiar do aluno
    d.id AS diariobordo_id, -- ID do diário de bordo
    d.texto AS atividade, -- Texto do diário de bordo
    d.datahora AS data_atividade, -- Data e hora da atividade do diário de bordo
    av.id AS avaliacao_id, -- ID da avaliação
    av.nota1, -- Nota 1 da avaliação
    av.nota2, -- Nota 2 da avaliação
    av.nota3, -- Nota 3 da avaliação
    av.nota4 -- Nota 4 da avaliação
FROM 
    aluno a
LEFT JOIN 
    diariobordo d ON a.id = d.fk_aluno_id
LEFT JOIN 
    avaliacao av ON a.id = av.fk_aluno_id
ORDER BY 
    a.id, d.datahora, av.id;

/*
Explicação da Consulta:
JOIN:
Utilizamos LEFT JOIN para incluir todos os registros da tabela Aluno e os registros correspondentes nas tabelas diariobordo e avaliacao.
LEFT JOIN garante que todos os alunos sejam incluídos na consulta, mesmo que não tenham registros correspondentes nas outras tabelas (diariobordo ou avaliacao).

SELECT:
Selecionamos as colunas relevantes de cada tabela, incluindo os IDs e os dados de interesse.
Renomeamos algumas colunas para tornar a saída mais clara (por exemplo, a.id AS aluno_id).

ORDER BY:
Ordenamos os resultados pelo ID do aluno (a.id), data e hora da atividade (d.datahora), e ID da avaliação (av.id), para organizar os dados de maneira lógica e cronológica.
Esta consulta fornecerá uma visão abrangente de todos os registros em suas tabelas Aluno, diariobordo, e avaliacao, mostrando como eles estão relacionados entre si.
*/

-- 06/08/2024 - JOIN
-- Esta consulta faz um JOIN entre as tabelas diariobordo e aluno para obter os textos e datas do diário de bordo junto com o RA dos alunos

-- Seleciona as colunas desejadas
SELECT
    d.texto, -- Texto do diário de bordo
    d.datahora, -- Data e hora do registro no diário de bordo
    a.ra -- RA do aluno associado ao registro
FROM
    diariobordo d -- Define alias 'd' para a tabela diariobordo
JOIN
    aluno a -- Define alias 'a' para a tabela aluno
ON 
    d.fk_aluno_id = a.id; -- Condição de junção: chave estrangeira fk_aluno_id em diariobordo corresponde ao id em aluno

/*
Se não definir LEFT, RIGHT etc, o JOIN padrão é o INNER JOIN.
No INNER JOIN, apenas os registros que têm correspondências em ambas as tabelas são retornados.
No Pandas, para fazer uma junção semelhante, usamos pd.merge() e definimos quais colunas de cada DataFrame serão usadas para a junção.

Exemplo em Pandas:
resultado = pd.merge(df_diariobordo, df_alunos, how='inner', left_on='fk_aluno_id', right_on='id')
resultado_selecionado = resultado[['texto', 'datahora', 'ra']]
*/

-- Inserção de mais alunos sem registros de diários (registrados em 06/08/2024)
INSERT INTO aluno (ra) VALUES ('00034567');
INSERT INTO aluno (ra) VALUES ('00034568');
INSERT INTO aluno (ra) VALUES ('00034569');
INSERT INTO aluno (ra) VALUES ('00034570');
INSERT INTO aluno (ra) VALUES ('00034571');
INSERT INTO aluno (ra) VALUES ('00034572');
INSERT INTO aluno (ra) VALUES ('00034573');
INSERT INTO aluno (ra) VALUES ('00034574');
INSERT INTO aluno (ra) VALUES ('00034575');
INSERT INTO aluno (ra) VALUES ('00034576');

-- Consulta para verificar os dados dos alunos, incluindo aqueles sem registros no diário de bordo
SELECT
    a.ra, -- RA do aluno
    a.nome, -- Nome do aluno
    a.tempoestudo, -- Tempo de estudo do aluno
    a.rendafamiliar, -- Renda familiar do aluno
    d.texto, -- Texto do diário de bordo (pode ser NULL)
    d.datahora -- Data e hora do registro no diário de bordo (pode ser NULL)
FROM
    aluno a -- Define alias 'a' para a tabela aluno
LEFT JOIN
    diariobordo d -- Define alias 'd' para a tabela diariobordo
ON
    a.id = d.fk_aluno_id; -- Condição de junção: chave primária id em aluno corresponde à chave estrangeira fk_aluno_id em diariobordo



