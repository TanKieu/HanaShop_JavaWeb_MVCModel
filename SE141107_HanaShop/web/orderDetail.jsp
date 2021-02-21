<%-- 
    Document   : orderDetail
    Created on : Jan 18, 2021, 9:55:25 PM
    Author     : winnh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Detail</title>
    </head>
    <body>
        <c:set var="orderId" value="${sessionScope.ORDERID}"></c:set>
        <c:set var="detailList" value="${sessionScope.DETAILLIST}"></c:set>
        Order ID:  ${orderId}
        <c:if test="${not empty detailList}">
            <table border="1">
                <thead>
                    <tr>
                        <th>Name</th>
                        <th>Catagory</th>
                        <th>Price</th>
                        <th>Image</th>
                        <th>Quantity</th>
                        
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="pro" items="${detailList}" >
                        <tr>
                        <td>${pro.key.name}</td>
                        <td>${pro.key.category}</td>
                        <td>${pro.key.price}</td>
                        <td><img src="${pro.key.imageURL}" width="50px" height="30px"/>
                        </td>
                        <td>${pro.value}</td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </c:if>
        <a href="shoppingHistory.jsp">Back to Your History</a>
    </body>
</html>
