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
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
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
public class LoginServlet extends HttpServlet {

//    private Connection conection;
    private Operation operation;

//    @Override
//    public void init() throws ServletException {
//        /* Establecemos la conexión, si no existe */
//        try {
//            DBConnection ConexBD = DBConnection.GetConexion();
//            conection = ConexBD.GetCon();
//        } catch (ClassNotFoundException cnfe) {
//        } catch (SQLException sqle) {
//        }
//    }
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
//            User user = new User("asd", "asd");
            //
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet LoginServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet LoginServlet at " + request.getContextPath() + "</h1>");
            out.println(user.getNif());
            out.println(user.getPassword());
            if (operation.loginUser(user)) {
//                user.setId(operation.getIdByNif(user.getNif()));
                session.setAttribute("user", user);
                response.sendRedirect("view/mainMenu.jsp");
//                ServletContext sc = getServletContext();
//                RequestDispatcher rd;
//                rd = sc.getRequestDispatcher("/view/mainMenu.jsp");
//                rd.forward(request, response);
//                response.sendRedirect("view/mainMenu.jsp");
//                out.println("<h1>User Login successfully</h1>");
//                out.println("<button type=\"button\" name=\"button\" onclick=\"document.location.href ='view/mainMenu.jsp'\">OK</button>");

            } else {
                session.setAttribute("message", new Exception("NIF or password incorrect"));
                response.sendRedirect("messages.jsp");
//                out.println("<h1>Error during Login</h1>");
//                out.println("<button type=\"button\" name=\"button\" onclick=\"document.location.href ='index.jsp'\">Return</button>");
            }
            out.println("</body>");
            out.println("</html>");
        } catch (SQLException sqle) {
            out.println(sqle);
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
