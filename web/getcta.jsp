<%-- 
    Document   : getcta
    Created on : Nov 25, 2017, 3:26:59 PM
    Author     : abc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import = "java.sql.*;"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="missing.css">
        <title>Feedback details</title>
    </head>
    <body>
        <h1><span class="blue"></span>Feedback Details<span class="blue"></span> <span class="yellow"></span></h1>
<h2> <a href="#" target="_blank"></a></h2>
        <table class="container">
            <thead>
                    <th>Name</th>
                    <th>Email</th>
                    <th>Occupation</th>
                    <th>Phone</th>
                    <th>Subject</th>
                    <th>Messsage</th>
            </thead>
            <tbody>
                
            
        <%
          Connection con = null;
          PreparedStatement pst = null;
          ResultSet rs;
          
          try
          {
              Class.forName("org.apache.derby.jdbc.ClientDriver");
              con = DriverManager.getConnection("jdbc:derby://localhost:1527/chor","nam","nam");
              String sql = "select * from contactus";
              pst = con.prepareStatement(sql);
              rs = pst.executeQuery();
              while(rs.next())
              {%>
                    <tr>
                        <td><%= rs.getString(1)%></td>
                        <td><%= rs.getString(2)%></td>
                        <td><%= rs.getString(3)%></td>
                        <td><%= rs.getString(4)%></td>
                        <td><%= rs.getString(5)%></td>
                        <td><%= rs.getString(6)%></td>
                        
                    </tr>
                  
              <%}
              
          }
          catch(Exception e)
          {
              out.println(e);
          }
        %> 
        </tbody>
        </table>
    </body>
</html>
