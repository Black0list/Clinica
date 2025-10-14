package com.clinica.controller;

import com.clinica.dto.DoctorDTO;
import com.clinica.model.User;
import com.clinica.service.SpecialityService;
import com.clinica.service.UserService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.Optional;

@WebServlet(name = "DoctorServlet", value = { "/doctors/*", "/doctors" })
public class DoctorServlet extends HttpServlet {

    private static final SpecialityService specialityService = SpecialityService.getInstance();
    private static final UserService userService = UserService.getInstance();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        String pathInfo = req.getPathInfo();

        if (pathInfo != null && pathInfo.matches("^/delete/\\d+$")) {
            Long id = Long.parseLong(pathInfo.substring("/delete/".length()));
            boolean deleted = userService.deleteDoctor(id);
            if (deleted) {
                res.sendRedirect(req.getContextPath() + "/doctors");
            } else {
                res.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Failed to delete doctor");
            }
            return;
        }

        if (pathInfo != null && pathInfo.length() > 1) {
            try {
                Long id = Long.parseLong(pathInfo.substring(1));
                Optional<DoctorDTO> doctor = userService.findDoctorById(id);

                if (doctor.isEmpty()) {
                    res.sendError(HttpServletResponse.SC_NOT_FOUND, "Doctor not found");
                    return;
                }

                res.setContentType("application/json");
                res.setCharacterEncoding("UTF-8");

                DoctorDTO d = doctor.get();
                String json = String.format(
                        "{ \"id\": %d, \"name\": \"%s\", \"email\": \"%s\", \"phone\": \"%s\", \"registration\": \"%s\", \"title\": \"%s\", \"specialityName\": \"%s\", \"active\": %s }",
                        d.getId(),
                        escapeJson(d.getName()),
                        escapeJson(d.getEmail()),
                        d.getPhone() != null ? escapeJson(d.getPhone()) : "",
                        escapeJson(d.getRegistration()),
                        d.getTitle() != null ? escapeJson(d.getTitle()) : "",
                        d.getSpecialityName(),
                        d.isActive()
                );

                res.getWriter().write(json);
                return;

            } catch (NumberFormatException e) {
                res.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid doctor ID");
                return;
            }
        }

        req.setAttribute("doctors", userService.getAllDoctors());
        req.setAttribute("specialities", specialityService.getAllSpecialities());
        req.getRequestDispatcher("/WEB-INF/views/pages/doctors.jsp").forward(req, res);
    }


    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        String path = req.getPathInfo();

        switch (path){
            case "/create" -> handleCreate(req, res);
            case "/update" -> handleUpdate(req, res);
        }
    }

    private void handleCreate(HttpServletRequest req, HttpServletResponse res) throws IOException {
        String name = req.getParameter("name");
        String email = req.getParameter("email");
        String password = req.getParameter("password");
        String phone = req.getParameter("phone");
        String title = req.getParameter("title");
        String registration = req.getParameter("registration");
        String specialityName = req.getParameter("specialityName");

        DoctorDTO dto = new DoctorDTO();
        dto.setName(name);
        dto.setEmail(email);
        dto.setPhone(phone);
        dto.setPassword(password);
        dto.setTitle(title);
        dto.setRegistration(registration);
        dto.setSpecialityName(specialityName);

        boolean created = userService.createDoctor(dto);
        if (created) {
            res.sendRedirect(req.getContextPath() + "/doctors");
        } else {
            res.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Failed to delete doctor");
        }
    }


    private void handleUpdate(HttpServletRequest req, HttpServletResponse res) throws IOException {
        Long id = Long.parseLong(req.getParameter("id"));
        String name = req.getParameter("name");
        String email = req.getParameter("email");
        String password = req.getParameter("password");
        String phone = req.getParameter("phone");
        String title = req.getParameter("title");
        boolean active = Boolean.parseBoolean(req.getParameter("active"));
        String registration = req.getParameter("registration");
        String specialityName = req.getParameter("specialityName");

        DoctorDTO dto = new DoctorDTO();
        dto.setId(id);
        dto.setName(name);
        dto.setEmail(email);
        dto.setPhone(phone);
        dto.setPassword(password);
        dto.setTitle(title);
        dto.setActive(active);
        dto.setRegistration(registration);
        dto.setSpecialityName(specialityName);

        boolean updated = userService.updateDoctor(dto);

        if (updated) {
            res.sendRedirect(req.getContextPath() + "/doctors");
        } else {
            res.sendRedirect(req.getContextPath() + "/dashboard");
        }
    }


    private String escapeJson(String text) {
        return text == null ? "" : text.replace("\"", "\\\"").replace("\n", "\\n");
    }
}
