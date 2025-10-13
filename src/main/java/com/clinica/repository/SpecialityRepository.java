package com.clinica.repository;

import com.clinica.dao.DepartmentDAO;
import com.clinica.dao.SpecialityDAO;
import com.clinica.model.Department;
import com.clinica.model.Speciality;
import com.clinica.repository.repositoryIntf.DepartmentRepositoryIntf;
import com.clinica.repository.repositoryIntf.SpecialityRepositoryIntf;

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
}
