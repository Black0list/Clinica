package com.clinica.dao;

import com.clinica.model.Patient;
import jakarta.persistence.EntityManager;
import jakarta.persistence.NoResultException;

import java.util.Optional;

public class PatientDAO extends BaseDAO<Patient> {

    private static volatile PatientDAO instance;

    private PatientDAO() {
        super(Patient.class);
    }

    public static PatientDAO getInstance() {
        if (instance == null) {
            synchronized (PatientDAO.class) {
                if (instance == null) instance = new PatientDAO();
            }
        }
        return instance;
    }
}
