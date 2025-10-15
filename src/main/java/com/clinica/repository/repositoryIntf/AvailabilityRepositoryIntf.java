package com.clinica.repository.repositoryIntf;

import com.clinica.model.Availability;
import com.clinica.model.Department;
import com.clinica.model.enums.DayOfWeek;

import java.util.List;
import java.util.Optional;

public interface AvailabilityRepositoryIntf {
    boolean create(Availability availability);
    boolean update(Availability availability);
    boolean delete(Long id);
    List<Availability> getAll();
    Optional<Availability> findByName(DayOfWeek day);
}
