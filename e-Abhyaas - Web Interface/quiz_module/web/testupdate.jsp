<%--
As soon as the admin clicks the update button , he/she is redirected to this page where he is shown the updated table.

--%>
<%@page contentType="text/html" pageEncoding="UTF-8" import="java.io.*,java.sql.*,java.lang.*"%>
<%

String test=(String)session.getAttribute("test");

try{
 Class.forName("com.mysql.jdbc.Driver");
    Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/quiz_moduledatabase","root","123");
             Statement st=con.createStatement();
st.executeUpdate("update registration  set TestAllotted='"+test+"' where Role='Invigilator'");
response.sendRedirect("invigilatorAllot.jsp");
con.close();
}
catch(Exception e){
System.out.println(e);
}
%>