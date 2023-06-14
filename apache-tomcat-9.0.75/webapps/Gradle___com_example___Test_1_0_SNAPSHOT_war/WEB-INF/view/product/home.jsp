<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/functions" %>

<!doctype html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport"
        content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>Document</title>

  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"
        integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw=="
        crossorigin="anonymous" referrerpolicy="no-referrer"/>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"
          integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe"
          crossorigin="anonymous"></script>
  <script src="https://kit.fontawesome.com/d625a478fd.js" crossorigin="anonymous"></script>
</head>
<body>
<div class="container-fluid d-flex justify-content-between mt-3">
  <a href="home">
    <button class="btn btn-info">Home</button>
  </a>
  <a href="product?action=viewCart">
    <button>
      <i class="fa-solid fa-cart-shopping fa-bounce fa-lg"></i>
      Cart
    </button>
  </a>
</div>
<div class="container-fluid mt-5">
  <table class="table table-bordered table-light">
    <c:forEach var="product" items="${products}">
      <tr class="mb-2">
        <td class="me-2">
          <c:out value="${product.name}"/>
        </td>
        <td class="me-2">
          <img style="max-height: 100px" src="<c:out value="${product.name}"/>" alt="product">
        </td>
        <td class="me-2">
          <c:out value="${product.price}"/>
        </td>

        <td class="me-2">
          <a href="product?action=addToCart&id=${product.id}">
            <button class="btn btn-info">
              Add to Cart
            </button>
          </a>
        </td>
        <td>
          <a href="product?action=buyNow&id=${product.id}">
            <button class="btn btn-primary">
              Buy now
            </button>
          </a>
        </td>
      </tr>
    </c:forEach>
  </table>
</div>
</body>
</html>
