CREATE TABLE Usuario(
    id_usuario      SERIAL PRIMARY KEY,
    email           VARCHAR(100) Unique,
    senha           VARCHAR(255) NOT NULL,
    primeiro_nome   VARCHAR(50) NOT NULL,
    nome_meio       VARCHAR(50) NOT NULL,
    ultimo_nome     VARCHAR(50) NOT NULL
);

CREATE TABLE Aluno(
    id_usuario  INT,
    matricula   VARCHAR(20) UNIQUE,
    curso       VARCHAR(100) NOT NULL,
    semestre    INT NOT NULL
);

ALTER TABLE Aluno
ADD CONSTRAINT fk_id_usuario
FOREIGN KEY (id_usuario)
REFERENCES Usuario(id_usuario);

ALTER TABLE Aluno
ALTER COLUMN matricula SET NOT NULL;

CREATE TABLE Professor(
    id_usuario      INT,
    id_funcional    SERIAL Not Null,
    departamento    VARCHAR(100) Not Null,
    titulacao       VARCHAR(50) Not Null
);

ALTER TABLE Professor
ADD CONSTRAINT fk_id_usuario
FOREIGN KEY (id_usuario)
REFERENCES Usuario(id_usuario);

CREATE TABLE Projeto(
    id_projeto              SERIAL PRIMARY KEY,
    nome                    VARCHAR(150) Not Null,
    comite                  VARCHAR(100),
    descricao               TEXT,
    data_inicio             DATE Not Null,
    data_fim                DATE,
    prazo                   DATE,
    categoria               VARCHAR(50),
    status                  VARCHAR(20) Not Null,
    id_professor_orientador INT
);

ALTER TABLE Projeto
ADD CONSTRAINT fk_referencia_professor
FOREIGN KEY (id_professor_orientador)
REFERENCES Usuario (id_usuario);

CREATE TABLE Membro_Equipe(
    id_projeto  INT,
    id_aluno    INT
);

ALTER TABLE Membro_Equipe
ADD CONSTRAINT fk_referencia_projeto
FOREIGN KEY (id_projeto)
REFERENCES projeto(id_projeto);

ALTER TABLE Membro_Equipe
ADD CONSTRAINT fk_referencia_aluno
FOREIGN KEY (id_aluno)
REFERENCES usuario(id_usuario);

CREATE TABLE Reuniao(
    id_reuniao          SERIAL primary key,
    data_da_reuniao     DATE not null,
    horario_de_inicio   time not null,
    horario_de_fim      time not null,
    local               VARCHAR(100),
    tipo                VARCHAR(50),
    pauta               TEXT
);

CREATE TABLE Participacao_Reuniao(
    id_reuniao INT,
    id_usuario INT
);

ALTER TABLE Participacao_Reuniao
ADD CONSTRAINT fk_referencia_reuniao
FOREIGN KEY (id_reuniao)
REFERENCES reuniao(id_reuniao);

ALTER TABLE Participacao_Reuniao
ADD CONSTRAINT fk_referencia_usuario
FOREIGN KEY (id_usuario)
REFERENCES usuario(id_usuario);

CREATE TABLE Recurso(
    id_recurso SERIAL primary key,
    tipo VARCHAR(50) not null,
    data_inicial DATE,
    data_final DATE
);

CREATE TABLE Reserva_Recurso(
    id_projeto INT,
    id_recurso INT
);

ALTER TABLE Reserva_Recurso
ADD CONSTRAINT fk_referencia_projeto
FOREIGN KEY (id_projeto)
REFERENCES projeto(id_projeto);

ALTER TABLE Reserva_Recurso
ADD CONSTRAINT fk_referencia_recurso
FOREIGN KEY (id_recurso)
REFERENCES recurso(id_recurso)

CREATE TABLE Entrega(
    id_projeto          INT,
    id_entrega          SERIAL primary key,
    data_de_envio       TIMESTAMP not null,
    status              VARCHAR(20) not null,
    link_repositorio    VARCHAR(255),
    versao_major        INT not null,
    versao_minor        INT not null,
    versao_patch        INT not null
);

ALTER TABLE Entrega
ADD CONSTRAINT fk_Referencia_Projeto
FOREIGN KEY (id_projeto)
REFERENCES projeto(id_projeto);

CREATE TABLE Comentario_Entrega(
    id_projeto INT,
    id_entrega INT,
    comentario TEXT primary key
);

ALTER TABLE Comentario_Entrega
ADD CONSTRAINT fk_referencia_entrega
FOREIGN KEY (id_projeto)
REFERENCES projeto(id_projeto);

ALTER TABLE Comentario_Entrega
ADD CONSTRAINT fk_referencia_entrega2
FOREIGN KEY (id_entrega)
REFERENCES entrega(id_entrega);

CREATE TABLE Avaliacao(
    id_projeto          INT,
    id_entrega          INT,
    id_professor        INT,
    funcionalidade      TEXT,
    documentacao        TEXT,
    nota_final          DECIMAL(4,2),
    apresentacao        TEXT,
    data_de_correcao    DATE not null,
    hora_de_correcao    TIME not null,
    semestre_letivo     VARCHAR(10) Not Null,
    pontos_positivos    TEXT,
    pontos_a_melhorar   TEXT,
    observacoes_gerais  TEXT
);

ALTER TABLE Avaliacao
ADD constraint fk_ref_entrega
FOREIGN KEY (id_projeto)
REFERENCES projeto(id_projeto);

ALTER TABLE Avaliacao
ADD constraint fk_ref_entrega_proj
FOREIGN KEY (id_entrega)
REFERENCES entrega(id_entrega);

ALTER TABLE Avaliacao
ADD constraint fk_ref_professor
FOREIGN KEY (id_professor)
REFERENCES usuario(id_usuario);