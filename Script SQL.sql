drop table Produto cascade constraints;
drop table Comprador cascade constraints;
drop table Fornecedor cascade constraints;
drop table Requisicao cascade constraints;
drop table Produto_fornecedor cascade constraints;
drop table Registra_req cascade constraints;

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



-----------------------------------------------------------------------------------------------------------
-----------------------UPDATE NO BANCO---------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------

UPDATE Produto_Fornecedor
SET produto_fornecedor.preco_unidade = 2.7
WHERE produto_fornecedor.fk_fornecedor_cnpj_forn = '22222222222222' and produto_fornecedor.fk_produto_cod_produto = 'CD002' ;

select * from Produto_Fornecedor;

-----------------------------------------------------------------------------------------------------------
-----------------------DELETE NO BANCO---------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------

DELETE FROM Produto
WHERE produto.cod_produto = 'MK006';

DELETE FROM Produto
WHERE produto.cod_produto = 'MT007';

DELETE FROM Produto
WHERE produto.cod_produto = 'NA105';

select * from produto;



-----------------------------------------------------------------------------------------------------------
---------------     Funções para validar a entrada de dados    --------------------------------------------
-----------------------------------------------------------------------------------------------------------

-- Função 1 validar se o CNPJ inserido tem 14 numeros -----------------------------------------------------
CREATE OR REPLACE FUNCTION validar_cnpj(p_cnpj IN VARCHAR2) RETURN BOOLEAN IS
BEGIN
  
  IF LENGTH(p_cnpj) = 14 THEN
    RETURN TRUE;
  ELSE
    RETURN FALSE;
  END IF;
END validar_cnpj;
/
DECLARE
  v_cnpj_valido BOOLEAN;
BEGIN
  v_cnpj_valido := validar_cnpj('&CNPJ');
  IF v_cnpj_valido THEN
    DBMS_OUTPUT.PUT_LINE('CNPJ válido!');
  ELSE
    DBMS_OUTPUT.PUT_LINE('CNPJ inválido!');
  END IF;
END;
/

-- Função 2 - validar se a senha tem mais de 7 caracteres ------------------------------------------------------------------------
CREATE OR REPLACE FUNCTION validar_senha(p_senha IN VARCHAR2) RETURN BOOLEAN IS
BEGIN
  
  IF LENGTH(p_senha) > 6 THEN
    RETURN TRUE;
  ELSE
    RETURN FALSE;
  END IF;
END validar_senha;
/
DECLARE
  v_senha_valida BOOLEAN;
BEGIN
  v_senha_valida := validar_senha('&SENHA');
  IF v_senha_valida THEN
    DBMS_OUTPUT.PUT_LINE('Senha válida!');
  ELSE
    DBMS_OUTPUT.PUT_LINE('Senha fraca! Por favor, escolha uma senha com pelo menos 7 caracteres.');
  END IF;
END;
/


-----------------------------------------------------------------------------------------------------------
---------------     PROCEDURES PARA INSERT, UPDATE E DELETE    --------------------------------------------
-----------------------------------------------------------------------------------------------------------


-----------------------------------------------------------------------------------------------------------
---------------------- INSERT PRODUTO   -------------------------------------------------------------------------

CREATE OR REPLACE PROCEDURE inserir_produto(
    p_nome IN VARCHAR2,
    p_cod_produto IN VARCHAR2,
    p_descricao IN VARCHAR2,
    p_modelo IN VARCHAR2,
    p_fabricante IN VARCHAR2
) IS
BEGIN
    INSERT INTO Produto(nome, cod_produto, descricao, modelo, fabricante)
    VALUES (p_nome, p_cod_produto, p_descricao, p_modelo, p_fabricante);
    COMMIT;
    DBMS_OUTPUT.PUT_LINE('Produto inserido com sucesso!');
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Erro ao inserir o produto: ' || SQLERRM);
END inserir_produto;
/
EXECUTE RM97490.inserir_produto('Novo Produto', 'NP001', 'Descrição do Novo Produto', 'Modelo Novo', 'Fabricante Novo');
/


