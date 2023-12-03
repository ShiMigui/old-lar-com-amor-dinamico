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

DROP PROCEDURE IF EXISTS NovaVerificacao $ 
CREATE PROCEDURE NovaVerificacao(pcd_usuario INT, pnm_codigo VARCHAR(8), pqt_dias INT)
BEGIN 
    INSERT INTO codigo_verificacao (dt_expiracao, ic_usado, nm_codigo, cd_usuario) 
    VALUES (
        DATE_ADD(NOW(), INTERVAL pqt_dias DAY), 
        FALSE, 
        pnm_codigo,
        pcd_usuario
    );
END;

DROP PROCEDURE IF EXISTS NovoUsuario $ 
CREATE PROCEDURE NovoUsuario(pnm_usuario VARCHAR(255), pnm_email VARCHAR(255), pnm_telefone VARCHAR(12), pnm_senha VARCHAR(60), 
pdt_nascimento DATE, pcd_cnpj VARCHAR(14), pcd_cep VARCHAR(8), psg_tipo VARCHAR(1), pnm_codigo VARCHAR(8))
BEGIN 
    DECLARE pcd_usuario INT;
    SELECT COALESCE(MAX(cd_usuario) + 1, 1) INTO pcd_usuario FROM usuario;
    
	INSERT INTO usuario (cd_usuario, nm_usuario, nm_email, nm_telefone, nm_senha, ds_usuario, dt_nascimento, cd_cnpj, cd_cep, sg_tipo, ic_ativo) VALUES
    (pcd_usuario, pnm_usuario, pnm_email, pnm_telefone, MD5(pnm_senha), NULL, pdt_nascimento, pcd_cnpj, pcd_cep, psg_tipo, 0);
    CALL NovaVerificacao(pcd_usuario, pnm_codigo, 1);
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
DROP PROCEDURE IF EXISTS NovoCep$
CREATE PROCEDURE NovoCep(pcd_cep VARCHAR(8), pnm_rua VARCHAR(255), pnm_cidade VARCHAR(30), psg_estado VARCHAR(2))
BEGIN
    DECLARE pcd_cidade INT;
    
    SELECT cd_cidade INTO pcd_cidade 
    FROM cidade 
    WHERE nm_cidade = pnm_cidade AND sg_estado = psg_estado;
    
    IF pcd_cidade IS NULL THEN
        CALL NovoCidade(pnm_cidade, psg_estado);
        SELECT cd_cidade INTO pcd_cidade 
        FROM cidade 
        WHERE nm_cidade = pnm_cidade AND sg_estado = psg_estado;
    END IF;
    
    -- Adiciona o CEP à cidade existente ou recém-criada
    INSERT INTO cep (cd_cep, nm_rua, cd_cidade) VALUES (pcd_cep, pnm_rua, pcd_cidade);
END$

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

DROP PROCEDURE if EXISTS PegarCep$
CREATE PROCEDURE PegarCep(pcd_cep VARCHAR(8))
BEGIN
	SELECT c.sg_estado, c.nm_cidade, cep.nm_rua FROM cep
	JOIN cidade c ON cep.cd_cidade = c.cd_cidade
    Where cep.cd_cep = pcd_cep;
END;
$

DROP PROCEDURE IF EXISTS Login$
CREATE PROCEDURE Login(pnm_login text, pnm_senha text)
BEGIN
	SELECT cd_usuario, nm_usuario, sg_tipo FROM usuario WHERE (cd_cnpj = pnm_login OR nm_email = pnm_login) AND nm_senha = MD5(pnm_senha) AND ic_ativo = 1;
END;
$

DROP PROCEDURE IF EXISTS PegarPerguntasOrg$
CREATE PROCEDURE PegarPerguntasOrg(pcd_organizacao INT)
BEGIN
	SELECT cd_pergunta, nm_pergunta FROM pergunta where cd_organizacao = pcd_organizacao;
