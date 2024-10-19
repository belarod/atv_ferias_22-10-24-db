CREATE TABLE pessoa_fisica(
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    cpf VARCHAR(11),
    nome VARCHAR(50),
    cep VARCHAR(8),
    numero VARCHAR(6)
);

CREATE TABLE pessoa_juridica(
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    cnpj VARCHAR(14),
    nome VARCHAR(50),
    cep VARCHAR(8),
    numero VARCHAR(6)
);

CREATE TABLE compra(
    quantidade INT,
    id_produto VARCHAR(50),
    id_pessoa_fisica INT,
    id_pessoa_juridica INT,

    PRIMARY KEY (id_produto, id_pessoa_fisica, id_pessoa_juridica),

    FOREIGN KEY (id_produto) REFERENCES produto(nome),
    FOREIGN KEY (id_pessoa_fisica) REFERENCES pessoa_fisica(id),
    FOREIGN KEY (id_pessoa_juridica) REFERENCES pessoa_juridica(id)
);

CREATE TABLE produto(
    nome VARCHAR(50) PRIMARY KEY,
    validade VARCHAR(10),
    quantidade INT
);

CREATE TABLE passo_a_passo(
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    instrucao VARCHAR(50),
    quantidade INT
);

CREATE TABLE lanche(
    nome VARCHAR(30) PRIMARY KEY,
    preco FLOAT
);

CREATE TABLE cliente(
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    nome VARCHAR(50),
    ddd VARCHAR(2),
    numero_telefonico VARCHAR(9)
);

CREATE TABLE receita(
    id_produto VARCHAR(50),
    id_lanche VARCHAR(30),
    id_passo_a_passo INT,

    PRIMARY KEY (id_produto, id_lanche, id_passo_a_passo),

    FOREIGN KEY (id_produto) REFERENCES produto(nome),
    FOREIGN KEY (id_lanche) REFERENCES lanche(nome),
    FOREIGN KEY (id_passo_a_passo) REFERENCES passo_a_passo(id)
);

CREATE TABLE pediu(
    id_lanche VARCHAR(30),
    id_cliente INT,
    data VARCHAR(10),

    PRIMARY KEY (id_lanche, id_cliente),

    FOREIGN KEY (id_lanche) REFERENCES lanche(nome),
    FOREIGN KEY (id_cliente) REFERENCES cliente(id)
);

--INSERÇÃO--

INSERT INTO pessoa_fisica (cpf, nome, cep, numero) VALUES
('12345678901', 'João Silva', '12345678', '123'),
('23456789012', 'Maria Oliveira', '23456789', '456'),
('34567890123', 'Pedro Santos', '34567890', '789'),
('45678901234', 'Ana Costa', '45678901', '101'),
('56789012345', 'Lucia Almeida', '56789012', '202'),
('67890123456', 'Carlos Pereira', '67890123', '303'),
('78901234567', 'Fernanda Souza', '78901234', '404'),
('89012345678', 'Roberto Lima', '89012345', '505'),
('90123456789', 'Tatiane Ribeiro', '90123456', '606'),
('01234567890', 'Júlio Mendes', '01234567', '707'),
('09876543210', 'Aline Martins', '87654321', '808'),
('10987654321', 'Felipe Rodrigues', '76543210', '909'),
('21098765432', 'Sofia Freitas', '65432109', '111'),
('32109876543', 'Mariana Nascimento', '54321098', '222'),
('43210987654', 'André Carvalho', '43210987', '333'),
('54321098765', 'Patrícia Gomes', '32109876', '444'),
('65432109876', 'Ricardo Dias', '21098765', '555'),
('76543210987', 'Beatriz Silva', '10987654', '666'),
('87654321098', 'Lucas Martins', '09876543', '777'),
('98765432109', 'Viviane Costa', '98765432', '888');

INSERT INTO pessoa_juridica (cnpj, nome, cep, numero) VALUES
('12345678000195', 'Empresa A', '12345678', '100'),
('23456789000196', 'Empresa B', '23456789', '200'),
('34567890000197', 'Empresa C', '34567890', '300'),
('45678901000198', 'Empresa D', '45678901', '400'),
('56789012000199', 'Empresa E', '56789012', '500'),
('67890123000100', 'Empresa F', '67890123', '600'),
('78901234000101', 'Empresa G', '78901234', '700'),
('89012345000102', 'Empresa H', '89012345', '800'),
('90123456000103', 'Empresa I', '90123456', '900'),
('01234567000104', 'Empresa J', '01234567', '110'),
('09876543000105', 'Empresa K', '87654321', '220'),
('10987654000106', 'Empresa L', '76543210', '330'),
('21098765000107', 'Empresa M', '65432109', '440'),
('32109876000108', 'Empresa N', '54321098', '550'),
('43210987000109', 'Empresa O', '43210987', '660'),
('54321098000110', 'Empresa P', '32109876', '770'),
('65432109000111', 'Empresa Q', '21098765', '880'),
('76543210000112', 'Empresa R', '10987654', '990'),
('87654321000113', 'Empresa S', '09876543', '101'),
('98765432000114', 'Empresa T', '98765432', '212');

