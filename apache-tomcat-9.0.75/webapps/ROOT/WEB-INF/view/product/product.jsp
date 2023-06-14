<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 13/06/2023
  Time: 9:21 SA
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
  <a href="/cart" style="border: 1px double black;padding: 10px;background-color: aqua">Giỏ hàng</a>
</div>
<table border="1">
  <tr>
    <th>tên sản phẩm</th>
    <th>hình ảnh</th>
    <th>giá tiền</th>
    <th>mua sản phẩm</th>
  </tr>
  <c:forEach items="${listP}" var="c">
    <tr>
      <td>${c.name}</td>
      <td><img src="${c.image}" style="width: 60px;height: 50px"></td>
      <td>${c.price}</td>
      <td style="text-align: center"><a href="/addCart?id=${c.id}">thêm vào giỏ hàng</a></td>
    </tr>
  </c:forEach>
</table>
</body>
</html>