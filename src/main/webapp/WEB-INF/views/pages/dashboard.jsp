<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="../components/includes/layout-head.jsp">
    <jsp:param name="title" value="Dashboard - Clinic Admin" />
</jsp:include>

<div class="flex">
    <jsp:include page="../components/includes/sidebar.jsp">
        <jsp:param name="active" value="dashboard" />
    </jsp:include>

    <div class="flex-1 md:ml-64">
        <jsp:include page="../components/includes/header.jsp" />

        <main class="p-6">
            <div class="mb-6">
                <h1 class="text-3xl font-bold mb-2">Dashboard</h1>
                <p class="text-gray-600 dark:text-gray-400">Welcome to your clinic management system</p>
            </div>

            <!-- ✅ Dynamic Stats -->
            <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-6 mb-6">
                <div class="bg-white dark:bg-gray-800 rounded-lg shadow p-6 border border-gray-200 dark:border-gray-700">
                    <div class="flex items-center justify-between mb-4">
                        <div class="w-12 h-12 bg-blue-100 dark:bg-blue-900/30 rounded-lg flex items-center justify-center">
                            <i class="fas fa-users text-blue-600 dark:text-blue-400 text-xl"></i>
                        </div>
                        <span class="text-sm text-green-600 dark:text-green-400 font-medium">+12%</span>
                    </div>
                    <h3 class="text-gray-600 dark:text-gray-400 text-sm mb-1">Total Patients</h3>
                    <p class="text-3xl font-bold">${totalPatients}</p>
                </div>

                <div class="bg-white dark:bg-gray-800 rounded-lg shadow p-6 border border-gray-200 dark:border-gray-700">
                    <div class="flex items-center justify-between mb-4">
                        <div class="w-12 h-12 bg-green-100 dark:bg-green-900/30 rounded-lg flex items-center justify-center">
                            <i class="fas fa-user-md text-green-600 dark:text-green-400 text-xl"></i>
                        </div>
                        <span class="text-sm text-green-600 dark:text-green-400 font-medium">+3</span>
                    </div>
                    <h3 class="text-gray-600 dark:text-gray-400 text-sm mb-1">Total Doctors</h3>
                    <p class="text-3xl font-bold">${totalDoctors}</p>
                </div>

                <div class="bg-white dark:bg-gray-800 rounded-lg shadow p-6 border border-gray-200 dark:border-gray-700">
                    <div class="flex items-center justify-between mb-4">
                        <div class="w-12 h-12 bg-purple-100 dark:bg-purple-900/30 rounded-lg flex items-center justify-center">
                            <i class="fas fa-calendar-check text-purple-600 dark:text-purple-400 text-xl"></i>
                        </div>
                        <span class="text-sm text-red-600 dark:text-red-400 font-medium">-5%</span>
                    </div>
                    <h3 class="text-gray-600 dark:text-gray-400 text-sm mb-1">Total Appointments</h3>
                    <p class="text-3xl font-bold">${totalAppointments}</p>
                </div>

                <div class="bg-white dark:bg-gray-800 rounded-lg shadow p-6 border border-gray-200 dark:border-gray-700">
                    <div class="flex items-center justify-between mb-4">
                        <div class="w-12 h-12 bg-orange-100 dark:bg-orange-900/30 rounded-lg flex items-center justify-center">
                            <i class="fas fa-notes-medical text-orange-600 dark:text-orange-400 text-xl"></i>
                        </div>
                        <span class="text-sm text-green-600 dark:text-green-400 font-medium">+18%</span>
                    </div>
                    <h3 class="text-gray-600 dark:text-gray-400 text-sm mb-1">Total Medical Notes</h3>
                    <p class="text-3xl font-bold">${totalMedicalNotes}</p>
                </div>
            </div>

            <!-- ✅ Dynamic Recent Appointments -->
            <div class="grid grid-cols-1 lg:grid-cols-1 gap-6">
                <div class="bg-white dark:bg-gray-800 rounded-lg shadow border border-gray-200 dark:border-gray-700">
                    <div class="p-6 border-b border-gray-200 dark:border-gray-700">
                        <h2 class="text-xl font-bold">Recent Appointments</h2>
                    </div>
                    <div class="p-6">
                        <div class="space-y-4">
                            <c:forEach var="a" items="${recentAppointments}">
                                <div class="flex items-center gap-4 p-3 rounded-lg hover:bg-gray-50 dark:hover:bg-gray-700">
                                    <div class="w-10 h-10 bg-primary-100 dark:bg-primary-900/30 rounded-full flex items-center justify-center">
                                        <i class="fas fa-user text-primary-600 dark:text-primary-400"></i>
                                    </div>
                                    <div class="flex-1">
                                        <p class="font-medium">${a.patientName}</p>
                                        <p class="text-sm text-gray-600 dark:text-gray-400">${a.doctorName} - ${a.startTime}</p>
                                    </div>
                                    <span class="px-3 py-1 rounded-full text-sm
                                        ${a.status == 'DONE' ? 'bg-green-100 text-green-700 dark:bg-green-900/30 dark:text-green-400' :
                                        a.status == 'PLANNED' ? 'bg-yellow-100 text-yellow-700 dark:bg-yellow-900/30 dark:text-yellow-400' :
                                        'bg-gray-100 text-gray-700 dark:bg-gray-700 dark:text-gray-300'}">
                                            ${a.status}
                                    </span>
                                </div>
                            </c:forEach>
                        </div>
                    </div>
                </div>
            </div>
        </main>
    </div>
</div>

<jsp:include page="../components/includes/layout-footer.jsp" />
