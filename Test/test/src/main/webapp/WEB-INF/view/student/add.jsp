<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Add Student</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
<div class="container">
    <h1>Add Student</h1>
    <form action="add" method="POST">
        <div class="form-group">
            <label>Name:</label>
            <input type="text" name="name" required>
        </div>
        <div class="form-group">
            <label>Date of Birth:</label>
            <input type="date" name="dateOfBirth" required>
        </div>
        <div class="form-group">
            <label>Address:</label>
            <input type="text" name="address" required>
        </div>
        <div class="form-group">
            <label>Phone Number:</label>
            <input type="text" name="phoneNumber" required>
        </div>
        <div class="form-group">
            <label>Email:</label>
            <input type="email" name="email" required>
        </div>
        <div class="form-group">
            <label>Classroom:</label>
            <input type="text" name="classroom" required>
        </div>
        <button type="submit" class="btn btn-primary">Add</button>
    </form>
    <a href="index">Back</a>
</div>
</body>
</html>
