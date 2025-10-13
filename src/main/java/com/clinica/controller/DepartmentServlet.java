package com.clinica.controller;

import com.clinica.model.Department;
import com.clinica.service.DepartmentService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.util.List;
import java.util.Optional;

@WebServlet(name = "DepartmentServlet", value = {"/departments/*", "/departments"})
public class DepartmentServlet extends HttpServlet {

    private final DepartmentService departmentService = DepartmentService.getInstance();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String pathInfo = req.getPathInfo();

        System.out.println("📡 doGet called!");
        System.out.println("📡 pathInfo = " + pathInfo);

        if (pathInfo != null && pathInfo.length() > 1) {
            try {
                Long id = Long.parseLong(pathInfo.substring(1));
                Optional<Department> dept = departmentService.findById(id);
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
                resp.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid department ID");
            }
        } else {
            List<Department> departments = departmentService.getAllDepartments();
            req.setAttribute("departments", departments);
            req.getRequestDispatcher("/WEB-INF/views/pages/departments.jsp").forward(req, resp);
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
        Department dept = new Department();
        dept.setId(Long.parseLong(req.getParameter("id")));
        dept.setCode(req.getParameter("code"));
        dept.setDescription(req.getParameter("description"));
        dept.setName(req.getParameter("name"));

        departmentService.updateDepartment(dept);
        resp.sendRedirect(req.getContextPath() + "/departments");
    }

    private void handleDelete(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        Long id = Long.parseLong(req.getParameter("id"));
        departmentService.delete(id);
        resp.sendRedirect(req.getContextPath() + "/departments");
    }

    private void handleCreation(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        String code = req.getParameter("code");
        String name = req.getParameter("name");
        String description = req.getParameter("description");

        Department department = new Department();
        department.setCode(code);
        department.setName(name);
        department.setDescription(description);

        departmentService.createDepartment(department);
        resp.sendRedirect(req.getContextPath() + "/departments");
    }

    private String escapeJson(String text) {
        return text == null ? "" : text.replace("\"", "\\\"").replace("\n", "\\n");
    }
}
