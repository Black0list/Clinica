package com.clinica.service;

import com.clinica.dto.SpecialityDTO;
import com.clinica.mapper.SpecialityMapper;
import com.clinica.model.Department;
import com.clinica.model.Speciality;
import com.clinica.repository.DepartmentRepository;
import com.clinica.repository.SpecialityRepository;
import com.clinica.repository.repositoryIntf.DepartmentRepositoryIntf;

import java.util.List;
import java.util.Optional;

public class SpecialityService {
    private static volatile SpecialityService instance;
    private final SpecialityRepository specialityRepository = SpecialityRepository.getInstance();
    private final DepartmentRepository departmentRepository = DepartmentRepository.getInstance();

    private SpecialityService(){}

    public static SpecialityService getInstance() {
        if (instance == null) {
            synchronized (SpecialityService.class) {
                if (instance == null) instance = new SpecialityService();
            }
        }
        return instance;
    }

    public void createSpeciality(SpecialityDTO specialityDTO) {
        Optional<Department> department = departmentRepository.findByName(specialityDTO.getDepartmentName());
        if(department.isEmpty()){
            return;
        }
        Speciality speciality = SpecialityMapper.fromCreateDTO(specialityDTO, department.get());
        specialityRepository.create(speciality);
    }

    public List<Speciality> getAllSpecialities() {
        return specialityRepository.getAll();
    }

    public void delete(Long id) {
        specialityRepository.delete(id);
    }

    public Optional<SpecialityDTO> findById(Long id) {
        return Optional.of(SpecialityMapper.toDTO(specialityRepository.findById(id).get()));
    }

    public void updateSpeciality(SpecialityDTO specialityDTO) {
        Optional<Department> department = departmentRepository.findByName(specialityDTO.getDepartmentName());
        if(department.isEmpty()){
            return;
        }
        Speciality speciality = SpecialityMapper.fromCreateDTO(specialityDTO, department.get());
        specialityRepository.update(speciality);
    }
}
