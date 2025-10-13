package com.clinica.controller;

import com.clinica.model.Department;
import com.clinica.model.Speciality;
import com.clinica.service.DepartmentService;
import com.clinica.service.SpecialityService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.util.List;
import java.util.Optional;

@WebServlet(name = "SpecialityServlet", value = {"/specialities/*", "/specialities"})
public class SpecialityServlet extends HttpServlet {

    private final SpecialityService specialityService = SpecialityService.getInstance();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String pathInfo = req.getPathInfo();

        if (pathInfo != null && pathInfo.length() > 1) {
            try {
                Long id = Long.parseLong(pathInfo.substring(1));
                Optional<Speciality> dept = specialityService.findById(id);
                if (dept.isEmpty()) {
                    resp.sendError(HttpServletResponse.SC_NOT_FOUND);
                    return;
                }
                resp.setContentType("application/json");
                resp.setCharacterEncoding("UTF-8");
                String json = String.format(
                        "{ \"id\": %d, \"code\": \"%s\", \"name\": \"%s\", \"description\": \"%s\" }",
                        dept.get().getId(),
                        escapeJson(dept.get().getCode()),
                        escapeJson(dept.get().getName()),
                        dept.get().getDescription() != null ? escapeJson(dept.get().getDescription()) : ""
                );
                resp.getWriter().write(json);
            } catch (NumberFormatException e) {
                resp.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid Speciality ID");
            }
        } else {
            List<Speciality> specialities = specialityService.getAllSpecialities();
            req.setAttribute("specialities", specialities);
            req.getRequestDispatcher("/WEB-INF/views/pages/specialities.jsp").forward(req, resp);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        String path = req.getPathInfo();
        if (path == null) path = "/";

        switch (path) {
            case "/create" -> handleCreation(req, resp);
            case "/delete" -> handleDelete(req, resp);
            case "/update" -> handleUpdate(req, resp);
        }
    }

    private void handleUpdate(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        Speciality dept = new Speciality();
        dept.setId(Long.parseLong(req.getParameter("id")));
        dept.setCode(req.getParameter("code"));
        dept.setDescription(req.getParameter("description"));
        dept.setName(req.getParameter("name"));

        specialityService.updateSpeciality(dept);
        resp.sendRedirect(req.getContextPath() + "/specialities");
    }

    private void handleDelete(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        Long id = Long.parseLong(req.getParameter("id"));
        specialityService.delete(id);
        resp.sendRedirect(req.getContextPath() + "/specialities");
    }

    private void handleCreation(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        String code = req.getParameter("code");
        String name = req.getParameter("name");
        String description = req.getParameter("description");

        Speciality speciality = new Speciality();
        speciality.setCode(code);
        speciality.setName(name);
        speciality.setDescription(description);

        specialityService.createSpeciality(speciality);
        resp.sendRedirect(req.getContextPath() + "/specialities");
    }

    private String escapeJson(String text) {
        return text == null ? "" : text.replace("\"", "\\\"").replace("\n", "\\n");
    }
}
