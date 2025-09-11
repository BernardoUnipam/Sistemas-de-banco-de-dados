-- Para ativar o banco de dados
sqlite3 atividade.db

-- Para ativar as foreign keys
PRAGMA foreign_keys = ON;

-- criação da tabela participanete
CREATE TABLE participante (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    nome TEXT NOT NULL,
    email TEXT NOT NULL UNIQUE,
    telefone TEXT
);

-- criação da tabela evento
CREATE TABLE evento (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    nome TEXT NOT NULL,
    descricao TEXT,
    local TEXT NOT NULL,
    data TEXT NOT NULL
);

-- criação da tabela pagamento
CREATE TABLE pagamento (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    inscricao_id INTEGER UNIQUE,
    valor REAL,
    data_pagamento TEXT,
    status TEXT CHECK(status IN('pago', 'pendente')),
    FOREIGN KEY (inscricao_id) REFERENCES inscricao(id)
);

-- criação da tabela inscrição
CREATE TABLE inscricao (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    evento_id INTEGER NOT NULL,
    partincipante_id INTEGER NOT NULL,
    data_inscricao TEXT,
    status TEXT CHECK(status IN('confirmada', 'cancelada')),
    FOREIGN KEY (evento_id) REFERENCES evento(id),
    FOREIGN KEY (partincipante_id) REFERENCES participante(id)
);

-- Inserção de dados na tabela participante (3 registros)
INSERT INTO participante (nome, email, telefone) VALUES 
('Ana Silva', 'ana.silva@email.com', '(11) 98765-4321'),
('Carlos Santos', 'carlos.santos@email.com', '(11) 97654-3210'),
('Maria Oliveira', 'maria.oliveira@email.com', '(11) 96543-2109');

-- Inserção de dados na tabela evento (2 registros)
INSERT INTO evento (nome, descricao, local, data) VALUES 
('Seminário de Tecnologia', 'Seminário sobre novas tecnologias em desenvolvimento', 'Auditório Principal', '2024-12-15'),
('Workshop de Marketing Digital', 'Workshop prático sobre estratégias de marketing digital', 'Sala de Treinamento A', '2024-12-20');

-- Inserção de dados na tabela inscricao (4 registros)
INSERT INTO inscricao (evento_id, participante_id, data_inscricao, status) VALUES 
(1, 1, '2024-11-01', 'confirmada'),
(1, 2, '2024-11-02', 'confirmada'),
(2, 3, '2024-11-03', 'confirmada'),
(2, 1, '2024-11-04', 'confirmada');

-- Inserção de dados na tabela pagamento (4 registros)
INSERT INTO pagamento (inscricao_id, valor, data_pagamento, status) VALUES 
(1, 150.00, '2024-11-01', 'pago'),
(2, 150.00, '2024-11-02', 'pago'),
(3, 200.00, '2024-11-03', 'pendente'),
(4, 200.00, '2024-11-05', 'pago');