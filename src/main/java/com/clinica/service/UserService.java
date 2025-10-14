package com.clinica.service;

import com.clinica.dto.*;
import com.clinica.mapper.DoctorMapper;
import com.clinica.mapper.UserMapper;
import com.clinica.model.Doctor;
import com.clinica.model.Patient;
import com.clinica.model.Speciality;
import com.clinica.model.User;
import com.clinica.repository.DoctorRepository;
import com.clinica.repository.PatientRepository;
import com.clinica.repository.UserRepository;
import com.clinica.repository.repositoryIntf.DoctorRepositoryIntf;
import com.clinica.repository.repositoryIntf.PatientRepositoryIntf;
import com.clinica.repository.repositoryIntf.UserRepositoryIntf;

import java.util.Objects;
import java.util.Optional;

public class UserService {
    private static volatile UserService instance;
    private final PatientRepositoryIntf PatientRepo = PatientRepository.getInstance();
    private final UserRepositoryIntf userRepo = UserRepository.getInstance();
    private final DoctorRepositoryIntf docRepo = DoctorRepository.getInstance();
    private final SpecialityService specialityService = SpecialityService.getInstance();

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
        Optional<User> found = userRepo.findByEmail(dto.getEmail());
        if (found.isPresent() && found.get().getPassword().equals(dto.getPassword())) {
            return Optional.of(UserMapper.toDTO(found.get()));
        }
        return Optional.empty();
    }

    public boolean createDoctor(DoctorDTO doctorDTO) {
        Optional<Speciality> speciality = specialityService.findByName(doctorDTO.getSpecialityName());
        if(speciality.isEmpty()){
            return false;
        }

        Doctor doctor = DoctorMapper.fromCreateDTO(doctorDTO, speciality.get());

        return docRepo.create(doctor);
    }

    public Object getAllDoctors() {
        return docRepo.findAll().stream().map(DoctorMapper::toDTO).toList();
    }

    public Optional<DoctorDTO> findDoctorById(Long id) {
        return Optional.of(DoctorMapper.toDTO(docRepo.findById(id).get()));
    }

    public boolean deleteDoctor(Long id) {
        return docRepo.delete(id);
    }

    public boolean updateDoctor(DoctorDTO doctorDTO) {
        Optional<Speciality> speciality = specialityService.findByName(doctorDTO.getSpecialityName());
        if(speciality.isEmpty()){
            return false;
        }
        Optional<Doctor> doc = docRepo.findById(doctorDTO.getId());

        if(doc.isEmpty()){
            return false;
        }

        if (Objects.isNull(doctorDTO.getPassword()) || doctorDTO.getPassword().isBlank()) {
            doctorDTO.setPassword(doc.get().getPassword());
        }

        Doctor doctor = DoctorMapper.fromCreateDTO(doctorDTO, speciality.get());

        return docRepo.update(doctor);
    }
}
