package com.clinica.repository;

import com.clinica.dao.AvailabilityDAO;
import com.clinica.dto.AvailabilityDTO;
import com.clinica.model.Availability;
import com.clinica.model.Speciality;
import com.clinica.model.enums.DayOfWeek;
import com.clinica.repository.repositoryIntf.AvailabilityRepositoryIntf;
import com.clinica.utils.JpaUtil;
import jakarta.persistence.EntityManager;
import jakarta.persistence.NoResultException;
import jakarta.persistence.TypedQuery;

import java.util.List;
import java.util.Optional;

public class AvailabilityRepository implements AvailabilityRepositoryIntf {

    private static AvailabilityRepository instance;
    private static final AvailabilityDAO availabilityDAO = AvailabilityDAO.getInstance();

    private AvailabilityRepository(){};

    public static synchronized AvailabilityRepository getInstance() {
        if (instance == null)
            instance = new AvailabilityRepository();
        return instance;
    }

    public boolean create(Availability availability) {
        return availabilityDAO.create(availability);
    }
    public boolean update(Availability availability) {
        return availabilityDAO.update(availability);
    }
    public boolean delete(Long id){
        return availabilityDAO.delete(id);
    }

    public List<Availability> getAll() {
        return availabilityDAO.findAll();
    }

    public Optional<Availability> findById(Long id) {
        return availabilityDAO.findById(id);
    }

    public Optional<Availability> findByName(DayOfWeek day) {
        EntityManager em = JpaUtil.getEntityManager();
        try {
            TypedQuery<Availability> query = em.createQuery("SELECT a FROM Availability a WHERE a.day = :day", Availability.class);
            query.setParameter("day", day);
            return Optional.of(query.getSingleResult());
        } catch (NoResultException e) {
            return Optional.empty();
        } finally {
            em.close();
        }
    }
}
