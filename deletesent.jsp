<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>
<%

String subj=request.getParameter("mto");
try
{
         Class.forName("com.mysql.jdbc.Driver");
           Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/emailsoftware", "Hemanth", "Hemanth@123");
           Statement st=conn.createStatement();
           int i=st.executeUpdate("update mails set sentbox=0 where mto='"+subj+"'");
           if(i>0)
           response.sendRedirect("sentbox.jsp");
           else
           
        out.println("<center><b>error</b></center>");
        }
        catch(Exception e)
        {
        System.out.print(e);
        e.printStackTrace();
        }
 %>
