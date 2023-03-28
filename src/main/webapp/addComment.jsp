<%@page import="org.json.simple.JSONObject"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="org.json.simple.JSONArray"%>
<%
    try {
        JSONArray jsonResponse = new JSONArray();
        JSONObject obj = new JSONObject();

        Class.forName("com.mysql.jdbc.Driver");
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/student", "root", "");

        PreparedStatement pst = conn.prepareStatement("insert comment (user, comment) values (?,?)");
        pst.setString(1, request.getParameter("nameUser"));
        pst.setString(2, request.getParameter("comment"));
        pst.execute();

        obj.put("success", "inserted");
        out.println(jsonResponse.toJSONString());
        out.flush();
    } catch (Exception ecx) {
        ecx.printStackTrace();
        throw new ServletException(ecx.getMessage());
    }
%>