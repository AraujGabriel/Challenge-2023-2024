drop table Produto cascade constraints;
drop table Comprador cascade constraints;
drop table Fornecedor cascade constraints;
drop table Requisicao cascade constraints;
drop table Produto_fornecedor cascade constraints;
drop table Registra_req cascade constraints;
drop table Erros cascade constraints;
set serveroutput on;

--------------------------------------------------------------------------------------
------------------------------- CREATE TABLES ----------------------------------------
-- 3. Gerar o modelo físico e criar os objetos no banco de dados. 10 PTS -------------
--------------------------------------------------------------------------------------

CREATE TABLE Produto (
    nome varchar2(30),
    cod_produto varchar2(50) PRIMARY KEY,
    descricao varchar2(200),
    modelo varchar2(50),
    fabricante varchar2(25)
);

CREATE TABLE Comprador (
    nome varchar2(25),
    CNPJ_comp number(14) PRIMARY KEY,
    email varchar2(50),
    senha varchar2(25),
    mod_tributario_comp varchar2(25)
);

CREATE TABLE Fornecedor (
    nome varchar2(25),
    CNPJ_forn number(14) PRIMARY KEY,
    email varchar2(50),
    senha varchar2(25),
    mod_tributario_forn varchar2(25)
);

CREATE TABLE Requisicao (
    id_req_produto varchar2(30)PRIMARY KEY,
    cod_requisicao varchar2(25) ,
    quantidade integer,
    teto_automatico number(7,2),
    data_req date,
    fk_Comprador_CNPJ_comp number(14),
    fk_cod_produto varchar2(50)
);

CREATE TABLE Produto_Fornecedor (
    quantidade number(10,0),
    preco_unidade number(7,2),
    fk_Fornecedor_CNPJ_forn number(14),
    fk_Produto_cod_produto varchar2(50)
);

CREATE TABLE Registra_req (
    fk_Fornecedor_CNPJ number (14),
    fk_Requisicao_id_req varchar2(30)
);

CREATE TABLE Erros (
    codigo_erro INTEGER,
    nome_erro VARCHAR2(100),
    data_ocorrencia TIMESTAMP,
    cnpj_comprador NUMBER,
    FOREIGN KEY (cnpj_comprador) REFERENCES Comprador(CNPJ_comp)
);

-----------------------Adição das chave estrangeiras----------------------------------

ALTER TABLE Requisicao ADD CONSTRAINT FK_Requisicao_2
    FOREIGN KEY (fk_Comprador_CNPJ_comp)
    REFERENCES Comprador (CNPJ_comp);
    
ALTER TABLE Requisicao ADD CONSTRAINT FK_Requisicao_3
    FOREIGN KEY (fk_cod_produto)
    REFERENCES Produto (cod_produto);

ALTER TABLE Produto_Fornecedor ADD CONSTRAINT FK_Produto_Fornecedor_3
    FOREIGN KEY (fk_Fornecedor_CNPJ_forn)
    REFERENCES Fornecedor (CNPJ_forn);

ALTER TABLE Produto_Fornecedor ADD CONSTRAINT FK_Produto_Fornecedor_4
    FOREIGN KEY (fk_Produto_cod_produto)
    REFERENCES Produto (cod_produto);

ALTER TABLE Registra_req ADD CONSTRAINT FK_Reg_CNPJ
    FOREIGN KEY (fk_Fornecedor_CNPJ)
    REFERENCES Fornecedor (CNPJ_forn);
    
ALTER TABLE Registra_req ADD CONSTRAINT FK_Reg_Prod
    FOREIGN KEY (fk_Requisicao_id_req)
    REFERENCES Requisicao (id_req_produto);
    
-------------------------------------------------------------------------------------------------------------
------------------------------- INSERTS NAS TABELAS----------------------------------------------------------
-- 4.Para cada tabela preencher no mínimo 5 registros de acordo com a especificação do projeto. 20 PTS-------
-------------------------------------------------------------------------------------------------------------

