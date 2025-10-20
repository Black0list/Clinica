package com.clinica.controller;

import com.clinica.dto.MedicalNoteDTO;
import com.clinica.dto.UserDTO;
import com.clinica.model.User;
import com.clinica.service.MedicalNoteService;
import com.fasterxml.jackson.databind.ObjectMapper;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

@WebServlet(name = "MedicalNoteServlet", value = "/notes/*")
public class MedicalNoteServlet extends HttpServlet {

    private final MedicalNoteService medicalNoteService = MedicalNoteService.getInstance();
    private final ObjectMapper mapper = new ObjectMapper();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String path = req.getPathInfo();
        if ("/create".equals(path)) {
            handleCreate(req, resp);
        } else {
            resp.sendError(HttpServletResponse.SC_NOT_FOUND, "Invalid endpoint");
        }
    }

    private void handleCreate(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        resp.setContentType("application/json");
        resp.setCharacterEncoding("UTF-8");

        HttpSession session = req.getSession();
        UserDTO userDTO = (UserDTO) session.getAttribute("user");

        ObjectMapper mapper = new ObjectMapper();
        MedicalNoteDTO dto = mapper.readValue(req.getReader(), MedicalNoteDTO.class);

        Long appointmentId = dto.getAppointmentId();
        String content = dto.getContent();

        MedicalNoteDTO medicalNoteDTO = new MedicalNoteDTO();
        medicalNoteDTO.setContent(content);
        medicalNoteDTO.setAppointmentId(appointmentId); 
        medicalNoteDTO.setDoctorName(userDTO.getName());
        medicalNoteDTO.setLocked(true);

        boolean saved = medicalNoteService.save(medicalNoteDTO);

        Map<String, Object> result = new HashMap<>();
        result.put("success", saved);
        result.put("message", saved ? "Medical note added successfully" : "Failed to save medical note");

        mapper.writeValue(resp.getWriter(), result);
    }
}
