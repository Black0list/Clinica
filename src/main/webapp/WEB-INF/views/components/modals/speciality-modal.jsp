<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div id="specialityModal" class="hidden fixed inset-0 z-50 overflow-y-auto" aria-labelledby="modal-title" role="dialog" aria-modal="true">
    <div class="flex items-center justify-center min-h-screen px-4 pt-4 pb-20 text-center sm:block sm:p-0">
        <div class="fixed inset-0 bg-gray-500 bg-opacity-75 dark:bg-gray-900 dark:bg-opacity-80 transition-opacity" aria-hidden="true" onclick="closeSpecialityModal()"></div>

        <span class="hidden sm:inline-block sm:align-middle sm:h-screen" aria-hidden="true">&#8203;</span>

        <div class="inline-block align-bottom bg-white dark:bg-gray-800 rounded-lg text-left overflow-hidden shadow-xl transform transition-all sm:my-8 sm:align-middle sm:max-w-lg sm:w-full">
            <div class="bg-white dark:bg-gray-800 px-6 py-4 border-b border-gray-200 dark:border-gray-700">
                <div class="flex items-center justify-between">
                    <h3 class="text-xl font-semibold text-gray-900 dark:text-white" id="specialityModalTitle">
                        Add New Speciality
                    </h3>
                    <button type="button" onclick="closeSpecialityModal()" class="text-gray-400 hover:text-gray-500 dark:hover:text-gray-300 focus:outline-none">
                        <i class="fas fa-times text-xl"></i>
                    </button>
                </div>
            </div>

            <form id="specialityForm" method="post" action="/specialities/create">
                <input type="hidden" id="specialityId" name="id">
                <input type="hidden" id="specialityFormMethod" name="_method" value="">

                <div class="bg-white dark:bg-gray-800 px-6 py-4 space-y-4">
                    <div>
                        <label for="code" class="block text-sm font-medium text-gray-700 dark:text-gray-300 mb-2">
                            Speciality Code <span class="text-red-500">*</span>
                        </label>
                        <div class="relative">
                            <div class="absolute inset-y-0 left-0 pl-3 flex items-center pointer-events-none">
                                <i class="fas fa-hashtag text-gray-400"></i>
                            </div>
                            <input type="text"
                                   id="specialityCode"
                                   name="code"
                                   class="block w-full pl-10 pr-3 py-2.5 border border-gray-300 dark:border-gray-600 rounded-lg bg-white dark:bg-gray-700 text-gray-900 dark:text-white placeholder-gray-400 focus:ring-2 focus:ring-primary-500 focus:border-primary-500"
                                   placeholder="SPEC-001"
                                   required>
                        </div>
                    </div>

                    <div>
                        <label for="name" class="block text-sm font-medium text-gray-700 dark:text-gray-300 mb-2">
                            Speciality Name <span class="text-red-500">*</span>
                        </label>
                        <div class="relative">
                            <div class="absolute inset-y-0 left-0 pl-3 flex items-center pointer-events-none">
                                <i class="fas fa-stethoscope text-gray-400"></i>
                            </div>
                            <input type="text"
                                   id="specialityName"
                                   name="name"
                                   class="block w-full pl-10 pr-3 py-2.5 border border-gray-300 dark:border-gray-600 rounded-lg bg-white dark:bg-gray-700 text-gray-900 dark:text-white placeholder-gray-400 focus:ring-2 focus:ring-primary-500 focus:border-primary-500"
                                   placeholder="Enter speciality name"
                                   required>
                        </div>
                    </div>

                    <div>
                        <label for="departmentId" class="block text-sm font-medium text-gray-700 dark:text-gray-300 mb-2">
                            Department <span class="text-red-500">*</span>
                        </label>
                        <select id="departmentId"
                                name="depName"
                                class="block w-full px-3 py-2.5 border border-gray-300 dark:border-gray-600 rounded-lg bg-white dark:bg-gray-700 text-gray-900 dark:text-white focus:ring-2 focus:ring-primary-500 focus:border-primary-500"
                                required>
                            <option value="">Select department</option>
                            <c:forEach var="dept" items="${departments}">
                                <option value="${dept.name}">${dept.name}</option>
                            </c:forEach>
                        </select>
                    </div>

                    <div>
                        <label for="description" class="block text-sm font-medium text-gray-700 dark:text-gray-300 mb-2">
                            Description
                        </label>
                        <textarea id="specialityDescription"
                                  name="description"
                                  rows="4"
                                  class="block w-full px-3 py-2.5 border border-gray-300 dark:border-gray-600 rounded-lg bg-white dark:bg-gray-700 text-gray-900 dark:text-white placeholder-gray-400 focus:ring-2 focus:ring-primary-500 focus:border-primary-500 resize-none"
                                  placeholder="Enter speciality description"></textarea>
                    </div>
                </div>

                <div class="bg-gray-50 dark:bg-gray-900 px-6 py-4 flex items-center justify-end gap-3">
                    <button type="button"
                            onclick="closeSpecialityModal()"
                            class="px-4 py-2 text-sm font-medium text-gray-700 dark:text-gray-300 bg-white dark:bg-gray-800 border border-gray-300 dark:border-gray-600 rounded-lg hover:bg-gray-50 dark:hover:bg-gray-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-primary-500 transition-colors">
                        Cancel
                    </button>
                    <button type="submit"
                            class="inline-flex items-center gap-2 px-4 py-2 text-sm font-medium text-white bg-primary-600 hover:bg-primary-700 rounded-lg focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-primary-500 transition-colors">
                        <i class="fas fa-save"></i>
                        <span id="specialitySubmitButtonText">Save Speciality</span>
                    </button>
                </div>
            </form>
        </div>
    </div>
