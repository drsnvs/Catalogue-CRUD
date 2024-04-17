/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author DARSHAN
 */
public class add extends HttpServlet {

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
        try (PrintWriter out = response.getWriter()) {
            Connection con=null;
            Statement st = null;
            ResultSet rs = null;
            PreparedStatement ps = null;
            
            try{
                Class.forName("com.mysql.jdbc.Driver");
//                String url = (String)getInitParameter("url");
                con = DriverManager.getConnection("jdbc:mysql://localhost:3306/assignment", "root", "");
                st = con.createStatement();
                rs = st.executeQuery("select * from catalauge");
                request.setAttribute("catalaugeRS", rs);
                
                
                String bookTitle = request.getParameter("bookTitle");
                String authorName = request.getParameter("authorName");
                double bookPrice = 0.0;
                bookPrice = Double.parseDouble(request.getParameter("bookPrice"));
                
                int bookQuantity = Integer.parseInt(request.getParameter("bookQuantity"));
                String isbn = request.getParameter("isbn");
                String bookPublisher = request.getParameter("bookPublisher");
                int eYear = Integer.parseInt(request.getParameter("eYear"));
                int cID = Integer.parseInt(request.getParameter("cID"));
                
                ps = con.prepareStatement("insert into book (title,author,price,quantity,ISBN,publisher,edition_year,catalaugeId) values(?,?,?,?,?,?,?,?);");
                ps.setString(1, bookTitle);
                ps.setString(2, authorName);
                ps.setDouble(3, bookPrice);
                ps.setInt(4, bookQuantity);
                ps.setString(5, isbn);
                ps.setString(6, bookPublisher);
                ps.setInt(7, eYear);
                ps.setInt(8, cID);
                int checkPs = ps.executeUpdate();
                request.setAttribute("checkPs", checkPs);
                if(checkPs>0){
                    RequestDispatcher rd = request.getRequestDispatcher("display.jsp");
                    rd.forward(request, response);
                }
            }catch(Exception e){
                e.printStackTrace();
            }
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet add</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet add at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
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
