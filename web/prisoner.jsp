<%-- 
    Document   : prisoner
    Created on : Dec 5, 2017, 9:42:51 AM
    Author     : Mukesh
--%>
<%@page import="java.sql.*;" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>prisoner page</title>
    </head>
    <body>
        <%
        try
        {
            Connection con = null;
            PreparedStatement pst = null;
            con = DriverManager.getConnection("jdbc:derby://localhost:1527/chor","nam","nam");
            Class.forName("org.apache.derby.jdbc.ClientDriver");
            String name = request.getParameter("name");
            String age = request.getParameter("age");
            String crime = request.getParameter("crime");
            String datein = request.getParameter("datein");
            String dateout = request.getParameter("dateout");
            String sql = "insert into prisoner values(?,?,?,?,?)";
            pst = con.prepareStatement(sql);
            pst.setString(1,name);
            pst.setString(2,age);
            pst.setString(3,crime);
            pst.setString(4,datein);
            pst.setString(5,dateout);
            int x = pst.executeUpdate();
            if(x == 1)
                response.sendRedirect("adminlist.html");
            
            
        }
        catch(Exception e)
        {
            out.println(e);
        }
        
        %>
    </body>
</html>
