<%-- 
    Document   : viewCart
    Created on : Jan 14, 2021, 6:23:20 PM
    Author     : winnh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Your Cart</title>
    </head>
    <body>
        <h1>Your Cart</h1>
        <c:set var="Cart" value="${sessionScope.CUSTCART}"></c:set>
        <form action="DispatchServlet">
            <input type="submit" value="Order History" name="btAction" />
        </form>
        <a href="shopping.jsp">Back To Shopping</a>
        <c:if test="${not empty Cart}">
            <table border="1">
                <thead>
                    <th>No.</th>
                    <th>Name</th>
                    <th>Description</th>
                    <th>Category</th>
                    <th>Image</th>
                    <th>Price</th>
                    <th>Quantity</th>
                    
                </thead>
                <tbody>
                    <c:forEach var="products" items="${Cart.itemList}" varStatus="counter">
                        <tr>
                            <td>
                                ${counter.count}
                            </td>
                            <td>
                                ${products.key.name}
                            </td>
                            <td>
                                ${products.key.description}
                            </td>
                            <td>
                               ${products.key.category}
                            </td>
                            <td>
                                <img src="${products.key.imageURL}"  width="45" height="30"/>
                            </td>
                            <td>
                                ${products.key.price}
                            </td>
                            <td>
                                <form action="DispatchServlet">
                                    <input type="submit" value="-" name="btAction" />
                                    ${products.value} 
                                    <input type="submit" value="+" name="btAction" />
                                    <input type="hidden" name="quantity" value="${products.value}"/>
                                    <input type="hidden" name="ProID" value="${products.key.ID}" />
                                </form>
                                
                                
                            </td>
                            <td>
                                <form action="DispatchServlet">
                                    <input type="hidden" name="ProID" value="${products.key.ID}" />
                                    <input type="submit" value="Remove this poduct" name="btAction" />
                                </form>
                            </td>
                        </tr>
                    </c:forEach>
                    
                </tbody>
            </table>
            <h2>Amout: ${Cart.amount}</h2>
            <form action="DispatchServlet">
                <input type="submit" value="Cofirm Order" name="btAction" />
            </form>

        </c:if>
    </body>
</html>
