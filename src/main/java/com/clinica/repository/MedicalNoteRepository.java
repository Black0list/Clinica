package com.clinica.repository;

import com.clinica.dao.MedicalNoteDAO;
import com.clinica.model.MedicalNote;
import com.clinica.model.Speciality;
import com.clinica.repository.repositoryIntf.MedicalNoteIntf;

import java.util.Optional;

public class MedicalNoteRepository implements MedicalNoteIntf {
    private static MedicalNoteRepository instance;
    private static final MedicalNoteDAO medicalNoteDAO = MedicalNoteDAO.getInstance();;

    private MedicalNoteRepository(){
    }


    public static synchronized MedicalNoteRepository getInstance() {
        if (instance == null)
            instance = new MedicalNoteRepository();
        return instance;
    }

    public boolean create(MedicalNote medicalNote){
        return medicalNoteDAO.create(medicalNote);
    }

    public void delete(Long id) {
        medicalNoteDAO.delete(id);
    }

    public Optional<MedicalNote> findById(Long id) {
        return medicalNoteDAO.findById(id);
    }

    public void update(MedicalNote medicalNote) {
        medicalNoteDAO.update(medicalNote);
    }
}
