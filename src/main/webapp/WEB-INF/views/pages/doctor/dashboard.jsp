<jsp:include page="../../components/includes/layout-head.jsp">
    <jsp:param name="title" value="Dashboard - Clinic Admin" />
</jsp:include>

<div class="flex">
    <jsp:include page="../../components/includes/doctorSideBar.jsp">
        <jsp:param name="active" value="dashboard" />
    </jsp:include>

    <div class="flex-1 md:ml-64">
        <jsp:include page="../../components/includes/header.jsp" />

        <main class="p-6">
            <div class="mb-6">
                <h1 class="text-3xl font-bold mb-2">Dashboard</h1>
                <p class="text-gray-600 dark:text-gray-400">Welcome to your clinic management system</p>
            </div>

            <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-6 mb-6">
                <div class="bg-white dark:bg-gray-800 rounded-lg shadow p-6 border border-gray-200 dark:border-gray-700">
                    <div class="flex items-center justify-between mb-4">
                        <div class="w-12 h-12 bg-blue-100 dark:bg-blue-900/30 rounded-lg flex items-center justify-center">
                            <i class="fas fa-users text-blue-600 dark:text-blue-400 text-xl"></i>
                        </div>
                        <span class="text-sm text-green-600 dark:text-green-400 font-medium">+12%</span>
                    </div>
                    <h3 class="text-gray-600 dark:text-gray-400 text-sm mb-1">Total Patients</h3>
                    <p class="text-3xl font-bold">1,234</p>
                </div>

                <div class="bg-white dark:bg-gray-800 rounded-lg shadow p-6 border border-gray-200 dark:border-gray-700">
                    <div class="flex items-center justify-between mb-4">
                        <div class="w-12 h-12 bg-green-100 dark:bg-green-900/30 rounded-lg flex items-center justify-center">
                            <i class="fas fa-user-md text-green-600 dark:text-green-400 text-xl"></i>
                        </div>
                        <span class="text-sm text-green-600 dark:text-green-400 font-medium">+3</span>
                    </div>
                    <h3 class="text-gray-600 dark:text-gray-400 text-sm mb-1">Total Doctors</h3>
                    <p class="text-3xl font-bold">45</p>
                </div>

                <div class="bg-white dark:bg-gray-800 rounded-lg shadow p-6 border border-gray-200 dark:border-gray-700">
                    <div class="flex items-center justify-between mb-4">
                        <div class="w-12 h-12 bg-purple-100 dark:bg-purple-900/30 rounded-lg flex items-center justify-center">
                            <i class="fas fa-calendar-check text-purple-600 dark:text-purple-400 text-xl"></i>
                        </div>
                        <span class="text-sm text-red-600 dark:text-red-400 font-medium">-5%</span>
                    </div>
                    <h3 class="text-gray-600 dark:text-gray-400 text-sm mb-1">Appointments Today</h3>
                    <p class="text-3xl font-bold">28</p>
                </div>

                <div class="bg-white dark:bg-gray-800 rounded-lg shadow p-6 border border-gray-200 dark:border-gray-700">
                    <div class="flex items-center justify-between mb-4">
                        <div class="w-12 h-12 bg-orange-100 dark:bg-orange-900/30 rounded-lg flex items-center justify-center">
                            <i class="fas fa-dollar-sign text-orange-600 dark:text-orange-400 text-xl"></i>
                        </div>
                        <span class="text-sm text-green-600 dark:text-green-400 font-medium">+18%</span>
                    </div>
                    <h3 class="text-gray-600 dark:text-gray-400 text-sm mb-1">Monthly Revenue</h3>
                    <p class="text-3xl font-bold">$45.2K</p>
                </div>
            </div>

            <div class="grid grid-cols-1 lg:grid-cols-2 gap-6">
                <div class="bg-white dark:bg-gray-800 rounded-lg shadow border border-gray-200 dark:border-gray-700">
                    <div class="p-6 border-b border-gray-200 dark:border-gray-700">
                        <h2 class="text-xl font-bold">Recent Appointments</h2>
                    </div>
                    <div class="p-6">
                        <div class="space-y-4">
                            <div class="flex items-center gap-4 p-3 rounded-lg hover:bg-gray-50 dark:hover:bg-gray-700">
                                <div class="w-10 h-10 bg-primary-100 dark:bg-primary-900/30 rounded-full flex items-center justify-center">
                                    <i class="fas fa-user text-primary-600 dark:text-primary-400"></i>
                                </div>
                                <div class="flex-1">
                                    <p class="font-medium">John Doe</p>
                                    <p class="text-sm text-gray-600 dark:text-gray-400">Dr. Smith - 10:00 AM</p>
                                </div>
                                <span class="px-3 py-1 bg-green-100 dark:bg-green-900/30 text-green-700 dark:text-green-400 rounded-full text-sm">Confirmed</span>
                            </div>

                            <div class="flex items-center gap-4 p-3 rounded-lg hover:bg-gray-50 dark:hover:bg-gray-700">
                                <div class="w-10 h-10 bg-primary-100 dark:bg-primary-900/30 rounded-full flex items-center justify-center">
                                    <i class="fas fa-user text-primary-600 dark:text-primary-400"></i>
                                </div>
                                <div class="flex-1">
                                    <p class="font-medium">Jane Smith</p>
                                    <p class="text-sm text-gray-600 dark:text-gray-400">Dr. Johnson - 11:30 AM</p>
                                </div>
                                <span class="px-3 py-1 bg-yellow-100 dark:bg-yellow-900/30 text-yellow-700 dark:text-yellow-400 rounded-full text-sm">Pending</span>
                            </div>

                            <div class="flex items-center gap-4 p-3 rounded-lg hover:bg-gray-50 dark:hover:bg-gray-700">
                                <div class="w-10 h-10 bg-primary-100 dark:bg-primary-900/30 rounded-full flex items-center justify-center">
                                    <i class="fas fa-user text-primary-600 dark:text-primary-400"></i>
                                </div>
                                <div class="flex-1">
                                    <p class="font-medium">Mike Wilson</p>
                                    <p class="text-sm text-gray-600 dark:text-gray-400">Dr. Brown - 2:00 PM</p>
                                </div>
                                <span class="px-3 py-1 bg-green-100 dark:bg-green-900/30 text-green-700 dark:text-green-400 rounded-full text-sm">Confirmed</span>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="bg-white dark:bg-gray-800 rounded-lg shadow border border-gray-200 dark:border-gray-700">
                    <div class="p-6 border-b border-gray-200 dark:border-gray-700">
                        <h2 class="text-xl font-bold">Quick Actions</h2>
                    </div>
                    <div class="p-6">
                        <div class="grid grid-cols-2 gap-4">
                            <button class="flex flex-col items-center gap-3 p-4 rounded-lg border-2 border-dashed border-gray-300 dark:border-gray-600 hover:border-primary-500 dark:hover:border-primary-500 hover:bg-primary-50 dark:hover:bg-primary-900/10">
                                <i class="fas fa-user-plus text-2xl text-primary-600 dark:text-primary-400"></i>
                                <span class="font-medium">Add Patient</span>
                            </button>

                            <button class="flex flex-col items-center gap-3 p-4 rounded-lg border-2 border-dashed border-gray-300 dark:border-gray-600 hover:border-primary-500 dark:hover:border-primary-500 hover:bg-primary-50 dark:hover:bg-primary-900/10">
                                <i class="fas fa-calendar-plus text-2xl text-primary-600 dark:text-primary-400"></i>
                                <span class="font-medium">New Appointment</span>
                            </button>

                            <button class="flex flex-col items-center gap-3 p-4 rounded-lg border-2 border-dashed border-gray-300 dark:border-gray-600 hover:border-primary-500 dark:hover:border-primary-500 hover:bg-primary-50 dark:hover:bg-primary-900/10">
                                <i class="fas fa-file-medical text-2xl text-primary-600 dark:text-primary-400"></i>
                                <span class="font-medium">Add Note</span>
                            </button>

                            <button class="flex flex-col items-center gap-3 p-4 rounded-lg border-2 border-dashed border-gray-300 dark:border-gray-600 hover:border-primary-500 dark:hover:border-primary-500 hover:bg-primary-50 dark:hover:bg-primary-900/10">
                                <i class="fas fa-chart-line text-2xl text-primary-600 dark:text-primary-400"></i>
                                <span class="font-medium">View Reports</span>
                            </button>
                        </div>
                    </div>
                </div>
            </div>
        </main>
    </div>
</div>

<jsp:include page="../../components/includes/layout-footer.jsp" />
