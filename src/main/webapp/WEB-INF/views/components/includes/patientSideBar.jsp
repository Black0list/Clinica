<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<aside id="sidebar" class="fixed left-0 top-0 h-full w-64 bg-white dark:bg-gray-800 border-r border-gray-200 dark:border-gray-700 z-50 transform -translate-x-full md:translate-x-0 transition-transform duration-300">
    <div class="flex items-center gap-3 px-6 py-4 border-b border-gray-200 dark:border-gray-700">
        <i class="fas fa-heartbeat text-primary-600 text-2xl"></i>
        <span class="font-bold text-xl">Patient Portal</span>
    </div>

    <nav class="p-4 space-y-1 overflow-y-auto h-[calc(100vh-73px)]">

        <a href="/patient/appointments"
           class="flex items-center gap-3 px-4 py-3 rounded-lg hover:bg-gray-100 dark:hover:bg-gray-700 ${param.active == 'appointments' ? 'bg-primary-50 dark:bg-primary-900/20 text-primary-600 dark:text-primary-400' : ''}">
            <i class="fas fa-calendar-check w-5"></i>
            <span>My Appointments</span>
        </a>

        <a href="/patient/history"
           class="flex items-center gap-3 px-4 py-3 rounded-lg hover:bg-gray-100 dark:hover:bg-gray-700 ${param.active == 'history' ? 'bg-primary-50 dark:bg-primary-900/20 text-primary-600 dark:text-primary-400' : ''}">
            <i class="fas fa-notes-medical w-5"></i>
            <span>Appointment History</span>
        </a>

        <a href="/patient/doctors"
           class="flex items-center gap-3 px-4 py-3 rounded-lg hover:bg-gray-100 dark:hover:bg-gray-700 ${param.active == 'search' ? 'bg-primary-50 dark:bg-primary-900/20 text-primary-600 dark:text-primary-400' : ''}">
            <i class="fas fa-search w-5"></i>
            <span>Doctor</span>
        </a>

    </nav>
</aside>
