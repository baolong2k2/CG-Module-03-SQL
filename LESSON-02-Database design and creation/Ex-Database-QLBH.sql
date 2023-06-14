CREATE DATABASE IF NOT EXISTS QUANLYBANHANG;
USE QUANLYBANHANG;


CREATE TABLE CUSTOMER (
    CID INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    CNAME VARCHAR(30) NOT NULL,
    CAGE INT DEFAULT 0 CHECK (CAGE BETWEEN 0 AND 100)
);


CREATE TABLE PRODUCT (
    PID INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    PNAME VARCHAR(50) NOT NULL,
    PPRICE BIGINT NOT NULL
);


CREATE TABLE ORDERS (
    OID INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    CID INT NOT NULL,
    ODATE DATETIME NOT NULL,
    OTOTALPRICE BIGINT NOT NULL,
    FOREIGN KEY (CID)
        REFERENCES CUSTOMER (CID)
); 


CREATE TABLE ORDERDETAIL (
    OID INT NOT NULL,
    PID INT NOT NULL,
    ODQTY INT NOT NULL,
    PRIMARY KEY (OID , PID),
    FOREIGN KEY (OID)
        REFERENCES ORDERS (OID),
    FOREIGN KEY (PID)
        REFERENCES PRODUCT (PID)
);