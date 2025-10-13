<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    request.setAttribute("pageTitle", "Appointments Management - Clinica Admin");
%>
<jsp:include page="./../components/includes/layout-head.jsp" />

<jsp:include page="./../components/includes/header.jsp" />
<jsp:include page="./../components/includes/sidebar.jsp" />

<main class="main-content" id="mainContent">
    <section class="content-section active">
        <div class="section-header">
            <h2 class="section-title">Appointments Management</h2>
            <div class="section-actions">
                <div class="search-bar">
                    <span class="search-icon">🔍</span>
                    <input type="text" class="search-input" placeholder="Search appointments...">
                </div>
                <button class="btn btn-primary" onclick="openModal('appointmentModal')">
                    <span>➕</span>
                    New Appointment
                </button>
            </div>
        </div>

        <div class="table-container">
            <table class="table">
                <thead>
                <tr>
                    <th>ID</th>
                    <th>Patient</th>
                    <th>Doctor</th>
                    <th>Start Time</th>
                    <th>End Time</th>
                    <th>Type</th>
                    <th>Status</th>
                    <th>Actions</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="apt" items="${appointments}">
                    <tr>
                        <td>${apt.id}</td>
                        <td>${apt.patientName}</td>
                        <td>${apt.doctorName}</td>
                        <td>${apt.startTime}</td>
                        <td>${apt.endTime}</td>
                        <td><span class="badge badge-info">${apt.type}</span></td>
                        <td>
                            <span class="badge ${apt.status eq 'COMPLETED' ? 'badge-success' : 'badge-warning'}">
                                    ${apt.status}
                            </span>
                        </td>
                        <td>
                            <div class="action-buttons">
                                <button class="action-btn edit" onclick="editAppointment(${apt.id})">Edit</button>
                                <button class="action-btn delete" onclick="cancelAppointment(${apt.id})">Cancel</button>
                            </div>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </section>
</main>

<jsp:include page="./../components/modals/appointment-modal.jsp" />
<jsp:include page="./../components/includes/layout-footer.jsp" />
