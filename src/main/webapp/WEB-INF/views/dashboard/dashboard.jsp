<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*, com.clinica.model.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Clinica Admin Dashboard</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        :root {
            --bg-primary: #ffffff;
            --bg-secondary: #f8f9fa;
            --bg-tertiary: #e9ecef;
            --text-primary: #212529;
            --text-secondary: #6c757d;
            --text-tertiary: #adb5bd;
            --border-color: #dee2e6;
            --accent-primary: #0066cc;
            --accent-hover: #0052a3;
            --success: #28a745;
            --warning: #ffc107;
            --danger: #dc3545;
            --info: #17a2b8;
            --shadow-sm: 0 1px 3px rgba(0, 0, 0, 0.1);
            --shadow-md: 0 4px 6px rgba(0, 0, 0, 0.1);
            --shadow-lg: 0 10px 25px rgba(0, 0, 0, 0.15);
            --sidebar-width: 260px;
            --header-height: 64px;
        }

        [data-theme="dark"] {
            --bg-primary: #1a1d23;
            --bg-secondary: #22252b;
            --bg-tertiary: #2a2d35;
            --text-primary: #e9ecef;
            --text-secondary: #adb5bd;
            --text-tertiary: #6c757d;
            --border-color: #3a3d45;
            --accent-primary: #4d9fff;
            --accent-hover: #6bb0ff;
            --success: #51cf66;
            --warning: #ffd43b;
            --danger: #ff6b6b;
            --info: #4dabf7;
            --shadow-sm: 0 1px 3px rgba(0, 0, 0, 0.3);
            --shadow-md: 0 4px 6px rgba(0, 0, 0, 0.4);
            --shadow-lg: 0 10px 25px rgba(0, 0, 0, 0.5);
        }

        body {
            font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, 'Helvetica Neue', Arial, sans-serif;
            background: var(--bg-secondary);
            color: var(--text-primary);
            line-height: 1.6;
            transition: background-color 0.3s ease, color 0.3s ease;
        }

        /* Header */
        .header {
            position: fixed;
            top: 0;
            left: 0;
            right: 0;
            height: var(--header-height);
            background: var(--bg-primary);
            border-bottom: 1px solid var(--border-color);
            display: flex;
            align-items: center;
            justify-content: space-between;
            padding: 0 24px;
            z-index: 1000;
            box-shadow: var(--shadow-sm);
        }

        .header-left {
            display: flex;
            align-items: center;
            gap: 16px;
        }

        .menu-toggle {
            display: none;
            background: none;
            border: none;
            font-size: 24px;
            color: var(--text-primary);
            cursor: pointer;
            padding: 8px;
            border-radius: 8px;
            transition: background-color 0.2s;
        }

        .menu-toggle:hover {
            background: var(--bg-secondary);
        }

        .logo {
            font-size: 24px;
            font-weight: 700;
            color: var(--accent-primary);
            display: flex;
            align-items: center;
            gap: 8px;
        }

        .header-right {
            display: flex;
            align-items: center;
            gap: 16px;
        }

        .theme-toggle {
            background: var(--bg-secondary);
            border: 1px solid var(--border-color);
            color: var(--text-primary);
            padding: 8px 16px;
            border-radius: 8px;
            cursor: pointer;
            font-size: 14px;
            display: flex;
            align-items: center;
            gap: 8px;
            transition: all 0.2s;
        }

        .theme-toggle:hover {
            background: var(--bg-tertiary);
            transform: translateY(-1px);
        }

        .user-menu {
            display: flex;
            align-items: center;
            gap: 12px;
            padding: 8px 16px;
            background: var(--bg-secondary);
            border-radius: 8px;
            cursor: pointer;
            transition: background-color 0.2s;
        }

        .user-menu:hover {
            background: var(--bg-tertiary);
        }

        .user-avatar {
            width: 36px;
            height: 36px;
            border-radius: 50%;
            background: var(--accent-primary);
            color: white;
            display: flex;
            align-items: center;
            justify-content: center;
            font-weight: 600;
            font-size: 14px;
        }

        /* Sidebar */
        .sidebar {
            position: fixed;
            top: var(--header-height);
            left: 0;
            width: var(--sidebar-width);
            height: calc(100vh - var(--header-height));
            background: var(--bg-primary);
            border-right: 1px solid var(--border-color);
            overflow-y: auto;
            transition: transform 0.3s ease;
            z-index: 999;
        }

        .sidebar.collapsed {
            transform: translateX(-100%);
        }

        .nav-section {
            padding: 24px 16px 8px;
        }

        .nav-section-title {
            font-size: 11px;
            font-weight: 600;
            text-transform: uppercase;
            letter-spacing: 0.5px;
            color: var(--text-tertiary);
            margin-bottom: 8px;
            padding: 0 12px;
        }

        .nav-item {
            display: flex;
            align-items: center;
            gap: 12px;
            padding: 12px 16px;
            color: var(--text-secondary);
            text-decoration: none;
            border-radius: 8px;
            margin-bottom: 4px;
            transition: all 0.2s;
            cursor: pointer;
            font-size: 14px;
        }

        .nav-item:hover {
            background: var(--bg-secondary);
            color: var(--text-primary);
        }

        .nav-item.active {
            background: var(--accent-primary);
            color: white;
        }

        .nav-icon {
            font-size: 20px;
            width: 20px;
            text-align: center;
        }

        /* Main Content */
        .main-content {
            margin-left: var(--sidebar-width);
            margin-top: var(--header-height);
            padding: 32px;
            min-height: calc(100vh - var(--header-height));
            transition: margin-left 0.3s ease;
        }

        .main-content.expanded {
            margin-left: 0;
        }

        .page-header {
            margin-bottom: 32px;
        }

        .page-title {
            font-size: 32px;
            font-weight: 700;
            margin-bottom: 8px;
            color: var(--text-primary);
        }

        .page-subtitle {
            font-size: 14px;
            color: var(--text-secondary);
        }

        /* Stats Cards */
        .stats-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(240px, 1fr));
            gap: 24px;
            margin-bottom: 32px;
        }

        .stat-card {
            background: var(--bg-primary);
            border: 1px solid var(--border-color);
            border-radius: 12px;
            padding: 24px;
            box-shadow: var(--shadow-sm);
            transition: all 0.3s;
        }

        .stat-card:hover {
            transform: translateY(-4px);
            box-shadow: var(--shadow-md);
        }

        .stat-header {
            display: flex;
            align-items: center;
            justify-content: space-between;
            margin-bottom: 16px;
        }

        .stat-icon {
            width: 48px;
            height: 48px;
            border-radius: 12px;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 24px;
        }

        .stat-icon.blue { background: rgba(77, 159, 255, 0.1); color: var(--accent-primary); }
        .stat-icon.green { background: rgba(81, 207, 102, 0.1); color: var(--success); }
        .stat-icon.orange { background: rgba(255, 212, 59, 0.1); color: var(--warning); }
        .stat-icon.red { background: rgba(255, 107, 107, 0.1); color: var(--danger); }
        .stat-icon.cyan { background: rgba(74, 171, 247, 0.1); color: var(--info); }

        .stat-value {
            font-size: 32px;
            font-weight: 700;
            color: var(--text-primary);
            margin-bottom: 4px;
        }

        .stat-label {
            font-size: 14px;
            color: var(--text-secondary);
        }

        /* Content Section */
        .content-section {
            display: none;
        }

        .content-section.active {
            display: block;
        }

        .section-header {
            display: flex;
            align-items: center;
            justify-content: space-between;
            margin-bottom: 24px;
            flex-wrap: wrap;
            gap: 16px;
        }

        .section-title {
            font-size: 24px;
            font-weight: 600;
            color: var(--text-primary);
        }

        .section-actions {
            display: flex;
            gap: 12px;
            flex-wrap: wrap;
        }

        /* Buttons */
        .btn {
            padding: 10px 20px;
            border: none;
            border-radius: 8px;
            font-size: 14px;
            font-weight: 500;
            cursor: pointer;
            transition: all 0.2s;
            display: inline-flex;
            align-items: center;
            gap: 8px;
            text-decoration: none;
        }

        .btn-primary {
            background: var(--accent-primary);
            color: white;
        }

        .btn-primary:hover {
            background: var(--accent-hover);
            transform: translateY(-1px);
            box-shadow: var(--shadow-md);
        }

        .btn-secondary {
            background: var(--bg-tertiary);
            color: var(--text-primary);
            border: 1px solid var(--border-color);
        }

        .btn-secondary:hover {
            background: var(--bg-secondary);
        }

        .btn-success {
            background: var(--success);
            color: white;
        }

        .btn-danger {
            background: var(--danger);
            color: white;
        }

        .btn-sm {
            padding: 6px 12px;
            font-size: 13px;
        }

        /* Search Bar */
        .search-bar {
            position: relative;
            flex: 1;
            max-width: 400px;
        }

        .search-input {
            width: 100%;
            padding: 10px 16px 10px 40px;
            border: 1px solid var(--border-color);
            border-radius: 8px;
            background: var(--bg-primary);
            color: var(--text-primary);
            font-size: 14px;
            transition: all 0.2s;
        }

        .search-input:focus {
            outline: none;
            border-color: var(--accent-primary);
            box-shadow: 0 0 0 3px rgba(77, 159, 255, 0.1);
        }

        .search-icon {
            position: absolute;
            left: 12px;
            top: 50%;
            transform: translateY(-50%);
            color: var(--text-tertiary);
        }

        /* Table */
        .table-container {
            background: var(--bg-primary);
            border: 1px solid var(--border-color);
            border-radius: 12px;
            overflow: hidden;
            box-shadow: var(--shadow-sm);
        }

        .table {
            width: 100%;
            border-collapse: collapse;
        }

        .table thead {
            background: var(--bg-secondary);
        }

        .table th {
            padding: 16px;
            text-align: left;
            font-size: 13px;
            font-weight: 600;
            color: var(--text-secondary);
            text-transform: uppercase;
            letter-spacing: 0.5px;
            border-bottom: 1px solid var(--border-color);
        }

        .table td {
            padding: 16px;
            border-bottom: 1px solid var(--border-color);
            color: var(--text-primary);
            font-size: 14px;
        }

        .table tbody tr {
            transition: background-color 0.2s;
        }

        .table tbody tr:hover {
            background: var(--bg-secondary);
        }

        .table tbody tr:last-child td {
            border-bottom: none;
        }

        /* Badge */
        .badge {
            display: inline-block;
            padding: 4px 12px;
            border-radius: 12px;
            font-size: 12px;
            font-weight: 500;
        }

        .badge-success {
            background: rgba(81, 207, 102, 0.15);
            color: var(--success);
        }

        .badge-warning {
            background: rgba(255, 212, 59, 0.15);
            color: var(--warning);
        }

        .badge-danger {
            background: rgba(255, 107, 107, 0.15);
            color: var(--danger);
        }

        .badge-info {
            background: rgba(74, 171, 247, 0.15);
            color: var(--info);
        }

        .badge-secondary {
            background: var(--bg-tertiary);
            color: var(--text-secondary);
        }

        /* Modal */
        .modal {
            display: none;
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: rgba(0, 0, 0, 0.5);
            backdrop-filter: blur(4px);
            z-index: 2000;
            align-items: center;
            justify-content: center;
            padding: 20px;
        }

        .modal.active {
            display: flex;
        }

        .modal-content {
            background: var(--bg-primary);
            border-radius: 16px;
            width: 100%;
            max-width: 600px;
            max-height: 90vh;
            overflow-y: auto;
            box-shadow: var(--shadow-lg);
            animation: modalSlideIn 0.3s ease;
        }

        @keyframes modalSlideIn {
            from {
                opacity: 0;
                transform: translateY(-20px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        .modal-header {
            padding: 24px;
            border-bottom: 1px solid var(--border-color);
            display: flex;
            align-items: center;
            justify-content: space-between;
        }

        .modal-title {
            font-size: 20px;
            font-weight: 600;
            color: var(--text-primary);
        }

        .modal-close {
            background: none;
            border: none;
            font-size: 24px;
            color: var(--text-secondary);
            cursor: pointer;
            padding: 4px;
            border-radius: 4px;
            transition: all 0.2s;
        }

        .modal-close:hover {
            background: var(--bg-secondary);
            color: var(--text-primary);
        }

        .modal-body {
            padding: 24px;
        }

        .modal-footer {
            padding: 24px;
            border-top: 1px solid var(--border-color);
            display: flex;
            gap: 12px;
            justify-content: flex-end;
        }

        /* Form */
        .form-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: 20px;
        }

        .form-group {
            margin-bottom: 20px;
        }

        .form-group.full-width {
            grid-column: 1 / -1;
        }

        .form-label {
            display: block;
            margin-bottom: 8px;
            font-size: 14px;
            font-weight: 500;
            color: var(--text-primary);
        }

        .form-input,
        .form-select,
        .form-textarea {
            width: 100%;
            padding: 10px 16px;
            border: 1px solid var(--border-color);
            border-radius: 8px;
            background: var(--bg-primary);
            color: var(--text-primary);
            font-size: 14px;
            font-family: inherit;
            transition: all 0.2s;
        }

        .form-input:focus,
        .form-select:focus,
        .form-textarea:focus {
            outline: none;
            border-color: var(--accent-primary);
            box-shadow: 0 0 0 3px rgba(77, 159, 255, 0.1);
        }

        .form-textarea {
            resize: vertical;
            min-height: 100px;
        }

        /* Action Buttons */
        .action-buttons {
            display: flex;
            gap: 8px;
        }

        .action-btn {
            padding: 6px 12px;
            border: none;
            border-radius: 6px;
            font-size: 13px;
            cursor: pointer;
            transition: all 0.2s;
            background: var(--bg-secondary);
            color: var(--text-primary);
            border: 1px solid var(--border-color);
        }

        .action-btn:hover {
            background: var(--bg-tertiary);
            transform: translateY(-1px);
        }

        .action-btn.edit {
            color: var(--accent-primary);
        }

        .action-btn.delete {
            color: var(--danger);
        }

        /* Empty State */
        .empty-state {
            text-align: center;
            padding: 60px 20px;
        }

        .empty-icon {
            font-size: 64px;
            color: var(--text-tertiary);
            margin-bottom: 16px;
        }

        .empty-title {
            font-size: 18px;
            font-weight: 600;
            color: var(--text-primary);
            margin-bottom: 8px;
        }

        .empty-text {
            font-size: 14px;
            color: var(--text-secondary);
            margin-bottom: 24px;
        }

        /* Responsive */
        @media (max-width: 1024px) {
            .sidebar {
                transform: translateX(-100%);
            }

            .sidebar.active {
                transform: translateX(0);
            }

            .main-content {
                margin-left: 0;
            }

            .menu-toggle {
                display: block;
            }
        }

        @media (max-width: 768px) {
            .main-content {
                padding: 20px;
            }

            .page-title {
                font-size: 24px;
            }

            .stats-grid {
                grid-template-columns: 1fr;
            }

            .section-header {
                flex-direction: column;
                align-items: flex-start;
            }

            .search-bar {
                max-width: 100%;
            }

            .table-container {
                overflow-x: auto;
            }

            .table {
                min-width: 800px;
            }

            .form-grid {
                grid-template-columns: 1fr;
            }

            .user-menu span {
                display: none;
            }
        }

        @media (max-width: 480px) {
            .header {
                padding: 0 16px;
            }

            .logo {
                font-size: 20px;
            }

            .theme-toggle span {
                display: none;
            }

            .stat-value {
                font-size: 24px;
            }

            .modal-content {
                margin: 0;
                border-radius: 0;
                max-height: 100vh;
            }
        }
    </style>
</head>
<body>
Header
<header class="header">
    <div class="header-left">
        <button class="menu-toggle" onclick="toggleSidebar()">☰</button>
        <div class="logo">
            <span></span>
            <span>Clinica Admin</span>
        </div>
    </div>
    <div class="header-right">
        <button class="theme-toggle" onclick="toggleTheme()">
            <span id="theme-icon">🌙</span>
            <span>Dark Mode</span>
        </button>
        <div class="user-menu">
            <div class="user-avatar">AD</div>
            <span>Admin</span>
        </div>
    </div>
</header>

Sidebar
<aside class="sidebar" id="sidebar">
    <nav class="nav-section">
        <div class="nav-section-title">Main</div>
        <a class="nav-item active" onclick="showSection('dashboard')">
            <span class="nav-icon"></span>
            <span>Dashboard</span>
        </a>
    </nav>

    <nav class="nav-section">
        <div class="nav-section-title">User Management</div>
        <a class="nav-item" onclick="showSection('doctors')">
            <span class="nav-icon"></span>
            <span>Doctors</span>
        </a>
        <a class="nav-item" onclick="showSection('patients')">
            <span class="nav-icon"></span>
            <span>Patients</span>
        </a>
        <a class="nav-item" onclick="showSection('staff')">
            <span class="nav-icon"></span>
            <span>Staff</span>
        </a>
    </nav>

    <nav class="nav-section">
        <div class="nav-section-title">Clinical</div>
        <a class="nav-item" onclick="showSection('appointments')">
            <span class="nav-icon"></span>
            <span>Appointments</span>
        </a>
        <a class="nav-item" onclick="showSection('medical-notes')">
            <span class="nav-icon"></span>
            <span>Medical Notes</span>
        </a>
        <a class="nav-item" onclick="showSection('availability')">
            <span class="nav-icon"></span>
            <span>Availability</span>
        </a>
    </nav>

    <nav class="nav-section">
        <div class="nav-section-title">Organization</div>
        <a class="nav-item" onclick="showSection('departments')">
            <span class="nav-icon"></span>
            <span>Departments</span>
        </a>
        <a class="nav-item" onclick="showSection('specialities')">
            <span class="nav-icon"></span>
            <span>Specialities</span>
        </a>
    </nav>
</aside>

Main Content
<main class="main-content" id="mainContent">
    <section class="content-section active" id="dashboard">
        <div class="page-header">
            <h1 class="page-title">Dashboard Overview</h1>
            <p class="page-subtitle">Welcome back! Here's what's happening today.</p>
        </div>

        <div class="stats-grid">
            <div class="stat-card">
                <div class="stat-header">
                    <div class="stat-icon blue">👨‍⚕️</div>
                </div>
                <div class="stat-value">48</div>
                <div class="stat-label">Total Doctors</div>
            </div>

            <div class="stat-card">
                <div class="stat-header">
                    <div class="stat-icon green">🧑‍</div>
                </div>
                <div class="stat-value">1,234</div>
                <div class="stat-label">Total Patients</div>
            </div>

            <div class="stat-card">
                <div class="stat-header">
                    <div class="stat-icon orange">📅</div>
                </div>
                <div class="stat-value">156</div>
                <div class="stat-label">Today's Appointments</div>
            </div>

            <div class="stat-card">
                <div class="stat-header">
                    <div class="stat-icon red">👥</div>
                </div>
                <div class="stat-value">32</div>
                <div class="stat-label">Staff Members</div>
            </div>

            <div class="stat-card">
                <div class="stat-header">
                    <div class="stat-icon cyan">🏢</div>
                </div>
                <div class="stat-value">12</div>
                <div class="stat-label">Departments</div>
            </div>

            <div class="stat-card">
                <div class="stat-header">
                    <div class="stat-icon blue">⚕️</div>
                </div>
                <div class="stat-value">28</div>
                <div class="stat-label">Specialities</div>
            </div>
        </div>
    </section>

    <section class="content-section" id="doctors">
        <div class="section-header">
            <h2 class="section-title">Doctors Management</h2>
            <div class="section-actions">
                <div class="search-bar">
                    <span class="search-icon">🔍</span>
                    <input type="text" class="search-input" placeholder="Search doctors...">
                </div>
                <button class="btn btn-primary" onclick="openModal('doctorModal')">
                    <span>➕</span>
                    Add Doctor
                </button>
            </div>
        </div>

        <div class="table-container">
            <table class="table">
                <thead>
                <tr>
                    <th>ID</th>
                    <th>Name</th>
                    <th>Email</th>
                    <th>Registration</th>
                    <th>Title</th>
                    <th>Speciality</th>
                    <th>Department</th>
                    <th>Status</th>
                    <th>Actions</th>
                </tr>
                </thead>
                <tbody>
                <tr>
                    <td>1</td>
                    <td>Dr. Sarah Johnson</td>
                    <td>sarah.johnson@clinica.com</td>
                    <td>REG-2024-001</td>
                    <td>Senior Consultant</td>
                    <td>Cardiology</td>
                    <td>Internal Medicine</td>
                    <td><span class="badge badge-success">Active</span></td>
                    <td>
                        <div class="action-buttons">
                            <button class="action-btn edit">Edit</button>
                            <button class="action-btn delete">Delete</button>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td>2</td>
                    <td>Dr. Michael Chen</td>
                    <td>michael.chen@clinica.com</td>
                    <td>REG-2024-002</td>
                    <td>Consultant</td>
                    <td>Neurology</td>
                    <td>Neuroscience</td>
                    <td><span class="badge badge-success">Active</span></td>
                    <td>
                        <div class="action-buttons">
                            <button class="action-btn edit">Edit</button>
                            <button class="action-btn delete">Delete</button>
                        </div>
                    </td>
                </tr>
                </tbody>
            </table>
        </div>
    </section>

    <section class="content-section" id="patients">
        <div class="section-header">
            <h2 class="section-title">Patients Management</h2>
            <div class="section-actions">
                <div class="search-bar">
                    <span class="search-icon">🔍</span>
                    <input type="text" class="search-input" placeholder="Search patients...">
                </div>
                <button class="btn btn-primary" onclick="openModal('patientModal')">
                    <span>➕</span>
                    Add Patient
                </button>
            </div>
        </div>

        <div class="table-container">
            <table class="table">
                <thead>
                <tr>
                    <th>ID</th>
                    <th>Name</th>
                    <th>Email</th>
                    <th>CIN</th>
                    <th>Birth Date</th>
                    <th>Sex</th>
                    <th>Blood Type</th>
                    <th>Status</th>
                    <th>Actions</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="p" items="${patients}">
                    <tr>
                        <td>${p.id}</td>
                        <td>${p.name}</td>
                        <td>${p.email}</td>
                        <td>${p.cin}</td>
                        <td>${p.birthDate}</td>
                        <td>${p.sex}</td>
                        <td>
            <span class="badge>
                <c:choose>
                    <c:when test="${p.blood eq 'A_POSITIVE'}">badge-danger</c:when>
                    <c:otherwise>badge-info</c:otherwise>
                </c:choose>">
                    ${p.blood}
            </span>
                        </td>
                        <td>
            <span class="badge
                <c:choose>
                    <c:when test="${p.active}">badge-success</c:when>
                    <c:otherwise>badge-secondary</c:otherwise>
                </c:choose>">
                <c:out value="${p.active ? 'Active' : 'Inactive'}"/>
            </span>
                        </td>
                        <td>
                            <div class="action-buttons">
                                <button class="action-btn edit" onclick="editPatient(${p.id})">Edit</button>
                                <button class="action-btn delete" onclick="deletePatient(${p.id})">Delete</button>
                            </div>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </section>

    <section class="content-section" id="staff">
        <div class="section-header">
            <h2 class="section-title">Staff Management</h2>
            <div class="section-actions">
                <div class="search-bar">
                    <span class="search-icon">🔍</span>
                    <input type="text" class="search-input" placeholder="Search staff...">
                </div>
                <button class="btn btn-primary" onclick="openModal('staffModal')">
                    <span>➕</span>
                    Add Staff
                </button>
            </div>
        </div>

        <div class="table-container">
            <table class="table">
                <thead>
                <tr>
                    <th>ID</th>
                    <th>Name</th>
                    <th>Email</th>
                    <th>Phone</th>
                    <th>Position</th>
                    <th>Status</th>
                    <th>Actions</th>
                </tr>
                </thead>
                <tbody>
                <tr>
                    <td>1</td>
                    <td>Alice Brown</td>
                    <td>alice.brown@clinica.com</td>
                    <td>+1 234 567 8901</td>
                    <td>Receptionist</td>
                    <td><span class="badge badge-success">Active</span></td>
                    <td>
                        <div class="action-buttons">
                            <button class="action-btn edit">Edit</button>
                            <button class="action-btn delete">Delete</button>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td>2</td>
                    <td>Robert Davis</td>
                    <td>robert.davis@clinica.com</td>
                    <td>+1 234 567 8902</td>
                    <td>Nurse</td>
                    <td><span class="badge badge-success">Active</span></td>
                    <td>
                        <div class="action-buttons">
                            <button class="action-btn edit">Edit</button>
                            <button class="action-btn delete">Delete</button>
                        </div>
                    </td>
                </tr>
                </tbody>
            </table>
        </div>
    </section>

    <section class="content-section" id="appointments">
        <div class="section-header">
            <h2 class="section-title">Appointments Management</h2>
            <div class="section-actions">
                <div class="search-bar">
                    <span class="search-icon">🔍</span>
                    <input type="text" class="search-input" placeholder="Search appointments...">
                </div>
                <button class="btn btn-primary" onclick="openModal('appointmentModal')">
                    <span>➕</span>
                    New Appointment
                </button>
            </div>
        </div>

        <div class="table-container">
            <table class="table">
                <thead>
                <tr>
                    <th>ID</th>
                    <th>Patient</th>
                    <th>Doctor</th>
                    <th>Start Time</th>
                    <th>End Time</th>
                    <th>Type</th>
                    <th>Status</th>
                    <th>Actions</th>
                </tr>
                </thead>
                <tbody>
                <tr>
                    <td>1</td>
                    <td>John Smith</td>
                    <td>Dr. Sarah Johnson</td>
                    <td>2025-01-15 09:00</td>
                    <td>2025-01-15 09:30</td>
                    <td><span class="badge badge-info">Consultation</span></td>
                    <td><span class="badge badge-warning">Scheduled</span></td>
                    <td>
                        <div class="action-buttons">
                            <button class="action-btn edit">Edit</button>
                            <button class="action-btn delete">Cancel</button>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td>2</td>
                    <td>Emma Wilson</td>
                    <td>Dr. Michael Chen</td>
                    <td>2025-01-15 10:00</td>
                    <td>2025-01-15 10:45</td>
                    <td><span class="badge badge-info">Follow-up</span></td>
                    <td><span class="badge badge-success">Completed</span></td>
                    <td>
                        <div class="action-buttons">
                            <button class="action-btn edit">View</button>
                            <button class="action-btn delete">Delete</button>
                        </div>
                    </td>
                </tr>
                </tbody>
            </table>
        </div>
    </section>

    <section class="content-section" id="medical-notes">
        <div class="section-header">
            <h2 class="section-title">Medical Notes</h2>
            <div class="section-actions">
                <div class="search-bar">
                    <span class="search-icon">🔍</span>
                    <input type="text" class="search-input" placeholder="Search notes...">
                </div>
                <button class="btn btn-primary" onclick="openModal('noteModal')">
                    <span>➕</span>
                    Add Note
                </button>
            </div>
        </div>

        <div class="table-container">
            <table class="table">
                <thead>
                <tr>
                    <th>ID</th>
                    <th>Appointment</th>
                    <th>Doctor</th>
                    <th>Content Preview</th>
                    <th>Status</th>
                    <th>Actions</th>
                </tr>
                </thead>
                <tbody>
                <tr>
                    <td>1</td>
                    <td>#1 - John Smith</td>
                    <td>Dr. Sarah Johnson</td>
                    <td>Patient presents with chest pain...</td>
                    <td><span class="badge badge-danger">Locked</span></td>
                    <td>
                        <div class="action-buttons">
                            <button class="action-btn edit">View</button>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td>2</td>
                    <td>#2 - Emma Wilson</td>
                    <td>Dr. Michael Chen</td>
                    <td>Follow-up examination shows improvement...</td>
                    <td><span class="badge badge-success">Unlocked</span></td>
                    <td>
                        <div class="action-buttons">
                            <button class="action-btn edit">Edit</button>
                            <button class="action-btn delete">Delete</button>
                        </div>
                    </td>
                </tr>
                </tbody>
            </table>
        </div>
    </section>

    <section class="content-section" id="availability">
        <div class="section-header">
            <h2 class="section-title">Doctor Availability</h2>
            <div class="section-actions">
                <div class="search-bar">
                    <span class="search-icon">🔍</span>
                    <input type="text" class="search-input" placeholder="Search availability...">
                </div>
                <button class="btn btn-primary" onclick="openModal('availabilityModal')">
                    <span>➕</span>
                    Add Availability
                </button>
            </div>
        </div>

        <div class="table-container">
            <table class="table">
                <thead>
                <tr>
                    <th>ID</th>
                    <th>Doctor</th>
                    <th>Day</th>
                    <th>Start Time</th>
                    <th>End Time</th>
                    <th>Status</th>
                    <th>Actions</th>
                </tr>
                </thead>
                <tbody>
                <tr>
                    <td>1</td>
                    <td>Dr. Sarah Johnson</td>
                    <td>2025-01-15</td>
                    <td>09:00</td>
                    <td>17:00</td>
                    <td><span class="badge badge-success">Available</span></td>
                    <td>
                        <div class="action-buttons">
                            <button class="action-btn edit">Edit</button>
                            <button class="action-btn delete">Delete</button>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td>2</td>
                    <td>Dr. Michael Chen</td>
                    <td>2025-01-15</td>
                    <td>10:00</td>
                    <td>18:00</td>
                    <td><span class="badge badge-warning">Busy</span></td>
                    <td>
                        <div class="action-buttons">
                            <button class="action-btn edit">Edit</button>
                            <button class="action-btn delete">Delete</button>
                        </div>
                    </td>
                </tr>
                </tbody>
            </table>
        </div>
    </section>

    <section class="content-section" id="departments">
        <div class="section-header">
            <h2 class="section-title">Departments Management</h2>
            <div class="section-actions">
                <div class="search-bar">
                    <span class="search-icon">🔍</span>
                    <input type="text" class="search-input" placeholder="Search departments...">
                </div>
                <button class="btn btn-primary" onclick="openModal('departmentModal')">
                    <span>➕</span>
                    Add Department
                </button>
            </div>
        </div>

        <div class="table-container">
            <table class="table">
                <thead>
                <tr>
                    <th>ID</th>
                    <th>Code</th>
                    <th>Name</th>
                    <th>Description</th>
                    <th>Specialities</th>
                    <th>Actions</th>
                </tr>
                </thead>
                <tbody>
                <tr>
                    <td>1</td>
                    <td>DEPT-001</td>
                    <td>Internal Medicine</td>
                    <td>General internal medicine and diagnostics</td>
                    <td><span class="badge badge-info">5 Specialities</span></td>
                    <td>
                        <div class="action-buttons">
                            <button class="action-btn edit">Edit</button>
                            <button class="action-btn delete">Delete</button>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td>2</td>
                    <td>DEPT-002</td>
                    <td>Surgery</td>
                    <td>Surgical procedures and operations</td>
                    <td><span class="badge badge-info">8 Specialities</span></td>
                    <td>
                        <div class="action-buttons">
                            <button class="action-btn edit">Edit</button>
                            <button class="action-btn delete">Delete</button>
                        </div>
                    </td>
                </tr>
                </tbody>
            </table>
        </div>
    </section>

    <section class="content-section" id="specialities">
        <div class="section-header">
            <h2 class="section-title">Specialities Management</h2>
            <div class="section-actions">
                <div class="search-bar">
                    <span class="search-icon">🔍</span>
                    <input type="text" class="search-input" placeholder="Search specialities...">
                </div>
                <button class="btn btn-primary" onclick="openModal('specialityModal')">
                    <span>➕</span>
                    Add Speciality
                </button>
            </div>
        </div>

        <div class="table-container">
            <table class="table">
                <thead>
                <tr>
                    <th>ID</th>
                    <th>Code</th>
                    <th>Name</th>
                    <th>Description</th>
                    <th>Department</th>
                    <th>Doctors</th>
                    <th>Actions</th>
                </tr>
                </thead>
                <tbody>
                <tr>
                    <td>1</td>
                    <td>SPEC-001</td>
                    <td>Cardiology</td>
                    <td>Heart and cardiovascular system</td>
                    <td>Internal Medicine</td>
                    <td><span class="badge badge-info">12 Doctors</span></td>
                    <td>
                        <div class="action-buttons">
                            <button class="action-btn edit">Edit</button>
                            <button class="action-btn delete">Delete</button>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td>2</td>
                    <td>SPEC-002</td>
                    <td>Neurology</td>
                    <td>Brain and nervous system</td>
                    <td>Neuroscience</td>
                    <td><span class="badge badge-info">8 Doctors</span></td>
                    <td>
                        <div class="action-buttons">
                            <button class="action-btn edit">Edit</button>
                            <button class="action-btn delete">Delete</button>
                        </div>
                    </td>
                </tr>
                </tbody>
            </table>
        </div>
    </section>
</main>

Modals
<div class="modal" id="doctorModal">
    <div class="modal-content">
        <div class="modal-header">
            <h3 class="modal-title">Add New Doctor</h3>
            <button class="modal-close" onclick="closeModal('doctorModal')">×</button>
        </div>
        <div class="modal-body">
            <form class="form-grid">
                <div class="form-group">
                    <label class="form-label">Name</label>
                    <input type="text" class="form-input" placeholder="Enter full name">
                </div>
                <div class="form-group">
                    <label class="form-label">Email</label>
                    <input type="email" class="form-input" placeholder="doctor@clinica.com">
                </div>
                <div class="form-group">
                    <label class="form-label">Phone</label>
                    <input type="tel" class="form-input" placeholder="+1 234 567 8900">
                </div>
                <div class="form-group">
                    <label class="form-label">Registration</label>
                    <input type="text" class="form-input" placeholder="REG-2024-XXX">
                </div>
                <div class="form-group">
                    <label class="form-label">Title</label>
                    <input type="text" class="form-input" placeholder="e.g., Senior Consultant">
                </div>
                <div class="form-group">
                    <label class="form-label">Speciality</label>
                    <select class="form-select">
                        <option>Select speciality</option>
                        <option>Cardiology</option>
                        <option>Neurology</option>
                        <option>Pediatrics</option>
                    </select>
                </div>
                <div class="form-group">
                    <label class="form-label">Department</label>
                    <select class="form-select">
                        <option>Select department</option>
                        <option>Internal Medicine</option>
                        <option>Surgery</option>
                        <option>Emergency</option>
                    </select>
                </div>
                <div class="form-group">
                    <label class="form-label">Password</label>
                    <input type="password" class="form-input" placeholder="Enter password">
                </div>
            </form>
        </div>
        <div class="modal-footer">
            <button class="btn btn-secondary" onclick="closeModal('doctorModal')">Cancel</button>
            <button class="btn btn-primary">Save Doctor</button>
        </div>
    </div>
</div>

<div class="modal" id="patientModal">
    <div class="modal-content">
        <div class="modal-header">
            <h3 class="modal-title">Add New Patient</h3>
            <button class="modal-close" onclick="closeModal('patientModal')">×</button>
        </div>
        <div class="modal-body">
            <form class="form-grid" method="post" action="/patients/create">
                <div class="form-group">
                    <label class="form-label">Name</label>
                    <input type="text" name="name" class="form-input" placeholder="Enter full name">
                </div>
                <div class="form-group">
                    <label class="form-label">Email</label>
                    <input type="email" name="email" class="form-input" placeholder="patient@email.com">
                </div>
                <div class="form-group">
                    <label class="form-label">Phone</label>
                    <input type="tel" name="phone" class="form-input" placeholder="+1 234 567 8900">
                </div>
                <div class="form-group">
                    <label class="form-label">CIN</label>
                    <input type="text" name="cin" class="form-input" placeholder="AB123456">
                </div>
                <div class="form-group">
                    <label class="form-label">Birth Date</label>
                    <input type="date" name="dateOfBirth" class="form-input">
                </div>
                <div class="form-group">
                    <label class="form-label">Sex</label>
                    <select name="gender" class="form-select">
                        <option value="male">Male</option>
                        <option value="female">Female</option>
                    </select>
                </div>
                <div class="form-group">
                    <label class="form-label">Blood Type</label>
                    <select class="form-select" name="blood" id="blood" required>
                        <c:forEach var="type" items="${bloodTypes}">
                            <option value="${type}">${type}</option>
                        </c:forEach>
                    </select>
                </div>
                <div class="form-group">
                    <label class="form-label">Password</label>
                    <input type="password" name="password" class="form-input" placeholder="Enter password">
                </div>
                <div class="form-group full-width">
                    <label class="form-label">Address</label>
                    <textarea class="form-textarea" name="address" placeholder="Enter full address"></textarea>
                </div>

                <div class="modal-footer">
                    <button class="btn btn-secondary" onclick="closeModal('patientModal')">Cancel</button>
                    <button type="submit" class="btn btn-primary">Save Patient</button>
                </div>
            </form>
        </div>
    </div>
</div>

<div class="modal" id="staffModal">
    <div class="modal-content">
        <div class="modal-header">
            <h3 class="modal-title">Add New Staff</h3>
            <button class="modal-close" onclick="closeModal('staffModal')">×</button>
        </div>
        <div class="modal-body">
            <form class="form-grid">
                <div class="form-group">
                    <label class="form-label">Name</label>
                    <input type="text" class="form-input" placeholder="Enter full name">
                </div>
                <div class="form-group">
                    <label class="form-label">Email</label>
                    <input type="email" class="form-input" placeholder="staff@clinica.com">
                </div>
                <div class="form-group">
                    <label class="form-label">Phone</label>
                    <input type="tel" class="form-input" placeholder="+1 234 567 8900">
                </div>
                <div class="form-group">
                    <label class="form-label">Position</label>
                    <input type="text" class="form-input" placeholder="e.g., Receptionist, Nurse">
                </div>
                <div class="form-group">
                    <label class="form-label">Password</label>
                    <input type="password" class="form-input" placeholder="Enter password">
                </div>
            </form>
        </div>
        <div class="modal-footer">
            <button class="btn btn-secondary" onclick="closeModal('staffModal')">Cancel</button>
            <button class="btn btn-primary">Save Staff</button>
        </div>
    </div>
</div>

<div class="modal" id="appointmentModal">
    <div class="modal-content">
        <div class="modal-header">
            <h3 class="modal-title">Create New Appointment</h3>
            <button class="modal-close" onclick="closeModal('appointmentModal')">×</button>
        </div>
        <div class="modal-body">
            <form class="form-grid">
                <div class="form-group">
                    <label class="form-label">Patient</label>
                    <select class="form-select">
                        <option>Select patient</option>
                        <option>John Smith</option>
                        <option>Emma Wilson</option>
                    </select>
                </div>
                <div class="form-group">
                    <label class="form-label">Doctor</label>
                    <select class="form-select">
                        <option>Select doctor</option>
                        <option>Dr. Sarah Johnson</option>
                        <option>Dr. Michael Chen</option>
                    </select>
                </div>
                <div class="form-group">
                    <label class="form-label">Start Date & Time</label>
                    <input type="datetime-local" class="form-input">
                </div>
                <div class="form-group">
                    <label class="form-label">End Date & Time</label>
                    <input type="datetime-local" class="form-input">
                </div>
                <div class="form-group">
                    <label class="form-label">Type</label>
                    <select class="form-select">
                        <option>Select type</option>
                        <option>Consultation</option>
                        <option>Follow-up</option>
                        <option>Emergency</option>
                        <option>Surgery</option>
                    </select>
                </div>
                <div class="form-group">
                    <label class="form-label">Status</label>
                    <select class="form-select">
                        <option>Scheduled</option>
                        <option>Confirmed</option>
                        <option>In Progress</option>
                        <option>Completed</option>
                        <option>Cancelled</option>
                    </select>
                </div>
                <div class="form-group full-width">
                    <label class="form-label">Executor</label>
                    <input type="text" class="form-input" placeholder="Enter executor name">
                </div>
            </form>
        </div>
        <div class="modal-footer">
            <button class="btn btn-secondary" onclick="closeModal('appointmentModal')">Cancel</button>
            <button class="btn btn-primary">Create Appointment</button>
        </div>
    </div>
</div>

<div class="modal" id="noteModal">
    <div class="modal-content">
        <div class="modal-header">
            <h3 class="modal-title">Add Medical Note</h3>
            <button class="modal-close" onclick="closeModal('noteModal')">×</button>
        </div>
        <div class="modal-body">
            <form>
                <div class="form-group">
                    <label class="form-label">Appointment</label>
                    <select class="form-select">
                        <option>Select appointment</option>
                        <option>#1 - John Smith - Dr. Sarah Johnson</option>
                        <option>#2 - Emma Wilson - Dr. Michael Chen</option>
                    </select>
                </div>
                <div class="form-group">
                    <label class="form-label">Doctor</label>
                    <select class="form-select">
                        <option>Select doctor</option>
                        <option>Dr. Sarah Johnson</option>
                        <option>Dr. Michael Chen</option>
                    </select>
                </div>
                <div class="form-group">
                    <label class="form-label">Content</label>
                    <textarea class="form-textarea" placeholder="Enter medical note content..." style="min-height: 200px;"></textarea>
                </div>
                <div class="form-group">
                    <label style="display: flex; align-items: center; gap: 8px; cursor: pointer;">
                        <input type="checkbox" style="width: auto;">
                        <span class="form-label" style="margin: 0;">Lock this note (cannot be edited after saving)</span>
                    </label>
                </div>
            </form>
        </div>
        <div class="modal-footer">
            <button class="btn btn-secondary" onclick="closeModal('noteModal')">Cancel</button>
            <button class="btn btn-primary">Save Note</button>
        </div>
    </div>
</div>

<div class="modal" id="availabilityModal">
    <div class="modal-content">
        <div class="modal-header">
            <h3 class="modal-title">Add Doctor Availability</h3>
            <button class="modal-close" onclick="closeModal('availabilityModal')">×</button>
        </div>
        <div class="modal-body">
            <form class="form-grid">
                <div class="form-group">
                    <label class="form-label">Doctor</label>
                    <select class="form-select">
                        <option>Select doctor</option>
                        <option>Dr. Sarah Johnson</option>
                        <option>Dr. Michael Chen</option>
                    </select>
                </div>
                <div class="form-group">
                    <label class="form-label">Day</label>
                    <input type="date" class="form-input">
                </div>
                <div class="form-group">
                    <label class="form-label">Start Time</label>
                    <input type="time" class="form-input">
                </div>
                <div class="form-group">
                    <label class="form-label">End Time</label>
                    <input type="time" class="form-input">
                </div>
                <div class="form-group full-width">
                    <label class="form-label">Status</label>
                    <select class="form-select">
                        <option>Available</option>
                        <option>Busy</option>
                        <option>Off Duty</option>
                    </select>
                </div>
            </form>
        </div>
        <div class="modal-footer">
            <button class="btn btn-secondary" onclick="closeModal('availabilityModal')">Cancel</button>
            <button class="btn btn-primary">Save Availability</button>
        </div>
    </div>
</div>

<div class="modal" id="departmentModal">
    <div class="modal-content">
        <div class="modal-header">
            <h3 class="modal-title">Add New Department</h3>
            <button class="modal-close" onclick="closeModal('departmentModal')">×</button>
        </div>
        <div class="modal-body">
            <form>
                <div class="form-group">
                    <label class="form-label">Code</label>
                    <input type="text" class="form-input" placeholder="DEPT-XXX">
                </div>
                <div class="form-group">
                    <label class="form-label">Name</label>
                    <input type="text" class="form-input" placeholder="Enter department name">
                </div>
                <div class="form-group">
                    <label class="form-label">Description</label>
                    <textarea class="form-textarea" placeholder="Enter department description"></textarea>
                </div>
            </form>
        </div>
        <div class="modal-footer">
            <button class="btn btn-secondary" onclick="closeModal('departmentModal')">Cancel</button>
            <button class="btn btn-primary">Save Department</button>
        </div>
    </div>
</div>

<div class="modal" id="specialityModal">
    <div class="modal-content">
        <div class="modal-header">
            <h3 class="modal-title">Add New Speciality</h3>
            <button class="modal-close" onclick="closeModal('specialityModal')">×</button>
        </div>
        <div class="modal-body">
            <form>
                <div class="form-group">
                    <label class="form-label">Code</label>
                    <input type="text" class="form-input" placeholder="SPEC-XXX">
                </div>
                <div class="form-group">
                    <label class="form-label">Name</label>
                    <input type="text" class="form-input" placeholder="Enter speciality name">
                </div>
                <div class="form-group">
                    <label class="form-label">Department</label>
                    <select class="form-select">
                        <option>Select department</option>
                        <option>Internal Medicine</option>
                        <option>Surgery</option>
                        <option>Emergency</option>
                    </select>
                </div>
                <div class="form-group">
                    <label class="form-label">Description</label>
                    <textarea class="form-textarea" placeholder="Enter speciality description"></textarea>
                </div>
            </form>
        </div>
        <div class="modal-footer">
            <button class="btn btn-secondary" onclick="closeModal('specialityModal')">Cancel</button>
            <button class="btn btn-primary">Save Speciality</button>
        </div>
    </div>
</div>

<script>
    // Theme Management
    function toggleTheme() {
        const html = document.documentElement;
        const currentTheme = html.getAttribute('data-theme');
        const newTheme = currentTheme === 'dark' ? 'light' : 'dark';
        const themeIcon = document.getElementById('theme-icon');
        const themeText = document.querySelector('.theme-toggle span:last-child');

        html.setAttribute('data-theme', newTheme);
        localStorage.setItem('theme', newTheme);

        if (newTheme === 'dark') {
            themeIcon.textContent = '🌙';
            themeText.textContent = 'Dark Mode';
        } else {
            themeIcon.textContent = '☀️';
            themeText.textContent = 'Light Mode';
        }
    }

    // Load saved theme
    window.addEventListener('DOMContentLoaded', () => {
        const savedTheme = localStorage.getItem('theme') || 'light';
        const themeIcon = document.getElementById('theme-icon');
        const themeText = document.querySelector('.theme-toggle span:last-child');

        document.documentElement.setAttribute('data-theme', savedTheme);

        if (savedTheme === 'dark') {
            themeIcon.textContent = '🌙';
            themeText.textContent = 'Dark Mode';
        } else {
            themeIcon.textContent = '☀️';
            themeText.textContent = 'Light Mode';
        }
    });

    // Sidebar Management
    function toggleSidebar() {
        const sidebar = document.getElementById('sidebar');
        const mainContent = document.getElementById('mainContent');

        sidebar.classList.toggle('active');

        if (window.innerWidth <= 1024) {
            sidebar.classList.toggle('collapsed');
        }
    }

    // Section Navigation
    function showSection(sectionId) {
        // Hide all sections
        const sections = document.querySelectorAll('.content-section');
        sections.forEach(section => section.classList.remove('active'));

        // Show selected section
        const targetSection = document.getElementById(sectionId);
        if (targetSection) {
            targetSection.classList.add('active');
        }

        // Update nav items
        const navItems = document.querySelectorAll('.nav-item');
        navItems.forEach(item => item.classList.remove('active'));
        event.currentTarget.classList.add('active');

        // Close sidebar on mobile
        if (window.innerWidth <= 1024) {
            const sidebar = document.getElementById('sidebar');
            sidebar.classList.remove('active');
        }
    }

    // Modal Management
    function openModal(modalId) {
        const modal = document.getElementById(modalId);
        if (modal) {
            modal.classList.add('active');
            document.body.style.overflow = 'hidden';
        }
    }

    function closeModal(modalId) {
        const modal = document.getElementById(modalId);
        if (modal) {
            modal.classList.remove('active');
            document.body.style.overflow = 'auto';
        }
    }

    // Close modal when clicking outside
    window.addEventListener('click', (e) => {
        if (e.target.classList.contains('modal')) {
            e.target.classList.remove('active');
            document.body.style.overflow = 'auto';
        }
    });

    // Responsive sidebar handling
    window.addEventListener('resize', () => {
        const sidebar = document.getElementById('sidebar');
        const mainContent = document.getElementById('mainContent');

        if (window.innerWidth > 1024) {
            sidebar.classList.remove('collapsed', 'active');
            mainContent.classList.remove('expanded');
        } else {
            sidebar.classList.add('collapsed');
            sidebar.classList.remove('active');
        }
    });
</script>
</body>
</html>