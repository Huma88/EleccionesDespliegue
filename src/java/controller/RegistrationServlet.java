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
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.User;

/**
 *
 * @author Aleja
 */
public class RegistrationServlet extends HttpServlet {

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
        HttpSession session = request.getSession(true);
        PrintWriter out = response.getWriter();
        try {
            User user = new User(request.getParameter("nif"), request.getParameter("password"));
//            User user = new User("aaa", "aaa");
            //
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet registrationServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet registrationServlet at " + request.getContextPath() + "</h1>");
            out.println(user.getNif());
            out.println(user.getPassword());
            if (operation.registerUser(user)) {
                session.setAttribute("message", new Exception("User Registered"));
                response.sendRedirect("messages.jsp");
                //out.println("<h1>User registered successfully</h1>");
            } else {
                session.setAttribute("message", new Exception("User already exist"));
                response.sendRedirect("messages.jsp");
                //out.println("<h1>Error during registration</h1>");
            }
            out.println("<button type=\"button\" name=\"button\" onclick=\"document.location.href ='index.jsp'\">Return</button>");
            out.println("</body>");
            out.println("</html>");
        } catch (SQLException sqle) {
            session.setAttribute("message", sqle);
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
