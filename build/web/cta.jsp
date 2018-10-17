<%-- 
    Document   : cta
    Created on : Nov 25, 2017, 11:02:45 AM
    Author     : abc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import = "java.sql.*;" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
        <title>Contact jsp page</title>
    </head>
    <body>
        
        <%
        Connection con = null;
        PreparedStatement pst = null;
        try
        {
            Class.forName("org.apache.derby.jdbc.ClientDriver");
            con = DriverManager.getConnection("jdbc:derby://localhost:1527/chor","nam","nam");
            String name = request.getParameter("Name");
            String email = request.getParameter("Email");
            String occupation = request.getParameter("Occupation");
            String phone = request.getParameter("Phone");
            String subject = request.getParameter("Subject");
            String message = request.getParameter("Message");
            out.println("1");
            String sql = "insert into contactus values (?,?,?,?,?,?)";
             out.println("2");
            pst = con.prepareStatement(sql);
             out.println("3");
            pst.setString(1,name);
            pst.setString(2,email);
            pst.setString(3,occupation);
            pst.setString(4,phone);
            pst.setString(5,subject);
            pst.setString(6,message);
             out.println("4");
            int x = pst.executeUpdate();
             out.println("5");
            if(x == 1)
            {%>
            <script type="text/javascript">
                function call(){
                    alert("ouch!!!");
                }
                call();
            </script><%
                response.sendRedirect("index.html");
            }
            
                    
        }
        catch(Exception e)
        {
            out.println("wrong code bhai" + e);
        }
        
        
        
        
        
        %>
    </body>
</html>
