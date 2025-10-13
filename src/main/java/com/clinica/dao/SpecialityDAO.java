package com.clinica.dao;

import com.clinica.model.Department;
import com.clinica.model.Patient;
import com.clinica.model.Speciality;
import jakarta.persistence.EntityManager;
import jakarta.persistence.NoResultException;

import java.util.Optional;

public class SpecialityDAO extends BaseDAO<Speciality> {

    private static volatile SpecialityDAO instance;

    private SpecialityDAO() {
        super(Speciality.class);
    }

    public static SpecialityDAO getInstance() {
        if (instance == null) {
            synchronized (SpecialityDAO.class) {
                if (instance == null) instance = new SpecialityDAO();
            }
        }
        return instance;
    }
}
