package com.clinica.repository;

import com.clinica.dao.DepartmentDAO;
import com.clinica.model.Department;
import com.clinica.model.User;
import com.clinica.repository.repositoryIntf.DepartmentRepositoryIntf;
import com.clinica.utils.JpaUtil;
import jakarta.persistence.EntityManager;
import jakarta.persistence.NoResultException;
import jakarta.persistence.TypedQuery;

import java.util.List;
import java.util.Optional;

public class DepartmentRepository implements DepartmentRepositoryIntf {
    private static DepartmentRepository instance;
    private static final DepartmentDAO departmentDAO = DepartmentDAO.getInstance();;

    private DepartmentRepository(){}


    public static synchronized DepartmentRepository getInstance() {
        if (instance == null)
            instance = new DepartmentRepository();
        return instance;
    }

    public void create(Department department){
        departmentDAO.create(department);
    }

    public List<Department> getAll(){
        return departmentDAO.findAll();
    }

    public void delete(Long id) {
        departmentDAO.delete(id);
    }

    public Optional<Department> findById(Long id) {
        return departmentDAO.findById(id);
    }

    public void update(Department dept) {
        departmentDAO.update(dept);
    }

    public Optional<Department> findByName(String departmentName) {
        EntityManager em = JpaUtil.getEntityManager();
        try {
            TypedQuery<Department> query = em.createQuery("SELECT d FROM Department d WHERE d.name = :name", Department.class);
            query.setParameter("name", departmentName);
            return Optional.of(query.getSingleResult());
        } catch (NoResultException e) {
            return Optional.empty();
        } finally {
            em.close();
        }
    }
}
