/* projetologico_avaliacao: */

CREATE TABLE aluno (
    id int(6) PRIMARY KEY,
    ra char(8)
);

CREATE TABLE diariobordo (
    id int(6),
    datahora datetime,
    texto text(100),
    fk_aluno_id int(6),
    PRIMARY KEY (id, texto)
);

CREATE TABLE avaliacao (
    id int(6) PRIMARY KEY,
    nota1 int,
    nota2 int,
    nota3 int,
    nota4 int,
    fk_aluno_id int(6)
);
 
ALTER TABLE diariobordo ADD CONSTRAINT FK_diariobordo_2
    FOREIGN KEY (fk_aluno_id)
    REFERENCES aluno (id)
    ON DELETE CASCADE;
 
ALTER TABLE avaliacao ADD CONSTRAINT FK_avaliacao_2
    FOREIGN KEY (fk_aluno_id)
    REFERENCES aluno (id)
    ON DELETE CASCADE;