package com.clinica.controller;

import com.clinica.dto.PatientDTO;
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

    private PatientService patientService;

    public DashboardServlet(){
        this.patientService = PatientService.getInstance();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<PatientDTO> patients = PatientService.patients();
        request.setAttribute("bloodTypes", Arrays.asList(BloodType.values()));
        request.setAttribute("patients", patients);
        request.getRequestDispatcher("/WEB-INF/views/dashboard.jsp")
                .forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // TODO: implement logic
    }
}
