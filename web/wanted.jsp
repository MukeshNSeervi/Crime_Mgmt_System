<%-- 
    Document   : wanted
    Created on : Nov 25, 2017, 1:22:13 PM
    Author     : abc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import ="java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>wanted List</title>
    </head>
    <body>
        <%
            try
            {
            Connection con = null;
            PreparedStatement pst = null;
            Class.forName("org.apache.derby.jdbc.ClientDriver");
            con = DriverManager.getConnection("jdbc:derby://localhost:1527/chor","nam","nam");
       
            String name = request.getParameter("name");
            String age = request.getParameter("age");
            String crime = request.getParameter("crime");
            String date = request.getParameter("date");
            out.println("1");
            String sql = "insert into wanted values(?,?,?,?)";
            out.println("2");
            pst = con.prepareStatement(sql);
            out.println("3");
            pst.setString(1,name);
            pst.setString(2,age);
            pst.setString(3,crime);
            pst.setString(4,date);
            out.println("4");
            int x = pst.executeUpdate();
            out.println("5");
            if(x == 1)
            {
                %><script>function(){alert("details inserted!!")}</script><%
                    response.sendRedirect("adminlist.html");
            }
            }
            catch(Exception e)
            {
                out.println("lol" + e);
            }
        %>
    </body>
</html>
