<%-- 
    Document   : deleteForm
    Created on : 17 Apr, 2024, 4:12:17 PM
    Author     : DARSHAN
--%>

<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Update Book</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f5f5f5;
        }
        
        #container {
            width: 50%;
            margin: 50px auto;
            background-color: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        
        h2 {
            text-align: center;
            color: #333;
        }
        
        table {
            width: 100%;
        }
        
        table td {
            padding: 10px;
        }
        
        input[type="text"],
        input[type="submit"],
        input[type="number"]
         {
            width: 100%;
            padding: 8px;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
            margin-bottom: 10px;
            font-size: 16px;
        }
        
        input[type="submit"] {
            background-color: #45a049;
            color: #fff;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }
        
        input[type="submit"]:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
    <%
        Class.forName("com.mysql.jdbc.Driver");
        Connection con=null;
        Statement st = null;
        Statement stt = null;
        ResultSet rs = null;
        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/assignment", "root", "");
        st = con.createStatement();
        int bkid = Integer.parseInt(request.getParameter("bkid"));
        rs = st.executeQuery("select * from book where bookId="+bkid+";");
        rs.next();
        
        stt = con.createStatement();
        ResultSet rss = stt.executeQuery("select * from catalauge");
        
        request.setAttribute("bkid", bkid);

//        ResultSet rss = (ResultSet)request.getAttribute("rs");
//        rss.next();
    %>
    <div id="container">
        <h2>Update Book</h2>
        <form action="update" method="post" onsubmit="return validate()">
            <table border="0" cellspacing="0">
                
                <tr>
                    <td>Book title</td>
                    <td><input type="text" value="<%=rs.getString("title")%>" name="bookTitle" id="bookTitle" /></td>
                </tr>
                <tr>
                    <td>Author name</td>
                    <td><input type="text" name="authorName" value="<%=rs.getString("author")%>" id="authorName" /></td>
                </tr>
                <tr>
                    <td>Book price</td>
                    <td><input type="text" value="<%=rs.getString("price")%>" name="bookPrice" id="bookPrice" /></td>
                </tr>
                <tr>
                    <td>Book Quantity</td>
                    <td><input type="text" value="<%=rs.getString("quantity")%>" name="bookQuantity" id="bookQuantity" /></td>
                </tr>
                <tr>
                    <td>ISBN No</td>
                    <td><input type="text" value="<%=rs.getString("ISBN")%>" name="isbn" id="isbn" /></td>
                </tr>
                <tr>
                    <td>Book Publisher</td>
                    <td><input type="text" value="<%=rs.getString("publisher")%>" name="bookPublisher" id="bookPublisher" /></td>
                </tr>
                <tr>
                    <td>Edition year</td>
                    <td><input type="text" value="<%=rs.getString("edition_year")%>" name="eYear" id="eYear" /></td>
                </tr>
                <tr>
                    <td>Catalogue</td>
                    <td>
                        <%
                            while(rss.next()){
                                
                        %>
                        <input type="radio"  name="cID" value=<%=rss.getInt("catalaugeId")%> <% if (rss.getInt("catalaugeId") == rs.getInt("catalaugeId")) {%>checked<%}%> />
                        <label><%=rss.getString("title")%></label><br>
<!--                        <input type="radio" value=2 name="cID" />
                        <label>Drama</label>-->
                        <%
                            }
                        %>
                    </td>
                </tr>
                <tr>
                    <td colspan="2" align="center">
                        <input type="hidden" name="bkid" value="<%=rs.getInt("bookId")%>" />
                        <input type="submit" value="Update" />
                    </td>
                </tr>
            </table>
        </form>
    </div>
    <script type="text/javascript">
        function validate(){
            var bookTitle = document.getElementById("bookTitle").value;
            var authorName = document.getElementById("authorName").value;
            var bookPrice = document.getElementById("bookPrice").value;
            var bookQuantity = document.getElementById("bookQuantity").value;
            var isbn = document.getElementById("isbn").value;
            var bookPublisher = document.getElementById("bookPublisher").value;
            var eYear = document.getElementById("eYear").value;
            var cID = document.querySelector('input[name="cID"]:checked');
            
            if(bookTitle == "" || authorName == "" || bookPrice == "" || bookQuantity == "" || isbn == "" || bookPublisher == "" || eYear == "" || cID == ""){
//            if(bookTitle.equals("") || authorName.equals("") || bookPrice.equals("") || bookQuantity.equals("") || isbn.equals("") || bookPublisher.equals("") || eYear.equals("") || cID.equals("")){
                alert("must fill all fields");
                return false;
            }
        }
        
    </script>
</body>
</html>
