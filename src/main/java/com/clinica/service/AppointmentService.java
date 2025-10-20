package com.clinica.service;

import com.clinica.dto.AppointmentDTO;
import com.clinica.mapper.AppointmentMapper;
import com.clinica.model.Appointment;
import com.clinica.model.Doctor;
import com.clinica.model.Patient;
import com.clinica.model.enums.AppointmentStatus;
import com.clinica.repository.AppointmentRepository;
import com.clinica.repository.AvailabilityRepository;

import java.time.LocalDate;
import java.time.LocalTime;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Optional;

public class AppointmentService {
    private static volatile AppointmentService instance;
    private static final AppointmentRepository appointmentRepo = AppointmentRepository.getInstance();
    private static final UserService userService = UserService.getInstance();
    private static final PatientService patientService = PatientService.getInstance();
    private static final AvailabilityService avaService = AvailabilityService.getInstance();

    private AppointmentService(){};

    public static synchronized AppointmentService getInstance(){
        if(instance == null){
            synchronized (AppointmentService.class) {
                if (instance == null) instance = new AppointmentService();
            }
        }
        return instance;
    }

    public List<String> getOccupiedTimes(String day, LocalDate date, String doctorName) {
        boolean docUnAvailable =  avaService.checkDocIfAvailable(doctorName, day);

        List<String> times = new ArrayList<>();
        if (docUnAvailable) {
            LocalTime start = LocalTime.of(9, 0);
            LocalTime end = LocalTime.of(15, 25);

            while (!start.isAfter(end)) {
                times.add(start.toString());
                start = start.plusMinutes(35);
            }
            return times;
        } else {
            return appointmentRepo.getOccupiedTimes(date, doctorName);
        }
    }

    public boolean createAppointment(AppointmentDTO dto) {
        Optional<Doctor> doctor = userService.findDoctorByName(dto.getDoctorName());
        Optional<Patient> patient = patientService.findPatientByName(dto.getPatientName());
        if(doctor.isEmpty() || patient.isEmpty()){
            return false;
        }
        Appointment appointment = AppointmentMapper.toEntity(dto, doctor.get(), patient.get());
        return appointmentRepo.create(appointment);
    }

    public Optional<List<AppointmentDTO>> getAll() {
        return Optional.of(appointmentRepo.getAll().stream().map(AppointmentMapper::toDTO).toList());
    }

    public List<AppointmentDTO> getAllByPatientId(Long id) {
        return appointmentRepo.getAllByPatientId(id).get().stream().map(AppointmentMapper::toDTO).toList();
    }

    public List<AppointmentDTO> getAllByDoctorId(Long id) {

        return appointmentRepo.getAllByDoctorId(id).get().stream().map(AppointmentMapper::toDTO).toList();
    }

    public boolean changeStatus(Long appId,AppointmentStatus appointmentStatus) {
        return appointmentRepo.changeStatus(appId, appointmentStatus);
    }
}
