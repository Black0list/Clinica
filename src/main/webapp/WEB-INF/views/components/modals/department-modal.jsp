<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!-- Modal Overlay -->
<div id="departmentModal" class="hidden fixed inset-0 z-50 overflow-y-auto" aria-labelledby="modal-title" role="dialog" aria-modal="true">
    <!-- Background overlay -->
    <div class="flex items-center justify-center min-h-screen px-4 pt-4 pb-20 text-center sm:block sm:p-0">
        <div class="fixed inset-0 bg-gray-500 bg-opacity-75 dark:bg-gray-900 dark:bg-opacity-80 transition-opacity" aria-hidden="true" onclick="closeDepartmentModal()"></div>

        <!-- Center modal -->
        <span class="hidden sm:inline-block sm:align-middle sm:h-screen" aria-hidden="true">&#8203;</span>

        <!-- Modal panel -->
        <div class="inline-block align-bottom bg-white dark:bg-gray-800 rounded-lg text-left overflow-hidden shadow-xl transform transition-all sm:my-8 sm:align-middle sm:max-w-lg sm:w-full">
            <!-- Modal Header -->
            <div class="bg-white dark:bg-gray-800 px-6 py-4 border-b border-gray-200 dark:border-gray-700">
                <div class="flex items-center justify-between">
                    <h3 class="text-xl font-semibold text-gray-900 dark:text-white" id="modalTitle">
                        Add New Department
                    </h3>
                    <button type="button" onclick="closeDepartmentModal()" class="text-gray-400 hover:text-gray-500 dark:hover:text-gray-300 focus:outline-none">
                        <i class="fas fa-times text-xl"></i>
                    </button>
                </div>
            </div>

            <!-- Modal Body -->
            <form id="departmentForm" method="post" action="departments/create">
                <input type="hidden" id="departmentId" name="id">
                <input type="hidden" id="formMethod" name="_method" value="">

                <div class="bg-white dark:bg-gray-800 px-6 py-4 space-y-4">
                    <!-- Code Field -->
                    <div>
                        <label for="code" class="block text-sm font-medium text-gray-700 dark:text-gray-300 mb-2">
                            Department Code <span class="text-red-500">*</span>
                        </label>
                        <div class="relative">
                            <div class="absolute inset-y-0 left-0 pl-3 flex items-center pointer-events-none">
                                <i class="fas fa-hashtag text-gray-400"></i>
                            </div>
                            <input type="text"
                                   id="code"
                                   name="code"
                                   class="block w-full pl-10 pr-3 py-2.5 border border-gray-300 dark:border-gray-600 rounded-lg bg-white dark:bg-gray-700 text-gray-900 dark:text-white placeholder-gray-400 focus:ring-2 focus:ring-primary-500 focus:border-primary-500"
                                   placeholder="DEPT-XXX"
                                   required>
                        </div>
                        <p class="mt-1 text-xs text-gray-500 dark:text-gray-400">Use uppercase letters and hyphens (e.g., DEPT-001)</p>
                    </div>

                    <!-- Name Field -->
                    <div>
                        <label for="name" class="block text-sm font-medium text-gray-700 dark:text-gray-300 mb-2">
                            Department Name <span class="text-red-500">*</span>
                        </label>
                        <div class="relative">
                            <div class="absolute inset-y-0 left-0 pl-3 flex items-center pointer-events-none">
                                <i class="fas fa-hospital text-gray-400"></i>
                            </div>
                            <input type="text"
                                   id="name"
                                   name="name"
                                   class="block w-full pl-10 pr-3 py-2.5 border border-gray-300 dark:border-gray-600 rounded-lg bg-white dark:bg-gray-700 text-gray-900 dark:text-white placeholder-gray-400 focus:ring-2 focus:ring-primary-500 focus:border-primary-500"
                                   placeholder="Enter department name"
                                   required>
                        </div>
                    </div>

                    <!-- Description Field -->
                    <div>
                        <label for="description" class="block text-sm font-medium text-gray-700 dark:text-gray-300 mb-2">
                            Description
                        </label>
                        <div class="relative">
                            <textarea id="description"
                                      name="description"
                                      rows="4"
                                      class="block w-full px-3 py-2.5 border border-gray-300 dark:border-gray-600 rounded-lg bg-white dark:bg-gray-700 text-gray-900 dark:text-white placeholder-gray-400 focus:ring-2 focus:ring-primary-500 focus:border-primary-500 resize-none"
                                      placeholder="Enter a brief description of the department"></textarea>
                        </div>
                        <p class="mt-1 text-xs text-gray-500 dark:text-gray-400">Optional: Provide details about this department</p>
                    </div>
                </div>

                <!-- Modal Footer -->
                <div class="bg-gray-50 dark:bg-gray-900 px-6 py-4 flex items-center justify-end gap-3">
                    <button type="button"
                            onclick="closeDepartmentModal()"
                            class="px-4 py-2 text-sm font-medium text-gray-700 dark:text-gray-300 bg-white dark:bg-gray-800 border border-gray-300 dark:border-gray-600 rounded-lg hover:bg-gray-50 dark:hover:bg-gray-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-primary-500 transition-colors">
                        Cancel
                    </button>
                    <button type="submit"
                            class="inline-flex items-center gap-2 px-4 py-2 text-sm font-medium text-white bg-primary-600 hover:bg-primary-700 rounded-lg focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-primary-500 transition-colors">
                        <i class="fas fa-save"></i>
                        <span id="submitButtonText">Save Department</span>
                    </button>
                </div>
            </form>
        </div>
    </div>
