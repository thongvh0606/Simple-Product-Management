<%-- 
    Document   : importProducts
    Created on : Feb 18, 2017, 10:21:53 AM
    Author     : user
--%>

<%@page import="sample.product.ProductDAO"%>
<%@page import="java.util.List"%>
<%@page import="sample.product.ProductDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Import Page</title>
    </head>
    <body>
        <h1>Import Products</h1>
        <form action="RedirectServlet">
            <input type="hidden" name="txtProductID" value="<%=request.getParameter("txtProductID")%>" />
            <%=request.getParameter("txtProductID")%><br/>
            <input type="hidden" name="txtProductName" value="<%=request.getParameter("txtProductName")%>" />
            Product Name: <%=request.getParameter("txtProductName")%><br/>            
            Price <input type="text" name="txtProductPrice" value="<%=request.getParameter("txtProductPrice")%>" /><br/>
            Quantity <input type="text" name="txtProductQuantity" value="" /><br/>
            <input type="submit" value="Save" name="btAction" />            
            <input type="submit" value="Cancel" name="btAction" />
        </form>

    </body>
</html>
