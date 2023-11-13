DROP SCHEMA IF EXISTS larcomamor;
CREATE SCHEMA larcomamor;
USE larcomamor;

CREATE TABLE estado (
    sg_estado VARCHAR(2),
    nm_estado VARCHAR(30),
    CONSTRAINT pk_estado PRIMARY KEY (sg_estado)
);

CREATE TABLE cidade (
    cd_cidade INT,
    nm_cidade VARCHAR(30),
    sg_estado VARCHAR(2),
    CONSTRAINT pk_cidade PRIMARY KEY (cd_cidade),
    CONSTRAINT fk_cidade_estado FOREIGN KEY (sg_estado) REFERENCES estado(sg_estado)
);

CREATE TABLE cep (
    cd_cep VARCHAR(8),
    nm_rua VARCHAR(255),
    cd_cidade INT,
    CONSTRAINT pk_cep PRIMARY KEY (cd_cep),
    CONSTRAINT fk_cep_cidade FOREIGN KEY (cd_cidade) REFERENCES cidade(cd_cidade)
);

CREATE TABLE tipo_usuario (
    sg_tipo VARCHAR(1),
    nm_tipo VARCHAR(11),
    CONSTRAINT pk_tipo_usuario PRIMARY KEY (sg_tipo)
);

CREATE TABLE usuario (
    cd_usuario INT,
    nm_usuario VARCHAR(255),
    nm_email VARCHAR(255),
    nm_telefone VARCHAR(11),
    nm_senha VARCHAR(32),
    ds_usuario TEXT,
    dt_nascimento DATE,
    cd_cnpj VARCHAR(14),
    ic_ativo BOOLEAN,
    cd_cep VARCHAR(8),
    sg_tipo VARCHAR(1),
    CONSTRAINT pk_usuario PRIMARY KEY (cd_usuario),
    CONSTRAINT fk_usuario_tipo_usuario FOREIGN KEY (sg_tipo) REFERENCES tipo_usuario(sg_tipo)
);

CREATE TABLE tipo_pix(
    cd_tipo INT,
    nm_tipo VARCHAR(20),
    CONSTRAINT pk_tipo_pix PRIMARY KEY (cd_tipo)
);

CREATE TABLE pix(
    cd_pix INT,
    cd_tipo INT,
    cd_organizacao INT,
    nm_chave_pix VARCHAR(50),
    CONSTRAINT pk_pix PRIMARY KEY (cd_pix),
    CONSTRAINT fk_pix_tipo_pix FOREIGN KEY (cd_tipo) REFERENCES tipo_pix(cd_tipo),
    CONSTRAINT fk_pix_usuario FOREIGN KEY (cd_organizacao) REFERENCES usuario(cd_usuario)
);

CREATE TABLE fav_usuario (
    cd_favoritador INT,
    cd_favoritado INT,
    CONSTRAINT pk_fav_usuario PRIMARY KEY (cd_favoritado, cd_favoritador),
    CONSTRAINT fk_fav_usuario_favoritador FOREIGN KEY (cd_favoritador) REFERENCES usuario(cd_usuario),
    CONSTRAINT fk_fav_usuario_favoritado FOREIGN KEY (cd_favoritado) REFERENCES usuario(cd_usuario)
);

CREATE TABLE tipo_evento (
    cd_tipo INT,
    nm_tipo VARCHAR(40),
    CONSTRAINT pk_tipo_evento PRIMARY KEY (cd_tipo)
);

CREATE TABLE evento (
    cd_evento INT,
    nm_evento VARCHAR(255),
    ds_evento TEXT,
    dt_inicio DATETIME,
    dt_final DATETIME,
    cd_organizacao INT,
    cd_tipo INT,
    CONSTRAINT pk_evento PRIMARY KEY (cd_evento),
    CONSTRAINT fk_evento_usuario FOREIGN KEY (cd_organizacao) REFERENCES usuario(cd_usuario),
    CONSTRAINT fk_evento_tipo_evento FOREIGN KEY (cd_tipo) REFERENCES tipo_evento(cd_tipo)
);

CREATE TABLE porte (
    sg_porte VARCHAR(1),
    nm_porte VARCHAR(50),
    CONSTRAINT pk_porte PRIMARY KEY (sg_porte)
);

CREATE TABLE especie (
    cd_especie INT,
    nm_especie VARCHAR(20),
    CONSTRAINT pk_especie PRIMARY KEY (cd_especie)
);

