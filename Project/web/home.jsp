<%-- 
    Document   : Product
    Created on : Feb 14, 2017, 10:18:07 AM
    Author     : user
--%>

<%@page import="sample.product.ProductInsertError"%>
<%@page import="sample.product.ProductDTO"%>
<%@page import="java.util.List"%>
<%@page import="sample.product.ProductDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home</title>
    </head>
    <body>
        <%
            session = request.getSession(true);
            if (session != null) {
                String username = (String) session.getAttribute("USER");
        %>
        <font color="red">Welcome, <%= username%></font>
        <%
            }
        %>
        <form action="RedirectServlet" method="POST">
            <input type="submit" value="Logout" name="btAction" />
        </form>
        <%@include file="showProduct.jsp" %>
        
        <%            String importSuccessMessage
                    = (String) request.getAttribute("IPMS");
            if (importSuccessMessage != null) {
        %>
        <font color="green"><%=importSuccessMessage%></font>
        <%
            }
            String importErrorMessage
                    = (String) request.getAttribute("IPMSERR");
            if (importErrorMessage != null) {
        %>
        <font color="red"><%=importErrorMessage%></font>
        <%
            }
        %>
        
        <%@include file="insertNewProduct.jsp" %>
    </body>
</html>
