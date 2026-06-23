# Sistema de Gestão Académica e de Projetos de Investigação

<p align="center">
  <h1>Documentação do Trabalho Final da Disciplina de Fundamentos de Banco de Dados</h1>
</p>

## Descrição do Projeto

Este projeto consiste no planeamento, modelação, implementação e desenvolvimento de um ecossistema completo de gestão académica e de projetos de investigação. O sistema foi concebido utilizando o modelo relacional sobre o motor de base de dados **PostgreSQL**, integrado com uma camada de aplicação interativa desenvolvida em **Python**, permitindo a execução de operações CRUD completas e a geração de relatórios analíticos em tempo real.

---

# 1. Criação das Tabelas e Modelo Físico (DDL)

No arquivo `TRABALHO_FDB.sql` foram criadas as tabelas referentes aos utilizadores, alunos, professores, membros de equipa, participação em reuniões, projetos, recursos, reservas de recursos, reuniões, entregas, comentários de entregas e avaliações.

## Estrutura e Finalidade das Entidades

### Usuario

Tabela centralizadora que funciona como supertipo para as entidades do corpo académico. Armazena dados essenciais como e-mail (único), palavra-passe e a divisão atómica do nome (primeiro nome, nome do meio e último nome).

### Aluno

Subtipo da entidade Usuario. Armazena informações académicas específicas como matrícula (única), curso e semestre atual.

### Professor

Subtipo da entidade Usuario. Armazena informações profissionais do docente, incluindo departamento e titulação máxima.

### Projeto

Regista iniciativas de investigação, extensão e desenvolvimento. Controla datas, prazos, categoria, descrição, estado de execução e professor orientador.

### Membro_Equipe

Tabela associativa responsável por representar a relação N:M entre projetos e alunos.

### Reuniao

Armazena informações relativas aos encontros das equipas, incluindo datas, horários, local, pauta e tipo da reunião.

### Participacao_Reuniao

Tabela associativa que controla a participação de utilizadores nas reuniões.

### Recurso

Cadastro de recursos físicos ou digitais disponibilizados para utilização pelos projetos.

### Reserva_Recurso

Tabela associativa responsável pelo controlo da alocação de recursos aos projetos.

### Entrega

Controla as versões dos artefactos produzidos pelos projetos, incluindo links para repositórios e histórico de versões.

### Comentario_Entrega

Permite o registo de observações e comentários associados a uma entrega específica.

### Avaliacao

Responsável pelo armazenamento das avaliações realizadas pelos professores, incluindo notas, observações, pontos positivos e aspetos a melhorar.

---

# 2. Definição das Chaves Primárias e Estrangeiras

A integridade referencial foi garantida através da definição adequada de chaves primárias e estrangeiras.

## Relações de Especialização (1:1)

As tabelas `Aluno` e `Professor` utilizam o atributo `id_usuario` simultaneamente como:

* Chave Primária (PK)
* Chave Estrangeira (FK)

referenciando a tabela `Usuario`.

## Relações de Orientação

A tabela `Projeto` referencia o professor orientador através do atributo:

```sql
id_professor_orientador
```

que aponta para um registo válido da tabela `Usuario`.

## Relações N:M

As seguintes tabelas implementam relacionamentos muitos-para-muitos:

* Membro_Equipe
* Participacao_Reuniao
* Reserva_Recurso

Todas utilizam chaves estrangeiras para garantir consistência entre os registos relacionados.

## Rastreabilidade das Entregas

A tabela `Entrega` relaciona-se diretamente com `Projeto`.

As tabelas:

* Comentario_Entrega
* Avaliacao

dependem simultaneamente de:

* id_projeto
* id_entrega

garantindo que comentários e avaliações estejam associados à entrega correta.

---

# 3. População e Consistência dos Dados (DML)

O ficheiro `SCRIPT_EXTENSÃO_TRABALHO_FDB.sql` contém os comandos responsáveis pela inserção dos dados de teste.

## Requisitos Atendidos

* Todas as 12 tabelas possuem no mínimo 10 registos.
* As dependências entre tabelas foram respeitadas.
* Os dados simulam cenários académicos reais.

## Sequência de Inserção

### 1. Utilizadores

Foram inseridos 20 utilizadores:

```text
IDs 1 a 20
```

### 2. Alunos

Foram utilizados os IDs:

```text
1 a 10
```

para popular a tabela `Aluno`.

### 3. Professores

Foram utilizados os IDs:

```text
11 a 20
```

para popular a tabela `Professor`.

### 4. Restantes Entidades

Posteriormente foram inseridos:

* Projetos
* Reuniões
* Recursos
* Reservas
* Entregas
* Comentários
* Avaliações