--------------------------------INSERT NA TABELA PRODUTO ----------------------------------------------------

 INSERT INTO Produto (nome, cod_produto, descricao, modelo, fabricante)
 VALUES ('Lápis de Cor', 'LC001', 'Caixa com 24 cores', 'Modelo Pencil24', 'Faber-Castell');
        
INSERT INTO Produto (nome, cod_produto, descricao, modelo, fabricante)
 VALUES ('Caderno', 'CD002', 'Caderno Espiral 200 folhas', 'Modelo Estudante200', 'Tilibra');
       
INSERT INTO Produto (nome, cod_produto, descricao, modelo, fabricante)
VALUES ('Caneta Esferográfica', 'CE003', 'Pacote com 10 unidades', 'Modelo Ballpoint10', 'BIC');
        
INSERT INTO Produto (nome, cod_produto, descricao, modelo, fabricante)
VALUES ('Borracha', 'BR004', 'Borracha branca pequena', 'Modelo Basic', 'Staedtler');
        
INSERT INTO Produto (nome, cod_produto, descricao, modelo, fabricante)
VALUES ('Régua', 'RG005', 'Régua de 30 cm', 'Modelo Standard30', 'Maped');
        
INSERT INTO Produto (nome, cod_produto, descricao, modelo, fabricante)
VALUES ('Chave de Fenda', 'CF001', 'Chave de fenda de 6mm', 'Modelo ProTool6', 'Stanley');
        
INSERT INTO Produto (nome, cod_produto, descricao, modelo, fabricante)
VALUES ('Martelo', 'MT002', 'Martelo de unha 16 oz', 'Modelo NailMaster16', 'Estwing');
        
INSERT INTO Produto (nome, cod_produto, descricao, modelo, fabricante)
VALUES ('Serra Elétrica', 'SE003', 'Serra circular elétrica 1200W', 'Modelo PowerSaw1200', 'Makita');
        
INSERT INTO Produto (nome, cod_produto, descricao, modelo, fabricante)
VALUES ('Alicate Universal', 'AU004', 'Alicate universal de 8 polegadas', 'Modelo AllRound8', 'Knipex');
        
INSERT INTO Produto (nome, cod_produto, descricao, modelo, fabricante)
VALUES ('Nível a Laser', 'NL005', 'Nível a laser autonivelante', 'Modelo LaserLevelX1', 'Bosch');

INSERT INTO Produto (nome, cod_produto, descricao, modelo, fabricante)
VALUES ('Makita', 'MK006', 'Makita 220v 1800w', 'Modelo Masterblasters', 'Makita');

INSERT INTO Produto (nome, cod_produto, descricao, modelo, fabricante)
VALUES ('Martelete', 'MT007', 'Martelete potente', 'Modelo Martelento', 'Bosch');

INSERT INTO Produto (nome, cod_produto, descricao, modelo, fabricante)
VALUES ('Nível de agua', 'NA105', 'Nível de bolha dagua', 'Modelo Simples', 'Pedreirao');
   
   
--------------------------------INSERT NA TABELA COMPRADOR --------------------------------------------
   
   
INSERT INTO Comprador (nome, CNPJ_comp, email, senha, mod_tributario_comp)
VALUES ('InovaTech Soluções', '12345678901234', 'contato@inovatech.com', 'senha123', 'Simples Nacional');

INSERT INTO Comprador (nome, CNPJ_comp, email, senha, mod_tributario_comp)
VALUES ('GlobalCom Mercados', '98765432109876', 'contato@globalcom.com', 'senha456', 'Lucro Real');

INSERT INTO Comprador (nome, CNPJ_comp, email, senha, mod_tributario_comp)
VALUES ('EcoLogix Comércio', '54321678901234', 'contato@ecologix.com', 'senha789', 'Simples Nacional');

INSERT INTO Comprador (nome, CNPJ_comp, email, senha, mod_tributario_comp)
VALUES ('TechNova Inc.', '98765432105432', 'contato@technova.com', 'senha321', 'Lucro Real');

INSERT INTO Comprador (nome, CNPJ_comp, email, senha, mod_tributario_comp)
VALUES ('Soluções MegaCorp', '65432178907654', 'contato@megacorp.com', 'senha987', 'Simples Nacional');


