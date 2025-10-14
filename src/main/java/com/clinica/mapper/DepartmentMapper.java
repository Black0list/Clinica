package com.clinica.mapper;

import com.clinica.dto.DepartmentDTO;
import com.clinica.model.Department;

public class DepartmentMapper {

    public static DepartmentDTO toDTO(Department department) {
        if (department == null) return null;

        int specialityCount = department.getSpecialties() != null ? department.getSpecialties().size() : 0;

        return new DepartmentDTO(
                department.getId(),
                department.getCode(),
                department.getName(),
                department.getDescription(),
                specialityCount
        );
    }

    public static Department toEntity(DepartmentDTO dto) {
        if (dto == null) return null;

        Department department = new Department();
        department.setId(dto.getId());
        department.setCode(dto.getCode());
        department.setName(dto.getName());
        department.setDescription(dto.getDescription());
        return department;
    }
}
