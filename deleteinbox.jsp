<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>
<%

String subj=request.getParameter("subj");
try
{
         Class.forName("com.mysql.jdbc.Driver");
           Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/emailsoftware", "Hemanth", "Hemanth@123");
           Statement st=conn.createStatement();
           int i=st.executeUpdate("delete from mails where subject='"+subj+"'");
        out.println("<center><b>Data is successfully deleted!<br><a href='inbox1.jsp'>Check Now</a></b></center>");
        }
        catch(Exception e)
        {
        System.out.print(e);
        e.printStackTrace();
        }
 %>