END;
$



DROP PROCEDURE IF EXISTS PegarRespostasUsuario$
CREATE PROCEDURE PegarRespostasUsuario(pcd_animal INT, pcd_adotante INT, pdt_pedido DATE)
BEGIN
	SELECT p.cd_pergunta, p.nm_pergunta, r.nm_resposta FROM pergunta p 
	JOIN resposta r ON r.cd_pergunta = p.cd_pergunta
	WHERE r.cd_adotante = pcd_adotante AND r.cd_animal = pcd_animal AND r.dt_pedido = pdt_pedido;
END;
$

DROP PROCEDURE IF EXISTS VerificarRespostasUsuario$
CREATE PROCEDURE VerificarRespostasUsuario(pcd_animal INT, pcd_adotante INT)
BEGIN
	SELECT r.nm_resposta FROM pedido p 
	JOIN resposta r ON r.cd_adotante = p.cd_adotante AND r.cd_animal = p.cd_animal AND r.dt_pedido = p.dt_pedido
	WHERE p.cd_adotante = pcd_adotante AND p.cd_animal = pcd_animal AND p.ic_finalizado IS NULL AND p.ic_permitido IS NULL;
END$

DROP PROCEDURE IF EXISTS NovoPedido$
CREATE PROCEDURE NovoPedido(pcd_animal INT, pcd_adotante INT)
BEGIN
	DECLARE now_date DATE;
    SET now_date = CURDATE();

    INSERT INTO pedido (dt_pedido, ic_permitido, ic_finalizado, cd_animal, cd_adotante) 
    VALUES (now_date, NULL, NULL, pcd_animal, pcd_adotante);
    SELECT now_date;
END;
$

DROP PROCEDURE IF EXISTS GetDashboardData$
CREATE PROCEDURE GetDashboardData(IN pcd_organizacao INT)
BEGIN
    SELECT
        (SELECT COUNT(*) FROM animal WHERE cd_organizacao = pcd_organizacao) AS total_animais,
        (SELECT COUNT(DISTINCT p1.cd_animal)
            FROM pedido p1
            INNER JOIN animal a1 ON p1.cd_animal = a1.cd_animal
            WHERE a1.cd_organizacao = pcd_organizacao
            AND p1.ic_permitido = TRUE
            AND p1.ic_finalizado = TRUE) AS animais_adotados,
        (SELECT COUNT(*) FROM pedido p2
            WHERE p2.ic_permitido IS NULL
            AND p2.cd_animal IN (SELECT cd_animal FROM animal WHERE cd_organizacao = pcd_organizacao)) AS pedidos_pendentes,
        (SELECT COUNT(*) FROM pedido p3
            WHERE p3.ic_permitido = TRUE
            AND p3.ic_finalizado IS NULL
            AND p3.cd_animal IN (SELECT cd_animal FROM animal WHERE cd_organizacao = pcd_organizacao)) AS pedidos_permitidos,
        (SELECT COUNT(*) FROM pedido p4
            WHERE p4.ic_finalizado IS NOT NULL
            AND p4.cd_animal IN (SELECT cd_animal FROM animal WHERE cd_organizacao = pcd_organizacao)) AS pedidos_finalizados;
END$

DROP PROCEDURE IF EXISTS TabPedidosPendentes$
CREATE PROCEDURE TabPedidosPendentes(pcd_organizacao INT, poffset INT)
BEGIN
    SELECT u.nm_usuario AS nm_adotante, p.cd_adotante, a.nm_animal, p.cd_animal, p.dt_pedido
    FROM pedido p
    INNER JOIN usuario u ON p.cd_adotante = u.cd_usuario
    INNER JOIN animal a ON p.cd_animal = a.cd_animal
    WHERE p.ic_permitido IS NULL AND a.cd_organizacao = pcd_organizacao
    LIMIT 5 OFFSET poffset;
END$

