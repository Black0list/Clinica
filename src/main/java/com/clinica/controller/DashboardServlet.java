package com.clinica.controller;

import com.clinica.dto.PatientDTO;
import com.clinica.dto.UserDTO;
import com.clinica.model.enums.BloodType;
import com.clinica.service.PatientService;
import com.clinica.service.UserService;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.util.Arrays;
import java.util.List;

@WebServlet(name = "DashboardServlet", value = "/dashboard")
public class DashboardServlet extends HttpServlet {

    private static final PatientService patientService = PatientService.getInstance();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);

        if (session == null || session.getAttribute("user") == null) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }

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


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // TODO: implement logic
    }
}
