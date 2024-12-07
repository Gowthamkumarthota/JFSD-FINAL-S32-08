<%@ page import="com.klu.prostu.model.Student" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Student Dashboard</title>
    <link rel="stylesheet" type="text/css" href="css/student.css">
</head>
<body>
    <%@ include file="components/navbar.jsp" %>
    
    <div class="dashboard-container">
        <div class="welcome-section">
            <h1>Welcome,${student.name } </h1>
            <p>Student ID: ${student.studentId }</p>
        </div>

        <div class="performance-summary">
            <div class="summary-card">
                <h3>Overall Performance</h3>
                <p>CGPA: 8.9</p>
                <p>Overall Attendance: 91.67%</p>
            </div>
            
            <div class="summary-card">
                <h3>Upcoming Events</h3>
                <ul>
                    <li>Mid-Term Examination - 15th Oct</li>
                    <li>Project Submission - 20th Oct</li>
                    <li>Technical Symposium - 25th Oct</li>
                </ul>
            </div>
        </div>
    </div>


   
</body>
</html>