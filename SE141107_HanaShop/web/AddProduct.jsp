<%-- 
    Document   : AddPeoduct
    Created on : Jan 7, 2021, 11:14:52 PM
    Author     : winnh
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>New Product</title>
    </head>
    <body>
        <h1>Product Information</h1>
        <form action="AddNewProductServlet" enctype="multipart/form-data"  method="POST" >
            <c:set var="errors" value="${requestScope.ADD_ERRORS}" ></c:set>
            ID <input type="text" name="txtID" value="" />
            <c:if test="${not empty errors.idDuplicateError}">
                <font color="red">
                    ${errors.idDuplicateError}
                </font>
            </c:if>
            </br>
            Name <input type="text" name="txtName" value="" /></br>
            Category <select name="dlCategory">
                <option>Food</option>
                <option>Drink</option>
            </select></br>
            Description <input type="text" name="txtDescription" value="" /></br>
            Price <input type="text" name="txtPrice" value="" />
            <c:if test="${not empty errors.priceWrongformatError}">
                <font color="red">
                    ${errors.priceWrongformatError}
                </font>
            </c:if>
            </br>
            Quantity <input type="text" name="txtQuantity" value="" />
            <c:if test="${not empty errors.quantityWrongformatError}">
                <font color="red">
                    ${errors.quantityWrongformatError}
                </font>
            </c:if>
             </br>
            isActive <input type="checkbox" name="cbActive" value="ON" /> </br>
            Image <input type="file" name="fileup" /></br>
            <input type="submit" value="Add" name="btAction" />
        </form
    </body>
</html>
