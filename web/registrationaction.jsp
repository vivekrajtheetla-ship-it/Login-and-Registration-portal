<%-- 
    Document   : registrationaction
    Created on : 26 Jun, 2024, 3:58:16 PM
    Author     : vivek
--%>

<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String fullname=request.getParameter("fullname");
    String username=request.getParameter("username");
    String password=request.getParameter("password");
    String mobileno=request.getParameter("mobileno");
    String gender=request.getParameter("gender");
    String state=request.getParameter("state");
    
    try{
        Class.forName("com.mysql.jdbc.Driver");
        Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/medicine","root","root");
        Statement st=conn.createStatement();
        int i=st.executeUpdate("insert into register values('"+fullname+"','"+username+"','"+password+"','"+mobileno+"','"+gender+"','"+state+"')");
        if(i>0){
            %>
            <script>
                window.alert("registration successfull");
                window.location="login.html";
                </script>
           <%
        }
        else{
            %>
            <script>
                window.alert("registration not sucessfull");
                window.location="register.html";
                </script>
            <%
            }
    }
catch(Exception e){
out.println(e);
}
%>