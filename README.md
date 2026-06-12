# 1. Script SQL
Crie um arquivo .sql com todos os CREATE TABLE, incluindo PKs, FKs, constraints e checks conforme especificado acima. Adicione também índices nas colunas de FK mais consultadas.

# 2. Inserts de exemplo
Popule o banco com dados fictícios suficientes para validar as queries abaixo. 
Sugestão mínima: 5 alunos, 4 matérias com pelo menos 3 tópicos cada, matrículas variadas, registros de tópicos concluídos e pelo menos 10 avaliações corrigidas com notas distintas.

# 3. Queries obrigatórias
Implemente as cinco queries abaixo. Cada uma corresponde a um indicador que será exibido no painel da plataforma.
KPI — Avaliações realizadas Retorne a contagem total de avaliações.
KPI — Quantidade de alunos Retorne o total de alunos cadastrados.
KPI — Taxa de aprovação Um aluno é considerado aprovado quando a média de todas as suas notas em avaliações corrigidas é igual ou superior a 6. 
Retorne o percentual de aprovados sobre o total de alunos que possuem ao menos uma avaliação corrigida.
Tabela — Alunos por matéria Retorne cada matéria com a contagem de alunos matriculados, ordenado pelo nome da matéria.
Tabela — Desempenho por aluno Retorne nome, matrícula, média geral, quantidade de avaliações realizadas e situação (Aprovado / Reprovado) de cada aluno, ordenado pela média em ordem decrescente.
Alunos sem avaliações corrigidas devem aparecer no final.
Tabela — Progresso no plano de estudos Para cada aluno e matéria em que está matriculado, retorne o total de tópicos da matéria, quantos o aluno já concluiu e o percentual de conclusão. 
Ordene por aluno e depois por matéria.
