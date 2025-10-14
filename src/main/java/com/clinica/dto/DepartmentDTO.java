package com.clinica.dto;

import java.io.Serializable;

public class DepartmentDTO implements Serializable {
    private Long id;
    private String code;
    private String name;
    private String description;
    private int specialityCount;

    public DepartmentDTO() {}

    public DepartmentDTO(Long id, String code, String name, String description, int specialityCount) {
        this.id = id;
        this.code = code;
        this.name = name;
        this.description = description;
        this.specialityCount = specialityCount;
    }

    public Long getId() {
        return id;
    }
    public void setId(Long id) {
        this.id = id;
    }

    public String getCode() {
        return code;
    }
    public void setCode(String code) {
        this.code = code;
    }

    public String getName() {
        return name;
    }
    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }
    public void setDescription(String description) {
        this.description = description;
    }

    public int getSpecialityCount() {
        return specialityCount;
    }
    public void setSpecialityCount(int specialityCount) {
        this.specialityCount = specialityCount;
    }
}
