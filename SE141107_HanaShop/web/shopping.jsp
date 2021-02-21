<%-- 
    Document   : shopping
    Created on : Jan 7, 2021, 6:51:59 PM
    Author     : winnh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Hana Shop Page</title>
    </head>
    <body>
        <h1>HANA SHOP</h1>
        <c:set var="client" value="${sessionScope.USER}"></c:set>
        Welcome, ${client.name} 
        <form action="DispatchServlet">
            <input type="submit" value="Log out" name="btAction" />
        </form>
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
        <a href="viewCart.jsp">View your Cart</a>
        <input type="hidden" name="role" value="notAdmin" />
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
                        <th></th>
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
                        <td>
                            <form action="DispatchServlet">
                            <input type="hidden" name="productID" value="${dto.ID}" />
                            <input type="hidden" name="pageNum" value="${page}" />
                            <input type="hidden" name="nameSearch" value="${nameSearch}" />
                            <input type="hidden" name="category" value="${category}" />
                            <input type="hidden" name="Min" value="${priceMin}" />
                            <input type="hidden" name="Max" value="${priceMax}" />
                            <input type="submit" value="Add to Cart" name="btAction" />
                            </form>
                        </td>
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
            <c:set var="suggestList" value="${sessionScope.SUGGESTION}"></c:set>
            <c:if test="${not empty suggestList}">
                <h2>Suggestion</h2> </br>
                <table border="1">
                    <thead>
                    </thead>
                    <tbody>
                <c:forEach var="dto" items="${suggestList}" >    
                    <tr>
                        <td>${dto.category}</td>
                        <td>${dto.name}</td>
                        <td>${dto.description}</td>
                        <td>
                            <img src="${dto.imageURL}" height="40px" width="50px"/>
                        </td>
                        <td>${dto.createDate}</td>
                        <td>${dto.price}</td>
                        <td>
                            <form action="DispatchServlet">
                            <input type="hidden" name="productID" value="${dto.ID}" />
                            <input type="hidden" name="pageNum" value="${page}" />
                            <input type="hidden" name="nameSearch" value="${nameSearch}" />
                            <input type="hidden" name="category" value="${category}" />
                            <input type="hidden" name="Min" value="${priceMin}" />
                            <input type="hidden" name="Max" value="${priceMax}" />
                            <input type="submit" value="Add to Cart" name="btAction" />
                            </form>
                        </td>
                    </tr>                    
                </c:forEach>
                    </tbody>
                </table>
            </c:if>
    </body>
</html>
