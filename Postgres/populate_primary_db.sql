CREATE TYPE tipo_contrato AS ENUM ('fornecedora', 'prestadora', 'contratacao'); 

create table contrato ( 
  id serial primary key,  
  tipo tipo_contrato not null, 
  dataCriacao date not null, 
  infoAdicionais varchar(255), 
  valor numeric,  
  prazoPagamento date, 
  obrigacoes varchar(255),
  cnpj varchar (20),
  executor boolean not null
);

create table funcionario ( 
  Id serial primary key, 
  cargo varchar(40) not null, 
  cpf varchar(15) not null, 
  departamento varchar(30), 
  dataContratacao date, 
  endereco varchar(50), 
  ctps varchar(15) not null, 
	oab varchar(30), 
  contratoId int not null, 

   CONSTRAINT fk_contrato FOREIGN KEY (contratoId) REFERENCES contrato(id) 
);

CREATE TYPE status_chamado AS ENUM ('aberto', 'em andamento', 'fechado'); 

create table chamado_interno ( 
	id serial primary key, 
	dataAbertura date not null,
	status status_chamado not null default 'aberto',
	descricao varchar(255),
	dataEncerramento date,
	advogadoId int not null,
	funcionarioId int not null,
	
	CONSTRAINT fk_advogado_chamado FOREIGN KEY (advogadoId) REFERENCES funcionario(id),
	CONSTRAINT fk_funcionario_chamado FOREIGN KEY (funcionarioId) REFERENCES funcionario(id)
);

CREATE TYPE tipo_processo AS ENUM ('trabalhista', 'civil', 'consumerista', 'cobrança', 'tributário'); 

create table processo ( 
  Id serial primary key, 
  dataAbertura date, 
  numero varchar(50) not null, 
  tipo tipo_processo not null, 
  descricao varchar(100),
  autor boolean not null
 );
 
 create table advogado_processo ( 
	advogadoId int not null,
	 processoId int not null,
	 
	 CONSTRAINT fk_intermediaria_advogado FOREIGN KEY (advogadoId) REFERENCES funcionario(id),
	 CONSTRAINT fk_intermediaria_processo FOREIGN KEY (processoId) REFERENCES processo(id),
	 CONSTRAINT pk_advogado_processo PRIMARY KEY (advogadoId, processoId)
 );
 
create table historico_honorario (
	id serial primary key,
	dataDefinicao date not null,
	valor numeric not null,
	observacao varchar(100),
	processoId int not null,

	CONSTRAINT fk_processoId FOREIGN KEY (processoId) REFERENCES processo(id)
);

CREATE TYPE fase_processo AS ENUM ('citação', 'resposta do réu', 'instrução', 'sentença', 'recursos', 'cumprimento sentença'); 

create table movimento_processual ( 
  id serial primary key,
  dataHora date, 
  fase fase_processo not null, 
  processoId int not null,

  CONSTRAINT fk_movimento_processo FOREIGN KEY (processoId) REFERENCES processo(id) 
);

create table parte_envolvida (
	id serial primary key,
	cpf varchar(15),
	cnpj varchar(20),
	email varchar(30) not null,
	endereco varchar(150),
	processoId int not null,
	
	CONSTRAINT fk_parte_processo FOREIGN KEY (processoId) REFERENCES processo(id)
);

create table documento ( 
  id serial primary key, 
  numero int not null,
  dataEmissao date, 
  tipo varchar, 
  responsavel varchar(50), 
  departamento varchar(50), 
  cliente varchar, 
  processoId int not null, 

  CONSTRAINT fk_documento_processo FOREIGN KEY (processoId) REFERENCES processo(id)
);


create table audiencia ( 
  id serial primary key,
  data date,
  hora time,
  observacoes varchar(255),
  resultado varchar(50) not null,
  endereco varchar(150),
  processoId int not null, 

 CONSTRAINT fk_audiencia_processo FOREIGN KEY (processoId) REFERENCES processo(id) 
); 

create table alvara ( 
  id serial primary key, 
  numero int not null, 
  dataEmissao date, 
  dataValidade date, 
  valor numeric, 
  audienciaId int, 

  CONSTRAINT fk_audiencia FOREIGN KEY (audienciaId) REFERENCES audiencia(id)
);