---------------------------- UPDATE PRODUTO -----------------------------------------------------------
CREATE OR REPLACE PROCEDURE atualizar_produto(
    p_cod_produto IN VARCHAR2,
    p_novo_nome IN VARCHAR2,
    p_nova_descricao IN VARCHAR2,
    p_novo_modelo IN VARCHAR2,
    p_novo_fabricante IN VARCHAR2
) IS
BEGIN
    UPDATE Produto
    SET
        nome = p_novo_nome,
        descricao = p_nova_descricao,
        modelo = p_novo_modelo,
        fabricante = p_novo_fabricante
    WHERE
        cod_produto = p_cod_produto;

    COMMIT;
    DBMS_OUTPUT.PUT_LINE('Produto atualizado com sucesso!');
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('Produto não encontrado para atualização.');
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Erro ao atualizar o produto: ' || SQLERRM);
END atualizar_produto;
/
EXECUTE RM97490.atualizar_produto('NP001', 'Novo Nome', 'Nova Descrição', 'Novo Modelo', 'Novo Fabricante');
SELECT * FROM PRODUTO;

------------------ DELETE PRODUTO -------------------------------------------------------------------------
CREATE OR REPLACE PROCEDURE excluir_produto(
    p_cod_produto IN VARCHAR2
) IS
BEGIN
    DELETE FROM Produto
    WHERE cod_produto = p_cod_produto;

    COMMIT;
    DBMS_OUTPUT.PUT_LINE('Produto excluído com sucesso!');
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('Produto não encontrado para exclusão.');
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Erro ao excluir o produto: ' || SQLERRM);
END excluir_produto;
/

EXECUTE RM97490.excluir_produto('NP001');
SELECT * FROM PRODUTO;


-----------------------------------------------------------------------------------------------------------
---------------------- INSERT COMPRADOR   -----------------------------------------------------------------


CREATE OR REPLACE PROCEDURE inserir_comprador(
    p_nome IN VARCHAR2,
    p_cnpj_comp IN NUMBER,
    p_email IN VARCHAR2,
    p_senha IN VARCHAR2,
    p_mod_tributario_comp IN VARCHAR2
) IS
BEGIN
    INSERT INTO Comprador(nome, CNPJ_comp, email, senha, mod_tributario_comp)
    VALUES (p_nome, p_cnpj_comp, p_email, p_senha, p_mod_tributario_comp);
    
    COMMIT;
    DBMS_OUTPUT.PUT_LINE('Comprador inserido com sucesso!');
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Erro ao inserir o comprador: ' || SQLERRM);
END inserir_comprador;
/
EXECUTE RM97490.inserir_comprador('Novo Comprador TESTE', 12345999991234, 'novo@email.com', 'nova_senha', 'Simples Nacional');

SELECT * FROM COMPRADOR;

---------------------- UPDATE COMPRADOR   -----------------------------------------------------------------

CREATE OR REPLACE PROCEDURE atualizar_comprador(
    p_cnpj_comp IN NUMBER,
    p_novo_nome IN VARCHAR2,
    p_novo_email IN VARCHAR2,
    p_nova_senha IN VARCHAR2,
    p_novo_mod_tributario_comp IN VARCHAR2
) IS
BEGIN
    UPDATE Comprador
    SET
        nome = p_novo_nome,
        email = p_novo_email,
        senha = p_nova_senha,
        mod_tributario_comp = p_novo_mod_tributario_comp
    WHERE
        CNPJ_comp = p_cnpj_comp;

    COMMIT;
    DBMS_OUTPUT.PUT_LINE('Comprador atualizado com sucesso!');
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('Comprador não encontrado para atualização.');
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Erro ao atualizar o comprador: ' || SQLERRM);
END atualizar_comprador;
/
EXECUTE RM97490.atualizar_comprador(12345999991234, 'Novo Nome TESTE', 'novo_email@dominio.com', 'nova_senha_segura', 'Lucro Real');

SELECT * FROM COMPRADOR;

---------------------- DELETE COMPRADOR   -----------------------------------------------------------------

