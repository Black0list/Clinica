<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>Clinica — Welcome</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link href="https://unpkg.com/aos@2.3.4/dist/aos.css" rel="stylesheet" />
</head>
<body class="bg-slate-50 text-slate-800">
<header class="fixed inset-x-0 top-0 z-50 bg-white/80 backdrop-blur shadow">
    <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 h-16 flex items-center justify-between">
        <a href="#main" class="text-2xl font-extrabold tracking-tight text-cyan-600">Clinica</a>
        <nav class="hidden md:flex items-center gap-8 text-sm font-medium">
            <a href="#main" class="hover:text-cyan-600 transition">Home</a>
            <a href="#about" class="hover:text-cyan-600 transition">About</a>
            <a href="#features" class="hover:text-cyan-600 transition">Features</a>
            <a href="#contact" class="hover:text-cyan-600 transition">Contact</a>
        </nav>
        <div class="hidden md:flex items-center gap-3">
            <c:choose>
                <c:when test="${empty sessionScope.user}">
                    <a href="${pageContext.request.contextPath}/login" class="px-4 py-2 rounded-lg bg-cyan-600 text-white font-semibold hover:-translate-y-0.5 hover:bg-cyan-700 transition">Login</a>
                    <a href="${pageContext.request.contextPath}/auth/register" class="px-4 py-2 rounded-lg bg-cyan-500 text-white font-semibold hover:-translate-y-0.5 hover:bg-cyan-600 transition">Register</a>
                </c:when>
                <c:otherwise>
                    <a href="${pageContext.request.contextPath}/auth/logout" class="px-4 py-2 rounded-lg bg-rose-600 text-white font-semibold hover:-translate-y-0.5 hover:bg-rose-700 transition">Logout</a>
                </c:otherwise>
            </c:choose>
        </div>
        <button id="menuBtn" class="md:hidden inline-flex items-center justify-center w-10 h-10 rounded-lg border border-slate-200 hover:bg-slate-100 transition">
            <svg xmlns="http://www.w3.org/2000/svg" class="w-5 h-5" fill="none" stroke="currentColor"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M4 6h16M4 12h16M4 18h16"/></svg>
        </button>
    </div>
    <div id="mobileMenu" class="md:hidden hidden border-t border-slate-200 bg-white">
        <nav class="px-4 py-3 flex flex-col gap-3">
            <a href="#main" class="py-2 px-2 rounded hover:bg-slate-100">Home</a>
            <a href="#about" class="py-2 px-2 rounded hover:bg-slate-100">About</a>
            <a href="#features" class="py-2 px-2 rounded hover:bg-slate-100">Features</a>
            <a href="#contact" class="py-2 px-2 rounded hover:bg-slate-100">Contact</a>
            <c:choose>
                <c:when test="${empty sessionScope.user}">
                    <a href="${pageContext.request.contextPath}/login" class="mt-2 px-4 py-2 rounded-lg bg-cyan-600 text-white text-center font-semibold">Login</a>
                    <a href="${pageContext.request.contextPath}/auth/register" class="px-4 py-2 rounded-lg bg-cyan-500 text-white text-center font-semibold">Register</a>
                </c:when>
                <c:otherwise>
                    <a href="${pageContext.request.contextPath}/auth/logout" class="mt-2 px-4 py-2 rounded-lg bg-rose-600 text-white text-center font-semibold">Logout</a>
                </c:otherwise>
            </c:choose>
        </nav>
    </div>
</header>

