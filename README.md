# CARLOCA

Projeto Final para o módulo de Banco de Dados (MYSQL) do curso de Desenvolvimento Back end da Ada com parceria Ifood.

>Sua tarefa é criar o banco de dados para o sistema de locadora de carros a CARLOCA!
>
>Requisitos funcionais:
>Um carro possui modelo montadora, cor e versão.
>As cores de carro disponiveis são apenas branco, preto e prata.
>Existem várias categorias de veiculos (hatch, sedam compacto, sedam médio, SUV, etc...)
>Um cliente pode alugar um carro somente na modalidade "diária".
>Um cliente não pode alugar mais de um carro.
>Enquanto um carro estiver locado por um cliente não pode ser ofetado para outro.
>O sistema deve manter o histórico dos clientes que locaram determinado carro.
>O sistema deve manter o histórico de quantos quilometros o cliente rodou com o carro bem como a quilometragem atual de cada um dos carros.
>Existem várias unidades da fraquia CARLOCA o sistema deve saber onde o carro foi locado e onde foi devolvido cada veículo.
>
>Requisitos não funcionais:
>Devem ser gerados inserts e selects que possibilitem validar cada um dos requisitos acima.
>O exercicio deve ser desenvolvido considerando todos os principios de normalização de dados.
>Por hora não falaremos de nada relacionado a pagamento, por tanto o foco do projeto é um atender estritamente os requisitos acima!

