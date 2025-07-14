<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>
<%
String emailid=request.getParameter("emailid");

try
{
         Class.forName("com.mysql.jdbc.Driver");
           Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/emailsoftware", "suresh", "Suresh@123");
           Statement st=conn.createStatement();
           int i=st.executeUpdate("delete from users where emailid="+emailid);
        if(i>0)
           response.sendRedirect("inbox.jsp");
           else
        out.println("<center><b>Error deleting User. Try Again!</b></center>");
        }
        catch(Exception e)
        {
        out.println(e.getMessage());
        e.printStackTrace();
        }
 %>
