package com.clinica.dao;

import com.clinica.model.Appointment;
import com.clinica.model.Availability;

public class AppointmentDAO extends BaseDAO<Appointment>{

    private static volatile AppointmentDAO instance;

    private AppointmentDAO() {
        super(Appointment.class);
    }

    public static AppointmentDAO getInstance() {
        if (instance == null) {
            synchronized (AppointmentDAO.class) {
                if (instance == null) instance = new AppointmentDAO();
            }
        }
        return instance;
    }
}
