package com.clinica.repository.repositoryIntf;

import com.clinica.model.Department;
import com.clinica.model.Speciality;

import java.util.List;

public interface SpecialityRepositoryIntf {
    void create(Speciality speciality);
    void update(Speciality speciality);
    void delete(Long id);
    List<Speciality> getAll();
}
