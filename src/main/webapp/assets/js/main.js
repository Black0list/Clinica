// Theme Management
function toggleTheme() {
    const html = document.documentElement
    const currentTheme = html.getAttribute("data-theme")
    const newTheme = currentTheme === "dark" ? "light" : "dark"
    const themeIcon = document.getElementById("theme-icon")
    const themeText = document.querySelector(".theme-toggle span:last-child")

    html.setAttribute("data-theme", newTheme)
    localStorage.setItem("theme", newTheme)

    if (newTheme === "dark") {
        themeIcon.textContent = "🌙"
        themeText.textContent = "Dark Mode"
    } else {
        themeIcon.textContent = "☀️"
        themeText.textContent = "Light Mode"
    }
}

// Load saved theme
window.addEventListener("DOMContentLoaded", () => {
    const savedTheme = localStorage.getItem("theme") || "light"
    const themeIcon = document.getElementById("theme-icon")
    const themeText = document.querySelector(".theme-toggle span:last-child")

    document.documentElement.setAttribute("data-theme", savedTheme)

    if (savedTheme === "dark") {
        themeIcon.textContent = "🌙"
        themeText.textContent = "Dark Mode"
    } else {
        themeIcon.textContent = "☀️"
        themeText.textContent = "Light Mode"
    }
})

// Sidebar Management
function toggleSidebar() {
    const sidebar = document.getElementById("sidebar")
    sidebar.classList.toggle("active")

    if (window.innerWidth <= 1024) {
        sidebar.classList.toggle("collapsed")
    }
}

// Modal Management
function openModal(modalId) {
    const modal = document.getElementById(modalId)
    if (modal) {
        modal.classList.add("active")
        document.body.style.overflow = "hidden"
    }
}

function closeModal(modalId) {
    const modal = document.getElementById(modalId)
    if (modal) {
        modal.classList.remove("active")
        document.body.style.overflow = "auto"
    }
}

// Close modal when clicking outside
window.addEventListener("click", (e) => {
    if (e.target.classList.contains("modal")) {
        e.target.classList.remove("active")
        document.body.style.overflow = "auto"
    }
})

// Responsive sidebar handling
window.addEventListener("resize", () => {
    const sidebar = document.getElementById("sidebar")

    if (window.innerWidth > 1024) {
        sidebar.classList.remove("collapsed", "active")
    } else {
        sidebar.classList.add("collapsed")
        sidebar.classList.remove("active")
    }
})
