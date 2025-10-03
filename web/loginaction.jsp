<%-- 
    Document   : LoginAction
    Created on : 27 Jun, 2024, 11:43:59 AM
    Author     : pc
--%>

<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    
     String username=request.getParameter("username");
     String password=request.getParameter("password");
     

try
{
    Class.forName("com.mysql.jdbc.Driver");
   Connection   con=  DriverManager.getConnection("jdbc:mysql://localhost:3306/medicine"
           + "","root","root");
       Statement    st=   con.createStatement();
       ResultSet rs= st.executeQuery("select * from register where username='"+username+"' and password='"+password+"' ");
     if(rs.next())
     {
         %>
         <script>
             window.alert("Login succ=======");
             window.location="login.html";
         </script>
         <%
     }
else
{
 %>
         <script>
             window.alert("invalid inter correct username &password");
             window.location="register.html";
         </script>
         <%
}
}
catch(Exception e)
{
    out.println(e);
}
%>