--------------------------------INSERT NA TABELA FORNECEDOR--------------------------------------------


INSERT INTO Fornecedor (nome, CNPJ_forn, email, senha, mod_tributario_forn)
VALUES ('PapelariaColorida', '11111111111111', 'contato@papelariacolorida.com', 'senha123', 'Simples Nacional');

INSERT INTO Fornecedor (nome, CNPJ_forn, email, senha, mod_tributario_forn)
VALUES ('MaterialDidático', '22222222222222', 'contato@materialdidatico.com', 'senha456', 'Lucro Real');

INSERT INTO Fornecedor (nome, CNPJ_forn, email, senha, mod_tributario_forn)
VALUES ('ArtePapelaria', '33333333333333', 'contato@arteepapelaria.com', 'senha789', 'Simples Nacional');

INSERT INTO Fornecedor (nome, CNPJ_forn, email, senha, mod_tributario_forn)
VALUES ('Criativa Comércio', '44444444444444', 'contato@escolacriativa.com', 'senha321', 'Lucro Real');

INSERT INTO Fornecedor (nome, CNPJ_forn, email, senha, mod_tributario_forn)
VALUES ('Lápis e Cia', '55555555555555', 'contato@lapisecia.com', 'senha987', 'Simples Nacional');

INSERT INTO Fornecedor (nome, CNPJ_forn, email, senha, mod_tributario_forn)
VALUES ('Master Ltda', '66666666666666', 'contato@ferramentasmaster.com', 'senha123', 'Simples Nacional');

INSERT INTO Fornecedor (nome, CNPJ_forn, email, senha, mod_tributario_forn)
VALUES ('Máqui Equipamentos', '77777777777777', 'contato@maquinaseequipamentos.com', 'senha456', 'Lucro Real');

INSERT INTO Fornecedor (nome, CNPJ_forn, email, senha, mod_tributario_forn)
VALUES ('Ferragens Forte', '88888888888888', 'contato@ferragensforte.com', 'senha789', 'Simples Nacional');

INSERT INTO Fornecedor (nome, CNPJ_forn, email, senha, mod_tributario_forn)
VALUES ('Ferramentas de Qualidade', '99999999999999', 'contato@ferramentasqualidade.com', 'senha321', 'Lucro Real');

INSERT INTO Fornecedor (nome, CNPJ_forn, email, senha, mod_tributario_forn)
VALUES ('Máquinas Precisas', '10101010101010', 'contato@maquinasprecisas.com', 'senha987', 'Simples Nacional');



------------------------------ INSERT NA TABELA REQUISICAO -------------------------------------------


INSERT INTO Requisicao (id_req_produto, cod_requisicao, quantidade, teto_automatico, data_req, fk_Comprador_CNPJ_comp, fk_cod_produto)
VALUES ('REQ001', 'RQ0001', 50, 1000, '02-MAR-1998', '12345678901234', 'LC001');

INSERT INTO Requisicao (id_req_produto, cod_requisicao, quantidade, teto_automatico, data_req, fk_Comprador_CNPJ_comp, fk_cod_produto)
VALUES ('REQ002', 'RQ0002', 30, 1500, '15-MAR-2023', '98765432109876', 'CD002');

INSERT INTO Requisicao (id_req_produto, cod_requisicao, quantidade, teto_automatico, data_req, fk_Comprador_CNPJ_comp, fk_cod_produto)
VALUES ('REQ003', 'RQ0003', 40, NULL, '20-MAI-2023', '54321678901234', 'CE003');

INSERT INTO Requisicao (id_req_produto, cod_requisicao, quantidade, teto_automatico, data_req, fk_Comprador_CNPJ_comp, fk_cod_produto)
VALUES ('REQ004', 'RQ0004', 60, 2000, '10-AGO-2023', '98765432105432', 'BR004');

INSERT INTO Requisicao (id_req_produto, cod_requisicao, quantidade, teto_automatico, data_req, fk_Comprador_CNPJ_comp, fk_cod_produto)
VALUES ('REQ005', 'RQ0005', 25, 2500, '20-OUT-2023', '65432178907654', 'RG005');

