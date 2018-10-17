<%-- 
    Document   : login
    Created on : Nov 24, 2017, 7:21:32 PM
    Author     : abc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>login</title>
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
            
            String username = request.getParameter("user");
            String password = request.getParameter("password");
            String sql = "select username,password from users";
            pst = con.prepareStatement(sql);
            rs = pst.executeQuery();
            boolean flag = false;
            while(rs.next())
            {
                if(username.equals(rs.getString(1)) && password.equals(rs.getString(2)))
                {
                    flag = true;
                    if(username.equals("Admin") && password.equals("Crime"))
                        response.sendRedirect("adminlist.html");
                    else
                        response.sendRedirect("list.html");
                }
            }
            if (flag == false)
            {
                %><script>WrongPassword()</script><%
                response.sendRedirect("login.html");
            }
         }
         catch(Exception e)
         {
             response.sendRedirect("login.html");
         }


        %>
    </body>
</html>
