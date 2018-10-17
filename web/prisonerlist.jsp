<%-- 
    Document   : prisonerlist
    Created on : Dec 5, 2017, 11:10:47 AM
    Author     : Mukesh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*;" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="pl.css" >
        <title>prisoner list</title>
    </head>
    <body>
        <div class="table-users">
   <div class="header">Prisoner's Details</div>
   
   <table cellspacing="0">
       <thead
      <tr>
         <th>Name</th>
         <th>Age</th>
         <th>Crime</th>
         <th>Date In</th>
         <th width="230px">Date Out</th>
      </tr>
       </thead>
       <tbody>
       <%
           Connection con = null;
           ResultSet rs;
           PreparedStatement pst = null;
           con = DriverManager.getConnection("jdbc:derby://localhost:1527/chor","nam","nam");
            Class.forName("org.apache.derby.jdbc.ClientDriver");
            String sql = "select * from prisoner";
            pst = con.prepareStatement(sql);
            rs = pst.executeQuery();
            while(rs.next())
            {%>
            <tr>
                <td><%= rs.getString(1)%></td>
                <td><%= rs.getString(2)%></td>
                <td><%= rs.getString(3)%></td>
                <td><%= rs.getString(4)%></td>
                <td style="text-align: center"><%= rs.getString(5)%></td>
             </tr>
            <%}
       %>
  
   </tbody>
   </table>
</div>
    </body>
</html>
