<%@ page import="java.sql.*" language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@include file="navbar.jsp" %>
	<%
	try {
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/student_app", "root",
				"tiger");
		String sql = "SELECT * FROM student";
		PreparedStatement preparedStatement = connection.prepareStatement(sql);
		ResultSet resultSet = preparedStatement.executeQuery();%>
		
		<table border="2">
		<thead>
			<th>ROLL</th>
			<th>NAME</th>
			<th>AGE</th>
			<th>GENDER</th>
			<th>EDIT</th>
			<th>DELETE</th>
		</thead>
		<% while(resultSet.next()){ %>
		<tr>
			<td><%= resultSet.getInt(1) %></td>
			<td><%= resultSet.getString(2) %></td>
			<td><%= resultSet.getInt(3) %></td>
			<td><%= resultSet.getString(4) %></td>
			<td><a href=edit.jsp?roll=<%=resultSet.getInt(1) %>>edit</a></td>
			<td><a href=delete?roll=<%=resultSet.getInt(1) %>>delete</a></td>
		</tr>
		<%} %>
		</table>
		
		<%connection.close();
	} catch (ClassNotFoundException e) {
		e.printStackTrace();
	} catch (SQLException e) {
		e.printStackTrace();
	}
	%>
</body>
</html>