CREATE TABLE empresa (
  id bigserial NOT NULL,
  cnpj varchar(255) NOT NULL,
  data_atualizacao date NOT NULL,
  data_criacao date NOT NULL,
  razao_social varchar(255) NOT NULL
);

CREATE TABLE funcionario (
  id bigserial NOT NULL,
  cpf varchar(255) NOT NULL,
  data_atualizacao date NOT NULL,
  data_criacao date NOT NULL,
  email varchar(255) NOT NULL,
  nome varchar(255) NOT NULL,
  perfil varchar(255) NOT NULL,
  qtd_horas_almoco float DEFAULT NULL,
  qtd_horas_trabalho_dia float DEFAULT NULL,
  senha varchar(255) NOT NULL,
  valor_hora decimal(19,2) DEFAULT NULL,
  empresa_id bigint DEFAULT NULL
);

CREATE TABLE lancamento (
  id bigserial NOT NULL,
  data date NOT NULL,
  data_atualizacao date NOT NULL,
  data_criacao date NOT NULL,
  descricao varchar(255) DEFAULT NULL,
  localizacao varchar(255) DEFAULT NULL,
  tipo varchar(255) NOT NULL,
  funcionario_id bigint DEFAULT NULL
);

--
-- Indexes for table `empresa`
--
ALTER TABLE empresa
  ADD PRIMARY KEY (id);

--
-- Indexes for table `funcionario`
--
ALTER TABLE funcionario
  ADD PRIMARY KEY (id);

--
-- Indexes for table `lancamento`
--
ALTER TABLE lancamento
  ADD PRIMARY KEY (id);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `funcionario`
--
ALTER TABLE funcionario
  ADD CONSTRAINT FK_funcionario_empresa 
  FOREIGN KEY (empresa_id) 
  REFERENCES empresa (id);

--
-- Constraints for table `lancamento`
--
ALTER TABLE lancamento
  ADD CONSTRAINT FK_lancamento_funcionario 
  FOREIGN KEY (funcionario_id) 
  REFERENCES funcionario (id);