INSERT INTO Requisicao (id_req_produto, cod_requisicao, quantidade, teto_automatico, data_req, fk_Comprador_CNPJ_comp, fk_cod_produto)
VALUES ('REQ006', 'RQ0001', 20, 1500, '15-JAN-2023', '12345678901234', 'CE003');

INSERT INTO Requisicao (id_req_produto, cod_requisicao, quantidade, teto_automatico, data_req, fk_Comprador_CNPJ_comp, fk_cod_produto)
VALUES ('REQ007', 'RQ0002', 10, 2000, '10-FEV-2023', '98765432109876', 'LC001');

INSERT INTO Requisicao (id_req_produto, cod_requisicao, quantidade, teto_automatico, data_req, fk_Comprador_CNPJ_comp, fk_cod_produto)
VALUES ('REQ008', 'RQ0002', 15, 2500, '05-MAR-2023', '98765432109876', 'BR004');

INSERT INTO Requisicao (id_req_produto, cod_requisicao, quantidade, teto_automatico, data_req, fk_Comprador_CNPJ_comp, fk_cod_produto)
VALUES ('REQ009', 'RQ0003', 30, 3000, '25-ABR-2023', '54321678901234', 'RG005');

INSERT INTO Requisicao (id_req_produto, cod_requisicao, quantidade, teto_automatico, data_req, fk_Comprador_CNPJ_comp, fk_cod_produto)
VALUES ('REQ010', 'RQ0004', 5, NULL, '15-MAI-2023', '98765432105432', 'CD002');



--------------------------------INSERT NA TABELA PRODUTO_FORNECEDOR--------------------------------------


INSERT INTO Produto_Fornecedor (quantidade, preco_unidade, fk_Fornecedor_CNPJ_forn, fk_Produto_cod_produto)
VALUES (100, 1.5, '11111111111111', 'LC001');

INSERT INTO Produto_Fornecedor (quantidade, preco_unidade, fk_Fornecedor_CNPJ_forn, fk_Produto_cod_produto)
VALUES (200, 2.0, '22222222222222', 'CD002');

INSERT INTO Produto_Fornecedor (quantidade, preco_unidade, fk_Fornecedor_CNPJ_forn, fk_Produto_cod_produto)
VALUES (300, 1.2, '33333333333333', 'CE003');

INSERT INTO Produto_Fornecedor (quantidade, preco_unidade, fk_Fornecedor_CNPJ_forn, fk_Produto_cod_produto)
VALUES (50, 10.0, '66666666666666', 'CF001');

INSERT INTO Produto_Fornecedor (quantidade, preco_unidade, fk_Fornecedor_CNPJ_forn, fk_Produto_cod_produto)
VALUES (40, 12.5, '77777777777777', 'MT002');

INSERT INTO Produto_Fornecedor (quantidade, preco_unidade, fk_Fornecedor_CNPJ_forn, fk_Produto_cod_produto)
VALUES (60, 15.0, '88888888888888', 'SE003');

INSERT INTO Produto_Fornecedor (quantidade, preco_unidade, fk_Fornecedor_CNPJ_forn, fk_Produto_cod_produto)
VALUES (25, 3.0, '44444444444444', 'LC001');

INSERT INTO Produto_Fornecedor (quantidade, preco_unidade, fk_Fornecedor_CNPJ_forn, fk_Produto_cod_produto)
VALUES (15, 18.0, '44444444444444', 'CF001');

INSERT INTO Produto_Fornecedor (quantidade, preco_unidade, fk_Fornecedor_CNPJ_forn, fk_Produto_cod_produto)
VALUES (150, 1.0, '11111111111111', 'CD002');

INSERT INTO Produto_Fornecedor (quantidade, preco_unidade, fk_Fornecedor_CNPJ_forn, fk_Produto_cod_produto)
VALUES (500, 0.5, '22222222222222', 'CE003');

