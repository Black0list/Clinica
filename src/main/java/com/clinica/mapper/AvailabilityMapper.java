package com.clinica.mapper;

import com.clinica.dto.AvailabilityDTO;
import com.clinica.model.Availability;
import com.clinica.model.Doctor;
import com.clinica.model.enums.AvailabilityStatus;

public class AvailabilityMapper {

    public static AvailabilityDTO toDTO(Availability availability) {
        if (availability == null) return null;

        AvailabilityDTO dto = new AvailabilityDTO();
        dto.setId(availability.getId());
        dto.setDay(availability.getDay());
        dto.setStartTime(availability.getStartTime());
        dto.setEndTime(availability.getEndTime());
        dto.setStatus(availability.getStatus().name());

        Doctor doctor = availability.getDoctor();
        dto.setDoctorName(doctor != null ? doctor.getName() : "Unknown");

        return dto;
    }

    public static Availability toEntity(AvailabilityDTO dto, Doctor doctor) {
        if (dto == null) return null;

        Availability availability = new Availability();
        availability.setId(dto.getId());
        availability.setDay(dto.getDay());
        availability.setStartTime(dto.getStartTime());
        availability.setEndTime(dto.getEndTime());
        availability.setStatus(AvailabilityStatus.valueOf(dto.getStatus()));
        availability.setDoctor(doctor);

        return availability;
    }
}
