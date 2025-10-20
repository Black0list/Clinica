<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- Modal Overlay -->
<div id="patientModal" class="hidden fixed inset-0 z-50 overflow-y-auto" aria-labelledby="modal-title" role="dialog" aria-modal="true">
    <div class="flex items-center justify-center min-h-screen px-4 pt-4 pb-20 text-center sm:block sm:p-0">

        <!-- Background overlay -->
        <div class="fixed inset-0 bg-gray-500 bg-opacity-75 dark:bg-gray-900 dark:bg-opacity-80 transition-opacity" aria-hidden="true" onclick="closePatientModal()"></div>

        <!-- Centering hack -->
        <span class="hidden sm:inline-block sm:align-middle sm:h-screen" aria-hidden="true">&#8203;</span>

        <!-- Modal panel -->
        <div class="inline-block align-bottom bg-white dark:bg-gray-800 rounded-lg text-left overflow-hidden shadow-xl transform transition-all sm:my-8 sm:align-middle sm:max-w-3xl sm:w-full">
            <!-- Header -->
            <div class="bg-gradient-to-r from-blue-600 to-blue-700 px-6 py-4">
                <div class="flex items-center justify-between">
                    <div class="flex items-center gap-3">
                        <div class="w-10 h-10 bg-white/20 rounded-lg flex items-center justify-center">
                            <i class="fas fa-user text-white text-xl"></i>
                        </div>
                        <h3 class="text-xl font-semibold text-white" id="patientModalTitle">Add New Patient</h3>
                    </div>
                    <button type="button" onclick="closePatientModal()" class="text-white/80 hover:text-white focus:outline-none">
                        <i class="fas fa-times text-xl"></i>
                    </button>
                </div>
            </div>

            <!-- Body -->
            <form id="patientForm" method="post" action="patients/create">
                <input type="hidden" id="patientId" name="id">
                <input type="hidden" id="patientFormMethod" name="_method" value="">

                <div class="bg-white dark:bg-gray-800 px-6 py-6 max-h-[calc(100vh-300px)] overflow-y-auto">
                    <div class="grid grid-cols-1 md:grid-cols-2 gap-5">

                        <!-- Name -->
                        <div class="md:col-span-2">
                            <label for="patientName" class="block text-sm font-medium text-gray-700 dark:text-gray-300 mb-2">
                                Full Name <span class="text-red-500">*</span>
                            </label>
                            <div class="relative">
                                <div class="absolute inset-y-0 left-0 pl-3 flex items-center pointer-events-none">
                                    <i class="fas fa-user text-gray-400"></i>
                                </div>
                                <input type="text" id="patientName" name="name" class="block w-full pl-10 pr-3 py-2.5 border border-gray-300 dark:border-gray-600 rounded-lg bg-white dark:bg-gray-700 text-gray-900 dark:text-white placeholder-gray-400 focus:ring-2 focus:ring-blue-500 focus:border-blue-500" placeholder="John Doe" required>
                            </div>
                        </div>

                        <!-- Email -->
                        <div>
                            <label for="patientEmail" class="block text-sm font-medium text-gray-700 dark:text-gray-300 mb-2">
                                Email Address <span class="text-red-500">*</span>
                            </label>
                            <div class="relative">
                                <div class="absolute inset-y-0 left-0 pl-3 flex items-center pointer-events-none">
                                    <i class="fas fa-envelope text-gray-400"></i>
                                </div>
                                <input type="email" id="patientEmail" name="email" class="block w-full pl-10 pr-3 py-2.5 border border-gray-300 dark:border-gray-600 rounded-lg bg-white dark:bg-gray-700 text-gray-900 dark:text-white placeholder-gray-400 focus:ring-2 focus:ring-blue-500 focus:border-blue-500" placeholder="patient@mail.com" required>
                            </div>
                        </div>

                        <!-- Phone -->
                        <div>
                            <label for="patientPhone" class="block text-sm font-medium text-gray-700 dark:text-gray-300 mb-2">Phone Number</label>
                            <div class="relative">
                                <div class="absolute inset-y-0 left-0 pl-3 flex items-center pointer-events-none">
                                    <i class="fas fa-phone text-gray-400"></i>
                                </div>
                                <input type="tel" id="patientPhone" name="phone" class="block w-full pl-10 pr-3 py-2.5 border border-gray-300 dark:border-gray-600 rounded-lg bg-white dark:bg-gray-700 text-gray-900 dark:text-white placeholder-gray-400 focus:ring-2 focus:ring-blue-500 focus:border-blue-500" placeholder="+212 600 000 000">
                            </div>
                        </div>

                        <!-- CIN -->
                        <div>
                            <label for="patientCIN" class="block text-sm font-medium text-gray-700 dark:text-gray-300 mb-2">CIN <span class="text-red-500">*</span></label>
                            <div class="relative">
                                <div class="absolute inset-y-0 left-0 pl-3 flex items-center pointer-events-none">
                                    <i class="fas fa-id-card text-gray-400"></i>
                                </div>
                                <input type="text" id="patientCIN" name="cin" class="block w-full pl-10 pr-3 py-2.5 border border-gray-300 dark:border-gray-600 rounded-lg bg-white dark:bg-gray-700 text-gray-900 dark:text-white placeholder-gray-400 focus:ring-2 focus:ring-blue-500 focus:border-blue-500" placeholder="AB123456" required>
                            </div>
                        </div>

                        <!-- Birth Date -->
                        <div>
                            <label for="patientBirthDate" class="block text-sm font-medium text-gray-700 dark:text-gray-300 mb-2">Birth Date <span class="text-red-500">*</span></label>
                            <input type="date" id="patientBirthDate" name="dateOfBirth" class="block w-full px-3 py-2.5 border border-gray-300 dark:border-gray-600 rounded-lg bg-white dark:bg-gray-700 text-gray-900 dark:text-white focus:ring-2 focus:ring-blue-500 focus:border-blue-500" required>
                        </div>

                        <!-- Gender -->
                        <div>
                            <label for="patientGender" class="block text-sm font-medium text-gray-700 dark:text-gray-300 mb-2">Sex <span class="text-red-500">*</span></label>
                            <select id="patientGender" name="gender" class="block w-full px-3 py-2.5 border border-gray-300 dark:border-gray-600 rounded-lg bg-white dark:bg-gray-700 text-gray-900 dark:text-white focus:ring-2 focus:ring-blue-500 focus:border-blue-500" required>
                                <option value="">Select sex</option>
                                <option value="MALE">Male</option>
                                <option value="FEMALE">Female</option>
                            </select>
                        </div>

                        <!-- Blood Type -->
                        <div>
                            <label for="patientBlood" class="block text-sm font-medium text-gray-700 dark:text-gray-300 mb-2">Blood Type <span class="text-red-500">*</span></label>
                            <select id="patientBlood" name="blood" class="block w-full px-3 py-2.5 border border-gray-300 dark:border-gray-600 rounded-lg bg-white dark:bg-gray-700 text-gray-900 dark:text-white focus:ring-2 focus:ring-blue-500 focus:border-blue-500" required>
                                <option value="">Select blood type</option>
                                <c:forEach var="type" items="${bloodTypes}">
                                    <option value="${type}">${type}</option>
                                </c:forEach>
                            </select>
                        </div>

                        <!-- Password -->
                        <div id="patientPasswordField" class="md:col-span-2">
                            <label for="patientPassword" class="block text-sm font-medium text-gray-700 dark:text-gray-300 mb-2">
                                Password <span class="text-red-500" id="patientPasswordRequired">*</span>
                            </label>
                            <div class="relative">
                                <div class="absolute inset-y-0 left-0 pl-3 flex items-center pointer-events-none">
                                    <i class="fas fa-lock text-gray-400"></i>
                                </div>
                                <input type="password" id="patientPassword" name="password" class="block w-full pl-10 pr-12 py-2.5 border border-gray-300 dark:border-gray-600 rounded-lg bg-white dark:bg-gray-700 text-gray-900 dark:text-white placeholder-gray-400 focus:ring-2 focus:ring-blue-500 focus:border-blue-500" placeholder="Enter secure password">
                                <button type="button" onclick="togglePatientPassword()" class="absolute inset-y-0 right-0 pr-3 flex items-center">
                                    <i class="fas fa-eye text-gray-400 hover:text-gray-600 dark:hover:text-gray-300" id="togglePatientPasswordIcon"></i>
                                </button>
                            </div>
                            <p class="mt-1 text-xs text-gray-500 dark:text-gray-400" id="patientPasswordHint">
                                Minimum 8 characters, include uppercase, lowercase, and numbers
                            </p>
                        </div>

                        <!-- Address -->
                        <div class="md:col-span-2">
                            <label for="patientAddress" class="block text-sm font-medium text-gray-700 dark:text-gray-300 mb-2">Address</label>
                            <textarea id="patientAddress" name="address" class="block w-full px-3 py-2.5 border border-gray-300 dark:border-gray-600 rounded-lg bg-white dark:bg-gray-700 text-gray-900 dark:text-white placeholder-gray-400 focus:ring-2 focus:ring-blue-500 focus:border-blue-500" rows="3" placeholder="Enter full address"></textarea>
                        </div>

                    </div>
                </div>

                <!-- Footer -->
                <div class="bg-gray-50 dark:bg-gray-900 px-6 py-4 flex items-center justify-end gap-3">
                    <button type="button" onclick="closePatientModal()" class="px-4 py-2 text-sm font-medium text-gray-700 dark:text-gray-300 bg-white dark:bg-gray-800 border border-gray-300 dark:border-gray-600 rounded-lg hover:bg-gray-50 dark:hover:bg-gray-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-blue-500 transition-colors">
                        <i class="fas fa-times mr-2"></i> Cancel
                    </button>
                    <button type="submit" class="inline-flex items-center gap-2 px-4 py-2 text-sm font-medium text-white bg-blue-600 hover:bg-blue-700 rounded-lg focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-blue-500 transition-colors">
                        <i class="fas fa-save"></i> <span id="patientSubmitButtonText">Save Patient</span>
                    </button>
                </div>
            </form>
        </div>
    </div>
