<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<header class="bg-white dark:bg-gray-800 border-b border-gray-200 dark:border-gray-700 sticky top-0 z-40">
    <div class="flex items-center justify-between px-4 py-3">
        <button onclick="toggleSidebar()" class="md:hidden p-2 rounded-lg hover:bg-gray-100 dark:hover:bg-gray-700">
            <i class="fas fa-bars text-xl"></i>
        </button>

        <div class="md:hidden flex items-center gap-2">
            <i class="fas fa-hospital text-primary-600 text-xl"></i>
            <span class="font-bold text-lg">Clinic</span>
        </div>

        <div class="hidden md:flex flex-1 max-w-md">
            <div class="relative w-full">
                <i class="fas fa-search absolute left-3 top-1/2 -translate-y-1/2 text-gray-400"></i>
                <input
                        type="text"
                        placeholder="Search..."
                        class="w-full pl-10 pr-4 py-2 rounded-lg border border-gray-300 dark:border-gray-600 bg-white dark:bg-gray-700 focus:outline-none focus:ring-2 focus:ring-primary-500"
                >
            </div>
        </div>

        <div class="flex items-center gap-2">
            <button
                    onclick="toggleTheme()"
                    class="p-2 rounded-lg hover:bg-gray-100 dark:hover:bg-gray-700"
                    title="Toggle theme"
            >
                <i class="fas fa-moon dark:hidden text-lg"></i>
                <i class="fas fa-sun hidden dark:inline text-lg"></i>
            </button>

            <button class="relative p-2 rounded-lg hover:bg-gray-100 dark:hover:bg-gray-700">
                <i class="fas fa-bell text-lg"></i>
                <span class="absolute top-1 right-1 w-2 h-2 bg-red-500 rounded-full"></span>
            </button>

            <div class="relative group">
                <button class="flex items-center gap-2 p-2 rounded-lg hover:bg-gray-100 dark:hover:bg-gray-700">
                    <div class="w-8 h-8 rounded-full bg-primary-600 flex items-center justify-center text-white font-semibold">
                        <c:if test="${not empty sessionScope.user}">
                            ${fn:substring(sessionScope.user.name, 0, 1)}
                        </c:if>
                    </div>
                    <span class="hidden md:inline">
                        <c:if test="${not empty sessionScope.user}">
                            ${sessionScope.user.name}
                        </c:if>
                    </span>
                    <i class="fas fa-chevron-down text-sm"></i>
                </button>

                <div class="absolute right-0 mt-2 w-48 bg-white dark:bg-gray-800 rounded-lg shadow-lg border border-gray-200 dark:border-gray-700 opacity-0 invisible group-hover:opacity-100 group-hover:visible transition-all">
                    <hr class="border-gray-200 dark:border-gray-700">
                    <a href="/auth/logout" class="flex items-center gap-2 px-4 py-2 hover:bg-gray-100 dark:hover:bg-gray-700 rounded-b-lg text-red-600">
                        <i class="fas fa-sign-out-alt"></i>
                        <span>Logout</span>
                    </a>
                </div>
            </div>
        </div>
    </div>

</header>
