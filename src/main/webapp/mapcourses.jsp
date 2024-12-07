<%@page import="lombok.EqualsAndHashCode.Include"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <title>Map Course to Student</title>
</head>
<body>

<%@include file="adminnavbar.jsp" %>
    <div class="container my-5 p-5" style="border:1px solid black;">
        <h4 class="text-center">Map Course to Student</h4>
        <form action="mapthecourse" method="POST" class="needs-validation" novalidate>
            <div class="mb-3">
                <label for="studentId" class="form-label">Student ID</label>
                <input type="number" class="form-control" id="studentId" name="studentId" required>
                <div class="invalid-feedback">Please provide a student ID.</div>
            </div>
            <div class="mb-3">
                <label for="courseId" class="form-label">Course ID</label>
                <input type="number" class="form-control" id="courseId" name="courseId" required>
                <div class="invalid-feedback">Please provide a course ID.</div>
            </div>
            <div class="mb-3">
                <label for="tid" class="form-label">Teacher ID</label>
                <input type="number" class="form-control" id="tid" name="tid" required>
                <div class="invalid-feedback">Please provide a teacher ID.</div>
            </div>
            <div class="d-grid gap-2">
                <button type="submit" name="action" value="map" class="btn btn-primary">Map Course</button>
            </div>
            
            <div class="mt-4 text-center">
            <a href="maptcsList" class="btn btn-info">Course List</a>
        </div>
        </form>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
    
    <script>
        // Bootstrap 5 form validation
        (function () {
            'use strict'
            // Fetch all the forms we want to apply custom Bootstrap validation styles to
            var forms = document.querySelectorAll('.needs-validation')
            // Loop over them and prevent submission
            Array.prototype.slice.call(forms)
                .forEach(function (form) {
                    form.addEventListener('submit', function (event) {
                        if (!form.checkValidity()) {
                            event.preventDefault()
                            event.stopPropagation()
                        }
                        form.classList.add('was-validated')
                    }, false)
                })
        })()
    </script>

</body>
</html>
