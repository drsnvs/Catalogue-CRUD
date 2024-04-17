<%-- 
    Document   : add
    Created on : 17 Apr, 2024, 11:16:18 AM
    Author     : DARSHAN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Add Book</title>
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
        input[type="submit"]
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
            background-color: #007bff;
            color: #fff;
            cursor: pointer;
        }
        
        input[type="submit"]:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
    <div id="container">
        <h2>Add Book</h2>
        <form action="add" method="post" onsubmit="return validate()">
            <table border="0" cellspacing="0">
                <tr>
                    <td>Book title</td>
                    <td><input type="text" name="bookTitle" id="bookTitle" /></td>
                </tr>
                <tr>
                    <td>Author name</td>
                    <td><input type="text" name="authorName" id="authorName" /></td>
                </tr>
                <tr>
                    <td>Book price</td>
                    <td><input type="number" step="0.1" name="bookPrice" id="bookPrice" /></td>
                </tr>
                <tr>
                    <td>Book Quantity</td>
                    <td><input type="number" name="bookQuantity" id="bookQuantity" /></td>
                </tr>
                <tr>
                    <td>ISBN No</td>
                    <td><input type="text" name="isbn" id="isbn" /></td>
                </tr>
                <tr>
                    <td>Book Publisher</td>
                    <td><input type="text" name="bookPublisher" id="bookPublisher" /></td>
                </tr>
                <tr>
                    <td>Edition year</td>
                    <td><input type="number" name="eYear" id="eYear" /></td>
                </tr>
                <tr>
                    <td>Catalouge</td>
                    <td>
                        <input type="radio" value=1 name="cID" />
                        <label>Comedy</label><br>
                        <input type="radio" value=2 name="cID" />
                        <label>Drama</label>
                    </td>
                </tr>
                <tr>
                    <td colspan="2" align="center">
                        <input type="submit" value="Insert" />
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
            var cID = document.getElementById("cID").value;
            
            if(bookTitle.equals("") || authorName.equals("") || bookPrice.equals("") || bookQuantity.equals("") || isbn.equals("") || bookPublisher.equals("") || eYear.equals("") || cID.equals("")){
                alert("must fill all fields");
                return false;
            }
        }
        
    </script>
</body>
</html>
