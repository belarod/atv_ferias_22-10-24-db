CREATE TABLE categoria(
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    nome VARCHAR(30),
    genero VARCHAR(30)
);

CREATE TABLE pessoa(
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    nome VARCHAR(50),
    data_de_nascimento VARCHAR(10)
);

CREATE TABLE livro(
    isbn VARCHAR(13) PRIMARY KEY,
    titulo VARCHAR(30),
    status BOOLEAN,
    id_categoria INT,

    FOREIGN KEY (id_categoria) REFERENCES categoria(id)
);

CREATE TABLE autor(
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    nome VARCHAR(50)
);

CREATE TABLE aprecia(
    id_categoria INT,
    id_pessoa INT,

    FOREIGN KEY (id_categoria) REFERENCES categoria(id),
    FOREIGN KEY (id_pessoa) REFERENCES pessoa(id)
);

CREATE TABLE emprestimo(
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    data_inicio VARCHAR(10),
    data_fim VARCHAR(10)
);

CREATE TABLE livro_autor(
    id_livro VARCHAR(13),
    id_autor INT,

    FOREIGN KEY (id_livro) REFERENCES livro(isbn),
    FOREIGN KEY (id_autor) REFERENCES autor(id)
);

--INSERÇÃO--

INSERT INTO categoria (nome, genero) VALUES
('Ação', 'Masculino'),
('Aventura', 'Masculino'),
('Comédia', 'Feminino'),
('Drama', 'Feminino'),
('Terror', 'Masculino'),
('Ficção Científica', 'Masculino'),
('Romance', 'Feminino'),
('Documentário', 'Neutro'),
('Fantasia', 'Masculino'),
('Suspense', 'Neutro'),
('Musical', 'Feminino'),
('Mistério', 'Neutro'),
('Animação', 'Neutro'),
('Biografia', 'Neutro'),
('Histórico', 'Masculino'),
('Policial', 'Masculino'),
('Guerra', 'Masculino'),
('Faroeste', 'Masculino'),
('Esporte', 'Neutro'),
('Infantil', 'Neutro');

INSERT INTO pessoa (nome, data_de_nascimento) VALUES
('Ana Maria', '1990-01-15'),
('João Carlos', '1985-02-20'),
('Marcos Silva', '1992-03-10'),
('Carla Souza', '1988-04-18'),
('Lucas Oliveira', '1995-05-25'),
('Fernanda Lima', '1993-06-30'),
('Pedro Santos', '1990-07-05'),
('Júlia Pereira', '1991-08-15'),
('Mateus Alves', '1989-09-22'),
('Sofia Costa', '1994-10-10'),
('Leonardo Rocha', '1987-11-12'),
('Isabela Fernandes', '1996-12-05'),
('Gabriel Mendes', '1986-01-18'),
('Laura Andrade', '1992-02-28'),
('Ricardo Gomes', '1993-03-25'),
('Patrícia Duarte', '1984-04-11'),
('Rafael Martins', '1991-05-06'),
('Bianca Ferreira', '1990-06-17'),
('André Correia', '1988-07-29'),
('Camila Nogueira', '1995-08-08');

INSERT INTO livro (isbn, titulo, status, id_categoria) VALUES
('9781234567890', 'O Código Da Vinci', 1, 1),
('9781234567891', 'Senhor dos Anéis', 1, 9),
('9781234567892', 'A Culpa é das Estrelas', 1, 7),
('9781234567893', 'Harry Potter', 1, 9),
('9781234567894', 'O Hobbit', 1, 9),
('9781234567895', 'A Guerra dos Tronos', 1, 9),
('9781234567896', 'Duna', 1, 6),
('9781234567897', 'O Iluminado', 0, 5),
('9781234567898', 'Cem Anos de Solidão', 1, 4),
('9781234567899', 'O Pequeno Príncipe', 1, 8),
('9781234567800', 'O Nome da Rosa', 1, 12),
('9781234567801', '1984', 1, 6),
('9781234567802', 'Orgulho e Preconceito', 1, 7),
('9781234567803', 'Moby Dick', 1, 1),
('9781234567804', 'O Conde de Monte Cristo', 1, 10),
('9781234567805', 'O Grande Gatsby', 1, 4),
('9781234567806', 'Drácula', 0, 5),
('9781234567807', 'Sherlock Holmes', 1, 12),
('9781234567808', 'Os Miseráveis', 1, 4),
('9781234567809', 'Vinte Mil Léguas Submarinas', 1, 9);

INSERT INTO autor (nome) VALUES
('J.K. Rowling'),
('George R.R. Martin'),
('J.R.R. Tolkien'),
('Stephen King'),
('Jane Austen'),
('Gabriel García Márquez'),
('Victor Hugo'),
('Dan Brown'),
('Fiódor Dostoiévski'),
('Agatha Christie'),
('Jules Verne'),
('Isaac Asimov'),
('Mark Twain'),
('H.G. Wells'),
('Ernest Hemingway'),
('Charles Dickens'),
('Franz Kafka'),
('Leo Tolstoy'),
('Arthur Conan Doyle'),
('Emily Brontë');

INSERT INTO aprecia (id_categoria, id_pessoa) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(9, 9),
(10, 10);

INSERT INTO emprestimo (data_inicio, data_fim) VALUES
('2024-01-01', '2024-01-15'),
('2024-02-05', '2024-02-19'),
('2024-03-10', '2024-03-24'),
('2024-04-12', '2024-04-26'),
('2024-05-20', '2024-06-03'),
('2024-06-15', '2024-06-29'),
('2024-07-22', '2024-08-05'),
('2024-08-30', '2024-09-13'),
('2024-09-10', '2024-09-24'),
('2024-10-01', '2024-10-15');

INSERT INTO livro_autor (id_livro, id_autor) VALUES
('9781234567890', 8),
('9781234567891', 3),
('9781234567892', 5),
('9781234567893', 1),
('9781234567894', 3),
('9781234567895', 2),
('9781234567896', 12),
('9781234567897', 4),
('9781234567898', 6),
('9781234567899', 10);

--CONSULTA--

SELECT * FROM categoria;
SELECT * FROM pessoa;
SELECT * FROM livro;
SELECT * FROM autor;
SELECT * FROM aprecia;
SELECT * FROM emprestimo;
SELECT * FROM livro_autor;

--DELETANDO LINHAS DE 2 TABELAS DE ENTIDADE QUE PARTICIPEM DE UM RELACIONAMENTO--

DELETE FROM livro_autor WHERE id_livro = '9781234567890';
DELETE FROM livro WHERE isbn = '9781234567890';
--CASCADE--
DELETE FROM livro WHERE isbn = '9781234567890';