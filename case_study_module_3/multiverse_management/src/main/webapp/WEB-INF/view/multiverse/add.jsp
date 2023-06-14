<%--
  Created by IntelliJ IDEA.
  User: Admini
  Date: 6/5/2023
  Time: 3:33 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Add new multiverse</title>
    <style>
        .message {
            color: blue;
        }
    </style>
</head>
<body>
<p style="float: left">
    <a href="/home">Back to multiverse lists</a>
</p>
<center>
    <h1>Add new multiverse</h1>
</center>
<div align="center">
    <p>
        <c:if test='${requestScope["message"] != null}'>
            <span class="message">${requestScope["message"]}</span>
        </c:if>
    </p>
    <form method="post">
        <fieldset>
            <legend>Multiverse information</legend>
            <table border="1" cellpadding="5">
                <tr>
                    <td><label for="name">Name: </label></td>
                    <td><input type="text" name="name" id="name" size="45" title="letter and number allowed" required></td>
                </tr>

                <tr>
                    <td><label for="detail">Detail: </label></td>
                    <td><input type="text" name="detail" id="detail" size="45" title="letter and number allowed"></td>
                </tr>

                <tr>
                    <td><label for="img">Img: </label></td>
                    <td><input type="text" name="img" id="img" size="45" title="url of image" required></td>
                </tr>

                <tr>
                    <td></td>
                    <td>
                        <input type="submit" value="Add new multiverse">
                        <input type="reset" name="reset" value="Reset">
                    </td>
                </tr>
            </table>
        </fieldset>
    </form>
</div>
</body>
</html>
