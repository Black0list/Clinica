package com.clinica.mapper;

import com.clinica.dto.StaffDTO;
import com.clinica.model.Staff;

public class StaffMapper {
    public static Staff fromCreateDTO(StaffDTO dto) {
        Staff staff = new Staff();
        staff.setName(dto.getName());
        staff.setEmail(dto.getEmail());
        staff.setPhone(dto.getPhone());
        staff.setPosition(dto.getPosition());
        staff.setActive(true);
        staff.setAdmin(false);
        return staff;
    }

    public static StaffDTO toDTO(Staff staff) {
        StaffDTO dto = new StaffDTO();
        dto.setId(staff.getId());
        dto.setName(staff.getName());
        dto.setEmail(staff.getEmail());
        dto.setPhone(staff.getPhone());
        dto.setPosition(staff.getPosition());
        return dto;
    }
}

