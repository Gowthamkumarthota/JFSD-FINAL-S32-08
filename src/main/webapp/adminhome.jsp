
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Course Management System</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<%@include file="adminnavbar.jsp" %>

    <!-- Hero Section -->
    <div class="hero">
        <div class="hero-content">
            <h1>Welcome to the Admin Dashboard</h1>
            <p>Manage your courses, teachers, and course mappings all in one place.</p>
            <a href="<c:url value='/courses' />" class="btn btn-primary btn-large">Go to Courses</a>
        </div>
    </div>

    <!-- Content Section -->
    <div class="content-section">
        <h2>Admin Features</h2>
        <p>Quickly manage and update the courses, teachers, and course mappings on this platform.</p>
        <div class="row">
            <div class="col-md-4">
                <div class="card shadow-sm">
                    <div class="card-body text-center">
                        <h3>Manage Courses</h3>
                        <p>View and edit courses offered by the institution.</p>
                        <a href="<c:url value='/Courses' />" class="btn btn-secondary">Go to Courses</a>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="card shadow-sm">
                    <div class="card-body text-center">
                        <h3>Manage Teachers</h3>
                        <p>View and update teacher details.</p>
                        <a href="<c:url value='/teacherModal' />" class="btn btn-secondary">Go to Teachers</a>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="card shadow-sm">
                    <div class="card-body text-center">
                        <h3>Course Mapping</h3>
                        <p>Assign teachers to courses and manage course mapping.</p>
                        <a href="<c:url value='/mapcourses' />" class="btn btn-secondary">Go to Course Mapping</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
    <%@include file="adminfooter.jsp" %>
    
</body>
</html>