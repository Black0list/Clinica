package com.clinica.dao;

import com.clinica.dto.AppointmentDTO;
import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;

import java.util.ArrayList;
import java.util.List;

public class DashboardDAO {

    private static final EntityManagerFactory emf = Persistence.createEntityManagerFactory("clinicaPU");

    public long countAppointments() {
        EntityManager em = emf.createEntityManager();
        try {
            return em.createQuery("SELECT COUNT(a) FROM Appointment a", Long.class).getSingleResult();
        } finally {
            em.close();
        }
    }

    public long countDoctors() {
        EntityManager em = emf.createEntityManager();
        try {
            return em.createQuery("SELECT COUNT(d) FROM Doctor d", Long.class).getSingleResult();
        } finally {
            em.close();
        }
    }

    public long countPatients() {
        EntityManager em = emf.createEntityManager();
        try {
            return em.createQuery("SELECT COUNT(p) FROM Patient p", Long.class).getSingleResult();
        } finally {
            em.close();
        }
    }

    public long countMedicalNotes() {
        EntityManager em = emf.createEntityManager();
        try {
            return em.createQuery("SELECT COUNT(m) FROM MedicalNote m", Long.class).getSingleResult();
        } finally {
            em.close();
        }
    }

    public List<AppointmentDTO> findRecentAppointments(int limit) {
        EntityManager em = emf.createEntityManager();
        try {
            List<com.clinica.model.Appointment> appointments = em.createQuery(
                            "SELECT a FROM Appointment a ORDER BY a.date DESC, a.startAt DESC",
                            com.clinica.model.Appointment.class
                    )
                    .setMaxResults(limit)
                    .getResultList();

            List<AppointmentDTO> dtos = new ArrayList<>();
            for (com.clinica.model.Appointment a : appointments) {
                AppointmentDTO dto = new AppointmentDTO();
                dto.setId(a.getId());
                dto.setDate(a.getDate());
                dto.setStartTime(a.getStartAt());
                dto.setEndTime(a.getEndAt());
                dto.setStatus(a.getStatus() != null ? a.getStatus().name() : null);
                dto.setType(a.getType() != null ? a.getType().name() : null);
                dto.setExecutor(a.getExecutor());
                dto.setDoctorName(a.getDoctor() != null ? a.getDoctor().getName() : null);
                dto.setPatientName(a.getPatient() != null ? a.getPatient().getName() : null);
                dtos.add(dto);
            }

            return dtos;
        } finally {
            em.close();
        }
    }
}
