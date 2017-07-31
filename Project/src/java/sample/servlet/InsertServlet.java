/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.naming.NamingException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import sample.product.ProductDAO;
import sample.product.ProductInsertError;

/**
 *
 * @author user
 */
public class InsertServlet extends HttpServlet {

    private final String insertErrPage = "home.jsp";

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
        String id = request.getParameter("txtProductIDInsert");
        String name = request.getParameter("txtProductNameInsert");
        String unit = request.getParameter("txtProductUnitInsert");
        String url = insertErrPage;
        ProductInsertError errors = new ProductInsertError();
        boolean bErr = false;
        try {
            System.out.println(id+" "+name+" "+unit);
            if (id.trim().length() < 5 || id.trim().length() > 10) {
                bErr = true;
                System.out.println(id.trim().length());
                System.out.println(bErr);
                errors.setIdLengthErr("Id length required 5 - 10 chars!");
            }

            if (name.trim().length() < 5 || name.trim().length() > 50) {
                bErr = true;
                errors.setNameLengthErr("Name length required 5 - 50 chars!");
            }

            if (unit.trim().length() < 5 || unit.trim().length() > 20) {
                bErr = true;
                errors.setUnitLengthErr("Unit length required 5 - 20 chars!");
            }
            if (bErr) {
                request.setAttribute("INSERTERR", errors);
            } else {
                ProductDAO dao = new ProductDAO();
                boolean rs = dao.insertProduct(id, name, unit);
                System.out.println("add: "+rs);
                if (rs) {
                    String insertSuccessfullMessage = "Your insert is successful! Please check in above table."
                            + "<br/>Your inserted product Info:"
                            + "<br/>Id: " + id
                            + "<br/>Name:" + name
                            + "<br/>Unit: " + unit;
                    request.setAttribute("ISSM", insertSuccessfullMessage);
                }
            }
            
        } catch (SQLException ex) {
            log("InsertServlet_SQL: " + ex.getMessage());
            errors.setIdExisted(id + " is exised in system!");
            request.setAttribute("INSERTERR", errors);
        } catch (NamingException ex) {
            log("InsertServlet_Naming: " + ex.getMessage());
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
