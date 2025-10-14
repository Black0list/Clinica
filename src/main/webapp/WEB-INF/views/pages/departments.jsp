<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<jsp:include page="../components/includes/layout-head.jsp">
    <jsp:param name="title" value="Departments Management - Clinic Admin" />
</jsp:include>

<div class="flex">
    <jsp:include page="../components/includes/sidebar.jsp">
        <jsp:param name="active" value="departments" />
    </jsp:include>

    <div class="flex-1 md:ml-64">
        <jsp:include page="../components/includes/header.jsp" />

        <main class="p-6">
            <div class="mb-6">
                <div class="flex flex-col sm:flex-row sm:items-center sm:justify-between gap-4">
                    <div>
                        <h1 class="text-3xl font-bold mb-2">Departments Management</h1>
                        <p class="text-gray-600 dark:text-gray-400">Manage hospital departments and their specialities</p>
                    </div>
                    <button onclick="openModal('departmentModal')" class="inline-flex items-center gap-2 px-4 py-2 bg-primary-600 hover:bg-primary-700 text-white font-medium rounded-lg transition-colors">
                        <i class="fas fa-plus"></i>
                        Add Department
                    </button>
                </div>
            </div>

            <div class="bg-white dark:bg-gray-800 rounded-lg shadow border border-gray-200 dark:border-gray-700">
                <div class="p-4 border-b border-gray-200 dark:border-gray-700">
                    <div class="relative">
                        <div class="absolute inset-y-0 left-0 flex items-center pl-3 pointer-events-none">
                            <i class="fas fa-search text-gray-400"></i>
                        </div>
                        <input type="text" id="searchInput" class="block w-full pl-10 pr-3 py-2 border border-gray-300 dark:border-gray-600 rounded-lg bg-gray-50 dark:bg-gray-700 text-gray-900 dark:text-white focus:ring-2 focus:ring-primary-500 focus:border-primary-500" placeholder="Search departments by code, name, or description...">
                    </div>
                </div>

                <div class="overflow-x-auto">
                    <table class="w-full text-sm text-left">
                        <thead class="text-xs uppercase bg-gray-50 dark:bg-gray-700 text-gray-700 dark:text-gray-300">
                        <tr>
                            <th class="px-6 py-3">ID</th>
                            <th class="px-6 py-3">Code</th>
                            <th class="px-6 py-3">Department Name</th>
                            <th class="px-6 py-3">Description</th>
                            <th class="px-6 py-3">Specialities</th>
                            <th class="px-6 py-3">Actions</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:choose>
                            <c:when test="${not empty departments}">
                                <c:forEach var="dept" items="${departments}">
                                    <tr class="border-b border-gray-200 dark:border-gray-700 hover:bg-gray-50 dark:hover:bg-gray-700">
                                        <td class="px-6 py-4 font-medium text-gray-900 dark:text-white">${dept.id}</td>
                                        <td class="px-6 py-4">
                                                <span class="inline-flex items-center gap-2 px-3 py-1 rounded-lg bg-purple-100 dark:bg-purple-900/30 text-purple-700 dark:text-purple-400 font-mono font-semibold text-xs">
                                                    <i class="fas fa-hashtag text-xs"></i>
                                                    ${dept.code}
                                                </span>
                                        </td>
                                        <td class="px-6 py-4">
                                            <div class="flex items-center gap-3">
                                                <div class="w-10 h-10 bg-blue-100 dark:bg-blue-900/30 rounded-lg flex items-center justify-center">
                                                    <i class="fas fa-hospital text-blue-600 dark:text-blue-400"></i>
                                                </div>
                                                <span class="font-medium text-gray-900 dark:text-white">${dept.name}</span>
                                            </div>
                                        </td>
                                        <td class="px-6 py-4">
                                            <p class="text-gray-600 dark:text-gray-400 max-w-md truncate" title="${dept.description}">
                                                    ${dept.description}
                                            </p>
                                        </td>
                                        <td class="px-6 py-4">
                                            <div class="inline-flex items-center gap-2 px-3 py-1.5 rounded-full bg-cyan-100 dark:bg-cyan-900/30">
                                                <i class="fas fa-stethoscope text-cyan-700 dark:text-cyan-400 text-xs"></i>
                                                <span class="text-cyan-700 dark:text-cyan-400 font-semibold text-sm">
                                                        ${dept.specialityCount}
                                                </span>
                                                <span class="text-cyan-600 dark:text-cyan-500 text-xs">
                                                        ${dept.specialityCount == 1 ? 'Speciality' : 'Specialities'}
                                                </span>
                                            </div>
                                        </td>
                                        <td class="px-6 py-4">
                                            <div class="flex items-center gap-2">
                                                <button onclick="editDepartment(${dept.id})" class="inline-flex items-center gap-1 px-3 py-1.5 text-sm font-medium text-blue-600 dark:text-blue-400 hover:text-blue-700 dark:hover:text-blue-300 hover:bg-blue-50 dark:hover:bg-blue-900/30 rounded-lg transition-colors" title="Edit Department">
                                                    <i class="fas fa-edit"></i>
                                                    Edit
                                                </button>
                                                <form action="${pageContext.request.contextPath}/departments/delete" method="post" style="display:inline;">
                                                    <input type="hidden" name="id" value="${dept.id}">
                                                    <button type="submit" class="inline-flex items-center gap-1 px-3 py-1.5 text-sm font-medium text-red-600 dark:text-red-400 hover:text-red-700 dark:hover:text-red-300 hover:bg-red-50 dark:hover:bg-red-900/30 rounded-lg transition-colors" title="Delete Department">
                                                        <i class="fas fa-trash"></i>
                                                        Delete
                                                    </button>
                                                </form>
                                            </div>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </c:when>
                            <c:otherwise>
                                <tr>
                                    <td colspan="6" class="px-6 py-12 text-center">
                                        <div class="flex flex-col items-center gap-3">
                                            <div class="w-16 h-16 bg-gray-100 dark:bg-gray-700 rounded-full flex items-center justify-center">
                                                <i class="fas fa-hospital-alt text-gray-400 text-2xl"></i>
                                            </div>
                                            <p class="text-gray-500 dark:text-gray-400 font-medium">No departments found</p>
                                            <p class="text-sm text-gray-400 dark:text-gray-500">Create your first department to get started</p>
                                            <button onclick="openModal('departmentModal')" class="mt-2 inline-flex items-center gap-2 px-4 py-2 bg-primary-600 hover:bg-primary-700 text-white font-medium rounded-lg transition-colors">
                                                <i class="fas fa-plus"></i>
                                                Add Department
                                            </button>
                                        </div>
                                    </td>
                                </tr>
                            </c:otherwise>
                        </c:choose>
                        </tbody>
                    </table>
                </div>

                <c:if test="${not empty departments}">
                    <div class="p-4 border-t border-gray-200 dark:border-gray-700">
                        <div class="flex items-center justify-between">
                            <p class="text-sm text-gray-600 dark:text-gray-400">
                                Showing <span class="font-semibold text-gray-900 dark:text-white">${departments.size()}</span> department(s)
                            </p>
                            <div class="flex items-center gap-2">
                                <span class="text-sm text-gray-600 dark:text-gray-400">Total Specialities:</span>
                                <span class="inline-flex items-center gap-1 px-3 py-1 rounded-full bg-primary-100 dark:bg-primary-900/30 text-primary-700 dark:text-primary-400 font-semibold text-sm">
                                    <i class="fas fa-stethoscope text-xs"></i>
                                    <c:set var="totalSpecialities" value="0" />
                                    <c:forEach var="dept" items="${departments}">
                                        <c:set var="totalSpecialities" value="${totalSpecialities + dept.specialityCount}" />
                                    </c:forEach>
                                    ${totalSpecialities}
                                </span>
                            </div>
                        </div>
                    </div>
                </c:if>
            </div>
        </main>
    </div>
</div>

<jsp:include page="../components/modals/department-modal.jsp" />
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

    // View department details
    function viewDepartment(id) {
        // Implement view functionality
        console.log('View department:', id);
    }
</script>