</div>

<script>
    function openSpecialityModal() {
        const modal = document.getElementById('specialityModal');
        const form = document.getElementById('specialityForm');
        const title = document.getElementById('specialityModalTitle');
        const button = document.getElementById('specialitySubmitButtonText');

        form.reset();
        document.getElementById('specialityId').value = '';
        document.getElementById('specialityFormMethod').value = '';
        form.action = 'specialities/create';
        title.textContent = 'Add New Speciality';
        button.textContent = 'Save Speciality';

        modal.classList.remove('hidden');
        document.body.style.overflow = 'hidden';
    }

    function editSpeciality(id) {
        const modal = document.getElementById('specialityModal');
        const form = document.getElementById('specialityForm');
        const title = document.getElementById('specialityModalTitle');
        const button = document.getElementById('specialitySubmitButtonText');

        fetch(`/specialities/`+id)
            .then(response => {
                if (!response.ok) throw new Error(`Server returned ${response.status}`);
                return response.json();
            })
            .then(data => {
                console.log(data)
                document.getElementById('specialityId').value = data.id;
                document.getElementById('specialityCode').value = data.code;
                document.getElementById('specialityName').value = data.name;
                document.getElementById('specialityDescription').value = data.description || '';
                document.getElementById('departmentId').value = data.department;

                form.action = '/specialities/update';
                document.getElementById('specialityFormMethod').value = 'PUT';
                title.textContent = 'Edit Speciality';
                button.textContent = 'Update Speciality';

                modal.classList.remove('hidden');
                document.body.style.overflow = 'hidden';
            })
            .catch(error => {
                console.error('Error loading speciality:', error);
                alert('Failed to load speciality data');
            });
    }

    function closeSpecialityModal() {
        const modal = document.getElementById('specialityModal');
        modal.classList.add('hidden');
        document.body.style.overflow = 'auto';
        document.getElementById('specialityForm').reset();
    }

    document.addEventListener('keydown', function(event) {
        if (event.key === 'Escape') {
            const modal = document.getElementById('specialityModal');
            if (!modal.classList.contains('hidden')) {
                closeSpecialityModal();
            }
        }
    });
</script>
