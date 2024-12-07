<%@ page import="com.klu.prostu.model.Student" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div id="marksModal" class="modal">
    <div class="modal-content">
        <span class="close" onclick="location.href='<c:url value='/Studentmakrsof' />?ssid=${student.studentId}';">&times;</span>
        
        <h2>Academic Performance</h2>
        
        <table class="marks-table" >
            <thead>
                <tr>
                    <th>Subject</th>
                    <th>Marks</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="course" items="${marksList}">
                    <tr>
                        <td>${course[0]}</td> <!-- Course name -->
                        <td>${course[1]}</td> <!-- Marks -->
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
</div>

<style>
    .modal {
        display: block; /* Change to none if not visible by default */
        position: fixed;
        z-index: 9999;
        left: 0;
        top: 0;
        width: 100%;
        height: 100%;
        overflow: auto;
        background-color: rgba(0, 0, 0, 0.5);
        padding-top: 60px;
    }
    
    .modal-content {
        background-color: #fff;
        margin: 5% auto;
        padding: 20px;
        border-radius: 8px;
        width: 80%;
        max-width: 600px;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
    }
    
    .close {
        float: right;
        font-size: 1.5em;
        font-weight: bold;
        color: #333;
        cursor: pointer;
    }
    
    .close:hover {
        color: #ff0000;
    }
    
    .marks-table {
        width: 100%;
        border-collapse: collapse;
        margin-top: 20px;
    }
    
    .marks-table th, .marks-table td {
        border: 1px solid #ddd;
        padding: 8px;
        text-align: left;
    }
    
    .marks-table th {
        background-color: #f4f4f4;
        color: #333;
        font-weight: bold;
    }
    
    .marks-table tr:nth-child(even) {
        background-color: #f9f9f9;
    }
    
    .marks-table tr:hover {
        background-color: #f1f1f1;
    }
</style>
