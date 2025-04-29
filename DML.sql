CREATE DATABASE Cinema;
use Cinema;
CREATE TABLE Filme (
    id_filme INT AUTO_INCREMENT PRIMARY KEY,
    titulo varchar(255) NOT NULL,
    duracao_minutos INT NOT NULL,
    genero varchar(50)
);

CREATE TABLE Sessao (
    id_sessao INT AUTO_INCREMENT PRIMARY KEY,
    id_filme int NOT NULL,
    data_sessao DATE NOT NULL,
    horario time,
    capacidade_maxima int NOT NULL,
    FOREIGN KEY (id_filme) REFERENCES Filme(id_filme) ON DELETE CASCADE
);

CREATE TABLE Ingresso (
    id_ingresso INT AUTO_INCREMENT PRIMARY KEY,
    id_sessao int NOT NULL,
    nome_cliente varchar(100) NOT NULL,
    valor_pago decimal(6,2) NOT NULL,
    FOREIGN KEY (id_sessao) REFERENCES Sessao(id_sessao) ON DELETE CASCADE
);