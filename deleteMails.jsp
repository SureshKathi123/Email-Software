<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.io.IOException"%>
<%
    String driver = "com.mysql.jdbc.Driver";
    String connectionUrl = "jdbc:mysql://localhost:3306/";
    String database = "emailsoftware";
    String userid = "suresh";
    String password = "Suresh@123";
    try {
        Class.forName(driver);
    } catch (ClassNotFoundException e) {
        e.printStackTrace();
    }
    Connection connection = null;
    Statement statement = null;
    try {
        connection = DriverManager.getConnection(connectionUrl + database, userid, password);
        statement = connection.createStatement();
        
        String[] mailIds = request.getParameterValues("mids");
        if (mailIds != null) {
            for (String mid : mailIds) {
                String sql = "DELETE FROM mails WHERE mid=" + mid;
                statement.executeUpdate(sql);
            }
        }
        
        connection.close();
        response.sendRedirect("SentBox.jsp");
    } catch (Exception e) {
        out.println(e.getMessage());
    }
%>

