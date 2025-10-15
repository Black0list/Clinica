<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dashboard - Clinica Healthcare</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        :root {
            --primary: #0891b2;
            --primary-dark: #0e7490;
            --secondary: #06b6d4;
            --accent: #10b981;
            --warning: #f59e0b;
            --danger: #ef4444;
            --background: #f8fafc;
            --surface: #ffffff;
            --text: #0f172a;
            --text-light: #64748b;
            --border: #e2e8f0;
            --shadow: rgba(8, 145, 178, 0.1);
        }

        body {
            font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, 'Helvetica Neue', Arial, sans-serif;
            background: var(--background);
            color: var(--text);
            line-height: 1.6;
        }

        .header {
            background: var(--surface);
            border-bottom: 1px solid var(--border);
            padding: 1rem;
            position: sticky;
            top: 0;
            z-index: 100;
            box-shadow: 0 1px 3px rgba(0, 0, 0, 0.1);
        }

        .header-content {
            max-width: 1400px;
            margin: 0 auto;
            display: flex;
            justify-content: space-between;
            align-items: center;
            flex-wrap: wrap;
            gap: 1rem;
        }

        .logo {
            font-size: 1.5rem;
            font-weight: 700;
            color: var(--primary);
        }

        .header-right {
            display: flex;
            align-items: center;
            gap: 1rem;
            flex-wrap: wrap;
        }

        .live-time {
            font-size: 0.875rem;
            color: var(--text-light);
            padding: 0.5rem 1rem;
            background: var(--background);
            border-radius: 0.5rem;
        }

        .user-info {
            display: flex;
            align-items: center;
            gap: 0.75rem;
        }

        .user-avatar {
            width: 40px;
            height: 40px;
            border-radius: 50%;
            background: linear-gradient(135deg, var(--primary), var(--secondary));
            display: flex;
            align-items: center;
            justify-content: center;
            color: white;
            font-weight: 600;
        }

        .user-details {
            display: none;
        }

        @media (min-width: 640px) {
            .user-details {
                display: block;
            }
        }

        .user-name {
            font-weight: 600;
            font-size: 0.875rem;
        }

        .user-role {
            font-size: 0.75rem;
            color: var(--text-light);
        }

        .btn-logout {
            padding: 0.5rem 1rem;
            background: var(--danger);
            color: white;
            border: none;
            border-radius: 0.5rem;
            cursor: pointer;
            font-size: 0.875rem;
            font-weight: 500;
            transition: all 0.3s ease;
        }

        .btn-logout:hover {
            background: #dc2626;
            transform: translateY(-2px);
        }

        .container {
            max-width: 1400px;
            margin: 0 auto;
            padding: 1.5rem;
        }

        @media (min-width: 768px) {
            .container {
                padding: 2rem;
            }
        }

        .welcome-banner {
            background: linear-gradient(135deg, var(--primary), var(--secondary));
            color: white;
            padding: 2rem;
            border-radius: 1rem;
            margin-bottom: 2rem;
            box-shadow: 0 10px 15px -3px var(--shadow);
        }

        .welcome-banner h1 {
            font-size: 1.75rem;
            margin-bottom: 0.5rem;
        }

        @media (min-width: 768px) {
            .welcome-banner h1 {
                font-size: 2rem;
            }
        }

        .welcome-banner p {
            opacity: 0.9;
            font-size: 0.875rem;
        }

        @media (min-width: 768px) {
            .welcome-banner p {
                font-size: 1rem;
            }
        }

        .stats-grid {
            display: grid;
            grid-template-columns: 1fr;
            gap: 1rem;
            margin-bottom: 2rem;
        }

        @media (min-width: 640px) {
            .stats-grid {
                grid-template-columns: repeat(2, 1fr);
            }
        }

        @media (min-width: 1024px) {
            .stats-grid {
                grid-template-columns: repeat(4, 1fr);
            }
        }

        .stat-card {
            background: var(--surface);
            padding: 1.5rem;
            border-radius: 1rem;
            box-shadow: 0 1px 3px rgba(0, 0, 0, 0.1);
            transition: all 0.3s ease;
        }

        .stat-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 10px 15px -3px var(--shadow);
        }

        .stat-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 1rem;
        }

        .stat-title {
            font-size: 0.875rem;
            color: var(--text-light);
            font-weight: 500;
        }

        .stat-badge {
            padding: 0.25rem 0.5rem;
            border-radius: 0.25rem;
            font-size: 0.75rem;
            font-weight: 600;
        }

        .badge-success {
            background: #dcfce7;
            color: #166534;
        }

        .badge-warning {
            background: #fef3c7;
            color: #92400e;
        }

        .badge-info {
            background: #dbeafe;
            color: #1e40af;
        }

        .badge-danger {
            background: #fee2e2;
            color: #991b1b;
        }

        .stat-value {
            font-size: 2rem;
            font-weight: 700;
            color: var(--text);
            margin-bottom: 0.5rem;
        }

        .stat-change {
            font-size: 0.875rem;
            color: var(--accent);
        }

        .content-grid {
            display: grid;
            grid-template-columns: 1fr;
            gap: 1.5rem;
        }

        @media (min-width: 1024px) {
            .content-grid {
                grid-template-columns: 2fr 1fr;
            }
        }

        .card {
            background: var(--surface);
            border-radius: 1rem;
            padding: 1.5rem;
            box-shadow: 0 1px 3px rgba(0, 0, 0, 0.1);
        }

        .card-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 1.5rem;
            padding-bottom: 1rem;
            border-bottom: 1px solid var(--border);
        }

        .card-title {
            font-size: 1.25rem;
            font-weight: 600;
            color: var(--text);
        }

        .pulse-indicator {
            width: 12px;
            height: 12px;
            background: var(--accent);
            border-radius: 50%;
            animation: pulse 2s infinite;
        }

        @keyframes pulse {
            0%, 100% {
                opacity: 1;
                transform: scale(1);
            }
            50% {
                opacity: 0.5;
                transform: scale(1.1);
            }
        }

        .appointment-list {
            display: flex;
            flex-direction: column;
            gap: 1rem;
        }

        .appointment-item {
            display: flex;
            gap: 1rem;
            padding: 1rem;
            background: var(--background);
            border-radius: 0.5rem;
            transition: all 0.3s ease;
        }

        .appointment-item:hover {
            background: #e0f2fe;
        }

        .appointment-time {
            flex-shrink: 0;
            text-align: center;
            padding: 0.5rem;
            background: var(--surface);
            border-radius: 0.5rem;
            border: 2px solid var(--primary);
        }

        .time-hour {
            font-size: 1.25rem;
            font-weight: 700;
            color: var(--primary);
        }

        .time-period {
            font-size: 0.75rem;
            color: var(--text-light);
        }

        .appointment-details {
            flex: 1;
        }

        .appointment-patient {
            font-weight: 600;
            margin-bottom: 0.25rem;
        }

        .appointment-type {
            font-size: 0.875rem;
            color: var(--text-light);
        }

        .update-item {
            display: flex;
            gap: 1rem;
            padding: 1rem;
            border-bottom: 1px solid var(--border);
        }

        .update-item:last-child {
            border-bottom: none;
        }

        .update-indicator {
            width: 8px;
            height: 8px;
            background: var(--primary);
            border-radius: 50%;
            margin-top: 0.5rem;
            flex-shrink: 0;
        }

        .update-content {
            flex: 1;
        }

        .update-text {
            font-size: 0.875rem;
            margin-bottom: 0.25rem;
        }

        .update-time {
            font-size: 0.75rem;
            color: var(--text-light);
        }

        .quick-actions {
            display: grid;
            grid-template-columns: 1fr;
            gap: 0.75rem;
            margin-top: 1.5rem;
        }

        @media (min-width: 640px) {
            .quick-actions {
                grid-template-columns: repeat(2, 1fr);
            }
        }

        .action-btn {
            padding: 1rem;
            background: var(--background);
            border: 2px solid var(--border);
            border-radius: 0.5rem;
            cursor: pointer;
            transition: all 0.3s ease;
            text-align: center;
            font-weight: 500;
            color: var(--text);
        }

        .action-btn:hover {
            background: var(--primary);
            color: white;
            border-color: var(--primary);
            transform: translateY(-2px);
        }

        .loading-spinner {
            display: inline-block;
            width: 16px;
            height: 16px;
            border: 2px solid var(--border);
            border-radius: 50%;
            border-top-color: var(--primary);
            animation: spin 1s linear infinite;
        }

        @keyframes spin {
            to { transform: rotate(360deg); }
        }
    </style>
