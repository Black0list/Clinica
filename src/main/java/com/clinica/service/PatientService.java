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

    public static PatientService getInstance() {
        if (instance == null) {
            synchronized (UserService.class) {
                if (instance == null) instance = new PatientService();
            }
        }
        return instance;
    }

    public static List<PatientDTO> patients(){
        List<Patient> patientsUsers = patientRepo.findAll();

        return patientsUsers.stream().map(PatientMapper::toDTO).toList();
    }
}
