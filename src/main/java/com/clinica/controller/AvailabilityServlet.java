package com.clinica.controller;

import com.clinica.dto.AvailabilityDTO;
import com.clinica.dto.DoctorDTO;
import com.clinica.dto.UserDTO;
import com.clinica.model.User;
import com.clinica.model.enums.AvailabilityStatus;
import com.clinica.model.enums.DayOfWeek;
import com.clinica.service.AvailabilityService;
import com.clinica.service.UserService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.time.LocalDate;
import java.time.LocalTime;
import java.util.Optional;

@WebServlet(name = "AvailabilityServlet", value = {"/doctor/availabilities/*", "/availabilities"})
public class AvailabilityServlet extends HttpServlet {
    private static final AvailabilityService availabilityService = AvailabilityService.getInstance();
    private static final UserService userService = UserService.getInstance();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String pathInfo = request.getPathInfo();
        request.setAttribute("active", "availability");
        if (pathInfo != null && pathInfo.length() > 1) {
            try {
                Long id = Long.parseLong(pathInfo.substring(1));
                Optional<AvailabilityDTO> dto = availabilityService.findById(id);
                if (dto.isEmpty()) {
                    response.sendError(HttpServletResponse.SC_NOT_FOUND, "Availability not found");
                    return;
                }

                response.setContentType("application/json");
                response.setCharacterEncoding("UTF-8");
                String json = String.format(
                        "{ \"id\": %d, \"doctorName\": \"%s\", \"day\": \"%s\", \"startTime\": \"%s\", \"endTime\": \"%s\", \"status\": \"%s\" }",
                        dto.get().getId(),
                        dto.get().getDoctorName(),
                        dto.get().getDay(),
                        dto.get().getStartTime(),
                        dto.get().getEndTime(),
                        dto.get().getStatus()
                );
                response.getWriter().write(json);
            } catch (NumberFormatException e) {
                response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid availability ID");
            }
            return;
        }

        // Otherwise → render the availability page with data
        request.setAttribute("doctors", userService.getAllDoctors());
        request.setAttribute("availabilities", availabilityService.getAll());
        request.getRequestDispatcher("/WEB-INF/views/pages/doctor/availability.jsp").forward(request, response);
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String path = request.getPathInfo();
        if (path == null) path = "/";

        switch (path) {
            case "/create" -> handleCreation(request, response);
            case "/update" -> handleUpdate(request, response);
            case "/delete" -> handleDelete(request, response);
        }
    }

    private void handleCreation(HttpServletRequest request, HttpServletResponse response) throws IOException {
        HttpSession session = request.getSession();

        UserDTO doctorDTO = (UserDTO) session.getAttribute("user");
        String doctorName = doctorDTO.getName();
        DayOfWeek day = DayOfWeek.valueOf(request.getParameter("day"));
        LocalTime startTime = LocalTime.parse(request.getParameter("startTime"));
        LocalTime endTime = LocalTime.parse(request.getParameter("endTime"));
        String status = request.getParameter("status");

        AvailabilityDTO dto = new AvailabilityDTO();
        dto.setDoctorName(doctorName);
        dto.setDay(day);
        dto.setStartTime(startTime);
        dto.setEndTime(endTime);
        dto.setStatus(status);

        boolean created = availabilityService.create(dto);
        if (created){
            request.setAttribute("success", "Successfully Created the availability");
        } else {
            request.setAttribute("error", "Failed While Creating the Availability May You have already the chosen day");
        }

        response.sendRedirect("/availabilities");
    }

    private void handleUpdate(HttpServletRequest request, HttpServletResponse response) throws IOException {
        HttpSession session = request.getSession();

        Long id = Long.parseLong(request.getParameter("id"));
        UserDTO doctorDTO = (UserDTO) session.getAttribute("user");
        String doctorName = doctorDTO.getName();
        DayOfWeek day = DayOfWeek.valueOf(request.getParameter("day"));
        LocalTime startTime = LocalTime.parse(request.getParameter("startTime"));
        LocalTime endTime = LocalTime.parse(request.getParameter("endTime"));
        String status = request.getParameter("status");

        AvailabilityDTO dto = new AvailabilityDTO();
        dto.setId(id);
        dto.setDoctorName(doctorName);
        dto.setDay(day);
        dto.setStartTime(startTime);
        dto.setEndTime(endTime);
        dto.setStatus(status);

        boolean updated = availabilityService.update(dto);
        response.sendRedirect(updated ? "/availabilities" : "/dashboard");
    }

    private void handleDelete(HttpServletRequest request, HttpServletResponse response) throws IOException {
        Long id = Long.parseLong(request.getParameter("id"));
        boolean deleted = availabilityService.delete(id);
        response.sendRedirect(deleted ? "/availabilities" : "/dashboard");
    }
}
