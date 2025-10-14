package com.clinica.service;

import com.clinica.dto.DepartmentDTO;
import com.clinica.mapper.DepartmentMapper;
import com.clinica.model.Department;
import com.clinica.repository.DepartmentRepository;
import com.clinica.repository.repositoryIntf.DepartmentRepositoryIntf;

import java.util.List;
import java.util.Optional;

public class DepartmentService {
    private static volatile DepartmentService instance;
    private static final DepartmentRepository departmentRepository = DepartmentRepository.getInstance();;

    private DepartmentService(){}

    public static DepartmentService getInstance() {
        if (instance == null) {
            synchronized (DepartmentService.class) {
                if (instance == null) instance = new DepartmentService();
            }
        }
        return instance;
    }

    public void createDepartment(Department department) {
        departmentRepository.create(department);
    }

    public List<DepartmentDTO> getAllDepartments() {
        List<Department> departments =  departmentRepository.getAll();
        return departments.stream().map(DepartmentMapper::toDTO).toList();
    }

    public void delete(Long id) {
        departmentRepository.delete(id);
    }

    public Optional<Department> findById(Long id) {
        return departmentRepository.findById(id);
    }

    public void updateDepartment(Department dept) {
        departmentRepository.update(dept);
    }
}
