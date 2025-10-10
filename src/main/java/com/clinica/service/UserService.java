package com.clinica.service;

import com.clinica.dto.LoginDTO;
import com.clinica.dto.RegisterDTO;
import com.clinica.dto.UserDTO;
import com.clinica.mapper.UserMapper;
import com.clinica.model.Patient;
import com.clinica.model.User;
import com.clinica.repository.PatientRepository;
import com.clinica.repository.UserRepository;
import com.clinica.repository.repositoryIntf.PatientRepositoryIntf;
import com.clinica.repository.repositoryIntf.UserRepositoryIntf;

import java.util.Optional;

public class UserService {
    private static volatile UserService instance;
    private final PatientRepositoryIntf PatientRepo = PatientRepository.getInstance();
    private final UserRepositoryIntf userRepo = UserRepository.getInstance();

    public static UserService getInstance() {
        if (instance == null) {
            synchronized (UserService.class) {
                if (instance == null) instance = new UserService();
            }
        }
        return instance;
    }

    public boolean register(RegisterDTO dto) {
        Optional<User> existing = userRepo.findByEmail(dto.getEmail());
        if (existing.isPresent()) {
            return false;
        }

        Patient patient = UserMapper.fromRegisterDTO(dto);
        PatientRepo.create(patient);
        return true;
    }

    public Optional<UserDTO> login(LoginDTO dto) {
        Optional<User> found = PatientRepo.findByEmail(dto.getEmail());
        if (found.isPresent() && found.get().getPassword().equals(dto.getPassword())) {
            return Optional.of(UserMapper.toDTO(found.get()));
        }
        return Optional.empty();
    }
}
