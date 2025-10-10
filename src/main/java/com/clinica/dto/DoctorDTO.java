package com.clinica.dto;

import java.io.Serializable;

public class DoctorDTO implements Serializable {
    private int id;
    private String name;
    private String email;
    private String phone;
    private String registration;
    private String title;
    private String departmentName;
    private String specialityName;

    public DoctorDTO() {}

    // Getters & Setters
    public int getId() { return id; }
    public void setId(int id) { this.id = id; }

    public String getName() { return name; }
    public void setName(String name) { this.name = name; }

    public String getEmail() { return email; }
    public void setEmail(String email) { this.email = email; }

    public String getPhone() { return phone; }
    public void setPhone(String phone) { this.phone = phone; }

    public String getRegistration() { return registration; }
    public void setRegistration(String registration) { this.registration = registration; }

    public String getTitle() { return title; }
    public void setTitle(String title) { this.title = title; }

    public String getDepartmentName() { return departmentName; }
    public void setDepartmentName(String departmentName) { this.departmentName = departmentName; }

    public String getSpecialityName() { return specialityName; }
    public void setSpecialityName(String specialityName) { this.specialityName = specialityName; }
}
