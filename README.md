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

## Enumerando os Requisitos

1. Um carro deve possuir:  
    1.1 Modelo  
    1.2 Montadora  
    1.3 Cor:  
    1.3.1 Branco  
    1.3.2 Preto  
    1.3.3 Prata  
    1.4 Versão  
    1.5 Categoria
2. Um cliente pode alugar um carro somente na modalidade "diária".
3. Um cliente não pode alugar mais de um carro.
4. Enquanto um carro estiver locado por um cliente, ele não pode ser ofetado para outro.
5. O sistema deve manter o histórico dos clientes que locaram determinado carro.
6. O sistema deve manter o histórico de quantos quilometros o cliente rodou com o carro. 
7. A quilometragem atual de cada um dos carros.
8. Existem várias unidades da fraquia CARLOCA o sistema deve saber onde o carro foi locado e onde foi devolvido cada veículo.

## TABELAS

### Tabela LOCACAO:

Configura um pedido de locação de um automóvel por um cliente.  

Nele, consta:
* Identificador;
* Diárias - quantidade de dias que o carro será alugado (R2);
* Data de início do aluguel - somado às diarias alugadas, será possível estabelecer a previsão da devolução;
* Quilômetros rodados - aqui será registrado a diferença da quilometragem do veículo de antes da retirada e depois da devolução (R6).
* Cliente que alugou;
* Carro alugado;
* Unidade de retirada do veículo (R8);
* Unidade de devolução do veículo (R8).

### Tabela UNIDADE:

Representa todos os estabelecimentos físicos da empresa Carloca. É o local onde os clientes podem alugar, fazer a retirada e a devolução dos veículos. As devoluções podem ser realizadas em unidades diferentes da empresa.  

Cada linha desta tabela representa uma unidade e recebe: 
* Identificador;
* Nome; 
* Endereço.
    
### Tabela CLIENTE:

É a representação dos dados de todos os clientes da empresa.  

Os dados dos clientes devem ser cadastrados com:
* Identificador;
* Endereço;
* nome;
* cpf;
* data de nascimento - comprova idade mínima para condução do veículo;
* número de registro da habilitação;
* validade da habilitação;
* categoria da habilitação - dependendo do veículo a ser locado, o motorista deverá ser devidamente habilitado.


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

### Tabela CLIENTE_ENDERECO

Tabela intermediária para sanar a cardialidade entre as tabelas CLIENTE e ENDEREÇO.  
Diante do exposto na tabela anterior (ENDERECO) sobre turistas estrangeiro em estadia temporária em hoteis, e observando que uma unidade do Carloca pode estar situada em uma região fronteiriça com outros países, compreende-se que há a cardialidade de Muitos para Muitos entre as tabelas CLIENTE e ENDEREÇO, uma vez que vários clientes podem se hospedar no mesmo quarto de hotel.  

Recebendo assim:
* Identificador do cliente
* Identificador do endereço

### Tabela VEICULO

Consta os dados de cada veículo que a locadora tem disponível.  

Cadastra-se nele:
* Identificador;
* Nome;
* Cor - através do tipo ENUM(), delimita-se a escolha dar cor entre as três estabelecidas nos requisitos (R1.3)
* Placa;
* Quilometragem (R7);
* Categoria da habilitação necessária para se dirigir o veículo - Compara-se com a habilitação do cliente.;
* Modelo (R1.1);
* Montadora (R1.2);
* Versão (R1.4)
* Categoria (R1.5)
* Unidade do Carloca em que o veículo está ou esteve estacionado a última vez.

### Tabela MODELO_VEICULO

Armazena as informações de modelo do veículo.  
Geralmente o modelo do veículo acompanha seu ano de fabricação, como por exemplo "2018/2019", sendo o primeiro, o ano da fabricação e o último, o ano do modelo.  

Armazenando:
* Identificador
* Ano de fabricação
* Ano do modelo

### Tabela MONTADORA_VEICULO

Guarda qual a fabricante do veículo.  
Exemplos: Toyota, Ford, Chevrolet.

Recebendo:
* Identificado
* Nome da montadora

### Tabela VERSAO_VEICULO

Responsável pelas versões do veículo.  
Exemplos: Civic LX, Corolla XEi, Fiesta SE.

Posrtando:
* Identificado
* Nome da versão

### Tabela VERSAO_VEICULO