<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Update Employee</title>
<style>
    body {
        font-family: Arial, sans-serif;
        background-color: #f0f8ff;
        margin: 0;
        padding: 0;
    }
    .navbar {
        overflow: hidden;
        background-color: #333;
        position: fixed;
        top: 0;
        width: 100%;
    }
    .navbar a {
        float: left;
        display: block;
        color: white;
        text-align: center;
        padding: 14px 20px;
        text-decoration: none;
    }
    .navbar a:hover {
        background-color: #ddd;
        color: black;
    }
    .container {
        padding-top: 60px;
    }
    form {
        width: 50%;
        margin: 0 auto;
        padding: 20px;
        border: 1px solid #ccc;
        background-color: #f9f9f9;
    }
    input[type="text"], input[type="submit"] {
        width: 100%;
        padding: 10px;
        margin: 5px 0;
    }
    input[type="submit"] {
        background-color: #4CAF50;
        color: white;
        border: none;
        cursor: pointer;
    }
    input[type="submit"]:hover {
        background-color: #45a049;
    }
</style>
</head>
<body>

<div class="navbar">
    <a href="/">Home</a>
</div>

<div class="container">
    <h2 style="text-align: center;">Update Employee</h2>

    <form action="/saveEmployee" method="post">
        <input type="hidden" name="id" value="${emp.id}">
        Name: <input type="text" name="name" value="${emp.name}"><br><br>
        Department: <input type="text" name="department" value="${emp.department}"><br><br>
        Salary: <input type="text" name="salary" value="${emp.salary}"><br><br>
        <input type="submit" value="Submit">
    </form>
</div>

</body>
</html>
