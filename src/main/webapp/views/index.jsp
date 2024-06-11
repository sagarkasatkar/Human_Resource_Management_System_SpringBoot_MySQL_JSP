<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="com.data.spring.*" %>
<%@page import="org.springframework.data.domain.Page" %>
<%@page import="java.util.*" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Employee Management</title>
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
    table {
        width: 90%;
        margin: 20px auto;
        border-collapse: collapse;
    }
    table, th, td {
        border: 1px solid black;
    }
    th, td {
        padding: 10px;
        text-align: left;
    }
    th {
        background-color: #f2f2f2;
    }
    h1 {
        text-align: center;
    }
    .pagination {
        display: flex;
        justify-content: center;
        list-style-type: none;
        padding: 0;
    }
    .pagination li {
        margin: 0 5px;
    }
    .pagination a {
        text-decoration: none;
        color: black;
        padding: 8px 16px;
        border: 1px solid #ddd;
    }
    .pagination a.active {
        background-color: #4CAF50;
        color: white;
        border: 1px solid #4CAF50;
    }
    .pagination a:hover:not(.active) {
        background-color: #ddd;
    }
    .btn {
        padding: 5px 10px; /* Adjusted padding for medium size */
        border: none;
        cursor: pointer;
        text-decoration: none;
        color: white;
        text-align: center;
        display: inline-block;
        font-size: 14px; /* Adjusted font size for medium size */
    }
    .btn-edit {
        background-color: #4CAF50;
    }
    .btn-delete {
        background-color: #f44336;
    }
    .btn-edit:hover {
        background-color: #45a049;
    }
    .btn-delete:hover {
        background-color: #e53935;
    }
</style>
</head>
<body>

<div class="navbar">
    <a href="addEmployee">Add New Employee</a>
</div>

<div class="container">
    <h1>Human Resource Management System</h1>

    <table>
        <tr>
            <th>Id</th>
            <th>Name</th>
            <th>Department</th>
            <th>Salary</th>
            <th>Edit</th>
            <th>Delete</th>
        </tr>
        <%
        Page<Employee> p = (Page<Employee>) request.getAttribute("page");
        for (Employee e : p.getContent()) {
        %>
        <tr>
            <td><%= e.getId() %></td>
            <td><%= e.getName() %></td>
            <td><%= e.getDepartment() %></td>
            <td><%= e.getSalary() %></td>
            <td><a class="btn btn-edit" href="/updateEmployee/<%= e.getId() %>">Edit</a></td>
            <td><a class="btn btn-delete" href="/deleteEmployee/<%= e.getId() %>">Delete</a></td>
        </tr>
        <% } %>
    </table>

    <div class="pagination">
        <% 
        int totalPages = p.getTotalPages();
        for (int i = 0; i < totalPages; i++) {
            if (i == p.getNumber()) {
        %>
        <a class="active" href="/?page=<%= i %>"><%= i + 1 %></a>
        <% } else { %>
        <a href="/?page=<%= i %>"><%= i + 1 %></a>
        <% } %>
        <% } %>
    </div>
</div>

</body>
</html>
