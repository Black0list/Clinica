<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login - Clinica</title>
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
            --error: #dc2626;
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
            max-width: 480px;
        }

        .auth-card {
            background: var(--surface);
            border-radius: 1rem;
            padding: 2.5rem;
            box-shadow: 0 20px 50px -10px var(--shadow);
            animation: slideUp 0.5s ease;
        }

        @keyframes slideUp {
            from {
                opacity: 0;
                transform: translateY(30px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        .logo {
            text-align: center;
            margin-bottom: 2rem;
        }

        .logo h1 {
            font-size: 2.5rem;
            font-weight: 700;
            color: var(--primary);
            margin-bottom: 0.5rem;
        }

        .logo p {
            color: var(--text-light);
            font-size: 0.95rem;
        }

        .message {
            text-align: center;
            padding: 0.875rem;
            border-radius: 0.5rem;
            margin-bottom: 1.5rem;
            font-weight: 500;
            font-size: 0.9rem;
        }

        .message.error {
            background: #fef2f2;
            color: var(--error);
            border: 1px solid #fecaca;
        }

        .form-group {
            margin-bottom: 1.5rem;
        }

        .form-group label {
            display: block;
            margin-bottom: 0.5rem;
            color: var(--text);
            font-weight: 600;
            font-size: 0.9rem;
        }

        .form-group input {
            width: 100%;
            padding: 0.875rem 1rem;
            border: 2px solid var(--border);
            border-radius: 0.5rem;
            font-size: 1rem;
            transition: all 0.3s ease;
            background: var(--surface);
        }

        .form-group input:focus {
            outline: none;
            border-color: var(--primary);
            box-shadow: 0 0 0 4px rgba(8, 145, 178, 0.1);
        }

        .btn {
            width: 100%;
            padding: 1rem;
            border: none;
            border-radius: 0.5rem;
            font-size: 1rem;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s ease;
            margin-top: 0.5rem;
        }

        .btn-primary {
            background: var(--primary);
            color: white;
        }

        .btn-primary:hover {
            background: var(--primary-dark);
            transform: translateY(-2px);
            box-shadow: 0 10px 20px -5px var(--shadow);
        }

        .btn-primary:active {
            transform: translateY(0);
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

        .register-link {
            text-align: center;
            margin-top: 1.5rem;
            color: var(--text-light);
            font-size: 0.9rem;
        }

        .register-link a {
            color: var(--primary);
            text-decoration: none;
            font-weight: 600;
            transition: color 0.3s ease;
        }

        .register-link a:hover {
            color: var(--primary-dark);
            text-decoration: underline;
        }

        @media (max-width: 640px) {
            .auth-card {
                padding: 2rem 1.5rem;
            }

            .logo h1 {
                font-size: 2rem;
            }
        }
    </style>
</head>
<body>
<div class="container">
    <div class="auth-card">
        <div class="logo">
            <h1>Clinica</h1>
            <p>Healthcare Management System</p>
        </div>

        <%
            String error = (String) request.getAttribute("error");
            if (error != null) {
        %>
        <div class="message error"><%= error %></div>
        <% } %>

        <form action="/auth" method="post">
            <input type="hidden" name="action" value="login">

            <div class="form-group">
                <label for="email">Email Address</label>
                <input type="email" id="email" name="email" required placeholder="doctor@clinica.com">
            </div>

            <div class="form-group">
                <label for="password">Password</label>
                <input type="password" id="password" name="password" required placeholder="Enter your password">
            </div>

            <button type="submit" class="btn btn-primary">Sign In</button>

            <div class="divider"><span>Secure Healthcare Access</span></div>

            <div class="register-link">
                Don't have an account? <a href="/auth/register">Create Account</a>
            </div>
        </form>
    </div>
</div>
</body>
</html>