DROP PROCEDURE IF EXISTS TabPedidosAceitos$
CREATE PROCEDURE TabPedidosAceitos(pcd_organizacao INT, poffset INT)
BEGIN
    SELECT u.nm_usuario AS nm_adotante, p.cd_adotante, a.nm_animal, p.cd_animal, p.dt_pedido
    FROM pedido p
    INNER JOIN usuario u ON p.cd_adotante = u.cd_usuario
    INNER JOIN animal a ON p.cd_animal = a.cd_animal
    WHERE p.ic_finalizado IS NULL AND p.ic_permitido = true AND a.cd_organizacao = pcd_organizacao
    LIMIT 5 OFFSET poffset;
END$

DROP PROCEDURE IF EXISTS TabHistoricoPedidos$
CREATE PROCEDURE TabHistoricoPedidos(pcd_organizacao INT, poffset INT)
BEGIN
	SELECT u.nm_usuario AS nm_adotante, p.cd_adotante, a.nm_animal, p.cd_animal, p.dt_pedido, p.ic_permitido, p.ic_finalizado
	FROM pedido p
    INNER JOIN usuario u ON p.cd_adotante = u.cd_usuario
    INNER JOIN animal a ON p.cd_animal = a.cd_animal
	WHERE p.ic_finalizado IS NOT NULL AND a.cd_organizacao = pcd_organizacao
    LIMIT 5 OFFSET poffset;
END$

DROP PROCEDURE IF EXISTS PegarUsuario$
CREATE PROCEDURE PegarUsuario(pcd_usuario INT, psg_tipo VARCHAR(1))
BEGIN
	SELECT u.nm_usuario, u.nm_email, u.nm_telefone, u.ds_usuario, c.nm_rua, ci.nm_cidade, ci.sg_estado, u.cd_cep
	FROM usuario u 
	JOIN cep c ON (c.cd_cep = u.cd_cep)
	JOIN cidade ci ON (ci.cd_cidade = c.cd_cidade)
	WHERE u.cd_usuario = pcd_usuario AND u.sg_tipo = psg_tipo AND ic_ativo = 1;
END$

DROP PROCEDURE IF EXISTS NovaRespostaByAnimal$
CREATE PROCEDURE NovaRespostaByAnimal(pcd_animal INT, pcd_adotante INT, pdt_pedido DATE, pnm_resposta TEXT, pcd_pergunta INT)
BEGIN 
	DECLARE pcd_organizacao INT;
	SET pcd_organizacao = (SELECT cd_organizacao FROM animal WHERE cd_animal = pcd_animal);
	INSERT INTO resposta (nm_resposta, cd_pergunta, cd_organizacao, cd_animal, cd_adotante, dt_pedido) VALUES 
	(pnm_resposta, pcd_pergunta, pcd_organizacao, pcd_animal, pcd_adotante, pdt_pedido);
END$

DROP PROCEDURE IF EXISTS PegarPerguntasByAnimal$
CREATE PROCEDURE PegarPerguntasByAnimal(pcd_animal INT)
BEGIN
	SELECT p.cd_pergunta, p.nm_pergunta 
	FROM animal a
	JOIN usuario o ON o.cd_usuario = a.cd_organizacao
	JOIN pergunta p ON p.cd_organizacao = o.cd_usuario
    where a.cd_animal = pcd_animal;
END$

DROP PROCEDURE IF EXISTS AtualizarPedido$
CREATE PROCEDURE AtualizarPedido(pcd_animal INT, pcd_adotante INT, pdt_pedido DATE, pic_permitido BOOLEAN, pic_finalizado BOOLEAN)
BEGIN 
	UPDATE pedido 
		SET ic_permitido = pic_permitido,
        ic_finalizado = pic_finalizado
        WHERE cd_animal = pcd_animal AND cd_adotante = pcd_adotante AND dt_pedido = pdt_pedido;
END$
DELIMITER ;