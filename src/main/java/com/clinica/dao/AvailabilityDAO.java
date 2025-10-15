package com.clinica.dao;

import com.clinica.model.Availability;
import com.clinica.model.Department;

public class AvailabilityDAO extends BaseDAO<Availability>{

    private static volatile AvailabilityDAO instance;

    private AvailabilityDAO() {
        super(Availability.class);
    }

    public static AvailabilityDAO getInstance() {
        if (instance == null) {
            synchronized (AvailabilityDAO.class) {
                if (instance == null) instance = new AvailabilityDAO();
            }
        }
        return instance;
    }
}
