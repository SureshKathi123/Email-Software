<%@ page import="java.sql.*" %>
<%
String[] selectedIds = request.getParameterValues("id");
String driver = "com.mysql.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost:3306/";
String database = "faculty";
String userid = "suresh";
String password = "Suresh@123";

try {
    Class.forName(driver);
} catch (ClassNotFoundException e) {
    e.printStackTrace();
}

Connection connection = null;
Statement statement = null;
ResultSet resultSet = null;
%>
<!DOCTYPE html>
<html>
<head>
    <style>
        * {
            text-align: center;
        }
        th, td {
            font-size: 32px;
        }
    </style>
</head>
<body>
    <h1>Selected Faculty Details</h1>
    <table border="1" align="center" width="60%">
        <tr>
            <th>ID</th>
            <th>FACULTY NAME</th>
            <th>DEPARTMENT</th>
        </tr>

        <%
        if (selectedIds != null) {
            try {
                connection = DriverManager.getConnection(connectionUrl + database, userid, password);
                statement = connection.createStatement();

                for (String id : selectedIds) {
                    String sql = "SELECT * FROM details WHERE id = '"+id+"'";
                    resultSet = statement.executeQuery(sql);

                    if (resultSet.next()) {
        %>
        <tr>
            <td><%= resultSet.getString("id") %></td>
            <td><%= resultSet.getString("faculty") %></td>
            <td><%= resultSet.getString("dept") %></td>
        </tr>
        <%
                    }
                }
                connection.close();
            } catch (Exception e) {
                out.println(e.getMessage());
            }
        } else {
            out.println("<tr><td>No items selected</td></tr>");
        }
        %>
    </table>
</body>
</html>
