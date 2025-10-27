package com.clinica.controller;

import com.clinica.dto.AppointmentDTO;
import com.clinica.dto.UserDTO;
import com.clinica.model.enums.BloodType;
import com.clinica.service.DashboardService;
import com.clinica.service.PatientService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.Arrays;
import java.util.List;

@WebServlet(name = "DashboardServlet", value = "/dashboard")
public class DashboardServlet extends HttpServlet {

    private final DashboardService dashboardService = DashboardService.getInstance();
    private final PatientService patientService = PatientService.getInstance();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);

        if (session == null || session.getAttribute("user") == null) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }

        request.setAttribute("totalPatients", dashboardService.getTotalPatients());
        request.setAttribute("totalDoctors", dashboardService.getTotalDoctors());
        request.setAttribute("totalAppointments", dashboardService.getTotalAppointments());
        request.setAttribute("totalMedicalNotes", dashboardService.getTotalMedicalNotes());

        List<AppointmentDTO> recentAppointments = dashboardService.getRecentAppointments(5);
        request.setAttribute("recentAppointments", recentAppointments);

        UserDTO user = (UserDTO) session.getAttribute("user");

        request.setAttribute("bloodTypes", Arrays.asList(BloodType.values()));
        request.setAttribute("patients", patientService.patients());
        request.setAttribute("active", "dashboard");
        if (user.isAdmin()) {
            request.getRequestDispatcher("/WEB-INF/views/pages/dashboard.jsp").forward(request, response);
        } else if ("doctor".equalsIgnoreCase(user.getType())) {
            request.getRequestDispatcher("/WEB-INF/views/pages/doctor/dashboard.jsp").forward(request, response);
        } else if ("staff".equalsIgnoreCase(user.getType())) {
            request.getRequestDispatcher("/WEB-INF/views/pages/staff/dashboard.jsp").forward(request, response);
        } else if ("patient".equalsIgnoreCase(user.getType())) {
            response.sendRedirect("/patient/appointments/");
        } else {
            response.sendRedirect(request.getContextPath() + "/auth/login");
        }
    }
}