INSERT INTO Produto_Fornecedor (quantidade, preco_unidade, fk_Fornecedor_CNPJ_forn, fk_Produto_cod_produto)
VALUES (30, 15.0, '66666666666666', 'CF001');

INSERT INTO Produto_Fornecedor (quantidade, preco_unidade, fk_Fornecedor_CNPJ_forn, fk_Produto_cod_produto)
VALUES (20, 20.0, '77777777777777', 'MT002');

INSERT INTO Produto_Fornecedor (quantidade, preco_unidade, fk_Fornecedor_CNPJ_forn, fk_Produto_cod_produto)
VALUES (40, 2.5, '55555555555555', 'LC001');

INSERT INTO Produto_Fornecedor (quantidade, preco_unidade, fk_Fornecedor_CNPJ_forn, fk_Produto_cod_produto)
VALUES (10, 25.0, '44444444444444', 'CF001');

INSERT INTO Produto_Fornecedor (quantidade, preco_unidade, fk_Fornecedor_CNPJ_forn, fk_Produto_cod_produto)
VALUES (200, 0.8, '33333333333333', 'LC001');

INSERT INTO Produto_Fornecedor (quantidade, preco_unidade, fk_Fornecedor_CNPJ_forn, fk_Produto_cod_produto)
VALUES (100, 2.0, '66666666666666', 'CD002');


--------------------------------INSERT NA TABELA REGISTRA_REQ --------------------------------------

INSERT INTO Registra_req (fk_Fornecedor_CNPJ, fk_Requisicao_id_req)
VALUES ('11111111111111', 'REQ001');

INSERT INTO Registra_req (fk_Fornecedor_CNPJ, fk_Requisicao_id_req)
VALUES ('22222222222222', 'REQ002');

INSERT INTO Registra_req (fk_Fornecedor_CNPJ, fk_Requisicao_id_req)
VALUES ('33333333333333', 'REQ003');

INSERT INTO Registra_req (fk_Fornecedor_CNPJ, fk_Requisicao_id_req)
VALUES ('66666666666666', 'REQ004');

INSERT INTO Registra_req (fk_Fornecedor_CNPJ, fk_Requisicao_id_req)
VALUES ('77777777777777', 'REQ005');


-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
------ Sprint 04 - Package -----------------------------------------------------------------------------------------------------------------------------------------------------------

CREATE OR REPLACE PACKAGE requisicao_package AS
    PROCEDURE inserir_erro(
        p_codigo_erro IN INTEGER,
        p_nome_erro IN VARCHAR2,
        p_data_ocorrencia IN DATE,
        p_cnpj_comprador IN NUMBER
    );

    FUNCTION calcular_total_requisicao (
        p_quantidade IN NUMBER,
        p_preco_unitario IN NUMBER,
        p_cnpj_comprador IN NUMBER
    ) RETURN NUMBER;

    FUNCTION calcular_estoque_fornecedor (
        p_cnpj_forn IN NUMBER
    ) RETURN NUMBER;
END requisicao_package;
/

