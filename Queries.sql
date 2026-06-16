-- 1 QUERIE

SELECT COUNT (*)
FROM avaliacao;

-- 2 QUERIE

SELECT COUNT (*)
FROM aluno;

-- 3 QUERIE 

SELECT
    ROUND(
        100.0 * COUNT(*) FILTER (WHERE media >= 6)
        / COUNT(*),
        2
    ) AS taxa_aprovacao
FROM (
    SELECT
        aluno_id,
        AVG(nota) AS media
    FROM avaliacao
    WHERE nota IS NOT NULL
    GROUP BY aluno_id
) medias;

-- 4 QUERIE

SELECT
    aluno.nome, 
    materia.nome 
FROM aluno
JOIN matricula
    ON aluno.id = matricula.aluno_id
JOIN materia
    ON materia.id = matricula.materia_id
ORDER BY materia.nome;

-- 5 QUERIE 

SELECT
    aluno.nome AS aluno,
    aluno.matricula AS matricula,
    ROUND(AVG(avaliacao.nota),2) AS media_geral,
    COUNT(avaliacao.id) AS quantidade_avaliacoes,
    CASE
        WHEN AVG(avaliacao.nota) >= 6 THEN 'Aprovado'
        WHEN AVG(avaliacao.nota) < 6 THEN 'Reprovado'
        ELSE 'Sem avaliações'
    END AS situacao
FROM aluno
LEFT JOIN avaliacao
    ON aluno.id = avaliacao.aluno_id
GROUP BY
    aluno.id,
    aluno.nome,
    aluno.matricula
ORDER BY AVG(avaliacao.nota) DESC NULLS LAST;

-- 6 QUERIE

SELECT
    aluno.nome AS aluno,
    materia.nome AS materia,
    COUNT(topico.id) AS total_topicos,
    COUNT(topico_aluno.topico_id) AS topicos_concluidos,
    ROUND(
        COUNT(topico_aluno.topico_id) * 100.0 / COUNT(topico.id),
        2
    ) AS percentual_conclusao
FROM aluno AS aluno
JOIN matricula AS matricula
    ON aluno.id = matricula.aluno_id
JOIN materia AS materia
    ON materia.id = matricula.materia_id
JOIN topico AS topico
    ON topico.materia_id = materia.id
LEFT JOIN topico_aluno AS topico_aluno
    ON topico_aluno.aluno_id = aluno.id
   AND topico_aluno.topico_id = topico.id
GROUP BY
    aluno.nome,
    materia.nome
ORDER BY
    aluno.nome,
    materia.nome;


