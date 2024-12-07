<%@ page import="com.klu.prostu.model.Teacher" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    // Check if the teacher session exists
    Teacher teacher = (Teacher) session.getAttribute("teacher");
    if (teacher == null) {
        response.sendRedirect("sessionexpiry");
        return;
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dashboard - ${teacher.name}</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .modal-content {
            padding: 20px;
            border-radius: 8px;
        }
    </style>
</head>
<body>
    <%@ include file="teachernavbar.jsp" %>

    <div class="container my-5">
        <!-- Page Heading -->
        <h1>Welcome, ${teacher.name}!</h1>
        <p>Manage your courses, students, and student-related activities all in one place.</p>

        <!-- Teacher Information -->
        <div class="mb-3">
            <label for="teacherId" class="form-label">Your Teacher ID:</label>
            <input type="text" id="ttid" name=""ttid"" class="form-control" value="${teacher.teacherId}" readonly>
        </div>

        <!-- Navigation Buttons -->
        <div class="d-flex justify-content-around my-4">
       <button onclick="location.href='<c:url value='/studentslistfo' />?ttid=${teacher.teacherId}';" class="btn btn-primary">View Students</button>

            <a href="<c:url value='/teacherModal' />" class="btn btn-secondary">Manage Students</a>
            <a href="<c:url value='/mapcourses' />" class="btn btn-secondary">Course Mapping</a>
        </div>

        <!-- Modal for displaying courses -->
        
        <!-- Features Section -->
        <div class="row text-center mt-5">
            <div class="col-md-4">
                <div class="card shadow-sm">
                    <div class="card-body">
                        <h3>Manage Courses</h3>
                        <p>View and edit courses offered by the institution.</p>
                        <button class="btn btn-secondary" data-bs-toggle="modal" data-bs-target="#coursesModal">View Courses</button>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="card shadow-sm">
                    <div class="card-body">
                        <h3>Manage Students</h3>
                        <p>View and update student details.</p>
                        <a href="<c:url value='/teacherModal' />" class="btn btn-secondary">Go to Students</a>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="card shadow-sm">
                    <div class="card-body">
                        <h3>Course Mapping</h3>
                        <p>Assign students to courses and manage mappings.</p>
                        <a href="<c:url value='/mapcourses' />" class="btn btn-secondary">Go to Course Mapping</a>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <%@ include file="adminfooter.jsp" %>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
