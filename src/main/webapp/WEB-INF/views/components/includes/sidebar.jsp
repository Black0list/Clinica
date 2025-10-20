<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<aside id="sidebar" class="fixed left-0 top-0 h-full w-64 bg-white dark:bg-gray-800 border-r border-gray-200 dark:border-gray-700 z-50 transform -translate-x-full md:translate-x-0 transition-transform duration-300">
    <div class="flex items-center gap-3 px-6 py-4 border-b border-gray-200 dark:border-gray-700">
        <i class="fas fa-hospital text-primary-600 text-2xl"></i>
        <span class="font-bold text-xl">Clinic Admin</span>
    </div>

    <nav class="p-4 space-y-1 overflow-y-auto h-[calc(100vh-73px)]">
        <a href="/dashboard"
           class="flex items-center gap-3 px-4 py-3 rounded-lg hover:bg-gray-100 dark:hover:bg-gray-700 ${param.active == 'dashboard' ? 'bg-primary-50 dark:bg-primary-900/20 text-primary-600 dark:text-primary-400' : ''}">
            <i class="fas fa-home w-5"></i>
            <span>Dashboard</span>
        </a>

        <a href="/doctors"
           class="flex items-center gap-3 px-4 py-3 rounded-lg hover:bg-gray-100 dark:hover:bg-gray-700 ${param.active == 'doctors' ? 'bg-primary-50 dark:bg-primary-900/20 text-primary-600 dark:text-primary-400' : ''}">
            <i class="fas fa-user-md w-5"></i>
            <span>Doctors</span>
        </a>

        <a href="/patients"
           class="flex items-center gap-3 px-4 py-3 rounded-lg hover:bg-gray-100 dark:hover:bg-gray-700 ${param.active == 'patients' ? 'bg-primary-50 dark:bg-primary-900/20 text-primary-600 dark:text-primary-400' : ''}">
            <i class="fas fa-users w-5"></i>
            <span>Patients</span>
        </a>

<%--        <a href="/staffs"--%>
<%--           class="flex items-center gap-3 px-4 py-3 rounded-lg hover:bg-gray-100 dark:hover:bg-gray-700 ${param.active == 'staff' ? 'bg-primary-50 dark:bg-primary-900/20 text-primary-600 dark:text-primary-400' : ''}">--%>
<%--            <i class="fas fa-user-nurse w-5"></i>--%>
<%--            <span>Staff</span>--%>
<%--        </a>--%>

<%--        <a href="/appointments"--%>
<%--           class="flex items-center gap-3 px-4 py-3 rounded-lg hover:bg-gray-100 dark:hover:bg-gray-700 ${param.active == 'appointments' ? 'bg-primary-50 dark:bg-primary-900/20 text-primary-600 dark:text-primary-400' : ''}">--%>
<%--            <i class="fas fa-calendar-check w-5"></i>--%>
<%--            <span>Appointments</span>--%>
<%--        </a>--%>

        <a href="/medical-notes"
           class="flex items-center gap-3 px-4 py-3 rounded-lg hover:bg-gray-100 dark:hover:bg-gray-700 ${param.active == 'medical-notes' ? 'bg-primary-50 dark:bg-primary-900/20 text-primary-600 dark:text-primary-400' : ''}">
            <i class="fas fa-file-medical w-5"></i>
            <span>Medical Notes</span>
        </a>

<%--        <a href="/availabilities"--%>
<%--           class="flex items-center gap-3 px-4 py-3 rounded-lg hover:bg-gray-100 dark:hover:bg-gray-700 ${param.active == 'availability' ? 'bg-primary-50 dark:bg-primary-900/20 text-primary-600 dark:text-primary-400' : ''}">--%>
<%--            <i class="fas fa-clock w-5"></i>--%>
<%--            <span>Availability</span>--%>
<%--        </a>--%>

        <a href="/departments"
           class="flex items-center gap-3 px-4 py-3 rounded-lg hover:bg-gray-100 dark:hover:bg-gray-700 ${param.active == 'departments' ? 'bg-primary-50 dark:bg-primary-900/20 text-primary-600 dark:text-primary-400' : ''}">
            <i class="fas fa-building w-5"></i>
            <span>Departments</span>
        </a>

        <a href="/specialities"
           class="flex items-center gap-3 px-4 py-3 rounded-lg hover:bg-gray-100 dark:hover:bg-gray-700 ${param.active == 'specialities' ? 'bg-primary-50 dark:bg-primary-900/20 text-primary-600 dark:text-primary-400' : ''}">
            <i class="fas fa-stethoscope w-5"></i>
            <span>Specialities</span>
        </a>
    </nav>
</aside>
