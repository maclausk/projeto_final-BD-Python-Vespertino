-- Projeto Final - BD, Python e IA - SENAI-DF | Vespertino
-- Nome: Marcelo Avelino
-- RA: 00169506
-- Data de Início: 31/07/2024


-- Criação do banco de dados 'diario_de_bordo'
CREATE DATABASE diario_de_bordo;

-- Seleção do banco de dados a ser utilizado
USE diario_de_bordo;

-- Criação da tabela aluno com auto incremento no ID
CREATE TABLE Aluno (
    -- Cria uma coluna 'id' do tipo inteiro, que é a chave primária e será auto incrementada
    id INT PRIMARY KEY AUTO_INCREMENT,
    -- Cria uma coluna 'ra' do tipo caractere com 8 posições, que não pode ser nula
    ra CHAR(8) NOT NULL
);

-- Alterar a tabela adicionando a restrição UNIQUE na coluna 'ra' com um nome específico para a constraint
ALTER TABLE Aluno ADD CONSTRAINT unique_ra UNIQUE (ra);

-- ALTER TABLE Aluno: Este comando indica que a tabela Aluno será modificada.
-- ADD CONSTRAINT unique_ra: Este comando adiciona uma nova restrição à tabela. unique_ra é o nome dado à restrição. Nomear a restrição pode ser útil para referenciá-la ou modificá-la posteriormente.
-- UNIQUE (ra): Este comando especifica que a coluna ra deve conter valores únicos em todos os registros da tabela Aluno. Isso significa que nenhum valor duplicado será permitido na coluna ra.
-- Se você não quiser especificar um nome para a constraint, você pode simplesmente adicionar a restrição UNIQUE diretamente:
-- ALTER TABLE Aluno ADD UNIQUE (ra);

-- Inserir um registro na tabela Aluno com o seu RA
INSERT INTO Aluno (ra) VALUES ('00169506');

-- Pesquisa todos os campos (*) da tabela aluno
DESCRIBE Aluno;

-- Verificando se os registros foram criados
SELECT * from Aluno;

-- Criação da tabela diariobordo com auto incremento no ID
CREATE TABLE diariobordo (
    -- Cria uma coluna 'id' do tipo inteiro, que é a chave primária e será auto incrementada
    id INT PRIMARY KEY AUTO_INCREMENT,
    -- Cria uma coluna 'texto' do tipo texto, que não pode ser nula
    texto TEXT NOT NULL,
    -- Cria uma coluna 'datahora' do tipo datetime, para armazenar data e hora
    datahora DATETIME,
    -- Cria uma coluna 'fk_aluno_id' do tipo inteiro, que referencia a tabela Aluno
    fk_aluno_id INT,
    FOREIGN KEY (fk_aluno_id) REFERENCES Aluno(id) ON DELETE CASCADE
);

-- Inserir um registro na tabela diariobordo para o seu RA
INSERT INTO diariobordo (texto, datahora, fk_aluno_id)
VALUES ('31/07/2024 - Hoje aprendemos a criar e modificar tabelas no MySQL, incluindo a aplicação de constraints UNIQUE e a inserção de registros. Também verificamos os dados nas tabelas.', '2024-07-31 17:30:00', (SELECT id FROM Aluno WHERE ra = '00169506'));

-- Verificando se os registros foram criados
SELECT * from diariobordo;

-- Verificar os registros na tabela Aluno
SELECT * FROM Aluno;

-- Selecionar dados das tabelas diariobordo e Aluno combinando-as com base na chave estrangeira fk_aluno_id
SELECT
    -- Especifica quais colunas serão retornadas na consulta
    d.id,          -- A coluna id da tabela diariobordo
    d.texto,       -- A coluna texto da tabela diariobordo
    d.datahora,    -- A coluna datahora da tabela diariobordo
    a.ra AS registro_academico -- A coluna ra da tabela Aluno, renomeada como registro_academico
FROM
    diariobordo AS d -- Define um alias 'd' para a tabela diariobordo
JOIN 
    aluno AS a -- Define um alias 'a' para a tabela Aluno
ON
    d.fk_aluno_id = a.id; -- Especifica a condição de junção onde fk_aluno_id na tabela diariobordo é igual ao id na tabela Aluno

-- FIM - 31/07/2024

-- PENDENTE: 
-- Exportar também em PNG no formato pé de galinha, e enviar junto para o professor.
