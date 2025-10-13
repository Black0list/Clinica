<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div class="modal" id="patientModal">
    <div class="modal-content">
        <div class="modal-header">
            <h3 class="modal-title">Add New Patient</h3>
            <button class="modal-close" onclick="closeModal('patientModal')">×</button>
        </div>
        <div class="modal-body">
            <form class="form-grid" method="post" action="patients/create">
                <div class="form-group">
                    <label class="form-label">Name</label>
                    <input type="text" name="name" class="form-input" placeholder="Enter full name" required>
                </div>
                <div class="form-group">
                    <label class="form-label">Email</label>
                    <input type="email" name="email" class="form-input" placeholder="patient@email.com" required>
                </div>
                <div class="form-group">
                    <label class="form-label">Phone</label>
                    <input type="tel" name="phone" class="form-input" placeholder="+1 234 567 8900">
                </div>
                <div class="form-group">
                    <label class="form-label">CIN</label>
                    <input type="text" name="cin" class="form-input" placeholder="AB123456" required>
                </div>
                <div class="form-group">
                    <label class="form-label">Birth Date</label>
                    <input type="date" name="dateOfBirth" class="form-input" required>
                </div>
                <div class="form-group">
                    <label class="form-label">Sex</label>
                    <select name="gender" class="form-select" required>
                        <option value="">Select sex</option>
                        <option value="male">Male</option>
                        <option value="female">Female</option>
                    </select>
                </div>
                <div class="form-group">
                    <label class="form-label">Blood Type</label>
                    <select class="form-select" name="blood" required>
                        <option value="">Select blood type</option>
                        <c:forEach var="type" items="${bloodTypes}">
                            <option value="${type}">${type}</option>
                        </c:forEach>
                    </select>
                </div>
                <div class="form-group">
                    <label class="form-label">Password</label>
                    <input type="password" name="password" class="form-input" placeholder="Enter password" required>
                </div>
                <div class="form-group full-width">
                    <label class="form-label">Address</label>
                    <textarea class="form-textarea" name="address" placeholder="Enter full address"></textarea>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" onclick="closeModal('patientModal')">Cancel</button>
                    <button type="submit" class="btn btn-primary">Save Patient</button>
                </div>
            </form>
        </div>
    </div>
</div>
