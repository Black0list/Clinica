package com.clinica.repository;

import com.clinica.dao.DashboardDAO;
import com.clinica.dto.AppointmentDTO;

import java.util.List;

public class DashboardRepository {

    private final DashboardDAO dao = new DashboardDAO();

    public long countAppointments() {
        return dao.countAppointments();
    }

    public long countDoctors() {
        return dao.countDoctors();
    }

    public long countPatients() {
        return dao.countPatients();
    }

    public long countMedicalNotes() {
        return dao.countMedicalNotes();
    }

    public List<AppointmentDTO> findRecentAppointments(int limit) {
        return dao.findRecentAppointments(limit);
    }

}
