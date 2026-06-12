-- TABELA: aluno

CREATE TABLE aluno (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(150) NOT NULL,
    matricula VARCHAR(20) NOT NULL UNIQUE
);

-- TABELA: materia

CREATE TABLE materia (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    descricao TEXT,
    prompt_ia TEXT NOT NULL
);

-- TABELA: topico

CREATE TABLE topico (
    id SERIAL PRIMARY KEY,
    materia_id INTEGER NOT NULL,
    titulo VARCHAR(200) NOT NULL,
    descricao TEXT,
    ordem INTEGER NOT NULL,

    CONSTRAINT fk_topico_materia
        FOREIGN KEY (materia_id)
        REFERENCES materia(id),

    CONSTRAINT uq_topico_materia_ordem
        UNIQUE (materia_id, ordem)
);

-- TABELA: topico_aluno

CREATE TABLE topico_aluno (
    id SERIAL PRIMARY KEY,
    aluno_id INTEGER NOT NULL,
    topico_id INTEGER NOT NULL,
    concluido_em TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT fk_topico_aluno_aluno
        FOREIGN KEY (aluno_id)
        REFERENCES aluno(id),

    CONSTRAINT fk_topico_aluno_topico
        FOREIGN KEY (topico_id)
        REFERENCES topico(id),

    CONSTRAINT uq_topico_aluno
        UNIQUE (aluno_id, topico_id)
);

-- TABELA: matricula

CREATE TABLE matricula (
    id SERIAL PRIMARY KEY,
    aluno_id INTEGER NOT NULL,
    materia_id INTEGER NOT NULL,
    data_matricula TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT fk_matricula_aluno
        FOREIGN KEY (aluno_id)
        REFERENCES aluno(id),

    CONSTRAINT fk_matricula_materia
        FOREIGN KEY (materia_id)
        REFERENCES materia(id),

    CONSTRAINT uq_matricula
        UNIQUE (aluno_id, materia_id)
);

-- TABELA: avaliacao

CREATE TABLE avaliacao (
    id SERIAL PRIMARY KEY,
    aluno_id INTEGER NOT NULL,
    materia_id INTEGER NOT NULL,
    titulo TEXT NOT NULL,
    nota NUMERIC(4,1),
    feedback_ia TEXT,
    status VARCHAR(20) NOT NULL DEFAULT 'pendente',
    data_envio TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT fk_avaliacao_aluno
        FOREIGN KEY (aluno_id)
        REFERENCES aluno(id),

    CONSTRAINT fk_avaliacao_materia
        FOREIGN KEY (materia_id)
        REFERENCES materia(id),

    CONSTRAINT chk_avaliacao_nota
        CHECK (nota BETWEEN 0 AND 10),

    CONSTRAINT chk_avaliacao_status
        CHECK (status IN ('pendente', 'em_andamento', 'corrigida'))
);


-- TABELA: historico_conversa

CREATE TABLE historico_conversa (
    id SERIAL PRIMARY KEY,
    materia_id INTEGER NOT NULL,
    role VARCHAR(20) NOT NULL,
    conteudo TEXT NOT NULL,
    criado_em TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT fk_historico_materia
        FOREIGN KEY (materia_id)
        REFERENCES materia(id),

    CONSTRAINT chk_historico_role
        CHECK (role IN ('user', 'assistant'))
);

-- ÍNDICES

CREATE INDEX idx_topico_materia_id
ON topico(materia_id);

CREATE INDEX idx_topico_aluno_aluno_id
ON topico_aluno(aluno_id);

CREATE INDEX idx_topico_aluno_topico_id
ON topico_aluno(topico_id);

CREATE INDEX idx_matricula_aluno_id
ON matricula(aluno_id);

CREATE INDEX idx_matricula_materia_id
ON matricula(materia_id);

CREATE INDEX idx_avaliacao_aluno_id
ON avaliacao(aluno_id);

CREATE INDEX idx_avaliacao_materia_id
ON avaliacao(materia_id);

CREATE INDEX idx_historico_conversa_materia_id
ON historico_conversa(materia_id);

