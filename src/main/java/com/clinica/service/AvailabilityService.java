package com.clinica.service;

import com.clinica.dao.AvailabilityDAO;
import com.clinica.dto.AvailabilityDTO;
import com.clinica.mapper.AvailabilityMapper;
import com.clinica.model.Availability;
import com.clinica.model.Doctor;
import com.clinica.model.User;
import com.clinica.repository.AvailabilityRepository;

import java.util.List;
import java.util.Optional;

public class AvailabilityService {
    private static volatile AvailabilityService instance;
    private static final AvailabilityRepository availabilityRepo = AvailabilityRepository.getInstance();
    private static final UserService userService = UserService.getInstance();

    private AvailabilityService(){};

    public static synchronized AvailabilityService getInstance(){
        if(instance == null){
            synchronized (AvailabilityService.class) {
                if (instance == null) instance = new AvailabilityService();
            }
        }
        return instance;
    }

    public boolean create(AvailabilityDTO dto) {
        Optional<Doctor> doctor = userService.findDoctorByName(dto.getDoctorName());
        Optional<Availability> availabilityFound = availabilityRepo.findByName(dto.getDay());
        if(doctor.isEmpty() || availabilityFound.isPresent()){
            return false;
        }
        Availability availability = AvailabilityMapper.toEntity(dto, doctor.get());
        return availabilityRepo.create(availability);
    }

    public List<AvailabilityDTO> getAll() {
        return availabilityRepo.getAll().stream().map(AvailabilityMapper::toDTO).toList();
    }

    public boolean update(AvailabilityDTO dto) {
        Optional<Doctor> doctor = userService.findDoctorByName(dto.getDoctorName());

        if(doctor.isEmpty()){
            return false;
        }
        return availabilityRepo.update(AvailabilityMapper.toEntity(dto, doctor.get()));
    }

    public boolean delete(Long id) {
        return availabilityRepo.delete(id);
    }

    public Optional<AvailabilityDTO> findById(Long id) {
        return Optional.of(AvailabilityMapper.toDTO(availabilityRepo.findById(id).get()));
    }
}
