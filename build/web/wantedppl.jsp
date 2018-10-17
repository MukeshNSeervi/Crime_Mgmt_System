<%-- 
    Document   : wantedppl
    Created on : Nov 25, 2017, 2:21:47 PM
    Author     : abc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="missing.css" >
        <title>wanted people list</title>
    </head>
    <body>
        <h1><span class="blue">&lt;</span>Wanted List Table<span class="blue">&gt;</span> <span class="yellow"></span></h1>
<h2> <a href="#" target="_blank">City police</a></h2>

<table class="container">
	<thead>
		<tr>
			<th><h1>Name</h1></th>
			<th><h1>Age</h1></th>
			<th><h1>Charges</h1></th>
			<th><h1>Missing From</h1></th>
		</tr>
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
            String sql = "select * from wanted";
            pst = con.prepareStatement(sql);
            rs = pst.executeQuery();
            if(rs.equals(null)){ out.println("no wanted peoples");}
            while(rs.next())
            {%>
                <tr>
                    <td><%= rs.getString(1)%></td>
                    <td><%= rs.getString(2)%></td>
                    <td><%= rs.getString(3)%></td>
                    <td><%= rs.getString(4)%></td>
                </tr>
            <%}
            
        }
        catch(Exception e)
        {
        }
        %>
        </tbody>
</table>
    </body>
</html>
