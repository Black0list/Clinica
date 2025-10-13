package com.clinica.repository;

import com.clinica.dao.DepartmentDAO;
import com.clinica.model.Department;
import com.clinica.repository.repositoryIntf.DepartmentRepositoryIntf;

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
}