</head>
<body>
<header class="header">
    <div class="header-content">
        <div class="logo">Clinica</div>
        <div class="header-right">
            <div class="live-time" id="liveTime"></div>
            <div class="user-info">
                <div class="user-avatar">DS</div>
                <div class="user-details">
                    <div class="user-name">Dr. Khadija Benessalih</div>
                    <div class="user-role">Cardiologist</div>
                </div>
            </div>
            <button class="btn-logout" onclick="handleLogout()">Logout</button>
        </div>
    </div>
</header>

<div class="container">
    <div class="welcome-banner">
        <h1>Welcome back, Dr. Johnson</h1>
        <p>You have 8 appointments scheduled for today. Stay organized and provide excellent care.</p>
    </div>

    <div class="stats-grid">
        <div class="stat-card">
            <div class="stat-header">
                <span class="stat-title">Total Patients</span>
                <span class="stat-badge badge-success">Active</span>
            </div>
            <div class="stat-value" id="totalPatients">0</div>
            <div class="stat-change">+12% from last month</div>
        </div>

        <div class="stat-card">
            <div class="stat-header">
                <span class="stat-title">Today's Appointments</span>
                <span class="stat-badge badge-info">Scheduled</span>
            </div>
            <div class="stat-value" id="todayAppointments">0</div>
            <div class="stat-change">3 completed, 5 pending</div>
        </div>

        <div class="stat-card">
            <div class="stat-header">
                <span class="stat-title">Pending Reviews</span>
                <span class="stat-badge badge-warning">Action Needed</span>
            </div>
            <div class="stat-value" id="pendingReviews">0</div>
            <div class="stat-change">Requires attention</div>
        </div>

        <div class="stat-card">
            <div class="stat-header">
                <span class="stat-title">Success Rate</span>
                <span class="stat-badge badge-success">Excellent</span>
            </div>
            <div class="stat-value">98%</div>
            <div class="stat-change">Above average</div>
        </div>
    </div>

    <div class="content-grid">
        <div class="card">
            <div class="card-header">
                <h2 class="card-title">Today's Schedule</h2>
                <div class="pulse-indicator"></div>
            </div>
            <div class="appointment-list">
                <div class="appointment-item">
                    <div class="appointment-time">
                        <div class="time-hour">09:00</div>
                        <div class="time-period">AM</div>
                    </div>
                    <div class="appointment-details">
                        <div class="appointment-patient">John Anderson</div>
                        <div class="appointment-type">Routine Checkup - Cardiology</div>
                    </div>
                </div>
                <div class="appointment-item">
                    <div class="appointment-time">
                        <div class="time-hour">10:30</div>
                        <div class="time-period">AM</div>
                    </div>
                    <div class="appointment-details">
                        <div class="appointment-patient">Maria Garcia</div>
                        <div class="appointment-type">Follow-up Consultation</div>
                    </div>
                </div>
                <div class="appointment-item">
                    <div class="appointment-time">
                        <div class="time-hour">02:00</div>
                        <div class="time-period">PM</div>
                    </div>
                    <div class="appointment-details">
                        <div class="appointment-patient">Robert Chen</div>
                        <div class="appointment-type">ECG Test & Review</div>
                    </div>
                </div>
                <div class="appointment-item">
                    <div class="appointment-time">
                        <div class="time-hour">03:30</div>
                        <div class="time-period">PM</div>
                    </div>
                    <div class="appointment-details">
                        <div class="appointment-patient">Emily Davis</div>
                        <div class="appointment-type">New Patient Consultation</div>
                    </div>
                </div>
            </div>

            <div class="quick-actions">
                <button class="action-btn">Add Appointment</button>
                <button class="action-btn">View Calendar</button>
                <button class="action-btn">Patient Records</button>
                <button class="action-btn">Reports</button>
            </div>
        </div>

        <div class="card">
            <div class="card-header">
                <h2 class="card-title">Live Updates</h2>
                <div class="loading-spinner"></div>
            </div>
            <div id="liveUpdates">
                Updates will be inserted here
            </div>
        </div>
    </div>
