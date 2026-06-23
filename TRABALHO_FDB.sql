create table Usuario(
id_usuario SERIAL PRIMARY KEY,
email      VARCHAR(100) Unique,
senha      VARCHAR(255) NOT NULL,
primeiro_nome VARCHAR(50) NOT NULL,
nome_meio     VARCHAR(50) NOT NULL,
ultimo_nome   VARCHAR(50) NOT NULL
);

create table Aluno(
id_usuario INT,
matricula VARCHAR(20) UNIQUE,
curso VARCHAR(100) NOT NULL,
semestre INT NOT NULL
);

alter table Aluno
ADD CONSTRAINT fk_id_usuario
FOREIGN KEY (id_usuario)
references Usuario(id_usuario);

ALTER TABLE Aluno
ALTER COLUMN matricula SET NOT NULL;

create table Professor(
id_usuario INT,
id_funcional SERIAL Not Null,
departamento VARCHAR(100) Not Null,
titulacao VARCHAR(50) Not Null
);

alter table Professor
ADD CONSTRAINT fk_id_usuario
FOREIGN KEY (id_usuario)
references Usuario(id_usuario);

create table Projeto(
id_projeto SERIAL PRIMARY KEY,
nome VARCHAR(150) Not Null,
comite VARCHAR(100),
descricao TEXT,
data_inicio DATE Not Null,
data_fim DATE,
prazo DATE,
categoria VARCHAR(50),
status VARCHAR(20) Not Null,
id_professor_orientador INT
);

alter table Projeto
ADD CONSTRAINT fk_referencia_professor
FOREIGN KEY (id_professor_orientador)
references Usuario (id_usuario);

create table Membro_Equipe(
id_projeto INT,
id_aluno INT
);

alter table Membro_Equipe
ADD CONSTRAINT fk_referencia_projeto
FOREIGN KEY (id_projeto)
references projeto(id_projeto);

alter table Membro_Equipe
ADD CONSTRAINT fk_referencia_aluno
FOREIGN KEY (id_aluno)
references usuario(id_usuario)

create table Reuniao(
id_reuniao serial primary key,
data_da_reuniao DATE not null,
horario_de_inicio time not null,
horario_de_fim time not null,
local VARCHAR(100),
tipo VARCHAR(50),
pauta TEXT
);

create table Participacao_Reuniao(
id_reuniao INT,
id_usuario INT
);

alter table Participacao_Reuniao
ADD CONSTRAINT fk_referencia_reuniao
FOREIGN KEY (id_reuniao)
references reuniao(id_reuniao);

alter table Participacao_Reuniao
ADD CONSTRAINT fk_referencia_usuario
FOREIGN KEY (id_usuario)
references usuario(id_usuario)

create table Recurso(
id_recurso SERIAL primary key,
tipo VARCHAR(50) not null,
data_inicial DATE,
data_final DATE
);

create table Reserva_Recurso(
id_projeto INT,
id_recurso INT
);

alter table Reserva_Recurso
ADD CONSTRAINT fk_referencia_projeto
FOREIGN KEY (id_projeto)
references projeto(id_projeto);

alter table Reserva_Recurso
ADD CONSTRAINT fk_referencia_recurso
FOREIGN KEY (id_recurso)
references recurso(id_recurso)

create table Entrega(
id_projeto INT,
id_entrega SERIAL primary key,
data_de_envio TIMESTAMP not null,
status VARCHAR(20) not null,
link_repositorio VARCHAR(255),
versao_major INT not null,
versao_minor INT not null,
versao_patch INT not null
);

alter table Entrega
ADD CONSTRAINT fk_Referencia_Projeto
FOREIGN KEY (id_projeto)
references projeto(id_projeto);

create table Comentario_Entrega(
id_projeto INT,
id_entrega INT,
comentario TEXT primary key
);

alter table Comentario_Entrega
ADD CONSTRAINT fk_referencia_entrega
FOREIGN KEY (id_projeto)
references projeto(id_projeto);

alter table Comentario_Entrega
ADD CONSTRAINT fk_referencia_entrega2
FOREIGN KEY (id_entrega)
references entrega(id_entrega);

create table Avaliacao(
id_projeto INT,
id_entrega INT,
id_professor INT,
funcionalidade TEXT,
documentacao TEXT,
nota_final DECIMAL(4,2),
apresentacao TEXT
data_de_correcao DATE not null,
hora_de_correcao TIME not null,
semestre_letivo VARCHAR(10) Not Null,
pontos_positivos TEXT,
pontos_a_melhorar TEXT,
observacoes_gerais TEXT
);

alter table Avaliacao
add constraint fk_ref_entrega
foreign key (id_projeto)
references projeto(id_projeto)

alter table Avaliacao
add constraint fk_ref_entrega_proj
foreign key (id_entrega)
references entrega(id_entrega)

alter table Avaliacao
add constraint fk_ref_professor
foreign key (id_professor)
references usuario(id_usuario)