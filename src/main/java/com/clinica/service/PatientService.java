package com.clinica.service;

import com.clinica.dto.PatientDTO;
import com.clinica.mapper.PatientMapper;
import com.clinica.model.Patient;
import com.clinica.repository.PatientRepository;
import com.clinica.repository.repositoryIntf.PatientRepositoryIntf;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

public class PatientService {
    private static volatile PatientService instance;
    private static final PatientRepositoryIntf patientRepo = PatientRepository.getInstance();

    private PatientService(){};

    public static PatientService getInstance() {
        if (instance == null) {
            synchronized (PatientService.class) {
                if (instance == null) instance = new PatientService();
            }
        }
        return instance;
    }

    public List<PatientDTO> patients(){
        List<Patient> patientsUsers = patientRepo.findAll();

        return patientsUsers.stream().map(PatientMapper::toDTO).toList();
    }

    public Optional<Patient> findPatientByName(String patientName) {
        return patientRepo.findPatientByName(patientName);
    }

    public Optional<PatientDTO> findByUserId(String email) {
        return Optional.of(PatientMapper.toDTO(patientRepo.findByEmail(email).get()));
    }
}
