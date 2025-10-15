<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!-- Modal Overlay -->
<div id="availabilityModal" class="hidden fixed inset-0 z-50 overflow-y-auto" aria-labelledby="modal-title" role="dialog" aria-modal="true">
    <!-- Background overlay -->
    <div class="flex items-center justify-center min-h-screen px-4 pt-4 pb-20 text-center sm:block sm:p-0">
        <div class="fixed inset-0 bg-gray-500 bg-opacity-75 dark:bg-gray-900 dark:bg-opacity-80 transition-opacity" aria-hidden="true" onclick="closeAvailabilityModal()"></div>

        <!-- Center modal -->
        <span class="hidden sm:inline-block sm:align-middle sm:h-screen" aria-hidden="true">&#8203;</span>

        <!-- Modal panel -->
        <div class="inline-block align-bottom bg-white dark:bg-gray-800 rounded-lg text-left overflow-hidden shadow-xl transform transition-all sm:my-8 sm:align-middle sm:max-w-lg sm:w-full">
            <!-- Modal Header -->
            <div class="bg-white dark:bg-gray-800 px-6 py-4 border-b border-gray-200 dark:border-gray-700">
                <div class="flex items-center justify-between">
                    <h3 class="text-xl font-semibold text-gray-900 dark:text-white" id="availabilityModalTitle">
                        Add Doctor Availability
                    </h3>
                    <button type="button" onclick="closeAvailabilityModal()" class="text-gray-400 hover:text-gray-500 dark:hover:text-gray-300 focus:outline-none">
                        <i class="fas fa-times text-xl"></i>
                    </button>
                </div>
            </div>

            <!-- Modal Body -->
            <form id="availabilityForm" method="post" action="/doctor/availabilities/create">
                <input type="hidden" id="availabilityId" name="id">
                <input type="hidden" id="availabilityFormMethod" name="_method" value="">

                <div class="bg-white dark:bg-gray-800 px-6 py-4 space-y-4">
                    <div>
                        <label for="day" class="block text-sm font-medium text-gray-700 dark:text-gray-300 mb-2">
                            Day <span class="text-red-500">*</span>
                        </label>
                        <select id="day" name="day" class="block w-full px-3 py-2.5 border border-gray-300 dark:border-gray-600 rounded-lg bg-white dark:bg-gray-700 text-gray-900 dark:text-white focus:ring-2 focus:ring-primary-500 focus:border-primary-500" required>
                            <option value="">Select a day</option>
                            <option value="MONDAY">Monday</option>
                            <option value="TUESDAY">Tuesday</option>
                            <option value="WEDNESDAY">Wednesday</option>
                            <option value="THURSDAY">Thursday</option>
                            <option value="FRIDAY">Friday</option>
                            <option value="SATURDAY">Saturday</option>
                            <option value="SUNDAY">Sunday</option>
                        </select>
                    </div>

                    <div>
                        <label for="startTime" class="block text-sm font-medium text-gray-700 dark:text-gray-300 mb-2">
                            Start Time <span class="text-red-500">*</span>
                        </label>
                        <input type="time" id="startTime" name="startTime" class="block w-full px-3 py-2.5 border border-gray-300 dark:border-gray-600 rounded-lg bg-white dark:bg-gray-700 text-gray-900 dark:text-white focus:ring-2 focus:ring-primary-500 focus:border-primary-500" required>
                    </div>

                    <div>
                        <label for="endTime" class="block text-sm font-medium text-gray-700 dark:text-gray-300 mb-2">
                            End Time <span class="text-red-500">*</span>
                        </label>
                        <input type="time" id="endTime" name="endTime" class="block w-full px-3 py-2.5 border border-gray-300 dark:border-gray-600 rounded-lg bg-white dark:bg-gray-700 text-gray-900 dark:text-white focus:ring-2 focus:ring-primary-500 focus:border-primary-500" required>
                    </div>

                    <div>
                        <label for="status" class="block text-sm font-medium text-gray-700 dark:text-gray-300 mb-2">
                            Status <span class="text-red-500">*</span>
                        </label>
                        <select id="status" name="status" class="block w-full px-3 py-2.5 border border-gray-300 dark:border-gray-600 rounded-lg bg-white dark:bg-gray-700 text-gray-900 dark:text-white focus:ring-2 focus:ring-primary-500 focus:border-primary-500" required>
                            <option value="AVAILABLE">AVAILABLE</option>
                            <option value="ON_LEAVE">ON_LEAVE</option>
                            <option value="UNAVAILABLE">UNAVAILABLE</option>
                        </select>
                    </div>
                </div>

                <!-- Modal Footer -->
                <div class="bg-gray-50 dark:bg-gray-900 px-6 py-4 flex items-center justify-end gap-3">
                    <button type="button" onclick="closeAvailabilityModal()" class="px-4 py-2 text-sm font-medium text-gray-700 dark:text-gray-300 bg-white dark:bg-gray-800 border border-gray-300 dark:border-gray-600 rounded-lg hover:bg-gray-50 dark:hover:bg-gray-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-primary-500 transition-colors">
                        Cancel
                    </button>
                    <button type="submit" class="inline-flex items-center gap-2 px-4 py-2 text-sm font-medium text-white bg-primary-600 hover:bg-primary-700 rounded-lg focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-primary-500 transition-colors">
                        <i class="fas fa-save"></i>
                        <span id="availabilitySubmitButtonText">Save Availability</span>
                    </button>
                </div>
            </form>
        </div>
    </div>