Arquivos Requisitados para avaliação:
1. [Arquivo da modelagem do Banco de Dados](https://github.com/IgorALopes/Ada_Ifood_Projeto_Banco_de_Dados/blob/main/Igor_Lopes_Projeto_Carloca_Banco_de_Dados_Ada%2BIfood_Back_end.drawio) - O arquivo é aberto no programa online [Draw.io](https://app.diagrams.net/)
2. [Arquivo com as Queries para validação dos requisitos](https://github.com/IgorALopes/Ada_Ifood_Projeto_Banco_de_Dados/blob/main/validation_queries_CARLOCA.sql)
3. README básico

Extras:  
* [Arquivo para gerar todas as tabelas do BD](https://github.com/IgorALopes/Ada_Ifood_Projeto_Banco_de_Dados/blob/main/create_DB_CARLOCA.sql)
* [Arquivo para popular o BD](https://github.com/IgorALopes/Ada_Ifood_Projeto_Banco_de_Dados/blob/main/populate_DB_CARLOCA.sql)
* README descritivo

#### Leganda para cardinalidade:
* 1:1 - Um-para-UM
* 1:N - Um-para-Muitos
* N:N - Muitos-para-Muitos

## Enumerando os Requisitos

1. Um carro deve possuir:  
    1.1 Modelo  
    1.2 Montadora  
    1.3 Cor:  
        - 1.3.1 Branco  
        - 1.3.2 Preto  
        - 1.3.3 Prata  
    1.4 Versão  
    1.5 Categoria
2. Um cliente pode alugar um carro somente na modalidade "diária"
3. Um cliente não pode alugar mais de um carro
4. Enquanto um carro estiver locado por um cliente, ele não pode ser ofetado para outro
5. O sistema deve manter o histórico dos clientes que locaram determinado carro
6. O sistema deve manter o histórico de quantos quilometros o cliente rodou com o carro.
7. A quilometragem atual de cada um dos carros
8. Existem várias unidades da fraquia CARLOCA o sistema deve saber onde o carro foi locado e onde foi devolvido cada veículo

## TABELAS

### Tabela LOCACAO:

Configura um pedido de locação de um automóvel por um cliente.  

Nele, consta:
* Identificador
* Diárias - quantidade de dias que o carro será alugado (R2)
* Data de início do aluguel - somado às diarias alugadas, será possível estabelecer a previsão da devolução
* Quilômetros rodados - aqui será registrado a diferença da quilometragem do veículo de antes da retirada e depois da devolução (R6)
* Cliente que alugou (R5)
* Carro alugado
* Unidade de retirada do veículo (R8)
* Unidade de devolução do veículo (R8)

A coluna da Unidade de devolução do veículo poderá receber NULL, assim, se a o campo estiver NULL, é porque o veiculo ainda não foi devolvido. (R4)
A coluna para os quilômetros rodados poderá receber NULL, para que se armazene o cálculo da diferença da quilometragem após a locação. (R6)

#### <font color="green">Relacionamentos Cardinais:</font>
* 1:N com a tabela CLIENTE - Um cliente pode realizar um pedido de locação varias vezes e uma locação pode registrar um único cliente.
* 1:N com a tabela VEICULO - Um veículo pode ser locado várias vezes e uma locação pode registrar um único veículo.
* 1:N com a tabela UNIDADE - Uma unidade pode ser registrada em vários pedidos de locação e uma locação só registra uma única unidade.

### Tabela UNIDADE:

Representa todos os estabelecimentos físicos da empresa Carloca. É o local onde os clientes podem alugar, fazer a retirada e a devolução dos veículos. As devoluções podem ser realizadas em unidades diferentes da empresa.  

Cada linha desta tabela representa uma unidade e recebe: 
* Identificador
* Nome
* Endereço

#### <font color="green">Relacionamentos Cardinais:</font>
* 1:N com a tabela LOCACAO - Uma unidade pode ser registrada em vários pedidos de locação e uma locação só registra uma única unidade.
* 1:1 com a tabela ENDERECO - Uma unidade pode ter apenas um endereço e um endereço pertence a somente uma unidade.
* 1:N com a tabela VEICULO - Uma unidade pode pertencer a vários veículos e um veículo só pode estar estacionado em uma unidade.
    
### Tabela CLIENTE:

É a representação dos dados de todos os clientes da empresa.  

Os dados dos clientes devem ser cadastrados com:
* Identificador
* Endereço
* nome
* cpf
* data de nascimento - comprova idade mínima para condução do veículo
* número de registro da habilitação
* validade da habilitação
* categoria da habilitação - dependendo do veículo a ser locado, o motorista deverá ser devidamente habilitado

#### <font color="green">Relacionamentos Cardinais:</font>
* 1:N com a tabela LOCACAO - Um cliente pode realizar vários pedidos de aluguel e uma locação pertence apenas a um cliente.
* 1:N com a tabela CLIENTE_ENDERECO - Tabela para armazenar a relação N:N de CLIENTE com ENDERECO, onde um cliente pode ter vários endereços e um endereço pode pertencer a vários clientes (motivo da relação explicada na Tabela CLIENTE_ENDERECO).


### Tabela ENDERECO

Guarda as informações dos endereços dos clientes e das unidades.  

As informações são:
* Identificador
* Logradouro
* Número
* Complemento
* Bairro
* CEP
* Cidade
* Estado
* País

Supondo que muitos dos clientes do Carloca podem ser turistas estrangeiros e como não foi definida a regra de negócio se o endereço a ser cadastrado deve ser o atual, mesmo que temporário(Hoteis, por exemplo) ou residêncial, foi incluído a coluna país.

#### <font color="green">Relacionamentos Cardinais:</font>
* 1:1 com a tabela UNIDADE - Uma unidade pode ter apenas um endereço e um endereço pertence a somente uma unidade.
* 1:N com a tabela CLIENTE_ENDERECO - Tabela para armazenar a relação N:N de CLIENTE com ENDERECO, onde um cliente pode ter vários endereços e um endereço pode pertencer a vários clientes (motivo da relação explicada na Tabela CLIENTE_ENDERECO).

### Tabela CLIENTE_ENDERECO

Tabela intermediária para sanar a cardialidade entre as tabelas CLIENTE e ENDEREÇO.  
Diante do exposto na tabela anterior (ENDERECO) sobre turistas estrangeiros em estadia temporária em hoteis, e observando que uma unidade do Carloca pode estar situada em uma região fronteiriça com outros países, compreende-se que há a cardialidade de N:N (Muitos para Muitos) entre as tabelas CLIENTE e ENDEREÇO, uma vez que vários clientes podem se hospedar no mesmo quarto de hotel.  

Recebendo assim:
* Identificador do cliente
* Identificador do endereço

#### <font color="green">Relacionamentos Cardinais:</font>
* 1:N com a tabela ENDERECO - Armazena a relação N:N de CLIENTE com ENDERECO.
* 1:N com a tabela CLIENTE - Armazena a relação N:N de CLIENTE com ENDERECO.

### Tabela VEICULO

Consta os dados de cada veículo que a locadora tem disponível.  

Cadastra-se nele:
* Identificador
* Nome
* Cor - através do tipo ENUM(), delimita-se a escolha dar cor entre as três estabelecidas nos requisitos (R1.3)
* Placa
* Quilometragem (R7)
* Categoria da habilitação necessária para se dirigir o veículo - Compara-se com a habilitação do cliente
* Modelo (R1.1)
* Montadora (R1.2)
* Versão (R1.4)
* Categoria (R1.5)
* Unidade do Carloca em que o veículo está ou esteve estacionado a última vez

#### <font color="green">Relacionamentos Cardinais:</font>
* 1:N com a tabela MODELO_VEICULO - Um veículo tem apenas um modelo e o modelo pode pertencer a vários veículos.
* 1:N com a tabela MONTADORA_VEICULO - Um veículo tem apenas uma montadora e a montadora pode produzir vários veículos diferentes.
* 1:N com a tabela VERSAO_VEICULO - Um veículo tem apenas uma versão e uma mesma versão pode pertencer a outros veículos.
* 1:N com a tabela CATEGORIA_VEICULO - Um veículo pertence a uma categoria e uma categoria engloba diversos veículos.
* 1:N com a tabela UNIDADE - Uma unidade pode pertencer a vários veículos e um veículo só pode estar estacionado em uma unidade.

### Tabela MODELO_VEICULO

Armazena as informações de modelo do veículo.  
Geralmente o modelo do veículo acompanha seu ano de fabricação, como por exemplo "2018/2019", sendo o primeiro, o ano da fabricação e o último, o ano do modelo.  

Armazenando:
* Identificador
* Ano de fabricação
* Ano do modelo

#### <font color="green">Relacionamentos Cardinais:</font>
* 1:N com a tabela VEICULO - Um veículo tem apenas um modelo e o modelo pode pertencer a vários veículos.

### Tabela MONTADORA_VEICULO

Guarda qual a fabricante do veículo.  
Exemplos: Toyota, Ford, Chevrolet.

Recebendo:
* Identificado
* Nome da montadora

#### <font color="green">Relacionamentos Cardinais:</font>
* 1:N com a tabela VEICULO - Um veículo tem apenas uma montadora e a montadora pode produzir vários veículos diferentes.

### Tabela VERSAO_VEICULO

Responsável pela versão do veículo.  
Exemplos: Civic LX, Corolla XEi, Fiesta SE.

Portando:
* Identificado
* Nome da versão

#### <font color="green">Relacionamentos Cardinais:</font>
1:N com a tabela VEICULO - Um veículo tem apenas uma versão e uma mesma versão pode pertencer a outros veículos.

### Tabela CATEGORIA_VEICULO

Responsável pela categoria do veículo.  
Exemplos: Sedan, Caminhonete, SUV

Portando:
* Identificado
* Nome da versão

#### <font color="green">Relacionamentos Cardinais:</font>
* 1:N com a tabela VEICULO - Um veículo pertence a uma categoria e uma categoria engloba diversos veículos.