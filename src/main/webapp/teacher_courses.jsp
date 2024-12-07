<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Teacher - Courses</title>
</head>
<body>
    <h1>Your Courses</h1>
    <ul>
        <c:forEach var="course" items="${courses}">
            <li>
                <strong>${course.name}</strong>: ${course.description}
            </li>
        </c:forEach>
    </ul>
    <a href="/teacherhome">Back to Home</a>
</body>
</html>
