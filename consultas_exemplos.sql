/*
========================================
📁 consultas.sql
Autor: Wemili Maria 
Descrição: Um conjunto de consultas SQL para extrair informações do banco de dados
sobre filmes, atores e diretores
do projeto biblioteca-de-filmes-sql.
========================================
*/

-- ==========================
-- 🎬 TABELA: DIRETORES
-- ==========================

-- 1️ Consulta simples: listar todos os diretores
SELECT * FROM diretores;

-- 2 Consulta simples: mostrar apenas nomes e nacionalidades
SELECT nome, nacionalidade FROM diretores;

-- 3️ Filtro: diretores brasileiros
SELECT nome, idade, nacionalidade
FROM diretores
WHERE nacionalidade = 'Brasileiro';

-- 4️ Filtro com texto parcial (todos com nome contendo 'J')
SELECT nome, nacionalidade
FROM diretores
WHERE nome LIKE '%J%';

-- 5 Ordenar diretores por idade (alfabeticamente)
SELECT nome, idade
FROM diretores
ORDER BY idade ASC;


-- ==========================
-- 🎥 TABELA: FILMES
-- ==========================

-- 1️ Consulta simples: listar todos os filmes
SELECT * FROM filmes;

-- 2️ Consulta simples: mostrar título, e sinopse
SELECT titulo, sinopse FROM filmes;

-- 3️ Filtro: filmes de Romance
SELECT titulo, genero, avaliacao
FROM filmes
WHERE genero LIKE '%Romance%';

-- 4️ Filtro: filmes com avaliação acima de 8
SELECT titulo, avaliacao
FROM filmes
WHERE avaliacao >= 8;

-- 5 Filtro: Filmes com avaliação abaixo de 8
SELECT titulo, avaliacao
FROM filmes
WHERE avaliacao <= 7;

-- 6 Ordenar por bilheteria (do maior pro menor)
SELECT titulo, bilheteria_milhoes
FROM filmes
ORDER BY bilheteria_milhoes DESC;


-- ==========================
-- 🎭 TABELA: ATORES
-- ==========================

-- 1️ Consulta simples: listar todos os atores
SELECT * FROM atores;

-- 2️ Consulta simples: mostrar apenas nome e nacionalidade
SELECT nome, nacionalidade FROM atores;

-- 3️ Filtro: atores americanos
SELECT nome, idade
FROM atores
WHERE nacionalidade = 'Americano';

-- 4️ Filtro: atores cujo nome começa com 'J'
SELECT nome
FROM atores
WHERE nome LIKE 'J%';

-- 5️ Ordenar alfabeticamente
SELECT nome, nacionalidade
FROM atores
ORDER BY nome ASC;


-- ==========================
-- 🎬 TABELA: FILMES_ATORES
-- ==========================

-- 1️ Consulta simples: ver todos os vínculos
SELECT * FROM filmes_atores;

-- 2️ Consulta simples: contar quantos vínculos existem
SELECT COUNT(*) AS total_relacoes FROM filmes_atores;

-- 3️ Filtro: filmes com o ator 'Johnny Depp'
SELECT f.titulo, a.nome
FROM filmes_atores fa
JOIN filmes f ON fa.id_filme = f.id_filme
JOIN atores a ON fa.id_ator = a.id_ator
WHERE a.nome = 'Johnny Depp';

-- 4️ Filtro: Mostrar o ator de 'Lisbela e o Prisioneiro'
SELECT f.titulo, a.nome
FROM filmes_atores fa
JOIN filmes f ON fa.id_filme = f.id_filme
JOIN atores a ON fa.id_ator = a.id_ator
WHERE f.titulo = 'Lisbela e o Prisioneiro'

-- 5️ Quantos filmes cada ator participou
SELECT a.nome AS ator, COUNT(fa.id_filme) AS total_filmes
FROM filmes_atores fa
JOIN atores a ON a.id_ator = fa.id_ator
GROUP BY a.nome
ORDER BY total_filmes DESC;


-- ==========================
-- 🎞️ CONSULTAS MULTITABELAS EXTRAS
-- ==========================

-- 1️ Filmes com seus diretores
SELECT f.titulo, d.nome AS diretor
FROM filmes f
JOIN diretores d ON f.id_diretor = d.id_diretor;

-- 2️ Filmes, atores e diretores (tudo junto)
SELECT f.titulo, a.nome AS ator, d.nome AS diretor
FROM filmes f
JOIN filmes_atores fa ON f.id_filme = fa.id_filme
JOIN atores a ON a.id_ator = fa.id_ator
JOIN diretores d ON d.id_diretor = f.id_diretor;

-- 3️⃣ Top 5 filmes com maior bilheteria
SELECT titulo, bilheteria_milhoes
FROM filmes
ORDER BY bilheteria_milhoes DESC
LIMIT 5;
