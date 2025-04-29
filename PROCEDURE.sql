DELIMITER //

CREATE PROCEDURE vender_ingresso (
    IN p_id_sessao INT,
    IN p_nome_cliente VARCHAR(100),
    IN p_valor_pago DECIMAL(6,2)
)
BEGIN
    DECLARE v_capacidade_max INT;
    DECLARE v_total_ingressos INT;

    SELECT capacidade_maxima INTO v_capacidade_max
    FROM Sessao
    WHERE id_sessao = p_id_sessao;

    SELECT COUNT(*) INTO v_total_ingressos
    FROM Ingresso
    WHERE id_sessao = p_id_sessao;

    IF v_total_ingressos < v_capacidade_max THEN
        INSERT INTO Ingresso (id_sessao, nome_cliente, valor_pago)
        VALUES (p_id_sessao, p_nome_cliente, p_valor_pago);
    ELSE
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Capacidade máxima atingida para esta sessão.';
    END IF;
END
//
DELIMITER ;

CALL vender_ingresso(1,'Juninho',12);

select * from ingresso


