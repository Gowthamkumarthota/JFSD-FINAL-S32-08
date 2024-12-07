<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <script src="https://kit.fontawesome.com/0faddc1af8.js" crossorigin="anonymous"></script>
    <title>Edit Course Mapping</title>
</head>
<body>

<%@ include file="adminnavbar.jsp" %> <!-- Include the navigation bar -->

<div class="container my-5 p-5" style="border:1px solid black;">
    <h4 class="text-center">Edit Course Mapping</h4>

    <!-- Form to update the course mapping -->
    <form class="col-md-6 offset-md-3" action="mapupdatecourse" method="post">
        <!-- Hidden field for the ID -->
        <div class="mb-3">
            <label for="id" class="form-label">Mapping ID</label>
            <input type="number" class="form-control" name="id" value="${maptcs.id}" >
        </div>

        <!-- Student ID -->
        <div class="mb-3">
            <label for="studentId" class="form-label">Student ID</label>
            <input type="number" class="form-control" name="studentId" value="${maptcs.studentId}" required>
        </div>

        <!-- Course ID -->
        <div class="mb-3">
            <label for="courseId" class="form-label">Course ID</label>
            <input type="number" class="form-control" name="courseId" value="${maptcs.courseId}" required>
        </div>

        <!-- Teacher ID -->
        <div class="mb-3">
            <label for="teacherId" class="form-label">Teacher ID</label>
            <input type="number" class="form-control" name="tid" value="${maptcs.tid}" required>
        </div>

        <!-- Submit Button -->
        <center><button type="submit" class="btn btn-primary">Update Mapping</button></center>
    </form>

</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>

</body>
</html>
