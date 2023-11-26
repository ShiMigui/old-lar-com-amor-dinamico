USE larcomamor;
DELIMITER $ 

DROP PROCEDURE IF EXISTS AtualizarPerfilUsuario $ 
CREATE PROCEDURE AtualizarPerfilUsuario(pcd_usuario INT, pnm_usuario VARCHAR(255), pnm_email VARCHAR(255), pnm_telefone VARCHAR(11), pds_usuario TEXT, pcd_cep VARCHAR(8)) 
BEGIN
    UPDATE usuario
    SET nm_usuario = IF(pnm_usuario IS NOT NULL, pnm_usuario, nm_usuario),
        nm_email = IF(pnm_email IS NOT NULL, pnm_email, nm_email),
        nm_telefone = IF(pnm_telefone IS NOT NULL, pnm_telefone, nm_telefone),
        ds_usuario = IF(pds_usuario IS NOT NULL, pds_usuario, ds_usuario),
        cd_cep = IF(pcd_cep IS NOT NULL, pcd_cep, cd_cep)
    WHERE cd_usuario = pcd_usuario;
END;
$ 

DROP PROCEDURE IF EXISTS AtualizarSenhaUsuario $ 
CREATE PROCEDURE AtualizarSenhaUsuario(pcd_usuario INT, pnm_senha VARCHAR(32)) BEGIN
    UPDATE usuario
    SET nm_senha = MD5(pnm_senha)
    WHERE cd_usuario = pcd_usuario;
END;
$

DROP PROCEDURE IF EXISTS AtualizarAtividadeUsuario $ 
CREATE PROCEDURE AtualizarAtividadeUsuario(pcd_usuario INT, pic_ativo BOOLEAN) BEGIN
    UPDATE usuario
    SET ic_ativo = pic_ativo
    WHERE cd_usuario = pcd_usuario;
END;
$

DROP PROCEDURE IF EXISTS AtualizarAnimal $ 
CREATE PROCEDURE AtualizarAnimal(pcd_animal INT, pnm_animal VARCHAR(50), pds_animal TEXT, pdt_nascimento DATE, pic_castrado BOOLEAN, pcd_raca INT, psg_genero VARCHAR(1)) 
BEGIN
    UPDATE animal 
    SET 
        nm_animal = pnm_animal,
        ds_animal = pds_animal,
        dt_nascimento = pdt_nascimento,
        ic_castrado = pic_castrado,
        cd_raca = pcd_raca,
        sg_genero = psg_genero
    WHERE cd_animal = pcd_animal;
END;
$

DROP PROCEDURE IF EXISTS AtualizarEvento $ 
CREATE PROCEDURE AtualizarEvento(pcd_evento INT, pnm_evento VARCHAR(255), pds_evento TEXT, pdt_inicio DATETIME, pdt_final DATETIME, pcd_organizacao INT, pcd_tipo INT)
BEGIN
    UPDATE evento 
    SET 
        nm_evento = pnm_evento,
        ds_evento = pds_evento,
        dt_inicio = pdt_inicio,
        dt_final = pdt_final,
        cd_organizacao = pcd_organizacao,
        cd_tipo = pcd_tipo
    WHERE cd_evento = pcd_evento;
END;
$

DROP PROCEDURE IF EXISTS NovoUsuario $ 
CREATE PROCEDURE NovoUsuario(pnm_usuario VARCHAR(255), pnm_email VARCHAR(255), pnm_telefone VARCHAR(11), pcd_cep VARCHAR(8), pcd_cnpj VARCHAR(14), pnm_senha VARCHAR(32), psg_tipo VARCHAR(1), pds_usuario TEXT )
BEGIN 
    DECLARE pcd_usuario INT;

    SELECT COALESCE(MAX(cd_usuario) + 1, 1) INTO pcd_usuario FROM usuario;

    INSERT INTO usuario (cd_usuario, ic_ativo, nm_senha, cd_cnpj, sg_tipo)  VALUES (pcd_usuario, true, MD5(pnm_senha), pcd_cnpj, psg_tipo);

    CALL AtualizarPerfilUsuario(pcd_usuario, pnm_usuario, pnm_email, pnm_telefone, pds_usuario, pcd_cep);
