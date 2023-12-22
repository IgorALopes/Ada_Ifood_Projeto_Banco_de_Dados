-- Consulta para visualizar modelo, montadora, cor e versão de um carro
SELECT
    VEICULO.nome AS NomeDoVeiculo,
    MODELO_VEICULO.ano_fabricacao AS AnoDeFabricacao,
    MODELO_VEICULO.ano_modelo AS AnoDoModelo,
    MONTADORA_VEICULO.nome AS NomeDaMontadora,
    VEICULO.cor AS CorDoVeiculo,
    VERSAO_VEICULO.nome AS NomeDaVersao
FROM
    VEICULO
JOIN
    MODELO_VEICULO ON VEICULO.id_modelo_veiculo = MODELO_VEICULO.id
JOIN
    MONTADORA_VEICULO ON VEICULO.id_montadora_veiculo = MONTADORA_VEICULO.id
JOIN
    VERSAO_VEICULO ON VEICULO.id_versao_veiculo = VERSAO_VEICULO.id;

-- Tentar inserir um veículo com uma cor não disponível
INSERT INTO VEICULO (nome, cor, placa, quilometragem, categoria_habilitacao, id_modelo_veiculo, id_montadora_veiculo, id_versao_veiculo, id_categoria_veiculo, id_unidade_estacionado)
VALUES
('Fusca Amarelo', 'AMARELO', 'XYZ1234', 5000, 'B', 1, 1, 1, 1, 1)

-- Consulta para visualizar categoria de um carro
SELECT
    VEICULO.nome AS NomeDoVeiculo,
    CATEGORIA_VEICULO.nome AS CategoriaDoVeiculo
FROM
    VEICULO
JOIN
    CATEGORIA_VEICULO ON VEICULO.id_categoria_veiculo = CATEGORIA_VEICULO.id;
    
-- Consulta para visualizar quantas diárias um cliente alugou um veículo
SELECT
    CLIENTE.nome AS NomeDoCliente,
    VEICULO.nome AS NomeDoVeiculo,
    LOCACAO.diarias AS QuantidadeDeDiarias
FROM
    LOCACAO
JOIN
    CLIENTE ON LOCACAO.id_cliente = CLIENTE.id
JOIN
    VEICULO ON LOCACAO.id_veiculo = VEICULO.id;

-- Consulta para visualizar se algum cliente não devolveu o veículo. 
-- Se a o campo id_unidade_devolucao estiver NULL é porque o veiculo ainda não foi devolvido. 
-- Ele não deverá realizar nova locação até que o id da unidade de devolução seja preenchida.
SELECT
    CLIENTE.nome AS NomeDoCliente,
    VEICULO.nome AS NomeDoVeiculo,
    LOCACAO.data_inicio AS DataInicio,
    LOCACAO.id_unidade_devolucao IS NULL AS NaoDevolvido
FROM
    LOCACAO
JOIN
    CLIENTE ON LOCACAO.id_cliente = CLIENTE.id
JOIN
    VEICULO ON LOCACAO.id_veiculo = VEICULO.id
WHERE
    LOCACAO.id_unidade_devolucao IS NULL;
    
-- Consulta para visualizar se algum carro está sendo alugado no momento.
-- Se a o campo id_unidade_devolucao estiver NULL é porque o veiculo ainda não foi devolvido. 
-- Ele não deverá ser locado por novos clientes até que o id da unidade de devolução seja preenchida.
SELECT
    VEICULO.nome AS NomeDoVeiculo,
    CLIENTE.nome AS NomeDoCliente
FROM
    LOCACAO
JOIN
    VEICULO ON LOCACAO.id_veiculo = VEICULO.id
JOIN
    CLIENTE ON LOCACAO.id_cliente = CLIENTE.id
WHERE
    LOCACAO.id_unidade_devolucao IS NULL;

-- Consulta para visualizar um carro e todos os clientes que o utilizaram ou estão utilizando.
SELECT
    VEICULO.nome AS NomeDoVeiculo,
    CLIENTE.nome AS NomeDoCliente
FROM
    VEICULO
JOIN
    LOCACAO ON VEICULO.id = LOCACAO.id_veiculo
JOIN
    CLIENTE ON LOCACAO.id_cliente = CLIENTE.id;

-- Consulta para visualizar a quilometragem dos veículos
SELECT
    VEICULO.nome AS NomeDoVeiculo,
    VEICULO.quilometragem AS Quilometragem
FROM
    VEICULO;

-- Consulta para visualizar os quilômetros rodados em uma locação (valor não nulo).
-- Este será preenchido com a diferença da quilometragem da retirada do veículo com a devolução.
SELECT
    VEICULO.nome AS NomeDoVeiculo,
    LOCACAO.km_rodados AS QuilometrosRodados
FROM
    LOCACAO
JOIN
    VEICULO ON LOCACAO.id_veiculo = VEICULO.id
WHERE
    LOCACAO.km_rodados IS NOT NULL;