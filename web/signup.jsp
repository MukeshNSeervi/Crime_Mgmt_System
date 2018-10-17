<%-- 
    Document   : signup
    Created on : Nov 24, 2017, 6:19:22 PM
    Author     : abc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%@page import ="java.util.*" %>
<%@page import="java.lang.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>signup page</title>
    </head>
    <body>
        <script type="text/javascript">
            fuction call()
            {
                alert("uname is taken");
            }
        </script>
        <%
        Connection con = null;
        PreparedStatement pst = null,pt = null;
        ResultSet rs,rst;
        try
        {
            Class.forName("org.apache.derby.jdbc.ClientDriver");
            con = DriverManager.getConnection("jdbc:derby://localhost:1527/chor","nam","nam");
            
         /*   String sql = "select username from users";
            pst = con.prepareStatement(sql);
            rs = pst.executeQuery();
           */ 
        //    while(rs.next())
        //    {
        //         if(uname.equals(rs.getString(1)))
         //        {
        //            out.println("username already exist please change the username");
        //            response.sendRedirect("index.html");
        //         }
        //    }
            String uname = request.getParameter("user");
            String name  = request.getParameter("name");
            String email = request.getParameter("email");
            String password = request.getParameter("password");
            String conpassword = request.getParameter("conpassword");
            
            if(password.equals(conpassword))
            {
                String SQL = "insert into users values (?,?,?,?,?)";
                pt = con.prepareStatement(SQL);
                pt.setString(1,uname);
                pt.setString(2,name);
                pt.setString(3,email);
                pt.setString(4,password);
                pt.setString(5,conpassword);
                int x = pt.executeUpdate();
                if(x ==1)
                {
                    %><script>function prompt(){alert("your account have been successfuly created!!!!!");}</script><%
                    response.sendRedirect("login.html");
                }
            }
            else
            {
                %><script>function prompt(){alert("password doesn't match!!");}</script><%
            out.println("password doesn't match");
            }   
                 
            
        }
        catch(Exception e)
        {
            %><script>function prompt(){alert("the username is already taken please try using different!!");}</script><%
                //response.sendRedirect("signup.html"); 
                out.println("username already exist!!!! ");
                out.println(e);
            
        }
        %>
    </body>
</html>
