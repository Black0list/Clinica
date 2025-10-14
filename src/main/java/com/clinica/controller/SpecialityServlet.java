package com.clinica.controller;

import com.clinica.dto.DepartmentDTO;
import com.clinica.dto.SpecialityDTO;
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
    private final DepartmentService departmentService = DepartmentService.getInstance();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String pathInfo = req.getPathInfo();
        List<DepartmentDTO> departments = departmentService.getAllDepartments();

        if (pathInfo != null && pathInfo.length() > 1) {
            try {
                Long id = Long.parseLong(pathInfo.substring(1));
                Optional<SpecialityDTO> spec = specialityService.findById(id);
                if (spec.isEmpty()) {
                    resp.sendError(HttpServletResponse.SC_NOT_FOUND);
                    return;
                }
                resp.setContentType("application/json");
                resp.setCharacterEncoding("UTF-8");
                String json = String.format(
                        "{ \"id\": %d, \"code\": \"%s\", \"name\": \"%s\", \"description\": \"%s\", \"department\": \"%s\" }",
                        spec.get().getId(),
                        escapeJson(spec.get().getCode()),
                        escapeJson(spec.get().getName()),
                        spec.get().getDescription() != null ? escapeJson(spec.get().getDescription()) : "",
                        escapeJson(spec.get().getDepartmentName())
                );
                resp.getWriter().write(json);
            } catch (NumberFormatException e) {
                resp.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid Speciality ID");
            }
        } else {
            List<SpecialityDTO> specialities = specialityService.getAllSpecialities();
            req.setAttribute("departments", departments);
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
        SpecialityDTO spec = new SpecialityDTO();
        spec.setId(Long.parseLong(req.getParameter("id")));
        spec.setCode(req.getParameter("code"));
        spec.setDescription(req.getParameter("description"));
        spec.setName(req.getParameter("name"));
        spec.setDepartmentName(req.getParameter("depName"));

        specialityService.updateSpeciality(spec);
        resp.sendRedirect(req.getContextPath() + "/specialities");
    }

    private void handleDelete(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        Long id = Long.parseLong(req.getParameter("id"));
        specialityService.delete(id);
        resp.sendRedirect(req.getContextPath() + "/specialities");
    }

    private void handleCreation(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        SpecialityDTO spec = new SpecialityDTO();
        spec.setCode(req.getParameter("code"));
        spec.setDescription(req.getParameter("description"));
        spec.setName(req.getParameter("name"));
        spec.setDepartmentName(req.getParameter("depName"));

        specialityService.createSpeciality(spec);
        resp.sendRedirect(req.getContextPath() + "/specialities");
    }

    private String escapeJson(String text) {
        return text == null ? "" : text.replace("\"", "\\\"").replace("\n", "\\n");
    }
}
