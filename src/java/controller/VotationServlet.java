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
import model.PoliticalParty;
import model.User;

/**
 *
 * @author Aleja
 */
public class VotationServlet extends HttpServlet {

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
            User user = (User) session.getAttribute("user");
            PoliticalParty a = new PoliticalParty(request.getParameter("politicalParty"));
            out.println(operation.userHasVoted(user));
            if (operation.userHasVoted(user).equals("Y")) {
                session.setAttribute("message", new Exception("User already voted"));
                response.sendRedirect("messages.jsp");
            } else {
                operation.vote(user, new PoliticalParty(request.getParameter("politicalParty")));
                response.sendRedirect("view/mainMenu.jsp");
            }
            //operation.addVote(a);
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet VotationServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet VotationServlet at " + request.getContextPath() + "</h1>");
            out.println("hola" + a.getName());
            out.println("</body>");
            out.println("</html>");
        } catch (Exception sqle) {
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