<section id="main" class="relative pt-28 md:pt-32 overflow-hidden">
    <div class="absolute inset-0 -z-10">
        <svg class="w-full h-full" preserveAspectRatio="none" viewBox="0 0 1440 900" xmlns="http://www.w3.org/2000/svg">
            <defs>
                <linearGradient id="g1" x1="0" y1="0" x2="1" y2="1">
                    <stop offset="0%" stop-color="#0e7490"/>
                    <stop offset="100%" stop-color="#06b6d4"/>
                </linearGradient>
            </defs>
            <rect width="1440" height="900" fill="url(#g1)"/>
            <circle cx="220" cy="180" r="160" fill="#10b981" opacity=".12"/>
            <circle cx="1240" cy="180" r="220" fill="#22d3ee" opacity=".12"/>
            <circle cx="1080" cy="780" r="180" fill="#38bdf8" opacity=".12"/>
            <path d="M0,700 C300,620 420,780 720,720 C1020,660 1180,780 1440,720 L1440,900 L0,900 Z" fill="#fff" opacity=".10"/>
        </svg>
    </div>
    <div class="max-w-7xl mx-auto px-6 py-24 md:py-28 text-white">
        <div class="max-w-3xl" data-aos="fade-up">
            <h2 class="text-4xl md:text-6xl font-extrabold leading-tight">Digital Healthcare, Seamlessly Connected</h2>
            <p class="mt-5 text-lg md:text-xl text-white/90">Manage patients, appointments, and records with a smooth, secure experience built for modern clinics.</p>
            <c:choose>
                <c:when test="${empty sessionScope.user}">
                    <div class="mt-8 flex flex-col sm:flex-row gap-3">
                        <a href="${pageContext.request.contextPath}/login" class="px-8 py-3 rounded-xl bg-white text-cyan-700 font-semibold hover:shadow-xl transition">Login</a>
                        <a href="${pageContext.request.contextPath}/auth/register" class="px-8 py-3 rounded-xl bg-cyan-500 text-white font-semibold hover:shadow-xl transition">Register</a>
                    </div>
                </c:when>
                <c:otherwise>
                    <div class="mt-8 flex flex-col sm:flex-row gap-3">
                        <span class="px-8 py-3 rounded-xl bg-white/10 text-white font-semibold">Hello, ${sessionScope.user.name}</span>
                    </div>
                </c:otherwise>
            </c:choose>
        </div>
        <div class="mt-14" data-aos="zoom-in" data-aos-delay="100">
            <svg class="mx-auto w-full max-w-4xl drop-shadow-xl" viewBox="0 0 900 420" xmlns="http://www.w3.org/2000/svg">
                <rect x="0" y="0" width="900" height="420" rx="24" fill="white"/>
                <rect x="24" y="24" width="180" height="80" rx="12" fill="#cffafe"/>
                <rect x="220" y="24" width="656" height="80" rx="12" fill="#f0f9ff"/>
                <rect x="24" y="124" width="270" height="260" rx="16" fill="#ecfeff"/>
                <rect x="310" y="124" width="566" height="120" rx="16" fill="#e0f2fe"/>
                <rect x="310" y="254" width="566" height="130" rx="16" fill="#f0fdfa"/>
                <circle cx="84" cy="164" r="28" fill="#06b6d4"/>
                <rect x="124" y="140" width="140" height="18" rx="6" fill="#0891b2"/>
                <rect x="124" y="166" width="120" height="12" rx="6" fill="#22d3ee"/>
                <rect x="340" y="154" width="240" height="18" rx="6" fill="#0ea5e9"/>
                <rect x="340" y="184" width="460" height="12" rx="6" fill="#38bdf8"/>
                <rect x="340" y="284" width="300" height="18" rx="6" fill="#10b981"/>
                <rect x="340" y="314" width="420" height="12" rx="6" fill="#34d399"/>
            </svg>
        </div>
    </div>
</section>