END;
$

DROP PROCEDURE IF EXISTS NovoEvento $
CREATE PROCEDURE NovoEvento(pnm_evento VARCHAR(255), pds_evento TEXT, pdt_inicio DATETIME, pdt_final DATETIME, pcd_organizacao INT, pcd_tipo INT)
BEGIN 
    DECLARE pcd_evento INT;

    SELECT COALESCE(MAX(cd_evento) + 1, 1) INTO pcd_evento FROM evento;

    INSERT INTO evento (cd_evento, nm_evento, ds_evento, dt_inicio, dt_final, cd_organizacao, cd_tipo) VALUES (pcd_evento, pnm_evento, pds_evento, pdt_inicio, pdt_final, pcd_organizacao, pcd_tipo);
END;
$

DROP PROCEDURE IF EXISTS NovoAnimal $
CREATE PROCEDURE NovoAnimal(pnm_animal VARCHAR(50), pds_animal TEXT, pdt_nascimento DATE, pic_castrado BOOLEAN, pcd_raca INT, psg_genero VARCHAR(1), pcd_organizacao INT)
BEGIN 
    DECLARE pcd_animal INT;

    SELECT COALESCE(MAX(cd_animal) + 1, 1) INTO pcd_animal FROM animal;

    INSERT INTO animal (cd_animal, nm_animal, ds_animal, dt_nascimento, ic_castrado, cd_raca, sg_genero, cd_organizacao) 
	VALUES (pcd_animal, pnm_animal, pds_animal, pdt_nascimento, pic_castrado, pcd_raca, psg_genero, pcd_organizacao);
END;
$

DROP PROCEDURE IF EXISTS NovoCidade$
CREATE PROCEDURE NovoCidade(pnm_cidade VARCHAR(30), psg_estado VARCHAR(2))
BEGIN 
    DECLARE pcd_cidade INT;
	SELECT COALESCE(MAX(cd_cidade) + 1, 1) INTO pcd_cidade FROM cidade;
    INSERT INTO cidade (cd_cidade, nm_cidade, sg_estado) VALUES (pcd_cidade, pnm_cidade, psg_estado);
END;
$

DROP PROCEDURE IF EXISTS NovoCEP$
CREATE PROCEDURE NovoCEP(pcd_cep VARCHAR(8), pnm_rua VARCHAR(255), pcd_cidade INT)
BEGIN
    INSERT INTO cep (cd_cep, nm_rua, cd_cidade) VALUES (pcd_cep, pnm_rua, pcd_cidade);
END;
$

DROP PROCEDURE IF EXISTS DeletarAnimal$
CREATE PROCEDURE DeletarAnimal(pcd_animal INT)
BEGIN
    DELETE FROM animal WHERE cd_animal = pcd_animal;
END;
$

DROP PROCEDURE IF EXISTS DeletarEvento$
CREATE PROCEDURE DeletarEvento(pcd_evento INT)
BEGIN
    DELETE FROM evento WHERE cd_evento = pcd_evento;
END;
$

DROP PROCEDURE IF EXISTS PegarGeneros$
CREATE PROCEDURE PegarGeneros()
BEGIN 
    SELECT sg_genero, nm_genero FROM genero ORDER BY nm_genero;
END;
$

DROP PROCEDURE IF EXISTS PegarEspecies$
CREATE PROCEDURE PegarEspecies()
BEGIN 
    SELECT cd_especie, nm_especie FROM especie ORDER BY nm_especie;
END;
$

DROP PROCEDURE IF EXISTS PegarPortes$
CREATE PROCEDURE PegarPortes()
BEGIN
    SELECT sg_porte, nm_porte FROM porte;
END;
$

