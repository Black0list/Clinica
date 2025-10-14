<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- Modal Overlay -->
<div id="doctorModal" class="hidden fixed inset-0 z-50 overflow-y-auto" aria-labelledby="modal-title" role="dialog" aria-modal="true">
    <!-- Background overlay -->
    <div class="flex items-center justify-center min-h-screen px-4 pt-4 pb-20 text-center sm:block sm:p-0">
        <div class="fixed inset-0 bg-gray-500 bg-opacity-75 dark:bg-gray-900 dark:bg-opacity-80 transition-opacity" aria-hidden="true" onclick="closeDoctorModal()"></div>

        <!-- Center modal -->
        <span class="hidden sm:inline-block sm:align-middle sm:h-screen" aria-hidden="true">&#8203;</span>

        <!-- Modal panel -->
        <div class="inline-block align-bottom bg-white dark:bg-gray-800 rounded-lg text-left overflow-hidden shadow-xl transform transition-all sm:my-8 sm:align-middle sm:max-w-3xl sm:w-full">
            <!-- Modal Header -->
            <div class="bg-gradient-to-r from-green-600 to-green-700 px-6 py-4">
                <div class="flex items-center justify-between">
                    <div class="flex items-center gap-3">
                        <div class="w-10 h-10 bg-white/20 rounded-lg flex items-center justify-center">
                            <i class="fas fa-user-md text-white text-xl"></i>
                        </div>
                        <h3 class="text-xl font-semibold text-white" id="doctorModalTitle">
                            Add New Doctor
                        </h3>
                    </div>
                    <button type="button" onclick="closeDoctorModal()" class="text-white/80 hover:text-white focus:outline-none">
                        <i class="fas fa-times text-xl"></i>
                    </button>
                </div>
            </div>

            <!-- Modal Body -->
            <form id="doctorForm" method="post" action="doctors/create">
                <input type="hidden" id="doctorId" name="id">
                <input type="hidden" id="doctorFormMethod" name="_method" value="">

                <div class="bg-white dark:bg-gray-800 px-6 py-6 max-h-[calc(100vh-300px)] overflow-y-auto">
                    <div class="grid grid-cols-1 md:grid-cols-2 gap-5">
                        <!-- Name Field -->
                        <div class="md:col-span-2">
                            <label for="doctorName" class="block text-sm font-medium text-gray-700 dark:text-gray-300 mb-2">
                                Full Name <span class="text-red-500">*</span>
                            </label>
                            <div class="relative">
                                <div class="absolute inset-y-0 left-0 pl-3 flex items-center pointer-events-none">
                                    <i class="fas fa-user text-gray-400"></i>
                                </div>
                                <input type="text"
                                       id="doctorName"
                                       name="name"
                                       class="block w-full pl-10 pr-3 py-2.5 border border-gray-300 dark:border-gray-600 rounded-lg bg-white dark:bg-gray-700 text-gray-900 dark:text-white placeholder-gray-400 focus:ring-2 focus:ring-green-500 focus:border-green-500"
                                       placeholder="Dr. John Doe"
                                       required>
                            </div>
                        </div>

                        <!-- Email Field -->
                        <div>
                            <label for="doctorEmail" class="block text-sm font-medium text-gray-700 dark:text-gray-300 mb-2">
                                Email Address <span class="text-red-500">*</span>
                            </label>
                            <div class="relative">
                                <div class="absolute inset-y-0 left-0 pl-3 flex items-center pointer-events-none">
                                    <i class="fas fa-envelope text-gray-400"></i>
                                </div>
                                <input type="email"
                                       id="doctorEmail"
                                       name="email"
                                       class="block w-full pl-10 pr-3 py-2.5 border border-gray-300 dark:border-gray-600 rounded-lg bg-white dark:bg-gray-700 text-gray-900 dark:text-white placeholder-gray-400 focus:ring-2 focus:ring-green-500 focus:border-green-500"
                                       placeholder="doctor@clinic.com"
                                       required>
                            </div>
                        </div>

                        <!-- Phone Field -->
                        <div>
                            <label for="doctorPhone" class="block text-sm font-medium text-gray-700 dark:text-gray-300 mb-2">
                                Phone Number
                            </label>
                            <div class="relative">
                                <div class="absolute inset-y-0 left-0 pl-3 flex items-center pointer-events-none">
                                    <i class="fas fa-phone text-gray-400"></i>
                                </div>
                                <input type="tel"
                                       id="doctorPhone"
                                       name="phone"
                                       class="block w-full pl-10 pr-3 py-2.5 border border-gray-300 dark:border-gray-600 rounded-lg bg-white dark:bg-gray-700 text-gray-900 dark:text-white placeholder-gray-400 focus:ring-2 focus:ring-green-500 focus:border-green-500"
                                       placeholder="+1 234 567 8900">
                            </div>
                        </div>

                        <!-- Registration Field -->
                        <div>
                            <label for="doctorRegistration" class="block text-sm font-medium text-gray-700 dark:text-gray-300 mb-2">
                                Registration Number <span class="text-red-500">*</span>
                            </label>
                            <div class="relative">
                                <div class="absolute inset-y-0 left-0 pl-3 flex items-center pointer-events-none">
                                    <i class="fas fa-id-card text-gray-400"></i>
                                </div>
                                <input type="text"
                                       id="doctorRegistration"
                                       name="registration"
                                       class="block w-full pl-10 pr-3 py-2.5 border border-gray-300 dark:border-gray-600 rounded-lg bg-white dark:bg-gray-700 text-gray-900 dark:text-white placeholder-gray-400 focus:ring-2 focus:ring-green-500 focus:border-green-500"
                                       placeholder="REG-2024-XXX"
                                       required>
                            </div>
                        </div>

                        <!-- Title Field -->
                        <div>
                            <label for="doctorTitle" class="block text-sm font-medium text-gray-700 dark:text-gray-300 mb-2">
                                Professional Title
                            </label>
                            <div class="relative">
                                <div class="absolute inset-y-0 left-0 pl-3 flex items-center pointer-events-none">
                                    <i class="fas fa-award text-gray-400"></i>
                                </div>
                                <input type="text"
                                       id="doctorTitle"
                                       name="title"
                                       class="block w-full pl-10 pr-3 py-2.5 border border-gray-300 dark:border-gray-600 rounded-lg bg-white dark:bg-gray-700 text-gray-900 dark:text-white placeholder-gray-400 focus:ring-2 focus:ring-green-500 focus:border-green-500"
                                       placeholder="e.g., Senior Consultant">
                            </div>
                        </div>

                        <!-- Speciality Field -->
                        <div>
                            <label for="doctorSpeciality" class="block text-sm font-medium text-gray-700 dark:text-gray-300 mb-2">
                                Speciality <span class="text-red-500">*</span>
                            </label>
                            <div class="relative">
                                <div class="absolute inset-y-0 left-0 pl-3 flex items-center pointer-events-none">
                                    <i class="fas fa-stethoscope text-gray-400"></i>
                                </div>
                                <select id="doctorSpeciality"
                                        name="specialityName"
                                        class="block w-full pl-10 pr-3 py-2.5 border border-gray-300 dark:border-gray-600 rounded-lg bg-white dark:bg-gray-700 text-gray-900 dark:text-white focus:ring-2 focus:ring-green-500 focus:border-green-500"
                                        required>
                                    <option value="">Select speciality</option>
                                    <c:forEach var="spec" items="${specialities}">
                                        <option value="${spec.name}">${spec.name}</option>
                                    </c:forEach>
                                </select>
                            </div>
                        </div>

                        <!-- Password Field -->
                        <div id="passwordField" class="md:col-span-2">
                            <label for="doctorPassword" class="block text-sm font-medium text-gray-700 dark:text-gray-300 mb-2">
                                Password <span class="text-red-500" id="passwordRequired">*</span>
                            </label>
                            <div class="relative">
                                <div class="absolute inset-y-0 left-0 pl-3 flex items-center pointer-events-none">
                                    <i class="fas fa-lock text-gray-400"></i>
                                </div>
                                <input type="password"
                                       id="doctorPassword"
                                       name="password"
                                       class="block w-full pl-10 pr-12 py-2.5 border border-gray-300 dark:border-gray-600 rounded-lg bg-white dark:bg-gray-700 text-gray-900 dark:text-white placeholder-gray-400 focus:ring-2 focus:ring-green-500 focus:border-green-500"
                                       placeholder="Enter secure password">
                                <button type="button" onclick="togglePassword()" class="absolute inset-y-0 right-0 pr-3 flex items-center">
                                    <i class="fas fa-eye text-gray-400 hover:text-gray-600 dark:hover:text-gray-300" id="togglePasswordIcon"></i>
                                </button>
                            </div>
                            <p class="mt-1 text-xs text-gray-500 dark:text-gray-400" id="passwordHint">
                                Minimum 8 characters, include uppercase, lowercase, and numbers
                            </p>
                        </div>

                        <!-- Active Status (only for editing) -->
                        <div id="statusField" class="hidden md:col-span-2">
                            <label class="flex items-center gap-2 cursor-pointer">
                                <input type="checkbox"
                                       id="doctorActive"
                                       name="active"
                                       value="true"
                                       checked
                                       class="w-4 h-4 text-green-600 bg-gray-100 border-gray-300 rounded focus:ring-green-500 dark:focus:ring-green-600 dark:ring-offset-gray-800 focus:ring-2 dark:bg-gray-700 dark:border-gray-600">
                                <span class="text-sm font-medium text-gray-700 dark:text-gray-300">
                                    Active Status
                                </span>
                            </label>
                            <p class="mt-1 ml-6 text-xs text-gray-500 dark:text-gray-400">
                                Inactive doctors cannot log in or be assigned appointments
                            </p>
                        </div>
                    </div>
                </div>

                <!-- Modal Footer -->
                <div class="bg-gray-50 dark:bg-gray-900 px-6 py-4 flex items-center justify-end gap-3">
                    <button type="button"
                            onclick="closeDoctorModal()"
                            class="px-4 py-2 text-sm font-medium text-gray-700 dark:text-gray-300 bg-white dark:bg-gray-800 border border-gray-300 dark:border-gray-600 rounded-lg hover:bg-gray-50 dark:hover:bg-gray-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-green-500 transition-colors">
                        <i class="fas fa-times mr-2"></i>
                        Cancel
                    </button>
                    <button type="submit"
                            class="inline-flex items-center gap-2 px-4 py-2 text-sm font-medium text-white bg-green-600 hover:bg-green-700 rounded-lg focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-green-500 transition-colors">
                        <i class="fas fa-save"></i>
                        <span id="doctorSubmitButtonText">Save Doctor</span>
                    </button>
                </div>
            </form>
        </div>
    </div>
