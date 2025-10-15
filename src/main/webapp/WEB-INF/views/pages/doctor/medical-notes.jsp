<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    request.setAttribute("pageTitle", "Medical Notes - Clinica Admin");
%>
<jsp:include page="../../components/includes/layout-head.jsp" />

<jsp:include page="../../components/includes/header.jsp" />
<jsp:include page="../../components/includes/sidebar.jsp" />

<main class="main-content" id="mainContent">
    <section class="content-section active">
        <div class="section-header">
            <h2 class="section-title">Medical Notes</h2>
            <div class="section-actions">
                <div class="search-bar">
                    <span class="search-icon">🔍</span>
                    <input type="text" class="search-input" placeholder="Search notes...">
                </div>
                <button class="btn btn-primary" onclick="openModal('noteModal')">
                    <span>➕</span>
                    Add Note
                </button>
            </div>
        </div>

        <div class="table-container">
            <table class="table">
                <thead>
                <tr>
                    <th>ID</th>
                    <th>Appointment</th>
                    <th>Doctor</th>
                    <th>Content Preview</th>
                    <th>Status</th>
                    <th>Actions</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="note" items="${medicalNotes}">
                    <tr>
                        <td>${note.id}</td>
                        <td>#${note.appointmentId} - ${note.patientName}</td>
                        <td>${note.doctorName}</td>
                        <td>${note.contentPreview}</td>
                        <td>
                            <span class="badge ${note.locked ? 'badge-danger' : 'badge-success'}">
                                    ${note.locked ? 'Locked' : 'Unlocked'}
                            </span>
                        </td>
                        <td>
                            <div class="action-buttons">
                                <button class="action-btn edit" onclick="viewNote(${note.id})">View</button>
                                <c:if test="${!note.locked}">
                                    <button class="action-btn delete" onclick="deleteNote(${note.id})">Delete</button>
                                </c:if>
                            </div>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </section>
</main>

<jsp:include page="../../components/modals/note-modal.jsp" />
<jsp:include page="../../components/includes/layout-footer.jsp" />
