<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>   
    <link rel="stylesheet" href="index.css">
    <%!
    
   	Connection conn;
    Statement statement;
    ResultSet resultSet;
    public void jspInit(){
    	try{
    		Class.forName("com.mysql.jdbc.Driver");
        	conn = DriverManager.getConnection("jdbc:mysql://localhost/employee16","root","vibhute@1997");
        	statement = conn.createStatement();
        	resultSet = statement.executeQuery("Select * from account;");
    	}catch(SQLException e){
    		System.out.print("SQL exception");
    	}catch(ClassNotFoundException ec){
    		System.out.print("Class not found");
    	}
    }
    
    public void jsDestroy() throws SQLException{
    	statement.close();
		conn.close();
    	
    }
    
    %>
    
    <h2>Display Employee</h2>    <div class="table">
 <table>
 	<tr>
 		<th> ID </th>
 		<th> FirstName</th>
 		<th> LastName </th>
  		<th> email id </th>
 	</tr>
 	 		<% while(resultSet.next()){ %>
 	
 		<tr> 
 			<td><%=resultSet.getInt(1) %></td> 
 			<td><%=resultSet.getString(2) %></td> 
 			<td><%=resultSet.getString(3) %></td> 
 			<td><%=resultSet.getInt(4) %></td> 
 		</tr>
 		 	 		<% } %>

 </table></div>
    
    
    
    