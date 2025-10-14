package com.clinica.mapper;

import com.clinica.dto.SpecialityDTO;
import com.clinica.dto.StaffDTO;
import com.clinica.model.Department;
import com.clinica.model.Speciality;
import com.clinica.model.Staff;

public class SpecialityMapper {
    public static Speciality fromCreateDTO(SpecialityDTO dto, Department department) {
        Speciality speciality = new Speciality();
        speciality.setId(dto.getId());
        speciality.setName(dto.getName());
        speciality.setDescription(dto.getDescription());
        speciality.setCode(dto.getCode());
        speciality.setDepartment(department);
        return speciality;
    }

    public static SpecialityDTO toDTO(Speciality speciality) {
        SpecialityDTO dto = new SpecialityDTO();
        dto.setId(speciality.getId());
        dto.setCode(speciality.getCode());
        dto.setName(speciality.getName());
        dto.setDescription(speciality.getDescription());
        dto.setDepartmentName(speciality.getDepartment().getName());
        return dto;
    }
}

