package com.clinica.dto;

import com.clinica.model.enums.BloodType;
import java.io.Serializable;
import java.time.LocalDate;

public class PatientDTO implements Serializable {
    private Long id;
    private String name;
    private String email;
    private String cin;
    private LocalDate birthDate;
    private String sex;
    private String phone;
    private String address;
    private boolean isActive;
    private BloodType blood;

    public PatientDTO() {}

    // Getters & Setters
    public Long getId() { return id; }
    public void setId(Long id) { this.id = id; }

    public String getName() { return name; }
    public void setName(String name) { this.name = name; }

    public String getEmail() { return email; }
    public void setEmail(String email) { this.email = email; }

    public String getCin() { return cin; }
    public void setCin(String cin) { this.cin = cin; }

    public LocalDate getBirthDate() { return birthDate; }
    public void setBirthDate(LocalDate birthDate) { this.birthDate = birthDate; }

    public String getSex() { return sex; }
    public void setSex(String sex) { this.sex = sex; }

    public String getPhone() { return phone; }
    public void setPhone(String phone) { this.phone = phone; }

    public String getAddress() { return address; }
    public void setAddress(String address) { this.address = address; }

    public BloodType getBlood() { return blood; }
    public void setBlood(BloodType blood) { this.blood = blood; }

    public boolean isActive() {
        return isActive;
    }

    public void setActive(boolean active) {
        isActive = active;
    }
}
