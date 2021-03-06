-- ALUNO
insert into alunos (redu_id, created_at, updated_at)
values (1, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

insert into alunos (redu_id, created_at, updated_at)
values (2, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

insert into alunos (redu_id, created_at, updated_at)
values (3, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

insert into alunos (redu_id, created_at, updated_at)
values (4, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

-- PROVAS
insert into provas (professor_id, disciplina_id, aula_id, titulo, disponivel_data_inicio, disponivel_data_fim, duracao, created_at, updated_at)
values (1, 1, 1, "Prova 1", datetime('now', '+5 days'), datetime('now', '+7 days'), 60, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

insert into provas (professor_id, disciplina_id, aula_id, titulo, disponivel_data_inicio, disponivel_data_fim, duracao, created_at, updated_at)
values (1, 1, 1, "Prova 2", datetime('now', '-5 days'), datetime('now', '+7 days'), 60, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

insert into provas (professor_id, disciplina_id, aula_id, titulo, disponivel_data_inicio, disponivel_data_fim, duracao, created_at, updated_at)
values (1, 1, 1, "Prova 3", datetime('now', '-180 days'), datetime('now', '+1 days'), 60, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

insert into provas (professor_id, disciplina_id, aula_id, titulo, disponivel_data_inicio, disponivel_data_fim, duracao, created_at, updated_at)
values (1, 1, 1, "Prova 4", datetime('now', '-200 days'), datetime('now', '-1 days'), 60, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

-- ALUNO X PROVA
insert into alunos_provas (aluno_id, prova_id)
values (1 , 1);

insert into alunos_provas (aluno_id, prova_id)
values (1 , 2);

insert into alunos_provas (aluno_id, prova_id)
values (1 , 3);

insert into alunos_provas (aluno_id, prova_id)
values (2 , 1);

insert into alunos_provas (aluno_id, prova_id)
values (2 , 2);

insert into alunos_provas (aluno_id, prova_id)
values (3 , 2);

insert into alunos_provas (aluno_id, prova_id)
values (3 , 4);

insert into alunos_provas (aluno_id, prova_id)
values (4 , 4);

-- QUESTOES

-- P1
insert into questaos (prova_id, enunciado, valor, created_at, updated_at)
values (1, "Questao 1, Prova 1", 2.5, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

insert into questaos (prova_id, enunciado, valor, created_at, updated_at)
values (1, "Questao 2, Prova 1", 2.5, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

insert into questaos (prova_id, enunciado, valor, created_at, updated_at)
values (1, "Questao 3, Prova 1", 2.5, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

insert into questaos (prova_id, enunciado, valor, created_at, updated_at)
values (1, "Questao 4, Prova 1", 2.5, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

-- P2
insert into questaos (prova_id, enunciado, valor, created_at, updated_at)
values (2, "Questao 1, Prova 2", 2.5, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

insert into questaos (prova_id, enunciado, valor, created_at, updated_at)
values (2, "Questao 2, Prova 2", 2.5, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

-- P3
insert into questaos (prova_id, enunciado, valor, created_at, updated_at)
values (3, "Questao 1, Prova 3", 2, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

insert into questaos (prova_id, enunciado, valor, created_at, updated_at)
values (3, "Questao 2, Prova 3", 2, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

insert into questaos (prova_id, enunciado, valor, created_at, updated_at)
values (3, "Questao 3, Prova 3", 2, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

-- P4
insert into questaos (prova_id, enunciado, valor, created_at, updated_at)
values (4, "Questao 1, Prova 4", 1, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

-- PROSICOES

-- P1
insert into proposicaos (questao_id, resposta, texto, created_at, updated_at)
values (1, 'True', "Enunciado 1 Questao 1 Prova 1", CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

insert into proposicaos (questao_id, resposta, texto, created_at, updated_at)
values (1, 'False', "Enunciado 2 Questao 1 Prova 1", CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

insert into proposicaos (questao_id, resposta, texto, created_at, updated_at)
values (2, 'False', "Enunciado 1 Questao 2 Prova 1", CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

insert into proposicaos (questao_id, resposta, texto, created_at, updated_at)
values (2, 'True', "Enunciado 2 Questao 2 Prova 1", CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

insert into proposicaos (questao_id, resposta, texto, created_at, updated_at)
values (3, 'False', "Enunciado 1 Questao 3 Prova 1", CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

insert into proposicaos (questao_id, resposta, texto, created_at, updated_at)
values (3, 'False', "Enunciado 2 Questao 3 Prova 1", CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

insert into proposicaos (questao_id, resposta, texto, created_at, updated_at)
values (4, 'True', "Enunciado 1 Questao 4 Prova 1", CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

insert into proposicaos (questao_id, resposta, texto, created_at, updated_at)
values (4, 'True', "Enunciado 2 Questao 4 Prova 1", CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

-- P2
insert into proposicaos (questao_id, resposta, texto, created_at, updated_at)
values (5, 'True', "Enunciado 1 Questao 5 Prova 2", CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

insert into proposicaos (questao_id, resposta, texto, created_at, updated_at)
values (5, 'True', "Enunciado 2 Questao 5 Prova 2", CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

insert into proposicaos (questao_id, resposta, texto, created_at, updated_at)
values (6, 'False', "Enunciado 1 Questao 6 Prova 2", CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

insert into proposicaos (questao_id, resposta, texto, created_at, updated_at)
values (6, 'True', "Enunciado 2 Questao 6 Prova 2", CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

-- P3
insert into proposicaos (questao_id, resposta, texto, created_at, updated_at)
values (7, 'True', "Enunciado 1 Questao 7 Prova 3", CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

insert into proposicaos (questao_id, resposta, texto, created_at, updated_at)
values (7, 'True', "Enunciado 2 Questao 7 Prova 3", CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

insert into proposicaos (questao_id, resposta, texto, created_at, updated_at)
values (8, 'False', "Enunciado 1 Questao 8 Prova 3", CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

insert into proposicaos (questao_id, resposta, texto, created_at, updated_at)
values (8, 'False', "Enunciado 2 Questao 8 Prova 3", CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

insert into proposicaos (questao_id, resposta, texto, created_at, updated_at)
values (9, 'False', "Enunciado 1 Questao 9 Prova 3", CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

insert into proposicaos (questao_id, resposta, texto, created_at, updated_at)
values (9, 'True', "Enunciado 2 Questao 9 Prova 3", CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

-- P4
insert into proposicaos (questao_id, resposta, texto, created_at, updated_at)
values (7, 'False', "Enunciado 1 Questao 10 Prova 4", CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

insert into proposicaos (questao_id, resposta, texto, created_at, updated_at)
values (7, 'False', "Enunciado 2 Questao 10 Prova 4", CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);