# Carloca

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

## Enumerando os Requisitos

1. Um carro deve possuir: <br>
    1.1 Modelo<br>
    1.2 Montadora<br>
    1.3 Cor<br>
        1.3.1 Branco<br>
        1.3.2 Preto<br>
        1.3.3 Prata<br>
    1.4 Versão<br>
    1.5 Categoria<br>
2. Um cliente pode alugar um carro somente na modalidade "diária".
3. Um cliente não pode alugar mais de um carro.
4. Enquanto um carro estiver locado por um cliente, ele não pode ser ofetado para outro.
5. O sistema deve manter o histórico dos clientes que locaram determinado carro.
6. O sistema deve manter o histórico de quantos quilometros o cliente rodou com o carro bem como a quilometragem atual de cada um dos carros.
7. Existem várias unidades da fraquia CARLOCA o sistema deve saber onde o carro foi locado e onde foi devolvido cada veículo.

