package com.clinica.repository;

import com.clinica.dao.AppointmentDAO;
import com.clinica.dao.AvailabilityDAO;
import com.clinica.dto.AppointmentDTO;
import com.clinica.model.Appointment;
import com.clinica.model.Availability;
import com.clinica.model.Doctor;
import com.clinica.model.enums.AppointmentStatus;
import com.clinica.repository.repositoryIntf.AppointmentRepositoryIntf;
import com.clinica.utils.JpaUtil;
import jakarta.persistence.EntityManager;
import jakarta.persistence.NoResultException;
import jakarta.persistence.TypedQuery;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

public class AppointmentRepository implements AppointmentRepositoryIntf {
    private static AppointmentRepository instance;
    private static final AppointmentDAO appointmentDAO = AppointmentDAO.getInstance();

    private AppointmentRepository(){};

    public static synchronized AppointmentRepository getInstance() {
        if (instance == null)
            instance = new AppointmentRepository();
        return instance;
    }

    public List<String> getOccupiedTimes(LocalDate date, String doctorName) {
        EntityManager em = JpaUtil.getEntityManager();
        try {
            TypedQuery<Appointment> query = em.createQuery(
                    "SELECT a FROM Appointment a WHERE a.date = :date AND a.doctor.name = :doctorName",
                    Appointment.class
            );
            query.setParameter("date", date);
            query.setParameter("doctorName", doctorName);

            List<Appointment> appointments = query.getResultList();
            List<String> occupiedTimes = new ArrayList<>();

            for (Appointment appointment : appointments) {
                occupiedTimes.add(appointment.getStartAt().toString());
            }

            return occupiedTimes;
        } finally {
            em.close();
        }
    }

    public boolean create(Appointment appointment){
       return appointmentDAO.create(appointment);
    }

    public List<Appointment> getAll(){
        return appointmentDAO.findAll();
    }

    public Optional<List<Appointment>> getAllByPatientId(Long id) {
        EntityManager em = JpaUtil.getEntityManager();
        try {
            List<Appointment> appointments = em.createQuery(
                            "SELECT a FROM Appointment a WHERE a.patient.id = :id", Appointment.class)
                    .setParameter("id", id)
                    .getResultList();
            return Optional.ofNullable(appointments);
        } catch (NoResultException e) {
            return Optional.empty();
        } finally {
            em.close();
        }
    }

    public Optional<List<Appointment>> getAllByDoctorId(Long id){
        EntityManager em = JpaUtil.getEntityManager();
        try {
            List<Appointment> appointments = em.createQuery(
                            "SELECT a FROM Appointment a WHERE a.doctor.id = :id", Appointment.class)
                    .setParameter("id", id)
                    .getResultList();
            return Optional.ofNullable(appointments);
        } catch (NoResultException e) {
            return Optional.empty();
        } finally {
            em.close();
        }
    }

    public boolean changeStatus(Long appointmentId, AppointmentStatus newStatus) {
        EntityManager em = JpaUtil.getEntityManager();
        try {
            em.getTransaction().begin();

            Appointment appointment = em.find(Appointment.class, appointmentId);
            if (appointment == null) {
                return false;
            }

            appointment.setStatus(newStatus);
            em.merge(appointment);

            em.getTransaction().commit();
            return true;
        } catch (Exception e) {
            if (em.getTransaction().isActive()) {
                em.getTransaction().rollback();
            }
            e.printStackTrace();
            return false;
        } finally {
            em.close();
        }
    }

}
