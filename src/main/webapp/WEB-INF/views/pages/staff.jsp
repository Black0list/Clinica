<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    request.setAttribute("pageTitle", "Staff Management - Clinica Admin");
%>
<jsp:include page="./../components/includes/layout-head.jsp" />

<jsp:include page="./../components/includes/header.jsp" />
<jsp:include page="./../components/includes/sidebar.jsp" />

<main class="main-content" id="mainContent">
    <section class="content-section active">
        <div class="section-header">
            <h2 class="section-title">Staff Management</h2>
            <div class="section-actions">
                <div class="search-bar">
                    <span class="search-icon">🔍</span>
                    <input type="text" class="search-input" placeholder="Search staff...">
                </div>
                <button class="btn btn-primary" onclick="openModal('staffModal')">
                    <span>➕</span>
                    Add Staff
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
                    <th>Phone</th>
                    <th>Position</th>
                    <th>Status</th>
                    <th>Actions</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="staff" items="${staffList}">
                    <tr>
                        <td>${staff.id}</td>
                        <td>${staff.name}</td>
                        <td>${staff.email}</td>
                        <td>${staff.phone}</td>
                        <td>${staff.position}</td>
                        <td>
                            <span class="badge ${staff.active ? 'badge-success' : 'badge-secondary'}">
                                    ${staff.active ? 'Active' : 'Inactive'}
                            </span>
                        </td>
                        <td>
                            <div class="action-buttons">
                                <button class="action-btn edit" onclick="editStaff(${staff.id})">Edit</button>
                                <button class="action-btn delete" onclick="deleteStaff(${staff.id})">Delete</button>
                            </div>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </section>
</main>

<jsp:include page="./../components/modals/staff-modal.jsp" />
<jsp:include page="./../components/includes/layout-footer.jsp" />
