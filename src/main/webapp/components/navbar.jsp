<%@ page import="com.klu.prostu.model.Student" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    // Check if the student session exists
    Student st = (Student) session.getAttribute("student");
    if (st == null) {
        response.sendRedirect("sessionexpiry");
        return;
    }
%>
<nav class="navbar">
    <div class="nav-brand">Student Portal</div>
    <div class="nav-links">
        <button 
            onclick="location.href='<c:url value="Studentmakrsof" />?action=marks';" 
            class="nav-button">Marks</button>
        <button 
            onclick="location.href='<c:url value="StudentAttendance" />?ssid=${student.studentId}';" 
            class="nav-button">Attendance</button>
        <button 
            onclick="location.href='/'" 
            class="nav-button">Logout</button>
    </div>
</nav>