</div>

<script>
    function openModal(modalId) {
        const modal = document.getElementById(modalId);
        const form = document.getElementById('availabilityForm');
        const modalTitle = document.getElementById('availabilityModalTitle');
        const submitButtonText = document.getElementById('availabilitySubmitButtonText');

        form.reset();
        document.getElementById('availabilityId').value = '';
        document.getElementById('availabilityFormMethod').value = '';
        form.action = '/doctor/availabilities/create';
        modalTitle.textContent = 'Add Doctor Availability';
        submitButtonText.textContent = 'Save Availability';
        modal.classList.remove('hidden');
        document.body.style.overflow = 'hidden';
    }

    function editAvailability(id) {
        const modal = document.getElementById('availabilityModal');
        const form = document.getElementById('availabilityForm');
        const modalTitle = document.getElementById('availabilityModalTitle');
        const submitButtonText = document.getElementById('availabilitySubmitButtonText');

        fetch(`/doctor/availabilities/`+ id)
            .then(response => {
                if (!response.ok) throw new Error(`Server returned ${response.status}`);
                return response.json();
            })
            .then(data => {
                console.log(data)
                document.getElementById('availabilityId').value = data.id;
                document.getElementById('day').value = data.day;
                document.getElementById('startTime').value = data.startTime;
                document.getElementById('endTime').value = data.endTime;
                document.getElementById('status').value = data.status;

                form.action = `/doctor/availabilities/update`;
                document.getElementById('availabilityFormMethod').value = 'PUT';
                modalTitle.textContent = 'Edit Availability';
                submitButtonText.textContent = 'Update Availability';
                modal.classList.remove('hidden');
                document.body.style.overflow = 'hidden';
            })
            .catch(error => {
                console.error('Error loading availability:', error);
                alert('Failed to load availability data');
            });
    }

    function closeAvailabilityModal() {
        const modal = document.getElementById('availabilityModal');
        modal.classList.add('hidden');
        document.body.style.overflow = 'auto';
        document.getElementById('availabilityForm').reset();
    }

    document.addEventListener('keydown', function(event) {
        if (event.key === 'Escape') {
            const modal = document.getElementById('availabilityModal');
            if (!modal.classList.contains('hidden')) {
                closeAvailabilityModal();
            }
        }
    });
</script>
