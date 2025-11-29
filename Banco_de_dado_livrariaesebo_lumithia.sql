#Criando a tabela de clientes

CREATE TABLE CLIENTE (
    id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    nome varchar(100) NOT NULL,
    email varchar(120) NOT NULL UNIQUE,
    telefone varchar(15),
    endereco varchar(200),
    data_cadastro DATE NOT NULL
);

select * from cliente;

#Adicionando dados a tabela cliente

INSERT INTO CLIENTE (id_cliente, nome, email, telefone, endereco, data_cadastro) VALUES
(1, 'Maria Silva', 'maria.silva@example.com', '11985341234','Rua das Flores, 123', '2024-01-10'),
(2, 'João Pereira', 'joao.pereira@example.com', '11988887766', 'Av. Brasil, 450', '2024-01-15'),
(3, 'Ana Rodrigues', 'ana.rodrigues@example.com', '11997776655', 'Rua Sol Nascente, 82', '2024-02-01'),
(4, 'Carlos Almeida', 'carlos.almeida@example.com', '11991234567', 'Travessa do Norte, 18', '2024-02-20'),
(5, 'Beatriz Souza', 'beatriz.souza@example.com', '11993456789', 'Rua das Palmeiras, 330', '2024-03-05');

# Criando tabela Livros

CREATE TABLE LIVROS (
	id_livros INT AUTO_INCREMENT PRIMARY KEY, 
    titulo VARCHAR(150) NOT NULL,
    autor VARCHAR(100) NOT NULL,
    preco DECIMAL(10,2)NOT NULL,
    estado ENUM('novo','usado') NOT NULL, 
    categoria VARCHAR (50), 
    estoque INT NOT NULL
);    

SELECT * FROM LIVROS;

#Adicionando dados a tabela Livros

INSERT INTO LIVROS (id_livros, titulo, autor, preco, estado, categoria, estoque) VALUES
(1001, 'O Senhor dos Anéis','J.R.R. Tolkien', '59.00', 'usado', 'Fantasia', '5'),
(1002, 'Dom Casmurro', 'Machado de Assis', 29.00, 'novo', 'Romance', 10),
(1003, '1984', 'George Orwell', 39.00, 'usado', 'Distopia', 4),
(1004, 'O Hobbit', 'J.R.R. Tolkien', 49.00, 'novo', 'Fantasia', 8),
(1005, 'Capitães da Areia', 'Jorge Amado', 19.00, 'usado', 'Drama', 7),
(1006, 'A Revolução dos Bichos', 'George Orwell', 34.00, 'novo', 'Distopia', 9),
(1007, 'A Culpa é das Estrelas', 'John Green', 32.00, 'novo', 'Romance', 6),
(1008, 'It: A Coisa', 'Stephen King', 55.00, 'usado', 'Terror', 3),
(1009, 'O Pequeno Príncipe', 'Antoine de Saint-Exupéry', 24.00, 'novo', 'Infantil', 15),
(1010, 'Harry Potter e a Pedra Filosofal', 'J.K. Rowling', 54.00, 'novo', 'Fantasia', 12);

#Criando a tabela Funcionários

CREATE TABLE funcionario(
	id_funcionario INT AUTO_INCREMENT PRIMARY KEY,
	nome_funcionario VARCHAR(100) NOT NULL,
    cargo VARCHAR(50) NOT NULL,
	email VARCHAR(150) UNIQUE,
    telefone VARCHAR(15)
);

SELECT * FROM funcionario

INSERT INTO funcionario (id_funcionario, nome_funcionario, cargo, email, telefone) VALUES
	(1, 'Mariana Santos', 'Vendedor', 'mariana@empresa.com' ,'1130301010'),
    (2, 'Jose Ferreira', 'Atendente', 'jose@empresa.com', '1130302020'),
    (3, 'Patrícia Lima', 'Vendedor','patricia@empresa.com', '1130303030');


#Criando a tabela Vendas

