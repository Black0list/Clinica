package com.clinica.mapper;

import com.clinica.dto.PatientDTO;
import com.clinica.model.Patient;

public class PatientMapper {
    public static Patient fromCreateDTO(PatientDTO dto) {
        Patient p = new Patient();
        p.setName(dto.getName());
        p.setEmail(dto.getEmail());
        p.setCin(dto.getCin());
        p.setBirthDate(dto.getBirthDate());
        p.setSex(dto.getSex());
        p.setPhone(dto.getPhone());
        p.setAddress(dto.getAddress());
        p.setBlood(dto.getBlood());
        p.setActive(true);
        p.setAdmin(false);
        return p;
    }

    public static PatientDTO toDTO(Patient p) {
        PatientDTO dto = new PatientDTO();
        dto.setId(p.getId());
        dto.setName(p.getName());
        dto.setEmail(p.getEmail());
        dto.setCin(p.getCin());
        dto.setBirthDate(p.getBirthDate());
        dto.setSex(p.getSex());
        dto.setPhone(p.getPhone());
        dto.setActive(p.isActive());
        dto.setAddress(p.getAddress());
        dto.setBlood(p.getBlood());
        return dto;
    }
}

