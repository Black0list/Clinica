<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    request.setAttribute("pageTitle", "Doctor Availability - Clinica Admin");
%>
<jsp:include page="./../components/includes/layout-head.jsp" />

<jsp:include page="./../components/includes/header.jsp" />
<jsp:include page="./../components/includes/sidebar.jsp" />

<main class="main-content" id="mainContent">
    <section class="content-section active">
        <div class="section-header">
            <h2 class="section-title">Doctor Availability</h2>
            <div class="section-actions">
                <div class="search-bar">
                    <span class="search-icon">🔍</span>
                    <input type="text" class="search-input" placeholder="Search availability...">
                </div>
                <button class="btn btn-primary" onclick="openModal('availabilityModal')">
                    <span>➕</span>
                    Add Availability
                </button>
            </div>
        </div>

        <div class="table-container">
            <table class="table">
                <thead>
                <tr>
                    <th>ID</th>
                    <th>Doctor</th>
                    <th>Day</th>
                    <th>Start Time</th>
                    <th>End Time</th>
                    <th>Status</th>
                    <th>Actions</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="avail" items="${availabilities}">
                    <tr>
                        <td>${avail.id}</td>
                        <td>${avail.doctorName}</td>
                        <td>${avail.day}</td>
                        <td>${avail.startTime}</td>
                        <td>${avail.endTime}</td>
                        <td>
                            <span class="badge ${avail.status eq 'AVAILABLE' ? 'badge-success' : 'badge-warning'}">
                                    ${avail.status}
                            </span>
                        </td>
                        <td>
                            <div class="action-buttons">
                                <button class="action-btn edit" onclick="editAvailability(${avail.id})">Edit</button>
                                <button class="action-btn delete" onclick="deleteAvailability(${avail.id})">Delete</button>
                            </div>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </section>
</main>

<jsp:include page="./../components/modals/availability-modal.jsp" />
<jsp:include page="./../components/includes/layout-footer.jsp" />
