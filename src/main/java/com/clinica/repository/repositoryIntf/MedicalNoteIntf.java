package com.clinica.repository.repositoryIntf;

import com.clinica.model.MedicalNote;

import java.util.Optional;

public interface MedicalNoteIntf {
    Optional<MedicalNote> findById(Long id);
    void update(MedicalNote medicalNote);
    void delete(Long id);
    boolean create(MedicalNote medicalNote);
}
