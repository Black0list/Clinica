package com.clinica.controller;

import com.clinica.dto.AppointmentDTO;
import com.clinica.dto.PatientDTO;
import com.clinica.dto.UserDTO;
import com.clinica.model.User;
import com.clinica.model.enums.AppointmentStatus;
import com.clinica.model.enums.AppointmentType;
import com.clinica.model.enums.BloodType;
import com.clinica.service.AppointmentService;
import com.clinica.service.PatientService;
import com.clinica.service.SpecialityService;
import com.clinica.service.UserService;
import com.fasterxml.jackson.databind.ObjectMapper;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.time.LocalDate;
import java.time.LocalTime;
import java.util.Arrays;
import java.util.List;
import java.util.Locale;

@WebServlet(value = { "/patient/appointments/*" })
public class AppointmentServlet extends HttpServlet {
    private static final UserService userService = UserService.getInstance();
    private static final PatientService patientService = PatientService.getInstance();
    private static final AppointmentService appointmentService = AppointmentService.getInstance();
    private static final SpecialityService specialityService = SpecialityService.getInstance();

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String path = request.getPathInfo();
        if (path == null) path = "/";

        HttpSession session = request.getSession();
        UserDTO userDTO = (UserDTO) session.getAttribute("user");

        switch (path) {
            case "/create" -> {
                request.setAttribute("active", "appointments");
                request.setAttribute("patients", patientService.patients());
                request.setAttribute("specialties", specialityService.getAllSpecialities());
                request.getRequestDispatcher("/WEB-INF/views/components/modals/appointment-modal.jsp").forward(request, response);
            }

            case "/occupied" -> {
                String doctorName = request.getParameter("doctorName");
                LocalDate date = LocalDate.parse(request.getParameter("date"));
                String day = request.getParameter("day");

                List<String> times = appointmentService.getOccupiedTimes(day, date, doctorName);

                response.setContentType("application/json");
                response.setCharacterEncoding("UTF-8");

                String json = "{ \"day\": \"" + day + "\", \"occupied\": " + new ObjectMapper().writeValueAsString(times) + " }";
                response.getWriter().write(json);
            }



            default -> {
                request.setAttribute("active", "appointments");
                request.setAttribute("patients", patientService.patients());
                request.setAttribute("doctors", userService.getAllDoctors());
                request.setAttribute("appointments", appointmentService.getAllByPatientId(userDTO.getId()));
                request.getRequestDispatcher("/WEB-INF/views/pages/patient/appointments.jsp").forward(request, response);
            }
        }
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String path = request.getPathInfo();
        if(path == null) path = "/";

        HttpSession session = request.getSession();

        switch (path){
            case "/create" -> {
                LocalDate date = LocalDate.parse(request.getParameter("date"));
                String doctorName = request.getParameter("doctorId");
                UserDTO user = (UserDTO) request.getSession().getAttribute("user");
                PatientDTO patientDTO = patientService.findByUserId(user.getEmail()).get();
                AppointmentType type = AppointmentType.ONLINE;
                AppointmentStatus status = AppointmentStatus.PLANNED;
                String executor = "System";
                LocalTime startTime = LocalTime.parse(request.getParameter("time"));
                LocalTime endTime = startTime.plusMinutes(35);

                AppointmentDTO dto = new AppointmentDTO();
                dto.setDate(date);
                dto.setDoctorName(doctorName);
                dto.setStatus(status.name());
                dto.setType(type.name());
                dto.setPatientName(patientDTO.getName());
                dto.setExecutor(executor);
                dto.setStartTime(startTime);
                dto.setEndTime(endTime);

                boolean created = appointmentService.createAppointment(dto);
                response.sendRedirect("/patient/appointments");
            }
        }
    }

}
