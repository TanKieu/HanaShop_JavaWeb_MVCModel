<%-- 
    Document   : shoppingHistory
    Created on : Jan 18, 2021, 1:50:07 AM
    Author     : winnh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>History</title>
    </head>
    <body>
        Your History
        <c:set var="historyList" value="${sessionScope.HISTORYLIST}"></c:set>
            <form action="DispatchServlet">
                Search by Order ID: 
                <input type="text" name="txtSearchHistory" value="" /> 
                <input type="submit" value="Search History" name="btAction" />
            </form>        
        <c:if test="${not empty historyList}">

                <table border="1">
                    <thead>
                            <th>Order ID</th>
                            <th>Order Time </th>
                            <th>Amout </th>
                    </thead>
                    <tbody>
                        <c:forEach var="order" items="${historyList}"  varStatus="counter">
                          <form action="DispatchServlet">
                            <tr>
                                <td>${order.orderID}</td>
                                <td>${order.orderTime}</td>
                                <td>${order.amount}</td>
                                <td><input type="submit" value="View" name="btAction" /> </td>
                            <input type="hidden" name="txtOrderID" value="${order.orderID}" />
                            </tr>
                          </form>                           
                        </c:forEach>


                    </tbody>
                </table>

        </c:if>
        <a href="viewCart.jsp">Back to Your Cart</a>
    </body>
</html>
