package com.clinica.repository.repositoryIntf;

import com.clinica.model.Patient;
import com.clinica.model.User;

import java.util.List;
import java.util.Optional;

public interface PatientRepositoryIntf {
    void create(Patient patient);
    Optional<Patient> findByEmail(String email);
    List<Patient> findAll();
}
