package com.clinica.repository.repositoryIntf;

import com.clinica.dto.AppointmentDTO;
import com.clinica.model.Appointment;

import java.time.LocalDate;
import java.util.List;
import java.util.Optional;

public interface AppointmentRepositoryIntf {
    List<String> getOccupiedTimes(LocalDate date, String doctorName);
    boolean create(Appointment appointment);
    List<Appointment> getAll();
    Optional<List<Appointment>> getAllByPatientId(Long id);
    Optional<List<Appointment>> getAllByDoctorId(Long id);
}
