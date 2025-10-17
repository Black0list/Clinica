<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<aside id="sidebar" class="fixed left-0 top-0 h-full w-64 bg-white dark:bg-gray-800 border-r border-gray-200 dark:border-gray-700 z-50 transform -translate-x-full md:translate-x-0 transition-transform duration-300">
    <!-- Brand / Logo -->
    <div class="flex items-center gap-3 px-6 py-4 border-b border-gray-200 dark:border-gray-700">
        <i class="fas fa-user-md text-primary-600 text-2xl"></i>
        <span class="font-bold text-xl">Doctor Panel</span>
    </div>

    <!-- Navigation -->
    <nav class="p-4 space-y-1 overflow-y-auto h-[calc(100vh-73px)]">

        <a href="/dashboard"
           class="flex items-center gap-3 px-4 py-3 rounded-lg hover:bg-gray-100 dark:hover:bg-gray-700 ${param.active == 'dashboard' ? 'bg-primary-50 dark:bg-primary-900/20 text-primary-600 dark:text-primary-400' : 'text-gray-700 dark:text-gray-300'}">
            <i class="fas fa-clock w-5"></i>
            <span>Dashboard</span>
        </a>

        <a href="/doctor/availabilities"
           class="flex items-center gap-3 px-4 py-3 rounded-lg hover:bg-gray-100 dark:hover:bg-gray-700 ${param.active == 'availability' ? 'bg-primary-50 dark:bg-primary-900/20 text-primary-600 dark:text-primary-400' : 'text-gray-700 dark:text-gray-300'}">
            <i class="fas fa-clock w-5"></i>
            <span>Availability</span>
        </a>

        <a href="/doctors/appointments"
           class="flex items-center gap-3 px-4 py-3 rounded-lg hover:bg-gray-100 dark:hover:bg-gray-700 ${param.active == 'appointments' ? 'bg-primary-50 dark:bg-primary-900/20 text-primary-600 dark:text-primary-400' : 'text-gray-700 dark:text-gray-300'}">
            <i class="fas fa-calendar-check w-5"></i>
            <span>Appointments</span>
        </a>

        <a href="/doctor/patients-history"
           class="flex items-center gap-3 px-4 py-3 rounded-lg hover:bg-gray-100 dark:hover:bg-gray-700 ${param.active == 'history' ? 'bg-primary-50 dark:bg-primary-900/20 text-primary-600 dark:text-primary-400' : 'text-gray-700 dark:text-gray-300'}">
            <i class="fas fa-notes-medical w-5"></i>
            <span>History of Patients</span>
        </a>
    </nav>
</aside>
