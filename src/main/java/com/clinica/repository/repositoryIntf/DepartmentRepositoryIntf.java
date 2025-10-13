package com.clinica.repository.repositoryIntf;

import com.clinica.model.Department;

import java.util.List;

public interface DepartmentRepositoryIntf {
    void create(Department department);
    void update(Department dept);
    void delete(Long id);
    List<Department> getAll();
}
