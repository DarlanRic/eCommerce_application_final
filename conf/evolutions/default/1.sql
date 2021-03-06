# --- Created by Ebean DDL
# To stop Ebean DDL generation, remove this comment and start using Evolutions

# --- !Ups

create table administrador (
  id                        bigint auto_increment not null,
  login                     varchar(255),
  nome                      varchar(255),
  matricula                 varchar(255),
  password                  varchar(255),
  email                     varchar(255),
  endereco_id               bigint,
  constraint pk_administrador primary key (id))
;

create table carrinho (
  id                        bigint auto_increment not null,
  quantidade                integer,
  constraint pk_carrinho primary key (id))
;

create table categoria (
  id                        bigint auto_increment not null,
  nome                      varchar(255),
  constraint pk_categoria primary key (id))
;

create table cliente (
  id                        bigint auto_increment not null,
  nome                      varchar(255),
  password                  varchar(255),
  email                     varchar(255),
  endereco_id               bigint,
  carrinho_id               bigint,
  constraint uq_cliente_carrinho_id unique (carrinho_id),
  constraint pk_cliente primary key (id))
;

create table endereco (
  id                        bigint auto_increment not null,
  rua                       varchar(255),
  cidade                    varchar(255),
  estado                    varchar(255),
  cep                       varchar(255),
  constraint pk_endereco primary key (id))
;

create table produto (
  id                        bigint auto_increment not null,
  nome                      varchar(255),
  categoria_id              bigint,
  preco                     double,
  descricao                 varchar(255),
  foto                      varchar(255),
  disponivel                tinyint(1) default 0,
  constraint pk_produto primary key (id))
;


create table produto_carrinho (
  produto_id                     bigint not null,
  carrinho_id                    bigint not null,
  constraint pk_produto_carrinho primary key (produto_id, carrinho_id))
;
alter table administrador add constraint fk_administrador_endereco_1 foreign key (endereco_id) references endereco (id) on delete restrict on update restrict;
create index ix_administrador_endereco_1 on administrador (endereco_id);
alter table cliente add constraint fk_cliente_endereco_2 foreign key (endereco_id) references endereco (id) on delete restrict on update restrict;
create index ix_cliente_endereco_2 on cliente (endereco_id);
alter table cliente add constraint fk_cliente_carrinho_3 foreign key (carrinho_id) references carrinho (id) on delete restrict on update restrict;
create index ix_cliente_carrinho_3 on cliente (carrinho_id);
alter table produto add constraint fk_produto_categoria_4 foreign key (categoria_id) references categoria (id) on delete restrict on update restrict;
create index ix_produto_categoria_4 on produto (categoria_id);



alter table produto_carrinho add constraint fk_produto_carrinho_produto_01 foreign key (produto_id) references produto (id) on delete restrict on update restrict;

alter table produto_carrinho add constraint fk_produto_carrinho_carrinho_02 foreign key (carrinho_id) references carrinho (id) on delete restrict on update restrict;

# --- !Downs

SET FOREIGN_KEY_CHECKS=0;

drop table administrador;

drop table carrinho;

drop table produto_carrinho;

drop table categoria;

drop table cliente;

drop table endereco;

drop table produto;

SET FOREIGN_KEY_CHECKS=1;

