package com.clinica.repository;

import com.clinica.dao.DepartmentDAO;
import com.clinica.dao.SpecialityDAO;
import com.clinica.model.Department;
import com.clinica.model.Speciality;
import com.clinica.repository.repositoryIntf.DepartmentRepositoryIntf;
import com.clinica.repository.repositoryIntf.SpecialityRepositoryIntf;
import com.clinica.utils.JpaUtil;
import jakarta.persistence.EntityManager;
import jakarta.persistence.NoResultException;
import jakarta.persistence.TypedQuery;

import java.util.List;
import java.util.Optional;

public class SpecialityRepository implements SpecialityRepositoryIntf {
    private static SpecialityRepository instance;
    private static final SpecialityDAO specialityDAO = SpecialityDAO.getInstance();;

    private SpecialityRepository(){
    }


    public static synchronized SpecialityRepository getInstance() {
        if (instance == null)
            instance = new SpecialityRepository();
        return instance;
    }

    public void create(Speciality speciality){
        specialityDAO.create(speciality);
    }

    public List<Speciality> getAll(){
        return specialityDAO.findAll();
    }

    public void delete(Long id) {
        specialityDAO.delete(id);
    }

    public Optional<Speciality> findById(Long id) {
        return specialityDAO.findById(id);
    }

    public void update(Speciality speciality) {
        specialityDAO.update(speciality);
    }

    public Optional<Speciality> findByName(String specialityName) {
        EntityManager em = JpaUtil.getEntityManager();
        try {
            TypedQuery<Speciality> query = em.createQuery("SELECT s FROM Speciality s WHERE s.name = :name", Speciality.class);
            query.setParameter("name", specialityName);
            return Optional.of(query.getSingleResult());
        } catch (NoResultException e) {
            return Optional.empty();
        } finally {
            em.close();
        }
    }
}
