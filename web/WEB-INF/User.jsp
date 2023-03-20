<%-- 
    Document   : User
    Created on : 19 Mar, 2023, 9:22:27 PM
    Author     : Tejasvi
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>User</title>
    </head>
    <body>
        <h1>Manage Users</h1>
        ${errorMessage}
        <table border="1">
            <tr>
                <td>Email</td>
                <td>First Name</td>
                <td>Last Name</td>
                <td>Role</td>
                <td></td>
                <td></td>
            </tr>
            <c:forEach items="${users}" var="user">
                <tr>
                    <td>${user.email}</td>
                    <td>${user.firstName}</td>
                    <td>${user.lastName}</td>
                    <td>${user.role.roleName}</td>
                            <td>
                                <c:url value="/users" var="editUsers">
                                    <c:param name="email" value="${user.email}"/>
                                     <c:param name="action" value="edit"/>
                                </c:url>
                                <a href=${editUsers}>Edit</a>
                            </td>
                            <td>
                                <c:url value="/users" var="deleteUsers">
                                    <c:param name="email" value="${user.email}"/>
                                     <c:param name="action" value="delete"/>
                                </c:url>
                                <a href=${deleteUsers}>Delete</a>  
                          </td>
                </tr>   
            </c:forEach>
        </table>
        <c:if test="${userInfo eq null}">
            <h2>Add User</h2><br>
            <form action="users" method="post">
                Email <input type="text" name="email" required><br>
                First Name <input type="text" name="firstName" required><br>
                Last Name <input type="text" name="lastName" required><br>
                Password <input type="text" name="password" required><br>
                Role <select name="role">
                    <option value="system admin">system admin</option>
                    <option value="regular user">regular user</option>
                </select> <br>
                <input type="hidden" name="action" value="add">
                <input type="submit" value="Add User">
            </form>
        </c:if>
            <c:if test="${userInfo ne null}">
                <h2>Edit Users</h2><br>
                <form action="users" method="post">
                    <input type="hidden" name="email" value="${userInfo.email}">
                    Email ${userInfo.email}<br>
                    First Name <input type="text" name="firstName" value="${userInfo.firstName}" required> <br>
                    Last Name <input type="text" name="lastName" value="${userInfo.lastName}" required> <br>
                    Password <input type="text" name="password" required><br>
                    Role <select name="role">
                    <option value="system admin">system admin</option>
                    <option value="regular user">regular user</option>
                </select> <br>
                
                <input type="hidden" name="action" value="update">
                <input type="submit" value="Update">
                <a href="\users" class="button">Cancel</a>
                </form>  
            </c:if>
    </body>
</html>