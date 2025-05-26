CREATE DATABASE IF NOT EXISTS cpa_db;
 USE cpa_db;


-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS alunos (
    id_aluno INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    cpf VARCHAR(14) NOT NULL UNIQUE,
    senha VARCHAR(100) NOT NULL,
    data_nascimento DATE NOT NULL,
    endereco VARCHAR(150),
    email VARCHAR(100) UNIQUE,
    cep VARCHAR(9),
    matricula VARCHAR(20) NOT NULL UNIQUE,
    curso VARCHAR(100) NOT NULL,
    turno VARCHAR(20),
    periodo VARCHAR(20)
); 
SHOW TABLES;

CREATE TABLE IF NOT EXISTS professores (
    id_professor INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    cpf VARCHAR(14) NOT NULL UNIQUE,
    senha VARCHAR(100) NOT NULL,
    data_nascimento DATE NOT NULL,
    telefone VARCHAR(15),
    endereco VARCHAR(150),
    email VARCHAR(100) UNIQUE,
    cep VARCHAR(9),
    turma VARCHAR(50),
    disciplina VARCHAR(100) NOT NULL
);

CREATE TABLE avaliacoes (
    id_avaliacao INT AUTO_INCREMENT PRIMARY KEY,
    id_aluno INT NOT NULL,
    id_professor INT NOT NULL,
    data_avaliacao DATE NOT NULL,
    criterio1 TINYINT CHECK (criterio1 BETWEEN 1 AND 5),
    criterio2 TINYINT CHECK (criterio2 BETWEEN 1 AND 5),
    criterio3 TINYINT CHECK (criterio3 BETWEEN 1 AND 5),
    criterio4 TINYINT CHECK (criterio4 BETWEEN 1 AND 5),
    criterio5 TINYINT CHECK (criterio5 BETWEEN 1 AND 5),
    comentario TEXT,
    FOREIGN KEY (id_aluno) REFERENCES alunos(id_aluno) ON DELETE CASCADE,
    FOREIGN KEY (id_professor) REFERENCES professores(id_professor) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS relatorios (
    id_relatorio INT AUTO_INCREMENT PRIMARY KEY,
    id_professor INT NOT NULL,
    periodo VARCHAR(20) NOT NULL,
    caminho_arquivo VARCHAR(255),
    data_geracao DATE NOT NULL,
    FOREIGN KEY (id_professor) REFERENCES professores(id_professor) ON DELETE CASCADE
);

USE cpa_db;

-- Inserir alunos
INSERT INTO alunos (nome, cpf, senha, data_nascimento, endereco, email, cep, matricula, curso, turno, periodo)
VALUES 
('Ana Carolina Silva', '123.456.789-00', 'senha123', '2000-05-15', 'Rua A, 123', 'ana.silva@email.com', '69000-000', '2021001', 'Análise e Desenvolvimento de Sistemas', 'Noite', '5º'),
('Bruno Henrique Lima', '987.654.321-00', 'senha123', '1999-08-22', 'Rua B, 456', 'bruno.lima@email.com', '69000-001', '2021002', 'Análise e Desenvolvimento de Sistemas', 'Noite', '5º');

-- Inserir professores
INSERT INTO professores (nome, cpf, senha, data_nascimento, telefone, endereco, email, cep, turma, disciplina)
VALUES
('Carlos Alberto Souza', '111.222.333-44', 'senha123', '1980-02-10', '(92)91234-5678', 'Av. Central, 789', 'carlos.souza@email.com', '69000-002', 'ADS5N', 'Banco de Dados'),
('Mariana Ferreira Lopes', '555.666.777-88', 'senha123', '1985-06-30', '(92)99876-5432', 'Rua das Flores, 321', 'mariana.lopes@email.com', '69000-003', 'ADS5N', 'Programação Web');

-- Inserir avaliações
INSERT INTO avaliacoes (id_aluno, id_professor, data_avaliacao, criterio1, criterio2, criterio3, criterio4, criterio5, comentario)
VALUES
(1, 1, '2025-05-01', 5, 4, 5, 4, 5, 'Professor muito didático e domina bem o conteúdo.'),
(2, 1, '2025-05-02', 4, 4, 4, 5, 4, 'Aulas bem explicadas, mas poderia interagir mais.'),
(1, 2, '2025-05-03', 5, 5, 5, 5, 5, 'Ótima professora, explica com clareza e usa exemplos práticos.'),
(2, 2, '2025-05-04', 4, 5, 4, 5, 4, 'Muito boa, mas às vezes corre um pouco com o conteúdo.');

-- Inserir relatórios
INSERT INTO relatorios (id_professor, periodo, caminho_arquivo, data_geracao)
VALUES
(1, '2025-1', 'relatorios/relatorio_professor_1_2025-1.pdf', '2025-05-05'),
(2, '2025-1', 'relatorios/relatorio_professor_2_2025-1.pdf', '2025-05-05');

SHOW TABLES; 


SELECT * FROM alunos;
SELECT * FROM professores;
SELECT * FROM avaliacoes;
SELECT * FROM relatorios;

