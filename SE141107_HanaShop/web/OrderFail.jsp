<%-- 
    Document   : OrderFail
    Created on : Jan 17, 2021, 11:15:53 PM
    Author     : winnh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Order Unsuccessful</title>
    </head>
    <body>
        Your Order is unsuccessful 
        <c:set var="errorList" value="${sessionScope.STOCKERROR}"></c:set>
        <c:if test="${not empty errorList}">
            <c:forEach var="error"  items="${errorList.outOfStockList}">
                <div>
                    ${error}</br> 
                </div>
                               
            </c:forEach>
        </c:if>
                <a href="viewCart.jsp">Try Again</a>
    </body>
</html>
