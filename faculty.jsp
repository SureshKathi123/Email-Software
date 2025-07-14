<%@ page import="java.sql.*" %>
<%
String id = request.getParameter("uname");
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
    <form action="select.jsp" method="POST">
        <center>
            <select name="branch" id="branch">
                <option value="" selected disabled>Select branch</option>
                <option value="CSE">CSE</option>
                <option value="ECE">ECE</option>
            </select>
        </center>
        <table border="1" align="center" width="60%">
            <tr>
                <th>ID</th>
                <th>FACULTY NAME</th>
                <th>DEPARTMENT</th>
                <th>Select</th>
            </tr>

            <%
            try {
                connection = DriverManager.getConnection(connectionUrl + database, userid, password);
                statement = connection.createStatement();
                String sql = "SELECT * FROM details";
                resultSet = statement.executeQuery(sql);

                while (resultSet.next()) {
                    String uid = resultSet.getString("id");
            %>
            <tr>
                <td><%= uid %></td>
                <td><%= resultSet.getString("faculty") %></td>
                <td><%= resultSet.getString("dept") %></td>
                <td><input type="checkbox" name="id" value="<%= uid %>" class="myCheckBox"></td>
            </tr>
            <%
                }
                connection.close();
            } catch (Exception e) {
                out.println(e.getMessage());
            }
            %>
        </table>
        <center><input type="submit" value="Show panel"></center>
    </form>
</body>
</html>
