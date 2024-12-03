CREATE TABLE Prod (
    prodId VARCHAR(5),
    pname VARCHAR(50),
    price DECIMAL(10, 2)
    );
    ALTER TABLE Prod ADD CONSTRAINT pk_prod PRIMARY KEY (prodId);
    ALTER TABLE Prod ADD CONSTRAINT ck_prod CHECK (price > 0);
    
    CREATE TABLE DEPOT(
		depId VARCHAR(5),
        addr VARCHAR(100),
        volume INTEGER
    );
    ALTER TABLE DEPOT ADD CONSTRAINT pk_DEPOT PRIMARY KEY(DepId);
    ALTER TABLE DEPOT ADD CONSTRAINT ck_DEPOT check (volume > 0);
    ALTER TABLE DEPOT ADD CONSTRAINT ck_DEPOT_addr check (addr != NULL);
    
    
    CREATE TABLE Stock (
    pcode VARCHAR(5),
    dcode VARCHAR(5),
    quantity INT
    );
    ALTER TABLE Stock ADD CONSTRAINT pk_Stock PRIMARY KEY(pcode, dcode);
    ALTER TABLE Stock ADD CONSTRAINT fk_Stock FOREIGN KEY(pcode) REFERENCES Prod(prodId)
    ON DELETE Cascade
    ON UPDATE CASCADE;
    ALTER TABLE Stock ADD CONSTRAINT fk_Stock_dcode FOREIGN KEY(dcode) REFERENCES DEPOT(DepId)
    ON DELETE Cascade
    ON UPDATE CASCADE;
    ALTER TABLE Stock ADD CONSTRAINT ck_Stock check(quantity >= 0);
    Alter Table stock drop constraint ck_Stock;
    
    
    
    
    
INSERT INTO Prod (prodId, pname, price) VALUES
('p1', 'tape', 2.5),
('p2', 'tv', 250),
('p3', 'vcr', 80);

INSERT INTO DEPOT (depId, addr, volume) VALUES
('d1', 'New York', 9000),
('d2', 'Syracuse', 6000),
('d4', 'New York', 2000);


INSERT INTO Stock (pcode, dcode, quantity) VALUES
('p1', 'd1', 1000),
('p3', 'd1', 3000),
('p2', 'd1', -400),
('p2', 'd2', 2000),
('p1', 'd2', -100),
('p1', 'd4', 1200),
('p3', 'd4', 2000),
('p2', 'd4', 1500);