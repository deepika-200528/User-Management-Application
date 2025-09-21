<%@ page language="java" contentType="text/html; charset=UTF-8"
 pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>

<head>
    <title>User Management Application</title>
    <link rel="stylesheet"
        href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
        integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
        crossorigin="anonymous">
</head>

<body>

    <header>
        <nav class="navbar navbar-expand-md navbar-dark" style="background-color: tomato">
            <div>
                <h4  class="navbar-brand">User Management Application</h4>
            </div>
            <ul class="navbar-nav">
                <li><a href="${pageContext.request.contextPath}/list" class="nav-link">Users</a></li>
            </ul>
        </nav>
    </header>
    <br>

    <div class="row">
        <div class="container">
            <h3 class="text-center">List of Users</h3>
            <hr>
            <div class="container text-left">
                <a href="?action=new" class="btn btn-primary">Add User</a>

            </div>
            <br>
            <table class="table table-bordered">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>UserName</th>
                        <th>Password</th>
                        <th>FirstName</th>
                        <th>LastName</th>
                        <th>Date of Birth</th>
                        <th>Address</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="user" items="${listUser}">
                        <tr>
                            <td><c:out value="${user.id}" /></td>
                            <td><c:out value="${user.userName}" /></td>
                            <!-- You can mask password if needed -->
                            <td>••••••</td>
                            <td><c:out value="${user.firstName}" /></td>
                            <td><c:out value="${user.lastName}" /></td>
                            <td><c:out value="${user.dob}" /></td>
                            <td><c:out value="${user.address}" /></td>
                            <td>
                                <a href="UserServlet?action=edit&id=${user.id}">Edit</a>

                                &nbsp;&nbsp;&nbsp;&nbsp;
                                <a href="?action=delete&id=${user.id}" onclick="return confirm('Are you sure you want to delete this user?');">Delete</a>

                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</body>

</html>
