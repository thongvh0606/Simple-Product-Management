<%-- 
    Document   : insertNewProduct
    Created on : Feb 18, 2017, 9:10:03 AM
    Author     : user
--%>

<%@page import="sample.product.ProductInsertError"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Insert</title>
    </head>
    <body>
<h2>Insert New Product</h2>
        <form action="RedirectServlet">
            <%                ProductInsertError errors = (ProductInsertError) request.getAttribute("INSERTERR");
            %>

            ID<input type="text" name="txtProductIDInsert" 
                     <% String inputedId = request.getParameter("txtProductIDInsert");
                         String idValue = "";
                         if (inputedId != null) {
                             idValue = inputedId;
                         }
                     %>
                     value="<%=idValue%>" /><br/>

            <%
                if (errors != null) {
                    if (errors.getIdExisted() != null) {
            %>
            <font color="red"><%=errors.getIdExisted()%></font><br/>
            <%
                    }
                }
            %>

            <%
                if (errors != null) {
                    if (errors.getIdLengthErr() != null) {
            %>
            <font color="red"><%=errors.getIdLengthErr()%></font><br/>
            <%
                    }
                }
            %>

            Name<input type="text" name="txtProductNameInsert" 
                       <% String inputedName = request.getParameter("txtProductNameInsert");
                           String nameValue = "";
                           if (inputedId != null) {
                               nameValue = inputedName;
                           }
                       %>
                       value="<%=nameValue%>" /><br/>

            <%
                if (errors != null) {
                    if (errors.getNameLengthErr() != null) {
            %>
            <font color="red"><%=errors.getNameLengthErr()%></font><br/>
            <%
                    }
                }
            %>
            Unit<input type="text" name="txtProductUnitInsert" 
                       <% String inputedUnit = request.getParameter("txtProductUnitInsert");
                           String unitValue = "";
                           if (inputedId != null) {
                               unitValue = inputedUnit;
                           }
                       %>
                       value="<%=unitValue%>" /><br/>
            <%
                if (errors != null) {
                    if (errors.getUnitLengthErr() != null) {
            %>
            <font color="red"><%=errors.getUnitLengthErr()%></font><br/>
            <%
                    }
                }
            %>
            <input type="submit" value="Insert" name="btAction" />
        </form>
        <%
            String insertSuccessfullMessage
                    = (String) request.getAttribute("ISSM");
            if (insertSuccessfullMessage != null) {
        %>
        <font color="green"><%=insertSuccessfullMessage%></font>
        <%
            }
        %>

    </body>
</html>