</div>

<script>
    function openPatientModal() {
        const modal = document.getElementById('patientModal');
        const form = document.getElementById('patientForm');
        const title = document.getElementById('patientModalTitle');
        const buttonText = document.getElementById('patientSubmitButtonText');
        const passwordField = document.getElementById('patientPasswordField');
        const passwordInput = document.getElementById('patientPassword');
        const passwordRequired = document.getElementById('patientPasswordRequired');
        const passwordHint = document.getElementById('patientPasswordHint');

        form.reset();
        document.getElementById('patientId').value = '';
        document.getElementById('patientFormMethod').value = '';
        form.action = 'patients/create';

        title.textContent = 'Add New Patient';
        buttonText.textContent = 'Save Patient';
        passwordField.classList.remove('hidden');
        passwordInput.required = true;
        passwordRequired.style.display = 'inline';
        passwordHint.textContent = 'Minimum 8 characters, include uppercase, lowercase, and numbers';

        modal.classList.remove('hidden');
        document.body.style.overflow = 'hidden';
    }

    function editPatient(id) {
        const modal = document.getElementById('patientModal');
        const form = document.getElementById('patientForm');
        const title = document.getElementById('patientModalTitle');
        const buttonText = document.getElementById('patientSubmitButtonText');
        const passwordField = document.getElementById('patientPasswordField');
        const passwordInput = document.getElementById('patientPassword');
        const passwordRequired = document.getElementById('patientPasswordRequired');
        const passwordHint = document.getElementById('patientPasswordHint');

        fetch(`/patients/` + id)
            .then(res => res.json())
            .then(data => {
                document.getElementById('patientId').value = data.id;
                document.getElementById('patientName').value = data.name;
                document.getElementById('patientEmail').value = data.email;
                document.getElementById('patientPhone').value = data.phone || '';
                document.getElementById('patientCIN').value = data.cin;
                document.getElementById('patientBirthDate').value = data.dateOfBirth;
                document.getElementById('patientGender').value = data.gender;
                document.getElementById('patientBlood').value = data.blood;
                document.getElementById('patientAddress').value = data.address || '';

                form.action = '/patients/update';
                document.getElementById('patientFormMethod').value = 'PUT';

                title.textContent = 'Edit Patient';
                buttonText.textContent = 'Update Patient';

                passwordField.classList.remove('hidden');
                passwordInput.required = false;
                passwordRequired.style.display = 'none';
                passwordHint.textContent = 'Leave blank to keep current password';

                modal.classList.remove('hidden');
                document.body.style.overflow = 'hidden';
            })
            .catch(err => alert('Failed to load patient data'));
    }

    function closePatientModal() {
        const modal = document.getElementById('patientModal');
        modal.classList.add('hidden');
        document.body.style.overflow = 'auto';
        document.getElementById('patientForm').reset();
    }

    function togglePatientPassword() {
        const input = document.getElementById('patientPassword');
        const icon = document.getElementById('togglePatientPasswordIcon');
        if (input.type === 'password') {
            input.type = 'text';
            icon.classList.replace('fa-eye', 'fa-eye-slash');
        } else {
            input.type = 'password';
            icon.classList.replace('fa-eye-slash', 'fa-eye');
        }
    }

    document.addEventListener('keydown', e => {
        if (e.key === 'Escape') {
            const modal = document.getElementById('patientModal');
            if (!modal.classList.contains('hidden')) closePatientModal();
        }
    });
</script>
