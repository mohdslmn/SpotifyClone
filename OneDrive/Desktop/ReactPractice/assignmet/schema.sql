CREATE TABLE CITIES
( 
  city char(20),
  state char(20),
  zip_code char(10),
  PRIMARY KEY (CID)
);
CREATE TABLE WAREHOUSES
(
    WID int NOT NULL,
    WNAME CHAR(30),
    LOCATIONCHAR(20),
    EXTRA CONTEXT json
);
CREATE TABLE STORES
(
SID int NOT NULL,
STORE_NAME CHAR(20), 
LOCATION_CITYCHAR(20)
);

CREATE TABLE CUSTOMER
(
    CNO int NOT NULL, 
    CNAME CHAR(50),
    ADDR VARCHAR(50),
    CU_CITY CHAR(20)
);

CREATE TABLE ORDERS(
    ONO INT NOT NULL,
    ODATE DATE
    );

CREATE TABLE ITEMS(
    ITEMNO INT NOT NULL,
    DESCRIPTION TEXT,
    WEIGHT DECIMAL(5,2),
    COST DECIMAL(5,2) 
);

ALTER TABLE WAREHOUSES
ADD CID int FOREIGNKEY REFERENCES CITIES (CID)

ALTER TABLE STORES
ADD WID int FOREIGNKEY REFERENCES WAREHOUSES (WID)

ALTER TABLE ORDERS
ADD CNO int FOREIGNKEY REFERENCES CUSTOMER (CNO)

CREATE TABLE ITEMSORDERS(
    IOID int NOT NULL,
    ITEMNO int,
    ONO int,
    PRIMARY KEY (IOID),
    FOREIGN KEY (ITEMNO) REFERENCES ITEMS (ITEMNO),
    FOREIGN KEY (ONO) REFERENCES ORDERS (ONO)
); 

CREATE TABLE STORESITEMS(
    SIID int NOT NULL,
    SID int,
    ITEMNO int,
    PRIMARY KEY (SIID),
    FOREIGN KEY (ITEMNO) REFERENCES ITEMS (ITEMNO),
    FOREIGN KEY (SID) REFERENCES STORES (SID)
);
