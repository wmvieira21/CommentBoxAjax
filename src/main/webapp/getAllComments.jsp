<%@page import="org.json.simple.JSONObject"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="org.json.simple.JSONArray"%>
<%
    try {
        JSONArray jsonResponse = new JSONArray();
        String account = request.getParameter("accont");

        Class.forName("com.mysql.jdbc.Driver");
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/student", "root", "");

        PreparedStatement pst = conn.prepareStatement("select * from comment");
        ResultSet rs = pst.executeQuery();

        while (rs.next()) {
            JSONObject obj = new JSONObject();
            obj.put("user", rs.getString("user"));
            obj.put("comment", rs.getString("comment"));
            jsonResponse.add(obj);
        }

        out.println(jsonResponse.toJSONString());
        out.flush();
    } catch (Exception ecx) {
        ecx.printStackTrace();
        throw new ServletException(ecx.getMessage());
    }
%>