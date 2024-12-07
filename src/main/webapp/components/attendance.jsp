<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Student Attendance</title>
<style>
.attendance-table {
    width: 100%;
    border-collapse: collapse;
    margin-top: 20px;
}

.attendance-table th, .attendance-table td {
    border: 1px solid #ddd;
    padding: 8px;
    text-align: left;
}

.attendance-table th {
    background-color: #f4f4f4;
    color: #333;
    font-weight: bold;
}

.attendance-table tr:nth-child(even) {
    background-color: #f9f9f9;
}

.attendance-table tr:hover {
    background-color: #f1f1f1;
}
</style>
</head>
<body>

<!-- Close button -->
<span class="close" onclick="location.href='<c:url value="StudentAttendance" />?ssid=${student.studentId}';">&times;</span>



<!-- Attendance Table -->
<table class="attendance-table">
    <thead>
        <tr>
            <th>Subject</th>
            <th>Attendance (%)</th>
        </tr>
    </thead>
    <tbody>
        <c:choose>
            <c:when test="${not empty attendanceList}">
                <c:forEach var="course" items="${attendanceList}">
                    <tr>
                        <td>${course[0]}</td> <!-- Course name -->
                        <td>${course[1]}</td> <!-- Attendance -->
                    </tr>
                </c:forEach>
            </c:when>
            <c:otherwise>
                <tr>
                    <td colspan="2">No attendance data available.</td>
                </tr>
            </c:otherwise>
        </c:choose>
    </tbody>
</table>



</body>
</html>
