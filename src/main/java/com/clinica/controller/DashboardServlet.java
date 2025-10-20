package com.clinica.controller;

import com.clinica.dto.AppointmentDTO;
import com.clinica.service.DashboardService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "DashboardServlet", value = "/dashboard")
public class DashboardServlet extends HttpServlet {

    private final DashboardService dashboardService = DashboardService.getInstance();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        request.setAttribute("totalPatients", dashboardService.getTotalPatients());
        request.setAttribute("totalDoctors", dashboardService.getTotalDoctors());
        request.setAttribute("totalAppointments", dashboardService.getTotalAppointments());
        request.setAttribute("totalMedicalNotes", dashboardService.getTotalMedicalNotes());

        // ✅ Get 5 most recent appointments
        List<AppointmentDTO> recentAppointments = dashboardService.getRecentAppointments(5);
        request.setAttribute("recentAppointments", recentAppointments);

        request.getRequestDispatcher("/WEB-INF/views/pages/dashboard.jsp")
                .forward(request, response);
    }
}
