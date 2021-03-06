/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

/**
 *
 * @author LICH
 */
import Model.Flight;
import Model.PathFinder;
import Model.PathNode;
import dao.FlightDataAccess;
import dao.UserDataAccess;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Thang
 */
@WebServlet(name = "Search", urlPatterns = {"/Search"})
public class Search extends HttpServlet {

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
            throws ServletException, IOException, ParseException {
        String origin_abbr = request.getParameter("origin");
        String dest_abbr = request.getParameter("destination");
        String leavingTime = request.getParameter("departTime");
        String returningTime = request.getParameter("returnTime");
        String m_class = request.getParameter("class");
        PathFinder pf = new PathFinder(new Date());
        List<PathNode> result;
        result = pf.Caculator1way(origin_abbr, dest_abbr, leavingTime);
        if (returningTime == "") {

            result = pf.Caculator1way(origin_abbr, dest_abbr, leavingTime);
        } else {
            result = pf.Caculator2way(origin_abbr, dest_abbr, leavingTime, returningTime);
        }
        List<List<String>> orders = new ArrayList();
        //List<List<Flight>> m_flights = new ArrayList();
        //HashMap<List<String>, List<Flight>> flightMap = new HashMap();
        List<String> order = new ArrayList();
        for (int i = 0; i < result.size(); i++) {
            if (result.get(i).getFirst().equals(dest_abbr)) {

                order.add(result.get(i).getFirst());
                order.clear();
                orders.add(order);
            } else {
                order.add(result.get(i).getFirst());
            }
        }

        List<List<Flight>> searchResult = new ArrayList();
        FlightDataAccess fda = new FlightDataAccess();
        for (int i = 0; i < orders.size(); i++) {
            if (orders.get(i).size() >= 2) {
                List<Flight> temp_list = new ArrayList();
                for (int j = 1; j < orders.get(i).size(); j++) {

                    List<Flight> allflights = fda.searchByRoute(orders.get(i).get(j - 1), orders.get(i).get(j));
                    if (!allflights.isEmpty()) {
                        temp_list.add(allflights.get(0));
                    }
                }
                searchResult.add(temp_list);
                temp_list.clear();
            }
        }
        //List<Flight> allflights = fda.searchByRoute(origin_abbr, dest_abbr);
        request.setAttribute("theFlights", searchResult);
        request.setAttribute("class", m_class);
        RequestDispatcher rd = request.getRequestDispatcher("JSP/SearchResult.jsp");
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
        } catch (ParseException ex) {
            Logger.getLogger(Search.class.getName()).log(Level.SEVERE, null, ex);
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
        } catch (ParseException ex) {
            Logger.getLogger(Search.class.getName()).log(Level.SEVERE, null, ex);
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
