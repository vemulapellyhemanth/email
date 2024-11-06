<%@page import="java.sql.*"%>
<%@page import="javax.sql.*"%>
<%@page import="javax.naming.*"%>
<%@page import="java.util.*"%>
<html>
<head>
    <style>
        th, td {
            font-size: 32px;
        }
        .myCheckBox {
            font-size: 32px;
            width: 48px;
        }
        .myButton {
            font-size: 32px;
        }
    </style>
</head>
<body>
    <table border=1 width="90%" align=center>
        <tr>
            <td align=center><a href="inbox1.jsp">Inbox</a></td>
            <td align=center><a href="sentbox.jsp">Sentbox</a></td>
            <td align=center><a href="compose.jsp">ComposeMail</a></td>
            <td align=center><a href="logout.jsp">Logout</a></td>
        </tr>
    </table>
    <br><br>
    <center><h1>My SentBox</h1></center><br><br>
    
    <form action="deletemail.jsp" method="post">
        <table border="1" align="center" width="60%">
            <tr>
                <th>To</th>
                <th>Subject</th>
                <th><input type="submit" class="myButton" value="Delete"></th>
            </tr>
            <% 
            String driver = "com.mysql.cj.jdbc.Driver";
            String connectionUrl = "jdbc:mysql://localhost:3306/emailsoftware";
            String dbUser = "Hemanth";
            String dbPassword = "Hemanth@123";

            Connection connection = null;
            PreparedStatement statement = null;
            ResultSet resultSet = null;

            String userId = (String) session.getAttribute("emailid");

            if (userId == null) {
                response.sendRedirect("login.jsp");
                return;
            }

            try {
                Class.forName(driver);
                connection = DriverManager.getConnection(connectionUrl, dbUser, dbPassword);

                String sql = "SELECT mid, mto, subject FROM mails WHERE mfrom = ? AND sentbox = 1";
                statement = connection.prepareStatement(sql);
                statement.setString(1, userId);

                resultSet = statement.executeQuery();

                while (resultSet.next()) {
                    int mid = resultSet.getInt("mid");
            %>
            <tr>
                <td><%= resultSet.getString("mto") %></td>
                <td><a href="ReadMail2.jsp?mid=<%= mid %>"><%= resultSet.getString("subject") %></a></td>
                <td align=center><input type="checkbox" class="myCheckBox" name="deleteCheckbox" value="<%= mid %>"></td>
            </tr>
            <%
                }
            } catch (SQLException | ClassNotFoundException e) {
                out.println("An error occurred while retrieving your sent mails. Please try again later.");
                e.printStackTrace();
            } finally {
                if (resultSet != null) try { resultSet.close(); } catch (SQLException ignore) {}
                if (statement != null) try { statement.close(); } catch (SQLException ignore) {}
                if (connection != null) try { connection.close(); } catch (SQLException ignore) {}
            }
            %>
        </table>
    </form>
</body>
</html>