CREATE OR REPLACE PROCEDURE excluir_comprador(
    p_cnpj_comp IN NUMBER
) IS
BEGIN
    DELETE FROM Comprador
    WHERE CNPJ_comp = p_cnpj_comp;

    COMMIT;
    DBMS_OUTPUT.PUT_LINE('Comprador excluído com sucesso!');
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('Comprador não encontrado para exclusão.');
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Erro ao excluir o comprador: ' || SQLERRM);
END excluir_comprador;
/
EXECUTE RM97490.excluir_comprador(12345999991234);

SELECT * FROM COMPRADOR;


-----------------------------------------------------------------------------------------------------------
---------------------- INSERT FORNECEDOR   -----------------------------------------------------------------

CREATE OR REPLACE PROCEDURE inserir_fornecedor(
    p_nome IN VARCHAR2,
    p_cnpj_forn IN NUMBER,
    p_email IN VARCHAR2,
    p_senha IN VARCHAR2,
    p_mod_tributario_forn IN VARCHAR2
) IS
BEGIN
    INSERT INTO Fornecedor(nome, CNPJ_forn, email, senha, mod_tributario_forn)
    VALUES (p_nome, p_cnpj_forn, p_email, p_senha, p_mod_tributario_forn);
    
    COMMIT;
    DBMS_OUTPUT.PUT_LINE('Fornecedor inserido com sucesso!');
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Erro ao inserir o fornecedor: ' || SQLERRM);
END inserir_fornecedor;
/
EXECUTE RM97490.inserir_fornecedor('Novo Fornecedor', 11112277773344, 'novo@fornecedor.com', 'nova_senha', 'Simples Nacional');

SELECT * FROM FORNECEDOR;

---------------------- UPDATE FORNECEDOR   -----------------------------------------------------------------


CREATE OR REPLACE PROCEDURE atualizar_fornecedor(
    p_cnpj_forn IN NUMBER,
    p_novo_nome IN VARCHAR2,
    p_novo_email IN VARCHAR2,
    p_nova_senha IN VARCHAR2,
    p_novo_mod_tributario_forn IN VARCHAR2
) IS
BEGIN
    UPDATE Fornecedor
    SET
        nome = p_novo_nome,
        email = p_novo_email,
        senha = p_nova_senha,
        mod_tributario_forn = p_novo_mod_tributario_forn
    WHERE
        CNPJ_forn = p_cnpj_forn;

    COMMIT;
    DBMS_OUTPUT.PUT_LINE('Fornecedor atualizado com sucesso!');
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('Fornecedor não encontrado para atualização.');
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Erro ao atualizar o fornecedor: ' || SQLERRM);
END atualizar_fornecedor;
/

EXECUTE RM97490.atualizar_fornecedor(11112277773344, 'Novo Nome Fornecedor', 'novo_email@fornecedor.com', 'nova_senha_segura', 'Lucro Real');
SELECT * FROM FORNECEDOR;

---------------------- DELETE COMPRADOR   -----------------------------------------------------------------
CREATE OR REPLACE PROCEDURE excluir_fornecedor(
    p_cnpj_forn IN NUMBER
) IS
BEGIN
    DELETE FROM Fornecedor
    WHERE CNPJ_forn = p_cnpj_forn;

    COMMIT;
    DBMS_OUTPUT.PUT_LINE('Fornecedor excluído com sucesso!');
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('Fornecedor não encontrado para exclusão.');
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Erro ao excluir o fornecedor: ' || SQLERRM);
END excluir_fornecedor;
/

EXECUTE RM97490.excluir_fornecedor(11112277773344);
SELECT * FROM FORNECEDOR;

-----------------------------------------------------------------------------------------------------------
---------------------- INSERT REQUISIÇÃO   ----------------------------------------------------------------
CREATE OR REPLACE PROCEDURE inserir_requisicao (
    p_id_req_produto   IN VARCHAR2,
    P_cod_requisicao      IN VARCHAR2,
    P_quantidade     IN INTEGER,
    P_teto_automatico     IN NUMBER,
    P_data_req IN DATE,
    P_fk_comprador_cnpj_comp     IN NUMBER,
    P_cod_produto     IN VARCHAR2
) IS
BEGIN
    INSERT INTO REQUISICAO (id_req_produto,cod_requisicao,quantidade,teto_automatico,data_req, fk_Comprador_CNPJ_comp,fk_cod_produto ) 
    VALUES (p_id_req_produto, P_cod_requisicao, P_quantidade, P_teto_automatico, P_data_req, P_fk_comprador_cnpj_comp,P_cod_produto);

    COMMIT;
    DBMS_OUTPUT.PUT_LINE('Requisição inserida com sucesso!');
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Erro ao inserir a requisição: ' || SQLERRM);
END inserir_requisicao;
/


