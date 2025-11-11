
-- Banco de Dados: loja_eletronicos
CREATE DATABASE IF NOT EXISTS loja_eletronicos;
USE loja_eletronicos;

-- Tabela clientes
CREATE TABLE clientes (
    id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    senha VARCHAR(255) NOT NULL,
    telefone VARCHAR(20),
    endereco VARCHAR(200),
    data_cadastro TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Tabela produtos
CREATE TABLE produtos (
    id_produto INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    descricao TEXT,
    preco DECIMAL(10,2) NOT NULL,
    imagem VARCHAR(200),
    estoque INT DEFAULT 0
);

-- Inserção de produtos de exemplo
INSERT INTO produtos (nome, descricao, preco, imagem, estoque) VALUES
('Apple iPhone 16 Pro Max (256 GB)', 'COM A BELEZA DO TITÂNIO. CONTROLE DA CÂMERA. FOTOS SURPREENDENTES.', 8250.00, 'img/celular_iphone_16.jpg', 10),
('Samsung Galaxy S24 Ultra (256 GB)', 'Câmera Quádrupla de 200 MP, Snapdragon 8 Gen 3, tela de 6,8 polegadas.', 3999.00, 'img/Samsung Galaxy S24.jpg', 15),
('Fone Bluetooth JBL Tune 230NC', 'Modo Extra Bass, isolamento passivo, bateria duradoura.', 200.00, 'img/fone Bluetooth.jpg', 25),
('Apple Watch Series 9', 'Smartwatch com recursos avançados de saúde e conectividade.', 3999.00, 'img/relógio apple watch.jpg', 8);

-- Tabela compras
CREATE TABLE compras (
    id_compra INT AUTO_INCREMENT PRIMARY KEY,
    id_cliente INT NOT NULL,
    id_produto INT NOT NULL,
    quantidade INT DEFAULT 1,
    data_compra TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    status ENUM('Pendente', 'Pago', 'Enviado', 'Concluído', 'Cancelado') DEFAULT 'Pendente',
    FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente),
    FOREIGN KEY (id_produto) REFERENCES produtos(id_produto)
);

-- Exemplo de compra
INSERT INTO compras (id_cliente, id_produto, quantidade, status)
VALUES (1, 2, 1, 'Pago');
