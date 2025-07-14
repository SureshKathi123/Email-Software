<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>
<%
int uid=Integer.parseInt(request.getParameter("uid"));

try
{
         Class.forName("com.mysql.jdbc.Driver");
           Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/emailsoftware", "suresh", "Suresh@123");
           Statement st=conn.createStatement();
           int i=st.executeUpdate("delete from users where uid="+uid);
        if(i>0)
           response.sendRedirect("inbox.jsp");
           else
        out.println("<center><b>Error deleting User. Try Again!</b></center>");
        }
        catch(Exception e)
        {
        out.print(e.getMessage());
        e.printStackTrace();
        }
 %>
