package com.clinica.controller;

import com.clinica.dto.LoginDTO;
import com.clinica.dto.RegisterDTO;
import com.clinica.dto.UserDTO;
import com.clinica.model.Doctor;
import com.clinica.model.Staff;
import com.clinica.model.User;
import com.clinica.model.enums.BloodType;
import com.clinica.service.UserService;
import com.clinica.utils.JpaUtil;
import jakarta.persistence.EntityManager;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import org.hibernate.validator.internal.util.logging.Log;

import java.io.IOException;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.*;

@WebServlet(name = "AuthServlet", value = {"/auth/*", "/login"})
public class AuthServlet extends HttpServlet {

    private UserService userService;

    public AuthServlet(){
        this.userService = UserService.getInstance();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setAttribute("bloodTypes", Arrays.asList(BloodType.values()));
        String path = request.getPathInfo();
        if (path == null) path = "/";

        switch (path) {
            case "/register" -> {
                request.getRequestDispatcher("/WEB-INF/views/authentication/register.jsp")
                        .forward(request, response);
            }

            default ->
                    request.getRequestDispatcher("/WEB-INF/views/authentication/login.jsp")
                            .forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action");

        if ("register".equals(action)) {
            handleRegister(request, response);
        } else if ("login".equals(action)) {
            handleLogin(request, response);
        }
    }

    private void handleRegister(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

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

        if(Objects.isNull(name) || Objects.isNull(email) || Objects.isNull(password) || Objects.isNull(confirm)){
            request.setAttribute("error", "Invalid Inputs");
            request.getRequestDispatcher("/WEB-INF/views/authentication/register.jsp").forward(request, response);
            return;
        }

        if (!password.equals(confirm)) {
            request.setAttribute("error", "Passwords do not match!");
            request.getRequestDispatcher("/WEB-INF/views/authentication/register.jsp").forward(request, response);
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

        if(!userService.register(registerDTO)){
            request.setAttribute("error", "Email already Used");
            request.getRequestDispatcher("/WEB-INF/views/authentication/register.jsp").forward(request, response);
            return;

        } else {
            request.setAttribute("success", "Successfully Registered");
        }

        request.getRequestDispatcher("/WEB-INF/views/authentication/login.jsp").forward(request, response);
    }

    private void handleLogin(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String email = request.getParameter("email");
        String password = request.getParameter("password");

        if (Objects.isNull(email) || Objects.isNull(password)) {
            request.setAttribute("error", "Invalid Input");
            request.getRequestDispatcher("/WEB-INF/views/authentication/login.jsp").forward(request, response);
            return;
        }

        LoginDTO loginDTO = new LoginDTO();
        loginDTO.setEmail(email);
        loginDTO.setPassword(password);
        Optional<UserDTO> userOpt = userService.login(loginDTO);

        if (userOpt.isPresent()) {
            UserDTO user = userOpt.get();
            HttpSession session = request.getSession();
            session.setAttribute("user", user);
            request.setAttribute("success", "Successfully Logged");

            response.sendRedirect(request.getContextPath() + "/dashboard");

        } else {
            request.setAttribute("error", "Invalid Credentials");
            request.getRequestDispatcher("/WEB-INF/views/authentication/login.jsp").forward(request, response);
        }
    }

}
