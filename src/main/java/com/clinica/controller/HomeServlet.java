package com.clinica.controller;

import com.clinica.service.DashboardService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet(name = "DashboardServlet", value = "/dashboard")
public class HomeServlet extends HttpServlet {

    private final DashboardService dashboardService = DashboardService.getInstance();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // ✅ Retrieve statistics
        long totalAppointments = dashboardService.getTotalAppointments();
        long totalDoctors = dashboardService.getTotalDoctors();
        long totalPatients = dashboardService.getTotalPatients();
        long totalNotes = dashboardService.getTotalMedicalNotes();

        // ✅ Attach them to request
        request.setAttribute("totalAppointments", totalAppointments);
        request.setAttribute("totalDoctors", totalDoctors);
        request.setAttribute("totalPatients", totalPatients);
        request.setAttribute("totalNotes", totalNotes);

        // ✅ Forward to JSP
        request.getRequestDispatcher("/WEB-INF/views/dashboard.jsp")
                .forward(request, response);
    }
}
