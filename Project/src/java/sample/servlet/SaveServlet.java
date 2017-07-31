/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import javax.naming.NamingException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import sample.product.ProductDAO;

/**
 *
 * @author user
 */
public class SaveServlet extends HttpServlet {

    private final String homePage = "home.jsp";

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        String id = request.getParameter("txtProductID");
        String name = request.getParameter("txtProductName");
        String price = request.getParameter("txtProductPrice");
        String quantity = request.getParameter("txtProductQuantity");
        String url = homePage;

        try {
            //convert String to valid Data
            float priceValue = Float.parseFloat(price);
            int quantityValue = Integer.parseInt(quantity);

            if (quantityValue > 0 && priceValue > 0) {
                ProductDAO dao = new ProductDAO();
                boolean result = dao.importProduct(id, priceValue, quantityValue);
                if (result) {
                    String importMessage = "Your importing is successful!!! Your importting detail:"
                            + "<br/>"
                            + "Product Name: " + name
                            + "<br/>"
                            + "Price: " + price
                            + "<br/>"
                            + "Quantity: " + quantity;
                    request.setAttribute("IPMS", importMessage);
                }
            } else {
                String importMessage = "Your importing is not successful!!!<br/>"
                        + "Price must be float number and Quantity must be integer "
                        + "number!Addition, they also need to be greater than 0!";
                request.setAttribute("IPMSERR", importMessage);
            }
        } catch (NumberFormatException e) {
            log("SaveServlet_NumberFormat: " + e.getMessage());
            String importMessage = "Your importing is not successful!!!<br/>"
                    + "Price must be float number and Quantity must be integer "
                    + "number!Addition, they also need to be greater than 0!";
            request.setAttribute("IPMSERR", importMessage);
        } catch (SQLException ex) {
            log("SaveServlet_SQL: " + ex.getMessage());
        } catch (NamingException ex) {
            log("SaveServlet_Naming: " + ex.getMessage());
        } finally {
            RequestDispatcher rd = request.getRequestDispatcher(url);
            rd.forward(request, response);
            out.close();
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
