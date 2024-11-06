<%@page import="java.sql.*"%>
<%@page import="javax.sql.*"%>
<%@page import="javax.naming.*"%>
<%@page import="java.util.*"%>
<%@page import="java.util.Enumeration"%>

<html>
<head>
    <title>Deleting Sent Mails</title>
</head>
<body>
<%
String driver = "com.mysql.cj.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost:3306/emailsoftware";
String dbUser = "Hemanth";
String dbPassword = "Hemanth@123";

Connection connection = null;
PreparedStatement statement = null;

String userId = (String) session.getAttribute("emailid");

if (userId == null) {
    response.sendRedirect("login.jsp");
    return;
}

try {
    Class.forName(driver);
    connection = DriverManager.getConnection(connectionUrl, dbUser, dbPassword);

    String[] deleteIds = request.getParameterValues("deleteCheckbox");
    if (deleteIds != null && deleteIds.length > 0) {
        String sql = "DELETE FROM mails WHERE mid = ? AND mto = ?";
        statement = connection.prepareStatement(sql);

        for (String deleteId : deleteIds) {
            statement.setInt(1, Integer.parseInt(deleteId));
            statement.setString(2, userId);
            statement.executeUpdate();
        }
    }
    response.sendRedirect("inbox1.jsp");
} catch (SQLException | ClassNotFoundException e) {
    out.println("An error occurred while deleting the selected mails. Please try again later.");
    e.printStackTrace();
} finally {
    if (statement != null) try { statement.close(); } catch (SQLException ignore) {}
    if (connection != null) try { connection.close(); } catch (SQLException ignore) {}
}
%>
</body>
</html>

