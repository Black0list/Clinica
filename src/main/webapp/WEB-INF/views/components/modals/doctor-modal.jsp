<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div class="modal" id="doctorModal">
    <div class="modal-content">
        <div class="modal-header">
            <h3 class="modal-title">Add New Doctor</h3>
            <button class="modal-close" onclick="closeModal('doctorModal')">×</button>
        </div>
        <div class="modal-body">
            <form class="form-grid" method="post" action="doctors/create">
                <div class="form-group">
                    <label class="form-label">Name</label>
                    <input type="text" name="name" class="form-input" placeholder="Enter full name" required>
                </div>
                <div class="form-group">
                    <label class="form-label">Email</label>
                    <input type="email" name="email" class="form-input" placeholder="doctor@clinica.com" required>
                </div>
                <div class="form-group">
                    <label class="form-label">Phone</label>
                    <input type="tel" name="phone" class="form-input" placeholder="+1 234 567 8900">
                </div>
                <div class="form-group">
                    <label class="form-label">Registration</label>
                    <input type="text" name="registration" class="form-input" placeholder="REG-2024-XXX" required>
                </div>
                <div class="form-group">
                    <label class="form-label">Title</label>
                    <input type="text" name="title" class="form-input" placeholder="e.g., Senior Consultant">
                </div>
                <div class="form-group">
                    <label class="form-label">Speciality</label>
                    <select name="specialityId" class="form-select" required>
                        <option value="">Select speciality</option>
                        <c:forEach var="spec" items="${specialities}">
                            <option value="${spec.id}">${spec.name}</option>
                        </c:forEach>
                    </select>
                </div>
                <div class="form-group">
                    <label class="form-label">Department</label>
                    <select name="departmentId" class="form-select" required>
                        <option value="">Select department</option>
                        <c:forEach var="dept" items="${departments}">
                            <option value="${dept.id}">${dept.name}</option>
                        </c:forEach>
                    </select>
                </div>
                <div class="form-group">
                    <label class="form-label">Password</label>
                    <input type="password" name="password" class="form-input" placeholder="Enter password" required>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" onclick="closeModal('doctorModal')">Cancel</button>
                    <button type="submit" class="btn btn-primary">Save Doctor</button>
                </div>
            </form>
        </div>
    </div>
</div>