BEGIN
    RM97490.inserir_requisicao(
        'REQ001',
        'REQUISICAO_TESTE',
        100,
        10,
        '15-MAI-2022',
        33333333333333, 
        'AU004'
    );
END;
/

---------------------- UPDATE REQUISIÇÃO   ----------------------------------------------------------------

CREATE OR REPLACE PROCEDURE atualizar_requisicao (
    p_id_req_produto IN VARCHAR2,
    p_novo_cod_requisicao IN VARCHAR2,
    p_nova_quantidade IN INTEGER,
    p_novo_teto_automatico IN NUMBER,
    p_nova_data_req IN DATE
    
) IS
BEGIN
    UPDATE Requisicao
    SET
        cod_requisicao = p_novo_cod_requisicao,
        quantidade = p_nova_quantidade,
        teto_automatico = p_novo_teto_automatico,
        data_req = p_nova_data_req
        
    WHERE
        id_req_produto = p_id_req_produto;

    COMMIT;
    DBMS_OUTPUT.PUT_LINE('Requisição atualizada com sucesso!');
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('Requisição não encontrada para atualização.');
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Erro ao atualizar a requisição: ' || SQLERRM);
END atualizar_requisicao;
/

EXECUTE RM97490.atualizar_requisicao('REQ001','NOVO_CODIGO',NULL,NULL,NULL);
SELECT * FROM requisicao;


---------------------- DELETE REQUISIÇÃO   ----------------------------------------------------------------

CREATE OR REPLACE PROCEDURE excluir_requisicao (
    p_id_req_produto IN VARCHAR2
) IS
BEGIN
    DELETE FROM Requisicao
    WHERE id_req_produto = p_id_req_produto;

    COMMIT;
    DBMS_OUTPUT.PUT_LINE('Requisição excluída com sucesso!');
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('Requisição não encontrada para exclusão.');
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Erro ao excluir a requisição: ' || SQLERRM);
END excluir_requisicao;
/

EXECUTE RM97490.excluir_requisicao('REQ010');
SELECT * FROM requisicao;


-----------------------------------------------------------------------------------------------------------
---------------------- INSERT REGISTRA_REQ   ----------------------------------------------------------------

CREATE OR REPLACE PROCEDURE inserir_registra_req(
    p_cnpj_fornecedor IN NUMBER,
    p_id_req_produto IN VARCHAR2
) IS
BEGIN
    INSERT INTO Registra_req (fk_Fornecedor_CNPJ, fk_Requisicao_id_req)
    VALUES (p_cnpj_fornecedor, p_id_req_produto);

    COMMIT;
    DBMS_OUTPUT.PUT_LINE('Registro na tabela Registra_req inserido com sucesso!');
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Erro ao inserir registro na tabela Registra_req: ' || SQLERRM);
END inserir_registra_req;
/
BEGIN
    inserir_registra_req('11111111111111', 'REQ006');
END;
/
SELECT * FROM REGISTRA_REQ;


---------------------- UPDATE  REGISTRA_REQ   ----------------------------------------------------------------

CREATE OR REPLACE PROCEDURE atualizar_registra_req(
    p_cnpj_fornecedor_antigo IN NUMBER,
    p_id_req_produto_antigo IN VARCHAR2,
    p_cnpj_fornecedor_novo IN NUMBER,
    p_id_req_produto_novo IN VARCHAR2
) IS
BEGIN
    UPDATE Registra_req
    SET
        fk_Fornecedor_CNPJ = p_cnpj_fornecedor_novo,
        fk_Requisicao_id_req = p_id_req_produto_novo
    WHERE
        fk_Fornecedor_CNPJ = p_cnpj_fornecedor_antigo
        AND fk_Requisicao_id_req = p_id_req_produto_antigo;

    COMMIT;
    DBMS_OUTPUT.PUT_LINE('Registro na tabela Registra_req atualizado com sucesso!');
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('Registro não encontrado para atualização.');
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Erro ao atualizar registro na tabela Registra_req: ' || SQLERRM);
END atualizar_registra_req;
/

