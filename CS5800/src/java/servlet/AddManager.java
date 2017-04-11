/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import Model.MailSender;
import Model.User;
import Model.Manager;
import dao.ManagerDataAccess;
import dao.UserDataAccess;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


/*if (x .......) { //if search DB and use exist
    //generate username & password - store into new vars
    //send email to user (new manager) with new username, password

}*/
 /*else {
  //error message - user does not exist
 }*/
/**
 *
 * @author colleen
 */
@WebServlet(name = "AddManager", urlPatterns = {"/AddManager"})
public class AddManager extends HttpServlet {

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
            throws ServletException, IOException, Exception {
        String email = request.getParameter("email");

        UserDataAccess access = new UserDataAccess();
        User result = access.matchUserById(email);
        if (result != null) {
            String userName = result.getFirstName() + result.getLastName() + "001"; // TODO: change to random number
            String pass = email + "xxx"; // TODO : change to random number
            Manager input = new Manager(email, userName, pass);
            UserDataAccess da = new UserDataAccess();
            da.assignManager(email);
            ManagerDataAccess manager_da = new ManagerDataAccess();
            manager_da.addNewManager(input);
            MailSender send = new MailSender();
            String code = "username = " + userName + "  \n" + "Password is:" + pass;

            send.send(email, code);
        }
        //request.setAttribute("theNewManager", result);
        RequestDispatcher rd = request.getRequestDispatcher("JSP/Admin.jsp");
        rd.forward(request, response);
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
        try {
            processRequest(request, response);
        } catch (Exception ex) {
            Logger.getLogger(User.class.getName()).log(Level.SEVERE, null, ex);
        }
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
        try {
            processRequest(request, response);
        } catch (Exception ex) {
            Logger.getLogger(User.class.getName()).log(Level.SEVERE, null, ex);
        }
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
