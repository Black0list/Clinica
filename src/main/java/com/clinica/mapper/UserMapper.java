package com.clinica.mapper;

import com.clinica.dto.RegisterDTO;
import com.clinica.dto.UserDTO;
import com.clinica.model.Patient;
import com.clinica.model.User;

public class UserMapper {
    public static Patient fromRegisterDTO(RegisterDTO dto) {
        Patient patient = new Patient();
        patient.setName(dto.getName());
        patient.setEmail(dto.getEmail());
        patient.setPassword(dto.getPassword());
        patient.setCin(dto.getCin());
        patient.setBirthDate(dto.getBirthDate());
        patient.setSex(dto.getSex());
        patient.setPhone(dto.getPhone());
        patient.setAddress(dto.getAddress());
        patient.setBlood(dto.getBlood());
        patient.setActive(true);
        patient.setAdmin(false);
        return patient;
    }

    public static UserDTO toDTO(User user) {
        if (user == null) return null;
        UserDTO dto = new UserDTO();
        dto.setId(user.getId());
        dto.setName(user.getName());
        dto.setEmail(user.getEmail());
        dto.setPhone(user.getPhone());
        dto.setAdmin(user.isAdmin());
        dto.setActive(user.isActive());
        dto.setType(user.getClass().getSimpleName());
        return dto;
    }
}
