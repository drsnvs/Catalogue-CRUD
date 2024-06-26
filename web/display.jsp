<%-- 
    Document   : displayC
    Created on : 14 Apr, 2024, 9:43:27 PM
    Author     : DARSHAN
--%>

<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Display Books</title>
    <style>
        /* Reset default margin and padding */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        /* Body styles */
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            padding: 20px;
        }

        /* Container styles */
        .container {
            max-width: 999px;
            margin: 0 auto;
        }

        /* Heading styles */
        h2,h3 {
            text-align: center;
            margin-bottom: 20px;
            color: #333;
        }

        /* Table styles */
        table {
            width: 90%;
            border-collapse: collapse;
            margin-top: 20px;
            background-color: #fff;
            border-radius: 8px;
            overflow: hidden;
        }

        th, td {
            padding: 15px;
            text-align: center;
        }

        th {
            background-color: #4CAF50; /* Green */
            color: white;
        }

        tr:nth-child(even) {
            background-color: #f2f2f2;
        }

        /* Button styles */
        .btn {
            background-color: #4CAF50;
            border: none;
            color: white;
            padding: 10px 20px;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            font-size: 16px;
            margin: 4px 2px;
            cursor: pointer;
            border-radius: 8px;
            transition: background-color 0.3s ease;
            width: 100%; /* Make buttons occupy full width of parent */
        }

        .btn:hover {
            background-color: #45a049; /* Darker Green */
        }
    </style>
</head>
<body>
    <%
        try{
            HttpSession ssn = request.getSession();
            if(!ssn.getId().equals(ssn.getAttribute("darshan"))){
                response.sendRedirect("index.jsp");
            }
        }catch(Exception e){
            e.printStackTrace();
        }
    %>
<div class="container">
    <h2>Display Books</h2>
    <h3>
        <%
//            int check = Integer.parseInt(session.getAttribute("c").toString());
            if(request.getAttribute("check")!=null){
                %><script>
                    alert("Book Removed successfully");
                </script><%
            }
        %>
    </h3>
    <table>
        <tr>
            <th>Catalogue ID</th>
            <th>Title</th>
            <th>Author</th>
            <th>Price</th>
            <th>Quantity</th>
            <th>ISBN</th>
            <th>Publisher</th>
            <th>Edition Year</th>
            <th>Catalogue</th>
        </tr>
        <%
            try{
                Connection con = null;
                Statement st = null;
                ResultSet rs = null;
                Class.forName("com.mysql.jdbc.Driver");
                String url = getInitParameter("url");
                con = DriverManager.getConnection("jdbc:mysql://localhost:3306/assignment","root","");
                st = con.createStatement();
                rs = st.executeQuery("select * from book,catalauge where book.catalaugeId = catalauge.catalaugeId");
                while(rs.next()){
        %>
        <tr>
            <td><%=rs.getInt("bookId")%></td>
            <td><%=rs.getString("book.title")%></td>
            <td><%=rs.getString("author")%></td>
            <td><%=rs.getDouble("price")%></td>
            <td><%=rs.getInt("quantity")%></td>
            <td><%=rs.getString("ISBN")%></td>
            <td><%=rs.getString("publisher")%></td>
            <td><%=rs.getInt("edition_year")%></td>
            <td><%=rs.getString("catalauge.title")%></td> <!-- Truncate long descriptions -->
        </tr>
        <%
            
            }
            }catch(Exception e){
                e.printStackTrace();
            }
        %>
    </table>
</div>
</body>
</html>
