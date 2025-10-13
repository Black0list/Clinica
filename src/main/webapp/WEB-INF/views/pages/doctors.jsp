<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    request.setAttribute("pageTitle", "Doctors Management - Clinica Admin");
%>
<jsp:include page="./../components/includes/layout-head.jsp" />

<jsp:include page="./../components/includes/header.jsp" />
<jsp:include page="./../components/includes/sidebar.jsp" />

<main class="main-content" id="mainContent">
    <section class="content-section active">
        <div class="section-header">
            <h2 class="section-title">Doctors Management</h2>
            <div class="section-actions">
                <div class="search-bar">
                    <span class="search-icon">🔍</span>
                    <input type="text" class="search-input" placeholder="Search doctors...">
                </div>
                <button class="btn btn-primary" onclick="openModal('doctorModal')">
                    <span>➕</span>
                    Add Doctor
                </button>
            </div>
        </div>

        <div class="table-container">
            <table class="table">
                <thead>
                <tr>
                    <th>ID</th>
                    <th>Name</th>
                    <th>Email</th>
                    <th>Registration</th>
                    <th>Title</th>
                    <th>Speciality</th>
                    <th>Department</th>
                    <th>Status</th>
                    <th>Actions</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="doctor" items="${doctors}">
                    <tr>
                        <td>${doctor.id}</td>
                        <td>${doctor.name}</td>
                        <td>${doctor.email}</td>
                        <td>${doctor.registration}</td>
                        <td>${doctor.title}</td>
                        <td>${doctor.speciality}</td>
                        <td>${doctor.department}</td>
                        <td>
                            <span class="badge ${doctor.active ? 'badge-success' : 'badge-secondary'}">
                                    ${doctor.active ? 'Active' : 'Inactive'}
                            </span>
                        </td>
                        <td>
                            <div class="action-buttons">
                                <button class="action-btn edit" onclick="editDoctor(${doctor.id})">Edit</button>
                                <button class="action-btn delete" onclick="deleteDoctor(${doctor.id})">Delete</button>
                            </div>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </section>
</main>

<jsp:include page="./../components/modals/doctor-modal.jsp" />
<jsp:include page="./../components/includes/layout-footer.jsp" />
