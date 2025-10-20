package com.clinica.mapper;

import com.clinica.dto.MedicalNoteDTO;
import com.clinica.model.MedicalNote;

public class MedicalNoteMapper {

    public static MedicalNoteDTO toDTO(MedicalNote entity) {
        if (entity == null) return null;

        MedicalNoteDTO dto = new MedicalNoteDTO();
        dto.setId(entity.getId());
        dto.setContent(entity.getContent());
        dto.setLocked(entity.isLocked());
        dto.setDoctorName(
                entity.getDoctor() != null ? entity.getDoctor().getName() : null
        );
        dto.setAppointmentId(
                entity.getAppointment() != null ? entity.getAppointment().getId() : null
        );
        return dto;
    }

    public static MedicalNote toEntity(MedicalNoteDTO dto) {
        if (dto == null) return null;

        MedicalNote entity = new MedicalNote();
        entity.setId(dto.getId());
        entity.setContent(dto.getContent());
        entity.setLocked(dto.isLocked());
        // doctor and appointment must be set separately (e.g., via service)
        // because DTO only carries IDs/names, not full objects
        return entity;
    }
}
