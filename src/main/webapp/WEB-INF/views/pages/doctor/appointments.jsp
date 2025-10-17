<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<jsp:include page="../../components/includes/layout-head.jsp">
    <jsp:param name="title" value="Appointments - Doctor Portal" />
</jsp:include>

<div class="flex">
    <jsp:include page="../../components/includes/doctorSideBar.jsp">
        <jsp:param name="active" value="appointments" />
    </jsp:include>

    <div class="flex-1 md:ml-64">
        <jsp:include page="../../components/includes/header.jsp" />

        <main class="p-6">
            <div class="mb-6">
                <div class="flex flex-col sm:flex-row sm:items-center sm:justify-between gap-4">
                    <div>
                        <h1 class="text-3xl font-bold mb-2">Appointments</h1>
                        <p class="text-gray-600 dark:text-gray-400">Manage and update patient appointments</p>
                    </div>
                </div>
            </div>

            <div class="bg-white dark:bg-gray-800 rounded-lg shadow border border-gray-200 dark:border-gray-700 p-6">
                <div class="relative mb-6">
                    <div class="absolute inset-y-0 left-0 flex items-center pl-3 pointer-events-none">
                        <i class="fas fa-search text-gray-400"></i>
                    </div>
                    <input type="text" id="searchInput" class="block w-full pl-10 pr-3 py-2 border border-gray-300 dark:border-gray-600 rounded-lg bg-gray-50 dark:bg-gray-700 text-gray-900 dark:text-white focus:ring-2 focus:ring-primary-500 focus:border-primary-500" placeholder="Search appointments by patient, type, or status...">
                </div>

                <c:choose>
                    <c:when test="${not empty appointments}">
                        <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6" id="appointmentCards">
                            <c:forEach var="apt" items="${appointments}">
                                <div class="bg-white dark:bg-gray-900 rounded-xl shadow border border-gray-200 dark:border-gray-700 p-5 hover:shadow-lg transition-shadow" id="appointment-${apt.id}">
                                    <div class="flex items-center justify-between mb-4">
                                        <span class="px-3 py-1 rounded-full text-xs font-semibold ${apt.status eq 'DONE' ? 'bg-green-100 dark:bg-green-900/30 text-green-700 dark:text-green-400' : apt.status eq 'CANCELLED' ? 'bg-red-100 dark:bg-red-900/30 text-red-700 dark:text-red-400' : 'bg-yellow-100 dark:bg-yellow-900/30 text-yellow-700 dark:text-yellow-400'}">
                                            <i class="fas fa-circle text-[8px] mr-1"></i> <span class="status-text">${apt.status}</span>
                                        </span>
                                        <span class="text-sm text-gray-400">#${apt.id}</span>
                                    </div>

                                    <div class="space-y-3">
                                        <div>
                                            <p class="text-sm text-gray-500 dark:text-gray-400">Patient</p>
                                            <p class="text-lg font-semibold text-gray-900 dark:text-white flex items-center gap-2">
                                                <i class="fas fa-user text-primary-500"></i>
                                                    ${apt.patientName}
                                            </p>
                                        </div>

                                        <div>
                                            <p class="text-sm text-gray-500 dark:text-gray-400">Date</p>
                                            <p class="text-base font-medium text-gray-800 dark:text-gray-300 flex items-center gap-2">
                                                <i class="fas fa-calendar-day text-primary-500"></i>
                                                    ${apt.date}
                                            </p>
                                        </div>

                                        <div>
                                            <p class="text-sm text-gray-500 dark:text-gray-400">Time</p>
                                            <p class="text-base font-medium text-gray-800 dark:text-gray-300 flex items-center gap-2">
                                                <i class="fas fa-clock text-primary-500"></i>
                                                    ${apt.startTime} - ${apt.endTime}
                                            </p>
                                        </div>

                                        <div>
                                            <p class="text-sm text-gray-500 dark:text-gray-400">Appointment Type</p>
                                            <p class="inline-flex items-center gap-2 px-3 py-1 rounded-full bg-blue-100 dark:bg-blue-900/30 text-blue-700 dark:text-blue-400 text-sm font-medium">
                                                <i class="fas fa-stethoscope"></i> ${apt.type}
                                            </p>
                                        </div>
                                    </div>

                                    <div class="mt-5 flex items-center justify-between">
                                        <button onclick="markAsDone(${apt.id})" class="px-4 py-2 text-sm font-medium bg-green-600 hover:bg-green-700 text-white rounded-lg transition-colors done-btn" ${apt.status eq 'DONE' ? 'style="display:none;"' : ''}>Mark as Done</button>
                                        <button onclick="openMedicalNoteModal(${apt.id})" class="px-4 py-2 text-sm font-medium bg-primary-600 hover:bg-primary-700 text-white rounded-lg transition-colors note-btn" style="${apt.status eq 'DONE' ? '' : 'display:none;'}">
                                            <i class="fas fa-notes-medical mr-1"></i> Add Medical Note
                                        </button>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>
                    </c:when>
                    <c:otherwise>
                        <div class="text-center py-16">
                            <div class="w-20 h-20 mx-auto bg-gray-100 dark:bg-gray-700 rounded-full flex items-center justify-center mb-4">
                                <i class="fas fa-calendar-times text-gray-400 text-3xl"></i>
                            </div>
                            <h2 class="text-xl font-semibold text-gray-700 dark:text-gray-300 mb-2">No Appointments Found</h2>
                            <p class="text-gray-500 dark:text-gray-400 mb-6">There are no scheduled appointments at the moment.</p>
                        </div>
                    </c:otherwise>
                </c:choose>
            </div>
        </main>
    </div>
