<%--
  Created by IntelliJ IDEA.
  User: Admini
  Date: 6/4/2023
  Time: 3:45 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>Notify</title>
  <style>
    body {
      background-image: url("https://firebasestorage.googleapis.com/v0/b/multiverse-5e274.appspot.com/o/space-background-realistic-starry-night-cosmos-shining-stars-milky-way-stardust-color-galaxy.jpg?alt=media&token=f21fe979-1dd6-4842-80d4-8473e3e16b22");
      background-size: cover;
      background-repeat: no-repeat;
    }
    .notify {
      position: fixed;
      top: 50%;
      left: 50%;
      transform: translate(-50%, -50%);
      background-color: #f8f9fa;
      border-radius: 10px;
      padding: 20px;
      box-shadow: 0 2px 5px rgba(0, 0, 0, 0.2);
      text-align: center;
      font-family: Arial, sans-serif;
    }
    .notify p {
      font-size: 24px;
      margin-bottom: 20px;
    }
    .notify button {
      font-size: 18px;
      padding: 10px 20px;
      background-color: #007bff;
      color: #fff;
      border: none;
      border-radius: 5px;
      cursor: pointer;
    }
    .notify button:hover {
      background-color: #0056b3;
    }
  </style>
</head>
<body>
<div class="notify">
  <p>!!!COMPLETE WELCOME TO THE MULTIVERSE!!!</p>
  <button onclick="goBack()">Back</button>
</div>
<script>
  function goBack() {
    window.location.href = "/home.jsp";
  }
</script>
</body>
</html>