<section id="about" class="py-20 bg-white">
    <div class="max-w-7xl mx-auto px-6 grid md:grid-cols-2 gap-10 items-center">
        <div data-aos="fade-right">
            <svg class="w-full h-80" viewBox="0 0 700 400" xmlns="http://www.w3.org/2000/svg">
                <rect width="700" height="400" rx="24" fill="#ecfeff"/>
                <g transform="translate(60,70)">
                    <circle cx="60" cy="60" r="52" fill="#06b6d4"/>
                    <rect x="135" y="32" width="180" height="20" rx="6" fill="#0891b2"/>
                    <rect x="135" y="62" width="220" height="12" rx="6" fill="#22d3ee"/>
                    <rect x="0" y="130" width="580" height="18" rx="6" fill="#7dd3fc"/>
                    <rect x="0" y="160" width="540" height="18" rx="6" fill="#bae6fd"/>
                    <rect x="0" y="190" width="400" height="18" rx="6" fill="#e0f2fe"/>
                </g>
            </svg>
        </div>
        <div data-aos="fade-left">
            <h3 class="text-3xl md:text-4xl font-bold text-cyan-700">About Clinica</h3>
            <p class="mt-4 text-slate-600 leading-relaxed">Clinica streamlines patient care with intuitive scheduling, secure records, and real-time insights. Built for speed, reliability, and privacy.</p>
            <div class="mt-6 grid grid-cols-3 gap-4">
                <svg class="w-full h-24" viewBox="0 0 120 96" xmlns="http://www.w3.org/2000/svg"><rect width="120" height="96" rx="12" fill="#e0f2fe"/><path d="M20 52h80" stroke="#0ea5e9" stroke-width="6" stroke-linecap="round"/><path d="M40 36h40" stroke="#38bdf8" stroke-width="6" stroke-linecap="round"/></svg>
                <svg class="w-full h-24" viewBox="0 0 120 96" xmlns="http://www.w3.org/2000/svg"><rect width="120" height="96" rx="12" fill="#ecfeff"/><circle cx="40" cy="48" r="18" fill="#06b6d4"/><rect x="64" y="36" width="36" height="24" rx="6" fill="#22d3ee"/></svg>
                <svg class="w-full h-24" viewBox="0 0 120 96" xmlns="http://www.w3.org/2000/svg"><rect width="120" height="96" rx="12" fill="#f0fdfa"/><rect x="18" y="30" width="84" height="12" rx="6" fill="#10b981"/><rect x="18" y="54" width="64" height="12" rx="6" fill="#34d399"/></svg>
            </div>
        </div>
    </div>
</section>

<section id="features" class="py-20 bg-slate-50">
    <div class="max-w-7xl mx-auto px-6 text-center">
        <h3 class="text-3xl md:text-4xl font-bold text-cyan-700" data-aos="zoom-in">Features</h3>
        <p class="mt-3 text-slate-600 max-w-2xl mx-auto" data-aos="zoom-in" data-aos-delay="100">Everything you need to run a modern clinic with ease.</p>
        <div class="mt-12 grid sm:grid-cols-2 lg:grid-cols-3 gap-6">
            <div class="group bg-white rounded-2xl shadow hover:shadow-xl transition p-6" data-aos="fade-up">
                <svg class="w-16 h-16 mx-auto" viewBox="0 0 64 64" xmlns="http://www.w3.org/2000/svg"><rect x="8" y="10" width="48" height="44" rx="8" fill="#e0f2fe"/><rect x="14" y="16" width="36" height="8" rx="4" fill="#0ea5e9"/><rect x="14" y="28" width="26" height="6" rx="3" fill="#38bdf8"/><rect x="14" y="38" width="22" height="6" rx="3" fill="#7dd3fc"/></svg>
                <h4 class="mt-5 text-xl font-semibold">Smart Appointments</h4>
                <p class="mt-2 text-slate-600">Fast scheduling, reminders, and real-time tracking.</p>
            </div>
            <div class="group bg-white rounded-2xl shadow hover:shadow-xl transition p-6" data-aos="fade-up" data-aos-delay="120">
                <svg class="w-16 h-16 mx-auto" viewBox="0 0 64 64" xmlns="http://www.w3.org/2000/svg"><rect x="10" y="8" width="44" height="48" rx="6" fill="#ecfeff"/><rect x="18" y="18" width="28" height="4" rx="2" fill="#06b6d4"/><rect x="18" y="26" width="28" height="4" rx="2" fill="#22d3ee"/><rect x="18" y="34" width="22" height="4" rx="2" fill="#7dd3fc"/></svg>
                <h4 class="mt-5 text-xl font-semibold">Secure Records</h4>
                <p class="mt-2 text-slate-600">Encrypted storage and controlled team access.</p>
            </div>
            <div class="group bg-white rounded-2xl shadow hover:shadow-xl transition p-6" data-aos="fade-up" data-aos-delay="200">
                <svg class="w-16 h-16 mx-auto" viewBox="0 0 64 64" xmlns="http://www.w3.org/2000/svg"><rect x="8" y="10" width="48" height="44" rx="10" fill="#f0fdfa"/><rect x="16" y="40" width="8" height="8" rx="2" fill="#10b981"/><rect x="28" y="32" width="8" height="16" rx="2" fill="#34d399"/><rect x="40" y="24" width="8" height="24" rx="2" fill="#86efac"/></svg>
                <h4 class="mt-5 text-xl font-semibold">Insights & Analytics</h4>
                <p class="mt-2 text-slate-600">Operational dashboards to optimize care.</p>
            </div>
        </div>
    </div>
