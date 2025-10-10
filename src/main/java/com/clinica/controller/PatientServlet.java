package com.clinica.controller;

import com.clinica.dto.RegisterDTO;
import com.clinica.model.enums.BloodType;
import com.clinica.service.UserService;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.time.LocalDate;
import java.util.Objects;

@WebServlet(name = "patientServlet", value = "/patients/*")
public class PatientServlet extends HttpServlet {

    private final UserService userService = UserService.getInstance();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/WEB-INF/views/dashboard.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String path = request.getPathInfo();
        if ("/create".equals(path)) {
            handleCreate(request, response);
        } else {
            response.sendError(HttpServletResponse.SC_NOT_FOUND);
        }
    }

    private void handleCreate(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String confirm = request.getParameter("confirm");
        String cin = request.getParameter("cin");
        String phone = request.getParameter("phone");
        LocalDate birthDate = LocalDate.parse(request.getParameter("dateOfBirth"));
        String gender = request.getParameter("gender");
        BloodType blood = BloodType.valueOf(request.getParameter("blood"));
        String address = request.getParameter("address");

        if (Objects.isNull(name) || Objects.isNull(email) || Objects.isNull(password)) {
            request.setAttribute("error", "Invalid Inputs");
            request.getRequestDispatcher("/WEB-INF/views/register.jsp").forward(request, response);
            return;
        }

        RegisterDTO registerDTO = new RegisterDTO();
        registerDTO.setName(name);
        registerDTO.setEmail(email);
        registerDTO.setPassword(password);
        registerDTO.setAddress(address);
        registerDTO.setBlood(blood);
        registerDTO.setCin(cin);
        registerDTO.setPhone(phone);
        registerDTO.setBirthDate(birthDate);
        registerDTO.setSex(gender);

        if (!userService.register(registerDTO)) {
            request.setAttribute("error", "Email already Used");
        } else {
            response.sendRedirect(request.getContextPath() + "/dashboard");
        }
    }
}
