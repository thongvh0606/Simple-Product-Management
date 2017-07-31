<%-- 
    Document   : showProduct
    Created on : Feb 18, 2017, 8:31:20 AM
    Author     : user
--%>

<%@page import="java.util.List"%>
<%@page import="sample.product.ProductDTO"%>
<%@page import="sample.product.ProductDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>ShowProduct</title>
    </head>
    <body>

        <h1>Product Page</h1>
        <%
            ProductDAO dao = new ProductDAO();
            boolean result = dao.loadProductsFromDatabase();
            if (result) {
                List<ProductDTO> productLists = dao.getListProducts();
                if (productLists != null) {
                    if (!productLists.isEmpty()) {

        %>
        <table border="1">
            <thead>
                <tr>
                    <th>No</th>
                    <th>Name</th>
                    <th>Price</th>
                    <th>Quantity</th>
                    <th>Unit</th>
                    <th>Update</th>
                    <th>Delete</th>
                    <th>Import</th>
                </tr>
            </thead>

            <tbody>
                <%                    int count = 0;
                    for (ProductDTO dto : productLists) {
                %>
            
            <form action="RedirectServlet">
                <tr>
                    <td><%=++count%></td>
                    <td><%=dto.getProductName()%></td>
                    <td>                        
                            <input type="text" name="txtPrice" value="<%=dto.getPrice()%>" />
                    </td>
                    <td><%=dto.getQuantity()%></td>                    
                    <td>                        
                        <input type="text" name="txtUnit" value="<%=dto.getUnit()%>" />
                    </td>
                    <td>
                        <input type="submit" value="Update" name="btAction" />
                        <input type="hidden" name="hiddenID" value="<%=dto.getProductID() %>" />
                    </td>
                    <td>
                        <input type="submit" value="Delete" name="btAction" />                        
                    </td>
                    <td>                        
                        <a href="RedirectServlet?btAction=Import&txtProductID=<%=dto.getProductID()%>&txtProductName=<%=dto.getProductName()%>&txtProductPrice=<%=dto.getPrice()%>">Import</a>                        
                    </td>
                </tr>
            </form>                
                <%
                    }
                %>                
            </tbody>
        </table>
        <%
        } else {
        %>
        <h2>No product existed in store. Please insert new product!!!</h2>
        <%
                    }
                }
            }
        %>

    </body>
</html>
