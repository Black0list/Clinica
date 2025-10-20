package com.clinica.service;

import com.clinica.dto.AppointmentDTO;
import com.clinica.repository.DashboardRepository;

import java.util.List;

public class DashboardService {

    private static final DashboardService INSTANCE = new DashboardService();
    private final DashboardRepository repository = new DashboardRepository();

    private DashboardService() {}

    public static DashboardService getInstance() {
        return INSTANCE;
    }

    public long getTotalAppointments() {
        return repository.countAppointments();
    }

    public long getTotalDoctors() {
        return repository.countDoctors();
    }

    public long getTotalPatients() {
        return repository.countPatients();
    }

    public long getTotalMedicalNotes() {
        return repository.countMedicalNotes();
    }

    public List<AppointmentDTO> getRecentAppointments(int limit) {
        return repository.findRecentAppointments(limit);
    }

}
