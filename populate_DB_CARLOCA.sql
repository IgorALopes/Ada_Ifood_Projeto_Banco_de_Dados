-- Populando tabela MODELO_VEICULO
INSERT INTO MODELO_VEICULO (ano_fabricacao, ano_modelo) VALUES
(2021, 2022),
(2020, 2021),
(2019, 2020),
(2022, 2023),
(2018, 2019);

-- Populando tabela MONTADORA_VEICULO
INSERT INTO MONTADORA_VEICULO (nome) VALUES
('Toyota'),
('Ford'),
('Chevrolet'),
('Honda'),
('Volkswagen');

-- Populando tabela VERSAO_VEICULO
INSERT INTO VERSAO_VEICULO (nome) VALUES
('Civic LX'),
('Corolla XEi'),
('Fiesta SE'),
('Cruze LT'),
('Golf Comfortline');

-- Populando tabela CATEGORIA_VEICULO
INSERT INTO CATEGORIA_VEICULO (nome) VALUES
('Sedan'),
('Hatchback'),
('SUV'),
('Caminhonete'),
('Compacto');

-- Populando tabela ENDERECO
INSERT INTO ENDERECO (logradouro, numero, complemento, bairro, cep, cidade, estado, pais) VALUES
('Rua A', 123, 'Apto 1', 'Centro', 12345, 'Cidade A', 'Estado A', 'Brasil'),
('Av. B', 456, 'Casa 2', 'Bairro B', 54321, 'Cidade B', 'Estado B', 'Brasil'),
('Rua C', 789, NULL, 'Centro', 67890, 'Cidade C', 'Estado C', 'Brasil'),
('Av. D', 1011, 'Sala 3', 'Bairro D', 98765, 'Cidade D', 'Estado D', 'Brasil'),
('Rua E', 1213, 'Apto 4', 'Centro', 56789, 'Cidade E', 'Estado E', 'Brasil');

-- Populando tabela CLIENTE
INSERT INTO CLIENTE (nome, email, telefone, cpf, nascimento, num_registro_habilitacao, validade_habilitacao, categoria_habilitacao) VALUES
('João Silva', 'joao@email.com', '123456789', '12345678901', '1990-01-15', 987654321, '2023-01-15', 'B'),
('Maria Souza', 'maria@email.com', '987654321', '98765432109', '1985-05-20', 123456789, '2024-05-20', 'A'),
('Pedro Santos', 'pedro@email.com', '555555555', '55555555512', '1995-08-10', 333333333, '2022-08-10', 'C'),
('Ana Oliveira', 'ana@email.com', '111111111', '11111111123', '1980-11-25', 888888888, '2023-11-25', 'B'),
('Carlos Pereira', 'carlos@email.com', '999999999', '99999999934', '1992-03-05', 222222222, '2022-03-05', 'D');

-- Populando tabela CLIENTE_ENDERECO
INSERT INTO CLIENTE_ENDERECO (id_cliente, id_endereco) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5);

-- Populando tabela UNIDADE
INSERT INTO UNIDADE (nome, id_endereco) VALUES
('Filial A', 1),
('Filial B', 2),
('Filial C', 3),
('Filial D', 4),
('Filial E', 5);

-- Populando tabela VEICULO
INSERT INTO VEICULO (nome, cor, placa, quilometragem, categoria_habilitacao, id_modelo_veiculo, id_montadora_veiculo, id_versao_veiculo, id_categoria_veiculo, id_unidade_estacionado) VALUES
('Civic Prata', 'PRATA', 'ABC1234', 15000, 'B', 1, 1, 1, 1, 1),
('Corolla Preto', 'PRETO', 'DEF5678', 20000, 'B', 2, 2, 2, 2, 2),
('Fiesta Branco', 'BRANCO', 'GHI9101', 12000, 'B', 3, 3, 3, 3, 3),
('Cruze Prata', 'PRATA', 'JKL2345', 18000, 'B', 4, 4, 4, 4, 4),
('Golf Preto', 'PRETO', 'MNO6789', 25000, 'B', 5, 5, 5, 5, 5);

-- Populando tabela LOCACAO
INSERT INTO LOCACAO (diarias, data_inicio, km_rodados, id_cliente, id_veiculo, id_unidade_retirada, id_unidade_devolucao) VALUES
(3, '2023-01-01', 637, 1, 1, 1, 2),
(2, '2023-02-15', NULL, 2, 2, 2, NULL),
(4, '2023-03-20', NULL, 3, 3, 3, NULL),
(1, '2023-04-10', 458, 4, 4, 4, 5),
(5, '2023-05-05', NULL, 5, 5, 5, NULL),
(7, '2023-01-10', 125, 4, 3, 2, 5);
