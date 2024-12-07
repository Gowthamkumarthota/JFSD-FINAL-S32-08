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
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Student Dashboard</title>
    <link rel="stylesheet" href="css/student.css">
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
</head>
<body>
    <!-- Navbar -->
    <nav class="navbar">
        <div class="nav-brand">Student Portal</div>
        <div class="nav-links">
            <button onclick="openModal('marksModal')" class="nav-button">View Marks Graph</button>
            <button onclick="openModal('attendanceModal')" class="nav-button">View Attendance Graph</button>
        <button onclick="window.location.href='/Contactus';">Ask Doubts</button>

            <button onclick="location.href='/'" class="nav-button">Logout</button>
        </div>
    </nav>

    <!-- Main Dashboard -->
    <div class="dashboard-container">
        <div class="welcome-section">
            <h1>Welcome, ${student.name}</h1>
            <p>Student ID: ${student.studentId}</p>
        </div>

        <div class="performance-summary">
            <div class="summary-card">
                <h3>Marks</h3>
                <!-- Marks Table -->
                <table class="data-table">
                    <thead>
                        <tr>
                            <th>Subject</th>
                            <th>Marks</th>
                        </tr>
                    </thead>
                    <tbody id="marksTableBody">
                        <!-- Marks will be inserted here -->
                    </tbody>
                </table>
            </div>
            
            <div class="summary-card">
                <h3>Attendance</h3>
                <!-- Attendance Table -->
                <table class="data-table">
                    <thead>
                        <tr>
                            <th>Subject</th>
                            <th>Attendance (%)</th>
                        </tr>
                    </thead>
                    <tbody id="attendanceTableBody">
                        <!-- Attendance will be inserted here -->
                    </tbody>
                </table>
            </div>
        </div>
    </div>

    <!-- Marks Modal (For Graphs) -->
    <div id="marksModal" class="modal">
        <div class="modal-content">
            <div class="modal-header">
                <h2>Academic Performance</h2>
                <span class="close" onclick="closeModal('marksModal')">&times;</span>
            </div>
            <div class="modal-body">
                <div class="chart-container">
                    <canvas id="marksChart"></canvas>
                </div>
            </div>
        </div>
    </div>

    <!-- Attendance Modal (For Graphs) -->
    <div id="attendanceModal" class="modal">
        <div class="modal-content">
            <div class="modal-header">
                <h2>Attendance Record</h2>
                <span class="close" onclick="closeModal('attendanceModal')">&times;</span>
            </div>
            <div class="modal-body">
                <div class="chart-container">
                    <canvas id="attendanceChart"></canvas>
                </div>
            </div>
        </div>
    </div>

    <!-- Doubts Modal -->
    <div id="doubtsModal" class="modal">
        <div class="modal-content">
            <div class="modal-header">
                <h2>Ask a Doubt</h2>
                <span class="close" onclick="closeModal('doubtsModal')">&times;</span>
            </div>
            <div class="modal-body">
                <form id="doubtForm" onsubmit="submitDoubt(event)">
                    <div class="form-group">
                        <label for="subject">Subject:</label>
                        <select id="subject" name="subject" required>
                            <c:forEach var="course" items="${marksList}">
                                <option value="${course[0]}">${course[0]}</option>
                            </c:forEach>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="question">Your Question:</label>
                        <textarea id="question" name="question" rows="4" required></textarea>
                    </div>
                    <button type="submit" class="submit-button">Submit Question</button>
                </form>
                <div id="doubtsList" class="doubts-list">
                    <h3>Your Previous Doubts</h3>
                    <div class="doubt-item">
                        <!-- Doubts will be dynamically added here -->
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script>
        // Modal Functions
        function openModal(modalId) {
            document.getElementById(modalId).style.display = 'block';

            if (modalId === 'marksModal') {
                fetchMarksData();
            }
            if (modalId === 'attendanceModal') {
                fetchAttendanceData();
            }
        }

        function closeModal(modalId) {
            document.getElementById(modalId).style.display = 'none';
        }

        // Fetch Marks Data
        function fetchMarksData() {
            const ssid = ${student.studentId};  // Ensure this is the correct student ID
            fetch(`/Studentmakrsof?ssid=${ssid}`)
                .then(response => response.json())
                .then(data => {
                    console.log('Fetched Marks Data:', data); // Debug: Log the fetched data

                    const labels = [];
                    const marks = [];
                    let tableRows = '';

                    data.forEach(item => {
                        console.log('Processing Item:', item); // Debug: Log each item
                        labels.push(item.subject); // Assuming `subject` is a key in the data
                        marks.push(item.marks);   // Assuming `marks` is a key in the data
                        tableRows += `<tr><td>${item.subject}</td><td>${item.marks}</td></tr>`;
                    });

                    document.getElementById('marksTableBody').innerHTML = tableRows;  // Update the table with rows
                    updateMarksChart(labels, marks);
                })
                .catch(err => console.error('Error fetching marks data:', err));
        }

        // Update Marks Chart
        function updateMarksChart(labels, marks) {
            const ctx = document.getElementById('marksChart').getContext('2d');
            new Chart(ctx, {
                type: 'bar',
                data: {
                    labels: labels,
                    datasets: [{
                        label: 'Marks',
                        data: marks,
                        backgroundColor: 'rgba(54, 162, 235, 0.5)',
                        borderColor: 'rgba(54, 162, 235, 1)',
                        borderWidth: 1
                    }]
                },
                options: {
                    responsive: true,
                    scales: {
                        y: {
                            beginAtZero: true,
                            max: 100
                        }
                    }
                }
            });
        }

        // Fetch Attendance Data
        function fetchAttendanceData() {
            const ssid = ${student.studentId};  // Ensure this is the correct student ID
            fetch(`/StudentAttendance?ssid=${ssid}`)
                .then(response => response.json())
                .then(data => {
                    console.log('Fetched Attendance Data:', data); // Debug: Log the fetched data

                    const labels = [];
                    const attendance = [];
                    let tableRows = '';

                    data.forEach(item => {
                        console.log('Processing Item:', item); // Debug: Log each item
                        labels.push(item.subject); // Assuming `subject` is a key in the data
                        attendance.push(item.attendance); // Assuming `attendance` is a key in the data
                        tableRows += `<tr><td>${item.subject}</td><td>${item.attendance}%</td></tr>`;
                    });

                    document.getElementById('attendanceTableBody').innerHTML = tableRows;  // Update the table with rows
                    updateAttendanceChart(labels, attendance);
                })
                .catch(err => console.error('Error fetching attendance data:', err));
        }

        // Update Attendance Chart
        function updateAttendanceChart(labels, attendance) {
            const ctx = document.getElementById('attendanceChart').getContext('2d');
            new Chart(ctx, {
                type: 'line',
                data: {
                    labels: labels,
                    datasets: [{
                        label: 'Attendance (%)',
                        data: attendance,
                        borderColor: 'rgba(75, 192, 192, 1)',
                        borderWidth: 2,
                        fill: false
                    }]
                },
                options: {
                    responsive: true,
                    scales: {
                        y: {
                            beginAtZero: true,
                            max: 100
                        }
                    }
                }
            });
        }

        // Submit Doubt Form
        function submitDoubt(event) {
            event.preventDefault();  // Prevent form submission
            const subject = document.getElementById('subject').value;
            const question = document.getElementById('question').value;

            // Send form data to the backend (e.g., using Fetch API or AJAX)
            console.log('Submitting Question:', { subject, question });

            // Clear form
            document.getElementById('doubtForm').reset();
        }
    </script>
</body>
</html>
