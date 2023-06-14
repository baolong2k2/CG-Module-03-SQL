<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Student Management System</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
<div class="container">
    <h1>Student Management System</h1>
    <table class="table">
        <thead>
        <tr>
            <th>Name</th>
            <th>Date of Birth</th>
            <th>Address</th>
            <th>Phone Number</th>
            <th>Email</th>
            <th>Classroom</th>
            <th>Action</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${students}" var="student">
            <tr>
                <td>${student.name}</td>
                <td>${student.dateOfBirth}</td>
                <td>${student.address}</td>
                <td>${student.phoneNumber}</td>
                <td>${student.email}</td>
                <td>${student.classroom}</td>
                <td>
                    <a href="edit?name=${student.name}">Edit</a>
                    <a href="delete?name=${student.name}">Delete</a>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
    <a href="add">Add New Student</a>
    <form action="search" method="GET">
        <input type="text" name="name" placeholder="Search by name">
        <input type="submit" value="Search">
    </form>
</div>
</body>
</html>