CREATE TABLE venda(
    id_venda INT AUTO_INCREMENT PRIMARY KEY,
    id_cliente INT NOT NULL,
    id_funcionario INT NOT NULL,
    data_venda DATETIME NOT NULL,
    valor_total DECIMAL(10,2) NOT NULL,
    
    FOREIGN KEY (id_cliente) REFERENCES cliente(id_cliente),
    FOREIGN KEY (id_funcionario) REFERENCES funcionario(id_funcionario)
);

    
    SELECT * FROM venda
    
    #Adicionando dados a tabela vendas
    
    INSERT INTO venda (id_venda, id_cliente, id_funcionario, data_venda, valor_total) VALUES
    (1, '1', '1', '2024-03-10 14:33', '29.00'),
    (2, '5', '2', '2024-03-11 10:12', '55.00'),
    (3, '1', '3', '2024-03-12 16:50', '49.00'),
    (4, '2', '3', '2024-03-13 09:22', '19.00'),
    (5, '5', '1', '2024-03-13 19:03', '59.00'),
    (6, '1', '2', '2024-03-14 11:10', '59.00'),
    (7, '4', '3', '2024-03-14 15:44', '57.00'),
    (8, '3', '2', '2024-03-24 13:00', '39.00'),
    (9, '3', '1', '2024-03-16 17:15', '70.00'),
    (10, '4', '2', '2024-03-17 18:40', '59.00');
    
    
    #Criando a tabela itens de venda
    
CREATE TABLE item_venda(
	id_item INT AUTO_INCREMENT PRIMARY KEY,
	id_venda INT NOT NULL,
	id_livro INT NOT NULL,
	quantidade INT NOT NULL,
	preco_unitario DECIMAL(10,2) NOT NULL,

	FOREIGN KEY (id_venda) REFERENCES venda(id_venda),
	FOREIGN KEY (id_livro) REFERENCES livros(id_livros)
);
    
    SELECT * FROM item_venda
    
    INSERT INTO item_venda (id_venda, id_livro, quantidade, preco_unitario) VALUES
    (1, 1002, 1, 29.00),
    (2, 1008, 1, 55.00),
    (3, 1004, 1, 49.00),
    (4, 1001, 3, 57.00),
    (5, 1001, 1, 59.00),
    (6, 1001, 1, 59.00);
    
    
    #Buscando livros com preço acima de R$50,00. 
    
    SELECT * FROM livros
    WHERE preco >50;
    
    #Buscando funcionario
    
   SELECT nome_funcionario, cargo
   FROM funcionario
   WHERE cargo = 'vendedor';
   
   #Listando os livros por valor, do mais barato para o mais caro
   
   SELECT titulo, preco
   FROM livros
   ORDER BY preco ASC;
   
   #Listando os livros por valor, do mais caro para o mais barato
   
   SELECT titulo, preco
   FROM livros
   ORDER BY preco DESC;
   
   #Listando os 3 livros mais caros 
   
   SELECT titulo, preco
   FROM livros
   ORDER BY preco DESC
   LIMIT 3;
   
   #Buscando o nome do livro e a quantidade vendida
   
   SELECT v.id_venda, l.titulo, iv.quantidade
   FROM item_venda iv
   JOIN livros l ON iv.id_livro = l.id_livros
   JOIN venda v ON iv.id_venda = v.id_venda;
   
   #Atualizando o preço de livros e cadastro de cliente

	UPDATE livros
	SET preco = 19.00
	WHERE id_livros = 1007;
    
    UPDATE livros
    SET preco = 69.00
    WHERE id_livros = 1008;
    
    UPDATE cliente
    SET telefone = 19993093664
    WHERE id_cliente = 4;
    
    #Conferindo atualizações
    
    SELECT * FROM livros
    
    SELECT * FROM cliente
    
    #Deletando itens das tabelas
    
    DELETE FROM livros
	WHERE id_livros = 1010;
    
    DELETE FROM livros
	WHERE id_livros = 1004;
    
    DELETE FROM livros
	WHERE id_livros = 1007;
    
    #Conferindo atualizaçõe
    
    SELECT * FROM livros