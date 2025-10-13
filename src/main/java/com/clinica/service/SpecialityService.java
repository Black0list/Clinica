package com.clinica.service;

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

    private SpecialityService(){}

    public static SpecialityService getInstance() {
        if (instance == null) {
            synchronized (SpecialityService.class) {
                if (instance == null) instance = new SpecialityService();
            }
        }
        return instance;
    }

    public void createSpeciality(Speciality speciality) {
        specialityRepository.create(speciality);
    }

    public List<Speciality> getAllSpecialities() {
        return specialityRepository.getAll();
    }

    public void delete(Long id) {
        specialityRepository.delete(id);
    }

    public Optional<Speciality> findById(Long id) {
        return specialityRepository.findById(id);
    }

    public void updateSpeciality(Speciality speciality) {
        specialityRepository.update(speciality);
    }
}
