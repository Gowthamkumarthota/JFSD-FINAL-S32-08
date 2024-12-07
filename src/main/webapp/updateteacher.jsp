<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <script src="https://kit.fontawesome.com/0faddc1af8.js" crossorigin="anonymous"></script>
    <title>Edit Teacher Details</title>
</head>
<body>

    <!-- Include the navigation bar here (already included in your example) -->
<%@include file="adminnavbar.jsp" %>
    <div class="container my-5 p-5" style="border:1px solid black;">
        <h4 class="text-center">Edit Teacher Details</h4>
        <form class="col-md-4 offset-md-4" action="updateteacher" method="post">
            
            <!-- Hidden field for teacher ID -->
                        <div class="mb-3">
                <label for="name" class="form-label">id</label>
                <input type="number" class="form-control" name="teacherId" value="${teacher.teacherId}" required>
            </div>
         

            <!-- Teacher Name -->
            <div class="mb-3">
                <label for="name" class="form-label">Name</label>
                <input type="text" class="form-control" name="name" value="${teacher.name}" required>
            </div>

            <!-- Teacher Password -->
            <div class="mb-3">
                <label for="password" class="form-label">Password</label>
                <input type="password" class="form-control" name="password" value="${teacher.password}" required>
            </div>

            <!-- Teacher Email -->
            <div class="mb-3">
                <label for="email" class="form-label">Email</label>
                <input type="email" class="form-control" name="email" value="${teacher.email}" required>
            </div>

            <!-- Teacher Phone -->
            <div class="mb-3">
                <label for="phone" class="form-label">Phone</label>
                <input type="tel" class="form-control" name="phone" value="${teacher.phone}" required>
            </div>

            <!-- Teacher Hire Date -->
            <div class="mb-3">
                <label for="hireDate" class="form-label">Hire Date</label>
                <input type="date" class="form-control" name="hireDate" value="${teacher.hireDate}" required>
            </div>

            <!-- Submit Button -->
            <center><button type="submit" class="btn btn-primary">Submit</button></center>
        </form>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>

</body>
</html>