CREATE OR REPLACE PACKAGE BODY requisicao_package AS
    PROCEDURE inserir_erro(
        p_codigo_erro IN INTEGER,
        p_nome_erro IN VARCHAR2,
        p_data_ocorrencia IN DATE,
        p_cnpj_comprador IN NUMBER
    ) IS
    BEGIN
        INSERT INTO erros (codigo_erro, nome_erro, data_ocorrencia, cnpj_comprador)
        VALUES (p_codigo_erro, p_nome_erro, p_data_ocorrencia, p_cnpj_comprador);
        COMMIT;
        DBMS_OUTPUT.PUT_LINE('Erro inserido na tabela erros!');
    EXCEPTION
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE('Erro ao inserir o erro: ' || SQLERRM);
    END inserir_erro;

    FUNCTION calcular_total_requisicao (
        p_quantidade IN NUMBER,
        p_preco_unitario IN NUMBER,
        p_cnpj_comprador IN NUMBER
    ) RETURN NUMBER IS
        v_total NUMBER;
    BEGIN
        IF p_quantidade <= 0 THEN
            RETURN -1;
        END IF;

        IF p_preco_unitario <= 0 THEN
            RETURN -2;
        END IF;

        v_total := p_quantidade * p_preco_unitario;
        RETURN v_total;
    END calcular_total_requisicao;

    FUNCTION calcular_estoque_fornecedor (
        p_cnpj_forn IN NUMBER
    ) RETURN NUMBER IS
        v_total_estoque NUMBER := 0;
    BEGIN
        DECLARE
            v_count NUMBER;
        BEGIN
            SELECT COUNT(*)
            INTO v_count
            FROM Fornecedor
            WHERE CNPJ_forn = p_cnpj_forn;

            IF v_count = 0 THEN
                RETURN -1; 
            END IF;
        END;

        SELECT SUM(quantidade)
        INTO v_total_estoque
        FROM Produto_Fornecedor
        WHERE fk_Fornecedor_CNPJ_forn = p_cnpj_forn;

        IF v_total_estoque IS NULL THEN
            v_total_estoque := 0;
        END IF;

        RETURN v_total_estoque;
    EXCEPTION
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE('Erro ao calcular o estoque: ' || SQLERRM);
            RETURN -2; 
    END calcular_estoque_fornecedor;
END requisicao_package;
/

---------------------------------------------------------------------------------------------------------------------
----------------- Teste procedure inserir erro dentro do package ---------------------------------------------------

BEGIN
    requisicao_package.inserir_erro(
        p_codigo_erro => 1,
        p_nome_erro => 'Teste de Erro',
        p_data_ocorrencia => SYSTIMESTAMP,
        p_cnpj_comprador => 12345678901234
    );
END;
/
SELECT * FROM erros;

----------------- Teste função calcular total requisição dentro do package ---------------------------------------------------

DECLARE
    v_quantidade NUMBER := 10;
    v_preco_unitario NUMBER := 50;
    v_cnpj_comprador NUMBER := 12345678901234;
    v_total NUMBER;
BEGIN
    v_total := requisicao_package.calcular_total_requisicao(v_quantidade, v_preco_unitario, v_cnpj_comprador);
    
    IF v_total = -1 THEN
        DBMS_OUTPUT.PUT_LINE('Erro na quantidade');
        requisicao_package.inserir_erro(1, 'Erro na quantidade', SYSTIMESTAMP, v_cnpj_comprador);
    ELSIF v_total = -2 THEN
        DBMS_OUTPUT.PUT_LINE('Erro no preço');
        requisicao_package.inserir_erro(2, 'Erro no preço', SYSTIMESTAMP, v_cnpj_comprador);
    ELSE
        DBMS_OUTPUT.PUT_LINE('O valor total da requisição é: ' || v_total);
    END IF;
END;
/



----------------- Teste função calcular estoque do fornecedor dentro do package ---------------------------------------------------


SET SERVEROUTPUT ON;

DECLARE
    v_cnpj_forn NUMBER := 22222222222222;
    v_total_estoque NUMBER;
BEGIN
    v_total_estoque := requisicao_package.calcular_estoque_fornecedor(v_cnpj_forn);
    
    IF v_total_estoque = -1 THEN 
        DBMS_OUTPUT.PUT_LINE('Fornecedor não encontrado.');
    ELSIF v_total_estoque = -2 THEN
        DBMS_OUTPUT.PUT_LINE('Erro ao calcular o estoque. Verifique o log de erros.');
    ELSE
        DBMS_OUTPUT.PUT_LINE('O estoque total fornecido pelo fornecedor é: ' || v_total_estoque);
    END IF;
END;
/

------------------- TRIGGERS -------------------------------------------------------------------------
---- Trigger que monitora inclusão de novos fornecedores ---------------------------------------------

CREATE TABLE registro_insercao_fornecedor (
    CNPJ_forn NUMBER(14),
    nome_fornecedor VARCHAR2(25),
    data_insercao TIMESTAMP
);

CREATE OR REPLACE TRIGGER monitorar_insercao_fornecedor
AFTER INSERT ON Fornecedor
FOR EACH ROW
BEGIN
    INSERT INTO registro_insercao_fornecedor (CNPJ_forn, nome_fornecedor, data_insercao)
    VALUES (:NEW.CNPJ_forn, :NEW.nome, systimestamp);
