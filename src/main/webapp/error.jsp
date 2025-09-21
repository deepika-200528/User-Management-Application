<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
    <title>Error Page</title>
</head>
<body>
    <div style="text-align: center;">
        <h1 style="color: red;">Oops! An error occurred.</h1>
        <h2>
            <%= exception.getMessage() %>
        </h2>
    </div>
</body>
</html>