</div>

<script>
    // Live time update
    function updateTime() {
        const now = new Date();
        const options = {
            weekday: 'short',
            year: 'numeric',
            month: 'short',
            day: 'numeric',
            hour: '2-digit',
            minute: '2-digit',
            second: '2-digit'
        };
        document.getElementById('liveTime').textContent = now.toLocaleDateString('en-US', options);
    }
    updateTime();
    setInterval(updateTime, 1000);

    // Animated counters
    function animateCounter(id, target) {
        let current = 0;
        const increment = target / 50;
        const element = document.getElementById(id);

        const timer = setInterval(() => {
            current += increment;
            if (current >= target) {
                element.textContent = target;
                clearInterval(timer);
            } else {
                element.textContent = Math.floor(current);
            }
        }, 30);
    }

    animateCounter('totalPatients', 1247);
    animateCounter('todayAppointments', 8);
    animateCounter('pendingReviews', 15);

    // Live updates
    const updates = [
        { text: 'New patient registration: Michael Brown', time: 'Just now' },
        { text: 'Lab results ready for Patient #1234', time: '2 minutes ago' },
        { text: 'Appointment confirmed: Sarah Wilson at 4:00 PM', time: '5 minutes ago' },
        { text: 'Prescription refill request from John Doe', time: '8 minutes ago' },
        { text: 'Emergency alert cleared - All systems normal', time: '12 minutes ago' }
    ];

    let updateIndex = 0;

    function addUpdate() {
        const container = document.getElementById('liveUpdates');
        const update = updates[updateIndex % updates.length];

        const updateElement = document.createElement('div');
        updateElement.className = 'update-item';
        updateElement.style.opacity = '0';
        updateElement.innerHTML = `
                <div class="update-indicator"></div>
                <div class="update-content">
                    <div class="update-text">${update.text}</div>
                    <div class="update-time">${update.time}</div>
                </div>
            `;

        container.insertBefore(updateElement, container.firstChild);

        setTimeout(() => {
            updateElement.style.transition = 'opacity 0.5s ease';
            updateElement.style.opacity = '1';
        }, 100);

        if (container.children.length > 5) {
            container.removeChild(container.lastChild);
        }

        updateIndex++;
    }

    // Initial updates
    for (let i = 0; i < 5; i++) {
        addUpdate();
    }

    // Add new update every 8 seconds
    setInterval(addUpdate, 8000);

    function handleLogout() {
        if (confirm('Are you sure you want to logout?')) {
            window.location.href = 'auth.jsp';
        }
    }
</script>
</body>
</html>
