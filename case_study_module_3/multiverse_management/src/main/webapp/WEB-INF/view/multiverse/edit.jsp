<%--
  Created by IntelliJ IDEA.
  User: Admini
  Date: 6/5/2023
  Time: 3:33 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Edit multiverse</title>
</head>
<body>

<p>
    <a href="/home">Back to multiverse list</a>
</p>

<center>
    <h1>Multiverse management</h1>
    <p>
        <c:if test='${requestScope["message"] != null}'>
            <span class="message">${requestScope["message"]}</span>
        </c:if>
    </p>
</center>

<div align="center">
    <form method="post">
        <fieldset>
            <legend>Multiverse Information</legend>
            <table border="1" cellpadding="5">
                <caption>
                    <h2>Edit Multiverse</h2>
                </caption>

                <tr>
                    <td>Name: </td>
                    <td><input type="text" name="name" id="name" value="${requestScope["multiverse"].getName()}"></td>
                </tr>

                <tr>
                    <td>Detail: </td>
                    <td><input type="text" name="detail" id="detail" value="${requestScope["multiverse"].getDetail()}"></td>
                </tr>

                <tr>
                    <td>Img: </td>
                    <td><input type="text" name="img" id="img" value="${requestScope["multiverse"].getImg()}"></td>
                </tr>

                <tr>
                    <td>
                        <input type="submit" value="Update multiverse" name="submit">
                        <input type="reset" name="reset" value="Reset">
                    </td>
                </tr>

            </table>
        </fieldset>
    </form>
</div>

<div></div>
</body>
</html>