BEGIN
    atualizar_registra_req('11111111111111', 'REQ006', '55555555555555', 'REQ006');
END;
/
SELECT * FROM REGISTRA_REQ;


---------------------- DELETE  REGISTRA_REQ   ----------------------------------------------------------------


CREATE OR REPLACE PROCEDURE excluir_registra_req(
    p_cnpj_fornecedor IN NUMBER,
    p_id_req_produto IN VARCHAR2
) IS
BEGIN
    DELETE FROM Registra_req
    WHERE
        fk_Fornecedor_CNPJ = p_cnpj_fornecedor
        AND fk_Requisicao_id_req = p_id_req_produto;

    COMMIT;
    DBMS_OUTPUT.PUT_LINE('Registro na tabela Registra_req excluído com sucesso!');
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('Registro não encontrado para exclusão.');
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Erro ao excluir registro na tabela Registra_req: ' || SQLERRM);
END excluir_registra_req;
/


BEGIN
    excluir_registra_req('55555555555555', 'REQ006');
END;
/
SELECT * FROM REGISTRA_REQ;





-----------------------------------------------------------------------------------------------------------
---------------     CONSULTA COM JOIN E CURSOR    ---------------------------------------------------------
-----------------------------------------------------------------------------------------------------------

DECLARE
    CURSOR consulta IS
        SELECT p.nome AS nome_produto, f.nome AS nome_fornecedor, pf.preco_unidade
        FROM Produto p
        JOIN Produto_Fornecedor pf ON p.cod_produto = pf.fk_Produto_cod_produto
        JOIN Fornecedor f ON pf.fk_Fornecedor_CNPJ_forn = f.CNPJ_forn;

    v_nome_produto Produto.nome%TYPE;
    v_nome_fornecedor Fornecedor.nome%TYPE;
    v_preco_unidade Produto_Fornecedor.preco_unidade%TYPE;
BEGIN
    OPEN consulta;

    LOOP
        FETCH consulta INTO v_nome_produto, v_nome_fornecedor, v_preco_unidade;

        EXIT WHEN consulta%NOTFOUND;

        DBMS_OUTPUT.PUT_LINE('Nome do Produto: ' || v_nome_produto);
        DBMS_OUTPUT.PUT_LINE('Nome do Fornecedor: ' || v_nome_fornecedor);
        DBMS_OUTPUT.PUT_LINE('Preço por Unidade: ' || v_preco_unidade);
    END LOOP;

    CLOSE consulta;
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Erro: ' || SQLERRM);
END;
/

SET SERVEROUTPUT ON;

-----------------------------------------------------------------------------------------------------------
---------------     CONSULTA COM PROCEDURE    ---------------------------------------------------------
-----------------------------------------------------------------------------------------------------------
CREATE OR REPLACE PROCEDURE relatorio_quantidade_produtos_comprador IS
BEGIN
    FOR rec IN (
        SELECT c.nome AS nome_comprador,
               COUNT(r.id_req_produto) AS total_produtos_requisitados
          FROM Comprador c
          JOIN Requisicao r ON c.CNPJ_comp = r.fk_Comprador_CNPJ_comp
         GROUP BY c.nome
         ORDER BY total_produtos_requisitados DESC
    ) LOOP
        DBMS_OUTPUT.PUT_LINE('Comprador: ' || rec.nome_comprador);
        DBMS_OUTPUT.PUT_LINE('Total de Produtos Requisitados: ' || rec.total_produtos_requisitados);
        DBMS_OUTPUT.PUT_LINE('------------------------');
    END LOOP;
END relatorio_quantidade_produtos_comprador;
/

BEGIN
    relatorio_quantidade_produtos_comprador;
END;
/

