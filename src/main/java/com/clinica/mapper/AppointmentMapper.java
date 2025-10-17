package com.clinica.mapper;

import com.clinica.dto.AppointmentDTO;
import com.clinica.model.Appointment;
import com.clinica.model.Availability;
import com.clinica.model.Doctor;
import com.clinica.model.Patient;
import com.clinica.model.enums.AppointmentStatus;
import com.clinica.model.enums.AppointmentType;
import com.clinica.model.enums.AvailabilityStatus;

public class AppointmentMapper {
    public static AppointmentDTO toDTO(Appointment appointment) {
        if (appointment == null) return null;
        AppointmentDTO dto = new AppointmentDTO();
        dto.setId(appointment.getId());
        dto.setStartTime(appointment.getStartAt());
        dto.setEndTime(appointment.getEndAt());
        dto.setDate(appointment.getDate());
        dto.setType(appointment.getType().name());
        dto.setStatus(appointment.getStatus().name());
        dto.setExecutor(appointment.getExecutor());
        dto.setDoctorName(appointment.getDoctor().getName());
        dto.setPatientName(appointment.getPatient().getName());

        return dto;
    }

    public static Appointment toEntity(AppointmentDTO dto, Doctor doctor, Patient patient) {
        if (dto == null) return null;

        Appointment appointment = new Appointment();
        appointment.setId(dto.getId());
        appointment.setStatus(AppointmentStatus.valueOf(dto.getStatus()));
        appointment.setType(AppointmentType.valueOf(dto.getType()));
        appointment.setDate(dto.getDate());
        appointment.setStartAt(dto.getStartTime());
        appointment.setEndAt(dto.getEndTime());
        appointment.setPatient(patient);
        appointment.setDoctor(doctor);

        return appointment;
    }
}
