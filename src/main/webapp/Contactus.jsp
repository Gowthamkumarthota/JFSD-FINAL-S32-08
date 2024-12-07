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
<html>
<head>
    <title>Send Email</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 20px;
        }
        form {
            max-width: 400px;
            margin: 0 auto;
        }
        label {
            display: block;
            margin-bottom: 8px;
            font-weight: bold;
        }
        input, textarea, button {
            width: 100%;
            padding: 10px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }
        button {
            background-color: #4CAF50;
            color: white;
            border: none;
            cursor: pointer;
        }
        button:hover {
            background-color: #45a049;
        }
    </style>
    <link rel="stylesheet" href="css/student.css">
</head>
<body>
    <!-- Navbar -->
    <nav class="navbar">
        <div class="nav-brand">Student Portal</div>
        <div class="nav-links">
            <button onclick="window.location.href='/studenthome';"">View Marks Graph</button>
            <button onclick="window.location.href='/studenthome';"">View Attendance Graph</button>
        <button onclick="window.location.href='/Contactus';">Ask Doubts</button>

            <button onclick="location.href='/'" class="nav-button">Logout</button>
        </div>
    </nav>
    <h2>Send an Email</h2>
    <form action="sendemail" method="post">
        <label for="name">Your Name:</label>
        <input type="text" id="name" name="name" required>

        <label for="email">Recipient Email:</label>
        <input type="email" id="email" name="email" required>

        <label for="subject">Subject:</label>
        <input type="text" id="subject" name="subject" required>

        <label for="message">Message:</label>
        <textarea id="message" name="message" rows="5" required></textarea>

        <button type="submit">Send Email</button>
    </form>
</body>
</html>