END;
/

INSERT INTO Fornecedor (nome, CNPJ_forn, email, senha, mod_tributario_forn)
VALUES ('MArcel´s ltda', '123789123356', 'contato@marcels.com', 'senha123', 'Simples Nacional');

SELECT * from registro_insercao_fornecedor;

------------------- TRIGGERS -------------------------------------------------------------------------
---- Trigger que monitora exclusão de novos fornecedores ---------------------------------------------

CREATE TABLE registro_exclusao_fornecedor (
    CNPJ_forn NUMBER(14),
    nome_fornecedor VARCHAR2(25),
    data_exclusao TIMESTAMP
);

CREATE OR REPLACE TRIGGER monitorar_exclusao_fornecedor
AFTER DELETE ON Fornecedor
FOR EACH ROW
BEGIN
    INSERT INTO registro_exclusao_fornecedor (CNPJ_forn, nome_fornecedor, data_exclusao)
    VALUES (:OLD.CNPJ_forn, :OLD.nome, SYSTIMESTAMP);
END;
/

DELETE FROM Fornecedor
WHERE CNPJ_forn = '123789123356';

select * from registro_exclusao_fornecedor;

------------------- TRIGGERS -------------------------------------------------------------------------
---- Trigger que monitora alterações na tabela produtos ---------------------------------------------

CREATE TABLE registro_alteracoes (
    id_registro NUMBER GENERATED BY DEFAULT ON NULL AS IDENTITY,
    cod_produto VARCHAR2(50),
    nome_antigo VARCHAR2(30),
    nome_novo VARCHAR2(30),
    descricao_antiga VARCHAR2(200),
    descricao_nova VARCHAR2(200),
    modelo_antigo VARCHAR2(50),
    modelo_novo VARCHAR2(50),
    fabricante_antigo VARCHAR2(25),
    fabricante_novo VARCHAR2(25),
    data_alteracao TIMESTAMP,
    PRIMARY KEY (id_registro)
);


select * from registro_alteracoes;


CREATE OR REPLACE TRIGGER monitorar_alteracoes_produto
AFTER UPDATE ON Produto
FOR EACH ROW
BEGIN
   
    IF :OLD.nome <> :NEW.nome THEN
        INSERT INTO registro_alteracoes (cod_produto, nome_antigo, nome_novo, data_alteracao)
        VALUES (:NEW.cod_produto, :OLD.nome, :NEW.nome, SYSTIMESTAMP);
    END IF;

   
    IF :OLD.descricao <> :NEW.descricao THEN
        INSERT INTO registro_alteracoes (cod_produto, descricao_antiga, descricao_nova, data_alteracao)
        VALUES (:NEW.cod_produto, :OLD.descricao, :NEW.descricao, SYSTIMESTAMP);
    END IF;

   
    IF :OLD.modelo <> :NEW.modelo THEN
        INSERT INTO registro_alteracoes (cod_produto, modelo_antigo, modelo_novo, data_alteracao)
        VALUES (:NEW.cod_produto, :OLD.modelo, :NEW.modelo, SYSTIMESTAMP);
    END IF;

    
    IF :OLD.fabricante <> :NEW.fabricante THEN
        INSERT INTO registro_alteracoes (cod_produto, fabricante_antigo, fabricante_novo, data_alteracao)
        VALUES (:NEW.cod_produto, :OLD.fabricante, :NEW.fabricante, SYSTIMESTAMP);
    END IF;
END;
/

-- Teste triggers ------------------------------------------
UPDATE Produto
SET produto.nome = 'Caderno Rosa'
WHERE produto.cod_produto = 'CD002';

UPDATE Produto
SET produto.nome = 'Nivel dagua metalico'
WHERE produto.cod_produto = 'NA105';


UPDATE Produto
SET produto.nome = 'Makita 1000W'
WHERE produto.cod_produto = 'MK006';

select * from Produto;
select * from registro_alteracoes;
