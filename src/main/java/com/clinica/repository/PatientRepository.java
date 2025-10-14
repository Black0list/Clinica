package com.clinica.repository;

import com.clinica.dao.PatientDAO;
import com.clinica.dao.UserDAO;
import com.clinica.model.Patient;
import com.clinica.model.User;
import com.clinica.repository.repositoryIntf.PatientRepositoryIntf;
import com.clinica.utils.JpaUtil;
import jakarta.persistence.EntityManager;
import jakarta.persistence.NoResultException;
import jakarta.persistence.TypedQuery;

import java.util.List;
import java.util.Optional;

public class PatientRepository implements PatientRepositoryIntf {
    private static PatientRepository instance;
    private static final PatientDAO patientDAO = PatientDAO.getInstance();;

    private PatientRepository() {}

    public static synchronized PatientRepository getInstance() {
        if (instance == null)
            instance = new PatientRepository();
        return instance;
    }

    public Optional<Patient> findByEmail(String email) {
        EntityManager em = JpaUtil.getEntityManager();
        try {
            TypedQuery<Patient> query = em.createQuery("SELECT u FROM Patient u WHERE u.email = :email", Patient.class);
            query.setParameter("email", email);
            return Optional.of(query.getSingleResult());
        } catch (NoResultException e) {
            return Optional.empty();
        } finally {
            em.close();
        }
    }

    public List<Patient> findAll() {
        EntityManager em = JpaUtil.getEntityManager();
        try {
            TypedQuery<Patient> query = em.createQuery("SELECT p FROM Patient p", Patient.class);
            return query.getResultList();
        } finally {
            em.close();
        }
    }


    public void create(Patient patient){
        patientDAO.create(patient);
    }
}