</div>

<div id="noteModal" class="hidden fixed inset-0 bg-black bg-opacity-50 flex items-center justify-center">
    <div class="bg-white dark:bg-gray-800 rounded-lg shadow-lg p-6 w-full max-w-md">
        <h2 class="text-xl font-semibold mb-4">Add Medical Note</h2>
        <textarea id="noteText" class="w-full h-32 p-3 border border-gray-300 dark:border-gray-600 rounded-lg bg-gray-50 dark:bg-gray-700 text-gray-900 dark:text-white focus:ring-2 focus:ring-primary-500 focus:border-primary-500" placeholder="Write your medical note..."></textarea>
        <div class="mt-4 flex justify-end gap-3">
            <button onclick="closeMedicalNoteModal()" class="px-4 py-2 bg-gray-300 dark:bg-gray-700 text-gray-800 dark:text-gray-200 rounded-lg">Cancel</button>
            <button onclick="saveMedicalNote()" class="px-4 py-2 bg-primary-600 hover:bg-primary-700 text-white rounded-lg">Save</button>
        </div>
    </div>
</div>

<jsp:include page="../../components/includes/layout-footer.jsp" />

<script>
    document.getElementById('searchInput')?.addEventListener('input', function(e) {
        const searchTerm = e.target.value.toLowerCase();
        const cards = document.querySelectorAll('#appointmentCards > div');
        cards.forEach(card => {
            const text = card.textContent.toLowerCase();
            card.style.display = text.includes(searchTerm) ? '' : 'none';
        });
    });

    function markAsDone(id) {
        fetch(`${pageContext.request.contextPath}/doctors/appointment/done?id=`+id, {
            method: 'POST'
        }).then(res => res.json())
            .then(data => {
                console.log(data)
                if (data.success) {
                    const card = document.getElementById(`appointment-` + id);
                    const statusText = card.querySelector('.status-text');
                    const statusBadge = statusText.parentElement;

                    statusText.textContent = 'DONE';
                    statusBadge.className = "px-3 py-1 rounded-full text-xs font-semibold bg-green-100 dark:bg-green-900/30 text-green-700 dark:text-green-400";

                    card.querySelector('.done-btn').style.display = 'none';
                    card.querySelector('.note-btn').style.display = 'inline-flex';
                }

            });
    }

    let currentAppointmentId = null;
    function openMedicalNoteModal(id) {
        currentAppointmentId = id;
        document.getElementById('noteModal').classList.remove('hidden');
    }

    function closeMedicalNoteModal() {
        document.getElementById('noteModal').classList.add('hidden');
        document.getElementById('noteText').value = '';
    }

    function saveMedicalNote() {
        const note = document.getElementById('noteText').value.trim();
        if (!note) return;
        fetch(`${pageContext.request.contextPath}/doctor/appointments/notes`, {
            method: 'POST',
            headers: { 'Content-Type': 'application/json' },
            body: JSON.stringify({ appointmentId: currentAppointmentId, note })
        }).then(res => res.json())
            .then(data => {
                if (data.success) {
                    closeMedicalNoteModal();
                    alert('Medical note added successfully');
                }
            });
    }
</script>
