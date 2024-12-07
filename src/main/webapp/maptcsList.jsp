<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <script src="https://kit.fontawesome.com/0faddc1af8.js" crossorigin="anonymous"></script>
    <title>Mapped Courses List</title>
</head>
<body>

<%@include file="adminnavbar.jsp" %> <!-- Include the navigation bar -->

&&nbps  
<div class="container my-5 col-md-8">
    <table class="table table-striped table-hover">
        <thead>
            <tr>
            <th scope="col">mapping id </th>
                <th scope="col">Student ID</th>
                <th scope="col">Course ID</th>
                <th scope="col">Teacher ID</th>
                <th scope="col">Action</th>
            </tr>
        </thead>
        <tbody>
            <!-- Loop through the list of mapped courses -->
            <c:forEach var="maptcs" items="${maptcses}">
                <tr>
                <td>${maptcs.id}</td>
                    <td>${maptcs.studentId}</td>
                    <td>${maptcs.courseId}</td>
                    <td>${maptcs.tid}</td>
                    <td>
                        <!-- Edit action -->
                        <a style="color:blue" href="updatemaptcs"><i class="fa-solid fa-pen-to-square ms-4"></i></a>

                        <!-- Delete action -->
                        <form action="${pageContext.request.contextPath}/deletemaptcs/${maptcs.id}" method="post" style="display:inline;">
                            <input type="hidden" name="_method" value="DELETE">
                            <button type="submit" style="background: none; border: none; color: red; cursor: pointer;">
                                <i class="fa-solid fa-trash ms-4"></i>
                            </button>
                        </form>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>

</body>
</html>