DROP PROCEDURE IF EXISTS PegarRacas$
CREATE PROCEDURE PegarRacas(pcd_especie int)
BEGIN 
    SELECT cd_raca, nm_raca FROM raca WHERE cd_especie = pcd_especie ORDER BY nm_raca;
END;
$

DROP PROCEDURE IF EXISTS PegarPorteRaca$
CREATE PROCEDURE PegarPorteRaca(pcd_raca int)
BEGIN 
    SELECT sg_porte FROM raca WHERE cd_raca = pcd_raca;
END;
$

DROP PROCEDURE IF EXISTS PegarAnimalCodigo$
CREATE PROCEDURE PegarAnimalCodigo(pcd_animal int)
BEGIN 
    SELECT a.nm_animal, a.ds_animal, a.dt_nascimento, a.ic_castrado, u.nm_usuario, u.cd_usuario, 
        IFNULL(qt_pedido, 0) as qt_pedido, r.cd_raca, r.nm_raca, e.cd_especie, e.nm_especie, g.sg_genero, g.nm_genero, p.sg_porte, p.nm_porte
    FROM animal a 
    JOIN usuario u ON (u.cd_usuario = a.cd_organizacao)
    JOIN genero g ON (g.sg_genero = a.sg_genero)
    JOIN raca r ON (r.cd_raca = a.cd_raca)
    JOIN especie e ON (e.cd_especie = r.cd_especie)
    JOIN porte p ON (p.sg_porte = r.sg_porte)
    LEFT JOIN (
        SELECT cd_animal, COUNT(cd_adotante) as qt_pedido
        FROM pedido
        GROUP BY cd_animal
    ) pd ON (pd.cd_animal = a.cd_animal)
    WHERE a.cd_animal = pcd_animal;
END;
$

DROP PROCEDURE IF EXISTS PegarEventoCodigo$
CREATE PROCEDURE PegarEventoCodigo(pcd_evento int)
BEGIN 
    SELECT * FROM evento WHERE cd_evento = pcd_evento;
END;
$

DROP PROCEDURE IF EXISTS PegarUsuarioCodigo$
CREATE PROCEDURE PegarUsuarioCodigo(pcd_usuario int)
BEGIN 
    SELECT * FROM usuario WHERE cd_usuario = pcd_usuario;
END;
$


DROP PROCEDURE IF EXISTS Login$
CREATE PROCEDURE Login(pnm_login text, pnm_senha text)
BEGIN
	SELECT cd_usuario, nm_usuario, sg_tipo FROM usuario WHERE (cd_cnpj = pnm_login OR nm_email = pnm_login OR nm_usuario = pnm_login) AND nm_senha = MD5(pnm_senha);
END;
$


DROP PROCEDURE IF EXISTS NovoPedido$
CREATE PROCEDURE NovoPedido(pcd_animal INT, pcd_adotante INT)
BEGIN
	DECLARE now_date DATE;
    SET now_date = CURDATE();

    INSERT INTO pedido (dt_pedido, ic_permitido, ic_finalizado, cd_animal, cd_adotante) 
    VALUES (now_date, FALSE, FALSE, pcd_animal, pcd_adotante);
    SELECT now_date;
END;
$

DROP PROCEDURE IF EXISTS PegarPedido$
CREATE PROCEDURE PegarPedido(pcd_animal INT, pcd_adotante INT)
BEGIN
	SELECT p.dt_pedido, p.cd_animal, p.cd_adotante, 
           GROUP_CONCAT(DISTINCT(r.nm_resposta)) AS respostas
    FROM pedido p
    JOIN resposta r ON p.dt_pedido = r.dt_pedido AND p.cd_animal = r.cd_animal AND p.cd_adotante = r.cd_adotante
    WHERE p.cd_animal = pcd_animal AND p.cd_adotante = pcd_adotante AND p.ic_finalizado = false
    GROUP BY p.dt_pedido, p.cd_animal, p.cd_adotante;
END;
$
DELIMITER ;
call pegarPedido(1, 2);