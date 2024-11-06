<html>

<body>
<%
 String str=request.getParameter("msg");
 if(str!=null)
 out.println("<font size=32 color=red>"+str+"</font>");
 %>
 <form name="f1" action="validateLogin.jsp">
 
 <table align=center width=65%><tr><td>email:<input type=text placeholder="enter a email" class="myTextBox"
 name=uname id=uname></td></tr>
 <tr><td>password:<input type=text placeholder="enter a pass" class="myTextBox"
 name=pwd id=pwd></td></tr>
 <tr><td><input type=submit value="Login" class="mybutton"><input type=reset value="Reset"
 class="mybutton" </td></tr>
 </table></form></body>
 </html>
 
 
 
 
