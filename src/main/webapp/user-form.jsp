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
            <div class="navbar-brand">
                <h4 >User Management App </h4>
            </div>

            <ul class="navbar-nav">
                <li><a href="<%=request.getContextPath()%>/list" class="nav-link">Users</a></li>
            </ul>
        </nav>
    </header>

    <br>
    <div class="container col-md-5">
        <div class="card">
            <div class="card-body">
                <form action="UserServlet" method="post">

                    <!-- Hidden ID field if editing -->
                    <c:if test="${user != null}">
                        <input type="hidden" name="id" value="${user.id}" />
                        <input type="hidden" name="action" value="update" />
                    </c:if>
                    <c:if test="${user == null}">
                        <input type="hidden" name="action" value="insert" />
                    </c:if>

                    <caption>
                        <h2>
                            <c:if test="${user != null}">
                                Edit User
                            </c:if>
                            <c:if test="${user == null}">
                                Add New User
                            </c:if>
                        </h2>
                    </caption>

                    <fieldset class="form-group">
                        <label>UserName</label>
                        <input type="text" value="<c:out value='${user.userName}' />"
                            class="form-control" name="userName" required="required">
                    </fieldset>

                    <fieldset class="form-group">
                        <label>Password</label>
                        <input type="password" value="<c:out value='${user.password}' />"
                            class="form-control" name="password" required="required">
                    </fieldset>

                    <fieldset class="form-group">
                        <label>FirstName</label>
                        <input type="text" value="<c:out value='${user.firstName}' />"
                            class="form-control" name="firstName">
                    </fieldset>

                    <fieldset class="form-group">
                        <label>LastName</label>
                        <input type="text" value="<c:out value='${user.lastName}' />"
                            class="form-control" name="lastName" required="required">
                    </fieldset>

                    <fieldset class="form-group">
                        <label>Date of Birth</label>
                        <input type="date" value="<c:out value='${user.dob}' />"
                            class="form-control" name="dob" required="required">
                    </fieldset>

                    <fieldset class="form-group">
                        <label>Address</label>
                        <input type="text" value="<c:out value='${user.address}' />"
                            class="form-control" name="address" required="required">
                    </fieldset>

                    <button type="submit" class="btn btn-success">Save</button>
                </form>
            </div>
        </div>
    </div>

</body>

</html>
