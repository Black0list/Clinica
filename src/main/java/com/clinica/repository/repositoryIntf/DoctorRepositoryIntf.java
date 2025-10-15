package com.clinica.repository.repositoryIntf;

import com.clinica.dto.DoctorDTO;
import com.clinica.model.Doctor;
import com.clinica.model.Patient;

import java.util.List;
import java.util.Optional;

public interface DoctorRepositoryIntf {
    boolean create(Doctor doctor);
    Optional<Doctor> findByEmail(String email);
    List<Doctor> findAll();
    Optional<Doctor> findById(Long id);
    boolean delete(Long id);
    boolean update(Doctor doctor);
    Optional<Doctor> findByName(String doctorName);
}