mantendo a integridade referencial em todas as operações.

## Limpeza para Reexecução

O script contém comandos de limpeza que permitem a sua execução repetida sem conflitos:

```sql
TRUNCATE TABLE Usuario RESTART IDENTITY CASCADE;
TRUNCATE TABLE Projeto RESTART IDENTITY CASCADE;
TRUNCATE TABLE Reuniao RESTART IDENTITY CASCADE;
TRUNCATE TABLE Recurso RESTART IDENTITY CASCADE;
```

---

# 4. Desenvolvimento da Interface Gráfica e Camada de Aplicação

O ficheiro:

```text
Trabalho_FDB_corrigido_TRES.ipynb
```

implementa uma aplicação funcional para gestão académica integrada com a base de dados PostgreSQL.

## 4.1 Arquitetura Técnica

### Gestão Segura de Credenciais

Foi utilizada a biblioteca:

```python
python-dotenv
```

para armazenar as credenciais da base de dados num ficheiro `.env`.

### Conectividade com PostgreSQL

A comunicação com a base de dados é realizada através das bibliotecas:

```python
psycopg2-binary
sqlalchemy
```

### Interface Gráfica

A GUI foi desenvolvida com:

```python
Panel
```

permitindo a criação de interfaces web interativas diretamente em ambiente Jupyter Notebook.

---

# 4.2 Módulos Operacionais (CRUD)

## Aba Menu

Página inicial responsável pela navegação entre os módulos do sistema.

## Aba Usuário

Permite:

* Inserir utilizadores
* Consultar utilizadores
* Atualizar informações
* Excluir registos

## Aba Aluno

Permite:

* Associar um utilizador existente a um aluno
* Registar matrícula
* Definir curso
* Definir semestre

respeitando a relação de herança entre Usuario e Aluno.

---

# 5. Relatórios Analíticos e Consultas Avançadas

A aba **Relatórios** disponibiliza consultas SQL avançadas para apoio à gestão académica.

## 5.1 Lista Completa de Alunos

Consulta baseada em junção relacional:

```sql
SELECT
    u.id_usuario,
    u.primeiro_nome,
    u.nome_meio,
    u.ultimo_nome,
    u.email,
    a.matricula,
    a.curso,
    a.semestre
FROM usuario u
INNER JOIN aluno a
    ON a.id_usuario = u.id_usuario
ORDER BY u.primeiro_nome;
```

### Objetivo

Exibir informações pessoais e académicas dos estudantes num único relatório.

---

## 5.2 Resumo Estatístico por Curso

Consulta baseada em agregação de dados:

```sql
SELECT
    curso,
    COUNT(*) AS total_alunos,
    ROUND(AVG(semestre),1) AS media_semestre
FROM aluno
GROUP BY curso
ORDER BY total_alunos DESC;
```

### Objetivo

Apresentar:

* Quantidade total de alunos por curso
* Média de semestre por curso

permitindo uma visão consolidada da distribuição académica.

---

## Atualização Dinâmica

O sistema disponibiliza o botão:

```text
Atualizar Relatório
```

que recarrega automaticamente os dados da base após qualquer alteração realizada nas demais abas do sistema.

---

#  Como Executar o Projeto

## 1. Instalar Dependências

```bash
pip install pandas sqlalchemy psycopg2-binary panel python-dotenv
```

---

## 2. Criar e Inicializar a Base de Dados

Criar uma base de dados PostgreSQL chamada:

```text
TRABALHO_FDB
```

Executar os scripts na seguinte ordem:

### Estrutura da Base

```text
TRABALHO_FDB.sql
```

### Carga Inicial de Dados

```text
SCRIPT_EXTENSÃO_TRABALHO_FDB.sql
```

---

## 3. Configuração do Ambiente

Abrir o ficheiro:

```text
Trabalho_FDB_corrigido_TRES.ipynb
```

Configurar as credenciais:

```env
DB_HOST=
DB_PORT=
DB_NAME=TRABALHO_FDB
DB_USER=
DB_PASSWORD=
```

---

## 4. Execução

No Jupyter Notebook ou JupyterLab:

1. Executar todas as células (`Run All Cells`);
2. Aguardar a inicialização da interface;
3. Utilizar os módulos CRUD e os relatórios analíticos através da aplicação web.

---

# Objetivos Atendidos

 Modelação Relacional

 Criação de Tabelas (DDL)

 Definição de Chaves Primárias e Estrangeiras

 Integridade Referencial

 Manipulação de Dados (DML)

 Operações CRUD

 Interface Gráfica

 Relatórios Analíticos

 Integração Python + PostgreSQL

 Aplicação Prática dos Conceitos de Fundamentos de Banco de Dados
