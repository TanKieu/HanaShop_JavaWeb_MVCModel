<%-- 
    Document   : confirmDel
    Created on : Jan 13, 2021, 9:24:28 PM
    Author     : winnh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Confirm Delete Product</title>
    </head>
    <body>
        <h1>Are you sure to delete this Product </h1>
        <h2>This action will make your product is unavailable to customer</h2>

        
        <c:set var="IdDelPro" value="${sessionScope.DELETE_ID}"></c:set>
        Id Product: ${IdDelPro}
        <form action="DispatchServlet">
            <input type="submit" value="Confirm" name="btAction"/>
            <input type="submit" value="No" name="btAction" />
        </form>
    </body>
</html>
