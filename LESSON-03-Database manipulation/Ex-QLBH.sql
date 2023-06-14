USE QUANLYBANHANG;

INSERT INTO CUSTOMER VALUES (1, 'Minh Quan', 10);
INSERT INTO CUSTOMER VALUES (2, 'Ngoc Oanh', 20);
INSERT INTO CUSTOMER VALUES (3, 'Hong Ha', 50);


ALTER TABLE ORDERS MODIFY COLUMN OTOTALPRICE INT;
ALTER TABLE ORDERS MODIFY OTOTALPRICE INT DEFAULT NULL;
INSERT INTO ORDERS (OID, CID, ODATE, OTOTALPRICE) VALUES
(1, 1, "2006-3-26", NULL),
(2, 2, "2006-03-23", NULL),
(3, 1, "2006-3-16", NULL);


INSERT INTO PRODUCT (PID,PNAME,PPRICE) VALUES
(1, "MAY GIAT", 3),
(2, "TU LANH", 5),
(3, "DIEU HOA", 7),
(4, "QUAT", 1),
(5, "BEP DIEN", 2);


INSERT INTO ORDERDETAIL (OID,PID,ODQTY) VALUES
(1, 1, 3),
(1, 3, 7),
(1, 4, 2),
(2, 1, 1),
(3, 1, 8),
(2, 5, 4),
(2, 3, 3);


#Hiển thị các thông tin  gồm oID, oDate, oPrice của tất cả các hóa đơn trong bảng Order
SELECT * FROM ORDERS;


#Hiển thị danh sách các khách hàng đã mua hàng, và danh sách sản phẩm được mua bởi các khách
SELECT DISTINCT  C.CID, C.CNAME, P.PNAME, OD.ODQTY
FROM CUSTOMER C 
JOIN ORDERS O ON C.CID = O.CID
JOIN ORDERDETAIL OD ON O.OID = OD.OID
JOIN PRODUCT P ON OD.PID = P.PID;


#Hiển thị tên những khách hàng không mua bất kỳ một sản phẩm nào
SELECT *
FROM CUSTOMER C
LEFT JOIN ORDERS O
ON  C.CID = O.CID
WHERE  O.CID IS NULL;


#Hiển thị mã hóa đơn, ngày bán và giá tiền của từng hóa đơn (giá một hóa đơn được tính bằng tổng giá bán của từng loại mặt hàng xuất hiện trong hóa đơn. Giá bán của từng loại được tính = odQTY*pPrice)
SELECT 
    O.OID,
    O.ODATE,
    SUM(P.PPRICE * OD.ODQTY) AS TONG_GIA_TIEN_HOA_DON
FROM
    ORDERS O
        JOIN
    ORDERDETAIL OD ON O.OID = OD.OID
        JOIN
    PRODUCT P ON OD.PID = P.PID
GROUP BY OD.OID;
