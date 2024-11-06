<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.Connection" %>
<html>
<head>
    <style>
        th, td {
            font-size: 32px;
            width: 32px;
        }
        .myCheckBox{
            font-size: 32px;
            width: 48px;
        }
        .myButton {
            font-size: 32px;
        }
        
    </style>
</head>
<body>
    <table border="1" width="90%" align="center">
        <tr>
            <td align="center"><a href="inbox1.jsp">Inbox</a></td>
            <td align="center"><a href="sentbox.jsp">Sentbox</a></td>
            <td align="center"><a href="compose.jsp">ComposeMail</a></td>
            <td align="center"><a href="logout.jsp">Logout</a></td>
        </tr>
    </table>
    <br><br>
    <center><h1>Inbox</h1></center><br>
    <form action="deletemails1.jsp" method="post">
        <table border="1" align="center" width="60%">
            <tr>
                <th>From</th>
                <th>Subject</th>
                <th><input type="submit" class="myButton" value="Delete"></th>
            </tr>
            <%
            String driver = "com.mysql.jdbc.Driver";
            String connectionUrl = "jdbc:mysql://localhost:3306/";
            String database = "emailsoftware";
            String userid = "Hemanth";
            String password = "Hemanth@123";
            try {
                Class.forName(driver);
                Connection connection = null;
                Statement statement = null;
                ResultSet resultSet = null;
                String user_id = session.getAttribute("emailid").toString();
                try {
                    connection = DriverManager.getConnection(connectionUrl + database, userid, password);
                    statement = connection.createStatement();
                    String sql = "SELECT * FROM mails WHERE mto='" + user_id + "' AND inbox=1";
                    resultSet = statement.executeQuery(sql);
                    int mid;
                    while (resultSet.next()) {
                        mid = resultSet.getInt("mid");
            %>
            <tr>
                <td><%= resultSet.getString("mfrom") %></td>
                <td><a href="ReadMail1.jsp?mid=<%= mid %>"><%= resultSet.getString("subject") %></a></td>
                <td align="center"><input type="checkbox" class="myCheckBox" name="deleteIds" value="<%= mid %>"></td>
            </tr>
            <%
                    }
                } catch (Exception e) {
                    out.println("Error fetching emails: " + e.getMessage());
                } finally {
                    if (resultSet != null) resultSet.close();
                    if (statement != null) statement.close();
                    if (connection != null) connection.close();
                }
            } catch (Exception e) {
                out.println();
            }
            %>
        </table>
    </form>
</body>
</html>
