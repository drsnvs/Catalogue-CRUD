/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author DARSHAN
 */
public class display extends HttpServlet {

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
            try{
                HttpSession session = request.getSession();
                
                Connection con = null;
                Statement st = null;
                ResultSet rs = null;
                Class.forName("com.mysql.jdbc.Driver");
                String url = getInitParameter("url");
                con = DriverManager.getConnection("jdbc:mysql://localhost:3306/assignment","root","");
                st = con.createStatement();
                rs = st.executeQuery("select * from book");
                request.setAttribute("displayRS", rs);
//                session.setAttribute("displayRS", rs);
                if(rs.next()){
                    out.println("<script>alert(\"insert successfull.\");</script>");
                    RequestDispatcher rd = request.getRequestDispatcher("display.jsp");
                    rd.forward(request, response);
                }else{
//                    out.println("<script>window.location.href = 'https://www.example.com';</script>");
                    out.println("<script>alert(\"insert unsuccessfull.\");</script>");
                }
                
                /* TODO output your page here. You may use following sample code. */
                out.println("<!DOCTYPE html>");
                out.println("<html>");
                out.println("<head>");
                out.println("<title>Servlet displayC</title>");            
                out.println("</head>");
                out.println("<body>");
//                out.println("<h1>Servlet displayC at " + request.getContextPath() + "</h1>");
                out.println("<script>alert(\"insert successfull.\");</script>");
                out.println("</body>");
                out.println("</html>");
            }catch(Exception e){
                out.println("<script>alert(\"insert successfull.\");</script>");
                e.printStackTrace();
                
            }
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
