<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<jsp:include page="../components/includes/layout-head.jsp">
    <jsp:param name="title" value="Doctors Management - Clinic Admin" />
</jsp:include>

<div class="flex">
    <jsp:include page="../components/includes/sidebar.jsp">
        <jsp:param name="active" value="doctors" />
    </jsp:include>

    <div class="flex-1 md:ml-64">
        <jsp:include page="../components/includes/header.jsp" />

        <main class="p-6">
            <div class="mb-6">
                <div class="flex flex-col sm:flex-row sm:items-center sm:justify-between gap-4">
                    <div>
                        <h1 class="text-3xl font-bold mb-2">Doctors Management</h1>
                        <p class="text-gray-600 dark:text-gray-400">Manage medical staff and their specializations</p>
                    </div>
                    <button onclick="openDoctorModal()" class="inline-flex items-center gap-2 px-4 py-2 bg-primary-600 hover:bg-primary-700 text-white font-medium rounded-lg transition-colors">
                        <i class="fas fa-user-md"></i>
                        Add Doctor
                    </button>
                </div>
            </div>

            <div class="bg-white dark:bg-gray-800 rounded-lg shadow border border-gray-200 dark:border-gray-700">
                <div class="p-4 border-b border-gray-200 dark:border-gray-700">
                    <div class="relative">
                        <div class="absolute inset-y-0 left-0 flex items-center pl-3 pointer-events-none">
                            <i class="fas fa-search text-gray-400"></i>
                        </div>
                        <input type="text" id="searchInput" class="block w-full pl-10 pr-3 py-2 border border-gray-300 dark:border-gray-600 rounded-lg bg-gray-50 dark:bg-gray-700 text-gray-900 dark:text-white focus:ring-2 focus:ring-primary-500 focus:border-primary-500" placeholder="Search doctors by name, email, or registration...">
                    </div>
                </div>

                <div class="overflow-x-auto">
                    <table class="w-full text-sm text-left">
                        <thead class="text-xs uppercase bg-gray-50 dark:bg-gray-700 text-gray-700 dark:text-gray-300">
                        <tr>
                            <th class="px-6 py-3">ID</th>
                            <th class="px-6 py-3">Doctor</th>
                            <th class="px-6 py-3">Contact</th>
                            <th class="px-6 py-3">Registration</th>
                            <th class="px-6 py-3">Title</th>
                            <th class="px-6 py-3">Speciality</th>
                            <th class="px-6 py-3">Department</th>
                            <th class="px-6 py-3">Status</th>
                            <th class="px-6 py-3">Actions</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:choose>
                            <c:when test="${not empty doctors}">
                                <c:forEach var="doctor" items="${doctors}">
                                    <tr class="border-b border-gray-200 dark:border-gray-700 hover:bg-gray-50 dark:hover:bg-gray-700">
                                        <td class="px-6 py-4 font-medium text-gray-900 dark:text-white">${doctor.id}</td>
                                        <td class="px-6 py-4">
                                            <div class="flex items-center gap-3">
                                                <div class="w-10 h-10 bg-gradient-to-br from-green-400 to-green-600 rounded-full flex items-center justify-center">
                                                    <i class="fas fa-user-md text-white"></i>
                                                </div>
                                                <div>
                                                    <p class="font-medium text-gray-900 dark:text-white">${doctor.name}</p>
                                                    <p class="text-xs text-gray-500 dark:text-gray-400">${doctor.title}</p>
                                                </div>
                                            </div>
                                        </td>
                                        <td class="px-6 py-4">
                                            <div class="space-y-1">
                                                <p class="text-gray-600 dark:text-gray-400 flex items-center gap-1">
                                                    <i class="fas fa-envelope text-xs text-gray-400"></i>
                                                        ${doctor.email}
                                                </p>
                                                <c:if test="${not empty doctor.phone}">
                                                    <p class="text-gray-600 dark:text-gray-400 flex items-center gap-1">
                                                        <i class="fas fa-phone text-xs text-gray-400"></i>
                                                            ${doctor.phone}
                                                    </p>
                                                </c:if>
                                            </div>
                                        </td>
                                        <td class="px-6 py-4">
                                                <span class="inline-flex items-center gap-1 px-2.5 py-1 rounded-md bg-indigo-100 dark:bg-indigo-900/30 text-indigo-700 dark:text-indigo-400 font-mono text-xs font-semibold">
                                                    <i class="fas fa-id-card text-xs"></i>
                                                    ${doctor.registration}
                                                </span>
                                        </td>
                                        <td class="px-6 py-4">
                                            <span class="text-gray-600 dark:text-gray-400">${doctor.title}</span>
                                        </td>
                                        <td class="px-6 py-4">
                                                <span class="inline-flex items-center gap-1 px-3 py-1 rounded-full bg-teal-100 dark:bg-teal-900/30 text-teal-700 dark:text-teal-400 text-xs font-medium">
                                                    <i class="fas fa-stethoscope text-xs"></i>
                                                    ${doctor.speciality}
                                                </span>
                                        </td>
                                        <td class="px-6 py-4">
                                                <span class="inline-flex items-center gap-1 px-3 py-1 rounded-lg bg-blue-100 dark:bg-blue-900/30 text-blue-700 dark:text-blue-400 text-xs font-medium">
                                                    <i class="fas fa-hospital text-xs"></i>
                                                    ${doctor.department}
                                                </span>
                                        </td>
                                        <td class="px-6 py-4">
                                                <span class="px-3 py-1 rounded-full text-xs font-medium ${doctor.active ? 'bg-green-100 dark:bg-green-900/30 text-green-700 dark:text-green-400' : 'bg-gray-100 dark:bg-gray-900/30 text-gray-700 dark:text-gray-400'}">
                                                    <i class="fas fa-circle text-xs mr-1"></i>
                                                    ${doctor.active ? 'Active' : 'Inactive'}
                                                </span>
                                        </td>
                                        <td class="px-6 py-4">
                                            <div class="flex items-center gap-2">
                                                <button onclick="viewDoctor(${doctor.id})" class="inline-flex items-center gap-1 px-3 py-1.5 text-sm font-medium text-green-600 dark:text-green-400 hover:text-green-700 dark:hover:text-green-300 hover:bg-green-50 dark:hover:bg-green-900/30 rounded-lg transition-colors" title="View Profile">
                                                    <i class="fas fa-eye"></i>
                                                    View
                                                </button>
                                                <button onclick="editDoctor(${doctor.id})" class="inline-flex items-center gap-1 px-3 py-1.5 text-sm font-medium text-blue-600 dark:text-blue-400 hover:text-blue-700 dark:hover:text-blue-300 hover:bg-blue-50 dark:hover:bg-blue-900/30 rounded-lg transition-colors" title="Edit Doctor">
                                                    <i class="fas fa-edit"></i>
                                                    Edit
                                                </button>
                                                <button onclick="deleteDoctor(${doctor.id})" class="inline-flex items-center gap-1 px-3 py-1.5 text-sm font-medium text-red-600 dark:text-red-400 hover:text-red-700 dark:hover:text-red-300 hover:bg-red-50 dark:hover:bg-red-900/30 rounded-lg transition-colors" title="Delete Doctor">
                                                    <i class="fas fa-trash"></i>
                                                    Delete
                                                </button>
                                            </div>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </c:when>
                            <c:otherwise>
                                <tr>
                                    <td colspan="9" class="px-6 py-12 text-center">
                                        <div class="flex flex-col items-center gap-3">
                                            <div class="w-16 h-16 bg-gray-100 dark:bg-gray-700 rounded-full flex items-center justify-center">
                                                <i class="fas fa-user-md text-gray-400 text-2xl"></i>
                                            </div>
                                            <p class="text-gray-500 dark:text-gray-400 font-medium">No doctors found</p>
                                            <p class="text-sm text-gray-400 dark:text-gray-500">Add your first doctor to get started</p>
                                            <button onclick="openDoctorModal()" class="mt-2 inline-flex items-center gap-2 px-4 py-2 bg-primary-600 hover:bg-primary-700 text-white font-medium rounded-lg transition-colors">
                                                <i class="fas fa-user-md"></i>
                                                Add Doctor
                                            </button>
                                        </div>
                                    </td>
                                </tr>
                            </c:otherwise>
                        </c:choose>
                        </tbody>
                    </table>
                </div>

                <c:if test="${not empty doctors}">
                    <div class="p-4 border-t border-gray-200 dark:border-gray-700">
                        <div class="flex items-center justify-between text-sm">
                            <p class="text-gray-600 dark:text-gray-400">
                                Showing <span class="font-semibold text-gray-900 dark:text-white">${doctors.size()}</span> doctor(s)
                            </p>
                            <div class="flex items-center gap-4">
                                <div class="flex items-center gap-2">
                                    <span class="text-gray-600 dark:text-gray-400">Active:</span>
                                    <span class="inline-flex items-center gap-1 px-2.5 py-1 rounded-full bg-green-100 dark:bg-green-900/30 text-green-700 dark:text-green-400 font-semibold">
                                        <i class="fas fa-circle text-xs"></i>
                                        <c:set var="activeCount" value="0" />
                                        <c:forEach var="doctor" items="${doctors}">
                                            <c:if test="${doctor.active}">
                                                <c:set var="activeCount" value="${activeCount + 1}" />
                                            </c:if>
                                        </c:forEach>
                                        ${activeCount}
                                    </span>
                                </div>
                            </div>
                        </div>
                    </div>
                </c:if>
            </div>
        </main>
    </div>
</div>

<jsp:include page="../components/modals/doctor-modal.jsp" />
<jsp:include page="../components/includes/layout-footer.jsp" />

<script>
    // Search functionality
    document.getElementById('searchInput')?.addEventListener('input', function(e) {
        const searchTerm = e.target.value.toLowerCase();
        const rows = document.querySelectorAll('tbody tr');

        rows.forEach(row => {
            const text = row.textContent.toLowerCase();
            row.style.display = text.includes(searchTerm) ? '' : 'none';
        });
    });
</script>