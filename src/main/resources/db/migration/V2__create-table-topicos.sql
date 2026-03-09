CREATE TABLE topicos (
    id SERIAL PRIMARY KEY,
    titulo VARCHAR(100) NOT NULL,
    mensagem TEXT NOT NULL,
    data_criacao TIMESTAMP NOT NULL,
    status VARCHAR(50) NOT NULL,
    autor_id INTEGER NOT NULL REFERENCES usuarios(id),
    curso VARCHAR(100) NOT NULL,
    
    CONSTRAINT uk_topico UNIQUE (titulo, mensagem)
);
