<%@ page import="java.sql.*" language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	String roll = request.getParameter("roll");
	try {
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/student_app", "root",
				"tiger");
		String sql = "SELECT * FROM student WHERE roll ="+roll;
		PreparedStatement preparedStatement = connection.prepareStatement(sql);
		ResultSet resultSet = preparedStatement.executeQuery();
		resultSet.next();%>
		<form action="update">
		ROLL : 	 <input type="text" name="roll" value="<%=resultSet.getInt(1)%>"><br>
		NAME : 	 <input type="text" name="name" value="<%=resultSet.getString(2)%>"><br>
		AGE : 	 <input type="text" name="age" value="<%=resultSet.getInt(3)%>"><br>
		GENDER : <input type="text" name="gender" value="<%=resultSet.getString(4)%>"><br>
				 <input type="submit" value="Update">
		</form>
		<%connection.close();
	} catch (ClassNotFoundException e) {
		e.printStackTrace();
	} catch (SQLException e) {
		e.printStackTrace();
	}
	%>
</body>
</html>