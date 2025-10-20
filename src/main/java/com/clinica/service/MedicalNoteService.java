package com.clinica.service;

import com.clinica.dto.AppointmentDTO;
import com.clinica.dto.MedicalNoteDTO;
import com.clinica.dto.SpecialityDTO;
import com.clinica.mapper.AppointmentMapper;
import com.clinica.mapper.MedicalNoteMapper;
import com.clinica.mapper.SpecialityMapper;
import com.clinica.model.*;
import com.clinica.repository.*;
import com.clinica.repository.repositoryIntf.DepartmentRepositoryIntf;

import java.util.List;
import java.util.Optional;

public class MedicalNoteService {
    private static volatile MedicalNoteService instance;
    private final MedicalNoteRepository noteRepository = MedicalNoteRepository.getInstance();
    private final AppointmentRepository appointmentRepository = AppointmentRepository.getInstance();
    private final DoctorRepository doctorRepository = DoctorRepository.getInstance();

    private MedicalNoteService(){}

    public static MedicalNoteService getInstance() {
        if (instance == null) {
            synchronized (MedicalNoteService.class) {
                if (instance == null) instance = new MedicalNoteService();
            }
        }
        return instance;
    }


    public boolean save(MedicalNoteDTO dto) {
        MedicalNote note = MedicalNoteMapper.toEntity(dto);

        Optional<Appointment> appointment = appointmentRepository.findById(dto.getAppointmentId());
        Optional<Doctor> doctor = doctorRepository.findByName(dto.getDoctorName());

        if(appointment.isEmpty() || doctor.isEmpty()){
            return false;
        }

        note.setAppointment(appointment.get());
        note.setDoctor(doctor.get());

        return noteRepository.create(note);
    }
}
