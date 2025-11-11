CREATE TABLE diretores (
    id_diretor INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    idade VARCHAR(50),
    nacionalidade VARCHAR(50)
);


INSERT INTO diretores (nome, idade, nacionalidade)
VALUES
('Joe Wright', '51', 'Britânico'),
('Catherine Hardwicke', '69', 'Americana'),
('Tim Burton', '66', 'Americano'),
('James Cameron', '70', 'Canadense'),
('Guel Arraes', '71', 'Brasileiro'),
('Emile Ardolino', 'Faleceu em 1993 com 50 anos', 'Americano'),
('Chris Weitz', '57', 'Americano'),
('Florian Henckel von Donnersmarck', '53', 'Alemão'),
('Michel Gondry', '60', 'Francês'),
('Jerry Zucker', '75', 'Americano'),
('P. J. Hogan', '59', 'Australiano'),
('Garry Marshall', 'Faleceu em 2016 com 81 anos', 'Americano');

CREATE TABLE filmes (
    id_filme INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(100) NOT NULL,
    ano INT,
    genero VARCHAR(50),
    sinopse VARCHAR(500),
    id_diretor INT,
    bilheteria_milhoes DECIMAL(10,2),
    duracao_minutos INT,
    avaliacao FLOAT,
    FOREIGN KEY (id_diretor) REFERENCES diretores(id_diretor)
);

INSERT INTO filmes (titulo, ano, genero, sinopse, id_diretor, bilheteria_milhoes, duracao_minutos, avaliacao)
VALUES
('Orgulho e Preconceito', 2005, 'Romance', 'Elizabeth Bennet enfrenta o arrogante Mr. Darcy e descobre que o amor pode nascer das maiores diferenças.',  1, 121.6, 129, 8.0),
('Crepúsculo', 2008, 'Romance/Fantasia','Bella se apaixona por Edward, um vampiro misterioso que luta entre o amor e a sede de sangue.',  2, 407.1, 122, 7.3),
('Alice no País das Maravilhas', 2010, 'Fantasia', 'Alice retorna a um mundo mágico cheio de criaturas excêntricas e descobre seu verdadeiro poder.',  3, 1025.5, 108, 6.4),
('Titanic', 1997, 'Drama/Romance', 'Um amor impossível nasce entre Jack e Rose a bordo do navio mais famoso — e trágico — da história.', 4, 2260.0, 195, 9.0),
('O Auto da Compadecida', 2000, 'Comédia', 'Chicó e João Grilo aprontam no sertão nordestino com muito humor e uma ajudinha divina.', 5, 11.0, 104, 9.2),
('Dirty Dancing', 1987, 'Romance/Música', 'Uma jovem tímida vive um verão inesquecível ao se apaixonar por seu instrutor de dança.',  6, 214.6, 100, 7.9),
('Edward Mãos de Tesoura', 1990, 'Fantasia/Romance', 'Um homem com tesouras no lugar das mãos tenta viver entre humanos e descobrir o amor.',  3, 86.0, 105, 8.2),
('Uma Linda Mulher', 1990, 'Romance', 'Um empresário e uma garota de programa vivem um romance improvável que desafia rótulos.',  12, 463.4, 119, 8.0),
('Desejo e Reparação', 2007, 'Romance', 'Uma mentira muda o destino de dois amantes e marca uma vida inteira de culpa e saudade.', 1, 117.3, 123, 7.8),
('Crepúsculo - Lua Nova', 2009, 'Romance/Fantasia', 'Após Edward partir, Bella mergulha na dor — e encontra consolo nos braços de Jacob.',  7, 709.7, 130, 6.6),
('O Turista', 2010, 'Ação/Romance', 'Uma turista misteriosa envolve um homem comum num perigoso jogo de espionagem e amor.',  8, 278.3, 103, 6.0),
('Brilho Eterno de uma Mente sem Lembranças', 2004, 'Ficção Científica/Romance', 'Um casal apaga as memórias um do outro, mas o amor insiste em voltar.',  9, 72.3, 203, 8.3),
('Lisbela e o Prisioneiro', 2003, 'Comédia/Romance', 'Um malandro sedutor e uma sonhadora romântica vivem um amor cheio de humor e confusão.',  10, 505.7, 127, 7.0),
('A Lenda do Cavaleiro Sem Cabeça', 1999, 'Terror/Fantasia', 'Um detetive cético investiga assassinatos sombrios e descobre lendas que ganham vida.', 3, 206.0, 105, 7.4),
('O Casamento do Meu Melhor Amigo', 1997, 'Comédia/Romance', 'Uma mulher percebe que ama o melhor amigo… justo quando ele vai se casar.', 11, 241.4, 119, 6.3);

CREATE TABLE atores (
    id_ator INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100),
    idade VARCHAR(50),
    nacionalidade VARCHAR(50)
);


INSERT INTO atores (nome, idade, nacionalidade)
VALUES
('Keira Knightley', '39', 'Britânica'),
('Robert Pattinson', '35', 'Britânico'),
('Johnny Depp', '61', 'Americano'),
('Kate Winslet', '50', 'Britânica'),
('Selton Mello', '52', 'Brasileiro'),
('Patrick Swayze', 'Faleceu em 2009 com 57 anos', 'Americano'),
('Julia Roberts', '57', 'Americana');


CREATE TABLE filmes_atores (
    id_filme INT,
    id_ator INT,
    PRIMARY KEY (id_filme, id_ator),
    FOREIGN KEY (id_filme) REFERENCES filmes(id_filme),
    FOREIGN KEY (id_ator) REFERENCES atores(id_ator)
);

INSERT INTO filmes_atores (id_filme, id_ator)
VALUES
(1, 1), -- Keira Knightley em Orgulho e Preconceito
(2, 2), -- Robert Pattinson em Crepúsculo
(3, 3), -- Johnny Depp em Alice no País das Maravilhas
(4, 4), -- Kate Winslet em Titanic
(5, 5), -- Selton Mello em O Auto da Compadecida
(6, 6), -- Patrick Swayze em Dirty Dancing
(7, 3), -- Johnny Depp em Edward Mãos de Tesoura
(8, 7), -- Julia Roberts em Uma Linda Mulher
(9, 1), -- Keira Knightley em Desejo e Reparação
(10, 2), -- Robert Pattinson em Crepúsculo - Lua Nova
(11, 3), -- Johnny Depp em O Turista
(12, 4), -- Kate Winslet em Brilho Eterno
(13, 5), -- Selton Mello em Lisbela e o Prisioneiro
(14, 3), -- Johnny Depp em A Lenda do Cavaleiro Sem Cabeça
(15, 7); -- Julia Roberts em O Casamento do Meu Melhor Amigo
