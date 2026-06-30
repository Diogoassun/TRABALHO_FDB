TRUNCATE TABLE Usuario RESTART IDENTITY CASCADE;
TRUNCATE TABLE Projeto RESTART IDENTITY CASCADE;
TRUNCATE TABLE Reuniao RESTART IDENTITY CASCADE;
TRUNCATE TABLE Recurso RESTART IDENTITY CASCADE;

-- 1. Inserindo 20 Usuários (IDs 1 a 10 para Alunos, 11 a 20 para Professores)
INSERT INTO Usuario (email, senha, primeiro_nome, nome_meio, ultimo_nome) VALUES
('joao.silva@email.com', 'senha123', 'João', 'Batista', 'Silva'),
('maria.clara@email.com', 'senha123', 'Maria', 'Clara', 'Oliveira'),
('pedro.santos@email.com', 'senha123', 'Pedro', 'Henrique', 'Santos'),
('ana.costa@email.com', 'senha123', 'Ana', 'Beatriz', 'Costa'),
('lucas.lima@email.com', 'senha123', 'Lucas', 'Mendes', 'Lima'),
('julia.alves@email.com', 'senha123', 'Julia', 'Ferreira', 'Alves'),
('marcos.rocha@email.com', 'senha123', 'Marcos', 'Paulo', 'Rocha'),
('carla.dias@email.com', 'senha123', 'Carla', 'Fernanda', 'Dias'),
('fernando.gomes@email.com', 'senha123', 'Fernando', 'Luiz', 'Gomes'),
('patricia.melo@email.com', 'senha123', 'Patricia', 'Ribeiro', 'Melo'),
('carlos.prof@email.com', 'prof123', 'Carlos', 'Eduardo', 'Moura'),
('renata.prof@email.com', 'prof123', 'Renata', 'Campos', 'Vieira'),
('roberto.prof@email.com', 'prof123', 'Roberto', 'Carlos', 'Nunes'),
('sandra.prof@email.com', 'prof123', 'Sandra', 'Regina', 'Pinto'),
('marcelo.prof@email.com', 'prof123', 'Marcelo', 'Augusto', 'Freitas'),
('luciana.prof@email.com', 'prof123', 'Luciana', 'Aparecida', 'Teixeira'),
('andre.prof@email.com', 'prof123', 'André', 'Felipe', 'Cardoso'),
('camila.prof@email.com', 'prof123', 'Camila', 'Vitória', 'Martins'),
('tiago.prof@email.com', 'prof123', 'Tiago', 'José', 'Machado'),
('vanessa.prof@email.com', 'prof123', 'Vanessa', 'Cristina', 'Borges');

-- 2. Inserindo 10 Alunos (Vinculados aos IDs de usuário 1 ao 10)
INSERT INTO Aluno (id_usuario, matricula, curso, semestre) VALUES
(1, '20231001', 'Engenharia de Software', 3),
(2, '20231002', 'Ciência da Computação', 5),
(3, '20231003', 'Sistemas de Informação', 2),
(4, '20231004', 'Redes de Computadores', 4),
(5, '20231005', 'Engenharia da Computação', 6),
(6, '20231006', 'Engenharia de Software', 3),
(7, '20231007', 'Ciência da Computação', 8),
(8, '20231008', 'Sistemas de Informação', 1),
(9, '20231009', 'Análise e Desenv. de Sistemas', 2),
(10, '20231010', 'Análise e Desenv. de Sistemas', 4);

-- 3. Inserindo 10 Professores (Vinculados aos IDs de usuário 11 ao 20)
INSERT INTO Professor (id_usuario, departamento, titulacao) VALUES
(11, 'Computação', 'Doutor'),
(12, 'Computação', 'Mestre'),
(13, 'Engenharia', 'Doutor'),
(14, 'Engenharia', 'Especialista'),
(15, 'Matemática', 'Mestre'),
(16, 'Matemática', 'Doutor'),
(17, 'Administração', 'Mestre'),
(18, 'Administração', 'Doutor'),
(19, 'Estatística', 'Doutor'),
(20, 'Computação', 'Pós-Doutor');

-- 4. Inserindo 10 Projetos (Professores Orientadores: IDs 11 a 20)
INSERT INTO Projeto (nome, comite, descricao, data_inicio, data_fim, prazo, categoria, status, id_professor_orientador) VALUES
('Sistema de Biblioteca', 'Comitê de TI', 'Automatização do acervo.', '2024-01-15', NULL, '2024-12-15', 'Extensão', 'Em Andamento', 11),
('App de Mobilidade', 'Comitê de Inovação', 'App para rotas de ônibus.', '2024-02-01', NULL, '2024-11-30', 'Pesquisa', 'Em Andamento', 12),
('IA para Saúde', 'Comitê Científico', 'Diagnóstico por imagens.', '2023-08-10', '2024-03-20', '2024-03-30', 'Pesquisa', 'Concluído', 13),
('Portal do Aluno', 'Comitê de TI', 'Novo portal web.', '2024-03-05', NULL, '2024-10-10', 'Desenvolvimento', 'Atrasado', 14),
('Rede IoT', 'Comitê de Inovação', 'Sensores agrícolas.', '2024-01-20', NULL, '2024-09-15', 'Pesquisa', 'Em Andamento', 15),
('Robô Autônomo', 'Comitê de Robótica', 'Robô para entregas.', '2023-11-01', NULL, '2024-08-30', 'Pesquisa', 'Em Andamento', 16),
('ERP Universitário', 'Comitê de TI', 'Sistema de gestão.', '2024-04-01', NULL, '2025-04-01', 'Extensão', 'Planejamento', 17),
('Data Warehouse', 'Comitê de Dados', 'BI da faculdade.', '2023-05-10', '2024-01-15', '2024-01-15', 'Pesquisa', 'Concluído', 18),
('Jogo Educacional', 'Comitê de Inovação', 'Ensino de matemática.', '2024-02-15', NULL, '2024-07-20', 'Extensão', 'Em Andamento', 19),
('Cybersegurança', 'Comitê de TI', 'Auditoria de redes.', '2024-03-10', NULL, '2024-12-20', 'Pesquisa', 'Em Andamento', 20);

