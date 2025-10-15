package com.clinica.controller;

import com.clinica.model.enums.BloodType;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.Arrays;

@WebServlet(value = "/patient/appointments/*")
public class AppointmentServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("active", "appointments");
        request.getRequestDispatcher("/WEB-INF/views/pages/patient/appointments.jsp").forward(request, response);
    }
}
