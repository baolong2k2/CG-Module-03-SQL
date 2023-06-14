<%--
  Created by IntelliJ IDEA.
  User: Admini
  Date: 6/12/2023
  Time: 9:36 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Edit Student</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
<div class="container">
    <h1>Edit Student</h1>
    <form action="edit" method="POST">
        <div class="form-group">
            <label>Name:</label>
            <input type="text" name="name" value="${student.name}" required>
        </div>
        <div class="form-group">
            <label>Date of Birth:</label>
            <input type="date" name="dateOfBirth" value="${student.dateOfBirth}" required>
        </div>
        <div class="form-group">
            <label>Address:</label>
            <input type="text" name="address" value="${student.address}" required>
        </div>
        <div class="form-group">
            <label>Phone Number:</label>
            <input type="text" name="phoneNumber" value="${student.phoneNumber}" required>
        </div>
        <div class="form-group">
            <label>Email:</label>
            <input type="email" name="email" value="${student.email}" required>
        </div>
        <div class="form-group">
            <label>Classroom:</label>
            <input type="text" name="classroom" value="${student.classroom}" required>
        </div>
        <button type="submit" class="btn btn-primary">Update</button>
    </form>
    <a href="index">Back</a>
</div>
</body>
</html>

