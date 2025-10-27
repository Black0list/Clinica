# Clinica - Medical Clinic Management System

A comprehensive web-based clinic management system built with Java EE technologies, designed to streamline medical appointment scheduling, patient management, and clinic operations.

## 📋 Table of Contents

- [Overview](#overview)
- [Features](#features)
- [Technology Stack](#technology-stack)
- [Project Structure](#project-structure)
- [Prerequisites](#prerequisites)
- [Installation & Setup](#installation--setup)
- [Database Configuration](#database-configuration)
- [Usage](#usage)
- [API Endpoints](#api-endpoints)
- [Architecture](#architecture)
- [Contributing](#contributing)
- [License](#license)

## 🎯 Overview

Clinica is a full-featured clinic management system that enables healthcare facilities to manage their day-to-day operations efficiently. The system supports multiple user roles (Patients, Doctors, and Staff) and provides comprehensive functionality for appointment scheduling, medical records management, and doctor availability tracking.

## ✨ Features

### Core Functionality

- **👥 User Management**
    - Multi-role authentication system (Patient, Doctor, Staff)
    - Secure login and session management
    - Role-based access control

- **📅 Appointment Management**
    - Real-time appointment scheduling
    - Conflict detection and prevention
    - Appointment status tracking (Scheduled, Completed, Cancelled, No-Show)
    - Doctor availability checking

- **🏥 Doctor Management**
    - Doctor profiles with specializations
    - Availability schedule management
    - Department assignment

- **🧑‍⚕️ Patient Management**
    - Patient registration and profile management
    - Medical history tracking
    - Appointment history

- **📝 Medical Notes**
    - Digital medical record keeping
    - Note creation and management per appointment
    - Secure patient data handling

- **🏢 Administrative Features**
    - Department management
    - Speciality management
    - Staff assignment and management

## 🛠️ Technology Stack

### Backend
- **Java 17** - Core programming language
- **Jakarta EE 10** - Enterprise framework
    - Jakarta Servlet 6.1.0
    - Jakarta Persistence (JPA) 3.1.0
    - Jakarta Validation 3.0.2
- **Hibernate 6.5.2** - ORM framework
- **PostgreSQL 42.7.3** - Database

### Frontend
- **JSP (Jakarta Server Pages)** - View layer
- **JSTL 3.0.1** - Tag libraries

### Build & Testing
- **Maven 3.x** - Build automation
- **JUnit 5** - Unit testing
- **Mockito 5.8** - Mocking framework


## 📋 Prerequisites

Before you begin, ensure you have the following installed:

- **JDK 17** or higher
- **Apache Maven 3.6+**
- **PostgreSQL 12+**
- **Application Server** (e.g., Apache Tomcat 10+, WildFly, or GlassFish)
- **IDE** (recommended: IntelliJ IDEA, Eclipse, or NetBeans)

## 🚀 Installation & Setup

### 1. Clone the Repository
```bash
bash git clone <repository-url> cd Clinica
```


### 2. Database Setup

Create a PostgreSQL database:

```sql
CREATE DATABASE clinica;
```

### 3. Configure Database Connection
Update the database credentials in src/main/resources/META-INF/persistence.xml:

```js
<property name="jakarta.persistence.jdbc.url" value="jdbc:postgresql://localhost:5432/clinica"/>
<property name="jakarta.persistence.jdbc.user" value="your_username"/>
<property name="jakarta.persistence.jdbc.password" value="your_password"/>
```

### 4. Build the Project
```bash
mvn clean install
```

