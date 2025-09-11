-- ativar foreing keys no inicio do script
PRAGMA foreign_keys = ON;

-- tabela participante
CREATE TABLE participante (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    nome TEXT NOT NULL,
    email TEXT NOT NULL UNIQUE,
    telefone TEXT,
);

-- tabela evento
CREATE TABLE evento (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    nome TEXT NOT NULL,
    descricao TEXT,
    local TEXT NOT NULL,
    data TEXT NOT NULL,
);

-- tabela pagamento
CREATE TABLE pagamento (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    inscricao_id INTEGER NOT NULL,
    FOREIGN KEY (inscricao_id) REFERENCES inscricao(id) UNIQUE,
    valor REAL,
    data_pagamento TEXT,
    status TEXT CHECK (status IN ('PENDENTE', 'PAGO')),
);

-- tabela inscricao
CREATE TABLE inscricao (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    participante_id INTEGER NOT NULL,
    evento_id INTEGER NOT NULL,
    FOREIGN KEY (participante_id) REFERENCES participante(id) ON DELETE CASCADE,
    FOREIGN KEY (evento_id) REFERENCES evento(id) ON DELETE CASCADE,
    data_inscricao TEXT NOT NULL,
    status TEXT CHECK (status IN ('CONFIRMADA', 'CANCELADA')) NOT NULL
);