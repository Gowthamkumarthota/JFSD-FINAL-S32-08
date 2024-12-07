<%@ page import="com.klu.prostu.model.Teacher" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
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
    <title>Teacher Dashboard - ${teacher.name}</title>
    <link rel="stylesheet" href="css/teacher.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
</head>
<body class="bg-light">
    <nav class="navbar navbar-expand-lg navbar-dark">
        <div class="container-fluid">
            <a class="navbar-brand" href="#">
                <i class="fas fa-chalkboard-teacher me-2"></i>
                Teacher Portal
            </a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ms-auto">
                    <li class="nav-item">
                        <a class="nav-link" href="#" data-bs-toggle="modal" data-bs-target="#uploadModal">
                            <i class="fas fa-upload me-1"></i> Upload Mappings
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="<c:url value='/studentslistfo'/>?ttid=${teacher.teacherId}">
                            <i class="fas fa-users me-1"></i> View Students
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="/">
                            <i class="fas fa-sign-out-alt me-1"></i> Logout
                        </a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>

    <div class="container my-5">
        <div class="row">
            <div class="col-lg-4">
                <div class="card profile-card">
                    <div class="card-body text-center">
                        <div class="avatar-circle mb-3">
                            <i class="fas fa-user-tie fa-2x"></i>
                        </div>
                        <h3 class="card-title mb-3">${teacher.name}</h3>
                        <p class="card-text">
                            <strong>ID:</strong> ${teacher.teacherId}
                        </p>
                        <div class="mt-4">
                            <button class="btn btn-outline-primary btn-sm me-2" data-bs-toggle="modal" data-bs-target="#profileModal">
                                <i class="fas fa-edit me-1"></i> Edit Profile
                            </button>
                        </div>
                    </div>
                </div>
            </div>
            
            <div class="col-lg-8">
                <div class="row">
                    <div class="col-md-6 mb-4">
                        <div class="card dashboard-card">
                            <div class="card-body">
                                <div class="d-flex justify-content-between align-items-center">
                                    <div>
                                        <h6 class="card-subtitle mb-2 text-muted">Total Students</h6>
                                       <p>Total Students: <span id="totalStudents">Loading...</span></p>
                                    </div>
                                    <div class="card-icon bg-primary">
                                        <i class="fas fa-users"></i>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    
                    <div class="col-md-6 mb-4">
                        <div class="card dashboard-card">
                            <div class="card-body">
                                <div class="d-flex justify-content-between align-items-center">
                                    <div>
                                        <h6 class="card-subtitle mb-2 text-muted">Courses</h6>
                                        <h2 class="card-title mb-0">4</h2>
                                    </div>
                                    <div class="card-icon bg-success">
                                        <i class="fas fa-book"></i>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="card">
                    <div class="card-header">
                        <h5 class="card-title mb-0">Recent Activities</h5>
                    </div>
                    <div class="card-body">
                        <div class="activity-item">
                            <i class="fas fa-file-upload text-primary"></i>
                            <span>Course mapping uploaded</span>
                            <small class="text-muted">2 hours ago</small>
                        </div>
                        <div class="activity-item">
                            <i class="fas fa-user-check text-success"></i>
                            <span>Attendance marked for CS301</span>
                            <small class="text-muted">Yesterday</small>
                        </div>
                        <div class="activity-item">
                            <i class="fas fa-chart-bar text-warning"></i>
                            <span>Marks updated for Mid-term</span>
                            <small class="text-muted">2 days ago</small>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Upload Modal -->
    <div class="modal fade" id="uploadModal" tabindex="-1">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">Upload Course Mapping</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                </div>
                <div class="modal-body">
                    <form id="uploadForm" class="upload-form">
                        <div class="mb-3">
                            <label for="file" class="form-label">Choose Excel File</label>
                            <input type="file" class="form-control" id="file" name="file" accept=".xls,.xlsx" required>
                        </div>
                        <div class="upload-area text-center p-4 mb-3">
                            <i class="fas fa-cloud-upload-alt fa-3x mb-3"></i>
                            <p>Drag and drop your file here or click to browse</p>
                        </div>
                        <div id="statusMessage" class="alert d-none"></div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                    <button type="submit" form="uploadForm" class="btn btn-primary">Upload</button>
                </div>
            </div>
        </div>
    </div>

    <!-- Profile Modal -->
    <div class="modal fade" id="profileModal" tabindex="-1">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">Edit Profile</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                </div>
                <div class="modal-body">
                    <form id="profileForm">
                        <div class="mb-3">
                            <label class="form-label">Name</label>
                            <input type="text" class="form-control" value="${teacher.name}" readonly>
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Teacher ID</label>
                            <input type="text" class="form-control" value="${teacher.teacherId}" readonly>
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Email</label>
                            <input type="email" class="form-control" value="teacher@example.com">
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Department</label>
                            <input type="text" class="form-control" value="Computer Science">
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                    <button type="button" class="btn btn-primary">Save Changes</button>
                </div>
            </div>
        </div>
    </div>

    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        $(document).ready(function() {
            $("#uploadForm").on("submit", function(e) {
                e.preventDefault();
                const formData = new FormData();
                formData.append("file", $("#file")[0].files[0]);

                const statusMessage = $("#statusMessage");
                statusMessage.removeClass("d-none alert-success alert-danger")
                            .addClass("alert-info")
                            .text("Uploading... Please wait.");

                $.ajax({
                    url: "/upload",
                    type: "POST",
                    data: formData,
                    processData: false,
                    contentType: false,
                    success: function() {
                        statusMessage.removeClass("alert-info")
                                   .addClass("alert-success")
                                   .text("Upload successful!");
                        setTimeout(() => {
                            $("#uploadModal").modal("hide");
                            statusMessage.addClass("d-none");
                        }, 2000);
                    },
                    error: function() {
                        statusMessage.removeClass("alert-info")
                                   .addClass("alert-danger")
                                   .text("Error uploading file. Please try again.");
                    }
                });
            });

            // Drag and drop functionality
            const uploadArea = $(".upload-area");
            
            uploadArea.on("dragover", function(e) {
                e.preventDefault();
                $(this).addClass("dragover");
            });

            uploadArea.on("dragleave", function(e) {
                e.preventDefault();
                $(this).removeClass("dragover");
            });

            uploadArea.on("drop", function(e) {
                e.preventDefault();
                $(this).removeClass("dragover");
                const file = e.originalEvent.dataTransfer.files[0];
                $("#file")[0].files = e.originalEvent.dataTransfer.files;
            });
        });
        $(document).ready(function () {
            // Assuming teacherId is available in session or from Java
            var teacherId = ${teacher.teacherId}; // Use JSP to inject teacherId dynamically
            
            $.ajax({
                url: '/totalStudents', // Your API endpoint
                type: 'GET',
                data: { tid: teacherId }, // Pass teacherId as query parameter
                success: function(response) {
                    // Assuming response contains the count of total students
                    $("#totalStudents").text(response);  // Update your HTML element
                },
                error: function(xhr, status, error) {
                    console.log("Error fetching total students: ", error);
                }
            });
        });

    </script>
</body>
</html>