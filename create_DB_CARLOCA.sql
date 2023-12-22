CREATE TABLE `MODELO_VEICULO` ( 
  `id` INT AUTO_INCREMENT NOT NULL,
  `ano_fabricacao` INT NOT NULL,
  `ano_modelo` INT NOT NULL,
   PRIMARY KEY (`id`)
);

CREATE TABLE `MONTADORA_VEICULO` ( 
  `id` INT AUTO_INCREMENT NOT NULL,
  `nome` VARCHAR(255) NOT NULL,
   PRIMARY KEY (`id`)
);

CREATE TABLE `VERSAO_VEICULO` ( 
  `id` INT AUTO_INCREMENT NOT NULL,
  `nome` VARCHAR(255) NOT NULL,
   PRIMARY KEY (`id`)
);

CREATE TABLE `CATEGORIA_VEICULO` ( 
  `id` INT AUTO_INCREMENT NOT NULL,
  `nome` VARCHAR(255) NOT NULL,
   PRIMARY KEY (`id`)
);

CREATE TABLE `ENDERECO` ( 
  `id` INT AUTO_INCREMENT NOT NULL,
  `logradouro` VARCHAR(255) NOT NULL,
  `numero` INT NOT NULL,
  `complemento` VARCHAR(255) NULL,
  `bairro` VARCHAR(255) NOT NULL,
  `cep` INT NOT NULL,
  `cidade` VARCHAR(255) NOT NULL,
  `estado` VARCHAR(255) NOT NULL,
  `pais` VARCHAR(255) NOT NULL,
   PRIMARY KEY (`id`)
);

CREATE TABLE `CLIENTE` ( 
  `id` INT AUTO_INCREMENT NOT NULL,
  `nome` VARCHAR(255) NOT NULL,
  `email` VARCHAR(255) NOT NULL,
  `telefone` VARCHAR(255) NOT NULL,
  `cpf` VARCHAR(255) NOT NULL,
  `nascimento` DATE NOT NULL,
  `num_registro_habilitacao` INT NOT NULL,
  `validade_habilitacao` DATE NOT NULL,
  `categoria_habilitacao` ENUM('A','B','C','D','E') NOT NULL,
   PRIMARY KEY (`id`)
);

CREATE TABLE `CLIENTE_ENDERECO` ( 
  `id_cliente` INT NOT NULL,
  `id_endereco` INT NOT NULL,
   PRIMARY KEY (`id_cliente`, `id_endereco`)
);
ALTER TABLE `CLIENTE_ENDERECO` ADD CONSTRAINT `id_cliente` FOREIGN KEY (`id_cliente`) REFERENCES `CLIENTE` (`id`);
ALTER TABLE `CLIENTE_ENDERECO` ADD CONSTRAINT `id_endereco` FOREIGN KEY (`id_endereco`) REFERENCES `ENDERECO` (`id`);

CREATE TABLE `UNIDADE` ( 
  `id` INT AUTO_INCREMENT NOT NULL,
  `nome` VARCHAR(255) NOT NULL,
  `id_endereco` INT NOT NULL,
   PRIMARY KEY (`id`)
);
ALTER TABLE `UNIDADE` ADD CONSTRAINT `id_endereco_unidade` FOREIGN KEY (`id_endereco`) REFERENCES `ENDERECO` (`id`);

CREATE TABLE `VEICULO` ( 
  `id` INT AUTO_INCREMENT NOT NULL,
  `nome` VARCHAR(255) NOT NULL,
  `cor` ENUM('BRANCO','PRETO','PRATA') NOT NULL,
  `placa` VARCHAR(255) NOT NULL,
  `quilometragem` INT NOT NULL,
  `categoria_habilitacao` ENUM('A','B','C','D','E') NOT NULL,
  `id_modelo_veiculo` INT NOT NULL,
  `id_montadora_veiculo` INT NOT NULL,
  `id_versao_veiculo` INT NOT NULL,
  `id_categoria_veiculo` INT NOT NULL,
  `id_unidade_estacionado` INT NOT NULL,
   PRIMARY KEY (`id`)
);
ALTER TABLE `VEICULO` ADD CONSTRAINT `id_modelo_veiculo` FOREIGN KEY (`id_modelo_veiculo`) REFERENCES `MODELO_VEICULO` (`id`);
ALTER TABLE `VEICULO` ADD CONSTRAINT `id_montadora_veiculo` FOREIGN KEY (`id_montadora_veiculo`) REFERENCES `MONTADORA_VEICULO` (`id`);
ALTER TABLE `VEICULO` ADD CONSTRAINT `id_versao_veiculo` FOREIGN KEY (`id_versao_veiculo`) REFERENCES `VERSAO_VEICULO` (`id`);
ALTER TABLE `VEICULO` ADD CONSTRAINT `id_categoria_veiculo` FOREIGN KEY (`id_categoria_veiculo`) REFERENCES `CATEGORIA_VEICULO` (`id`);
ALTER TABLE `VEICULO` ADD CONSTRAINT `id_unidade_estacionado` FOREIGN KEY (`id_unidade_estacionado`) REFERENCES `UNIDADE` (`id`);

CREATE TABLE `LOCACAO` ( 
  `id` INT AUTO_INCREMENT NOT NULL,
  `diarias` INT NOT NULL,
  `data_inicio` DATE NOT NULL,
  `km_rodados` INT NULL,
  `id_cliente` INT NOT NULL,
  `id_veiculo` INT NOT NULL,
  `id_unidade_retirada` INT NOT NULL,
  `id_unidade_devolucao` INT NULL,
   PRIMARY KEY (`id`)
);
ALTER TABLE `LOCACAO` ADD CONSTRAINT `id_cliente_loca` FOREIGN KEY (`id_cliente`) REFERENCES `CLIENTE` (`id`);
ALTER TABLE `LOCACAO` ADD CONSTRAINT `id_veiculo_loca` FOREIGN KEY (`id_veiculo`) REFERENCES `VEICULO` (`id`);
ALTER TABLE `LOCACAO` ADD CONSTRAINT `id_unidade_retirada` FOREIGN KEY (`id_unidade_retirada`) REFERENCES `UNIDADE` (`id`);
ALTER TABLE `LOCACAO` ADD CONSTRAINT `id_unidade_devolucao` FOREIGN KEY (`id_unidade_devolucao`) REFERENCES `UNIDADE` (`id`);
