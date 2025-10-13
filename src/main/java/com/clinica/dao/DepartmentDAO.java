package com.clinica.dao;

import com.clinica.model.Department;
import com.clinica.model.Patient;
import jakarta.persistence.EntityManager;
import jakarta.persistence.NoResultException;

import java.util.Optional;

public class DepartmentDAO extends BaseDAO<Department> {

    private static volatile DepartmentDAO instance;

    private DepartmentDAO() {
        super(Department.class);
    }

    public static DepartmentDAO getInstance() {
        if (instance == null) {
            synchronized (DepartmentDAO.class) {
                if (instance == null) instance = new DepartmentDAO();
            }
        }
        return instance;
    }
}
