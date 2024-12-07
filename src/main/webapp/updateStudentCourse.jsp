<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <title>Update Student Course</title>
</head>
<body>
<div class="container my-5">
    <h2>Update Student Course</h2>
    <form action="<c:url value='updateStudentCourse' />" method="post">
        <input type="hidden" name="studentId" value="${studentId}">
        <input type="hidden" name="courseId" value="${courseId}">

        <div class="mb-3">
            <label for="attendance" class="form-label">Attendance Percentage:</label>
            <input type="number" class="form-control" id="attendance" name="attendance" required>
        </div>

        <div class="mb-3">
            <label for="feedback" class="form-label">Feedback:</label>
            <textarea class="form-control" id="feedback" name="feedback" rows="3" required></textarea>
        </div>

        <div class="mb-3">
            <label for="marks" class="form-label">Marks:</label>
            <input type="number" class="form-control" id="marks" name="marks" required>
        </div>

        <button type="submit" class="btn btn-primary">Update</button>
    </form>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
