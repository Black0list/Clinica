<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Clinica - Healthcare Management System</title>
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
            --background: #f0f9ff;
            --surface: #ffffff;
            --text: #0f172a;
            --text-light: #64748b;
            --border: #e2e8f0;
            --shadow: rgba(8, 145, 178, 0.1);
        }

        body {
            font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, 'Helvetica Neue', Arial, sans-serif;
            background: linear-gradient(135deg, var(--background) 0%, #e0f2fe 100%);
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 1rem;
            color: var(--text);
        }

        .container {
            width: 100%;
            max-width: 500px;
            display: flex;
            align-items: center;
            grid-template-columns: 1fr;
            gap: 2rem;
        }

        @media (min-width: 768px) {
            .container {
                grid-template-columns: 1fr 1fr;
            }
        }

        .hero-section {
            display: none;
        }

        @media (min-width: 768px) {
            .hero-section {
                display: block;
                padding: 2rem;
            }
        }

        .hero-content h1 {
            font-size: 2.5rem;
            font-weight: 700;
            color: var(--primary);
            margin-bottom: 1rem;
            line-height: 1.2;
        }

        @media (min-width: 1024px) {
            .hero-content h1 {
                font-size: 3rem;
            }
        }

        .hero-content p {
            font-size: 1.125rem;
            color: var(--text-light);
            margin-bottom: 2rem;
            line-height: 1.6;
        }

        .hero-image {
            width: 100%;
            height: 300px;
            border-radius: 1rem;
            overflow: hidden;
            box-shadow: 0 20px 25px -5px var(--shadow);
        }

        @media (min-width: 1024px) {
            .hero-image {
                height: 400px;
            }
        }

        .hero-image img {
            width: 100%;
            height: 100%;
            object-fit: cover;
        }

        .auth-card {
            background: var(--surface);
            border-radius: 1rem;
            padding: 2rem;
            box-shadow: 0 10px 15px -3px var(--shadow);
            width: 100%;
        }

        @media (min-width: 640px) {
            .auth-card {
                padding: 3rem;
            }
        }

        .logo {
            text-align: center;
            margin-bottom: 2rem;
        }

        .logo h2 {
            font-size: 1.875rem;
            font-weight: 700;
            color: var(--primary);
            margin-bottom: 0.5rem;
        }

        .logo p {
            color: var(--text-light);
            font-size: 0.875rem;
        }

        .tabs {
            display: flex;
            gap: 0.5rem;
            margin-bottom: 2rem;
            background: var(--background);
            padding: 0.25rem;
            border-radius: 0.5rem;
        }

        .tab {
            flex: 1;
            padding: 0.75rem;
            border: none;
            background: transparent;
            color: var(--text-light);
            font-weight: 500;
            cursor: pointer;
            border-radius: 0.375rem;
            transition: all 0.3s ease;
            font-size: 0.875rem;
        }

        @media (min-width: 640px) {
            .tab {
                font-size: 1rem;
            }
        }

        .tab.active {
            background: var(--surface);
            color: var(--primary);
            box-shadow: 0 1px 3px rgba(0, 0, 0, 0.1);
        }

        .form-container {
            position: relative;
        }

        .form {
            display: none;
            animation: fadeIn 0.3s ease;
        }

        .form.active {
            display: block;
        }

        @keyframes fadeIn {
            from {
                opacity: 0;
                transform: translateY(10px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        .form-group {
            margin-bottom: 1.5rem;
        }

        .form-group label {
            display: block;
            margin-bottom: 0.5rem;
            color: var(--text);
            font-weight: 500;
            font-size: 0.875rem;
        }

        .form-group input {
            width: 100%;
            padding: 0.75rem 1rem;
            border: 2px solid var(--border);
            border-radius: 0.5rem;
            font-size: 1rem;
            transition: all 0.3s ease;
            background: var(--surface);
        }

        .form-group input:focus {
            outline: none;
            border-color: var(--primary);
            box-shadow: 0 0 0 3px rgba(8, 145, 178, 0.1);
        }

        .btn {
            width: 100%;
            padding: 0.875rem;
            border: none;
            border-radius: 0.5rem;
            font-size: 1rem;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s ease;
        }

        .btn-primary {
            background: var(--primary);
            color: white;
        }

        .btn-primary:hover {
            background: var(--primary-dark);
            transform: translateY(-2px);
            box-shadow: 0 10px 15px -3px var(--shadow);
        }

        .divider {
            display: flex;
            align-items: center;
            margin: 1.5rem 0;
            color: var(--text-light);
            font-size: 0.875rem;
        }

        .divider::before,
        .divider::after {
            content: '';
            flex: 1;
            height: 1px;
            background: var(--border);
        }

        .divider span {
            padding: 0 1rem;
        }


        @media (min-width: 640px) {

            .spinner {
                display: inline-block;
                width: 20px;
                height: 20px;
                border: 3px solid rgba(255, 255, 255, 0.3);
                border-radius: 50%;
                border-top-color: white;
                animation: spin 1s linear infinite;
            }

            @keyframes spin {
                to {
                    transform: rotate(360deg);
                }
            }

            .loading {
                opacity: 0.7;
                pointer-events: none;
            }
        }
    </style>
</head>
<body>
<div class="container">
    <div class="auth-card">
        <div class="logo">
            <h2>Clinica</h2>
            <p>Healthcare Management System</p>
        </div>

        <div class="tabs">
            <button class="tab active" onclick="switchTab('login')">Login</button>
            <button class="tab" onclick="switchTab('register')">Register</button>
        </div>

        <div class="form-container">
            <form class="form active" id="loginForm" onsubmit="handleLogin(event)">
                <div class="form-group">
                    <label for="loginEmail">Email Address</label>
                    <input type="email" id="loginEmail" name="email" required placeholder="doctor@clinica.com">
                </div>
                <div class="form-group">
                    <label for="loginPassword">Password</label>
                    <input type="password" id="loginPassword" name="password" required placeholder="Enter your password">
                </div>
                <button type="submit" class="btn btn-primary">
                    <span class="btn-text">Sign In</span>
                </button>
                <div class="divider">
                    <span>Secure Healthcare Access</span>
                </div>
            </form>

            <form class="form" id="registerForm" onsubmit="handleRegister(event)">
                <div class="form-group">
                    <label for="registerName">Full Name</label>
                    <input type="text" id="registerName" name="name" required placeholder="Dr. John Smith">
                </div>
                <div class="form-group">
                    <label for="registerEmail">Email Address</label>
                    <input type="email" id="registerEmail" name="email" required placeholder="doctor@clinica.com">
                </div>
                <div class="form-group">
                    <label for="registerPassword">Password</label>
                    <input type="password" id="registerPassword" name="password" required placeholder="Create a strong password">
                </div>
                <div class="form-group">
                    <label for="registerConfirm">Confirm Password</label>
                    <input type="password" id="registerConfirm" name="confirm" required placeholder="Confirm your password">
                </div>
                <button type="submit" class="btn btn-primary">
                    <span class="btn-text">Create Account</span>
                </button>
                <div class="divider">
                    <span>Join Our Healthcare Network</span>
                </div>
            </form>
        </div>
    </div>
</div>

<script>
    function switchTab(tab) {
        const tabs = document.querySelectorAll('.tab');
        const forms = document.querySelectorAll('.form');

        tabs.forEach(t => t.classList.remove('active'));
        forms.forEach(f => f.classList.remove('active'));

        if (tab === 'login') {
            tabs[0].classList.add('active');
            document.getElementById('loginForm').classList.add('active');
        } else {
            tabs[1].classList.add('active');
            document.getElementById('registerForm').classList.add('active');
        }
    }

    function handleLogin(event) {
        event.preventDefault();
        const btn = event.target.querySelector('.btn-primary');
        const btnText = btn.querySelector('.btn-text');

        btn.classList.add('loading');
        btnText.innerHTML = '<span class="spinner"></span>';

        setTimeout(() => {
            window.location.href = 'home.jsp';
        }, 1500);
    }

    function handleRegister(event) {
        event.preventDefault();
        const password = document.getElementById('registerPassword').value;
        const confirm = document.getElementById('registerConfirm').value;

        if (password !== confirm) {
            alert('Passwords do not match!');
            return;
        }

        const btn = event.target.querySelector('.btn-primary');
        const btnText = btn.querySelector('.btn-text');

        btn.classList.add('loading');
        btnText.innerHTML = '<span class="spinner"></span>';

        setTimeout(() => {
            alert('Account created successfully!');
            switchTab('login');
            btn.classList.remove('loading');
            btnText.textContent = 'Create Account';
        }, 1500);
    }
</script>
</body>
</html>