CREATE TABLE raca (
    cd_raca INT,
    nm_raca VARCHAR(50),
    cd_especie INT,
    sg_porte VARCHAR(1),
    CONSTRAINT pk_raca PRIMARY KEY (cd_raca),
    CONSTRAINT fk_raca_porte FOREIGN KEY (sg_porte) REFERENCES porte(sg_porte),
    CONSTRAINT fk_raca_especie FOREIGN KEY (cd_especie) REFERENCES especie(cd_especie)
);

CREATE TABLE genero (
    sg_genero VARCHAR(1),
    nm_genero VARCHAR(5),
    CONSTRAINT pk_genero PRIMARY KEY (sg_genero)
);

CREATE TABLE animal (
    cd_animal INT,
    nm_animal VARCHAR(50),
    ds_animal TEXT,
    dt_nascimento DATE,
    ic_castrado BOOLEAN,
    cd_raca INT,
    sg_genero VARCHAR(1),
    cd_organizacao INT,
    CONSTRAINT pk_animal PRIMARY KEY (cd_animal),
    CONSTRAINT fk_animal_organizacao FOREIGN KEY (cd_organizacao) REFERENCES usuario(cd_usuario),
    CONSTRAINT fk_animal_genero FOREIGN KEY (sg_genero) REFERENCES genero(sg_genero),
    CONSTRAINT fk_animal_raca FOREIGN KEY (cd_raca) REFERENCES raca(cd_raca)
);

CREATE TABLE pergunta (
    cd_pergunta INT,
    nm_pergunta TEXT,
    cd_organizacao INT,
    CONSTRAINT pk_pergunta PRIMARY KEY (cd_pergunta),
    CONSTRAINT fk_pergunta_usuario FOREIGN KEY (cd_organizacao) REFERENCES usuario(cd_usuario)
);

CREATE TABLE pedido (
    dt_pedido DATE,
    ic_permitido BOOLEAN,
    ic_finalizado BOOLEAN,
    cd_animal INT,
    cd_adotante INT,
    CONSTRAINT pk_pedido PRIMARY KEY (dt_pedido, cd_animal, cd_adotante),
    CONSTRAINT fk_pedido_adotante FOREIGN KEY (cd_adotante) REFERENCES usuario(cd_usuario),
    CONSTRAINT fk_pedido_animal FOREIGN KEY (cd_animal) REFERENCES animal(cd_animal)
);

CREATE TABLE resposta (
    nm_resposta TEXT,
    cd_pergunta INT,
    cd_animal INT,
    cd_adotante INT,
    dt_pedido DATE,
    CONSTRAINT pk_resposta PRIMARY KEY (cd_pergunta, cd_animal, cd_adotante, dt_pedido),
    CONSTRAINT fk_resposta_pedido FOREIGN KEY (dt_pedido, cd_animal, cd_adotante) REFERENCES pedido(dt_pedido, cd_animal, cd_adotante),
    CONSTRAINT fk_resposta_pergunta FOREIGN KEY (cd_pergunta) REFERENCES pergunta(cd_pergunta)
);

CREATE TABLE fav_animal (
    cd_favoritador INT,
    cd_favoritado INT,
    CONSTRAINT pk_fav_animal PRIMARY KEY (cd_favoritado, cd_favoritador),
    CONSTRAINT fk_fav_animal_favoritador FOREIGN KEY (cd_favoritador) REFERENCES usuario(cd_usuario),
    CONSTRAINT fk_fav_animal_favoritado FOREIGN KEY (cd_favoritado) REFERENCES animal(cd_animal)
);

CREATE TABLE fav_evento (
    cd_favoritador INT,
    cd_favoritado INT,
    CONSTRAINT pk_fav_evento PRIMARY KEY (cd_favoritado, cd_favoritador),
    CONSTRAINT fk_fav_evento_favoritador FOREIGN KEY (cd_favoritador) REFERENCES usuario(cd_usuario),
    CONSTRAINT fk_fav_evento_favoritado FOREIGN KEY (cd_favoritado) REFERENCES evento(cd_evento)
);

CREATE TABLE codigo_verificacao (
    dt_expiracao DATETIME,
    ic_usado BOOLEAN,
    nm_codigo VARCHAR(8),
    cd_usuario INT,
    CONSTRAINT pk_codigo_verificacao PRIMARY KEY (dt_expiracao, cd_usuario, cd_verificacao),
    CONSTRAINT fk_codigo_verificacao_usuario FOREIGN KEY (cd_usuario) REFERENCES usuario(cd_usuario)
);
