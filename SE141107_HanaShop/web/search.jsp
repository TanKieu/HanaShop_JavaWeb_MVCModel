<%-- 
    Document   : search
    Created on : Jan 4, 2021, 7:09:46 PM
    Author     : winnh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Hana Shop Page</title>
    </head>
    <body>
        <h1>HANA SHOP</h1>
        <a href="login.html">Log in</a>
        <c:set var="nameSearch" value="${param.txtSearchName}"></c:set>
        <c:set var="category" value="${param.dlCategory}"></c:set>
        <c:set var="priceMin" value="${param.dlPriceMin}"></c:set>
        <c:set var="priceMax" value="${param.dlPriceMax}"></c:set>
        <c:set var="page" value="${sessionScope.pageNum}"></c:set>
        <form action="DispatchServlet">
            Search by name <input type="text" name="txtSearchName" value="${nameSearch}" />
        Category
        <select name="dlCategory">
            <option>${category}</option>
            <option>All</option>
            <option>Food</option>
            <option>Drink</option>
        </select>
        Minium Price
        <select name="dlPriceMin">
            <option>${priceMin}</option>
            <option>10000</option>
            <option>20000</option>
            <option>30000</option>
            <option>40000</option>
            <option>50000</option>
            <option>60000</option>
        </select>
        Maximum Price
        <select name="dlPriceMax">
            <option>${priceMax}</option>
            <option>80000</option>
            <option>70000</option>
            <option>60000</option>
            <option>50000</option>
            <option>40000</option>
            <option>30000</option>
        </select>
        <input type="submit" value="Search" name="btAction" /></br>
        <input type="hidden" name="pageNum" value="${page}" />
        <input type="submit" value="Previous" name="btAction" />
        ${pageNum}
        <input type="submit" value="Next" name="btAction" />
        <a href="login.html">Shopping Now</a>   
        </form>
            <c:set var="result" value="${sessionScope.SEARCHRESULT}"></c:set>
            <c:if test="${not empty result}">
            <table border="1">
                <thead>
                    <tr>
                        <th>Category</th>
                        <th>Name</th>
                        <th>Description</th>
                        <th>Image</th>
                        <th>Create Date</th>
                        <th>price</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="dto" items="${SEARCHRESULT}">
                        <c:if test="${true == dto.isActice and dto.quantity>0}">
                    <tr>
                        <td>${dto.category}</td>
                        <td>${dto.name}</td>
                        <td>${dto.description}</td>
                        <td>
                            <img src="${dto.imageURL}" height="40px" width="50px"/>
                        </td>
                        <td>${dto.createDate}</td>
                        <td>${dto.price}</td>
                    </tr>
                        </c:if>
                        <c:if test="${false == dto.isActice or dto.quantity==0}">
                            <tr>
                        <td>${dto.category}</td>
                        <td>${dto.name}</td>
                        <td>Not Available</td>
                        <td>
                            Not Available
                        </td>
                        <td>Not Available</td>
                        <td>Not Available</td>
                            </tr>
                        </c:if>                      
                    </c:forEach>
                </tbody>
            </table>
            </c:if>
            <c:if test="${empty result}">
                Not Found
            </c:if>
    </body>
</html>
