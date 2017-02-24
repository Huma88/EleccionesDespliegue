/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.Operation;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.PoliticalParty;
import model.User;

/**
 *
 * @author Aleja
 */
public class ScrutinyServlet extends HttpServlet {

    private Operation operation;

    @Override
    public void init() throws ServletException {
        operation = Operation.getOperation();
        /* Establecemos la conexión, si no existe */

    }

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
        HttpSession session = request.getSession(true);
        try {
            ArrayList<PoliticalParty> scrutiny = operation.getScrutiny();
            session.setAttribute("scrutiny", scrutiny);
            ServletContext sc = getServletContext();
            RequestDispatcher rd;
            rd = sc.getRequestDispatcher("/view/web/scrutiny.jsp");
            rd.forward(request, response);
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ScrutinyServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ScrutinyServlet at " + request.getContextPath() + "</h1>");
//            Iterator It = census.iterator();
//            while (It.hasNext()) {
//                out.println("<h1>" + It.next().toString() + "</h1>");
//            }
            out.println("</body>");
            out.println("</html>");
        } catch (SQLException sqle) {
            session.setAttribute("message", sqle);
            response.sendRedirect("messages.jsp");
        } catch (Exception ex) {
            session.setAttribute("message", ex);
            response.sendRedirect("messages.jsp");
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
