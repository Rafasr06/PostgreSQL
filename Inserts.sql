INSERT INTO aluno(
nome,
matricula
)
VALUES 
('Rafael','00102030405060708090'),
('Pedro','00102030405060708091'),
('Maria','00102030405060708092'),
('Raquel','00102030405060708093'),
('Henrique','00102030405060708094');

SELECT * FROM aluno

INSERT INTO materia(
nome,
descricao,
prompt_ia
)
VALUES
('Banco de Dados', 
'Na materia de Banco de Dados os alunos deveram estudar conceitos relacionados a area',
'Voce e um professor de Banco de Dados e deve avaliar os alunos sobre os assuntos abordados'),

('Python',
'Na materia de Python os alunos deverao estudar logica de programacao, estruturas de dados, funcoes e programacao orientada a objetos',
'Voce e um professor de Python e deve avaliar os alunos sobre os assuntos abordados'),

('Algoritmos',
'Na materia de Algoritmos os alunos deverao estudar logica de programacao, estruturas de decisao e estruturas de repeticao',
'Voce e um professor de Algoritmos e deve avaliar os alunos sobre os assuntos abordados'),

('Engenharia de Software',
'Na materia de Engenharia de Software os alunos deverao estudar levantamento de requisitos, modelagem UML, testes e metodologias de desenvolvimento',
'Voce e um professor de Engenharia de Software e deve avaliar os alunos sobre os assuntos abordados');

SELECT * FROM materia

INSERT INTO topico (
    materia_id,
    titulo,
    descricao,
    ordem
)
VALUES
(1, 'Modelo Relacional', 'Introducao ao modelo relacional e suas caracteristicas', 1),
(1, 'SQL Basico', 'Comandos SELECT, INSERT, UPDATE e DELETE', 2),
(1, 'Normalizacao', 'Aplicacao das formas normais em bancos de dados', 3),

(2, 'Variaveis e Tipos', 'Declaracao de variaveis e tipos de dados', 1),
(2, 'Funcoes', 'Criacao e utilizacao de funcoes em Python', 2),
(2, 'Programacao Orientada a Objetos', 'Conceitos de classes, objetos e heranca', 3),

(3, 'Logica de Programacao', 'Introducao ao raciocinio logico para resolucao de problemas', 1),
(3, 'Estruturas de Decisao', 'Utilizacao de if, else e elif', 2),
(3, 'Estruturas de Repeticao', 'Utilizacao de for e while', 3),

(4, 'Levantamento de Requisitos', 'Identificacao e documentacao de requisitos', 1),
(4, 'Diagramas UML', 'Modelagem de sistemas utilizando UML', 2),
(4, 'Testes de Software', 'Conceitos e tecnicas de testes de software', 3);

SELECT * FROM topico

INSERT INTO topico_aluno (
    aluno_id,
    topico_id
)
VALUES
(1,1),
(1,2),
(1,3),
(2,4),
(2,5),
(2,6),
(3,7),
(3,8),
(3,9),
(4,10),
(4,11),
(5,12);

SELECT * FROM topico_aluno

INSERT INTO matricula (
    aluno_id,
    materia_id
)
VALUES
(1,1),
(1,2),

(2,2),
(2,3),

(3,3),
(3,4),

(4,1),
(4,4),

(5,2),
(5,3);

SELECT * FROM matricula

INSERT INTO avaliacao (
    aluno_id,
    materia_id,
    titulo,
    nota,
    feedback_ia,
    status
)
VALUES
(1,1,'Avaliacao de Banco de Dados',10.0,'Excelente dominio dos conceitos estudados.','corrigida'),

(1,2,'Avaliacao de Python',9.0,'Demonstrou boa compreensao da linguagem Python.','corrigida'),

(2,2,'Avaliacao de Python',8.5,'Bom desempenho geral nas atividades.','corrigida'),

(2,3,'Avaliacao de Algoritmos',8.0,'Apresentou bom raciocinio logico.','corrigida'),

(3,3,'Avaliacao de Algoritmos',7.5,'Consegue resolver problemas simples adequadamente.','corrigida'),

(3,4,'Avaliacao de Engenharia de Software',7.0,'Conhece os conceitos fundamentais da disciplina.','corrigida'),

(4,1,'Avaliacao de Banco de Dados',6.5,'Necessita revisar normalizacao e modelagem.','corrigida'),

(4,4,'Avaliacao de Engenharia de Software',6.0,'Pode aprofundar o conhecimento em UML.','corrigida'),

(5,2,'Avaliacao de Python',5.5,'Precisa praticar mais estruturas de repeticao e funcoes.','corrigida'),

(5,3,'Avaliacao de Algoritmos',4.0,'Necessita reforcar os estudos de logica de programacao.','corrigida');

SELECT * FROM avaliacao

INSERT INTO historico_conversa (
    materia_id,
    role,
    conteudo
)
VALUES
(1,'user','O que e normalizacao em banco de dados?'),

(1,'assistant','Normalizacao e um processo utilizado para reduzir redundancias e melhorar a organizacao dos dados.'),

(2,'user','Qual a diferenca entre lista e tupla em Python?'),

(2,'assistant','Listas sao mutaveis e tuplas sao imutaveis.'),

(3,'user','Quando devo utilizar uma estrutura de repeticao?'),

(3,'assistant','Quando houver necessidade de executar uma tarefa varias vezes.'),

(4,'user','O que e um caso de uso?'),

(4,'assistant','Um caso de uso descreve uma interacao entre um ator e o sistema para atingir um objetivo.');

SELECT * FROM historico_conversa









