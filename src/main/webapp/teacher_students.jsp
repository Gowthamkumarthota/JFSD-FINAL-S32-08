<%@page import="com.klu.prostu.model.Teacher" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
Teacher a = (Teacher)session.getAttribute("teacher");
if(a==null){
  response.sendRedirect("sessionexpiry");
  return;
}
%>
<!DOCTYPE html>
<html>
<head>
    <title>Teacher - Students</title>
</head>
<body>
    <h1>Your Students</h1>
    <div>
        <c:forEach var="student" items="${students}">
            <div class="student-card">
                <p><strong>Name:</strong> ${student.name}</p>
                <p><strong>Email:</strong> ${student.email}</p>
                <form action="/teacher/update-student" method="POST">
                    <input type="hidden" name="studentId" value="${student.studentId}">
                    <label for="marks">Marks:</label>
                    <input type="number" name="marks" required>
                    <label for="attendance">Attendance:</label>
                    <input type="number" name="attendance" required>
                    <label for="feedback">Feedback:</label>
                    <textarea name="feedback" required></textarea>
                    <button type="submit">Submit</button>
                </form>
            </div>
        </c:forEach>
    </div>
    <a href="/teacherhome">Back to Home</a>
</body>
</html>
