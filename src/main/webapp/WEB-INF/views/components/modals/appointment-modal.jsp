<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div class="modal" id="appointmentModal">
    <div class="modal-content">
        <div class="modal-header">
            <h3 class="modal-title">Create New Appointment</h3>
            <button class="modal-close" onclick="closeModal('appointmentModal')">×</button>
        </div>
        <div class="modal-body">
            <form class="form-grid" method="post" action="appointments/create">
                <div class="form-group">
                    <label class="form-label">Patient</label>
                    <select name="patientId" class="form-select" required>
                        <option value="">Select patient</option>
                        <c:forEach var="patient" items="${patients}">
                            <option value="${patient.id}">${patient.name}</option>
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
                    <label class="form-label">Start Date & Time</label>
                    <input type="datetime-local" name="startTime" class="form-input" required>
                </div>
                <div class="form-group">
                    <label class="form-label">End Date & Time</label>
                    <input type="datetime-local" name="endTime" class="form-input" required>
                </div>
                <div class="form-group">
                    <label class="form-label">Type</label>
                    <select name="type" class="form-select" required>
                        <option value="">Select type</option>
                        <option value="CONSULTATION">Consultation</option>
                        <option value="FOLLOW_UP">Follow-up</option>
                        <option value="EMERGENCY">Emergency</option>
                        <option value="SURGERY">Surgery</option>
                    </select>
                </div>
                <div class="form-group">
                    <label class="form-label">Status</label>
                    <select name="status" class="form-select" required>
                        <option value="SCHEDULED">Scheduled</option>
                        <option value="CONFIRMED">Confirmed</option>
                        <option value="IN_PROGRESS">In Progress</option>
                        <option value="COMPLETED">Completed</option>
                        <option value="CANCELLED">Cancelled</option>
                    </select>
                </div>
                <div class="form-group full-width">
                    <label class="form-label">Executor</label>
                    <input type="text" name="executor" class="form-input" placeholder="Enter executor name">
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" onclick="closeModal('appointmentModal')">Cancel</button>
                    <button type="submit" class="btn btn-primary">Create Appointment</button>
                </div>
            </form>
        </div>
    </div>
</div>
