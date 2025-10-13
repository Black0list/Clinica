<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div class="modal" id="noteModal">
    <div class="modal-content">
        <div class="modal-header">
            <h3 class="modal-title">Add Medical Note</h3>
            <button class="modal-close" onclick="closeModal('noteModal')">×</button>
        </div>
        <div class="modal-body">
            <form method="post" action="medical-notes/create">
                <div class="form-group">
                    <label class="form-label">Appointment</label>
                    <select name="appointmentId" class="form-select" required>
                        <option value="">Select appointment</option>
                        <c:forEach var="apt" items="${appointments}">
                            <option value="${apt.id}">#${apt.id} - ${apt.patientName} - ${apt.doctorName}</option>
                        </c:forEach>
                    </select>
                </div>
                <div class="form-group">
                    <label class="form-label">Doctor</label>
                    <select name="doctorId" class="form-select" required>
                        <option value="">Select doctor</option>
                        <c:forEach var="doctor" items="${doctors}">
                            <option value="${doctor.id}">${doctor.name}</option>
                        </c:forEach>
                    </select>
                </div>
                <div class="form-group">
                    <label class="form-label">Content</label>
                    <textarea name="content" class="form-textarea" placeholder="Enter medical note content..." style="min-height: 200px;" required></textarea>
                </div>
                <div class="form-group">
                    <label style="display: flex; align-items: center; gap: 8px; cursor: pointer;">
                        <input type="checkbox" name="locked" value="true" style="width: auto;">
                        <span class="form-label" style="margin: 0;">Lock this note (cannot be edited after saving)</span>
                    </label>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" onclick="closeModal('noteModal')">Cancel</button>
                    <button type="submit" class="btn btn-primary">Save Note</button>
                </div>
            </form>
        </div>
    </div>
</div>
