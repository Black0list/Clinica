package com.clinica.repository;

import com.clinica.dao.DoctorDAO;
import com.clinica.dao.PatientDAO;
import com.clinica.dao.UserDAO;
import com.clinica.model.Doctor;
import com.clinica.model.Patient;
import com.clinica.model.User;
import com.clinica.repository.repositoryIntf.DoctorRepositoryIntf;
import com.clinica.repository.repositoryIntf.PatientRepositoryIntf;
import com.clinica.utils.JpaUtil;
import jakarta.persistence.EntityManager;
import jakarta.persistence.NoResultException;
import jakarta.persistence.TypedQuery;

import java.util.List;
import java.util.Optional;

public class DoctorRepository implements DoctorRepositoryIntf {
    private static DoctorRepository instance;
    private static final DoctorDAO doctorDAO = DoctorDAO.getInstance();;

    private DoctorRepository() {}

    public static synchronized DoctorRepository getInstance() {
        if (instance == null)
            instance = new DoctorRepository();
        return instance;
    }

    public Optional<Doctor> findByEmail(String email) {
        EntityManager em = JpaUtil.getEntityManager();
        try {
            TypedQuery<Doctor> query = em.createQuery("SELECT u FROM Doctor u WHERE u.email = :email", Doctor.class);
            query.setParameter("email", email);
            return Optional.of(query.getSingleResult());
        } catch (NoResultException e) {
            return Optional.empty();
        } finally {
            em.close();
        }
    }

    public List<Doctor> findAll() {
        EntityManager em = JpaUtil.getEntityManager();
        try {
            TypedQuery<Doctor> query = em.createQuery("SELECT d FROM Doctor d", Doctor.class);
            return query.getResultList();
        } finally {
            em.close();
        }
    }

    public Optional<Doctor> findById(Long id){
        return doctorDAO.findById(id);
    }


    public boolean create(Doctor doctor){
        return doctorDAO.create(doctor);
    }

    public boolean delete(Long id){
        return doctorDAO.delete(id);
    }

    public boolean update(Doctor doctor){
        return doctorDAO.update(doctor);
    }

    public Optional<Doctor> findByName(String name) {
        EntityManager em = JpaUtil.getEntityManager();
        try {
            Doctor doctor = em.createQuery(
                            "SELECT d FROM Doctor d WHERE d.name = :name", Doctor.class)
                    .setParameter("name", name)
                    .getSingleResult();
            return Optional.ofNullable(doctor);
        } catch (NoResultException e) {
            return Optional.empty();
        } finally {
            em.close();
        }
    }
}
