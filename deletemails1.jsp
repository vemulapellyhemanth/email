<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.util.logging.Level" %>
<%@ page import="java.util.logging.Logger" %>
<%
String[] deleteIds = request.getParameterValues("deleteIds");
if (deleteIds != null && deleteIds.length > 0) {
    String driver = "com.mysql.jdbc.Driver";
    String connectionUrl = "jdbc:mysql://localhost:3306/";
    String database = "emailsoftware";
    String userid = "Hemanth";
    String password = "Hemanth@123";
    Connection connection = null;
    PreparedStatement statement = null;

    try {
        Class.forName(driver);
        connection = DriverManager.getConnection(connectionUrl + database, userid, password);
        String sql = "update mails set inbox=0 WHERE mid = ?";
        statement = connection.prepareStatement(sql);

        for (String id : deleteIds) {
            statement.setInt(1, Integer.parseInt(id));
            statement.executeUpdate();
        }
    } catch (ClassNotFoundException | SQLException e) {
        Logger.getLogger("deletemails1.jsp").log(Level.SEVERE, null, e);
        out.println("Error: " + e.getMessage());
    } finally {
        if (statement != null) try { statement.close(); } catch (SQLException e) { /* ignored */ }
        if (connection != null) try { connection.close(); } catch (SQLException e) { /* ignored */ }
    }
}

response.sendRedirect("inbox1.jsp");
%>
