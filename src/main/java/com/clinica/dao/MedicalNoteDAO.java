package com.clinica.dao;

import com.clinica.model.MedicalNote;
import com.clinica.model.Patient;
import jakarta.persistence.EntityManager;
import jakarta.persistence.NoResultException;

import java.util.Optional;

public class MedicalNoteDAO extends BaseDAO<MedicalNote> {

    private static volatile MedicalNoteDAO instance;

    private MedicalNoteDAO() {
        super(MedicalNote.class);
    }

    public static MedicalNoteDAO getInstance() {
        if (instance == null) {
            synchronized (MedicalNoteDAO.class) {
                if (instance == null) instance = new MedicalNoteDAO();
            }
        }
        return instance;
    }
}
