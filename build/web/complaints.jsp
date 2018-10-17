<%-- 
    Document   : complaints
    Created on : Nov 25, 2017, 11:21:09 AM
    Author     : abc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="complaints.css" >
        <title>admin complaints</title>
    </head>
    <body>
        <h1>Complaints !!!!!</h1>
<table class="rwd-table">
  <tr>
    <th>Name</th>
    <th>email</th>
    <th>phone</th>
    <th>subject</th>
    <th>message</th>
  </tr>
  
  <%    
      Connection con = null;
      PreparedStatement pst = null;
      ResultSet rs ;
      try
      {
          Class.forName("org.apache.derby.jdbc.ClientDriver");
          con = DriverManager.getConnection("jdbc:derby://localhost:1527/chor","nam","nam");
          String sql = "select * from complaint";
          pst = con.prepareStatement(sql);
          rs = pst.executeQuery();
          if(rs.equals(null))
          {
              out.println("No Complaints!!!!!!!");
          }
          while(rs.next())
          {%>
                <tr>
                    <td data-th="Movie Title"><%= rs.getString(1) %></td>
                    <td data-th="Genre"><%= rs.getString(2) %></td>
                    <td data-th="Year"><%= rs.getString(3) %></td>
                    <td data-th="Gross"><%= rs.getString(4) %></td>
                    <td data-th="Genre"><%= rs.getString(5) %></td>
                </tr>
          <%}
      }
      catch(Exception e)
      {
          out.println("wrong code kamine!!!");
      }
  %>
<!--  <tr>
    <td data-th="Movie Title">Star Wars</td>
    <td data-th="Genre">Adventure, Sci-fi</td>
    <td data-th="Year">1977</td>
    <td data-th="Gross">$460,935,665</td>
  </tr>
  <tr>
    <td data-th="Movie Title">Howard The Duck</td>
    <td data-th="Genre">"Comedy"</td>
    <td data-th="Year">1986</td>
    <td data-th="Gross">$16,295,774</td>
  </tr>
  <tr>
    <td data-th="Movie Title">American Graffiti</td>
    <td data-th="Genre">Comedy, Drama</td>
    <td data-th="Year">1973</td>
    <td data-th="Gross">$115,000,000</td>
  </tr> -->
</table>

    </body>
</html>