INSERT INTO produto (nome, validade, quantidade) VALUES
('Arroz', '2025-12-31', 100),
('Feijão', '2025-10-15', 150),
('Açúcar', '2026-06-20', 200),
('Sal', '2027-01-01', 250),
('Macarrão', '2025-05-30', 120),
('Óleo de Soja', '2026-08-10', 80),
('Leite', '2024-04-15', 60),
('Queijo', '2024-02-28', 40),
('Presunto', '2024-03-15', 50),
('Salsicha', '2024-12-01', 30),
('Manteiga', '2024-11-15', 25),
('Iogurte', '2024-01-10', 35),
('Chocolate', '2025-07-25', 70),
('Biscoito', '2024-09-20', 90),
('Café', '2025-03-12', 100),
('Chá', '2025-04-05', 80),
('Suco de Laranja', '2024-08-01', 45),
('Refrigerante', '2024-12-31', 55),
('Pão', '2024-10-10', 150),
('Frango Congelado', '2025-06-30', 75);

INSERT INTO passo_a_passo (instrucao, quantidade) VALUES
('Misturar os ingredientes', 1),
('Adicionar água', 500),
('Cozinhar em fogo médio', 30),
('Adicionar sal a gosto', 1),
('Deixar ferver', 10),
('Retirar do fogo', 1),
('Servir quente', 1),
('Adicionar tempero', 1),
('Bater no liquidificador', 1),
('Cortar os legumes', 2),
('Misturar com carne', 1),
('Colocar em uma assadeira', 1),
('Cobrir com papel alumínio', 1),
('Preaquecer o forno', 10),
('Assar até dourar', 40),
('Deixar esfriar', 10),
('Adicionar queijo ralado', 100),
('Temperar com pimenta', 1),
('Enfeitar com salsa', 5),
('Servir em pratos individuais', 4),
('Guardar na geladeira', 1);

INSERT INTO lanche (nome, preco) VALUES
('X-Burguer', 15.00),
('X-Salada', 18.00),
('Hot Dog', 10.00),
('Misto Quente', 8.00),
('Pastel', 5.00),
('Coxinha', 6.50),
('Pão de Queijo', 4.00),
('Sanduíche Natural', 9.00),
('Salada de Frutas', 7.00),
('Pizza Slice', 12.00),
('Tapioca', 8.50),
('Quiche', 9.50),
('Crepe', 11.00),
('Empada', 5.50),
('Brownie', 4.50),
('Bolo de Cenoura', 3.50),
('Biscoito de Polvilho', 2.50),
('Pudim', 6.00),
('Gelato', 10.00),
('Açaí na Tigela', 12.00);

INSERT INTO cliente (nome, ddd, numero_telefonico) VALUES
('João Silva', '11', '912345678'),
('Maria Oliveira', '21', '923456789'),
('Pedro Santos', '31', '934567890'),
('Ana Costa', '41', '945678901'),
('Luís Almeida', '51', '956789012'),
('Fernanda Souza', '61', '967890123'),
('Roberto Lima', '71', '978901234'),
('Tatiane Ribeiro', '81', '989012345'),
('Júlio Mendes', '91', '990123456'),
('Aline Martins', '11', '901234567'),
('Felipe Rodrigues', '21', '912345678'),
('Sofia Freitas', '31', '923456789'),
('Mariana Nascimento', '41', '934567890'),
('André Carvalho', '51', '945678901'),
('Patrícia Gomes', '61', '956789012'),
('Ricardo Dias', '71', '967890123'),
('Beatriz Silva', '81', '978901234'),
('Lucas Martins', '91', '989012345'),
('Viviane Costa', '11', '990123456'),
('Renato Ferreira', '21', '901234567');

INSERT INTO receita (id_produto, id_lanche, id_passo_a_passo) VALUES
('Arroz', 'X-Burguer', 1),
('Feijão', 'X-Salada', 2),
('Queijo', 'Hot Dog', 3),
('Pão de Queijo', 'Misto Quente', 4),
('Frango Congelado', 'Coxinha', 5),
('Carne Moída', 'X-Salada', 6),
('Chocolate', 'Brownie', 7),
('Leite', 'Gelato', 8),
('Massa', 'Crepe', 9),
('Frutas', 'Salada de Frutas', 10);

INSERT INTO pediu (id_lanche, id_cliente, data) VALUES
('X-Burguer', 1, '2024-10-01'),
('X-Salada', 2, '2024-10-02'),
('Hot Dog', 3, '2024-10-03'),
('Coxinha', 4, '2024-10-04'),
('Misto Quente', 5, '2024-10-05'),
('Pizza Slice', 6, '2024-10-06'),
('Pastel', 1, '2024-10-07'),
('Pão de Queijo', 2, '2024-10-08'),
('Bolo de Cenoura', 3, '2024-10-09'),
('Salada de Frutas', 4, '2024-10-10');

--CONSULTA--

SELECT * FROM pessoa_fisica;
SELECT * FROM pessoa_juridica;
SELECT * FROM compra;
SELECT * FROM produto;
SELECT * FROM passo_a_passo;
SELECT * FROM lanche;
SELECT * FROM cliente;
SELECT * FROM receita;
SELECT * FROM pediu;

--DELETANDO LINHAS DE 2 TABELAS DE ENTIDADE QUE PARTICIPEM DE UM RELACIONAMENTO--

DELETE FROM pediu WHERE id_cliente = 1;
DELETE FROM cliente WHERE id = 1;
--CASCADE--
DELETE FROM cliente
WHERE id = 1;