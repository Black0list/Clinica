package com.clinica.dao;

import com.clinica.model.Doctor;

public class DoctorDAO extends BaseDAO<Doctor> {
    private static volatile DoctorDAO instance;

    private DoctorDAO() {
        super(Doctor.class);
    }

    public static DoctorDAO getInstance() {
        if (instance == null) {
            synchronized (DoctorDAO.class) {
                if (instance == null) instance = new DoctorDAO();
            }
        }
        return instance;
    }
}