</div>

<script>
    // Open modal for creating new doctor
    function openDoctorModal() {
        const modal = document.getElementById('doctorModal');
        const form = document.getElementById('doctorForm');
        const modalTitle = document.getElementById('doctorModalTitle');
        const submitButtonText = document.getElementById('doctorSubmitButtonText');
        const passwordField = document.getElementById('passwordField');
        const statusField = document.getElementById('statusField');
        const passwordInput = document.getElementById('doctorPassword');
        const passwordRequired = document.getElementById('passwordRequired');
        const passwordHint = document.getElementById('passwordHint');

        // Reset form
        form.reset();
        document.getElementById('doctorId').value = '';
        document.getElementById('doctorFormMethod').value = '';

        // Set form action for creation
        form.action = 'doctors/create';

        // Update modal title and button
        modalTitle.textContent = 'Add New Doctor';
        submitButtonText.textContent = 'Save Doctor';

        // Show password field, hide status field
        passwordField.classList.remove('hidden');
        statusField.classList.add('hidden');
        passwordInput.required = true;
        passwordRequired.style.display = 'inline';
        passwordHint.textContent = 'Minimum 8 characters, include uppercase, lowercase, and numbers';

        // Show modal
        modal.classList.remove('hidden');
        document.body.style.overflow = 'hidden';
    }

    // Open modal for editing doctor
    function editDoctor(id) {
        const modal = document.getElementById('doctorModal');
        const form = document.getElementById('doctorForm');
        const modalTitle = document.getElementById('doctorModalTitle');
        const submitButtonText = document.getElementById('doctorSubmitButtonText');
        const passwordField = document.getElementById('passwordField');
        const statusField = document.getElementById('statusField');
        const passwordInput = document.getElementById('doctorPassword');
        const passwordRequired = document.getElementById('passwordRequired');
        const passwordHint = document.getElementById('passwordHint');

        // Fetch doctor data
        fetch(`/doctors/`+id)
            .then(response => response.json())
            .then(data => {
                console.log(data)
                // Populate form fields
                document.getElementById('doctorId').value = data.id;
                document.getElementById('doctorName').value = data.name;
                document.getElementById('doctorEmail').value = data.email;
                document.getElementById('doctorPhone').value = data.phone || '';
                document.getElementById('doctorRegistration').value = data.registration;
                document.getElementById('doctorTitle').value = data.title || '';
                document.getElementById('doctorSpeciality').value = data.specialityName;
                document.getElementById('doctorActive').checked = data.active;

                // Set form action for update
                form.action = '/doctors/update';
                document.getElementById('doctorFormMethod').value = 'PUT';

                // Update modal title and button
                modalTitle.textContent = 'Edit Doctor';
                submitButtonText.textContent = 'Update Doctor';

                // Make password optional for editing
                passwordField.classList.remove('hidden');
                statusField.classList.remove('hidden');
                passwordInput.required = false;
                passwordRequired.style.display = 'none';
                passwordHint.textContent = 'Leave blank to keep current password';

                // Show modal
                modal.classList.remove('hidden');
                document.body.style.overflow = 'hidden';
            })
            .catch(error => {
                console.error('Error loading doctor:', error);
                alert('Failed to load doctor data');
            });
    }

    // Close modal
    function closeDoctorModal() {
        const modal = document.getElementById('doctorModal');
        modal.classList.add('hidden');
        document.body.style.overflow = 'auto';

        // Reset form
        document.getElementById('doctorForm').reset();
    }

    // Delete doctor
    function deleteDoctor(id) {
        if (confirm('Are you sure you want to delete this doctor? This action cannot be undone.')) {
            fetch(`/doctors/delete/`+id, {
                method: 'GET'
            })
                .then(response => {
                    if (response.ok) {
                        alert('Doctor deleted successfully');
                        window.location.reload();
                    } else {
                        throw new Error('Failed to delete doctor');
                    }
                })
                .catch(error => {
                    console.error('Error:', error);
                    alert('Failed to delete doctor');
                });
        }
    }

    // View doctor details
    function viewDoctor(id) {
        window.location.href = `doctors/${id}`;
    }

    // Toggle password visibility
    function togglePassword() {
        const passwordInput = document.getElementById('doctorPassword');
        const toggleIcon = document.getElementById('togglePasswordIcon');

        if (passwordInput.type === 'password') {
            passwordInput.type = 'text';
            toggleIcon.classList.remove('fa-eye');
            toggleIcon.classList.add('fa-eye-slash');
        } else {
            passwordInput.type = 'password';
            toggleIcon.classList.remove('fa-eye-slash');
            toggleIcon.classList.add('fa-eye');
        }
    }

    // Close modal when pressing Escape key
    document.addEventListener('keydown', function(event) {
        if (event.key === 'Escape') {
            const modal = document.getElementById('doctorModal');
            if (!modal.classList.contains('hidden')) {
                closeDoctorModal();
            }
        }
    });

    // Form validation
    document.getElementById('doctorForm')?.addEventListener('submit', function(e) {
        const password = document.getElementById('doctorPassword').value;
        const isEdit = document.getElementById('doctorId').value !== '';

        // Only validate password if it's filled (required for new, optional for edit)
        if (password && password.length < 8) {
            e.preventDefault();
            alert('Password must be at least 8 characters long');
            return false;
        }
    });
    </script>