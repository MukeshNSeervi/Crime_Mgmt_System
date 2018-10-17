<%-- 
    Document   : complaint
    Created on : Nov 25, 2017, 11:04:03 AM
    Author     : abc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import = "java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script type="text/javascript" href="every.js"></script>
        <title>Complaint file</title>
    </head>
    <body>
        <%
        Connection con = null;
        PreparedStatement pst = null;
        ResultSet rs ;
        try
        {
            Class.forName("org.apache.derby.jdbc.ClientDriver");
            con = DriverManager.getConnection("jdbc:derby://localhost:1527/chor","nam","nam");
            String name = request.getParameter("name");
            String email = request.getParameter("mail");
            String phone = request.getParameter("phone");
            String subject = request.getParameter("subject");
            String message = request.getParameter("message");
            String sql = "insert into complaint values (?,?,?,?,?)";
            pst = con.prepareStatement(sql);
            pst.setString(1,name);
            pst.setString(2,email);
            pst.setString(3,phone);
            pst.setString(4,subject);
            pst.setString(5,message);
            int x = pst.executeUpdate();
            if(x == 1)
            {
        %> <script>function(){alert("complaint registered!!!!");}</script> <%
            response.sendRedirect("list.html");
            }
        }
        catch(Exception e)
        {
            out.println(e);
        }
        
        %>
    </body>
</html>
