package com.clinica.mapper;

import com.clinica.dto.DoctorDTO;
import com.clinica.model.Department;
import com.clinica.model.Doctor;
import com.clinica.model.Speciality;

public class DoctorMapper {
    public static Doctor fromCreateDTO(DoctorDTO dto, Department department, Speciality speciality) {
        Doctor doctor = new Doctor();
        doctor.setName(dto.getName());
        doctor.setEmail(dto.getEmail());
        doctor.setPhone(dto.getPhone());
        doctor.setRegistration(dto.getRegistration());
        doctor.setTitle(dto.getTitle());
        doctor.setSpeciality(speciality);
        doctor.setActive(true);
        doctor.setAdmin(true);
        return doctor;
    }

    public static DoctorDTO toDTO(Doctor doctor) {
        DoctorDTO dto = new DoctorDTO();
        dto.setId(doctor.getId());
        dto.setName(doctor.getName());
        dto.setEmail(doctor.getEmail());
        dto.setPhone(doctor.getPhone());
        dto.setRegistration(doctor.getRegistration());
        dto.setTitle(doctor.getTitle());
        dto.setDepartmentName(
                doctor.getSpeciality().getDepartment() != null ? doctor.getSpeciality().getDepartment().getName() : null
        );
        dto.setSpecialityName(
                doctor.getSpeciality() != null ? doctor.getSpeciality().getName() : null
        );
        return dto;
    }
}
