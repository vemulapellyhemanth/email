<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<html>
<head><style>
.myTextBox{
font-size:32px;
}
.myButton{
font-size:32px;
}
</style></head>
<body>
<br><br><br><br><br><br><br><br>
<%
String str=request.getParameter("msg");
String emailid="";
if(session.getAttribute("emailid")!=null)
emailid=session.getAttribute("emailid").toString();
if(str!=null)
out.println("<font size=32 color=red>"+str+"</font>");
int mid=Integer.parseInt(request.getParameter("mid"));
String driver = "com.mysql.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost:3306/";
String database = "emailsoftware";
String userid = "Hemanth";
String password = "Hemanth@123";
try {
Class.forName(driver);
} catch (ClassNotFoundException e) {
e.printStackTrace();
}
Connection connection = null;
Statement statement = null;
ResultSet resultSet = null;
String mfrom="",mto="",subject="",mtext="",attachment="";
try{
connection = DriverManager.getConnection(connectionUrl+database, userid, password);
statement=connection.createStatement();
String sql ="select * from mails where mid="+mid;
resultSet = statement.executeQuery(sql);
while(resultSet.next()){
mfrom=resultSet.getString("mfrom");
mto=resultSet.getString("mto");
subject=resultSet.getString("subject");
mtext=resultSet.getString("mtext");

}
connection.close();
} catch (Exception e) {
out.println(e.getMessage());
}
%>

<form name="f1" action="deletemailbox.jsp">
<table align=center width=65% border=0>
<tr><td class="myTextBox">From:</td><td><input type=text class="myTextBox" name=mfrom id=mfrom value="<%=mfrom%>" readonly></td></tr>
<tr><td class="myTextBox">To:</td><td><input type=text class="myTextBox" name=mto id=mto value="<%=mto%>" readonly></td></tr>
<tr><td class="myTextBox">Subject:</td><td><input type=text class="myTextBox" name=subj id=subj value="<%=subject%>" readonly></td></tr>
<tr><td class="myTextBox">Text:</td><td><textarea name="mtext" id="mtext" border=1 width=100 class="myTextBox" readonly><%=mtext%></textarea></td></tr>
<tr><td></td><td><br><br><input type=submit value="Delete" class="myButton"></form><form name=f2 action=inbox1.jsp><input type=submit value="Back" class="myButton"></td></tr>
</table></form></body></html>