-- 5. Inserindo 10 Membros de Equipe (Alunos alocados nos Projetos)
INSERT INTO Membro_Equipe (id_projeto, id_aluno) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(9, 9),
(10, 10);

-- 6. Inserindo 10 Reuniões
INSERT INTO Reuniao (data_da_reuniao, horario_de_inicio, horario_de_fim, local, tipo, pauta) VALUES
('2024-01-10', '14:00:00', '15:00:00', 'Sala 101', 'Planejamento', 'Definição de escopo do projeto'),
('2024-02-05', '09:00:00', '10:30:00', 'Laboratório 3', 'Acompanhamento', 'Revisão da Sprint 1'),
('2024-03-12', '16:00:00', '17:00:00', 'Google Meet', 'Alinhamento', 'Dúvidas técnicas'),
('2024-04-08', '10:00:00', '12:00:00', 'Sala de Reuniões 2', 'Apresentação', 'Apresentação parcial para a banca'),
('2024-05-20', '15:30:00', '16:30:00', 'Google Meet', 'Feedback', 'Feedback do comitê'),
('2024-06-15', '14:00:00', '15:30:00', 'Laboratório 1', 'Planejamento', 'Definição de cronograma da fase 2'),
('2024-07-10', '08:00:00', '09:00:00', 'Sala 204', 'Daily', 'Status update rápido'),
('2024-08-05', '13:00:00', '15:00:00', 'Auditório', 'Apresentação', 'Defesa do protótipo'),
('2024-09-12', '17:00:00', '18:00:00', 'Teams', 'Encerramento', 'Preparação para entrega final'),
('2024-10-01', '10:00:00', '11:00:00', 'Sala dos Professores', 'Avaliação', 'Discussão sobre as notas');

-- 7. Inserindo 10 Participações em Reunião
INSERT INTO Participacao_Reuniao (id_reuniao, id_usuario) VALUES
(1, 1),
(1, 11),
(2, 2),
(2, 12),
(3, 3),
(4, 4),
(5, 5),
(6, 16),
(7, 7),
(8, 18);

-- 8. Inserindo 10 Recursos
INSERT INTO Recurso (tipo, data_inicial, data_final) VALUES
('Servidor AWS EC2', '2024-01-01', '2024-12-31'),
('Licença IDE', '2024-02-01', '2024-08-01'),
('Kit Arduino', '2024-03-01', '2024-06-30'),
('Laboratório Virtual', '2024-04-01', '2024-10-01'),
('Banco de Dados Oracle', '2024-01-10', '2024-11-10'),
('Impressora 3D', '2024-05-01', '2024-07-01'),
('Óculos VR', '2024-02-15', '2024-05-15'),
('Módulo GPS', '2024-03-20', '2024-06-20'),
('Raspberry Pi 4', '2024-01-05', '2024-12-05'),
('Créditos Azure', '2024-06-01', '2024-12-01');

-- 9. Inserindo 10 Reservas de Recurso
INSERT INTO Reserva_Recurso (id_projeto, id_recurso) VALUES
(1, 1),
(2, 8),
(3, 5),
(4, 2),
(5, 3),
(6, 6),
(7, 4),
(8, 10),
(9, 7),
(10, 9);

-- 10. Inserindo 10 Entregas
INSERT INTO Entrega (id_projeto, data_de_envio, status, link_repositorio, versao_major, versao_minor, versao_patch) VALUES
(1, '2024-03-10 14:30:00', 'Aceito', 'github.com/proj/biblio', 1, 0, 0),
(2, '2024-04-15 09:15:00', 'Em Avaliação', 'github.com/proj/mobilidade', 0, 9, 1),
(3, '2024-03-18 23:50:00', 'Aceito', 'gitlab.com/proj/iasaude', 2, 0, 0),
(4, '2024-05-10 10:00:00', 'Rejeitado', 'github.com/proj/portal', 1, 1, 0),
(5, '2024-06-20 16:45:00', 'Aceito', 'github.com/proj/redeiot', 1, 0, 2),
(6, '2024-07-05 11:20:00', 'Em Avaliação', 'bitbucket.org/proj/robo', 0, 5, 0),
(7, '2024-08-10 13:10:00', 'Aceito', 'github.com/proj/erp', 1, 0, 0),
(8, '2024-01-14 22:30:00', 'Aceito', 'github.com/proj/dw', 3, 1, 5),
(9, '2024-05-25 15:00:00', 'Aceito', 'github.com/proj/jogoedu', 1, 2, 0),
(10, '2024-06-30 08:40:00', 'Rejeitado', 'github.com/proj/cyber', 0, 8, 0);