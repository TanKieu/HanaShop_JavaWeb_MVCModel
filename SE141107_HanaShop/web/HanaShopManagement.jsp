<%-- 
    Document   : HanaShopManagement
    Created on : Jan 7, 2021, 6:51:38 PM
    Author     : winnh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Hana Shop Management</title>
    </head>
    <body>
        <h1>HANA SHOP</h1>
        <c:set var="admin" value="${sessionScope.USER}"></c:set>
        Welcome, ${admin.name} </br>                          
        <form action="DispatchServlet">
            <input type="submit" value="Log out" name="btAction" />
        </form>
        </br>
        <a href="AddProduct.jsp">Add Product</a>
        <c:set var="nameSearch" value="${param.txtSearchName}"></c:set>
        <c:set var="category" value="${param.dlCategory}"></c:set>
        <c:set var="priceMin" value="${param.dlPriceMin}"></c:set>
        <c:set var="priceMax" value="${param.dlPriceMax}"></c:set>
        <c:set var="page" value="${sessionScope.pageNum}"></c:set>
        <c:set var="errors" value="${sessionScope.UPDATE_ERRORS}"></c:set>
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
        <input type="hidden" name="role" value="isAdmin" />
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
                        <th>quantity</th>
                        <th>isActive</th>
                        <th>last modified</th>
                        <th>modified by</th>
                        <th>Update</th>
                        <th>Delete</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="dto" items="${SEARCHRESULT}">
                    <form action="UpdateProductServlet" method="POST" enctype="multipart/form-data">
                    <tr>
                        <td> 
                            <c:if test="${dto.category eq 'Food'}" >
                            <select name="dlCategory">
                                <option>Food</option>
                                <option>Drink</option>
                            </select>
                            </c:if>
                            <c:if test="${dto.category eq 'Drink'}" >
                            <select name="dlCategory">
                                <option>Drink</option>
                                <option>Food</option>
                            </select>
                            </c:if>                                
                        </td>
                        <td> <input type="text" name="txtName" value="${dto.name}" /> </td>
                        <td>  <input type="text" name="txtDescription" value="${dto.description}" /> </td>
                        <td> <img src=${dto.imageURL} width="45" height="30" alt=${dto.name} />
                            <input type="file" name="fileImage" value="" />
                        </td>
                        <td>${dto.createDate}</td>
                        <td> <input type="text" name="txtPrice" value="${dto.price}" /> 
                        </td>
                        <td> <input type="text" name="txtQuantity" value="${dto.quantity}" />

                        </td>
                        <td> 
                            <c:if test="${true eq dto.isActice}">
                                <select name="dlIsActive">
                                    <option>Active</option> 
                                    <option>Inactive</option>
                                </select>
                            </c:if>
                            <c:if test="${false eq dto.isActice}">
                                <select name="dlIsActive">
                                    <option>Inactive</option>
                                    <option>Active</option>
                                </select>
                            </c:if>
                        </td>
                        <td>${dto.lastModified}</td>
                        <td>${dto.userID}</td>
                        <td> <input type="submit" value="Update" name="btAction" /> </td>
                       
                    <input type="hidden" name="txtID" value="${dto.ID}" />                   
                    <input type="hidden" name="txtUserID" value="${admin.userID}" />
                    <input type="hidden" name="txtPage" value="${page}" />
                     </form>
                     <td>
                         <form action="DispatchServlet">
                            <input type="hidden" name="txtProductID" value="${dto.ID}" /> 
                            <input type="hidden" name="txtUserID" value="${admin.userID}" />
                            <input type="submit" value="Delete" name="btAction" />
                        </form>
                     </td>
                     </tr> 
                    </c:forEach>
                </tbody>
            </table>
                <c:if test="${not empty errors.priceWrongformatError}"> <font color="red">${errors.priceWrongformatError} </font></c:if></br>
                <c:if test="${not empty errors.quantityWrongformatError}">
                      <font color="red">${errors.quantityWrongformatError}</font>
                </c:if>
            </c:if>
            <c:if test="${empty result}">
                Not Found
            </c:if>
    </body>
</html>
