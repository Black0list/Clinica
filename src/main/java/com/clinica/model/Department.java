package com.clinica.model;

import java.util.List;

import jakarta.persistence.*;


@Entity
@Table(name = "departments")
public class Department {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String code;
    private String name;
    private String description;

    @OneToMany(mappedBy = "department")
    private List<Speciality> specialties;

    public Department() {}

    public Department(String code, String name, String description, List<Speciality> specialties) {
        this.code = code;
        this.name = name;
        this.description = description;
        this.specialties = specialties;
    }

    public String getCode() { return code; }
    public void setCode(String code) { this.code = code; }

    public String getName() { return name; }
    public void setName(String name) { this.name = name; }

    public String getDescription() { return description; }
    public void setDescription(String description) { this.description = description; }

    public List<Speciality> getSpecialties() { return specialties; }
    public void setSpecialties(List<Speciality> specialties) { this.specialties = specialties; }
}
