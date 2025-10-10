package com.clinica.dto;

import java.io.Serializable;

public class DepartmentDTO implements Serializable {
    private Long id;
    private String code;
    private String name;
    private String description;

    public DepartmentDTO() {}

    // Getters & Setters
    public Long getId() { return id; }
    public void setId(Long id) { this.id = id; }

    public String getCode() { return code; }
    public void setCode(String code) { this.code = code; }

    public String getName() { return name; }
    public void setName(String name) { this.name = name; }

    public String getDescription() { return description; }
    public void setDescription(String description) { this.description = description; }
}