</div>

<script>
    // Open modal for creating new department
    function openModal(modalId) {
        const modal = document.getElementById(modalId);
        const form = document.getElementById('departmentForm');
        const modalTitle = document.getElementById('modalTitle');
        const submitButtonText = document.getElementById('submitButtonText');

        // Reset form
        form.reset();
        document.getElementById('departmentId').value = '';
        document.getElementById('formMethod').value = '';

        // Set form action for creation
        form.action = 'departments/create';

        // Update modal title and button
        modalTitle.textContent = 'Add New Department';
        submitButtonText.textContent = 'Save Department';

        // Show modal
        modal.classList.remove('hidden');
        document.body.style.overflow = 'hidden';
    }

    // Open modal for editing department
    function editDepartment(id) {
        const modal = document.getElementById('departmentModal');
        const form = document.getElementById('departmentForm');
        const modalTitle = document.getElementById('modalTitle');
        const submitButtonText = document.getElementById('submitButtonText');

        // Fetch department data
        fetch(`/departments/`+id)
            .then(response => {
                if (!response.ok) throw new Error(`Server returned ${response.status}`);
                return response.json();
            })
            .then(data => {
                console.log("✅ Department:", data);
                document.getElementById('departmentId').value = data.id;
                document.getElementById('code').value = data.code;
                document.getElementById('name').value = data.name;
                document.getElementById('description').value = data.description || '';

                form.action = `/departments/update`;
                document.getElementById('formMethod').value = 'PUT';
                modalTitle.textContent = 'Edit Department';
                submitButtonText.textContent = 'Update Department';
                modal.classList.remove('hidden');
                document.body.style.overflow = 'hidden';
            })
            .catch(error => {
                console.error('Error loading department:', error);
                alert('Failed to load department data');
            });

    }

    // Close modal
    function closeDepartmentModal() {
        const modal = document.getElementById('departmentModal');
        modal.classList.add('hidden');
        document.body.style.overflow = 'auto';

        // Reset form
        document.getElementById('departmentForm').reset();
    }


    // Close modal when pressing Escape key
    document.addEventListener('keydown', function(event) {
        if (event.key === 'Escape') {
            const modal = document.getElementById('departmentModal');
            if (!modal.classList.contains('hidden')) {
                closeDepartmentModal();
            }
        }
    });
</script>