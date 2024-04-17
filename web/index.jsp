<%-- 
    Document   : index
    Created on : 14 Apr, 2024, 9:20:13 PM
    Author     : DARSHAN
--%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Book Management System</title>
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
            max-width: 800px;
            margin: 0 auto;
        }

        /* Heading styles */
        h1 {
            text-align: center;
            margin-bottom: 20px;
            color: #333;
        }

        /* Table styles */
        table {
            width: 100%;
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
            padding: 10px 0; /* Updated to make buttons have equal width */
            width: 100%; /* Make buttons occupy full width of parent */
            text-align: center;
            text-decoration: none;
            display: inline-block;
            font-size: 16px;
            margin: 4px 0; /* Adjusted margin */
            cursor: pointer;
            border-radius: 8px;
            transition: background-color 0.3s ease;
        }

        .btn:hover {
            background-color: #0056b3; /* Darker Green */
        }
    </style>
</head>
<body>
    <%
        session.setAttribute("darshan", session.getId());
    %>
<div class="container">
    <h1>Book Management System</h1>
    <table>
        <tr>
            <th colspan="5">Book Actions</th>
        </tr>
        <tr>
            <td><a href="displayC.jsp" class="btn">Show Catalogue</a></td>
            <td><a href="add.jsp" class="btn">Add Book</a></td>
            <td><a href="display.jsp" class="btn">Display Books</a></td>
            <td><a href="update.jsp" class="btn">Update Book</a></td>
            <td><a href="delete.jsp" class="btn">Remove Book</a></td>
        </tr>
    </table>
</div>
</body>
</html>