</section>

<section id="contact" class="py-20 bg-white">
    <div class="max-w-5xl mx-auto px-6 grid md:grid-cols-2 gap-10 items-center">
        <div data-aos="fade-right">
            <h3 class="text-3xl md:text-4xl font-bold text-cyan-700">Contact</h3>
            <p class="mt-3 text-slate-600">Questions or support needs? We’re here to help.</p>
            <div class="mt-6 space-y-2">
                <p class="text-slate-700">support@clinica.com</p>
                <p class="text-slate-700">+212 600 000 000</p>
                <p class="text-slate-700">Casablanca, Morocco</p>
            </div>
            <c:choose>
                <c:when test="${empty sessionScope.user}">
                    <div class="mt-8 flex gap-3">
                        <a href="${pageContext.request.contextPath}/login" class="px-6 py-3 rounded-xl bg-cyan-600 text-white font-semibold hover:bg-cyan-700 transition">Login</a>
                        <a href="${pageContext.request.contextPath}/auth/register" class="px-6 py-3 rounded-xl bg-cyan-500 text-white font-semibold hover:bg-cyan-600 transition">Register</a>
                    </div>
                </c:when>
                <c:otherwise>
                    <a href="${pageContext.request.contextPath}/auth/logout" class="mt-8 inline-block px-6 py-3 rounded-xl bg-rose-600 text-white font-semibold hover:bg-rose-700 transition">Logout</a>
                </c:otherwise>
            </c:choose>
        </div>
        <div data-aos="fade-left">
            <svg class="w-full h-80" viewBox="0 0 700 400" xmlns="http://www.w3.org/2000/svg">
                <rect width="700" height="400" rx="24" fill="#f0f9ff"/>
                <g transform="translate(60,70)">
                    <rect x="0" y="0" width="260" height="60" rx="12" fill="#e0f2fe"/>
                    <rect x="0" y="80" width="420" height="16" rx="6" fill="#bae6fd"/>
                    <rect x="0" y="108" width="380" height="16" rx="6" fill="#7dd3fc"/>
                    <rect x="0" y="136" width="300" height="16" rx="6" fill="#38bdf8"/>
                    <rect x="300" y="-10" width="240" height="220" rx="16" fill="#ecfeff"/>
                    <rect x="320" y="12" width="200" height="12" rx="6" fill="#06b6d4"/>
                    <rect x="320" y="36" width="180" height="12" rx="6" fill="#22d3ee"/>
                    <rect x="320" y="60" width="140" height="12" rx="6" fill="#7dd3fc"/>
                    <circle cx="420" cy="120" r="42" fill="#10b981"/>
                    <path d="M420 104v32M404 120h32" stroke="white" stroke-width="6" stroke-linecap="round"/>
                </g>
            </svg>
        </div>
    </div>
</section>

<footer class="bg-slate-900 text-white text-center py-6 text-sm">© 2025 Clinica Healthcare</footer>

<script src="https://unpkg.com/aos@2.3.4/dist/aos.js"></script>
<script>
    AOS.init({ once: true, offset: 80 });
    document.getElementById('menuBtn').addEventListener('click', () => {
        document.getElementById('mobileMenu').classList.toggle('hidden');
    });
</script>
</body>
</html>
