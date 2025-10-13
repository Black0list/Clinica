<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div class="modal" id="availabilityModal">
    <div class="modal-content">
        <div class="modal-header">
            <h3 class="modal-title">Add Doctor Availability</h3>
            <button class="modal-close" onclick="closeModal('availabilityModal')">×</button>
        </div>
        <div class="modal-body">
            <form class="form-grid" method="post" action="availability/create">
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
                    <label class="form-label">Day</label>
                    <input type="date" name="day" class="form-input" required>
                </div>
                <div class="form-group">
                    <label class="form-label">Start Time</label>
                    <input type="time" name="startTime" class="form-input" required>
                </div>
                <div class="form-group">
                    <label class="form-label">End Time</label>
                    <input type="time" name="endTime" class="form-input" required>
                </div>
                <div class="form-group full-width">
                    <label class="form-label">Status</label>
                    <select name="status" class="form-select" required>
                        <option value="AVAILABLE">Available</option>
                        <option value="BUSY">Busy</option>
                        <option value="OFF_DUTY">Off Duty</option>
                    </select>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" onclick="closeModal('availabilityModal')">Cancel</button>
                    <button type="submit" class="btn btn-primary">Save Availability</button>
                </div>
            </form>
        </div>
    </div>
</div>
