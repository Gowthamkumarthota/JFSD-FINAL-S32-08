<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    // Get form parameters
    String queryType = request.getParameter("queryType");
    String subject = request.getParameter("subject");
    String description = request.getParameter("description");

    // Here you would typically save these details to a database
    // For now, we'll just redirect back to the dashboard
    response.sendRedirect("studentHome.jsp");
%>