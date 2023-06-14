
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 13/06/2023
  Time: 10:22 SA
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
</head>
<body>
<div style="padding: 20px">
    <a href="/product" style="border: 1px double black;padding: 10px;background-color: darkseagreen">quay về</a>
</div>
<table border="1">
    <tr>
        <th>tên sản phẩm</th>
        <th>Giá tiền</th>
        <th>số lượng</th>
        <th>thành tiền</th>
        <th>xóa sản phẩm</th>
    </tr>
    <c:forEach items="${listC}" var="c">
        <tr>
            <td>${c.name}</td>
            <td>${c.price}</td>
            <td style="text-align: center;">${c.quantity}</td>
            <td>${c.subPrice}</td>
            <td><a href="/deleteProduct?id=${c.idProduct}">xóa</a></td>
        </tr>
    </c:forEach>
    <th>Tổng tiền</th>
    <th colspan="4">${totalPrice}</th>
</table>
</body>
</html>
